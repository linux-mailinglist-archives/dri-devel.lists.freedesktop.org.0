Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D88BB467D14
	for <lists+dri-devel@lfdr.de>; Fri,  3 Dec 2021 19:17:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA97F7B2C2;
	Fri,  3 Dec 2021 18:17:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0FCA7B2C2
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Dec 2021 18:17:09 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id bi37so8514621lfb.5
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Dec 2021 10:17:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Pvwka+nQK0UfHFY3XxiSjtliqkg8sD5ZuyxOIxv5Cbs=;
 b=eIZxsWUwapXBrA560XcorJL8NqT1ntAWDUua+GJsnFNktaz/q6rhH2kj69fPiKJfme
 wdsA+qXnTzMm73W0MJytDuUILbe1cjL926x4EcZmvL7yWKyZYQq6X2XgBubpBwvmTmjq
 XNQ0A+Q+kK2S2rYPr91qC1zcozFLyrCVPLSWYZNotxJailRpu2aPFze12TNVTibkvJ2F
 6euQtrTzFj7X0k3n9vBCk9eH4vuWcdd/bhb0kUh6y0INWm/+A8HsB2wPi62MFi6kt7Pr
 j7gbIqKfj/j9qHACc9kMVWUpfReJcdcF8KuMZFF9dw+zyzoL4gPAjZQ+6avWwqM6O+tA
 xkMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Pvwka+nQK0UfHFY3XxiSjtliqkg8sD5ZuyxOIxv5Cbs=;
 b=HZ1MEkvY9hPDyGhB/Pw6yFWN3fmMYJa/jPK3xeG/37PVpg/YUczMYq6zj5ZUymvUjT
 osHcU0vTLL2IRrchcJwqF9qLL0AmbpaGRC+53KUJ0D20YLqd4On16FMS2zfGOs1G7RIW
 B8jfO5lyCwVmuNXWmpJ6vuTNA2lLWD9vQ9sU85hJFzIlIxDA2W+fUrg5BvLxSXTKWF0J
 uBJFAnjyIzcQwgR6rJNKyCoAwIBG4Aog5xi2QJaShENg/Xsy2PGRCLgKVRSIyyk+IBEO
 mXuHo9wGa7WmbECGgATW7DKvazwewx9DslI2kVKQJMEdVUhqfRGZSAFeKU9Foe6SEPoC
 An0Q==
X-Gm-Message-State: AOAM531UyyEp5uwAC5iMwwSTcLt4Xwc47kwJDyzD+3C8olfoc8NIfzhE
 DIt8QGx27Bu3NzxeM6tEcjeWfQ==
X-Google-Smtp-Source: ABdhPJyKiAVCfe8d7jmNoqLFibh1Ce2dZGkb1WnECK82kC0o6EOkx6AYO0XZDzDfXVAgjTPEvo0Njg==
X-Received: by 2002:a19:7408:: with SMTP id v8mr18384090lfe.392.1638555428078; 
 Fri, 03 Dec 2021 10:17:08 -0800 (PST)
Received: from [192.168.1.8] ([185.24.52.156])
 by smtp.gmail.com with ESMTPSA id p3sm456437lfh.124.2021.12.03.10.17.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Dec 2021 10:17:07 -0800 (PST)
Message-ID: <93020f22-0048-e0e7-5df5-144c3e705b84@linaro.org>
Date: Fri, 3 Dec 2021 21:17:06 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH -next] drm: remove node from list before freeing the node
Content-Language: en-GB
To: Yang Li <yang.lee@linux.alibaba.com>, robdclark@gmail.com
References: <1638502612-113708-1-git-send-email-yang.lee@linux.alibaba.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1638502612-113708-1-git-send-email-yang.lee@linux.alibaba.com>
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
Cc: freedreno@lists.freedesktop.org, airlied@linux.ie,
 linux-arm-msm@vger.kernel.org, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, sean@poorly.run
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 03/12/2021 06:36, Yang Li wrote:
> fix the following smatch warning:
> drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c:1675 dpu_plane_init() warn:
> '&pdpu->mplane_list' not removed from list
> 
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index ca190d9..aad238b 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -1672,6 +1672,7 @@ struct drm_plane *dpu_plane_init(struct drm_device *dev,
>   	if (pdpu && pdpu->pipe_hw)
>   		dpu_hw_sspp_destroy(pdpu->pipe_hw);
>   clean_plane:
> +	list_del(&pdpu->mplane_list);
>   	kfree(pdpu);
>   	return ERR_PTR(ret);
>   }
> 


-- 
With best wishes
Dmitry
