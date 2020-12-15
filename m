Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FAE02DAF51
	for <lists+dri-devel@lfdr.de>; Tue, 15 Dec 2020 15:48:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 980576E3C6;
	Tue, 15 Dec 2020 14:48:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750059.outbound.protection.outlook.com [40.107.75.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A97A6E3C1;
 Tue, 15 Dec 2020 14:48:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jIMsjX7WIVOTZvcdmYRfVHYqhvVIJ+v99AQMbSXdrsa1myumenMpvr1x9zNIzbJPwU5zjLBv3oHkTY9twskNimhcjfEzoAM9NW2OSQM83r1XYOfhGye1ue8FHfKRif/k9SMvvp4sUrn9T+XdyNvBcY8JoHvatM4p2dO33ig+C95uG1Ffv3rNEKgebuylIHM32NGEVRufJtoh17cED76sHJi4ofSm7K4KuLkPaGOEDOhuEnNENzuF1Xlgwuj9vO3MWkoa3IdiIauesLJF70zK7HM+fa9D1hiPF5Z54f3yo6yqyTZxSxbZeYOpcSwaFxmxTC42HFVDfnFSy9p+ZpV1+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5VIsT7gSoXDVJ6QYw2lWaO2qkFchbLEqXIqeJhN0bjQ=;
 b=jDs1fSsNP+EGbU15O18qLYhrqybjsET+8r5aCGcl/okBumn1NeYHYgzFL13xE0N2VoLL0+ce4opf80GMnrcPYX/FvfK/KY8zxZumsifW7y7wnICtFNlfFmnmDtkNkrF1LYpkj39d87elF/YFwFwnj39i17p3jl9sUcxOWXtppkU/QPlcge5iUsmYz0kvLQxPc9uXCxyN6eCBKl5LpDNodIK9WSnJ7nxbVjfsn/csnyoROgDnvZeKuJVdT5wwS5bcIV4Nmyo2+6AbGaEswft1aX6/4wYOnMaa8JKqOpqWwoPh/ISmH//YaigdsN+TpI9HeccMJ64DAp7XaSeMLIb2QA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5VIsT7gSoXDVJ6QYw2lWaO2qkFchbLEqXIqeJhN0bjQ=;
 b=SYHpXqn1/T+G1OHfwW1j8RjNTnjdKiaO2HtbssuOR7FD5YRUfAgv6xfSiDpwEtOJxf5HXueKCic4bov9BOt/8R/SO8l9K0F+pOlQrWF0hXsH5shqlDocDQryW5b5zyTg/O0batD0sQ6iN3dJUPbueJ+MmOR4jZvcBHdIEy1w0QI=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB2514.namprd12.prod.outlook.com (2603:10b6:207:43::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.24; Tue, 15 Dec
 2020 14:48:09 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5%3]) with mapi id 15.20.3654.025; Tue, 15 Dec 2020
 14:48:09 +0000
Subject: Re: [PATCH] drm/amdgpu: remove h from printk format specifier
To: trix@redhat.com, alexander.deucher@amd.com, airlied@linux.ie,
 daniel@ffwll.ch, lee.jones@linaro.org, Felix.Kuehling@amd.com,
 nirmoy.das@amd.com, sonny.jiang@amd.com, xinhui.pan@amd.com,
 colin.king@canonical.com, James.Zhu@amd.com, leo.liu@amd.com,
 thong.thai@amd.com, vegopala@amd.com, boyuan.zhang@amd.com,
 Monk.Liu@amd.com, mh12gx2825@gmail.com
