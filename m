Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 896D565AAB7
	for <lists+dri-devel@lfdr.de>; Sun,  1 Jan 2023 17:42:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C70A410E0B4;
	Sun,  1 Jan 2023 16:42:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 813DB10E084
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Jan 2023 16:42:28 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id s25so27088593lji.2
 for <dri-devel@lists.freedesktop.org>; Sun, 01 Jan 2023 08:42:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DyHmJqMwBFUTDUCLBa6xYcpZiFOVVP1mRqK8f17ZqlQ=;
 b=nlo6vvboC1gDKb90dwiGsoLvLW04p9t5Iuivx1rAOrJQ6IdEGnrYpwh7jiDBPfE/3D
 /SMwuvv2zdSpkX3dgprB2gdElbPIkRczorWVOEB821htUEsSZdQlXni1KB2PltWAtEiU
 duBP9BJ+ZUkQTfY3MHdF5GDxVfYlrnXii5Fe+uSAh2XXhhXWVppStGOaYMrQ0N3kRayx
 uDlPAxzZyXRVO7PyNKmoKgq2xT3baa+YWX5aLoMUFQ32mQGvmiqRLJqeQMA+YQ/0kBGG
 nG4V/dc/WuOXxNT7AqOKI3SGw0IDcnnOmQUljoQy3JwlvVxahlXdRn5EAaePVMzvq6E9
 Ga5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DyHmJqMwBFUTDUCLBa6xYcpZiFOVVP1mRqK8f17ZqlQ=;
 b=UXtsaSjQiyzZpHmGUj4cFILLVCFdd9Y/Zb3VovMx8MHBS0FdvO5GDOO5QoLRN2LjBW
 l8Q5jSgFGvzCdVoXsfUn4OwCOu3wifI6eoeITssQlanakT6woqfLA+JBvt+b+h8WDrwx
 s7pwCab2+O7OLnA+3/9qqwxUzw5Se3GoksgQBpT70coLUAC8uiNVRIUANF8DSN60QKVF
 1PIfVPcy5SgfsOCRC466KMR3JjL08+C2Vg4+td3Y1a2+o64DSX73KIAXfV/UCJSK5pHh
 nar55CLwAGzi7c/WRWv5ziSRJba54Y43v2hKGSk/+cMZZJ4nCSsm73xbWbjIA10YpVIE
 YRSA==
X-Gm-Message-State: AFqh2kqYyicvKr7Umgn7jO0WqU6E+XjtGTBsbfOTt1jVLDMOm5GqxVDr
 y1zRNo1cBLpVA5WG9P1FULwpxA==
X-Google-Smtp-Source: AMrXdXtaUkfXq3/pXQqKV7l0Qid+mJyMwHrwTgiPlwkTGs86H4Do7vJZvJh904esgyxZHUHgnau53Q==
X-Received: by 2002:a2e:a54d:0:b0:27f:bc58:3926 with SMTP id
 e13-20020a2ea54d000000b0027fbc583926mr8113638ljn.43.1672591346531; 
 Sun, 01 Jan 2023 08:42:26 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 s9-20020a2eb8c9000000b00267232d0652sm3055761ljp.46.2023.01.01.08.42.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 01 Jan 2023 08:42:25 -0800 (PST)
Message-ID: <3dceb85f-1c1c-e8c6-1cc7-3c75f3f4c0b7@linaro.org>
Date: Sun, 1 Jan 2023 18:42:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] drm/msm/adreno: Make adreno quirks not overwrite each
 other
Content-Language: en-GB
To: Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 andersson@kernel.org, agross@kernel.org, krzysztof.kozlowski@linaro.org
References: <20221229101846.981223-1-konrad.dybcio@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221229101846.981223-1-konrad.dybcio@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, Emma Anholt <emma@anholt.net>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Jordan Crouse <jordan@cosmicpenguin.net>, marijn.suijten@somainline.org,
 Sean Paul <sean@poorly.run>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 29/12/2022 12:18, Konrad Dybcio wrote:
> So far the adreno quirks have all been assigned with an OR operator,
> which is problematic, because they were assigned consecutive integer
> values, which makes checking them with an AND operator kind of no bueno..
> 
> Switch to using BIT(n) so that only the quirks that the programmer chose
> are taken into account when evaluating info->quirks & ADRENO_QUIRK_...
> 
> Fixes: b5f103ab98c7 ("drm/msm: gpu: Add A5XX target support")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/msm/adreno/adreno_gpu.h | 10 ++++------
>   1 file changed, 4 insertions(+), 6 deletions(-)-- 
With best wishes
Dmitry

