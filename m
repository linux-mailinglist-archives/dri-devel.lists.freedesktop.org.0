Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 23B67551487
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jun 2022 11:39:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 012B3112605;
	Mon, 20 Jun 2022 09:39:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com
 [185.176.79.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E8B411293D;
 Mon, 20 Jun 2022 09:39:19 +0000 (UTC)
Received: from fraeml745-chm.china.huawei.com (unknown [172.18.147.200])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4LRPjX5d6Pz689Q8;
 Mon, 20 Jun 2022 17:38:56 +0800 (CST)
Received: from lhreml724-chm.china.huawei.com (10.201.108.75) by
 fraeml745-chm.china.huawei.com (10.206.15.226) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Mon, 20 Jun 2022 11:39:16 +0200
Received: from [10.195.35.72] (10.195.35.72) by lhreml724-chm.china.huawei.com
 (10.201.108.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Mon, 20 Jun
 2022 10:39:15 +0100
Message-ID: <4089714d-f040-2c5d-b047-8cccf0df89f0@huawei.com>
Date: Mon, 20 Jun 2022 10:39:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: radeon driver warning
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 <alexander.deucher@amd.com>, <Xinhui.Pan@amd.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <2850bbb9-a191-d723-f878-96482e7583cb@huawei.com>
 <afd3cf7b-7afd-1d86-0c24-b4b7101e4bd5@amd.com>
 <60a97869-fe1d-08cb-3241-91377d62b739@huawei.com>
 <7adf78ae-8f2d-e6bf-2054-fe61dfd4b21e@amd.com>
 <b481ffa8-451d-0a9c-e708-44047e0a8bc9@huawei.com>
 <7986913b-66a7-85b6-c563-392049e057fd@amd.com>
 <a7384d7d-fb33-6753-550e-d5b773d1aefe@huawei.com>
 <ef1d00d4-c3de-398a-9eac-7cb7a19cc360@gmail.com>
From: John Garry <john.garry@huawei.com>
In-Reply-To: <ef1d00d4-c3de-398a-9eac-7cb7a19cc360@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.195.35.72]
X-ClientProxiedBy: lhreml744-chm.china.huawei.com (10.201.108.194) To
 lhreml724-chm.china.huawei.com (10.201.108.75)
X-CFilter-Loop: Reflected
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 20/06/2022 10:01, Christian König wrote:
>>> So the question is why does your random config not set 
>>> CONFIG_COMPILE_TEST?
>>
>> My randconfig does not have CONFIG_COMPILE_TEST set - see attached. 
>> AFAIK randconfig does not always set CONFIG_COMPILE_TEST.
> 
> Mhm, we could probably change the ifdef. But a random configuration 
> which doesn't sets CONFIG_COMPILE_TEST sounds like a bug to me as well.

Hmmm ... not sure. I just think that the whole point is that it is 
purely random - if we want better coverage for building then 
allmodconfig is there.

> 
> Going to provide a patch for changing the ifdef, but not sure when I 
> will have time for th

ok, thanks. In the meantime I'll add a local patch to remove the warning.

Thanks,
John
