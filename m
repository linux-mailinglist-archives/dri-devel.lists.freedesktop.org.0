Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB31673FFEA
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jun 2023 17:42:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69DF010E30E;
	Tue, 27 Jun 2023 15:42:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from 189.cn (ptr.189.cn [183.61.185.101])
 by gabe.freedesktop.org (Postfix) with ESMTP id 83E7410E318
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jun 2023 15:42:02 +0000 (UTC)
HMM_SOURCE_IP: 10.64.8.41:47796.1468361982
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-114.242.206.180 (unknown [10.64.8.41])
 by 189.cn (HERMES) with SMTP id C284D1001BD;
 Tue, 27 Jun 2023 23:41:57 +0800 (CST)
Received: from  ([114.242.206.180])
 by gateway-151646-dep-75648544bd-xwndj with ESMTP id
 092d237c49d1407192172e5a3eeb9f6f for suijingfeng@loongson.cn; 
 Tue, 27 Jun 2023 23:41:58 CST
X-Transaction-ID: 092d237c49d1407192172e5a3eeb9f6f
X-Real-From: 15330273260@189.cn
X-Receive-IP: 114.242.206.180
X-MEDUSA-Status: 0
Message-ID: <db89b457-8a15-2109-1a65-eee182234fc3@189.cn>
Date: Tue, 27 Jun 2023 23:41:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v15 1/2] drm: Add kms driver for loongson display
 controller
Content-Language: en-US
To: Sui Jingfeng <suijingfeng@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>
References: <20230615143613.1236245-1-15330273260@189.cn>
 <20230615143613.1236245-2-15330273260@189.cn>
 <CAAhV-H704swbRxsZoJN5ef3X41n9Vw-js_73tptK3cAjCWP6tQ@mail.gmail.com>
 <f1f24be6-20c6-03de-a4a7-4ad874b8a0f5@loongson.cn>
 <CAAhV-H5_B5g5tkv29z2bPBeiuR-gaBgRMFPSmOp1U+bqrOGQPA@mail.gmail.com>
 <7e60a8a7-e7c9-285c-a997-7404c2b8f802@loongson.cn>
From: Sui Jingfeng <15330273260@189.cn>
In-Reply-To: <7e60a8a7-e7c9-285c-a997-7404c2b8f802@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: Nathan Chancellor <nathan@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, inux-kernel@vger.kernel.org,
 Emil Velikov <emil.l.velikov@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Christian Koenig <christian.koenig@amd.com>, loongson-kernel@lists.loongnix.cn,
 Liu Peibao <liupeibao@loongson.cn>, dri-devel@lists.freedesktop.org,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 2023/6/27 23:27, Sui Jingfeng wrote:
> Hi,
>
> On 2023/6/19 18:19, Huacai Chen wrote:
>>> Single patch is more easy to manage.
>>>
>>> The first patch of this driver should comes a whole.
>> Benchmarks and debugfs are not the very basic parts.
>
> In the V2,
>
> Thomas told me that if we implement our own TTM-based memory manager,
>
> we will also have the possibility of implementing a faster console.
>
>
> Back to that time I do not even know the bandwidth of our hardware.
>
> 1) The bandwidth of copying buffer from the system RAM to system RAM;
>
> 2) The bandwidth of copying buffer from the system RAM to dedicated VRAM;
>
> 3) The bandwidth of copying buffer from the dedicated VRAM to system RAM;
>
>
> We can make the right decision only when we know the various bandwidth 
> listed as above.
>
> How to implement it.
>

I means that the benchmarks can actually improve your cognition toward 
the hardware.

Where is the bottleneck of the performance.

It also can be a kind of self test, to verify if various parts works as 
expected.

