Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 619C96D4BDE
	for <lists+dri-devel@lfdr.de>; Mon,  3 Apr 2023 17:29:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AC5310E0DA;
	Mon,  3 Apr 2023 15:28:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E2E810E4D5
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Apr 2023 15:28:56 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id h11so31612676lfu.8
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Apr 2023 08:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680535734;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kPrYDdekg0I0RRl5/w+irR1rQMqphVIrp6PinKuObBw=;
 b=hmqvElmrXWJQcUaSjMqNlMYt7VMO5e+YWgeZceMhEr3KKNjrq5vpft3N1tQrJwj8i4
 spJfLHjKk/NeKfJ1DNkS3z4DysUz8zSMacTKa8dxfJuYReoOfj4964HdGF3YD3TypsvH
 kuc6ozrwD7DsG9hMFup6LsPS7DYSGjBjh0KPaXb/MBflDirA7jBV+6La+sxympQFOhJB
 +i7T9WKkMTujomHn2C/+firfbVi0mx9ZRMiTVWRsg9L+6Dkin3IpkVWfpCKix6Xk6p2j
 94B9k2XKDYhrXH0W3gth/aac1tOFI6rwL6UfsPAphUxScAuonKUd1k51P1YEco5Oa34p
 nPwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680535734;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kPrYDdekg0I0RRl5/w+irR1rQMqphVIrp6PinKuObBw=;
 b=4BxAE1Kg3/OJ1Sy/+xIq+1Nl2Zgwp02lBTcGbHya6Bu8zfcn7XmJLUV3F10cFbyL0h
 oYmG7i+qdUt1hX45v/3lNjt4Jp7vHSvnrxJyGkvuvl6fW8gZQ3zW/KQu6CCTj00vuXFW
 S+qqtBVVfggLOrNTjsxI+nmMjIaDyVOB4RdRMq8h0pX/E8O9Jcw1zDvk1PJikK+HkY38
 DVyjco/0AYcKsrZY3xLQqgqYNIcvUbA4dmmQaoAo7S7pQBGSHQeLlfFXgOWVAmyjskbe
 TbOW5fK76i02uqR4g1KwdGcKU++CuMN/hdTfmVfZdJpBjaStgYbHOfsaZhhPB5IKCMd9
 mZAg==
X-Gm-Message-State: AAQBX9f6a1wazKHeIWsxMaypOC/Ky5dwXFGDjkvAckEVMqGrM6YAFNUX
 WpSIaWRPKd8L31iIVhXVbOE7pQ==
X-Google-Smtp-Source: AKy350b95P/uSTgREdLEfWsH6IoiTIqaKI1+nr+mYyy4HAI6QLDWwdnTFFIlZWhlWMb7ONSwCX7yew==
X-Received: by 2002:a05:6512:3c2:b0:4dd:98c6:ee2 with SMTP id
 w2-20020a05651203c200b004dd98c60ee2mr9940947lfp.15.1680535734467; 
 Mon, 03 Apr 2023 08:28:54 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 w6-20020ac24426000000b004cb14fa604csm1815299lfl.262.2023.04.03.08.28.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Apr 2023 08:28:54 -0700 (PDT)
Message-ID: <0e75e04d-fc07-2f60-bfb9-ee092075fae6@linaro.org>
Date: Mon, 3 Apr 2023 18:28:53 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v1 3/3] msm: skip the atomic commit of self refresh while
 PSR running
Content-Language: en-GB
To: Vinod Polimera <quic_vpolimer@quicinc.com>,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
References: <1680271114-1534-1-git-send-email-quic_vpolimer@quicinc.com>
 <1680271114-1534-4-git-send-email-quic_vpolimer@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1680271114-1534-4-git-send-email-quic_vpolimer@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: quic_kalyant@quicinc.com, quic_sbillaka@quicinc.com, dianders@chromium.org,
 quic_bjorande@quicinc.com, quic_abhinavk@quicinc.com,
 quic_vproddut@quicinc.com, linux-kernel@vger.kernel.org,
 quic_khsieh@quicinc.com, swboyd@chromium.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 31/03/2023 16:58, Vinod Polimera wrote:
> In certain CPU stress conditions, there can be a delay in scheduling commit
> work and it was observed that PSR commit from a different work queue was
> scheduled. Avoid these commits as display is already in PSR mode.
> 
> Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>
> ---
>   drivers/gpu/drm/msm/msm_atomic.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/msm_atomic.c b/drivers/gpu/drm/msm/msm_atomic.c
> index 645fe53..f8141bb 100644
> --- a/drivers/gpu/drm/msm/msm_atomic.c
> +++ b/drivers/gpu/drm/msm/msm_atomic.c
> @@ -192,6 +192,9 @@ int msm_atomic_check(struct drm_device *dev, struct drm_atomic_state *state)

The corresponding patch is not yet applied. I wonder how this was tested.

>   			new_crtc_state->mode_changed = true;
>   			state->allow_modeset = true;
>   		}
> +
> +		if (old_crtc_state->self_refresh_active && new_crtc_state->self_refresh_active)
> +			return -EINVAL;
>   	}
>   
>   	return drm_atomic_helper_check(dev, state);

-- 
With best wishes
Dmitry

