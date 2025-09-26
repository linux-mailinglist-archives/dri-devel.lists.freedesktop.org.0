Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD2BCBA3F4A
	for <lists+dri-devel@lfdr.de>; Fri, 26 Sep 2025 15:52:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 381A710E098;
	Fri, 26 Sep 2025 13:52:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=sebastianwick.net header.i=@sebastianwick.net header.b="gZvzVX+v";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="KLQJJxIr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from flow-b5-smtp.messagingengine.com
 (flow-b5-smtp.messagingengine.com [202.12.124.140])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 596D210E098;
 Fri, 26 Sep 2025 13:52:21 +0000 (UTC)
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
 by mailflow.stl.internal (Postfix) with ESMTP id 921741300055;
 Fri, 26 Sep 2025 09:52:19 -0400 (EDT)
Received: from phl-imap-09 ([10.202.2.99])
 by phl-compute-01.internal (MEProxy); Fri, 26 Sep 2025 09:52:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 sebastianwick.net; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:subject
 :subject:to:to; s=fm2; t=1758894739; x=1758901939; bh=e/Miwyy5nX
 5tiT7Mz4fzifIfuWqRaBy8itcynQspnpE=; b=gZvzVX+vMtwY/Eh184vtzfOksT
 U0e7pUqZqA8iBvWDxl9s+GF+yVTOAPb43e7lq4gcr5Qs68M8QCAQYuOYHA53fysm
 jg3FOkFj033tYbiZ3mvm7c/spjJ7uAMGvjT++1hURVdsphlRTVMoWg3sp8XdsKWo
 lk91rjdD7+dZB2fh+hSyl/o4/dpVsrfFqH/ICVqwW8PMrGe96XjJtcozKjaP9OnE
 /T/cb07sTZ1nJabL0PqOkpa6ttGPKYUgLbxfCavCAI2x8WnN+Vj2OZTC6zY7O49E
 pzb1OWVAkkBQUjjYMluXL9Z8i/D5D5gQ8l92p9GA56VpL8I3NEO7DT6edURA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1758894739; x=
 1758901939; bh=e/Miwyy5nX5tiT7Mz4fzifIfuWqRaBy8itcynQspnpE=; b=K
 LQJJxIryFfwXUbUMVLG7mHaCl7f+PyLuuZbLMxvJkVsLQCI03s9qvdIkY90sB9bC
 4rJx8ZnSYRqF1W+/wNPKjUIra7beOBviriSV//wEiDv1mzHadNpHUzvC0y3WxVUL
 RYCKnkxjbOokLceQXLBCvjINZcVmQdFv2eWKAzcG1av8n6py0OfxTtd7L0ZTqmK9
 JPD+wyj6uiLfnir3idi71yDyIqYcR42387KKoBrFN6Pw7ymsULosAJwZFvtGfR9u
 4bRmdh5yH07HOsosels1Lr8PC0ez6tEkVD0f4KUScw9jpt0/01UuMNxQtfW12zCH
 x7/FbVu6cCKXwTFzhrupw==
X-ME-Sender: <xms:kZrWaBC-Z_teyeytGOi2qhBgUNr9tw5PJxq7XDWHdbD35RunVIe1rQ>
 <xme:kZrWaKUgPTIPUxLaccLLHUAOj2ReAF8Vex6huoPtAw77k8Xe0TUZnKXMCrvFPdOu8
 F0WNUGUUgsAlKclRY5wRvdsaqxmwcpZU4jm6voMDrJCw-UqdAmWuN0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdeileehgecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
 ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
 hrpefoggffhffvvefkjghfufgtgfesthhqredtredtjeenucfhrhhomhepfdfuvggsrghs
 thhirghnucghihgtkhdfuceoshgvsggrshhtihgrnhesshgvsggrshhtihgrnhifihgtkh
 drnhgvtheqnecuggftrfgrthhtvghrnhepveetfeetleevfeevtdelhffhuefgheekkeel
 hfehfeegvdfhfefhlefhieefledtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
 hmpehmrghilhhfrhhomhepshgvsggrshhtihgrnhesshgvsggrshhtihgrnhifihgtkhdr
 nhgvthdpnhgspghrtghpthhtohepgeegpdhmohguvgepshhmthhpohhuthdprhgtphhtth
 hopegrlhgvgidrhhhunhhgsegrmhgurdgtohhmpdhrtghpthhtohephhgrrhhrhidrfigv
 nhhtlhgrnhgusegrmhgurdgtohhmpdhrtghpthhtoheplhgvohdrlhhiuhesrghmugdrtg
 homhdprhgtphhtthhopehshhgrshhhrghnkhdrshhhrghrmhgrsegrmhgurdgtohhmpdhr
 tghpthhtoheplhhivhhiuhdrughuuggruhesrghrmhdrtghomhdprhgtphhtthhopehloh
 huihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmpdhrtghpthhtoheprghnghgv
 lhhoghhiohgrtggthhhinhhordguvghlrhgvghhnohestgholhhlrggsohhrrgdrtghomh
 dprhgtphhtthhopegurghnihgvlhhssegtohhllhgrsghorhgrrdgtohhmpdhrtghpthht
 ohepkhgvrhhnvghlsegtohhllhgrsghorhgrrdgtohhm
