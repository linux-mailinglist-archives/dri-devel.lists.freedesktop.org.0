Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88EC436319F
	for <lists+dri-devel@lfdr.de>; Sat, 17 Apr 2021 19:49:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BEE26E5D3;
	Sat, 17 Apr 2021 17:49:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70B166E5D3;
 Sat, 17 Apr 2021 17:49:18 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id a4so29767090wrr.2;
 Sat, 17 Apr 2021 10:49:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gMhNbNGvJIy0W54t2+jjd5JvuAH30UWhJb9UCM3Fxt0=;
 b=QNgw8v1ODQ3popOSFT98BMtFTy2lrtW8i48CVEVxG4v2bh5CEilJ1jDNmncMac5W0I
 Vi0+aA3LiEpkCxZ3o3Lj2x+PdJbDstXZofauACi85ffINBtEybopFOnmAWndkzQBqumP
 MYoKs2Ukz6kOE0m6VuFparSXUncmDhI2wAvt616JxLwJOmMRFns3Ok9u2D4bZepKfsML
 yVJs8tcVNwKaDBDT/JdzseNlahAlNVs4Mg+UJiQImi7fjlvVoOaKehazrnpfwXfBfl8V
 cQpkiYlCv77bl7rB8NtVwaoG8MPGftpq44WSgiaf/uyW+oGGNS2FzgDmIv0Z/O0xJEFJ
 4Tcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gMhNbNGvJIy0W54t2+jjd5JvuAH30UWhJb9UCM3Fxt0=;
 b=HcoIuiCI8AyPIpz+F6kU4ydWHX7dEpae9n2GLjMBLCWkxWeKw7CGFjpNL3/tWwNhRY
 G0OsZHUjfJNisTytr3cC3CEomC6aYBSY81OUG4dGe5MgftCffTj/qeGW/RX7VQdzC9ch
 5MaePzCaSV3DltM7K6LW4Nap8n+QcObS1gWjYZ0sULZcwZzY+SNHA9v2n3i2nR7ylyxM
 icked1jVdbw/i3oZ2QqFQpxcbOzzcuLNq8Lv9B1oq+TU4lOgf9AvCMB+1yboksTN5N1S
 ZW6BYiGEUG/L/Pg4XWBd2Jy1gq/QeSdbDDOIXxU102Zt3ZywCoyS7L7UhkRVTB/5q5qc
 Qlxg==
X-Gm-Message-State: AOAM533N40FUDyOyzmxpaI6D7REhTqo4MrvnykBRkHwbaWbggIt0hL9R
 3/CvaHpccl7dTd17nlC8VNR1wWMYLAFrm3yigtU=
X-Google-Smtp-Source: ABdhPJzZ03PjLvSbr+EYaGObqqYd6gtKUzZhFhFFqRCVQqnl3bd+oCaXlHlIsjYz7jpf/2N8aX8WRprUkQrNrPegMV4=
X-Received: by 2002:a5d:4412:: with SMTP id z18mr5508193wrq.28.1618681757094; 
 Sat, 17 Apr 2021 10:49:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210417161912.62811-1-caleb@connolly.tech>
In-Reply-To: <20210417161912.62811-1-caleb@connolly.tech>
From: Rob Clark <robdclark@gmail.com>
Date: Sat, 17 Apr 2021 10:52:49 -0700
Message-ID: <CAF6AEGv2701e+FMKX12+rHYwLpv06-kAo364Us7wEw6pAoC7Dg@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: always parse interconnects
To: Caleb Connolly <caleb@connolly.tech>
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
Cc: Rob Clark <robdclark@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 ~postmarketos/upstreaming@lists.sr.ht, Sean Paul <sean@poorly.run>,
 Kalyan Thota <kalyant@codeaurora.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Apr 17, 2021 at 9:21 AM Caleb Connolly <caleb@connolly.tech> wrote:
>
> The WARN_ON in dpu_runtime_resume() fires constantly on non-SC7180
> platforms. As SDM845 now has interconnects hooked up we should always
> try and parse them.
>
> Fixes: 627dc55c273d ("drm/msm/disp/dpu1: icc path needs to be set before dpu runtime resume")
> Signed-off-by: Caleb Connolly <caleb@connolly.tech>

I believe this series in msm-next already solves this

https://patchwork.freedesktop.org/series/88644/

BR,
-R

> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index 85f2c3564c96..fb061e666faa 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -933,8 +933,7 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
>                 DPU_DEBUG("REG_DMA is not defined");
>         }
>
> -       if (of_device_is_compatible(dev->dev->of_node, "qcom,sc7180-mdss"))
> -               dpu_kms_parse_data_bus_icc_path(dpu_kms);
> +       dpu_kms_parse_data_bus_icc_path(dpu_kms);
>
>         pm_runtime_get_sync(&dpu_kms->pdev->dev);
>
> --
> 2.30.2
>
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
