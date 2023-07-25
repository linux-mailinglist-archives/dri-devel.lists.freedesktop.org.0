Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 07D9D76051D
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jul 2023 04:14:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DBD210E0D0;
	Tue, 25 Jul 2023 02:13:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA54F10E09C
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jul 2023 02:13:55 +0000 (UTC)
Received: from canpemm500007.china.huawei.com (unknown [172.30.72.55])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4R90qW3D6yzNmZF;
 Tue, 25 Jul 2023 10:10:31 +0800 (CST)
Received: from [10.174.179.215] (10.174.179.215) by
 canpemm500007.china.huawei.com (7.192.104.62) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 25 Jul 2023 10:13:53 +0800
Subject: Re: [PATCH -next] drm/fb-helper: Remove unused inline function
 drm_fb_helper_defio_init()
To: Thomas Zimmermann <tzimmermann@suse.de>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <airlied@gmail.com>, <daniel@ffwll.ch>
References: <20230721120902.32920-1-yuehaibing@huawei.com>
 <fb90dd22-b908-d65a-5272-c2f94aa0113d@suse.de>
From: YueHaibing <yuehaibing@huawei.com>
Message-ID: <38537dfb-34eb-eed9-2f96-37479dbc8ea6@huawei.com>
Date: Tue, 25 Jul 2023 10:13:52 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <fb90dd22-b908-d65a-5272-c2f94aa0113d@suse.de>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.179.215]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 canpemm500007.china.huawei.com (7.192.104.62)
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023/7/24 22:27, Thomas Zimmermann wrote:
> Hi
> 
> Am 21.07.23 um 14:09 schrieb YueHaibing:
>> Since commit 8e86dee02253 ("drm/fb-helper: Remove drm_fb_helper_defio_init() and update docs")
>> this inline helper not used anymore.
>>
>> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> 
> You need to add a Fixes: tag here with the commit you mentioned in the description.
Ok, will send v2.
> 
> With this fixed, you can also add
> 
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
> 
> Best regards
> Thomas
> 
>> ---
>>   include/drm/drm_fb_helper.h | 5 -----
>>   1 file changed, 5 deletions(-)
>>
>> diff --git a/include/drm/drm_fb_helper.h b/include/drm/drm_fb_helper.h
>> index 4863b0f8299e..375737fd6c36 100644
>> --- a/include/drm/drm_fb_helper.h
>> +++ b/include/drm/drm_fb_helper.h
>> @@ -368,11 +368,6 @@ static inline void drm_fb_helper_deferred_io(struct fb_info *info,
>>   {
>>   }
>>   -static inline int drm_fb_helper_defio_init(struct drm_fb_helper *fb_helper)
>> -{
>> -    return -ENODEV;
>> -}
>> -
>>   static inline void drm_fb_helper_set_suspend(struct drm_fb_helper *fb_helper,
>>                            bool suspend)
>>   {
> 
