Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 92107621E5B
	for <lists+dri-devel@lfdr.de>; Tue,  8 Nov 2022 22:13:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 751F110E526;
	Tue,  8 Nov 2022 21:13:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F412910E2D2
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Nov 2022 21:13:46 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id t10so23051466ljj.0
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Nov 2022 13:13:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=b+TEdIfIt1XEAkSUPk37PpRaSa+HP3u0XbUt51o/R5Q=;
 b=hybL/ifLuD7Lq7OrqxEgPb+C3hZe6Zq/o9AmhBC3t26Y3R8MzxahlatCWAkuQxba6s
 EPuEj4JngMnlo3aeVxau/Z1Qxs+H4hGVSBG+Vb3QnPV5hfRrbg/MhpQmYGnQacNIdzM9
 Uu6BHThBxpHD7xHsdvES0oRgA+K49VywCjvxSo4gmm3bP+1480sreCSqcgLZBxKvDrJY
 LM6qrbd3aMdEqxhBvamfi2ZZhgvEXsf2XQ7R8B9S7kurZ6AkdWCrINjDFXXqvaZJcp68
 em7YdfcJ/kU/5L2Qov073/b188bqObSSwO7qpAa8DbMGNzqeRqKQC2x+LRYKkDk4qxAy
 2NgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=b+TEdIfIt1XEAkSUPk37PpRaSa+HP3u0XbUt51o/R5Q=;
 b=75Be+ziYjnTluqVEu1BcL1eQAZH4LmM+E/cZTvVhwcci15oL3XnV8fVsnEpGkYG+tX
 OB8xXiG5559AlVSp9wINKfn4nznE9aqaELn4J0IeFlkbnn3pLvgQVy4/wSuFe/xdbwyu
 /VN6Ry4WIZ1Jl9mYq3fpmXAlgMktpaRBgR9TVmFm5PxXufBjYnAOcamUef0SnjURaljO
 ThKMvuHX9cEba1hB4UtLRuQaWoj9h1e2AErrEqDIk9NxBe591EAsDZzQHjBHC7PkYEWp
 q5VpdXDZHIXywewukB/4Gw3O0hdGo3wrTAVmsP518K3fnW2vfsc23GLUJWLXUUOV5k1P
 o8eQ==
X-Gm-Message-State: ACrzQf0JS4r+L4ht7K6jgGEUi+whWR4SBHnhBoyjwWEce6l8f3j/ZTC7
 UINXRByfh8Cze8APeoRJhmYuew==
X-Google-Smtp-Source: AMsMyM704MrNlUBJ/82vwUjFUx934aW7BWfazzzhogmQIqSx2TtM8uSFy20O42NaVeF2kUOmlZ6Pqw==
X-Received: by 2002:a2e:b626:0:b0:26e:6fb:4845 with SMTP id
 s6-20020a2eb626000000b0026e06fb4845mr7126546ljn.120.1667942025342; 
 Tue, 08 Nov 2022 13:13:45 -0800 (PST)
Received: from [192.168.0.20]
 (088156142199.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.199])
 by smtp.gmail.com with ESMTPSA id
 8-20020ac24d48000000b004998d9ccb62sm1939713lfp.99.2022.11.08.13.13.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Nov 2022 13:13:44 -0800 (PST)
Message-ID: <20aa6301-c576-9221-d084-b11d3e9687e3@linaro.org>
Date: Tue, 8 Nov 2022 22:13:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 06/18] dt-bindings: msm: dsi-controller-main:
 Alphanumerically sort compatible enum
Content-Language: en-US
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, robdclark@gmail.com,
 quic_abhinavk@quicinc.com, dmitry.baryshkov@linaro.org,
 krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
 quic_mkrishn@quicinc.com, linux-arm-msm@vger.kernel.org
References: <20221107235654.1769462-1-bryan.odonoghue@linaro.org>
 <20221107235654.1769462-7-bryan.odonoghue@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221107235654.1769462-7-bryan.odonoghue@linaro.org>
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
Cc: Sean Paul <sean@poorly.run>, devicetree@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 08/11/2022 00:56, Bryan O'Donoghue wrote:
> Sort the order of the compatible strings alphanumerically.
> 
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: Sean Paul <sean@poorly.run>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: freedreno@lists.freedesktop.org
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

I think here you can see how the commit msg looks now... One line of
message and 13 lines of CC.

With commit msg fixed:

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

