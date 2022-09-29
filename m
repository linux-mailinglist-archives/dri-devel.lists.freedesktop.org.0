Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E35405EF234
	for <lists+dri-devel@lfdr.de>; Thu, 29 Sep 2022 11:37:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA5F510EA34;
	Thu, 29 Sep 2022 09:37:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9909310EA35
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Sep 2022 09:36:42 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id bu25so1401311lfb.3
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Sep 2022 02:36:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=YboU7EJWX9s/eCKMNyU4MN70itKOnGmUbie/p84rbqI=;
 b=JuHnP7zGLpDgnUtkUD1REAPRC0Y2S44WRa2xDgQH2rm7j8wRYSFLZgJD18dkNRHEe6
 kHPbUGFIMs3vn1q6J84rOm0DiQadRN/iRnx0FMnMM+8174ypbIfpcMYrCM9jaTQcD0T6
 pHWnpEu2UsTb7pYGv31+X6MPH33bABPYKRDD4BMGON3A7zUO/tiKlzM73XqhhLkCUpJR
 SKeF0NPzxoR+iWSMYMEEg2h41UiKL8/zV/L//wmk9IrOcmUnO3RV2t1TZ/xOlrkL4cy9
 E/oLC18xRQZEwJE9+JCtA4gdNNtTLD+poq/GfzcdpvZIBPbCBbQuW91Zfc9roedF1MCZ
 3Igg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=YboU7EJWX9s/eCKMNyU4MN70itKOnGmUbie/p84rbqI=;
 b=iK1tEZ6fIuU7PtxuvyfdCQTDf7mWeeQsKUwpyQ+oEtx4OFYA9vSckIgB0B9nZTZlN5
 bY+4mHhwc536fDBOvAgr/On/gLbeLY9buMx/NmV/nKJG0hGOP7igHDBGyykDBAdAvZiL
 RY1M1CkH2Bi+D3L66nFLb3eUFs1WDUdoNu4wT9KqtuE+U8yEGjoB14ZiOtkMFp7B33BA
 /NCF6mgjkkm8Wd2JiIhJ5xEE6UKosi92AT2agAGen5YS8TJtm2nV4PRl5iIsoWMMOs2O
 ebDAqb6IvAAYen04kJOu5w8HF2zFVJmxZKYk56OIcdcBAoaZBWKDuhF/HrJcTlyklEyb
 36lg==
X-Gm-Message-State: ACrzQf08UEHb6OU3Uoq9sa0PGb2NBo7Ece4Dd7sYV+B/LZl/ILqlstiu
 EbER+qSYffNiL7JUt+v3Dj7Vew==
X-Google-Smtp-Source: AMsMyM4cbUx3bEAc/nOwmW2NfB+K9ZpERD1j5UJsF0wbx7S/BgpUDvdacDKkJe+a3ToJ2swNATd+ag==
X-Received: by 2002:a05:6512:3b9b:b0:499:b2b7:c3c1 with SMTP id
 g27-20020a0565123b9b00b00499b2b7c3c1mr972536lfv.54.1664444200826; 
 Thu, 29 Sep 2022 02:36:40 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 p13-20020ac24ecd000000b00499cf3e3ebesm732365lfr.121.2022.09.29.02.36.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Sep 2022 02:36:40 -0700 (PDT)
Message-ID: <30009f48-4f31-b6b4-f444-85bc91836d14@linaro.org>
Date: Thu, 29 Sep 2022 11:36:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH 2/2] arm64: dts: qcom: msm8996: change HDMI PHY node name
 to generic one
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20220924094347.178666-1-dmitry.baryshkov@linaro.org>
 <20220924094347.178666-3-dmitry.baryshkov@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220924094347.178666-3-dmitry.baryshkov@linaro.org>
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
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 24/09/2022 11:43, Dmitry Baryshkov wrote:
> Change HDMI PHY node name from custom 'hdmi-phy' to the generic 'phy'.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

