Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D4BD750E5E
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 18:24:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26CA810E596;
	Wed, 12 Jul 2023 16:24:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id C176410E593
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 16:23:59 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8DxxPCd065klBMEAA--.11727S3;
 Thu, 13 Jul 2023 00:23:57 +0800 (CST)
Received: from [10.20.42.43] (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8CxbSOc065kAcEqAA--.5919S3; 
 Thu, 13 Jul 2023 00:23:56 +0800 (CST)
Message-ID: <30815d16-9674-e989-af16-b7e82442fada@loongson.cn>
Date: Thu, 13 Jul 2023 00:23:56 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH RFC v1 00/52] drm/crtc: Rename struct drm_crtc::dev to
 drm_dev
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Maxime Ripard <mripard@kernel.org>
References: <20230712094702.1770121-1-u.kleine-koenig@pengutronix.de>
 <94eb6e4d-9384-152f-351b-ebb217411da9@amd.com>
 <20230712110253.paoyrmcbvlhpfxbf@pengutronix.de>
 <o3dc4q27ap6rajsvpfwfvs3z3afekkwbhnclvswkaietciy2kc@unjf67gz5tur>
 <20230712133803.rf26cbg5wz7wsmgl@pengutronix.de>
From: Sui Jingfeng <suijingfeng@loongson.cn>
In-Reply-To: <20230712133803.rf26cbg5wz7wsmgl@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8CxbSOc065kAcEqAA--.5919S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoWxWw1Uur1fuw4DJw1fuFy5KFX_yoW5urWrpF
 W5tFZ0kF4vqrsIyr9rZw10gF1Fgw4ftryrX345X3409398CF17XFWxKrn8Cas8WrZ3Wr1a
 grs0qas5CFWDZFXCm3ZEXasCq-sJn29KB7ZKAUJUUUU7529EdanIXcx71UUUUU7KY7ZEXa
 sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
 0xBIdaVrnRJUUU9Eb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
 IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
 e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
 0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVWUJVW8JwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
 Jr0_Gr1ln4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2
 x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r126r1D
 McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7
 I2V7IY0VAS07AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8
 JwCFI7km07C267AKxVWUXVWUAwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14
 v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY
 67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2
 IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_
 Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8q2NtUUUUU==
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
Cc: Xinliang Liu <xinliang.liu@linaro.org>,
 Alexey Kodanev <aleksei.kodanev@bell-sw.com>, dri-devel@lists.freedesktop.org,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,


Thanks for you patch, I'm here join to the discussion.

I will express my opinion, educate me if I'm wrong.


My understanding is that drm_device is not really a device like 
pci_device and platform_device.

the name 'dev' is generally refer to 'struct device *'.


So I think, the name 'drm' or 'ddev' is more better than 'drm_dev', and 
easy to type.

'drm_dev' is looks ugly.


Try to find a best name you love and replace all.

No union please, that is just a grammar sugar.  Personally I don't want it.


On 2023/7/12 21:38, Uwe Kleine-König wrote:
> Hello Maxime,
>
> On Wed, Jul 12, 2023 at 02:52:38PM +0200, Maxime Ripard wrote:
>> On Wed, Jul 12, 2023 at 01:02:53PM +0200, Uwe Kleine-König wrote:
>>>> Background is that this makes merge conflicts easier to handle and detect.
>>> Really?
>> FWIW, I agree with Christian here.
>>
>>> Each file (apart from include/drm/drm_crtc.h) is only touched once. So
>>> unless I'm missing something you don't get less or easier conflicts by
>>> doing it all in a single patch. But you gain the freedom to drop a
>>> patch for one driver without having to drop the rest with it.
>> Not really, because the last patch removed the union anyway. So you have
>> to revert both the last patch, plus that driver one. And then you need
>> to add a TODO to remove that union eventually.
> Yes, with a single patch you have only one revert (but 194 files changed,
> 1264 insertions(+), 1296 deletions(-)) instead of two (one of them: 1
> file changed, 9 insertions(+), 1 deletion(-); the other maybe a bit
> bigger). (And maybe you get away with just reverting the last patch.)
>
> With a single patch the TODO after a revert is "redo it all again (and
> prepare for a different set of conflicts)" while with the split series
> it's only "fix that one driver that was forgotten/borked" + reapply that
> 10 line patch. As the one who gets that TODO, I prefer the latter.
>
> So in sum: If your metric is "small count of reverted commits", you're
> right. If however your metric is: Better get 95% of this series' change
> in than maybe 0%, the split series is the way to do it.
>
> With me having spend ~3h on this series' changes, it's maybe
> understandable that I did it the way I did.
>
> FTR: This series was created on top of v6.5-rc1.


I think,  this series should be able applied to drm-tip or drm-misc.

And should pass the compile test.


>   If you apply it to
> drm-misc-next you get a (trivial) conflict in patch #2. If I consider to
> be the responsible maintainer who applies this series, I like being able
> to just do git am --skip then.
>
> FTR#2: In drm-misc-next is a new driver
> (drivers/gpu/drm/loongson/lsdc_crtc.c) so skipping the last patch for
> now might indeed be a good idea.


No, that driver should be nuked together if this series is going to be 
applied(after get acked-by and/or reviewed-by).

Please don't leave that driver alone there.


>>> So I still like the split version better, but I'm open to a more
>>> verbose reasoning from your side.
>> You're doing only one thing here, really: you change the name of a
>> structure field. If it was shared between multiple maintainers, then
>> sure, splitting that up is easier for everyone, but this will go through
>> drm-misc, so I can't see the benefit it brings.
> I see your argument, but I think mine weights more.
>
> Best regards
> Uwe
>

