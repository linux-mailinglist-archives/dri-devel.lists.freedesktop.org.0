Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DE9C43D40B7
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jul 2021 21:27:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7ABCF6FCEE;
	Fri, 23 Jul 2021 19:27:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A53896FCED;
 Fri, 23 Jul 2021 19:27:08 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10054"; a="192211809"
X-IronPort-AV: E=Sophos;i="5.84,264,1620716400"; d="scan'208";a="192211809"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2021 12:27:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,264,1620716400"; d="scan'208";a="578089195"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
 by fmsmga001.fm.intel.com with ESMTP; 23 Jul 2021 12:27:07 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Fri, 23 Jul 2021 12:27:07 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Fri, 23 Jul 2021 12:27:06 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Fri, 23 Jul 2021 12:27:06 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.176)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Fri, 23 Jul 2021 12:27:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lqxcp4DaT+elEUhkHrzFOOJDyfKNZLNvP8wyH7NkWTWpGXpeZwpCd+ZNKoM4u1U4LBNaGP3dLwpGffimmWAb6C7wX351E5KkV5O+S0yEQbjKcESzade25RdKDAly/941RZT86L5zZNqr0JBed9EtDNkOogX/CSQTwGp9wH8cEkd5FBqzwqcJu/6mvuruFillkSUc7p0yXB62UU6Uxb2vBEIomE5UpZZP+ngrYxUUGkhQFDCQBf/BaUDiLaIjD1V3Fyn0bMleJtDaoUuNpuNOp/CddgaEMXe2MChyaVqgWbtzg7kYL0DuDVB9SdKy+uV/lU1d/ZBlOnN4653Ul1XHyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AOJrfXLPl5O4C9ZvRSuQcclJh54cXhMU0EFNtVwvnW8=;
 b=adfNn1ecdeJojqYrgwTsN3ngAI6Q7R9dr11D1aujiwawZQBEJ+eUSuyePUAwe9jmfmXKfkQfOKXJiUTHqG2SMSk+w4ZpDI7wtmnVryIq+v+eQrHx2V6qMKALRk0E0A3ZIi7CCQWFkAnsz/9sdyhFOJSXJ5S8sgtNlbddWIxwjN4AK24ihoaQiPttNFW7xB5s46DKr133Gr7qO3u664gFJD2GwRGZQUbnPpv54I04OLag6Wcdsbm9LrktKQ78RBPK9tYYCx3ckHv9MMRVMo2A2ZGvuAWgUTDq0i2rhd5q3y4ZI6paAYVQfW5cLk7vdfMHrB5Snh/DYu99rfSkFafr2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AOJrfXLPl5O4C9ZvRSuQcclJh54cXhMU0EFNtVwvnW8=;
 b=KiDqE3mJyVGkKUDXbCTpNJRjl5qzjB9Vhos2x3fa/BFJG8yQBk8m63I+bGOWEEwNWyLe8ad52SoijBFFLOZms+wPftb+C25RHXKRz2avsqJsBWrQjDnHQpzrvJUXPzDTxky6bQKuUdpIUHo+u7Sf2Mo589zdm+7ga07PYR5/Qj8=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
