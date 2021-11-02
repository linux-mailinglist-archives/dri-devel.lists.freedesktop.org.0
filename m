Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59A5E4425B7
	for <lists+dri-devel@lfdr.de>; Tue,  2 Nov 2021 03:48:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4A916EB3D;
	Tue,  2 Nov 2021 02:48:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 796406EB3D
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Nov 2021 02:48:17 +0000 (UTC)
Received: from dggeme755-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4HjvS66vqGzSh0v;
 Tue,  2 Nov 2021 10:46:46 +0800 (CST)
Received: from [10.67.110.136] (10.67.110.136) by
 dggeme755-chm.china.huawei.com (10.3.19.101) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.15; Tue, 2 Nov 2021 10:48:14 +0800
Subject: Re: [PATCH] drm: Grab reference of connector before return connector
 from sun4i_tcon_get_connector
To: Jani Nikula <jani.nikula@linux.intel.com>, <mripard@kernel.org>,
 <wens@csie.org>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <jernej.skrabec@gmail.com>
References: <20211101062906.231518-1-heying24@huawei.com>
 <87cznkdo6p.fsf@intel.com>
From: He Ying <heying24@huawei.com>
Message-ID: <33e01d45-c9f9-0e8c-6871-868ecd198368@huawei.com>
Date: Tue, 2 Nov 2021 10:48:14 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <87cznkdo6p.fsf@intel.com>
Content-Type: text/plain; charset="gbk"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.110.136]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggeme755-chm.china.huawei.com (10.3.19.101)
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
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


ÔÚ 2021/11/1 21:02, Jani Nikula Ð´µÀ:
> On Mon, 01 Nov 2021, He Ying <heying24@huawei.com> wrote:
>>  From the comments of drm_for_each_connector_iter(), we know
>> that "connector is only valid within the list body, if you
>> want to use connector after calling drm_connector_list_iter_end()
>> then you need to grab your own reference first using
>> drm_connector_get()". So fix the wrong use of connector
>> according to the comments and then call drm_connector_put()
>> after using connector finishes.
>>
>> Signed-off-by: He Ying <heying24@huawei.com>
> Please use "drm/sun4i:" subject prefix for sun4i patches.

OK. I'll send a V2 later. By the way, may I have your suggestions about

this patch's content.

