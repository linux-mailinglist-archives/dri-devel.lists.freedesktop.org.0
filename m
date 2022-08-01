Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 99ABC5871FE
	for <lists+dri-devel@lfdr.de>; Mon,  1 Aug 2022 22:09:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C55992BB55;
	Mon,  1 Aug 2022 20:08:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FB5718A92C;
 Mon,  1 Aug 2022 20:08:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1659384504; x=1690920504;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Z2sKdEmuR5GzYMOhpZvEQcMlZYe/O/eQFVyPPPVjpGM=;
 b=zBwNSxd52hJpSeNoOxGh7lP1qn3YwJ5vJC4yBaeWO3/d0H/7eIcNi6h9
 9Y2Nv/4rDHJZ3Zm2ch9lUU/4Siv/pmx6NtyhgYy3A//Zx41xHhxW2OmaX
 aa6hEAJgE9itePzEdJivB0wLdd+0e8hSfRgctn0fdD9eWZn/T2DyG/xdA 8=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 01 Aug 2022 13:08:23 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg05-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2022 13:08:22 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 1 Aug 2022 13:08:22 -0700
Received: from [10.110.16.215] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Mon, 1 Aug 2022
 13:08:20 -0700
Message-ID: <89f3dfa2-0983-5e33-281f-94539492d1d2@quicinc.com>
Date: Mon, 1 Aug 2022 13:08:13 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] drm/msm/dp: delete DP_RECOVERED_CLOCK_OUT_EN to fix tps4
Content-Language: en-US
To: Stephen Boyd <swboyd@chromium.org>, <agross@kernel.org>,
 <airlied@linux.ie>, <bjorn.andersson@linaro.org>, <daniel@ffwll.ch>,
 <dianders@chromium.org>, <dmitry.baryshkov@linaro.org>,
 <robdclark@gmail.com>, <sean@poorly.run>, <vkoul@kernel.org>
References: <1659382970-17477-1-git-send-email-quic_khsieh@quicinc.com>
 <CAE-0n52=zJ0ScrknAhsvJQc5hXP7+TGaoa4gnaVzsT26bQL_Uw@mail.gmail.com>
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
In-Reply-To: <CAE-0n52=zJ0ScrknAhsvJQc5hXP7+TGaoa4gnaVzsT26bQL_Uw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 quic_aravindh@quicinc.com, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 8/1/2022 12:51 PM, Stephen Boyd wrote:
> Quoting Kuogee Hsieh (2022-08-01 12:42:50)
>> Data Symbols scrambled is required for tps4 at link training 2.
>> Therefore SCRAMBLING_DISABLE bit should not be set for tps4 to
>> work.
>> RECOVERED_CLOCK_OUT_EN is for enable simple EYE test for jitter
>> measurement with minimal equipment for embedded applications purpose
>> and is not required to be set during normal operation.
>> Current implementation always have RECOVERED_CLOCK_OUT_EN bit set
>> which cause SCRAMBLING_DISABLE bit wrongly set at tps4 which prevent
>> tps4 from working.
>> This patch delete setting RECOVERED_CLOCK_OUT_EN to fix SCRAMBLING_DISABLE
>> be wrongly set at tps4.
>>
>> Fixes: 956653250b21 ("drm/msm/dp: add support of tps4 (training pattern 4) for HBR3")
>>
>> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/dp/dp_ctrl.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> index ab6aa13..013ca02 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> @@ -1214,7 +1214,7 @@ static int dp_ctrl_link_train_2(struct dp_ctrl_private *ctrl,
>>          if (ret)
>>                  return ret;
>>
>> -       dp_ctrl_train_pattern_set(ctrl, pattern | DP_RECOVERED_CLOCK_OUT_EN);
>> +       dp_ctrl_train_pattern_set(ctrl, pattern);
> This line is from the first patch introducing this driver. Even if this
> is fixing tps4 support, it sounds like the bit should never have been
> enabled in the first place. Why isn't the fixes tag targeted at the
> first commit? Does it hurt to apply it without commit 956653250b21?
agree, it should be fixed to first patch
