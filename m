Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A4DD11AB907
	for <lists+dri-devel@lfdr.de>; Thu, 16 Apr 2020 09:00:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D2956EAF2;
	Thu, 16 Apr 2020 06:59:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22D366E905
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 13:59:04 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id j2so19315116wrs.9
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 06:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=EBkkrpN1JldiWzSdxdAKYWJCIXmqL3+YV8OzsPNmat0=;
 b=uhm/3Ie067i5hmZbiX2s7iEa4gWmMkn8zbCB4zZaAW2ORNX91MNCZ1jjcIP2/VorVP
 0BWzv5pngsWGFBCw4zaa6/QCszdSQZGd3p+/AnYWU6bqiJY3RbF2suB+Zb8cejKklafp
 8eyfo1ph5zmV+bu0Jbls5JAQZhsmFXvyZvh9+V5ftlg+tmYah8xsHbYaBSAoiCOLpxJY
 q+MNSbvB0FOwAW98wNf4CSSU9Ke2DINk2cT382hefJv/wgdBUdDR2FJ1sVh7oa9dhY/r
 9UATB1+AKF/8/EpWd4/LTrDOGuzpUj2QFx29lwSJU5NQTCnhlAs0w0aEs09AmRlicHrB
 iIjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :message-id:date:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=EBkkrpN1JldiWzSdxdAKYWJCIXmqL3+YV8OzsPNmat0=;
 b=jXrQ7Xy2XFMVfhgEdtrTjnyakxcSrq3oGleF3Y5WLNGY3J9SKk+tTfr8Fs1+0Rni5q
 ZCAIXDWt6wysfMLOL771FeEfRChsF/Qnc7LKN4NgCuu9GAOdEeR36sVwowE3HyrRoOa2
 gOEext9HLYJW0XnUZXOUr+Yloh/8v5DeHjKZ9VYRQQunpmrPpvsJFifJ/0ut7d/F4YQO
 +MO2vLfrFZwQSUl7UOb7yzmXRown4ycl/xfoMbLhe6CaVy6kT+aeQ7NeiMlqLFLRIH2U
 YaxdaZWBt/ei5hpsFd8igPmtVv2GLl7OEhCO26WbqbIYd912KMoOb+vk3QYJXqka5acu
 QJWA==
X-Gm-Message-State: AGi0PuZi5q05GhZ/thlktDazuqJ7MBsIXE3GR0sFtYG7zGmF1tccnOi5
 KawcL1AeBjnBVgyK/WZhLHP0Kg==
X-Google-Smtp-Source: APiQypJ0Sml9Mx5kPP3Urh14rrw/Ewpj/dAuPK1uPUm+XmXE7vf4+a6LRdBe8N24mjTc8FePKZI03w==
X-Received: by 2002:a5d:4d8f:: with SMTP id b15mr8157211wru.107.1586959142726; 
 Wed, 15 Apr 2020 06:59:02 -0700 (PDT)
Received: from [192.168.0.136] ([87.120.218.65])
 by smtp.googlemail.com with ESMTPSA id n6sm22158491wmc.28.2020.04.15.06.59.01
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 15 Apr 2020 06:59:01 -0700 (PDT)
Subject: Re: [v2 1/3] drm/msm/dpu: add support for clk and bw scaling for
 display
To: Krishna Manikandan <mkrishn@codeaurora.org>
References: <1585810370-6099-1-git-send-email-mkrishn@codeaurora.org>
From: Georgi Djakov <georgi.djakov@linaro.org>
Openpgp: preference=signencrypt
Autocrypt: addr=georgi.djakov@linaro.org; prefer-encrypt=mutual; keydata=
 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
 KEmKjLDvB0pePJkdTw==
Message-ID: <80ce1cfd-59ac-6565-bcbd-a6816592e586@linaro.org>
Date: Wed, 15 Apr 2020 16:59:00 +0300
MIME-Version: 1.0
In-Reply-To: <1585810370-6099-1-git-send-email-mkrishn@codeaurora.org>
Content-Language: en-US
X-Mailman-Approved-At: Thu, 16 Apr 2020 06:59:07 +0000
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 seanpaul@chromium.org, kalyan_t@codeaurora.org, hoegsberg@chromium.org,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Krishna,

Thanks for the patch!

On 4/2/20 09:52, Krishna Manikandan wrote:
> This change adds support to scale src clk and bandwidth as
> per composition requirements.
> 
> Interconnect registration for bw has been moved to mdp
> device node from mdss to facilitate the scaling.

No Signed-off-by ?

> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c  | 106 +++++++++++++++++++++----
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c |   5 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h |   4 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c        |  37 ++++++++-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h        |   4 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c       |   9 ++-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c      |  82 +++++++++++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h      |   4 +
>  8 files changed, 228 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c

[..]
> @@ -186,10 +247,21 @@ static int _dpu_core_perf_crtc_update_bus(struct dpu_kms *kms,
>  			perf.max_per_pipe_ib = max(perf.max_per_pipe_ib,
>  					dpu_cstate->new_perf.max_per_pipe_ib);
>  
> -			DPU_DEBUG("crtc=%d bw=%llu\n", tmp_crtc->base.id,
> -					dpu_cstate->new_perf.bw_ctl);
> +			perf.bw_ctl += dpu_cstate->new_perf.bw_ctl;
> +
> +			DPU_DEBUG("crtc=%d bw=%llu paths:%d\n",
> +				  tmp_crtc->base.id,
> +				  dpu_cstate->new_perf.bw_ctl, kms->num_paths);
>  		}
>  	}
> +
> +	avg_bw = kms->num_paths ?
> +			perf.bw_ctl / kms->num_paths : 0;
> +
> +	for (i = 0; i < kms->num_paths; i++)
> +		icc_set_bw(kms->path[i],
> +			Bps_to_icc(avg_bw), (perf.max_per_pipe_ib));

In what units is max_per_pipe_ib? Can you use Bps_to_icc() or KBps_to_icc()?

> +
>  	return ret;
>  }
>

[..]

> @@ -1037,8 +1065,15 @@ static int __maybe_unused dpu_runtime_resume(struct device *dev)
>  	struct drm_encoder *encoder;
>  	struct drm_device *ddev;
>  	struct dss_module_power *mp = &dpu_kms->mp;
> +	int i;
>  
>  	ddev = dpu_kms->dev;
> +
> +	/* Min vote of BW is required before turning on AXI clk */
> +	for (i = 0; i < dpu_kms->num_paths; i++)
> +		icc_set_bw(dpu_kms->path[i], 0,
> +			dpu_kms->catalog->perf.min_dram_ib);

Bps_to_icc() ?

Thanks,
Georgi
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
