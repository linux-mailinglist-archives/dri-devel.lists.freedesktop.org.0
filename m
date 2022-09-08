Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E33DA5B18E4
	for <lists+dri-devel@lfdr.de>; Thu,  8 Sep 2022 11:39:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EB3110E9F5;
	Thu,  8 Sep 2022 09:39:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E98EC10E9F0
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Sep 2022 09:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662629954;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=juN60mjz881n6CsiBEcgXlSOSOlvhxsLXH5xY7MSR4s=;
 b=iE8OoswAKZsB3AraNIeiSLkh1UR6V6xrJeItP34pRf170adZuETqNqgQJhOluaYGdYGcT5
 vRFxV2cqGkIccqT6vC97e4nxZCi8vBnK653YAD4y/YUG3/embt/t4LaD/iip1gvOtuEhec
 MXVG8nM15Z0d7+PQET6J1r0HpqcDrfQ=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-656-bxXPoOqZPgS05O9O15OBEg-1; Thu, 08 Sep 2022 05:39:12 -0400
X-MC-Unique: bxXPoOqZPgS05O9O15OBEg-1
Received: by mail-wr1-f69.google.com with SMTP id
 u27-20020adfa19b000000b0022863c08ac4so3870839wru.11
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Sep 2022 02:39:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date;
 bh=juN60mjz881n6CsiBEcgXlSOSOlvhxsLXH5xY7MSR4s=;
 b=78e3eiAP2C9BlPYoBRYktAhTcXINJiGDDazbsIC3l2LDNS8q7Wu3hNNKTb2Ls/1wZy
 GEtFBGtOdyway86gKjJizg8agQvePcMz+7LXNd7AKvvTwqBeNJQE/cMfEKcfXvi+K01b
 WFWnw8Er1XW/k8iU49ewM2Xg/5Uxbfk7dg9MoM5bnA/10F65C4xlcmKagrjZWusojG3c
 oEdRgKlHsQeaAEWt2Gl783TcIlsumiaMMREamSojquwzQZFGIBJnZd3C7wL8hmliljkM
 pGNVslqm0T1e0qiWh1GBPjzOXfCjJ2K632k/cQ2hY4B0MVUeLIwhkP11lLM4VA6fByKW
 YpzQ==
X-Gm-Message-State: ACgBeo1uRNMwqke778D6payy1b8OMYhAs0m6fT6iuE2sxP0m1zlJ4Hh+
 K5mOUf1vw9pcqJlWPAHzciZMdlhTFdFgfoFdw0nULBGNyy1+BpaLxf9GoGchOdN8bBjQvmdQ44h
 44K3WtYckASRi3WQCtQRQhOXa4vqp
X-Received: by 2002:a05:6000:178e:b0:220:635f:eb13 with SMTP id
 e14-20020a056000178e00b00220635feb13mr4489801wrg.634.1662629951509; 
 Thu, 08 Sep 2022 02:39:11 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4dRBeXGabpPhvYNKiyVK4XYbixC3F8OmZF+hKUI2fO7IUkTj9BIwBvc/2UBWnZVrvaMpyPhg==
X-Received: by 2002:a05:6000:178e:b0:220:635f:eb13 with SMTP id
 e14-20020a056000178e00b00220635feb13mr4489754wrg.634.1662629951128; 
 Thu, 08 Sep 2022 02:39:11 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 p14-20020a1c544e000000b003a502c23f2asm2231024wmi.16.2022.09.08.02.39.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Sep 2022 02:39:09 -0700 (PDT)
Message-ID: <4c9350cd-c2ce-dc84-9a29-210907d2a2a2@redhat.com>
Date: Thu, 8 Sep 2022 11:39:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 15/15] vfio: Add struct device to vfio_device
To: Yi Liu <yi.l.liu@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Eric Farman <farman@linux.ibm.com>, Matthew Rosato <mjrosato@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>, Vineeth Vijayan <vneethv@linux.ibm.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, Tony Krowiak <akrowiak@linux.ibm.com>,
 Jason Herne <jjherne@linux.ibm.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Diana Craciun <diana.craciun@oss.nxp.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Longfang Liu <liulongfang@huawei.com>,
 Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>,
 Kirti Wankhede <kwankhede@nvidia.com>, Leon Romanovsky <leon@kernel.org>,
 Abhishek Sahu <abhsahu@nvidia.com>, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-s390@vger.kernel.org, kvm@vger.kernel.org
