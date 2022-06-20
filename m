Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A6295525BA
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jun 2022 22:22:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7889110F2BD;
	Mon, 20 Jun 2022 20:22:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9ED6B10F2BD;
 Mon, 20 Jun 2022 20:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1655756532; x=1687292532;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=KOQhFnOIgJldpOIeOqC9Iv379xLX07+VONbkw/hdtYM=;
 b=WcZZyLm7z1d4aZvwr09nqFqVNvnDpWV9iCf4gz/R6ztxRmtTP62vNlSS
 akNOysZQCrAKlP1wxL5MmxjDjbvlZqMBinMgtUsmHJrniGD1f+wdA4Y8/
 ltMKjIYxzc25Q8Agmn8uPxMoAiJ66R3FjCHHZpK52PakxL2h27JZtcVjN Q=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 20 Jun 2022 13:22:12 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2022 13:22:11 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 20 Jun 2022 13:22:11 -0700
Received: from [10.110.14.194] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Mon, 20 Jun
 2022 13:22:10 -0700
Message-ID: <3af48ac4-c9c2-5636-c18e-6e8c2ec2472d@quicinc.com>
Date: Mon, 20 Jun 2022 13:22:09 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v14 2/3] phy: qcom-qmp: add regulator_set_load to dp phy
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>, <sean@poorly.run>,
 <swboyd@chromium.org>, <dianders@chromium.org>, <vkoul@kernel.org>,
 <daniel@ffwll.ch>, <airlied@linux.ie>, <agross@kernel.org>,
 <bjorn.andersson@linaro.org>
References: <1655755943-28594-1-git-send-email-quic_khsieh@quicinc.com>
 <1655755943-28594-3-git-send-email-quic_khsieh@quicinc.com>
 <3d8f5a58-0efb-af27-eb19-ee2236a942ea@linaro.org>
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
In-Reply-To: <3d8f5a58-0efb-af27-eb19-ee2236a942ea@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, linux-kernel@vger.kernel.org,
 quic_aravindh@quicinc.com, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 6/20/2022 1:15 PM, Dmitry Baryshkov wrote:
> On 20/06/2022 23:12, Kuogee Hsieh wrote:
>> This patch add regulator_set_load() before enable regulator at
>> DP phy driver.
>>
>> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
>> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
>> Reviewed-by: Douglas Anderson <dianders@chromium.org>
>> ---
>>   drivers/phy/qualcomm/phy-qcom-qmp.c | 40 
>> ++++++++++++++++++++++++++++---------
>
> This was not rebased. There is no phy-qcom-qmp.c in phy-next.

is https://git.kernel.org/pub/scm/linux/kernel/git/phy/linux-phy.git 
phy-next tree?

What exactly procedures I have to do base on Vinod's comment?

Thanks,


