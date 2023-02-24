Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9D8C6A14D4
	for <lists+dri-devel@lfdr.de>; Fri, 24 Feb 2023 03:16:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DD1910E4C8;
	Fri, 24 Feb 2023 02:15:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id B2B9A10E4C8
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Feb 2023 02:15:55 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.133])
 by gateway (Coremail) with SMTP id _____8Bx783ZHfhj32wEAA--.3227S3;
 Fri, 24 Feb 2023 10:15:53 +0800 (CST)
Received: from [10.20.42.133] (unknown [10.20.42.133])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Axvr7WHfhjfCY6AA--.45207S3; 
 Fri, 24 Feb 2023 10:15:52 +0800 (CST)
Message-ID: <d0640075-289a-e5ac-132a-c4fb8e151ad2@loongson.cn>
Date: Fri, 24 Feb 2023 10:15:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v4] drm: add kms driver for loongson display controller
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>, suijingfeng
 <15330273260@189.cn>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20230220165130.6297-1-15330273260@189.cn>
 <ce854840-17d3-9ba1-5cf9-79a5fd2888c6@suse.de>
From: suijingfeng <suijingfeng@loongson.cn>
In-Reply-To: <ce854840-17d3-9ba1-5cf9-79a5fd2888c6@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Axvr7WHfhjfCY6AA--.45207S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBjvdXoW7Gr48Xr1rtw4kXw1DAw47Jwb_yoWkuFb_uw
 4DGrs3Zw1jyFs7trWktr45ZryDGrZYqrykAF42vFZIqFnrJF98Arn5JF97Za43u3ySy39x
 Krn8JFn7ua1q9jkaLaAFLSUrUUUU8b8apTn2vfkv8UJUUUU8wcxFpf9Il3svdxBIdaVrn0
 xqx4xG64xvF2IEw4CE5I8CrVC2j2Jv73VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUY
 A7kC6x804xWl14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3w
 AFIxvE14AKwVWUXVWUAwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK
 6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r1j6r4UM28EF7
 xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJwAa
 w2AFwI0_Jrv_JF1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44
 I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2
 jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62
 AI1cAE67vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMxCIbckI
 1I0E14v26r1Y6r17MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_Jr
 Wlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j
 6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr
 0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUv
 cSsGvfC2KfnxnUUI43ZEXa7IU8uuWJUUUUU==
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
Cc: Li Yi <liyi@loongson.cn>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 2023/2/23 22:07, Thomas Zimmermann wrote:
>
> It's the same story all over: you rather want to remove all these 
> lookup helpers and do a single test before you create the modesetting 
> pipeline:
>
>  if (chip == LS7A2000 && index == 0)
>     lscd_create_output_ls7a2000_0();
>  else if (chip == LS7A2000 && index == 1)
>     lscd_create_output_ls7a2000_1();
>  else if (chip == LS7A1000 && index == 0)
>     lscd_create_output_ls7a1000_0();
>  else if (chip == LS7A1000 && index == 1)
>     lscd_create_output_ls7a1000_1();
>  else if (...)
>     ...
>
> There you create the data structures for each pair of chip and index. 
> If you have functions that can be used by multiple pairs, sharing 
> those is fine. You might end up with duplicated code, but the overall 
> design is sound.
>
> Your current design will become unmaintainable pretty soon. We already 
> have several of such drivers.


Yes, your are right.

I'm fear of the duplicated code in the past.

I did not put my attention to the maintainable of the software.

a quick skim through radeon, I find that there also seems have 
"duplicated" code, this is  a design.

I didn't get it before, now I get it.

