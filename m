Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BFFFBA3F29
	for <lists+dri-devel@lfdr.de>; Fri, 26 Sep 2025 15:51:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8728510EA64;
	Fri, 26 Sep 2025 13:51:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=sebastianwick.net header.i=@sebastianwick.net header.b="SS+1BtJ9";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="aU9b7nMx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 353 seconds by postgrey-1.36 at gabe;
 Fri, 26 Sep 2025 13:51:07 UTC
Received: from flow-b6-smtp.messagingengine.com
 (flow-b6-smtp.messagingengine.com [202.12.124.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17A7D10EA63;
 Fri, 26 Sep 2025 13:51:07 +0000 (UTC)
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
 by mailflow.stl.internal (Postfix) with ESMTP id E1B5C13000FA;
 Fri, 26 Sep 2025 09:45:12 -0400 (EDT)
Received: from phl-imap-09 ([10.202.2.99])
 by phl-compute-01.internal (MEProxy); Fri, 26 Sep 2025 09:45:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 sebastianwick.net; h=cc:cc:content-type:content-type:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm2; t=1758894312;
 x=1758901512; bh=OxzO09osyc4RVOIO4usjiV1y/cGu9tLkexmJY1jPC14=; b=
 SS+1BtJ988iX2RBLjC6F9D8jYJUW/O0Lxm718QWfSHSXqzY+g5U8fj0C2SgoGsqK
 KJ/TO3Z9UlV3rRmONM/kcYYuBHoBlhwOf7/E1cKXuxnpOy5KiNJbr3b9enr7/uum
 umE6tgRBOtT2uICUcsnKTHsrskViuVSgEpY1qeTCHHnO8L/ynAInXvH/dXh/eBJy
 o1/pCSVJN+c9ELlq0z7s2t4is2ka1Dr5uo83M3/btb0zEuZA1Z8zWXcYVipO8mId
 PIUiq2G8W2bLg9q1SFeUL5LnopcI7LMb80MSETl02KLrGJBTDhYWO3fO30E6fjjJ
 j1qKL0ohUvKEGiCAVQLjyg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:subject:subject:to
 :to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
 1758894312; x=1758901512; bh=OxzO09osyc4RVOIO4usjiV1y/cGu9tLkexm
 JY1jPC14=; b=aU9b7nMx26OnG6iDpZ4ogUDHxXmvydDoR28INGtcpyivYwE4yH8
 8YCvp2gs8bXnCyO+zF9wMT1bsWVXWqhgewzmJ8H1DbYZtS6HzMsSV5ENJuIX1jcq
 LhrhMyvsX3jwxP8hwF2hJW0cKwseJp55s5tNlw+9vQOi8I7fZ+quykxvlCojH6Fi
 wSaNIt/8Zh2fhqEaBkLzWv/95yd5kopQFjrdIv9ea4CY7gP8EQDfbaxdlElNmh+5
 OwnIq7we91Qn7ExYzx5Au7oqyUpxx0dnABWQElItj2t5fMc6UPZ1hTXGCEmc075f
 xZV+R9tDZlIRCT9h+HXADD19eMxzEBCWHaQ==
X-ME-Sender: <xms:55jWaLbX6yC-hE6yzMz45f7owHNAOyFSPHb6sope_CsG44sTHYmY3A>
 <xme:55jWaFMwj3NV2EmVxpC9lkX208Kh89xuUkf78TsGS15pUqjqFmr0vLe2RGYGLZ7z3
 zryURzFTGFcfohezPI91I2zlNhu3xT7IrtJMoRXO19aMeRyeYchODs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdeileehvdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
 ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
 hrpefoggffhffvvefkjghfufgtsegrtderreertdejnecuhfhrohhmpedfufgvsggrshht
 ihgrnhcuhghitghkfdcuoehsvggsrghsthhirghnsehsvggsrghsthhirghnfihitghkrd
 hnvghtqeenucggtffrrghtthgvrhhnpedujeetjefgfedvheefheejgfevueffvefhhfet
 tefgvddtveeludehhefgjeehgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
 epmhgrihhlfhhrohhmpehsvggsrghsthhirghnsehsvggsrghsthhirghnfihitghkrdhn
 vghtpdhnsggprhgtphhtthhopeeggedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoh
 eprghlvgigrdhhuhhnghesrghmugdrtghomhdprhgtphhtthhopehhrghrrhihrdifvghn
 thhlrghnugesrghmugdrtghomhdprhgtphhtthhopehlvghordhlihhusegrmhgurdgtoh
 hmpdhrtghpthhtohepshhhrghshhgrnhhkrdhshhgrrhhmrgesrghmugdrtghomhdprhgt
 phhtthhopehlihhvihhurdguuhgurghusegrrhhmrdgtohhmpdhrtghpthhtoheplhhouh
 hishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomhdprhgtphhtthhopegrnhhgvghl
 ohhgihhorggttghhihhnohdruggvlhhrvghgnhhosegtohhllhgrsghorhgrrdgtohhmpd
 hrtghpthhtohepuggrnhhivghlshestgholhhlrggsohhrrgdrtghomhdprhgtphhtthho
 pehkvghrnhgvlhestgholhhlrggsohhrrgdrtghomh
X-ME-Proxy: <xmx:55jWaCiJPB9gkdiS2y6EPTPvyj830jzGKNxEzsXyo1HHY29ABZjhXg>
 <xmx:55jWaCC3aVEtmWppPnmN_fs8e4AVr_Al9B6x7jkuYmQlIDDGmIcVYQ>
 <xmx:55jWaCVQsGW2wfSo-ItMq8FEeC5pF7yGz8KIUtL-2CnJFzL5VWHBXQ>
 <xmx:55jWaHpzodHKzcuFyNjKKhCUvkOmmMyGdnkRzonOqrdHXGzD4fHxpw>
 <xmx:6JjWaHMumLKWU2mscWy53GzyL2cmmg2JZ8NtRDNS4tb8qgbI9ZVS8kx3>
Feedback-ID: i460949e8:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
 id EF0953020073; Fri, 26 Sep 2025 09:45:10 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AC10qL-M5Mko
Date: Fri, 26 Sep 2025 15:44:50 +0200
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
Message-Id: <2a985767-0fe1-40fc-b45e-921bbf201e07@app.fastmail.com>
In-Reply-To: <CAPj87rMhsFy+uzKmNecrQG4e+BEoeX1FyEobO7bnHdQqhy1_2Q@mail.gmail.com>
References: <20250822-mtk-post-blend-color-pipeline-v1-0-a9446d4aca82@collabora.com>
 <20250822-mtk-post-blend-color-pipeline-v1-1-a9446d4aca82@collabora.com>
 <CAPj87rPAoD2D99zTdsvJ=9K8+G17mTS2jDYHMPYmXNtUyp2L_Q@mail.gmail.com>
 <CAFZQkGwotQ6cxVCSgp-BhUi5DaZ7MyVvbnrDJW11Z7ztzqy58g@mail.gmail.com>
 <CAPj87rMTOD3_tC70QX4xz3G4zdG=tmwt5VgPhq6jNyf8bbW49Q@mail.gmail.com>
 <269ca85a59f613568543f45867fba7e604cc9f11.camel@collabora.com>
 <CAPj87rMhsFy+uzKmNecrQG4e+BEoeX1FyEobO7bnHdQqhy1_2Q@mail.gmail.com>
Subject: Re: [PATCH RFC 1/5] drm: Support post-blend color pipeline API
Content-Type: multipart/alternative; boundary=a4fee17de8e748f789dda1fe44bd7687
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

--a4fee17de8e748f789dda1fe44bd7687
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



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

>=20
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

--a4fee17de8e748f789dda1fe44bd7687
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html><html><head><title></title></head><body><div><br></div><d=
iv><br></div><div>On Mon, Sep 15, 2025, at 2:31 PM, Daniel Stone wrote:<=
/div><blockquote type=3D"cite" id=3D"qt" style=3D""><div>Hi N=C3=ADcolas=
,</div><div><br></div><div>On Wed, 3 Sept 2025 at 19:43, N=C3=ADcolas F.=
 R. A. Prado</div><div>&lt;<a href=3D"mailto:nfraprado@collabora.com">nf=
raprado@collabora.com</a>&gt; wrote:</div><div>&gt; On Tue, 2025-08-26 a=
t 13:25 +0100, Daniel Stone wrote:</div><div>&gt; Based on this discussi=
on, this is my understanding for the changes</div><div>&gt; desired on t=
he series and their reasonings:</div><div>&gt;</div><div>&gt; 1. Add a d=
river cap, DRM_CAP_POST_BLEND_COLOR_PIPELINE, which drivers</div><div>&g=
t; will use to signal they support post-blend color pipelines.</div><div=
>&gt;&nbsp;&nbsp; - Reason: Allow userspace to figure out that the drive=
r doesn't</div><div>&gt; support post-blend color pipelines and choose t=
o not set the client</div><div>&gt; cap, DRM_CLIENT_CAP_POST_BLEND_COLOR=
_PIPELINE, so it can use legacy</div><div>&gt; color management instead.=
</div><div>&gt; 2. Make it so setting the client cap,</div><div>&gt; DRM=
_CLIENT_CAP_POST_BLEND_COLOR_PIPELINE, fails if the driver cap,</div><di=
v>&gt; DRM_CAP_POST_BLEND_COLOR_PIPELINE, isn't set</div><div>&gt;&nbsp;=
&nbsp; - Reason: Prevent userspace from making color management unusable=
 if</div><div>&gt; the driver doesn't support post-blend color pipelines=
, as the legacy</div><div>&gt; color-management properties (GAMMA_LUT, D=
EGAMMA_LUT, CTM) would be</div><div>&gt; unwriteable with the client cap=
 set.</div><div><br></div><div>Definitely.</div><div><br></div><div>&gt;=
 3. Make legacy color-management properties (GAMMA_LUT, DEGAMMA_LUT,</di=
v><div>&gt; CTM) read-only if the client cap,</div><div>&gt; DRM_CLIENT_=
CAP_POST_BLEND_COLOR_PIPELINE, is set</div><div>&gt;&nbsp;&nbsp; - Reaso=
n: Allow drm_info to print legacy color management</div><div>&gt; config=
uration while still enabling post-blend color pipelines through</div><di=
v>&gt; the client cap. Also to allow smooth handover from pre-colorop</d=
iv><div>&gt; userspace client to colorop-ready userspace client, as the =
latter can</div><div>&gt; now replicate the legacy color configuration t=
hrough the colorops.</div><div><br></div><div>I think yes, but I don't r=
eally feel strongly about this. If others</div><div>involved have strong=
er opinions, I'm happy to yield.</div></blockquote><div><br></div><div><=
div>So I'm going to argue that making the properties read-only or read-w=
rite is useless.</div><div><br></div><div>The only case where knowing th=
e color pipeline of the previous user would be useful is if you want to =
re-use the framebuffer of said user. Otherwise, the color pipeline and t=
he generated framebuffer have to somehow just match to produce the desir=
ed output and that does not require any previous state, making the legac=
y properties useless.</div><div><br></div><div>If we genuinely believe t=
hat this is something to be supported, then my question is why the new c=
olor pipeline should not be able to accurate reflect the state of the pr=
evious user, even if they used the legacy props?</div><div><br></div><di=
v>The hardware was able to get into some state based on the legacy props=
, so it will be able to get into the same state with the color pipeline =
props; it's "just" a matter of exposing the right pipeline.</div><div><b=
r></div><div>If we are not able to accurate reflect the previous state w=
ith the pipeline props, then use space will see inconsistent state betwe=
en the legacy and color pipeline props. Which state is the right one? We=
 cannot know. The previous user could have used either one. So having th=
e legacy props does not help because we don't know if we should use them=
 or the pipeline state.</div><div><br></div><div>So, I would argue that =
we should *remove* the legacy props if&nbsp;DRM_CLIENT_CAP_POST_BLEND_CO=
LOR_PIPELINE is set. If the handover is relevant for a driver, they shou=
ld ensure the legacy props state translates to the correct color pipelin=
e state.&nbsp;</div><div><br></div></div><blockquote type=3D"cite" id=3D=
"qt" style=3D""><div><br></div><div>&gt; Side note: Smooth handover back=
 to pre-colorop userspace after tweaking</div><div>&gt; the colorops to =
something else would not be possible without making the</div><div>&gt; l=
egacy properties writable too, so that the client could update them to</=
div><div>&gt; match the colorops setting before switching back. I don't =
imagine this</div><div>&gt; would be a common use case, and colorops are=
 a superset of the legacy</div><div>&gt; properties so there are cases w=
here it wouldn't even be possible to</div><div>&gt; replicate the coloro=
p setting on the legacy properties, but thought I'd</div><div>&gt; menti=
on this limitation for completeness' sake.</div><div><br></div><div>That=
's a totally acceptable tradeoff. We don't have a standard</div><div>int=
er-client capability handshake, so if downgrading from a</div><div>newer=
/more-capable to an older/less-capable client is a bit janky,</div><div>=
that's OK. There's only so much we can do given the original design</div=
><div>decision for the KMS core to not be opinionated about a 'golden st=
ate'</div><div>that could be used as a reference for userspace to work f=
rom as a</div><div>base.<br></div><div><br></div><div>&gt; Also, as Xave=
r noted, this feedback also applies to pre-blend pipelines</div><div>&gt=
; and its legacy color-management properties (COLOR_ENCODING,</div><div>=
&gt; COLOR_RANGE), so the same changes would be desirable there for the =
same</div><div>&gt; reasons. So we should share this feedback on that se=
ries as well.</div><div><br></div><div>Yep.</div><div><br></div><div>Che=
ers,</div><div>Daniel</div><div><br></div></blockquote><div><br></div></=
body></html>
--a4fee17de8e748f789dda1fe44bd7687--
