Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D8861CAA8B
	for <lists+dri-devel@lfdr.de>; Fri,  8 May 2020 14:24:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3F196E1F4;
	Fri,  8 May 2020 12:24:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AD016E1D8;
 Fri,  8 May 2020 12:24:25 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id 58CEC5800C7;
 Fri,  8 May 2020 08:24:21 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Fri, 08 May 2020 08:24:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:content-transfer-encoding:in-reply-to; s=fm3; bh=B
 lIPUWSMF61h4hKE0RpIdoM6DZF7DIUr3CtwDb11E7k=; b=bJBsN1zyTF5L2u4YQ
 wdiIrOWRm3rSGJnFBgh771GQtIwh09ZhPVNl4yIbKhVIqORlJgQ6fr4K9xTrYmrA
 mXWfKa8w5CjBu//+MNbXA90Ow1/obJsAqCNexzelZqNPL1GOGsg0DeSSKMLuRoZM
 0hvTaojp2/oTzmIXLnee3uknaeTlr63oXqjWo1OwTK2qd9oQ9adWFqAvmA2YieIH
 JneIRRx4h3efAXKe0ZaO1eTph7OVTM7wNdIGbTi0v+59+veiM4uOubqB4r9W9B3K
 dDhGikKJqp6o1kJL0jhAI1V0kT6wzB1MCoIEWNRMMFOKb8b4k0qu+jWnjVJYHEYD
 cJthA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=BlIPUWSMF61h4hKE0RpIdoM6DZF7DIUr3CtwDb11E
 7k=; b=M2G3UVLq/tw9h4fO/w2o38F6sW//kCALR03GMjnERs4d3EbdCY2gGVD/f
 Ur7wNlQ9VVBllvKvMpxCmILYSrqU/vAfurM2U4SlM6OJUfaCWEPyQsOEFvplNdEh
 Z04r3hfNva7Keam2EE+m1sDiJmQn+z8NxGJj7y+E8ImDEBRknoIH7VwsIIoDZ9SO
 onp8AZopRzitZMLPrA2ceKoCFX1GOFrpXsqLhpjfxUwOdz+midxdY5woUofIRizh
 PfHySEbyzfQoC/W6Wor3XFBUNMFKJK8YpfF58BpAHTjcqFtT2nfgxFIGDcRBd325
 jNCnBC86u0m4cMle16YHJUxGNX63A==
X-ME-Sender: <xms:c0-1XgW556_gW_S5U6XgbkT-uIDYMPXj0RSN-fEQHLFlbQH6TTginw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrkedvgdehudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggugfgjsehtkeertddttddunecuhfhrohhmpefirhgvghcu
 mffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpeefieffje
 fhhfeiueelueekfeehtedutdegteetleelteeggeetfeeffefhfeekvdenucffohhmrghi
 nhepfhhrvggvuggvshhkthhophdrohhrghenucfkphepkeefrdekiedrkeelrddutdejne
 cuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghhrvghg
 sehkrhhorghhrdgtohhm
X-ME-Proxy: <xmx:c0-1XljDuDi_flUmWAVKEqb3PUPQ-1cMpOJKDNkZMOGspK4cK_YPjQ>
 <xmx:c0-1XktC-WkWAbGZOdz5jCCifcToI9BTk-vDEughhzEmt0_62irmrA>
 <xmx:c0-1XtxlVuVguIULB0NS8wsw8GbH3E6g-pUeE9Hk4wVVlwZ1MYLPdw>
 <xmx:dU-1XrU-AP9aS6CuYghysPxkP99GqZvvjFmKSvwfYeTFJ87onY44vQ>
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 by mail.messagingengine.com (Postfix) with ESMTPA id D429D30661F4;
 Fri,  8 May 2020 08:24:18 -0400 (EDT)
Date: Fri, 8 May 2020 14:24:15 +0200
From: Greg KH <greg@kroah.com>
To: Yves-Alexis Perez <corsac@debian.org>
Subject: Re: [PATCH] drm/atomic: Take the atomic toys away from X
Message-ID: <20200508122415.GA27371@kroah.com>
References: <20190903190642.32588-1-daniel.vetter@ffwll.ch>
 <20190905185318.31363-1-daniel.vetter@ffwll.ch>
 <2a05f4c4362d386d298a06a67f2f528ef603a734.camel@debian.org>
 <20200508095426.GA3778290@kroah.com>
 <177a9ed3375957e40b295e20bb6b42663a784a74.camel@debian.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <177a9ed3375957e40b295e20bb6b42663a784a74.camel@debian.org>
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Michel =?iso-8859-1?Q?D=E4nzer?= <michel@daenzer.net>, stable@vger.kernel.org,
 Daniel Vetter <daniel.vetter@intel.com>, Sean Paul <sean@poorly.run>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 08, 2020 at 01:59:17PM +0200, Yves-Alexis Perez wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA256
> =

> On Fri, 2020-05-08 at 11:54 +0200, Greg KH wrote:
> > > Hi Daniel and Greg (especially). It seems that this patch was never
> > > applied to
> > > stable, maybe it fell through the cracks?
> > =

