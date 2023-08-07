Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ADD8772BDE
	for <lists+dri-devel@lfdr.de>; Mon,  7 Aug 2023 18:59:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D318F10E301;
	Mon,  7 Aug 2023 16:59:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x31.google.com (mail-oa1-x31.google.com
 [IPv6:2001:4860:4864:20::31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B62FA10E301;
 Mon,  7 Aug 2023 16:59:47 +0000 (UTC)
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-1bc479cc815so3711260fac.1; 
 Mon, 07 Aug 2023 09:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691427587; x=1692032387;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7ax9C43p8yvCgXdr8o1/JSyuVrQ/jKmhK3V7gAOikHI=;
 b=N+jfvJK8Hv+xuffyYqQQ/xDO4j1Pib9L9fTUxisONol4F/95bG9aAb0ruUDAkLphce
 KYdoIC61zE4e2iWAgT5gEoodXPh0XsnBAqqkJHutbIv0b4nsozjUPKR2bod1hdYflDi+
 ijg/gTRvb7xF8+8thNNf4ZxccNzUfCsuCmWPv/jVzMHLhI3gk1xTs45d8Nl/tb8GNDCH
 e/W9Zhpp1On2fZmRJ2slgL/B1Yij7thbKfK+9JOyCMHl73Xmm82vAfVtpBCsVEbg/+5U
 o5Oc1wvySZyqwxkGMStRNlivbzpYheyzahPCvDPq5VAqULiNQGAeGc61bP66lF1Tzf5f
 fT1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691427587; x=1692032387;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7ax9C43p8yvCgXdr8o1/JSyuVrQ/jKmhK3V7gAOikHI=;
 b=Hr44qkvIGum6C7sG51zGKIWY3dKJ0ZIJxXwlgufTNMEM85reqLhKY+A5zjBTTcolHU
 b7Osp2YzUobu+kV6AcCS7+MxoQ2FGYucsP+EUYXt42d+aTrt2TQzmjHKeQobYqKVfLNJ
 gmSLNfzD2nuZxZTB3tiXuggNZAmBaapBn1u9qKhcjf9fS6Gl2WQmrIfb/PiJiePvMV42
 u71KJcH/ohzdIAvkDYg67lq6xX+9FxlpNSUiN/9FMacDxQ9JQZ+e+kvQ99/INdk3prJW
 j/LmQ/lBsgdFKAjVH/wIMiocJ1Ede3FMrK1qr4AaS/6U0kbY5DnsYJEySPvfvydXC1Zp
 Wydg==
X-Gm-Message-State: AOJu0YxLwkvz3gBMV87NF3N1qG4oNHmRKz16x9+m3d664OeD4Ewnync2
 a+AFS7cT+eOs13qoDsBC/HeZ5SnxqWUeK4U9n4c=
X-Google-Smtp-Source: AGHT+IFmme4ushlh2m2FZxt8mISEYn+sHW9P8tCSwnkoeWtKO4qfTLMRlv9PUG+aufP2O3fRjzdFNcv0UOVJGV0GRnk=
X-Received: by 2002:a05:6870:fbaa:b0:1b4:7191:6d62 with SMTP id
 kv42-20020a056870fbaa00b001b471916d62mr11720054oab.35.1691427587021; Mon, 07
 Aug 2023 09:59:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230802014800.8945-1-sunran001@208suo.com>
In-Reply-To: <20230802014800.8945-1-sunran001@208suo.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 7 Aug 2023 12:59:36 -0400
Message-ID: <CADnq5_N5jZMTTBCkEZ8YBY=ab01biGi0LstzrQzCzJ_xUnB30A@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/pm: Clean up errors in hwmgr.h
To: Ran Sun <sunran001@208suo.com>
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
Cc: alexander.deucher@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Tue, Aug 1, 2023 at 9:48=E2=80=AFPM Ran Sun <sunran001@208suo.com> wrote=
:
>
> Fix the following errors reported by checkpatch:
>
> ERROR: open brace '{' following struct go on the same line
> ERROR: Use C99 flexible arrays
>
> Signed-off-by: Ran Sun <sunran001@208suo.com>
> ---
>  drivers/gpu/drm/amd/pm/powerplay/inc/hwmgr.h | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/pm/powerplay/inc/hwmgr.h b/drivers/gpu/d=
rm/amd/pm/powerplay/inc/hwmgr.h
> index 612d66aeaab9..81650727a5de 100644
> --- a/drivers/gpu/drm/amd/pm/powerplay/inc/hwmgr.h
> +++ b/drivers/gpu/drm/amd/pm/powerplay/inc/hwmgr.h
> @@ -190,8 +190,7 @@ struct phm_vce_clock_voltage_dependency_table {
>  };
>
>
> -enum SMU_ASIC_RESET_MODE
> -{
> +enum SMU_ASIC_RESET_MODE {
>      SMU_ASIC_RESET_MODE_0,
>      SMU_ASIC_RESET_MODE_1,
>      SMU_ASIC_RESET_MODE_2,
> @@ -516,7 +515,7 @@ struct phm_vq_budgeting_record {
>
>  struct phm_vq_budgeting_table {
>         uint8_t numEntries;
> -       struct phm_vq_budgeting_record entries[1];
> +       struct phm_vq_budgeting_record entries[0];
>  };
>
>  struct phm_clock_and_voltage_limits {
> @@ -607,8 +606,7 @@ struct phm_ppt_v2_information {
>         uint8_t  uc_dcef_dpm_voltage_mode;
>  };
>
> -struct phm_ppt_v3_information
> -{
> +struct phm_ppt_v3_information {
>         uint8_t uc_thermal_controller_type;
>
>         uint16_t us_small_power_limit1;
> --
> 2.17.1
>
