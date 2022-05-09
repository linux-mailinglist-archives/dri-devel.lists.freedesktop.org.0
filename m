Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 196AC520408
	for <lists+dri-devel@lfdr.de>; Mon,  9 May 2022 19:59:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7ECD410F598;
	Mon,  9 May 2022 17:59:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ADB910F592
 for <dri-devel@lists.freedesktop.org>; Mon,  9 May 2022 17:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652119150;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Zn6h+Retsdyi5x3OJD1EEtAyFMSjKVu9RRih/mioqj0=;
 b=b4whHLXBx0Iq3Jak2+aPaiRpl9h4O/7RC7XV/9gK0XLoBjd346iXhZrTtFobMwgAFTW0pv
 nCt8FLY14Mxcs5rH6N2bi63kuiJ0srB0qcRDGiOKBQ4XukUktBiMk1GCmI2/SR+eOR2Pt+
 8Tf6W9vD34c7xPFW6EXbiZ7y2lBIxhA=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-93-0nalLUSuOj-in9pW5OKYEg-1; Mon, 09 May 2022 13:59:07 -0400
X-MC-Unique: 0nalLUSuOj-in9pW5OKYEg-1
Received: by mail-qv1-f70.google.com with SMTP id
 da15-20020a05621408cf00b0045b00b9eab4so4471820qvb.1
 for <dri-devel@lists.freedesktop.org>; Mon, 09 May 2022 10:59:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version;
 bh=fJvNBD/Mlo7x6PfMci5AU7M5iavtG2syHjSLXDmRmuU=;
 b=ZpvU9a9+XFKoDl1uPCwgqqbAtxny3GLiWSsyH79UyhXO483JNQQ7YPrDHf20PExErE
 omPL3CB+PQBCtb8jpv9ynzAIjkkR8cxVAtN+FFfQkneia01ajT3Szkt139GbkNSAiBqk
 2OEpsHbH9DTPzCc5lUXP6SDsrdIm7hHmsNsJkYAvUl1tzbmi4Ld7DNRgwBfnnnjR4G8B
 6iz62sRulX3Re7WJusBTEu+u/k4RnrXv1PxPNfKPUbex9Z6I1hAr0eie34AiD0iqtjwI
 Q6bWGrj3JuydowJEsfJXKJ7iCNWrCCyaM0y0hloxgUmtsBRMj8uagFJGORHg3XoOSK1x
 LEvg==
X-Gm-Message-State: AOAM5317PUJ1SJ59TZjoDn43NiKbSPAwvaNOcsDZb8uB0qnM9xGGIWkd
 yKsXU3bgI96aa0K+UG7uGJ3vm4gEyp5r0jjOE6YkjauXtSPOhI8didtSmIeWcRojGXPm2uz2EqP
 rTMmoIJ+GSf4mu1ghtBn7iRJQmaQS
X-Received: by 2002:ac8:5f46:0:b0:2f3:ca56:e703 with SMTP id
 y6-20020ac85f46000000b002f3ca56e703mr15111629qta.328.1652119146654; 
 Mon, 09 May 2022 10:59:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzL8dWwjP3qVV8U2RMikHIkhUtFe/V45PKtl6RyDpXrR/UGlykPnMlO9+GJe96dBfFANMC0tw==
X-Received: by 2002:ac8:5f46:0:b0:2f3:ca56:e703 with SMTP id
 y6-20020ac85f46000000b002f3ca56e703mr15111609qta.328.1652119146396; 
 Mon, 09 May 2022 10:59:06 -0700 (PDT)
Received: from [192.168.8.138] (static-71-184-137-158.bstnma.ftas.verizon.net.
 [71.184.137.158]) by smtp.gmail.com with ESMTPSA id
 l12-20020ac8148c000000b002f39b99f67dsm7858767qtj.23.2022.05.09.10.59.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 May 2022 10:59:05 -0700 (PDT)
Message-ID: <82c9b246bcbe544036d2fc0873f15f8483947a57.camel@redhat.com>
Subject: Re: [PATCH] drm/nouveau: reorder nouveau_drm_device_fini
From: Lyude Paul <lyude@redhat.com>
To: Mark Menzynski <mmenzyns@redhat.com>
Date: Mon, 09 May 2022 13:59:04 -0400
In-Reply-To: <CA+i2r=uKq=CWts-6wXh2qqy6=vEVHLY0vRBxzcA-mg0P8wXOZg@mail.gmail.com>
References: <20220504171851.17188-1-mmenzyns@redhat.com>
 <7574d491866ffa7c1a4607885b76140ba4206477.camel@redhat.com>
 <CA+i2r=uKq=CWts-6wXh2qqy6=vEVHLY0vRBxzcA-mg0P8wXOZg@mail.gmail.com>
