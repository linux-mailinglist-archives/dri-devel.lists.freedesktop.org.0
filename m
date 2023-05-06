Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7463B6F9096
	for <lists+dri-devel@lfdr.de>; Sat,  6 May 2023 10:32:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AFEA10E1E0;
	Sat,  6 May 2023 08:32:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from 189.cn (ptr.189.cn [183.61.185.104])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1285010E1E0
 for <dri-devel@lists.freedesktop.org>; Sat,  6 May 2023 08:32:29 +0000 (UTC)
HMM_SOURCE_IP: 10.64.8.31:57024.1397785887
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-114.242.206.180 (unknown [10.64.8.31])
 by 189.cn (HERMES) with SMTP id DF90A1002B5;
 Sat,  6 May 2023 16:32:27 +0800 (CST)
Received: from  ([114.242.206.180])
 by gateway-151646-dep-85667d6c59-6qwzn with ESMTP id
 0da97246ee464bcaad97b2a1e31af4c9 for chenhuacai@kernel.org; 
 Sat, 06 May 2023 16:32:28 CST
X-Transaction-ID: 0da97246ee464bcaad97b2a1e31af4c9
X-Real-From: 15330273260@189.cn
X-Receive-IP: 114.242.206.180
X-MEDUSA-Status: 0
Message-ID: <7764c60c-371a-89f7-c9a8-6727551926ae@189.cn>
Date: Sat, 6 May 2023 16:32:26 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v12 1/2] MAINTAINERS: add maintainers for DRM LOONGSON
 driver
Content-Language: en-US
To: Huacai Chen <chenhuacai@kernel.org>
References: <20230504080406.1213623-1-suijingfeng@loongson.cn>
 <20230504080406.1213623-2-suijingfeng@loongson.cn>
 <CAAhV-H4zKGkd2JUyYTDKBEGFEO5V+oRz8iuzF9w+ivz0t6+CFw@mail.gmail.com>
From: Sui Jingfeng <15330273260@189.cn>
In-Reply-To: <CAAhV-H4zKGkd2JUyYTDKBEGFEO5V+oRz8iuzF9w+ivz0t6+CFw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: loongson-kernel@lists.loongnix.cn, Thomas Zimmermann <tzimmermann@suse.de>,
 Emil Velikov <emil.l.velikov@gmail.com>, nathan@kernel.org,
 linux-kernel@vger.kernel.org, Christian Koenig <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,


Ah, I did't notice this.

The disorder is because during developing phase,

it is more easy amend new changes to the top of the commits.

So, I put another patch of this series on the top of this.

Will be fixed at next version, thanks for you point out that.


On 2023/5/6 11:09, Huacai Chen wrote:
> Hi, Jingfeng,
>
> I think you should exchange the order of these two patches.
>
>
> Huacai
>
> On Thu, May 4, 2023 at 4:04 PM Sui Jingfeng <suijingfeng@loongson.cn> wrote:
>>   This patch add myself as maintainer to drm loongson driver
>>
>> Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
>> ---
>>   MAINTAINERS | 7 +++++++
>>   1 file changed, 7 insertions(+)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 73b3298b7232..1f5aa8756d87 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -6922,6 +6922,13 @@ T:       git git://anongit.freedesktop.org/drm/drm-misc
>>   F:     drivers/gpu/drm/lima/
>>   F:     include/uapi/drm/lima_drm.h
>>
>> +DRM DRIVERS FOR LOONGSON
>> +M:     Sui Jingfeng <suijingfeng@loongson.cn>
>> +L:     dri-devel@lists.freedesktop.org
>> +S:     Supported
>> +T:     git git://anongit.freedesktop.org/drm/drm-misc
>> +F:     drivers/gpu/drm/loongson/
>> +
>>   DRM DRIVERS FOR MEDIATEK
>>   M:     Chun-Kuang Hu <chunkuang.hu@kernel.org>
>>   M:     Philipp Zabel <p.zabel@pengutronix.de>
>> --
>> 2.25.1
>>
