Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 449285201A1
	for <lists+dri-devel@lfdr.de>; Mon,  9 May 2022 17:51:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C854310F2E1;
	Mon,  9 May 2022 15:51:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 457B010F2D7
 for <dri-devel@lists.freedesktop.org>; Mon,  9 May 2022 15:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652111508; x=1683647508;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=TOnajFuy+Bsd4TrZHLgvhFhLa8Pkjax9guTUhBNOExE=;
 b=IUdXV+hRhkjm4S9sYTZwhiChZTnZQb6PgHDLJz/AJc/p3min6/CpIyEA
 Zu+U5rW/QciupMQZtHB4vI+96fXwlUpnDaHoUqV3k2E08xW9d3MYbVy3k
 ZtVT4cBx7pIL7DhVgSTlqVFDWojljymbPYQBHMlRxxUMG8BpuwLEakxC/
 gWkYQwgsZUqXFWRkPTtiU4CH8FbCMvm55Asun3bH8DoZXIV0AkbdWmku3
 T+wK/EgOxYuHLlmN+m01Ew0bORL523nbnyAclToiQYKFjxjf8UKxW5ffy
 i5TLi8W9atUE9O2ZrD9abDADs0cQ5a7yMQEAp483dcDRpj0oj874WUcoF w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10342"; a="355515710"
X-IronPort-AV: E=Sophos;i="5.91,211,1647327600"; d="scan'208";a="355515710"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2022 08:51:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,211,1647327600"; d="scan'208";a="519292213"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
 by orsmga003.jf.intel.com with ESMTP; 09 May 2022 08:51:47 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 9 May 2022 08:51:46 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 9 May 2022 08:51:46 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Mon, 9 May 2022 08:51:46 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.109)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Mon, 9 May 2022 08:51:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P8pqQcH+aVTMd12LW6ZG+1N5fxAX5xsKesKlg6AmnXPFom3IksrDi3wcK0Fci0+XzZ9mVh+qzRfFlk9DQz4pRAydXrfNo/hWL4nyXIWzzagVzkN/CUcvppYqKpIA8X0gCuekrzJDVOFXhsULxuYIFXXr8DUPr5dvZb/ejvXdv0LdKgoaDMG0lgjltMyEIbETilwuajhqbuVzMvS6eePPIl830iSWtOzhe6EPQ6FfOKM8WocftUImEejiTBf1e2JpQDDHAYYy2G6gASSvRjUmyVUab2l8yp2fMlThgZgq/eWd3r8/Zfq822TuO6A/+QctYCl4S3s5zFb4pYPdnoRrhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=azQpjh6+aTJrXbdAXB14zBxlAQ6fG0QpozqL0O/bmuk=;
 b=W2N9N+EwRjWMddMQ84++cMVOznI7paYfp0PosfxLHjwdKfh/uqvtU5x7QkySvm//HvPdBWFX5H2pjorw76+WzcFyf632mXO5K/IZkalfQ2iZSBFtLRWeCarpPNBL72Gny2/37qA6Xq/SNXdGB5pgKTkI0cIryaFg3qdFX8G+8Ss2L0/gP0n2JD8jnKZ11QjdsytnAC3PoOUnhm6EibioA+2m5MJberigVaTWz6kQEpws5+O1EZIGkyriMNC4cgKtCxg5cR7Ci9wPVKEiIIJP8Xi7nWRVGyWwQiUgrWkhyclpoufCGA3O1IwOspLr5+8RwbB6QgKtxMCnbZpaO9+Cdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB3180.namprd11.prod.outlook.com (2603:10b6:5:9::13) by
 SN6PR11MB2942.namprd11.prod.outlook.com (2603:10b6:805:cb::28) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5227.20; Mon, 9 May 2022 15:51:42 +0000
Received: from DM6PR11MB3180.namprd11.prod.outlook.com
 ([fe80::b1fa:393c:9fb6:6871]) by DM6PR11MB3180.namprd11.prod.outlook.com
 ([fe80::b1fa:393c:9fb6:6871%5]) with mapi id 15.20.5227.022; Mon, 9 May 2022
 15:51:42 +0000
Message-ID: <a339df59-9e00-c7cb-e33d-2ac626443639@intel.com>
Date: Mon, 9 May 2022 17:51:36 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.8.1
Subject: Re: [PATCH v3 1/4] fbdev: Prevent possible use-after-free in
 fb_release()
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>,
 <linux-kernel@vger.kernel.org>
