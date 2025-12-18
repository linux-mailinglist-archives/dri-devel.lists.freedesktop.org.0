Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 025ABCCA479
	for <lists+dri-devel@lfdr.de>; Thu, 18 Dec 2025 06:05:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0462810E247;
	Thu, 18 Dec 2025 05:05:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="b3snvwyB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 588A810E247
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Dec 2025 05:05:43 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id
 98e67ed59e1d1-34c718c5481so215375a91.3
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Dec 2025 21:05:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766034343; x=1766639143; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=LWSTadTXjuXDRHn9BTgPohF2WaIldyC82otQYNGXA34=;
 b=b3snvwyB77TGknocT7EPg1apiPdll1VSBqeI5Dg8Ul/sDTpqbqFPThXGNWk0gCwda9
 cjKnfX7755iD5Mdr372nwpuGXGSWmYs15GqAuJVq5/+6F7vKNvD9p15SHnXRh/JNeXYj
 qG8U27z9CxGCsWo0qro8bJr22AZAtzL5oi4n07YaQZqff+ERQFeTiBaUtMnp8E1P1aRi
 vDfpe6cq9XAO1l+60SZ540WNFruhNyiLT9CTH9l9+oz9LUrcq5VzgecCZaBnRjWff9Gl
 Rp0TcNC7O8wSC7spYEqZI8yPKmfBtVVnHq3rLwYjlJxRISm8X+NPfLsuVB+bpkFtaXNu
 jKZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766034343; x=1766639143;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LWSTadTXjuXDRHn9BTgPohF2WaIldyC82otQYNGXA34=;
 b=EGPqR6CfsXMaQDmaudP/fdOuYjDBVqmrJSMHVHiUjVbPPVoIPTDjOsLweyehqmcULz
 L8hH1K0hSWZa24dRU4UWTQKtoqZw6HvrT8wgMpwBXQz4mGueo0VtlZYnYjCtnQb966kH
 2fjNkJrv2ALugM+S7F4KpPpGO94Nn+PwsJkxP3xpzOxrfATfxZwAt+cdkpDQfed8Solv
 MqvFB53udqwToXJB5jJwN1tcmoHcWcV0Nt7cXazY1tWlrFfLM18InfjgK4rda9p6KYXD
 Ek+bIZAIO4ltC9BBPJTxabjCMLMcF8wATfsjitJGL/uNOv/RLPWS0QZIP7QMhq2caOuv
 YK1g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUOGyrhHf2RBFAxfOiQ342GxqJxLBAccbRdMGFxK1XnvWsCuLFK9UVx47a3ziCAVTRVxaIYlMoxwlY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YysPsAK5JpU0kbB/PX6qnQ0lWR44pQdfJYA9NNv8dqs4vCPF+m3
 dPbhwfprYCtMhYgsKGYlXtNPOj117hhIudAQQurzpCjApZu5N0mVT/EvPM8ApHBse0foxHd3zMk
 slXUcAMXw342qzKQZdGRNCXQYOe2UZwc=
X-Gm-Gg: AY/fxX4M0CVuVmKL875qXqt17KRTwsPv2QQXv2VlJ68f6aEh1azeCOYqyJGRqrEbN2S
 2Bd/X4aJ6PB2jWX9kBmyuUnCehrwb7JJTCAITxp/L1/ZrBdUaLeQ1f5fV2cHHgI1aEYZLmElp+F
 1GpugMmaZ7Y4LxSUfDfaEOS6jOlWHNQrgPRKGLt6Wx792DZfjxyzGC9vlOzZ3n8d5gaISxGTBHi
 m7k1YBaxk+tiBL/t56vebSGzisMbNatErciWqUhEeEjGO+2GYBOpN3wjqWoeIN7dGZRfLh1/SDl
 oRWzQwY=
