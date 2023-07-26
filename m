Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D56B276362D
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jul 2023 14:22:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78B1B10E46B;
	Wed, 26 Jul 2023 12:22:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE0BA10E46B
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jul 2023 12:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1690374144;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n/A7deWH9zMDJTwzUeTPTT6UYXqsr7w4U44TZZzDfGE=;
 b=D7itW9VMTevJ4uuC2RbAhpuOi/roNaWEHfaZBjS3uBXH1c3iyP6Vv4/DxEzuOeG2+VYzAw
 zE8CtjRJi8reZRjTfZyx3hlwshAqZkCpgIpsHitpSmuh1mKBiqSLk6aGvJY9E2zKEHUAt9
 1wcSRiNG09bRWsA4pLb4mavtkbt8fAo=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-375-W95wagkLN5K_Cy8ZJXzhWA-1; Wed, 26 Jul 2023 08:22:23 -0400
X-MC-Unique: W95wagkLN5K_Cy8ZJXzhWA-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-3fd0fa4d08cso35336285e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jul 2023 05:22:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690374142; x=1690978942;
 h=content-transfer-encoding:mime-version:message-id:date:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bUUISbPeBpBhrVSDp02ey71lZSBC2EQUMmF6cUaMALg=;
 b=IxDdWpeJrcrxgw5Qjm4jP/d3pXr4zK1fC38TfHVCX6Lrh13kxyPLc63ip8zcITyQOc
 0qULZCorDeoUHGIJFs72rKEUBgmXhKHfkNY0OGMwPQCn0F4pLXhHrSfMZUgfsY0wg4Yp
 jjWYGlDTZT/Xjxe1pqxQG1aBsdLRr/f+TigENmsiaV1CWC7gRq5ujoAB+HZvIf76FjZH
 LMQnhofO1RgITV4vTYWQ7Aeem8mO2ADDq3NBSBl+0IaNtFua9DCBjTWzDFmQkHmLrMFN
 g7C5XK6zQU801d+92Ig9aP31MjjZ8qXsP9SJKVY3O6HlcUytleLLHqhJoPSBaL0w3G1b
 OcNQ==
X-Gm-Message-State: ABy/qLZVcXdmiL5O0nnYlpp3YNwGX4ZSMyGeJHT+SsHxNWmuj5FqG13K
 MYBJP+Y5vBbb0Vhbuc3RdhfbrcsFtirBNsaVBTicB7zPLFmlL3ATUnTIcU5dNKy8LzdW8bvWRdh
 3Tv1CJqAqFkbde7fbx70KZYL2EzWg
X-Received: by 2002:a1c:4b1a:0:b0:3fb:c9f4:150e with SMTP id
 y26-20020a1c4b1a000000b003fbc9f4150emr1264666wma.14.1690374142405; 
 Wed, 26 Jul 2023 05:22:22 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEJRwKE37yLczW34KD10P4WTou7UxdNcZ2rXB7lFmLQeMcB8Dc7lH3Tbr7TI9+V+K/XUAHlQA==
X-Received: by 2002:a1c:4b1a:0:b0:3fb:c9f4:150e with SMTP id
 y26-20020a1c4b1a000000b003fbc9f4150emr1264640wma.14.1690374141899; 
 Wed, 26 Jul 2023 05:22:21 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 l13-20020a1ced0d000000b003fc00892c13sm1822976wmh.35.2023.07.26.05.22.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jul 2023 05:22:21 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard
 <mripard@kernel.org>
Subject: Re: [PATCH v4] drm/ssd130x: Allocate buffers in the plane's
 .atomic_check callback
