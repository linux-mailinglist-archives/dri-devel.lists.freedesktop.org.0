Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DB2858880F
	for <lists+dri-devel@lfdr.de>; Wed,  3 Aug 2022 09:37:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BC6F10E6E1;
	Wed,  3 Aug 2022 07:37:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 738BF10E43F
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Aug 2022 07:37:25 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id f20so17986833lfc.10
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Aug 2022 00:37:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=ZFL1rpNY6wsrWyWGElxKgonarXbu9XUulVlTCMlwgB8=;
 b=Le0GMSUGuNXx+DN948ov64Ao1jAZwv3kaV4yFwbqE5JSOZv9bCE4+/3ZSAy4eNXvy2
 GVzdyrzDcvEKPn3V6hjk6Ah9wwBzbLF5W30zMnjoOw0oEKhaSdnHLrNGngyDfkApaaQ6
 n6hzafHDmdkraBiVziOE/q0LfblRzzL26eOH/BS8SJ2e8HEoby/q6TY2+6uqbRZn0Xzj
 2MDd7XGl49TpxybUemiYLCAd8nmjzo9nw/QNKZ1ykvGRnJw18BtVdAjrsrM1kyQY377J
 LKjMj1bPjon2t3fbDC3m/vNX3dLWevmTDyUc4bPdChSMLz4bTHrim4NXP+iQ9HofyJrX
 EOOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=ZFL1rpNY6wsrWyWGElxKgonarXbu9XUulVlTCMlwgB8=;
 b=bEUurUVnum/AdhlGIbqKNaQh/gF5PJAnUV/hkiaMWsG4W1QWUrSncTcC4xPW9gFHFk
 kWGzBCgIpFpA74i2wsqjbMnTOwvC1JPh5CoXRGijfo2wZlEVj/OAR3tsBEuX6P+0JFEZ
 3Z1Cact477JGBgVNf28CZmnUALXQPwiYr/oPUPw54Jhm1ZD3Ql4tCpskHy+sHP/ANCiK
 +oKK6lC0vQvk9Uvk22Fvi8pjDgapVjNd6AgnBx301Cg1Tuailqt7+hI5tkGBqLwFmU27
 36j2VfXGRrSVqYauIMByGOCuMRLo+vQ063WXNZTd4O4ls1fomyAWiV1UG8HlHEzGyyNM
 QZNw==
X-Gm-Message-State: AJIora9dXCV/fepTbESblwWotorjMcDSQe3pYr7QLXlmeL01fpqtrB0R
 qJsoWoSEW8iUOoNnQVmAgmFEgQ==
X-Google-Smtp-Source: AGRyM1uVZPcFKVrcPg3zLx0Sinm/50QHNCT/fy+51eTa2lNlbroLZyAtLonhS6dhSihB/nl0XSStUg==
X-Received: by 2002:a05:6512:3f23:b0:48a:90ed:10a5 with SMTP id
 y35-20020a0565123f2300b0048a90ed10a5mr8325616lfa.93.1659512243670; 
 Wed, 03 Aug 2022 00:37:23 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 p13-20020a2eb98d000000b0025e4ca99066sm1120098ljp.139.2022.08.03.00.37.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Aug 2022 00:37:23 -0700 (PDT)
Message-ID: <7de9cd34-dc37-053e-63dc-54b6879ce181@linaro.org>
Date: Wed, 3 Aug 2022 10:37:22 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v3 0/6] drm/msm/dsi regulator improvements
Content-Language: en-GB
To: Douglas Anderson <dianders@chromium.org>, Rob Clark
 <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20220802223738.898592-1-dianders@chromium.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220802223738.898592-1-dianders@chromium.org>
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
Cc: Sean Paul <sean@poorly.run>, Archit Taneja <architt@codeaurora.org>,
 Loic Poulain <loic.poulain@linaro.org>, Jonathan Marek <jonathan@marek.ca>,
 Sireesh Kodali <sireeshkodali1@gmail.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Vladimir Lypak <vladimir.lypak@gmail.com>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, Vinod Koul <vkoul@kernel.org>,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rajeev Nandan <quic_rajeevny@quicinc.com>, Mark Brown <broonie@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 03/08/2022 01:37, Douglas Anderson wrote:
> The main goal of this series is to make a small dent in cleaning up
> the way we deal with regulator loads for DSI drivers.
> 
> As of v3 of this series, the regulator API improvements needed for the
> later patches in the series are merged into mainline. Thus this series
> only contains the DSI changes now.
> 
> I'd expect:
> * The first two patches are bugfixes found while converting the DSI
>    driver over. Those could land any time.
> * The third patch ("drm/msm/dsi: Don't set a load before disabling a
>    regulator") is a patch a sent the other day verbatim, included in
>    this series because it's highly related. It could land any
>    time.
> * The next two patches use the new APIs. Since those APIs are now in
>    mainline those could also land any time.
> * The last patch is just cleanup I noticed as I was touching the
>    function. It's not really related to regulators but it applies atop
>    these. In theory it could be rebased to land separately.
> 
> Changes in v3:
> - ("Improve dsi_phy_driver_probe() probe error handling") new for v3.
> - Do all the PHYs too.
> - Fix typo in commit message.
> - Get rid of error print after devm_regulator_bulk_get_const().
> - Just directly call the bulk commands; get rid of the wrapper.
> - Update commit message to point at the git hash of the regulator change.
> 
> Changes in v2:
> - ("Fix number of regulators for SDM660") new for v2.
> - ("Fix number of regulators for msm8996_dsi_cfg") new for v2.
> - ("Take advantage of devm_regulator_bulk_get_const") new for v2.
> - ("Use the new regulator bulk feature to specify the load") new for v2.
> 
> Douglas Anderson (6):
>    drm/msm/dsi: Fix number of regulators for msm8996_dsi_cfg
>    drm/msm/dsi: Fix number of regulators for SDM660

These two can be picked into the -fixes branch. The reset looks like 
5.21/6.1 material

>    drm/msm/dsi: Don't set a load before disabling a regulator
>    drm/msm/dsi: Use the new regulator bulk feature to specify the load
>    drm/msm/dsi: Take advantage of devm_regulator_bulk_get_const()
>    drm/msm/dsi: Improve dsi_phy_driver_probe() probe error handling
> 
>   drivers/gpu/drm/msm/dsi/dsi.h                 |  13 --
>   drivers/gpu/drm/msm/dsi/dsi_cfg.c             | 172 +++++++++---------
>   drivers/gpu/drm/msm/dsi/dsi_cfg.h             |   3 +-
>   drivers/gpu/drm/msm/dsi/dsi_host.c            |  96 ++--------
>   drivers/gpu/drm/msm/dsi/phy/dsi_phy.c         | 160 ++++------------
>   drivers/gpu/drm/msm/dsi/phy/dsi_phy.h         |   5 +-
>   drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c    |  20 +-
>   drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c    |  32 ++--
>   drivers/gpu/drm/msm/dsi/phy/dsi_phy_20nm.c    |  14 +-
>   drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c    |  28 +--
>   .../gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c   |  12 +-
>   drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c     |  32 ++--
>   12 files changed, 197 insertions(+), 390 deletions(-)
> 


-- 
With best wishes
Dmitry
