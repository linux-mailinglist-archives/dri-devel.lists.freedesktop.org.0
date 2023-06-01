Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD40D719D4E
	for <lists+dri-devel@lfdr.de>; Thu,  1 Jun 2023 15:21:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4579110E24B;
	Thu,  1 Jun 2023 13:21:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id 45A5410E24B;
 Thu,  1 Jun 2023 13:21:40 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8AxhPBim3hkpE8DAA--.7193S3;
 Thu, 01 Jun 2023 21:21:38 +0800 (CST)
Received: from [10.20.42.43] (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Dx87Bhm3hkq02EAA--.18683S3; 
 Thu, 01 Jun 2023 21:21:38 +0800 (CST)
Message-ID: <81276850-d371-e61d-e13d-3a90aa950981@loongson.cn>
Date: Thu, 1 Jun 2023 21:21:37 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v6 2/6] drm/etnaviv: add a dedicated function to get
 various clocks
Content-Language: en-US
To: Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20230530160643.2344551-1-suijingfeng@loongson.cn>
 <20230530160643.2344551-3-suijingfeng@loongson.cn>
 <85565974d45b5553035aeabe8a98a667718482d5.camel@pengutronix.de>
From: Sui Jingfeng <suijingfeng@loongson.cn>
Organization: Loongson
In-Reply-To: <85565974d45b5553035aeabe8a98a667718482d5.camel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf8Dx87Bhm3hkq02EAA--.18683S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBjvJXoW7Kw1rtF15ZF48uF1fGFW8tFb_yoW8tw4UpF
 s7J3W5GrWUury0k347Xr1DGrsakr1Iy3W2k3ZYvF92vrn8uF1kKw4YkrWYg3Wrur10qFWF
 kw4UGr4qka4F9FDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 bIkYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
 1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
 wVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4
 x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26F4UJVW0owAS
 0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc02F40EFcxC0V
 AKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Cr0_Gr1U
 McvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1cAE67vIY487Mx
 AIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_
 Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwI
 xGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8
 JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Cr0_Gr1UMIIF0x
 vEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07URE_tUUUUU=
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
Cc: loongson-kernel@lists.loongnix.cn, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, etnaviv@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 2023/6/1 02:07, Lucas Stach wrote:
>> +static int etnaviv_gpu_clk_get(struct etnaviv_gpu *gpu)
>> +{
>> +	struct device *dev = gpu->dev;
>> +
>> +	if (gpu->no_clk)
>> +		return 0;
>> +
>> +	gpu->clk_reg = devm_clk_get_optional(dev, "reg");
>> +	DBG("clk_reg: %p", gpu->clk_reg);
>> +	if (IS_ERR(gpu->clk_reg))
>> +		return PTR_ERR(gpu->clk_reg);
>> +
>> +	gpu->clk_bus = devm_clk_get_optional(dev, "bus");
>> +	DBG("clk_bus: %p", gpu->clk_bus);
>> +	if (IS_ERR(gpu->clk_bus))
>> +		return PTR_ERR(gpu->clk_bus);
>> +
>> +	gpu->clk_core = devm_clk_get(dev, "core");
>> +	DBG("clk_core: %p", gpu->clk_core);
>> +	if (IS_ERR(gpu->clk_core))
>> +		return PTR_ERR(gpu->clk_core);
>> +	gpu->base_rate_core = clk_get_rate(gpu->clk_core);
>> +
>> +	gpu->clk_shader = devm_clk_get_optional(dev, "shader");
>> +	DBG("clk_shader: %p", gpu->clk_shader);
>> +	if (IS_ERR(gpu->clk_shader))
>> +		return PTR_ERR(gpu->clk_shader);
>> +	gpu->base_rate_shader = clk_get_rate(gpu->clk_shader);
>> +
>> +	return 0;
>> +}
>> +
>>   static int etnaviv_gpu_clk_enable(struct etnaviv_gpu *gpu)
>>   {
>>   	int ret;
>>   
>> +	if (gpu->no_clk)
>> +		return 0;
>> +
> I don't see why this would be needed?
I have just tested, this do not needed.
> If your platform doesn't provide
> CONFIG_HAVE_CLK all those functions should be successful no-ops, so
> there is no need to special case this in the driver.

My platform do enable CONFIG_HAVE_CLK,

for ls3a5000 + ls7a1000, my system do not provide device tree support,

that's is to say, there is no DT support.


For ls3a4000 + ls7a1000 platform, the system has DT support, but don't 
has CLK drivers implement toward the clock tree.

typically, our platform's firmware will do such thing(setting a default 
working frequency).


When I first saw etnaviv, I'm also astonishing.

I don't know why there so much clock controllable.

As far as I can understand, my system/hardware have only one clock,

It shall corresponding to the core clk.

> Or does your platform in fact provide a clk subsystem, just the GPU
> clocks are managed by it?
>
> Also all those functions are fine with being called on a NULL clk, so
> shouldn't it be enough to simply avoid calling etnaviv_gpu_clk_get() in
> the PCI device case?
>
> Regards,
> Lucas
>
-- 
Jingfeng

