Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B06B661966
	for <lists+dri-devel@lfdr.de>; Sun,  8 Jan 2023 21:37:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78ECE10E20A;
	Sun,  8 Jan 2023 20:37:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E13ED10E035
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Jan 2023 20:37:42 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id j17so10058220lfr.3
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Jan 2023 12:37:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=2wjZyCiu39kHUTVUWrdgmj76POWhIfcwRPWfaQQRFjg=;
 b=r7U+cjr4XjIRJ9ex/9VUYCK6QbDVM2k6XxYJarY5oqgtych3zMU0OX5lHjddibz04M
 qNApQuNg3HCaTvcp+5ZeDJ79AT5Quf0tsM7GO9marhR3t0bLDVG1TaSHnqamFSFgpYQd
 LuV1w7WKR0aGgUdI/IfD3JHLKs9HxwE154N641TQQ5HdzUeoqu+abHuDiq2k0ViFYyrS
 PFOKnb3Xieu0FeOBgDtn/543Wo0jIhIkEbOrW/NqtJKolWDkeqAUQb4aPQx95C/qLplA
 EGmcov6zshQTAmhSwGALPOmrlBw+WBEALuQcI+BOs/IIz2RE8IQHkzOzl7pPXEf1c/MB
 P1AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2wjZyCiu39kHUTVUWrdgmj76POWhIfcwRPWfaQQRFjg=;
 b=4/EobOa+TLqUGYYTyrJcBEpbKkld4uTMSA3768ufZi5McCsY0UxT/c/TKCy7lgKdpI
 HqKNOOwFxEOjlvA+CC7qUCTp7uYmRVJztCG+2oyVB1wFspk8glYnjFr2eKMy5WG1GPEx
 wHSzabJm6JIPVICYxBaJjsz0mHwWNwHvr/2TdFm8MNV0pwg/TBLUgt88S8nNnncc3dwt
 YwvHVcUa//Cf35vPoO8VjG8lpR/ZE8tqHpV8Va5fbz8kQkVoxr6MAzenxodcv4VEBONA
 6vdpseIpE+oLS/rSNWwpYVQrRE64ZcmEYQAbe0lB6eTQo/UaQaOVJZO3YOmUFGH/sb3r
 SWSg==
X-Gm-Message-State: AFqh2krm7n/CjWN9KGFE1mYLjxIUBepxFMfJbU+Q3okHm9XisFaDS77W
 8+YNGMWQeSVQ3JUWaX/WmEsVNQ==
X-Google-Smtp-Source: AMrXdXtgtS0VMjYKAzLIJTHfulWhxtMeF0KdIBMpQ/AdWm6YN0w9H1vHgNvF0Y+GlLFsKuiokwi7Ag==
X-Received: by 2002:a05:6512:1049:b0:4b6:edce:a192 with SMTP id
 c9-20020a056512104900b004b6edcea192mr19485618lfb.4.1673210261249; 
 Sun, 08 Jan 2023 12:37:41 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 u16-20020a05651220d000b004cc8207741fsm295936lfr.93.2023.01.08.12.37.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 08 Jan 2023 12:37:40 -0800 (PST)
Message-ID: <2f6ea88f-9b84-3a8b-dacf-41af80f8574d@linaro.org>
Date: Sun, 8 Jan 2023 22:37:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v4 04/11] drm/msm/dpu: Add support for SM8350
To: Robert Foss <robert.foss@linaro.org>, robdclark@gmail.com,
 quic_abhinavk@quicinc.com, sean@poorly.run, airlied@gmail.com,
 daniel@ffwll.ch, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 agross@kernel.org, andersson@kernel.org, konrad.dybcio@somainline.org,
 quic_jesszhan@quicinc.com, angelogioacchino.delregno@somainline.org,
 loic.poulain@linaro.org, vkoul@kernel.org, a39.skl@gmail.com,
 quic_khsieh@quicinc.com, quic_vpolimer@quicinc.com, swboyd@chromium.org,
 dianders@chromium.org, liushixin2@huawei.com, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jonathan Marek <jonathan@marek.ca>, vinod.koul@linaro.org
References: <20221230153554.105856-1-robert.foss@linaro.org>
 <20221230153554.105856-5-robert.foss@linaro.org>
Content-Language: en-GB
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221230153554.105856-5-robert.foss@linaro.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 30/12/2022 17:35, Robert Foss wrote:
> Add compatibles string, "qcom,sm8350-dpu", for the display processing unit
> used on Qualcomm SM8350 platform.
> 
> Signed-off-by: Robert Foss <robert.foss@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

