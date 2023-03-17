Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 768256BEE29
	for <lists+dri-devel@lfdr.de>; Fri, 17 Mar 2023 17:27:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FC8910E3C6;
	Fri, 17 Mar 2023 16:27:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B00510E3C6
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Mar 2023 16:27:50 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 5806F320051E;
 Fri, 17 Mar 2023 12:27:46 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Fri, 17 Mar 2023 12:27:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to; s=fm3; t=
 1679070465; x=1679156865; bh=Fgk8RwfBJRsCFmPOXa4TQHtD/pOXenTW+Rn
 IJj6s9aY=; b=ICnGzTqGCwOjLapW/MFg3nO/kZyZW/ura5ohukeCBmVOqXyibDY
 K5wfIL/7HwhckOTjwTZaUQ7kHap5v4oVjxaOYjNocWjse9cUk0N/T6FEYMB2hcxz
 M+YPSB6hnDxus+Vy5G71q+k5WR3i7JNW2cFCtMhpPyW4Xnwrc28PBCaPcce0p5WV
 WLs054p4Fnu0GuKntK7hV9q43att3NrnArKhrwEMrH3UE771ePkwQcwSR204nvQ2
 lctNeuHf2rP6AjgLwBfnXA+di2Jb3GTCmm/qRrv+weFiSksDIitxS3TH4uIVHD2C
 oGKfkWCXthWke+ypsIqEvRoFZv5N8ve3Rcw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
 1679070465; x=1679156865; bh=Fgk8RwfBJRsCFmPOXa4TQHtD/pOXenTW+Rn
 IJj6s9aY=; b=KtMQkmE0G1iQFft1RGUSgahtwYYmGgFkdwkUERe1LerNgexsRmq
 Q2VfPA5KaqFXnuGkrC9ekmFdgEUBf/YAdtT6vupiOTw5YbWooIr3s6CI3lNuKj2h
 1x7ByHmBKaNi/X4KP2KLJP+emZY6InTBj/KZ96GTFm6rKlimeja3Poxrq8Yk/7Cg
 ftnv+LarM/l/taNGPhtSaTUWjm7qJ8EId6RUINNlnw7dssjJKf84ikPRBEsqObFp
 dUBLxr3V0sII4wPsINX1mu7hvnRi7FYdBIMieJnreWQ1x3OJPlQG/LO4b6Kmn6q2
 08/TK8yUlnDGp4DVQHc1Z6SvapXaZDxXhvQ==
X-ME-Sender: <xms:AZUUZFrYXDs5mzQUmr6wDT9rB9M7y_aWD3rmcWmsQjsbF39LtxVwmQ>
 <xme:AZUUZHoW13fcgAJOka3UIV5REkcct7bCraUosGKpfIZLXhVGPIScWKwf7Jqf6GqO-
 nd1O981l8c20MNQLCc>
X-ME-Received: <xmr:AZUUZCOGnsDQBKNVisiHZ7wpqa0nQDZDrxRxkwCS_rKmdcFflhcJOAOkzQW6ug2ZsResSPKQiXr5SpG2ClSwFSyFOX321yU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdefvddgkeekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggugfgjsehtqhertddttddvnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnheptefgleeggfegkeekgffgleduieduffejffegveevkeejudektdduueet
 feetfefgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:AZUUZA77Kbd0OA2TVYtPQdmetfgqZm0PqKhxLX0a61pWJwRgD3-zzg>
 <xmx:AZUUZE49moWRyfaQAXhieCcIRd2c0KGNe-TybpBGS-K1tkK1o6BXiA>
 <xmx:AZUUZIjKjh7ULFS2TYA4dae6zuvk33sxrOTSLt5KBUhVAK7cqNb8MQ>
 <xmx:AZUUZBy_YrhxCghq5qx3mE4H7C_5sXlleDtC5dHXKGFeujgoj7RzgA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 17 Mar 2023 12:27:45 -0400 (EDT)
Date: Fri, 17 Mar 2023 17:27:43 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 5/6] drm/fb-helper: Consolidate
 CONFIG_DRM_FBDEV_LEAK_PHYS_SMEM
Message-ID: <20230317162743.u5bbdp2nvqwy2kc7@houat>
References: <20230315161442.27318-1-tzimmermann@suse.de>
 <20230315161442.27318-6-tzimmermann@suse.de>
 <87pm97pn61.fsf@minerva.mail-host-address-is-not-set>
 <886052ee-69cd-8640-ea7f-c9e14f57651f@suse.de>
 <20230317151128.hwaaq4na7d7mifaw@houat>
 <4d1ca506-0145-9c39-fc82-fcab110b1168@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <4d1ca506-0145-9c39-fc82-fcab110b1168@suse.de>
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
Cc: kraxel@redhat.com, linux-graphics-maintainer@vmware.com,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 17, 2023 at 05:08:47PM +0100, Thomas Zimmermann wrote:
> Hi
>=20
> Am 17.03.23 um 16:11 schrieb Maxime Ripard:
> > On Fri, Mar 17, 2023 at 01:51:42PM +0100, Thomas Zimmermann wrote:
> > > Hi
> > >=20
> > > Am 17.03.23 um 13:39 schrieb Javier Martinez Canillas:
> > > > Thomas Zimmermann <tzimmermann@suse.de> writes:
> > > >=20
> > > > > Consolidate all handling of CONFIG_DRM_FBDEV_LEAK_PHYS_SMEM by
> > > > > making the module parameter optional in drm_fb_helper.c.
> > > > >=20
> > > > > Without the config option, modules can set smem_start in struct
> > > > > fb_info for internal usage, but not export if to userspace. The
> > > > > address can only be exported by enabling the option and setting
> > > > > the module parameter. Also update the comment.
> > > > >=20
> > > >=20
> > > > I was going to ask at what point we could just get rid of this Kcon=
fig
> > > > symbol since it already depends on EXPERT anyways so most distros w=
ill
> > > > not enable it.
> > > >=20
> > > > But I looked then and noticed that it was added just a few years ag=
o in
> > > > commit 4be9bd10e22d "(drm/fb_helper: Allow leaking fbdev smem_start=
"),
> > > > so it seems that people still need that :(
> > >=20
> > > I don't even know which userspace drivers need this symbol. Probably
> > > something on Android.
> >=20
> > At least the Mali (utgard) user-space stack uses it, including on
> > "regular" distributions.
>=20
> Does this use the lima kernel driver?

No, I meant the ARM proprietary blobs