References: <20201215143835.1874487-1-trix@redhat.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <e71eb9ef-d5f9-0829-670f-d5c2c644a493@amd.com>
Date: Tue, 15 Dec 2020 15:47:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20201215143835.1874487-1-trix@redhat.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM0PR04CA0065.eurprd04.prod.outlook.com
 (2603:10a6:208:1::42) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR04CA0065.eurprd04.prod.outlook.com (2603:10a6:208:1::42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.12 via Frontend Transport; Tue, 15 Dec 2020 14:48:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 8255b853-1b21-4003-c09f-08d8a1087091
X-MS-TrafficTypeDiagnostic: BL0PR12MB2514:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB25140DEC0F6746737831D2D983C60@BL0PR12MB2514.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: m2SF5cqIAe82Ae31Ewc26g9tHTzvcJtpnCb2ZxmhiroE9+mPfgGBVNrRv7ZUhcis26dSmlJqFD0dIRjKTLx0U2kRO7WOTyToWwSsIehsPiSii/l0XG0Qnv+gbmniWxM2Tz61CBJN4sHTD8FIQp8ulbVAnkkKq7fZO2shjkCnT5onViotTBIAdEhoFi/AcYyfHRFrgy2IvNzOaOGifV9gjYnVAbC08X1AnpBySZm6mdDj/YS4hBSm+DcinNxrdb+/dULZ089PCK1mj/5ZFZ7OtBQyI5pmkcVmR/59XCfyTntNzQVIIuv161WGLHgkTg7NA+DMI+J9JTGq5GCE4VgBPrcWoQMNHz7NI45p3DEY50IbYSkgEA/d2u5/1vlRuGqTM144N1xN5mnrnAKReqg7R1RMy/FkSt/jajcs3GMESZ/drYU+B/rkdYCDnPCgC8hGgdwlQs9MNr5qDphy1J0jkA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(136003)(346002)(6486002)(2906002)(8676002)(86362001)(5660300002)(36756003)(31696002)(921005)(52116002)(66476007)(6666004)(4326008)(66556008)(508600001)(66946007)(186003)(34490700003)(8936002)(31686004)(83380400001)(16526019)(2616005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?SDBSek5yVi9yVkU3MDA5N05WL3VnK0h2dmlYT0hqOG1ud2Y2VCs0VXRkS3J2?=
 =?utf-8?B?TDhERWh3ZVJSWVFyOENySFZvVkE0NndyTkpvTE4wQWt0OGpubTdBaXpmeTZq?=
 =?utf-8?B?WFpETzM4NXlOODhlV1FEbWdLOWtiUmJ3R3V5b0xzNkxJem1rMXZDQ251RGlt?=
 =?utf-8?B?TVZFdDdZNTYxZzE5OEgyV0J3S1J0QjQwL0JaRURUdzVpekExMUpUSytqSkNN?=
 =?utf-8?B?RDBxaFFpN01MQjJCcWhlQ1RUZ3JpTDJKai9QM1IxRlYzWnBDL2VQaUtmMENl?=
 =?utf-8?B?MnVLdnFMNnJwTnVjS1ZaNU9lOXdvQXV1SnM3cHA0dWNISE5LWmwzNGo1V05I?=
 =?utf-8?B?ZEZQUUg2K2dSNTVVM2JUOHl0SHV1MkF3NGtJVjRXYnN6bGJiVzBjdVpoUTZ5?=
 =?utf-8?B?ZUxGYkh5YmljT2ZBZzZkMGdxKzlzbXNBN1grUlQ0V2kvaUdaRTZxN252NXlo?=
 =?utf-8?B?OG1vd0JKWUJOTlZibXZwaDE0S3Jpa1M0ZXlMT1FQVHB0UGR4dWt2UmlNZEtL?=
 =?utf-8?B?Ulo0eVd1V1M0SVE0WXF2OTdzUGFnbEttYzBDUCtQRlJMd2c0R1laQ2tyVHRv?=
 =?utf-8?B?Zkw4ZE9jWHN0bkpaU3ozakZKODJYWnd4NW9vTmVMbDV3cS9pbzBXN3JpaHJL?=
 =?utf-8?B?TURmeDdidGp1bFByRGFMeUZBUUtFZ1lwdU9VZmlGTUVONEFrM3Q2Wm1mLy9Y?=
 =?utf-8?B?ME43MkZqMnYwVmw0RS9SRXZTaWdjWkhaT0ZRMXpRQzg5elhYanFBcVhzTlRv?=
 =?utf-8?B?TkJnMjFCSEtvRy8xZlVCa01qb29neW1jT0VNa1I0YzRKT1pmUDJ2WFJqTmF1?=
 =?utf-8?B?VlhQZ2tpekNra3lzUEhLMkdjbElYR0ZPWDd3UVZRckFmcS91NGs2SXlFMGJC?=
 =?utf-8?B?UDlzQ3pRNkdxRW9LeW14eUlQYmZxZXVuVW1RcnVDTjhBNXBJQ1JaYVJrMDZk?=
 =?utf-8?B?b0I1OTNEampzMjY3OWl0ei82T0ljQTlET09YWWhpY1gvdGhkSXl1VnA2WlJ3?=
 =?utf-8?B?SkxFS1lKQWZvVnV1OVpwVEdpSmZRdmJzTG9lZkNPWW9kd1RlRER1Mk9iSUlF?=
 =?utf-8?B?U0Z5RmpmMWZ5YjFPUU9tM3pSOUU2bVRvTjFrTmxnTnQ3ZVFHaW90YXJyZUJC?=
 =?utf-8?B?RkdmWTBHODhLTGNnYmFuYjVJZ0Z0UVQwWUs3dnhjZWpQa1E4S1JWdUdZMjhY?=
 =?utf-8?B?UGUvbExWeGIwRzZDT2VuMmxGOU1rTUhtSWk5d2ozZFRod2h6NEFESHJ6Ujht?=
 =?utf-8?B?ak5YZ2xNWnhIM1Mvd3ZTc3lSWDExZGF4a2R1ZExXcUFnbVFNZWdsV01pK3VP?=
 =?utf-8?B?OWpKSVdkRVlZclkxZkMxNXk2N1AzeWVXcjZZaDVGWFZPRkY5aVVvS3BiTnFY?=
 =?utf-8?B?SXVLMSt1dkxteWZBdXlUVXkzSEVCLzRrWFpxU2kvWm1abnBTbXFLb3VIOXdC?=
 =?utf-8?Q?JSkH4pxE?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2020 14:48:09.2286 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: 8255b853-1b21-4003-c09f-08d8a1087091
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oZyTrJH+PBxVjKRypxRYkMz1eD/hAIgMXiQ4muXKAkOcdq9J8QyWify2k3QsW4Jk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2514
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 15.12.20 um 15:38 schrieb trix@redhat.com:
> From: Tom Rix <trix@redhat.com>
>
> See Documentation/core-api/printk-formats.rst.
> h should no longer be used in the format specifier for printk.

In general looks valid to me, but my question is how does that work?

I mean we specify h here because it is a short int. Are ints always 
32bit on the stack?

Thanks,
Christian.

>
> Signed-off-by: Tom Rix <trix@redhat.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c | 4 ++--
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c | 2 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c | 4 ++--
>   3 files changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
> index 7c5b60e53482..8b989670ed66 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
> @@ -240,7 +240,7 @@ int amdgpu_uvd_sw_init(struct amdgpu_device *adev)
>   
>   		version_major = (le32_to_cpu(hdr->ucode_version) >> 24) & 0xff;
>   		version_minor = (le32_to_cpu(hdr->ucode_version) >> 8) & 0xff;
> -		DRM_INFO("Found UVD firmware Version: %hu.%hu Family ID: %hu\n",
> +		DRM_INFO("Found UVD firmware Version: %u.%u Family ID: %u\n",
>   			version_major, version_minor, family_id);
>   
>   		/*
> @@ -267,7 +267,7 @@ int amdgpu_uvd_sw_init(struct amdgpu_device *adev)
>   		dec_minor = (le32_to_cpu(hdr->ucode_version) >> 8) & 0xff;
>   		enc_minor = (le32_to_cpu(hdr->ucode_version) >> 24) & 0x3f;
>   		enc_major = (le32_to_cpu(hdr->ucode_version) >> 30) & 0x3;
> -		DRM_INFO("Found UVD firmware ENC: %hu.%hu DEC: .%hu Family ID: %hu\n",
> +		DRM_INFO("Found UVD firmware ENC: %u.%u DEC: .%u Family ID: %u\n",
>   			enc_major, enc_minor, dec_minor, family_id);
>   
>   		adev->uvd.max_handles = AMDGPU_MAX_UVD_HANDLES;
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c
> index 4861f8ddc1b5..ea6a62f67e38 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c
> @@ -179,7 +179,7 @@ int amdgpu_vce_sw_init(struct amdgpu_device *adev, unsigned long size)
>   	version_major = (ucode_version >> 20) & 0xfff;
>   	version_minor = (ucode_version >> 8) & 0xfff;
>   	binary_id = ucode_version & 0xff;
> -	DRM_INFO("Found VCE firmware Version: %hhd.%hhd Binary ID: %hhd\n",
> +	DRM_INFO("Found VCE firmware Version: %d.%d Binary ID: %d\n",
>   		version_major, version_minor, binary_id);
>   	adev->vce.fw_version = ((version_major << 24) | (version_minor << 16) |
>   				(binary_id << 8));
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
> index 1e756186e3f8..99b82f3c2617 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
> @@ -181,7 +181,7 @@ int amdgpu_vcn_sw_init(struct amdgpu_device *adev)
>   		enc_major = fw_check;
>   		dec_ver = (le32_to_cpu(hdr->ucode_version) >> 24) & 0xf;
>   		vep = (le32_to_cpu(hdr->ucode_version) >> 28) & 0xf;
> -		DRM_INFO("Found VCN firmware Version ENC: %hu.%hu DEC: %hu VEP: %hu Revision: %hu\n",
> +		DRM_INFO("Found VCN firmware Version ENC: %u.%u DEC: %u VEP: %u Revision: %u\n",
>   			enc_major, enc_minor, dec_ver, vep, fw_rev);
>   	} else {
>   		unsigned int version_major, version_minor, family_id;
> @@ -189,7 +189,7 @@ int amdgpu_vcn_sw_init(struct amdgpu_device *adev)
>   		family_id = le32_to_cpu(hdr->ucode_version) & 0xff;
>   		version_major = (le32_to_cpu(hdr->ucode_version) >> 24) & 0xff;
>   		version_minor = (le32_to_cpu(hdr->ucode_version) >> 8) & 0xff;
> -		DRM_INFO("Found VCN firmware Version: %hu.%hu Family ID: %hu\n",
> +		DRM_INFO("Found VCN firmware Version: %u.%u Family ID: %u\n",
>   			version_major, version_minor, family_id);
>   	}
>   

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
