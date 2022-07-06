Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83E535690A5
	for <lists+dri-devel@lfdr.de>; Wed,  6 Jul 2022 19:26:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4242710EBEF;
	Wed,  6 Jul 2022 17:25:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA9BE10FD9F
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Jul 2022 17:25:57 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id q8so6849019ljj.10
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Jul 2022 10:25:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=JsyVsYNpDQ8zJGakyxKtjvi7pOZE5FqBAEsh3JtW6QA=;
 b=NRWx5mkTEWIKWytjf1z0cO7hyGFLCIKUeLoUKFmMtM6xjTigvO/PaPNteYAS65MSzG
 vdVJ+EuplQFAcakz/rUqERWWiiCK3jG8ETdoZu6Y9ET+yr7KGaiVip3da5sEdsPBNQjp
 FnQmumbdAoqypEjN/2j/xM2SNmDe0pLuXGpJkB/pJNapsI7oHFxe2IXcTbr1Z7VZu1h9
 KxkW1Kdcf5egxUYoSwIDsEyQSGh4btPW+3Ptug8wmwHzISHm1SSYevWHXpW4FmoUCo5t
 /tw+PaLrywznmn45dZzUG19x0JZBM/l9X7WPTaIN+RAL4QTOyRNkdOrR1kFH6FiGyoXE
 6O1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=JsyVsYNpDQ8zJGakyxKtjvi7pOZE5FqBAEsh3JtW6QA=;
 b=Kc1s8daiZmsh0Li0hFGLAFXz/Mtj41VzaG6hJRlkIXPSb2G9hVyH/SKwvYCDeg1DtN
 FBQInKEldyYtmfqx4nOhPuwfFW77rlyVy3oFVtoe0MjkQDGvD3QH6Hxv705fLaNQvH68
 H1WPszoCfyeOQaeD7T5B6vShzQe8nK4WwnX5lbSt6atzwMFv7hkHeZaAtYHEy3wp7leH
 NTm5VlKVuiiOnyXJ19Wj1rwpCSb4/q8HkzNVphCkZmQ+1NMeTynl8Rukl4sT9KDtTW88
 Fpp0VIvKopUFehpJmg6TxAvo+AGkz9yCCD+X4mBeYLByL6E4Ymq9TMh2VzQh7MVwgmlP
 psvg==
X-Gm-Message-State: AJIora/gwrvT/VeWP9IfgJa1mIWqRITAD+4wZ+PdnOJb42Q2Vl03pDmO
 4APpCbnGav6SzwTYNrn8a+uyxQ==
X-Google-Smtp-Source: AGRyM1vF2LMbfQeR6t993SuZPpvogaQi52LTs4BKWbGufEcHutNXTzHNLjelj7R9O6jbPxTcOE+3hg==
X-Received: by 2002:a2e:a41b:0:b0:25b:b56f:1476 with SMTP id
 p27-20020a2ea41b000000b0025bb56f1476mr22445280ljn.381.1657128356338; 
 Wed, 06 Jul 2022 10:25:56 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 w6-20020a05651204c600b00478df9f4d64sm6364715lfq.227.2022.07.06.10.25.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Jul 2022 10:25:55 -0700 (PDT)
Message-ID: <86ee9636-8827-7bad-6bd9-22191b2d293c@linaro.org>
Date: Wed, 6 Jul 2022 20:25:54 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v3] drm/msm/dp: make eDP panel as the first connected
 connector
Content-Language: en-GB
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, robdclark@gmail.com,
 sean@poorly.run, swboyd@chromium.org, dianders@chromium.org,
 vkoul@kernel.org, daniel@ffwll.ch, airlied@linux.ie, agross@kernel.org,
 bjorn.andersson@linaro.org
References: <1657128246-15929-1-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1657128246-15929-1-git-send-email-quic_khsieh@quicinc.com>
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, quic_aravindh@quicinc.com,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 06/07/2022 20:24, Kuogee Hsieh wrote:
> Some userspace presumes that the first connected connector is the main
> display, where it's supposed to display e.g. the login screen. For
> laptops, this should be the main panel.
> 
> This patch call drm_helper_move_panel_connectors_to_head() after
> drm_bridge_connector_init() to make sure eDP stay at head of
> connected connector list. This fixes unexpected corruption happen
> at eDP panel if eDP is not placed at head of connected connector
> list.
> 
> Changes in v2:
> -- move drm_helper_move_panel_connectors_to_head() to
> 		dpu_kms_drm_obj_init()
> 
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index 2b9d931..50ff666 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -763,6 +763,8 @@ static int _dpu_kms_drm_obj_init(struct dpu_kms *dpu_kms)
>   	if (ret)
>   		return ret;
>   
> +	drm_helper_move_panel_connectors_to_head(dev);

This should be in msm_drv.c unless you have a strong reason to have it here.

> +
>   	num_encoders = 0;
>   	drm_for_each_encoder(encoder, dev)
>   		num_encoders++;


-- 
With best wishes
Dmitry
