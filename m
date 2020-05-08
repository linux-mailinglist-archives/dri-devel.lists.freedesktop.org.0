Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 802CD1CA797
	for <lists+dri-devel@lfdr.de>; Fri,  8 May 2020 11:54:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCA2C6E083;
	Fri,  8 May 2020 09:54:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC1BF6E083
 for <dri-devel@lists.freedesktop.org>; Fri,  8 May 2020 09:54:38 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id 44EE05800E1;
 Fri,  8 May 2020 05:54:36 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Fri, 08 May 2020 05:54:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=fNKb2E3cngycuSCYlu4bdd4ggu3
 a874dABTj/kMWUm0=; b=fZZ1hS1aaqVwquRtjcmtV1uwMAChocqg77h2wS5q+6S
 CTysKclNK/nv1Ft+POR8eY2bzp6wyx1jkI1pa4yKymYwQ3lSeVCpgKskekxOwW3V
 rYg6ASUEIRO3CZdc+xmfLgwrTD51JKxI5uH23frrKvJlMI5sctciSycR5co756gT
 O6RCa8jTgEK5lxWREhRAQSSQL0uZ5lS1ncnghdP+ak1Fn+mjn4+4WvUL36MB08U4
 AsInFYHnz+r1lMwf9MwqOJE/VSxkw42eaqNgThGWYleWyQBZKEXysu0D+zo4dpk9
 O9jsRiF2Fo6dYxpDxvSJkLnW6Zch17Pg1XQQh417vig==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=fNKb2E
 3cngycuSCYlu4bdd4ggu3a874dABTj/kMWUm0=; b=IVz5NEuAd8YNG9zOll2WGv
 LVMirSGHhkmKzHsqzIRU4vmwPY06iaA0ZVqkLHvTQQbSKqK+ZuXHLRLcpXm/x7Yc
 Eyu8tN5q0QQpK4I+Pjbfjx6PBYHceqm3zupvXr3RUF6DJaEMnRPRL2OSzF2bWU1e
 ghvZprSJtjEiZwczQ9eDWI5xn9nAfhKvHAj7SvYdg09cONqYpQRzqpKuM/nwUf2R
 UlHaPU7Fx2fp2DtesP6A4dQUUP27/EL7jaoMyJGB5vE8Snss5VdaEkAR4wsn5WzC
 z9PG2hV24VVGvxLatb9PHfAcKTNzbvECGCT1VyNiwIvi0zlU3JMMxB0PcVcet4EQ
 ==
X-ME-Sender: <xms:WSy1XrLHLwYoqFca-9ZQRaTAl21STgn4Ua-jN0OfQsPvzIuY8La8GQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrkedvgddvudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghgucfm
 jfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrfgrthhtvghrnhepveeuheejgf
 ffgfeivddukedvkedtleelleeghfeljeeiueeggeevueduudekvdetnecukfhppeekfedr
 keeirdekledruddtjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
 hlfhhrohhmpehgrhgvgheskhhrohgrhhdrtghomh
X-ME-Proxy: <xmx:WSy1XgYPNH_dMaQPBpqQmubb9WDDa-pGvtp-LCKIlOkFzIcGGeRd3g>
 <xmx:WSy1XsLN-X5N5GrqOAMoZsCT_Kyv_a9Q4Agj6vWQTu2Jjm-KmZ-A0g>
 <xmx:WSy1Xqn4gbyXrsM5-OrS4bduG-yU1xQirbm2fufqhAs885o1DsygKA>
 <xmx:XCy1Xs5hqa_PXM4aJN_lHF1bMY4ghUjSybFF6_cfF58xrxdxJBsokA>
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 by mail.messagingengine.com (Postfix) with ESMTPA id 85EC73280066;
 Fri,  8 May 2020 05:54:32 -0400 (EDT)
Date: Fri, 8 May 2020 11:54:26 +0200
From: Greg KH <greg@kroah.com>
To: Yves-Alexis Perez <corsac@debian.org>
Subject: Re: [PATCH] drm/atomic: Take the atomic toys away from X
Message-ID: <20200508095426.GA3778290@kroah.com>
References: <20190903190642.32588-1-daniel.vetter@ffwll.ch>
 <20190905185318.31363-1-daniel.vetter@ffwll.ch>
 <2a05f4c4362d386d298a06a67f2f528ef603a734.camel@debian.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2a05f4c4362d386d298a06a67f2f528ef603a734.camel@debian.org>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 08, 2020 at 11:06:56AM +0200, Yves-Alexis Perez wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA256
> 
> On Thu, 2019-09-05 at 20:53 +0200, Daniel Vetter wrote:
> > The -modesetting ddx has a totally broken idea of how atomic works:
> > - doesn't disable old connectors, assuming they get auto-disable like
> >   with the legacy setcrtc
> > - assumes ASYNC_FLIP is wired through for the atomic ioctl
> > - not a single call to TEST_ONLY
> > 
> > Iow the implementation is a 1:1 translation of legacy ioctls to
> > atomic, which is a) broken b) pointless.
> > 
> > We already have bugs in both i915 and amdgpu-DC where this prevents us
> > from enabling neat features.
> > 
> > If anyone ever cares about atomic in X we can easily add a new atomic
> > level (req->value == 2) for X to get back the shiny toys.
> > 
> > Since these broken versions of -modesetting have been shipping,
> > there's really no other way to get out of this bind.
> 
> Hi Daniel and Greg (especially). It seems that this patch was never applied to
> stable, maybe it fell through the cracks?

What patch is "this patch"?

> It doesn't apply as-is in 4.19 branch but a small change in the context makes
> it apply. I'm experiencing issues with lightdm and vt-switch in Debian Buster
> (which has a 4.19 kernel) so I'd appreciate if the patch was included in at
> least that release.

What is the git commit id of the patch in Linus's tree?  If you have a
working backport, that makes it much easier than hoping I can fix it
up...

thanks,

greg k-h
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
