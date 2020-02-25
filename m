Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CCFBD16BAD3
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2020 08:38:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D09F36E9F5;
	Tue, 25 Feb 2020 07:38:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EFA46E9F5
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2020 07:38:52 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 29611AD7B;
 Tue, 25 Feb 2020 07:38:51 +0000 (UTC)
Subject: Re: [PATCH RFC v3 2/6] drm/sprd: add Unisoc's drm kms master
To: tang pengchuan <kevin3.tang@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
References: <1582271336-3708-1-git-send-email-kevin3.tang@gmail.com>
 <1582271336-3708-3-git-send-email-kevin3.tang@gmail.com>
 <20200221213652.GD3456@ravnborg.org>
 <CAFPSGXacMKTPrxk_FOrwrvH_XfmO3dYCCa_GoPCe_HUfQFPHtw@mail.gmail.com>
 <20200222212713.GA30872@ravnborg.org>
 <CAFPSGXZWC7dASrVP3MTWS+oJjcwQEK0T+BLiwZ-cxk2OyeNZQw@mail.gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Autocrypt: addr=tzimmermann@suse.de; keydata=
 mQENBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAG0J1Rob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPokBVAQTAQgAPhYh
 BHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJbOdLgAhsDBQkDwmcABQsJCAcCBhUKCQgLAgQWAgMB
 Ah4BAheAAAoJEGgNwR1TC3ojR80H/jH+vYavwQ+TvO8ksXL9JQWc3IFSiGpuSVXLCdg62AmR
 irxW+qCwNncNQyb9rd30gzdectSkPWL3KSqEResBe24IbA5/jSkPweJasgXtfhuyoeCJ6PXo
 clQQGKIoFIAEv1s8l0ggPZswvCinegl1diyJXUXmdEJRTWYAtxn/atut1o6Giv6D2qmYbXN7
 mneMC5MzlLaJKUtoH7U/IjVw1sx2qtxAZGKVm4RZxPnMCp9E1MAr5t4dP5gJCIiqsdrVqI6i
 KupZstMxstPU//azmz7ZWWxT0JzgJqZSvPYx/SATeexTYBP47YFyri4jnsty2ErS91E6H8os
 Bv6pnSn7eAq5AQ0EWznS4AEIAMYmP4M/V+T5RY5at/g7rUdNsLhWv1APYrh9RQefODYHrNRH
 UE9eosYbT6XMryR9hT8XlGOYRwKWwiQBoWSDiTMo/Xi29jUnn4BXfI2px2DTXwc22LKtLAgT
 RjP+qbU63Y0xnQN29UGDbYgyyK51DW3H0If2a3JNsheAAK+Xc9baj0LGIc8T9uiEWHBnCH+R
 dhgATnWWGKdDegUR5BkDfDg5O/FISymJBHx2Dyoklv5g4BzkgqTqwmaYzsl8UxZKvbaxq0zb
 ehDda8lvhFXodNFMAgTLJlLuDYOGLK2AwbrS3Sp0AEbkpdJBb44qVlGm5bApZouHeJ/+n+7r
 12+lqdsAEQEAAYkBPAQYAQgAJhYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJbOdLgAhsMBQkD
 wmcAAAoJEGgNwR1TC3ojpfcIAInwP5OlcEKokTnHCiDTz4Ony4GnHRP2fXATQZCKxmu4AJY2
 h9ifw9Nf2TjCZ6AMvC3thAN0rFDj55N9l4s1CpaDo4J+0fkrHuyNacnT206CeJV1E7NYntxU
 n+LSiRrOdywn6erjxRi9EYTVLCHcDhBEjKmFZfg4AM4GZMWX1lg0+eHbd5oL1as28WvvI/uI
 aMyV8RbyXot1r/8QLlWldU3NrTF5p7TMU2y3ZH2mf5suSKHAMtbE4jKJ8ZHFOo3GhLgjVrBW
 HE9JXO08xKkgD+w6v83+nomsEuf6C6LYrqY/tsZvyEX6zN8CtirPdPWu/VXNRYAl/lat7lSI
 3H26qrE=
