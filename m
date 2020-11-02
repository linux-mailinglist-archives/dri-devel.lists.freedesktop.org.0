Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F2A22A3E9A
	for <lists+dri-devel@lfdr.de>; Tue,  3 Nov 2020 09:16:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BE1A6EC21;
	Tue,  3 Nov 2020 08:14:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc41.google.com (mail-oo1-xc41.google.com
 [IPv6:2607:f8b0:4864:20::c41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBF276E1BD
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Nov 2020 18:21:47 +0000 (UTC)
Received: by mail-oo1-xc41.google.com with SMTP id v123so3578811ooa.5
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Nov 2020 10:21:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=xRQ0CcPYOKhYGnMLgxmXXhFo34bjmKd0lXwyZmV5goY=;
 b=pMjqPLADOae/tAXYMIGENJtu4YmHlq1z4uQT2H7/S8VZEulMPLPBOCVMkQLErEAkN5
 7cWln7Ih2Toagjj9H1v1zRPCVbc0HJcUxAGANyLOn/FfBQIY6fVM625nfDDkQ8XVfYlt
 KzlErXfYI4xN/QyURH2sX/suWRpDJ85f/bVDNjh7qr0dt6UKRvOp5y5WCo0XYR/8cJWO
 5+fYnIL1JeDTDm5ySd2ULLIZdPrwE1wGCXPAZRDjSps8bM/lpJsO0ZRExJn4bk8Fj8+q
 rxv/GTkNF5526s06R3YUsCDLmjcfYXyZzPtYUaUXIeIwIqzX+MfeT7RN0g5vZbeVsl/F
 N8JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=xRQ0CcPYOKhYGnMLgxmXXhFo34bjmKd0lXwyZmV5goY=;
 b=So+k6EtFg+EHONz2K+SDAsjRNnFUZTZFRf+juDo+JraxoALkWiqvnbJIPykjP1mfzk
 0mDuevO0XV+9UPF1jzpMCAW+EyB9yi8BMDelnUjrye4D/KpAwJQJb9fZtJGz0tHaB/rM
 FAsKPuV/sOvUUUYxjQrXfLAb8q4TRofoiR5rfdkeMhFW7kpgTmlNCwJri7rtD99jPH0c
 Bba0SptQ/UQLGIonJt3vHxDzm5HPHg7RZ+oDj3uF9cBA6SPbJ0+P6tRnSGXjGCiONKYy
 I3MI1Fb4Ti0tKRpIaQPvheR38Kigic/epuufMVZTaDJfhamwc0+38JMQ0d6xDDmFz72f
 DjBw==
X-Gm-Message-State: AOAM530gIANjAyejblHs31RIE2JUevCzL8Rouh3LRkraa35UUFcn/d+o
 KAqtMel6A5Yb1EK5AZH6bEeYug==
X-Google-Smtp-Source: ABdhPJzMMVGvhuvlkpsuzCCvBxYHqtTOzTsVqRH582t2kvcDB0+hJcsYmcZrjoWbMCQ9LZ/9XEzZBg==
X-Received: by 2002:a4a:d554:: with SMTP id q20mr12886552oos.23.1604341306983; 
 Mon, 02 Nov 2020 10:21:46 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id b8sm3555544oov.29.2020.11.02.10.21.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2020 10:21:46 -0800 (PST)
Date: Mon, 2 Nov 2020 12:21:44 -0600
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH] drm/msm/dpu: fix clock scaling on non-sc7180 board
Message-ID: <20201102182144.GK3151@builder.lan>
References: <20201027102304.945424-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201027102304.945424-1-dmitry.baryshkov@linaro.org>
X-Mailman-Approved-At: Tue, 03 Nov 2020 08:14:25 +0000
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Kalyan Thota <kalyan_t@codeaurora.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue 27 Oct 05:23 CDT 2020, Dmitry Baryshkov wrote:

> c33b7c0389e1 ("drm/msm/dpu: add support for clk and bw scaling for
> display") has added support for handling bandwidth voting in kms path in
> addition to old mdss path. However this broke all other platforms since
> _dpu_core_perf_crtc_update_bus() will now error out instead of properly
> calculating bandwidth and core clocks. Fix
> _dpu_core_perf_crtc_update_bus() to just skip bandwidth setting instead
> of returning an error in case kms->num_paths == 0 (MDSS is used for
> bandwidth management).
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Thanks Dmitry,
Bjorn

> Fixes: c33b7c0389e1 ("drm/msm/dpu: add support for clk and bw scaling for display")
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> index 393858ef8a83..37c8270681c2 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> @@ -219,9 +219,6 @@ static int _dpu_core_perf_crtc_update_bus(struct dpu_kms *kms,
>  	int i, ret = 0;
>  	u64 avg_bw;
>  
> -	if (!kms->num_paths)
> -		return -EINVAL;
> -
>  	drm_for_each_crtc(tmp_crtc, crtc->dev) {
>  		if (tmp_crtc->enabled &&
>  			curr_client_type ==
> @@ -239,6 +236,9 @@ static int _dpu_core_perf_crtc_update_bus(struct dpu_kms *kms,
>  		}
>  	}
>  
> +	if (!kms->num_paths)
> +		return 0;
> +
>  	avg_bw = perf.bw_ctl;
>  	do_div(avg_bw, (kms->num_paths * 1000)); /*Bps_to_icc*/
>  
> -- 
> 2.28.0
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