> > What patch is "this patch"?
> =

> Sorry, the patch was in the mail I was replying to:
> =

> commit 26b1d3b527e7bf3e24b814d617866ac5199ce68d
> Author: Daniel Vetter <daniel.vetter@ffwll.ch>
> Date:   Thu Sep 5 20:53:18 2019 +0200
> =

>     drm/atomic: Take the atomic toys away from X
> =

> > =

> > > It doesn't apply as-is in 4.19 branch but a small change in the conte=
xt
> > > makes
> > > it apply. I'm experiencing issues with lightdm and vt-switch in Debian
> > > Buster
> > > (which has a 4.19 kernel) so I'd appreciate if the patch was included=
 in
> > > at
> > > least that release.
> > =

> > What is the git commit id of the patch in Linus's tree?  If you have a
> > working backport, that makes it much easier than hoping I can fix it
> > up...
> =

> The commit id is in Linus tree is 26b1d3b527e7bf3e24b814d617866ac5199ce68=
d. To
> apply properly 69fdf4206a8ba91a277b3d50a3a05b71247635b2 would need to be
> cherry-picked as well but it wasn't marked for stable so I didn't bother =
and
> only fixed the context. Here's the backport to 4.19, compile and runtime
> tested. It does fix the issue for me (like it did on mainline).
> =

> So I guess
> Tested-By: Yves-Alexis Perez <corsac@debian.org>
> =

> commit 8a99914f7b539542622dc571c82d6cd203bddf64
> Author: Daniel Vetter <daniel.vetter@ffwll.ch>
> Date:   Thu Sep 5 20:53:18 2019 +0200
> =

>     drm/atomic: Take the atomic toys away from X
>     =

>     The -modesetting ddx has a totally broken idea of how atomic works:
>     - doesn't disable old connectors, assuming they get auto-disable like
>       with the legacy setcrtc
>     - assumes ASYNC_FLIP is wired through for the atomic ioctl
>     - not a single call to TEST_ONLY
>     =

>     Iow the implementation is a 1:1 translation of legacy ioctls to
>     atomic, which is a) broken b) pointless.
>     =

>     We already have bugs in both i915 and amdgpu-DC where this prevents us
>     from enabling neat features.
>     =

>     If anyone ever cares about atomic in X we can easily add a new atomic
>     level (req->value =3D=3D 2) for X to get back the shiny toys.
>     =

>     Since these broken versions of -modesetting have been shipping,
>     there's really no other way to get out of this bind.
>     =

>     v2:
>     - add an informational dmesg output (Rob, Ajax)
>     - reorder after the DRIVER_ATOMIC check to avoid useless noise (Ilia)
>     - allow req->value > 2 so that X can do another attempt at atomic in
>       the future
>     =

>     v3: Go with paranoid, insist that the X should be first (suggested by
>     Rob)
>     =

>     Cc: Ilia Mirkin <imirkin@alum.mit.edu>
>     References: https://gitlab.freedesktop.org/xorg/xserver/issues/629
>     References: https://gitlab.freedesktop.org/xorg/xserver/merge_request=
s/180
>     References: abbc0697d5fb ("drm/fb: revert the i915 Actually configure
> untiled displays from master")
>     Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>     Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com> (v=
1)
>     Reviewed-by: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com> (v1)
>     Cc: Michel D=E4nzer <michel@daenzer.net>
>     Cc: Alex Deucher <alexdeucher@gmail.com>
>     Cc: Adam Jackson <ajax@redhat.com>
>     Acked-by: Adam Jackson <ajax@redhat.com>
>     Cc: Sean Paul <sean@poorly.run>
>     Cc: David Airlie <airlied@linux.ie>
>     Cc: Rob Clark <robdclark@gmail.com>
>     Acked-by: Rob Clark <robdclark@gmail.com>
>     Cc: stable@vger.kernel.org
>     Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
>     Link: =

> https://patchwork.freedesktop.org/patch/msgid/20190905185318.31363-1-dani=
el.vetter@ffwll.ch
> =

> diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
> index ba129b64b61f..b92682f037b2 100644
> - --- a/drivers/gpu/drm/drm_ioctl.c
> +++ b/drivers/gpu/drm/drm_ioctl.c
> @@ -321,7 +321,12 @@ drm_setclientcap(struct drm_device *dev, void *data,
> struct drm_file *file_priv)
>  	case DRM_CLIENT_CAP_ATOMIC:
>  		if (!drm_core_check_feature(dev, DRIVER_ATOMIC))
>  			return -EINVAL;
> - -		if (req->value > 1)
> +		/* The modesetting DDX has a totally broken idea of atomic. */
> +		if (current->comm[0] =3D=3D 'X' && req->value =3D=3D 1) {
> +			pr_info("broken atomic modeset userspace detected,
> disabling atomic\n");
> +			return -EOPNOTSUPP;
> +		}
> +		if (req->value > 2)
>  			return -EINVAL;
>  		file_priv->atomic =3D req->value;
>  		file_priv->universal_planes =3D req->value;
> =


This is line-wrapped and can not be applied :(

Ugh, let me see if I can do this by hand...

greg k-h
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
