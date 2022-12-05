Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B3D86425D9
	for <lists+dri-devel@lfdr.de>; Mon,  5 Dec 2022 10:33:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E367610E193;
	Mon,  5 Dec 2022 09:32:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com
 [209.85.217.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7595910E19C
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Dec 2022 09:32:52 +0000 (UTC)
Received: by mail-vs1-f42.google.com with SMTP id 128so10457373vsz.12
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Dec 2022 01:32:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5WjWm4mT5d+bOtCxjalDZGNLwLUCBWsAmUV8uCrJzAI=;
 b=WbCeWA5NQKgpmqzqWyRSdjxMmjBG/vuSqFvDprutM49kTLzynt8VOCa5cabQCGIw1w
 GmNVIWoURO9wvaltCexKPKieIPueLsqDcHUnl3kQprF7/gUvKytv5qLQyMBL8p4jif0T
 ajBHZIz8ATmPXRQd94FrOIu3CJaiGaXfkm0hHVCkctnWKyGjs9ZfdS5YrAQGKFfb3VPh
 LnnbqYQ/ACii4yuJm7HC2Ihg0Rykdw4HnUk7hmyNj5XsNHBEzlVCdZEpbRXaSHVyglx2
 ORpneKz55FOCefQcI81tuqRhjDukW6AKEIhwvp39FbxrftfdDd0OxwV5yqyPOw7AoB4O
 EIAQ==
X-Gm-Message-State: ANoB5pk/Ug4ieYoR9I1uzuLUM7wy4mdi9mkmUrhiGM1PuaaKv02ln/J8
 3h2oEYyzSq2jLUp4IwouFlKm8pA/pviCaA==
X-Google-Smtp-Source: AA0mqf7VvpnvTdmKGviBhKaNHr7tmE9PjYiF/AMWHYiCMUE++50EkHfEtM9S89hp4W+hfmeOzz9VaA==
X-Received: by 2002:a05:6102:acc:b0:3b1:17fa:8c6f with SMTP id
 m12-20020a0561020acc00b003b117fa8c6fmr6818591vsh.87.1670232771318; 
 Mon, 05 Dec 2022 01:32:51 -0800 (PST)
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com.
 [209.85.221.174]) by smtp.gmail.com with ESMTPSA id
 c8-20020a67e008000000b003b0c19d7cbdsm1939265vsl.17.2022.12.05.01.32.50
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Dec 2022 01:32:50 -0800 (PST)
Received: by mail-vk1-f174.google.com with SMTP id u9so5036714vkk.4
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Dec 2022 01:32:50 -0800 (PST)
X-Received: by 2002:a1f:e281:0:b0:3b8:26be:f5c0 with SMTP id
 z123-20020a1fe281000000b003b826bef5c0mr41031196vkg.17.1670232770146; Mon, 05
 Dec 2022 01:32:50 -0800 (PST)
MIME-Version: 1.0
References: <CAEdEoBYXHq9cCzsbMYTpG1B41Yz=-QAjFx7bJDOnPanN5Tmo7A@mail.gmail.com>
 <20221204175142.658d5c37.alex.williamson@redhat.com>
 <1e4d62cf-8893-0bff-51f5-5a2e419ed5a0@suse.de>
In-Reply-To: <1e4d62cf-8893-0bff-51f5-5a2e419ed5a0@suse.de>
From: "mb@lab.how" <mb@lab.how>
Date: Mon, 5 Dec 2022 02:32:38 -0700
X-Gmail-Original-Message-ID: <CAEdEoBYZa9cg0nq=P7EDsDS9m2EKYrd8M8ucqi8U0Csj0mtjDg@mail.gmail.com>
Message-ID: <CAEdEoBYZa9cg0nq=P7EDsDS9m2EKYrd8M8ucqi8U0Csj0mtjDg@mail.gmail.com>
Subject: Re: [PATCH 2/2] vfio/pci: Remove console drivers
To: Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: multipart/alternative; boundary="000000000000f4f94a05ef115eda"
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
Cc: kvm@vger.kernel.org, airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Alex Williamson <alex.williamson@redhat.com>,
 kraxel@redhat.com, lersek@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--000000000000f4f94a05ef115eda
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I have a rtx 3070 and a 3090, I am absolutely sure I am binding vfio-pci to
the 3090 and not the 3070.

I have bound the driver in two different ways, first by passing the IDs to
the module and alternatively by manipulating the system interface and use
the override (this is what I originally had to do when I used two 1080s, so
I know it works).

While the 3090 doesn't show a console, there's a remnant from the refund
(and grub previously) there.

The assessment Alex made previously, where
aperture_remove_conflicting_pci_devices() is removing the driver (EFIFB)
instead of the device seems correct, but it could also can be a quirky of
how EFIFB is implemented. I recall reading a long time ago that EFIFB is a
special device and once it detects changes it would simply give up. There
was also no way to attach a device to it again as it depends on being
preloaded outside the kernel; once something takes over the buffer
reinitializing is "impossible". I never went deeper to try and understand
it.


