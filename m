Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 58978599533
	for <lists+dri-devel@lfdr.de>; Fri, 19 Aug 2022 08:18:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93F9110E747;
	Fri, 19 Aug 2022 06:18:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59DC910E757
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Aug 2022 06:17:47 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id q18so2623569ljg.12
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Aug 2022 23:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=LJ6Y1/P/3NgrZFk4V8Ks7FUqbnAKX/c9IhrAriRyk6U=;
 b=Z0w5qpy0S5WF+Jsw5u2J+pjK95+pFKjYVL4sGfE+yR1hQ1MoPmPz49Rd6+OB6mS3+Y
 QPLvSsihCnXsLWWB0KszmzbJbdOLSljlZEXhaxTRzEPltEtY2VfT6d26dB1zEJHvJzkB
 32f8Ue/R2OHXzjX3ZvmU5OqvJFVZ0HA1XWA9sY+HIa011NmNSlQOnQcmhTZLWeDcc84V
 FtissL+7XWGXrjJyoVA3UqQay6veJiU3CPrxmzL3nktYWB9DgrzlDaqIai0Cy+twNIwh
 E6Qkx+188IEKWu8s8VXzj3QQvdrpXLMqDzcMh1RAORSzj0CENMhaAnxfd1co8MbHyH0h
 oj2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=LJ6Y1/P/3NgrZFk4V8Ks7FUqbnAKX/c9IhrAriRyk6U=;
 b=jg635f2fRyXAx6BQCyAL/HalBGT/Uv6YXERZjTvC5OFnMmo1nXzsesXTRYbcbYu4yV
 1mVyPjqnP63sPDGLM5pH1TnmcjpdeGUS6Xv3ufRyWqXV2v68T5CDBi8hlzKagO/zGqYd
 SOMTwb+J8hTdGTO+KaDuRn5SwgpdjUQ8a+QWEtY8T1EV0X2qWRvSqFqo+PAwSXRqHXOy
 LaKJPxIlvHJ9fCAQmDcZ52Ziwnk8CzXWzNj0+rn9C9gVvdCsrGPfiXhMVcFM92xGkNgU
 SFXU5IMQ9w5pK4DSqahe5ff45CpW8yIz4PvtdEOW5HVCtXAjbf50QOzC2awWG8n/RSd0
 /tLA==
X-Gm-Message-State: ACgBeo1lLINVlQE56MvbJj9j+ZdWb15D3siAhY6dYiWzmXkeD5uMAOvC
 owvDBRSiCTiOWe2QpOBibmYUkA==
X-Google-Smtp-Source: AA6agR7DCy6FxvZFYRuBMsWwcqPT29FISCRST1z/IxE7dY3YeTj9ewMGRqgvtt9uK0rRYfOeb2FacA==
X-Received: by 2002:a2e:978f:0:b0:25e:4847:530a with SMTP id
 y15-20020a2e978f000000b0025e4847530amr1794081lji.279.1660889865666; 
 Thu, 18 Aug 2022 23:17:45 -0700 (PDT)
Received: from ?IPV6:2001:14bb:ac:e5a8:ef73:73ed:75b3:8ed5?
 (d1xw6v77xrs23np8r6z-4.rev.dnainternet.fi.
 [2001:14bb:ac:e5a8:ef73:73ed:75b3:8ed5])
 by smtp.gmail.com with ESMTPSA id
 w17-20020a19c511000000b0048af85f6581sm509957lfe.154.2022.08.18.23.17.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Aug 2022 23:17:45 -0700 (PDT)
Message-ID: <0cdca889-1193-1595-e524-5a0cfc633d14@linaro.org>
Date: Fri, 19 Aug 2022 09:17:43 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v3 5/5] arm64: dts: qcom: sc7280: Add Reset support for gpu
Content-Language: en-US
To: Akhil P Oommen <quic_akhilpo@quicinc.com>,
 freedreno <freedreno@lists.freedesktop.org>,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Rob Clark <robdclark@gmail.com>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Stephen Boyd <swboyd@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <1660853919-987-1-git-send-email-quic_akhilpo@quicinc.com>
 <20220819014758.v3.5.I6a1fca5d53c886c05ea3e24cd4282d31c9c0cd0b@changeid>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220819014758.v3.5.I6a1fca5d53c886c05ea3e24cd4282d31c9c0cd0b@changeid>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@somainline.org>, Andy Gross <agross@kernel.org>,
 Douglas Anderson <dianders@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 18/08/2022 23:18, Akhil P Oommen wrote:
> Add support for Reset using GPUCC driver for GPU. This helps to ensure
> that GPU state is reset by making sure that CX head switch is collapsed.
> 
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> ---
> 
> (no changes since v1)
> 
>  arch/arm64/boot/dts/qcom/sc7280.dtsi | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> index e66fc67..f5257d6 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -2243,6 +2243,9 @@
>  			nvmem-cells = <&gpu_speed_bin>;
>  			nvmem-cell-names = "speed_bin";
>  
> +			resets = <&gpucc GPU_CX_COLLAPSE>;
> +			reset-names = "cx_collapse";
> +

I think this is not allowed by bindings. Did you test your change with
dtbs_check?

Best regards,
Krzysztof