Organization: Red Hat Inc.
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="=-jupczcBFoyxx2kZSvH9q"
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

--=-jupczcBFoyxx2kZSvH9q
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2022-05-09 at 15:13 +0200, Mark Menzynski wrote:
> I think there are no direct issues with initialization in the state how it
> is now. I suspect it's because "drm_kms_helper_poll_enable()" starts the
> first worker thread with a delay, which gives enough time to initialize
> required resources. I changed the initialization part to keep it consistent
> with the finish part, which is the one causing troubles.

I think I may have misspoke on what the issue was here since I was about to
leave work. The MST bit might not actually be an issue, however I think
nouveau_fbcon_init() being called before nouveau_display_init() would be an
issue since nouveau_fbcon_init() can trigger a modeset - and we can't perform
modesets before nouveau_display_init() has set things up.

Looking at the docs for drm_kms_helper_poll_disable() - I think the actual fix
here (to ensure that we still call drm_kms_helper_poll_disable() at the right
time during suspend) would be to actually add another call to
drm_kms_helper_poll_disable() into nouveau_fbcon_fini() before we call
nouveau_fbcon_accel_fini() and everything after. This should make sure that we
stop the output polling work early on driver unload, and since the docs
mention that it's OK to disable polling more then once with
drm_kms_helper_poll_disable() I don't see any issues with that.


> 
> I am not sure where I could move "drm_kms_helper_poll_enable/disable()",
> since it is defined in "drm/drm_probe_helper.c", which is only included in
> "nouveau_display.c" and "nouveau_connector.c". Both creating a new function
> in "nouveau_display.c", and including "probe_helper.h" and using poll_enable
> in a different file like "nouveau_fbcon.c" seem like too big changes for
> such small fix. I don't know.
> 
> Can this new proposed order break something in the finish part as well?
> Maybe it would be just better to change the order of "nouveau_drm_finish"
> and keep the current order of "noueau_drm_init"?
> 
> On Thu, May 5, 2022 at 9:57 PM Lyude Paul <lyude@redhat.com> wrote:
> > Hmm, I think we might just need to move the drm_kms_helper_poll_enable()
> > call
> > to the end here instead of all of nouveau_display_init(). I realized this
> > because in nouveau_display_init() it seems that we actually rely on
> > nouveau_display_init() to setup hotplug interrupts - which we do actually
> > need
> > this early on in the driver probe process.
> > 
> > That being said though, drm_kms_helper_poll_enable() shouldn't be required
> > for
> > MST short HPD IRQs from working so moving that instead should work.
> > 
> > On Wed, 2022-05-04 at 19:18 +0200, Mark Menzynski wrote:
> > > Resources needed for output poll workers are destroyed in
> > > nouveau_fbcon_fini() before output poll workers are cleared in
> > > nouveau_display_fini(). This means there is a time between fbcon_fini
> > > and display_fini, where if output poll happens, it crashes.
> > > 
> > > BUG: KASAN: use-after-free in
> > > __drm_fb_helper_initial_config_and_unlock.cold+0x1f3/0x291
> > > [drm_kms_helper]
> > > 
> > > Cc: Ben Skeggs <bskeggs@redhat.com>
> > > Cc: Karol Herbst <kherbst@redhat.com>
> > > Cc: Lyude Paul <lyude@redhat.com>
> > > Cc: David Airlie <airlied@linux.ie>
> > > Cc: Daniel Vetter <daniel@ffwll.ch>
> > > Cc: Sumit Semwal <sumit.semwal@linaro.org>
> > > Cc: "Christian König" <christian.koenig@amd.com>
> > > Cc: dri-devel@lists.freedesktop.org
> > > Cc: nouveau@lists.freedesktop.org
> > > Cc: linux-kernel@vger.kernel.org
> > > Cc: linux-media@vger.kernel.org
> > > Cc: linaro-mm-sig@lists.linaro.org
> > > Signed-off-by: Mark Menzynski <mmenzyns@redhat.com>
> > > ---
> > >  drivers/gpu/drm/nouveau/nouveau_drm.c | 17 ++++++++---------
> > >  1 file changed, 8 insertions(+), 9 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c
> > > b/drivers/gpu/drm/nouveau/nouveau_drm.c
> > > index 561309d447e0..773efdd20d2f 100644
> > > --- a/drivers/gpu/drm/nouveau/nouveau_drm.c
> > > +++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
> > > @@ -588,12 +588,6 @@ nouveau_drm_device_init(struct drm_device *dev)
> > >         if (ret)
> > >                 goto fail_dispctor;
> > >  
> > > -       if (dev->mode_config.num_crtc) {
> > > -               ret = nouveau_display_init(dev, false, false);
> > > -               if (ret)
> > > -                       goto fail_dispinit;
> > > -       }
> > > -
> > >         nouveau_debugfs_init(drm);
> > >         nouveau_hwmon_init(dev);
> > >         nouveau_svm_init(drm);
> > > @@ -601,6 +595,12 @@ nouveau_drm_device_init(struct drm_device *dev)
> > >         nouveau_fbcon_init(dev);
> > >         nouveau_led_init(dev);
> > >  
> > > +       if (dev->mode_config.num_crtc) {
> > > +               ret = nouveau_display_init(dev, false, false);
> > > +               if (ret)
> > > +                       goto fail_dispinit;
> > > +       }
> > > +
> > >         if (nouveau_pmops_runtime()) {
> > >                 pm_runtime_use_autosuspend(dev->dev);
> > >                 pm_runtime_set_autosuspend_delay(dev->dev, 5000);
> > > @@ -641,15 +641,14 @@ nouveau_drm_device_fini(struct drm_device *dev)
> > >                 pm_runtime_forbid(dev->dev);
> > >         }
> > >  
> > > +       if (dev->mode_config.num_crtc)
> > > +               nouveau_display_fini(dev, false, false);
> > >         nouveau_led_fini(dev);
> > >         nouveau_fbcon_fini(dev);
> > >         nouveau_dmem_fini(drm);
> > >         nouveau_svm_fini(drm);
> > >         nouveau_hwmon_fini(dev);
> > >         nouveau_debugfs_fini(drm);
> > > -
> > > -       if (dev->mode_config.num_crtc)
> > > -               nouveau_display_fini(dev, false, false);
> > >         nouveau_display_destroy(dev);
> > >  
> > >         nouveau_accel_fini(drm);
> > 