On Mon, Dec 5, 2022, 2:00 AM Thomas Zimmermann <tzimmermann@suse.de> wrote:

> Hi
>
> Am 05.12.22 um 01:51 schrieb Alex Williamson:
> > On Sat, 3 Dec 2022 17:12:38 -0700
> > "mb@lab.how" <mb@lab.how> wrote:
> >
> >> Hi,
> >>
> >> I hope it is ok to reply to this old thread.
> >
> > It is, but the only relic of the thread is the subject.  For reference,
> > the latest version of this posted is here:
> >
> > https://lore.kernel.org/all/20220622140134.12763-4-tzimmermann@suse.de/
> >
> > Which is committed as:
> >
> > d17378062079 ("vfio/pci: Remove console drivers")
> >
> >> Unfortunately, I found a
> >> problem only now after upgrading to 6.0.
> >>
> >> My setup has multiple GPUs (2), and I depend on EFIFB to have a workin=
g
> console.
>
> Which GPUs do you have?
>
> >> pre-patch behavior, when I bind the vfio-pci to my secondary GPU both
> >> the passthrough and the EFIFB keep working fine.
> >> post-patch behavior, when I bind the vfio-pci to the secondary GPU,
> >> the EFIFB disappears from the system, binding the console to the
> >> "dummy console".
>
> The efifb would likely use the first GPU. And vfio-pci should only
> remove the generic driver from the second device. Are you sure that
> you're not somehow using the first GPU with vfio-pci.
>
> >> Whenever you try to access the terminal, you have the screen stuck in
> >> whatever was the last buffer content, which gives the impression of
> >> "freezing," but I can still type.
> >> Everything else works, including the passthrough.
> >
> > This sounds like the call to aperture_remove_conflicting_pci_devices()
> > is removing the conflicting driver itself rather than removing the
> > device from the driver.  Is it not possible to unbind the GPU from
> > efifb before binding the GPU to vfio-pci to effectively nullify the
> > added call?
> >
> >> I can only think about a few options:
> >>
> >> - Is there a way to have EFIFB show up again? After all it looks like
> >> the kernel has just abandoned it, but the buffer is still there. I
> >> can't find a single message about the secondary card and EFIFB in
> >> dmesg, but there's a message for the primary card and EFIFB.
> >> - Can we have a boolean controlling the behavior of vfio-pci
> >> altogether or at least controlling the behavior of vfio-pci for that
> >> specific ID? I know there's already some option for vfio-pci and VGA
> >> cards, would it be appropriate to attach this behavior to that option?
> >
> > I suppose we could have an opt-out module option on vfio-pci to skip
> > the above call, but clearly it would be better if things worked by
> > default.  We cannot make full use of GPUs with vfio-pci if they're
> > still in use by host console drivers.  The intention was certainly to
> > unbind the device from any low level drivers rather than disable use of
> > a console driver entirely.  DRM/GPU folks, is that possibly an
> > interface we could implement?  Thanks,
>
> When vfio-pci gives the GPU device to the guest, which driver driver is
> bound to it?
>
> Best regards
> Thomas
>
> >
> > Alex
> >
>
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
> (HRB 36809, AG N=C3=BCrnberg)
> Gesch=C3=A4ftsf=C3=BChrer: Ivo Totev
>
>

