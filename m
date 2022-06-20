Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 87A4355251E
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jun 2022 22:08:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBE4F10ED7C;
	Mon, 20 Jun 2022 20:07:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 632EE10ED7C;
 Mon, 20 Jun 2022 20:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1655755678; x=1687291678;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=WoaLmubst55f6uHn7psiseCm0+Nuf62c9FVGfHGmGRY=;
 b=N1ctxxUNdroyAYXoOngxXbGVCSPT6y2jJoit36men+sJjg+oY31yVZJL
 0OClADgpOcnlZy20XBcRvbYXjdZ9AY12xghs9E22aXLE6zb9JCRxIvJHT
 G7ZMyYBqLi6HP9jlSFuJ+OY1v4XHFmdwbt6qJr+GqX9BNedJrXb2xgGo6 I=;
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
 by alexa-out.qualcomm.com with ESMTP; 20 Jun 2022 13:07:58 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg08-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2022 13:07:57 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 20 Jun 2022 13:07:57 -0700
Received: from [10.110.14.194] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Mon, 20 Jun
 2022 13:07:55 -0700
Message-ID: <6f1ade9f-38b0-827c-667b-5c8018b7779a@quicinc.com>
Date: Mon, 20 Jun 2022 13:07:55 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v13 0/3] eDP/DP Phy vdda realted function
Content-Language: en-US
To: Vinod Koul <vkoul@kernel.org>
References: <1653512540-21956-1-git-send-email-quic_khsieh@quicinc.com>
 <YqvEjzgSbvrOCFtq@matsya>
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
In-Reply-To: <YqvEjzgSbvrOCFtq@matsya>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
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
Cc: quic_sbillaka@quicinc.com, quic_abhinavk@quicinc.com, airlied@linux.ie,
 freedreno@lists.freedesktop.org, dianders@chromium.org,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, agross@kernel.org,
 linux-arm-msm@vger.kernel.org, dmitry.baryshkov@linaro.org,
 quic_aravindh@quicinc.com, bjorn.andersson@linaro.org, sean@poorly.run,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 6/16/2022 5:02 PM, Vinod Koul wrote:
> On 25-05-22, 14:02, Kuogee Hsieh wrote:
>> 1) add regulator_set_load() to eDP phy
>> 2) add regulator_set_load() to DP phy
>> 3) remove vdda related function out of eDP/DP controller
>>
>> Kuogee Hsieh (3):
>>    phy: qcom-edp: add regulator_set_load to edp phy
>>    phy: qcom-qmp: add regulator_set_load to dp phy
>>    drm/msm/dp: delete vdda regulator related functions from eDP/DP
>>      controller
>>
>>   drivers/gpu/drm/msm/dp/dp_parser.c  | 14 ------
>>   drivers/gpu/drm/msm/dp/dp_parser.h  |  8 ----
>>   drivers/gpu/drm/msm/dp/dp_power.c   | 95 +------------------------------------
>>   drivers/phy/qualcomm/phy-qcom-edp.c | 12 +++++
>>   drivers/phy/qualcomm/phy-qcom-qmp.c | 40 ++++++++++++----
> Please rebase this to phy-next and apply to specific qmp phy driver...
I will rebase to ==> 
https://git.kernel.org/pub/scm/linux/kernel/git/phy/linux-phy.git
