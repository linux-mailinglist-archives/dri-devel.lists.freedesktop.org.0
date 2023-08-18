Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A8CC8780C4A
	for <lists+dri-devel@lfdr.de>; Fri, 18 Aug 2023 15:09:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B29210E505;
	Fri, 18 Aug 2023 13:09:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27BA810E505
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Aug 2023 13:09:41 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-4ff8a1746e0so1328798e87.0
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Aug 2023 06:09:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1692364179; x=1692968979;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GOVhLvGrhBNvKfFd2PSFClkLUOZNx9FiwdY0FkF4RfI=;
 b=oDhBMnE2PzZYabJXt252jAHUFgMpIxiuZgvUH60KF7xRpHIUwtQJUllI8szngsGduQ
 mJ74hTAOFBLDHffHZOJS14l2bMswJ0L2+2flHD6xy2e9goWthd3se2wiZPiNJoVeTdYC
 GaY37OYPXmP3kVqNazDAIx1PbjkJOB2NJxb/ghCwgPqs0h9vLgfUEsgNM5KD+pCWIddI
 Eyx+V8GqN3UW0vbMzNlqQkbieQS9ugAGpN6UBaWKxLfXBi+vIWj2MB20iJO1zPH2rNPu
 QxTn0HSfNvyQvXTwiVWy7+D8drrr2c3R7SPDdRGx6lnI3lOG2FCED+LVRaH2QSz7At9r
 iVIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692364179; x=1692968979;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GOVhLvGrhBNvKfFd2PSFClkLUOZNx9FiwdY0FkF4RfI=;
 b=UpUXtf9FI/sY6J+fR9dI6yYT3UGcDRf/PGwJs6oUIv35blCH40JVILvvFkV9e3lOx1
 qVpQSKUmnZHLtYTJhtGxnG9m0+7aQdancZyh9mRyi/pe5K0qSDe9XREnbJ0avcyhTmRt
 YhvpHk/3ZdYmIoCCVRCO23S9/YzeQmHOWTY/2bvh/z8dIRSOalycf3/wWpvK7Fmd/jP+
 7gKouwQC6NBdsqGLRAkKClSuUy0GBOKOdgIW4gPMhBoqVSWyHsaxSjhfjp0/DqolIS99
 SMEekxg+4S4a/OJRwDWRZ3K6Is5jjIVhJYpzFpJ9Sy+dJJNZq79uUyi6Z4CqVfggEHfH
 9N3A==
X-Gm-Message-State: AOJu0YwgYMnkDulfEbf5C8py9jfFsQNCpRd1loJfdZVauBJGQMSoc+Vm
 Znyr7F70fQp4PeROuIsMxUjwyA==
X-Google-Smtp-Source: AGHT+IFHRB06OcJ5yOH57GQUlpgwT5Pga7gy8htvIBRiV9wXb8Pt8G/K/qyoPu8VZFK/F1q91ibotA==
X-Received: by 2002:ac2:43ce:0:b0:4ff:9eed:b68d with SMTP id
 u14-20020ac243ce000000b004ff9eedb68dmr1559661lfl.58.1692364179141; 
 Fri, 18 Aug 2023 06:09:39 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 f3-20020a19ae03000000b004fe13318aeesm334400lfc.166.2023.08.18.06.09.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Aug 2023 06:09:38 -0700 (PDT)
Message-ID: <08019512-ef6b-43c2-badf-a848fc738463@linaro.org>
Date: Fri, 18 Aug 2023 16:09:37 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] drm/sysfs: Link DRM connectors to corresponding Type-C
 connectors
Content-Language: en-GB
To: Won Chung <wonchung@google.com>, bleung@google.com, pmalani@chromium.org, 
 heikki.krogerus@linux.intel.com, imre.deak@intel.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, jani.nikula@linux.intel.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20221108185004.2263578-1-wonchung@google.com>
 <Y2uU9YUZYqbL4uB7@phenom.ffwll.local>
 <CAOvb9yh9e0ue+=gtsy1tq306vdyRfKwmmXQ9WGRjeMDnM2XjQw@mail.gmail.com>
 <Y24bcYJKGy/gd5fV@phenom.ffwll.local>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <Y24bcYJKGy/gd5fV@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/11/2022 11:52, Daniel Vetter wrote:
> On Thu, Nov 10, 2022 at 11:33:11AM -0800, Won Chung wrote:
>> Hi Daniel,
>>
>> Thank you very much for a review.
>>
>> On Wed, Nov 9, 2022 at 3:54 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>>>
>>> On Tue, Nov 08, 2022 at 06:50:04PM +0000, Won Chung wrote:
>>>> Create a symlink pointing to USB Type-C connector for DRM connectors
>>>> when they are created. The link will be created only if the firmware is
>>>> able to describe the connection beween the two connectors.

Generic question for this patch:

There can be several typec connectors and several DP connectors. Will 
this patch handle this correctly?

Moreover, if everything is bound through the fwnodes, it might be easier 
to set connector's device fwnode pointer to point to the corresponding 
connector's node. Then one can easily enumerate them without adding new 
uABI.


