Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 136BDC2C5C5
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 15:17:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DAC410E405;
	Mon,  3 Nov 2025 14:17:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="JfIopa7T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A3BB10E403
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Nov 2025 14:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1762179451;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q3Gz5RPi7t/fiKLwIbkCJ/zKbkuLlW2r6E/NdmyNkaY=;
 b=JfIopa7Trm3pVJYy05wj00DPEP/XOO6Xn36b2O1WvJ8XJHUWxwRRlXxo5ljQNdRBq5L0WK
 5y7xULOmB7z6yYdt4rH0Mup0nM1IakhPkkpxSJ5+hG5aAhT7baOGdUIBFps/UTpIzrWpqC
 TqszwDYL2TEz4M0uT2/IbaKY0Gb4AfY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-131-jBe5p9NgMEiA4FE71IYhUg-1; Mon, 03 Nov 2025 09:17:28 -0500
X-MC-Unique: jBe5p9NgMEiA4FE71IYhUg-1
X-Mimecast-MFC-AGG-ID: jBe5p9NgMEiA4FE71IYhUg_1762179447
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-477124f7c00so24088315e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Nov 2025 06:17:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762179447; x=1762784247;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Q3Gz5RPi7t/fiKLwIbkCJ/zKbkuLlW2r6E/NdmyNkaY=;
 b=TI+6FygPT2mhLM743m4NGSfDjpSQ3XahJgvVXi5ZXMSgdMB0P2m4gRYAmXtAqL28Bm
 kwWm6gTNJfgLDoAtifXXFZPUTEMB/0O9/vgu+6k4P6CYY6/pt0DRIqntnP+B+UjxgBAV
 ZfIOLoFEuTdoyFwcjhZfLuZ+y5T47M5+uNfOkG0F/FOnIj9Cwr+ffzypv7bjWzdEE2iU
 joeH7dJ2w3k2pF2mnUpyLdVJS9wek8/NIbtinDt1/xQT3TJx1E2J18sLfkeVoFgiw67N
 r+PTSWjQEccLYPgulCym9HBSmXo9Y0VzqDlmKykeOQj4kHJvRQryCqE0ACrzRbNuZ2YY
 DYcA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUgut0KvSN8dlQn5T3O9aA66FvtZXamgQ5nPjCcX3hvv/8A8udc6dms3LkEoWyQDbrJrlPmKgMNUzE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw1MFVp9U4ivZMjZJfovw588kyUEv8XEFjJF52HhhkCuFKeJMjB
 jTfAorn3jDknCWyLdzrSRCqFQAY6ZtbdXGYP+uwVv5K4K2Aqir3obHnrbCE02QlV7Xg4qLF6qz5
 Amex+0gZEtp83RruvFJHnuejo9TDXwvYIsTZ7AeSCWiiaTy1gpSG4eNCGI5DSJhxkG2SAtQ==
X-Gm-Gg: ASbGnct/9hGgdohR76eEzod1jVBbGrEwaa2Ff96PB2fiJGy+T8yefhTXJhJT0HRreOq
 Youkg938Xlu8MCQrv0e30ydkGoIV1XLvwbI6ImRhqyKp7eIz5yBv0L43QcEh0sj+1R4XKH0uUPm
 4wX1uuhCuYXnrMbqtB7PE8hvG/gXTExNhZWaVAkd7pEfVvV2RVaMppVbdF+sdyDb8nbFwHUtrVW
 +vJoGWv9VRAh8Zz4e1mLS5jGDK+uK9YL5V72ogXuxOIhNwcvIaWJDBF+/TzByysp+V3QMtsKFmv
 rX6ANDxEGIpwK4I4r17i8cMC+sQ4wTIu5Y3nboKfqry9hjEVEPFnb+Xi0mK9tInRTkP2Ih6gYB7
 E2o9gQaIRMsG5CHEHGlja6XgB3xOGpveovoMlKaLGSbZP4w==
X-Received: by 2002:a05:600c:3d9b:b0:46e:4e6d:79f4 with SMTP id
 5b1f17b1804b1-477307e2946mr105146705e9.15.1762179446707; 
 Mon, 03 Nov 2025 06:17:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF7QGWcsduqExlRNuo08vTbmBrCDPz7B6tz31rAn7ZiwWVaD9KVEKB25Zj5jP4j1A/9yO4aiQ==
