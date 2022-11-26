Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97F3A639803
	for <lists+dri-devel@lfdr.de>; Sat, 26 Nov 2022 20:04:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33B4A10E179;
	Sat, 26 Nov 2022 19:04:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E34510E00F
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Nov 2022 19:04:32 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id j2so6173479ljg.10
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Nov 2022 11:04:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JQJ0hoJWhx/J0XU85Lnws4+lfntD5Pjffo9diT48BKM=;
 b=byEv63T1rRbgnn0P6JpqyTCTFqbXB8M7NxaRs0DCgDSRm4OWS+v9iqs+hN3MtDL5mK
 hhVMuSW2Y0i6eEvl13CNQw8zM5Yn38jQwHgdFSe5B334d2aFFAcucGuNadbmj27vb9aW
 XJAs7YsziTyVmLJ14CrlR3v+0jjMyGiu/Ff3pxBq4P1pqi96ZUH0wvefwykK2r2rTiMD
 SosipYkKBAEKNLlVrqkFIAoGxFLkUBtG9bBlAcPv70YPQSM6+JDmocLSJbgTsC1BPLo2
 mEZoTKFG0SrYm0ZA3IQXmPwV0XA/VxfmA/Z04U0Tu5UvHIiXk4j6j1FtAqyrI4zsBlcS
 3h0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JQJ0hoJWhx/J0XU85Lnws4+lfntD5Pjffo9diT48BKM=;
 b=TQc16EhICpzHJfTmbQCD5uCcPS500JnzbvyoqX9q3f1YD4ruB7iTPa260KVCehX0W0
 Hg9Dr60axTildUvPTYYtkc+8Z1GomJs5yYfmrq/gePfzvrx3WK6rjiV0EtzjPJ34G/id
 NVsoiHOzVssIPT2Fr4nPEGhk4L8oVX/k+YmP/7zpfv7y7IgAhYQG47ksrTSyM3MBpmmq
 ClMlgYwtrBaMZ9hq/mY2l3d5QvYRZdx+a2rDCmzQo3IK1MDAWkLuAN71digzG1ZdnjFw
 2bSvdxF81adtdIBQJvv1ixNfnmas+G1hn9DItURxGvcBJowRIArB2nsAgpy8pvOWVtLc
 yTjQ==
X-Gm-Message-State: ANoB5plBH+uHPcIV4EoXSwj78N0Vyd1EhwN6FNrSMZYM6AD+RIbaOTvL
 D5QDFu5FSXK4mlr6U/WVPXTDWQ==
X-Google-Smtp-Source: AA0mqf7HxRVrGNL/rJzJF3mGojM4AEr4ENY68xddSsDi72yUwBZX+pS2vJIsrZQM6JDfPwuCrzOqtQ==
X-Received: by 2002:a2e:2a41:0:b0:277:77a:b53b with SMTP id
 q62-20020a2e2a41000000b00277077ab53bmr14252832ljq.59.1669489470877; 
 Sat, 26 Nov 2022 11:04:30 -0800 (PST)
Received: from [192.168.1.8] ([185.24.52.156])
 by smtp.gmail.com with ESMTPSA id
 t8-20020ac25488000000b0048a8c907fe9sm996746lfk.167.2022.11.26.11.04.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 26 Nov 2022 11:04:30 -0800 (PST)
Message-ID: <e4be5aee-b7e2-1705-daba-f4bd2521ae4c@linaro.org>
Date: Sat, 26 Nov 2022 21:04:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v4 18/18] arm64: dts: qcom: sm8250: Add compat
 qcom,sm8250-dsi-ctrl
Content-Language: en-GB
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
References: <20221125123638.823261-1-bryan.odonoghue@linaro.org>
 <20221125123638.823261-19-bryan.odonoghue@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221125123638.823261-19-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: dri-devel@lists.freedesktop.org, krzysztof.kozlowski+dt@linaro.org,
 sean@poorly.run, andersson@kernel.org, konrad.dybcio@somainline.org,
 quic_abhinavk@quicinc.com, david@ixit.cz, dianders@chromium.org,
 robh+dt@kernel.org, agross@kernel.org, swboyd@chromium.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 25/11/2022 14:36, Bryan O'Donoghue wrote:
> Add silicon specific compatible qcom,sm8250-dsi-ctrl to the
> mdss-dsi-ctrl block. This allows us to differentiate the specific bindings
> for sm8250 against the yaml documentation.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/sm8250.dtsi | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

