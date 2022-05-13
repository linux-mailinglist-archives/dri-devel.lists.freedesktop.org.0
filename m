Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 44616525FB6
	for <lists+dri-devel@lfdr.de>; Fri, 13 May 2022 12:39:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A24C10E068;
	Fri, 13 May 2022 10:39:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7CEA10E068
 for <dri-devel@lists.freedesktop.org>; Fri, 13 May 2022 10:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1652438339; x=1683974339;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=wgMVjWhvJhoWOt/KHhALzY1JWO2Y10o5k6lUReCLpcY=;
 b=Mf+RuqLgbWs/HkVSzdgSvL4Fvjx0otQSfQYf5jqac4J5Vu1M8XQF8rum
 HnnyUhgxc1jDZhjUbUUvX2dyc/C1IdeCh9xSO3YjupY35GFELDqvx+3WJ
 cwdDZ+6Zk8DgYu5TQ/Pe5t8uXMppU2CatDFywJzTRRClosvRJ1l0MvSv4 o=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 13 May 2022 03:38:59 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg02-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2022 03:38:58 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Fri, 13 May 2022 03:38:57 -0700
Received: from [10.214.30.67] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Fri, 13 May
 2022 03:38:54 -0700
Message-ID: <f5988884-ba0a-643c-e920-6ae626bb67a1@quicinc.com>
Date: Fri, 13 May 2022 16:08:51 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH V3] dma-buf: ensure unique directory name for dmabuf stats
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>, Greg KH
 <gregkh@linuxfoundation.org>
References: <1652434689-6203-1-git-send-email-quic_charante@quicinc.com>
 <Yn4u0AG8iC33S3jO@kroah.com>
 <2a45f1e1-39d5-76b3-8fd3-c1f8b288afac@quicinc.com>
 <0071e117-1d91-b086-7cb1-976b2a1c3498@amd.com>
From: Charan Teja Kalla <quic_charante@quicinc.com>
In-Reply-To: <0071e117-1d91-b086-7cb1-976b2a1c3498@amd.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: daniel.vetter@ffwll.ch, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, tjmercier@google.com,
 linaro-mm-sig@lists.linaro.org, hridya@google.com, sumit.semwal@linaro.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 5/13/2022 3:59 PM, Christian König wrote:
> Am 13.05.22 um 12:18 schrieb Charan Teja Kalla:
>> On 5/13/2022 3:41 PM, Greg KH wrote:
>>>> Reported-by: kernel test robot <lkp@intel.com>
>>> The trest robot did not say that the dmabuf stat name was being
>>> duplicated, did it?
>>>
>> It reported a printk warning on V2[1]. Should we remove this on V3?
> 
> We only add the kernel test robot is report when it found the underlying
> problem and not just noted some warning on an intermediate patch version.

Noted. Thanks!!
> 
>> @Christian: Could you please drop this tag while merging?
> 
> Sure, I don't have much on my plate at the moment. But don't let it
> become a habit.
> 

Sure. I am also thinking If it is worth to add stable tag? Though it is
not crashing the kernel but definitely making the dma_buf_export to fail
for no reason.

If yes, I can resend the patch with all these tags.

> Going to push it upstream through drm-misc-fixes now.
