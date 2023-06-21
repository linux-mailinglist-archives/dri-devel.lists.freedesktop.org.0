Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 17F50737B86
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 08:40:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75B9B10E3C5;
	Wed, 21 Jun 2023 06:40:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5898410E3C5;
 Wed, 21 Jun 2023 06:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687329620; x=1718865620;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=dBGZXFqx94GwvglU+zJrQkDlbjF5gSQdvIedvVvyPK0=;
 b=bq4bcVLFRdj9kFRsFMBw+N2MILLBGiryw+n5qTE3T51c5LXlFRQ71lIj
 H703xVOfoYkassufUS/h7TZ021Km5bLajk59w1pM217X6c4Bzad/SJyaU
 ixSm0ib0VdQV1qSwh42E/X59ryfFiD5ZYunON9pBLK3Xv4D4J41PENvBG
 yZ4emlzZXnRdD0KE6GJN23cIDLo/bOt6G8UJZ15+D9tFwnWCCqc1Jbw99
 xKqoIj+1+Y2ZjlGqkt2QM/gORBA5DlAu+6Ew9yMaGbJosk+upfz6/8qGK
 z6Yf+D0G79PHBQLZ9/aIsk1Be/yMAPEvnNAM1EIax5h1hloWHY1tiyDvN g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="340427382"
X-IronPort-AV: E=Sophos;i="6.00,259,1681196400"; d="scan'208";a="340427382"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2023 23:40:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="708583845"
X-IronPort-AV: E=Sophos;i="6.00,259,1681196400"; d="scan'208";a="708583845"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga007.jf.intel.com with ESMTP; 20 Jun 2023 23:40:18 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 20 Jun 2023 23:40:18 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 20 Jun 2023 23:40:18 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.173)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 20 Jun 2023 23:40:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LmNeqkafmFGRZAIfzCyl+xvLCQAv1Wdd0SyDoh/q0VYxoeObiscCv6mzbRgl+uqHTg9/6XdhbfqTfOcR5jmXQZ6uwdVIiquYVQRw/WkHmad6SM8ZB42LH7pb883oWCrKkxbo45w6iyr5zC7pPTQd9dbTXfMBM6L5Jb/hPRM0hP6m4QFTi5i1GRN29K9Fy6Vbqf2QoD0N2X/ujegUxtfx3Dzmz6p8wbBUnPfcVom6oPO7zxBegDo9DyG5VNr6b3e9Cjy6xJ+pvQ6yNDgkDJWr2ojeh2CYRftARQFErqsc8/hI4KU1DkXZnZOycIn01LjFRpTgAOKL3lGHLAj867lVxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rRUfl7hI3uDGg/Sim5aReSWAC5p1+mRsCoUPQD7RYD0=;
 b=DCZZ7496Xo+2x6WifgiLwUDR+UP5mDjbCs84AVdJm828rE8LHkPCQ47r/PPngqcCDBKaEcLhTk13hlTr9mHsNcaxc41gGN44NPeirY94S0Xkm4k4FUxL9hslFihW74rjZsJROAVoIbVXFKdwCwPXLrRHEmNUMfu69Eiics7XTycoIIqyMosPsC30uIpl5yrh4cgEUILLny8WUlyuYWl40KyYQ3GrjkkWQrs333yncu5zvErqHeJIBgTrNI+SFE1IT+h+tVp/hiUbNV/mVx69xqjJwEVntuxuX+Z+IAN7SYynUbejcGGBa1oX4wWp+lduHvNoxYVbds1/yZqIxQ8FBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5474.namprd11.prod.outlook.com (2603:10b6:610:d5::8)
 by SJ0PR11MB6813.namprd11.prod.outlook.com (2603:10b6:a03:47f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.21; Wed, 21 Jun
 2023 06:40:15 +0000
Received: from CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::6082:8da2:e39:aeff]) by CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::6082:8da2:e39:aeff%4]) with mapi id 15.20.6521.023; Wed, 21 Jun 2023
 06:40:15 +0000
