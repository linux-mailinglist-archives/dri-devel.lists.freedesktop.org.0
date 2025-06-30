Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A307BAEE236
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jun 2025 17:19:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BF1010E491;
	Mon, 30 Jun 2025 15:19:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="gVvoVzZ/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF73110E485
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jun 2025 15:19:36 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55U8DBBc028446
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jun 2025 15:19:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 66CJdJsC347ysZVqffGRFxm2aYFeQsQ85CaTAPDUfkM=; b=gVvoVzZ/8QYRuwVh
 stM0KgHz42XwKOjUM3QfToRdHFF+zW320t04nfN+DQ2F6MTTQBySdkTkPcMBiOEg
 1i+E3IXOWAVfQ53PopzaI/w6tSYugiOJ4WwOSE/PKodXoi5MydORgpTVO9hRsG0Z
 EaXZyX+Kc8RbiE+XMy8HcrSTA4WozX95OexeBv2dz900UU5mryyZcI3G3kcR1oWQ
 LsGKfklZfmnvaZCGWtCLVaNhudEki9IMSipIZotMEeYDulPSVkJ1Lmm6XpPSbJFi
 78zHXOazFCheqbVsaq0zNhhyOyDPz0qnntrScB8LXyDJhn/DPFNSEFIIL3WNscKU
 63qhng==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j7bvn8r9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jun 2025 15:19:36 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id
 98e67ed59e1d1-315b60c19d4so1483954a91.0
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jun 2025 08:19:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751296775; x=1751901575;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=66CJdJsC347ysZVqffGRFxm2aYFeQsQ85CaTAPDUfkM=;
 b=iEg7zkvl4yAn1duCSt/7rGL+lhmP+ivmwWEkCsU0zmix48GkEM8fSHN1iN9CVDvadM
 SVKDKseg8MZjOlTl5/yU1BHV2bGiljv8nyg94Xe7JF2I7TdsvtbI3wUjj+2wiq9Po/Jw
 e7m01iieyqCbnHY9+DHvxIItsqRqkyhRU9zmuq63+qR1+2qsI0bVe8kKKEV4B82PaH+2
 AfkHUQN0I8Vf7q31tOQViJx7HBcL8hyFMzjPRU8cLGz7+pGQMKSIx5KzVL2j9EzUBXmB
 UIF/qT5cacualTHR48fjtYVhSdoyl0JOxC039g0t2ZH+0afMoMkxbNIaAIqE5ALI7Vz/
 i9wQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUS2LAhTiIcnOtXc2D4OrWuG6XYPNuJpr6NGJ98W3sQYol55Sk0XvmBl4UuSnlRcrN4T9Q9hwdDTuw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzLX86EPd+ZHtkucjX6iLu56f3NfX84qEnRlXeWY2znk7WxULUj
 XYK7BuGdbrwAKhMdM/5s3giAYA/suFJuEzxhPARn6Ei3gE8llhEeHLX2jb2xaE/Z+NxMkneVyIQ
 Zn7F1w52w2Mt+v8QeR0kVu3ccXnhc4rxnwL1m+o/QuV9LWziYJHAxn5lyrOlZPeMD8OxQegg=
X-Gm-Gg: ASbGncsqfAfzKKCV0YCC3irylNM1buXSSipuvOruxIehJ001e24y1738H/IZfy/ivNf
 DoRCa2WEM5vPWriJXIAdBGl0fnXeC1Wye3oN6wzwOfcJ/vFiYfXZ2ajbzL4fIenN5Xd2XsUBEAa
 CmkpBtXk0Bb5EXUJoGKwubBNrb9LiKN+Btf5cLC2wYwwvfhdKiGeWQBTw+5RFbWUyoDPOljEn13
 5gP7lphQqFqaJbGtF3sCtfVCcRY7P9yLEqbD2K4s2aFW9RpNHLe0M3BjgcIR6+l6lkWNF+UfPTt
 XU7pyRGFoDwroXbjYSL334sAE3q9x7NykOZQynnEeUDlysIZYVOF0LkBTfqEtVAqIGovcu8R
