Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B58F325004E
	for <lists+dri-devel@lfdr.de>; Mon, 24 Aug 2020 17:00:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B5446E29A;
	Mon, 24 Aug 2020 14:59:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FA1D6E290;
 Mon, 24 Aug 2020 14:59:58 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id h15so2274701wrt.12;
 Mon, 24 Aug 2020 07:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ECIS0WvUxPFVgMktd3Czk1dDXzjjTjHRcV5bwp6ngFM=;
 b=j/kO8WW7gObqi+5HMo+buADm2a+ih9UengrJgOL337n5w/QcYEKWJwJeubXbEMtiKN
 CVRXlXaD3Jg6gon3qEW20iuBmhjk98hPdRzD7tIEvkfL2a54/QhHZxaepO1uL59JplHQ
 5myoJF1ALxkCmikteTDObYZkb8JLR7i0sJ9kURl8MLaBZ4DfVAun0eNeBz6FXO4xkQQg
 bXNzjLeljviOdI0ywe9TbFzpUeS5/P1aUzNd/f8KAXbJZbjyiu00AR8/1BVF6ic36dn1
 ywT8qGFhc7b5soVlklRQYH8zafaQCy07MALVx3l+55ZOGqWX0VN0c1lvgsZM3gqjM58o
 QoQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ECIS0WvUxPFVgMktd3Czk1dDXzjjTjHRcV5bwp6ngFM=;
 b=ZgKdG5er6Q4T2vUK3ggNPMn0pe/P1rLyPBkXPgZOfMDZYzKd08sR6nuSR91ayWI19m
 BmK7TS+SWGu/Gr9AdKEI51uoU/z3RTSbAinirGXOvZ+fcKyoHA6Z3VT4yJuXmT/QQp3y
 6M3FIaApSm0jVu8w5l7WGAcHlkHJ/+Nt21WTTpz7iuQhq96aY/gNdc2d8swELzx+/dnB
 mHWs00h5gY79g/l3bUUeoSbF2nCOGhZ8jcgOzJghMrJrqz2Wp38Mhs3PsT00Z3KwQC1i
 hxZtQotTZrSMVoHdcP5IPG6oUuwuF8frfQNDom+7LPwc2hooGBfJsnG0lh6Ugz1REAW5
 9gRg==
X-Gm-Message-State: AOAM531uCysamS/v0Xos797zjf2hTIi4DMQGYcgEyx5dumLJ4YVF+sFG
 8GXLuj4jqAj2exQQlcvTj16FRl5GmozbD5hBqhvNnn/0
X-Google-Smtp-Source: ABdhPJxCuqKgX0AFTlWxXp2R3Wly05aExi3+NuRrzLBuuUo4hIBiE2jI2dPZrZMyJusG1E1ajD5TG3Fa5oWOUZIlgiI=
X-Received: by 2002:adf:fecc:: with SMTP id q12mr6445535wrs.374.1598281197086; 
 Mon, 24 Aug 2020 07:59:57 -0700 (PDT)
MIME-Version: 1.0
References: <88d43daf-f29b-0fbe-cf58-930e8caca0e7@infradead.org>
 <DM6PR12MB261924212A1791B949B43903E4560@DM6PR12MB2619.namprd12.prod.outlook.com>
In-Reply-To: <DM6PR12MB261924212A1791B949B43903E4560@DM6PR12MB2619.namprd12.prod.outlook.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 24 Aug 2020 10:59:46 -0400
Message-ID: <CADnq5_M7TA_w5vNctfC2vCDwxZAsGcagjsS8WNUWQGFiS--s+A@mail.gmail.com>
Subject: Re: [PATCH -next] amdgpu: fix Documentation builds for pm/ file
 movement