>>>>
>>>> Currently, even if a display uses a USB Type-C port, there is no way for
>>>> the userspace to find which port is used for which display. With the
>>>> symlink, display information would be accessible from Type-C connectors
>>>> and port information would be accessible from DRM connectors.
>>>> Associating the two subsystems, userspace would have potential to expose
>>>> and utilize more complex information, such as bandwidth used for a
>>>> specific USB Type-C port.
>>>>
>>>> Signed-off-by: Won Chung <wonchung@google.com>
>>>> Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
>>>> ---
>>>> Changes from v3:
>>>> - Append to the commit message on why this patch is needed
>>>>
>>>> Changes from v2:
>>>> - Resend the patch to dri-devel list
>>>>
>>>> Changes from v1:
>>>> - Fix multiple lines to single line
>>>
>>> We seem to be spinning wheels a bit here (or at least I'm missing a lot of
>>> important information from this series alone) with already at v4 but the
>>> fundamentals not answered:
>>>
>>> - where's the usb side of this, and anything we need to do in drivers?
>>>    This should all be one series, or if that's too big, then a link in the
>>>    cover letter for where to find all the other pieces
>>
>> We already have a framework in typec port-mapper.c where it goes
>> through component devices and runs the bind functions for those with
>> matching _PLD (physical location of device).
>> https://elixir.bootlin.com/linux/v5.18.1/source/drivers/usb/typec/port-mapper.c
>>
>> Currently, USB ports and USB4 ports are added as components to create
>> a symlink with Type C connector.
>> USB: https://lore.kernel.org/all/20211223082349.45616-1-heikki.krogerus@linux.intel.com/
>> USB4: https://lore.kernel.org/all/20220418175932.1809770-3-wonchung@google.com/
>>
>> Since these are already submitted, do you think it would be a good
>> idea to add the links in the commit message?
> 
> Hm yeah explaining this in the commit message with links should be good
> enough.
> 
> Another thing, will this hit the component nesting problem? With this
> change we'll have drm drivers which are both aggregates and components at
> the same time, and last time someone tried this it all deadlocked in
> component.c.

drm/msm uses components already. It wouldn't be nice to break it in this 
way. Not to mention that it doesn't use ACPI and so port-mapper.c is not 
used on this platform.

> 
>>> - since I'm guessing this is for cros, will this also work on standard
>>>    acpi x86 that are built for windows? arm with dt? Might be answered with
>>>    the full picture
>>
>> Yes this is for cros, but it should work on any ACPI x86 as long as
>> _PLD field for Type C connectors and DRM connectors are correctly
>> added to the firmware.
>>
>> Since _PLD is ACPI specific, we do not have ARM with DT supported at the moment.
>> In the future, if we find something similar to _PLD in DT, I think we
>> can also use that in typec port-mapper for component matching.
>>
>> Heikki@ Can you correct me if I am incorrect or missing something?
> 
> Ok sounds good, would be good to include this in the commit message, too.
>>
>>
>>>
>>> - you say this helps userspace, but how? Best way here is to just point at
>>>    the userspace change set that makes use of this link, code explains
>>>    concepts much more precisely than lots of words, and it's also easier to
>>>    review for corner cases that might be missed. That link also needs to be
>>>    in the commit message/cover letter somewhere, so people can find it.
>>
>> I do not have working code in the userspace yet since there is no
>> symlink created between Type C connector and DRM connector at the
>> moment.
>> If this patch is to go through, ChromeOS will parse the symlink in DRM
>> to find which Type C port got displays connected.
> 
> This isn't how new uapi works, we need to have the userspace together with
> the kernel changes. Otherwise ... how can you test that things actually
> work before we commit to the kernel change? Freezing down uapi on the
> promise that userspace will show up and that we're crossing fingers that
> it'll all work is not how we roll in drm.
> 
>> First use case is metrics collection.
>> We would like to know which port at which location is most preferred
>> to be used for displays.
>> We also want to see how many users charge the system on the same Type
>> C port as displays.
>> To answer these types of questions, we need to know which specific
>> display uses which specific Type C connector.
>>
>> Second use case is to get a better idea on USB-C pin assignments.
>> When a Type C port is in DP alt mode, there are some options on pin
>> assignments, whether to prioritize DP bandwidth vs USB Superspeed.
>> If we can find whether a display is actually being used by a Type C
>> port, we can check the cases where the port prioritizes DP bandwidth
>> over USB Superspeed while there is no display actually connected.
>>
>> This symlink can also be useful in the future with USB4 that makes use
>> of DP tunnelling.
>>
>> Benson@ Can you add on to the use cases above if something is missing?
> 
> Above should probably all be included somewhere in the commit message too.
> 
>> I can try to create mock patches in ChromeOS to give an idea how
>> userspace can utilize this symlink.
>> Would this also work?
> 
> drm expects fully reviewed&ready for merge patches, not just mock tests.
> Also ideally some igt uapi tests, but for a symlink I honestly don't know
> what that should be so I guess we can skip that :-)

