Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C502578AAA
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jul 2022 21:27:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A11310E94F;
	Mon, 18 Jul 2022 19:26:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEBE010E92E;
 Mon, 18 Jul 2022 19:26:56 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id sz17so23129126ejc.9;
 Mon, 18 Jul 2022 12:26:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=T6pIhZoCfcBPiPwmB8bNAnYeRRxbKbLMH2IiA6YSiS4=;
 b=faNSnFWta+P8uRY/mAT3+Za/vDXl1BUX2axDNHN+u6Fk25/DihtmqZ1ez9cCMledSv
 o9/1J17v9pQBQ22wZBZk65u+HaKDsSyplTzLJbloNiWSa4yK5aWNB/+W8djYr2BZXbMZ
 nKmVyznhptfFFftvmKRyAAkKgxPgg9l0mNz9LgrVHwb391NNfRtHq0xyMzcQZokkGGPL
 4DGyWU6qA5cME9WgwEB7+dKnSmwvgkqDLyeWjtQgBo1SRTiXygp4trF8CEYjuCnYrYe4
 H32fixbFwKgd/J0xdyHHfgXAiROs0ZPcMZsb0YVnWBoyx4TKU4Utes2OE4K+STSipjAg
 QEMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=T6pIhZoCfcBPiPwmB8bNAnYeRRxbKbLMH2IiA6YSiS4=;
 b=GfmURI+GjDR9V7D0CaLkSBGTHoJY82wTGkZtKINOwfH0TUC4XGTeUkY8MkA4A17W9c
 C3BAY7cvMYVxYMV+t4+cULsMMqYoxSioEAGsPsUXAbyJ3Io5eydo9aQNGi0C7JZl4PRZ
 AQYw+0h+Cc0XxS5VeIwVIpeX65bdqhf+//ApwqK0/QcJ5S9wGbyOBZWbq8iBChzHWSd+
 yXlK1MrBne5C+QGluKVK+LDESmWRN/zoBEVfKm4fF06e5SwySWDBkrFIj2hO6JcxmqVV
 Tw8vJK1jRGxMpGR+E9xaI95vKJq4fwvCgRhatsuH3ujClOp1jHW3Iz+wz+wndWlb0vDU
 kWbw==
X-Gm-Message-State: AJIora/SvnTSHOXJXnbyYJoMZfoO4jjOcQjqrsspO4RRC6qBo3rmhtvu
 FhstR8zhYP0g5QCwhlFK9q54wRebmUzxMDn/Er4=
X-Google-Smtp-Source: AGRyM1v2XHLFYVt425ORaNirifkP+WzgLnf514m1xkW3VOh/4LAd0ujGzW1aOGq8nXCA1ZrlIeP6uaIsYntigmdolkY=
X-Received: by 2002:a17:906:4fc5:b0:72b:9943:6f10 with SMTP id
 i5-20020a1709064fc500b0072b99436f10mr27435815ejw.722.1658172414591; Mon, 18
 Jul 2022 12:26:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220714191745.45512-1-andrealmeid@igalia.com>
 <20220714191745.45512-2-andrealmeid@igalia.com>
In-Reply-To: <20220714191745.45512-2-andrealmeid@igalia.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 18 Jul 2022 15:26:42 -0400
Message-ID: <CADnq5_MBa3ip2De7ztVpBAaupnynjAnO0sBcd2_io7Y2Pnkywg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] Documentation/gpu: Add GFXOFF section
To: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Tom St Denis <tom.stdenis@amd.com>, Jack Xiao <Jack.Xiao@amd.com>,
 Tao Zhou <tao.zhou1@amd.com>, kernel-dev@igalia.com,
 David Airlie <airlied@linux.ie>, Felix Kuehling <Felix.Kuehling@amd.com>,
 Pan Xinhui <Xinhui.Pan@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied the series with some minor tweaks to the documentation.

Thanks!

Alex

On Thu, Jul 14, 2022 at 3:18 PM Andr=C3=A9 Almeida <andrealmeid@igalia.com>=
 wrote:
>
> Add a GFXOFF section at "GPU Power Controls" file, explaining what it is
> and how userspace can interact with it.
>
> Signed-off-by: Andr=C3=A9 Almeida <andrealmeid@igalia.com>
> ---
> Changes from v1: file created
>
>  Documentation/gpu/amdgpu/thermal.rst | 41 ++++++++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
>
> diff --git a/Documentation/gpu/amdgpu/thermal.rst b/Documentation/gpu/amd=
gpu/thermal.rst
> index 8aeb0186c9ef..14c0fb874cf6 100644
> --- a/Documentation/gpu/amdgpu/thermal.rst
> +++ b/Documentation/gpu/amdgpu/thermal.rst
> @@ -63,3 +63,44 @@ gpu_metrics
>
>  .. kernel-doc:: drivers/gpu/drm/amd/pm/amdgpu_pm.c
>     :doc: gpu_metrics
> +
> +GFXOFF
> +=3D=3D=3D=3D=3D=3D
> +
> +GFXOFF is a feature found in some mobile GPUs that saves power consumpti=
on. The
> +card's firmware uses RLC (RunList Controller) to power off the gfx engin=
e
> +dynamically when there is no workload on gfx pipe and puts gfx into "idl=
e"
> +state. GFXOFF is on by default on supported GPUs.
> +
> +Userspace can interact with GFXOFF through a debugfs interface:
> +
> +``amdgpu_gfxoff``
> +-----------------
> +
> +Use it to enable/disable GFXOFF, and to check if it's current enabled/di=
sabled::
> +
> +  $ xxd -l1 -p /sys/kernel/debug/dri/0/amdgpu_gfxoff
> +  01
> +
> +- Write 0 to disable it, and 1 to enable it.
> +- Read 0 means it's disabled, 1 it's enabled.
> +
> +If it's enabled, that means that the GPU is free to enter into GFXOFF mo=
de as
> +needed. Disabled means that it will never enter GFXOFF mode.
> +
> +``amdgpu_gfxoff_status``
> +------------------------
> +
> +Read it to check current GFXOFF's status of a GPU::
> +
> +  $ xxd -l1 -p /sys/kernel/debug/dri/0/amdgpu_gfxoff_status
> +  02
> +
> +- 0: GPU is in GFXOFF state, the gfx engine is powered down.
> +- 1: Transition out of GFXOFF state
> +- 2: Not in GFXOFF state
> +- 3: Transition into GFXOFF state
> +
> +If GFXOFF is enabled, the value will be transitioning around [0, 3], alw=
ays
> +getting into 0 when possible. When it's disabled, it's always at 2. Retu=
rns
> +``-EINVAL`` if it's not supported.
> --
> 2.37.0
>
