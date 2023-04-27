Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 92DE86F0712
	for <lists+dri-devel@lfdr.de>; Thu, 27 Apr 2023 16:15:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06F2810E394;
	Thu, 27 Apr 2023 14:15:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFCF910E378
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Apr 2023 14:15:25 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-94eee951c70so1391005466b.3
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Apr 2023 07:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682604924; x=1685196924;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=lqzI0wZ2EqQrQrjO8vqAoXJym2hVEg0r8e35+35xmQw=;
 b=q2xrjcGWRoZmThPFkxvA4QmteJ3wUDZ408LAWzx4rwMTFR/z8YJNxIz+O2Mjg2MMmX
 M5IsGnIEtDuyGpAX1CRk6f58dZCv1E2AmvkDqebIDtkyNzcZuwZRDrQBn8zySmo2Tz7X
 YAXCaU2n/ykqnbd9cSgSmfHAyZ+iTDqXTu7iSfhqrWbFE37HlWlAAYDlDuFCQ7GXFmFk
 fo4JFEU6Lwzii5xIPQXV3ZscUExZZGpdIyNBNhYPf1JM2BDfXqFuvQSPxq3FKavbqGBi
 J7sgqHN90xjjTkPCgKmF4a2X8Z4FQ2RqtsnSA1NlFkj1aT/RpV/P5V9NqRDnMcCK7lXE
 R5xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682604924; x=1685196924;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lqzI0wZ2EqQrQrjO8vqAoXJym2hVEg0r8e35+35xmQw=;
 b=ePoAPJmSYLxTEUPNAueviG2AcAsdlEfkTMjpIu6G+wfV9QVEc/gue3Rh6kFo9L1aub
 R4GVogUoPyRGGUVOTPgDUPCcsgijYEc1AdwlyzcKL3N4GNr/vOWQcI5KO5Bvq8FhulWn
 OtXCR3FxqL5oL8aDo5HKRFgkV8HyJDWWXBGFhuAzWfpnc4U71YSGeJ6tix1zkHkd88cx
 +T/inosXBWkzu5WB+ak4C4892/mISLhW2M31Co8wWCX0pNrrJtXHQZKCgyvI7hfdv+pI
 +TRhtIANRJrykbx/uxhCZT2CL3sg4HiqnayjN47XNcEq+izaf3q82ZT31iZWpnOC3xS0
 RM4Q==
X-Gm-Message-State: AC+VfDzK1PqzCKRfyuUzVj4Xx0VFyOrXJe+Hc8Wi7vIHlcxKuDBiti4a
 1qFlGDqk85E9cpnXKyWqN0+F1g==
X-Google-Smtp-Source: ACHHUZ5dGF5nSry14i4bNMUV9qu86lYwG1gJxFEaX/tWakik5oSiGyZqTA3ZLSg6+Q3Lrb4MV+sXRg==
X-Received: by 2002:a17:906:7307:b0:958:489f:d050 with SMTP id
 di7-20020a170906730700b00958489fd050mr2012618ejc.43.1682604923689; 
 Thu, 27 Apr 2023 07:15:23 -0700 (PDT)
Received: from [172.23.2.5] ([195.167.132.10])
 by smtp.gmail.com with ESMTPSA id
 pv4-20020a170907208400b0094f49f58019sm9658604ejb.27.2023.04.27.07.15.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Apr 2023 07:15:23 -0700 (PDT)
Message-ID: <544e3e61-d471-f0b5-4daf-53bfc531f361@linaro.org>
Date: Thu, 27 Apr 2023 17:15:22 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v4 02/22] drm/msm/dpu: Remove TE2 block and feature from
 DPU >= 5.0.0 hardware
Content-Language: en-GB
To: Marijn Suijten <marijn.suijten@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Adam Skladowski <a39.skl@gmail.com>,
 Loic Poulain <loic.poulain@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Robert Foss <rfoss@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>
References: <20230411-dpu-intf-te-v4-0-27ce1a5ab5c6@somainline.org>
 <20230411-dpu-intf-te-v4-2-27ce1a5ab5c6@somainline.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230411-dpu-intf-te-v4-2-27ce1a5ab5c6@somainline.org>
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
Cc: Jami Kettunen <jami.kettunen@somainline.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 27/04/2023 01:37, Marijn Suijten wrote:
> No hardware beyond kona (sm8250, DPU 6.0.0) defines the TE2 PINGPONG
> sub-block offset downstream, and according to insiders no DPU >= 5.0.0
> hardware has support for it either.  Especially since neither downstream
> nor upstream utilize these registers in any way, remove the erroneous
> specification from SM8150, SC8180X, SM8250, SC7180, SM8350, SC8280XP and
> SM8450 to prevent confusion.
> 
> Note that downstream enables the PPSPLIT (split-FIFO) topology (single
> LM for 2 PP and 2 INTF) based on the presence of a TE2 block.
> 
> Fixes: 386fced3f76f ("drm/msm/dpu: add SM8150 to hw catalog")
> Fixes: 7bdc0c4b8126 ("msm:disp:dpu1: add support for display for SC7180 target")
> Fixes: 0e91bcbb0016 ("drm/msm/dpu: Add SM8350 to hw catalog")
> Fixes: 4a352c2fc15a ("drm/msm/dpu: Introduce SC8280XP")
> Fixes: 100d7ef6995d ("drm/msm/dpu: add support for SM8450")
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h |  4 ++--
>   .../drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h    |  4 ++--
>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h |  4 ++--
>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h |  4 ++--
>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h |  4 ++--
>   .../drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h   | 24 +++++++++++-----------
>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h |  4 ++--
>   7 files changed, 24 insertions(+), 24 deletions(-)-- 
With best wishes
Dmitry

