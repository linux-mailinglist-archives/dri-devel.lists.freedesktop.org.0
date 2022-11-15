Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 165E6629D47
	for <lists+dri-devel@lfdr.de>; Tue, 15 Nov 2022 16:23:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65D6A10E410;
	Tue, 15 Nov 2022 15:23:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0C6010E411
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Nov 2022 15:23:33 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id c25so17954596ljr.8
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Nov 2022 07:23:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xLKS/17GpYY4MgR4/+gEylG604Jj9+YJ2C6BLpGM54Y=;
 b=LYkbwLcE94T02m+S8klc61BdLgSw8W4InLpW5Q6gh9TUg136iEgHNKLzg8Tm4FHm8U
 aOg4Do2GSIOXi7sGolkSuBk9k+R25thUGno+VbjD0A2gQu4+xJj0h3rkjhsZRsKgxGD6
 j3G5C+tWgoHNxi1ZDXc6ob607kOUAs0bn6hUqt22dnZDbqUO4EKRDA+Zk0ULrO/wa7nw
 r4VSX+vj1eh7rb3ImE/XWYRFCZxo91NwirRshRlmgG2Fzgwavpq1g2CwDONt9DDnRPwd
 dC2sCKroneKdVoqhoxHO2HghWXHbKK9HHDppXpBZUnVJ0/L80e1UHn5QpQFAf/Aj29uF
 R5bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xLKS/17GpYY4MgR4/+gEylG604Jj9+YJ2C6BLpGM54Y=;
 b=cnKjcUjLDwbpZDXeKiWRo/FruzNcV067epYxiFcEJM0y1+zmyxLzREKEq+1mgDfKQX
 L64OCpAkiE1muvg3aRbpIsKKpi/gnYxkEr5ClTJOr7rGjQlqYlPEJZvIZDnWQZ7Wb/k2
 obd6PBc13mpMhzAvCdZXQOuEal2V3ldjp+/UIab4B60uIk2UG3MGIj8Bl+jzCwTTUCLc
 CmqZOR5PXk/L13aohn9n0zE+txwOVhg3UoZq6P1ebOq18cPhxakO6V03nbKgl260sVvV
 v7WXOuVyrdI7XGRauRN3SL0E6FwxnxNAySVV9RNdpnONMCjs+YCoLt5qelRMHOOGOyV4
 LPbQ==
X-Gm-Message-State: ANoB5plCABr1htN9bIiF1q6xxEZa6BdsLRn0l+aokW/4IbXIFejEPVgc
 WYHfSh4HkH4E8ovbItNswmRlsw==
X-Google-Smtp-Source: AA0mqf5usyXx6gAprC2KqXwUCKgLy2D00K8A1R/p5KXWhg4DJKBRIIA+Yqk/jAqdlUOURDEc2BvSfw==
X-Received: by 2002:a2e:b4a9:0:b0:26d:cf5f:6a22 with SMTP id
 q9-20020a2eb4a9000000b0026dcf5f6a22mr5875512ljm.508.1668525812254; 
 Tue, 15 Nov 2022 07:23:32 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 w26-20020ac2443a000000b004acbfa4a18bsm2245731lfl.173.2022.11.15.07.23.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Nov 2022 07:23:31 -0800 (PST)
Message-ID: <bbc08d1e-62fc-b0e2-15e1-76802ed3c4fc@linaro.org>
Date: Tue, 15 Nov 2022 16:23:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 00/12] Enable Display for SM8350
Content-Language: en-US
To: Robert Foss <robert.foss@linaro.org>, robdclark@gmail.com,
 quic_abhinavk@quicinc.com, dmitry.baryshkov@linaro.org, sean@poorly.run,
 airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, agross@kernel.org,
 bjorn.andersson@linaro.org, konrad.dybcio@somainline.org,
 quic_kalyant@quicinc.com, swboyd@chromium.org,
 angelogioacchino.delregno@somainline.org, loic.poulain@linaro.org,
 quic_khsieh@quicinc.com, quic_vpolimer@quicinc.com, vkoul@kernel.org,
 dianders@chromium.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jonathan Marek <jonathan@marek.ca>, vinod.koul@linaro.org,
 quic_jesszhan@quicinc.com, andersson@kernel.org
References: <20221115133105.980877-1-robert.foss@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221115133105.980877-1-robert.foss@linaro.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 15/11/2022 14:30, Robert Foss wrote:
> Dependencies:
> https://lore.kernel.org/all/20221102231309.583587-1-dmitry.baryshkov@linaro.org/
> https://lore.kernel.org/all/20221024164225.3236654-1-dmitry.baryshkov@linaro.org/
> https://lore.kernel.org/all/20221104130324.1024242-5-dmitry.baryshkov@linaro.org/
> 
> Branch:
> https://git.linaro.org/people/robert.foss/linux.git/log/?h=sm8350_dsi_v2
> 
> This series implements display support for SM8350 and
> enables HDMI output for the SM8350-HDK platform.
> 

I received two of these patchsets... Which one is valid? Folks also
review in both...

Best regards,
Krzysztof

