Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5038706273
	for <lists+dri-devel@lfdr.de>; Wed, 17 May 2023 10:13:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 106DF10E0E3;
	Wed, 17 May 2023 08:12:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C10A10E0E3
 for <dri-devel@lists.freedesktop.org>; Wed, 17 May 2023 08:12:56 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-510b7b6ef59so799216a12.3
 for <dri-devel@lists.freedesktop.org>; Wed, 17 May 2023 01:12:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684311174; x=1686903174;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=a1tI4Mj0GuSStRExKQnt10Sk/TUm6zi642R3YYtuxTg=;
 b=V8lPYAu5z6+U2gOqC3z7VJ6URsVOO59EBAapcvlyAJwMLkjWrr7Wo8CWmDGhwsYrsu
 a2QuWAVSgLVcpflAjiee1DWUQ3QFYYWm4bs7QBkGaFGJ0e6X3kvIItt5WsDmPyMaDbv0
 ECW7cs5cfAKHdX5/56inb70getKGq9ckpGPstIzT4dbHLvY83hCkguaYu4Er9bskuckq
 yVBnUpbEdmrGwHP1R61bX7HXL+W5BvToV+0tCQAF8nw1o4bjRMbJGpVRVpGCiMon3YYq
 CwGLNMl2Zk1brXQt53Iqh2/25aB7Vd6tAYJrjarZlSc3EZCU7eAaLoZl5TEb0z2PJAEB
 kKQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684311174; x=1686903174;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=a1tI4Mj0GuSStRExKQnt10Sk/TUm6zi642R3YYtuxTg=;
 b=k8nTfa1wUeFnuJiSXQCgVLXGZKTeqVWOvDB/KQBL3q/JeqgBxiwfAyLYNAgL/HFgXt
 KaxqzO56jOC2esoN7qM0W9Gl1VNH3kdF1aL0W6+kp+nlQ8y8LwqvwmIKbHq8Y/vpuw66
 X7gGKmHtkPO94+wO8mq/pPgwQg4iAMahv36y37oYsOs1oUvVSEh1hHUn79h+x5jS1NIl
 g6x1YAT8WuQLt6PkezEx4vfZBhXPNXSKGNOzhMeXj3kQRIGjme8VXBWq3IAJ11sm6Ieq
 DfAQSEN/DUtjjQGiO8/2tLuH8/kQNEBhBjSs5Gcu9f98q4q8rkffBSuiUsQePdS5168E
 b1KA==
X-Gm-Message-State: AC+VfDyCQ6K8gdURGfuKzWThZUFL2sBM8Yukn3QKKBxw/PWXk41venAU
 Oe95Muh2DbQAxdltdxZ3eWVAyA==
X-Google-Smtp-Source: ACHHUZ5K6XkIbwGR7BN6nwPpwg/ie+J/ruD+GqyEdrYyAZ5GpjgmN1Cyt5H5Q2dumD6Pk6xDfBnrBQ==
X-Received: by 2002:aa7:d78f:0:b0:50d:8cde:a335 with SMTP id
 s15-20020aa7d78f000000b0050d8cdea335mr1615810edq.15.1684311173952; 
 Wed, 17 May 2023 01:12:53 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:c9ff:4c84:dd21:568d?
 ([2a02:810d:15c0:828:c9ff:4c84:dd21:568d])
 by smtp.gmail.com with ESMTPSA id
 r9-20020aa7c149000000b00509d1c6dcefsm9033171edp.13.2023.05.17.01.12.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 May 2023 01:12:53 -0700 (PDT)
Message-ID: <8be8cc8e-5580-0f4f-a00e-46f392356026@linaro.org>
Date: Wed, 17 May 2023 10:12:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 1/2] dt-bindings: display: panel: Add Visionox R66451
 AMOLED DSI panel bindings
Content-Language: en-US
To: Jessica Zhang <quic_jesszhan@quicinc.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20230516-b4-r66451-panel-driver-v1-0-4210bcbb1649@quicinc.com>
 <20230516-b4-r66451-panel-driver-v1-1-4210bcbb1649@quicinc.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230516-b4-r66451-panel-driver-v1-1-4210bcbb1649@quicinc.com>
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
Cc: devicetree@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 16/05/2023 22:20, Jessica Zhang wrote:
> Document the 1080x2340 Visionox R66451 AMOLED DSI panel bindings
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  .../bindings/display/panel/visionox,r66451.yaml    | 59 ++++++++++++++++++++++
>  1 file changed, 59 insertions(+)

If there is going to be new version:
A nit, subject: drop second/last, redundant "bindings". The
"dt-bindings" prefix is already stating that these are bindings.


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