X-Received: by 2002:a17:90b:1f87:b0:311:fde5:c4be with SMTP id
 98e67ed59e1d1-318c9316409mr18110181a91.35.1751296775329; 
 Mon, 30 Jun 2025 08:19:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHiVDL4QnysnvkWZn1Kr5K4sbkgaq9owWU/OiOIK4gwIxbVFAVqFFbOw/Otk0OOcBsMBiBSFg==
X-Received: by 2002:a17:90b:1f87:b0:311:fde5:c4be with SMTP id
 98e67ed59e1d1-318c9316409mr18110135a91.35.1751296774816; 
 Mon, 30 Jun 2025 08:19:34 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-318c13d54e1sm8956630a91.22.2025.06.30.08.19.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Jun 2025 08:19:34 -0700 (PDT)
Message-ID: <9e45cdbe-8cdf-42ab-8769-067ff8f30e1c@oss.qualcomm.com>
Date: Mon, 30 Jun 2025 09:19:32 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/5] drm: move the debugfs accel driver code to drm
 layer
To: Sunil Khatri <sunil.khatri@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org, simona@ffwll.ch, tzimmermann@suse.de,
 tursulin@ursulin.net, phasta@kernel.org, dakr@kernel.org
References: <20250630143613.2520111-1-sunil.khatri@amd.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20250630143613.2520111-1-sunil.khatri@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: jpYtBTbNH4ulfZsvhg0H6-5TEeE83c6S
X-Authority-Analysis: v=2.4 cv=RJCzH5i+ c=1 sm=1 tr=0 ts=6862ab08 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=zd2uoN0lAAAA:8 a=Ci5om5BGt_NrSYkhAQgA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: jpYtBTbNH4ulfZsvhg0H6-5TEeE83c6S
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjMwMDEyNSBTYWx0ZWRfX65Fblb6UEgN1
 1BV0tpBnEP1GcqbcYggsKrAR7XWOkmGMfWt9rStbwRwigE0HE0VkqpSN8v54mukX4K59MVVfhsm
 8+zwjCZpHQplJ/PYO9sTFIphC53YEiIYr9NgaLnODDSzyfyGiNY3KIwFWkhlKZFQuXT858NmoxX
 HXYbLL1FzGCiB8yl3ZgqdtC6i26xPTOjzKfCgLjcJ7dLJwVTYf+dDBUTnluQe0MBc+Tqq7LVDcZ
 dqkd4YR50uqoU8+DLyijdtxZc8VTNMr5/WBPQuzYtLDJQ4MuhYYeO6eF8cRapXZVym1XHqFer66
 AWWRe78oNpWefkGEzDyXEbW1X67FEfF8y3Aaxvxwwm6MiAIyWxZeah5zu1HumFSstoJB1JAJyyk
 sLhYhP3Y+VldjYMRLOs2y82yeR/wVibaxwo4+j3S1NjW08rdy8h99e+/hE4z1Jz/6kBRQHr7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-30_04,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 priorityscore=1501 mlxlogscore=999 adultscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 phishscore=0
 bulkscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506300125
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

On 6/30/2025 8:36 AM, Sunil Khatri wrote:

I don't see a cover letter on list. Surely there should be one?

Looks like you didn't send this to the Accel maintainer. Did you forget 
to run the get_maintainers/pl script?

> Move the debugfs accel driver code to the drm layer
> and it is an intermediate step to move all debugfs
> related handling into drm_debugfs.c

This is missing the answer to the most important question - why?

