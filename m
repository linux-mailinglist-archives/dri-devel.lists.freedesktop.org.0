Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9816F772CDC
	for <lists+dri-devel@lfdr.de>; Mon,  7 Aug 2023 19:27:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B1EA10E347;
	Mon,  7 Aug 2023 17:27:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc32.google.com (mail-oo1-xc32.google.com
 [IPv6:2607:f8b0:4864:20::c32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B82C10E347;
 Mon,  7 Aug 2023 17:27:02 +0000 (UTC)
Received: by mail-oo1-xc32.google.com with SMTP id
 006d021491bc7-56c87f89178so3252591eaf.1; 
 Mon, 07 Aug 2023 10:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691429221; x=1692034021;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0FTYO6Q7g6DrRo+pdo61jCBivg9LaG2djlrLcvb9e1E=;
 b=Lv3vsBHqQXgDi8AZ6brBOesEnAW28735Nxa6vHlPpXItg2y1F6s8v27fDHA/c6rVLh
 FkQSoVWAsoCX4bUSoBlXJkp02yNUpyKRoPtPD6+A6HOn68sUggPZ4jihh+EAyu8hAVgC
 VH6MlYE6NxRoXu8BFIV81La9ZA2X69s38Se3EV1FgvxKbRfJ1FEG6LgevcJlqyvV1DGV
 PqKQsZw2ZKd4mlf3FXWkUc3t/Jy2T8FwTP0RptR6gvMgAz5ilC8szOarnrYISVz+jv12
 4Oz4c3FPLoMqfHS5a5LFP6sFqdGgxxTglFlaVcsGnZLMgeVKfcQeTKEscT8d5ub3OWO8
 L5Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691429221; x=1692034021;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0FTYO6Q7g6DrRo+pdo61jCBivg9LaG2djlrLcvb9e1E=;
 b=azV99t5j71ON4UmP6RJOj8djbPwCFXo6axkRTmf1ZVeySH6O2mOYeH/47tO/rw4u94
 WRuxcEM1vHgebbgai4vBHZB57RSBq4zetc4ujdhiMzATDVGLsW1voRl1kTgyFRVBQOcA
 qVyqI5zVMVyEcMrYgYLAJXNvhwICEX74KPBTqs24nLEpaAQJbnf4KdsovOAcuouWErr2
 dHUHAGbBGqAnVttofUUto2mPVXZTicWK+fKVOVKs/mLRX7xbdjHvaISmJxRpMeXrNAhD
 O2tzHLjEf81LWwy6OS9d1mf0QLonYIB4lOVkucpUBTLoa/Y4KbLFHyeSUdQ1PeHk097O
 z8OA==
X-Gm-Message-State: AOJu0YwXwTaCEfXeSVurFqF7XuU03I0XTNjw0rhaQ3a2CvyzEqtU9/WM
 IDyu8hApDfDrSInIc0/+CotOrfswLg7Wpodou0+N+QY1
X-Google-Smtp-Source: AGHT+IGybLDWjyP9kyHcY8PqlPZLGDEdChaL92tTRvnj1kZ82Fq5Ds2QCKtTmB0fqMz7Xf1i6kP9Cb3kn83F8ZwuRKw=
X-Received: by 2002:a4a:3c5e:0:b0:56d:55b7:e99c with SMTP id
 p30-20020a4a3c5e000000b0056d55b7e99cmr9161465oof.1.1691429221611; Mon, 07 Aug
 2023 10:27:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230802072316.12985-1-sunran001@208suo.com>
In-Reply-To: <20230802072316.12985-1-sunran001@208suo.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 7 Aug 2023 13:26:50 -0400
Message-ID: <CADnq5_Pfo=LSvOU7T0NdDqDMk3k1LzmrT0t93OOOXvyxRAs2+A@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Clean up errors in amdgpu_atombios.h
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

On Wed, Aug 2, 2023 at 3:23=E2=80=AFAM Ran Sun <sunran001@208suo.com> wrote=
:
>
> Fix the following errors reported by checkpatch:
>
> ERROR: open brace '{' following struct go on the same line
>
> Signed-off-by: Ran Sun <sunran001@208suo.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.h | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.h b/drivers/gpu/d=
rm/amd/amdgpu/amdgpu_atombios.h
> index b639a80ee3fc..0811474e8fd3 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.h
> @@ -89,8 +89,7 @@ struct atom_memory_info {
>
>  #define MAX_AC_TIMING_ENTRIES 16
>
> -struct atom_memory_clock_range_table
> -{
> +struct atom_memory_clock_range_table {
>         u8 num_entries;
>         u8 rsv[3];
>         u32 mclk[MAX_AC_TIMING_ENTRIES];
> @@ -118,14 +117,12 @@ struct atom_mc_reg_table {
>
>  #define MAX_VOLTAGE_ENTRIES 32
>
> -struct atom_voltage_table_entry
> -{
> +struct atom_voltage_table_entry {
>         u16 value;
>         u32 smio_low;
>  };
>
> -struct atom_voltage_table
> -{
> +struct atom_voltage_table {
>         u32 count;
>         u32 mask_low;
>         u32 phase_delay;
> --
> 2.17.1
>
