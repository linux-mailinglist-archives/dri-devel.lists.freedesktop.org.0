Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D728873FA10
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jun 2023 12:20:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8051A10E2DC;
	Tue, 27 Jun 2023 10:20:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0151F10E2DA;
 Tue, 27 Jun 2023 10:20:21 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8Axjsfkt5pkJgoDAA--.4893S3;
 Tue, 27 Jun 2023 18:20:20 +0800 (CST)
Received: from [10.20.42.43] (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Cx7yPit5pkZ9sLAA--.7773S3; 
 Tue, 27 Jun 2023 18:20:18 +0800 (CST)
Message-ID: <c343d5d5-de87-089a-74b3-ca47089002b0@loongson.cn>
Date: Tue, 27 Jun 2023 18:20:18 +0800
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
 <87jzvqy897.fsf@intel.com> <5aee218e-2e46-b929-f905-a28794caac8c@loongson.cn>
 <87bkh1tfkl.fsf@intel.com>
From: Sui Jingfeng <suijingfeng@loongson.cn>
Organization: Loongson
In-Reply-To: <87bkh1tfkl.fsf@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Cx7yPit5pkZ9sLAA--.7773S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoW3JF4UJr45ZF45WFy3Kw15GFX_yoWxCw18pF
 43Ga4FkrWktrW5KrW2vF47WFyfta17tw1xur9rKw13Wwn0vF97tF98JFWUC34UZrW8CF1F
 v3Z8Xay7uFy8CrcCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
 sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
 0xBIdaVrnRJUUU9vb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
 IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
 e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
 0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
 xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
 1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv
 67AKxVWxJVW8Jr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxk0xIA0c2IEe2
 xFo4CEbIxvr21l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xF
 xVAFwI0_Wrv_ZF1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWw
 C2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_
 JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJV
 WUCwCI42IY6I8E87Iv67AKxVWxJVW8Jr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUv
 cSsGvfC2KfnxnUUI43ZEXa7IU1pVbDUUUUU==
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

On 2023/6/27 17:33, Jani Nikula wrote:
> On Tue, 27 Jun 2023, Sui Jingfeng <suijingfeng@loongson.cn> wrote:
>> Hi,
>>
>> On 2023/6/26 15:48, Jani Nikula wrote:
>>> On Sun, 25 Jun 2023, Sui Jingfeng <suijingfeng@loongson.cn> wrote:
>>>> As this function can be replaced with drm_dev_unregister() + drm_dev_put(),
>>>> it is already marked as deprecated, so remove it. No functional change.
>>>>
>>>> Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
>>>> ---
>>>>    drivers/gpu/drm/drm_drv.c           | 28 ----------------------------
>>>>    drivers/gpu/drm/drm_pci.c           |  3 ++-
>>>>    drivers/gpu/drm/radeon/radeon_drv.c |  3 ++-
>>>>    include/drm/drm_drv.h               |  1 -
>>>>    4 files changed, 4 insertions(+), 31 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
>>>> index 12687dd9e1ac..5057307fe22a 100644
>>>> --- a/drivers/gpu/drm/drm_drv.c
>>>> +++ b/drivers/gpu/drm/drm_drv.c
>>>> @@ -406,34 +406,6 @@ void drm_minor_release(struct drm_minor *minor)
>>>>     * possibly leaving the hardware enabled.
>>>>     */
>>>>    
>>>> -/**
>>>> - * drm_put_dev - Unregister and release a DRM device
>>>> - * @dev: DRM device
>>>> - *
>>>> - * Called at module unload time or when a PCI device is unplugged.
>>>> - *
>>>> - * Cleans up all DRM device, calling drm_lastclose().
>>>> - *
>>>> - * Note: Use of this function is deprecated. It will eventually go away
>>>> - * completely.  Please use drm_dev_unregister() and drm_dev_put() explicitly
>>>> - * instead to make sure that the device isn't userspace accessible any more
>>>> - * while teardown is in progress, ensuring that userspace can't access an
>>>> - * inconsistent state.
>>> The last sentence is the crucial one. While the patch has no functional
>>> changes,
>> But my patch help to save a useless check(if (!dev))
>>
>> on where we found the check is not necessary.
>>
>> ```
>>
>> -	if (!dev) {
>> -		DRM_ERROR("cleanup called no dev\n");
>> -		return;
>> -	}
>>
>> ```
>>
>>
>>> I believe the goal never was to just mechanically replace one
>>> call with the two.
>> The DRM core lose nothing, just a function wrapper.
>>
>> Instead, this is probably a good chance to migrate the burden to the
>> driver side.
> The point is to *fix* this stuff while doing the conversion. Anyone can
> replace one function call with two, but that's just brushing the problem
> under the carpet.

Interesting!

To be honest, I love you reviews.


I think, I probably be able to solve more practical problem,

This patch is just a trivial, I don't care much.


Can you help to have a look at my vgaarb patch set [1]

[1] https://patchwork.freedesktop.org/series/119250/

Really need you guidance there.


> The current state is that we have a function the use of which is
> potentially problematic, it's documented, and we can trivially locate
> all the call sites.

I can merge the document to comments of the drm_dev_unregister() function,

remove the drm_put_dev function only. What do you think about this?

> After your change, we've lost that information, and we haven't fixed
> anything.
>
My understanding is that drm_dev_unregister() alone is enough to stop 
the user-space

program accessing the kernel interface exposed.

```

radeon_pci_remove(struct pci_dev *pdev)

{

      // should be called first in the pci remove funcition

     drm_dev_unregister(dev);

     // do the various(necessary) cleanup and free resource allocated


     // call this function at the bottom of the radeon_pci_remove() function

     drm_dev_put(dev);

}

```


And the drm_dev_unregister() function already told us, see below:


```
/**
  * drm_dev_unregister - Unregister DRM device
  * @dev: Device to unregister
  *
  * Unregister the DRM device from the system. This does the reverse of
  * drm_dev_register() but does not deallocate the device. The caller 
must call
  * drm_dev_put() to drop their final reference, unless it is managed 
with devres
  * (as devices allocated with devm_drm_dev_alloc() are), in which case 
there is
  * already an unwind action registered.
  *
  * A special form of unregistering for hotpluggable devices is 
drm_dev_unplug(),
  * which can be called while there are still open users of @dev.
  *
  * This should be called first in the device teardown code to make sure
  * userspace can't access the device instance any more.
  */
void drm_dev_unregister(struct drm_device *dev)

...

```


Thanks for the interesting remark again.

> BR,
> Jani.
>
>
>> I think the device driver(drm/radeon, for example) have better understanding
>>
>> about how to ensure that userspace can't access an inconsistent state
>> than the DRM core.
>>
>>> BR,
>>> Jani.
>>>
>>>
>>>> - */
>>>> -void drm_put_dev(struct drm_device *dev)
>>>> -{
>>>> -	DRM_DEBUG("\n");
>>>> -
>>>> -	if (!dev) {
>>>> -		DRM_ERROR("cleanup called no dev\n");
>>>> -		return;
>>>> -	}
>>>> -
>>>> -	drm_dev_unregister(dev);
>>>> -	drm_dev_put(dev);
>>>> -}
>>>> -EXPORT_SYMBOL(drm_put_dev);
>>>> -
>>>>    /**
>>>>     * drm_dev_enter - Enter device critical section
>>>>     * @dev: DRM device
>>>> diff --git a/drivers/gpu/drm/drm_pci.c b/drivers/gpu/drm/drm_pci.c
>>>> index 39d35fc3a43b..b3a68a92eaa6 100644
>>>> --- a/drivers/gpu/drm/drm_pci.c
>>>> +++ b/drivers/gpu/drm/drm_pci.c
>>>> @@ -257,7 +257,8 @@ void drm_legacy_pci_exit(const struct drm_driver *driver,
>>>>    					 legacy_dev_list) {
>>>>    			if (dev->driver == driver) {
>>>>    				list_del(&dev->legacy_dev_list);
>>>> -				drm_put_dev(dev);
>>>> +				drm_dev_unregister(dev);
>>>> +				drm_dev_put(dev);
>>>>    			}
>>>>    		}
>>>>    		mutex_unlock(&legacy_dev_list_lock);
>>>> diff --git a/drivers/gpu/drm/radeon/radeon_drv.c b/drivers/gpu/drm/radeon/radeon_drv.c
>>>> index e4374814f0ef..a4955ae10659 100644
>>>> --- a/drivers/gpu/drm/radeon/radeon_drv.c
>>>> +++ b/drivers/gpu/drm/radeon/radeon_drv.c
>>>> @@ -357,7 +357,8 @@ radeon_pci_remove(struct pci_dev *pdev)
>>>>    {
>>>>    	struct drm_device *dev = pci_get_drvdata(pdev);
>>>>    
>>>> -	drm_put_dev(dev);
>>>> +	drm_dev_unregister(dev);
>>>> +	drm_dev_put(dev);
>>>>    }
>>>>    
>>>>    static void
>>>> diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
>>>> index 89e2706cac56..289c97b12e82 100644
>>>> --- a/include/drm/drm_drv.h
>>>> +++ b/include/drm/drm_drv.h
>>>> @@ -511,7 +511,6 @@ void drm_dev_unregister(struct drm_device *dev);
>>>>    
>>>>    void drm_dev_get(struct drm_device *dev);
>>>>    void drm_dev_put(struct drm_device *dev);
>>>> -void drm_put_dev(struct drm_device *dev);
>>>>    bool drm_dev_enter(struct drm_device *dev, int *idx);
>>>>    void drm_dev_exit(int idx);
>>>>    void drm_dev_unplug(struct drm_device *dev);

-- 
Jingfeng

