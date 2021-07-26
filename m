Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4B853D5E35
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jul 2021 17:47:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 071DD6EBA1;
	Mon, 26 Jul 2021 15:47:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 910E76EBA1
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jul 2021 15:47:26 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10057"; a="199498046"
X-IronPort-AV: E=Sophos;i="5.84,270,1620716400"; d="scan'208";a="199498046"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2021 08:47:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,270,1620716400"; d="scan'208";a="664712617"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga005.fm.intel.com with ESMTP; 26 Jul 2021 08:47:25 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Mon, 26 Jul 2021 08:47:25 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Mon, 26 Jul 2021 08:47:24 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Mon, 26 Jul 2021 08:47:24 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Mon, 26 Jul 2021 08:47:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AyxocJNFlIjex+iDKwBllC7N4Y4vHtyyEMMkWr6H0C1aTOiW3RSbKcBu+Vzyhe8pQKzZghLefO2UbuoWnAIuxwhUkjIWOr1jY94c7kVjJA95gtkRCoOXMlncco8NN+b6sNWzkOT/+MuP/m+/Y3fwZuia6+ELks59bmLYyzECbcgoe3oDFI0LGMkFukA0juD2XdzmB1fb4Xw8XmZ8AsoBhJ9ontdYEbZK5Gt8agNN3VELG/VEUu/aBBxuGWR9tfjH5R4Aupvf45nxJqBAA9zxDSuHpceG8UgD8wZnqUwign+4/xSOPg0cRfEbbPn9Zj2cSxGLC6naS2nYbvmU3EG8XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6WhxQJgbEjFVGMQGnjBcE+tp6keI6wBSmoVJNy9xSPw=;
 b=hut72F7knGNdo/ZvHo+OkfdAu5yCe531LFEk697aP9OfKN5naK44inqnrjjnMG0VMO7H4U5t4HaPYTLwSIQDn7WbVZIFkh0pFmLWxLf8AyJhRYf24EKhB9zlsyDktPHzXYrVuRQwqh+QZDST3rJ+Sv/DdxiI2xPHER+JlG1gNFY6ZI3XLeQIq7hYRSq9OljSSGGJZi81mAgQ+5ABdlDvjEyg4NedVdSjQcGxudIUUhvw+1ducRkCJQabOwkT9lWX6nsiitd3MOLnUvHROFMPQ/ysevZoL10ZQkJUoDjHt9MxR8+QPPHaX82cu2vHHx8NDGR4ApXEo7JAj5YZThYmVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6WhxQJgbEjFVGMQGnjBcE+tp6keI6wBSmoVJNy9xSPw=;
 b=MehsuxDxo4lZMbLKikcuqPJc4Alq2vSHl8zlpa8ELObdQ6k2JuJ1MWtBhA5E7md4Ex0EToeT4hqQWIsSXMkCypTYZDgeItPqnMyEBdPpXlJFbSQrLZdPo3zppAf66u6TBGDBbX4lpr5Sw8paZlbrRQ+dVdCgXJSmHw0/inxH/yI=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 DM6PR11MB3548.namprd11.prod.outlook.com (2603:10b6:5:143::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.31; Mon, 26 Jul 2021 15:47:22 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::4017:e7ce:ef66:48d7]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::4017:e7ce:ef66:48d7%9]) with mapi id 15.20.4352.031; Mon, 26 Jul 2021
 15:47:22 +0000
