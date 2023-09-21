Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A30A7A9489
	for <lists+dri-devel@lfdr.de>; Thu, 21 Sep 2023 15:11:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCF7110E0C1;
	Thu, 21 Sep 2023 13:10:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id D3B3110E0C1
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Sep 2023 13:10:56 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8CxLOvdQAxl8ooqAA--.10922S3;
 Thu, 21 Sep 2023 21:10:53 +0800 (CST)
Received: from [0.0.0.0] (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Dxnd7MQAxlS0cNAA--.28996S3; 
 Thu, 21 Sep 2023 21:10:45 +0800 (CST)
Message-ID: <cab7d157-946e-6b8f-1b29-5618a0ac0da6@loongson.cn>
Date: Thu, 21 Sep 2023 21:10:36 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 5.4 000/367] 5.4.257-rc1 review
To: Naresh Kamboju <naresh.kamboju@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20230920112858.471730572@linuxfoundation.org>
 <CA+G9fYsM0Lr8TNQJxsZFDZwcH-rEzkVV+y+x5FX18oH5wm5dRg@mail.gmail.com>
Content-Language: en-US
From: Sui Jingfeng <suijingfeng@loongson.cn>
In-Reply-To: <CA+G9fYsM0Lr8TNQJxsZFDZwcH-rEzkVV+y+x5FX18oH5wm5dRg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Dxnd7MQAxlS0cNAA--.28996S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoW7CF17WryktFWxtFWfXFy8tFc_yoW8uFW5pF
 W5t34Yyr4jyr47tan7Zr1Sva4Yyan3J3y7Wr1DWry3uF1UWF4xKw1v9rZIvF9rWFWkKa1U
 tr4qga4jva109rbCm3ZEXasCq-sJn29KB7ZKAUJUUUUf529EdanIXcx71UUUUU7KY7ZEXa
 sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
 0xBIdaVrnRJUUUP2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
 IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
 e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
 0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v2
 6F4UJVW0owAaw2AFwI0_JF0_Jw1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0c
 Ia020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JF0_
 Jw1lYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrw
 CYjI0SjxkI62AI1cAE67vIY487MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48J
 MxC20s026xCaFVCjc4AY6r1j6r4UMxCIbckI1I0E14v26r126r1DMI8I3I0E5I8CrVAFwI
 0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZVWrXwCIc40Y
 0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1I6r4UMIIF0xvE2Ix0cI8IcVCY1x0267AKxV
 W8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1l
 IxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU8loGPUUUU
 U==
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, f.fainelli@gmail.com,
 rwarsow@gmx.de, pavel@denx.de, conor@kernel.org, shuah@kernel.org,
 dri-devel@lists.freedesktop.org, patches@lists.linux.dev,
 stable@vger.kernel.org, linux-kernel@vger.kernel.org,
 lkft-triage@lists.linaro.org, srw@sladewatkins.net, patches@kernelci.org,
 akpm@linux-foundation.org, jonathanh@nvidia.com, torvalds@linux-foundation.org,
 sudipm.mukherjee@gmail.com, linux@roeck-us.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,


On 2023/9/21 20:08, Naresh Kamboju wrote:
> On Wed, 20 Sept 2023 at 14:25, Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
>> This is the start of the stable review cycle for the 5.4.257 release.
>> There are 367 patches in this series, all will be posted as a response
>> to this one.  If anyone has any issues with these being applied, please
>> let me know.
>>
>> Responses should be made by Fri, 22 Sep 2023 11:28:09 +0000.
>> Anything received after that time might be too late.
>>
>> The whole patch series can be found in one patch at:
>>          https://www.kernel.org/pub/linux/kernel/v5.x/stable-review/patch-5.4.257-rc1.gz
>> or in the git tree and branch at:
>>          git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-5.4.y
>> and the diffstat can be found below.
>>
>> thanks,
>>
>> greg k-h
> Following build warnings noticed while building arm64 with allmodconfig
> on stable-rc 5.4 with gcc-8 and gcc-12 toolchains.
>
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
>
> drivers/gpu/drm/mediatek/mtk_drm_gem.c: In function 'mtk_drm_gem_prime_vmap':
> drivers/gpu/drm/mediatek/mtk_drm_gem.c:273:10: warning: returning
> 'int' from a function with return type 'void *' makes pointer from
> integer without a cast [-Wint-conversion]
>     return -ENOMEM;
>            ^


Well, this is easy to solve.
For the Linux-5.4 kernel, we should use "return -ERR_PTR(-ENOMEM)" instead of "return -ENOMEM".
Since, newer version kernel prefer to return error code instead of error pointer.
See below commit for more information.

commit <7e542ff8b463>  ("drm/mediatek: Use struct dma_buf_map in GEM 
vmap ops")
commit <49a3f51dfeee> ("drm/gem: Use struct dma_buf_map in GEM vmap ops 
and convert GEM backends")


> Links:
>   - https://storage.tuxsuite.com/public/linaro/lkft/builds/2VfG47LmPH9MUEuIcMVftu6NsFy/
>
>
> Following commit is causing this build warning.
>
> drm/mediatek: Fix potential memory leak if vmap() fail
> [ Upstream commit 379091e0f6d179d1a084c65de90fa44583b14a70 ]
>
> --
> Linaro LKFT
> https://lkft.linaro.org