In-Reply-To: <CAMuHMdXtOozswqujA1h2spL8J86n65Q6=+z=5Jbb0nSXaBwqzA@mail.gmail.com>
References: <20230721070955.1170974-1-javierm@redhat.com>
 <CAMuHMdVxF80mdTaiXA6Y8Gd59Z7pxkoEphB4ohpVcK1q-+Yy=g@mail.gmail.com>
 <n4fmda4zw4vuezvwva35tgma3yqhdvb253q2tfdyauoxbfqshx@s6fsa7de6g5s>
 <CAMuHMdXtOozswqujA1h2spL8J86n65Q6=+z=5Jbb0nSXaBwqzA@mail.gmail.com>
Date: Wed, 26 Jul 2023 14:22:20 +0200
Message-ID: <874jlqlv5v.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Geert Uytterhoeven <geert@linux-m68k.org> writes:

Hello Geert,

> Hi Maxime,
>
> On Wed, Jul 26, 2023 at 12:00=E2=80=AFPM Maxime Ripard <mripard@kernel.or=
g> wrote:
>> On Tue, Jul 25, 2023 at 09:21:52PM +0200, Geert Uytterhoeven wrote:
>> > > --- a/drivers/gpu/drm/solomon/ssd130x.c
>> > > +++ b/drivers/gpu/drm/solomon/ssd130x.c
>> > > @@ -141,12 +141,26 @@ const struct ssd130x_deviceinfo ssd130x_varian=
ts[] =3D {
>> > >  };
>> > >  EXPORT_SYMBOL_NS_GPL(ssd130x_variants, DRM_SSD130X);
>> > >
>> > > +struct ssd130x_plane_state {
>> > > +       struct drm_plane_state base;
>> > > +       /* Intermediate buffer to convert pixels from XRGB8888 to R1=
 */
>> > > +       u8 *buffer;
>> > > +       /* Buffer that contains R1 pixels to be written to the panel=
 */
>> > > +       u8 *data_array;
>> >
>> > The second buffer actually contains pixels in hardware format.
>> > For now that is a transposed buffer of R1 pixels, but that will change
>> > when you will add support for greyscale displays.
>> >
>> > So I'd write "hardware format" instead of R1 for both.
>> >
>> > BTW, I still think data_array should be allocated during probing,
>> > as it is related to the hardware, not to a plane.
>>
>> I somewhat disagree.
>>
>> If I understood right during our discussion with Javier, the buffer size
>> derives from the mode size (height and width).
>>
>> In KMS, the mode is tied to the KMS state, and thus you can expect the
>> mode to change every state commit. So the more logical thing to do is to
>> tie the buffer size (and thus the buffer pointer) to the state since
>> it's only valid for that particular state for all we know.
>>
>> Of course, our case is allows use to simplify things since it's a fixed
>> mode, but one of Javier's goal with this driver was to provide a good
>> example we can refer people to, so I think it's worth keeping.
>
> The second buffer (containing the hardware format) has a size that
> depends on the full screen size, not the current mode (I believe that's
> also the size of the frame buffer backing the plane?).  So its size is
> fixed.
>

Yes, is fixed. But Maxime's point is that this is a characteristic of this
particular device and even when the display resolution can't be changed,
the correct thing to do is to keep all state related to the mode (even the
buffer used to store the hardware pixels that are written to the display)

> Given the allocations are now done based on plane state, I think the
> first buffer should be sized according to the frame buffer backing
> the plane? Currently it uses the full screen size, too (cfr. below).
>

But can the mode even be changed if ssd130x_connector_helper_get_modes()
just adds a single display mode with mode->hdisplay =3D=3D ssd130x->width a=
nd
mode->vdisplay =3D=3D ssd130x->height.

>> > > @@ -159,23 +173,23 @@ static int ssd130x_buf_alloc(struct ssd130x_de=
vice *ssd130x)
>> > >
>> > >         pitch =3D drm_format_info_min_pitch(fi, 0, ssd130x->width);
>> > >
>> > > -       ssd130x->buffer =3D kcalloc(pitch, ssd130x->height, GFP_KERN=
EL);
>> > > -       if (!ssd130x->buffer)
>> > > +       ssd130x_state->buffer =3D kcalloc(pitch, ssd130x->height, GF=
P_KERNEL);
>
> Based on full screen width and height.
>

You think that using ssd130x->mode->vdisplay instead will be more clear her=
e?

>> > > +       if (!ssd130x_state->buffer)
>> > >                 return -ENOMEM;
>> > >
>> > > -       ssd130x->data_array =3D kcalloc(ssd130x->width, pages, GFP_K=
ERNEL);
>> > > -       if (!ssd130x->data_array) {
>> > > -               kfree(ssd130x->buffer);
>> > > +       ssd130x_state->data_array =3D kcalloc(ssd130x->width, pages,=
 GFP_KERNEL);
>
> Based on full screen width and height (hardware page size).
>

Yes, this depends on the panel attached to the OLED controller, and that
resolution is fixed and taken from the Device Tree (or ACPI table).

>> > > +       if (!ssd130x_state->data_array) {
>> > > +               kfree(ssd130x_state->buffer);
>> >
>> > Should ssd130x_state->buffer be reset to NULL here?
>> > I.e. if .atomic_check() fails, will .atomic_destroy_state() be called,
>> > leading to a double free?
>>
>> That's a good question.
>>
>> I never really thought of that, but yeah, AFAIK atomic_destroy_state()
>> will be called when atomic_check() fails.
>>
>> Which means that it's probably broken in a lot of drivers.
>>
>> Also, Javier pointed me to a discussion you had on IRC about using devm
>> allocation here. We can't really do that. KMS devices are only freed
>> once the last userspace application closes its fd to the device file, so
>> you have an unbounded window during which the driver is still callable
>> by userspace (and thus can still trigger an atomic commit) but the
>> buffer would have been freed for a while.
>
> It should still be safe for (at least) the data_array buffer. That
> buffer is only used to store pixels in hardware format, and immediately
> send them to the hardware.  If this can be called that late, it will
> fail horribly, as you can no longer talk to the hardware at that point
> (as ssd130x is an i2c driver, it might actually work; but a DRM driver
>  that calls devm_platform_ioremap_resource() will crash when writing
>  to its MMIO registers)?!?
>

At the very least the SPI driver will fail since the GPIO that is used to
toggle the D/C pin is allocated with devm_gpiod_get_optional(), but also
the regulator, backlight device, etc.

But in any case, as mentioned it is only relevant if the data_array buffer
is allocated at probe time, and from Maxime's explanation is more correct
to do it in the .atomic_check handler.

>> > > +static struct drm_plane_state *ssd130x_primary_plane_duplicate_stat=
e(struct drm_plane *plane)
>> > > +{
>> > > +       struct ssd130x_plane_state *old_ssd130x_state;
>> > > +       struct ssd130x_plane_state *ssd130x_state;
>> > > +
>> > > +       if (WARN_ON(!plane->state))
>> > > +               return NULL;
>> > > +
>> > > +       old_ssd130x_state =3D to_ssd130x_plane_state(plane->state);
>> > > +       ssd130x_state =3D kmemdup(old_ssd130x_state, sizeof(*ssd130x=
_state), GFP_KERNEL);
>> >
>> > I know this is the standard pattern, but the "dup" part is a bit
>> > silly here:
>> >   - The ssd130x-specific parts in ssd130x_plane_state are zeroed below=
,
>> >   - The base part is copied again in
>> >     __drm_atomic_helper_plane_duplicate_state).
>> > So (for now) you might as well just call kzalloc() ;-)
>>
>> Still if we ever add a field in the state structure, it will be
>> surprising that it's not copied over.
>>
>> The code is there and looks good to me, so I'd rather keep it.
>
> Fair enough, let's keep it.
>

Yeah. At the very least helps since will be consistent with other drivers.

> Gr{oetje,eeting}s,
>
>                         Geert

--=20
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