> 
> Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
> Reviewed-by: Christian König <christian.koenig@amd.com>
> ---
>   drivers/accel/drm_accel.c | 16 ----------------
>   drivers/gpu/drm/drm_drv.c |  6 +++++-
>   include/drm/drm_accel.h   |  5 -----
>   3 files changed, 5 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/accel/drm_accel.c b/drivers/accel/drm_accel.c
> index aa826033b0ce..ca3357acd127 100644
> --- a/drivers/accel/drm_accel.c
> +++ b/drivers/accel/drm_accel.c
> @@ -20,8 +20,6 @@
>   
>   DEFINE_XARRAY_ALLOC(accel_minors_xa);
>   
> -static struct dentry *accel_debugfs_root;
> -
>   static const struct device_type accel_sysfs_device_minor = {
>   	.name = "accel_minor"
>   };
> @@ -73,17 +71,6 @@ static const struct drm_info_list accel_debugfs_list[] = {
>   };
>   #define ACCEL_DEBUGFS_ENTRIES ARRAY_SIZE(accel_debugfs_list)
>   
> -/**
> - * accel_debugfs_init() - Initialize debugfs for device
> - * @dev: Pointer to the device instance.
> - *
> - * This function creates a root directory for the device in debugfs.
> - */
> -void accel_debugfs_init(struct drm_device *dev)
> -{
> -	drm_debugfs_dev_init(dev, accel_debugfs_root);
> -}
> -
>   /**
>    * accel_debugfs_register() - Register debugfs for device
>    * @dev: Pointer to the device instance.
> @@ -194,7 +181,6 @@ static const struct file_operations accel_stub_fops = {
>   void accel_core_exit(void)
>   {
>   	unregister_chrdev(ACCEL_MAJOR, "accel");
> -	debugfs_remove(accel_debugfs_root);
>   	accel_sysfs_destroy();
>   	WARN_ON(!xa_empty(&accel_minors_xa));
>   }
> @@ -209,8 +195,6 @@ int __init accel_core_init(void)
>   		goto error;
>   	}
>   
> -	accel_debugfs_root = debugfs_create_dir("accel", NULL);
> -
>   	ret = register_chrdev(ACCEL_MAJOR, "accel", &accel_stub_fops);
>   	if (ret < 0)
>   		DRM_ERROR("Cannot register ACCEL major: %d\n", ret);
> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> index 17fc5dc708f4..5d57b622f9aa 100644
> --- a/drivers/gpu/drm/drm_drv.c
> +++ b/drivers/gpu/drm/drm_drv.c
> @@ -70,6 +70,7 @@ DEFINE_XARRAY_ALLOC(drm_minors_xa);
>   static bool drm_core_init_complete;
>   
>   static struct dentry *drm_debugfs_root;
> +static struct dentry *accel_debugfs_root;
>   
>   DEFINE_STATIC_SRCU(drm_unplug_srcu);
>   
> @@ -752,7 +753,7 @@ static int drm_dev_init(struct drm_device *dev,
>   	}
>   
>   	if (drm_core_check_feature(dev, DRIVER_COMPUTE_ACCEL))
> -		accel_debugfs_init(dev);
> +		drm_debugfs_dev_init(dev, accel_debugfs_root);
>   	else
>   		drm_debugfs_dev_init(dev, drm_debugfs_root);
>   
> @@ -1166,6 +1167,7 @@ static void drm_core_exit(void)
>   {
>   	drm_privacy_screen_lookup_exit();
>   	drm_panic_exit();
> +	debugfs_remove(accel_debugfs_root);
>   	accel_core_exit();
>   	unregister_chrdev(DRM_MAJOR, "drm");
>   	debugfs_remove(drm_debugfs_root);
> @@ -1193,6 +1195,8 @@ static int __init drm_core_init(void)
>   	if (ret < 0)
>   		goto error;
>   
> +	accel_debugfs_root = debugfs_create_dir("accel", NULL);

Did you test this with CONFIG_DRM_ACCEL=n?
It looks like you change the behavior with this change in that we'll 
have an accel debugfs directory created, even when ACCEL is not built 
into DRM.

