Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1C1C39D856
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jun 2021 11:10:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15E696E883;
	Mon,  7 Jun 2021 09:10:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31DD96E883
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Jun 2021 09:10:54 +0000 (UTC)
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Fz6sz6b4zzWt1P;
 Mon,  7 Jun 2021 17:05:59 +0800 (CST)
Received: from dggema762-chm.china.huawei.com (10.1.198.204) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Mon, 7 Jun 2021 17:10:49 +0800
Received: from [10.174.179.129] (10.174.179.129) by
 dggema762-chm.china.huawei.com (10.1.198.204) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Mon, 7 Jun 2021 17:10:48 +0800
Subject: Re: [PATCH 0/2] cleanup patches for PM reference leak
From: "yukuai (C)" <yukuai3@huawei.com>
To: <emma@anholt.net>, <airlied@linux.ie>, <daniel@ffwll.ch>
References: <20210517081438.1562410-1-yukuai3@huawei.com>
 <173999eb-7e2d-107d-8602-a1a88e9f2d5a@huawei.com>
Message-ID: <6cf25a42-5afd-8072-b3c4-a1d146737cdd@huawei.com>
Date: Mon, 7 Jun 2021 17:10:48 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <173999eb-7e2d-107d-8602-a1a88e9f2d5a@huawei.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.179.129]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggema762-chm.china.huawei.com (10.1.198.204)
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 yi.zhang@huawei.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ping ...

On 2021/05/29 17:11, yukuai (C) wrote:
> ping ...
> 
> On 2021/05/17 16:14, Yu Kuai wrote:
>> Yu Kuai (2):
>>    drm/v3d: Fix PM reference leak in v3d_get_param_ioctl()
>>    drm/v3d: Fix PM reference leak in v3d_v3d_debugfs_ident()
>>
>>   drivers/gpu/drm/v3d/v3d_debugfs.c | 4 ++--
>>   drivers/gpu/drm/v3d/v3d_drv.c     | 2 +-
>>   2 files changed, 3 insertions(+), 3 deletions(-)
>>
