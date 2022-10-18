Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C769B6033DF
	for <lists+dri-devel@lfdr.de>; Tue, 18 Oct 2022 22:25:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43A8010E94F;
	Tue, 18 Oct 2022 20:25:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7429810E94F;
 Tue, 18 Oct 2022 20:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666124734; x=1697660734;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Esk7y4yc1G/Uw/5e2H9IKch66WtMQSnBqG4iElqzvqA=;
 b=Ld4cGrbf6hzieCNCl6zDWYw2iZD9oYNEiy7ef0UnXB9MohOWdLozvUjt
 zXzfNr+x0KzblbJKT5FIvbMZwMZOux90Zn32fJG9bf9vUWF+qZ37WVG6Q
 Oc8asjTpzG6wPm9DgMf1VSmc/HNJXtA3u4MYSOIkobG/7bt8vnCREmw0t
 79eEEUPeiC/fXSmK8i34lIQA0oyl7ioReqaeKq5bOJJoGZNt0r04Fz1nI
 xVrC34rZbfiLDhBdf1DqfsBorYtfC0YMTVzwVITpnQs9S0Zip9LuWkYB1
 KpAS0AlJN/MqBwwdKrrfA0ADEZZdMmgDEpnxz8eLCZVWbJcVZobknk91D g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10504"; a="368281018"
X-IronPort-AV: E=Sophos;i="5.95,194,1661842800"; d="scan'208";a="368281018"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2022 13:25:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10504"; a="692002855"
X-IronPort-AV: E=Sophos;i="5.95,194,1661842800"; d="scan'208";a="692002855"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga008.fm.intel.com with ESMTP; 18 Oct 2022 13:25:32 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 18 Oct 2022 13:25:32 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 18 Oct 2022 13:25:32 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Tue, 18 Oct 2022 13:25:32 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.102)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Tue, 18 Oct 2022 13:25:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oIq0J7HJcvKlIs5zpkUesFivDeGVCYVKn7J3nBZ098XbZXyzcqcJGihg2Fwz8wEmgPJPZtos3KsAv9GJvuguNTHsnUJKP2AMDGfUdINMRe3Zw6OjGTYZM2dbOdagkVm9oLFhc9pjvE0Tl9ERbB0PtCgTWtj3hGLe/NIVgGppavva9AfY9xdO3JdPcoyG8th8oRMpSx1ELXYB/vqNmcnKKrRHIx5vRcEYcPlUvDWBTHHBMDR7YVuDi4bV17F8TRWAhuumH1dEBxYl3PWJlu+WeQHXUSQSeovpg2caDtZqdCRZAeyDsa0hnAyvtWtw+zp/BDceYviLus4MxSok1v/8Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0Bu6L+O1PukEN85x8d0en777RF6w0Z15Ku4tqrWclhs=;
 b=QL/cqYIAkgHjN5Y1oDyZ8hnUw3hrJ2a4NotTx9aIS3vSNKBg8tTXhTaPavacTtUQaXM7P6BCU5bWLgQY6IfARrz9C5wTRqUn9m82CzokbJry551aLkWj5sftRYgQq/Pa/fUYlPywBMoyunjBtW++QLh9jdOoP+ssSodKVWqwrbuYG4DePKl4O0uqzG1lkQ7YlzmHH8O0rnuO3cGCiJQbUdL/ZzVVsyi6zF3dh5OYHkf2g1bIyKKvVo0QfSWC0joNST0bcudIsJArW6aHoiTXcztksWn7KvQ8BvY4kEFhxYNl0r8P2tImeIaxh99APG2oY66Z2P69i5m5K3cQGfASvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 SJ0PR11MB5866.namprd11.prod.outlook.com (2603:10b6:a03:429::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.26; Tue, 18 Oct
 2022 20:25:27 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::bff2:8e4f:a657:6095]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::bff2:8e4f:a657:6095%4]) with mapi id 15.20.5723.033; Tue, 18 Oct 2022
 20:25:27 +0000
Message-ID: <bcd3e176-4971-1425-3223-bf36f83e617f@intel.com>
Date: Tue, 18 Oct 2022 13:25:25 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v2 3/7] drm/i915/uc: use different ggtt pin offsets for uc
 loads
