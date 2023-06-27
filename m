Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 71A297403A8
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jun 2023 20:57:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6D3310E09D;
	Tue, 27 Jun 2023 18:57:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A552A10E09D;
 Tue, 27 Jun 2023 18:57:42 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-4fb73ba3b5dso4134819e87.1; 
 Tue, 27 Jun 2023 11:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687892259; x=1690484259;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=6sjylWIZ3z/Aw+nl1SyspvkhK6YRtKMntyoqadnDXuU=;
 b=AAseILFbl4SLA6+wCYxhJmVnjcmTmpe6+RkxTes6hnj1s0rPjyW1mhq6RXw53xRmZu
 omlmuBvi6YjZSb2DGA7Js/pf+JhZJaIDzL0zMFVoOyda78DVVPCaqGVQ7miXdWmPy0FE
 RB3QK931mAF8JLYQgOcgFxWk7A/rjcEHIj2IxlhtjMXR15WWhWR1dulr7RM1HFyfjR0o
 XRnxRO5hfKdL3My9+5Lvvh/a2voPwltMJ2s93qZyYs9BW9LalPgWbpXVfPuEbaiuZbzT
 wx5xLHmruAUB++YK6YQrbInFRRDnhpakYDye+sjrkyO6+e7iR/n+DKHkH3Uqg07RgfwS
 E6mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687892259; x=1690484259;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6sjylWIZ3z/Aw+nl1SyspvkhK6YRtKMntyoqadnDXuU=;
 b=LBgWl2KPkGhUtS04/jN1mfsX5gS9kaEpHoc9vXAiwDjKZipEXzo4jxfC8YleOcPfFs
 jQ3RqgxT6Ng2cw+rMxvKRWaZ02iKtd2Q+KxBnL7flOjjgj5/S2hZ32voeV1ycouslosg
 NfcWhGwinpTwYWk3RXs6fEcN+viv7MbbvaP7AAlHEkm2GRf7DEV0Bz0VREjWqalUImqp
 7fXq9D+7eO3TQ4lbMM325SH4OUyQj2ZX9Ct0CQSFeabsPxlGi8wpapSzLafXmgve/R1u
 41z/kG52/GqZeB2ks5aSIKMlVCp0+KcZoZEy0SZcT/ju4bGNeF+GNPk+C4kRaXm6hkKC
 w07w==
X-Gm-Message-State: AC+VfDz2dAC5Gs/APtGSRpNZwu65YvdbGXXHb99YLLastvYeSPImwBHh
 +zFnCC2jCWUXNi85zuQu9NgESui0vo72yh+VyU4=
X-Google-Smtp-Source: ACHHUZ7aYhrVazcOKe6JF9H163l+/mbAChgCPuCKYJJiS53lVqaWyJtOeHrMv+CfU0ZUw4I9JvD+XGHosh7gsZkS9Xg=
X-Received: by 2002:a19:e612:0:b0:4f8:742f:3bed with SMTP id
 d18-20020a19e612000000b004f8742f3bedmr13188196lfh.37.1687892258660; Tue, 27
 Jun 2023 11:57:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230627132323.115440-1-andrealmeid@igalia.com>
In-Reply-To: <20230627132323.115440-1-andrealmeid@igalia.com>
From: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>
Date: Tue, 27 Jun 2023 14:57:25 -0400
Message-ID: <CAAxE2A4Hquz9bJNSEaUtBoJC3qbLBPYXd8i3JX9AhNUx_iUKpg@mail.gmail.com>
Subject: Re: [PATCH v5 1/1] drm/doc: Document DRM device reset expectations
To: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
Content-Type: multipart/alternative; boundary="0000000000007f2a0205ff210ae4"
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
Cc: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Samuel Pitoiset <samuel.pitoiset@gmail.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>, kernel-dev@igalia.com,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 Pekka Paalanen <ppaalanen@gmail.com>,
 =?UTF-8?Q?Timur_Krist=C3=B3f?= <timur.kristof@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--0000000000007f2a0205ff210ae4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 27, 2023, 09:23 Andr=C3=A9 Almeida <andrealmeid@igalia.com> wro=
te:

