Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A517A520064
	for <lists+dri-devel@lfdr.de>; Mon,  9 May 2022 16:56:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A88D10F1C8;
	Mon,  9 May 2022 14:56:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 430C510F1C8
 for <dri-devel@lists.freedesktop.org>; Mon,  9 May 2022 14:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652108191; x=1683644191;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=31R3RkSDML7s+wze/ImFmkHlM+4bq7Pfsi18f4WVb20=;
 b=BAIoqaRAh3BhgdWqzLm6/6GNuSr4iPzKetwaTYHCRu1pzn33SuI/qNWJ
 JDAiJaDva9254VQ2pyRGZGJ646XwNpNBC61bcqdvmMbOZTFyt6x2vCB+3
 q2eVNSZK/1a8OiiNw3PUpogkfM6oeYLgz1Y8JE2rmLUkhLLnprlEKFPV5
 REvtXi2frjVxN3erGwqtx74SUsbJdRyhCz6/eaoPhifIjNx1+W9hVNYrq
 9nSksnFxCuCFgqIBNY51b5gsWRhfuV9dOMEsGVyQBScryW/S3cQHTgby6
 QeiQ861HQ4+8Xb3fkCEGgXCmbRdW89u1pGuiVYsgy9kao+McFEpp+t9Ll A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10342"; a="269004119"
X-IronPort-AV: E=Sophos;i="5.91,211,1647327600"; d="scan'208";a="269004119"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2022 07:56:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,211,1647327600"; d="scan'208";a="592616370"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
 by orsmga008.jf.intel.com with ESMTP; 09 May 2022 07:56:30 -0700
