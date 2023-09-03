Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 225F2790D52
	for <lists+dri-devel@lfdr.de>; Sun,  3 Sep 2023 19:34:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A443C10E175;
	Sun,  3 Sep 2023 17:34:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95DD910E175
 for <dri-devel@lists.freedesktop.org>; Sun,  3 Sep 2023 17:34:51 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-9a6190af24aso113674666b.0
 for <dri-devel@lists.freedesktop.org>; Sun, 03 Sep 2023 10:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693762490; x=1694367290; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cFnqV560lAZ6YF/3E3DhwgPICGzqwbi6MBKG22yTZ8I=;
 b=R/P2p4+JgOPYpoUfJNb2idt7bjgbBE5627T1IEcnHRX1fsoTa32xQfmG6I0QLGUk+C
 lwUBhjQuOjuxOIt/Aujtvxnuf45NLqh2KC9LkMAd+IGSCsxCo4Hq39bkb/+o6vDHtHvZ
 DhS/4oZny83q40o2p2FuV2HFyZkSchZICMtRfG4mtq0J+OMG7/MiO7vV64+CVxImGRZE
 AvRKioLbINDbOGmrpjDzXz+uQiqI69bFoDWJxSMk5l1RTX4i3LgjWPiki5+JUtIpQDUO
 XH8c8jxxDGqyKn8f0jb5WyIVtqO0zIXp441IdDDE6dUBvcv9SiPq4d9VIO8OyVkG2Yoh
 HEDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693762490; x=1694367290;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cFnqV560lAZ6YF/3E3DhwgPICGzqwbi6MBKG22yTZ8I=;
 b=Ib7e3t0bjeUUWfH51ARvXLl0AbC6hki+3xljiZZY6cstnj7iDSYc0HUFj6+Cg3F51O
 /ttWMwPnuj+9HkGQSzGje97jMRo4S35NqEtMFKDZpeIH+e52F0tNZMWkcN3zykkJTj6l
 pFoouG71yqob5KSPw0PgdyGgncPGDHfrY1bj3607dAWHZLAGKkLUePEItq1ueCqZuWHb
 0aL6g/WelMAb1LF7RBUToaDmF7+uhHAYAnFr3H3rzvTxNTbL5KieYSpRp4LKFkfHD0xG
 oTKqXRMZJaDcWGClToXv03gPa3QdUT+00anHHoKcDxLlrueJU+RGx6ewTKENgN5DCz4p
 6Gag==
X-Gm-Message-State: AOJu0YyT67X4dbeka8suyDhLFPu3rPD1hHlWgjZABHsqyrUwP/1evRNV
 alWCAk+ZeJ0lBXlL0XXfyOcdxg==
X-Google-Smtp-Source: AGHT+IEe6KGCoDHH6YmYaRNcmoMmo0Ktbkc6BF0JUnIO99xIaVatxGpDQLavUlCRkTk6k8m2js43ww==
X-Received: by 2002:a17:906:f252:b0:9a1:eb67:c0ce with SMTP id
 gy18-20020a170906f25200b009a1eb67c0cemr6189371ejb.50.1693762490088; 
 Sun, 03 Sep 2023 10:34:50 -0700 (PDT)
Received: from [10.10.15.130] ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 l13-20020a170906078d00b009a5f1d15642sm4955313ejc.158.2023.09.03.10.34.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Sep 2023 10:34:49 -0700 (PDT)
Message-ID: <0fef71be-91c7-41ed-bb2c-965b8aa4e8e3@linaro.org>
Date: Sun, 3 Sep 2023 20:34:48 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/4] drm/msm/dsi: Enable widebus for DSI
Content-Language: en-GB
To: Jessica Zhang <quic_jesszhan@quicinc.com>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20230822-add-widebus-support-v4-0-9dc86083d6ea@quicinc.com>
 <20230822-add-widebus-support-v4-4-9dc86083d6ea@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230822-add-widebus-support-v4-4-9dc86083d6ea@quicinc.com>
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
> DSI 6G v2.5.x+ supports a data-bus widen mode that allows DSI to send
> 48 bits of compressed data instead of 24.
> 
> Enable this mode whenever DSC is enabled for supported chipsets.
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>   drivers/gpu/drm/msm/dsi/dsi.c      |  2 +-
>   drivers/gpu/drm/msm/dsi/dsi.h      |  1 +
>   drivers/gpu/drm/msm/dsi/dsi_host.c | 31 +++++++++++++++++++++++++++----
>   3 files changed, 29 insertions(+), 5 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

