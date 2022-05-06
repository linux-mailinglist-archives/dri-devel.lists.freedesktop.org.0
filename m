Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5914551D879
	for <lists+dri-devel@lfdr.de>; Fri,  6 May 2022 15:07:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D95CE11216F;
	Fri,  6 May 2022 13:07:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCFEB11216E
 for <dri-devel@lists.freedesktop.org>; Fri,  6 May 2022 13:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651842463; x=1683378463;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Z5MIRzoEwyVB6U/O1C02Y/jLdXvOmxGiNl/MH8wZH/M=;
 b=HfVFbipI3xmdKyWEVTvyDq20sXlJ+QpCtVzzh6BvrGCSXvd62bn8NmCL
 pBO6VPgQCeM11Zgs1mXcn8u3R06ljZaADTcaOSqG42L21FL6v0tjkKMmA
 /fyPzF1xpOZuy3GG00FtyVG+YcnwvCHtngGVPmeB0yOsLJDO2q0JU6X/N
 pY45LKoISA9/l66OSRD7tCqEahv95Rwaas56wfdToyC7A3UDT5/MdF6p1
 EKU9BlNzfQvDPmC9bW01WyswjBZoBHZYT9x5Cn6OyhHKwMXe3kdJ3AXrv
 t83PKTwT6tcxMRYu/vnpazgUnSJiaIYAfsppYqLDlOK3/4UwB7QYhzKAg A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10338"; a="293668797"
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; d="scan'208";a="293668797"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2022 06:07:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; d="scan'208";a="563806147"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga007.jf.intel.com with ESMTP; 06 May 2022 06:07:42 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Fri, 6 May 2022 06:07:42 -0700
Received: from fmsmsx605.amr.corp.intel.com (10.18.126.85) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Fri, 6 May 2022 06:07:42 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Fri, 6 May 2022 06:07:42 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.171)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Fri, 6 May 2022 06:07:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rr/nL75nWvvVQpUcLj1GTv1aT5+GeLpBxNVehlbuSJl0Vhj5sPpls4LE0m1WI9TWgahT3YsWh3urvCBBPDhzjyL6GcoMxzX/u8Vmn9nJnrI8hYGGmyvQc66qXTULUg3mmQeSu59Q1QM6g6gV1+g6wlHIvf15xMFgQbh2Nv7ZxwO1Ljjzz542rgGJEngnv0+LlQpkSHQ8rAD/rszgo985X7R+zznRIzaKt/PjGavUiYWZIWLuBCb90NnzqIqAzkPlFyibi2so0h1e+b8I2x4YBKJQ3bMiw0lttkps6fe8QcS+T6WgcIH2AJWuGrwInAKSQnK7P9preNPbycspB81Plw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oior8rA7dJ5j1ZUMHCB74iIwINIzYrhyzbiiCOuDmZA=;
 b=Eu4XzDonOcIbthPdTCnUT1t96PmltJ5OeIkNISwwUnQPsg9wEZLMS90W0zmp0ZbrYQc7sZfllwtV16A0ToktZNf3isKEzKkbovP5c6g4nld7xcmkElMueVoKD9tFn5xhA57ITy4vE+0XPk4Pl3UTSmuJgvq9OhsEt0gUn45scks5zkRSKkCVe5E1okulIah7+YMsV/J2f1mMVVWkY4UZghNySTzt/K4bLXHbSc0qKc+Sz06it4DS1G5dH4G7Ja3sbbSn8XFphAYf0d76Mb/vJJVpRVdBSrSaDhdQsJxyPn5/rfnAboJ0ZI3+LGTA/7MWQKr96CT8UpkuF/E1/GU++w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB3180.namprd11.prod.outlook.com (2603:10b6:5:9::13) by
 SN6PR11MB2767.namprd11.prod.outlook.com (2603:10b6:805:5a::26) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5206.24; Fri, 6 May 2022 13:07:38 +0000
Received: from DM6PR11MB3180.namprd11.prod.outlook.com
 ([fe80::b1fa:393c:9fb6:6871]) by DM6PR11MB3180.namprd11.prod.outlook.com
 ([fe80::b1fa:393c:9fb6:6871%5]) with mapi id 15.20.5206.025; Fri, 6 May 2022
 13:07:38 +0000
Message-ID: <ed57ca49-f80e-9bf5-4dc3-59fb62ca4315@intel.com>
Date: Fri, 6 May 2022 15:07:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.8.1
Subject: Re: [PATCH v3 3/4] fbdev: efifb: Cleanup fb_info in .fb_destroy
 rather than .remove
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>,
 <linux-kernel@vger.kernel.org>
