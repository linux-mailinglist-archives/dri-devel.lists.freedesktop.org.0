Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 164FA4B2D3A
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 19:59:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F6D510EAF7;
	Fri, 11 Feb 2022 18:59:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AC7110EAF7;
 Fri, 11 Feb 2022 18:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1644605987; x=1676141987;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=10MNTyWKrFElxhMmkbbRa8eHQjuoljFrhQU1QJPnd58=;
 b=pBoZcBIYrPz0oDlspynry8juVYDswgbzQaMO+aUwhXHJ3AYE2kM3IYEq
 2t0PFm9cZX633vTWARvVNBGs5YEPZyQd943sPTQwsobY0wLVL0l/q6kbf
 hxKH7XQgPq3xNxO73VlH6l8BISP4L7gyCQKBxwrCxGWJiNLGJC4Q8GE2T 4=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 11 Feb 2022 10:59:46 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg02-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2022 10:59:44 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Fri, 11 Feb 2022 10:59:44 -0800
Received: from [10.38.246.233] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.19; Fri, 11 Feb
 2022 10:59:41 -0800
Message-ID: <654d620b-9e14-c47f-b48c-762dc0bd32a1@quicinc.com>
Date: Fri, 11 Feb 2022 10:59:39 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH] devcoredump: increase the device delete timeout to 10 mins
Content-Language: en-US
To: Greg KH <gregkh@linuxfoundation.org>
References: <1644349472-31077-1-git-send-email-quic_abhinavk@quicinc.com>
 <YgZD8vPqB7ISpRpZ@kroah.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <YgZD8vPqB7ISpRpZ@kroah.com>
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

Thanks for the response.

On 2/11/2022 3:09 AM, Greg KH wrote:
> On Tue, Feb 08, 2022 at 11:44:32AM -0800, Abhinav Kumar wrote:
>> There are cases where depending on the size of the devcoredump and the speed
>> at which the usermode reads the dump, it can take longer than the current 5 mins
>> timeout.
>>
>> This can lead to incomplete dumps as the device is deleted once the timeout expires.
>>
>> One example is below where it took 6 mins for the devcoredump to be completely read.
>>
>> 04:22:24.668 23916 23994 I HWDeviceDRM::DumpDebugData: Opening /sys/class/devcoredump/devcd6/data
>> 04:28:35.377 23916 23994 W HWDeviceDRM::DumpDebugData: Freeing devcoredump node
> 
> What makes this so slow?  Reading from the kernel shouldn't be the
> limit, is it where the data is being sent to?

We are still checking this. We are seeing better read times when we bump 
up the thread priority of the thread which was reading this.
We are also trying to check if bumping up CPU speed is helping.
But, results have not been consistently good enough. So we thought we 
should also increase the timeout to be safe.


> 
>> Increase the timeout to 10 mins to accommodate system delays and large coredump
>> sizes.
> 
> Nit, please wrap your changelog texts at 72 columns.
> 
Yes, i will fix this when I re-post.

> And what is "large"?

We are seeing devcoredumps in the range of 2.5MB-3MB. I can also mention 
this in the commit text in the next post.

Thanks

Abhinav

> 
> thanks,
> 
> greg k-h
