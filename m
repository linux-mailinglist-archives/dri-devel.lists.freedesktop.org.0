Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78A9F54F844
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jun 2022 15:18:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF2B511AFC9;
	Fri, 17 Jun 2022 13:18:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com
 [185.176.79.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3CFC11AE0D;
 Fri, 17 Jun 2022 12:01:14 +0000 (UTC)
Received: from fraeml740-chm.china.huawei.com (unknown [172.18.147.207])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4LPcwl3nVkz686k2;
 Fri, 17 Jun 2022 19:57:27 +0800 (CST)
Received: from lhreml724-chm.china.huawei.com (10.201.108.75) by
 fraeml740-chm.china.huawei.com (10.206.15.221) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 17 Jun 2022 14:01:12 +0200
Received: from [10.126.175.22] (10.126.175.22) by
 lhreml724-chm.china.huawei.com (10.201.108.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 17 Jun 2022 13:01:12 +0100
Message-ID: <b481ffa8-451d-0a9c-e708-44047e0a8bc9@huawei.com>
Date: Fri, 17 Jun 2022 13:01:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: radeon driver warning
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 <alexander.deucher@amd.com>, <Xinhui.Pan@amd.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <2850bbb9-a191-d723-f878-96482e7583cb@huawei.com>
 <afd3cf7b-7afd-1d86-0c24-b4b7101e4bd5@amd.com>
 <60a97869-fe1d-08cb-3241-91377d62b739@huawei.com>
 <7adf78ae-8f2d-e6bf-2054-fe61dfd4b21e@amd.com>
From: John Garry <john.garry@huawei.com>
In-Reply-To: <7adf78ae-8f2d-e6bf-2054-fe61dfd4b21e@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.126.175.22]
X-ClientProxiedBy: lhreml732-chm.china.huawei.com (10.201.108.83) To
 lhreml724-chm.china.huawei.com (10.201.108.75)
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Fri, 17 Jun 2022 13:17:59 +0000
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

On 17/06/2022 12:57, Christian König wrote:

Hi Christian,

>>
>> Sure, but I don't think that it should break the build.
> 
> well, this doesn't break the build we already have that for years.
> 
> What breaks the build now is that warnings are handled as errors.

ok

> 
>>
>> Can you add a boot-time warning message instead?
> 
> Yes, we already have that as well.
> 
>>
>> And/Or compile out the warning when "warnings = errors"?
> 
> That should be doable I think.

ok, if something can be done then I would appreciate it. I do much 
randconfig builds as part of my upstream process and anything breaking 
is a bit of a pain.

Thanks!
