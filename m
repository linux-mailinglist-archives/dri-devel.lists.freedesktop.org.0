Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FBEEC2B266
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 11:52:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53DD510E1B4;
	Mon,  3 Nov 2025 10:52:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="xtNiIoPB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F0E610E1C9
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Nov 2025 10:52:19 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-27d67abd215so423885ad.0
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Nov 2025 02:52:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1762167139; x=1762771939;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=WwKprwTirCt4i5Js91Sl+ZyTThwVs5kTlEuvLY+kPJk=;
 b=xtNiIoPBpihNZc9O6eZhIuttXGhdz5d5ZHRKgEVwWIEEv4vTiK3jSeZbelOpH56esQ
 s7SdDE6Sn/LVmniidT7kZlF4mKmFQ1aOpD0Q4C2LU+gut8rVvCkk2ag3gO0acpBaxjMc
 L/Ezvlo6MN1A6s1I3OilwAg3+XHFNCmv1HZMwkxXV3L3gauU02Gno1V3QwwqiOFYCrO2
 PoPwqVcT5/nXLF9cP4AE+Do1waGX9aodRgN66GssGYSGKpW/qvssTiwTsiVk8XJSLqSE
 oR3JP2qjXg17/9MrwTZ96Nlivx2Qt7w3NbztYiWf1Nlh5rIXZm2pnTjt8eW+yZ8LTS5k
 iuIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762167139; x=1762771939;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WwKprwTirCt4i5Js91Sl+ZyTThwVs5kTlEuvLY+kPJk=;
 b=tGEA0ZQli98/4UpAhvUtncrkrSPQex4FP0Kc76JVWhskLgMaXbLtVF3NnwjL/VAWj6
 N4e96jZ1c8OSFGS58bzlKuvnCDwJvCvAU+4wcQy2btM+qajwhNYMjyxj2h6CBYTjE77B
 JMJW4NvjzUgYFZPS6kLP9cgexDk6O8qgOfomDdXYpr9O+dGHd5m6OWZ9tvKxR+d3Qv1Z
 UxupGSDvmH8GDKg2KjQht5UG+U9WKRJXuekFxSG1jomORUtynirSCMJERj3diebXTdoN
 fHhxoxbU9oZ3k07txoPlGI4mEEIt/EmnEPwgV3wR48AhTBCf/XwJyF34lmjBSQisS37+
 +8rA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV3YlcTsLzcLPk/LcpeTg4j3C9pTsRJ8py6tyqnVVmZfA5WdcOLN5cV6HBMSVKT84nYy27rvkrV5IE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw6jz7jySzH9O+md5YTNAjFwXONfoBbtplFyaa85AOxF7LkO2t1
 SAG1yqyneqgSzV22eW7j0Ebgs/+/L3BsoMnAG/GNEA/PUj70HGhYvlCm7PFduGwaJg==
X-Gm-Gg: ASbGnctPBAIwsyeF630HrriZHnfX7AObPOh007DTvYJpKwmgPPOm+Aan7ZolxQSYD+0
 8zwlzTrKVKzudX49iTXqqTXe4sdjszSbtP8Vos3WVwCM4IA2sah1vW5lXu/2T1MNG9jYbcoSmST
 Kd7PcZLXjHMCREBgEdVcMIafNB4ksi7+A101T/1WXweGIcI4mgu0eu0JCUDgqLZXlv1LjbqQ5qe
 biesPIEz+iVOA3XrY9p6t2/7BI5mUMGEA67iqw7MHz+sjmIPVc3WPc93gy0V3YWjU+Y5/1FXuOg
 dSHJh7AdVC7HPpDr2A6ymVY5YyizVJgwGrw34Ayh4Npcm8/AFkJv174L60rNu4C1HCTwe8PxMnN
 bKIChHR/RJeAZlGstNZvgk8Yn/T3C6GN1LCyGJBvKfCJvupnpbyz+izMYKNxXI9TC7ySouoXWAE
 JOd+5QZFxD8wfTuK0AwABoxpi1bxXJxO9qmrshNg==
X-Google-Smtp-Source: AGHT+IHPuCzOHK+gl1PDmhIoWt8nQcQHNMFtOu890fqfdIsVUQlawn89pKWjl6bN9nnq4lv2uM5QPg==
X-Received: by 2002:a17:902:c411:b0:295:3f35:a315 with SMTP id
 d9443c01a7336-2955658e37fmr6124875ad.5.1762167138172; 
 Mon, 03 Nov 2025 02:52:18 -0800 (PST)
