Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FD3432219C
	for <lists+dri-devel@lfdr.de>; Mon, 22 Feb 2021 22:39:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C6A488830;
	Mon, 22 Feb 2021 21:39:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [IPv6:2607:f8b0:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C143E88830;
 Mon, 22 Feb 2021 21:39:40 +0000 (UTC)
Received: by mail-oi1-x22b.google.com with SMTP id o3so5845358oic.8;
 Mon, 22 Feb 2021 13:39:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=bpwLuoH4voXjwzIWIXFj730L/u03ILuA10nlROuAAPg=;
 b=RtSm4vGAQI/k15Zc+MhbWThYoVIHUBjRuiLTgwMzhNx9gW+mM8DVoSBXcJ6KwFyLl7
 NADk5NS010JkZuflRXd5PV8s441E+xM5z1LqqW793M+o15pzmWBPJsh42ng0IF5HPS78
 /X7OHqNoetoB66FJwwXIs21AF2rD68zJBzkFdA4Cnt0ZzpbmSt5atLW07DoekekBQJz5
 Y07Kz+PG2nxYw0Eyr94zVgFwXyvZGoGj2CIrpTsnr2gvOpAflaryBTciwv+/z8z72cdY
 0334AjBlMLr8s/oZTftypjnYuhuHl1HyofiulEBY8zKxtMi+nZXvgzTtL7NHqxZDQA0h
 ts2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=bpwLuoH4voXjwzIWIXFj730L/u03ILuA10nlROuAAPg=;
 b=FRdU/p5tfN0mUZfkx8q9ffFK75zDmjkruTK9bozisLx/1SAwJw6v/Qod+BmIdVyON8
 p3zdd2Hw6Klx+acwgIRGOfKJMDHVdFPK00BWTvVQDEtUXR6vR8A2K6AVc8cCXszYl1av
 xZO7jXj0Acixo8nKGE6GZ6pHuigo5hHk0SFwbt8QDHbsXWPM+ajRz8/GnlLWCVFtzmHb
 7UdH+HNl+y17i/LkA6ZqpLKU+6kVnG5GjxbZMib0GyD5zePD6FuGNuEfXoo+K/dRmQUR
 Iw2/VlnsdpAn4Mv18938mWeB2AhPPQQ7qrLwM7aNCG4bqcHc7iTiyUq8ZYYI/3DoKCYp
 mgEA==
X-Gm-Message-State: AOAM530hMlztqiDXJxXJH1zQsnhzHck8gVI5XOl13+HL+aYADrYsswAH
 Z31i/BC14N5YljGjpbSwfYOIrPhKY+mX5HkcNaU=
X-Google-Smtp-Source: ABdhPJz+XTEBh9rMRWrP+PL5NjbeiM01iVf+NigQOaTQ4Euq6MJtWEU8l9nuBVdXGl6KOkHStItZEKJQdkzgpo2u6Rk=
X-Received: by 2002:aca:fccb:: with SMTP id a194mr7832287oii.5.1614029980194; 
 Mon, 22 Feb 2021 13:39:40 -0800 (PST)
MIME-Version: 1.0
References: <1613789706-100430-1-git-send-email-jiapeng.chong@linux.alibaba.com>
 <DM6PR12MB2619934BA14F887DF37BF2C2E4819@DM6PR12MB2619.namprd12.prod.outlook.com>
In-Reply-To: <DM6PR12MB2619934BA14F887DF37BF2C2E4819@DM6PR12MB2619.namprd12.prod.outlook.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 22 Feb 2021 16:39:29 -0500
Message-ID: <CADnq5_MW6S+MH4U4Za6NN3XNPhKqVtKJ67ZycdPQfbn1xhX2Wg@mail.gmail.com>
Subject: Re: [PATCH v2] drm/amdgpu/swsmu/navi1x: Remove unnecessary conversion
 to bool
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
Cc: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Sun, Feb 21, 2021 at 10:15 PM Quan, Evan <Evan.Quan@amd.com> wrote:
>
> [AMD Official Use Only - Internal Distribution Only]
>
> Reviewed-by: Evan Quan <evan.quan@amd.com>
>
> -----Original Message-----
> From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> On Behalf Of Jiapeng Chong
> Sent: Saturday, February 20, 2021 10:55 AM
> To: Deucher, Alexander <Alexander.Deucher@amd.com>
> Cc: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>; airlied@linux.ie; linux-kernel@vger.kernel.org; dri-devel@lists.freedesktop.org; amd-gfx@lists.freedesktop.org; daniel@ffwll.ch; Koenig, Christian <Christian.Koenig@amd.com>
> Subject: [PATCH v2] drm/amdgpu/swsmu/navi1x: Remove unnecessary conversion to bool
>
> Fix the following coccicheck warnings:
>
> ./drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c:900:47-52: WARNING:
> conversion to bool not needed here.
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> ---
>  drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c
> index cd7efa9..58028a7 100644
> --- a/drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c
> +++ b/drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c
> @@ -897,7 +897,7 @@ static bool navi10_is_support_fine_grained_dpm(struct smu_context *smu, enum smu
>         dpm_desc = &pptable->DpmDescriptor[clk_index];
>
>         /* 0 - Fine grained DPM, 1 - Discrete DPM */
> -       return dpm_desc->SnapToDiscrete == 0 ? true : false;
> +       return dpm_desc->SnapToDiscrete == 0;
>  }
>
>  static inline bool navi10_od_feature_is_supported(struct smu_11_0_overdrive_table *od_table, enum SMU_11_0_ODFEATURE_CAP cap)
> --
> 1.8.3.1
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Famd-gfx&amp;data=04%7C01%7Cevan.quan%40amd.com%7C443a5df938954827326108d8d6582201%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637495021310885387%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=6ETadiVbRBgbXfEbkXbxTX%2F1Ozg1wp3Nr9lHGF3SKHk%3D&amp;reserved=0
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
