Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65A7023402E
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jul 2020 09:37:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C31676EA13;
	Fri, 31 Jul 2020 07:37:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B7586E969
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jul 2020 20:52:04 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id y3so26111714wrl.4
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jul 2020 13:52:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sNQBhS7/TXLnuBaPJWGWRsQsFBSRrqawtzX8JhhIouk=;
 b=CBoJ2b24vgzFcivcALEjMgSA99rMeCMANwn1Vt2DLSpjaKdWZszhgXW8MtjGenxbMJ
 BOPMYPR8mlZnVuwZctaGzWvqUTpjCUuXAHK/cmcLrrWh5tW4Z9gxLVXIeQa1on6qNiYj
 0XxDW1OM66WUEghPc4g4AJ6FxEV7dlZVNSOMR2c9X1C7PSkG4I/qF9f9r04lgNSkozLO
 gunC+ioLtfWhVHr1J8k9Xw68bEkYpxCr0A5+T6fbQdtY3uW3ya833H0mrlscYyViUVxS
 +zsheqI2fMX6LgzTmxQBL5N81TODqu1N6ai0Ph2K52KaNQaum0kYO4ytk6ckfoQx0QWU
 Bacw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sNQBhS7/TXLnuBaPJWGWRsQsFBSRrqawtzX8JhhIouk=;
 b=GVw7/YfL06ggpezwjS1SynXc4fSR1J+N0oPe6VkIer5AyeYVQWXT4Q71sNJJsyU4c5
 868QZJDHRqSEfg5hEVgOGoYV8NjjFZ51gcz529JIX4Uh+65QQ+Cd/XmkPjPHYgHsWUbT
 eGVdpjrtmw+/Bpd6rT7R60U/QLBxK1Bc91UxxZPNVHxc4Bom5kcQ4wQjYtWAyTF3bb3l
 esACWVy15U9RNeJilIiSd7kSv2ptuUsB+/rK5qo3BIXG9MdhZzAYX6iMWzB+VtS+aYVK
 8nuDVXL+9SGiE8Q5QI3pfFprlppHZ42QLXOQvQJntA5VLuERpWfbiMEML4OocEsx/UD2
 X+mQ==
X-Gm-Message-State: AOAM533e7CD9dbO5Ja7OmJz8SODhqDzFS8wWetsdrVehNWPC49b+9z37
 JZZq0XgeCFk7SMIcCKGH0kiB6rWofOWjz25CLlbOPA==
X-Google-Smtp-Source: ABdhPJxDgRl/9ZgCFmOaT5JPiqE/grxj5wZw4lSsGR7jhPrRnIbadzcC+0YX7MIInKKf4u/DcAuREV5aPKnCYc60CVI=
X-Received: by 2002:adf:a19e:: with SMTP id u30mr460027wru.274.1596142322855; 
 Thu, 30 Jul 2020 13:52:02 -0700 (PDT)
MIME-Version: 1.0
References: <1596116336-23147-1-git-send-email-kalyan_t@codeaurora.org>
In-Reply-To: <1596116336-23147-1-git-send-email-kalyan_t@codeaurora.org>
From: Kristian Kristensen <hoegsberg@google.com>
Date: Thu, 30 Jul 2020 13:51:51 -0700
Message-ID: <CAOPc6T=+Yx=+QzOr+6f3SXZXPqE-FTKkis4a+pODnGM5pxyTVQ@mail.gmail.com>
Subject: Re: [v1] drm/msm/dpu: Fix scale params in plane validation
To: Kalyan Thota <kalyan_t@codeaurora.org>
X-Mailman-Approved-At: Fri, 31 Jul 2020 07:36:08 +0000
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, mkrishn@codeaurora.org,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, travitej@codeaurora.org,
 open list <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Doug Anderson <dianders@chromium.org>, Sean Paul <seanpaul@chromium.org>,
 hoegsberg <hoegsberg@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 30, 2020 at 6:39 AM Kalyan Thota <kalyan_t@codeaurora.org> wrote:
>
> Plane validation uses an API drm_calc_scale which will
> return src/dst value as a scale ratio.
>
> when viewing the range on a scale the values should fall in as
>
> Upscale ratio < Unity scale < Downscale ratio for src/dst formula
>
> Fix the min and max scale ratios to suit the API accordingly.
>
> Signed-off-by: Kalyan Thota <kalyan_t@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index 6379fe1..e46dcb9 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -946,9 +946,9 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
>                 crtc_state = drm_atomic_get_new_crtc_state(state->state,
>                                                            state->crtc);
>
> -       min_scale = FRAC_16_16(1, pdpu->pipe_sblk->maxdwnscale);
> +       min_scale = FRAC_16_16(1, pdpu->pipe_sblk->maxupscale);
>         ret = drm_atomic_helper_check_plane_state(state, crtc_state, min_scale,
> -                                         pdpu->pipe_sblk->maxupscale << 16,
> +                                         pdpu->pipe_sblk->maxdwnscale << 16,
>                                           true, true);
>         if (ret) {
>                 DPU_DEBUG_PLANE(pdpu, "Check plane state failed (%d)\n", ret);

Right, I can see how the drm convention of scaling factor being from
dest to src (ie 2x scaling up src to dst is as scale factor of 0.5).
Thanks for fixing this,

Tested-by: Kristian H. Kristensen <hoegsberg@google.com>
Reviewed-by: Kristian H. Kristensen <hoegsberg@google.com>

> --
> 1.9.1
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