X-Received: by 2002:a05:600c:3d9b:b0:46e:4e6d:79f4 with SMTP id
 5b1f17b1804b1-477307e2946mr105146315e9.15.1762179446219; 
 Mon, 03 Nov 2025 06:17:26 -0800 (PST)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4772fcf38c6sm87824145e9.11.2025.11.03.06.17.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Nov 2025 06:17:25 -0800 (PST)
Message-ID: <c766564c-66a2-46d6-ab6f-b817f3b2e616@redhat.com>
Date: Mon, 3 Nov 2025 15:17:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/22] vfio: Provide a get_region_info op
To: Jason Gunthorpe <jgg@nvidia.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>, David Airlie
 <airlied@gmail.com>, Alex Williamson <alex.williamson@redhat.com>,
 Ankit Agrawal <ankita@nvidia.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Brett Creeley <brett.creeley@amd.com>, dri-devel@lists.freedesktop.org,
 Eric Farman <farman@linux.ibm.com>,
 Giovanni Cabiddu <giovanni.cabiddu@intel.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 intel-gfx@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Kevin Tian <kevin.tian@intel.com>, kvm@vger.kernel.org,
 Kirti Wankhede <kwankhede@nvidia.com>, linux-s390@vger.kernel.org,
 Longfang Liu <liulongfang@huawei.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Nikhil Agarwal <nikhil.agarwal@amd.com>, Nipun Gupta <nipun.gupta@amd.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>, Pranjal Shrivastava <praan@google.com>,
 qat-linux@intel.com, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Simona Vetter <simona@ffwll.ch>, Shameer Kolothum <skolothumtho@nvidia.com>,
 Mostafa Saleh <smostafa@google.com>, Sven Schnelle <svens@linux.ibm.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, virtualization@lists.linux.dev,
 Vineeth Vijayan <vneethv@linux.ibm.com>, Yishai Hadas <yishaih@nvidia.com>,
 Zhenyu Wang <zhenyuw.linux@gmail.com>, Zhi Wang <zhi.wang.linux@gmail.com>
Cc: patches@lists.linux.dev
References: <1-v1-679a6fa27d31+209-vfio_get_region_info_op_jgg@nvidia.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <1-v1-679a6fa27d31+209-vfio_get_region_info_op_jgg@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: GtC5WRS4PaivwvucRkN9cAmIxeCSu5dT-Vu5EsnmCGw_1762179447
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
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
Reply-To: eric.auger@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jason,