Message-ID: <3acf15ff-6a41-ca13-e219-301fcef983fa@suse.de>
Date: Tue, 25 Feb 2020 08:38:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAFPSGXZWC7dASrVP3MTWS+oJjcwQEK0T+BLiwZ-cxk2OyeNZQw@mail.gmail.com>
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
Cc: mark.rutland@arm.com, Baolin Wang <baolin.wang@linaro.org>,
 David Airlie <airlied@linux.ie>, Chunyan Zhang <zhang.lyra@gmail.com>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>, robh+dt@kernel.org,
 Orson Zhai <orsonzhai@gmail.com>
Content-Type: multipart/mixed; boundary="===============1170019043=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1170019043==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="QNt4NcLl3wKtObHjm3OlGfiLZqiXIcCI2"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--QNt4NcLl3wKtObHjm3OlGfiLZqiXIcCI2
Content-Type: multipart/mixed; boundary="FMsG9sLQC920eSt6ZJLnytyVsciYT0LhQ";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: tang pengchuan <kevin3.tang@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Cc: mark.rutland@arm.com, Baolin Wang <baolin.wang@linaro.org>,
 David Airlie <airlied@linux.ie>, Chunyan Zhang <zhang.lyra@gmail.com>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>, robh+dt@kernel.org,
 Orson Zhai <orsonzhai@gmail.com>
Message-ID: <3acf15ff-6a41-ca13-e219-301fcef983fa@suse.de>
Subject: Re: [PATCH RFC v3 2/6] drm/sprd: add Unisoc's drm kms master
References: <1582271336-3708-1-git-send-email-kevin3.tang@gmail.com>
 <1582271336-3708-3-git-send-email-kevin3.tang@gmail.com>
 <20200221213652.GD3456@ravnborg.org>
 <CAFPSGXacMKTPrxk_FOrwrvH_XfmO3dYCCa_GoPCe_HUfQFPHtw@mail.gmail.com>
 <20200222212713.GA30872@ravnborg.org>
 <CAFPSGXZWC7dASrVP3MTWS+oJjcwQEK0T+BLiwZ-cxk2OyeNZQw@mail.gmail.com>
In-Reply-To: <CAFPSGXZWC7dASrVP3MTWS+oJjcwQEK0T+BLiwZ-cxk2OyeNZQw@mail.gmail.com>

