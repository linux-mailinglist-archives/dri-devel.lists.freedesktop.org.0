Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 78CDD5F8D8F
	for <lists+dri-devel@lfdr.de>; Sun,  9 Oct 2022 20:55:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E32710E0AD;
	Sun,  9 Oct 2022 18:55:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5515B10E0AD
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Oct 2022 18:55:52 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id a29so13864244lfo.1
 for <dri-devel@lists.freedesktop.org>; Sun, 09 Oct 2022 11:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qH4ZdZe+x9C/mI7GHILlpyuEO7Jb1CNK+ic7+GHbAPg=;
 b=U67pc2OnzYA36zslKIYqtHiPcMCpSF7wMvMSO3Ncc7e7XL4rSnYrEgUVrEq5SVQ3Jk
 uK9TEAAsUiahgTYMsFuMpELEL3XYe1l1WY4z7K8NtsVsxGL7kjDBGRSZS622q3mb5vrK
 bFtZI96xetuaJyGuSbGpTMzg1sWCiBdqiJX7ifEXJ/NW8yldlwsFFwncDIutLsMQFFIA
 9A0qENGe9B0nTnApk7TRWE4myDf2aK20z5RQ0McOfYvLuURpLcy7rrFc1hQJqBPu3YxO
 ppd1k+MPhESgcA/+n31BW1JR6etJ4e/nWL/S09r9Oyn+ppQEJwhEPcbmkhAs4lcoNuEr
 H9ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qH4ZdZe+x9C/mI7GHILlpyuEO7Jb1CNK+ic7+GHbAPg=;
 b=202QvwHdOu1Rq9Au4p/o8rSLpq/H1fQUFIckEhYHn65g6D28TA4Vg+tU5jYL4g7mZ4
 3ZPc+bJVtWdu8MpGuMPg92GEe1dbd1cECk2ZtAZ6BgEuMdJBI65Ko/Ookxq30x+DLfdt
 IH282JSBK6uLoImRU7JKSoOrYeEftsivlg4jV5YMHwa2DsDIvtIOMdS8aT0F2nu1FiHw
 E9r1QMWVsqt1xRFEJIsTR3bECwr+68gkRpfC9PBI0Jmnnm2boYUBMx+Crayq3WuViOgf
 2XCpyncoDX9bBA0PBwp01RJz1h8L/NxLTrIhH6ILeqaqq1vBdg49+IYweJ7cbJejNFpV
 KrIQ==
X-Gm-Message-State: ACrzQf3H95F3hhlGELTwSe6oT7EfXlWh6A0LOy14R3LOMA1Hdw3nG/pK
 79dHnZFYA9yhnz3jAVf8JJy4pg==
X-Google-Smtp-Source: AMsMyM5XudCQ8+NtBNRpwa0An+WQMISOz2GaDYRpbDg8sJiqOjSyAFsOtplF00BqphiaiAFA/WnMKQ==
X-Received: by 2002:a05:6512:6d2:b0:4a2:4f62:270 with SMTP id
 u18-20020a05651206d200b004a24f620270mr5064072lff.143.1665341750545; 
 Sun, 09 Oct 2022 11:55:50 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 h15-20020ac250cf000000b00499b27a329esm1108791lfm.300.2022.10.09.11.55.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 Oct 2022 11:55:50 -0700 (PDT)
Message-ID: <a36325ea-b1a1-4137-97c0-a76ad72a7c87@linaro.org>
Date: Sun, 9 Oct 2022 21:55:49 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v3 05/10] drm/msm/dsi: Appropriately set
 dsc->mux_word_size based on bpc
Content-Language: en-GB
To: Marijn Suijten <marijn.suijten@somainline.org>,
 phone-devel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Vinod Koul <vkoul@kernel.org>
References: <20221009184824.457416-1-marijn.suijten@somainline.org>
 <20221009184824.457416-6-marijn.suijten@somainline.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221009184824.457416-6-marijn.suijten@somainline.org>
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
Cc: freedreno@lists.freedesktop.org,
 Jami Kettunen <jami.kettunen@somainline.org>, linux-arm-msm@vger.kernel.org,
 Vladimir Lypak <vladimir.lypak@gmail.com>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 09/10/2022 21:48, Marijn Suijten wrote:
> This field is currently unread but will come into effect when duplicated
> code below is migrated to call drm_dsc_compute_rc_parameters(), which
> uses the bpc-dependent value of the local variable mux_words_size in
> much the same way.
> 
> The hardcoded constant seems to be a remnant from the `/* bpc 8 */`
> comment right above, indicating that this group of field assignments is
> applicable to bpc = 8 exclusively and should probably bail out on
> different bpc values, until constants for other bpc values are added (or
> the current ones are confirmed to be correct across multiple bpc's).
> 
> Fixes: b9080324d6ca ("drm/msm/dsi: add support for dsc data")
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