Message-ID: <d9ce8d28-a116-eef5-aa4a-7dbd09707079@intel.com>
Date: Wed, 21 Jun 2023 12:10:05 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.12.0
Subject: Re: [Intel-xe] [RFC 1/5] drm/netlink: Add netlink infrastructure
Content-Language: en-US
To: Tomer Tayar <ttayar@habana.ai>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
References: <20230526162016.428357-1-aravind.iddamsetty@intel.com>
 <20230526162016.428357-2-aravind.iddamsetty@intel.com>
 <98184112-ca7d-65c5-0b98-94abb418a2a5@habana.ai>
 <4418f353-18c6-b74d-dc19-f6edc624cd52@intel.com>
 <0de909c4-fa12-378f-62a6-ec0b85417ba3@habana.ai>
From: "Iddamsetty, Aravind" <aravind.iddamsetty@intel.com>
In-Reply-To: <0de909c4-fa12-378f-62a6-ec0b85417ba3@habana.ai>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0082.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:23::27) To CH0PR11MB5474.namprd11.prod.outlook.com
 (2603:10b6:610:d5::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5474:EE_|SJ0PR11MB6813:EE_
X-MS-Office365-Filtering-Correlation-Id: a8bd43f6-9ade-4bc3-836c-08db72225ec2
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Mq8Y3egouPGEHuw6P2uiRf7sjuZ7FHzUmXrBubbL/6DAti5SZ9STi+/fKQKSZH4xAkzdsULBYlZ4WwVKg4ZDgKb5nVBdAxSfdC/gEAvRm6+PxcPlu+31B+epglEhT+Bn13RznsRaAh0F2abG/DuiMJGzuFMTBaw04yLbGOHGJO784RXN86YCt1H3c/olzD53xuhSHDQKopVdhOQ0uc3TRMmJ0YUB0diyAc5sRpy8TX7X4bXMz24as+3efMUlb6UXR9widP0oWR9/d+JeFkPEyZ+8DiEraEihM79QYdW+LzmmcxvVnKj8FA3Yy9rExEa71tKDPT9qpYRsG7hMTiXHymDffLoHkdGNpfPhnuG8JkPGmEMiDSkgeZxjOEAUTHZJeDh7rmfVxMyH0Us1T1SEzDu9Rdcb9T76IrRgnlvddKaCohQBB2B7BCXoHxj0u6Ocwf2YuTCj/INuTqrTzp/NBft0tzTp0cITMfS1qV6KdBpjsSrHH5rS4++igh4yHBZuP7RZVqfI1Rudf1b25t9wPXecFxjeS0zOfTIkku6227LrxDWySj80TIokMeuWwgeFuk4l1D3mlCyHgTdFphQq1hzTJAO4/kBaWwHf6nn6phPeMpiwt6xMLIUNKlPbwSoSbbvijaAzpzmcdylF/bYhyA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5474.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(39860400002)(346002)(396003)(376002)(136003)(451199021)(53546011)(6486002)(6506007)(478600001)(2616005)(54906003)(83380400001)(6666004)(110136005)(2906002)(186003)(26005)(5660300002)(36756003)(31696002)(38100700002)(86362001)(4326008)(8936002)(82960400001)(316002)(66946007)(41300700001)(8676002)(66556008)(66476007)(6512007)(31686004)(66899021)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TkxNaG1xTjFseEE3TUkxU1g0KzgxbmxtTFY2WWRUb0VsT2V0VjRiZVhvenky?=
 =?utf-8?B?T254T2F6N0tuYnUvSHB5QkJsSTEyL2hCWjRUd1NTUXlWRTlUV1U3Nm1UK1Jn?=
 =?utf-8?B?UXBWWUt6M1UwL2U3aVFkM1hMVEdvRTdzU3JraHRDS1d3a3IvWU9JQXp0dUhI?=
 =?utf-8?B?K3l6WWJQQTRNMDZUc09TdTNWUmQwQjFJVzNWUCtUOGRyeW5wbzlvNy9jeGZG?=
 =?utf-8?B?RDRMclhSamZXTlpLbVdGSklEQktZNGZhdzN3WlJ6L28xR3IrYlJQUmpyVG1N?=
 =?utf-8?B?MWh2ekVtMkJlbmtTNG5lMzM5dyt3Z0hpdit0UGhUVzlwcit1SDNHU1dha2hy?=
 =?utf-8?B?TUlVZEJyZFlKMUROaFo3UVhVN2NPMWxJbmVodGFDYU94SXdIVG9ZNU4xeGs4?=
 =?utf-8?B?c1Z4QTQzNVRvZTgrY255ME91N09obU1IY2JFcEkwSnMzTUc5dmZCeG42OUpQ?=
 =?utf-8?B?YVBiZUdkdW5mTmRwd09YaEhVcGRqbXlRV3hWbTM1V1dZRnM1NG5BVkdMUWg4?=
 =?utf-8?B?NXg1aEpBRnBiUzJIbVVOMGJpeUNZbDlkSHk0bTBZVVF1VUFUT0IzanNrZ1ll?=
 =?utf-8?B?THdHa1JObVk1L2J6TWo0WE1UM0xrVWFPb3ZHSGx0b2x3VmJiN3luUGNzNDJv?=
 =?utf-8?B?NnM1eEZWZ2dBMTNXc2x1aU42NkQ3YnJZd2NaZXpQQzRob1g5ZDBnczM0WW8x?=
 =?utf-8?B?d2lXR3IvcUovZDVmcXFNZFRhQ250OHN3QWxpc3BxMzFSRmRzNUhySUc5Q3Vu?=
 =?utf-8?B?b1BrK01xd1h0RHBENFhWOTFXZGtrY3pJYkNncUxzQUUwUXFxaFIyNXFFQXV0?=
 =?utf-8?B?WDN4c0ZLdGp5UFZIWFpjNHBLNzM1bnNGOWZyUFhwOW11UUJiY1BWZDdmWkVM?=
 =?utf-8?B?UG04bWpqOXhKNk5uQWxUNUYrVk1EM2tpd1ZScEcrTWZSMmRxT3N2Y1VpRDFl?=
 =?utf-8?B?YWhWamlQVDJXOXYvQ0tRRVBNLy9EcVVZMDN6L2JXTVFRTTBFNGJKTjZlTEE3?=
 =?utf-8?B?WUZXMnQvNVgvcFNNZStkUXY4N05EY05qM25PTDlseTU0dDdrT2NpTlJPc0tJ?=
 =?utf-8?B?M3BzVjNQUEpKZ0dlUFBBQkd2Z1EwOVoxRHoxeXZPc2k4UHRnWE9MRU5IVGJO?=
 =?utf-8?B?VjRSN09sMjhNV3hHc0xMaUlKbHVHQVhpRlFhbm1KT3dEZUg5bENIU0FBcnY2?=
 =?utf-8?B?cm5wdFlkMHF6T2RSTC9ldUptK2lVbjFaK1pxZU81d3NZVlZGT04rWFZtVlNx?=
 =?utf-8?B?dFdFSVNRRVB5U1dFRi9aUTlDaklSYmVpakZWUlZTNXBDNUttdlI1Qm5WZzlN?=
 =?utf-8?B?dWtld0E1enhyekZMT2luRElmUWM3SHUxdFgreDhOU2RxTDdBV1V4TklQR3BJ?=
 =?utf-8?B?elFWRnhDdkcrRy9LV25FQUg3Y2hhMkN0MGljWkNkYTg1NkhqWVNML0RYNkI2?=
 =?utf-8?B?R3BhS2haZ2NxNC90NDY0WnpZTTlUeXplazFJY1ZpQ2EzVU8yVm5ucmdncVNi?=
 =?utf-8?B?QVVRbENUQ1NLUUlNODhWcTI5VUMvcGd2bE56UStVWm9iVG4rSk9IbmhHTkE2?=
 =?utf-8?B?ZVE2S1BGNXN0M2ptWTFnc0JIRTNNNjlhK3U3U2V2N0VMQ3FvRklFMW9HRWFF?=
 =?utf-8?B?bTFlN2tUaTd5UFovaU1JU1FaOFR6YWQ5bTBZMEpxbzRYVkRQOWNZUjFMNmMx?=
 =?utf-8?B?YVVlVjFXV0VwRjYySkhBcVlEZmMyQnBiVFV0K2IzU01Pa0ZuTStuZ2NvVkp0?=
 =?utf-8?B?dUdndCtBc1hUTW13OGpNdkdFaVJSOExRZXZqaXhTWGpEVzN0NXFEVDA3NDYw?=
 =?utf-8?B?a0JkTFZPbk41VTBxVjMvS0FNZGFNemlCYWJ5aFppVUdEN1hUSUdJRzRRaVRU?=
 =?utf-8?B?QWlSMmVreU55MFdaTldWWVFHTGR3T2U5cnExTTZNcmJIK0V0MC9lRjNuRExM?=
 =?utf-8?B?SStTTFZiU0VlWHl1NC9NN0IyV3pjY2JoRnh5cDFZS0RhNGJjejJ6bHBSWlJY?=
 =?utf-8?B?dWVDYytsVENFb2NFQ2w4T2hrS2l6WEdaS0ZDc1cwSHlpU3ZFTGNxNmk0c2VK?=
 =?utf-8?B?YmFXY3cyVmdpdkhkRmhmaW5LUTFsQ2Q2b1JQNXBDcE1xQThxT0lVUVp2YXd6?=
 =?utf-8?B?bUQvQnBmcHhwNmh3eTB3aTFPZ093ZjlUTVRrWithNlQ3ejdDb1ZoeW1iQU5S?=
 =?utf-8?B?Y3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a8bd43f6-9ade-4bc3-836c-08db72225ec2
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5474.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2023 06:40:15.0759 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nXu12BV6CzW0NAZvZ7Xd6rCxA9XgPRWMqph1NdOLNv1UXUDIqTP65y6aDe3lZktbFmKtvmLNLpGdSx8s5/r+S70sMk5fX7MthC/J6iZ2fbo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6813
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
Cc: "alexander.deucher@amd.com" <alexander.deucher@amd.com>,
 Oded Gabbay <ogabbay@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 06-06-2023 19:34, Tomer Tayar wrote:
> On 05/06/2023 20:18, Iddamsetty, Aravind wrote:
>>
>> On 04-06-2023 22:37, Tomer Tayar wrote:
>>> On 26/05/2023 19:20, Aravind Iddamsetty wrote:
>>>> Define the netlink commands and attributes that can be commonly used
>>>> across by drm drivers.
>>>>
>>>> Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
>>>> ---
>>>>    include/uapi/drm/drm_netlink.h | 68 ++++++++++++++++++++++++++++++++++
>>>>    1 file changed, 68 insertions(+)
>>>>    create mode 100644 include/uapi/drm/drm_netlink.h
>>>>
>>>> diff --git a/include/uapi/drm/drm_netlink.h b/include/uapi/drm/drm_netlink.h
>>>> new file mode 100644
>>>> index 000000000000..28e7a334d0c7
>>>> --- /dev/null
>>>> +++ b/include/uapi/drm/drm_netlink.h
>>>> @@ -0,0 +1,68 @@
>>>> +/*
>>>> + * Copyright 2023 Intel Corporation
>>>> + *
>>>> + * Permission is hereby granted, free of charge, to any person obtaining a
>>>> + * copy of this software and associated documentation files (the "Software"),
>>>> + * to deal in the Software without restriction, including without limitation
>>>> + * the rights to use, copy, modify, merge, publish, distribute, sublicense,
>>>> + * and/or sell copies of the Software, and to permit persons to whom the
>>>> + * Software is furnished to do so, subject to the following conditions:
>>>> + *
>>>> + * The above copyright notice and this permission notice (including the next
>>>> + * paragraph) shall be included in all copies or substantial portions of the
>>>> + * Software.
>>>> + *
>>>> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
>>>> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
>>>> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
>>>> + * VA LINUX SYSTEMS AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM, DAMAGES OR
>>>> + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
>>>> + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
>>>> + * OTHER DEALINGS IN THE SOFTWARE.
>>>> + */
>>>> +
>>>> +#ifndef _DRM_NETLINK_H_
>>>> +#define _DRM_NETLINK_H_
>>>> +
>>>> +#include <linux/netdevice.h>
>>>> +#include <net/genetlink.h>
>>>> +#include <net/sock.h>
>>> This is a uapi header.
>>> Are all header files here available for user?
>> no they are not, I later came to know that we should not have any of
>> that user can't use so will split the header into 2.
>>> Also, should we add here "#if defined(__cplusplus) extern "C" { ..."?
>> ya will add that
>>>> +
>>>> +#define DRM_GENL_VERSION 1
>>>> +
>>>> +enum error_cmds {
>>>> +	DRM_CMD_UNSPEC,
>>>> +	/* command to list all errors names with config-id */
>>>> +	DRM_CMD_QUERY,
>>>> +	/* command to get a counter for a specific error */
>>>> +	DRM_CMD_READ_ONE,
>>>> +	/* command to get counters of all errors */
>>>> +	DRM_CMD_READ_ALL,
>>>> +
>>>> +	__DRM_CMD_MAX,
>>>> +	DRM_CMD_MAX = __DRM_CMD_MAX - 1,
>>>> +};
>>>> +
>>>> +enum error_attr {
>>>> +	DRM_ATTR_UNSPEC,
>>>> +	DRM_ATTR_PAD = DRM_ATTR_UNSPEC,
>>>> +	DRM_ATTR_REQUEST, /* NLA_U8 */
>>>> +	DRM_ATTR_QUERY_REPLY, /*NLA_NESTED*/
>>> Missing spaces in /*NLA_NESTED*/
>>>
>>>> +	DRM_ATTR_ERROR_NAME, /* NLA_NUL_STRING */
>>>> +	DRM_ATTR_ERROR_ID, /* NLA_U64 */
>>>> +	DRM_ATTR_ERROR_VALUE, /* NLA_U64 */
>>>> +
>>>> +	__DRM_ATTR_MAX,
>>>> +	DRM_ATTR_MAX = __DRM_ATTR_MAX - 1,
>>>> +};
>>>> +
>>>> +/* attribute policies */
>>>> +static const struct nla_policy drm_attr_policy_query[DRM_ATTR_MAX + 1] = {
>>>> +	[DRM_ATTR_REQUEST] = { .type = NLA_U8 },
>>>> +};
>>> Should these policies structures be in uapi?
>> so ya these will also likely move into a separate drm header as
>> userspace would define there own policy.
>>>> +
>>>> +static const struct nla_policy drm_attr_policy_read_one[DRM_ATTR_MAX + 1] = {
>>>> +	[DRM_ATTR_ERROR_ID] = { .type = NLA_U64 },
>>>> +};
>>> I might miss something here, but why it is not a single policy structure
>>> with entries for DRM_ATTR_REQUEST and DRM_ATTR_ERROR_ID?
>> so each command can have it's own policy defined, i.e what attributes it
>> expects we could define only those, that way we can have a check as
>> well. So, in the present implementation DRM_CMD_QUERY and
>> DRM_CMD_READ_ALL expect only DRM_ATTR_REQUEST and while DRM_CMD_READ_ONE
>> expects only DRM_ATTR_ERROR_ID as part of the incoming message from user.
>>
>> Thanks,
>> Aravind.
> 
> But "struct genl_ops" expects a pointer to "struct nla_policy", and in 
> the definition of "xe_genl_ops", each entry is set with a pointer to 
> these arrays of "struct nla_policy".
> Won't they use the first entry (DRM_ATTR_UNSPEC) of the arrays? 
> Shouldn't we set use there the arrays at indices DRM_ATTR_REQUEST and 
> DRM_ATTR_ERROR_ID?
> If yes, then can't we have a single policy array, each entry defines a 
> policy per attribute, and we will use the suitable policy entry for each 
> command?
Hi Tomer,

apologies for my late reply.

a command can accept more than one attribute. so the genl netlink core
would validate the each attributes passed in the recv message by
checking with the policy array in CMD definition.

Thanks,
Aravind.


> 
> Thanks,
> Tomer
> 
>>> Thanks,
>>> Tomer
>>>
>>>> +
>>>> +#endif
>>>
> 