Received: from CO6PR11MB5634.namprd11.prod.outlook.com (2603:10b6:5:35d::20)
 by CO6PR11MB5586.namprd11.prod.outlook.com (2603:10b6:5:35d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.24; Fri, 23 Jul
 2021 19:26:58 +0000
Received: from CO6PR11MB5634.namprd11.prod.outlook.com
 ([fe80::5d5e:b6bf:aafa:ecd4]) by CO6PR11MB5634.namprd11.prod.outlook.com
 ([fe80::5d5e:b6bf:aafa:ecd4%9]) with mapi id 15.20.4352.029; Fri, 23 Jul 2021
 19:26:58 +0000
Subject: Re: [PATCH 04/14] drm/i915/guc/slpc: Adding SLPC communication
 interfaces
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20210721161120.24610-1-vinay.belgaumkar@intel.com>
 <20210721161120.24610-5-vinay.belgaumkar@intel.com>
 <4cd00217-6620-b766-9d2e-dce21ad4c1df@intel.com>
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
Message-ID: <06031979-b193-3355-f45f-a44dc8ff118c@intel.com>
Date: Fri, 23 Jul 2021 12:26:55 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.12.0
In-Reply-To: <4cd00217-6620-b766-9d2e-dce21ad4c1df@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW3PR05CA0021.namprd05.prod.outlook.com
 (2603:10b6:303:2b::26) To CO6PR11MB5634.namprd11.prod.outlook.com
 (2603:10b6:5:35d::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.71] (99.88.121.38) by
 MW3PR05CA0021.namprd05.prod.outlook.com (2603:10b6:303:2b::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4373.7 via Frontend Transport; Fri, 23 Jul 2021 19:26:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: da06df33-ad98-451a-244f-08d94e0fd691
X-MS-TrafficTypeDiagnostic: CO6PR11MB5586:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO6PR11MB55868F96E0E776BBFD1B868085E59@CO6PR11MB5586.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 66rkHtYRO4lVz8NemQ2S2OOdcbKTd4jnTf8u74l9aOI/S58FRO26YJ6V/emhkI9m6JXlbB9tD+x7yrmVWPepa8EkCN0a9nM6l9HL1TholUjpzo2qUFOzhUgkKFbUC/z5NSqGVLZelwW7c+w4HhVmNAlv3gHSBvyYQOjtfEidTik1OJTmmqPvYDJ3D9r9U56RhpnF+/01a41C72gzDyMEntKb0Gsvi7VvEyvobrKdb+kmQtngwTcjI3AtdIxet41dxYLxftanRJMbCNItu/CcCUJyU/HC9yg27rEp3QqCj2Fmm9rdZoqzxfMwk0v6D8Q8HVLN8rQcc/LTlGpNCLVenztNvjs+LVZNisH5EBtkOnXRjr2S3O7ZC+wziaQLH75mkBAFgD8eW5VvkHR8TG1NUzECjuwygkGXrhzW5xt3bPxZ5CnICp+VSfqC6disOwbR5ATmI8fgVpSF0ZaGw6sa7W9dPhztPA+vrRVfsCZkrFzuI/xzJUMfGEFDjP5FmAK6cS7WZar/WRuKrlYUHZ2BkIxLpQxjWTQ9GiE3tUy36xyVZZtv4G66aPngqL+oeUyJHalR/FuKxXNB+kWc8xoW5OVOckP9N8n0LjmydeyctQMqpGBYScIVDxcX0zjI7SjAHnEyVCoJ34zk1xgNhP4vwuCYuq51dOK3xpX3Ph/cH6AOfRATEUDrbABIcYoM6gv5nPxLAaoIQGjFUS98r5BsrUDGBG92POoIVk8KU+qmIXk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR11MB5634.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(136003)(39860400002)(366004)(376002)(16576012)(186003)(38100700002)(66946007)(478600001)(2616005)(956004)(36756003)(66476007)(8936002)(83380400001)(2906002)(66556008)(31696002)(8676002)(6486002)(30864003)(31686004)(316002)(26005)(5660300002)(4326008)(107886003)(450100002)(86362001)(53546011)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QVUyT20ySFpDNFlMRlZUZUlubStSY1hCVFBkTnU1OXpBMCt1TGxvVnFPMnFi?=
 =?utf-8?B?Yk80aHlLdlRjUVYvRDlJblZjUjFLaFBUZVV1VDlnb0pWb0RlWlZvaVE3MWdC?=
 =?utf-8?B?akQvVzM3N3dLRmtyYXRjWXNBNUZHSU9KR2tCdWc1RDh2YkZ0WmgxVXorc29M?=
 =?utf-8?B?QXFmYk53dW9NN0RrWWFwRUJmNWFlcjFHTWx3NmdYM0tNZE9JYm5sWmIyOWo0?=
 =?utf-8?B?elFiYWwyNFR6ai9wNWkxZ2crdlVpQ1JUZ0Z3QjZTR3JFK0hDTWhwZWkvNmdQ?=
 =?utf-8?B?T0szaHZKTmMwYXhtaVRCRGxWZ2g2NDV6ZFRoWHZ5RUlQU1JnV0FSSDlPL01S?=
 =?utf-8?B?M1AwQXBpVVdPTFBEQ010ZFhBS2thRndLWU1JMm9QR1RuV3ZvKy9YZ1dXby9l?=
 =?utf-8?B?ZDlnZ25BdEZMSnR0NHM3VHNNL2Z5Q1p0ZlBSeVdaRzJRR0xTa3JheGllc2Rq?=
 =?utf-8?B?MENhSzBKYUJ6bThnMmM2dE82eHc4b0V1d1lzdGFZbEI5Mmd6eUg4MW9CY0p2?=
 =?utf-8?B?S3JHTnZRcEh3bEkxZlkwOVlsTEhLLzZVUWMzYVpsZjZleWVwTllEMTdIbjM2?=
 =?utf-8?B?V0lBZmVnR0ptOERsRUQyUHdEaWY4VVFmLzNGZndGclRxZVZEYjg5UWlSRUdw?=
 =?utf-8?B?WHhJTWxQR2VvTTBsVnFHYnpxUFFUZzIzT0dsNkluMi92SDJrRS9rNEwzd1lB?=
 =?utf-8?B?Z1VaVWc0OTd5S2lFYUpTRUtkZHNIb2Y3SXN2YlVUUWltWldtQi9RWWVlYnJq?=
 =?utf-8?B?K0wvV05icDNsSUx1ajcxUTl6QmZETUwyY2F6RjB4SkpEV01RbXBjcE1ISC81?=
 =?utf-8?B?WEU2SWcvbkJ1MFFSRGhtZVYxVXJZU0h6c2ZyWmxSWHYydVZmVGZ6WEw1UTNs?=
 =?utf-8?B?MExGYkdFVjVtSzdJcmdaOHZiMEVZVWpWcVlWdm92aUpGd1FBQUdCOEFyYjZQ?=
 =?utf-8?B?T2RMV3dHNUNGTlRiMnRjOGFrNVY0SkY1My9VVFlYOXpKTDl6UE5oVzF6NitZ?=
 =?utf-8?B?QnM5RVF3cmRXRFNkb1g1THE0b0lXYXJ0RzhvU3MweW0rTTNiQVUzZXhGemZB?=
 =?utf-8?B?NTRyTE44NTU4OW0zNXpUMnFINVhiVU5za2FnTDlGYTNZdVhndWxFWEJLMkZD?=
 =?utf-8?B?ejNJcUJ4MnNiK242WllXakNUN1JmRUNzZjBGV1Z4cStjTU1TZkhyam8yMVBB?=
 =?utf-8?B?MWtiRHFLMjlzNlBTTExkUzZUY21mZGpPc2FyTllxN1FISGlIc2NxTmRabGdR?=
 =?utf-8?B?OVpYNnJoYnZFZ0tlY2dMVUlXa2pnLzJBaHArdlNsaGROamVnVE94Q3N0QnpH?=
 =?utf-8?B?VGhVRGRhdS9ZMU1rR2ZOSHFVRlpPZXh0RHJpSGhhNWV1Y1dRVkpqR1FNbFVy?=
 =?utf-8?B?NzdGOXZ6ZjBqeVlrbi83QThsY2ZmS0Z0VFlNZnh5akxuSXpsaFlySkxORy8w?=
 =?utf-8?B?TTQ2VTBKazJzVkdVZzJtNXNLZHJrbW5PZ2lQcTM2QTVEOGN4ai83RHhEbVMv?=
 =?utf-8?B?dzc4d0I5ZWRZdFFweGFmU1l5bEh2WmZ6dUhkSXNBclMvV0dqZ1AzUkFqc1ov?=
 =?utf-8?B?aUFYMEJteEdkRFNqTm5XYUlxaEQzY1UxYzVsZ1VnNU1JTkhaRHVEWTA3ckVI?=
 =?utf-8?B?WUs5dUM1S21JZVZBZXUrNyt1ZEI2SVNIVWV3NXI0RGh6NnJrSGlwdm4ySkxl?=
 =?utf-8?B?dlBWeVMvY1dwRVpZSk5YMTByUjBnWFdzclBKOG5GTlA2emY4MjZ1dTc4UmpU?=
 =?utf-8?Q?nVsWVqZSgIvwrD4Gc1Py+Eyycn/l4pV2YFva3vk?=
X-MS-Exchange-CrossTenant-Network-Message-Id: da06df33-ad98-451a-244f-08d94e0fd691
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5634.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2021 19:26:58.1704 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CJEE38EZnBG2vlFhxJKM/44KYvQWmfu98uiccPuJyJgAUil1KqjSdR0zSSSVyRM3ooubHaNnjxt8hIgrtid1Oi3y0F/0MMR+f05q5IBBFFg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5586
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
Cc: Sundaresan Sujaritha <sujaritha.sundaresan@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 7/21/2021 10:25 AM, Michal Wajdeczko wrote:
> 
> 
> On 21.07.2021 18:11, Vinay Belgaumkar wrote:
>> Add constants and params that are needed to configure SLPC.
>>
>> v2: Add a new abi header for SLPC. Replace bitfields with
>> genmasks. Address other comments from Michal W.
>>
>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>> Signed-off-by: Sundaresan Sujaritha <sujaritha.sundaresan@intel.com>
>> ---
>>   .../drm/i915/gt/uc/abi/guc_actions_slpc_abi.h | 201 ++++++++++++++++++
>>   drivers/gpu/drm/i915/gt/uc/intel_guc.c        |   4 +
>>   drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h   |   1 +
>>   3 files changed, 206 insertions(+)
>>   create mode 100644 drivers/gpu/drm/i915/gt/uc/abi/guc_actions_slpc_abi.h
>>
>> diff --git a/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_slpc_abi.h b/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_slpc_abi.h
>> new file mode 100644
>> index 000000000000..05d809746b32
>> --- /dev/null
>> +++ b/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_slpc_abi.h
>> @@ -0,0 +1,201 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2021 Intel Corporation
>> + */
>> +
>> +#ifndef _GUC_ACTIONS_SLPC_ABI_H_
>> +#define _GUC_ACTIONS_SLPC_ABI_H_
>> +
>> +#include <linux/types.h>
>> +
>> +/**
>> + * SLPC SHARED DATA STRUCTURE
> 
> if you want to use kernel-doc, then add DOC: tag
ok.
> 
>> + *
>> + *  +---+-------+--------------------------------------------------------------+
>> + *  | CL| Bytes | Description                                                  |
>> + *  +===+=======+==============================================================+
>> + *  | 1 | 0-3   | SHARED DATA SIZE                                             |
>> + *  |   +-------+--------------------------------------------------------------+
>> + *  |   | 4-7   | GLOBAL STATE                                                 |
>> + *  |   +-------+--------------------------------------------------------------+
>> + *  |   | 8-11  | DISPLAY DATA ADDRESS                                         |
>> + *  |   +-------+--------------------------------------------------------------+
>> + *  |   | 12:63 | PADDING                                                      |
>> + *  +---+-------+--------------------------------------------------------------+
>> + *  |   | 0:63  | PADDING(PLATFORM INFO)                                       |
>> + *  +---+-------+--------------------------------------------------------------+
>> + *  | 3 | 0-3   | TASK STATE DATA                                              |
>> + *  +   +-------+--------------------------------------------------------------+
>> + *  |   | 4:63  | PADDING                                                      |
>> + *  +---+-------+--------------------------------------------------------------+
>> + *  |4-21 0:1087| OVERRIDE PARAMS AND BIT FIELDS                               |
>         ^^^^^
> something didn't work here

Fixed.

> 
>> + *  +---+-------+--------------------------------------------------------------+
>> + *  |   |       | PADDING + EXTRA RESERVED PAGE                                |
>> + *  +---+-------+--------------------------------------------------------------+
>> + */
>> +
>> +/*
>> + * SLPC exposes certain parameters for global configuration by the host.
>> + * These are referred to as override parameters, because in most cases
>> + * the host will not need to modify the default values used by SLPC.
>> + * SLPC remembers the default values which allows the host to easily restore
>> + * them by simply unsetting the override. The host can set or unset override
>> + * parameters during SLPC (re-)initialization using the SLPC Reset event.
>> + * The host can also set or unset override parameters on the fly using the
>> + * Parameter Set and Parameter Unset events
>> + */
>> +
>> +#define SLPC_MAX_OVERRIDE_PARAMETERS		256
>> +#define SLPC_OVERRIDE_BITFIELD_SIZE \
>> +		(SLPC_MAX_OVERRIDE_PARAMETERS / 32)
>> +
>> +#define SLPC_PAGE_SIZE_BYTES			4096
>> +#define SLPC_CACHELINE_SIZE_BYTES		64
>> +#define SLPC_SHARED_DATA_SIZE_BYTE_HEADER	SLPC_CACHELINE_SIZE_BYTES
>> +#define SLPC_SHARED_DATA_SIZE_BYTE_PLATFORM_INFO	SLPC_CACHELINE_SIZE_BYTES
>> +#define SLPC_SHARED_DATA_SIZE_BYTE_TASK_STATE	SLPC_CACHELINE_SIZE_BYTES
>> +#define SLPC_SHARED_DATA_MODE_DEFN_TABLE_SIZE	SLPC_PAGE_SIZE_BYTES
>> +#define SLPC_SHARED_DATA_SIZE_BYTE_MAX		(2 * SLPC_PAGE_SIZE_BYTES)
>> +#define SLPC_EVENT(id, argc)			((u32)(id) << 8 | (argc))
>> +#define SLPC_EVENT_MAX_INPUT_ARGS		9
> 
> above two are likely used in H2G SLPC message that is not fully defined,
> maybe at the end of this file add separate section with H2G format,
> using plain C #defines, and move SLPC_EVENT helper macro to fwif.h

ok.

> 
>> +
>> +/*
>> + * Cacheline size aligned (Total size needed for
>> + * SLPM_KMD_MAX_OVERRIDE_PARAMETERS=256 is 1088 bytes)
>> + */
>> +#define SLPC_OVERRIDE_PARAMS_TOTAL_BYTES	(((((SLPC_MAX_OVERRIDE_PARAMETERS * 4) \
>> +						+ ((SLPC_MAX_OVERRIDE_PARAMETERS / 32) * 4)) \
>> +		+ (SLPC_CACHELINE_SIZE_BYTES-1)) / SLPC_CACHELINE_SIZE_BYTES)*SLPC_CACHELINE_SIZE_BYTES)
>> +
>> +#define SLPC_SHARED_DATA_SIZE_BYTE_OTHER	(SLPC_SHARED_DATA_SIZE_BYTE_MAX - \
>> +					(SLPC_SHARED_DATA_SIZE_BYTE_HEADER \
>> +					+ SLPC_SHARED_DATA_SIZE_BYTE_PLATFORM_INFO \
>> +					+ SLPC_SHARED_DATA_SIZE_BYTE_TASK_STATE \
>> +					+ SLPC_OVERRIDE_PARAMS_TOTAL_BYTES \
>> +					+ SLPC_SHARED_DATA_MODE_DEFN_TABLE_SIZE))
>> +
>> +enum slpc_task_enable {
>> +	SLPC_PARAM_TASK_DEFAULT = 0,
>> +	SLPC_PARAM_TASK_ENABLED,
>> +	SLPC_PARAM_TASK_DISABLED,
>> +	SLPC_PARAM_TASK_UNKNOWN
>> +};
>> +
>> +enum slpc_global_state {
>> +	SLPC_GLOBAL_STATE_NOT_RUNNING = 0,
>> +	SLPC_GLOBAL_STATE_INITIALIZING = 1,
>> +	SLPC_GLOBAL_STATE_RESETTING = 2,
>> +	SLPC_GLOBAL_STATE_RUNNING = 3,
>> +	SLPC_GLOBAL_STATE_SHUTTING_DOWN = 4,
>> +	SLPC_GLOBAL_STATE_ERROR = 5
>> +};
>> +
>> +enum slpc_param_id {
>> +	SLPC_PARAM_TASK_ENABLE_GTPERF = 0,
>> +	SLPC_PARAM_TASK_DISABLE_GTPERF = 1,
>> +	SLPC_PARAM_TASK_ENABLE_BALANCER = 2,
>> +	SLPC_PARAM_TASK_DISABLE_BALANCER = 3,
>> +	SLPC_PARAM_TASK_ENABLE_DCC = 4,
>> +	SLPC_PARAM_TASK_DISABLE_DCC = 5,
>> +	SLPC_PARAM_GLOBAL_MIN_GT_UNSLICE_FREQ_MHZ = 6,
>> +	SLPC_PARAM_GLOBAL_MAX_GT_UNSLICE_FREQ_MHZ = 7,
>> +	SLPC_PARAM_GLOBAL_MIN_GT_SLICE_FREQ_MHZ = 8,
>> +	SLPC_PARAM_GLOBAL_MAX_GT_SLICE_FREQ_MHZ = 9,
>> +	SLPC_PARAM_GTPERF_THRESHOLD_MAX_FPS = 10,
>> +	SLPC_PARAM_GLOBAL_DISABLE_GT_FREQ_MANAGEMENT = 11,
>> +	SLPC_PARAM_GTPERF_ENABLE_FRAMERATE_STALLING = 12,
>> +	SLPC_PARAM_GLOBAL_DISABLE_RC6_MODE_CHANGE = 13,
>> +	SLPC_PARAM_GLOBAL_OC_UNSLICE_FREQ_MHZ = 14,
>> +	SLPC_PARAM_GLOBAL_OC_SLICE_FREQ_MHZ = 15,
>> +	SLPC_PARAM_GLOBAL_ENABLE_IA_GT_BALANCING = 16,
>> +	SLPC_PARAM_GLOBAL_ENABLE_ADAPTIVE_BURST_TURBO = 17,
>> +	SLPC_PARAM_GLOBAL_ENABLE_EVAL_MODE = 18,
>> +	SLPC_PARAM_GLOBAL_ENABLE_BALANCER_IN_NON_GAMING_MODE = 19,
>> +	SLPC_PARAM_GLOBAL_RT_MODE_TURBO_FREQ_DELTA_MHZ = 20,
>> +	SLPC_PARAM_PWRGATE_RC_MODE = 21,
>> +	SLPC_PARAM_EDR_MODE_COMPUTE_TIMEOUT_MS = 22,
>> +	SLPC_PARAM_EDR_QOS_FREQ_MHZ = 23,
>> +	SLPC_PARAM_MEDIA_FF_RATIO_MODE = 24,
>> +	SLPC_PARAM_ENABLE_IA_FREQ_LIMITING = 25,
>> +	SLPC_PARAM_STRATEGIES = 26,
>> +	SLPC_PARAM_POWER_PROFILE = 27,
>> +	SLPC_PARAM_IGNORE_EFFICIENT_FREQUENCY = 28,
>> +	SLPC_MAX_PARAM = 32,
>> +};
>> +
>> +enum slpc_event_id {
>> +	SLPC_EVENT_RESET = 0,
>> +	SLPC_EVENT_SHUTDOWN = 1,
>> +	SLPC_EVENT_PLATFORM_INFO_CHANGE = 2,
>> +	SLPC_EVENT_DISPLAY_MODE_CHANGE = 3,
>> +	SLPC_EVENT_FLIP_COMPLETE = 4,
>> +	SLPC_EVENT_QUERY_TASK_STATE = 5,
>> +	SLPC_EVENT_PARAMETER_SET = 6,
>> +	SLPC_EVENT_PARAMETER_UNSET = 7,
>> +};
>> +
>> +struct slpc_task_state_data {
>> +	union {
>> +		u32 task_status_padding;
>> +		struct {
>> +			u32 status;
>> +#define SLPC_GTPERF_TASK_ACTIVE		BIT(0)
>> +#define SLPC_GTPERF_STALL_POSSIBLE	BIT(1)
>> +#define SLPC_GTPERF_GAMING_MODE		BIT(2)
>> +#define SLPC_GTPERF_TARGET_FPS		BIT(3)
>> +#define SLPC_DCC_TASK_ACTIVE		BIT(4)
>> +#define SLPC_IN_DCC			BIT(5)
>> +#define SLPC_IN_DCT			BIT(6)
>> +#define SLPC_FREQ_SWITCH_ACTIVE		BIT(7)
>> +#define SLPC_IBC_ENABLED		BIT(8)
>> +#define SLPC_IBC_ACTIVE			BIT(9)
>> +#define SLPC_PG1_ENABLED		BIT(10)
>> +#define SLPC_PG1_ACTIVE			BIT(11)
>> +		};
>> +	};
>> +	union {
>> +		u32 freq_padding;
>> +		struct {
>> +#define SLPC_MAX_UNSLICE_FREQ_MASK	REG_GENMASK(7, 0)
>> +#define SLPC_MIN_UNSLICE_FREQ_MASK	REG_GENMASK(15, 8)
>> +#define SLPC_MAX_SLICE_FREQ_MASK	REG_GENMASK(23, 16)
>> +#define SLPC_MIN_SLICE_FREQ_MASK	REG_GENMASK(31, 24)
>> +			u32 freq;
>> +		};
>> +	};
>> +} __packed;