To: "Quan, Evan" <Evan.Quan@amd.com>
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Randy Dunlap <rdunlap@infradead.org>, LKML <linux-kernel@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Sun, Aug 23, 2020 at 11:00 PM Quan, Evan <Evan.Quan@amd.com> wrote:
>
> [AMD Official Use Only - Internal Distribution Only]
>
> Thanks for fixing this. The patch is reviewed-by: Evan Quan <evan.quan@amd.com>
>
> BR
> Evan
> -----Original Message-----
> From: Randy Dunlap <rdunlap@infradead.org>
> Sent: Monday, August 24, 2020 6:36 AM
> To: dri-devel <dri-devel@lists.freedesktop.org>; LKML <linux-kernel@vger.kernel.org>; amd-gfx@lists.freedesktop.org; Deucher, Alexander <Alexander.Deucher@amd.com>
> Cc: Quan, Evan <Evan.Quan@amd.com>; Stephen Rothwell <sfr@canb.auug.org.au>
> Subject: [PATCH -next] amdgpu: fix Documentation builds for pm/ file movement
>
> From: Randy Dunlap <rdunlap@infradead.org>
>
> Fix Documentation errors for amdgpu.rst due to file rename (moved to another subdirectory).
>
> Error: Cannot open file ../drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c
> WARNING: kernel-doc '../scripts/kernel-doc -rst -enable-lineno -function hwmon ../drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c' failed with return code 1
>
> Fixes: e098bc9612c2 ("drm/amd/pm: optimize the power related source code layout")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Evan Quan <evan.quan@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> ---
>  Documentation/gpu/amdgpu.rst |   24 ++++++++++++------------
>  1 file changed, 12 insertions(+), 12 deletions(-)
>
> --- linux-next-20200821.orig/Documentation/gpu/amdgpu.rst
> +++ linux-next-20200821/Documentation/gpu/amdgpu.rst
> @@ -153,7 +153,7 @@ This section covers hwmon and power/ther  HWMON Interfaces
>  ----------------
>
> -.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c
> +.. kernel-doc:: drivers/gpu/drm/amd/pm/amdgpu_pm.c
>     :doc: hwmon
>
>  GPU sysfs Power State Interfaces
> @@ -164,52 +164,52 @@ GPU power controls are exposed via sysfs  power_dpm_state  ~~~~~~~~~~~~~~~
>
> -.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c
> +.. kernel-doc:: drivers/gpu/drm/amd/pm/amdgpu_pm.c
>     :doc: power_dpm_state
>
>  power_dpm_force_performance_level
>  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
> -.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c
> +.. kernel-doc:: drivers/gpu/drm/amd/pm/amdgpu_pm.c
>     :doc: power_dpm_force_performance_level
>
>  pp_table
>  ~~~~~~~~
>
> -.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c
> +.. kernel-doc:: drivers/gpu/drm/amd/pm/amdgpu_pm.c
>     :doc: pp_table
>
>  pp_od_clk_voltage
>  ~~~~~~~~~~~~~~~~~
>
> -.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c
> +.. kernel-doc:: drivers/gpu/drm/amd/pm/amdgpu_pm.c
>     :doc: pp_od_clk_voltage
>
>  pp_dpm_*
>  ~~~~~~~~
>
> -.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c
> +.. kernel-doc:: drivers/gpu/drm/amd/pm/amdgpu_pm.c
>     :doc: pp_dpm_sclk pp_dpm_mclk pp_dpm_socclk pp_dpm_fclk pp_dpm_dcefclk pp_dpm_pcie
>
>  pp_power_profile_mode
>  ~~~~~~~~~~~~~~~~~~~~~
>
> -.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c
> +.. kernel-doc:: drivers/gpu/drm/amd/pm/amdgpu_pm.c
>     :doc: pp_power_profile_mode
>
>  *_busy_percent
>  ~~~~~~~~~~~~~~
>
> -.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c
> +.. kernel-doc:: drivers/gpu/drm/amd/pm/amdgpu_pm.c
>     :doc: gpu_busy_percent
>
> -.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c
> +.. kernel-doc:: drivers/gpu/drm/amd/pm/amdgpu_pm.c
>     :doc: mem_busy_percent
>
>  gpu_metrics
>  ~~~~~~~~~~~~~~~~~~~~~
>
> -.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c
> +.. kernel-doc:: drivers/gpu/drm/amd/pm/amdgpu_pm.c
>     :doc: gpu_metrics
>
>  GPU Product Information
> @@ -239,7 +239,7 @@ serial_number
>  unique_id
>  ---------
>
> -.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c
> +.. kernel-doc:: drivers/gpu/drm/amd/pm/amdgpu_pm.c
>     :doc: unique_id
>
>  GPU Memory Usage Information
> @@ -289,7 +289,7 @@ PCIe Accounting Information  pcie_bw
>  -------
>
> -.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c
> +.. kernel-doc:: drivers/gpu/drm/amd/pm/amdgpu_pm.c
>     :doc: pcie_bw
>
>  pcie_replay_count
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
