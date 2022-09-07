Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E463B5AFAAC
	for <lists+dri-devel@lfdr.de>; Wed,  7 Sep 2022 05:33:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2940B10E0D1;
	Wed,  7 Sep 2022 03:33:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F27210E0C7;
 Wed,  7 Sep 2022 03:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662521616; x=1694057616;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=SfejAOY8Vh2jAUqBZ0f9V/aBunIXhhUCDsNMgGKnSt4=;
 b=ZkqWHOHQ8twSwK/Lp5Eiloib1aWA3cMd4v6EOVv8pPIaXBIt77w5IG/5
 b/gOSVM0myjuWjskiyhAXJnARlB9xIZW6YP6O64YEdHUSt9Pkj4ggcifd
 hH6zmsXY5LWIeZSe8nF51njH6gn7bTpraMsBMS19lC0kQ67d+ys2xYE7w
 igknLeUy59aWEq0DRdVKkivGePP3SWO3IuEt21MAt5PyN3CSKrIvBz6nK
 Ax0Ztpwa60Os4mp+rnm5SP1w9O5Esh/vqyl4DCfv2++Z9Eju+d5iY2Y/A
 CjeZ/NdjkYxxgbXEOGaiLCx9p0xkiE+mWlYTKfUQwsyX6RsUM/912524D A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10462"; a="295503968"
X-IronPort-AV: E=Sophos;i="5.93,295,1654585200"; 
 d="asc'?scan'208";a="295503968"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2022 20:33:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,295,1654585200"; 
 d="asc'?scan'208";a="591521197"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.159.108])
 by orsmga006.jf.intel.com with ESMTP; 06 Sep 2022 20:33:31 -0700
Date: Wed, 7 Sep 2022 11:07:54 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Zheng Hacker <hackerzheng666@gmail.com>
Subject: Re: [PATCH] drm/i915/gvt: fix double-free bug in split_2MB_gtt_entry.
Message-ID: <20220907030754.GU1089@zhen-hp.sh.intel.com>
References: <tencent_E1BBF05904DFB73C478DCD592740AAE0780A@qq.com>
 <CAJedcCxVW++iH49UFZp9ruUuTcNubWCH6Wsqe11K4COB3E8msg@mail.gmail.com>
 <CAJedcCw1eJqjSK+yR7eQMDheNtH3Mjm+viwt00xAhnmrfpq2pw@mail.gmail.com>
 <CAJedcCweHjD78F7iydiq6Xc2iH=t_3m=H9JKnaCooToUk32FvQ@mail.gmail.com>
 <YxWtfjfpNsoPUrgh@kroah.com>
 <CAJedcCzMo51aiy=Dv7zn7VmL3gwkw7JgzwAPAB2Z27C9CnhoYA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="kGQlNN4Ir6FkfZg7"
Content-Disposition: inline
In-Reply-To: <CAJedcCzMo51aiy=Dv7zn7VmL3gwkw7JgzwAPAB2Z27C9CnhoYA@mail.gmail.com>
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
Reply-To: Zhenyu Wang <zhenyuw@linux.intel.com>
Cc: tvrtko.ursulin@linux.intel.com, security@kernel.org, alex000young@gmail.com,
 airlied@linux.ie, Greg KH <gregkh@linuxfoundation.org>,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, xmzyshypnc <1002992920@qq.com>,
 rodrigo.vivi@intel.com, intel-gvt-dev@lists.freedesktop.org,
 zhi.a.wang@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--kGQlNN4Ir6FkfZg7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2022.09.06 19:36:56 +0800, Zheng Hacker wrote:
> Hi Greg,
>=20
> Alex has explained how we figured out the patch. We did analyze the
> code and found it possible to reach the vulnerability code. But we
> have no physical device in hand to test the driver. So we'd like to
> discuss with developers to see if the issue exists or not.
>=20
> Best regards,
> Zheng Wang.
>=20
> Greg KH <gregkh@linuxfoundation.org> ???2022???9???5????????? 16:04??????=
???
> >
> > On Mon, Sep 05, 2022 at 03:46:09PM +0800, Zheng Hacker wrote:
> > > I rewrote the letter. Hope it works.
> > >
> > > There is a double-free security bug in split_2MB_gtt_entry.
> > >
> > > Here is a calling chain :
> > > ppgtt_populate_spt->ppgtt_populate_shadow_entry->split_2MB_gtt_entry.
> > > If intel_gvt_dma_map_guest_page failed, it will call
> > > ppgtt_invalidate_spt, which will finally call ppgtt_free_spt and
> > > kfree(spt). But the caller does not notice that, and it will call
> > > ppgtt_free_spt again in error path.
> > >

It's a little mess in code so in theory it might be possible but
intel_gvt_dma_map_guest_page won't fail in practise...

> > > Fix this by returning the result of ppgtt_invalidate_spt to split_2MB=
_gtt_entry.
> > >

I don't see why changing ret value can fix this issue, as it doesn't change
any behavior e.g caller of ppgtt_populate_spt to handle possible different =
error return.

As current code looks assuming that ppgtt_invalidate_spt would free spt in =
good case,
I think the real cleanup should split that assumption and handle free in er=
ror case properly.

> > > Signed-off-by: Zheng Wang

This misses proper email address.

thanks

> > >
> > > ---
> > >  drivers/gpu/drm/i915/gvt/gtt.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/gpu/drm/i915/gvt/gtt.c b/drivers/gpu/drm/i915/gv=
t/gtt.c
> > > index ce0eb03709c3..9f14fded8c0c 100644
> > > --- a/drivers/gpu/drm/i915/gvt/gtt.c
> > > +++ b/drivers/gpu/drm/i915/gvt/gtt.c
> > > @@ -1215,7 +1215,7 @@ static int split_2MB_gtt_entry(struct intel_vgp=
u *vgpu,
> > >                 ret =3D intel_gvt_dma_map_guest_page(vgpu, start_gfn =
+ sub_index,
> > >                                                    PAGE_SIZE, &dma_ad=
dr);
> > >                 if (ret) {
> > > -                       ppgtt_invalidate_spt(spt);
> > > +                       ret =3D ppgtt_invalidate_spt(spt);
> > >                         return ret;
> >
> > But now you just lost the original error, shouldn't this succeed even if
> > intel_gvt_dma_map_guest_page() failed?
> >
> > And how are you causing intel_gvt_dma_map_guest_page() to fail in a real
> > system?
> >
> > thanks,
> >
> > greg k-h

--kGQlNN4Ir6FkfZg7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCYxgK9QAKCRCxBBozTXgY
J1DZAJsH9UU2cPdrsdx4hf7SuJorjWTN/gCeKxA/bnVUbWogMgtUPWYV8HOG9+8=
=3CHX
-----END PGP SIGNATURE-----

--kGQlNN4Ir6FkfZg7--
