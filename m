Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3611115E6A2
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2020 17:49:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E8AF6E828;
	Fri, 14 Feb 2020 16:49:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86A1A6E828;
 Fri, 14 Feb 2020 16:49:32 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id z3so11692194wru.3;
 Fri, 14 Feb 2020 08:49:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YOBa47sfB4zGlt/eSqmdr7tVajGz1eh8XyouzGHZTXA=;
 b=FNX3ZTo7L6hK1EJbxDuzGg93cWg/xmbLJWlVdWTgc+1FogMSsT6a3vu4ssxq3MWWlH
 0a85jSPJgIvWWMN8lE+lwL26e5plRyOKGXvgnvRUQYWI0/wJK3e2xgcMk3AZHCaylqBj
 0yMjs8bunFNhHd2Fgz42dKJpQsT+408waOxwEsPW9meV0VehP/pd47mu+14+FgL1Hy1i
 adQ2f/QyVYC9hiEI/meR0ac89wfrF1j2RxOg2NJME6FOOi7Es5ZRAa5+ri68X6DvlHDH
 UkZEVxgRf5OMUn/Rxtncg9oD4fexwzdHWGj/VdY26yA/T0gk4KeZlwuAGvLM6yg/X96R
 qkcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YOBa47sfB4zGlt/eSqmdr7tVajGz1eh8XyouzGHZTXA=;
 b=fElofi/xRWRoj33wW16IcguQXhFPZ9OWvfHjjSyeMdmGN5XNuuO/uwuy9kdQIme8y/
 K1xLS/SfoFYYSzFyU6zUSo01vBNdnDTmblVAWLOCT3B2vCBpMmG4oC1MVvr0MXiPzVyz
 JDUijvAF6mVX+rgsdpqNw+zebj99jgz4seuLfd/okTXe49ws0BHG7sKlP2NgsqCr0Tl0
 ZyD7gjL7uXzoCL7q1Bu96ZkhjsjymhDzyshv86aBeEKdSkmVkOA6s0IH/RhFMMbR5cjN
 jlroY2gaiAbPv4SNrZjlqEVf3tenA2eHF81sYic2umNd23fDLZQbcYarOjG9hyiN6C5t
 fQXg==
X-Gm-Message-State: APjAAAVCXk0s0TSDURUf7J30QepUgzYoNeO7J2FCxCGn+awFg6VgPwzW
 uVyJ/W6DPjWutWbxiegHfiv5tB6z3I57CR/FMYM=
X-Google-Smtp-Source: APXvYqxKeiQx6w2kj07XUMKdeqQDJA9gMVv/ylGoEkmKSG2AofVbH9t2OsP5D5vsIQzNmIOPHSPfc1T6F3njsJwzMKQ=
X-Received: by 2002:adf:b254:: with SMTP id y20mr4851957wra.362.1581698971153; 
 Fri, 14 Feb 2020 08:49:31 -0800 (PST)
MIME-Version: 1.0
References: <20200214161147.15842-1-sashal@kernel.org>
 <20200214161147.15842-246-sashal@kernel.org>
In-Reply-To: <20200214161147.15842-246-sashal@kernel.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 14 Feb 2020 11:49:20 -0500
Message-ID: <CADnq5_O500gd2yFfF0VuyAt5CCirAwb+HzLcpSwM5C3VBC660w@mail.gmail.com>
Subject: Re: [PATCH AUTOSEL 4.19 246/252] drm/amdgpu/smu10: fix
 smu10_get_clock_by_type_with_voltage
To: Sasha Levin <sashal@kernel.org>
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
Cc: LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, "for 3.8" <stable@vger.kernel.org>,
 Evan Quan <evan.quan@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 14, 2020 at 11:17 AM Sasha Levin <sashal@kernel.org> wrote:
>
> From: Alex Deucher <alexander.deucher@amd.com>
>
> [ Upstream commit 1064ad4aeef94f51ca230ac639a9e996fb7867a0 ]
>
> Cull out 0 clocks to avoid a warning in DC.
>
> Bug: https://gitlab.freedesktop.org/drm/amd/issues/963

Same comment as for 5.5.  All of the upstream patches that reference
that bug need to be applied or they all need to be dropped.

Alex

> Reviewed-by: Evan Quan <evan.quan@amd.com>
> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
>  drivers/gpu/drm/amd/powerplay/hwmgr/smu10_hwmgr.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/powerplay/hwmgr/smu10_hwmgr.c b/drivers/gpu/drm/amd/powerplay/hwmgr/smu10_hwmgr.c
> index 3fa6e8123b8eb..48e31711bc68f 100644
> --- a/drivers/gpu/drm/amd/powerplay/hwmgr/smu10_hwmgr.c
> +++ b/drivers/gpu/drm/amd/powerplay/hwmgr/smu10_hwmgr.c
> @@ -1048,9 +1048,11 @@ static int smu10_get_clock_by_type_with_voltage(struct pp_hwmgr *hwmgr,
>
>         clocks->num_levels = 0;
>         for (i = 0; i < pclk_vol_table->count; i++) {
> -               clocks->data[i].clocks_in_khz = pclk_vol_table->entries[i].clk  * 10;
> -               clocks->data[i].voltage_in_mv = pclk_vol_table->entries[i].vol;
> -               clocks->num_levels++;
> +               if (pclk_vol_table->entries[i].clk) {
> +                       clocks->data[clocks->num_levels].clocks_in_khz = pclk_vol_table->entries[i].clk  * 10;
> +                       clocks->data[clocks->num_levels].voltage_in_mv = pclk_vol_table->entries[i].vol;
> +                       clocks->num_levels++;
> +               }
>         }
>
>         return 0;
> --
> 2.20.1
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
