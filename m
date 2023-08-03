Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 195E176FAEC
	for <lists+dri-devel@lfdr.de>; Fri,  4 Aug 2023 09:17:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29D6110E694;
	Fri,  4 Aug 2023 07:17:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8757710E0DF
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Aug 2023 09:14:17 +0000 (UTC)
Received: from dggpemm500024.china.huawei.com (unknown [172.30.72.57])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4RGjn24tDfz1GDTw;
 Thu,  3 Aug 2023 17:13:10 +0800 (CST)
Received: from [10.67.110.173] (10.67.110.173) by
 dggpemm500024.china.huawei.com (7.185.36.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 3 Aug 2023 17:14:13 +0800
Message-ID: <4d371c7e-c945-26c0-ebcd-48c6bb886dc8@huawei.com>
Date: Thu, 3 Aug 2023 17:14:13 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fbcon: Make fbcon_registered_fb and
 fbcon_num_registered_fb static
Content-Language: en-US
To: Daniel Vetter <daniel@ffwll.ch>
References: <20230803020939.491-1-guozihua@huawei.com>
 <ZMtoA/cYt6rtTpAD@phenom.ffwll.local> <ZMtq2NtCIQxKRqPh@phenom.ffwll.local>
From: "Guozihua (Scott)" <guozihua@huawei.com>
In-Reply-To: <ZMtq2NtCIQxKRqPh@phenom.ffwll.local>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.110.173]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpemm500024.china.huawei.com (7.185.36.203)
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Fri, 04 Aug 2023 07:17:40 +0000
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
Cc: deller@gmx.de, linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023/8/3 16:52, Daniel Vetter wrote:
> On Thu, Aug 03, 2023 at 10:40:35AM +0200, Daniel Vetter wrote:
>> On Thu, Aug 03, 2023 at 10:09:39AM +0800, GUO Zihua wrote:
>>> fbcon_registered_fb and fbcon_num_registered_fb is not referred outside
>>> drivers/video/fbdev/core/fbcon.c, so make them static.
>>>
>>> Signed-off-by: GUO Zihua <guozihua@huawei.com>
>>
>> Applied both of your patches to drm-misc-next.
> 
> Correction, I dropped the agpgart patch again because amd gart x86 arch
> code needs that symbol.

Thanks Daniel. Blind enough to not found this usage while making the
patch, sorry for the burden.
> 
>> -Daniel
>>
>>> ---
>>>  drivers/video/fbdev/core/fbcon.c | 4 ++--
>>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
>>> index 887fad44e7ec..976900d6893c 100644
>>> --- a/drivers/video/fbdev/core/fbcon.c
>>> +++ b/drivers/video/fbdev/core/fbcon.c
>>> @@ -102,8 +102,8 @@ enum {
>>>  
>>>  static struct fbcon_display fb_display[MAX_NR_CONSOLES];
>>>  
>>> -struct fb_info *fbcon_registered_fb[FB_MAX];
>>> -int fbcon_num_registered_fb;
>>> +static struct fb_info *fbcon_registered_fb[FB_MAX];
>>> +static int fbcon_num_registered_fb;
>>>  
>>>  #define fbcon_for_each_registered_fb(i)		\
>>>  	for (i = 0; WARN_CONSOLE_UNLOCKED(), i < FB_MAX; i++)		\
>>> -- 
>>> 2.17.1
>>>
>>
>> -- 
>> Daniel Vetter
>> Software Engineer, Intel Corporation
>> http://blog.ffwll.ch
> 

-- 
Best
GUO Zihua