Added.
>> +
>> +struct slpc_shared_data_header {
>> +	/* Total size in bytes of this shared buffer. */
>> +	u32 size;
>> +	u32 global_state;
>> +	u32 display_data_addr;
>> +};
> 
> __packed ?

added.
> 
>> +
>> +struct slpc_override_params {
>> +	u32 bits[SLPC_OVERRIDE_BITFIELD_SIZE];
>> +	u32 values[SLPC_MAX_OVERRIDE_PARAMETERS];
>> +};
> 
> __packed ?

Added.

> 
>> +
>> +struct slpc_shared_data {
>> +	struct slpc_shared_data_header header;
>> +	u8 shared_data_header_pad[SLPC_SHARED_DATA_SIZE_BYTE_HEADER -
>> +				sizeof(struct slpc_shared_data_header)];
>> +
>> +	u8 platform_info_pad[SLPC_SHARED_DATA_SIZE_BYTE_PLATFORM_INFO];
>> +
>> +	struct slpc_task_state_data task_state_data;
>> +	u8 task_state_data_pad[SLPC_SHARED_DATA_SIZE_BYTE_TASK_STATE -
>> +				sizeof(struct slpc_task_state_data)];
>> +
>> +	struct slpc_override_params override_params ;
>> +	u8 override_params_pad[SLPC_OVERRIDE_PARAMS_TOTAL_BYTES -
>> +				sizeof(struct slpc_override_params)];
>> +
>> +	u8 shared_data_pad[SLPC_SHARED_DATA_SIZE_BYTE_OTHER];
>> +
>> +	/* PAGE 2 (4096 bytes), mode based parameter will be removed soon */
>> +	u8 reserved_mode_definition[4096];
>> +} __packed;
>> +
>> +#endif
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
>> index 39bc3c16057b..fcccb103a21a 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
>> @@ -203,11 +203,15 @@ static u32 guc_ctl_debug_flags(struct intel_guc *guc)
>>   
>>   static u32 guc_ctl_feature_flags(struct intel_guc *guc)
>>   {
>> +	struct intel_gt *gt = guc_to_gt(guc);
>>   	u32 flags = 0;
>>   
>>   	if (!intel_guc_submission_is_used(guc))
>>   		flags |= GUC_CTL_DISABLE_SCHEDULER;
>>   
>> +	if (intel_uc_uses_guc_slpc(&gt->uc))
> 
> we should have intel_guc_uses_slpc()

Done.

Thanks,
Vinay.

> 
> Thanks,
> Michal
> 
>> +		flags |= GUC_CTL_ENABLE_SLPC;
>> +
>>   	return flags;
>>   }
>>   
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
>> index 82534259b7ad..c3122ca5407b 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
>> @@ -95,6 +95,7 @@
>>   #define GUC_CTL_WA			1
>>   #define GUC_CTL_FEATURE			2
>>   #define   GUC_CTL_DISABLE_SCHEDULER	(1 << 14)
>> +#define   GUC_CTL_ENABLE_SLPC		BIT(2)
>>   
>>   #define GUC_CTL_DEBUG			3
>>   #define   GUC_LOG_VERBOSITY_SHIFT	0
>>