-- 
Cheers,
Lyude Paul (she/her)
Software Engineer at Red Hat

--=-jupczcBFoyxx2kZSvH9q
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html><head></head><body><div>On Mon, 2022-05-09 at 15:13 +0200, Mark Menzy=
nski wrote:</div><blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; bord=
er-left:2px #729fcf solid;padding-left:1ex"><div dir=3D"ltr"><div dir=3D"lt=
r">I think there are no direct issues with initialization in the state how =
it is now. I suspect it's because "drm_kms_helper_poll_enable()" starts the=
 first worker thread with a delay, which gives&nbsp;enough time to initiali=
ze required resources. I changed the initialization part to keep it consist=
ent with the finish&nbsp;part, which is the one causing troubles.</div></di=
v></blockquote><div><br></div><div>I think I may have misspoke on what the =
issue was here since I was about to leave work. The MST bit might not actua=
lly be an issue, however I think nouveau_fbcon_init() being called before n=
ouveau_display_init() would be an issue since nouveau_fbcon_init() can trig=
ger a modeset - and we can't perform modesets before nouveau_display_init()=
 has set things up.</div><div><br></div><div>Looking at the docs for drm_km=
s_helper_poll_disable() - I think the actual fix here (to ensure that we st=
ill call drm_kms_helper_poll_disable() at the right time during suspend) wo=
uld be to actually add another call to drm_kms_helper_poll_disable() into n=
ouveau_fbcon_fini() before we call nouveau_fbcon_accel_fini() and everythin=
g after. This should make sure that we stop the output polling work early o=
n driver unload, and since the docs mention that it's OK to disable polling=
 more then once with drm_kms_helper_poll_disable() I don't see any issues w=