X-ME-Proxy: <xmx:kprWaMdLdGN2spLhtNCNS67Klt1G4DqUzXgUG5qHuc-bEV83ycKSlQ>
 <xmx:kprWaM0BvbL8ZDrn2YSg496OCpHA33bgktoge4OW1Bp3_Ic0O-21yw>
 <xmx:kprWaNKBzp0_vxj_swcEwac56RCEoo-XznFcZCRExAuwSYq6vvkj0A>
 <xmx:kprWaIJTsQOYCLALftDKAFNX28i3MG_FLV2281tt7ltk7KKeZhvr6A>
 <xmx:k5rWaKDq6aODF1168FNykMnX-9PLei9JflP268c1DX6UH65jH9pbJXS0>
Feedback-ID: i460949e8:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
 id D68CF3020073; Fri, 26 Sep 2025 09:52:17 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AC10qL-M5Mko
Date: Fri, 26 Sep 2025 15:51:57 +0200
From: "Sebastian Wick" <sebastian@sebastianwick.net>
To: "Daniel Stone" <daniel@fooishbar.org>,
 =?UTF-8?Q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Cc: "Xaver Hugl" <xaver.hugl@gmail.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>,
 "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>,
 "David Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 "Chun-Kuang Hu" <chunkuang.hu@kernel.org>,
 "Philipp Zabel" <p.zabel@pengutronix.de>,
 "Matthias Brugger" <matthias.bgg@gmail.com>,
 "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>,
 "Alex Hung" <alex.hung@amd.com>, wayland-devel@lists.freedesktop.org,
 harry.wentland@amd.com, leo.liu@amd.com, ville.syrjala@linux.intel.com,
 pekka.paalanen@collabora.com, mwen@igalia.com, jadahl@redhat.com,
 sebastian.wick@redhat.com, shashank.sharma@amd.com, agoins@nvidia.com,
 joshua@froggi.es, mdaenzer@redhat.com, aleixpol@kde.org,
 victoria@system76.com, uma.shankar@intel.com, quic_naseer@quicinc.com,
 quic_cbraga@quicinc.com, quic_abhinavk@quicinc.com, marcan@marcan.st,
 Liviu.Dudau@arm.com, sashamcintosh@google.com,
 chaitanya.kumar.borah@intel.com, louis.chauvet@bootlin.com,
 mcanal@igalia.com, kernel@collabora.com, daniels@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 "Simona Vetter" <simona.vetter@ffwll.ch>
Message-Id: <7a25beb8-6b81-4652-b509-b6410ae1dec1@app.fastmail.com>
In-Reply-To: <CAPj87rMhsFy+uzKmNecrQG4e+BEoeX1FyEobO7bnHdQqhy1_2Q@mail.gmail.com>
References: <20250822-mtk-post-blend-color-pipeline-v1-0-a9446d4aca82@collabora.com>
 <20250822-mtk-post-blend-color-pipeline-v1-1-a9446d4aca82@collabora.com>
 <CAPj87rPAoD2D99zTdsvJ=9K8+G17mTS2jDYHMPYmXNtUyp2L_Q@mail.gmail.com>
 <CAFZQkGwotQ6cxVCSgp-BhUi5DaZ7MyVvbnrDJW11Z7ztzqy58g@mail.gmail.com>
 <CAPj87rMTOD3_tC70QX4xz3G4zdG=tmwt5VgPhq6jNyf8bbW49Q@mail.gmail.com>
 <269ca85a59f613568543f45867fba7e604cc9f11.camel@collabora.com>
 <CAPj87rMhsFy+uzKmNecrQG4e+BEoeX1FyEobO7bnHdQqhy1_2Q@mail.gmail.com>
Subject: Re: [PATCH RFC 1/5] drm: Support post-blend color pipeline API
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

(Sorry for re-sending; used a web mail client which send html)