We have had a discussion on IRC with Simon Ser and Pekka Paalanen. It 
seems that the better way to provide this information would be through 
the 'PATH' property. We are going to work on kernel and user-space parts 
in the next several days.

> 
> For details see our docs:
> 
> https://dri.freedesktop.org/docs/drm/gpu/drm-uapi.html#open-source-userspace-requirements
> 
> https://dri.freedesktop.org/docs/drm/gpu/drm-uapi.html#testing-and-validation
> 
>> If it sounds okay, I can work on the userspace mock patches and resend
>> v5 with the links added to the commit message.
> 
> Sounds good!
> 
> Cheers, Daniel
> 
>>
>>
>>>
>>> In principle nothing against the idea, seems reasonable (but I'm also not
>>> sure what exact problem it's solving) - but all the detail work to make
>>> this work than an RFP to kick of some discussion is missing. And I think
>>> it's not even enough to really kick off a discussion as-is since there's
>>> really no user of this at all (in-kernel or userspace) linked.
>>>
>>> Cheers, Daniel
>>>
>>>>
>>>>
>>>>   drivers/gpu/drm/drm_sysfs.c | 40 +++++++++++++++++++++++++++++++++++++
>>>>   1 file changed, 40 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/drm_sysfs.c b/drivers/gpu/drm/drm_sysfs.c
>>>> index 430e00b16eec..6a9904fa9186 100644
>>>> --- a/drivers/gpu/drm/drm_sysfs.c
>>>> +++ b/drivers/gpu/drm/drm_sysfs.c
>>>> @@ -11,12 +11,14 @@
>>>>    */
>>>>
>>>>   #include <linux/acpi.h>
>>>> +#include <linux/component.h>
>>>>   #include <linux/device.h>
>>>>   #include <linux/err.h>
>>>>   #include <linux/export.h>
>>>>   #include <linux/gfp.h>
>>>>   #include <linux/i2c.h>
>>>>   #include <linux/kdev_t.h>
>>>> +#include <linux/property.h>
>>>>   #include <linux/slab.h>
>>>>
>>>>   #include <drm/drm_connector.h>
>>>> @@ -95,6 +97,34 @@ static char *drm_devnode(struct device *dev, umode_t *mode)
>>>>        return kasprintf(GFP_KERNEL, "dri/%s", dev_name(dev));
>>>>   }
>>>>
>>>> +static int typec_connector_bind(struct device *dev,
>>>> +     struct device *typec_connector, void *data)
>>>> +{
>>>> +     int ret;
>>>> +
>>>> +     ret = sysfs_create_link(&dev->kobj, &typec_connector->kobj, "typec_connector");
>>>> +     if (ret)
>>>> +             return ret;
>>>> +
>>>> +     ret = sysfs_create_link(&typec_connector->kobj, &dev->kobj, "drm_connector");
>>>> +     if (ret)
>>>> +             sysfs_remove_link(&dev->kobj, "typec_connector");
>>>> +
>>>> +     return ret;
>>>> +}
>>>> +
>>>> +static void typec_connector_unbind(struct device *dev,
>>>> +     struct device *typec_connector, void *data)
>>>> +{
>>>> +     sysfs_remove_link(&typec_connector->kobj, "drm_connector");
>>>> +     sysfs_remove_link(&dev->kobj, "typec_connector");
>>>> +}
>>>> +
>>>> +static const struct component_ops typec_connector_ops = {
>>>> +     .bind = typec_connector_bind,
>>>> +     .unbind = typec_connector_unbind,
>>>> +};
>>>> +
>>>>   static CLASS_ATTR_STRING(version, S_IRUGO, "drm 1.1.0 20060810");
>>>>
>>>>   /**
>>>> @@ -355,6 +385,13 @@ int drm_sysfs_connector_add(struct drm_connector *connector)
>>>>        if (connector->ddc)
>>>>                return sysfs_create_link(&connector->kdev->kobj,
>>>>                                 &connector->ddc->dev.kobj, "ddc");
>>>> +
>>>> +     if (dev_fwnode(kdev)) {
>>>> +             r = component_add(kdev, &typec_connector_ops);
>>>> +             if (r)
>>>> +                     drm_err(dev, "failed to add component\n");
>>>> +     }
>>>> +
>>>>        return 0;
>>>>
>>>>   err_free:
>>>> @@ -367,6 +404,9 @@ void drm_sysfs_connector_remove(struct drm_connector *connector)
>>>>        if (!connector->kdev)
>>>>                return;
>>>>
>>>> +     if (dev_fwnode(connector->kdev))
>>>> +             component_del(connector->kdev, &typec_connector_ops);
>>>> +
>>>>        if (connector->ddc)
>>>>                sysfs_remove_link(&connector->kdev->kobj, "ddc");
>>>>
>>>> --
>>>> 2.37.3.998.g577e59143f-goog
>>>>
>>>
>>> --
>>> Daniel Vetter
>>> Software Engineer, Intel Corporation
>>> http://blog.ffwll.ch
>>
>> Thank you,
>> Won
> 

-- 
With best wishes
Dmitry

