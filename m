Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 95520664C0
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jul 2019 04:57:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E7AA6E2BA;
	Fri, 12 Jul 2019 02:57:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A53F6E2BA
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jul 2019 02:57:24 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id r6so5410038qkc.0
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jul 2019 19:57:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=gH7Y7cFOueYPN5yFqZDzD04ZIFx+RhIlsetMf9Nx5+o=;
 b=llW3BuZYz6R64N3or7rS0ufAC/kT8yKtqACxHzb5pfBACFTspNFCJjqT42EdHHWQ0q
 N6M+OIn6oRCRX0+s99rIkpXJl7BxzvDpEzgo4kI5c63ZEsubcY+wj5vIWmpW+MPOjtcc
 fPqm++POaAiC3YfKpW+ibu0I/X1QSrt7k0kMgrlZExR1JoTnJrkeYuk4VtjnxtSvhavs
 h2vgGCvr6a73Bi53cDV0/SsSx5o0Ley8L9yv1Php2ZKmjeultVyzDVpir0iPURNMGX9u
 /kNSGiE8vOfuLbwPd80cZMhLbvbaFyevGWcBv2WtaaN3gu6d2GutsNQCPOQ7ZRw8pLAL
 3PUQ==
X-Gm-Message-State: APjAAAUscjHtzlovLqhCFGcpTxubNueo76Po7cWADA1IZ6s/D+Zb+E3i
 jWAFzbvqsya4kmtlYAOep2o=
X-Google-Smtp-Source: APXvYqz/+y5OFrmlmUM9SCtY/18cDgPqvt7HcNp2++p29xMbLv4ZXLhsT3E4yCfyoTv+mQ4C+W9pjg==
X-Received: by 2002:a37:62ca:: with SMTP id w193mr4054040qkb.363.1562900243132; 
 Thu, 11 Jul 2019 19:57:23 -0700 (PDT)
Received: from smtp.gmail.com ([187.121.151.22])
 by smtp.gmail.com with ESMTPSA id c192sm3088511qkg.33.2019.07.11.19.57.19
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 11 Jul 2019 19:57:22 -0700 (PDT)
Date: Thu, 11 Jul 2019 23:57:18 -0300
From: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
To: Haneen Mohammed <hamohammed.sa@gmail.com>,
 David Airlie <airlied@linux.ie>, Simon Ser <contact@emersion.fr>,
 Oleg Vasilev <oleg.vasilev@intel.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V3] drm/vkms: Add support for vkms work without vblank
Message-ID: <20190712025718.wdlafaujpxhpupj7@smtp.gmail.com>
References: <20190710015514.42anrmx3r2ijaomz@smtp.gmail.com>
 <20190710164036.GZ15868@phenom.ffwll.local>
MIME-Version: 1.0
In-Reply-To: <20190710164036.GZ15868@phenom.ffwll.local>
User-Agent: NeoMutt/20180716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=gH7Y7cFOueYPN5yFqZDzD04ZIFx+RhIlsetMf9Nx5+o=;
 b=pO5GOjk07zU2XxvSfObP3pjHpabhX7+5aoX/iVrGHtS7u/yxLSXAKaycQvoBWCobfN
 8dZnD88hDnkaeT6BHjXNFiCOEW+CssQaEhSIBdJ5MMpuJitDMzEs6XbDv9G3ilIr/Lnv
 YU3CDKOKjVEqyC7uiDSk0CU0cxsocQfrwUaD2mDVNXxSOx4bcCei+dkjjhlzWMRwwNnz
 197548TBGl7ogwYMaZ8NgjJt/3/o+KtUO2QKTDNQCpXN6fq/l832QKUHbqo9d4STlO1g
 7x9bmgRPgKPVj9rXIjf2ez7ifaNiuzvmwjlcQDdczDIdfVDTrOBmY/awUbNk0SGyYOnK
 1J2w==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Content-Type: multipart/mixed; boundary="===============0907541410=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0907541410==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mwulvtdqb5ysendt"
Content-Disposition: inline