X-Google-Smtp-Source: AGHT+IH1HfWodTUbfEKDFPCeuL1jfgQtfgCWi35lLJZLw/w+t5C2YfigyF+yeqWF3pi6GEKiQecNKxycviPqpGoBjq4=
X-Received: by 2002:a17:90b:5292:b0:330:6d2f:1b5d with SMTP id
 98e67ed59e1d1-34abd77ecd1mr17612128a91.26.1766034342693; Wed, 17 Dec 2025
 21:05:42 -0800 (PST)
MIME-Version: 1.0
References: <20251217170104.2767939-1-suryasaimadhu369@gmail.com>
 <4f872e73-5961-4cc1-a826-850445235a36@amd.com>
In-Reply-To: <4f872e73-5961-4cc1-a826-850445235a36@amd.com>
From: Sai Madhu <suryasaimadhu369@gmail.com>
Date: Thu, 18 Dec 2025 10:35:31 +0530
X-Gm-Features: AQt7F2oFSgLUttEcbNa9YUVxXJJHUalyh16Uomh_P8nokI-kBZlirQhyedRdO9I
Message-ID: <CAB0uMAekWNGMihw+3=wDbfGrDsH69MgQ88f--jfwCx2yiWm9bQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu/dm: Convert IRQ logging to drm_* helpers
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: harry.wentland@amd.com, sunpeng.li@amd.com, alexander.deucher@amd.com, 
 christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch, 
 amd-gfx@lists.freedesktop.org, siqueira@igalia.com, wayne.lin@amd.com, 
 roman.li@amd.com, timur.kristof@gmail.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Content-Type: multipart/alternative; boundary="000000000000a84e2a064632e9fc"
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

--000000000000a84e2a064632e9fc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the review.



You=E2=80=99re right =E2=80=94 I should be using adev_to_drm() instead of a=
ccessing
adev->ddev directly.
I=E2=80=99ll rework the patch to:
  - use adev_to_drm(adev) for drm_* logging
  - drop any unrelated changes



I=E2=80=99ll send a v2 shortly.

On Wed, 17 Dec 2025 at 22:32, Mario Limonciello <mario.limonciello@amd.com>
wrote:

