Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A5EFB62648F
	for <lists+dri-devel@lfdr.de>; Fri, 11 Nov 2022 23:21:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CD3210E8E3;
	Fri, 11 Nov 2022 22:21:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25A2010E8E2
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Nov 2022 22:21:01 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id u11so5966642ljk.6
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Nov 2022 14:21:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+o26oEY0qputXYTzAwwAYZekOHht/31yMfdtXZlzRR4=;
 b=CajQqRg+YwrZ8d/8ZoG3Wh0AIkat4euF0GVNVtQ74LDdgNz7DT/1Q1wuSW4ETzQL8w
 KTFpjw4yXwC+fGQrB9yb4smZx6azpYNXg39ep+Rs6MzVsnICsH7yNpZk5ZPmHACbCYMF
 c/XRpQczDvqzf3kfrnqA+KlGHwUwgdmyD64Giji18ng/E0aw+Npm02CEyA0U/btitstA
 fYFl2MIzfsOysmtuZPX/rR4V2E+T72sosVeTDfysVpnFsaS9W3tBhRfTsZZ8R1hidnIp
 LOWI6rI1eo5STfaIerMCHZmqgrOyKv1CzNtgayu/zd7Nf+l1XpQbALSadyMLQ8XMtOn9
 PQkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+o26oEY0qputXYTzAwwAYZekOHht/31yMfdtXZlzRR4=;
 b=U+0QOXs6WihM9YrMsI/6Bq5iKYVIYe3U76Y5yBxh+RZRbjNKr0bWT/vQ3ARVxKv+Pv
 C7XYPaugchdoN4SnZWdeP6qAoljfD6nvLEzUn7l5fI4SjozeZ5IUYlrV6k3TUEa02I6Z
 bLjr7/cVSiXq+ApPJXnB3aQ2oxhVsyPcTfkxG977qui05NG/eD8bBXXQzuW68aQ8wbgL
 /bki1fm6yToHUmFSZ/JpVVVDYwyHGnBqY+ZQJ3qc+bnVqKjrBRloDX5CWEuiRj5U9KZ+
 uK3Pzx8E+qnUneMut4AxwDJPVni+4LgNkgPl4hq3xc5b0nxTBPmQq/us754tU400AhLH
 9ZQg==
X-Gm-Message-State: ANoB5pnZldEqOR3M8CO6xgaiwBcxcqf8IWq231zc5ysjL62QPisidBCa
 D8Rb8uIXFHpIQsxI3Rj5i9yFeg==
X-Google-Smtp-Source: AA0mqf4r5XbqiU+jo40QoGKWywM5FNSA1kzh7k6H0c/cblGIU+ngQUvecxuhzp5P1CVzN+gPQbc+LA==
X-Received: by 2002:a2e:97c4:0:b0:277:5ce7:3411 with SMTP id
 m4-20020a2e97c4000000b002775ce73411mr1258209ljj.37.1668205259498; 
 Fri, 11 Nov 2022 14:20:59 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 h31-20020a0565123c9f00b00498f00420e9sm528022lfv.194.2022.11.11.14.20.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Nov 2022 14:20:59 -0800 (PST)
Message-ID: <ed2050c9-3e5f-ef97-a399-c9dc0427f32d@linaro.org>
Date: Sat, 12 Nov 2022 01:20:58 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [v1] drm/msm/disp/dpu1: pin 1 crtc to 1 encoder
Content-Language: en-GB
To: Kalyan Thota <quic_kalyant@quicinc.com>, dri-devel@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
References: <1668174978-10676-1-git-send-email-quic_kalyant@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1668174978-10676-1-git-send-email-quic_kalyant@quicinc.com>
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
Cc: robdclark@chromium.org, dianders@chromium.org, quic_abhinavk@quicinc.com,
 linux-kernel@vger.kernel.org, quic_vpolimer@quicinc.com, swboyd@chromium.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/11/2022 16:56, Kalyan Thota wrote:
> Pin each crtc with one encoder. This arrangement will
> disallow crtc switching between encoders and also will
> facilitate to advertise certain features on crtc based
> on encoder type.
> 
> Changes in v1:
> - use drm_for_each_encoder macro while iterating through
>    encoder list (Dmitry)

BTW: if these patches form a series, please send them so.

> 
> Signed-off-by: Kalyan Thota <quic_kalyant@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 21 +++++++++++----------
>   1 file changed, 11 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index 7a5fabc..0d94eec0d 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -798,19 +798,20 @@ static int _dpu_kms_drm_obj_init(struct dpu_kms *dpu_kms)
>   	max_crtc_count = min(max_crtc_count, primary_planes_idx);
>   
>   	/* Create one CRTC per encoder */
> -	for (i = 0; i < max_crtc_count; i++) {
> -		crtc = dpu_crtc_init(dev, primary_planes[i], cursor_planes[i]);
> -		if (IS_ERR(crtc)) {
> -			ret = PTR_ERR(crtc);
> -			return ret;
> +	i = 0;
> +	drm_for_each_encoder(encoder, dev) {
> +		if (i < max_crtc_count) {

What if max_crtc_counter < num_encoders? I think we should disallow such 
configuration. Can it happen on any of relevant platforms?

> +			crtc = dpu_crtc_init(dev, primary_planes[i], cursor_planes[i]);
> +			if (IS_ERR(crtc)) {
> +				ret = PTR_ERR(crtc);
> +				return ret;
> +			}
> +			priv->crtcs[priv->num_crtcs++] = crtc;
> +			encoder->possible_crtcs = 1 << drm_crtc_index(crtc);
>   		}
> -		priv->crtcs[priv->num_crtcs++] = crtc;
> +		i++;
>   	}
>   
> -	/* All CRTCs are compatible with all encoders */
> -	drm_for_each_encoder(encoder, dev)
> -		encoder->possible_crtcs = (1 << priv->num_crtcs) - 1;
> -
>   	return 0;
>   }
>   

-- 
With best wishes
Dmitry

