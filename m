Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E65E7790D50
	for <lists+dri-devel@lfdr.de>; Sun,  3 Sep 2023 19:34:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45AAE10E172;
	Sun,  3 Sep 2023 17:34:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABD8110E172
 for <dri-devel@lists.freedesktop.org>; Sun,  3 Sep 2023 17:34:35 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-9a2a4a5472dso346523766b.1
 for <dri-devel@lists.freedesktop.org>; Sun, 03 Sep 2023 10:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693762474; x=1694367274; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3fRYDJegopoDvX4wUumAqbN8+NBFikZtoO1OhinvgIE=;
 b=Ktjm/obh4SHL9n1+hHnBWXoozLrJC4mIdaw+hWmFkms/4OPi2r3DxuLgk+7zc1L+Q/
 KFV5PTOJaE3W0rpegfUQblNRRUHOdpKMgTrwZ5UgM4533KWcINwfR9Khwk9Rf5elnNh5
 eLruKYvx+oZq37AMBRpVyVe90ab8hih73js5jA1KUmRsW56kyUGCaoTCNigweOBVCFNW
 WsbQVWCuK6xUF3W2jfnEk04IGm884gXTYy58nOHifTAmEFHjTvIxfT6T8n+3tk54v0rJ
 L7rYIOoKn8d2iFi5IMF32IfUKky+xCCFz1/bTp0ZWnj7rWY8KoL72QmdTREQlppxUfb0
 RdqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693762474; x=1694367274;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3fRYDJegopoDvX4wUumAqbN8+NBFikZtoO1OhinvgIE=;
 b=ZuGhqMuEoT8/IhItIDa9aB/7jvdU4rHQUxoULsZhAGn8yEyupgAmROXitMw2b2OyH0
 w6lQBcBqg8F7DFEptr5HFBFT1tYg/smKP9ulTg8NRDyxftoR1TAPvi2gDE/ZPLCt9K9b
 FyLa/zF9tymxp0g//SQK8SQ9rmyznXKkwztp7fOxj3coRTlLUxGzx7XB9IzAF2XitXLI
 /SJaEpBBw+NV1GxlsEZXXYGdZviJwoH0DrI8Le7KoTA0GXzjqP3H/UjhsE3fIZ4Jci2E
 6sBsRt/508Nx/XFfbxYUlCT+K4hRTy3IX2Z5G0gFL9m5E3rqzD2nTr7FBBpPWVIWyQrM
 2LkQ==
X-Gm-Message-State: AOJu0Yw5XBuSACQiIInu6od1nJ8KnMKggXdNilGY1QJzhLWwZxpdqAZZ
 w4NaEdXoq1c5bYPViEx1ak06JA==
X-Google-Smtp-Source: AGHT+IEiBqUVEY+DFZIBnmFkaJIanvV7apy1ANrMlmBkH3n5xhkvCR0N0KP+JkDDWqdjj5WERM6kOQ==
X-Received: by 2002:a17:907:3e1f:b0:9a5:9b93:d60d with SMTP id
 hp31-20020a1709073e1f00b009a59b93d60dmr11038685ejc.36.1693762473985; 
 Sun, 03 Sep 2023 10:34:33 -0700 (PDT)
Received: from [10.10.15.130] ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 l13-20020a170906078d00b009a5f1d15642sm4955313ejc.158.2023.09.03.10.34.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Sep 2023 10:34:33 -0700 (PDT)
Message-ID: <6d269101-d18d-4783-a8fd-3b59a23d3700@linaro.org>
Date: Sun, 3 Sep 2023 20:34:32 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] drm/msm/dpu: Enable widebus for DSI INTF
To: Jessica Zhang <quic_jesszhan@quicinc.com>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20230822-add-widebus-support-v4-0-9dc86083d6ea@quicinc.com>
 <20230822-add-widebus-support-v4-2-9dc86083d6ea@quicinc.com>
Content-Language: en-GB
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230822-add-widebus-support-v4-2-9dc86083d6ea@quicinc.com>
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 22/08/2023 20:42, Jessica Zhang wrote:
> DPU supports a data-bus widen mode for DSI INTF.
> 
> Enable this mode for all supported chipsets if widebus is enabled for DSI.
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c          | 7 +++++--
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c | 2 ++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c          | 7 +++++++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h          | 1 +
>   drivers/gpu/drm/msm/dsi/dsi.c                        | 5 +++++
>   drivers/gpu/drm/msm/msm_drv.h                        | 5 +++++
>   6 files changed, 25 insertions(+), 2 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