On Mon, Sep 15, 2025, at 2:31 PM, Daniel Stone wrote:
> Hi N=C3=ADcolas,
>=20
> On Wed, 3 Sept 2025 at 19:43, N=C3=ADcolas F. R. A. Prado
> <nfraprado@collabora.com> wrote:
> > On Tue, 2025-08-26 at 13:25 +0100, Daniel Stone wrote:
> > Based on this discussion, this is my understanding for the changes
> > desired on the series and their reasonings:
> >
> > 1. Add a driver cap, DRM_CAP_POST_BLEND_COLOR_PIPELINE, which drivers
> > will use to signal they support post-blend color pipelines.
> >   - Reason: Allow userspace to figure out that the driver doesn't
> > support post-blend color pipelines and choose to not set the client
> > cap, DRM_CLIENT_CAP_POST_BLEND_COLOR_PIPELINE, so it can use legacy
> > color management instead.
> > 2. Make it so setting the client cap,
> > DRM_CLIENT_CAP_POST_BLEND_COLOR_PIPELINE, fails if the driver cap,
> > DRM_CAP_POST_BLEND_COLOR_PIPELINE, isn't set
> >   - Reason: Prevent userspace from making color management unusable =
if
> > the driver doesn't support post-blend color pipelines, as the legacy
> > color-management properties (GAMMA_LUT, DEGAMMA_LUT, CTM) would be
> > unwriteable with the client cap set.
>=20
> Definitely.
>=20
> > 3. Make legacy color-management properties (GAMMA_LUT, DEGAMMA_LUT,
> > CTM) read-only if the client cap,
> > DRM_CLIENT_CAP_POST_BLEND_COLOR_PIPELINE, is set
> >   - Reason: Allow drm_info to print legacy color management
> > configuration while still enabling post-blend color pipelines through
> > the client cap. Also to allow smooth handover from pre-colorop
> > userspace client to colorop-ready userspace client, as the latter can
> > now replicate the legacy color configuration through the colorops.
>=20
> I think yes, but I don't really feel strongly about this. If others
> involved have stronger opinions, I'm happy to yield.

So I'm going to argue that making the properties read-only or read-write=
 is useless.

The only case where knowing the color pipeline of the previous user woul=
d be useful is if you want to re-use the framebuffer of said user. Other=
wise, the color pipeline and the generated framebuffer have to somehow j=
ust match to produce the desired output and that does not require any pr=
evious state, making the legacy properties useless.

If we genuinely believe that this is something to be supported, then my =
question is why the new color pipeline should not be able to accurate re=
flect the state of the previous user, even if they used the legacy props?

The hardware was able to get into some state based on the legacy props, =
so it will be able to get into the same state with the color pipeline pr=
ops; it's "just" a matter of exposing the right pipeline.

If we are not able to accurate reflect the previous state with the pipel=
ine props, then use space will see inconsistent state between the legacy=
 and color pipeline props. Which state is the right one? We cannot know.=
 The previous user could have used either one. So having the legacy prop=
s does not help because we don't know if we should use them or the pipel=
ine state.

So, I would argue that we should *remove* the legacy props if DRM_CLIENT=
_CAP_POST_BLEND_COLOR_PIPELINE is set. If the handover is relevant for a=
 driver, they should ensure the legacy props state translates to the cor=
rect color pipeline state.=20

> > Side note: Smooth handover back to pre-colorop userspace after tweak=
ing
> > the colorops to something else would not be possible without making =
the
> > legacy properties writable too, so that the client could update them=
 to
> > match the colorops setting before switching back. I don't imagine th=
is
> > would be a common use case, and colorops are a superset of the legacy
> > properties so there are cases where it wouldn't even be possible to
> > replicate the colorop setting on the legacy properties, but thought =
I'd
> > mention this limitation for completeness' sake.
>=20
> That's a totally acceptable tradeoff. We don't have a standard
> inter-client capability handshake, so if downgrading from a
> newer/more-capable to an older/less-capable client is a bit janky,
> that's OK. There's only so much we can do given the original design
> decision for the KMS core to not be opinionated about a 'golden state'
> that could be used as a reference for userspace to work from as a
> base.
>=20
> > Also, as Xaver noted, this feedback also applies to pre-blend pipeli=
nes
> > and its legacy color-management properties (COLOR_ENCODING,
> > COLOR_RANGE), so the same changes would be desirable there for the s=
ame
> > reasons. So we should share this feedback on that series as well.
>=20
> Yep.
>=20
> Cheers,
> Daniel
>=20
