Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC4E31A1BEA
	for <lists+dri-devel@lfdr.de>; Wed,  8 Apr 2020 08:33:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A3466E954;
	Wed,  8 Apr 2020 06:33:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75B0A6E954;
 Wed,  8 Apr 2020 06:33:12 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 7305AABBE;
 Wed,  8 Apr 2020 06:33:10 +0000 (UTC)
Subject: Re: [PATCH 08/44] drm/vboxvideo: Stop using drm_device->dev_private
To: Daniel Vetter <daniel.vetter@ffwll.ch>
References: <20200403135828.2542770-1-daniel.vetter@ffwll.ch>
 <20200403135828.2542770-9-daniel.vetter@ffwll.ch>
 <0e60d88e-0429-049a-b4b2-5e3b6b660bbc@suse.de>
 <CAKMK7uEwKWAxiPwZKVQBN22S6D=_4FhfmyNGCnU9uftK+--V2A@mail.gmail.com>
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
Message-ID: <b3b1a071-4fbc-a075-0481-5270b88080cf@suse.de>
Date: Wed, 8 Apr 2020 08:33:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <CAKMK7uEwKWAxiPwZKVQBN22S6D=_4FhfmyNGCnU9uftK+--V2A@mail.gmail.com>
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
Cc: Hans de Goede <hdegoede@redhat.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: multipart/mixed; boundary="===============0433146310=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0433146310==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="0DWQnUhUUx4wBZ19IagpUVLeQbjdpDlVf"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--0DWQnUhUUx4wBZ19IagpUVLeQbjdpDlVf
Content-Type: multipart/mixed; boundary="3kyhvTf4aKo0UJUIDxHohVMLdRR3On5L2";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: DRI Development <dri-devel@lists.freedesktop.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Hans de Goede <hdegoede@redhat.com>, Daniel Vetter <daniel.vetter@intel.com>
Message-ID: <b3b1a071-4fbc-a075-0481-5270b88080cf@suse.de>
Subject: Re: [PATCH 08/44] drm/vboxvideo: Stop using drm_device->dev_private
References: <20200403135828.2542770-1-daniel.vetter@ffwll.ch>
 <20200403135828.2542770-9-daniel.vetter@ffwll.ch>
 <0e60d88e-0429-049a-b4b2-5e3b6b660bbc@suse.de>
 <CAKMK7uEwKWAxiPwZKVQBN22S6D=_4FhfmyNGCnU9uftK+--V2A@mail.gmail.com>
In-Reply-To: <CAKMK7uEwKWAxiPwZKVQBN22S6D=_4FhfmyNGCnU9uftK+--V2A@mail.gmail.com>

