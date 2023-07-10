Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E4AB74D4A4
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jul 2023 13:34:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08A9110E276;
	Mon, 10 Jul 2023 11:34:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id E39FC10E274
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jul 2023 11:34:48 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8DxRvHW7KtkBB8DAA--.9304S3;
 Mon, 10 Jul 2023 19:34:47 +0800 (CST)
Received: from [10.20.42.43] (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8DxviPE7Ktk5DwnAA--.5489S3; 
 Mon, 10 Jul 2023 19:34:45 +0800 (CST)
Message-ID: <8182fecd-d290-293a-d963-ddbea79dbf03@loongson.cn>
Date: Mon, 10 Jul 2023 19:34:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] drm/loongson: Remove a useless check in
 cursor_plane_atomic_async_check()
To: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Li Yi <liyi@loongson.cn>
References: <20230710102411.257970-1-suijingfeng@loongson.cn>
 <6c7bbce7-5521-b868-019f-bce26f309730@suse.de>
Content-Language: en-US
From: suijingfeng <suijingfeng@loongson.cn>
In-Reply-To: <6c7bbce7-5521-b868-019f-bce26f309730@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8DxviPE7Ktk5DwnAA--.5489S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoWxCr1DKF47Gw4UWr1kWw17urX_yoWrJF1kpr
 WkJry8CrWUJr1xJr9rJr1Utry5uw47tw1xWF1UJF1UtFWUtr1Yqr1UXryjgr4UArW8Gr1U
 Jr1UJFn8ZF1UtrcCm3ZEXasCq-sJn29KB7ZKAUJUUUUx529EdanIXcx71UUUUU7KY7ZEXa
 sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
 0xBIdaVrnRJUUUPSb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
 IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
 e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
 0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
 xVW8Jr0_Cr1UM2kKe7AKxVWUAVWUtwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07
 AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWU
 AVWUtwAv7VC2z280aVAFwI0_Cr0_Gr1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwI
 xGrwCYjI0SjxkI62AI1cAE67vIY487MxkF7I0En4kS14v26r126r1DMxAIw28IcxkI7VAK
 I48JMxC20s026xCaFVCjc4AY6r1j6r4UMxCIbckI1I0E14v26r126r1DMI8I3I0E5I8CrV
 AFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCI
 c40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1I6r4UMIIF0xvE2Ix0cI8IcVCY1x0267
 AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_
 Cr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU8YYLP
 UUUUU==
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
Cc: loongson-kernel@lists.loongnix.cn, Dan Carpenter <dan.carpenter@linaro.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 2023/7/10 18:39, Thomas Zimmermann wrote:
>
>
> Am 10.07.23 um 12:24 schrieb Sui Jingfeng:
>> Because smatch warnings:
>>
>> drivers/gpu/drm/loongson/lsdc_plane.c:199
>> lsdc_cursor_plane_atomic_async_check()
>> warn: variable dereferenced before check 'state' (see line 180)
>>
>> vim +/state +199 drivers/gpu/drm/loongson/lsdc_plane.c
>>
>> 174  static int
>>       lsdc_cursor_plane_atomic_async_check(struct drm_plane *plane,
>> 175                                       struct drm_atomic_state 
>> *state)
>> 176  {
>> 177          struct drm_plane_state *new_state;
>> 178          struct drm_crtc_state *crtc_state;
>> 179
>> 180          new_state = drm_atomic_get_new_plane_state(state, plane);
>>                                                          ^^^^^
>> state is dereferenced inside this function
>>
>> 181
>> 182  if (!plane->state || !plane->state->fb) {
>> 183          drm_dbg(plane->dev, "%s: state is NULL\n", plane->name);
>> 184                  return -EINVAL;
>> 185  }
>> 186
>> 187  if (new_state->crtc_w != new_state->crtc_h) {
>> 188          drm_dbg(plane->dev, "unsupported cursor size: %ux%u\n",
>> 189                  new_state->crtc_w, new_state->crtc_h);
>> 190          return -EINVAL;
>> 191  }
>> 192
>> 193  if (new_state->crtc_w != 64 && new_state->crtc_w != 32) {
>> 194          drm_dbg(plane->dev, "unsupported cursor size: %ux%u\n",
>> 195                  new_state->crtc_w, new_state->crtc_h);
>> 196          return -EINVAL;
>> 197  }
>> 198
>> 199  if (state) {
>>           ^^^^^
>> Checked too late!
>>
>> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
>> Closes: https://lore.kernel.org/r/202307100423.rV7D05Uq-lkp@intel.com/
>> Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
>
> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
>
> BTW, you're posting these patches for loongson, 

I'm posting these patches for the drm/loongson driver in drm-misc and/or 
drm-tip branch,

what do you means for *loongson*,

> but that driver is not yet in our tree?
>

I already applied(push) drm/loongson driver to drm-misc-next branch,

What do you means that by "not yet in our tree", linux kernel side?

Am I missing something ?


> Best regards
> Thomas
>
>
>> ---
>>   drivers/gpu/drm/loongson/lsdc_plane.c | 8 +-------
>>   1 file changed, 1 insertion(+), 7 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/loongson/lsdc_plane.c 
>> b/drivers/gpu/drm/loongson/lsdc_plane.c
>> index 2ab3db982aa3..0d5094633222 100644
>> --- a/drivers/gpu/drm/loongson/lsdc_plane.c
>> +++ b/drivers/gpu/drm/loongson/lsdc_plane.c
>> @@ -196,13 +196,7 @@ static int 
>> lsdc_cursor_plane_atomic_async_check(struct drm_plane *plane,
>>           return -EINVAL;
>>       }
>>   -    if (state) {
>> -        crtc_state = drm_atomic_get_existing_crtc_state(state, 
>> new_state->crtc);
>> -    } else {
>> -        crtc_state = plane->crtc->state;
>> -        drm_dbg(plane->dev, "%s: atomic state is NULL\n", plane->name);
>> -    }
>> -
>> +    crtc_state = drm_atomic_get_existing_crtc_state(state, 
>> new_state->crtc);
>>       if (!crtc_state->active)
>>           return -EINVAL;
>

