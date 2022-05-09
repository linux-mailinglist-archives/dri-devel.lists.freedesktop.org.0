Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FF0F51FDC7
	for <lists+dri-devel@lfdr.de>; Mon,  9 May 2022 15:14:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2D0C10F14E;
	Mon,  9 May 2022 13:14:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EBAD10F0E7
 for <dri-devel@lists.freedesktop.org>; Mon,  9 May 2022 13:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652102043;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UCKqnPAFt7b6vGoz6EzOZKPq3+agUR2kUlZq7JRxffI=;
 b=c34dw3XaCXv27bE/ehUufXem1QR+J0/MTzF0RZcVDvMOJr125oO7wIuNcxF+DwzcgQEuJe
 fQacvY3XSq29uHD2zeGvJ0CdxIOjMarGFG2fx0Vv2mdxYEpv+szJSsI5XMEzaq4K4ZidrU
 FYaWFNMbZcflMh8517vny5bBagDjYw4=
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com
 [209.85.222.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-572-E45E7il7OBCx22ktz3cxdA-1; Mon, 09 May 2022 09:14:02 -0400
X-MC-Unique: E45E7il7OBCx22ktz3cxdA-1
Received: by mail-ua1-f70.google.com with SMTP id
 m16-20020ab05a50000000b003628807eda4so6885770uad.20
 for <dri-devel@lists.freedesktop.org>; Mon, 09 May 2022 06:14:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UCKqnPAFt7b6vGoz6EzOZKPq3+agUR2kUlZq7JRxffI=;
 b=Zvwu3GvoVDbs73kwJF8TBOFEVHWxRascDLJyhdeocmGZMmMBtMbiuxeBHxqxsIEOqe
 uA6CI9rFrtI179pQ4CbDKJnFhjlCt8ulVo9/fgZg0z4oP3ePuiwiXG3BRY4Tpa+P4hbS
 nhsrEoaF/3EB45JIfgOzCfp8R2J1X+GxPZANQTuN0LlkWDJPVLOW+QSX1EmwJxIA/8Y/
 h2nBJ2G/uhKIdtcQmHgQ4OJXfhNQyxkqJBpsyiavAADhiEvp0xSzuSm6+99+DbjeQyW+
 tPH4RNrycqIr01JzNO8i6UQSRDj3B1iebXnnrN8Gr+pLqonUszEcmvU3wpwQd94kR1lI
 TIpw==
X-Gm-Message-State: AOAM5312dSPVBED4uTjIzvzHnLyGV3TP+wpzv0mTfWyig4kyXixgbM1N
 pLT77GYFI19F5wdHVEzUBj9GWpZjC9b6jUSChf9GOp3eUz4Rc/n2Gn+43lxKaS8MOUFCvBLNN/9
 DYv5QaOgcmaqheLh7x8ygcRxbQPQEVx4vB6KAoQWynCGn
X-Received: by 2002:ab0:7c4f:0:b0:360:299f:d1e3 with SMTP id
 d15-20020ab07c4f000000b00360299fd1e3mr7984999uaw.65.1652102041491; 
 Mon, 09 May 2022 06:14:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz/EnSD6pgEd0hFjf2G7YJqwvQCeh9dD0kq/ssw+MIiqvOLyyNJ7MhfLJ9IY1lM15/cvG27fbXTzz1JVTr62eI=
X-Received: by 2002:ab0:7c4f:0:b0:360:299f:d1e3 with SMTP id
 d15-20020ab07c4f000000b00360299fd1e3mr7984971uaw.65.1652102041236; Mon, 09
 May 2022 06:14:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220504171851.17188-1-mmenzyns@redhat.com>
 <7574d491866ffa7c1a4607885b76140ba4206477.camel@redhat.com>
In-Reply-To: <7574d491866ffa7c1a4607885b76140ba4206477.camel@redhat.com>
From: Mark Menzynski <mmenzyns@redhat.com>
Date: Mon, 9 May 2022 15:13:25 +0200
Message-ID: <CA+i2r=uKq=CWts-6wXh2qqy6=vEVHLY0vRBxzcA-mg0P8wXOZg@mail.gmail.com>
Subject: Re: [PATCH] drm/nouveau: reorder nouveau_drm_device_fini
To: Lyude Paul <lyude@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mmenzyns@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000004d09d905de93fbee"
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
Cc: Karol Herbst <kherbst@redhat.com>, David Airlie <airlied@linux.ie>,
 nouveau <nouveau@lists.freedesktop.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--0000000000004d09d905de93fbee
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I think there are no direct issues with initialization in the state how it
is now. I suspect it's because "drm_kms_helper_poll_enable()" starts the
first worker thread with a delay, which gives enough time to initialize
required resources. I changed the initialization part to keep it consistent
with the finish part, which is the one causing troubles.

I am not sure where I could move "drm_kms_helper_poll_enable/disable()",
since it is defined in "drm/drm_probe_helper.c", which is only included in
"nouveau_display.c" and "nouveau_connector.c". Both creating a new function
in "nouveau_display.c", and including "probe_helper.h" and using
poll_enable in a different file like "nouveau_fbcon.c" seem like too big
changes for such small fix. I don't know.

Can this new proposed order break something in the finish part as well?
Maybe it would be just better to change the order of "nouveau_drm_finish"
and keep the current order of "noueau_drm_init"?

On Thu, May 5, 2022 at 9:57 PM Lyude Paul <lyude@redhat.com> wrote:

> Hmm, I think we might just need to move the drm_kms_helper_poll_enable()
> call
> to the end here instead of all of nouveau_display_init(). I realized this
> because in nouveau_display_init() it seems that we actually rely on
> nouveau_display_init() to setup hotplug interrupts - which we do actually
> need
> this early on in the driver probe process.
>
> That being said though, drm_kms_helper_poll_enable() shouldn't be require=
d
> for
> MST short HPD IRQs from working so moving that instead should work.
>
> On Wed, 2022-05-04 at 19:18 +0200, Mark Menzynski wrote:
> > Resources needed for output poll workers are destroyed in
> > nouveau_fbcon_fini() before output poll workers are cleared in
> > nouveau_display_fini(). This means there is a time between fbcon_fini
> > and display_fini, where if output poll happens, it crashes.
> >
> > BUG: KASAN: use-after-free in
> > __drm_fb_helper_initial_config_and_unlock.cold+0x1f3/0x291
> > [drm_kms_helper]
> >
> > Cc: Ben Skeggs <bskeggs@redhat.com>
> > Cc: Karol Herbst <kherbst@redhat.com>
> > Cc: Lyude Paul <lyude@redhat.com>
> > Cc: David Airlie <airlied@linux.ie>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Cc: Sumit Semwal <sumit.semwal@linaro.org>
> > Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> > Cc: dri-devel@lists.freedesktop.org
> > Cc: nouveau@lists.freedesktop.org
> > Cc: linux-kernel@vger.kernel.org
> > Cc: linux-media@vger.kernel.org
> > Cc: linaro-mm-sig@lists.linaro.org
> > Signed-off-by: Mark Menzynski <mmenzyns@redhat.com>
> > ---
> >  drivers/gpu/drm/nouveau/nouveau_drm.c | 17 ++++++++---------
> >  1 file changed, 8 insertions(+), 9 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c
> > b/drivers/gpu/drm/nouveau/nouveau_drm.c
> > index 561309d447e0..773efdd20d2f 100644
> > --- a/drivers/gpu/drm/nouveau/nouveau_drm.c
> > +++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
> > @@ -588,12 +588,6 @@ nouveau_drm_device_init(struct drm_device *dev)
> >         if (ret)
> >                 goto fail_dispctor;
> >
> > -       if (dev->mode_config.num_crtc) {
> > -               ret =3D nouveau_display_init(dev, false, false);
> > -               if (ret)
> > -                       goto fail_dispinit;
> > -       }
> > -
> >         nouveau_debugfs_init(drm);
> >         nouveau_hwmon_init(dev);
> >         nouveau_svm_init(drm);
> > @@ -601,6 +595,12 @@ nouveau_drm_device_init(struct drm_device *dev)
> >         nouveau_fbcon_init(dev);
> >         nouveau_led_init(dev);
> >
> > +       if (dev->mode_config.num_crtc) {
> > +               ret =3D nouveau_display_init(dev, false, false);
> > +               if (ret)
> > +                       goto fail_dispinit;
> > +       }
> > +
> >         if (nouveau_pmops_runtime()) {
> >                 pm_runtime_use_autosuspend(dev->dev);
> >                 pm_runtime_set_autosuspend_delay(dev->dev, 5000);
> > @@ -641,15 +641,14 @@ nouveau_drm_device_fini(struct drm_device *dev)
> >                 pm_runtime_forbid(dev->dev);
> >         }
> >
> > +       if (dev->mode_config.num_crtc)
> > +               nouveau_display_fini(dev, false, false);
> >         nouveau_led_fini(dev);
> >         nouveau_fbcon_fini(dev);
> >         nouveau_dmem_fini(drm);
> >         nouveau_svm_fini(drm);
> >         nouveau_hwmon_fini(dev);
> >         nouveau_debugfs_fini(drm);
> > -
> > -       if (dev->mode_config.num_crtc)
> > -               nouveau_display_fini(dev, false, false);
> >         nouveau_display_destroy(dev);
> >
> >         nouveau_accel_fini(drm);
>
> --
> Cheers,
>  Lyude Paul (she/her)
>  Software Engineer at Red Hat
>
>

--0000000000004d09d905de93fbee
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">I think there are no direct issues with i=
nitialization in the state how it is now. I suspect it&#39;s because &quot;=
drm_kms_helper_poll_enable()&quot; starts the first worker thread with a de=
lay, which gives=C2=A0enough time to initialize required resources. I chang=
ed the initialization part to keep it consistent with the finish=C2=A0part,=
 which is the one causing troubles.<div><br></div><div>I am not sure where =
I could move &quot;drm_kms_helper_poll_enable/disable()&quot;, since it is =
defined in &quot;drm/drm_probe_helper.c&quot;, which is only included in &q=
uot;nouveau_display.c&quot; and &quot;nouveau_connector.c&quot;. Both creat=
ing a new function in &quot;nouveau_display.c&quot;, and including &quot;pr=
obe_helper.h&quot; and using poll_enable in a different file like &quot;nou=
veau_fbcon.c&quot; seem like too big changes for such small=C2=A0fix. I don=
&#39;t know.</div><div><br></div><div>Can this new proposed order break som=
ething in the finish part as well? Maybe it would be just better to change =
the order of &quot;nouveau_drm_finish&quot; and keep the current order of &=
quot;noueau_drm_init&quot;?</div></div></div><br><div class=3D"gmail_quote"=
><div dir=3D"ltr" class=3D"gmail_attr">On Thu, May 5, 2022 at 9:57 PM Lyude=
 Paul &lt;<a href=3D"mailto:lyude@redhat.com">lyude@redhat.com</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hmm, I think =
we might just need to move the drm_kms_helper_poll_enable() call<br>
to the end here instead of all of nouveau_display_init(). I realized this<b=
r>
because in nouveau_display_init() it seems that we actually rely on<br>
nouveau_display_init() to setup hotplug interrupts - which we do actually n=
eed<br>
this early on in the driver probe process.<br>
<br>
That being said though, drm_kms_helper_poll_enable() shouldn&#39;t be requi=
red for<br>
MST short HPD IRQs from working so moving that instead should work.<br>
<br>
On Wed, 2022-05-04 at 19:18 +0200, Mark Menzynski wrote:<br>
&gt; Resources needed for output poll workers are destroyed in<br>
&gt; nouveau_fbcon_fini() before output poll workers are cleared in<br>
&gt; nouveau_display_fini(). This means there is a time between fbcon_fini<=
br>
&gt; and display_fini, where if output poll happens, it crashes.<br>
&gt; <br>
&gt; BUG: KASAN: use-after-free in<br>
&gt; __drm_fb_helper_initial_config_and_unlock.cold+0x1f3/0x291<br>
&gt; [drm_kms_helper]<br>
&gt; <br>
&gt; Cc: Ben Skeggs &lt;<a href=3D"mailto:bskeggs@redhat.com" target=3D"_bl=
ank">bskeggs@redhat.com</a>&gt;<br>
&gt; Cc: Karol Herbst &lt;<a href=3D"mailto:kherbst@redhat.com" target=3D"_=
blank">kherbst@redhat.com</a>&gt;<br>
&gt; Cc: Lyude Paul &lt;<a href=3D"mailto:lyude@redhat.com" target=3D"_blan=
k">lyude@redhat.com</a>&gt;<br>
&gt; Cc: David Airlie &lt;<a href=3D"mailto:airlied@linux.ie" target=3D"_bl=
ank">airlied@linux.ie</a>&gt;<br>
&gt; Cc: Daniel Vetter &lt;<a href=3D"mailto:daniel@ffwll.ch" target=3D"_bl=
ank">daniel@ffwll.ch</a>&gt;<br>
&gt; Cc: Sumit Semwal &lt;<a href=3D"mailto:sumit.semwal@linaro.org" target=
=3D"_blank">sumit.semwal@linaro.org</a>&gt;<br>
&gt; Cc: &quot;Christian K=C3=B6nig&quot; &lt;<a href=3D"mailto:christian.k=
oenig@amd.com" target=3D"_blank">christian.koenig@amd.com</a>&gt;<br>
&gt; Cc: <a href=3D"mailto:dri-devel@lists.freedesktop.org" target=3D"_blan=
k">dri-devel@lists.freedesktop.org</a><br>
&gt; Cc: <a href=3D"mailto:nouveau@lists.freedesktop.org" target=3D"_blank"=
>nouveau@lists.freedesktop.org</a><br>
&gt; Cc: <a href=3D"mailto:linux-kernel@vger.kernel.org" target=3D"_blank">=
linux-kernel@vger.kernel.org</a><br>
&gt; Cc: <a href=3D"mailto:linux-media@vger.kernel.org" target=3D"_blank">l=
inux-media@vger.kernel.org</a><br>
&gt; Cc: <a href=3D"mailto:linaro-mm-sig@lists.linaro.org" target=3D"_blank=
">linaro-mm-sig@lists.linaro.org</a><br>
&gt; Signed-off-by: Mark Menzynski &lt;<a href=3D"mailto:mmenzyns@redhat.co=
m" target=3D"_blank">mmenzyns@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt; =C2=A0drivers/gpu/drm/nouveau/nouveau_drm.c | 17 ++++++++---------<br>
&gt; =C2=A01 file changed, 8 insertions(+), 9 deletions(-)<br>
&gt; <br>
&gt; diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c<br>
&gt; b/drivers/gpu/drm/nouveau/nouveau_drm.c<br>
&gt; index 561309d447e0..773efdd20d2f 100644<br>
&gt; --- a/drivers/gpu/drm/nouveau/nouveau_drm.c<br>
&gt; +++ b/drivers/gpu/drm/nouveau/nouveau_drm.c<br>
&gt; @@ -588,12 +588,6 @@ nouveau_drm_device_init(struct drm_device *dev)<b=
r>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (ret)<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0goto fail_dispctor;<br>
&gt; =C2=A0<br>
&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (dev-&gt;mode_config.num=
_crtc) {<br>
&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0ret =3D nouveau_display_init(dev, false, false);<br>
&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0if (ret)<br>
&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0goto f=
ail_dispinit;<br>
&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}<br>
&gt; -<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0nouveau_debugfs_init(d=
rm);<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0nouveau_hwmon_init(dev=
);<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0nouveau_svm_init(drm);=
<br>
&gt; @@ -601,6 +595,12 @@ nouveau_drm_device_init(struct drm_device *dev)<b=
r>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0nouveau_fbcon_init(dev=
);<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0nouveau_led_init(dev);=
<br>
&gt; =C2=A0<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (dev-&gt;mode_config.num=
_crtc) {<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0ret =3D nouveau_display_init(dev, false, false);<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0if (ret)<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0goto f=
ail_dispinit;<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}<br>
&gt; +<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (nouveau_pmops_runt=
ime()) {<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0pm_runtime_use_autosuspend(dev-&gt;dev);<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0pm_runtime_set_autosuspend_delay(dev-&gt;dev, 50=
00);<br>
&gt; @@ -641,15 +641,14 @@ nouveau_drm_device_fini(struct drm_device *dev)<=
br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0pm_runtime_forbid(dev-&gt;dev);<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}<br>
&gt; =C2=A0<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (dev-&gt;mode_config.num=
_crtc)<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0nouveau_display_fini(dev, false, false);<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0nouveau_led_fini(dev);=
<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0nouveau_fbcon_fini(dev=
);<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0nouveau_dmem_fini(drm)=
;<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0nouveau_svm_fini(drm);=
<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0nouveau_hwmon_fini(dev=
);<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0nouveau_debugfs_fini(d=
rm);<br>
&gt; -<br>
&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (dev-&gt;mode_config.num=
_crtc)<br>
&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0nouveau_display_fini(dev, false, false);<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0nouveau_display_destro=
y(dev);<br>
&gt; =C2=A0<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0nouveau_accel_fini(drm=
);<br>
<br>
-- <br>
Cheers,<br>
=C2=A0Lyude Paul (she/her)<br>
=C2=A0Software Engineer at Red Hat<br>
<br>
</blockquote></div>

--0000000000004d09d905de93fbee--

