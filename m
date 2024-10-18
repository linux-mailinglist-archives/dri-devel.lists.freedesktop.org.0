Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18A5B9A3829
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2024 10:12:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D9F910E359;
	Fri, 18 Oct 2024 08:12:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91D8C10E359
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2024 08:12:40 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.162.112])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4XVHTg22Dvz1jB9H;
 Fri, 18 Oct 2024 16:11:19 +0800 (CST)
Received: from kwepemh500013.china.huawei.com (unknown [7.202.181.146])
 by mail.maildlp.com (Postfix) with ESMTPS id B545E14022D;
 Fri, 18 Oct 2024 16:12:35 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 kwepemh500013.china.huawei.com (7.202.181.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 18 Oct 2024 16:12:34 +0800
Message-ID: <f7519595-8080-44c5-0477-e1281266b80b@huawei.com>
Date: Fri, 18 Oct 2024 16:12:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v3 0/4] drm/tests: Fix some memory leaks
Content-Language: en-US
To: Maxime Ripard <mripard@kernel.org>
CC: <maarten.lankhorst@linux.intel.com>, <tzimmermann@suse.de>,
 <airlied@gmail.com>, <simona@ffwll.ch>, <christian.koenig@amd.com>,
 <ray.huang@amd.com>, <dmitry.baryshkov@linaro.org>,
 <dave.stevenson@raspberrypi.com>, <quic_jjohnson@quicinc.com>,
 <mcanal@igalia.com>, <davidgow@google.com>, <skhan@linuxfoundation.org>,
 <karolina.stolarek@intel.com>, <Arunpravin.PaneerSelvam@amd.com>,
 <thomas.hellstrom@linux.intel.com>, <asomalap@amd.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20241017063125.3080347-1-ruanjinjie@huawei.com>
 <20241018-gigantic-meticulous-pug-06ec1b@houat>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20241018-gigantic-meticulous-pug-06ec1b@houat>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemh500013.china.huawei.com (7.202.181.146)
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



On 2024/10/18 15:55, Maxime Ripard wrote:
> Hi,
> 
> On Thu, Oct 17, 2024 at 02:31:21PM GMT, Jinjie Ruan wrote:
>> Fix some memory leaks in drm tests.
>>
>> Changes in v3:
>> - Adjust drm/drm_edid.h header to drm_kunit_helpers.c.
>> - Drop the "helper" in the helper name.
>> - s/fllowing/following/
>> - Add Acked-by.
> 
> This creates build failures since drm_display_mode were const before,
> and can't anymore.

It seems it came from bellowing v1, and this v3 has not reported the
issue yet.

https://lore.kernel.org/all/202410180830.oitxTsOv-lkp@intel.com/

> 
> Maxime
