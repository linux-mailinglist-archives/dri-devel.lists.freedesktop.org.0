Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EE3A7D065E
	for <lists+dri-devel@lfdr.de>; Fri, 20 Oct 2023 04:01:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBBF810E56D;
	Fri, 20 Oct 2023 02:01:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37C0A10E56D;
 Fri, 20 Oct 2023 02:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1697767259;
 bh=/TsfK7RL74sk75OV2jmi56NKjcO1swhvmxD4w4D8y+I=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=G+8KXIPpPsjw8JxMM+E8n1khnzrz3YsbQVAtoKfayMDwyc/dXl0de9IJNx4K6I4vm
 LhYzFsvhx5ga2RxHmhxmL/K80Gp93JCtIqYXHLSCiI8hp5o+4i5gK6xOA6CzbQNJKk
 SbHSji62lNKYgeDjWg/Vgu3lH8RTxb9cK/ppQ08Coe+S5gq90KfNFCWvlsK3KM61ls
 UmsaM+TdG0Rb+wTDC6Fn2YiEGdFHYUs1+32sjqDCW7OtfXOgio7XajNAoPwLKzY8x0
 4V7E4NGvZ4yMPabqXVZW/xs5NlxTj8y+RhcbSlOjEnElwk7SFBCHZ7yHHRfyB+xA5h
 jBDg5ku7BJ8vA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4SBSVL0dFtz4xNs;
 Fri, 20 Oct 2023 13:00:57 +1100 (AEDT)
Date: Fri, 20 Oct 2023 13:00:54 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@redhat.com>
Subject: Re: linux-next: build failure after merge of the drm-misc tree
Message-ID: <20231020130054.7bf18733@canb.auug.org.au>
In-Reply-To: <20231012122749.45d37e52@canb.auug.org.au>
References: <20231012122209.6f2768df@canb.auug.org.au>
 <20231012122749.45d37e52@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/bRfMJxeDf2dcjzBUlx0s4+b";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 RD Babiera <rdbabiera@google.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/bRfMJxeDf2dcjzBUlx0s4+b
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 12 Oct 2023 12:27:49 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> On Thu, 12 Oct 2023 12:22:09 +1100 Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
> >
> > After merging the drm-misc tree, today's linux-next build (x86_64
> > allmodconfig) failed like this:
> >=20
> > drivers/usb/typec/altmodes/displayport.c: In function 'dp_altmode_vdm':
> > drivers/usb/typec/altmodes/displayport.c:309:33: error: too few argumen=
ts to function 'drm_connector_oob_hotplug_event'
> >   309 |                                 drm_connector_oob_hotplug_event=
(dp->connector_fwnode);
> >       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > In file included from drivers/usb/typec/altmodes/displayport.c:17:
> > include/drm/drm_connector.h:1984:6: note: declared here
> >  1984 | void drm_connector_oob_hotplug_event(struct fwnode_handle *conn=
ector_fwnode,
> >       |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >=20
> > Caused by commit
> >=20
> >   fc93835bb0d7 ("drm: Add HPD state to drm_connector_oob_hotplug_event(=
)")
> >=20
> > interacting with commit
> >=20
> >   89434b069e46 ("usb: typec: altmodes/displayport: Signal hpd low when =
exiting mode")
> >=20
> > from the usb.current tree.
> >=20
> > I have applied the following merge fix patch.
> >=20
> > From: Stephen Rothwell <sfr@canb.auug.org.au>
> > Date: Thu, 12 Oct 2023 12:17:31 +1100
> > Subject: [PATCH] fix up for "drm: Add HPD state to
> >  drm_connector_oob_hotplug_event()"
> >=20
> > interacting with commit
> >=20
> >   89434b069e46 ("usb: typec: altmodes/displayport: Signal hpd low when =
exiting mode")
> >=20
> > Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > ---
> >  drivers/usb/typec/altmodes/displayport.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/usb/typec/altmodes/displayport.c b/drivers/usb/typ=
ec/altmodes/displayport.c
> > index ddfb5b6ace4f..eb0bf08fc97a 100644
> > --- a/drivers/usb/typec/altmodes/displayport.c
> > +++ b/drivers/usb/typec/altmodes/displayport.c
> > @@ -306,7 +306,8 @@ static int dp_altmode_vdm(struct typec_altmode *alt,
> >  			dp->data.status =3D 0;
> >  			dp->data.conf =3D 0;
> >  			if (dp->hpd) {
> > -				drm_connector_oob_hotplug_event(dp->connector_fwnode);
> > +				drm_connector_oob_hotplug_event(dp->connector_fwnode =20
>=20
> Pretend that there is a comma at the end of the above line :-)
>=20
> > +								connector_status_disconnected);
> >  				dp->hpd =3D false;
> >  				sysfs_notify(&dp->alt->dev.kobj, "displayport", "hpd");
> >  			}
> > --=20
> > 2.40.1 =20

This is now a conflict between the drm tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/bRfMJxeDf2dcjzBUlx0s4+b
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmUx31YACgkQAVBC80lX
0GxSOggAg+4c30k8rAnR/50mOECdA81/fTegm0fV4grZhCiNXhWNfpQkc0ekA0S/
4FgPGCElIiWU5Kx45UefkHEnc+gPehIVstcj5jW3Bbb4kHJe3x75KHaYI08Gztq6
0bv/DrwvKz7jZotrOStwG+sVaHkNfL7xt2cNv2Kk3V01g+lQrUSdGNNlAJvLlHRH
ape0t+80oHbLiW0d5zq0uDfzhVKjzBqSYftu1dxqL38aX6X1ysH6A5zgqX41H6su
QcFyxXLvOup6RuCRxMnA/OXhbMn3I/iBhjiWMvI2r0SIhHCLsFPUk3etJUQ9v0m/
PZU7+IfwYmUnZfpHrz/rHFEKK0GlCA==
=I9HV
-----END PGP SIGNATURE-----

--Sig_/bRfMJxeDf2dcjzBUlx0s4+b--