--3kyhvTf4aKo0UJUIDxHohVMLdRR3On5L2
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 07.04.20 um 09:24 schrieb Daniel Vetter:
> On Mon, Apr 6, 2020 at 7:27 PM Thomas Zimmermann <tzimmermann@suse.de> =
wrote:
>>
>> Hi
>>
>> Am 03.04.20 um 15:57 schrieb Daniel Vetter:
>>> We use the baseclass pattern here, so lets to the proper (and more
>>> typesafe) upcasting.
>>>
>>> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
>>> Cc: Hans de Goede <hdegoede@redhat.com>
>>> ---
>>>  drivers/gpu/drm/vboxvideo/vbox_drv.c  |  1 -
>>>  drivers/gpu/drm/vboxvideo/vbox_drv.h  |  1 +
>>>  drivers/gpu/drm/vboxvideo/vbox_irq.c  |  2 +-
>>>  drivers/gpu/drm/vboxvideo/vbox_mode.c | 10 +++++-----
>>>  4 files changed, 7 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/vboxvideo/vbox_drv.c b/drivers/gpu/drm/v=
boxvideo/vbox_drv.c
>>> index be0600b22cf5..d34cddd809fd 100644
>>> --- a/drivers/gpu/drm/vboxvideo/vbox_drv.c
>>> +++ b/drivers/gpu/drm/vboxvideo/vbox_drv.c
>>> @@ -52,7 +52,6 @@ static int vbox_pci_probe(struct pci_dev *pdev, con=
st struct pci_device_id *ent)
>>>               return PTR_ERR(vbox);
>>>
>>>       vbox->ddev.pdev =3D pdev;
>>> -     vbox->ddev.dev_private =3D vbox;
>>>       pci_set_drvdata(pdev, vbox);
>>>       mutex_init(&vbox->hw_mutex);
>>>
>>> diff --git a/drivers/gpu/drm/vboxvideo/vbox_drv.h b/drivers/gpu/drm/v=
boxvideo/vbox_drv.h
>>> index 87421903816c..ac7c2effc46f 100644
>>> --- a/drivers/gpu/drm/vboxvideo/vbox_drv.h
>>> +++ b/drivers/gpu/drm/vboxvideo/vbox_drv.h
>>> @@ -127,6 +127,7 @@ struct vbox_encoder {
>>>  #define to_vbox_crtc(x) container_of(x, struct vbox_crtc, base)
>>>  #define to_vbox_connector(x) container_of(x, struct vbox_connector, =
base)
>>>  #define to_vbox_encoder(x) container_of(x, struct vbox_encoder, base=
)
>>> +#define to_vbox_dev(x) container_of(x, struct vbox_private, ddev)
>>
>> I suggest ot call this macro to to_vbox_device(). At some point, we
>> should rename struct vbox_private to struct vbox_device for consistenc=
y
>> among drivers. The new macro's name would then fit.
>=20
> So I've seen naming conventions around this with a _dev suffix, a _drm
> suffix, a _priv suffix and no suffix (since it's the top level object
> you kinda can justify that too). I admit the choice I went with was
> occasionally a bit random, but that's mostly because there's not much
> consistency here at all. This applies both to the upcast macro and the
> struct itself.
>=20
> iow I'm not sure this bikeshed is worth repainting, current status is
> rather multicolor already ... It's also an enormous amounts of churn
> to repaint this stuff already (just git grep dev_private --
> drivers/gpu/drm), so I'm not super enthusiastic about adding more
> churn on top ...
>=20
> Still feel strongly about this one and the others you've brought up?

I have no strong feelings about it. :) But since you're introducing the
macro, I thought that naming it to_vbox_device() would be consisted
within the driver.

Best regards
Thomas

> -Daniel
>=20
>> For the overall patch:
>>
>> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
>>
>> Best regards
>> Thomas
>>
>>>
>>>  bool vbox_check_supported(u16 id);
>>>  int vbox_hw_init(struct vbox_private *vbox);
>>> diff --git a/drivers/gpu/drm/vboxvideo/vbox_irq.c b/drivers/gpu/drm/v=
boxvideo/vbox_irq.c
>>> index 16a1e29f5292..631657fa554f 100644
>>> --- a/drivers/gpu/drm/vboxvideo/vbox_irq.c
>>> +++ b/drivers/gpu/drm/vboxvideo/vbox_irq.c
>>> @@ -34,7 +34,7 @@ void vbox_report_hotplug(struct vbox_private *vbox)=

