Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B09AB29F739
	for <lists+dri-devel@lfdr.de>; Thu, 29 Oct 2020 22:57:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD3926E912;
	Thu, 29 Oct 2020 21:57:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 410446E908;
 Thu, 29 Oct 2020 21:57:04 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id n18so4383701wrs.5;
 Thu, 29 Oct 2020 14:57:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pxEzC4iXwKkMYRjWUeZ8FVw3qPnIVhPs3JqnX8Dyn5w=;
 b=bCqhzo47jGw85rQcqtMBdPjFZCPnL9SWqPqUzPqBEnVzPT3Z4LICGCDxQVeZQ4Khg0
 +5D3fPaoSAHqAzj3tlLWqh4opQHJjXOFZ2p9vvEa/wr+Av3jF5G1dMLuV+7lMJjJM/oI
 OW/Z9rTUiGD6Adc7mAolZBJly5PSx6XtD5TCW4K2sodlrbI7kdgFQMI+xcRgJQvUnuwN
 nRr+mnDVQ9zYxP3d6Ae/IY9kc1YBFce3LpxDhjU2ofW4q7BhLmeCDh5QMvr6SoJ78LTN
 wWigLf4IV+o1bYxi8c/zzfojTwIpdYA0++YGk8OVCktHLM4y7HVHSfsBK1CwIH8doRic
 RNYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pxEzC4iXwKkMYRjWUeZ8FVw3qPnIVhPs3JqnX8Dyn5w=;
 b=fNXX9gBu8brtbyL7N+QIWGpDazQ49trHW44a6R+5qnPPtk+L2SAEa3HP5tpVpoVmJa
 jigB8rMvYB3SjABnuxJ3CbLtDUP79SEeIsZZDx2QUzDhKGzPapAK107TyCEIcCZjp9FM
 16waQdkKzIhI/bmb1w8xaJ+09Vl4aYhWI3nWw5VqjA8aaLtgWMHOR8PwHx7ib2Qe4SZu
 cluOFlqwWzBRPBRkdWzYUA6ZxqEvxrDfBBF3kqFBFbcrq/bA+0kl7xKja83P61XmflnU
 0OSy7e0hWH1MjbKJulcd0lv+XzPPXP71dH4Ofg0QyydZA3Gu//b7eNhTetaWE2o2y8Hu
 Qxkg==
X-Gm-Message-State: AOAM531EfHo9SgQhgffITiibPguylW9Kda3KYNuFjW5d9n4a3TReaf9x
 p85IKWQ8Gn5/VCYbgWMSsc54Rmhmxqvadjkr6TE=
X-Google-Smtp-Source: ABdhPJzpiDfy/m0lgL/SMardM6RW4/vyeaZO9phyVOLb/QqxqHg2FFqkRZqboNDMl2qBkUsZ9GU2woxJp1tGZrB69J4=
X-Received: by 2002:adf:f181:: with SMTP id h1mr4554978wro.374.1604008622873; 
 Thu, 29 Oct 2020 14:57:02 -0700 (PDT)
MIME-Version: 1.0
References: <1603874171-106841-1-git-send-email-zou_wei@huawei.com>
In-Reply-To: <1603874171-106841-1-git-send-email-zou_wei@huawei.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 29 Oct 2020 17:56:51 -0400
Message-ID: <CADnq5_ML599ZrTkRWtjm64EvU=p-uTVEEeVN5rXh+Yz6UhV3vA@mail.gmail.com>
Subject: Re: [PATCH -next] drm/amd/display: remove useless if/else
To: Zou Wei <zou_wei@huawei.com>
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
Cc: "Leo \(Sunpeng\) Li" <sunpeng.li@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Dave Airlie <airlied@linux.ie>, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 "Deucher, Alexander" <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Wed, Oct 28, 2020 at 2:56 PM Zou Wei <zou_wei@huawei.com> wrote:
>
> Fix the following coccinelle report:
>
> ./drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c:1367:3-5:
> WARNING: possible condition with no effect (if == else)
>
> Both branches are the same, so remove the if/else altogether.
>
> Fixes: 81875979f0b2 ("drm/amd/display: Remove extra pairs of parentheses in dce_calcs.c")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Zou Wei <zou_wei@huawei.com>
> ---
>  drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c b/drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c
> index 2c6db37..e4f29cd 100644
> --- a/drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c
> +++ b/drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c
> @@ -1364,13 +1364,10 @@ static void calculate_bandwidth(
>         /*if stutter and dram clock state change are gated before cursor then the cursor latency hiding does not limit stutter or dram clock state change*/
>         for (i = 0; i <= maximum_number_of_surfaces - 1; i++) {
>                 if (data->enable[i]) {
> -                       if (dceip->graphics_lb_nodownscaling_multi_line_prefetching == 1) {
> -                               data->maximum_latency_hiding[i] = bw_add(data->minimum_latency_hiding[i], bw_mul(bw_frc_to_fixed(5, 10), data->total_dmifmc_urgent_latency));
> -                       }
> -                       else {
> -                               /*maximum_latency_hiding(i) = minimum_latency_hiding(i) + 1 / vsr(i) * h_total(i) / pixel_rate(i) + 0.5 * total_dmifmc_urgent_latency*/
> -                               data->maximum_latency_hiding[i] = bw_add(data->minimum_latency_hiding[i], bw_mul(bw_frc_to_fixed(5, 10), data->total_dmifmc_urgent_latency));
> -                       }
> +                       /*maximum_latency_hiding(i) = minimum_latency_hiding(i) + 1 / vsr(i) **/
> +                       /*      h_total(i) / pixel_rate(i) + 0.5 * total_dmifmc_urgent_latency*/
> +                       data->maximum_latency_hiding[i] = bw_add(data->minimum_latency_hiding[i],
> +                               bw_mul(bw_frc_to_fixed(5, 10), data->total_dmifmc_urgent_latency));
>                         data->maximum_latency_hiding_with_cursor[i] = bw_min2(data->maximum_latency_hiding[i], data->cursor_latency_hiding[i]);
>                 }
>         }
> --
> 2.6.2
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
