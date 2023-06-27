Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EEA7C73F81A
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jun 2023 11:04:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 249EB10E2CA;
	Tue, 27 Jun 2023 09:04:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id C24F310E2C7;
 Tue, 27 Jun 2023 09:04:44 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8Cxbccrpppk2PcCAA--.4634S3;
 Tue, 27 Jun 2023 17:04:43 +0800 (CST)
Received: from [10.20.42.43] (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8CxWM0qpppkUbkLAA--.48575S3; 
 Tue, 27 Jun 2023 17:04:42 +0800 (CST)
Message-ID: <5aee218e-2e46-b929-f905-a28794caac8c@loongson.cn>
Date: Tue, 27 Jun 2023 17:04:42 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] drm: Remove the deprecated drm_put_dev() function
Content-Language: en-US
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>, Pan Xinhui <Xinhui.Pan@amd.com>
References: <20230625050901.393055-1-suijingfeng@loongson.cn>
 <87jzvqy897.fsf@intel.com>
From: Sui Jingfeng <suijingfeng@loongson.cn>
Organization: Loongson
In-Reply-To: <87jzvqy897.fsf@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8CxWM0qpppkUbkLAA--.48575S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoWxAFW7Gr1rAw47Xr13KFW8KrX_yoWrWFy7pF
 43Aa4FkrW8tFZ8KrW7ZFnrCFy3Xa17Ka4xury7Gw13Ww1qvry7tF98JFy8GryUXrWkCF1S
 vF98XFyUuFy8CrcCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
 sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
 0xBIdaVrnRJUUUPab4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
 IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
 e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
 0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
 xVW8Jr0_Cr1UM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07
 AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWU
 tVWrXwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI4
 8JMxk0xIA0c2IEe2xFo4CEbIxvr21lc7CjxVAaw2AFwI0_JF0_Jw1l42xK82IYc2Ij64vI
 r41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_Jw0_GFylx2IqxVAqx4xG67
 AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIY
 rxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Gr0_Xr1lIxAIcVC0I7IYx2IY6xkF7I0E14
 v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWx
 JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUxhiSDU
 UUU
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
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 2023/6/26 15:48, Jani Nikula wrote:
> On Sun, 25 Jun 2023, Sui Jingfeng <suijingfeng@loongson.cn> wrote:
>> As this function can be replaced with drm_dev_unregister() + drm_dev_put(),
>> it is already marked as deprecated, so remove it. No functional change.
>>
>> Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
>> ---
>>   drivers/gpu/drm/drm_drv.c           | 28 ----------------------------
>>   drivers/gpu/drm/drm_pci.c           |  3 ++-
>>   drivers/gpu/drm/radeon/radeon_drv.c |  3 ++-
>>   include/drm/drm_drv.h               |  1 -
>>   4 files changed, 4 insertions(+), 31 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
>> index 12687dd9e1ac..5057307fe22a 100644
>> --- a/drivers/gpu/drm/drm_drv.c
>> +++ b/drivers/gpu/drm/drm_drv.c
>> @@ -406,34 +406,6 @@ void drm_minor_release(struct drm_minor *minor)
>>    * possibly leaving the hardware enabled.
>>    */
>>   
>> -/**
>> - * drm_put_dev - Unregister and release a DRM device
>> - * @dev: DRM device
>> - *
>> - * Called at module unload time or when a PCI device is unplugged.
>> - *
>> - * Cleans up all DRM device, calling drm_lastclose().
>> - *
>> - * Note: Use of this function is deprecated. It will eventually go away
>> - * completely.  Please use drm_dev_unregister() and drm_dev_put() explicitly
>> - * instead to make sure that the device isn't userspace accessible any more
>> - * while teardown is in progress, ensuring that userspace can't access an
>> - * inconsistent state.
> The last sentence is the crucial one. While the patch has no functional
> changes,

But my patch help to save a useless check(if (!dev))

on where we found the check is not necessary.

```

-	if (!dev) {
-		DRM_ERROR("cleanup called no dev\n");
-		return;
-	}

```


> I believe the goal never was to just mechanically replace one
> call with the two.

The DRM core lose nothing, just a function wrapper.

Instead, this is probably a good chance to migrate the burden to the 
driver side.

I think the device driver(drm/radeon, for example) have better understanding

about how to ensure that userspace can't access an inconsistent state 
than the DRM core.

>
> BR,
> Jani.
>
>
>> - */
>> -void drm_put_dev(struct drm_device *dev)
>> -{
>> -	DRM_DEBUG("\n");
>> -
>> -	if (!dev) {
>> -		DRM_ERROR("cleanup called no dev\n");
>> -		return;
>> -	}
>> -
>> -	drm_dev_unregister(dev);
>> -	drm_dev_put(dev);
>> -}
>> -EXPORT_SYMBOL(drm_put_dev);
>> -
>>   /**
>>    * drm_dev_enter - Enter device critical section
>>    * @dev: DRM device
>> diff --git a/drivers/gpu/drm/drm_pci.c b/drivers/gpu/drm/drm_pci.c
>> index 39d35fc3a43b..b3a68a92eaa6 100644
>> --- a/drivers/gpu/drm/drm_pci.c
>> +++ b/drivers/gpu/drm/drm_pci.c
>> @@ -257,7 +257,8 @@ void drm_legacy_pci_exit(const struct drm_driver *driver,
>>   					 legacy_dev_list) {
>>   			if (dev->driver == driver) {
>>   				list_del(&dev->legacy_dev_list);
>> -				drm_put_dev(dev);
>> +				drm_dev_unregister(dev);
>> +				drm_dev_put(dev);
>>   			}
>>   		}
>>   		mutex_unlock(&legacy_dev_list_lock);
>> diff --git a/drivers/gpu/drm/radeon/radeon_drv.c b/drivers/gpu/drm/radeon/radeon_drv.c
>> index e4374814f0ef..a4955ae10659 100644
>> --- a/drivers/gpu/drm/radeon/radeon_drv.c
>> +++ b/drivers/gpu/drm/radeon/radeon_drv.c
>> @@ -357,7 +357,8 @@ radeon_pci_remove(struct pci_dev *pdev)
>>   {
>>   	struct drm_device *dev = pci_get_drvdata(pdev);
>>   
>> -	drm_put_dev(dev);
>> +	drm_dev_unregister(dev);
>> +	drm_dev_put(dev);
>>   }
>>   
>>   static void
>> diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
>> index 89e2706cac56..289c97b12e82 100644
>> --- a/include/drm/drm_drv.h
>> +++ b/include/drm/drm_drv.h
>> @@ -511,7 +511,6 @@ void drm_dev_unregister(struct drm_device *dev);
>>   
>>   void drm_dev_get(struct drm_device *dev);
>>   void drm_dev_put(struct drm_device *dev);
>> -void drm_put_dev(struct drm_device *dev);
>>   bool drm_dev_enter(struct drm_device *dev, int *idx);
>>   void drm_dev_exit(int idx);
>>   void drm_dev_unplug(struct drm_device *dev);

-- 
Jingfeng