> On 12/17/25 11:01 AM, suryasaimadhu wrote:
> > Replace DRM_ERROR(), DRM_WARN(), and DRM_INFO() usage in
> > drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c with the
> > corresponding drm_err(), drm_warn(), and drm_info() helpers.
> >
> > The drm_* logging helpers take a struct drm_device * as their first
> > argument, allowing the DRM core to prefix log messages with the
> > specific device name and instance. This is required to correctly
> > differentiate log messages when multiple AMD GPUs are present.
> >
> > This aligns amdgpu_dm with the DRM TODO item to convert legacy DRM
> > logging macros to the device-scoped drm_* helpers while keeping
> > debug logging unchanged.
> >
> > Signed-off-by: suryasaimadhu <suryasaimadhu369@gmail.com>
> >
> > diff --git a/Makefile b/Makefile
> > index 2f545ec1690f..e404e4767944 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -1,8 +1,8 @@
> >   # SPDX-License-Identifier: GPL-2.0
> >   VERSION =3D 6
> > -PATCHLEVEL =3D 18
> > +PATCHLEVEL =3D 19
> >   SUBLEVEL =3D 0
> > -EXTRAVERSION =3D
> > +EXTRAVERSION =3D -rc1
> >   NAME =3D Baby Opossum Posse
> Unrelated changes.
>
> >
> >   # *DOCUMENTATION*
> > diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c
> b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c
> > index 0a2a3f233a0e..4401059ff907 100644
> > --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c
> > +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c
> > @@ -238,22 +238,22 @@ static void unregister_all_irq_handlers(struct
> amdgpu_device *adev)
> >   }
> >
> >   static bool
> > -validate_irq_registration_params(struct dc_interrupt_params *int_param=
s,
> > +validate_irq_registration_params(struct drm_device *dev, struct
> dc_interrupt_params *int_params,
> >                                void (*ih)(void *))
> >   {
> >       if (NULL =3D=3D int_params || NULL =3D=3D ih) {
> > -             DRM_ERROR("DM_IRQ: invalid input!\n");
> > +             drm_err(dev, "DM_IRQ: invalid input!\n");
> >               return false;
> >       }
> >
> >       if (int_params->int_context >=3D INTERRUPT_CONTEXT_NUMBER) {
> > -             DRM_ERROR("DM_IRQ: invalid context: %d!\n",
> > +             drm_err(dev, "DM_IRQ: invalid context: %d!\n",
> >                               int_params->int_context);
> >               return false;
> >       }
> >
> >       if (!DAL_VALID_IRQ_SRC_NUM(int_params->irq_source)) {
> > -             DRM_ERROR("DM_IRQ: invalid irq_source: %d!\n",
> > +             drm_err(dev, "DM_IRQ: invalid irq_source: %d!\n",
> >                               int_params->irq_source);
> >               return false;
> >       }
> > @@ -261,16 +261,18 @@ validate_irq_registration_params(struct
> dc_interrupt_params *int_params,
> >       return true;
> >   }
> >
> > -static bool validate_irq_unregistration_params(enum dc_irq_source
> irq_source,
> > -                                            irq_handler_idx handler_id=
x)
> > +static bool validate_irq_unregistration_params(
> > +     struct drm_device *dev,
> > +     enum dc_irq_source irq_source,
> > +     irq_handler_idx handler_idx)
> >   {
> >       if (handler_idx =3D=3D DAL_INVALID_IRQ_HANDLER_IDX) {
> > -             DRM_ERROR("DM_IRQ: invalid handler_idx=3D=3DNULL!\n");
> > +             drm_err(dev, "DM_IRQ: invalid handler_idx=3D=3DNULL!\n");
> >               return false;
> >       }
> >
> >       if (!DAL_VALID_IRQ_SRC_NUM(irq_source)) {
> > -             DRM_ERROR("DM_IRQ: invalid irq_source:%d!\n", irq_source)=
;
> > +             drm_err(dev, "DM_IRQ: invalid irq_source:%d!\n",
> irq_source);
> >               return false;
> >       }
> >
> > @@ -310,12 +312,12 @@ void *amdgpu_dm_irq_register_interrupt(struct
> amdgpu_device *adev,
> >       unsigned long irq_table_flags;
> >       enum dc_irq_source irq_source;
> >
> > -     if (false =3D=3D validate_irq_registration_params(int_params, ih)=
)
> > +     if (false =3D=3D validate_irq_registration_params(&adev->ddev,
> int_params, ih))
> >               return DAL_INVALID_IRQ_HANDLER_IDX;
> >
> >       handler_data =3D kzalloc(sizeof(*handler_data), GFP_KERNEL);
> >       if (!handler_data) {
> > -             DRM_ERROR("DM_IRQ: failed to allocate irq handler!\n");
> > +             drm_err(&adev->ddev, "DM_IRQ: failed to allocate irq
> handler!\n");
>
> Use adev_to_drm().
>
> >               return DAL_INVALID_IRQ_HANDLER_IDX;
> >       }
> >
> > @@ -375,7 +377,7 @@ void amdgpu_dm_irq_unregister_interrupt(struct
> amdgpu_device *adev,
> >       struct dc_interrupt_params int_params;
> >       int i;
> >
> > -     if (false =3D=3D validate_irq_unregistration_params(irq_source, i=
h))
> > +     if (false =3D=3D validate_irq_unregistration_params(&adev->ddev,
> irq_source, ih))
> >               return;
> >
> >       memset(&int_params, 0, sizeof(int_params));
> > @@ -396,7 +398,7 @@ void amdgpu_dm_irq_unregister_interrupt(struct
> amdgpu_device *adev,
> >               /* If we got here, it means we searched all irq contexts
> >                * for this irq source, but the handler was not found.
> >                */
> > -             DRM_ERROR(
> > +             drm_err(&adev->ddev,
> >               "DM_IRQ: failed to find irq handler:%p for
> irq_source:%d!\n",
> >                       ih, irq_source);
> >       }
> > @@ -596,7 +598,7 @@ static void amdgpu_dm_irq_schedule_work(struct
> amdgpu_device *adev,
> >               /*allocate a new amdgpu_dm_irq_handler_data*/
> >               handler_data_add =3D kzalloc(sizeof(*handler_data),
> GFP_ATOMIC);
> >               if (!handler_data_add) {
> > -                     DRM_ERROR("DM_IRQ: failed to allocate irq
> handler!\n");
> > +                     drm_err(&adev->ddev, "DM_IRQ: failed to allocate
> irq handler!\n");
> >                       return;
> >               }
> >
> > @@ -611,11 +613,11 @@ static void amdgpu_dm_irq_schedule_work(struct
> amdgpu_device *adev,
> >               INIT_WORK(&handler_data_add->work, dm_irq_work_func);
> >
> >               if (queue_work(system_highpri_wq, &handler_data_add->work=
))
> > -                     DRM_DEBUG("Queued work for handling interrupt fro=
m
> "
> > +                     drm_dbg(&adev->ddev, "Queued work for handling
> interrupt from "
> >                                 "display for IRQ source %d\n",
> >                                 irq_source);
> >               else
> > -                     DRM_ERROR("Failed to queue work for handling
> interrupt "
> > +                     drm_err(&adev->ddev, "Failed to queue work for
> handling interrupt "
> >                                 "from display for IRQ source %d\n",
> >                                 irq_source);
> >       }
> > @@ -720,7 +722,7 @@ static inline int dm_irq_state(struct amdgpu_device
> *adev,
> >       struct amdgpu_crtc *acrtc =3D adev->mode_info.crtcs[crtc_id];
> >
> >       if (!acrtc) {
> > -             DRM_ERROR(
> > +             drm_err(&adev->ddev,
> >                       "%s: crtc is NULL at id :%d\n",
> >                       func,
> >                       crtc_id);
>
>

--000000000000a84e2a064632e9fc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><p>Thanks for the review.</p><p>=C2=A0</p><p>You=E2=80=99r=
e right =E2=80=94 I should be using adev_to_drm() instead of accessing adev=
-&gt;ddev directly.<br>
I=E2=80=99ll rework the patch to:<br>
=C2=A0 - use adev_to_drm(adev) for drm_* logging<br>
=C2=A0 - drop any unrelated changes</p><p>=C2=A0</p><p>I=E2=80=99ll send a =
v2 shortly.</p></div><br><div class=3D"gmail_quote gmail_quote_container"><=
div dir=3D"ltr" class=3D"gmail_attr">On Wed, 17 Dec 2025 at 22:32, Mario Li=
monciello &lt;<a href=3D"mailto:mario.limonciello@amd.com">mario.limonciell=
o@amd.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">On 12/17/25 11:01 AM, suryasaimadhu wrote:<br>
&gt; Replace DRM_ERROR(), DRM_WARN(), and DRM_INFO() usage in<br>
&gt; drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c with the<br>
&gt; corresponding drm_err(), drm_warn(), and drm_info() helpers.<br>
&gt; <br>
&gt; The drm_* logging helpers take a struct drm_device * as their first<br=
>
&gt; argument, allowing the DRM core to prefix log messages with the<br>
&gt; specific device name and instance. This is required to correctly<br>
&gt; differentiate log messages when multiple AMD GPUs are present.<br>
&gt; <br>
&gt; This aligns amdgpu_dm with the DRM TODO item to convert legacy DRM<br>
&gt; logging macros to the device-scoped drm_* helpers while keeping<br>
&gt; debug logging unchanged.<br>
&gt; <br>
&gt; Signed-off-by: suryasaimadhu &lt;<a href=3D"mailto:suryasaimadhu369@gm=
ail.com" target=3D"_blank">suryasaimadhu369@gmail.com</a>&gt;<br>
&gt; <br>
&gt; diff --git a/Makefile b/Makefile<br>
&gt; index 2f545ec1690f..e404e4767944 100644<br>
&gt; --- a/Makefile<br>
&gt; +++ b/Makefile<br>
&gt; @@ -1,8 +1,8 @@<br>
&gt;=C2=A0 =C2=A0# SPDX-License-Identifier: GPL-2.0<br>
&gt;=C2=A0 =C2=A0VERSION =3D 6<br>
&gt; -PATCHLEVEL =3D 18<br>
&gt; +PATCHLEVEL =3D 19<br>
&gt;=C2=A0 =C2=A0SUBLEVEL =3D 0<br>
&gt; -EXTRAVERSION =3D<br>
&gt; +EXTRAVERSION =3D -rc1<br>
&gt;=C2=A0 =C2=A0NAME =3D Baby Opossum Posse<br>
Unrelated changes.<br>
<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0# *DOCUMENTATION*<br>
&gt; diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c b/d=
rivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c<br>
&gt; index 0a2a3f233a0e..4401059ff907 100644<br>
&gt; --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c<br>
&gt; +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c<br>
&gt; @@ -238,22 +238,22 @@ static void unregister_all_irq_handlers(struct a=
mdgpu_device *adev)<br>
&gt;=C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0static bool<br>
&gt; -validate_irq_registration_params(struct dc_interrupt_params *int_para=
ms,<br>
&gt; +validate_irq_registration_params(struct drm_device *dev, struct dc_in=
terrupt_params *int_params,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 void (*ih)(void *))<br>
&gt;=C2=A0 =C2=A0{<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (NULL =3D=3D int_params || NULL =3D=3D ih=
) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_ERROR(&quot;DM_IR=
Q: invalid input!\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_err(dev, &quot;DM=
_IRQ: invalid input!\n&quot;);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return false;<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (int_params-&gt;int_context &gt;=3D INTER=
RUPT_CONTEXT_NUMBER) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_ERROR(&quot;DM_IR=
Q: invalid context: %d!\n&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_err(dev, &quot;DM=
_IRQ: invalid context: %d!\n&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int_params-&gt;int_context);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return false;<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!DAL_VALID_IRQ_SRC_NUM(int_params-&gt;ir=
q_source)) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_ERROR(&quot;DM_IR=
Q: invalid irq_source: %d!\n&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_err(dev, &quot;DM=
_IRQ: invalid irq_source: %d!\n&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int_params-&gt;irq_source);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return false;<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; @@ -261,16 +261,18 @@ validate_irq_registration_params(struct dc_inter=
rupt_params *int_params,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return true;<br>
&gt;=C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -static bool validate_irq_unregistration_params(enum dc_irq_source irq=
_source,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 irq_handler_idx handler_idx)<br>
&gt; +static bool validate_irq_unregistration_params(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct drm_device *dev,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0enum dc_irq_source irq_source,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0irq_handler_idx handler_idx)<br>
&gt;=C2=A0 =C2=A0{<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (handler_idx =3D=3D DAL_INVALID_IRQ_HANDL=
ER_IDX) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_ERROR(&quot;DM_IR=
Q: invalid handler_idx=3D=3DNULL!\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_err(dev, &quot;DM=
_IRQ: invalid handler_idx=3D=3DNULL!\n&quot;);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return false;<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!DAL_VALID_IRQ_SRC_NUM(irq_source)) {<br=
>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_ERROR(&quot;DM_IR=
Q: invalid irq_source:%d!\n&quot;, irq_source);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_err(dev, &quot;DM=
_IRQ: invalid irq_source:%d!\n&quot;, irq_source);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return false;<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt; @@ -310,12 +312,12 @@ void *amdgpu_dm_irq_register_interrupt(struct am=
dgpu_device *adev,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned long irq_table_flags;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0enum dc_irq_source irq_source;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -=C2=A0 =C2=A0 =C2=A0if (false =3D=3D validate_irq_registration_params=
(int_params, ih))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (false =3D=3D validate_irq_registration_params=
(&amp;adev-&gt;ddev, int_params, ih))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return DAL_INVAL=
ID_IRQ_HANDLER_IDX;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0handler_data =3D kzalloc(sizeof(*handler_dat=
a), GFP_KERNEL);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!handler_data) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_ERROR(&quot;DM_IR=
Q: failed to allocate irq handler!\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_err(&amp;adev-&gt=
;ddev, &quot;DM_IRQ: failed to allocate irq handler!\n&quot;);<br>
<br>
Use adev_to_drm().<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return DAL_INVAL=
ID_IRQ_HANDLER_IDX;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt; @@ -375,7 +377,7 @@ void amdgpu_dm_irq_unregister_interrupt(struct amd=
gpu_device *adev,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct dc_interrupt_params int_params;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0int i;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -=C2=A0 =C2=A0 =C2=A0if (false =3D=3D validate_irq_unregistration_para=
ms(irq_source, ih))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (false =3D=3D validate_irq_unregistration_para=
ms(&amp;adev-&gt;ddev, irq_source, ih))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0memset(&amp;int_params, 0, sizeof(int_params=
));<br>
&gt; @@ -396,7 +398,7 @@ void amdgpu_dm_irq_unregister_interrupt(struct amd=
gpu_device *adev,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* If we got her=
e, it means we searched all irq contexts<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * for this irq =
source, but the handler was not found.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_ERROR(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_err(&amp;adev-&gt=
;ddev,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;DM_IRQ: fa=
iled to find irq handler:%p for irq_source:%d!\n&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0ih, irq_source);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; @@ -596,7 +598,7 @@ static void amdgpu_dm_irq_schedule_work(struct amd=
gpu_device *adev,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*allocate a new=
 amdgpu_dm_irq_handler_data*/<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0handler_data_add=
 =3D kzalloc(sizeof(*handler_data), GFP_ATOMIC);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!handler_dat=
a_add) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0DRM_ERROR(&quot;DM_IRQ: failed to allocate irq handler!\n&quot;);<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0drm_err(&amp;adev-&gt;ddev, &quot;DM_IRQ: failed to allocate irq han=
dler!\n&quot;);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0return;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt; @@ -611,11 +613,11 @@ static void amdgpu_dm_irq_schedule_work(struct a=
mdgpu_device *adev,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0INIT_WORK(&amp;h=
andler_data_add-&gt;work, dm_irq_work_func);<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (queue_work(s=
ystem_highpri_wq, &amp;handler_data_add-&gt;work))<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0DRM_DEBUG(&quot;Queued work for handling interrupt from &quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0drm_dbg(&amp;adev-&gt;ddev, &quot;Queued work for handling interrupt=
 from &quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;display for IRQ sourc=
e %d\n&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0irq_source);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0DRM_ERROR(&quot;Failed to queue work for handling interrupt &quot;<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0drm_err(&amp;adev-&gt;ddev, &quot;Failed to queue work for handling =
interrupt &quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;from display for IRQ =
source %d\n&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0irq_source);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; @@ -720,7 +722,7 @@ static inline int dm_irq_state(struct amdgpu_devic=
e *adev,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct amdgpu_crtc *acrtc =3D adev-&gt;mode_=
info.crtcs[crtc_id];<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!acrtc) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_ERROR(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_err(&amp;adev-&gt=
;ddev,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&quot;%s: crtc is NULL at id :%d\n&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0func,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0crtc_id);<br>
<br>
</blockquote></div>

--000000000000a84e2a064632e9fc--
