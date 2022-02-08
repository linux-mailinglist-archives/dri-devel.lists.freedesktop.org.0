Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 962304AE319
	for <lists+dri-devel@lfdr.de>; Tue,  8 Feb 2022 22:40:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C62A310E412;
	Tue,  8 Feb 2022 21:40:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D78910E412;
 Tue,  8 Feb 2022 21:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1644356432; x=1675892432;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=81EhCrIS85r447vT38r3+hOQsy/Ae4x5VMVVwLgPxDU=;
 b=eIJaJveWresab3hxkX0aQizJkKFtJuI1u2fgkj9titdZ608Yfz0Nj+wW
 hbgVT6YgM06GATpG13UOoj8nqbFz3507qZpasEAFq4fKHWAQXZtYpICn2
 R1Wb3Ak5+RzzydO4vfJ40z9Oy0t7H/Um7qI4LbiIkhfNQFpvXp12eHKnM w=;
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
 by alexa-out.qualcomm.com with ESMTP; 08 Feb 2022 13:40:32 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg09-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2022 13:40:31 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Tue, 8 Feb 2022 13:40:31 -0800
Received: from [10.111.162.111] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.19; Tue, 8 Feb 2022
 13:40:28 -0800
Message-ID: <a280fec2-754a-88ec-acc7-337e069e9148@quicinc.com>
Date: Tue, 8 Feb 2022 13:40:26 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH] devcoredump: increase the device delete timeout to 10 mins
Content-Language: en-US
To: Johannes Berg <johannes@sipsolutions.net>, <linux-kernel@vger.kernel.org>
References: <1644349472-31077-1-git-send-email-quic_abhinavk@quicinc.com>
 <8d67484c7e4b9fb4560d2eca1f71c75fde8bae0d.camel@sipsolutions.net>
 <ebd340e4-2a02-d484-2ed0-9ee738d5b5c5@quicinc.com>
 <c59bc1af9974484075091333a3c98a2088251321.camel@sipsolutions.net>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <c59bc1af9974484075091333a3c98a2088251321.camel@sipsolutions.net>
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
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, khsieh@codeaurora.org,
 nganji@codeaurora.org, seanpaul@chromium.org, gregkh@linuxfoundation.org,
 dmitry.baryshkov@linaro.org, aravindh@codeaurora.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Johannes

On 2/8/2022 1:12 PM, Johannes Berg wrote:
> On Tue, 2022-02-08 at 13:04 -0800, Abhinav Kumar wrote:
>>
>> It opened the file rightaway but could not finish reading.
>>
>> The device gets deleted so the corresponding /data will disappear too (
>> as the data node is under devcd*/data)
> 
> Yeah but even if the file disappears, the open file descriptor is still
> there, no? Does sysfs somehow make those disappear? I know debugfs does
> (now, to some extent, it didn't always), but I thought sysfs was
> refcounting things and didn't do that?
> 
> What did the userspace actually see? read() returned 0 so EOF?
> 
> (I guess I could test it, but it's getting late)
> 
> Your other questions are related - you need to consider the file in
> sysfs and the open file descriptor separately.
> 
> johannes
> 
I am checking what usermode sees and will get back ( I didnt see an 
error do most likely it was EOF ). I didnt follow the second part.

If the file descriptor read returns EOF, even if we consider them 
separate how will it resolve this issue?

My earlier questions were related to fixing it in devcoredump to detect
and fix it there. Are you suggesting to fix in usermode instead? How?

Thanks

Abhinav
