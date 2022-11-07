Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 787CF61E85F
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 02:41:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C88F10E1CE;
	Mon,  7 Nov 2022 01:41:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D82FF10E1CD;
 Mon,  7 Nov 2022 01:41:41 +0000 (UTC)
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.54])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4N5DQ04DnBzpVgD;
 Mon,  7 Nov 2022 09:38:00 +0800 (CST)
Received: from dggpemm500002.china.huawei.com (7.185.36.229) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 7 Nov 2022 09:41:38 +0800
Received: from [10.174.178.247] (10.174.178.247) by
 dggpemm500002.china.huawei.com (7.185.36.229) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 7 Nov 2022 09:41:38 +0800
Subject: Re: [PATCH 1/2] drm/radeon: Using unsigned long instead of unsigned
 to fix possible overflow
To: Alex Deucher <alexdeucher@gmail.com>
References: <1667555402-52866-1-git-send-email-guohanjun@huawei.com>
 <CADnq5_OTt+FzNTiDWYS3_R2kwvXL_AUYY-86oS5_WGTtnjPEBQ@mail.gmail.com>
From: Hanjun Guo <guohanjun@huawei.com>
Message-ID: <e6876417-c8bd-6fe2-a37c-4fa13d3eb9f8@huawei.com>
Date: Mon, 7 Nov 2022 09:41:37 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <CADnq5_OTt+FzNTiDWYS3_R2kwvXL_AUYY-86oS5_WGTtnjPEBQ@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.178.247]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpemm500002.china.huawei.com (7.185.36.229)
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
Cc: Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022/11/5 2:31, Alex Deucher wrote:
> On Fri, Nov 4, 2022 at 6:05 AM Hanjun Guo <guohanjun@huawei.com> wrote:
>>
>> VBIOSImageOffset in struct UEFI_ACPI_VFCT is ULONG (unsigned long),
>> but it will be assigned to "unsigned offset", so use unsigned long
>> instead of unsigned for the offset, to avoid possible overflow.
> 
> ULONG in atombios is 32 bits so an int should be fine.

I saw the typedef in the atombios.h is unsigned long but I missed
that the real one is uint32_t in atom-types.h, please drop this patch
and take a look at the PATCH 2/2.

Thanks for the prompt reply.

Thanks
Hanjun
