Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C4BB6C3491
	for <lists+dri-devel@lfdr.de>; Tue, 21 Mar 2023 15:43:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5191410E156;
	Tue, 21 Mar 2023 14:43:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 678A410E13E
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Mar 2023 14:43:06 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id bi9so19394379lfb.12
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Mar 2023 07:43:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679409784;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=O7BDMNV63w/nRH0IlJ+LWLAMT7WkMKpel3X2vIkr+GE=;
 b=x7FEFvjPBZ4mJtbAdKPWIObXN71LRfNoK2qzcgzNz8wr3GEdJQF0hvNinmdtsGMeTy
 AJ2l/FxZXwoA75jz7CZv4DyIXaUSfwlX6R8QrEQyl859yjCsVFC/MTQ1gNMIyhylqk2P
 gojEU9aNix33lW8WNIWSaj8T4o0jUqwgLFCKr65pAAh06s/jLzReEBklymAMKUK4S7jO
 MooR6JWs2obroNOdZNAQIliRfhfr+hqPZw/nQ4kSVgfWDqpgLg5KYKGJjXQQCVqy/wxJ
 TxOeU4QMPqRBGq4Wvy7mCCyWK/X2cxqsChD64C4QxzzzlwOgv3V23EPw5QJxQYo/aO/p
 /yrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679409784;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=O7BDMNV63w/nRH0IlJ+LWLAMT7WkMKpel3X2vIkr+GE=;
 b=PpKsrZMjAwmFnHvNeHeZvBwN7TIoHKMJvd21FeGHdDiiYzKYt8hB4tBdVGZH1+hp9u
 xkE+a396U1/GJ0Ql4Qjm5HX8U0M9wbLDaVTpr11vbnZS707+J41Fc247qIVAAwNfm3Dy
 BmNQ166HxnM1O26EhJG3EqGtc/Wrxh1IRhMxSpaEgj9aoO1qF7hGd6u7jJWR/GauRht2
 roHe5DNFZMlO7Aa92lvxyv5zVzrEUZyJAMoq9tvT4H+8CouqPLUiH5xinjeCk9rPf43j
 oOpor687QFMMejuXFwIHn53yio359pgzNH4/JuCpa6Vi2IGEFCQ6iUdBeS+oHecMT1hL
 bExA==
X-Gm-Message-State: AO0yUKVv7l2nc8CPRzzqbK0R79qtBWS2aM+erHG/qgjYFDwMi7VQmR1o
 tI7CuLbLO1MQWCYmlGqMEttpGw==
X-Google-Smtp-Source: AK7set8NjKRaOPlkE21loVh+PZamQ3MqDcldA1NP940LXjsMxXnonUwSonjFS5j4YSrJ8Img293jdA==
X-Received: by 2002:a19:ad4b:0:b0:4ea:e779:fc3 with SMTP id
 s11-20020a19ad4b000000b004eae7790fc3mr777391lfd.25.1679409784538; 
 Tue, 21 Mar 2023 07:43:04 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 m1-20020a056512014100b004d8729d4150sm2187363lfo.145.2023.03.21.07.43.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Mar 2023 07:43:04 -0700 (PDT)
Message-ID: <34bac508-21b1-a441-0987-6b5b5be0bb08@linaro.org>
Date: Tue, 21 Mar 2023 16:43:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 10/10] drm/msm: move include directive
Content-Language: en-GB
To: Johan Hovold <johan+linaro@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20230306100722.28485-1-johan+linaro@kernel.org>
 <20230306100722.28485-11-johan+linaro@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230306100722.28485-11-johan+linaro@kernel.org>
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
Cc: Sean Paul <sean@poorly.run>, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 06/03/2023 12:07, Johan Hovold wrote:
> Move the include of of_address.h to the top of the file where it
> belongs.
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/msm/msm_drv.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)

-- 
With best wishes
Dmitry

