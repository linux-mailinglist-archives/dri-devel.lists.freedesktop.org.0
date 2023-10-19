Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 996ED7CF664
	for <lists+dri-devel@lfdr.de>; Thu, 19 Oct 2023 13:14:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34DD610E4C0;
	Thu, 19 Oct 2023 11:14:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id D160410E4C3
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Oct 2023 11:14:31 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8BxY_CUDzFl3C0zAA--.33759S3;
 Thu, 19 Oct 2023 19:14:28 +0800 (CST)
Received: from [10.20.42.43] (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8CxbS+GDzFlXL4qAA--.24527S3; 
 Thu, 19 Oct 2023 19:14:27 +0800 (CST)
Message-ID: <a23cfd62-af09-4aa3-902e-bb34756275c6@loongson.cn>
Date: Thu, 19 Oct 2023 19:14:13 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/loongson: Add support for the DC in LS2K1000 SoC
To: Maxime Ripard <mripard@kernel.org>
References: <20231011162638.819080-1-suijingfeng@loongson.cn>
 <26565c5e13e72c64214a7f67ab6f2d9d876fa4bd.camel@icenowy.me>
 <037ec619-c170-4ca6-897e-04fccd58c62a@loongson.cn>
 <76nxdwa6m7qyqvala4akc2rptuylhrqyoz2x5rjua4hppoxk7x@wwn37gwuvrms>
Content-Language: en-US
From: Sui Jingfeng <suijingfeng@loongson.cn>
In-Reply-To: <76nxdwa6m7qyqvala4akc2rptuylhrqyoz2x5rjua4hppoxk7x@wwn37gwuvrms>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8CxbS+GDzFlXL4qAA--.24527S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoW7Jr1kWr18AFy8KF4xKF43XFc_yoW8JF18pa
 y5CanxKFs7tF1fAFy8twn5uF4Svr4ftr1Uu3yxCr1UW3ZrGw10va13Krn0kFy5Grn29a42
 gw4YkFWFywnrAabCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
 sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
 0xBIdaVrnRJUUUyKb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
 IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
 e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
 0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v2
 6F4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc
 02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAF
 wI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxAIw28IcxkI7VAKI4
 8JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xv
 wVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjx
 v20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20E
 Y4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267
 AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxUzZ2-UUUUU
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
Cc: Icenowy Zheng <uwu@icenowy.me>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,


On 2023/10/19 16:11, Maxime Ripard wrote:
> On Fri, Oct 13, 2023 at 06:28:01PM +0800, Sui Jingfeng wrote:
>> Hi,
>>
>>
>> On 2023/10/13 16:22, Icenowy Zheng wrote:
>>> 在 2023-10-12星期四的 00:26 +0800，Sui Jingfeng写道：
>>>> LS2K1000 is a low end SoC (two core 1.0gHz), it don't has dedicated
>>>> VRAM.
>>>> It requires the framebuffer to be phisically continguous to scanout.
>>>> The
>>>> display controller in LS2K1000 don't has built-in GPIO hardware, the
>>>> structure (register bit field) of its pixel, DC, GPU, DDR PLL are
>>>> also
>>>> defferent from other model. But for the display controller itself,
>>>> Most of
>>>> hardware features of it are same with ls7a1000.
>>>>
>>>> Below is a simple dts for it.
>>> Why don't you write a proper, YAML-formatted binding?
>>>
>> This patch use only one DT property, that is the "memory-region = <&display_reserved>;".
>> But the memory-region property is a common property, I means that everyone know how to
>> use this property. I'm not sure the if YAML documentation is strictly required now.
> AFAIK it is, and even if it's not, please do it.

OK, thanks a lot for the feedback.
I will try to solve this problem at the next version.
I'm preparing the next version.


> Maxime

