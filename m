Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E31EE4B33D9
	for <lists+dri-devel@lfdr.de>; Sat, 12 Feb 2022 09:35:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E43D610E76A;
	Sat, 12 Feb 2022 08:35:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E297010E3AF;
 Sat, 12 Feb 2022 08:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1644654915; x=1676190915;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=MeLi2dYMbbNIf6RjIa19QVwgVecV8z/lw2J8bW0VgqA=;
 b=LxEGvLV4OBRPKoSXVubmg5DLunfB1XQzXJpq0Mfre+Mmzo35gWt8QXKs
 qklwdd58mal9El9N6DsEMZpmW7NSPtnmdctVqLzBRqrARQjs3tKqLdOzd
 y1sXIqtZE2Rk5RmZzvQmQudUrldHR8FbNpoEKy0LvF59w7takWUvvUN9o s=;
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
 by alexa-out.qualcomm.com with ESMTP; 12 Feb 2022 00:35:14 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg09-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2022 00:35:13 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Sat, 12 Feb 2022 00:35:13 -0800
Received: from [10.38.246.233] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.19; Sat, 12 Feb
 2022 00:35:10 -0800
Message-ID: <2add9ba7-7bc8-bd1d-1963-61e8154b0e3c@quicinc.com>
Date: Sat, 12 Feb 2022 00:35:08 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH] devcoredump: increase the device delete timeout to 10 mins
Content-Language: en-US
To: Johannes Berg <johannes@sipsolutions.net>, Greg KH
 <gregkh@linuxfoundation.org>
References: <1644349472-31077-1-git-send-email-quic_abhinavk@quicinc.com>
 <YgZD8vPqB7ISpRpZ@kroah.com>
 <654d620b-9e14-c47f-b48c-762dc0bd32a1@quicinc.com>
 <Ygdb63FrorUsX/Hg@kroah.com>
 <b9156bde-137c-2fac-19e0-b205ab4d6016@quicinc.com>
 <7db7d01fcf5a3edce61161769c0e6eb1541237bf.camel@sipsolutions.net>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <7db7d01fcf5a3edce61161769c0e6eb1541237bf.camel@sipsolutions.net>
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
 seanpaul@chromium.org, dmitry.baryshkov@linaro.org, aravindh@codeaurora.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Johannes

On 2/12/2022 12:24 AM, Johannes Berg wrote:
> On Fri, 2022-02-11 at 23:52 -0800, Abhinav Kumar wrote:
>>
>> The thread is writing the data to a file in local storage. From our
>> profiling, the read is the one taking the time not the write.
>>
> 
> That seems kind of hard to believe, let's say it's a 4/3 split (4
> minutes reading, 3 minutes writing, to make read > write as you say),
> and 3MiB size, that'd mean you get 12.8KiB/sec? That seems implausibly
> low, unless you're reading with really tiny buffers?
> 
> Can you strace this somehow? (with timestamp info)
> 

Yes, like I have already mentioned in earlier comments, we continue to 
check whats taking that long.

Once we find something from our analysis and also have the trace, will 
update the thread.

>> Just doubling what we have currently. I am not sure how the current 5
>> mins timeout came from.
>>
> 
> To be honest it came out of thin air, and wasn't really meant as a limit
> on how fast you can read (feels like even if it's tens of MiB you should
> read it in milliseconds into userspace), but more of a maximum time that
> we're willing to waste kernel memory if nobody is around to read the
> data.
> 
> I thought it'd be better if we could somehow pin it while the userspace
> is reading it, but OTOH maybe that's actually bad, since that means
> userspace (though suitably privileged) could pin this kernel memory
> indefinitely.
> 
> johannes
