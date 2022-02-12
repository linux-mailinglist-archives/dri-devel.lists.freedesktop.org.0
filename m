Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCD834B33AC
	for <lists+dri-devel@lfdr.de>; Sat, 12 Feb 2022 08:52:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D3F610ECFA;
	Sat, 12 Feb 2022 07:52:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97C6C10ECF8;
 Sat, 12 Feb 2022 07:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1644652368; x=1676188368;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=yxbfpTwDj2fKjhn3UC9YcnQJ7zw3V2Fz0h2ixyRxOPI=;
 b=saELgblZ4XZLProefbBffMUAh7OdmAnioSu1QFdWveKiXJ6iRO59+2m5
 QkW5UnoT3uI2cR3pR0gtISjDL1QTUFfOp01Br6JqTKfHQPEHfOABUz845
 LM8xc4qRNSwb9EdkQEqza3TR4/bowoRcY8CG0Mawm621LWBffK/FWicKK w=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 11 Feb 2022 23:52:48 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg02-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2022 23:52:47 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Fri, 11 Feb 2022 23:52:47 -0800
Received: from [10.38.246.233] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.19; Fri, 11 Feb
 2022 23:52:44 -0800
Message-ID: <b9156bde-137c-2fac-19e0-b205ab4d6016@quicinc.com>
Date: Fri, 11 Feb 2022 23:52:41 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH] devcoredump: increase the device delete timeout to 10 mins
Content-Language: en-US
To: Greg KH <gregkh@linuxfoundation.org>
References: <1644349472-31077-1-git-send-email-quic_abhinavk@quicinc.com>
 <YgZD8vPqB7ISpRpZ@kroah.com>
 <654d620b-9e14-c47f-b48c-762dc0bd32a1@quicinc.com>
 <Ygdb63FrorUsX/Hg@kroah.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <Ygdb63FrorUsX/Hg@kroah.com>
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
Cc: rafael@kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, khsieh@codeaurora.org, nganji@codeaurora.org,
 seanpaul@chromium.org, dmitry.baryshkov@linaro.org, johannes@sipsolutions.net,
 aravindh@codeaurora.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Greg

On 2/11/2022 11:04 PM, Greg KH wrote:
> On Fri, Feb 11, 2022 at 10:59:39AM -0800, Abhinav Kumar wrote:
>> Hi Greg
>>
>> Thanks for the response.
>>
>> On 2/11/2022 3:09 AM, Greg KH wrote:
>>> On Tue, Feb 08, 2022 at 11:44:32AM -0800, Abhinav Kumar wrote:
>>>> There are cases where depending on the size of the devcoredump and the speed
>>>> at which the usermode reads the dump, it can take longer than the current 5 mins
>>>> timeout.
>>>>
>>>> This can lead to incomplete dumps as the device is deleted once the timeout expires.
>>>>
>>>> One example is below where it took 6 mins for the devcoredump to be completely read.
>>>>
>>>> 04:22:24.668 23916 23994 I HWDeviceDRM::DumpDebugData: Opening /sys/class/devcoredump/devcd6/data
>>>> 04:28:35.377 23916 23994 W HWDeviceDRM::DumpDebugData: Freeing devcoredump node
>>>
>>> What makes this so slow?  Reading from the kernel shouldn't be the
>>> limit, is it where the data is being sent to?
>>
>> We are still checking this. We are seeing better read times when we bump up
>> the thread priority of the thread which was reading this.
> 
> Where is the thread sending the data to?

The thread is writing the data to a file in local storage. From our 
profiling, the read is the one taking the time not the write.

> 
>> We are also trying to check if bumping up CPU speed is helping.
>> But, results have not been consistently good enough. So we thought we should
>> also increase the timeout to be safe.
> 
> Why would 10 minutes be better than 30?  What should the limit be?  :)

Again, this is from our profiling. We are seeing a worst case time of 7 
mins to finish the read for our data. Thats where the 10mins came from. 
Just doubling what we have currently. I am not sure how the current 5 
mins timeout came from.

> 
> thanks,
> 
> greg k-h