Received: from fmsmsx604.amr.corp.intel.com (10.18.126.84) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 9 May 2022 07:56:29 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Mon, 9 May 2022 07:56:29 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.46) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Mon, 9 May 2022 07:56:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HcNA07MeFHBpsr0YzWpol46ZDFO6KfmLyHUI8fsKvKIgTK9X6mUilIFWi8dZGN0IWEE7t2GO+vhgYN5aE+S7884DaWfGWNKaJWXdC4ixxzrmsTDmYCT2efM8Ip5EjZxyojrCirvMu1KCnJFAPR2/HhvwH59TkRzbLw82Nx27XGKQ8pcHFGDJ5FzhBcMy+m7mLrLvRKul7aHt0uIJwGHHu6vf0QJtgveMyfisZ3JclJgCGEBO52HmJhHrS8InQQH/A1o9Ul9cgWONtW3n5m5JLPknIeEraIsHN3r6ulDH9NCbnuR3W2x3Bz/71PD+4kFbMX4oYgk6offxAHWHEl21vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SR+iUVOqBae8sr5JYxKNBeBEm1Adkj8U63qKO8G6DOw=;
 b=S/6q21QxnF/h2tEP119eMdZI1CidjmwVXqg1vCo/GAGJqtXcI9baYKNqi7JalDeb0OEkSy1QfJp98R31gWnNpuAaQEDFQo4JzsH6Uw6Gzbq+q9/JBjLSA+O3D1F9Quyx2PRLb8IGuR3TNFDg9v2zRYYKqy/pSCbU0LSrrl0qbXuE7+JIKprCJuTpLn0BhSh8BdPIipb9BZ/6yr5Jc0N9+ytAi1OWT7vjK2fj8NS4iPiY30wGT2eo5p6D8uVVxB2hbAzI1PpGUcdoK8G/ZmvVtttijD15nPLcwK6QOlri5UwWGhD2aHV6S7+E7MZvgMpXyKNRZYQeSvKq8fJMf2imbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB3180.namprd11.prod.outlook.com (2603:10b6:5:9::13) by
 BN9PR11MB5356.namprd11.prod.outlook.com (2603:10b6:408:11d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.21; Mon, 9 May
 2022 14:56:28 +0000
Received: from DM6PR11MB3180.namprd11.prod.outlook.com
 ([fe80::b1fa:393c:9fb6:6871]) by DM6PR11MB3180.namprd11.prod.outlook.com
 ([fe80::b1fa:393c:9fb6:6871%5]) with mapi id 15.20.5227.022; Mon, 9 May 2022
 14:56:28 +0000
Message-ID: <753d0350-42dc-389b-b10b-4533ddcf32ac@intel.com>
Date: Mon, 9 May 2022 16:56:23 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.8.1
Subject: Re: [PATCH v3 1/4] fbdev: Prevent possible use-after-free in
 fb_release()
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>,
 <linux-kernel@vger.kernel.org>
References: <20220505215947.364694-1-javierm@redhat.com>
 <20220505220413.365977-1-javierm@redhat.com>
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20220505220413.365977-1-javierm@redhat.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0085.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:190::18) To DM6PR11MB3180.namprd11.prod.outlook.com
 (2603:10b6:5:9::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d78f92dc-5226-4f30-fcd4-08da31cc1865
X-MS-TrafficTypeDiagnostic: BN9PR11MB5356:EE_
X-Microsoft-Antispam-PRVS: <BN9PR11MB535643532FB9E3D586EEA0C5EBC69@BN9PR11MB5356.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZedM0L5nTDCp4ZhVwc5XiaQ3QoaPDZLFt2P6bZ5XxYtAHcrpftC21irryAj+77AQzF6xcKJr2hdga3/Qlv4CBRyFIYK6+Se6JtYpMDM+sFEMRWri6EnXhVyAf0YL2joOQrAv16cPG9vudrA+eY0Xc1KexZxe/1xRGAOf78PaSE3KA2I0tmagzd8d/PpG0jvH0ca++iIUqt/pMBavupuOzqWxRR0/P2TyAmO3tP0cKId4zV4FTwIyz1FvW3j9pXVXtHxe5sHcDq6wme0rcSCykeywPFY4KUGDJDFu1RXDXI6VENyB6LY9sOUbOkhk8pEkTa4tvGH29+RA8pI+AQ0y4GX5180xcplC2lPxybabJtWnyIwwxA78iBkRl6sUdnZ1j4L51Zo429jRT21asM58iA+l2pKyF6DAFCrPoZdiwk3y2SFN+TWuURjtbOYI2PczmpZNzssiJveNNCQ43jHNBFbFTd8PL/RiXzhOseBYcixFoE/7YQ2sn9W/1lFzgF/DJw/Jts3RnEMRVy5ncIztv5vvktJ56kyk6Gtw33y5oY//Ey8krm2Lr9cHOf3Yct/iHFcYVXb2UKByMRbqMIgvsQvv6a4Cp9dO6MsiMq3gqYRpgoej4KW1V2deJa3EHnrw7r1w3oCwOhlazJdwFI/7z5aShC2/QWSVta4QaKDYoNg6owUhVFpL8o2qvw4cIJfusf7Fm+lIuAmS0OVK3huIEj2JXmkpret48QMwhY1nEDw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB3180.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6512007)(26005)(107886003)(2616005)(186003)(4326008)(31686004)(66476007)(66556008)(8676002)(66946007)(44832011)(54906003)(5660300002)(36756003)(2906002)(316002)(38100700002)(508600001)(6666004)(36916002)(6486002)(31696002)(86362001)(53546011)(6506007)(8936002)(82960400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WXNnRXU2eTZaR3ZxMzhZR25xQjlIWlk0VC9leVd3UVlsbmtCbUFtTWNEMStW?=
 =?utf-8?B?b3ZBOVVKMXhsdTZmQnJRa0RoMjdaNlgxbE83ek5SR09mOVNjL1NIL2pMdlJK?=
 =?utf-8?B?YXJmOGJLeEJZdndLb0c0dkVxTDNlUVZicUo4ckpweU5XalNNbDFma1UvWWl2?=
 =?utf-8?B?ZlY1a0hJNVJ1bzNrRWVIdUhjTXRobTlwTzZRRVlVYW5scEhsNDFuTmVlQXVS?=
 =?utf-8?B?RG9rQlVMUG44UVNwVGtMVjE5TTNidDJibHI4RlNYVytIcm5LK2NkZXo2ajFB?=
 =?utf-8?B?RDZvUVJ5dGFrZUx6Nk5VUFA4bmY2VGQweEN0Qzg5K1RjZzU0U0tpS2R2cFJm?=
 =?utf-8?B?THhkRExRZEllS1MzUmpoR2ZMaWRxR3l1UVlWalYxU1J2MS9jYThaczY2NnQx?=
 =?utf-8?B?SmdIdEZ2U2VzRGppaldqYUJjSm5PQ2tVekMzcEFCOWZqQ2pJeS9KL2NZSGR3?=
 =?utf-8?B?bjFMRTliYkpYS3YrMkVDaHByNERnN0JNeGVrNUZqZWhVSlUvNEdoTXB0K2tB?=
 =?utf-8?B?NFpveThPc3I1WUdNZXhMWnpFY1pJMkxsVUE3K2Q5MzBSUmZ2bjBrdEZZVTh4?=
 =?utf-8?B?a2QyRGV0NEdTTzRsTG9jcHg3UE9SUFRHQWlvYkFDdXA2amR5UWRrcmlUSHFK?=
 =?utf-8?B?TWNwVVl6SnV2Nkw1SHlXRWZCbFo1U3NHbkNjWWZqMGVTRXJ6cHhnUFcva0M5?=
 =?utf-8?B?STZSMmFYclgyakc0a3dHRnZRQ2E0aUp6dnZZTjAvRW8ya3hlLzhJR25POEZz?=
 =?utf-8?B?dUM3aUlPUXJaOWd3VVB5dzUzVjBNZmxoZHdWc3diWndSNTNOeXMwYzZNTFZ5?=
 =?utf-8?B?RTVkV3A1SW9RaUhpVWYrUnZNVWx4YUJFZlBUbUFOTENPVGRvMDJ2cklCVTVa?=
 =?utf-8?B?THBqWlZwakxDY2xJVVczWmNzR1l6RWQ3UDNWelpFZk93Rm1YaFluc0hQNlQv?=
 =?utf-8?B?REFxeVRUTHNMekU2aFBSSUxFNmFST1NMekFLODE2SVVGQTJPeEFXL1NSZ1ZR?=
 =?utf-8?B?d2hZVHA1aldaRGl4S3pDTVNvOEY0dHRTWjZMcUJqeUZxTStneHIycXpJNWd1?=
 =?utf-8?B?QkVtU1JidlZaRDB6eU9EdEhrNGVoazNSVXAzNWJzcDgrbFE1YWR2QzB6bzh2?=
 =?utf-8?B?anFSTXh5K2dpOGxjemwvYzRDV3Y3a0FQVkgvblJLYngzYzVNdnNvdVBaT2xH?=
 =?utf-8?B?cTVua0xHdGNaTnZFdWdDeUh6N3NiTjRldEdBVEhvcmd0SWFtcXhDNUxrMVls?=
 =?utf-8?B?Z0xzaVkzMGZidFdDcTh1V2VubktXblhjRXZCRSt5UlAvQ3BXb3YxY1lvejdI?=
 =?utf-8?B?Rmc0ZHJmUEJ4ZVFZYUx1eHUvWFhnTXU3V2ROVG9SQTdWaVBNd3M3SHlHZXg3?=
 =?utf-8?B?TVdKSjJnZk9mcGtWMEl4ZldjeHV4aFlwK3QrWWs2VjF3b0hYRkRBOHR1YjdT?=
 =?utf-8?B?ZDk4UEgva3dxY1hFOE03cTQ0cmxISUFwWnFMRlBDSGZnRlVnSyt3SU5hTk1T?=
 =?utf-8?B?U2hJWmx3b1VtMUsyV3Q5dHFLaUNvaHkzdGFDVHE3OXljVWU1Vnd5L0l3elN5?=
 =?utf-8?B?U28vU21sdThUd1FFc0dOMXV5d1BmT0loc2VSb0JqT21zRmlzYWxnSlJ4N1Q2?=
 =?utf-8?B?OHlvaUgwZi9mRnBPTHhBb2RKSmwzallQV3JveUZRN0JvN3F5cExXTWIyWHdR?=
 =?utf-8?B?ZEtFNmp2TG9TN3RqVGtndDhwS0hGYVBRelU0dTFhaEdwNkVKY2xnVCs1WGhi?=
 =?utf-8?B?Y1RFbElYbys0WU9yTVQ1VTNpVVdyWkl5L2FLUG5RZ05wY1VmNkpBbEhYTURL?=
 =?utf-8?B?cUd6Zk04TG9XWnZYcXFIOUNKUnRQZWdxZHF6TWVsa3JSVzMwbFNhaU9OMGVF?=
 =?utf-8?B?bnVCWE5OazAzSFlMOUpnQ2dGd0F4cmlpbm43WjlMa21rbkpGdTVlQlo4TElt?=
 =?utf-8?B?Z1hUd3E0TWMxMFNYSmp3eU12STJ6K3Fxd1hpZWsrSjJ2emZ5bElwYUNpRzZ3?=
 =?utf-8?B?WFZGcS9HQytkSGRXVUtkQWRFeWJIeGhicWdha1krY29UZG8yalE0S3BoQWNy?=
 =?utf-8?B?WjdQK3RLS1VBZDc0bm9NcGpNNGxPS2M1UGtaTmhleEJ3Y09kbG9Jb1gvNHpo?=
 =?utf-8?B?SkxwSkx5K0JSMUNOSU1xSFcxSU96UVFQSTBmdWNkcXVTbm9nTFl4OXhidkpj?=
 =?utf-8?B?Sldmc3kwMUIwRFlkbU12MUpKMnFFN1lsWjZUMnFJUVR0RmlSVXI0SUgrTVBE?=
 =?utf-8?B?eWJ5WEdlS3NNU3VCVlk5S01lcmhaMGdYZXpLbWRtYXI3VHVKellvMkpuVkNO?=
 =?utf-8?B?N016SHNha09pdzJMMDVibS8zNGxGRHF2a3VXU25jSVc0VEFwY0YwSDdKRzBm?=
 =?utf-8?Q?/HOwpXXtOt33I2Bk=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d78f92dc-5226-4f30-fcd4-08da31cc1865
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3180.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2022 14:56:28.1741 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jPcTPPRb8m1EEsdQ7IMpTxg5u+M8NCIymFOAlg/jEQ2ByezU+XpC/QqNY/9GGpfxhtbZdkfRs7vSuhcQDmpSXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5356
X-OriginatorOrg: intel.com
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
Cc: linux-fbdev@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Helge Deller <deller@gmx.de>, dri-devel@lists.freedesktop.org, Thomas
 Zimmermann <tzimmermann@suse.de>, Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 06.05.2022 00:04, Javier Martinez Canillas wrote:
> From: Daniel Vetter <daniel.vetter@ffwll.ch>
> 
> Most fbdev drivers have issues with the fb_info lifetime, because call to
> framebuffer_release() from their driver's .remove callback, rather than
> doing from fbops.fb_destroy callback.
> 
> Doing that will destroy the fb_info too early, while references to it may
> still exist, leading to a use-after-free error.
> 
> To prevent this, check the fb_info reference counter when attempting to
> kfree the data structure in framebuffer_release(). That will leak it but
> at least will prevent the mentioned error.
> 
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
> 
> (no changes since v1)
> 
>   drivers/video/fbdev/core/fbsysfs.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/video/fbdev/core/fbsysfs.c b/drivers/video/fbdev/core/fbsysfs.c
> index 8c1ee9ecec3d..c2a60b187467 100644
> --- a/drivers/video/fbdev/core/fbsysfs.c
> +++ b/drivers/video/fbdev/core/fbsysfs.c
> @@ -80,6 +80,10 @@ void framebuffer_release(struct fb_info *info)
>   {
>   	if (!info)
>   		return;
> +
> +	if (WARN_ON(refcount_read(&info->count)))
> +		return;
> +

Regarding drm:
What about drm_fb_helper_fini? It calls also framebuffer_release and is 
called often from _remove paths (checked intel/radeon/nouveau). I guess 
it should be fixed as well. Do you plan to fix it?


Regarding fb drivers, just for stats:
git grep -p framebuffer_release | grep _remove | wc -l
Suggests there is at least 70 incorrect users of this :)

Regards
Andrzej
