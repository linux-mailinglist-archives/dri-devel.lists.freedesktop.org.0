Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 274633B740A
	for <lists+dri-devel@lfdr.de>; Tue, 29 Jun 2021 16:14:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A17A89AAE;
	Tue, 29 Jun 2021 14:13:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C477889A6D;
 Tue, 29 Jun 2021 14:13:55 +0000 (UTC)
Received: by mail-oi1-x229.google.com with SMTP id w127so26399318oig.12;
 Tue, 29 Jun 2021 07:13:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9S74JOYKz4LXepAVSvI+OSnTg73GPaPI8C818Hw5YPk=;
 b=ShXSPy8YMVhdt22psjM2H/xzDJHwTrwFTtKnFd5gNVvcP1+y/mFrTJKiMCoAsCEB+z
 C0nKQBL+gsQTXwKtGcYYS5ZmaFpeUyctoGMgmQCoW+fgTnGyAs2uxcpCwfeG1aqm4HpE
 fObBt7t0faOt9criSYFEiYmXwA4kkSEFCCH2aYI/bxkSMpvNwBNTWqhekgqfD/zkPK+F
 XrlUsrmDUVI3CHHthYm9Bs/qtX9C6Tnk3AUlq8JJDfKL23rmTT5+ryArU8hqTMFrfnLY
 NVE/WrjBduyEErUfWLnUGF8EiMnTsIEVwNic93YNwhRmUGrRTQ4WVavJqucxhq9zxoCY
 AJ+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9S74JOYKz4LXepAVSvI+OSnTg73GPaPI8C818Hw5YPk=;
 b=IUDmmRWGTHMebMCoxhwSk/cQzBUSNc0AdBjpTbt4Pl1v12vmIb4sSHFFof2kq2spkT
 YA2YboWXGgWbCOKA/X8JQyBGnXakrEkAIhdOQbJZsk8Hv6Rq036gF4iL3RnPd48BxZKd
 tg8BTKPGSzLVrftpnpC1h7R3fVEkaBtgkBLkpYwpEFWhai2rRXz+0nyVbZ2Ua7ckAyKp
 KgXTWEM7jo6krS8X2Hq/8fDpQMn8mBDyY+fvOQS3SIeeSjaJxv8Sug4A6xbb/+8uWVQJ
 15W1F/fRJBUBbqJ+S7ltnj8giTiqWDFmz78WHUTJ0rTN75hZJdJMEn/0bQHFTdsAMRkb
 KllA==
X-Gm-Message-State: AOAM530ru/J/QHaDJnEhlMtkdmgfiL6F7Qa2+laG0IoZi3mlGG3YSvYt
 rGFIzNUTne7/fNfyg+Fi85sf+bNKcdWtx3d+Jyk=
X-Google-Smtp-Source: ABdhPJzCdYX0N4mTrzK7aUZy7qMqiG6PLxkKbsaTfO7H+HsBUvBayQ0BzLqCi+DthYsgFHsoYAjTiFDKGiob8LBFffo=
X-Received: by 2002:aca:3446:: with SMTP id b67mr11009940oia.120.1624976035000; 
 Tue, 29 Jun 2021 07:13:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210628105334.27559-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20210628105334.27559-1-lukas.bulwahn@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 29 Jun 2021 10:13:43 -0400
Message-ID: <CADnq5_Nqhr756=kzFSkDExyP-OQJopPmjz5Bnia1bbOWp2b7xg@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: rectify line endings in umc v8_7_0 IP headers
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
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
Cc: Dwaipayan Ray <dwaipayanray1@gmail.com>,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 John Clements <john.clements@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks.

Alex