Content-Language: en-US
To: John Harrison <john.c.harrison@intel.com>,
 <intel-gfx@lists.freedesktop.org>
References: <20221013000332.1738078-1-daniele.ceraolospurio@intel.com>
 <20221013000332.1738078-4-daniele.ceraolospurio@intel.com>
 <2fab9f05-7c41-2564-b7e1-a26962bb8b42@intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <2fab9f05-7c41-2564-b7e1-a26962bb8b42@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY5PR20CA0013.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::26) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5488:EE_|SJ0PR11MB5866:EE_
X-MS-Office365-Filtering-Correlation-Id: 3cba76cf-fdcb-4e2d-2fdb-08dab146e530
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Fm7gtjum0mePcdkLNq/uLfqxtEsFHU+DWRkpXli/3VF3gkgrS8wT/AYvEzAbDn2BahlaeiC+7JOIECVzl1MnhasaH7z2pDfastdA6o6i6luB/KkCl+h8Q5O/FrTcc6lC8LE9PACcl3gHtCrVK8mYNGyKJL2kPyYMoMHwjAVkVgig3WjZunNAufG2VwXEvsZxfCujPUs/N2jDi5d5vTGpzrkwVukOZW4gqddgVDzwv4vqPEMBa3qbnyx6jujs4ZEq0E7YXj8MwKcb6k+NX7jwY6vakX+zhCjLGFA/+AyoQlIw+P+CI/5ZGOSpsvn33JxCqf8Bl5XcLwH+Mt+iDnZGVRgZ6bxuMCpxAL/KVGFPXc/sDnh3c5hV7iIiT4ucTPgbt5s97XFi62Vu5zrkwG+B7Dhzpl4InUg3U5OKKAFlNxc+fYW217n2RG1HbNB+6rGMbJ7fgAHsGfxKIq0ftpJcsil7QM8vgU86vupLI2WedXVOMt/JnHh9BKhis3z0O76SksasGnwK9WVydvT5+h1B80NSWIwmmLhL3SPUNICTjMLh/tgtdQfxzL/l94kHzqyQmrMjwT88J9hehBbjMhEgOvpCrpW8miQ02kDfJ/FjRJxXWMw72c1tX4XtW7mxHB987/MqVMiprEMWwwLfwJni2rM2x1u6fUNzyY19qgicKHNyQqeoGy5kBP2QcGT4NS7z/MHJKUOBbc0jYZMmDOT23vMbQ5c1Cl/S6T0DHq1XOAKB0h69PYgwtT+yG7lg0+zEPKVWHcUQGiqh46gBs7D7ulvS+g25asXJxhPSHmFhSZc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(396003)(366004)(39860400002)(376002)(136003)(346002)(451199015)(36756003)(82960400001)(86362001)(31696002)(107886003)(38100700002)(83380400001)(450100002)(66899015)(66556008)(66946007)(316002)(31686004)(5660300002)(6486002)(8936002)(66476007)(186003)(2906002)(6506007)(2616005)(478600001)(6512007)(26005)(53546011)(8676002)(41300700001)(4326008)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cGViTHdIc3l0VWVlMUMrbXRWZzhBUmhjV1V3R09BVlpST0xCaXBVMjJOVFJJ?=
 =?utf-8?B?dWc1SnNRNG05b0lpQjVXcWRuVUowdUNtWDJCRmY3RXloN1hxWHR3WWNoRXRM?=
 =?utf-8?B?SkpIUnJVdEd4b21lZ29ueEVHa2lyaHpyckFkcUUxZFZRTEFaZU5XQlFxUnpy?=
 =?utf-8?B?dkdBVGFUQ3F6WGljRnJIa0pRa21KWExHTCtkUTdiRTJ5dDdjN0I1T1JFWVpK?=
 =?utf-8?B?aC9WSFI5SUIwTkNlMmxHSCtxdWtPaHAvYm1sQ1FuUHV2N1RscmI1ZENsL0hX?=
 =?utf-8?B?UUJuVklXeU1IZVpiM1lnRnQzcGVsSWpDVW5LeGRDMmhMT3hOVTBsT3ZkeWJa?=
 =?utf-8?B?YXk1bnBrenNGalpUbS9yYkZZTjFhdEVVUVZ2VjB5QjlHOVd2OS9oVVZxQ2ph?=
 =?utf-8?B?MWFtQjJXTVkybjFBYjI1SGxWVkdXclJ6cFBtZmxyM2tTSXc3eDIzZ2xzTldT?=
 =?utf-8?B?RmhWWm90aWJ6bGJPcVRveEgxYitGdzJvanlWYmxJZnV1ZTdFRlVEK3BkaGl4?=
 =?utf-8?B?TTBhaXBuUEpPRjdCS1lQTTV3VEVlQ09HZkp3bS9HbjlaWjFjMks0OVFDTE9F?=
 =?utf-8?B?ODd0UTFyRXFiVEFmWmdEdDhTMUF5alFqeUM1ZDVyQ2FIQTcvTXNoQThvTk83?=
 =?utf-8?B?N3dzNHJJV0R5R0Ruei9GMWh6OE04ckR4Z1FrVWIvdWF2OUpSSFJ0bkR1dkZh?=
 =?utf-8?B?c1lFUXFLS0t0NkRKK3FGdEVLYTNxRzRVOTgwSzRyLzJUS29yaGZCam5tQkd1?=
 =?utf-8?B?QUJtT09RTlJXWnVhVitVM0lkT0NjZXkrdklLeDNwQ3pLUFNUTFloaWZDYkkv?=
 =?utf-8?B?bFpXMzhmdklRVE5iM3RXKzl2c3dzUGliMTVQU0ZNbUhYSHBkT0tYK1pMU3E3?=
 =?utf-8?B?cnR2bVdzMWo3Y2tYRkd5MnFhSC9MOFBuTk03bGFRMWZUM3ZjT3FuTmdiOWtN?=
 =?utf-8?B?OEk5d2VNM01Ocm5FNjVpR3dGN3ZPc0x6OGRuTkdLajBpcFlUN0wxZHpJbTFL?=
 =?utf-8?B?cVhMb1pkam5JZ2dXUENTVzAwYUVTbytmT0FOakdBUGdORzdha3FZaVQvUjNr?=
 =?utf-8?B?aE55aXowM1NaOTN2aEt3NmJOdnFJODQ1TFpkUFRVUlNyakk5ckRkYjRCUmZr?=
 =?utf-8?B?cGxHanpmQ0Z0Yk9idTVoQWZzQ3YvTGEvOEVIcFd0OE9GZ2tKZS9JbWtDVENJ?=
 =?utf-8?B?OHVBYlBpNm0zY25JWWhCai9LaFRNZnVzcWRRUWlGME1PRVpzTzE0dUtWVk8y?=
 =?utf-8?B?cTR1WWVUTVVqbS9BaTFlMmZyUzZjTU4vNE44OURoTEtKMUtqWHM4c09lcnMw?=
 =?utf-8?B?R2RDODNrVlYzUVhOckZ1bm9ENE5hZGtTZzBJbjFOVU1iTHZ0U2ZJVWVpeEcz?=
 =?utf-8?B?WGRiZWdWa2JzMTZxZG5HRUhUQnRySC9tOFBFU1pMbmtSdXdiQ0NGL0orRzZq?=
 =?utf-8?B?U2Nkb2d0UTNGY1VaRTJlaDNFWnZ3QldSeitpVkxBTE82UVNheS80RzlEYUg5?=
 =?utf-8?B?dkoydEhmckhMYVBCQU5ZVUVRRGxpcE9NZ1RMbTE1T1JIdFhwOWpwdG0wTHI3?=
 =?utf-8?B?SXdPMTdNdks2WERWdGdZWFRVRWdmZkhKaDFtUjZNTlVPcFFmYmdhSFdZZFg0?=
 =?utf-8?B?bWJ3ckN6MTBvZjN6QlRJR20rUHU5UTYrRmp5bzhraFZQTStrRHo4b0hkUVNV?=
 =?utf-8?B?Z0ZiTmVpZ0dzUmFqVUxXN2MyMWN4NS80ZXF6K0QzbitHOWdUU2JFdkxqalJt?=
 =?utf-8?B?Nzc3ZGNXMkEvd012c0xoM3dFbUtuWGdjOS9pV3RqaWVVNlNRR3p3SDRnSFJs?=
 =?utf-8?B?djBtTE02NDVUeGNQSitFZWx2QjdHQlJKNzBoR3p4S1dIRkNXRFN4WEI4OWt2?=
 =?utf-8?B?L0RCZGFYTnZDOEl6aDM0bXA4eDVhOURXUmF1MTJCWGJlMEFkVmYzZGJuZWk3?=
 =?utf-8?B?dUlrTFhpWWNxVW9CSkhJZWo2WDhZU1ZZczBQUmN5T25TMFpTbzM5anlzUlUv?=
 =?utf-8?B?a1VEVWJBK1d0QmJIUTgwU2Q4NW9DUmtPYlFpTmlaTVlwcGliMVNNOU9VTGU5?=
 =?utf-8?B?THBnenVrQmhONDllVkIvOU41dmRZeWI2bmROQU1adUVXRTFqSDc3ek9mM3JL?=
 =?utf-8?B?cnpadlVnYnFsczhtcnQ0RzZQMWdBOTE5bm9OSUFzT2I3czVsV3dGVHltdXA1?=
 =?utf-8?Q?fvbYBW6W7Ye49kRFNBKDAMs=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cba76cf-fdcb-4e2d-2fdb-08dab146e530
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2022 20:25:27.8876 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t7v2/0cqZDGb0qrr/ew3PhtyElQDTmGeOe+NNQuMtTWvMkyeJGmrS3y/d1JQ7v9eoQ8DhpFvSuZpJCT561TP6xiMZ6r7yCi2y2mofxN3roQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5866
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
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 10/17/2022 4:44 PM, John Harrison wrote:
> On 10/12/2022 17:03, Daniele Ceraolo Spurio wrote:
>> Our current FW loading process is the same for all FWs:
>>
>> - Pin FW to GGTT at the start of the ggtt->uc_fw node
>> - Load the FW
>> - Unpin
>>
>> This worked because we didn't have a case where 2 FWs would be loaded on
>> the same GGTT at the same time. On MTL, however, this can happend if 
>> both
>> GTs are reset at the same time, so we can't pin everything in the same
>> spot and we need to use separate offset. For simplicity, instead of
>> calculating the exact required size, we reserve a 2MB slot for each fw.
>>
>> v2: fail fetch if FW is > 2MBs, improve comments (John)
>>
>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> Cc: John Harrison <john.c.harrison@intel.com>
>> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
>> ---
>>   drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c | 30 +++++++++++++++++++++---
>>   drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h | 13 ++++++++++
>>   2 files changed, 40 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c 
>> b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
>> index de2843dc1307..021290a26195 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
>> @@ -575,6 +575,17 @@ int intel_uc_fw_fetch(struct intel_uc_fw *uc_fw)
>>       err = firmware_request_nowarn(&fw, uc_fw->file_selected.path, 
>> dev);
>>       memcpy(&file_ideal, &uc_fw->file_wanted, sizeof(file_ideal));
>>   +    if (!err && fw->size > INTEL_UC_RSVD_GGTT_PER_FW) {
>> +        drm_err(&i915->drm,
>> +            "%s firmware %s: size (%zuKB) exceeds max supported size 
>> (%uKB)\n",
>> +            intel_uc_fw_type_repr(uc_fw->type), 
>> uc_fw->file_selected.path,
>> +            fw->size / SZ_1K, INTEL_UC_RSVD_GGTT_PER_FW / SZ_1K);
>> +
>> +        /* try to find another blob to load */
>> +        release_firmware(fw);
>> +        err = -ENOENT;
>> +    }
>> +
>>       /* Any error is terminal if overriding. Don't bother searching 
>> for older versions */
>>       if (err && intel_uc_fw_is_overridden(uc_fw))
>>           goto fail;
>> @@ -677,14 +688,28 @@ int intel_uc_fw_fetch(struct intel_uc_fw *uc_fw)
>>     static u32 uc_fw_ggtt_offset(struct intel_uc_fw *uc_fw)
>>   {
>> -    struct i915_ggtt *ggtt = __uc_fw_to_gt(uc_fw)->ggtt;
>> +    struct intel_gt *gt = __uc_fw_to_gt(uc_fw);
>> +    struct i915_ggtt *ggtt = gt->ggtt;
>>       struct drm_mm_node *node = &ggtt->uc_fw;
>> +    u32 offset = uc_fw->type * INTEL_UC_RSVD_GGTT_PER_FW;
>> +
>> +    /*
>> +     * To keep the math simple, we use 8MB for the root tile and 8MB 
>> for
>> +     * the media one. This will need to be updated if we ever have more
>> +     * than 1 media GT
>> +     */
>> +    BUILD_BUG_ON(INTEL_UC_FW_NUM_TYPES * INTEL_UC_RSVD_GGTT_PER_FW > 
>> SZ_8M);
>> +    GEM_BUG_ON(gt->type == GT_MEDIA && gt->info.id > 1);
>> +    if (gt->type == GT_MEDIA)
>> +        offset += SZ_8M;
> This is all because render/media GTs share the same page tables? 
> Regular multi-tile is completely separate address spaces and can use a 
> single common address? Otherwise, it seems like 'offset = gt->info.id 
> * 2M' would be the generic solution and no reference to GT_MEDIA 
> required. So maybe add a quick comment to that effect?

Yup this is only because of the GGTT sharing. There is already a comment 
somewhere else, but I'll add one here as well.

>
>
>> GEM_BUG_ON(!drm_mm_node_allocated(node));
>>       GEM_BUG_ON(upper_32_bits(node->start));
>>       GEM_BUG_ON(upper_32_bits(node->start + node->size - 1));
>> +    GEM_BUG_ON(offset + uc_fw->obj->base.size > node->size);
>> +    GEM_BUG_ON(uc_fw->obj->base.size > INTEL_UC_RSVD_GGTT_PER_FW);
>>   -    return lower_32_bits(node->start);
>> +    return lower_32_bits(node->start + offset);
>>   }
>>     static void uc_fw_bind_ggtt(struct intel_uc_fw *uc_fw)
>> @@ -699,7 +724,6 @@ static void uc_fw_bind_ggtt(struct intel_uc_fw 
>> *uc_fw)
>>       dummy->bi.pages = obj->mm.pages;
>>         GEM_BUG_ON(!i915_gem_object_has_pinned_pages(obj));
>> -    GEM_BUG_ON(dummy->node_size > ggtt->uc_fw.size);
>>         /* uc_fw->obj cache domains were not controlled across 
>> suspend */
>>       if (i915_gem_object_has_struct_page(obj))
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h 
>> b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h
>> index cb586f7df270..7b3db41efa6e 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h
>> @@ -6,6 +6,7 @@
>>   #ifndef _INTEL_UC_FW_H_
>>   #define _INTEL_UC_FW_H_
>>   +#include <linux/sizes.h>
>>   #include <linux/types.h>
>>   #include "intel_uc_fw_abi.h"
>>   #include "intel_device_info.h"
>> @@ -114,6 +115,18 @@ struct intel_uc_fw {
>> (uc)->fw.file_selected.minor_ver, \
>> (uc)->fw.file_selected.patch_ver))
>>   +/*
>> + * When we load the uC binaries, we pin them in a reserved section 
>> at the top of
>> + * the GGTT, which is ~18 MBs. On multi-GT systems where the GTs 
>> share the GGTT,
> ^^^ meaning only systems with a render GT + media GT as opposed to 
> regular multi-GT systems? Would be good to make that explicit either 
> here or above (or both).

I'll add a comment above where we reference the media gt.

Daniele

>
> John.
>
>> + * we also need to make sure that each binary is pinned to a unique 
>> location
>> + * during load, because the different GT can go through the FW load 
>> at the same
>> + * time. Given that the available space is much greater than what is 
>> required by
>> + * the binaries, to keep things simple instead of dynamically 
>> partitioning the
>> + * reserved section to make space for all the blobs we can just 
>> reserve a static
>> + * chunk for each binary.
>> + */
>> +#define INTEL_UC_RSVD_GGTT_PER_FW SZ_2M
>> +
>>   #ifdef CONFIG_DRM_I915_DEBUG_GUC
>>   void intel_uc_fw_change_status(struct intel_uc_fw *uc_fw,
>>                      enum intel_uc_fw_status status);
>

