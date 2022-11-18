Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9961162F73F
	for <lists+dri-devel@lfdr.de>; Fri, 18 Nov 2022 15:26:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C34E10E756;
	Fri, 18 Nov 2022 14:25:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [IPv6:2607:f8b0:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E53BA10E213;
 Fri, 18 Nov 2022 14:25:53 +0000 (UTC)
Received: by mail-oi1-x235.google.com with SMTP id v81so5489401oie.5;
 Fri, 18 Nov 2022 06:25:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=5LuCmVD+3CzNfg5KR+7IARdB1H73xIJwmBWKt3WBdb0=;
 b=qp9ji3g1Zto5tl8YjmqzsfnUJw0MjS+im5UISNC927DOLiSAZeOWqJS1103QMHndmo
 CcZ4m8Y/9u28kXeEwm9+vg551FXvA5XalaJwyj9evGvu31EoMNmccD4e61+b6IFaM4IS
 JKDtC9pGdsqZPJAKsoicJqoCFYEPuFTNDCtxyvtpP5bSlrziBdOdmkPgH04xSOKoYXSR
 cGIbeZkF99rGAf3aS+sWzWv4JnB6DCBjc7du32dAMsTFV0YvU3a7AnQmgmG55LVmN1D/
 r22dmthkpcTX4OBYEGs1TOuuA5madt85KzlHMV0IAT7GA5d5BEznYTJsFLMfOw39DJFa
 q27Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5LuCmVD+3CzNfg5KR+7IARdB1H73xIJwmBWKt3WBdb0=;
 b=FpGaW45g9hxp+dI93i+0AAUdcdspt+Yck8g69H499psZSEbJMUJ2uJfIzUhVQI9SiS
 3eOqGbKSeiYdh4fhpGysSBDLGRm8972A/Q7aPsImQkFnUl0ANwSmZicwftGXCVEO2aAd
 I6aLVSsj9RgU04GS0OlwxaLbh5YoO0YUM8uS1OwuUB+QSMtgUzN6HgkFosMc6/yjXwpD
 zoWhqtPUcF0jebfImMUu/5g0W081xpbuDkTcDBQqsTMghtCYaEA0+aJ01M6Lfo+bUmOk
 TnnCepPBpaGjMZGu6B/ZgSwZGKEhmS+tIPfklR2VJi5AY8EYPIMPe5BDjDa+lrzAMOS8
 5kYQ==
X-Gm-Message-State: ANoB5plF6AhOzzw+I75i8OTWWp99NuiPlqsvtpasRBSKUHoE5QBIlCWK
 V07klYn8NtCKjxI3qMFkZLeJjOMc30fR2zWV5bo=
X-Google-Smtp-Source: AA0mqf7hOTbTOfZDgLxwFZCFP25720NR4mjhlMjriyEEj6DGWfet0Wlz+nn0zLwKCQI1Hx0PTQ6xYT24UR7wr+L4CbE=
X-Received: by 2002:a05:6808:295:b0:357:670f:9e4e with SMTP id
 z21-20020a056808029500b00357670f9e4emr6631793oic.46.1668781553121; Fri, 18
 Nov 2022 06:25:53 -0800 (PST)
MIME-Version: 1.0
References: <20221118115306.128293-1-arefev@swemel.ru>
In-Reply-To: <20221118115306.128293-1-arefev@swemel.ru>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 18 Nov 2022 09:25:41 -0500
Message-ID: <CADnq5_MP6Fz6gm=vc74U8sc6SgZy1D+39ZQX48zdiWzf+24tTw@mail.gmail.com>
Subject: Re: [PATCH v2] amdgpu: nbio_v7_4: Add pointer check
To: Denis Arefev <arefev@swemel.ru>
Content-Type: text/plain; charset="UTF-8"
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
Cc: lvc-project@linuxtesting.org, avid Airlie <airlied@linux.ie>,
 trufanov@swemel.ru, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, vfh@swemel.ru, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Nov 18, 2022 at 9:11 AM Denis Arefev <arefev@swemel.ru> wrote:
>
> Return value of a function 'amdgpu_ras_find_obj' is dereferenced
> at nbio_v7_4.c:325 without checking for null
>
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
>
> Signed-off-by: Denis Arefev <arefev@swemel.ru>
> ---
>  drivers/gpu/drm/amd/amdgpu/nbio_v7_4.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/nbio_v7_4.c b/drivers/gpu/drm/amd/amdgpu/nbio_v7_4.c
> index eadc9526d33f..0f2ac99de864 100644
> --- a/drivers/gpu/drm/amd/amdgpu/nbio_v7_4.c
> +++ b/drivers/gpu/drm/amd/amdgpu/nbio_v7_4.c
> @@ -304,6 +304,9 @@ static void nbio_v7_4_handle_ras_controller_intr_no_bifring(struct amdgpu_device
>         struct ras_err_data err_data = {0, 0, 0, NULL};
>         struct amdgpu_ras *ras = amdgpu_ras_get_context(adev);
>
> +       if (!obj)
> +               return;
>

I don't think we could ever get here with a NULL obj.  This is part of
the interrupt handler for NBIO RAS, so the interrupt would never be
enabled in the first place if the obj didn't exist.

Alex

>         bif_doorbell_intr_cntl = RREG32_SOC15(NBIO, 0, mmBIF_DOORBELL_INT_CNTL);
>         if (REG_GET_FIELD(bif_doorbell_intr_cntl,
>                 BIF_DOORBELL_INT_CNTL, RAS_CNTLR_INTERRUPT_STATUS)) {
> --
> 2.25.1
>
