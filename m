Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BAFF737CAC
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 10:05:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6012C10E3F1;
	Wed, 21 Jun 2023 08:05:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id 86ECE10E3F1;
 Wed, 21 Jun 2023 08:05:50 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8AxR8Vdr5JkOQ4AAA--.93S3;
 Wed, 21 Jun 2023 16:05:49 +0800 (CST)
Received: from [10.20.42.43] (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8DxDc9cr5JkEUUAAA--.1805S3; 
 Wed, 21 Jun 2023 16:05:48 +0800 (CST)
Message-ID: <a190b9ac-f4c5-1b36-c7eb-0b3333338a6d@loongson.cn>
Date: Wed, 21 Jun 2023 16:05:48 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v10 00/11] drm/etnaviv: Add pci device driver support
Content-Language: en-US
To: Christian Gmeiner <christian.gmeiner@gmail.com>,
 Sui Jingfeng <18949883232@163.com>
References: <20230620094716.2231414-1-18949883232@163.com>
 <CAH9NwWdfK0DkDA-Fi6TRrS4orm-HbAqBLDpYcMKd69dU6Jh+CA@mail.gmail.com>
From: Sui Jingfeng <suijingfeng@loongson.cn>
Organization: Loongson
In-Reply-To: <CAH9NwWdfK0DkDA-Fi6TRrS4orm-HbAqBLDpYcMKd69dU6Jh+CA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8DxDc9cr5JkEUUAAA--.1805S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoW7Ww47Cw45JFyDur4kJFW3twc_yoW8Cw45p3
 4rtF9xCrW0qr40y3y7Jr15Jry5ArWYya45Jr4DJFyUCFyDGF12vF1DZr4v9rZrXF48Xr4U
 tF4YgFyqvw15XabCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
 sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
 0xBIdaVrnRJUUUB2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
 IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
 e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
 0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
 xVW8Jr0_Cr1UM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07
 AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWU
 tVWrXwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI4
 8JMxk0xIA0c2IEe2xFo4CEbIxvr21l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_
 Jr0_Gr1l4IxYO2xFxVAFwI0_Jw0_GFylx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8Gjc
 xK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0
 cI8IcVAFwI0_Gr0_Xr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8V
 AvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E
 14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxU4AhLUUUUU
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
Cc: etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Russell King <linux+etnaviv@armlinux.org.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Below is the gpu info cat from the debugfs,

I guess this is also what you want ?


[root@fedora 0]# cat gpu

0000:00:06.0 Status:
     identity
      model: 0x1000
      revision: 0x5037
      product_id: 0x0
      customer_id: 0x0
      eco_id: 0x0
     features
      major_features: 0xe0286eed
      minor_features0: 0xe9799eff
      minor_features1: 0xbe13b2d9
      minor_features2: 0xca114080
      minor_features3: 0x0e0100a1
      minor_features4: 0x00000000
      minor_features5: 0x00000000
      minor_features6: 0x00000000
      minor_features7: 0x00000000
      minor_features8: 0x00000000
      minor_features9: 0x00000000
      minor_features10: 0x00000000
      minor_features11: 0x00000000
     specs
      stream_count:  4
      register_max: 64
      thread_count: 512
      vertex_cache_size: 8
      shader_core_count: 2
      nn_core_count: 0
      pixel_pipes: 1
      vertex_output_buffer_size: 512
      buffer_size: 0
      instruction_count: 256
      num_constants: 576
      varyings_count: 8
     axi: 0x00000051
     idle: 0x7ffffffe
      FE is not idle
     DMA is running
      address 0: 0x00002ac0
      address 1: 0x00002ac8
      state 0: 0x00000800
      state 1: 0x00000812
      last fetch 64 bit word: 0x380000c8 0x00000701


On 2023/6/21 15:55, Christian Gmeiner wrote:
> Hi
>
>> From: Sui Jingfeng <suijingfeng@loongson.cn>
>>
>> There is a Vivante GC1000 (v5037) in LS2K1000 and LS7A1000, this GPU is a
>> PCI device, and it has 2D and 3D cores in the same core. This series is
>> trying to add PCI device driver support to drm/etnaviv.
>>
> Is it possible to get the lspci output for the GPU? Something like
> this: sudo lspci -vvv -s ...
>
>
> thanks
> --
> Christian Gmeiner, MSc
>
> https://christian-gmeiner.info/privacypolicy

-- 
Jingfeng