--mwulvtdqb5ysendt
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 07/10, Daniel Vetter wrote:
> On Tue, Jul 09, 2019 at 10:55:14PM -0300, Rodrigo Siqueira wrote:
> > Currently, vkms only work with enabled VBlank. This patch adds another
> > operation model that allows vkms to work without VBlank support. In this
> > scenario, vblank signaling is faked by calling drm_send_vblank_event()
> > in vkms_crtc_atomic_flush(); this approach works due to the
> > drm_vblank_get() =3D=3D 0 checking.
> >=20
> > Changes since V2:
> >  - Rebase
> >=20
> > Changes since V1:
> >   Daniel Vetter:
> >   - Change module parameter name from disablevblank to virtual_hw
> >   - Improve parameter description
> >   - Improve commit message
> >=20
> > Signed-off-by: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
> > ---
> >  drivers/gpu/drm/vkms/vkms_crtc.c | 10 ++++++++++
> >  drivers/gpu/drm/vkms/vkms_drv.c  | 13 +++++++++++--
> >  drivers/gpu/drm/vkms/vkms_drv.h  |  2 ++
> >  3 files changed, 23 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vk=
ms_crtc.c
> > index 49a8ec2cb1c1..a0c75b8c4335 100644
> > --- a/drivers/gpu/drm/vkms/vkms_crtc.c
> > +++ b/drivers/gpu/drm/vkms/vkms_crtc.c
> > @@ -207,12 +207,22 @@ static int vkms_crtc_atomic_check(struct drm_crtc=
 *crtc,
> >  static void vkms_crtc_atomic_enable(struct drm_crtc *crtc,
> >  				    struct drm_crtc_state *old_state)
> >  {
> > +	struct vkms_output *vkms_out =3D drm_crtc_to_vkms_output(crtc);
> > +
> > +	if (vkms_out->disable_vblank)
> > +		return;
> > +
> >  	drm_crtc_vblank_on(crtc);
> >  }
> > =20
> >  static void vkms_crtc_atomic_disable(struct drm_crtc *crtc,
> >  				     struct drm_crtc_state *old_state)
> >  {
> > +	struct vkms_output *vkms_out =3D drm_crtc_to_vkms_output(crtc);
> > +
> > +	if (vkms_out->disable_vblank)
> > +		return;
> > +
> >  	drm_crtc_vblank_off(crtc);
> >  }
> > =20
> > diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkm=
s_drv.c
> > index 152d7de24a76..542a002ef9d5 100644
> > --- a/drivers/gpu/drm/vkms/vkms_drv.c
> > +++ b/drivers/gpu/drm/vkms/vkms_drv.c
> > @@ -34,6 +34,11 @@ bool enable_writeback;
> >  module_param_named(enable_writeback, enable_writeback, bool, 0444);
> >  MODULE_PARM_DESC(enable_writeback, "Enable/Disable writeback connector=
");
> > =20
> > +bool virtual_hw;
>=20
> Can be static, you only use this in vkms_drv.c.
>=20
> > +module_param_named(virtual_hw, virtual_hw, bool, 0444);
> > +MODULE_PARM_DESC(virtual_hw,
> > +		 "Enable virtual hardware mode (disables vblanks and immediately com=
pletes flips)");
> > +
> >  static const struct file_operations vkms_driver_fops =3D {
> >  	.owner		=3D THIS_MODULE,
> >  	.open		=3D drm_open,
> > @@ -154,9 +159,13 @@ static int __init vkms_init(void)
> >  	if (ret)
> >  		goto out_unregister;
> > =20
> > -	vkms_device->drm.irq_enabled =3D true;
> > +	vkms_device->output.disable_vblank =3D virtual_hw;
> > +	vkms_device->drm.irq_enabled =3D !virtual_hw;
> > +
> > +	if (virtual_hw)
> > +		DRM_INFO("Virtual hardware mode enabled");
> > =20
> > -	ret =3D drm_vblank_init(&vkms_device->drm, 1);
> > +	ret =3D (virtual_hw) ? 0 : drm_vblank_init(&vkms_device->drm, 1);
> >  	if (ret) {
> >  		DRM_ERROR("Failed to vblank\n");
> >  		goto out_fini;
> > diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkm=
s_drv.h
> > index 9ff2cd4ebf81..256e5e65c947 100644
> > --- a/drivers/gpu/drm/vkms/vkms_drv.h
> > +++ b/drivers/gpu/drm/vkms/vkms_drv.h
> > @@ -21,6 +21,7 @@
> > =20
> >  extern bool enable_cursor;
> >  extern bool enable_writeback;
> > +extern bool virtual_hw;
> > =20
> >  struct vkms_composer {
> >  	struct drm_framebuffer fb;
> > @@ -69,6 +70,7 @@ struct vkms_output {
> >  	struct drm_connector connector;
> >  	struct drm_writeback_connector wb_connector;
> >  	struct hrtimer vblank_hrtimer;
> > +	bool disable_vblank;
> >  	ktime_t period_ns;
> >  	struct drm_pending_vblank_event *event;
> >  	/* ordered wq for composer_work */
>=20
> I'm kinda wondering how this works at all ... does writeback/crc still
> work if you set virtual mode? Writeback since this seems based on the
> writeback series ...

Hi,

I tested this patch with kms_flip with the "drm/drm_vblank: Change
EINVAL by the correct errno" patch [1]. However, you=E2=80=99re right about=
 the
writeback/crc tests, they does not pass because this patch disables
vblank which in turn does not invoke "vkms_vblank_simulate()".

In this sense, I=E2=80=99m a little bit confused about how should I handle =
this
issue. If I correctly understood, without vblank support we have to
trigger vkms_composer_worker() when the userspace invoke
drmModePageFlip(), am I right?  If so, an approach could add page_flip()
callback to vkms and invoke vkms_composer_worker(); however, the
documentation says that page_flip is a legacy entry point. Do you have a
suggestion?

1. https://patchwork.freedesktop.org/patch/314399/?series=3D50697&rev=3D7

Thanks
=20
> btw if you send out patches that need other patches, point at that other
> series in the cover letter or patch. Gets confusing fast otherwise.
> -Daniel
> --=20
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch

--=20
Rodrigo Siqueira
https://siqueira.tech

--mwulvtdqb5ysendt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE4tZ+ii1mjMCMQbfkWJzP/comvP8FAl0n9w0ACgkQWJzP/com
vP+zFw/+KnhGkI5jsmMuS9n46upkghxAEc26ucICUIZAApqkTP8E4HEKNAW/CbGq
FOyKX0KDlT6gMUmDy5fCbre4kwgVB2XHJWZQB3ODQ2LBtvDXXJC0Gl7aqgswtPf6
Ec4KQ4ki7Dy0ZpCu+YFn+thqJ+jmiYf2otv6tTmibpr/BkWPHoNQaIwerG+b6VT8
FL0X5Nu0+Ph1skcRbYL8K7kJID2umWD5f0msM01f/s8uculPbfI0iYZJMFOtuYlI
HBs3MBPC3xWkAcLg5ycFBobjGw2tcJMACh7QJU2RKdwX2bkaTIAbv425lSLr0B9b
QTOTAMlMG8+WVtn6n86UcUiYTMASZNHs8OzORKNs8KKG7ev6i/wJXHFkh/nRVtTf
REHpMczG2oCjBbMbk8bhyR9SvhQdGhJLzwmwfa0C1K/diukgZ4cpzgR1hKBGK1JH
/rpBwP/wQtfkA/kdP5E2jFi6Tc7cIBw7Bebbortb54Xcyj1tp8bQZCHUU99sEQRi
Qz3apmrfNPcjDheVRqnM/cVaGb0TGCMENLOQOauQgU1TQDAHdnt2WZyny6WGCq6s
9jQpV8Z8pnzXbFtrRuuhvIAmym3Q0z+wrbanJ4Qn/MKTev1Wqh7Xvk35wsqlr5xt
xJP4cOQfGzRFWniIzhAwAIMrn1lX5UBzsMD3wwSp6JMIqg4ucQE=
=xm8F
-----END PGP SIGNATURE-----

--mwulvtdqb5ysendt--

--===============0907541410==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0907541410==--