On 10/24/25 1:09 AM, Jason Gunthorpe wrote:
> Instead of hooking the general ioctl op, have the core code directly
> decode VFIO_DEVICE_GET_REGION_INFO and call an op just for it.
>
> This is intended to allow mechanical changes to the drivers to pull their
> VFIO_DEVICE_GET_REGION_INFO int oa function. Later patches will improve
in a
> the function signature to consolidate more code.
>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  drivers/vfio/pci/vfio_pci_core.c | 9 ++++++---
>  drivers/vfio/vfio_main.c         | 7 +++++++
>  include/linux/vfio.h             | 2 ++
>  include/linux/vfio_pci_core.h    | 2 ++
>  4 files changed, 17 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/vfio/pci/vfio_pci_core.c b/drivers/vfio/pci/vfio_pci_core.c
> index 7dcf5439dedc9d..1dc350003f075c 100644
> --- a/drivers/vfio/pci/vfio_pci_core.c
> +++ b/drivers/vfio/pci/vfio_pci_core.c
> @@ -996,9 +996,11 @@ static int vfio_pci_ioctl_get_info(struct vfio_pci_core_device *vdev,
>  	return copy_to_user(arg, &info, minsz) ? -EFAULT : 0;
>  }
>  
> -static int vfio_pci_ioctl_get_region_info(struct vfio_pci_core_device *vdev,
> -					  struct vfio_region_info __user *arg)
> +int vfio_pci_ioctl_get_region_info(struct vfio_device *core_vdev,
> +				   struct vfio_region_info __user *arg)
>  {
> +	struct vfio_pci_core_device *vdev =
> +		container_of(core_vdev, struct vfio_pci_core_device, vdev);
>  	unsigned long minsz = offsetofend(struct vfio_region_info, offset);
>  	struct pci_dev *pdev = vdev->pdev;
>  	struct vfio_region_info info;
> @@ -1132,6 +1134,7 @@ static int vfio_pci_ioctl_get_region_info(struct vfio_pci_core_device *vdev,
>  
>  	return copy_to_user(arg, &info, minsz) ? -EFAULT : 0;
>  }
> +EXPORT_SYMBOL_GPL(vfio_pci_ioctl_get_region_info);
>  
>  static int vfio_pci_ioctl_get_irq_info(struct vfio_pci_core_device *vdev,
>  				       struct vfio_irq_info __user *arg)
> @@ -1458,7 +1461,7 @@ long vfio_pci_core_ioctl(struct vfio_device *core_vdev, unsigned int cmd,
>  	case VFIO_DEVICE_GET_PCI_HOT_RESET_INFO:
>  		return vfio_pci_ioctl_get_pci_hot_reset_info(vdev, uarg);
>  	case VFIO_DEVICE_GET_REGION_INFO:
> -		return vfio_pci_ioctl_get_region_info(vdev, uarg);
> +		return vfio_pci_ioctl_get_region_info(core_vdev, uarg);
>  	case VFIO_DEVICE_IOEVENTFD:
>  		return vfio_pci_ioctl_ioeventfd(vdev, uarg);
>  	case VFIO_DEVICE_PCI_HOT_RESET:
> diff --git a/drivers/vfio/vfio_main.c b/drivers/vfio/vfio_main.c
> index 38c8e9350a60ec..a390163ce706c4 100644
> --- a/drivers/vfio/vfio_main.c
> +++ b/drivers/vfio/vfio_main.c
> @@ -1296,7 +1296,14 @@ static long vfio_device_fops_unl_ioctl(struct file *filep,
>  		ret = vfio_ioctl_device_feature(device, uptr);
>  		break;
>  
> +	case VFIO_DEVICE_GET_REGION_INFO:
> +		if (!device->ops->get_region_info)
> +			goto ioctl_fallback;
> +		ret = device->ops->get_region_info(device, uptr);
> +		break;
> +
>  	default:
> +ioctl_fallback:
>  		if (unlikely(!device->ops->ioctl))
>  			ret = -EINVAL;
>  		else
> diff --git a/include/linux/vfio.h b/include/linux/vfio.h
> index eb563f538dee51..be5fcf8432e8d5 100644
> --- a/include/linux/vfio.h
> +++ b/include/linux/vfio.h
> @@ -132,6 +132,8 @@ struct vfio_device_ops {
>  			 size_t count, loff_t *size);
>  	long	(*ioctl)(struct vfio_device *vdev, unsigned int cmd,
>  			 unsigned long arg);
> +	int	(*get_region_info)(struct vfio_device *vdev,
> +				   struct vfio_region_info __user *arg);
>  	int	(*mmap)(struct vfio_device *vdev, struct vm_area_struct *vma);
>  	void	(*request)(struct vfio_device *vdev, unsigned int count);
>  	int	(*match)(struct vfio_device *vdev, char *buf);
> diff --git a/include/linux/vfio_pci_core.h b/include/linux/vfio_pci_core.h
> index f541044e42a2ad..160bc2e31ece75 100644
> --- a/include/linux/vfio_pci_core.h
> +++ b/include/linux/vfio_pci_core.h
> @@ -115,6 +115,8 @@ long vfio_pci_core_ioctl(struct vfio_device *core_vdev, unsigned int cmd,
>  		unsigned long arg);
>  int vfio_pci_core_ioctl_feature(struct vfio_device *device, u32 flags,
>  				void __user *arg, size_t argsz);
> +int vfio_pci_ioctl_get_region_info(struct vfio_device *core_vdev,
> +				   struct vfio_region_info __user *arg);
looks like an inconsistent naming. all other functions declared here
have "_core".

The change of proto + export of vfio_pci_ioctl_get_region_info could
have been put in a separate patch than the one introducing the
get_region_info cb especially since the change is not documented in the
commit msg

Thanks

Eric
>  ssize_t vfio_pci_core_read(struct vfio_device *core_vdev, char __user *buf,
>  		size_t count, loff_t *ppos);
>  ssize_t vfio_pci_core_write(struct vfio_device *core_vdev, const char __user *buf,

