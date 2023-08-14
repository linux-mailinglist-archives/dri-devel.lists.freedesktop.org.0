Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1166377BF4A
	for <lists+dri-devel@lfdr.de>; Mon, 14 Aug 2023 19:52:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D28DD10E21A;
	Mon, 14 Aug 2023 17:52:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com
 [IPv6:2607:f8b0:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6565310E21A;
 Mon, 14 Aug 2023 17:51:58 +0000 (UTC)
Received: by mail-oi1-x233.google.com with SMTP id
 5614622812f47-3a1ebb85f99so4363494b6e.2; 
 Mon, 14 Aug 2023 10:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692035517; x=1692640317;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HIBMc1Pc73jtTeqexlKEiDPeJffujSakc49ekoQBfEw=;
 b=X0GzjxNkFGdsC2FAJ0D0BeFPlg+0QkEZzweKtNqg/6IpcR6A5qVnbDZ7ykD+TV3iNd
 DxOGLsXpcrRQqI4uqKBxBkK9mSnlO6Jem1upRzZgaHX3y1iV+bxfijkDp3c3Ls0OAwLa
 eNPNIzbaoXxiOBRP1V7ZHkBkR4GRqhiHoH6T4QOG65szHCi4+0FSal6iGsbR2yUJhaW7
 V3R+9sQu5AiPrdrnx9LhOA4jVUHS1cGOpH0IsVHGw/JZnr1eUsjyMJdu3o0atm2j1fEE
 z7SYvdSF3cpcUxyJ0jYj/DIbea7BtKhumoYnhgsi9uWasa9UmcNzRSvRpdCu0J1gWvuq
 PwiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692035517; x=1692640317;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HIBMc1Pc73jtTeqexlKEiDPeJffujSakc49ekoQBfEw=;
 b=giJ8eGCicKmr2YLapMsd+ljHxmSxbuSOe3RtgQtwMr0wPhk92udskqQR4wDGaRRFEO
 L3DzShr6SfT+KbeCxnCU2UuTWxccpjorpt2mzG639s5+BVLTKInUXMk6vUAJ4a73hnR7
 85yHj+ac+6zFgEFxIhCTNo5FYasS+W/q8mEX1WqHPs1T/g7cblKZiiqTxwF4Ua6LYYO8
 HvLymNd7RTYliLwIvVOBq0pFrEKKuifvnw8hccepEUo9Qi3ZqQF29sLTyuhXl1AF7Cul
 JdX+qgCLSbzRkEDLjMqfU/47DDDOtKhOBg9RRqF/YZhr92+UY/vwV0TsVVwFN2cPuI0p
 cSUg==
X-Gm-Message-State: AOJu0YywaCTR/nxadyMFHBJW5452fhFXAcZrse0BLv+US1gUNTEBOj+5
 Z5HGgYc2V0S1X4ztWc7XHwXWnQ5pCT81u6Szry+GmFgL
X-Google-Smtp-Source: AGHT+IESEwrsFUbztJaxvtJi++NMkNad4w1FKUijFhYl0d8tpjrbfjvVvQgcHh1aXZsKt+AHt+JbeThdt46h0wcJr2o=
X-Received: by 2002:a05:6808:1316:b0:39a:bd0e:43d with SMTP id
 y22-20020a056808131600b0039abd0e043dmr14466780oiv.36.1692035517491; Mon, 14
 Aug 2023 10:51:57 -0700 (PDT)
MIME-Version: 1.0
References: <20230731092108.3162-1-sunran001@208suo.com>
In-Reply-To: <20230731092108.3162-1-sunran001@208suo.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 14 Aug 2023 13:51:46 -0400
Message-ID: <CADnq5_P0L5Np9U5N11EKXKW1K7K8S7GGiBRJDU1Hh3a0Bmts4w@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/pm: Clean up errors in smu_v11_0_pptable.h
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

On Mon, Jul 31, 2023 at 5:22=E2=80=AFAM Ran Sun <sunran001@208suo.com> wrot=
e:
>
> Fix the following errors reported by checkpatch:
>
> ERROR: trailing whitespace
> ERROR: open brace '{' following struct go on the same line
> ERROR: code indent should use tabs where possible
>
> Signed-off-by: Ran Sun <sunran001@208suo.com>
> ---
>  .../gpu/drm/amd/pm/swsmu/inc/smu_v11_0_pptable.h  | 15 ++++++---------
>  1 file changed, 6 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/pm/swsmu/inc/smu_v11_0_pptable.h b/drive=
rs/gpu/drm/amd/pm/swsmu/inc/smu_v11_0_pptable.h
> index 0116e3d04fad..df7430876e0c 100644
> --- a/drivers/gpu/drm/amd/pm/swsmu/inc/smu_v11_0_pptable.h
> +++ b/drivers/gpu/drm/amd/pm/swsmu/inc/smu_v11_0_pptable.h
> @@ -101,8 +101,7 @@ enum SMU_11_0_ODSETTING_ID {
>  };
>  #define SMU_11_0_MAX_ODSETTING    32          //Maximum Number of ODSett=
ings
>
> -struct smu_11_0_overdrive_table
> -{
> +struct smu_11_0_overdrive_table {
>      uint8_t  revision;                                        //Revision=
 =3D SMU_11_0_PP_OVERDRIVE_VERSION
>      uint8_t  reserve[3];                                      //Zero fil=
led field reserved for future use
>      uint32_t feature_count;                                   //Total nu=
mber of supported features
> @@ -127,8 +126,7 @@ enum SMU_11_0_PPCLOCK_ID {
>  };
>  #define SMU_11_0_MAX_PPCLOCK      16          //Maximum Number of PP Clo=
cks
>
> -struct smu_11_0_power_saving_clock_table
> -{
> +struct smu_11_0_power_saving_clock_table {
>      uint8_t  revision;                                        //Revision=
 =3D SMU_11_0_PP_POWERSAVINGCLOCK_VERSION
>      uint8_t  reserve[3];                                      //Zero fil=
led field reserved for future use
>      uint32_t count;                                           //power_sa=
ving_clock_count =3D SMU_11_0_PPCLOCK_COUNT
> @@ -136,8 +134,7 @@ struct smu_11_0_power_saving_clock_table
>      uint32_t min[SMU_11_0_MAX_PPCLOCK];                       //PowerSav=
ingClock Mode Clock Minimum array In MHz
>  };
>
> -struct smu_11_0_powerplay_table
> -{
> +struct smu_11_0_powerplay_table {
>        struct atom_common_table_header header;
>        uint8_t  table_revision;
>        uint16_t table_size;                          //Driver portion tab=
le size. The offset to smc_pptable including header size
> @@ -145,14 +142,14 @@ struct smu_11_0_powerplay_table
>        uint32_t golden_revision;
>        uint16_t format_id;
>        uint32_t platform_caps;                       //POWERPLAYABLE::ulP=
latformCaps
> -
> +
>        uint8_t  thermal_controller_type;             //one of SMU_11_0_PP=
_THERMALCONTROLLER
>
>        uint16_t small_power_limit1;
>        uint16_t small_power_limit2;
>        uint16_t boost_power_limit;
> -      uint16_t od_turbo_power_limit;                //Power limit settin=
g for Turbo mode in Performance UI Tuning.
> -      uint16_t od_power_save_power_limit;           //Power limit settin=
g for PowerSave/Optimal mode in Performance UI Tuning.
> +      uint16_t od_turbo_power_limit;                //Power limit settin=
g for Turbo mode in Performance UI Tuning.
> +      uint16_t od_power_save_power_limit;           //Power limit settin=
g for PowerSave/Optimal mode in Performance UI Tuning.
>        uint16_t software_shutdown_temp;
>
>        uint16_t reserve[6];                          //Zero filled field =
reserved for future use
> --
> 2.17.1
>
