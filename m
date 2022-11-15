Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 71B24629C20
	for <lists+dri-devel@lfdr.de>; Tue, 15 Nov 2022 15:29:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91B1A10E406;
	Tue, 15 Nov 2022 14:29:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D783910E160;
 Tue, 15 Nov 2022 14:29:33 +0000 (UTC)
Received: by mail-ot1-x32f.google.com with SMTP id
 46-20020a9d0631000000b00666823da25fso8628307otn.0; 
 Tue, 15 Nov 2022 06:29:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=YtBjd5U7Z4dTCeEF5mRs9dqAb2tBqOFIzxlotygUWsI=;
 b=UbDmeL2Egx+Mh0V06TI5gyHyoopyFExt4xM+IivRUp8/PPz6WnNm1L0/uujCqzwEKl
 6ZbA3pRjszKvVUXCNLcq9KYtUHVC3DgwzKJY0c5cAQ9Ec3xYzLBRI4z4fcw1Sgx92A9T
 VHAewMwEzH7onmwHNXu+2NpyXeBGVL51i7M8zHkfI+knvg85jgHoOMFioxO8GjKTnuoy
 7mAvE0aDMThpyyxpmurxQHnVsfeSDdbsujA8RlVy2AmvcYvqtqk1+zk7zaawjI0m54HV
 O7uNpKRRyDUgg4Ks1erMvJ18as2WI/yj1QhzuMb/9tCP2UNaf7uPsqSgoDAsh1t/E/NB
 ntRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YtBjd5U7Z4dTCeEF5mRs9dqAb2tBqOFIzxlotygUWsI=;
 b=k/Jy9xDmiVcB8AZSM0hwRF7+vPzRHgM2GXOS81QzPZaZPNJ4ilwWe7nwpf9r7n0zDe
 ESkAQeA6Cg/+1jhY8KTKdkQ0U7ClHHgzRje2LYeEQ45dkGfHPKdlIN2Q4H3xpJCjrqUl
 k1fu9xMobJ0bg9vwKD/4b7zWcIlJfAJXv+ZiUytvMR07qPtIDiSHFvvJpIRbFGuI/2mt
 h1IMM5LMiXeVVN1pGh/OQwDfXlx8WRqudgDVScx3QfDCaILcoJt+NKip+l3zkC4u5UtJ
 EnDHMbWFuElL+nvGAfT3gopl4veyyDI+2b14ZTAfkpcA1J76EKC/5tflfSQbzedTZS+z
 ZJKw==
X-Gm-Message-State: ANoB5pkxHK1do6YfWivYabj6rIBY+IuIv8u/QpY/lpnf/M3TwWLI6reF
 mVbJivAZxhkqM/eQKgCp5LO1lcXi/yHgqIOV9Jw=
X-Google-Smtp-Source: AA0mqf4oytRI4UtYdcHoBBqKQMpel6k+O4QaJylBxHl9qdx+9fAzQwD/KWuhlyO4SRWrNTanEsR3rFV6UbvC5l13RJ0=
X-Received: by 2002:a05:6830:40af:b0:66c:6afa:5006 with SMTP id
 x47-20020a05683040af00b0066c6afa5006mr8974706ott.233.1668522573087; Tue, 15
 Nov 2022 06:29:33 -0800 (PST)
MIME-Version: 1.0
References: <Y3CgReK3e519a7bs@mail.google.com>
In-Reply-To: <Y3CgReK3e519a7bs@mail.google.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 15 Nov 2022 09:29:21 -0500
Message-ID: <CADnq5_PhL5DgHRrKbcniKuk064kJerT_Nau7kD2dGKCv3Mc3fQ@mail.gmail.com>
Subject: Re: [PATCH] [next] drm/amdgpu: Replace one-elements array with
 flex-array members
To: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
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
Cc: Leo Li <sunpeng.li@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Slark Xiao <slark_xiao@163.com>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Rongguang Wei <weirongguang@kylinos.cn>, linux-hardening@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks.

