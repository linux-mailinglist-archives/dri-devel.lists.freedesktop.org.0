Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC296772BC9
	for <lists+dri-devel@lfdr.de>; Mon,  7 Aug 2023 18:57:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E2AB10E2FC;
	Mon,  7 Aug 2023 16:57:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7056B10E2FA;
 Mon,  7 Aug 2023 16:57:02 +0000 (UTC)
Received: by mail-ot1-x32f.google.com with SMTP id
 46e09a7af769-6bcbb0c40b1so3605586a34.3; 
 Mon, 07 Aug 2023 09:57:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691427421; x=1692032221;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8Z9p5km3UZGZafdK1BmpwIiY/ihSWzczB8XWA2EWH3s=;
 b=ccB3GgXSCQRMNLG+BMreOOyUYdH/Yk6OtT9FMFT+DXInRGESpX3raYQ0RoHTYpfQWU
 HmOQLJCeOG+1LXrhn5PfvzV+cBCT6hRpxdHDKcsbKTAy/KWvaZ2h3SCCjWoYonnxtwTm
 bgjoa/tilS8y4hcg+Z83GJBeyFAsc6VdRowj8eG2v8DrgC6T8MxYpbjQujhnocnOi5Qw
 SbVdFX+en6tFJEreM4H9GAZNpKvw2skyF80hSKiU6D+4z23j24Ki6k7nC7Ed0AHBXO+f
 D33IdninngJcGEZwdFgdAj/wUPUat7sS28AGQ9nt/E2tvqxmGAOSa1xIx2zhiLotWffE
 RQfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691427421; x=1692032221;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8Z9p5km3UZGZafdK1BmpwIiY/ihSWzczB8XWA2EWH3s=;
 b=Rr5ZhSxnRJ2Kawiw95vEm/UfK5SvV6jPtsJG6Xqmps7nTkBAquWjcFPMJIhDfetxpw
 j7uds7/i8yvG44mgWvnKMSHSr9F5m0IRe7TAegr4O0XifAAbKJ//1EnAIz/9hwPWbFCU
 vEFP5+SmM6GGwQk0NPdB1e3dJ/TtD7wChw3c+RSfnC+FnBN7fJaxli+3leTo0aCm3nV1
 bnjKqJmOOeUGXdPwuPZc+3RwdXWu7ijVzL1BMgVwOUuxYPrUF5if0MTLVJNIECeTu9Hx
 w2h0oub4y8hapUyYCV2rr8boSug49gr7g0RDWSEc4rCYka5Lw5il9/sRqydXLeEjr8Oa
 I/vQ==
X-Gm-Message-State: AOJu0YxxDMdrNlcIiVwB3Uoy/ziUIlp8uB/HMvZF8XuNkL5Oi6bYDum4
 TuIw8ptUFcu1uFIkfY7Sp9zlwzsGQQbucDpomcU=
X-Google-Smtp-Source: AGHT+IHutKy2W7kS9zpFH4IQRQX0bm5b40a62etfa2b+Z/ydT1Qppa1f31tW3yJSQ3rofB8cu7Q1gAtSyc6mZ+N3Ps8=
X-Received: by 2002:a05:6870:b48d:b0:1bb:a912:9339 with SMTP id
 y13-20020a056870b48d00b001bba9129339mr12467712oap.7.1691427421691; Mon, 07
 Aug 2023 09:57:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230802012903.8589-1-sunran001@208suo.com>
In-Reply-To: <20230802012903.8589-1-sunran001@208suo.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 7 Aug 2023 12:56:50 -0400
Message-ID: <CADnq5_PPWwnP7GUKC2hw2Eo9SdbXFuwHxATYtXHbg03a14eiMA@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/pm: Clean up errors in smu7_fusion.h
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

