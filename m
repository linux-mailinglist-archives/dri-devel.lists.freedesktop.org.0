Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4000C5A5513
	for <lists+dri-devel@lfdr.de>; Mon, 29 Aug 2022 21:57:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48CD510E9D2;
	Mon, 29 Aug 2022 19:57:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com
 [209.85.161.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0207E10E9D2
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Aug 2022 19:57:20 +0000 (UTC)
Received: by mail-oo1-f48.google.com with SMTP id
 a1-20020a4ab101000000b0044acf001f83so1633239ooo.10
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Aug 2022 12:57:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=C/b5BQ8B0knkatmMJR40aqQPPoLSGpLK/2JLZ5QFmUw=;
 b=OyIQ1HtP32LUEHMUw7IYnik/uMRu0Kk0w6DUF0s5QIoHv+gOM3f260xSpkZ7564xkY
 n7bqb8oogLYjUXE/5XrigNW9CMZrTIgedGsCROR6fWYp1ibKNTuhCRhn7QG94stJhSXx
 L7EhnRpk+13ifX/U1GSnmGkmyduJ46KNnzjj8zNeB0UwJ6xNqxZrrYETUUxtHQt+6mOw
 +Tf0RdfFKV9Ixjc78teoOGbDbQr9S8mMCHrEH9tmTFCAhDUdMGR8T1tVbNISNsO9BkaH
 1lciwlp7FPhntBf6HpWnbQ/SAGKXKRybNxSUGiVmCbbgS7cu4ZAsbP2tiHHz3zujgsGa
 asdw==
X-Gm-Message-State: ACgBeo1x50VD0LGkWnkLV5dB+K5k8cO2ATZ/miXu+qayao0h50shUtLT
 Sfml8nKjIK5g/kIFrz3hJQ==
X-Google-Smtp-Source: AA6agR5LaMvdXmR3cU1fCf8sxgz3wyxGFdB0vw/qJCQe8L6S3Fun9SKbUE0WeGvM57B8obexSFpOQA==
X-Received: by 2002:a4a:2243:0:b0:44a:e5cf:81e5 with SMTP id
 z3-20020a4a2243000000b0044ae5cf81e5mr6203415ooe.44.1661803040220; 
 Mon, 29 Aug 2022 12:57:20 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 d23-20020a056830139700b00639443424f8sm6183476otq.8.2022.08.29.12.57.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Aug 2022 12:57:19 -0700 (PDT)
Received: (nullmailer pid 2314952 invoked by uid 1000);
 Mon, 29 Aug 2022 19:57:18 -0000
Date: Mon, 29 Aug 2022 14:57:18 -0500
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH RESEND - dt 2/2] dt-bindings: leds: qcom-wled: fix number
 of addresses
Message-ID: <20220829195718.GA2314862-robh@kernel.org>
References: <20220825125410.232377-1-krzysztof.kozlowski@linaro.org>
 <20220825125410.232377-3-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220825125410.232377-3-krzysztof.kozlowski@linaro.org>
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
Cc: devicetree@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>,
 Kiran Gunda <kgunda@codeaurora.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Lee Jones <lee@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Pavel Machek <pavel@ucw.cz>, linux-arm-msm@vger.kernel.org,
 linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 25 Aug 2022 15:54:10 +0300, Krzysztof Kozlowski wrote:
> On PM660L, PMI8994 and PMI8998, the WLED has two address spaces.  This
> also fixes dtbs_check warnings like:
> 
>   arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dtb: leds@d800: reg: [[55296], [55552]] is too long
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../devicetree/bindings/leds/backlight/qcom-wled.yaml    | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 

Applied, thanks!
