Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F4505A02C8
	for <lists+dri-devel@lfdr.de>; Wed, 24 Aug 2022 22:32:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B03AA582B;
	Wed, 24 Aug 2022 20:31:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 420BB113035
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Aug 2022 11:11:51 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id z6so19183209lfu.9
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Aug 2022 04:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=RyGB8PQO8ADQrO2JFjLIJii6hzK5vNZX03ZezGuypGs=;
 b=oCfh6AI2QwLBOgQEi1W8eHyNhAH/PsXgbcycKMnCTV5RxfayaL3wtv4jIvSOvZZzE8
 gzUXOExHburHxVgMSsMbHibLI1L2SnbkuVLjvD+bljZz7Sn6Mia3nJOyOn07BVOgDr2l
 abxhLitpMAPOzrXk3jSQvcxgg7QwV8n5lW1lQqSbk8+a6T5oNh/sQQpbsuMaBSgrrI8A
 bJ2jSdmA27l2XZwB1wTkNwf60Ej1NEZsOhpD4PpcvP1LSahuyUmZkYQ+Q6M13KC/36C/
 o/KZNDD1g/R8rdQRYab4Ck4uov5qDnDC/psQAJognpFGI2eXoLgZ6Dd82cMKEbgDGmgv
 HJQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=RyGB8PQO8ADQrO2JFjLIJii6hzK5vNZX03ZezGuypGs=;
 b=YVjEPDroA2Q2exRZ2GK7UZg4mFPWRj801cjiVDTuFDuSWxVw/ZQbPEzVvw93IU0wMR
 7Rc5zFUIhbcslX9K2Loyi9NRl5RuZMSCQ5rX2vbP+cKKEJcCcsmHkwtgoB+xqqeSxlpk
 TFRQUUh5VMzK5KixqNF4T0xRfJ2c3/GcY9FnlZWzwNS/Z5/HLGI6b+3iHwKc8ywSoJ8e
 cMw4/7ee6trjlqUcp3mMGWPVEHlrK+6C7gUpMQ729j0Ys6Z3nA0r2UG7BnA9i/N+pkE0
 Pe04eq2fuNtauQ9RWgpBSrB9dbZKBok0DHPTxSmIkpyeRl34AfS+PnPctjLgurwbGinv
 U1Pg==
X-Gm-Message-State: ACgBeo2/yXkyElMqxYe+67JOYLIlfZbb1cUTYKodPbiwXJ9+NXMq4y3W
 fPzH3bScUyiIxLf/DOL7tdVx8A==
X-Google-Smtp-Source: AA6agR431MJa34QlqrqboyJ2CF1O1nEgGRTLQBgHBhF/nzaTuInpM0Ee1WeB028VXCHqg7KXMU98oA==
X-Received: by 2002:a19:654f:0:b0:492:f148:beb with SMTP id
 c15-20020a19654f000000b00492f1480bebmr1379997lfj.493.1661253109390; 
 Tue, 23 Aug 2022 04:11:49 -0700 (PDT)
Received: from [192.168.0.11] (89-27-92-210.bb.dnainternet.fi. [89.27.92.210])
 by smtp.gmail.com with ESMTPSA id
 r30-20020ac25c1e000000b00492f1b2ac0bsm511806lfp.101.2022.08.23.04.11.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Aug 2022 04:11:48 -0700 (PDT)
Message-ID: <e8a02030-d114-fa4b-1978-15327501b7e9@linaro.org>
Date: Tue, 23 Aug 2022 14:11:47 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v4 5/6] dt-bindings: drm/msm/gpu: Add optional resets
Content-Language: en-US
To: Akhil P Oommen <quic_akhilpo@quicinc.com>,
 freedreno <freedreno@lists.freedesktop.org>,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Rob Clark <robdclark@gmail.com>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Stephen Boyd <swboyd@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <1660927246-11327-1-git-send-email-quic_akhilpo@quicinc.com>
 <20220819221017.v4.5.Ieffadd08a071a233213ced4406bf84bb5922ab9a@changeid>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220819221017.v4.5.Ieffadd08a071a233213ced4406bf84bb5922ab9a@changeid>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, Douglas Anderson <dianders@chromium.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 19/08/2022 19:40, Akhil P Oommen wrote:
>  Documentation/devicetree/bindings/display/msm/gpu.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Documentation/devicetree/bindings/display/msm/gpu.yaml
> index 3397bc3..4576b31 100644
> --- a/Documentation/devicetree/bindings/display/msm/gpu.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml
> @@ -109,6 +109,13 @@ properties:
>        For GMU attached devices a phandle to the GMU device that will
>        control the power for the GPU.
>  
> +  resets:
> +    maxItems: 1
> +
> +  reset-names:
> +    items:
> +      - const: cx_collapse
> +

Just one blank line, not two. You can keep Rob's ack with that change.

>  required:
>    - compatible


Best regards,
Krzysztof
