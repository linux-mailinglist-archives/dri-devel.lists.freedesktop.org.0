Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CC78551315
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jun 2022 10:44:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 411F710E0A1;
	Mon, 20 Jun 2022 08:44:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FDCC10E0A1
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jun 2022 08:44:27 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id ay16so286325ejb.6
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jun 2022 01:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=jbuHCNS3OsbuB14zXqMTZbn7sAxDckRnnJ+WYM/cbbU=;
 b=ZwIA/Qnhfi5xfKT8y1yrsJWbevwCN531zW4mLOETfhklOrPrrS2Woo/IZvNDMyK10K
 Hw03XC0h/p0Pg3mrHR5NNfwwQwIij7axyWSaRZ7jeaEWLDuY9084KYkjWJUcqbiJQ229
 KCHq/Q/vAnBQw9cS8Cy9mH0oDrVbUutadMVZvUskc7UbOfJPwN8Z+9HaMrampohjlUKq
 8/Mqjst62TXFkPyTj8s3xpAxJa92JK3CdEAR61DyXar4JXvqufqztippkeYoAv489GSv
 xYPiQCmsWpB0guNChxqyA9TmLHdgUERvChIzb5Lgj2yO4fT6qMy2aQOj4klrEkOkyGo7
 0mTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=jbuHCNS3OsbuB14zXqMTZbn7sAxDckRnnJ+WYM/cbbU=;
 b=5WQDBPzTOel2HUPfAmYtiWDXC/qTgLpXKupKsLjXlx8DYVdTRaF74l3X4k7oJ1kw6I
 p/IskUDuSEk3q/oMd9cbGnlkJm+ZrttX65hhFVK7ZNl9z75pmJEw+aWUhpkk2V/NEBXl
 DNcXYOnyy914bSWJNuNSX/QQQyth2NUpFDslw3A9uszP5KqUhWv2Q+8CW6hmy7FWXe0l
 fJrPLgkqgaf9CAzyJl6ZVegl69pWkCTbiP47P91Z7ZxlXgZoOzQ4/xZZ0CVpu1EIw5/T
 YLG2qpGomDQ9W06XOTEzZusJSY6QLVwlK2QjK0PUAs2iatCQtMdRD8a0weoVgA4cIaSA
 GkPQ==
X-Gm-Message-State: AJIora/GA2vnouZX703ZCfo0SWa6NGmcOiNjbcIdus1Fp8G8JqUeGtvB
 VTgIP4NIKv1ODQGJuBHNMDqJKw==
X-Google-Smtp-Source: AGRyM1usrRAbvRtTfJyeMHsqxR2asoTm2C1H1HtsyIpxxvE11PA+G3nY2Tb2OC3QKDrmw34xMlcEtg==
X-Received: by 2002:a17:906:1109:b0:711:da3b:bdcb with SMTP id
 h9-20020a170906110900b00711da3bbdcbmr18922623eja.210.1655714666082; 
 Mon, 20 Jun 2022 01:44:26 -0700 (PDT)
Received: from [192.168.0.207] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 dz12-20020a0564021d4c00b00434ed381701sm10069136edb.35.2022.06.20.01.44.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Jun 2022 01:44:25 -0700 (PDT)
Message-ID: <012d0f02-05a7-ce34-6a24-3e3e2f59f404@linaro.org>
Date: Mon, 20 Jun 2022 10:44:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 1/3] dt-bindings: phy: qcom,hdmi-phy-qmp: add
 clock-cells and XO clock
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20220620010300.1532713-1-dmitry.baryshkov@linaro.org>
 <20220620010300.1532713-2-dmitry.baryshkov@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220620010300.1532713-2-dmitry.baryshkov@linaro.org>
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

On 20/06/2022 03:02, Dmitry Baryshkov wrote:
> As the QMP HDMI PHY is a clock provider, add constant #clock-cells
> property. For the compatibility with older DTs the property is not
> marked as required. Also add the XO clock to the list of the clocks used
> by the driver.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
