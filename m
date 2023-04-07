Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20D646DB0AE
	for <lists+dri-devel@lfdr.de>; Fri,  7 Apr 2023 18:34:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75E5D10EE11;
	Fri,  7 Apr 2023 16:34:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AB5B10EE11
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Apr 2023 16:34:21 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id j11so55058020lfg.13
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Apr 2023 09:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680885260;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ns5LOSHu/7rt5El0gaG0VOdBa6A5/wehdLEQPfWFNHE=;
 b=Zd3qxX1eMvUbWNHlNFJpQr1IW9sKUSqmV5VO2F6q3ZofrQcEu9R1utBg4mkgi14+Ed
 NmMEyHFk1xPRHx+wbV9I6I/gUBaXp1M8AGbPtKJYCMtryWy3yvSXL3Lh4J8Uh7BHlV33
 y7jxzYBqA93sFwBQF++Dz1QZpW/nAKpe92lBzyAjO7a9A4i8p0FD6lfZ3fV7XH3x6Es2
 DBxtHKdFYaIb7l4T+KSGlb/Vb4mQytUcU2GlB8vjHF3h/VmhJgJ6gbZU6jhU1OB9C+WR
 tPpbF/DEHec62VEnr754lztIaWAHrLYFdc3xK/6D3F7s46kBh0n6tiospMzOHWRQ2fYg
 I9yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680885260;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ns5LOSHu/7rt5El0gaG0VOdBa6A5/wehdLEQPfWFNHE=;
 b=Znyvvt12Zdd8CU4JVpAMdrQvNrsEgu28GKWZPGMB3vkWSss8/0WqjVUWU6dP8YNcQd
 qYrqkKud1TlX0vTqhtUj8+Lnt/5ppvCo6ye+JRLBM3Yzpl1wI+25B0jIbkRyKyyMHIvr
 EFDzOm7wU1ex5ebRAVShTrvV1ubv2WnI8pmzMuM5d5ag6scKZ1p0JSsLK99owimqrZpN
 RJX5GBeXp24daMiDO2EJsIPzGmiJEeE5Xj77OYYFspVfLhUqTYRhdNXYmniU6p0CQa+V
 +V2OZneEOgN0YgrKu0vBw1qOfGD2VGQAdu8PLpnQVhhUIiqbScMDV/yvONDQ/faxB4vE
 0fog==
X-Gm-Message-State: AAQBX9eBM1aNwY/otTXqJMXLhUo5qDJSd8fKr5XyRKUhHd/TrATfo8SK
 4ffNrsmCMVCuR11U5uEuk7VDlA==
X-Google-Smtp-Source: AKy350aeMn+uduz5SM1Q+zIFL1amX8/Z79FODoWr4RrabDEAu57MaCpeRCFE4XzvSXWyJrDeJL/JEw==
X-Received: by 2002:a19:f70f:0:b0:4ea:fdcf:8f62 with SMTP id
 z15-20020a19f70f000000b004eafdcf8f62mr978422lfe.0.1680885260281; 
 Fri, 07 Apr 2023 09:34:20 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 16-20020ac24850000000b004e817c666eesm774924lfy.193.2023.04.07.09.34.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Apr 2023 09:34:19 -0700 (PDT)
Message-ID: <118af32a-c5d8-2c93-887d-8da83779eb9a@linaro.org>
Date: Fri, 7 Apr 2023 19:34:19 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v8 09/10] arm64: dts: qcom: sc7180: Add support for HDCP
 in dp-controller
Content-Language: en-GB
To: Mark Yacoub <markyacoub@chromium.org>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20230331221213.1691997-1-markyacoub@google.com>
 <20230331221213.1691997-10-markyacoub@google.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230331221213.1691997-10-markyacoub@google.com>
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
Cc: devicetree@vger.kernel.org, suraj.kandpal@intel.com,
 linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 dianders@chromium.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, seanpaul@chromium.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 01/04/2023 01:12, Mark Yacoub wrote:
> From: Sean Paul <seanpaul@chromium.org>
> 
> Add the register ranges required for HDCP key injection and
> HDCP TrustZone interaction as described in the dt-bindings for the
> sc7180 dp controller.
> 
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Sean Paul <seanpaul@chromium.org>
> Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
> 
> ---
> Changes in v3:
> -Split off into a new patch containing just the dts change (Stephen)
> -Add hdcp compatible string (Stephen)
> Changes in v4:
> -Rebase on Bjorn's multi-dp patchset
> Changes in v5:
> -Put the tz register offsets in trogdor dtsi (Rob C)
> Changes in v6:
> -Rebased: Removed modifications in sc7180.dtsi as it's already upstream
> Changes in v7:
> -Change registers offset
> Changes in v8:
> -None
> 
>   arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi | 8 ++++++++
>   1 file changed, 8 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