> Create a section that specifies how to deal with DRM device resets for
> kernel and userspace drivers.
>
> Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>
> Signed-off-by: Andr=C3=A9 Almeida <andrealmeid@igalia.com>
> ---
>
> v4:
> https://lore.kernel.org/lkml/20230626183347.55118-1-andrealmeid@igalia.co=
m/
>
> Changes:
>  - Grammar fixes (Randy)
>
>  Documentation/gpu/drm-uapi.rst | 68 ++++++++++++++++++++++++++++++++++
>  1 file changed, 68 insertions(+)
>
> diff --git a/Documentation/gpu/drm-uapi.rst
> b/Documentation/gpu/drm-uapi.rst
> index 65fb3036a580..3cbffa25ed93 100644
> --- a/Documentation/gpu/drm-uapi.rst
> +++ b/Documentation/gpu/drm-uapi.rst
> @@ -285,6 +285,74 @@ for GPU1 and GPU2 from different vendors, and a thir=
d
> handler for
>  mmapped regular files. Threads cause additional pain with signal
>  handling as well.
>
> +Device reset
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +The GPU stack is really complex and is prone to errors, from hardware
> bugs,
> +faulty applications and everything in between the many layers. Some erro=
rs
> +require resetting the device in order to make the device usable again.
> This
> +sections describes the expectations for DRM and usermode drivers when a
> +device resets and how to propagate the reset status.
> +
> +Kernel Mode Driver
> +------------------
> +
> +The KMD is responsible for checking if the device needs a reset, and to
> perform
> +it as needed. Usually a hang is detected when a job gets stuck executing=
.
> KMD
> +should keep track of resets, because userspace can query any time about
> the
> +reset stats for an specific context. This is needed to propagate to the
> rest of
> +the stack that a reset has happened. Currently, this is implemented by
> each
> +driver separately, with no common DRM interface.
> +
> +User Mode Driver
> +----------------
> +
> +The UMD should check before submitting new commands to the KMD if the
> device has
> +been reset, and this can be checked more often if the UMD requires it.
> After
> +detecting a reset, UMD will then proceed to report it to the application
> using
> +the appropriate API error code, as explained in the section below about
> +robustness.
>

The UMD won't check the device status before every command submission due
to ioctl overhead. Instead, the KMD should skip command submission and
return an error that it was skipped.

The only case where that won't be applicable is user queues where drivers
don't call into the kernel to submit work, but they do call into the kernel
to create a dma_fence. In that case, the call to create a dma_fence can
fail with an error.

Marek

+
> +Robustness
> +----------
> +
> +The only way to try to keep an application working after a reset is if i=
t
> +complies with the robustness aspects of the graphical API that it is
> using.
> +
> +Graphical APIs provide ways to applications to deal with device resets.
> However,
> +there is no guarantee that the app will use such features correctly, and
> the
> +UMD can implement policies to close the app if it is a repeating offende=
r,
> +likely in a broken loop. This is done to ensure that it does not keep
> blocking
> +the user interface from being correctly displayed. This should be done
> even if
> +the app is correct but happens to trigger some bug in the hardware/drive=
r.
> +
> +OpenGL
> +~~~~~~
> +
> +Apps using OpenGL should use the available robust interfaces, like the
> +extension ``GL_ARB_robustness`` (or ``GL_EXT_robustness`` for OpenGL ES)=
.
> This
> +interface tells if a reset has happened, and if so, all the context stat=
e
> is
> +considered lost and the app proceeds by creating new ones. If it is
> possible to
> +determine that robustness is not in use, the UMD will terminate the app
> when a
> +reset is detected, giving that the contexts are lost and the app won't b=
e
> able
> +to figure this out and recreate the contexts.
> +
> +Vulkan
> +~~~~~~
> +
> +Apps using Vulkan should check for ``VK_ERROR_DEVICE_LOST`` for
> submissions.
> +This error code means, among other things, that a device reset has
> happened and
> +it needs to recreate the contexts to keep going.
> +
> +Reporting causes of resets
> +--------------------------
> +
> +Apart from propagating the reset through the stack so apps can recover,
> it's
> +really useful for driver developers to learn more about what caused the
> reset in
> +first place. DRM devices should make use of devcoredump to store relevan=
t
> +information about the reset, so this information can be added to user bu=
g
> +reports.
> +
>  .. _drm_driver_ioctl:
>
>  IOCTL Support on Device Nodes
> --
> 2.41.0
>
>