On Mon, Jun 28, 2021 at 6:53 AM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
>
> Commit 6b36fa6143f6 ("drm/amdgpu: add umc v8_7_0 IP headers") adds the new
> file ./drivers/gpu/drm/amd/include/asic_reg/umc/umc_8_7_0_sh_mask.h with
> DOS line endings, which is very uncommon for the kernel repository.
>
> Rectify the line endings in this file with dos2unix.
>
> Identified by a checkpatch evaluation on the whole kernel repository and
> spot-checking for really unexpected checkpatch rule violations.
>
> Reported-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---
>  .../include/asic_reg/umc/umc_8_7_0_sh_mask.h  | 158 +++++++++---------
>  1 file changed, 79 insertions(+), 79 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/include/asic_reg/umc/umc_8_7_0_sh_mask.h b/drivers/gpu/drm/amd/include/asic_reg/umc/umc_8_7_0_sh_mask.h
> index 4c5097fa0c09..d5ef91d3c391 100644
> --- a/drivers/gpu/drm/amd/include/asic_reg/umc/umc_8_7_0_sh_mask.h
> +++ b/drivers/gpu/drm/amd/include/asic_reg/umc/umc_8_7_0_sh_mask.h
> @@ -1,79 +1,79 @@
> -#ifndef _umc_8_7_0_SH_MASK_HEADER
> -#define _umc_8_7_0_SH_MASK_HEADER
> -
> -//UMCCH0_0_GeccErrCntSel
> -#define UMCCH0_0_GeccErrCntSel__GeccErrCntCsSel__SHIFT                                                        0x0
> -#define UMCCH0_0_GeccErrCntSel__GeccErrInt__SHIFT                                                             0xc
> -#define UMCCH0_0_GeccErrCntSel__GeccErrCntEn__SHIFT                                                           0xf
> -#define UMCCH0_0_GeccErrCntSel__PoisonCntEn__SHIFT                                                            0x10
> -#define UMCCH0_0_GeccErrCntSel__GeccErrCntCsSel_MASK                                                          0x0000000FL
> -#define UMCCH0_0_GeccErrCntSel__GeccErrInt_MASK                                                               0x00003000L
> -#define UMCCH0_0_GeccErrCntSel__GeccErrCntEn_MASK                                                             0x00008000L
> -#define UMCCH0_0_GeccErrCntSel__PoisonCntEn_MASK                                                              0x00030000L
> -//UMCCH0_0_GeccErrCnt
> -#define UMCCH0_0_GeccErrCnt__GeccErrCnt__SHIFT                                                                0x0
> -#define UMCCH0_0_GeccErrCnt__GeccUnCorrErrCnt__SHIFT                                                          0x10
> -#define UMCCH0_0_GeccErrCnt__GeccErrCnt_MASK                                                                  0x0000FFFFL
> -#define UMCCH0_0_GeccErrCnt__GeccUnCorrErrCnt_MASK                                                            0xFFFF0000L
> -//MCA_UMC_UMC0_MCUMC_STATUST0
> -#define MCA_UMC_UMC0_MCUMC_STATUST0__ErrorCode__SHIFT                                                         0x0
> -#define MCA_UMC_UMC0_MCUMC_STATUST0__ErrorCodeExt__SHIFT                                                      0x10
> -#define MCA_UMC_UMC0_MCUMC_STATUST0__RESERV22__SHIFT                                                          0x16
> -#define MCA_UMC_UMC0_MCUMC_STATUST0__AddrLsb__SHIFT                                                           0x18
> -#define MCA_UMC_UMC0_MCUMC_STATUST0__RESERV30__SHIFT                                                          0x1e
> -#define MCA_UMC_UMC0_MCUMC_STATUST0__ErrCoreId__SHIFT                                                         0x20
> -#define MCA_UMC_UMC0_MCUMC_STATUST0__RESERV38__SHIFT                                                          0x26
> -#define MCA_UMC_UMC0_MCUMC_STATUST0__Scrub__SHIFT                                                             0x28
> -#define MCA_UMC_UMC0_MCUMC_STATUST0__RESERV41__SHIFT                                                          0x29
> -#define MCA_UMC_UMC0_MCUMC_STATUST0__Poison__SHIFT                                                            0x2b
> -#define MCA_UMC_UMC0_MCUMC_STATUST0__Deferred__SHIFT                                                          0x2c
> -#define MCA_UMC_UMC0_MCUMC_STATUST0__UECC__SHIFT                                                              0x2d
> -#define MCA_UMC_UMC0_MCUMC_STATUST0__CECC__SHIFT                                                              0x2e
> -#define MCA_UMC_UMC0_MCUMC_STATUST0__RESERV47__SHIFT                                                          0x2f
> -#define MCA_UMC_UMC0_MCUMC_STATUST0__Transparent__SHIFT                                                       0x34
> -#define MCA_UMC_UMC0_MCUMC_STATUST0__SyndV__SHIFT                                                             0x35
> -#define MCA_UMC_UMC0_MCUMC_STATUST0__RESERV54__SHIFT                                                          0x36
> -#define MCA_UMC_UMC0_MCUMC_STATUST0__TCC__SHIFT                                                               0x37
> -#define MCA_UMC_UMC0_MCUMC_STATUST0__ErrCoreIdVal__SHIFT                                                      0x38
> -#define MCA_UMC_UMC0_MCUMC_STATUST0__PCC__SHIFT                                                               0x39
> -#define MCA_UMC_UMC0_MCUMC_STATUST0__AddrV__SHIFT                                                             0x3a
> -#define MCA_UMC_UMC0_MCUMC_STATUST0__MiscV__SHIFT                                                             0x3b
> -#define MCA_UMC_UMC0_MCUMC_STATUST0__En__SHIFT                                                                0x3c
> -#define MCA_UMC_UMC0_MCUMC_STATUST0__UC__SHIFT                                                                0x3d
> -#define MCA_UMC_UMC0_MCUMC_STATUST0__Overflow__SHIFT                                                          0x3e
> -#define MCA_UMC_UMC0_MCUMC_STATUST0__Val__SHIFT                                                               0x3f
> -#define MCA_UMC_UMC0_MCUMC_STATUST0__ErrorCode_MASK                                                           0x000000000000FFFFL
> -#define MCA_UMC_UMC0_MCUMC_STATUST0__ErrorCodeExt_MASK                                                        0x00000000003F0000L
> -#define MCA_UMC_UMC0_MCUMC_STATUST0__RESERV22_MASK                                                            0x0000000000C00000L
> -#define MCA_UMC_UMC0_MCUMC_STATUST0__AddrLsb_MASK                                                             0x000000003F000000L
> -#define MCA_UMC_UMC0_MCUMC_STATUST0__RESERV30_MASK                                                            0x00000000C0000000L
> -#define MCA_UMC_UMC0_MCUMC_STATUST0__ErrCoreId_MASK                                                           0x0000003F00000000L
> -#define MCA_UMC_UMC0_MCUMC_STATUST0__RESERV38_MASK                                                            0x000000C000000000L
> -#define MCA_UMC_UMC0_MCUMC_STATUST0__Scrub_MASK                                                               0x0000010000000000L
> -#define MCA_UMC_UMC0_MCUMC_STATUST0__RESERV41_MASK                                                            0x0000060000000000L
> -#define MCA_UMC_UMC0_MCUMC_STATUST0__Poison_MASK                                                              0x0000080000000000L
> -#define MCA_UMC_UMC0_MCUMC_STATUST0__Deferred_MASK                                                            0x0000100000000000L
> -#define MCA_UMC_UMC0_MCUMC_STATUST0__UECC_MASK                                                                0x0000200000000000L
> -#define MCA_UMC_UMC0_MCUMC_STATUST0__CECC_MASK                                                                0x0000400000000000L
> -#define MCA_UMC_UMC0_MCUMC_STATUST0__RESERV47_MASK                                                            0x000F800000000000L
> -#define MCA_UMC_UMC0_MCUMC_STATUST0__Transparent_MASK                                                         0x0010000000000000L
> -#define MCA_UMC_UMC0_MCUMC_STATUST0__SyndV_MASK                                                               0x0020000000000000L
> -#define MCA_UMC_UMC0_MCUMC_STATUST0__RESERV54_MASK                                                            0x0040000000000000L
> -#define MCA_UMC_UMC0_MCUMC_STATUST0__TCC_MASK                                                                 0x0080000000000000L
> -#define MCA_UMC_UMC0_MCUMC_STATUST0__ErrCoreIdVal_MASK                                                        0x0100000000000000L
> -#define MCA_UMC_UMC0_MCUMC_STATUST0__PCC_MASK                                                                 0x0200000000000000L
> -#define MCA_UMC_UMC0_MCUMC_STATUST0__AddrV_MASK                                                               0x0400000000000000L
> -#define MCA_UMC_UMC0_MCUMC_STATUST0__MiscV_MASK                                                               0x0800000000000000L
> -#define MCA_UMC_UMC0_MCUMC_STATUST0__En_MASK                                                                  0x1000000000000000L
> -#define MCA_UMC_UMC0_MCUMC_STATUST0__UC_MASK                                                                  0x2000000000000000L
> -#define MCA_UMC_UMC0_MCUMC_STATUST0__Overflow_MASK                                                            0x4000000000000000L
> -#define MCA_UMC_UMC0_MCUMC_STATUST0__Val_MASK                                                                 0x8000000000000000L
> -//MCA_UMC_UMC0_MCUMC_ADDRT0
> -#define MCA_UMC_UMC0_MCUMC_ADDRT0__ErrorAddr__SHIFT                                                           0x0
> -#define MCA_UMC_UMC0_MCUMC_ADDRT0__LSB__SHIFT                                                                 0x38
> -#define MCA_UMC_UMC0_MCUMC_ADDRT0__Reserved__SHIFT                                                            0x3e
> -#define MCA_UMC_UMC0_MCUMC_ADDRT0__ErrorAddr_MASK                                                             0x00FFFFFFFFFFFFFFL
> -#define MCA_UMC_UMC0_MCUMC_ADDRT0__LSB_MASK                                                                   0x3F00000000000000L
> -#define MCA_UMC_UMC0_MCUMC_ADDRT0__Reserved_MASK                                                              0xC000000000000000L
> -
> -#endif
> +#ifndef _umc_8_7_0_SH_MASK_HEADER
> +#define _umc_8_7_0_SH_MASK_HEADER
> +
> +//UMCCH0_0_GeccErrCntSel
> +#define UMCCH0_0_GeccErrCntSel__GeccErrCntCsSel__SHIFT                                                        0x0
> +#define UMCCH0_0_GeccErrCntSel__GeccErrInt__SHIFT                                                             0xc
> +#define UMCCH0_0_GeccErrCntSel__GeccErrCntEn__SHIFT                                                           0xf
> +#define UMCCH0_0_GeccErrCntSel__PoisonCntEn__SHIFT                                                            0x10
> +#define UMCCH0_0_GeccErrCntSel__GeccErrCntCsSel_MASK                                                          0x0000000FL
> +#define UMCCH0_0_GeccErrCntSel__GeccErrInt_MASK                                                               0x00003000L
> +#define UMCCH0_0_GeccErrCntSel__GeccErrCntEn_MASK                                                             0x00008000L
> +#define UMCCH0_0_GeccErrCntSel__PoisonCntEn_MASK                                                              0x00030000L
> +//UMCCH0_0_GeccErrCnt
> +#define UMCCH0_0_GeccErrCnt__GeccErrCnt__SHIFT                                                                0x0
> +#define UMCCH0_0_GeccErrCnt__GeccUnCorrErrCnt__SHIFT                                                          0x10
> +#define UMCCH0_0_GeccErrCnt__GeccErrCnt_MASK                                                                  0x0000FFFFL
> +#define UMCCH0_0_GeccErrCnt__GeccUnCorrErrCnt_MASK                                                            0xFFFF0000L
> +//MCA_UMC_UMC0_MCUMC_STATUST0
> +#define MCA_UMC_UMC0_MCUMC_STATUST0__ErrorCode__SHIFT                                                         0x0
> +#define MCA_UMC_UMC0_MCUMC_STATUST0__ErrorCodeExt__SHIFT                                                      0x10
> +#define MCA_UMC_UMC0_MCUMC_STATUST0__RESERV22__SHIFT                                                          0x16
> +#define MCA_UMC_UMC0_MCUMC_STATUST0__AddrLsb__SHIFT                                                           0x18
> +#define MCA_UMC_UMC0_MCUMC_STATUST0__RESERV30__SHIFT                                                          0x1e
> +#define MCA_UMC_UMC0_MCUMC_STATUST0__ErrCoreId__SHIFT                                                         0x20
> +#define MCA_UMC_UMC0_MCUMC_STATUST0__RESERV38__SHIFT                                                          0x26
> +#define MCA_UMC_UMC0_MCUMC_STATUST0__Scrub__SHIFT                                                             0x28
> +#define MCA_UMC_UMC0_MCUMC_STATUST0__RESERV41__SHIFT                                                          0x29
> +#define MCA_UMC_UMC0_MCUMC_STATUST0__Poison__SHIFT                                                            0x2b
> +#define MCA_UMC_UMC0_MCUMC_STATUST0__Deferred__SHIFT                                                          0x2c
> +#define MCA_UMC_UMC0_MCUMC_STATUST0__UECC__SHIFT                                                              0x2d
> +#define MCA_UMC_UMC0_MCUMC_STATUST0__CECC__SHIFT                                                              0x2e
> +#define MCA_UMC_UMC0_MCUMC_STATUST0__RESERV47__SHIFT                                                          0x2f
> +#define MCA_UMC_UMC0_MCUMC_STATUST0__Transparent__SHIFT                                                       0x34
> +#define MCA_UMC_UMC0_MCUMC_STATUST0__SyndV__SHIFT                                                             0x35
> +#define MCA_UMC_UMC0_MCUMC_STATUST0__RESERV54__SHIFT                                                          0x36
> +#define MCA_UMC_UMC0_MCUMC_STATUST0__TCC__SHIFT                                                               0x37
> +#define MCA_UMC_UMC0_MCUMC_STATUST0__ErrCoreIdVal__SHIFT                                                      0x38
> +#define MCA_UMC_UMC0_MCUMC_STATUST0__PCC__SHIFT                                                               0x39
> +#define MCA_UMC_UMC0_MCUMC_STATUST0__AddrV__SHIFT                                                             0x3a
> +#define MCA_UMC_UMC0_MCUMC_STATUST0__MiscV__SHIFT                                                             0x3b
> +#define MCA_UMC_UMC0_MCUMC_STATUST0__En__SHIFT                                                                0x3c
> +#define MCA_UMC_UMC0_MCUMC_STATUST0__UC__SHIFT                                                                0x3d
> +#define MCA_UMC_UMC0_MCUMC_STATUST0__Overflow__SHIFT                                                          0x3e
> +#define MCA_UMC_UMC0_MCUMC_STATUST0__Val__SHIFT                                                               0x3f
> +#define MCA_UMC_UMC0_MCUMC_STATUST0__ErrorCode_MASK                                                           0x000000000000FFFFL
> +#define MCA_UMC_UMC0_MCUMC_STATUST0__ErrorCodeExt_MASK                                                        0x00000000003F0000L
> +#define MCA_UMC_UMC0_MCUMC_STATUST0__RESERV22_MASK                                                            0x0000000000C00000L
> +#define MCA_UMC_UMC0_MCUMC_STATUST0__AddrLsb_MASK                                                             0x000000003F000000L
> +#define MCA_UMC_UMC0_MCUMC_STATUST0__RESERV30_MASK                                                            0x00000000C0000000L
> +#define MCA_UMC_UMC0_MCUMC_STATUST0__ErrCoreId_MASK                                                           0x0000003F00000000L
> +#define MCA_UMC_UMC0_MCUMC_STATUST0__RESERV38_MASK                                                            0x000000C000000000L
> +#define MCA_UMC_UMC0_MCUMC_STATUST0__Scrub_MASK                                                               0x0000010000000000L
> +#define MCA_UMC_UMC0_MCUMC_STATUST0__RESERV41_MASK                                                            0x0000060000000000L
> +#define MCA_UMC_UMC0_MCUMC_STATUST0__Poison_MASK                                                              0x0000080000000000L
> +#define MCA_UMC_UMC0_MCUMC_STATUST0__Deferred_MASK                                                            0x0000100000000000L
> +#define MCA_UMC_UMC0_MCUMC_STATUST0__UECC_MASK                                                                0x0000200000000000L
> +#define MCA_UMC_UMC0_MCUMC_STATUST0__CECC_MASK                                                                0x0000400000000000L
> +#define MCA_UMC_UMC0_MCUMC_STATUST0__RESERV47_MASK                                                            0x000F800000000000L
> +#define MCA_UMC_UMC0_MCUMC_STATUST0__Transparent_MASK                                                         0x0010000000000000L
> +#define MCA_UMC_UMC0_MCUMC_STATUST0__SyndV_MASK                                                               0x0020000000000000L
> +#define MCA_UMC_UMC0_MCUMC_STATUST0__RESERV54_MASK                                                            0x0040000000000000L
> +#define MCA_UMC_UMC0_MCUMC_STATUST0__TCC_MASK                                                                 0x0080000000000000L
> +#define MCA_UMC_UMC0_MCUMC_STATUST0__ErrCoreIdVal_MASK                                                        0x0100000000000000L
> +#define MCA_UMC_UMC0_MCUMC_STATUST0__PCC_MASK                                                                 0x0200000000000000L
> +#define MCA_UMC_UMC0_MCUMC_STATUST0__AddrV_MASK                                                               0x0400000000000000L
> +#define MCA_UMC_UMC0_MCUMC_STATUST0__MiscV_MASK                                                               0x0800000000000000L
> +#define MCA_UMC_UMC0_MCUMC_STATUST0__En_MASK                                                                  0x1000000000000000L
> +#define MCA_UMC_UMC0_MCUMC_STATUST0__UC_MASK                                                                  0x2000000000000000L
> +#define MCA_UMC_UMC0_MCUMC_STATUST0__Overflow_MASK                                                            0x4000000000000000L
> +#define MCA_UMC_UMC0_MCUMC_STATUST0__Val_MASK                                                                 0x8000000000000000L
> +//MCA_UMC_UMC0_MCUMC_ADDRT0
> +#define MCA_UMC_UMC0_MCUMC_ADDRT0__ErrorAddr__SHIFT                                                           0x0
> +#define MCA_UMC_UMC0_MCUMC_ADDRT0__LSB__SHIFT                                                                 0x38
> +#define MCA_UMC_UMC0_MCUMC_ADDRT0__Reserved__SHIFT                                                            0x3e
> +#define MCA_UMC_UMC0_MCUMC_ADDRT0__ErrorAddr_MASK                                                             0x00FFFFFFFFFFFFFFL
> +#define MCA_UMC_UMC0_MCUMC_ADDRT0__LSB_MASK                                                                   0x3F00000000000000L
> +#define MCA_UMC_UMC0_MCUMC_ADDRT0__Reserved_MASK                                                              0xC000000000000000L
> +
> +#endif
> --
> 2.17.1
>
