Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 49747772AED
	for <lists+dri-devel@lfdr.de>; Mon,  7 Aug 2023 18:33:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 145EB10E2CC;
	Mon,  7 Aug 2023 16:33:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x31.google.com (mail-oa1-x31.google.com
 [IPv6:2001:4860:4864:20::31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAA1F10E2C8;
 Mon,  7 Aug 2023 16:33:02 +0000 (UTC)
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-1bef8f0904eso3460325fac.2; 
 Mon, 07 Aug 2023 09:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691425982; x=1692030782;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Xyv2Ai8G6V59y/N5vBsqZfF6gA3n7Ds45WJJHRAYVC8=;
 b=NQX76BCOk/+2efqOSj8cNKLVHOsCRIJbntEvlmB9b3zrcky5wgMTIUcaw4wQEJSAr6
 qJ6/EElIlKUr4ztPrd++6fJ6AyAFE0j8CMyuLZKbXiJpQu3jzBOjtGWsvRFNxYFx6yxD
 4WGHGe3DbsX4B1dJtrr19XyXtind4830Qb1N8CrNdp7BDSZd4IFfw+kXugYlFFls7ADW
 RK3SnyyshNV1AwxMSjYuA1Vap77n9x2ogpHMOdAu+AI5Mm1KvB3SCUj1VqkMckKi40om
 ba1wZ/bQp6IBo/SkdGh1Ex+8KT5mXVBxFyy7xAopNTs3em6aZCcpV6h66QIKPr/nmvnK
 Ggcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691425982; x=1692030782;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Xyv2Ai8G6V59y/N5vBsqZfF6gA3n7Ds45WJJHRAYVC8=;
 b=F9rwZBBoPqsX40eLNsgu+a5znEII68d1Uuxab9W9pCeij9jAdCnq/ZqVimby0bsVCX
 xlibzth2Irh/QdZ+FEe05DxwBhav0KxTpIL/kJvizLqWJSR35EkORYWEHGej8nztAOvb
 GHyfWphXqKuXJGxX8O972+BrIhwGpuB0ZRAmW7mdPPB5i/GpOS1QUpj1Pa2Kq+dURCDP
 5F6xua/6Gt26QcQe9dTNmGYqYaWobw86xjjGOeP6tXogvNiJVNgttUuCknhT3hywEM/u
 oj6L94OXXHMkvZTehpf8RWJCXc9eaQMcbXcxwYnnyJkPLG3no18kNOfYwP24wSUFV/uq
 UvEA==
X-Gm-Message-State: AOJu0Yym62DAT8pu/I7dfGWTpZ0+MLkhGHzlkHMDR9XW/Tp383q4JVQS
 6t4zBt02+cM2eGhLP2z3cUWuLYZiHfXU+b0rY8ik/6JM
X-Google-Smtp-Source: AGHT+IEv0wSPqpzLjRH4T7IC9t0Cqdza37V3DEkz92T/k1+NQ5jEsfTCnO6IqACa6NIHr+9PGfuSxtBa+FwOnLb0sdo=
X-Received: by 2002:a05:6870:5494:b0:1be:cf5d:6f7b with SMTP id
 f20-20020a056870549400b001becf5d6f7bmr11550277oan.17.1691425981935; Mon, 07
 Aug 2023 09:33:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230801060443.6090-1-sunran001@208suo.com>
In-Reply-To: <20230801060443.6090-1-sunran001@208suo.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 7 Aug 2023 12:32:51 -0400
Message-ID: <CADnq5_OEG9hHxR7wgse7x3ibzH9q=bL66wCAhS2fDyTmRjeKqQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/pm: Clean up errors in vega12_pptable.h
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
Cc: linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, alexander.deucher@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Tue, Aug 1, 2023 at 2:04=E2=80=AFAM Ran Sun <sunran001@208suo.com> wrote=
:
>
> Fix the following errors reported by checkpatch:
>
> ERROR: open brace '{' following struct go on the same line
> ERROR: space prohibited before open square bracket '['
>
> Signed-off-by: Ran Sun <sunran001@208suo.com>
> ---
>  .../gpu/drm/amd/pm/powerplay/hwmgr/vega12_pptable.h   | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega12_pptable.h b/dr=
ivers/gpu/drm/amd/pm/powerplay/hwmgr/vega12_pptable.h
> index bf4f5095b80d..9b8435a4d306 100644
> --- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega12_pptable.h
> +++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega12_pptable.h
> @@ -72,8 +72,7 @@ enum ATOM_VEGA12_PPCLOCK_ID {
>  typedef enum ATOM_VEGA12_PPCLOCK_ID ATOM_VEGA12_PPCLOCK_ID;
>
>
> -typedef struct _ATOM_VEGA12_POWERPLAYTABLE
> -{
> +typedef struct _ATOM_VEGA12_POWERPLAYTABLE {
>        struct atom_common_table_header sHeader;
>        UCHAR  ucTableRevision;
>        USHORT usTableSize;
> @@ -92,11 +91,11 @@ typedef struct _ATOM_VEGA12_POWERPLAYTABLE
>        USHORT usODPowerSavePowerLimit;
>        USHORT usSoftwareShutdownTemp;
>
> -      ULONG PowerSavingClockMax  [ATOM_VEGA12_PPCLOCK_COUNT];
> -      ULONG PowerSavingClockMin  [ATOM_VEGA12_PPCLOCK_COUNT];
> +      ULONG PowerSavingClockMax[ATOM_VEGA12_PPCLOCK_COUNT];
> +      ULONG PowerSavingClockMin[ATOM_VEGA12_PPCLOCK_COUNT];
>
> -      ULONG ODSettingsMax [ATOM_VEGA12_ODSETTING_COUNT];
> -      ULONG ODSettingsMin [ATOM_VEGA12_ODSETTING_COUNT];
> +      ULONG ODSettingsMax[ATOM_VEGA12_ODSETTING_COUNT];
> +      ULONG ODSettingsMin[ATOM_VEGA12_ODSETTING_COUNT];
>
>        USHORT usReserve[5];
>
> --
> 2.17.1
>
