Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 394605E8AD3
	for <lists+dri-devel@lfdr.de>; Sat, 24 Sep 2022 11:30:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC3CF10E58C;
	Sat, 24 Sep 2022 09:30:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A862410E58C
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Sep 2022 09:30:39 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id i26so3657878lfp.11
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Sep 2022 02:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=IBvwqmIkee/mEk1eD5GIAynGE3bP9mLepq0/KSN1Z5Y=;
 b=XZ1V4ejxRvmjCcZUTxWLHU12whSdot5qtCzG6oCYK6lVY1sbvj3TqsS7MmDuj3M/8q
 3mF7YzORN893U9RMGOufMBgrwH3MAF9+ZBAMZaO1moTwyN3ChbdwRDeG66XDJEUjZGto
 0AF7g9mDbsnKceV7OtfpiOQ/aEDh5OuikwbkSi3Z47ga65fmbUnFLwWA0SYYxMkQThBI
 qNH2+Q8cX5psWunN+vWGyocL9pasWSehkiaZygVhfqC1uWvO9Kuap8aqEdhTosJGiuLv
 +zjktXpKqf89QVPX0kuq4GtlvHNuRGcah9Xs+u6kHqeBcz4dvOIn2xkAEO/4OPcBFaKp
 AhiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=IBvwqmIkee/mEk1eD5GIAynGE3bP9mLepq0/KSN1Z5Y=;
 b=zHHAYfVwK0Zkz7ST0Ydm7hUiEAmz5OX5dn1AfDm+9qzpTO0vzPUp/16Fl4TDt/+tme
 Vwl/9Eln45bq3q9tQ6xDiGnVlHf0DohGNH1y5VNxAtg8giOl8vOfiedoyi76dljt/++Q
 LBmtM3GjEry03jcYUP0v0Wzir9qdWUA13kDyj2ESR0Prg/XMgOqilPwAvFaFejYuyaen
 vH3YaTXZqClBcrFQZ1xR/svgoiZU8Wj/lp/PK/zLmlVoglphtyH3e6kI9jyExt+f7+5c
 fXeCUWjCOIiTElYBAsBnVEAmiiCuvDoXXaOC+H1p13S+MEAKikwoPfMUpVsiuATdJXIW
 oJuQ==
X-Gm-Message-State: ACrzQf2VnaTLUEU7xPpTzRL0UOgPbPHmIZdHK33znll27AbePFxDW4rs
 GYURH+QtHXFHgV0kJDymhNpVKQ==
X-Google-Smtp-Source: AMsMyM4eY6Bb3ZQLBJIB0SXUbmPPatP5oPnH7NvZJ+Ska+7Q2v6jFE1iNDM12lNRUivZONcelFXghg==
X-Received: by 2002:a05:6512:2a8f:b0:49a:db9f:d498 with SMTP id
 dt15-20020a0565122a8f00b0049adb9fd498mr5158098lfb.435.1664011838085; 
 Sat, 24 Sep 2022 02:30:38 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 t3-20020ac25483000000b0049a5a59aa68sm1840353lfk.10.2022.09.24.02.30.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Sep 2022 02:30:37 -0700 (PDT)
Message-ID: <40cd341c-da16-7de1-bcb4-58d1d568ec43@linaro.org>
Date: Sat, 24 Sep 2022 11:30:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH 2/9] ARM: dts: qcom-msm8974: change DSI PHY node name to
 generic one
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20220924090108.166934-1-dmitry.baryshkov@linaro.org>
 <20220924090108.166934-3-dmitry.baryshkov@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220924090108.166934-3-dmitry.baryshkov@linaro.org>
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

