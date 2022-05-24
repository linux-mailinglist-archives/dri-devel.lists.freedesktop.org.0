Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 771455320ED
	for <lists+dri-devel@lfdr.de>; Tue, 24 May 2022 04:27:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D9D810E140;
	Tue, 24 May 2022 02:27:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79A3510E140
 for <dri-devel@lists.freedesktop.org>; Tue, 24 May 2022 02:27:38 +0000 (UTC)
Received: from kwepemi100014.china.huawei.com (unknown [172.30.72.54])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4L6dLq1NYszQk8F;
 Tue, 24 May 2022 10:24:35 +0800 (CST)
Received: from kwepemm600018.china.huawei.com (7.193.23.140) by
 kwepemi100014.china.huawei.com (7.221.188.106) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Tue, 24 May 2022 10:27:34 +0800
Received: from [10.174.176.88] (10.174.176.88) by
 kwepemm600018.china.huawei.com (7.193.23.140) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Tue, 24 May 2022 10:27:33 +0800
Message-ID: <4e513db6-6b42-0b86-d0ed-fac762d9c746@huawei.com>
Date: Tue, 24 May 2022 10:27:32 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH -next] drm/panel: Fix build error when
 CONFIG_DRM_PANEL_SAMSUNG_ATNA33XC20=y && CONFIG_DRM_DISPLAY_HELPER=m
To: Doug Anderson <dianders@chromium.org>
References: <20220523085745.276-1-gaochao49@huawei.com>
 <CAD=FV=VVZo+wsR0yPLvq-8jkZg12+Sw0NM0TkgQLHDCxCiFdGw@mail.gmail.com>
From: "gaochao (L)" <gaochao49@huawei.com>
In-Reply-To: <CAD=FV=VVZo+wsR0yPLvq-8jkZg12+Sw0NM0TkgQLHDCxCiFdGw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.176.88]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemm600018.china.huawei.com (7.193.23.140)
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
Cc: David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, zhengbin13@huawei.com,
 Thierry Reding <thierry.reding@gmail.com>, Sean Paul <seanpaul@chromium.org>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



在 2022/5/24 0:47, Doug Anderson 写道:
> Hi,
> 
> On Mon, May 23, 2022 at 1:58 AM gaochao <gaochao49@huawei.com> wrote:
>>
>> If CONFIG_DRM_PANEL_SAMSUNG_ATNA33XC20=y && CONFIG_DRM_DISPLAY_HELPER=m,
>> bulding fails:
>>
>> drivers/gpu/drm/panel/panel-samsung-atna33xc20.o: In function `atana33xc20_probe':
>> panel-samsung-atna33xc20.c:(.text+0x744): undefined reference to
>>  `drm_panel_dp_aux_backlight'
>> make: *** [vmlinux] Error 1
>>
>> Let CONFIG_DRM_PANEL_SAMSUNG_ATNA33XC20 select DRM_DISPLAY_DP_HELPER and
>> CONFIG_DRM_DISPLAY_HELPER to fix this error.
>>
>> Fixes: 32ce3b320343 ("drm/panel: atna33xc20: Introduce the Samsung ATNA33XC20 panel")
>> Reported-by: Hulk Robot <hulkci@huawei.com>
>> Signed-off-by: gaochao <gaochao49@huawei.com>
> 
> I think the author / Signed-off-by are supposed to be real names. Is
> "gaochao" your legal name?
Thank you for the review.
Should be "Gao Chao", fixing in the second version.
> 
>> ---
>>  drivers/gpu/drm/panel/Kconfig | 2 ++
>>  1 file changed, 2 insertions(+)
> 
> Other than the Signed-off-by / Author issue:
> 
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> .