References: <20220505215947.364694-1-javierm@redhat.com>
 <20220505220413.365977-1-javierm@redhat.com>
 <753d0350-42dc-389b-b10b-4533ddcf32ac@intel.com>
 <1f788b8f-0bea-1818-349e-b1bc907bf251@redhat.com>
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <1f788b8f-0bea-1818-349e-b1bc907bf251@redhat.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DU2P250CA0015.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:10:231::20) To DM6PR11MB3180.namprd11.prod.outlook.com
 (2603:10b6:5:9::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a1487ec2-3b6c-4c62-7fa9-08da31d3cfd5
X-MS-TrafficTypeDiagnostic: SN6PR11MB2942:EE_
X-Microsoft-Antispam-PRVS: <SN6PR11MB294299BF9165D4E10CC7ECA3EBC69@SN6PR11MB2942.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uH5zBKlNVodB9QdFt4eSKROi35xm5LX3GBORvL2BIn6h1wio1bXDcGn44P4rXoUuhqB8LQptklxdWSdN4XH42tWsYrWclXNHVx512WLvJ6wvG/DThAuNBn7YPysdVm2Z0cTI+gYQ+3znV4bCCa1y3moNKJ2VZRNoW0sB5EuR+gWgPJ7tmic7QuCtmGJbdqbJyz+XLT6yGw2MkloQYMqM0Zu2B3j0jfQdku+41s09rQ95v1w0id2H0SSWAU2PFTBDIMYoFwddV1KrxrVL2nh1mlcGFqfviMSKqlsSLwI/erR8+VzouUWAH1Wd7VgKoHDPqGnD2BkQb2LpqFKdiuXsk4Zh8W9gyKyHZKcz1WimtFmdpN7qZyUk0IZ9wo5lpn1Acb7nQOj3Si+I9TtRiI8Z3K+yBso2RLfb5xrmVea/5bjRfZSsPCeY10AwAkDpf+WbYslkNxhePapuVtA+E/rDtUZYcm6vpjpTT03/cWpIqO+0H1HByAqVodOU2r34yPQfj3DBfpEJhejHHdqWKCewlhtonZzvGFEXoDfH7sJsyprOSToFJ14T/qXdZ8YHVgeZVMlRrub667+L12N5Ap0RPpptMX7oI1q3/GC2TGzIvyr3mQTjb4RT7Gsl+9twgqSSzdaZ12ByEZUhyYeHyrbpSBkpjrU6RRU0IpwOTlHoDCYxG++reRGAtjXVS5vMM4f89vCLo+CTha8vj2GyI/41xJ41s2ZcfowFtx7y0USMUep0aqqqoO1tudnkIQpeJ3+B
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB3180.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(66476007)(66946007)(6486002)(316002)(66556008)(6512007)(6666004)(508600001)(44832011)(2906002)(36916002)(186003)(4326008)(54906003)(31696002)(8676002)(38100700002)(86362001)(2616005)(82960400001)(8936002)(31686004)(6506007)(83380400001)(107886003)(5660300002)(36756003)(53546011)(26005)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UlNSR2NaMnZCeWJ0QXJMOGY4TllmbkRPVVY3a1hBS3VmNVcraE42MGFTVXh3?=
 =?utf-8?B?UHZSMDFaWExYeW1sZVRCSEpMNmtON1dnbUZMbnlqMTVVWDlFWm9NYTdkdmtD?=
 =?utf-8?B?ajNQUmtYcnFyb1oxT0xRa2poam1VSFpxSHNVSzJwSWRTbGJESSthbEJJSmI3?=
 =?utf-8?B?QmlHbkxNL20yWVJQV2xyWTVZTU0xR2YxMkN6dUVTajF5TWErWitJL1Q3TjZQ?=
 =?utf-8?B?RHJVOXduVjZkZ1FjY3haWGYyMXlCOWlMWVN1NWRzMHQ2UlZWN1Q5K1NrQTNw?=
 =?utf-8?B?YTJzSXNZU2RzelViamxWUkNVdFVIQ3QwNHZxY0s4dDNKM3NTMnF4TXB5RHhB?=
 =?utf-8?B?eEVIY3hpbjN1VTB1c0N6YXRsdTIzUnZuNGJ6NVd0ak5ad2IwNGdXWm1EeWVC?=
 =?utf-8?B?eHIzd2ZySnNZM2FkTGdKUE84ZFhIc2FVMXRhK25WQTZvL09STThmc2dIZXRC?=
 =?utf-8?B?WHpDQTZkRlUxbjV3eGhvQXNtc0Z4V0VSN21LOXFoLzBuYzdDd3NadTE3TElh?=
 =?utf-8?B?djltNWhYRUMxenExOFB5OEt5V29LdFVoQzlIaUpPbDhGOVBPVGVYa0wzRGo2?=
 =?utf-8?B?OCtyTEpBU0dCcmpac0Zka2s4U2d3Vyt4ZTZMUTY1UVZObnFVL0VxdmlaaWk2?=
 =?utf-8?B?UFhmeGwzS0JVY2oxaTVxbDVnRXJ0UVlMQjlGSGFRelY3akk0NVA5Slo1Qjly?=
 =?utf-8?B?Qkgyck5QSmh6YUNua0RZdVYvNUcwbjBtVEJZS1BMVzdXQk91ZDhBT0o3SXYv?=
 =?utf-8?B?VGRCWVZjWVFRZllnV3ZUNXJQcGpyR2k0VDVtK2J1a2h2OVY0OWw4Z1E5MkFs?=
 =?utf-8?B?MHRFV2pvL09GMFVHZW5HOTlDaktmZ1NhRjRxWHBlUG9qcFkzQ014c0ZIUFpC?=
 =?utf-8?B?SHNpMEdyR3lTQnIrK2ZabGE5Y3QyZHFTQ3NjYmhISVJOVDZkTW1LVU1RTFlu?=
 =?utf-8?B?ckp2cnV4MGpiVVJTZjVhbWxGTytLdnJxN2dMdnRMdGQvWEFVRzFaVmpGaDRs?=
 =?utf-8?B?dk03QWV1UjYrbkJBZW9jSlpaTTFFMGE2cVFtb0RIL1V0WXRXYUN4WUZ4NDRE?=
 =?utf-8?B?Wmx1cWpNSEFVQU1GNlY5T0FPaVRsWTNRNU5NZitkOUtPZ1UxMkVDSjdQUjcz?=
 =?utf-8?B?YmkwU3FlalptV3FWcGhNbzUyN1NzdkdqeG15dm1GeGVVM25ZcXBQb2I2NTBn?=
 =?utf-8?B?SFY2NXI2RGd0SWpmN0Q3WWE4MlhWcEVCUW9idHNvR2NNcHdxL093WElIQTNF?=
 =?utf-8?B?STRiamZpS3grSm4rRFNKN1ZDL3NWdnZ2aGtPVG5SKzVjVEhrUnBSd2MvbGEr?=
 =?utf-8?B?R3dxaUowcjdmb0VUWEhTVHpXN1ZqNWJUalNoRTl2Y1lFdm5FbUxlYU9OWC95?=
 =?utf-8?B?VWVqT01wN1VKcXY4MkdEY1BMdVVMbWtzVzJoYUs2dnYxOWFVNEU1MHVaZS9a?=
 =?utf-8?B?NWZPeFJZQWxvZVVnRHR6SlEzVjRndkpiMHpDdXVaQUd2OXZLcHM0VGZWMjJH?=
 =?utf-8?B?OHVJbjV4WDlZWDBWTTRtbm1NQkpkcGVOR2wwRCsrWmJpeEx6ajd3a3d4TjZX?=
 =?utf-8?B?UWZoQ2YvSlJqTlVOd0JZbFhOYkJQQXR4SHQyZ1ZXUzZNaUpZSGpHZXJZKzJO?=
 =?utf-8?B?NFh1UG5tU1NsOUhIRzBWYks2QXdnVlQ1Q21ReHFNR01QcHFOWUxTeUpSY0F3?=
 =?utf-8?B?Mnlic29IUzhFckQyYXNJWjE3UHUyWXoyTXFMRlg0eHFaMWhSTG1YNFBoU280?=
 =?utf-8?B?M0tJVjFkaUVwY3lwZW9KK0w4NytIS0cvOFBMemJFKzlOUFR4aVZBbVNQZm1K?=
 =?utf-8?B?Qzc2b1daLzlFN2JXT09sZUh1RU9PMEIzK29URy9rMFY1QjdzNHduM3hHNjFF?=
 =?utf-8?B?Q0paVmlyTHZiUmZ6elVLUEY0T01hYmlTR0NCakNwUzBMNE9tSEJiWUdIanR4?=
 =?utf-8?B?TXoyaEpNOTJnbGpzMXlBLzRDN0x5anNNeFhVMGxhUzZHTXM4UUpHenRtTTJ6?=
 =?utf-8?B?eTRtZG5WYkZUbW9FRXBKVVVEMGJzd1dCSTJ3TFk0cVhwL2h3U3NDMmxBQ3lG?=
 =?utf-8?B?NzJJWFhqTkdzSCtCcVBVdmk0Q1luVi9oRGxPWTJsdXpJazJGMDZMWkVqUkZs?=
 =?utf-8?B?SW51cHZGcEkySU9qQXBuOEdVbVlYWS9seUJSOEdDaUtra0dIUkJ5eUk1Rmxa?=
 =?utf-8?B?RUI4amREQUFnTVhiRWxCSHo3REE3SSs1V2g1UVJXTDVmNDh5THFvYzZ5QnQz?=
 =?utf-8?B?a2VKTklBQlhDWE1BZnNkQVhiTkcyTjRnWnBBVlBneWhjQ3A3cDJ6QmdsNHBG?=
 =?utf-8?B?K3pYVzFWNzlnTVpiV3ZiZkRtKzFuRjJBWnVFa3FETjlyMGRQL2t3TkR6b3Jn?=
 =?utf-8?Q?2yeqtDgL5zcE8Xpc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a1487ec2-3b6c-4c62-7fa9-08da31d3cfd5
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3180.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2022 15:51:42.2957 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +s0/R086I0/Uxr93Ntl3Tm+l53WxroDULsSaH3RSLTxElTWmepnbONJdUk9gFBcbFGl86qRSvrrT4ySZ0kbpkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2942
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



On 09.05.2022 17:30, Javier Martinez Canillas wrote:
> Hello Andrzej,
>
> On 5/9/22 16:56, Andrzej Hajda wrote:
>> On 06.05.2022 00:04, Javier Martinez Canillas wrote:
>>> From: Daniel Vetter <daniel.vetter@ffwll.ch>
>>>
>>> Most fbdev drivers have issues with the fb_info lifetime, because call to
>>> framebuffer_release() from their driver's .remove callback, rather than
>>> doing from fbops.fb_destroy callback.
>>>
>>> Doing that will destroy the fb_info too early, while references to it may
>>> still exist, leading to a use-after-free error.
>>>
>>> To prevent this, check the fb_info reference counter when attempting to
>>> kfree the data structure in framebuffer_release(). That will leak it but
>>> at least will prevent the mentioned error.
>>>
>>> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
>>> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
>>> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
>>> ---
>>>
>>> (no changes since v1)
>>>
>>>    drivers/video/fbdev/core/fbsysfs.c | 4 ++++
>>>    1 file changed, 4 insertions(+)
>>>
>>> diff --git a/drivers/video/fbdev/core/fbsysfs.c b/drivers/video/fbdev/core/fbsysfs.c
>>> index 8c1ee9ecec3d..c2a60b187467 100644
>>> --- a/drivers/video/fbdev/core/fbsysfs.c
>>> +++ b/drivers/video/fbdev/core/fbsysfs.c
>>> @@ -80,6 +80,10 @@ void framebuffer_release(struct fb_info *info)
>>>    {
>>>    	if (!info)
>>>    		return;
>>> +
>>> +	if (WARN_ON(refcount_read(&info->count)))
>>> +		return;
>>> +
>> Regarding drm:
>> What about drm_fb_helper_fini? It calls also framebuffer_release and is
>> called often from _remove paths (checked intel/radeon/nouveau). I guess
>> it should be fixed as well. Do you plan to fix it?
>>
> I think you are correct. Maybe we need something like the following?
>
> diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
> index d265a73313c9..b09598f7af28 100644
> --- a/drivers/gpu/drm/drm_fb_helper.c
> +++ b/drivers/gpu/drm/drm_fb_helper.c
> @@ -631,7 +631,6 @@ void drm_fb_helper_fini(struct drm_fb_helper *fb_helper)
>          if (info) {
>                  if (info->cmap.len)
>                          fb_dealloc_cmap(&info->cmap);
> -               framebuffer_release(info);

What about cmap? I am not an fb expert, but IMO cmap can be accessed 
from userspace as well.

Regards
Andrzej

>          }
>          fb_helper->fbdev = NULL;
>   
> @@ -2112,6 +2111,7 @@ static void drm_fbdev_release(struct drm_fb_helper *fb_helper)
>   static void drm_fbdev_fb_destroy(struct fb_info *info)
>   {
>          drm_fbdev_release(info->par);
> +       framebuffer_release(info);
>   }
>   
>   static int drm_fbdev_fb_mmap(struct fb_info *info, struct vm_area_struct *vma)
>
>> Regarding fb drivers, just for stats:
>> git grep -p framebuffer_release | grep _remove | wc -l
>> Suggests there is at least 70 incorrect users of this :)
>>
> Yes, Daniel already mentioned that most of them get this wrong but I was
> mostly interested in {simple,efi,vesa}fb since are used with "nomodeset".
>
> But given that I only touched those tree and still managed to introduce
> a regression, I won't attempt to fix the others.
>