ith that.</div><div><br></div><div><br></div><blockquote type=3D"cite" styl=
e=3D"margin:0 0 0 .8ex; border-left:2px #729fcf solid;padding-left:1ex"><di=
v dir=3D"ltr"><div dir=3D"ltr"><div><br></div><div>I am not sure where I co=
uld move "drm_kms_helper_poll_enable/disable()", since it is defined in "dr=
m/drm_probe_helper.c", which is only included in "nouveau_display.c" and "n=
ouveau_connector.c". Both creating a new function in "nouveau_display.c", a=
nd including "probe_helper.h" and using poll_enable in a different file lik=
e "nouveau_fbcon.c" seem like too big changes for such small&nbsp;fix. I do=
n't know.</div><div><br></div><div>Can this new proposed order break someth=
ing in the finish part as well? Maybe it would be just better to change the=
 order of "nouveau_drm_finish" and keep the current order of "noueau_drm_in=
it"?</div></div></div><div><br></div><div class=3D"gmail_quote"><div dir=3D=
"ltr" class=3D"gmail_attr">On Thu, May 5, 2022 at 9:57 PM Lyude Paul &lt;<a=
 href=3D"mailto:lyude@redhat.com">lyude@redhat.com</a>&gt; wrote:<br></div>=
<blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:2px #729f=
cf solid;padding-left:1ex"><div>Hmm, I think we might just need to move the=
 drm_kms_helper_poll_enable() call<br>to the end here instead of all of nou=
veau_display_init(). I realized this<br>because in nouveau_display_init() i=
t seems that we actually rely on<br>nouveau_display_init() to setup hotplug=
 interrupts - which we do actually need<br>this early on in the driver prob=
e process.<br></div><div><br>That being said though, drm_kms_helper_poll_en=
able() shouldn't be required for<br>MST short HPD IRQs from working so movi=
ng that instead should work.<br></div><div><br>On Wed, 2022-05-04 at 19:18 =
+0200, Mark Menzynski wrote:<br>&gt; Resources needed for output poll worke=
rs are destroyed in<br>&gt; nouveau_fbcon_fini() before output poll workers=
 are cleared in<br>&gt; nouveau_display_fini(). This means there is a time =
between fbcon_fini<br>&gt; and display_fini, where if output poll happens, =
it crashes.<br>&gt; <br>&gt; BUG: KASAN: use-after-free in<br>&gt; __drm_fb=
_helper_initial_config_and_unlock.cold+0x1f3/0x291<br>&gt; [drm_kms_helper]=
<br>&gt; <br>&gt; Cc: Ben Skeggs &lt;<a href=3D"mailto:bskeggs@redhat.com" =
target=3D"_blank">bskeggs@redhat.com</a>&gt;<br>&gt; Cc: Karol Herbst &lt;<=
a href=3D"mailto:kherbst@redhat.com" target=3D"_blank">kherbst@redhat.com</=
a>&gt;<br>&gt; Cc: Lyude Paul &lt;<a href=3D"mailto:lyude@redhat.com" targe=
t=3D"_blank">lyude@redhat.com</a>&gt;<br>&gt; Cc: David Airlie &lt;<a href=
=3D"mailto:airlied@linux.ie" target=3D"_blank">airlied@linux.ie</a>&gt;<br>=
&gt; Cc: Daniel Vetter &lt;<a href=3D"mailto:daniel@ffwll.ch" target=3D"_bl=
ank">daniel@ffwll.ch</a>&gt;<br>&gt; Cc: Sumit Semwal &lt;<a href=3D"mailto=
:sumit.semwal@linaro.org" target=3D"_blank">sumit.semwal@linaro.org</a>&gt;=
<br>&gt; Cc: "Christian K=C3=B6nig" &lt;<a href=3D"mailto:christian.koenig@=
amd.com" target=3D"_blank">christian.koenig@amd.com</a>&gt;<br>&gt; Cc: <a =
href=3D"mailto:dri-devel@lists.freedesktop.org" target=3D"_blank">dri-devel=
@lists.freedesktop.org</a><br>&gt; Cc: <a href=3D"mailto:nouveau@lists.free=
desktop.org" target=3D"_blank">nouveau@lists.freedesktop.org</a><br>&gt; Cc=
: <a href=3D"mailto:linux-kernel@vger.kernel.org" target=3D"_blank">linux-k=
ernel@vger.kernel.org</a><br>&gt; Cc: <a href=3D"mailto:linux-media@vger.ke=
rnel.org" target=3D"_blank">linux-media@vger.kernel.org</a><br>&gt; Cc: <a =
href=3D"mailto:linaro-mm-sig@lists.linaro.org" target=3D"_blank">linaro-mm-=
sig@lists.linaro.org</a><br>&gt; Signed-off-by: Mark Menzynski &lt;<a href=
=3D"mailto:mmenzyns@redhat.com" target=3D"_blank">mmenzyns@redhat.com</a>&g=
t;<br>&gt; ---<br>&gt; &nbsp;drivers/gpu/drm/nouveau/nouveau_drm.c | 17 +++=
+++++---------<br>&gt; &nbsp;1 file changed, 8 insertions(+), 9 deletions(-=
)<br>&gt; <br>&gt; diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c<br>&g=
t; b/drivers/gpu/drm/nouveau/nouveau_drm.c<br>&gt; index 561309d447e0..773e=
fdd20d2f 100644<br>&gt; --- a/drivers/gpu/drm/nouveau/nouveau_drm.c<br>&gt;=
 +++ b/drivers/gpu/drm/nouveau/nouveau_drm.c<br>&gt; @@ -588,12 +588,6 @@ n=
