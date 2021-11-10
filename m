Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E533544C52C
	for <lists+dri-devel@lfdr.de>; Wed, 10 Nov 2021 17:38:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3A236EB8E;
	Wed, 10 Nov 2021 16:38:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [IPv6:2607:f8b0:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44BEA6EB8E;
 Wed, 10 Nov 2021 16:38:30 +0000 (UTC)
Received: by mail-ot1-x331.google.com with SMTP id
 b5-20020a9d60c5000000b0055c6349ff22so4700465otk.13; 
 Wed, 10 Nov 2021 08:38:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8O7Ml++eH7v9/z2actv39rMvzGZ2e5JQKOxsiMZkTw8=;
 b=QrM7VQvAnnZJ+TvjkxLiZWGPxMIb6hTI8O6pku+JNbhr+GNHksX50FBzWCL1NcPRrr
 ydiJVDCElnod0CfXF2MmbbFg5JO2BXRZBCH14a/m5izYRxI8ohrc44PuyhY7I383RMWt
 DqjUlJPcD1KmcXUx+uSc4ioHT5lmNYExE5E6Oi95EgoFBSfsdWvHoT7Syq138NPWdFdm
 zfm/hQk7HxfTd237Z/PAW2EeQVH3NT0S0dtcZkrxVurbweYQwrNTT/5T4s7NpPbkWOL1
 zA/qePUjm60vNWz/y1vrd2rcQcSY3QmexqZBO+KwlB5bMib1W5IJdDnoj5t2U3X1RpfB
 WQNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8O7Ml++eH7v9/z2actv39rMvzGZ2e5JQKOxsiMZkTw8=;
 b=xdmrXEQsxcHQI3R1sz+KYP+0fvG37tlMjvEquIvuGfcveEX7SsRubTik1ju5emLkI1
 Esa0vq0VxuuIO4ApNEiSPrbW03cfDtSt4CjHJe1Ik/rxRYTGCKkcto4qxldQPVNf1b9g
 eUtDEhqH8E3bU6U7hrR0YuHLr2xke7NfpiiIYoXH/xxYTK9tAdxG7qTVuFBrnbzbqfMM
 aTOUm2zCO0qnLATmSY6yYKtyqgm9UP+JG6+YbcVaj5xxB7n7Y+IgsjIIKDFRialWCXmU
 4LlRaZo02bLAtvxIwZVP3FsIeF4tpbnvSA+EPW++moS+nZpqsuHw4teoHt4Mu2XbZrO9
 TSew==
X-Gm-Message-State: AOAM532H+0V36RbHAqQ/xfkON3RA+KDP0cCbfR4nwKV8uXlNqzQsEjrS
 MAf69QZCDZvzng24FouKIwcDnRPOA5FVcXzyeqI=
X-Google-Smtp-Source: ABdhPJx1W5gm5rRuISODGf7o+AkWxNCzJKvkNJD+nfmrH51sWHNEB4hodQX5h1cBPs9UGfyTt5Kb+f3snNFQM3W6aL4=
X-Received: by 2002:a9d:6855:: with SMTP id c21mr432308oto.357.1636562309606; 
 Wed, 10 Nov 2021 08:38:29 -0800 (PST)
MIME-Version: 1.0
References: <20211110055303.136782-1-ran.jianping@zte.com.cn>
In-Reply-To: <20211110055303.136782-1-ran.jianping@zte.com.cn>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 10 Nov 2021 11:38:18 -0500
Message-ID: <CADnq5_OsymFzMqPGGkpST-Bm6rL_6tw_xjW9Lm-hTZsrNZoKvA@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: remove unneeded variable
To: CGEL <cgel.zte@gmail.com>
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
Cc: xinhui pan <Xinhui.Pan@amd.com>, Chengming Gui <Jack.Gui@amd.com>,
 Dave Airlie <airlied@linux.ie>, Zeal Robot <zealci@zte.com.cn>, "Lazar,
 Lijo" <lijo.lazar@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, "Tuikov,
 Luben" <luben.tuikov@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>, ran jianping <ran.jianping@zte.com.cn>,
 "Quan, Evan" <evan.quan@amd.com>, Kenneth Feng <kenneth.feng@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Wed, Nov 10, 2021 at 12:53 AM <cgel.zte@gmail.com> wrote:
>
> From: ran jianping <ran.jianping@zte.com.cn>
>
> Fix the following coccicheck review:
> ./drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c:1174:14-18
> :Unneeded variable
>
> Remove unneeded variable used to store return value.
>
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: ran jianping <ran.jianping@zte.com.cn>
> ---
>  drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c
> index a4108025fe29..b0bb389185d5 100644
> --- a/drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c
> +++ b/drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c
> @@ -1171,7 +1171,7 @@ static int sienna_cichlid_force_clk_levels(struct smu_context *smu,
>                                    enum smu_clk_type clk_type, uint32_t mask)
>  {
>         struct amdgpu_device *adev = smu->adev;
> -       int ret = 0, size = 0;
> +       int ret = 0;
>         uint32_t soft_min_level = 0, soft_max_level = 0, min_freq = 0, max_freq = 0;
>
>         soft_min_level = mask ? (ffs(mask) - 1) : 0;
> @@ -1216,7 +1216,7 @@ static int sienna_cichlid_force_clk_levels(struct smu_context *smu,
>         if ((clk_type == SMU_GFXCLK) || (clk_type == SMU_SCLK))
>                 amdgpu_gfx_off_ctrl(adev, true);
>
> -       return size;
> +       return 0;
>  }
>
>  static int sienna_cichlid_populate_umd_state_clk(struct smu_context *smu)
> --
> 2.25.1
>