--0000000000007f2a0205ff210ae4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D=
"gmail_attr">On Tue, Jun 27, 2023, 09:23 Andr=C3=A9 Almeida &lt;<a href=3D"=
mailto:andrealmeid@igalia.com">andrealmeid@igalia.com</a>&gt; wrote:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left=
:1px #ccc solid;padding-left:1ex">Create a section that specifies how to de=
al with DRM device resets for<br>
kernel and userspace drivers.<br>
<br>
Acked-by: Pekka Paalanen &lt;<a href=3D"mailto:pekka.paalanen@collabora.com=
" target=3D"_blank" rel=3D"noreferrer">pekka.paalanen@collabora.com</a>&gt;=
<br>
Signed-off-by: Andr=C3=A9 Almeida &lt;<a href=3D"mailto:andrealmeid@igalia.=
com" target=3D"_blank" rel=3D"noreferrer">andrealmeid@igalia.com</a>&gt;<br=
>
---<br>
<br>
v4: <a href=3D"https://lore.kernel.org/lkml/20230626183347.55118-1-andrealm=
eid@igalia.com/" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lo=
re.kernel.org/lkml/20230626183347.55118-1-andrealmeid@igalia.com/</a><br>
<br>
Changes:<br>
=C2=A0- Grammar fixes (Randy)<br>
<br>
=C2=A0Documentation/gpu/drm-uapi.rst | 68 +++++++++++++++++++++++++++++++++=
+<br>
=C2=A01 file changed, 68 insertions(+)<br>
<br>
diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rs=
t<br>
index 65fb3036a580..3cbffa25ed93 100644<br>
--- a/Documentation/gpu/drm-uapi.rst<br>
+++ b/Documentation/gpu/drm-uapi.rst<br>
@@ -285,6 +285,74 @@ for GPU1 and GPU2 from different vendors, and a third =
handler for<br>
=C2=A0mmapped regular files. Threads cause additional pain with signal<br>
=C2=A0handling as well.<br>
<br>
+Device reset<br>
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
+<br>
+The GPU stack is really complex and is prone to errors, from hardware bugs=
,<br>
+faulty applications and everything in between the many layers. Some errors=
<br>
+require resetting the device in order to make the device usable again. Thi=
s<br>
+sections describes the expectations for DRM and usermode drivers when a<br=
>
+device resets and how to propagate the reset status.<br>
+<br>
+Kernel Mode Driver<br>
+------------------<br>
+<br>
+The KMD is responsible for checking if the device needs a reset, and to pe=
rform<br>
+it as needed. Usually a hang is detected when a job gets stuck executing. =
KMD<br>
+should keep track of resets, because userspace can query any time about th=
e<br>
+reset stats for an specific context. This is needed to propagate to the re=
st of<br>
+the stack that a reset has happened. Currently, this is implemented by eac=
h<br>
+driver separately, with no common DRM interface.<br>
+<br>
+User Mode Driver<br>
+----------------<br>
+<br>
+The UMD should check before submitting new commands to the KMD if the devi=
ce has<br>
+been reset, and this can be checked more often if the UMD requires it. Aft=
er<br>
+detecting a reset, UMD will then proceed to report it to the application u=
sing<br>
+the appropriate API error code, as explained in the section below about<br=
>
+robustness.<br></blockquote></div></div><div dir=3D"auto"><br></div><div d=
ir=3D"auto">The UMD won&#39;t check the device status before every command =
submission due to ioctl overhead. Instead, the KMD should skip command subm=
ission and return an error that it was skipped.</div><div dir=3D"auto"><br>=
</div><div dir=3D"auto">The only case where that won&#39;t be applicable is=
 user queues where drivers don&#39;t call into the kernel to submit work, b=
ut they do call into the kernel to create a dma_fence. In that case, the ca=
ll to create a dma_fence can fail with an error.</div><div dir=3D"auto"><br=
></div><div dir=3D"auto">Marek</div><div dir=3D"auto"><br></div><div dir=3D=
"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
+<br>
+Robustness<br>
+----------<br>
+<br>
+The only way to try to keep an application working after a reset is if it<=
br>
+complies with the robustness aspects of the graphical API that it is using=
.<br>
+<br>
+Graphical APIs provide ways to applications to deal with device resets. Ho=
wever,<br>
+there is no guarantee that the app will use such features correctly, and t=
he<br>
+UMD can implement policies to close the app if it is a repeating offender,=
<br>
+likely in a broken loop. This is done to ensure that it does not keep bloc=
king<br>
+the user interface from being correctly displayed. This should be done eve=
n if<br>
+the app is correct but happens to trigger some bug in the hardware/driver.=
<br>
+<br>
+OpenGL<br>
+~~~~~~<br>
+<br>
+Apps using OpenGL should use the available robust interfaces, like the<br>
+extension ``GL_ARB_robustness`` (or ``GL_EXT_robustness`` for OpenGL ES). =
This<br>
+interface tells if a reset has happened, and if so, all the context state =
is<br>
+considered lost and the app proceeds by creating new ones. If it is possib=
le to<br>
+determine that robustness is not in use, the UMD will terminate the app wh=
en a<br>
+reset is detected, giving that the contexts are lost and the app won&#39;t=
 be able<br>
+to figure this out and recreate the contexts.<br>
+<br>
+Vulkan<br>
+~~~~~~<br>
+<br>
+Apps using Vulkan should check for ``VK_ERROR_DEVICE_LOST`` for submission=
s.<br>
+This error code means, among other things, that a device reset has happene=
d and<br>
+it needs to recreate the contexts to keep going.<br>
+<br>
+Reporting causes of resets<br>
+--------------------------<br>
+<br>
+Apart from propagating the reset through the stack so apps can recover, it=
&#39;s<br>
+really useful for driver developers to learn more about what caused the re=
set in<br>
+first place. DRM devices should make use of devcoredump to store relevant<=
br>
+information about the reset, so this information can be added to user bug<=
br>
+reports.<br>
+<br>
=C2=A0.. _drm_driver_ioctl:<br>
<br>
=C2=A0IOCTL Support on Device Nodes<br>
-- <br>
2.41.0<br>
<br>
</blockquote></div></div></div>

--0000000000007f2a0205ff210ae4--