ouveau_drm_device_init(struct drm_device *dev)<br>&gt; &nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;if (ret)<br>&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;goto fail=
_dispctor;<br>&gt; &nbsp;<br>&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;if (dev-&gt;mode_config.num_crtc) {<br>&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ret =3D nouve=
au_display_init(dev, false, false);<br>&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if (ret)<br>&gt=
; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;goto fail=
_dispinit;<br>&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br>&gt; -<b=
r>&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;nouveau_debugfs_init=
(drm);<br>&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;nouveau_hwmo=
n_init(dev);<br>&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;nouvea=
u_svm_init(drm);<br>&gt; @@ -601,6 +595,12 @@ nouveau_drm_device_init(struc=
t drm_device *dev)<br>&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
nouveau_fbcon_init(dev);<br>&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;nouveau_led_init(dev);<br>&gt; &nbsp;<br>&gt; +&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;if (dev-&gt;mode_config.num_crtc) {<br>&gt; +&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;ret =3D nouveau_display_init(dev, false, false);<br>&gt; +&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;if (ret)<br>&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;goto fail_dispinit;<br>&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;}<br>&gt; +<br>&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if=
 (nouveau_pmops_runtime()) {<br>&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;pm_runtime_use_au=
tosuspend(dev-&gt;dev);<br>&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;pm_runtime_set_autosus=
pend_delay(dev-&gt;dev, 5000);<br>&gt; @@ -641,15 +641,14 @@ nouveau_drm_de=
vice_fini(struct drm_device *dev)<br>&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;pm_runtime_f=
orbid(dev-&gt;dev);<br>&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;}<br>&gt; &nbsp;<br>&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if (de=
v-&gt;mode_config.num_crtc)<br>&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;nouveau_display_fini(de=
v, false, false);<br>&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;n=
ouveau_led_fini(dev);<br>&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;nouveau_fbcon_fini(dev);<br>&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;nouveau_dmem_fini(drm);<br>&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;nouveau_svm_fini(drm);<br>&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;nouveau_hwmon_fini(dev);<br>&gt; &nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;nouveau_debugfs_fini(drm);<br>&gt; -<br>&gt; -&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if (dev-&gt;mode_config.num_crtc)<br>&=
gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;nouveau_display_fini(dev, false, false);<br>&gt; &nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;nouveau_display_destroy(dev);<br>=
&gt; &nbsp;<br>&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;nouveau=
_accel_fini(drm);<br></div><div><br></div></blockquote></div></blockquote><=
div><br></div><div><span><pre>-- <br></pre><div data-evo-paragraph=3D"" cla=
ss=3D"" style=3D"width: 78ch;" data-evo-signature-plain-text-mode=3D"">Chee=
rs,</div><div data-evo-paragraph=3D"" class=3D"" style=3D"width: 78ch;"><sp=
an class=3D"Apple-tab-span" style=3D"white-space:pre">=09</span>Lyude Paul =
(she/her)</div><div data-evo-paragraph=3D"" class=3D"" style=3D"width: 78ch=
;"><span class=3D"Apple-tab-span" style=3D"white-space:pre">=09</span>Softw=
are Engineer at Red Hat</div></span></div></body></html>

--=-jupczcBFoyxx2kZSvH9q--