--000000000000f4f94a05ef115eda
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">I have a rtx 3070 and a 3090, I am absolutely sure I am b=
inding vfio-pci to the 3090 and not the 3070.<div dir=3D"auto"><br></div><d=
iv dir=3D"auto">I have bound the driver in two different ways, first by pas=
sing the IDs to the module and alternatively by manipulating the system int=
erface and use the override (this is what I originally had to do when I use=
d two 1080s, so I know it works).</div><div dir=3D"auto"><br></div><div dir=
=3D"auto">While the 3090 doesn&#39;t show a console, there&#39;s a remnant =
from the refund (and grub previously) there.<br><div dir=3D"auto"><br></div=
><div dir=3D"auto">The assessment Alex made previously, where aperture_remo=
ve_conflicting_pci_devices() is removing the driver (EFIFB) instead of the =
device seems correct, but it could also can be a quirky of how EFIFB is imp=
lemented. I recall reading a long time ago that EFIFB is a special device a=
nd once it detects changes it would simply give up. There was also no way t=
o attach a device to it again as it depends on being preloaded outside the =
kernel; once something takes over the buffer reinitializing is &quot;imposs=
ible&quot;. I never went deeper to try and understand it.</div></div><br><b=
r><div class=3D"gmail_quote" dir=3D"auto"><div dir=3D"ltr" class=3D"gmail_a=
ttr">On Mon, Dec 5, 2022, 2:00 AM Thomas Zimmermann &lt;<a href=3D"mailto:t=
zimmermann@suse.de">tzimmermann@suse.de</a>&gt; wrote:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc soli=
d;padding-left:1ex">Hi<br>
<br>
Am 05.12.22 um 01:51 schrieb Alex Williamson:<br>
&gt; On Sat, 3 Dec 2022 17:12:38 -0700<br>
&gt; &quot;mb@lab.how&quot; &lt;mb@lab.how&gt; wrote:<br>
&gt; <br>
&gt;&gt; Hi,<br>
&gt;&gt;<br>
&gt;&gt; I hope it is ok to reply to this old thread.<br>
&gt; <br>
&gt; It is, but the only relic of the thread is the subject.=C2=A0 For refe=
rence,<br>
&gt; the latest version of this posted is here:<br>
&gt; <br>
&gt; <a href=3D"https://lore.kernel.org/all/20220622140134.12763-4-tzimmerm=
ann@suse.de/" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lore.=
kernel.org/all/20220622140134.12763-4-tzimmermann@suse.de/</a><br>
&gt; <br>
&gt; Which is committed as:<br>
&gt; <br>
&gt; d17378062079 (&quot;vfio/pci: Remove console drivers&quot;)<br>
&gt; <br>
&gt;&gt; Unfortunately, I found a<br>
&gt;&gt; problem only now after upgrading to 6.0.<br>
&gt;&gt;<br>
&gt;&gt; My setup has multiple GPUs (2), and I depend on EFIFB to have a wo=
rking console.<br>
<br>
Which GPUs do you have?<br>
<br>
&gt;&gt; pre-patch behavior, when I bind the vfio-pci to my secondary GPU b=
oth<br>
&gt;&gt; the passthrough and the EFIFB keep working fine.<br>
&gt;&gt; post-patch behavior, when I bind the vfio-pci to the secondary GPU=
,<br>
&gt;&gt; the EFIFB disappears from the system, binding the console to the<b=
r>
&gt;&gt; &quot;dummy console&quot;.<br>
<br>
The efifb would likely use the first GPU. And vfio-pci should only <br>
remove the generic driver from the second device. Are you sure that <br>
you&#39;re not somehow using the first GPU with vfio-pci.<br>
<br>
&gt;&gt; Whenever you try to access the terminal, you have the screen stuck=
 in<br>
&gt;&gt; whatever was the last buffer content, which gives the impression o=
f<br>
&gt;&gt; &quot;freezing,&quot; but I can still type.<br>
&gt;&gt; Everything else works, including the passthrough.<br>
&gt; <br>
&gt; This sounds like the call to aperture_remove_conflicting_pci_devices()=
<br>
&gt; is removing the conflicting driver itself rather than removing the<br>
&gt; device from the driver.=C2=A0 Is it not possible to unbind the GPU fro=
m<br>
&gt; efifb before binding the GPU to vfio-pci to effectively nullify the<br=
>
&gt; added call?<br>
&gt;=C2=A0 =C2=A0<br>
&gt;&gt; I can only think about a few options:<br>
&gt;&gt;<br>
&gt;&gt; - Is there a way to have EFIFB show up again? After all it looks l=
ike<br>
&gt;&gt; the kernel has just abandoned it, but the buffer is still there. I=
<br>
&gt;&gt; can&#39;t find a single message about the secondary card and EFIFB=
 in<br>
&gt;&gt; dmesg, but there&#39;s a message for the primary card and EFIFB.<b=
r>
&gt;&gt; - Can we have a boolean controlling the behavior of vfio-pci<br>
&gt;&gt; altogether or at least controlling the behavior of vfio-pci for th=
at<br>
&gt;&gt; specific ID? I know there&#39;s already some option for vfio-pci a=
nd VGA<br>
&gt;&gt; cards, would it be appropriate to attach this behavior to that opt=
ion?<br>
&gt; <br>
&gt; I suppose we could have an opt-out module option on vfio-pci to skip<b=
r>
&gt; the above call, but clearly it would be better if things worked by<br>
&gt; default.=C2=A0 We cannot make full use of GPUs with vfio-pci if they&#=
39;re<br>
&gt; still in use by host console drivers.=C2=A0 The intention was certainl=
y to<br>
&gt; unbind the device from any low level drivers rather than disable use o=
f<br>
&gt; a console driver entirely.=C2=A0 DRM/GPU folks, is that possibly an<br=
>
&gt; interface we could implement?=C2=A0 Thanks,<br>
<br>
When vfio-pci gives the GPU device to the guest, which driver driver is <br=
>
bound to it?<br>
<br>
Best regards<br>
Thomas<br>
<br>
&gt; <br>
&gt; Alex<br>
&gt; <br>
<br>
-- <br>
Thomas Zimmermann<br>
Graphics Driver Developer<br>
SUSE Software Solutions Germany GmbH<br>
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany<br>
(HRB 36809, AG N=C3=BCrnberg)<br>
Gesch=C3=A4ftsf=C3=BChrer: Ivo Totev<br><br>
</blockquote></div></div>

--000000000000f4f94a05ef115eda--
