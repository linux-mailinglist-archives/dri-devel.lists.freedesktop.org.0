Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C6351594E4
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2020 17:27:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40B236EEB2;
	Tue, 11 Feb 2020 16:27:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E66456EEA3;
 Tue, 11 Feb 2020 16:27:18 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id k11so13117749wrd.9;
 Tue, 11 Feb 2020 08:27:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Bb55gTYbvX5LbdEf+EUAlbMGla2WoqoUJ8i650G+fRc=;
 b=bWg35xF/yD9pqZ9r9gAfcFYbcO01dATtpd5p/Yu+BmIBqo+lRQ7+4bsut1tsRWTfl8
 ToapJrBfwq6ld3O/77RBF5A79hiOM6g53wO86v0uru9JZHUyJafV178juS00IiaXfjAe
 9pGroEiCI1KvXxFiQhXBU1zOAE3dv4jVg2ed1BQvvhevAE33L4S4WpnjFLif2zoIOgBC
 lVi8zE6ih4CZRsKn5tpzo6dd5D1pro92eh6b1R9vnZRMtYQBvnjX9bwHlrxsLCw/KV3u
 6u84QJPojqmGpfz+rDkMuVWm5A5qe2jRENq8gsrIXsz6I3e+XyVF7K8vM58p/7rPxR7l
 KyAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Bb55gTYbvX5LbdEf+EUAlbMGla2WoqoUJ8i650G+fRc=;
 b=PwC0eEO8Ec2S6t0yVtdTSA8E4ZBNQrwvHeTyvq7qRkMJBgnq7dk28zYiwHJTL3WK+6
 hYhWQRGI6wOjnz+yGers03MWsvgfk+xyb8Hk289j8uyWTu41xslqk8vtqqxpodlCABZF
 8Q68RVRiAUMh6Q8JTUdfeN5K5Flzir5ackemf9Bezkws3jFgKnkb314aYc6Fy/nkG2Bb
 2d++REULWq0EC1xeVEQq9wXRRHRv0Q4wFv/9zNECe3AjZrUJXrj6YIm2NuWIDQ0iA1Or
 5YEyHmArrQK3VIkP8r064Bt+/BFZZHBFbRhzol/wfbpkDuzDofYOpC3TOFSAMfmTwb6p
 1xZw==
X-Gm-Message-State: APjAAAV+keyR0rJWN1fL+1AIklNo4BChJUryHtIluGc/4dHG/WPfzLuS
 WQikAWYLmvndyOUxP2DT/d+h9JQjm6IJsqgd/C8=
X-Google-Smtp-Source: APXvYqxJIVk57by6TFkLMzF0DpAckbyFa0fFzF1uA/eHJG2PTvQ3sdvui9aGi+JIzbggU7p4lUEdYv2UQenZQmQYUyM=
X-Received: by 2002:adf:ec4c:: with SMTP id w12mr9786904wrn.124.1581438437502; 
 Tue, 11 Feb 2020 08:27:17 -0800 (PST)
MIME-Version: 1.0
References: <20200210150826.35200-1-yuehaibing@huawei.com>
In-Reply-To: <20200210150826.35200-1-yuehaibing@huawei.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 11 Feb 2020 11:27:06 -0500
Message-ID: <CADnq5_My4OM4CvDHHWN3MxVKAon78pvbw71mO2yzer-FdxYu1w@mail.gmail.com>
Subject: Re: [RFC PATCH -next] drm/amd/display: Remove set but not unused
 variable 'stream_status'
To: YueHaibing <yuehaibing@huawei.com>
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
Cc: Eric Yang <Eric.Yang2@amd.com>, Yongqiang Sun <yongqiang.sun@amd.com>,
 Charlene Liu <charlene.liu@amd.com>, "Leo \(Sunpeng\) Li" <sunpeng.li@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Dave Airlie <airlied@linux.ie>,
 Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Martin Leung <martin.leung@amd.com>, "Deucher,
 Alexander" <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>, Anthony Koo <Anthony.Koo@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 10, 2020 at 10:38 AM YueHaibing <yuehaibing@huawei.com> wrote:
>
> drivers/gpu/drm/amd/amdgpu/../display/dc/dcn10/dcn10_hw_sequencer.c:
>  In function dcn10_post_unlock_program_front_end:
> drivers/gpu/drm/amd/amdgpu/../display/dc/dcn10/dcn10_hw_sequencer.c:2623:29:
>  warning: variable stream_status set but not used [-Wunused-but-set-variable]
>
> commit bbf5f6c3f83b ("drm/amd/display: Split program front end part that occur outside lock")
> involved this unused variable.
>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Applied.  Thanks!

Alex

> ---
>  drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c
> index 42fcfee..b2ed0fa 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c
> @@ -2610,7 +2610,7 @@ void dcn10_post_unlock_program_front_end(
>                 struct dc *dc,
>                 struct dc_state *context)
>  {
> -       int i, j;
> +       int i;
>
>         DC_LOGGER_INIT(dc->ctx->logger);
>
> @@ -2620,14 +2620,8 @@ void dcn10_post_unlock_program_front_end(
>                 if (!pipe_ctx->top_pipe &&
>                         !pipe_ctx->prev_odm_pipe &&
>                         pipe_ctx->stream) {
> -                       struct dc_stream_status *stream_status = NULL;
>                         struct timing_generator *tg = pipe_ctx->stream_res.tg;
>
> -                       for (j = 0; j < context->stream_count; j++) {
> -                               if (pipe_ctx->stream == context->streams[j])
> -                                       stream_status = &context->stream_status[j];
> -                       }
> -
>                         if (context->stream_status[i].plane_count == 0)
>                                 false_optc_underflow_wa(dc, pipe_ctx->stream, tg);
>                 }
> --
> 2.7.4
>
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
