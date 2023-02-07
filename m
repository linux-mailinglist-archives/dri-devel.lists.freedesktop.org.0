Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 948F868DCCE
	for <lists+dri-devel@lfdr.de>; Tue,  7 Feb 2023 16:21:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7E6B10E535;
	Tue,  7 Feb 2023 15:21:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 130D010E517
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Feb 2023 15:21:14 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id p26so43873261ejx.13
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Feb 2023 07:21:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=TY3YqSgtXc7yaW9pPRW8aZSrHCEaGsS7+O63u9ldl3I=;
 b=BDeEn0a7Jk6LqV0BxUk/3hb/Z6Xqj/yV16kXiuoMOSqrXb0v03vNvq2OkZYT24I96+
 D3d6sJ4DVgsTUqaJU6izpGl7ntpCilk3ImM0ij9kj9c5KmNrJtR7ZtjCuZbw20z6a814
 UN4OYx011PWI6uoKNASUOjx8ulf2i2sofMX6LB8jSKn1xLUUeChZSXEecQiR4l3rhS4k
 Z27dYY+BEfiUwt9IqesyXQLQG7dbN+fXPUleEZp4kE3+Ib2IJq3eZAfdYehzVd8XoR4f
 blRkO33oFMGA0D55AxhK1Iw9iypVtaANBYwU73rFQgsgd+VknpjgxHybgmr8cPwL0vUk
 3Q7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TY3YqSgtXc7yaW9pPRW8aZSrHCEaGsS7+O63u9ldl3I=;
 b=JKRjnhgYN6Jh7xUoDTKG3Aweq5wzoKKZRPySrIhbjblW3p65x/0vl8xo5oVUk4ojtL
 LUTQmWH2VjyzpOxNnrgsXgnyQEkdtxJFMBWZ2+u1CZlu/yVR39F5WgtFQMWU5i1rspAY
 Yq4ej6TJj3Sq4+zT7RWZEk55PP+TJJi52XqhF6U4Y2RrHIUjK2MTbBBQGE6x7PMrFNKb
 KkTngtuQLjvIVnQ2LNhiWgiJ7o9Q3o8IvoeGtqGUh6V2xaiQUsVfjUPEOsAX06DcgOMX
 5cKQBw7AEx2jrLNadC4c1f5SknkuZj8WJq3qql9xUw1Udib9wN09pnKOTZuBMKdUlw6s
 6yQQ==
X-Gm-Message-State: AO0yUKWvFmQRAvMFbuUjB2jAT98ChBHdf7kdjRIf7jB0qNMfoDeFmNs8
 7UW1Hrs00jcPyTM8f1ieIjqqoA==
X-Google-Smtp-Source: AK7set9QmfJciUrF+W1hV1GefjIjPjj85Ne+J1czfDY4PfZoxbZ0XbFaVW/41jlt6Tah5s19gAACJw==
X-Received: by 2002:a17:906:560f:b0:887:6c23:193d with SMTP id
 f15-20020a170906560f00b008876c23193dmr3840701ejq.7.1675783272577; 
 Tue, 07 Feb 2023 07:21:12 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 c18-20020a1709060fd200b0088f8abd3214sm7026217ejk.92.2023.02.07.07.21.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Feb 2023 07:21:12 -0800 (PST)
Message-ID: <fc32fe18-ee54-7ef9-3cc1-e9ead718961d@linaro.org>
Date: Tue, 7 Feb 2023 17:21:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 2/4] drm/msm/dpu: add DSPPs into reservation upon a CTM
 request
Content-Language: en-GB
To: Kalyan Thota <quic_kalyant@quicinc.com>, dri-devel@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
References: <1675780196-3076-1-git-send-email-quic_kalyant@quicinc.com>
 <1675780196-3076-3-git-send-email-quic_kalyant@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1675780196-3076-3-git-send-email-quic_kalyant@quicinc.com>
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
 linux-kernel@vger.kernel.org, quic_vpolimer@quicinc.com,
 marijn.suijten@somainline.org, swboyd@chromium.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 07/02/2023 16:29, Kalyan Thota wrote:
> Add DSPP blocks into the topology for reservation, if there
> is a CTM request for that composition.
> 
> Signed-off-by: Kalyan Thota <quic_kalyant@quicinc.com>
> ---
> Changes in v1:
> - Minor nits (Dmitry)
> 
> Changes in v2:
> - Populate DSPPs into the reservation only if CTM is requested (Dmitry)
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 15 ++++++---------
>   1 file changed, 6 insertions(+), 9 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

