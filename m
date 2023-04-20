Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 13D306E86C6
	for <lists+dri-devel@lfdr.de>; Thu, 20 Apr 2023 02:47:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44B0910E1F3;
	Thu, 20 Apr 2023 00:47:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F11F210E1F3
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Apr 2023 00:47:00 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id bz21so917574ljb.11
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Apr 2023 17:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681951619; x=1684543619;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4AE/gqnqDMqT5+SZLjSuvK+IKuP3U9eK+CuG+PZ1CR0=;
 b=e4v6N2lPIWLVzPpc7EEd73c9/NeSuOv0JljZXVhqsYxOPC6W9Spxm3P7f2wad/vPsp
 D7W74DhFZRYSCrEr4HxT8KrTcAqdSdxTDacfz5+n1IjZQj+XnfRtQwpQHWUTJUSWGdhv
 tqv5g9SgfjxcTZnFc6o7DbFT9EWem/cbWrceoxX3fHkI3aomj89fpa2m/FhXJR2Xz79G
 2Eq/n3dGC1Xqu/a2WcbEi8WvyU0r3nMcYj20fzjFlpNI+JLJ5yLCxJTLsTnf9GRIbUKg
 /4/hoLda37npYgbCbJrk4y8AlwN0uq3OOzWdenhhkgmz3Q1K3hML2xAC8uY4mRWHxHZC
 3sgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681951619; x=1684543619;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4AE/gqnqDMqT5+SZLjSuvK+IKuP3U9eK+CuG+PZ1CR0=;
 b=ht6WnEKRdMW2wFegmfObYKCyiFAS7oirwC4KfLrlMWixV75MvP8eJ5kzJrNmb9iMAZ
 ISAvp+Yvm6XFXo45Y8viMSDQl1+IBiNM/NGfL5BLa21geDnnAoBYNktoVr+I8Uhdywoq
 bXv1+vAucdjYWhBUGZiAYxLAFdpVg7GhEocbvDAP9iDveE4+RGFNfLTfJED+QH2WJxfN
 uiNhyPHm6jQ+zsuiCXHl07q6h11PF6bpwkvUip/m53hHs9YGER4rqIMyW5MBHu3GsemM
 PMjnvo+cSskeHfHoGTfcICvVK3a6oxxJ0mHgaA5ETJPoaHSgG3lHhK6P6twV8CayBhGi
 Hitg==
X-Gm-Message-State: AAQBX9eTz57q453eUN0nnGKlN6K0T7iT8EW06NHMOd36GRpPil+0r2SP
 dEdylkY14+Vt3LZzq9d3+UUDgg==
X-Google-Smtp-Source: AKy350YnH+VkzUueFre3hX29m+rao+d/EhdY13sLIy2s8/4ZGOlKWRsUrJhpBVTtJUHQ1iD1tzPM4A==
X-Received: by 2002:a2e:3312:0:b0:2a8:b628:5c01 with SMTP id
 d18-20020a2e3312000000b002a8b6285c01mr2172795ljc.34.1681951619024; 
 Wed, 19 Apr 2023 17:46:59 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 a28-20020a2eb17c000000b0029c96178425sm16999ljm.19.2023.04.19.17.46.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Apr 2023 17:46:58 -0700 (PDT)
Message-ID: <0bf2fadf-eb3b-9fae-3615-aa8a95e9e650@linaro.org>
Date: Thu, 20 Apr 2023 03:46:57 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 06/17] drm/msm/dpu: Remove extraneous register define
 indentation
Content-Language: en-GB
To: Marijn Suijten <marijn.suijten@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Adam Skladowski <a39.skl@gmail.com>,
 Loic Poulain <loic.poulain@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Robert Foss <rfoss@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Rajesh Yadav <ryadav@codeaurora.org>,
 Jeykumar Sankaran <jsanka@codeaurora.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Chandan Uddaraju <chandanu@codeaurora.org>
References: <20230411-dpu-intf-te-v2-0-ef76c877eb97@somainline.org>
 <20230411-dpu-intf-te-v2-6-ef76c877eb97@somainline.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230411-dpu-intf-te-v2-6-ef76c877eb97@somainline.org>
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
Cc: Archit Taneja <architt@codeaurora.org>,
 Jami Kettunen <jami.kettunen@somainline.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 freedreno@lists.freedesktop.org,
 Sravanthi Kollukuduru <skolluku@codeaurora.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 17/04/2023 23:21, Marijn Suijten wrote:
> A bunch of registers are indented with two extra spaces, looking as if
> these are values corresponding to the previous register which is not the
> case, rather these are simply also register offsets and should only have
> a single space separating them and the #define keyword.
> 
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c | 41 +++++++++++++++--------------
>   1 file changed, 21 insertions(+), 20 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

