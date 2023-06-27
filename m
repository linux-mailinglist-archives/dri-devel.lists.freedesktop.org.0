Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F16C273F791
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jun 2023 10:41:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E215410E008;
	Tue, 27 Jun 2023 08:41:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id A256510E2B6;
 Tue, 27 Jun 2023 08:41:38 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8CxLMe_oJpkcPYCAA--.4609S3;
 Tue, 27 Jun 2023 16:41:35 +0800 (CST)
Received: from [10.20.42.43] (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8AxzyO_oJpknq4LAA--.7367S3; 
 Tue, 27 Jun 2023 16:41:35 +0800 (CST)
Message-ID: <766f323a-efcf-6552-f7e5-a736830c3f12@loongson.cn>
Date: Tue, 27 Jun 2023 16:41:35 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] drm: Remove the deprecated drm_put_dev() function
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>, Pan Xinhui <Xinhui.Pan@amd.com>
References: <20230625050901.393055-1-suijingfeng@loongson.cn>
 <4672fc8d-ca95-6d00-1303-cb5968c51703@suse.de>
From: Sui Jingfeng <suijingfeng@loongson.cn>
Organization: Loongson
In-Reply-To: <4672fc8d-ca95-6d00-1303-cb5968c51703@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8AxzyO_oJpknq4LAA--.7367S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoW3Xr48Jw1UGr4Uur4fZw1kWFX_yoW7uF4fpF
 s3JFyrtrWUtFs5Gr17JF17CFy5Jw47t3WfWr18Ga43Wrs8Ary0qF9xXry0gryUJrW8Ar1F
 yF15XF1UZFyUCFcCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
 sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
 0xBIdaVrnRJUUUvIb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
 IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
 e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
 0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
 xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
 1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv
 67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07
 AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02
 F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GF
 ylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7Cj
 xVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r
 4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07j5
 WrAUUUUU=
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
Cc: amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 2023/6/26 15:56, Thomas Zimmermann wrote:
> Hi
>
> Am 25.06.23 um 07:09 schrieb Sui Jingfeng:
>> As this function can be replaced with drm_dev_unregister() + 
>> drm_dev_put(),
>> it is already marked as deprecated, so remove it. No functional change.
>>
>> Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
>> ---
>>   drivers/gpu/drm/drm_drv.c           | 28 ----------------------------
>>   drivers/gpu/drm/drm_pci.c           |  3 ++-
>>   drivers/gpu/drm/radeon/radeon_drv.c |  3 ++-
>>   include/drm/drm_drv.h               |  1 -
>>   4 files changed, 4 insertions(+), 31 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
>> index 12687dd9e1ac..5057307fe22a 100644
>> --- a/drivers/gpu/drm/drm_drv.c
>> +++ b/drivers/gpu/drm/drm_drv.c
>> @@ -406,34 +406,6 @@ void drm_minor_release(struct drm_minor *minor)
>>    * possibly leaving the hardware enabled.
>>    */
>>   -/**
>> - * drm_put_dev - Unregister and release a DRM device
>> - * @dev: DRM device
>> - *
>> - * Called at module unload time or when a PCI device is unplugged.
>> - *
>> - * Cleans up all DRM device, calling drm_lastclose().
>> - *
>> - * Note: Use of this function is deprecated. It will eventually go away
>> - * completely.  Please use drm_dev_unregister() and drm_dev_put() 
>> explicitly
>> - * instead to make sure that the device isn't userspace accessible 
>> any more
>> - * while teardown is in progress, ensuring that userspace can't 
>> access an
>> - * inconsistent state.
>> - */
>> -void drm_put_dev(struct drm_device *dev)
>> -{
>> -    DRM_DEBUG("\n");
>> -
>> -    if (!dev) {
>> -        DRM_ERROR("cleanup called no dev\n");
>> -        return;
>> -    }
>> -
>> -    drm_dev_unregister(dev);
>> -    drm_dev_put(dev);
>> -}
>> -EXPORT_SYMBOL(drm_put_dev);
>> -
>>   /**
>>    * drm_dev_enter - Enter device critical section
>>    * @dev: DRM device
>> diff --git a/drivers/gpu/drm/drm_pci.c b/drivers/gpu/drm/drm_pci.c
>> index 39d35fc3a43b..b3a68a92eaa6 100644
>> --- a/drivers/gpu/drm/drm_pci.c
>> +++ b/drivers/gpu/drm/drm_pci.c
>> @@ -257,7 +257,8 @@ void drm_legacy_pci_exit(const struct drm_driver 
>> *driver,
>>                        legacy_dev_list) {
>>               if (dev->driver == driver) {
>>                   list_del(&dev->legacy_dev_list);
>> -                drm_put_dev(dev);
>> +                drm_dev_unregister(dev);
>> +                drm_dev_put(dev);
>>               }
>>           }
>>           mutex_unlock(&legacy_dev_list_lock);
>> diff --git a/drivers/gpu/drm/radeon/radeon_drv.c 
>> b/drivers/gpu/drm/radeon/radeon_drv.c
>> index e4374814f0ef..a4955ae10659 100644
>> --- a/drivers/gpu/drm/radeon/radeon_drv.c
>> +++ b/drivers/gpu/drm/radeon/radeon_drv.c
>> @@ -357,7 +357,8 @@ radeon_pci_remove(struct pci_dev *pdev)
>>   {
>>       struct drm_device *dev = pci_get_drvdata(pdev);
>>   -    drm_put_dev(dev);
>
> Did you verify that dev cannot be NULL here? There was a check in 
> drm_put_dev() for !dev.
>

I have verified :


1)

If there is no radeon card(say R5-340) mounted in the system,  I 
modprobe the radeon.ko manually.

then both the radeon_pci_probe() and the radeon_pci_remove() function 
won't get called.

There is no chance that the driver_probe_device() function getting called.


|- driver_register()

|-- bus_add_driver()

|--- driver_attach()

|---- bus_for_each_dev(drv->bus, NULL, drv, __driver_attach)

|----- __driver_attach()

|------ __device_attach_driver()

// There is no chance that the driver_probe_device() function get called.

|------- driver_probe_device(drv, dev)

```


2)  normal case:


If there are radeon cards mounted in the system,

then as long as the pci_set_drvdata(pdev, dev) get called,

the 'driver_data' member of struct device will hold the pointer to the 
'struct drm_device';

So, it will be fine as long as the radeon.ko get loaded normally.


I'm sure it will works as expected on normal case, with 100% confident.


3) Abnormal case

If there is a error happen before the 'pci_set_drvdata(pdev, dev)' 
function get called.

It is also don't need to worry, if the ->probe() failed, then the 
->remove will be get called.


I have verified that

if the ->probe() failed, then the ->remove will be get called.

I'm doing the test by add a line before the drm_dev_alloc()

function in the body of radeon_pci_probe() function.

See below:

```

     return -ENODEV;

     dev = drm_dev_alloc(&kms_driver, &pdev->dev);
     if (IS_ERR(dev))
         return PTR_ERR(dev);

     ret = pci_enable_device(pdev);
     if (ret)
         goto err_free;
```


So, there is no problem, as far as I can see.


> Best regards
> Thomas
>
>> +    drm_dev_unregister(dev);
>> +    drm_dev_put(dev);
>>   }
>>     static void
>> diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
>> index 89e2706cac56..289c97b12e82 100644
>> --- a/include/drm/drm_drv.h
>> +++ b/include/drm/drm_drv.h
>> @@ -511,7 +511,6 @@ void drm_dev_unregister(struct drm_device *dev);
>>     void drm_dev_get(struct drm_device *dev);
>>   void drm_dev_put(struct drm_device *dev);
>> -void drm_put_dev(struct drm_device *dev);
>>   bool drm_dev_enter(struct drm_device *dev, int *idx);
>>   void drm_dev_exit(int idx);
>>   void drm_dev_unplug(struct drm_device *dev);
>
-- 
Jingfeng