On Tue, Aug 1, 2023 at 9:29=E2=80=AFPM Ran Sun <sunran001@208suo.com> wrote=
:
>
> Fix the following errors reported by checkpatch:
>
> ERROR: open brace '{' following struct go on the same line
> ERROR: space prohibited before open square bracket '['
>
> Signed-off-by: Ran Sun <sunran001@208suo.com>
> ---
>  .../drm/amd/pm/powerplay/inc/smu7_fusion.h    | 42 +++++++------------
>  1 file changed, 16 insertions(+), 26 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/pm/powerplay/inc/smu7_fusion.h b/drivers=
/gpu/drm/amd/pm/powerplay/inc/smu7_fusion.h
> index 78ada9ffd508..e130f52fe8d6 100644
> --- a/drivers/gpu/drm/amd/pm/powerplay/inc/smu7_fusion.h
> +++ b/drivers/gpu/drm/amd/pm/powerplay/inc/smu7_fusion.h
> @@ -36,8 +36,7 @@
>  #define SMU7_NUM_NON_TES 2
>
>  // All 'soft registers' should be uint32_t.
> -struct SMU7_SoftRegisters
> -{
> +struct SMU7_SoftRegisters {
>      uint32_t        RefClockFrequency;
>      uint32_t        PmTimerP;
>      uint32_t        FeatureEnables;
> @@ -80,8 +79,7 @@ struct SMU7_SoftRegisters
>
>  typedef struct SMU7_SoftRegisters SMU7_SoftRegisters;
>
> -struct SMU7_Fusion_GraphicsLevel
> -{
> +struct SMU7_Fusion_GraphicsLevel {
>      uint32_t    MinVddNb;
>
>      uint32_t    SclkFrequency;
> @@ -111,8 +109,7 @@ struct SMU7_Fusion_GraphicsLevel
>
>  typedef struct SMU7_Fusion_GraphicsLevel SMU7_Fusion_GraphicsLevel;
>
> -struct SMU7_Fusion_GIOLevel
> -{
> +struct SMU7_Fusion_GIOLevel {
>      uint8_t     EnabledForActivity;
>      uint8_t     LclkDid;
>      uint8_t     Vid;
> @@ -137,8 +134,7 @@ struct SMU7_Fusion_GIOLevel
>  typedef struct SMU7_Fusion_GIOLevel SMU7_Fusion_GIOLevel;
>
>  // UVD VCLK/DCLK state (level) definition.
> -struct SMU7_Fusion_UvdLevel
> -{
> +struct SMU7_Fusion_UvdLevel {
>      uint32_t VclkFrequency;
>      uint32_t DclkFrequency;
>      uint16_t MinVddNb;
> @@ -155,8 +151,7 @@ struct SMU7_Fusion_UvdLevel
>  typedef struct SMU7_Fusion_UvdLevel SMU7_Fusion_UvdLevel;
>
>  // Clocks for other external blocks (VCE, ACP, SAMU).
> -struct SMU7_Fusion_ExtClkLevel
> -{
> +struct SMU7_Fusion_ExtClkLevel {
>      uint32_t Frequency;
>      uint16_t MinVoltage;
>      uint8_t  Divider;
> @@ -166,8 +161,7 @@ struct SMU7_Fusion_ExtClkLevel
>  };
>  typedef struct SMU7_Fusion_ExtClkLevel SMU7_Fusion_ExtClkLevel;
>
> -struct SMU7_Fusion_ACPILevel
> -{
> +struct SMU7_Fusion_ACPILevel {
>      uint32_t    Flags;
>      uint32_t    MinVddNb;
>      uint32_t    SclkFrequency;
> @@ -181,8 +175,7 @@ struct SMU7_Fusion_ACPILevel
>
>  typedef struct SMU7_Fusion_ACPILevel SMU7_Fusion_ACPILevel;
>
> -struct SMU7_Fusion_NbDpm
> -{
> +struct SMU7_Fusion_NbDpm {
>      uint8_t DpmXNbPsHi;
>      uint8_t DpmXNbPsLo;
>      uint8_t Dpm0PgNbPsHi;
> @@ -197,8 +190,7 @@ struct SMU7_Fusion_NbDpm
>
>  typedef struct SMU7_Fusion_NbDpm SMU7_Fusion_NbDpm;
>
> -struct SMU7_Fusion_StateInfo
> -{
> +struct SMU7_Fusion_StateInfo {
>      uint32_t SclkFrequency;
>      uint32_t LclkFrequency;
>      uint32_t VclkFrequency;
> @@ -214,8 +206,7 @@ struct SMU7_Fusion_StateInfo
>
>  typedef struct SMU7_Fusion_StateInfo SMU7_Fusion_StateInfo;
>
> -struct SMU7_Fusion_DpmTable
> -{
> +struct SMU7_Fusion_DpmTable {
>      uint32_t                            SystemFlags;
>
>      SMU7_PIDController                  GraphicsPIDController;
> @@ -230,12 +221,12 @@ struct SMU7_Fusion_DpmTable
>      uint8_t                            SamuLevelCount;
>      uint16_t                           FpsHighT;
>
> -    SMU7_Fusion_GraphicsLevel         GraphicsLevel           [SMU__NUM_=
SCLK_DPM_STATE];
> +    SMU7_Fusion_GraphicsLevel         GraphicsLevel[SMU__NUM_SCLK_DPM_ST=
ATE];
>      SMU7_Fusion_ACPILevel             ACPILevel;
> -    SMU7_Fusion_UvdLevel              UvdLevel                [SMU7_MAX_=
LEVELS_UVD];
> -    SMU7_Fusion_ExtClkLevel           VceLevel                [SMU7_MAX_=
LEVELS_VCE];
> -    SMU7_Fusion_ExtClkLevel           AcpLevel                [SMU7_MAX_=
LEVELS_ACP];
> -    SMU7_Fusion_ExtClkLevel           SamuLevel               [SMU7_MAX_=
LEVELS_SAMU];
> +    SMU7_Fusion_UvdLevel              UvdLevel[SMU7_MAX_LEVELS_UVD];
> +    SMU7_Fusion_ExtClkLevel           VceLevel[SMU7_MAX_LEVELS_VCE];
> +    SMU7_Fusion_ExtClkLevel           AcpLevel[SMU7_MAX_LEVELS_ACP];
> +    SMU7_Fusion_ExtClkLevel           SamuLevel[SMU7_MAX_LEVELS_SAMU];
>
>      uint8_t                           UvdBootLevel;
>      uint8_t                           VceBootLevel;
> @@ -266,10 +257,9 @@ struct SMU7_Fusion_DpmTable
>
>  };
>
> -struct SMU7_Fusion_GIODpmTable
> -{
> +struct SMU7_Fusion_GIODpmTable {
>
> -    SMU7_Fusion_GIOLevel              GIOLevel                [SMU7_MAX_=
LEVELS_GIO];
> +    SMU7_Fusion_GIOLevel              GIOLevel[SMU7_MAX_LEVELS_GIO];
>
>      SMU7_PIDController                GioPIDController;
>
> --
> 2.17.1
>
