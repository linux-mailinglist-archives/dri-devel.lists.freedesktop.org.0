Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EF235E8AD0
	for <lists+dri-devel@lfdr.de>; Sat, 24 Sep 2022 11:30:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1826110E58F;
	Sat, 24 Sep 2022 09:30:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F67810E58C
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Sep 2022 09:30:19 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id a2so3704585lfb.6
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Sep 2022 02:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=IBvwqmIkee/mEk1eD5GIAynGE3bP9mLepq0/KSN1Z5Y=;
 b=JHz8l9cm+bQv28WXN2iLgm2nfh+TgnHT2wrwFZAaLYOH8AMypMTaxRT0USxJTx1qDA
 bJfSDoTaDjOHSTWcn5Y1O8wcW9rQKY/z3rWXoSwu57TC6f1D8VufW1No/pbOi1maYn/x
 OIdgiKcelqSvLWPulhtcoJ918GphiUdq00ZYQI1fTWMUTlZDWkawjgcMBMORLLOhWJIy
 KfwRW45BsTklk7ViAptHFYlYxcONcaLqrB3d7k1sLXl93aezZaKW3DlE+s6RwdurdLKa
 lQMjBM6JWU4UxWcrRiE1d7HPUIPqe8s7vqXqdTzngaDBZ5B8XPOuZnpveKz8lt9DsbwS
 6zdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=IBvwqmIkee/mEk1eD5GIAynGE3bP9mLepq0/KSN1Z5Y=;
 b=O18NXtXBcpR9+njNsf0r6aDVkonphE66bLVgpJcrp/sl9mvEfywh1E7qzpHs57ETL6
 ywbyinb2y6b5uATLowy3+GzyHNTgpOWSRLdZEMuifJv7SmWRmz9cR/yOvpUnSPSPNckG
 soDCQvxWvMLjenopOQ1rWe4tpCJ5PnIaLl69nZU0AZBEXhwffyJxECQgH8l75altHMHB
 KuBukvmpx3H0JTNU1Zoy9YA7XLzhE3lipLoekJHFRKoU4O/2FFwoG98wsbHgn6cnYdWv
 bNcZfNvRXGh+HNeUMgff4zbpXSWyNzekCwhDscDFEYS5DxEH/0JOTDs0sd/VuW3phxD+
 qNZg==
X-Gm-Message-State: ACrzQf1Ay8oxWbY5AG5l5Bb/ZebRH3B6tUqkoVvyz6I+3r/SPCugyylx
 3kk/qLgl+XGT/M9cUeqX8IgHXVJgwjLhFg==
X-Google-Smtp-Source: AMsMyM7tno1mmU/0I88pwXzxJ33cLgdA28PKnkVMEER96O0p5HvrATY6IyuhN0owxHY5wG0k0wZDsg==
X-Received: by 2002:a05:6512:a85:b0:49a:c6f2:7aa4 with SMTP id
 m5-20020a0565120a8500b0049ac6f27aa4mr4924787lfu.59.1664011817676; 
 Sat, 24 Sep 2022 02:30:17 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 z12-20020a056512370c00b0048a8c907fe9sm1837767lfr.167.2022.09.24.02.30.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Sep 2022 02:30:17 -0700 (PDT)
Message-ID: <416f5408-b9cd-f7c8-67d4-7b835ea48976@linaro.org>
Date: Sat, 24 Sep 2022 11:30:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH 1/9] ARM: dts: qcom-apq8064: change DSI PHY node name to
 generic one
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20220924090108.166934-1-dmitry.baryshkov@linaro.org>
 <20220924090108.166934-2-dmitry.baryshkov@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220924090108.166934-2-dmitry.baryshkov@linaro.org>
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

On 24/09/2022 11:01, Dmitry Baryshkov wrote:
> Change DSI PHY node names from custom 'dsi-phy' to the generic 'phy'.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

