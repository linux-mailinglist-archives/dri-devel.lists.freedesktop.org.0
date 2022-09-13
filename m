Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EAE65B6A3A
	for <lists+dri-devel@lfdr.de>; Tue, 13 Sep 2022 11:03:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 950E610E680;
	Tue, 13 Sep 2022 09:03:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5428610E6A3
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Sep 2022 09:03:26 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id az6so9032059wmb.4
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Sep 2022 02:03:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=u0+/4DOaKm+4ffSLNzqiW9x1Gxog4OJEqiqEoF/yw7Y=;
 b=qryssQyWeKIu75ubPUW0iHm/yVERj0n+y/zNXGQpiKNxdOmJ6aLs0sfq5V+r5W5cG0
 YnaD4AIP7RH4D0c/emc4G3RHaEOlxsBi25NxT2/cQAW5xdIZpv9SzHIyb13EPBFcGYpb
 N8mUAjMOLFE76eY99ClSpFtga+lyDQCtIf/kDAVB7AvaEGboJfYWrzEqzWS4w+keXTsO
 X0kckQAqwsbSA1GQcLjrsMrSy34tokQ9mo77t4cF95/4v3CG5ZYLws6WmqnrliZ/UnZH
 lYGZKE/8HSYKQ4AtouJnerf31WsPtjfscnS2fDGLGoMzReS4ib4G2IBY+7b/z1ExfSWX
 8T2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=u0+/4DOaKm+4ffSLNzqiW9x1Gxog4OJEqiqEoF/yw7Y=;
 b=MdTHDwFkf6fq/MpVDmkSqNQi7an8dNgLk/BpOZx/uUDs1SwCFxuFkNnn9BRXIbY0Tg
 7m1+4GX918aAW+r3GoOKNEf5Nb6f4mJgtMPu2h/VSYvHGqgtsjGElbKGkBMNAGS9Z+Ne
 YvHmqo7aAi6+yAZ7pFpqUQVk5i5QWDsZ0WeW2OG6cIDnm+jaTQ0lF1rx2UGhm4hHs+/U
 HYJexmhaVgtlEBxH6czJ54cNP9qO7D9IFbJJRGDoFK0eHax8nCv0jcOxBXCIxZPE8c3W
 hInZexpaPMAV0PPAi4cswCBxM8tp2gQzRZH9ePeia8xhKUrQyKerLh/5xM4rc6cQSdng
 xP5w==
X-Gm-Message-State: ACgBeo2SU9KSd6g+ZhOFaE3UzZ9FmyFtjhE2SBLDAbNk27ZHNujNfGbo
 958Yj+B5u5L6CF0j3AaXsjyx4g==
X-Google-Smtp-Source: AA6agR6tgHbM7dxYDRZ789TFmI5oqqZizaFVPdsBuEzXTii3bjLRA2QLQp236Cr6ae5gSL9m/8Oupg==
X-Received: by 2002:a05:600c:1e08:b0:3b4:8fef:d63c with SMTP id
 ay8-20020a05600c1e0800b003b48fefd63cmr1569107wmb.158.1663059804794; 
 Tue, 13 Sep 2022 02:03:24 -0700 (PDT)
Received: from [10.119.22.201] ([89.101.193.70])
 by smtp.gmail.com with ESMTPSA id
 n42-20020a05600c502a00b003b31c560a0csm12943776wmr.12.2022.09.13.02.03.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Sep 2022 02:03:24 -0700 (PDT)
Message-ID: <c931b0f7-9ce6-b270-d11e-9bcf3f304218@linaro.org>
Date: Tue, 13 Sep 2022 11:03:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 1/2] dt-bindings: it6505: add properties to restrict
 output bandwidth
Content-Language: en-US
To: allen <allen.chen@ite.com.tw>
References: <20220913084835.78490-1-allen.chen@ite.com.tw>
 <20220913084835.78490-2-allen.chen@ite.com.tw>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220913084835.78490-2-allen.chen@ite.com.tw>
Content-Type: text/plain; charset=UTF-8
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Kenneth Hung <Kenneth.Hung@ite.com.tw>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Jau-Chih Tseng <Jau-Chih.Tseng@ite.com.tw>,
 open list <linux-kernel@vger.kernel.org>, Robert Foss <robert.foss@linaro.org>,
 Pin-yen Lin <treapking@chromium.org>, Hermes Wu <Hermes.Wu@ite.com.tw>,
 Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonas Karlman <jonas@kwiboo.se>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 13/09/2022 10:48, allen wrote:
> From: allen chen <allen.chen@ite.com.tw>
> 
> Add properties to restrict dp output data-lanes and clock.
> 
> Signed-off-by: Pin-Yen Lin <treapking@chromium.org>
> Signed-off-by: Allen Chen <allen.chen@ite.com.tw>
> ---
>  .../devicetree/bindings/display/bridge/ite,it6505.yaml | 10 ++++++++++
>  1 file changed, 10 insertions(+)

Thank you for your patch. There is something to discuss/improve.

You already sent it. Please version your patches (git help format-patch)
or mark them as RESEND (it's nice sometimes to explain why it is being
resent).


Best regards,
Krzysztof
