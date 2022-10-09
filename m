Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61BD85F8D72
	for <lists+dri-devel@lfdr.de>; Sun,  9 Oct 2022 20:52:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D19EC10E530;
	Sun,  9 Oct 2022 18:52:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25C3910E533
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Oct 2022 18:52:43 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id b1so8856522lfs.7
 for <dri-devel@lists.freedesktop.org>; Sun, 09 Oct 2022 11:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pIjqS6gdtTRggpFmsM12g61XiUJqlB1w3Lk7PGDiY4k=;
 b=SQcpo++Aix4dizmqjgzZCFPDhj3ziY+qCd0ihacLAwRIKs5cxTL6R6IFiwqleLXyfT
 ZoaANhOY75dDQTTP2FZZCS7I5A/N/GtWVvDdwEkh9uuwSincRBNQ+SsgPjTAGuMjBjHs
 AuVmzhD3FwSbvERNUzd5SnRMVgElcZ3jOC4P5VcqD2K0iRVGb5DGBwXvBJOhQWF6JS+N
 JpuXjzFv1bwvUq8YqN2QWFG+GH7B+m0P1kGqFm5EnakO6jP8tBTwh6fVS/m43l8rkWWh
 OdpOwxcAdLo79dS/S95QLmIRXlTtpI4eWS/X4mi2waKPAt2/wdAllMAZQZCp7ax7Gvnp
 rBTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pIjqS6gdtTRggpFmsM12g61XiUJqlB1w3Lk7PGDiY4k=;
 b=L9eMBGZ90IHUDWx2LdU2IvgP4xcB/vgZ6mOru1WXGSeo6ANKKecpJEPyItKvKEkDGu
 pTsgwjjjdHdu1NPsIRH0yDHvd/GxPnUiLn6uf8h7ZBpmKfXAzsSBo7ga2g2vwhesWsgJ
 cvVioDz4F/hf2R6THojCbbYnmKc3YqUMw7DfaXu/KvDSvZm9SBO4H1CnMPKfNKF21Agb
 zM+FM16evSdSy8VOaBNEvPJt81dEvclHIPKmbw7rkbK/NVbZyGH9GLwKxKI+64MFgGtV
 /m21H4i2zvbXpILqmGEhF+R242xI2EG/QkolWW8HvASNzNNvZJHnNxdb7kScEBOmz03w
 h2Tw==
X-Gm-Message-State: ACrzQf2emudiWogIVi9MuSBsU0kUu+VX9RhSnM2U6K4s5M023lfTKgRi
 Sfl6s4bF8vH4MdFj1TwLDEauYA==
X-Google-Smtp-Source: AMsMyM796VexOVGOSvF6wQDt52LNKPg+357XUoXWAH85pGOFs1V4DM5iIN+W/mnB4ZIqI0uNLyioQw==
X-Received: by 2002:ac2:5931:0:b0:4a2:be5d:edac with SMTP id
 v17-20020ac25931000000b004a2be5dedacmr3273463lfi.332.1665341561243; 
 Sun, 09 Oct 2022 11:52:41 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 q14-20020a056512210e00b00485caa0f5dfsm1114474lfr.44.2022.10.09.11.52.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 Oct 2022 11:52:40 -0700 (PDT)
Message-ID: <3f5cb79b-f745-8b7b-bacd-f9ea2988baea@linaro.org>
Date: Sun, 9 Oct 2022 21:52:40 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v3 01/10] drm/msm/dsi: Remove useless math in DSC
 calculations
To: Marijn Suijten <marijn.suijten@somainline.org>,
 phone-devel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Vinod Koul <vkoul@kernel.org>
References: <20221009184824.457416-1-marijn.suijten@somainline.org>
 <20221009184824.457416-2-marijn.suijten@somainline.org>
Content-Language: en-GB
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221009184824.457416-2-marijn.suijten@somainline.org>
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
> Multiplying a value by 2 and adding 1 to it always results in a value
> that is uneven, and that 1 gets truncated immediately when performing
> integer division by 2 again.  There is no "rounding" possible here.
> 
> After that target_bpp_x16 is used to store a multiplication of
> bits_per_pixel by 16 which is only ever read to immediately be divided
> by 16 again, and is elided in much the same way.
> 
> Fixes: b9080324d6ca ("drm/msm/dsi: add support for dsc data")
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