Subject: Re: [PATCH v5 02/15] mei: pxp: export pavp client to me client bus
To: "Winkler, Tomas" <tomas.winkler@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <20210716041034.382-1-daniele.ceraolospurio@intel.com>
 <20210716041034.382-3-daniele.ceraolospurio@intel.com>
 <0b7f28f6e38f43d7816a280ebdc9ff35@intel.com>
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Message-ID: <ac6ed2dd-369e-ceed-f0ff-9507319913a6@intel.com>
Date: Mon, 26 Jul 2021 08:47:20 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.12.0
In-Reply-To: <0b7f28f6e38f43d7816a280ebdc9ff35@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: SJ0PR13CA0167.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::22) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.65] (99.72.232.53) by
 SJ0PR13CA0167.namprd13.prod.outlook.com (2603:10b6:a03:2c7::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.15 via Frontend
 Transport; Mon, 26 Jul 2021 15:47:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e097221c-0c2f-4fef-48de-08d9504ca892
X-MS-TrafficTypeDiagnostic: DM6PR11MB3548:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR11MB35484363AECBFEF94EB32DB0F4E89@DM6PR11MB3548.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HOqUeA1om8F5mlJyP131jag11bJHml9R7MHRd5Wrx4MHxsm4VAwcBpsMqfrcFE63wXa2cN8RHRVDrh86DIjVv4leryQ/j9J65gGIRfsaj9WwKzVT5UUCd72AE0Iaw8ChgjF9mupXxKh83m/YXMKGdbFEC0Vv+6lvbVclw6MC/YNHFgQOf9KkyYDb3225fRkF398RUK5a3OFNfMpGSTjFn9loMBePzeoRJP7JOFlN7UmjY2oTYatDR0YH+BzIAviurM7KTPv2/AtIpHA2cJMHiPNH5GUsx2Ov8gdjyo6TdFPKkSqVpS8Tjtd5i3gVhVmehWrEVwWBrvcY46g6tZ9KeQys+DWS+n+KFp8Y6U8CKSOvxd+yOka7u7kJG7MKmmYeR8fy/yjh5DRmO/o6/QRNvX90w51zSzTVg+2k/JIf4bfX5a1Y3S1zJbAPXu781GKOn9Rt0DlQ/0zPdUe15T9NKfAecJj1hIWmOfPiuo9RAjPbArRn8Ex95zTnEMKiWFL0b+YCtlARkG9+BwrBEwYetzhk59u3mnXUyKIUCeYistslUnXQVfU4TlbF8knTSO9w+ME3SPfhpRYPzm3pitBMv3MEUuB1l+Fzex48H0/0lpMPNqnzEMHTqHGGIKkSlTuI/Riz1xLbzn07bqnjT5E22cnVDlGD1pziFRKpZKNqNL0uIR7ded7AX1eGW7PpobN4atSaW/2n/uiHb5FoV+Yn1ISUX4k0Hxo/H+bSqsvwUmSxajvQ7HP5xec/UHyQnLZ7
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(366004)(346002)(376002)(39860400002)(38100700002)(4326008)(8676002)(36756003)(31696002)(83380400001)(8936002)(86362001)(54906003)(16576012)(316002)(107886003)(956004)(2616005)(26005)(2906002)(6486002)(186003)(66476007)(66556008)(30864003)(31686004)(66946007)(5660300002)(110136005)(478600001)(53546011)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y0paZURKRHA2Qm52MEppTC9hdmZXdHBIanpCdUd0MkZ3TlRLOW1EK052MjI4?=
 =?utf-8?B?akt0U1RoOWRXMldUUjFuTEdCTU1yVUJiR28zVG4zQjgxdHloaUFIM1E5M3lO?=
 =?utf-8?B?WGhUSXQ0b2l2UTBEdytwSVFrL3dScVpyZkg2NkpnSkJnYS9NRWtvOTVhVitT?=
 =?utf-8?B?eU9TVTA4TVRTWnhLaUxQMk5zRFN2dFB3YlZ4djZwczlubXVza3pTUGRGdFpM?=
 =?utf-8?B?WS83RitTaGJueEVYZDVVQjJwMHRqSHBrYi9vOHJPRkFnVzlneFM0STRwZ2ZD?=
 =?utf-8?B?WkQvczlhdUNpalV3azlLNlczTGRwOUliNjJTQzRDeng0Mmg2U3FQMk9kRWdN?=
 =?utf-8?B?bHM0d3ZEK0dVU0dCRzZLZVFKOFNKcmdMSUlIb1cvT09BbWYxbWtXYTBOejFq?=
 =?utf-8?B?ZGpsMGhuVFF4MkFuS1RoOERHNEhwbjBHdkZ2Qmk2bFRQOWNLK3dFdDIyUGZF?=
 =?utf-8?B?OXNSYnE1cjAwdnM5MmFNS1Npc1RaTzNIMDJaaEJmTDgwNzF5MVYxblBkbXQ4?=
 =?utf-8?B?WmhNY1ZDV2c1MVlnb2ZCR1NRd2h0MDBlZjdaaDFxc2dBSm1kNGxzSVd5dXhT?=
 =?utf-8?B?K0ZsdTB5ckRzN2xyUXFLTHdMdEk5dGhnWHI4RzdjYjYzV3hva2g0dmhrN2hl?=
 =?utf-8?B?RnFSV28vM1B2SC82NFovS010bDVLZ25WSzRMYXJkbk5CWDEyd2tDRjNCSFBt?=
 =?utf-8?B?YXRlTzIvYUdVanJTTWxUQkRxUUJ5bWdYSnMrU0llVTNjb2hndTNDbHBqUHpl?=
 =?utf-8?B?WGNST0ZhNEdxTnE0SEh2ZlErTXBRV1puWjFocmtWaDJyU3labkVrYXlSbVpT?=
 =?utf-8?B?SE5ONEFiNGpJMkZodzVPR0RKSHRNNUhGMTBla1RWTVg5L2p2UWx5YjBObDBi?=
 =?utf-8?B?MEw5ZTc5QkE2ZUJOUWV0dzA2dVJHWnUvRGRJNkFSZUZzSkRsbW9FQUgrSXhv?=
 =?utf-8?B?dCtOVjR0by95SzJ3NnA5bjE3NSthU3lRcnY1c0c2TTduSFdSNnIwdURGcit1?=
 =?utf-8?B?eXNQbmtIbjNYOEJJbTlHVEFMT2VseVBrNXBVcjJEeVdDZDcyYjdybkI2ME02?=
 =?utf-8?B?MzdkMDh2Q25rZWdDR3BPS0dzenF6dytMaWdBL0xRT1ZMek13S25WS3M4aDJX?=
 =?utf-8?B?RzRnV21zcWRvWUxWWThOazh0Nlk2NkZGdHpzQjQvUElGN0FIWDJGSjhjdnMv?=
 =?utf-8?B?L1BuaWpkWkYyeC9KWmk5T0VzL0FkUGJ5U2pFcGhBWnB5YzdHdGdSaG8vZUo1?=
 =?utf-8?B?SHRveUJ0WFBYTHNPOXgvYlY1RHdBODZmbnNKWnJmT0JJQmlXRHBuTTV1OUZD?=
 =?utf-8?B?Z0dBejdlVzByZldPNlc5SmRLeGN1Z0JwYTBSSndYaGVlakJGQzRGL0NkN2xU?=
 =?utf-8?B?TCtBa1NUeGxqQ0lJbnFrcUlLY2gvTzNOVEN0WlA4MTdaSTVyT1VNbmRoYmkw?=
 =?utf-8?B?VUxacGNBMGpQb0VMRkJuTWcwTmJhck1WL1lnWXdDcWVQTzFEc1gwam9qZEpJ?=
 =?utf-8?B?S3NkZjU4TEN6S0hKNXJwTkRPb1M3RnVudXlkZ0RpWlZ2WTlzbTJsOU5SZFAy?=
 =?utf-8?B?WkZ1SXU0azVOMkRrSWUxMjJmUDlEcUxXWkVzaE12SUpIbTBGV3dBZTJsZk5u?=
 =?utf-8?B?Nzd6T0xqb3o4RXFBRUdBcG5ncGRoSWZ1blI1bFlheVQ2SzJkcVcyQmJxa0pw?=
 =?utf-8?B?UkFybU9uK2gxRDBudVRTYUV0MjBHbEtqMDhBeWc4WDAwbk5tNGttRnErUTQ5?=
 =?utf-8?Q?GSN+F4L/PpxxtrY3RKMIxKOVRVNnHnHpogFLhIc?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e097221c-0c2f-4fef-48de-08d9504ca892
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2021 15:47:22.6357 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1wvbqAHzKlLf8h2bEIzMIpfXF28cPfvGWAzUxK21ONCZ6fvH+M6T6XxzPYSG/RnD6C0feZqns388XiQ5V+hNl83ykicpVTPN/UCO3Mmwxto=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3548
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
Cc: "Lubart, Vitaly" <vitaly.lubart@intel.com>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 7/26/2021 8:04 AM, Winkler, Tomas wrote:
>> From: Vitaly Lubart <vitaly.lubart@intel.com>
>>
>> Export PAVP client to work with i915 driver, for binding it uses kernel
>> component framework.
>>
>> Signed-off-by: Vitaly Lubart <vitaly.lubart@intel.com>
>> Signed-off-by: Tomas Winkler <tomas.winkler@intel.com>
>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> ---
>>   drivers/misc/mei/Kconfig       |   2 +
>>   drivers/misc/mei/Makefile      |   1 +
>>   drivers/misc/mei/pxp/Kconfig   |  13 ++
>>   drivers/misc/mei/pxp/Makefile  |   7 +
>>   drivers/misc/mei/pxp/mei_pxp.c | 233
>> +++++++++++++++++++++++++++++++++
>> drivers/misc/mei/pxp/mei_pxp.h |  18 +++
>>   6 files changed, 274 insertions(+)
>>   create mode 100644 drivers/misc/mei/pxp/Kconfig  create mode 100644
>> drivers/misc/mei/pxp/Makefile  create mode 100644
>> drivers/misc/mei/pxp/mei_pxp.c  create mode 100644
>> drivers/misc/mei/pxp/mei_pxp.h
>>
>> diff --git a/drivers/misc/mei/Kconfig b/drivers/misc/mei/Kconfig index
>> f5fd5b786607..0e0bcd0da852 100644
>> --- a/drivers/misc/mei/Kconfig
>> +++ b/drivers/misc/mei/Kconfig
>> @@ -47,3 +47,5 @@ config INTEL_MEI_TXE
>>     Intel Bay Trail
>>
>>   source "drivers/misc/mei/hdcp/Kconfig"
>> +source "drivers/misc/mei/pxp/Kconfig"
>> +
>> diff --git a/drivers/misc/mei/Makefile b/drivers/misc/mei/Makefile index
>> f1c76f7ee804..d8e5165917f2 100644
>> --- a/drivers/misc/mei/Makefile
>> +++ b/drivers/misc/mei/Makefile
>> @@ -26,3 +26,4 @@ mei-$(CONFIG_EVENT_TRACING) += mei-trace.o
>> CFLAGS_mei-trace.o = -I$(src)
>>
>>   obj-$(CONFIG_INTEL_MEI_HDCP) += hdcp/
>> +obj-$(CONFIG_INTEL_MEI_PXP) += pxp/
>> diff --git a/drivers/misc/mei/pxp/Kconfig b/drivers/misc/mei/pxp/Kconfig
>> new file mode 100644 index 000000000000..4029b96afc04
>> --- /dev/null
>> +++ b/drivers/misc/mei/pxp/Kconfig
>> @@ -0,0 +1,13 @@
>> +
>> +# SPDX-License-Identifier: GPL-2.0
>> +# Copyright (c) 2020, Intel Corporation. All rights reserved.
>
> 2020-2021

ok

>
>> +#
>> +config INTEL_MEI_PXP
>> +tristate "Intel PXP services of ME Interface"
>> +select INTEL_MEI_ME
>> +depends on DRM_I915
>> +help
>> +  MEI Support for PXP Services on Intel platforms.
>> +
>> +  Enables the ME FW services required for PXP support through
>> +  I915 display driver of Intel.
>> diff --git a/drivers/misc/mei/pxp/Makefile b/drivers/misc/mei/pxp/Makefile
>> new file mode 100644 index 000000000000..0329950d5794
>> --- /dev/null
>> +++ b/drivers/misc/mei/pxp/Makefile
>> @@ -0,0 +1,7 @@
>> +# SPDX-License-Identifier: GPL-2.0
>> +#
>> +# Copyright (c) 2020, Intel Corporation. All rights reserved.
>> +#
>> +# Makefile - PXP client driver for Intel MEI Bus Driver.
>> +
>> +obj-$(CONFIG_INTEL_MEI_PXP) += mei_pxp.o
>> diff --git a/drivers/misc/mei/pxp/mei_pxp.c
>> b/drivers/misc/mei/pxp/mei_pxp.c new file mode 100644 index
>> 000000000000..cacfbedb640a
>> --- /dev/null
>> +++ b/drivers/misc/mei/pxp/mei_pxp.c
>> @@ -0,0 +1,233 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Copyright © 2020 Intel Corporation
>> + */
>> +
>> +/**
>> + * DOC: MEI_PXP Client Driver
>> + *
>> + * The mei_pxp driver acts as a translation layer between PXP
>> + * protocol  implementer (I915) and ME FW by translating PXP
>> + * negotiation messages to ME FW command payloads and vice versa.
>> + */
>> +
>> +#include <linux/module.h>
>> +#include <linux/slab.h>
>> +#include <linux/uuid.h>
>> +#include <linux/mei_cl_bus.h>
>> +#include <linux/component.h>
>> +#include <drm/drm_connector.h>
>> +#include <drm/i915_component.h>
>> +#include <drm/i915_pxp_tee_interface.h>
>> +
>> +#include "mei_pxp.h"
>> +
>> +/**
>> + * mei_pxp_send_message() - Sends a PXP message to ME FW.
>> + * @dev: device corresponding to the mei_cl_device
>> + * @message: a message buffer to send
>> + * @size: size of the message
>> + * Return: 0 on Success, <0 on Failure
>> + */
>> +static int
>> +mei_pxp_send_message(struct device *dev, const void *message, size_t
>> +size) {
>> +struct mei_cl_device *cldev;
>> +ssize_t byte;
>> +
>> +if (!dev || !message)
>> +return -EINVAL;
>> +
>> +cldev = to_mei_cl_device(dev);
>> +
>> +/* temporary drop const qualifier till the API is fixed */
>> +byte = mei_cldev_send(cldev, (u8 *)message, size);
>> +if (byte < 0) {
>> +dev_dbg(dev, "mei_cldev_send failed. %zd\n", byte);
>> +return byte;
>> +}
>> +
>> +return 0;
>> +}
>> +
>> +/**
>> + * mei_pxp_receive_message() - Receives a PXP message from ME FW.
>> + * @dev: device corresponding to the mei_cl_device
>> + * @buffer: a message buffer to contain the received message
>> + * @size: size of the buffer
>> + * Return: bytes sent on Success, <0 on Failure  */ static int
>> +mei_pxp_receive_message(struct device *dev, void *buffer, size_t size)
>> +{
>> +struct mei_cl_device *cldev;
>> +ssize_t byte;
>> +
>> +if (!dev || !buffer)
>> +return -EINVAL;
>> +
>> +cldev = to_mei_cl_device(dev);
>> +
>> +byte = mei_cldev_recv(cldev, buffer, size);
>> +if (byte < 0) {
>> +dev_dbg(dev, "mei_cldev_recv failed. %zd\n", byte);
>> +return byte;
>> +}
>> +
>> +return byte;
>> +}
>> +
>> +static const struct i915_pxp_component_ops mei_pxp_ops = {
>> +.owner = THIS_MODULE,
>> +.send = mei_pxp_send_message,
>> +.recv = mei_pxp_receive_message,
>> +};
>> +
>> +static int mei_component_master_bind(struct device *dev) {
>> +struct mei_cl_device *cldev = to_mei_cl_device(dev);
>> +struct i915_pxp_component *comp_master =
>> mei_cldev_get_drvdata(cldev);
>> +int ret;
>> +
>> +dev_dbg(dev, "%s\n", __func__);
> Pleased drop those __func__, as ftrace can be used

ok

>> +comp_master->ops = &mei_pxp_ops;
>> +comp_master->tee_dev = dev;
>> +ret = component_bind_all(dev, comp_master);
>> +if (ret < 0)
>> +return ret;
>> +
>> +return 0;
>> +}
>> +
>> +static void mei_component_master_unbind(struct device *dev) {
>> +struct mei_cl_device *cldev = to_mei_cl_device(dev);
>> +struct i915_pxp_component *comp_master =
>> mei_cldev_get_drvdata(cldev);
>> +
>> +dev_dbg(dev, "%s\n", __func__);
> Drop
>> +component_unbind_all(dev, comp_master); }
>> +
>> +static const struct component_master_ops mei_component_master_ops =
>> {
>> +.bind = mei_component_master_bind,
>> +.unbind = mei_component_master_unbind, };
>> +
>> +/**
>> + * mei_pxp_component_match - compare function for matching mei pxp.
>> + *
>> + *    The function checks if the driver is i915, the subcomponent is PXP
>> + *    and the grand parent of pxp and the parent of i915 are the same
>> + *    PCH device.
>> + *
>> + * @dev: master device
>> + * @subcomponent: subcomponent to match (I915_COMPONENT_PXP)
>> + * @data: compare data (mei pxp device)
>> + *
>> + * Return:
>> + * * 1 - if components match
>> + * * 0 - otherwise
>> + */
>> +static int mei_pxp_component_match(struct device *dev, int
>> subcomponent,
>> +   void *data)
>> +{
>> +struct device *base = data;
>> +
>> +if (subcomponent != I915_COMPONENT_PXP)
>> +return 0;
>> +
>> +if (strcmp(dev->driver->name, "i915") == 0) {
>> +base = base->parent;
>> +if (!base)
>> +return 0;
>> +
>> +base = base->parent;
>> +dev = dev->parent;
>> +return (base && dev && dev == base);
>> +}
>> +
>> +return 0;
>> +}I
> I prefer we use same coding as in hdcp
>
>
> static int mei_hdcp_component_match(struct device *dev, int subcomponent,
>                                      void *data)
> {
>          struct device *base = data;
>
>          if (strcmp(dev->driver->name, "i915") ||
>              subcomponent != I915_COMPONENT_HDCP)
>                  return 0;
>
>          base = base->parent;
>          if (!base)
>                  return 0;
>
>          base = base->parent;
>          dev = dev->parent;
>
>          return (base && dev && dev == base);
> }

sure, will do.

Can you give an ack for merging this via the graphics tree? I'll still 
address all your comments before merge, just want to make sure I have 
all the acks in place so I don't have to chase them later :P

Thanks,
Daniele

>> +static int mei_pxp_probe(struct mei_cl_device *cldev,
>> + const struct mei_cl_device_id *id)
>> +{
>> +struct i915_pxp_component *comp_master;
>> +struct component_match *master_match;
>> +int ret;
>> +
>> +ret = mei_cldev_enable(cldev);
>> +if (ret < 0) {
>> +dev_err(&cldev->dev, "mei_cldev_enable Failed. %d\n",
>> ret);
>> +goto enable_err_exit;
>> +}
>> +
>> +comp_master = kzalloc(sizeof(*comp_master), GFP_KERNEL);
>> +if (!comp_master) {
>> +ret = -ENOMEM;
>> +goto err_exit;
>> +}
>> +
>> +master_match = NULL;
>> +component_match_add_typed(&cldev->dev, &master_match,
>> +  mei_pxp_component_match, &cldev-
>>> dev);
>> +if (IS_ERR_OR_NULL(master_match)) {
>> +ret = -ENOMEM;
>> +goto err_exit;
>> +}
>> +
>> +mei_cldev_set_drvdata(cldev, comp_master);
>> +ret = component_master_add_with_match(&cldev->dev,
>> +      &mei_component_master_ops,
>> +      master_match);
>> +if (ret < 0) {
>> +dev_err(&cldev->dev, "Master comp add failed %d\n", ret);
>> +goto err_exit;
>> +}
>> +
>> +return 0;
>> +
>> +err_exit:
>> +mei_cldev_set_drvdata(cldev, NULL);
>> +kfree(comp_master);
>> +mei_cldev_disable(cldev);
>> +enable_err_exit:
>> +return ret;
>> +}
>> +
>> +static void mei_pxp_remove(struct mei_cl_device *cldev) {
>> +struct i915_pxp_component *comp_master =
>> mei_cldev_get_drvdata(cldev);
>> +int ret;
>> +
>> +component_master_del(&cldev->dev,
>> &mei_component_master_ops);
>> +kfree(comp_master);
>> +mei_cldev_set_drvdata(cldev, NULL);
>> +
>> +ret = mei_cldev_disable(cldev);
>> +if (ret)
>> +dev_warn(&cldev->dev, "mei_cldev_disable() failed\n"); }
>> +
>> +/* fbf6fcf1-96cf-4e2e-a6a6-1bab8cbe36b1 : PAVP GUID*/ #define
>> +MEI_GUID_PXP GUID_INIT(0xfbf6fcf1, 0x96cf, 0x4e2e, 0xA6, \
>> +       0xa6, 0x1b, 0xab, 0x8c, 0xbe, 0x36, 0xb1)
>> +
>> +static struct mei_cl_device_id mei_pxp_tbl[] = {
>> +{ .uuid = MEI_GUID_PXP, .version = MEI_CL_VERSION_ANY },
>> +{ }
>> +};
>> +MODULE_DEVICE_TABLE(mei, mei_pxp_tbl);
>> +
>> +static struct mei_cl_driver mei_pxp_driver = {
>> +.id_table = mei_pxp_tbl,
>> +.name = KBUILD_MODNAME,
>> +.probe = mei_pxp_probe,
>> +.remove= mei_pxp_remove,
>> +};
>> +
>> +module_mei_cl_driver(mei_pxp_driver);
>> +
>> +MODULE_AUTHOR("Intel Corporation");
>> +MODULE_LICENSE("GPL");
>> +MODULE_DESCRIPTION("MEI PXP");
>> diff --git a/drivers/misc/mei/pxp/mei_pxp.h
>> b/drivers/misc/mei/pxp/mei_pxp.h new file mode 100644 index
>> 000000000000..e7b15373fefd
>> --- /dev/null
>> +++ b/drivers/misc/mei/pxp/mei_pxp.h
>> @@ -0,0 +1,18 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +/*
>> + * Copyright © 2020 Intel Corporation
>> + *
>> + * Authors:
>> + * Vitaly Lubart <vitaly.lubart@intel.com>  */
>> +
>> +#ifndef __MEI_PXP_H__
>> +#define __MEI_PXP_H__
>> +
>> +/* me_pxp_status: Enumeration of all PXP Status Codes */ enum
>> +me_pxp_status {
>> +ME_PXP_STATUS_SUCCESS= 0x0000,
>> +
>> +};
>> +
>> +#endif /* __MEI_PXP_H__ */
>> --
>> 2.32.0

