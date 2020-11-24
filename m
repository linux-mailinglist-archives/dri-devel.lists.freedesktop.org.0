Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B6F32C2D07
	for <lists+dri-devel@lfdr.de>; Tue, 24 Nov 2020 17:37:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A34A6E4B5;
	Tue, 24 Nov 2020 16:37:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A95D6E4B5;
 Tue, 24 Nov 2020 16:37:05 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id t4so10028876wrr.12;
 Tue, 24 Nov 2020 08:37:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=D8z5dUSRrl31L37ZHuzIVMwY+qduRSvxquBzIWeK1EA=;
 b=CP0mL9qyVcg3I0wRgcqt4n4v/oW5jFZdIR00tPbAx/omKbEV+qAUIQLgGdOqJrQSjd
 h4/W2NkDS3Xyv7HgYsadJ9ugSljPPtKoSTMz8/vkpYaPI/74khn8dtm8vF27VIIxbXvB
 Rzf4TTJZZ8UPEpU3WakrVDpcEw/YVeZdKayQx2mbBl/+T6nBLhPZBtgkkX9punvKAiF6
 syOjvrD//GOdyumN24EIkwCrIUAaj0MND21hfUfj7poC3RXk4HVX1LFKrAOJ3uBn1Z7w
 Bc1UOLwpDnwVS21NQHgnP2PUVMDjHISxPpG4c0zUHjeuhRjXCaLBhDh/PNIDOaLymj2b
 /9oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=D8z5dUSRrl31L37ZHuzIVMwY+qduRSvxquBzIWeK1EA=;
 b=eYPZjIjhnpAN1YI94ea5ST9N/ibjgSlvpTzgh4/LRaG2E4mBYvEU8maq9NwLKE8Xk0
 Siwu3Aaho6pip+SOzo2+joqO5AIskimts+ip9HH+G36hr6UrG4ucL3Jfs9UYYnDERzWF
 tiXON3EGdBOCB8pOQSnsgy0mn7mmi4lHGctDAc3gmbnRNrWzZHiJSMfOFvsP9wnXvf6u
 84uD+NvAp7+b1ZFibNzqPr4h0J1s48lKgRqs06RhiQ8OYwPE0u/DWm0LSUIjoflI/8Zz
 atBQVxvnJLObH9idRcDH0ygttNGBTUCXbyFO4iMzprlLw1ELK1ZyEowbnlmWSVjKitYO
 Pg+Q==
X-Gm-Message-State: AOAM530kIDMC/S4cVyfnvfmHMkmxkIofNAtyT3zGKT22k4Bz4d/QfRis
 pIAchVFl2e9zhGgWaa6jPYegfJrZiFCiwZjtRqc=
X-Google-Smtp-Source: ABdhPJzfxDMC7ETJE9yWHcvshWf4V3ciNOuGH8E1IA2nDwH0ep/3485i7wz8onEl34b1p3KBHYSz6fri9+kQaZZcCLw=
X-Received: by 2002:adf:e9c9:: with SMTP id l9mr6416532wrn.124.1606235823983; 
 Tue, 24 Nov 2020 08:37:03 -0800 (PST)
MIME-Version: 1.0
References: <20201123105417.198314-1-colin.king@canonical.com>
 <DM6PR12MB26197807564F833B9A2E18E8E4FB0@DM6PR12MB2619.namprd12.prod.outlook.com>
In-Reply-To: <DM6PR12MB26197807564F833B9A2E18E8E4FB0@DM6PR12MB2619.namprd12.prod.outlook.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 24 Nov 2020 11:36:52 -0500
Message-ID: <CADnq5_OHzmR4SE4GXukZX2Z2byqYkMRy-G2EXUTvz+yuwsE6fw@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/powerplay: fix spelling mistake
 "smu_state_memroy_block" -> "smu_state_memory_block"
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
Cc: "Gui, Jack" <Jack.Gui@amd.com>, David Airlie <airlied@linux.ie>, "Wang,
 Kevin\(Yang\)" <Kevin1.Wang@amd.com>,
 "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, Colin King <colin.king@canonical.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Mon, Nov 23, 2020 at 7:42 PM Quan, Evan <Evan.Quan@amd.com> wrote:
>
> [AMD Official Use Only - Internal Distribution Only]
>
> Reviewed-by: Evan Quan <evan.quan@amd.com>
>
> -----Original Message-----
> From: Colin King <colin.king@canonical.com>
> Sent: Monday, November 23, 2020 6:54 PM
> To: Deucher, Alexander <Alexander.Deucher@amd.com>; Koenig, Christian <Christian.Koenig@amd.com>; David Airlie <airlied@linux.ie>; Daniel Vetter <daniel@ffwll.ch>; Quan, Evan <Evan.Quan@amd.com>; Wang, Kevin(Yang) <Kevin1.Wang@amd.com>; Gui, Jack <Jack.Gui@amd.com>; amd-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org
> Cc: kernel-janitors@vger.kernel.org; linux-kernel@vger.kernel.org
> Subject: [PATCH] drm/amd/powerplay: fix spelling mistake "smu_state_memroy_block" -> "smu_state_memory_block"
>
> From: Colin Ian King <colin.king@canonical.com>
>
> The struct name smu_state_memroy_block contains a spelling mistake, rename it to smu_state_memory_block
>
> Fixes: 8554e67d6e22 ("drm/amd/powerplay: implement power_dpm_state sys interface for SMU11")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/gpu/drm/amd/pm/inc/amdgpu_smu.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/pm/inc/amdgpu_smu.h b/drivers/gpu/drm/amd/pm/inc/amdgpu_smu.h
> index 7550757cc059..a559ea2204c1 100644
> --- a/drivers/gpu/drm/amd/pm/inc/amdgpu_smu.h
> +++ b/drivers/gpu/drm/amd/pm/inc/amdgpu_smu.h
> @@ -99,7 +99,7 @@ struct smu_state_display_block {
>  bool              enable_vari_bright;
>  };
>
> -struct smu_state_memroy_block {
> +struct smu_state_memory_block {
>  bool              dll_off;
>  uint8_t                 m3arb;
>  uint8_t                 unused[3];
> @@ -146,7 +146,7 @@ struct smu_power_state {
>  struct smu_state_validation_block             validation;
>  struct smu_state_pcie_block                   pcie;
>  struct smu_state_display_block                display;
> -struct smu_state_memroy_block                 memory;
> +struct smu_state_memory_block                 memory;
>  struct smu_state_software_algorithm_block     software;
>  struct smu_uvd_clocks                         uvd_clocks;
>  struct smu_hw_power_state                     hardware;
> --
> 2.28.0
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
