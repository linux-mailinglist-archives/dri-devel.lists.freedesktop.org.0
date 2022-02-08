Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EBA34AE2CD
	for <lists+dri-devel@lfdr.de>; Tue,  8 Feb 2022 22:05:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8DF410E3CB;
	Tue,  8 Feb 2022 21:05:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0985B10E27D;
 Tue,  8 Feb 2022 21:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1644354312; x=1675890312;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=o7oYewk50pS0qCdX2y8F9493WNWazaE0j+QKGL2KdZo=;
 b=N0dJ4ymf7X5pCOmEM15GPJYWSDBAabXvgFl8m6/9LCBE4lTD2dvYnju6
 QtmH54JTuvHL3MM5HOFDxXdHe8B3+83gXM87+bG0ZFumKbCJ8JxlRNDsk
 Hnso6gav4nVFarN13peDkQYVUAwG/p9ghrSmpwsmoQ/XpYNqZ2+ILS8go I=;
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
 by alexa-out.qualcomm.com with ESMTP; 08 Feb 2022 13:05:11 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2022 13:05:10 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Tue, 8 Feb 2022 13:04:48 -0800
Received: from [10.111.162.111] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.19; Tue, 8 Feb 2022
 13:04:45 -0800
Message-ID: <ebd340e4-2a02-d484-2ed0-9ee738d5b5c5@quicinc.com>
Date: Tue, 8 Feb 2022 13:04:43 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH] devcoredump: increase the device delete timeout to 10 mins
Content-Language: en-US
To: Johannes Berg <johannes@sipsolutions.net>, <linux-kernel@vger.kernel.org>
References: <1644349472-31077-1-git-send-email-quic_abhinavk@quicinc.com>
 <8d67484c7e4b9fb4560d2eca1f71c75fde8bae0d.camel@sipsolutions.net>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <8d67484c7e4b9fb4560d2eca1f71c75fde8bae0d.camel@sipsolutions.net>
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
Cc: rafael@kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, khsieh@codeaurora.org,
 nganji@codeaurora.org, seanpaul@chromium.org, gregkh@linuxfoundation.org,
 dmitry.baryshkov@linaro.org, aravindh@codeaurora.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Johannes

Thanks for the response.

On 2/8/2022 12:35 PM, Johannes Berg wrote:
> On Tue, 2022-02-08 at 11:44 -0800, Abhinav Kumar wrote:
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
>>
>> Increase the timeout to 10 mins to accommodate system delays and large coredump
>> sizes.
>>
> 
> No real objection, I guess, but can the data actually disappear *while*
> the sysfs file is open?!
> 
> Or did it take 5 minutes to open the file?
> 
> If the former, maybe we should fix that too (or instead)?
> 
> johannes

It opened the file rightaway but could not finish reading.

The device gets deleted so the corresponding /data will disappear too ( 
as the data node is under devcd*/data)

60 static void devcd_del(struct work_struct *wk)
61 {
62 	struct devcd_entry *devcd;
63
64 	devcd = container_of(wk, struct devcd_entry, del_wk.work);
65
66 	device_del(&devcd->devcd_dev);
67 	put_device(&devcd->devcd_dev);
68 }

Are you suggesting we implement a logic like :

a) if the usermode has started reading the data but has not finished yet 
( we can detect the former with something like devcd->data_read_ongoing 
= 1 and we know it has finished when it acks and we can clear this flag 
then), in the timeout del_wk then we can delay the the delete timer by 
another TIMEOUT amount of time to give usermode time to finish the data?

b) If usermode acks, we will clear both the flag and delete the device 
as usual

But there is a corner case here:

c) If usermode starts the read, but then for some reason crashes, the 
timer will timeout and try to delete the device but will detect that 
usermode is still reading and will keep the device. How do we detect 
this case?

Thats why i thought maybe the easier way right now is to try increasing 
the timeout.
