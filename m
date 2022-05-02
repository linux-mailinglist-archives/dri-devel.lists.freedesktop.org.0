Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 559585178B1
	for <lists+dri-devel@lfdr.de>; Mon,  2 May 2022 22:59:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C50410F45D;
	Mon,  2 May 2022 20:59:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4511610F458;
 Mon,  2 May 2022 20:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1651525177; x=1683061177;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=HEKYkHkyPs9/E1vYJnvUY+TkTJlrFJSQVXyry3UZj/Q=;
 b=ET07GPbbfy+XTe3T8KqpHMgHcw4esCmMjMCQL5XDo/bLlvZlUHWbKA/Y
 k1qUqx+kxwQna3QksCQ7DRzb8QEAGa97QSMSfpwjjzxedEpaiMdPpwgSI
 YyLTEfcXb/V+2fU3KL0g+x6hIvI902F+z6pG4fo7GLC3yc+vqU4DRrmHi I=;
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
 by alexa-out.qualcomm.com with ESMTP; 02 May 2022 13:59:37 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg09-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2022 13:59:36 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 2 May 2022 13:59:36 -0700
Received: from [10.38.244.235] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Mon, 2 May 2022
 13:59:33 -0700
Message-ID: <16f739a9-275e-1fbb-a235-c95b5b064c67@quicinc.com>
Date: Mon, 2 May 2022 13:59:31 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH] drm/msm/dpu: add missing break statement for
 update_pending_flush_wb()
Content-Language: en-US
To: Stephen Boyd <swboyd@chromium.org>, <freedreno@lists.freedesktop.org>
References: <1651469981-21469-1-git-send-email-quic_abhinavk@quicinc.com>
 <CAE-0n526pBHnVZYYksDiRtYr7E=BtMB1VectX-ew8msLNWXh1w@mail.gmail.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAE-0n526pBHnVZYYksDiRtYr7E=BtMB1VectX-ew8msLNWXh1w@mail.gmail.com>
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
Cc: dri-devel@lists.freedesktop.org, seanpaul@chromium.org,
 dmitry.baryshkov@linaro.org, quic_jesszhan@quicinc.com,
 quic_aravindh@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 5/2/2022 1:45 PM, Stephen Boyd wrote:
> Quoting Abhinav Kumar (2022-05-01 22:39:41)
>> Add missing break statement for dpu_hw_ctl_update_pending_flush_wb().
>> Otherwise this leads to below build warning.
>>
>> drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c:273:2:
>> warning: unannotated fall-through between switch labels
>>             default:
>>             ^
>> drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c:273:2:
>> note: insert 'break;' to avoid fall-through
>>             default:
>>             ^
>>             break;
>> 1 warning generated.
>>
>> Fixes: 2e0086d8c61d ("drm/msm/dpu: add changes to support writeback in hw_ctl")
> 
> What commit is this?
This seems incorrect. Looks like i put this from my local tree.

Should be

Fixes: 86e601c2317f ("drm/msm/dpu: add changes to support writeback in 
hw_ctl")

> 
>> Reported-by: kernel test robot <lkp@intel.com>
>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> ---
> 
> Patch contents look sane
> 
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