Received: from google.com (164.210.142.34.bc.googleusercontent.com.
 [34.142.210.164]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3415994181esm651172a91.5.2025.11.03.02.52.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Nov 2025 02:52:17 -0800 (PST)
Date: Mon, 3 Nov 2025 10:52:07 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Alexander Gordeev <agordeev@linux.ibm.com>,
 David Airlie <airlied@gmail.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Ankit Agrawal <ankita@nvidia.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Brett Creeley <brett.creeley@amd.com>,
 dri-devel@lists.freedesktop.org, Eric Auger <eric.auger@redhat.com>,
 Eric Farman <farman@linux.ibm.com>,
 Giovanni Cabiddu <giovanni.cabiddu@intel.com>,
 Vasily Gorbik <gor@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, intel-gfx@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Kevin Tian <kevin.tian@intel.com>, kvm@vger.kernel.org,
 Kirti Wankhede <kwankhede@nvidia.com>, linux-s390@vger.kernel.org,
 Longfang Liu <liulongfang@huawei.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Nikhil Agarwal <nikhil.agarwal@amd.com>, Nipun Gupta <nipun.gupta@amd.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>, qat-linux@intel.com,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Simona Vetter <simona@ffwll.ch>,
 Shameer Kolothum <skolothumtho@nvidia.com>,
 Mostafa Saleh <smostafa@google.com>, Sven Schnelle <svens@linux.ibm.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, virtualization@lists.linux.dev,
 Vineeth Vijayan <vneethv@linux.ibm.com>, Yishai Hadas <yishaih@nvidia.com>,
 Zhenyu Wang <zhenyuw.linux@gmail.com>,
 Zhi Wang <zhi.wang.linux@gmail.com>, patches@lists.linux.dev
Subject: Re: [PATCH 22/22] vfio: Remove the get_region_info op
Message-ID: <aQiJV4p3AKZSDH08@google.com>
References: <0-v1-679a6fa27d31+209-vfio_get_region_info_op_jgg@nvidia.com>
 <22-v1-679a6fa27d31+209-vfio_get_region_info_op_jgg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <22-v1-679a6fa27d31+209-vfio_get_region_info_op_jgg@nvidia.com>
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

On Thu, Oct 23, 2025 at 08:09:36PM -0300, Jason Gunthorpe wrote:
> No driver uses it now, all are using get_region_info_caps().
> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  drivers/vfio/vfio_main.c | 50 +++++++++++++++++-----------------------
>  include/linux/vfio.h     |  2 --
>  2 files changed, 21 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/vfio/vfio_main.c b/drivers/vfio/vfio_main.c
> index 82e7d79b1f9fe2..f911c1980c9420 100644
> --- a/drivers/vfio/vfio_main.c
> +++ b/drivers/vfio/vfio_main.c
> @@ -1263,48 +1263,40 @@ static long vfio_get_region_info(struct vfio_device *device,
>  				 struct vfio_region_info __user *arg)
>  {
>  	unsigned long minsz = offsetofend(struct vfio_region_info, offset);
> +	struct vfio_info_cap caps = { .buf = NULL, .size = 0 };
>  	struct vfio_region_info info = {};
>  	int ret;
>  
> +	if (unlikely(!device->ops->get_region_info_caps))
> +		return -EINVAL;
> +
>  	if (copy_from_user(&info, arg, minsz))
>  		return -EFAULT;
>  	if (info.argsz < minsz)
>  		return -EINVAL;
>  
> -	if (device->ops->get_region_info_caps) {
> -		struct vfio_info_cap caps = { .buf = NULL, .size = 0 };
> +	ret = device->ops->get_region_info_caps(device, &info, &caps);
> +	if (ret)
> +		return ret;

Shall we kfree(caps.buf); before returning?

> -		ret = device->ops->get_region_info_caps(device, &info, &caps);
> -		if (ret)
> -			return ret;
> -
> -		if (caps.size) {
> -			info.flags |= VFIO_REGION_INFO_FLAG_CAPS;
> -			if (info.argsz < sizeof(info) + caps.size) {
> -				info.argsz = sizeof(info) + caps.size;
> -				info.cap_offset = 0;
> -			} else {
> -				vfio_info_cap_shift(&caps, sizeof(info));
> -				if (copy_to_user(arg + 1, caps.buf,
> -						 caps.size)) {
> -					kfree(caps.buf);
> -					return -EFAULT;
> -				}
> -				info.cap_offset = sizeof(info);
> +	if (caps.size) {
> +		info.flags |= VFIO_REGION_INFO_FLAG_CAPS;
> +		if (info.argsz < sizeof(info) + caps.size) {
> +			info.argsz = sizeof(info) + caps.size;
> +			info.cap_offset = 0;
> +		} else {
> +			vfio_info_cap_shift(&caps, sizeof(info));
> +			if (copy_to_user(arg + 1, caps.buf, caps.size)) {
> +				kfree(caps.buf);
> +				return -EFAULT;
>  			}
> -			kfree(caps.buf);
> +			info.cap_offset = sizeof(info);
>  		}
> -
> -		if (copy_to_user(arg, &info, minsz))
> -			return -EFAULT;
> -	} else if (device->ops->get_region_info) {
> -		ret = device->ops->get_region_info(device, arg);
> -		if (ret)
> -			return ret;
> -	} else {
> -		return -EINVAL;
> +		kfree(caps.buf);
>  	}
>  
> +	if (copy_to_user(arg, &info, minsz))
> +		return -EFAULT;
>  	return 0;
>  }
>  
> diff --git a/include/linux/vfio.h b/include/linux/vfio.h
> index 6311ddc837701d..8e1ddb48b9b54e 100644
> --- a/include/linux/vfio.h
> +++ b/include/linux/vfio.h
> @@ -133,8 +133,6 @@ struct vfio_device_ops {
>  			 size_t count, loff_t *size);
>  	long	(*ioctl)(struct vfio_device *vdev, unsigned int cmd,
>  			 unsigned long arg);
> -	int	(*get_region_info)(struct vfio_device *vdev,
> -				   struct vfio_region_info __user *arg);
>  	int	(*get_region_info_caps)(struct vfio_device *vdev,
>  					struct vfio_region_info *info,
>  					struct vfio_info_cap *caps);

Thanks,
Praan