References: <20220901143747.32858-1-kevin.tian@intel.com>
 <20220901143747.32858-16-kevin.tian@intel.com>
 <50d82b01-86a3-e6a3-06f7-7f98e60131eb@redhat.com>
 <546463b8-54fa-2071-6a9a-e4087eb8bb2c@intel.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <546463b8-54fa-2071-6a9a-e4087eb8bb2c@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Reply-To: eric.auger@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 9/8/22 11:17, Yi Liu wrote:
> On 2022/9/8 17:06, Eric Auger wrote:
>> Hi Kevin,
>>
>> On 9/1/22 16:37, Kevin Tian wrote:
>>> From: Yi Liu <yi.l.liu@intel.com>
>>>
>>> and replace kref. With it a 'vfio-dev/vfioX' node is created under the
>>> sysfs path of the parent, indicating the device is bound to a vfio
>>> driver, e.g.:
>>>
>>> /sys/devices/pci0000\:6f/0000\:6f\:01.0/vfio-dev/vfio0
>>>
>>> It is also a preparatory step toward adding cdev for supporting future
>>> device-oriented uAPI.
>>>
>>> Add Documentation/ABI/testing/sysfs-devices-vfio-dev.
>>>
>>> Also take this chance to rename chardev 'vfio' to 'vfio-group' in
>>> /proc/devices.
>>>
>>> Suggested-by: Jason Gunthorpe <jgg@nvidia.com>
>>> Signed-off-by: Yi Liu <yi.l.liu@intel.com>
>>> Signed-off-by: Kevin Tian <kevin.tian@intel.com>
>>> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
>>> ---
>>>   .../ABI/testing/sysfs-devices-vfio-dev        |  8 +++
>>>   drivers/vfio/vfio_main.c                      | 67
>>> +++++++++++++++----
>>>   include/linux/vfio.h                          |  6 +-
>>>   3 files changed, 66 insertions(+), 15 deletions(-)
>>>   create mode 100644 Documentation/ABI/testing/sysfs-devices-vfio-dev
>>>
>>> diff --git a/Documentation/ABI/testing/sysfs-devices-vfio-dev
>>> b/Documentation/ABI/testing/sysfs-devices-vfio-dev
>>> new file mode 100644
>>> index 000000000000..e21424fd9666
>>> --- /dev/null
>>> +++ b/Documentation/ABI/testing/sysfs-devices-vfio-dev
>>> @@ -0,0 +1,8 @@
>>> +What:         /sys/.../<device>/vfio-dev/vfioX/
>>> +Date:         September 2022
>>> +Contact:     Yi Liu <yi.l.liu@intel.com>
>>> +Description:
>>> +         This directory is created when the device is bound to a
>>> +         vfio driver. The layout under this directory matches what
>>> +         exists for a standard 'struct device'. 'X' is a unique
>>> +         index marking this device in vfio.
>>> diff --git a/drivers/vfio/vfio_main.c b/drivers/vfio/vfio_main.c
>>> index bfa675d314ab..141f55c3faf5 100644
>>> --- a/drivers/vfio/vfio_main.c
>>> +++ b/drivers/vfio/vfio_main.c
>>> @@ -46,6 +46,8 @@ static struct vfio {
>>>       struct mutex            group_lock; /* locks group_list */
>>>       struct ida            group_ida;
>>>       dev_t                group_devt;
>>> +    struct class            *device_class;
>>> +    struct ida            device_ida;
>>>   } vfio;
>>>     struct vfio_iommu_driver {
>>> @@ -483,12 +485,13 @@ static struct vfio_device
>>> *vfio_group_get_device(struct vfio_group *group,
>>>    * VFIO driver API
>>>    */
>>>   /* Release helper called by vfio_put_device() */
>>> -void vfio_device_release(struct kref *kref)
>>> +static void vfio_device_release(struct device *dev)
>>>   {
>>>       struct vfio_device *device =
>>> -            container_of(kref, struct vfio_device, kref);
>>> +            container_of(dev, struct vfio_device, device);
>>>         vfio_release_device_set(device);
>>> +    ida_free(&vfio.device_ida, device->index);
>>>         /*
>>>        * kvfree() cannot be done here due to a life cycle mess in
>>> @@ -498,7 +501,6 @@ void vfio_device_release(struct kref *kref)
>>>        */
>>>       device->ops->release(device);
>>>   }
>>> -EXPORT_SYMBOL_GPL(vfio_device_release);
>>>     /*
>>>    * Alloc and initialize vfio_device so it can be registered to vfio
>>> @@ -546,6 +548,13 @@ int vfio_init_device(struct vfio_device
>>> *device, struct device *dev,
>>>   {
>>>       int ret;
>>>   +    ret = ida_alloc_max(&vfio.device_ida, MINORMASK, GFP_KERNEL);
>>> +    if (ret < 0) {
>>> +        dev_dbg(dev, "Error to alloc index\n");
>>> +        return ret;
>>> +    }
>>> +
>>> +    device->index = ret;
>>>       init_completion(&device->comp);
>>>       device->dev = dev;
>>>       device->ops = ops;
>>> @@ -556,11 +565,15 @@ int vfio_init_device(struct vfio_device
>>> *device, struct device *dev,
>>>               goto out_uninit;
>>>       }
>>>   -    kref_init(&device->kref);
>>> +    device_initialize(&device->device);
>>> +    device->device.release = vfio_device_release;
>>> +    device->device.class = vfio.device_class;
>>> +    device->device.parent = device->dev;
>>>       return 0;
>>>     out_uninit:
>>>       vfio_release_device_set(device);
>>> +    ida_free(&vfio.device_ida, device->index);
>>>       return ret;
>>>   }
>>>   EXPORT_SYMBOL_GPL(vfio_init_device);
>>> @@ -657,6 +670,7 @@ static int __vfio_register_dev(struct
>>> vfio_device *device,
>>>           struct vfio_group *group)
>>>   {
>>>       struct vfio_device *existing_device;
>>> +    int ret;
>>>         if (IS_ERR(group))
>>>           return PTR_ERR(group);
>>> @@ -673,16 +687,21 @@ static int __vfio_register_dev(struct
>>> vfio_device *device,
>>>           dev_WARN(device->dev, "Device already exists on group %d\n",
>>>                iommu_group_id(group->iommu_group));
>>>           vfio_device_put_registration(existing_device);
>>> -        if (group->type == VFIO_NO_IOMMU ||
>>> -            group->type == VFIO_EMULATED_IOMMU)
>>> -            iommu_group_remove_device(device->dev);
>>> -        vfio_group_put(group);
>>> -        return -EBUSY;
>>> +        ret = -EBUSY;
>>> +        goto err_out;
>>>       }
>>>         /* Our reference on group is moved to the device */
>>>       device->group = group;
>>>   +    ret = dev_set_name(&device->device, "vfio%d", device->index);
>>> +    if (ret)
>>> +        goto err_out;
>>> +
>>> +    ret = device_add(&device->device);
>>> +    if (ret)
>>> +        goto err_out;
>>> +
>>>       /* Refcounting can't start until the driver calls register */
>>>       refcount_set(&device->refcount, 1);
>>>   @@ -692,6 +711,12 @@ static int __vfio_register_dev(struct
>>> vfio_device *device,
>>>       mutex_unlock(&group->device_lock);
>>>         return 0;
>>> +err_out:
>>> +    if (group->type == VFIO_NO_IOMMU ||
>>> +        group->type == VFIO_EMULATED_IOMMU)
>>> +        iommu_group_remove_device(device->dev);
>>> +    vfio_group_put(group);
>>> +    return ret;
>>>   }
>>>     int vfio_register_group_dev(struct vfio_device *device)
>>> @@ -779,6 +804,9 @@ void vfio_unregister_group_dev(struct
>>> vfio_device *device)
>>>       group->dev_counter--;
>>>       mutex_unlock(&group->device_lock);
>>>   +    /* Balances device_add in register path */
>>> +    device_del(&device->device);
>>> +
>>>       if (group->type == VFIO_NO_IOMMU || group->type ==
>>> VFIO_EMULATED_IOMMU)
>>>           iommu_group_remove_device(device->dev);
>>>   @@ -2145,6 +2173,7 @@ static int __init vfio_init(void)
>>>       int ret;
>>>         ida_init(&vfio.group_ida);
>>> +    ida_init(&vfio.device_ida);
>>>       mutex_init(&vfio.group_lock);
>>>       mutex_init(&vfio.iommu_drivers_lock);
>>>       INIT_LIST_HEAD(&vfio.group_list);
>>> @@ -2160,12 +2189,20 @@ static int __init vfio_init(void)
>>>       vfio.class = class_create(THIS_MODULE, "vfio");
>>>       if (IS_ERR(vfio.class)) {
>>>           ret = PTR_ERR(vfio.class);
>>> -        goto err_class;
>>> +        goto err_group_class;
>>>       }
>>>         vfio.class->devnode = vfio_devnode;
>>>   -    ret = alloc_chrdev_region(&vfio.group_devt, 0, MINORMASK + 1,
>>> "vfio");
>>> +    /* /sys/class/vfio-dev/vfioX */
>>> +    vfio.device_class = class_create(THIS_MODULE, "vfio-dev");
>>> +    if (IS_ERR(vfio.device_class)) {
>>> +        ret = PTR_ERR(vfio.device_class);
>>> +        goto err_dev_class;
>>> +    }
>>> +
>>> +    ret = alloc_chrdev_region(&vfio.group_devt, 0, MINORMASK + 1,
>>> +                  "vfio-group");
>>>       if (ret)
>>>           goto err_alloc_chrdev;
>>>   @@ -2181,9 +2218,12 @@ static int __init vfio_init(void)
>>>   err_driver_register:
>>>       unregister_chrdev_region(vfio.group_devt, MINORMASK + 1);
>>>   err_alloc_chrdev:
>>> +    class_destroy(vfio.device_class);
>>> +    vfio.device_class = NULL;
>>> +err_dev_class:
>>>       class_destroy(vfio.class);
>>>       vfio.class = NULL;
>>> -err_class:
>>> +err_group_class:
>>>       misc_deregister(&vfio_dev);
>>>       return ret;
>>>   }
>>> @@ -2195,8 +2235,11 @@ static void __exit vfio_cleanup(void)
>>>   #ifdef CONFIG_VFIO_NOIOMMU
>>>       vfio_unregister_iommu_driver(&vfio_noiommu_ops);
>>>   #endif
>>> +    ida_destroy(&vfio.device_ida);
>>>       ida_destroy(&vfio.group_ida);
>>>       unregister_chrdev_region(vfio.group_devt, MINORMASK + 1);
>>> +    class_destroy(vfio.device_class);
>>> +    vfio.device_class = NULL;
>>>       class_destroy(vfio.class);
>>>       vfio.class = NULL;
>>>       misc_deregister(&vfio_dev);
>>> diff --git a/include/linux/vfio.h b/include/linux/vfio.h
>>> index f03447c8774d..5c13f74da1bb 100644
>>> --- a/include/linux/vfio.h
>>> +++ b/include/linux/vfio.h
>>> @@ -45,7 +45,8 @@ struct vfio_device {
>>>       struct kvm *kvm;
>>>         /* Members below here are private, not for driver use */
>>> -    struct kref kref;    /* object life cycle */
>>> +    unsigned int index;
>>> +    struct device device;    /* device.kref covers object life
>>> circle */
>>>       refcount_t refcount;    /* user count on registered device*/
>>>       unsigned int open_count;
>>>       struct completion comp;
>> I am not totally clear about remaining 'struct device *dev;' in
>> vfio_device struct. I see it used in some places. Is it supposed to
>> disappear at some point?
>
> no, Eric. *dev will not disappear, it stores the dev pointet passed in by
> caller of vfio_init_device().

yeah I see but you have device->device.parent = device->dev;

Eric
>
>>> @@ -154,10 +155,9 @@ struct vfio_device *_vfio_alloc_device(size_t
>>> size, struct device *dev,
>>>   int vfio_init_device(struct vfio_device *device, struct device *dev,
>>>                const struct vfio_device_ops *ops);
>>>   void vfio_free_device(struct vfio_device *device);
>>> -void vfio_device_release(struct kref *kref);
>>>   static inline void vfio_put_device(struct vfio_device *device)
>>>   {
>>> -    kref_put(&device->kref, vfio_device_release);
>>> +    put_device(&device->device);
>>>   }
>>>     int vfio_register_group_dev(struct vfio_device *device);
>>
>> Thanks
>>
>> Eric
>>
>