--FMsG9sLQC920eSt6ZJLnytyVsciYT0LhQ
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 23.02.20 um 05:26 schrieb tang pengchuan:
>=20
>=20
> On Sun, Feb 23, 2020 at 5:27 AM Sam Ravnborg <sam@ravnborg.org
> <mailto:sam@ravnborg.org>> wrote:
>=20
>     Hi Kevin/tang.
>=20
>     Thanks for the quick and detailed feedback.
>     Your questions are addressed below.
>=20
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 Sam
>=20
>=20
>     > > > +static int sprd_drm_bind(struct device *dev)
>     > > > +{
>     > > > +=C2=A0 =C2=A0 =C2=A0struct drm_device *drm;
>     > > > +=C2=A0 =C2=A0 =C2=A0struct sprd_drm *sprd;
>     > > > +=C2=A0 =C2=A0 =C2=A0int err;
>     > > > +
>     > > > +=C2=A0 =C2=A0 =C2=A0drm =3D drm_dev_alloc(&sprd_drm_drv, dev=
);
>     > > > +=C2=A0 =C2=A0 =C2=A0if (IS_ERR(drm))
>     > > > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return PTR_E=
RR(drm);
>     > > You should embed drm_device in struct sprd_drm.
>     > > See example code in drm/drm_drv.c
>     > >
>     > > This is what modern drm drivers do.
>     > >
>     > > I *think* you can drop the component framework if you do this.
>     > >
>     > I have read it(drm/drm_drv.c) carefully, if drop the component
>     framework,
>     > the whole our drm driver maybe need to redesign, so i still want
>     to keep
>     > current design.
>     OK, fine.
>=20
>     > > > +=C2=A0 =C2=A0 =C2=A0sprd_drm_mode_config_init(drm);
>     > > > +
>     > > > +=C2=A0 =C2=A0 =C2=A0/* bind and init sub drivers */
>     > > > +=C2=A0 =C2=A0 =C2=A0err =3D component_bind_all(drm->dev, drm=
);
>     > > > +=C2=A0 =C2=A0 =C2=A0if (err) {
>     > > > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_ERROR("f=
ailed to bind all component.\n");
>     > > > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto err_dc_=
cleanup;
>     > > > +=C2=A0 =C2=A0 =C2=A0}
>     > > When you have a drm_device - which you do here.
>     > > Then please use drm_err() and friends for error messages.
>     > > Please verify all uses of DRM_XXX
>     > >
>     >=C2=A0 =C2=A0modern drm drivers need drm_xxx to replace DRM_XXX?
>     Yes, use of DRM_XXX is deprecated - when you have a drm_device.
>=20
>     > >
>     > > > +=C2=A0 =C2=A0 =C2=A0/* with irq_enabled =3D true, we can use=
 the vblank
>     feature. */
>     > > > +=C2=A0 =C2=A0 =C2=A0drm->irq_enabled =3D true;
>     > > I cannot see any irq being installed. This looks wrong.
>     > >
>     > Our display controller isr is been register on crtc
>     driver(sprd_dpu.c), not
>     > here.
>=20
>     I think you just need to move this to next patch and then it is fin=
e.
>=20
> Here is the advice given by Thomas Zimmermann, similar to the advice yo=
u
> gave.
> I have given thomas feedback about my questions, maybe thomas didn't se=
e
> my email, so there is no reply.

I have been busy last week. Sorry for not getting back to you.

>=20
> But I've always been confused, because irq is initialized in drm driver=

> for other guys, why not for me?

Do you have an example?

Best regards
Thomas

> Can you help to tell the reason in detail, looking forward to your answ=
ers.
>=20
> Thomas's suggestion=EF=BC=9A
> -----------------------------------------------------------------------=
--------------------
>=20
> This line indicates the problem's design. The irq is initialized in the=

> sub-device code, but the device state is set here. Instead both should
> be set in the same place.
>=20
>> +
>> +=C2=A0 =C2=A0 =C2=A0/* reset all the states of crtc/plane/encoder/con=
nector */
>> +=C2=A0 =C2=A0 =C2=A0drm_mode_config_reset(drm);
>> +
>> +=C2=A0 =C2=A0 =C2=A0/* init kms poll for handling hpd */
>> +=C2=A0 =C2=A0 =C2=A0drm_kms_helper_poll_init(drm);
>=20
> Most of this function's code should be moved into the sub-device bind
> function.
>=20
> Here, maybe do:
>=20
> =C2=A0* allocate device structures
> =C2=A0* call component_bind_all()
> =C2=A0* on success, register device
>=20
> The sub-device function should then do
>=20
> =C2=A0* init modesetting, crtc, planes, etc.
> =C2=A0* do drm_mode_config_reset()
> =C2=A0* init vblanking
> =C2=A0* init the irq
> =C2=A0* do drm_kms_helper_poll_init()
>=20
> roughtly in that order. It makes sense to call drm_vblank_init() after
> drm_mode_config_reset(), as vblanking uses some of the mode-config fiel=
ds.=C2=A0
> -----------------------------------------------------------------------=
-------------------------------
>=20
>=20
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 Sam
>=20
>=20
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--FMsG9sLQC920eSt6ZJLnytyVsciYT0LhQ--

--QNt4NcLl3wKtObHjm3OlGfiLZqiXIcCI2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl5UzwcACgkQaA3BHVML
eiMf5wf8DivhAr6LFIIlZXxbo6hEtUbn4XxT+xFzFM4rPbYbJjCj9VC+CST8sq4P
HLLVDYxngnpIclwUF9UlprIBpXNCuZobb+koJXkKIBEP17+imX3n7oc8Tqq+yOyY
Wb45hWUwOtM4uAS4ULrIppnGPOye8GLCVJpc+XbrLSVlglI/OCkBrxGuwQ0VM/Ck
fe0/i7H0Eoq+/Jrll+abcxUF3fYrbeVG62PPIzfVh5d3hu0cElMPJwLngtYq7/0x
IRW5S5PcAP6XUTC2kpfZyCjc9++B3vIkYcy0Hpq4j7HaOkXTuEn24ipBNkR32s2U
g4HMCrbA4NKmiSrYloLnID3DGZYlhw==
=fwAf
-----END PGP SIGNATURE-----

--QNt4NcLl3wKtObHjm3OlGfiLZqiXIcCI2--

--===============1170019043==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1170019043==--