>>>  irqreturn_t vbox_irq_handler(int irq, void *arg)
>>>  {
>>>       struct drm_device *dev =3D (struct drm_device *)arg;
>>> -     struct vbox_private *vbox =3D (struct vbox_private *)dev->dev_p=
rivate;
>>> +     struct vbox_private *vbox =3D to_vbox_dev(dev);
>>>       u32 host_flags =3D vbox_get_flags(vbox);
>>>
>>>       if (!(host_flags & HGSMIHOSTFLAGS_IRQ))
>>> diff --git a/drivers/gpu/drm/vboxvideo/vbox_mode.c b/drivers/gpu/drm/=
vboxvideo/vbox_mode.c
>>> index 0883a435e62b..d9a5af62af89 100644
>>> --- a/drivers/gpu/drm/vboxvideo/vbox_mode.c
>>> +++ b/drivers/gpu/drm/vboxvideo/vbox_mode.c
>>> @@ -36,7 +36,7 @@ static void vbox_do_modeset(struct drm_crtc *crtc)
>>>       u16 flags;
>>>       s32 x_offset, y_offset;
>>>
>>> -     vbox =3D crtc->dev->dev_private;
>>> +     vbox =3D to_vbox_dev(crtc->dev);
>>>       width =3D vbox_crtc->width ? vbox_crtc->width : 640;
>>>       height =3D vbox_crtc->height ? vbox_crtc->height : 480;
>>>       bpp =3D fb ? fb->format->cpp[0] * 8 : 32;
>>> @@ -77,7 +77,7 @@ static void vbox_do_modeset(struct drm_crtc *crtc)
>>>  static int vbox_set_view(struct drm_crtc *crtc)
>>>  {
>>>       struct vbox_crtc *vbox_crtc =3D to_vbox_crtc(crtc);
>>> -     struct vbox_private *vbox =3D crtc->dev->dev_private;
>>> +     struct vbox_private *vbox =3D to_vbox_dev(crtc->dev);
>>>       struct vbva_infoview *p;
>>>
>>>       /*
>>> @@ -174,7 +174,7 @@ static void vbox_crtc_set_base_and_mode(struct dr=
m_crtc *crtc,
>>>                                       int x, int y)
>>>  {
>>>       struct drm_gem_vram_object *gbo =3D drm_gem_vram_of_gem(fb->obj=
[0]);
>>> -     struct vbox_private *vbox =3D crtc->dev->dev_private;
>>> +     struct vbox_private *vbox =3D to_vbox_dev(crtc->dev);
>>>       struct vbox_crtc *vbox_crtc =3D to_vbox_crtc(crtc);
>>>       bool needs_modeset =3D drm_atomic_crtc_needs_modeset(crtc->stat=
e);
>>>
>>> @@ -272,7 +272,7 @@ static void vbox_primary_atomic_update(struct drm=
_plane *plane,
>>>  {
>>>       struct drm_crtc *crtc =3D plane->state->crtc;
>>>       struct drm_framebuffer *fb =3D plane->state->fb;
>>> -     struct vbox_private *vbox =3D fb->dev->dev_private;
>>> +     struct vbox_private *vbox =3D to_vbox_dev(fb->dev);
>>>       struct drm_mode_rect *clips;
>>>       uint32_t num_clips, i;
>>>
>>> @@ -704,7 +704,7 @@ static int vbox_get_modes(struct drm_connector *c=
onnector)
>>>       int preferred_width, preferred_height;
>>>
>>>       vbox_connector =3D to_vbox_connector(connector);
>>> -     vbox =3D connector->dev->dev_private;
>>> +     vbox =3D to_vbox_dev(connector->dev);
>>>
>>>       hgsmi_report_flags_location(vbox->guest_pool, GUEST_HEAP_OFFSET=
(vbox) +
>>>                                   HOST_FLAGS_OFFSET);
>>>
>>
>> --
>> Thomas Zimmermann
>> Graphics Driver Developer
>> SUSE Software Solutions Germany GmbH
>> Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
>> (HRB 36809, AG N=C3=BCrnberg)
>> Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer
>>
>=20
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--3kyhvTf4aKo0UJUIDxHohVMLdRR3On5L2--

--0DWQnUhUUx4wBZ19IagpUVLeQbjdpDlVf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl6NcCYACgkQaA3BHVML
eiMTsQf9E1Oc1VYoWaqRgIIhpx/15m8GlpJ5uV/JHg2dME7QAnBDBajq3eBsosrh
7XwMA+f7VOZnqk7cdapD/0qMig0XPceOCvasgwCb7XIOO6vsk6T33XYLBELLvy+6
weizOqqmVrYmOnvfT71qSFwfHfpNKc0on96X5mdTdX6O1txS2PR7Vik2L/cU4y/m
MdLhuuiItA/7gPFIsqvs7AP5NN3qaHSQodZQUOWx3tqNHjva22CIDCeidQDvog6r
CaHfsvmlIRvdbTg/+xwBJtUdi0qy2eWZX5iIYHp3CQPkDR13GP821RqBAkmCfebk
k+jiP5o9PMx/oE0gRwiKC5q1vejgJQ==
=7l+E
-----END PGP SIGNATURE-----

--0DWQnUhUUx4wBZ19IagpUVLeQbjdpDlVf--

--===============0433146310==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0433146310==--
