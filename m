Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8562B09237
	for <lists+dri-devel@lfdr.de>; Thu, 17 Jul 2025 18:50:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72C6510E314;
	Thu, 17 Jul 2025 16:50:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="PkcAErbV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com
 [209.85.160.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6524F10E314
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jul 2025 16:50:52 +0000 (UTC)
Received: by mail-qt1-f180.google.com with SMTP id
 d75a77b69052e-4a9bff7fc6dso11078191cf.1
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jul 2025 09:50:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1752771051; x=1753375851;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=JeTaPd6gA33kgwmSLiIVpYR7sNsxhlAXnjzAP4oSrZ4=;
 b=PkcAErbVdTdBtyC4FtCKirX2E+7e/KTuFE9UJJvoWgIwGCiLIUmYN0LdDnVftAfSDM
 kMLmEqcyYwkt+bq6Eb87pETsioDgMH6+AyYBmTI4fpT9ANRXDX3XOz7ogXlNLWKFmZvD
 Vl/PNCKLMctjWpPjRHLLJZ9ovLrk/jE73fNv1NNKMNP5v1SymMtjY7sQptU4wf62dzNa
 /Nj1Fw+nRU4LRkFOZPI8w35mMW9N4gGYvVAhixhIyJUQTEnXbn5f5tbYaROCB5+JVBQI
 /huRPCb/4+47xDfDkGZ3TItb0hbmjWu0Sn4rEwnsJDsoRFmH2wfzlg1Y6SPcqBfy+2bH
 cgpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752771051; x=1753375851;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JeTaPd6gA33kgwmSLiIVpYR7sNsxhlAXnjzAP4oSrZ4=;
 b=kMGT2iGHr/i/uuuRi3gbr32fTLh1TthFKLAga+y5oJuOaHnq0yCVnRhYtUFspOaJip
 aVaS7mOfZZkGiswfOIgTsKoCdcOD9Dw3BfTfB5+ModT5UlOzDcodJvCbp6j1q0ZBpf6a
 l2IOW51z5jpbvWDKffRW0TjVahzmBHb8imfUdlTk22I4RneldZc1sLXKJBDYIss+hhPO
 5V9BYKb3Iv3iaZsFB2beC6oKPNvwjknAsY8LR9rgCk2WMwwjmkVGAtFgyB2zJ/hvXUgn
 ZRbjLT0xTlnAu66rLNdZoWvdC2ItWl7c139nJ8V12LGs3weBZkbVgLldg9+viq35+pPs
 NOUg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVMs3PWIV7T5/kWgv0R0CGgLASKubJXhYcNvFiTbT9t5b6Qy9A7FNV4uEA7q3bTtsh5AIUtunaxxCQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxxIAt6ZCHv970YGN4wM+CzbxJ33grBAmQb6zBOFx/AUScOdCWh
 OubKev1UlmfTWs1v9AZzj/hjH5ozr4ITf4wY6HTAKeN292cwhdQFeoXgbf/JBajw0mZQtkv70vv
 3JWbLku/M1qbCU0ldRtanOAaTmf5KA51QIKYmf8M2
X-Gm-Gg: ASbGnctvsiIMrBjvEzh2rFksr13ZWON0rWq5XhGGlpnZLaIsS/LoH7Jb1uhK5LUTfVc
 f4fm60RA/CMNIapEmOfpwPcrbvI0adqX/xPCpFndkYnIWjR6c70xXb2nvTTLjESvciYKEMZn+T+
 r3FuFCKXSa0eUmmEAMcekwNzvj5pN//uhGplcJpdaAvGZSf/L+frO0QSjBpAkrko+1Fh1jnIMbX
 4ZCyINoPy/UVB37p8ejeRlE76c44ihfMlrxDg==
X-Google-Smtp-Source: AGHT+IFDYfZkpJfNTe1FGUsMivMVFyOU7JmJmlvr9EN20TBcUKybHFE8rLsTDQkdY+IkQIWlFeqn4dMYbia70iU0AHE=
X-Received: by 2002:a05:622a:a0e:b0:4ab:731a:541c with SMTP id
 d75a77b69052e-4abb0787445mr10505161cf.2.1752771050837; Thu, 17 Jul 2025
 09:50:50 -0700 (PDT)
MIME-Version: 1.0
References: <20250507135431.53907-1-jose.exposito89@gmail.com>
 <57e425ff-2731-47d7-b5ce-c34f5baf71b4@bootlin.com>
In-Reply-To: <57e425ff-2731-47d7-b5ce-c34f5baf71b4@bootlin.com>
From: Mark Yacoub <markyacoub@google.com>
Date: Thu, 17 Jul 2025 12:50:39 -0400
X-Gm-Features: Ac12FXxyWiHTGgH3dSPxPMbKtrIG9bN3tpoHzxBDEvXodGepyRS1gls-Bvwv0YA
Message-ID: <CAC0gqY6ZH8h5aoNh31ck3dP6c3YYtfTRjJ47Obu6xSXSVXm5mA@mail.gmail.com>
Subject: Re: [PATCH v5 00/16] drm/vkms: Add configfs support
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>, 
 tzimmermann@suse.de, mripard@kernel.org, simona@ffwll.ch, 
 sebastian.wick@redhat.com, victoria@system76.com, xaver.hugl@kde.org, 
 hamohammed.sa@gmail.com, melissa.srw@gmail.com, 
 maarten.lankhorst@linux.intel.com, airlied@gmail.com, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: multipart/alternative; boundary="000000000000dc2b93063a22cf3c"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--000000000000dc2b93063a22cf3c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Merged into Android tree:
https://android-review.git.corp.google.com/c/kernel/common-modules/virtual-=
device/+/3661920
I'm able to use configfs as expected.

Tested-by: Mark Yacoub <markyacoub@google.com>

On Thu, Jul 17, 2025 at 12:37=E2=80=AFPM Louis Chauvet <louis.chauvet@bootl=
in.com>
wrote:

> +CC: Mark (Google), Sebastian (Mutter), Xaver (KWin), Victoria (Cosmic)
>
> Hi everyone,
>
> Last week, I presented this work at the Display Next Hackfest, and the
> feedback from compositors was very positive. At least KWin, Mutter, and
> Cosmic are interested in integrating it into their tests, so it would be
> great if someone could review it.
>
> Sebastian quickly tested this work (using [2] for full features) with
> their existing VKMS tests [1], and it worked. From what I understand,
> the tests are quite basic =E2=80=94just sanity checks=E2=80=94 but we wer=
e able to
> reproduce the default vkms device using ConfigFS.
>
> If another compositor wants to test the ConfigFS interface (I will try
> to keep [2] updated), that would be amazing. Feel free to send feedback!
>
> A small note: This series has a minor conflict since the conversion to
> the faux device, but it can be applied using `b4 am -3 ... && git am -3
> ...`.
> @jos=C3=A9, if you send a new iteration, can you add markyacoub@google.co=
m in
> copy, and maybe Sebastian, Xaver, Victoria if they want to follow the
> upstreaming?
>
> Thank you,
> Louis Chauvet
>
> [1]:
> https://gitlab.gnome.org/swick/mutter/-/commit/88a7354942d9728dae06fb83cc=
4f2d2c7b08b694
> [2]:https://github.com/Fomys/linux/tree/configfs-everything
>
>
>
> Le 07/05/2025 =C3=A0 15:54, Jos=C3=A9 Exp=C3=B3sito a =C3=A9crit :
> > Hi everyone,
> >
> > This series allow to configure one or more VKMS instances without havin=
g
> > to reload the driver using configfs.
> >
> > The series is structured in 3 blocks:
> >
> >    - Patches 1..11: Basic device configuration. For simplicity, I kept
> the
> >      available options as minimal as possible.
> >
> >    - Patches 12 and 13: New option to skip the default device creation
> and to-do
> >      cleanup.
> >
> >    - Patches 14, 15 and 16: Allow to hot-plug and unplug connectors.
> This is not
> >      part of the minimal set of options, but I included in this series
> so it can
> >      be used as a template/example of how new configurations can be
> added.
> >
> > The process of configuring a VKMS device is documented in "vkms.rst".
> >
> > Finally, the code is thoroughly tested by a collection of IGT tests [1]=
.
> >
> > Best wishes,
> > Jos=C3=A9 Exp=C3=B3sito
> >
> > [1]
> https://lists.freedesktop.org/archives/igt-dev/2025-February/086071.html
> >
> > Changes in v5:
> >
> >    - Added Reviewed-by tags, thanks Louis!
> >    - Rebased on top of drm-misc-next
> >    - Link to v4:
> https://lore.kernel.org/dri-devel/20250407081425.6420-1-jose.exposito89@g=
mail.com/
> >
> > Changes in v4:
> >
> >    - Since Louis and I worked on this together, set him as the author o=
f
> some of
> >      the patches and me as co-developed-by to reflect this joint effort=
.
> >    - Rebased on top of drm-misc-next
> >    - Link to v3:
> https://lore.kernel.org/all/20250307163353.5896-1-jose.exposito89@gmail.c=
om/
> >
> > Changes in v3:
> >
> >    - Applied review comments by Louis Chauvet: (thanks!!)
> >      - Use scoped_guard() instead of guard(mutex)(...)
> >      - Fix a use-after-free error in the connector hot-plug code
> >    - Rebased on top of drm-misc-next
> >    - Link to v2:
> https://lore.kernel.org/all/20250225175936.7223-1-jose.exposito89@gmail.c=
om/
> >
> > Changes in v2:
> >
> >    - Applied review comments by Louis Chauvet:
> >      - Use guard(mutex)(...) instead of lock/unlock
> >      - Return -EBUSY when trying to modify a enabled device
> >      - Move the connector hot-plug related patches to the end
> >    - Rebased on top of drm-misc-next
> >    - Link to v1:
> https://lore.kernel.org/dri-devel/20250218170808.9507-1-jose.exposito89@g=
mail.com/T/
> >
> > Jos=C3=A9 Exp=C3=B3sito (6):
> >    drm/vkms: Expose device creation and destruction
> >    drm/vkms: Allow to configure the default device creation
> >    drm/vkms: Remove completed task from the TODO list
> >    drm/vkms: Allow to configure connector status
> >    drm/vkms: Allow to update the connector status
> >    drm/vkms: Allow to configure connector status via configfs
> >
> > Louis Chauvet (10):
> >    drm/vkms: Add and remove VKMS instances via configfs
> >    drm/vkms: Allow to configure multiple planes via configfs
> >    drm/vkms: Allow to configure the plane type via configfs
> >    drm/vkms: Allow to configure multiple CRTCs via configfs
> >    drm/vkms: Allow to configure CRTC writeback support via configfs
> >    drm/vkms: Allow to attach planes and CRTCs via configfs
> >    drm/vkms: Allow to configure multiple encoders via configfs
> >    drm/vkms: Allow to attach encoders and CRTCs via configfs
> >    drm/vkms: Allow to configure multiple connectors via configfs
> >    drm/vkms: Allow to attach connectors and encoders via configfs
> >
> >   Documentation/gpu/vkms.rst                    | 100 ++-
> >   drivers/gpu/drm/vkms/Kconfig                  |   1 +
> >   drivers/gpu/drm/vkms/Makefile                 |   3 +-
> >   drivers/gpu/drm/vkms/tests/vkms_config_test.c |  24 +
> >   drivers/gpu/drm/vkms/vkms_config.c            |   8 +-
> >   drivers/gpu/drm/vkms/vkms_config.h            |  26 +
> >   drivers/gpu/drm/vkms/vkms_configfs.c          | 833 +++++++++++++++++=
+
> >   drivers/gpu/drm/vkms/vkms_configfs.h          |   8 +
> >   drivers/gpu/drm/vkms/vkms_connector.c         |  35 +
> >   drivers/gpu/drm/vkms/vkms_connector.h         |   9 +
> >   drivers/gpu/drm/vkms/vkms_drv.c               |  18 +-
> >   drivers/gpu/drm/vkms/vkms_drv.h               |  20 +
> >   12 files changed, 1072 insertions(+), 13 deletions(-)
> >   create mode 100644 drivers/gpu/drm/vkms/vkms_configfs.c
> >   create mode 100644 drivers/gpu/drm/vkms/vkms_configfs.h
> >
> >
> > base-commit: a6c0a91ccb257eaec2aee080df06863ce7601315
>
> --
> Louis Chauvet, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
>

--000000000000dc2b93063a22cf3c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Merged into Android tree:=C2=A0<a href=3D"https://and=
roid-review.git.corp.google.com/c/kernel/common-modules/virtual-device/+/36=
61920">https://android-review.git.corp.google.com/c/kernel/common-modules/v=
irtual-device/+/3661920</a></div><div>I&#39;m able to use configfs as expec=
ted.</div><div><br></div><div>Tested-by: Mark Yacoub &lt;<a href=3D"mailto:=
markyacoub@google.com">markyacoub@google.com</a>&gt;</div><br><div class=3D=
"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">O=
n Thu, Jul 17, 2025 at 12:37=E2=80=AFPM Louis Chauvet &lt;<a href=3D"mailto=
:louis.chauvet@bootlin.com">louis.chauvet@bootlin.com</a>&gt; wrote:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">+CC: Mark (Google), Se=
bastian (Mutter), Xaver (KWin), Victoria (Cosmic)<br>
<br>
Hi everyone,<br>
<br>
Last week, I presented this work at the Display Next Hackfest, and the <br>
feedback from compositors was very positive. At least KWin, Mutter, and <br=
>
Cosmic are interested in integrating it into their tests, so it would be <b=
r>
great if someone could review it.<br>
<br>
Sebastian quickly tested this work (using [2] for full features) with <br>
their existing VKMS tests [1], and it worked. From what I understand, <br>
the tests are quite basic =E2=80=94just sanity checks=E2=80=94 but we were =
able to <br>
reproduce the default vkms device using ConfigFS.<br>
<br>
If another compositor wants to test the ConfigFS interface (I will try <br>
to keep [2] updated), that would be amazing. Feel free to send feedback!<br=
>
<br>
A small note: This series has a minor conflict since the conversion to <br>
the faux device, but it can be applied using `b4 am -3 ... &amp;&amp; git a=
m -3 <br>
...`.<br>
@jos=C3=A9, if you send a new iteration, can you add <a href=3D"mailto:mark=
yacoub@google.com" target=3D"_blank">markyacoub@google.com</a> in <br>
copy, and maybe Sebastian, Xaver, Victoria if they want to follow the <br>
upstreaming?<br>
<br>
Thank you,<br>
Louis Chauvet<br>
<br>
[1]:<a href=3D"https://gitlab.gnome.org/swick/mutter/-/commit/88a7354942d97=
28dae06fb83cc4f2d2c7b08b694" rel=3D"noreferrer" target=3D"_blank">https://g=
itlab.gnome.org/swick/mutter/-/commit/88a7354942d9728dae06fb83cc4f2d2c7b08b=
694</a><br>
[2]:<a href=3D"https://github.com/Fomys/linux/tree/configfs-everything" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/Fomys/linux/tree/confi=
gfs-everything</a><br>
<br>
<br>
<br>
Le 07/05/2025 =C3=A0 15:54, Jos=C3=A9 Exp=C3=B3sito a =C3=A9crit=C2=A0:<br>
&gt; Hi everyone,<br>
&gt; <br>
&gt; This series allow to configure one or more VKMS instances without havi=
ng<br>
&gt; to reload the driver using configfs.<br>
&gt; <br>
&gt; The series is structured in 3 blocks:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 - Patches 1..11: Basic device configuration. For simplici=
ty, I kept the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 available options as minimal as possible.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 - Patches 12 and 13: New option to skip the default devic=
e creation and to-do<br>
&gt;=C2=A0 =C2=A0 =C2=A0 cleanup.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 - Patches 14, 15 and 16: Allow to hot-plug and unplug con=
nectors. This is not<br>
&gt;=C2=A0 =C2=A0 =C2=A0 part of the minimal set of options, but I included=
 in this series so it can<br>
&gt;=C2=A0 =C2=A0 =C2=A0 be used as a template/example of how new configura=
tions can be added.<br>
&gt; <br>
&gt; The process of configuring a VKMS device is documented in &quot;vkms.r=
st&quot;.<br>
&gt; <br>
&gt; Finally, the code is thoroughly tested by a collection of IGT tests [1=
].<br>
&gt; <br>
&gt; Best wishes,<br>
&gt; Jos=C3=A9 Exp=C3=B3sito<br>
&gt; <br>
&gt; [1] <a href=3D"https://lists.freedesktop.org/archives/igt-dev/2025-Feb=
ruary/086071.html" rel=3D"noreferrer" target=3D"_blank">https://lists.freed=
esktop.org/archives/igt-dev/2025-February/086071.html</a><br>
&gt; <br>
&gt; Changes in v5:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 - Added Reviewed-by tags, thanks Louis!<br>
&gt;=C2=A0 =C2=A0 - Rebased on top of drm-misc-next<br>
&gt;=C2=A0 =C2=A0 - Link to v4: <a href=3D"https://lore.kernel.org/dri-deve=
l/20250407081425.6420-1-jose.exposito89@gmail.com/" rel=3D"noreferrer" targ=
et=3D"_blank">https://lore.kernel.org/dri-devel/20250407081425.6420-1-jose.=
exposito89@gmail.com/</a><br>
&gt; <br>
&gt; Changes in v4:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 - Since Louis and I worked on this together, set him as t=
he author of some of<br>
&gt;=C2=A0 =C2=A0 =C2=A0 the patches and me as co-developed-by to reflect t=
his joint effort.<br>
&gt;=C2=A0 =C2=A0 - Rebased on top of drm-misc-next<br>
&gt;=C2=A0 =C2=A0 - Link to v3: <a href=3D"https://lore.kernel.org/all/2025=
0307163353.5896-1-jose.exposito89@gmail.com/" rel=3D"noreferrer" target=3D"=
_blank">https://lore.kernel.org/all/20250307163353.5896-1-jose.exposito89@g=
mail.com/</a><br>
&gt; <br>
&gt; Changes in v3:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 - Applied review comments by Louis Chauvet: (thanks!!)<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 - Use scoped_guard() instead of guard(mutex)(...)<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 - Fix a use-after-free error in the connector hot-=
plug code<br>
&gt;=C2=A0 =C2=A0 - Rebased on top of drm-misc-next<br>
&gt;=C2=A0 =C2=A0 - Link to v2: <a href=3D"https://lore.kernel.org/all/2025=
0225175936.7223-1-jose.exposito89@gmail.com/" rel=3D"noreferrer" target=3D"=
_blank">https://lore.kernel.org/all/20250225175936.7223-1-jose.exposito89@g=
mail.com/</a><br>
&gt; <br>
&gt; Changes in v2:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 - Applied review comments by Louis Chauvet:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 - Use guard(mutex)(...) instead of lock/unlock<br>
&gt;=C2=A0 =C2=A0 =C2=A0 - Return -EBUSY when trying to modify a enabled de=
vice<br>
&gt;=C2=A0 =C2=A0 =C2=A0 - Move the connector hot-plug related patches to t=
he end<br>
&gt;=C2=A0 =C2=A0 - Rebased on top of drm-misc-next<br>
&gt;=C2=A0 =C2=A0 - Link to v1: <a href=3D"https://lore.kernel.org/dri-deve=
l/20250218170808.9507-1-jose.exposito89@gmail.com/T/" rel=3D"noreferrer" ta=
rget=3D"_blank">https://lore.kernel.org/dri-devel/20250218170808.9507-1-jos=
e.exposito89@gmail.com/T/</a><br>
&gt; <br>
&gt; Jos=C3=A9 Exp=C3=B3sito (6):<br>
&gt;=C2=A0 =C2=A0 drm/vkms: Expose device creation and destruction<br>
&gt;=C2=A0 =C2=A0 drm/vkms: Allow to configure the default device creation<=
br>
&gt;=C2=A0 =C2=A0 drm/vkms: Remove completed task from the TODO list<br>
&gt;=C2=A0 =C2=A0 drm/vkms: Allow to configure connector status<br>
&gt;=C2=A0 =C2=A0 drm/vkms: Allow to update the connector status<br>
&gt;=C2=A0 =C2=A0 drm/vkms: Allow to configure connector status via configf=
s<br>
&gt; <br>
&gt; Louis Chauvet (10):<br>
&gt;=C2=A0 =C2=A0 drm/vkms: Add and remove VKMS instances via configfs<br>
&gt;=C2=A0 =C2=A0 drm/vkms: Allow to configure multiple planes via configfs=
<br>
&gt;=C2=A0 =C2=A0 drm/vkms: Allow to configure the plane type via configfs<=
br>
&gt;=C2=A0 =C2=A0 drm/vkms: Allow to configure multiple CRTCs via configfs<=
br>
&gt;=C2=A0 =C2=A0 drm/vkms: Allow to configure CRTC writeback support via c=
onfigfs<br>
&gt;=C2=A0 =C2=A0 drm/vkms: Allow to attach planes and CRTCs via configfs<b=
r>
&gt;=C2=A0 =C2=A0 drm/vkms: Allow to configure multiple encoders via config=
fs<br>
&gt;=C2=A0 =C2=A0 drm/vkms: Allow to attach encoders and CRTCs via configfs=
<br>
&gt;=C2=A0 =C2=A0 drm/vkms: Allow to configure multiple connectors via conf=
igfs<br>
&gt;=C2=A0 =C2=A0 drm/vkms: Allow to attach connectors and encoders via con=
figfs<br>
&gt; <br>
&gt;=C2=A0 =C2=A0Documentation/gpu/vkms.rst=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 100 ++-<br>
&gt;=C2=A0 =C2=A0drivers/gpu/drm/vkms/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
&gt;=C2=A0 =C2=A0drivers/gpu/drm/vkms/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A03 +-<br>
&gt;=C2=A0 =C2=A0drivers/gpu/drm/vkms/tests/vkms_config_test.c |=C2=A0 24 +=
<br>
&gt;=C2=A0 =C2=A0drivers/gpu/drm/vkms/vkms_config.c=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A08 +-<br>
&gt;=C2=A0 =C2=A0drivers/gpu/drm/vkms/vkms_config.h=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 26 +<br>
&gt;=C2=A0 =C2=A0drivers/gpu/drm/vkms/vkms_configfs.c=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 833 ++++++++++++++++++<br>
&gt;=C2=A0 =C2=A0drivers/gpu/drm/vkms/vkms_configfs.h=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A08 +<br>
&gt;=C2=A0 =C2=A0drivers/gpu/drm/vkms/vkms_connector.c=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 35 +<br>
&gt;=C2=A0 =C2=A0drivers/gpu/drm/vkms/vkms_connector.h=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A09 +<br>
&gt;=C2=A0 =C2=A0drivers/gpu/drm/vkms/vkms_drv.c=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 18 +-<br>
&gt;=C2=A0 =C2=A0drivers/gpu/drm/vkms/vkms_drv.h=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 20 +<br>
&gt;=C2=A0 =C2=A012 files changed, 1072 insertions(+), 13 deletions(-)<br>
&gt;=C2=A0 =C2=A0create mode 100644 drivers/gpu/drm/vkms/vkms_configfs.c<br=
>
&gt;=C2=A0 =C2=A0create mode 100644 drivers/gpu/drm/vkms/vkms_configfs.h<br=
>
&gt; <br>
&gt; <br>
&gt; base-commit: a6c0a91ccb257eaec2aee080df06863ce7601315<br>
<br>
-- <br>
Louis Chauvet, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
<br>
</blockquote></div></div>

--000000000000dc2b93063a22cf3c--