References: <20220505215947.364694-1-javierm@redhat.com>
 <20220505220540.366218-1-javierm@redhat.com>
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20220505220540.366218-1-javierm@redhat.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LNXP265CA0088.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:76::28) To DM6PR11MB3180.namprd11.prod.outlook.com
 (2603:10b6:5:9::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f43635a7-2443-426a-0917-08da2f616538
X-MS-TrafficTypeDiagnostic: SN6PR11MB2767:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <SN6PR11MB2767A9D0C07FC132C94A786EEBC59@SN6PR11MB2767.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Zl5OvHKpG8mZmnHS20r4dekQf/G+1Ao4Rz7TF+LZ6mV/ezrdd+hMIqRN816hQlKQlQ4cj1+fF5V0Z/51ihRPkBQ02sFCmJQePLbNb+a6ZEY0c5Ho9PDV2c6cWe5Gl4h7SfHRf8AZ1OYJQW5L3A4aWV1Hd1pmCh2r1csLmSJT+kwUyuMaBkTzSJeK4JgPG+pnigbggBIoIbWtW2KozMcBfybO4BOGWzdFaE9SLnQP5zPfI5J4RXg71uhOUPyyJLuav2hMWQS3CKQQxjNCnieqH/HXBOK7Ln+jWgcI4l4E+p/Fcrzg7R+0PJL97CJUVX0N5KZ8DF+0jRhAs6x0z94Ts+SlWjLqhZco6krI0XqnfjBggatlA+JYTfRR+HHLi54E8yCAoyhh3W4MiYArOAWd9yq4NNhcCEmONWx6a9wegpKEJa63rghniKZw2tqvtR9EPuyq2cOJZxgWeMOP+S/NN99sGIGjvf8PZW1RQjOFEpQk29IP2tsTKEKr3N5qFR5YEbtsTxOUSCcIU1gFaTxIW+BkswZkyQuFa8ggEGgQYsNidXa/6Sjbx/PPwXb2aVw5vy/4rZrxueoD/+rYsbcro7u21jsCrAdHn21ZHFoFlIGqh3zn5Qf+Pt2FXQ6F4xT+MtWBNVCBp3qSh0UmAIvVhxvSpFoUxMRkVIkYRJ85+IWvGUVrIk0oONtCiNsR8X/LmzlCLtVbHIj+UvQFcgpXlyyFaRbGZf1ot3YE9ViE0TW0UjcocFDP+pTZZkiBdWl33NsnD3yYthm3Kvx7xVFne8OpeMT/NiaLgqhUwAbUAIeEoYFwhX0OH0TbCCITCjkj0UUPcY+GxU2oE1SQScWXtAuY1Ot5XcDz2llRbwCAR1s=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB3180.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(86362001)(6506007)(53546011)(31696002)(6512007)(26005)(2906002)(6486002)(508600001)(38100700002)(966005)(8936002)(6666004)(36756003)(82960400001)(44832011)(36916002)(5660300002)(4326008)(83380400001)(66476007)(8676002)(66556008)(66946007)(31686004)(316002)(186003)(54906003)(2616005)(142923001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NUdvQ0k5TUpPUjRmbEFlU0dJYmFkdFZYRWFPS2pXSE5ySTJ1MjFDSkpucTZB?=
 =?utf-8?B?VUx0TXFtVEE4VjlRYnJEV21GWlRlVFEzeFA0TjN1WSs0TTJiblo5UXc3akxs?=
 =?utf-8?B?SW0ydU9vU3UvV3VUR0V1eXc0YmwvRE5sbjVqOXBtU3VkYkx0SnVDSUErQWE3?=
 =?utf-8?B?R0FuOFhMRFA3cU5BeFFOS3JKWDA2MVdaR2dlU0lZdE44Z1l4clZlR0J4a1VB?=
 =?utf-8?B?ZjIvSDJubXoxeUx0MzhiS0s0SzZmUHpOTGJuSDhLejNwZnpVVkZhbkhYdXZo?=
 =?utf-8?B?eWppRFBkT2dESnpiV1YyV1g2NlJsZnJtNW5VY0FTNVB6c2pZRDRUMHhEaFhD?=
 =?utf-8?B?dFVtNjRFR283QmFMVFVLNnluSm5TRlpuTkNhK2V0alh0TEdTcno3eDMxV1li?=
 =?utf-8?B?eXpHR3ByODhNTXlxTkNJb0VKdlpJS0Z5U1lQQ3I0YmxBRUlNZHdCWGtZaWYw?=
 =?utf-8?B?eVFxWmt6WVUxZUE4bWdZUHNwTHpiZGY0aHQzOHNJQmcyZW53YW9rdVJOY3kv?=
 =?utf-8?B?ZXJPSnFMRjdxc2R4RVUxak0yclROcWQzOXA4cTJNRTZTVEJiV0RVNkZzbkdZ?=
 =?utf-8?B?ajdsSmcxZ0hqV3dJbFdtV2RWUXdpcmpnRjJVaEVDZlRXamdzOStka3pQKzU2?=
 =?utf-8?B?Uzl5OW5rK2pwTHhsT0FuTFEyT3hCU2RoTE05c2kwS0l3TmpoUHQ2aFdJNTNW?=
 =?utf-8?B?RmlMVDJlbFFDNDNERkd6TVlMdmMyMjRLaEt6QXFjQWFnZTREaU03ckdHQU8w?=
 =?utf-8?B?bWZ4WmF0a2dHRVJCdEpFOWpweFVLYmhsejlia0s5QnA2bHNadE1NcG9BVndv?=
 =?utf-8?B?K25PSGNzaHhqVFhJVjNZVnB3bDlqSW9Pb0U5TzhMbDhUZjFCK2hQMjFWckdk?=
 =?utf-8?B?cFo2MUNjSWVud2kzL3EvTG94WGpHK1JYVE1UWjBGRkRmQ2R3VFBnVnh5bVds?=
 =?utf-8?B?QjZpeEh4V2tsYjMzRnpsUlRpYUE4NWR3RmlUS2pBcFd5ckh3Nk9BRkNlRDlx?=
 =?utf-8?B?dXJTZGd3anlDMGw3T3h2ejRaam9sd2pNV2pyMjNVTUZXSkVmOC9IWVB5NDMx?=
 =?utf-8?B?cExiamxaUXBWa0dTNVk1eXBiTGV4VmJOYUU0TldHVjZJUXBsYUc0VW9YT2VV?=
 =?utf-8?B?RXlDbjZvaWcwdXRLamdiTDZiUmFBaXN1ME42L2FlLzY4MlZuOWNGdk96K2dU?=
 =?utf-8?B?TDZLSmlnMXRycDRNbkdEKzF3M1o0eGs1Q2oxd1JRZXNhVUMxTTFhYnFrNWR4?=
 =?utf-8?B?b0w2dFhKcm1kajdJMzNoNWp0UjZlMmM3Z2ZGeDNBT3VFYkt3MzJhY3pWbjU2?=
 =?utf-8?B?SEpvdG5SUUZUKy9zRmZ6T3FXNjZKZWRlaU1MRVh5WmtUZU1pK015OEdGUnBq?=
 =?utf-8?B?M2Y5RHdvVWxadk9hYUliMlJwd0hyOERKU3ZrZldBaG5tNWNncktpUkdiTXNE?=
 =?utf-8?B?azB2a3Y4M3FuN09XQnl1UmR3Mm80NmpST1E3QVhjUGJhOG16MmtFMFpWWnZa?=
 =?utf-8?B?SGp4OGdFY0VaN25udWQvL2t6UXRBWE1SampneDNMb1VVSFpBeEZIUWtPOHBq?=
 =?utf-8?B?LzJ4NHA0TlQvOGRKd2FyVVdxUjNCZFZINXM3MjhYTEowUklJbnE4WlUvOEhH?=
 =?utf-8?B?bE1pMWFacklLenBFSVduUTdWTGJOTGs4TmMvVnFvK0FRVDV1MXh4c0FCMWNK?=
 =?utf-8?B?SXFBWWtWSlRVaHZoSk9RbWZpZnlpY1BjSkcxb3lOU2JWaDJUbXJNckJ2c0ZU?=
 =?utf-8?B?QWIwNGwxcFVudStYNFpFSURZejE1clRmVlEyTEVxMjljUUwveGhrZmtQakpj?=
 =?utf-8?B?M1pJaHRKcFZ4MzAycUx5aUZZM2ZaaVdiQkN6ZUJsTVpQSU9jWW9hT1l2WlU5?=
 =?utf-8?B?U0lvL0ZGWmsrYzBrakUwWG5qVWNmeHFBcjh4ZFlQWXVGSHR5bnZDdTl0Ulpl?=
 =?utf-8?B?QkRxbnZKUy95c3NvV1RIWkFWMCsvQ2haeG95eTFLd0ROb2x4dmZyaWU1bURs?=
 =?utf-8?B?VWZRL0w2amdIZlpibUd1eHFsNk1zeEJ2ZWFQU1VMcEZWaGxibWFOREN3WUZR?=
 =?utf-8?B?OEdvdXAvWGZSTnp6REZmaGFVZXRzbXBjRWREeEtkNm0wcjZ5eWFEdElVMkh3?=
 =?utf-8?B?VXF4dGwybDMzSVVnZDU5K0hLTjZlTVVLTnZRR25tc0ZYRXJ1Q1lNa1M1bm1u?=
 =?utf-8?B?WjJvcHhqUkdwekJvcU9JVVo0WXVZOHpzSWhTL3RVNm1wbzFmbVR4T3J6Q0Jo?=
 =?utf-8?B?dWpFYWhNSzkxdlFIY05ra0lCSWlyeUljTVhxVXV2bCtWeHdXWlpEN1VpZmFu?=
 =?utf-8?B?NG1UQjdCRm4wYU1DYVJRZ2tFdmdwNklnUXZrZ0lxWDhmdlQ2dEZWS3RaK0Ns?=
 =?utf-8?Q?7lz7tQoh3CTetKDs=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f43635a7-2443-426a-0917-08da2f616538
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3180.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2022 13:07:38.5819 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rb/3C3xykl+vvHl4XyNRPvU6yByqm4Cg/DFf4m+MB/3ZUwecAge7OR9SRiIrK5mr5HNA+UZoLBJXiOw2+cArNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2767
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
 Helge Deller <deller@gmx.de>, dri-devel@lists.freedesktop.org,
 Peter Jones <pjones@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 06.05.2022 00:05, Javier Martinez Canillas wrote:
> The driver is calling framebuffer_release() in its .remove callback, but
> this will cause the struct fb_info to be freed too early. Since it could
> be that a reference is still hold to it if user-space opened the fbdev.
> 
> This would lead to a use-after-free error if the framebuffer device was
> unregistered but later a user-space process tries to close the fbdev fd.
> 
> To prevent this, move the framebuffer_release() call to fb_ops.fb_destroy
> instead of doing it in the driver's .remove callback.
> 
> Strictly speaking, the code flow in the driver is still wrong because all
> the hardware cleanupd (i.e: iounmap) should be done in .remove while the
> software cleanup (i.e: releasing the framebuffer) should be done in the
> .fb_destroy handler. But this at least makes to match the behavior before
> commit 27599aacbaef ("fbdev: Hot-unplug firmware fb devices on forced removal").
> 
> Fixes: 27599aacbaef ("fbdev: Hot-unplug firmware fb devices on forced removal")
> Suggested-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> ---
> 
> (no changes since v1)
> 
>   drivers/video/fbdev/efifb.c | 9 ++++++++-
>   1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/video/fbdev/efifb.c b/drivers/video/fbdev/efifb.c
> index ea42ba6445b2..cfa3dc0b4eee 100644
> --- a/drivers/video/fbdev/efifb.c
> +++ b/drivers/video/fbdev/efifb.c
> @@ -243,6 +243,10 @@ static void efifb_show_boot_graphics(struct fb_info *info)
>   static inline void efifb_show_boot_graphics(struct fb_info *info) {}
>   #endif
>   
> +/*
> + * fb_ops.fb_destroy is called by the last put_fb_info() call at the end
> + * of unregister_framebuffer() or fb_release(). Do any cleanup here.
> + */
>   static void efifb_destroy(struct fb_info *info)
>   {
>   	if (efifb_pci_dev)
> @@ -254,6 +258,9 @@ static void efifb_destroy(struct fb_info *info)
>   		else
>   			memunmap(info->screen_base);
>   	}
> +
> +	framebuffer_release(info);
> +
>   	if (request_mem_succeeded)
>   		release_mem_region(info->apertures->ranges[0].base,
>   				   info->apertures->ranges[0].size);

You are releasing info, then you are using it.

I suspect it is responsible for multiple failures of Intel CI [1].

[1]: 
http://gfx-ci.fi.intel.com/tree/drm-tip/CI_DRM_11615/fi-adl-ddr5/boot0.txt

Regards
Andrzej


> @@ -620,9 +627,9 @@ static int efifb_remove(struct platform_device *pdev)
>   {
>   	struct fb_info *info = platform_get_drvdata(pdev);
>   
> +	/* efifb_destroy takes care of info cleanup */
>   	unregister_framebuffer(info);
>   	sysfs_remove_groups(&pdev->dev.kobj, efifb_groups);
> -	framebuffer_release(info);
>   
>   	return 0;
>   }