Alex

On Sun, Nov 13, 2022 at 2:44 AM Paulo Miguel Almeida
<paulo.miguel.almeida.rodenas@gmail.com> wrote:
>
> One-element arrays are deprecated, and we are replacing them with
> flexible array members instead. So, replace one-element array with
> flexible-array member in structs ATOM_I2C_VOLTAGE_OBJECT_V3,
> ATOM_ASIC_INTERNAL_SS_INFO_V2, ATOM_ASIC_INTERNAL_SS_INFO_V3,
> and refactor the rest of the code accordingly.
>
> Important to mention is that doing a build before/after this patch
> results in no functional binary output differences.
>
> This helps with the ongoing efforts to tighten the FORTIFY_SOURCE
> routines on memcpy() and help us make progress towards globally
> enabling -fstrict-flex-arrays=3 [1].
>
> Link: https://github.com/KSPP/linux/issues/79
> Link: https://github.com/KSPP/linux/issues/238
> Link: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=101836 [1]
>
> Signed-off-by: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
> ---
> Binary difference findings:
>
>         Some changes took more than a single line which changed the line
>         number parameter passed to the drm_dbg function (which leverages
>         kernel's dynamic debugging). Functionally-wise, nothing changed
>         after doing a before/after patch build.
>
> ---
>  .../gpu/drm/amd/display/dc/bios/bios_parser.c | 22 ++++++++++++-------
>  drivers/gpu/drm/amd/include/atombios.h        |  6 ++---
>  2 files changed, 17 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/bios/bios_parser.c b/drivers/gpu/drm/amd/display/dc/bios/bios_parser.c
> index 6b9e64cd4379..a1a00f432168 100644
> --- a/drivers/gpu/drm/amd/display/dc/bios/bios_parser.c
> +++ b/drivers/gpu/drm/amd/display/dc/bios/bios_parser.c
> @@ -665,8 +665,9 @@ static enum bp_result get_ss_info_v3_1(
>         if (!DATA_TABLES(ASIC_InternalSS_Info))
>                 return BP_RESULT_UNSUPPORTED;
>
> -       ss_table_header_include = GET_IMAGE(ATOM_ASIC_INTERNAL_SS_INFO_V3,
> -               DATA_TABLES(ASIC_InternalSS_Info));
> +       ss_table_header_include = ((ATOM_ASIC_INTERNAL_SS_INFO_V3 *) bios_get_image(&bp->base,
> +                               DATA_TABLES(ASIC_InternalSS_Info),
> +                               struct_size(ss_table_header_include, asSpreadSpectrum, 1)));
>         table_size =
>                 (le16_to_cpu(ss_table_header_include->sHeader.usStructureSize)
>                                 - sizeof(ATOM_COMMON_TABLE_HEADER))
> @@ -1032,8 +1033,10 @@ static enum bp_result get_ss_info_from_internal_ss_info_tbl_V2_1(
>         if (!DATA_TABLES(ASIC_InternalSS_Info))
>                 return result;
>
> -       header = GET_IMAGE(ATOM_ASIC_INTERNAL_SS_INFO_V2,
> -               DATA_TABLES(ASIC_InternalSS_Info));
> +       header = ((ATOM_ASIC_INTERNAL_SS_INFO_V2 *) bios_get_image(
> +                               &bp->base,
> +                               DATA_TABLES(ASIC_InternalSS_Info),
> +                               struct_size(header, asSpreadSpectrum, 1)));
>
>         memset(info, 0, sizeof(struct spread_spectrum_info));
>
> @@ -1712,8 +1715,10 @@ static uint32_t get_ss_entry_number_from_internal_ss_info_tbl_v2_1(
>         if (!DATA_TABLES(ASIC_InternalSS_Info))
>                 return 0;
>
> -       header_include = GET_IMAGE(ATOM_ASIC_INTERNAL_SS_INFO_V2,
> -                       DATA_TABLES(ASIC_InternalSS_Info));
> +       header_include = ((ATOM_ASIC_INTERNAL_SS_INFO_V2 *) bios_get_image(
> +                               &bp->base,
> +                               DATA_TABLES(ASIC_InternalSS_Info),
> +                               struct_size(header_include, asSpreadSpectrum, 1)));
>
>         size = (le16_to_cpu(header_include->sHeader.usStructureSize)
>                         - sizeof(ATOM_COMMON_TABLE_HEADER))
> @@ -1749,8 +1754,9 @@ static uint32_t get_ss_entry_number_from_internal_ss_info_tbl_V3_1(
>         if (!DATA_TABLES(ASIC_InternalSS_Info))
>                 return number;
>
> -       header_include = GET_IMAGE(ATOM_ASIC_INTERNAL_SS_INFO_V3,
> -                       DATA_TABLES(ASIC_InternalSS_Info));
> +       header_include = ((ATOM_ASIC_INTERNAL_SS_INFO_V3 *) bios_get_image(&bp->base,
> +                               DATA_TABLES(ASIC_InternalSS_Info),
> +                               struct_size(header_include, asSpreadSpectrum, 1)));
>         size = (le16_to_cpu(header_include->sHeader.usStructureSize) -
>                         sizeof(ATOM_COMMON_TABLE_HEADER)) /
>                                         sizeof(ATOM_ASIC_SS_ASSIGNMENT_V3);
> diff --git a/drivers/gpu/drm/amd/include/atombios.h b/drivers/gpu/drm/amd/include/atombios.h
> index 60c44a8a067f..4dc738c51771 100644
> --- a/drivers/gpu/drm/amd/include/atombios.h
> +++ b/drivers/gpu/drm/amd/include/atombios.h
> @@ -5146,7 +5146,7 @@ typedef struct  _ATOM_I2C_VOLTAGE_OBJECT_V3
>     UCHAR  ucVoltageControlOffset;
>     UCHAR  ucVoltageControlFlag;              // Bit0: 0 - One byte data; 1 - Two byte data
>     UCHAR  ulReserved[3];
> -   VOLTAGE_LUT_ENTRY asVolI2cLut[1];         // end with 0xff
> +   VOLTAGE_LUT_ENTRY asVolI2cLut[];         // end with 0xff
>  }ATOM_I2C_VOLTAGE_OBJECT_V3;
>
>  // ATOM_I2C_VOLTAGE_OBJECT_V3.ucVoltageControlFlag
> @@ -6679,7 +6679,7 @@ typedef struct _ATOM_ASIC_INTERNAL_SS_INFO
>  typedef struct _ATOM_ASIC_INTERNAL_SS_INFO_V2
>  {
>    ATOM_COMMON_TABLE_HEADER         sHeader;
> -  ATOM_ASIC_SS_ASSIGNMENT_V2        asSpreadSpectrum[1];      //this is point only.
> +  ATOM_ASIC_SS_ASSIGNMENT_V2        asSpreadSpectrum[];      //this is point only.
>  }ATOM_ASIC_INTERNAL_SS_INFO_V2;
>
>  typedef struct _ATOM_ASIC_SS_ASSIGNMENT_V3
> @@ -6701,7 +6701,7 @@ typedef struct _ATOM_ASIC_SS_ASSIGNMENT_V3
>  typedef struct _ATOM_ASIC_INTERNAL_SS_INFO_V3
>  {
>    ATOM_COMMON_TABLE_HEADER         sHeader;
> -  ATOM_ASIC_SS_ASSIGNMENT_V3        asSpreadSpectrum[1];      //this is pointer only.
> +  ATOM_ASIC_SS_ASSIGNMENT_V3        asSpreadSpectrum[];      //this is pointer only.
>  }ATOM_ASIC_INTERNAL_SS_INFO_V3;
>
>
> --
> 2.37.3
>
