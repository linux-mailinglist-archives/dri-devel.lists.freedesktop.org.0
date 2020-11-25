Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 502E52C5042
	for <lists+dri-devel@lfdr.de>; Thu, 26 Nov 2020 09:24:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 312066E849;
	Thu, 26 Nov 2020 08:24:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C1116E916
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Nov 2020 11:24:50 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id q22so3725019qkq.6
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Nov 2020 03:24:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=agmpj2HBmWrLN3MVuSVDvn8VNwMgC/NxRRqXNQElq+c=;
 b=Xek41XwpQigUAOEeTJBGHWL790+lASvVIv15zxh3iAJ1zijkjfVfs9eVex27OfCuXA
 kJdW59wrQn1P9fA1QwhwcZG8R3hzDh9VApTT6RicMbfuwQCmYi2DVJmFpe27824jWafL
 Z+HcAq9jhCmUjGVHK+2nF2Y/jqCEFBtWVYC3vbbXALj0NjPLbNx1snXzCd9TOUOPyQPa
 TsvhSX5+VzpEoHmFpb834YUk/5gmOhFG8ZSqrIOfyJ2NHQ/nf0TtsQsaTxmrSe24nIZS
 OyTVn5zFIQ+IEXvHDeNaqtrmH18lXKQrB6Xafri4msJHpPoeH8lbmXm1OqF8yFBOBMB+
 hrlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=agmpj2HBmWrLN3MVuSVDvn8VNwMgC/NxRRqXNQElq+c=;
 b=Uduc5V52p2bLMINnKdo3mCwrBFUrgNU9EDzNak0Wx7qdbRZN/uSw7GH9fTJEzKVVRm
 QT3wnyaZqySYhPMuHAFDhXtdHYn7MVYWXJ0yws9k+ckS8gAl2MYwa5aNLuVmVoHVFmIA
 tiPIhodBT1q1WJH/x7iMFhG1bXrFMxsVnhCRrxgVFVEkd+h6LBdtt+OzAIlc1QbvvD7i
 RcXef4GVGXDOmlAWhoAvkv67ngWRLJbgH0A8S4YPCOoHjxnraNJB7S5KpGAWccW75177
 LJ//G3EKtDdz/Nis4vGhLJmkr7ol4KAQMADo/VEWoa+DWeXDfk5HyrVua5H9m5+/6uVv
 xjkw==
X-Gm-Message-State: AOAM533Lh2An4gXEr6z31kQM0Mmi5Mz4f4ItUXKsQWrEcdIY0b9UmPf9
 QCUN1Tcx4Gpvj9KavBCtHfV45vJQhEHeBJEp0ewTkg==
X-Google-Smtp-Source: ABdhPJwWhnzD0lDZFoqtnfER27VsEtm05heWcR/zUGhYgUn6H9hWU74Sr5XzjkLVg9dn0GVTJoyr0OxmFzYOq0n5cUA=
X-Received: by 2002:a25:7481:: with SMTP id p123mr3005268ybc.167.1606303489272; 
 Wed, 25 Nov 2020 03:24:49 -0800 (PST)
MIME-Version: 1.0
References: <1606298560-3003-1-git-send-email-kalyan_t@codeaurora.org>
In-Reply-To: <1606298560-3003-1-git-send-email-kalyan_t@codeaurora.org>
From: Amit Pundir <amit.pundir@linaro.org>
Date: Wed, 25 Nov 2020 16:54:13 +0530
Message-ID: <CAMi1Hd3fjrJXJ1puZ6SCn0FXPNZdoJh19GALcVr_R93tZnxW_w@mail.gmail.com>
Subject: Re: [v1] drm/msm/dpu: consider vertical front porch in the prefill bw
 calculation
To: Kalyan Thota <kalyan_t@codeaurora.org>
X-Mailman-Approved-At: Thu, 26 Nov 2020 08:24:08 +0000
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
Cc: dt <devicetree@vger.kernel.org>,
 Krishna Manikandan <mkrishn@codeaurora.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Raviteja Tamatam <travitej@codeaurora.org>,
 lkml <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Doug Anderson <dianders@chromium.org>, Sean Paul <seanpaul@chromium.org>,
 abhinavk@codeaurora.org, ddavenport@chromium.org,
 "Kristian H. Kristensen" <hoegsberg@chromium.org>,
 Stephen Boyd <swboyd@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>, y@qualcomm.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 25 Nov 2020 at 15:33, Kalyan Thota <kalyan_t@codeaurora.org> wrote:
>
> In case of panels with low vertical back porch, the prefill bw
> requirement will be high as we will have less time(vbp+pw) to
> fetch and fill the hw latency buffers before start of first line
> in active period.
>
> For ex:
> Say hw_latency_line_buffers = 24, and if blanking vbp+pw = 10
> Here we need to fetch 24 lines of data in 10 line times.
> This will increase the bw to the ratio of linebuffers to blanking.
>
> DPU hw can also fetch data during vertical front porch provided
> interface prefetch is enabled. Use vfp in the prefill calculation
> as dpu driver enables prefetch if the blanking is not sufficient
> to fill the latency lines.

Tested on Xiaomi Poco F1 (sdm845).

Tested-by: Amit Pundir <amit.pundir@linaro.org>

>
> Signed-off-by: Kalyan Thota <kalyan_t@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index 7ea90d2..315b999 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -151,7 +151,7 @@ static void _dpu_plane_calc_bw(struct drm_plane *plane,
>         u64 plane_bw;
>         u32 hw_latency_lines;
>         u64 scale_factor;
> -       int vbp, vpw;
> +       int vbp, vpw, vfp;
>
>         pstate = to_dpu_plane_state(plane->state);
>         mode = &plane->state->crtc->mode;
> @@ -164,6 +164,7 @@ static void _dpu_plane_calc_bw(struct drm_plane *plane,
>         fps = drm_mode_vrefresh(mode);
>         vbp = mode->vtotal - mode->vsync_end;
>         vpw = mode->vsync_end - mode->vsync_start;
> +       vfp = mode->vsync_start - mode->vdisplay;
>         hw_latency_lines =  dpu_kms->catalog->perf.min_prefill_lines;
>         scale_factor = src_height > dst_height ?
>                 mult_frac(src_height, 1, dst_height) : 1;
> @@ -176,7 +177,13 @@ static void _dpu_plane_calc_bw(struct drm_plane *plane,
>                 src_width * hw_latency_lines * fps * fmt->bpp *
>                 scale_factor * mode->vtotal;
>
> -       do_div(plane_prefill_bw, (vbp+vpw));
> +       if ((vbp+vpw) > hw_latency_lines)
> +               do_div(plane_prefill_bw, (vbp+vpw));
> +       else if ((vbp+vpw+vfp) < hw_latency_lines)
> +               do_div(plane_prefill_bw, (vbp+vpw+vfp));
> +       else
> +               do_div(plane_prefill_bw, hw_latency_lines);
> +
>
>         pstate->plane_fetch_bw = max(plane_bw, plane_prefill_bw);
>  }
> --
> 2.7.4
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
