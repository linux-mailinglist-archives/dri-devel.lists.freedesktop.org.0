Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8B175A3043
	for <lists+dri-devel@lfdr.de>; Fri, 26 Aug 2022 22:01:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A553B10E2C0;
	Fri, 26 Aug 2022 20:00:59 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BE3F10E2B9;
 Fri, 26 Aug 2022 20:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661544053; x=1693080053;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=9tg1V4YuKOS6PpHRV1HrrU4/5vIPVwv9VmKXhNsl11M=;
 b=D2lJYk84v7gHQ5kGxeWdkWyFSzzPeRx8n7hHaGK0HD0rToTBAxi8tEUH
 +oDYbexuStf8UKHVMU25GdJPP/2moncnIKzv2Bxnn9oZQcOGwR+PxkUGO
 3cRtUc7ZXfgs4SFEEOfBTpe2hFrGzvvpd6SS3yW5CRUd1z1QNLWhEe264
 bk0U3WSrn9zy+UDOvuoeAv2mWrG0OCFbACPxZEgMLAXnSNc3u8/0TNUdz
 Pc8a+iz+6jqV4fRJXZggo04fTHj49gpfKzOeo0FawGeAwXtW4//xkqH4b
 STyd7PUZiISaOryeBzqtE6AaajwZODuUtRYoTHlS+/t2p++VlgjhHPjXd A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10451"; a="274988118"
X-IronPort-AV: E=Sophos;i="5.93,266,1654585200"; d="scan'208";a="274988118"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2022 13:00:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,266,1654585200"; d="scan'208";a="938871219"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga005.fm.intel.com with ESMTP; 26 Aug 2022 13:00:52 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 26 Aug 2022 13:00:51 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 26 Aug 2022 13:00:51 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Fri, 26 Aug 2022 13:00:51 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Fri, 26 Aug 2022 13:00:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B0D/mXUYkLhLPqtPRSza9JKbJCPhhUu6HvOLejk1t6g7Lm1fw3/A8/Pj/baWF5gPSvY+xhyG6/D56R1PfZYqBHY9pqWOM1LWEhiPzhS+qyT2b/Z1zedTK4BNh3WmfeTVjH9XBbljX311hCvNDBpkjunJZMEG2f4iydyje47Rpj4ETiqvtfFBhfeG5qqBBo/yfjFCwi7PEMAr4Dzc9trmak19E+wTyg6p72Kdv8BfkqV3Jys74M8nNVODOW/KQykZG+oTDTRuK00Lhn1XBeF4BNsempeXa5XyxhlhWHdpbskf4s1Mo+HPCBBEVodjiR/G7BUSoM5aMnGeKMd8OyyDIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qQG9ElIJmbt1gQztJsDEbzTW8dqiSw1w2/xr5W75vyQ=;
 b=D0bpksP4RpHxkee6Rc72fWXSCvwpEAKsdISMStE5adGn2XkrRatBbmyIyi3Bs7jYUxfp81qxqsIKZcmeZ1tL9Pj2f6rg4qp0sqoq+nFsHy+8KsU6gx3kytF52O580YLeawYwma32ieR1VSvMSU6yPJYdf798u+QPqPomzv7vmBt9q1SA/6287E3NBkuAYEj58nvZnGUJbt4niIFYFqJzg/V1OTxmAbyXZ1vLJEKW6PDF0UUlzJKnShe7kLBBsW7g3LMEyVZUI2ecJE6iXKBVJY1neqc6xKsYm6xjTR7YkL/h7oPVnTuyfl8oxLFwqZ1IPriIPuU5qHWdKfewpb2P8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 DM6PR11MB4220.namprd11.prod.outlook.com (2603:10b6:5:204::26) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5546.22; Fri, 26 Aug 2022 20:00:48 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::1977:59e7:5a28:24e1]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::1977:59e7:5a28:24e1%8]) with mapi id 15.20.5566.016; Fri, 26 Aug 2022
 20:00:48 +0000
Message-ID: <f2103d69-ce9f-43bc-fc86-1a4446b2cb80@intel.com>
Date: Fri, 26 Aug 2022 13:00:45 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2 1/3] drm/i915/uc: Support for version reduced and
 multiple firmware files
Content-Language: en-US
To: John Harrison <john.c.harrison@intel.com>,
 <Intel-GFX@Lists.FreeDesktop.Org>
References: <20220826030553.2611574-1-John.C.Harrison@Intel.com>
 <20220826030553.2611574-2-John.C.Harrison@Intel.com>
 <c889aa4a-0fef-6f24-d1b8-73a581f62afe@intel.com>
 <c129712e-694a-302e-dd04-d1e69cf2cf81@intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <c129712e-694a-302e-dd04-d1e69cf2cf81@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR07CA0077.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::18) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1a98e550-0a02-4fa8-db70-08da879dab18
X-MS-TrafficTypeDiagnostic: DM6PR11MB4220:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zkwbGyhlfFeSwjxukNJobe445ZqJXdYTSR5fwyhuLqj84agBZX07AlCXWxpncNRJgGC6ai5Q2RkV7ZBd5FUc9C7ZNEsfTy6gRxSviVA40hDqnWtK6/Osa7GPnl06mGGpwKdvRdcEtNkDglv3l8LXbxcvypNWct3XZFDIxEy6OWokqKSrrduzwa0Fe7rNBvI2e6uH+/cA+Tzgum/tVOIyV4Cx9r9NoIBaIXV2YLn/gw5L7qhZY4d0R1mlgVMovtukwnB0P6EmyZPwsX9dRZgB0ru5q27+ycMAdb+Kjs39+asf9k1xcVENNQICKHX6WQ4D+dO1kPlPmqi9vVgalgVJbeS80DhIa4vLcmWUya/sa2LHPIemalWoLZhwdB5DhW3v/O0epuxOdnt2Ai2LoeSkC6Vh1MR2mLOyYxcXue4Vwi4j/rtF2o0nV5pp+nOLZ9L7McHoMGsKzfIk7AbHtGfQHXinuE4kfyZI49cDzWaamPHVWK6PDIOnOTQ2+9Qcwg3jUiXNbaaSpJZ+vWkzik03Kw2Tz7JVcxxGmHR5GIyZrSN9/dULEoDFqZ1qUwFhWGqBg5D+BxDOpydskJZTtJDpRCTSjAkn1IYxNQb/BZ+nYGOJxpKP5hpF4i2RwrwL0sHSVjoygxwOGCTExK0CC9n5kRS/ETYiiOjRr5skb1gXwjt6AZZmfzwNKkXxF86mkdHwRz60khu61AZx8UedXT8FK4/MXABkTOos4GEoujPEDFmkj8yCVoERXWxotjrrt0O/xClBktO7TZrVjkBrOMPw1UaLGhQ1TeH3dLvcQR8kyhg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(346002)(376002)(136003)(396003)(366004)(39860400002)(30864003)(26005)(5660300002)(6506007)(2906002)(53546011)(2616005)(31696002)(8936002)(6666004)(450100002)(6512007)(83380400001)(86362001)(186003)(38100700002)(478600001)(4326008)(66556008)(8676002)(82960400001)(66476007)(36756003)(41300700001)(6486002)(66946007)(31686004)(316002)(45980500001)(43740500002)(579004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y3Bwa2RqeDlnUUY2RllJcTZRa1VVUXM0dkdmVnZCV1hZTXh1NjhwdzJJWHll?=
 =?utf-8?B?ajFYVHR1Um9uQmZNVSs2N05SMzJGbnFyZDMrTy9BU2ZLY2J1U2tpN1B1dmxy?=
 =?utf-8?B?VERHa2kvVHZFWTJBeFN0NithTEJ6MXpRNGJoR3p1cjlQdlFHYVd2UWQ2QlhW?=
 =?utf-8?B?WG1XblQ0WGx5SHI3aVRQUFZtc2YvUUs1YTB2UUNsZXk5clpYVnhxYWJXSDNu?=
 =?utf-8?B?eDMrdUx3ME1LK2o0TXU3QkNRZXRhdzYzeHNaVkJPM1UxU21WMHVuNlZxYXRt?=
 =?utf-8?B?Y0orek5JOW5xYVVQU0dLbm9jTFNTNi9CV1htaWtIcVF1Q241N251cTkyaUxz?=
 =?utf-8?B?c3BzOExsN2ZXUmJhcnBSY0Uzbk1WWHVGQ2dDUmd1L1M2dUdpMDlGRFZKVW9y?=
 =?utf-8?B?WXVMc05zYndjZSthR21xQzU5N1hxZzdpd3NDSmJhTnM5Z1dUVlUrdjRZQzk1?=
 =?utf-8?B?eXZHQ3lsZi94N293UlRmQmpZazBRSitxUDduY2dDdm0ra0dkZzVKS0NmNHdJ?=
 =?utf-8?B?dkRrR1BFMTBKd2R3UFZ1U3ZKaWtVQ0s3Tng5cVdQSUJVV0U0bXZ3VmQ4OFYv?=
 =?utf-8?B?NjBHWEowVHNNSFVrd096VVlocVViN2JhaGU1eklpcnV5ZjFRVTA0N09zdzR3?=
 =?utf-8?B?V2g3UEZBTE8vWW9rcWM3NHgrYW8xVlhlZmY3eGVjWmhOQ0JOVWVQZk5RQlY5?=
 =?utf-8?B?b0ZTS000UUdzZU1pWkJpZjEydjlqQ3hFSzdZQkxINUF2VFNLNlVyUFFLS2l5?=
 =?utf-8?B?eG5tK1huRmZDMCtmak5hY2tjV0Z1ck1KZzZPVXdtdktlSHVqdzlsT0prNFk1?=
 =?utf-8?B?NENxbnJicXRrekY2UXFFTVpaaGhnQjdveFcvUHpzeWVjVW1ycVNVOURkcmI5?=
 =?utf-8?B?Skg1d2YyaVBZTTB0R2ROdXF5bWZhTlUxbXJwcE90OTZEbU5HOGJIL1VPQVpR?=
 =?utf-8?B?UG42dTBtbW9DeFVCejROTm16SisyQWJSbi85d1J6b0NBWk5zUmhIOXdSb1hx?=
 =?utf-8?B?VHc2b2pEYnY5QW9GcGRzVTFEc3B4UTVCdHdYQUUzTzkzZUc4MXR4V3BtNEFQ?=
 =?utf-8?B?elkwZ1ZVTVl1QW1HeVVlNy9XNW5uc2wxKzhSZlZ5dzNtNi9yQlNmVGFLbFZu?=
 =?utf-8?B?eWZrRnFCR0tiMkFkV1BYK3VMekZLWlN6bVlrTWp4SUErbWU3ZTFXMFV0QW1R?=
 =?utf-8?B?SXVWWmR5ZmttbUVzWEM3Z2d4bVpTVzZUUFZUdHc5dEp1SnhBL3RVVU9qLzYy?=
 =?utf-8?B?eGVIMmJaZTMxaVl1S0dqZDRtWU5iNmpjYUc3aHphTWdtRXZRbVJHL3Yyc1NF?=
 =?utf-8?B?ZEFTbExFSktRaDVJNnFVTmUycGd5WWc3ZTVoSUlOYjhRbWR6Umdkd2lJeHln?=
 =?utf-8?B?bHkzbnlKMkllVHVtTnB5dTFqSmJPQ2lid0dSZVBDYysvLzNlWjlOYUt6WlJs?=
 =?utf-8?B?L1pBR3JyR1BVQjFreS85dytFQ3ZqcnMxV0VpaXVmNU9HUUxuWTlFMHZxVFRH?=
 =?utf-8?B?V0NRQnY0V0IyWVU0b1BrREJ0VEJJNTRUT05JcHFvVDhCSGZJRmpsYk1EeWlZ?=
 =?utf-8?B?Y0Z4U2ZlVG1OcHVnZ2srOGRtcFNwb1BsMmdRRmdwd3Z3UFNab1hlRlNBeUp1?=
 =?utf-8?B?eUtYbmRUL3NQMFBDT0ZiTkhWd2ZhMHdUNGRJSDN2Y0Q5Sm5JUkcxcUp6MUx2?=
 =?utf-8?B?OFZwWDV5RlRNNit2YzNTdFpHM2RZVEJVSXB5TW1lTGJzRHI5MmJVaTlrTnAv?=
 =?utf-8?B?a2s1L0dBbFZXdGtVNGhsUFJhVU9uNWtxQVR5aHp0djZUYmJNSGlKUWt3dG5k?=
 =?utf-8?B?ajVKL1Qxc3FSWTIvRnNlQW03LzU3WHlQeHF3OVZtVkVidDlvSHE2anpoNVBL?=
 =?utf-8?B?c09vdmNVZzVDWnhWM1IzOXpHMXRJMnJNcmxLb2l4RURybWR3aHB3d3ZJalVC?=
 =?utf-8?B?blFMRU9KMlpxelpodktQTHZqSHZwL2ZlVEpYbHBGVTJleXRDK0RhTllOd1FH?=
 =?utf-8?B?N3NGbnROaUFCcmRIbi9XZjZXZkJpa1FlUUt2UXMzWGFnb0JjM1kxQXhwbDQ5?=
 =?utf-8?B?Rm54T2QveTd0ZnZjYWJwaFBWUWZOSnZjNUZnRWZ3Nk1xMC9iMHd6b1JHR1hG?=
 =?utf-8?B?Nll4czVnZ1BDbUVrN0M5Ni9Yc0IrVGZOZ0JFV1AvSXNadHFzTVd6cjU3MU1P?=
 =?utf-8?Q?iLrtKQ5D5A+toyjjt8jI9PI=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a98e550-0a02-4fa8-db70-08da879dab18
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2022 20:00:47.9478 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0JqkIzHgwvBuRhzZ8aSFEF1rxzLt2ExaoHqUEZMHCbcR5HONXXMCNarLRSmXcy7fWhqWMpV7Oa/8b5E9hhw7sxFT133oMC7FczU2uw/oU68=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4220
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
Cc: DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 8/26/2022 9:40 AM, John Harrison wrote:
> On 8/26/2022 09:35, Ceraolo Spurio, Daniele wrote:
>> On 8/25/2022 8:05 PM, John.C.Harrison@Intel.com wrote:
>>> From: John Harrison <John.C.Harrison@Intel.com>
>>>
>>> There was a misunderstanding in how firmware file compatibility should
>>> be managed within i915. This has been clarified as:
>>>    i915 must support all existing firmware releases forever
>>>    new minor firmware releases should replace prior versions
>>>    only backwards compatibility breaking releases should be a new file
>>>
>>> This patch cleans up the single fallback file support that was added
>>> as a quick fix emergency effort. That is now removed in preference to
>>> supporting arbitrary numbers of firmware files per platform.
>>>
>>> The patch also adds support for having GuC firmware files that are
>>> named by major version only (because the major version indicates
>>> backwards breaking changes that affect the KMD) and for having HuC
>>> firmware files with no version number at all (because the KMD has no
>>> interface requirements with the HuC).
>>>
>>> For GuC, the driver will report via dmesg if the found file is older 
>>> than
>>> expected. For HuC, the KMD will no longer require updating for any new
>>> HuC release so will not be able to report what the latest expected
>>> version is.
>>>
>>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>>> ---
>>>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c |  10 +-
>>>   drivers/gpu/drm/i915/gt/uc/intel_uc.c         |   4 +-
>>>   drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c      | 442 
>>> ++++++++++++------
>>>   drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h      |  33 +-
>>>   drivers/gpu/drm/i915/i915_gpu_error.c         |  16 +-
>>>   5 files changed, 319 insertions(+), 186 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c 
>>> b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>> index 0d56b615bf78e..04393932623c7 100644
>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>> @@ -1868,7 +1868,7 @@ int intel_guc_submission_init(struct intel_guc 
>>> *guc)
>>>       if (guc->submission_initialized)
>>>           return 0;
>>>   -    if (guc->fw.major_ver_found < 70) {
>>> +    if (guc->fw.file_selected.major_ver < 70) {
>>>           ret = guc_lrc_desc_pool_create_v69(guc);
>>>           if (ret)
>>>               return ret;
>>> @@ -2303,7 +2303,7 @@ static int register_context(struct 
>>> intel_context *ce, bool loop)
>>>       GEM_BUG_ON(intel_context_is_child(ce));
>>>       trace_intel_context_register(ce);
>>>   -    if (guc->fw.major_ver_found >= 70)
>>> +    if (guc->fw.file_selected.major_ver >= 70)
>>>           ret = register_context_v70(guc, ce, loop);
>>>       else
>>>           ret = register_context_v69(guc, ce, loop);
>>> @@ -2315,7 +2315,7 @@ static int register_context(struct 
>>> intel_context *ce, bool loop)
>>>           set_context_registered(ce);
>>>           spin_unlock_irqrestore(&ce->guc_state.lock, flags);
>>>   -        if (guc->fw.major_ver_found >= 70)
>>> +        if (guc->fw.file_selected.major_ver >= 70)
>>>               guc_context_policy_init_v70(ce, loop);
>>>       }
>>>   @@ -2921,7 +2921,7 @@ static void 
>>> __guc_context_set_preemption_timeout(struct intel_guc *guc,
>>>                            u16 guc_id,
>>>                            u32 preemption_timeout)
>>>   {
>>> -    if (guc->fw.major_ver_found >= 70) {
>>> +    if (guc->fw.file_selected.major_ver >= 70) {
>>>           struct context_policy policy;
>>>             __guc_context_policy_start_klv(&policy, guc_id);
>>> @@ -3186,7 +3186,7 @@ static int guc_context_alloc(struct 
>>> intel_context *ce)
>>>   static void __guc_context_set_prio(struct intel_guc *guc,
>>>                      struct intel_context *ce)
>>>   {
>>> -    if (guc->fw.major_ver_found >= 70) {
>>> +    if (guc->fw.file_selected.major_ver >= 70) {
>>>           struct context_policy policy;
>>>             __guc_context_policy_start_klv(&policy, ce->guc_id.id);
>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.c 
>>> b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
>>> index f2e7c82985efd..d965ac4832d60 100644
>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc.c
>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
>>> @@ -436,8 +436,8 @@ static void print_fw_ver(struct intel_uc *uc, 
>>> struct intel_uc_fw *fw)
>>>       struct drm_i915_private *i915 = uc_to_gt(uc)->i915;
>>>         drm_info(&i915->drm, "%s firmware %s version %u.%u\n",
>>> -         intel_uc_fw_type_repr(fw->type), fw->path,
>>> -         fw->major_ver_found, fw->minor_ver_found);
>>> +         intel_uc_fw_type_repr(fw->type), fw->file_selected.path,
>>> +         fw->file_selected.major_ver, fw->file_selected.minor_ver);
>>>   }
>>>     static int __uc_init_hw(struct intel_uc *uc)
>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c 
>>> b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
>>> index 58547292efa0a..94cf2d4a46e6f 100644
>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
>>> @@ -41,7 +41,7 @@ void intel_uc_fw_change_status(struct intel_uc_fw 
>>> *uc_fw,
>>>           "%s firmware -> %s\n",
>>>           intel_uc_fw_type_repr(uc_fw->type),
>>>           status == INTEL_UC_FIRMWARE_SELECTED ?
>>> -        uc_fw->path : intel_uc_fw_status_repr(status));
>>> +        uc_fw->file_selected.path : intel_uc_fw_status_repr(status));
>>>   }
>>>   #endif
>>>   @@ -51,84 +51,149 @@ void intel_uc_fw_change_status(struct 
>>> intel_uc_fw *uc_fw,
>>>    *
>>>    * Note that RKL and ADL-S have the same GuC/HuC device ID's and 
>>> use the same
>>>    * firmware as TGL.
>>> + *
>>> + * Version numbers:
>>> + * Originally, the driver required an exact match major/minor/patch 
>>> furmware
>>> + * file and only supported that one version for any given platform. 
>>> However,
>>> + * the new direction from upstream is to be becakwards compatible 
>>> with all
>>
>> typo becakwards
>>
>>> + * prior releases and to be as flexible as possible as to what 
>>> firmware is
>>> + * loaded.
>>> + *
>>> + * For GuC, the major version number signifies a backwards breaking 
>>> API change.
>>> + * So, new format GuC firmware files are labelled by their major 
>>> version only.
>>> + * For HuC, there is no KMD interaction, hence no version matching 
>>> requirement.
>>> + * So, new format HuC firmware files have no version number at all.
>>> + *
>>> + * All of which means that the table below must keep all old format 
>>> files with
>>> + * full three point version number. But newer files have reduced 
>>> requirements.
>>> + * Having said that, the driver still needs to track the minor 
>>> version number
>>> + * for GuC at least. As it is useful to report to the user that 
>>> they are not
>>> + * running with a recent enough version for all KMD supported 
>>> features,
>>> + * security fixes, etc. to be enabled.
>>>    */
>>> -#define INTEL_GUC_FIRMWARE_DEFS(fw_def, guc_def) \
>>> -    fw_def(DG2,          0, guc_def(dg2,  70, 4, 1)) \
>>> -    fw_def(ALDERLAKE_P,  0, guc_def(adlp, 70, 1, 1)) \
>>> -    fw_def(ALDERLAKE_S,  0, guc_def(tgl,  70, 1, 1)) \
>>> -    fw_def(DG1,          0, guc_def(dg1,  70, 1, 1)) \
>>> -    fw_def(ROCKETLAKE,   0, guc_def(tgl,  70, 1, 1)) \
>>> -    fw_def(TIGERLAKE,    0, guc_def(tgl,  70, 1, 1)) \
>>> -    fw_def(JASPERLAKE,   0, guc_def(ehl,  70, 1, 1)) \
>>> -    fw_def(ELKHARTLAKE,  0, guc_def(ehl,  70, 1, 1)) \
>>> -    fw_def(ICELAKE,      0, guc_def(icl,  70, 1, 1)) \
>>> -    fw_def(COMETLAKE,    5, guc_def(cml,  70, 1, 1)) \
>>> -    fw_def(COMETLAKE,    0, guc_def(kbl,  70, 1, 1)) \
>>> -    fw_def(COFFEELAKE,   0, guc_def(kbl,  70, 1, 1)) \
>>> -    fw_def(GEMINILAKE,   0, guc_def(glk,  70, 1, 1)) \
>>> -    fw_def(KABYLAKE,     0, guc_def(kbl,  70, 1, 1)) \
>>> -    fw_def(BROXTON,      0, guc_def(bxt,  70, 1, 1)) \
>>> -    fw_def(SKYLAKE,      0, guc_def(skl,  70, 1, 1))
>>> -
>>> -#define INTEL_GUC_FIRMWARE_DEFS_FALLBACK(fw_def, guc_def) \
>>> -    fw_def(ALDERLAKE_P,  0, guc_def(adlp, 69, 0, 3)) \
>>> -    fw_def(ALDERLAKE_S,  0, guc_def(tgl,  69, 0, 3))
>>> -
>>> -#define INTEL_HUC_FIRMWARE_DEFS(fw_def, huc_def) \
>>> -    fw_def(ALDERLAKE_P,  0, huc_def(tgl,  7, 9, 3)) \
>>> -    fw_def(ALDERLAKE_S,  0, huc_def(tgl,  7, 9, 3)) \
>>> -    fw_def(DG1,          0, huc_def(dg1,  7, 9, 3)) \
>>> -    fw_def(ROCKETLAKE,   0, huc_def(tgl,  7, 9, 3)) \
>>> -    fw_def(TIGERLAKE,    0, huc_def(tgl,  7, 9, 3)) \
>>> -    fw_def(JASPERLAKE,   0, huc_def(ehl,  9, 0, 0)) \
>>> -    fw_def(ELKHARTLAKE,  0, huc_def(ehl,  9, 0, 0)) \
>>> -    fw_def(ICELAKE,      0, huc_def(icl,  9, 0, 0)) \
>>> -    fw_def(COMETLAKE,    5, huc_def(cml,  4, 0, 0)) \
>>> -    fw_def(COMETLAKE,    0, huc_def(kbl,  4, 0, 0)) \
>>> -    fw_def(COFFEELAKE,   0, huc_def(kbl,  4, 0, 0)) \
>>> -    fw_def(GEMINILAKE,   0, huc_def(glk,  4, 0, 0)) \
>>> -    fw_def(KABYLAKE,     0, huc_def(kbl,  4, 0, 0)) \
>>> -    fw_def(BROXTON,      0, huc_def(bxt,  2, 0, 0)) \
>>> -    fw_def(SKYLAKE,      0, huc_def(skl,  2, 0, 0))
>>> -
>>> -#define __MAKE_UC_FW_PATH(prefix_, name_, major_, minor_, patch_) \
>>> +#define INTEL_GUC_FIRMWARE_DEFS(fw_def, guc_maj, guc_mmp) \
>>> +    fw_def(DG2,          0, guc_mmp(dg2,  70, 4, 1)) \
>>> +    fw_def(ALDERLAKE_P,  0, guc_mmp(adlp, 70, 1, 1)) \
>>> +    fw_def(ALDERLAKE_P,  0, guc_mmp(adlp, 69, 0, 3)) \
>>> +    fw_def(ALDERLAKE_S,  0, guc_mmp(tgl,  70, 1, 1)) \
>>> +    fw_def(ALDERLAKE_S,  0, guc_mmp(tgl,  69, 0, 3)) \
>>> +    fw_def(DG1,          0, guc_mmp(dg1,  70, 1, 1)) \
>>> +    fw_def(ROCKETLAKE,   0, guc_mmp(tgl,  70, 1, 1)) \
>>> +    fw_def(TIGERLAKE,    0, guc_mmp(tgl,  70, 1, 1)) \
>>> +    fw_def(JASPERLAKE,   0, guc_mmp(ehl,  70, 1, 1)) \
>>> +    fw_def(ELKHARTLAKE,  0, guc_mmp(ehl,  70, 1, 1)) \
>>> +    fw_def(ICELAKE,      0, guc_mmp(icl,  70, 1, 1)) \
>>> +    fw_def(COMETLAKE,    5, guc_mmp(cml,  70, 1, 1)) \
>>> +    fw_def(COMETLAKE,    0, guc_mmp(kbl,  70, 1, 1)) \
>>> +    fw_def(COFFEELAKE,   0, guc_mmp(kbl,  70, 1, 1)) \
>>> +    fw_def(GEMINILAKE,   0, guc_mmp(glk,  70, 1, 1)) \
>>> +    fw_def(KABYLAKE,     0, guc_mmp(kbl,  70, 1, 1)) \
>>> +    fw_def(BROXTON,      0, guc_mmp(bxt,  70, 1, 1)) \
>>> +    fw_def(SKYLAKE,      0, guc_mmp(skl,  70, 1, 1))
>>> +
>>> +#define INTEL_HUC_FIRMWARE_DEFS(fw_def, huc_raw, huc_mmp) \
>>> +    fw_def(ALDERLAKE_P,  0, huc_mmp(tgl,  7, 9, 3)) \
>>> +    fw_def(ALDERLAKE_S,  0, huc_mmp(tgl,  7, 9, 3)) \
>>> +    fw_def(DG1,          0, huc_mmp(dg1,  7, 9, 3)) \
>>> +    fw_def(ROCKETLAKE,   0, huc_mmp(tgl,  7, 9, 3)) \
>>> +    fw_def(TIGERLAKE,    0, huc_mmp(tgl,  7, 9, 3)) \
>>> +    fw_def(JASPERLAKE,   0, huc_mmp(ehl,  9, 0, 0)) \
>>> +    fw_def(ELKHARTLAKE,  0, huc_mmp(ehl,  9, 0, 0)) \
>>> +    fw_def(ICELAKE,      0, huc_mmp(icl,  9, 0, 0)) \
>>> +    fw_def(COMETLAKE,    5, huc_mmp(cml,  4, 0, 0)) \
>>> +    fw_def(COMETLAKE,    0, huc_mmp(kbl,  4, 0, 0)) \
>>> +    fw_def(COFFEELAKE,   0, huc_mmp(kbl,  4, 0, 0)) \
>>> +    fw_def(GEMINILAKE,   0, huc_mmp(glk,  4, 0, 0)) \
>>> +    fw_def(KABYLAKE,     0, huc_mmp(kbl,  4, 0, 0)) \
>>> +    fw_def(BROXTON,      0, huc_mmp(bxt,  2, 0, 0)) \
>>> +    fw_def(SKYLAKE,      0, huc_mmp(skl,  2, 0, 0))
>>> +
>>> +/*
>>> + * Set of macros for producing a list of filenames from the above 
>>> table.
>>> + */
>>> +#define __MAKE_UC_FW_PATH_BLANK(prefix_, name_) \
>>> +    "i915/" \
>>> +    __stringify(prefix_) name_ ".bin"
>>> +
>>> +#define __MAKE_UC_FW_PATH_MAJOR(prefix_, name_, major_) \
>>> +    "i915/" \
>>> +    __stringify(prefix_) name_ \
>>> +    __stringify(major_) ".bin"
>>> +
>>> +#define __MAKE_UC_FW_PATH_MMP(prefix_, name_, major_, minor_, 
>>> patch_) \
>>>       "i915/" \
>>>       __stringify(prefix_) name_ \
>>>       __stringify(major_) "." \
>>>       __stringify(minor_) "." \
>>>       __stringify(patch_) ".bin"
>>>   -#define MAKE_GUC_FW_PATH(prefix_, major_, minor_, patch_) \
>>> -    __MAKE_UC_FW_PATH(prefix_, "_guc_", major_, minor_, patch_)
>>> +/* Minor for internal driver use, not part of file name */
>>> +#define MAKE_GUC_FW_PATH_MAJOR(prefix_, major_, minor_) \
>>> +    __MAKE_UC_FW_PATH_MAJOR(prefix_, "_guc_", major_)
>>>   -#define MAKE_HUC_FW_PATH(prefix_, major_, minor_, bld_num_) \
>>> -    __MAKE_UC_FW_PATH(prefix_, "_huc_", major_, minor_, bld_num_)
>>> +#define MAKE_GUC_FW_PATH_MMP(prefix_, major_, minor_, patch_) \
>>> +    __MAKE_UC_FW_PATH_MMP(prefix_, "_guc_", major_, minor_, patch_)
>>>   -/* All blobs need to be declared via MODULE_FIRMWARE() */
>>> +#define MAKE_HUC_FW_PATH_BLANK(prefix_) \
>>> +    __MAKE_UC_FW_PATH_BLANK(prefix_, "_huc")
>>> +
>>> +#define MAKE_HUC_FW_PATH_MMP(prefix_, major_, minor_, patch_) \
>>> +    __MAKE_UC_FW_PATH_MMP(prefix_, "_huc_", major_, minor_, patch_)
>>> +
>>> +/*
>>> + * All blobs need to be declared via MODULE_FIRMWARE().
>>> + * This first expansion of the table macros is solely to provide
>>> + * that declaration.
>>> + */
>>>   #define INTEL_UC_MODULE_FW(platform_, revid_, uc_) \
>>>       MODULE_FIRMWARE(uc_);
>>>   -INTEL_GUC_FIRMWARE_DEFS(INTEL_UC_MODULE_FW, MAKE_GUC_FW_PATH)
>>> -INTEL_GUC_FIRMWARE_DEFS_FALLBACK(INTEL_UC_MODULE_FW, MAKE_GUC_FW_PATH)
>>> -INTEL_HUC_FIRMWARE_DEFS(INTEL_UC_MODULE_FW, MAKE_HUC_FW_PATH)
>>> +INTEL_GUC_FIRMWARE_DEFS(INTEL_UC_MODULE_FW, MAKE_GUC_FW_PATH_MAJOR, 
>>> MAKE_GUC_FW_PATH_MMP)
>>> +INTEL_HUC_FIRMWARE_DEFS(INTEL_UC_MODULE_FW, MAKE_HUC_FW_PATH_BLANK, 
>>> MAKE_HUC_FW_PATH_MMP)
>>>   -/* The below structs and macros are used to iterate across the 
>>> list of blobs */
>>> +/*
>>> + * The next expansion of the table macros (in __uc_fw_auto_select 
>>> below) provides
>>> + * actual data structures with both the filename and the version 
>>> information.
>>> + * These structure arrays are then iterated over to the list of 
>>> suitable files
>>> + * for the current platform and to then attempt to load those 
>>> files, in the order
>>> + * listed, until one is successfully found.
>>> + */
>>>   struct __packed uc_fw_blob {
>>> +    const char *path;
>>> +    bool legacy;
>>>       u8 major;
>>>       u8 minor;
>>> -    const char *path;
>>> +    u8 patch;
>>>   };
>>>   -#define UC_FW_BLOB(major_, minor_, path_) \
>>> -    { .major = major_, .minor = minor_, .path = path_ }
>>> +#define UC_FW_BLOB_BASE(major_, minor_, patch_, path_) \
>>> +    .major = major_, \
>>> +    .minor = minor_, \
>>> +    .patch = patch_, \
>>> +    .path = path_,
>>> +
>>> +#define UC_FW_BLOB_NEW(major_, minor_, patch_, path_) \
>>> +    { UC_FW_BLOB_BASE(major_, minor_, patch_, path_) \
>>> +      .legacy = false }
>>> +
>>> +#define UC_FW_BLOB_OLD(major_, minor_, patch_, path_) \
>>> +    { UC_FW_BLOB_BASE(major_, minor_, patch_, path_) \
>>> +      .legacy = true }
>>>   -#define GUC_FW_BLOB(prefix_, major_, minor_, patch_) \
>>> -    UC_FW_BLOB(major_, minor_, \
>>> -           MAKE_GUC_FW_PATH(prefix_, major_, minor_, patch_))
>>> +#define GUC_FW_BLOB(prefix_, major_, minor_) \
>>> +    UC_FW_BLOB_NEW(major_, minor_, 0, \
>>> +               MAKE_GUC_FW_PATH_MAJOR(prefix_, major_, minor_))
>>>   -#define HUC_FW_BLOB(prefix_, major_, minor_, bld_num_) \
>>> -    UC_FW_BLOB(major_, minor_, \
>>> -           MAKE_HUC_FW_PATH(prefix_, major_, minor_, bld_num_))
>>> +#define GUC_FW_BLOB_MMP(prefix_, major_, minor_, patch_) \
>>> +    UC_FW_BLOB_OLD(major_, minor_, patch_, \
>>> +               MAKE_GUC_FW_PATH_MMP(prefix_, major_, minor_, patch_))
>>> +
>>> +#define HUC_FW_BLOB(prefix_) \
>>> +    UC_FW_BLOB_NEW(0, 0, 0, MAKE_HUC_FW_PATH_BLANK(prefix_))
>>> +
>>> +#define HUC_FW_BLOB_MMP(prefix_, major_, minor_, patch_) \
>>> +    UC_FW_BLOB_OLD(major_, minor_, patch_, \
>>> +               MAKE_HUC_FW_PATH_MMP(prefix_, major_, minor_, patch_))
>>>     struct __packed uc_fw_platform_requirement {
>>>       enum intel_platform p;
>>> @@ -152,18 +217,16 @@ static void
>>>   __uc_fw_auto_select(struct drm_i915_private *i915, struct 
>>> intel_uc_fw *uc_fw)
>>>   {
>>>       static const struct uc_fw_platform_requirement blobs_guc[] = {
>>> -        INTEL_GUC_FIRMWARE_DEFS(MAKE_FW_LIST, GUC_FW_BLOB)
>>> -    };
>>> -    static const struct uc_fw_platform_requirement 
>>> blobs_guc_fallback[] = {
>>> -        INTEL_GUC_FIRMWARE_DEFS_FALLBACK(MAKE_FW_LIST, GUC_FW_BLOB)
>>> +        INTEL_GUC_FIRMWARE_DEFS(MAKE_FW_LIST, GUC_FW_BLOB, 
>>> GUC_FW_BLOB_MMP)
>>>       };
>>>       static const struct uc_fw_platform_requirement blobs_huc[] = {
>>> -        INTEL_HUC_FIRMWARE_DEFS(MAKE_FW_LIST, HUC_FW_BLOB)
>>> +        INTEL_HUC_FIRMWARE_DEFS(MAKE_FW_LIST, HUC_FW_BLOB, 
>>> HUC_FW_BLOB_MMP)
>>>       };
>>>       static const struct fw_blobs_by_type 
>>> blobs_all[INTEL_UC_FW_NUM_TYPES] = {
>>>           [INTEL_UC_FW_TYPE_GUC] = { blobs_guc, 
>>> ARRAY_SIZE(blobs_guc) },
>>>           [INTEL_UC_FW_TYPE_HUC] = { blobs_huc, 
>>> ARRAY_SIZE(blobs_huc) },
>>>       };
>>> +    static bool verified;
>>
>> is this static to only run the test once per boot?
> Yes.
>
> No point in doing the same test per firmware blob attempt per GT per 
> device when the list itself is static and immutable.
>
>>
>>>       const struct uc_fw_platform_requirement *fw_blobs;
>>>       enum intel_platform p = INTEL_INFO(i915)->platform;
>>>       u32 fw_count;
>>> @@ -184,49 +247,94 @@ __uc_fw_auto_select(struct drm_i915_private 
>>> *i915, struct intel_uc_fw *uc_fw)
>>>       fw_count = blobs_all[uc_fw->type].count;
>>>         for (i = 0; i < fw_count && p <= fw_blobs[i].p; i++) {
>>> -        if (p == fw_blobs[i].p && rev >= fw_blobs[i].rev) {
>>> -            const struct uc_fw_blob *blob = &fw_blobs[i].blob;
>>> -            uc_fw->path = blob->path;
>>> -            uc_fw->wanted_path = blob->path;
>>> -            uc_fw->major_ver_wanted = blob->major;
>>> -            uc_fw->minor_ver_wanted = blob->minor;
>>> -            break;
>>> -        }
>>> -    }
>>> +        const struct uc_fw_blob *blob = &fw_blobs[i].blob;
>>>   -    if (uc_fw->type == INTEL_UC_FW_TYPE_GUC) {
>>> -        const struct uc_fw_platform_requirement *blobs = 
>>> blobs_guc_fallback;
>>> -        u32 count = ARRAY_SIZE(blobs_guc_fallback);
>>> +        if (p != fw_blobs[i].p)
>>> +            continue;
>>>   -        for (i = 0; i < count && p <= blobs[i].p; i++) {
>>> -            if (p == blobs[i].p && rev >= blobs[i].rev) {
>>> -                const struct uc_fw_blob *blob = &blobs[i].blob;
>>> +        if (rev < fw_blobs[i].rev)
>>> +            continue;
>>>   -                uc_fw->fallback.path = blob->path;
>>> -                uc_fw->fallback.major_ver = blob->major;
>>> -                uc_fw->fallback.minor_ver = blob->minor;
>>> -                break;
>>> -            }
>>> +        if (uc_fw->file_selected.path) {
>>> +            if (uc_fw->file_selected.path == blob->path)
>>> +                uc_fw->file_selected.path = NULL;
>>> +
>>> +            continue;
>>>           }
>>
>> Does this work with 3 versions for the same platform if the 2 newer 
>> ones are not available? let's say we have v1, v2 and v3. v3 (newer) 
>> gets selected first but not found, so we call back in this function 
>> again and match v3 in the path check, clear the selected and 
>> continue, selecting v2 in the next round. if v2 is also not found, we 
>> call back in here starting from v3, which will not match the path 
>> check, so we'll continue below and assign it. Or am I missing something?
> The second round will call back in with v2 as 'selected' not v3. So it 
> will skip over v3, match on v2 and return v1.

My bad, I had read this as if the "continue" was in the inner if and not 
the outer one, hence my confusion. It's ok like this. I do think we 
might want still want to add a test or something to check that fallbacks 
with more than one version work, but we can do that as a follow up as 
such case doesn't currently exist.

with that typo fixed:
Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

>
> John.
>
>>
>> everything else looks ok.
>>
>> Daniele
>>
>>> +
>>> +        uc_fw->file_selected.path = blob->path;
>>> +        uc_fw->file_wanted.path = blob->path;
>>> +        uc_fw->file_wanted.major_ver = blob->major;
>>> +        uc_fw->file_wanted.minor_ver = blob->minor;
>>> +        break;
>>>       }
>>>         /* make sure the list is ordered as expected */
>>> -    if (IS_ENABLED(CONFIG_DRM_I915_SELFTEST)) {
>>> +    if (IS_ENABLED(CONFIG_DRM_I915_SELFTEST) && !verified) {
>>> +        verified = true;
>>> +
>>>           for (i = 1; i < fw_count; i++) {
>>> +            /* Next platform is good: */
>>>               if (fw_blobs[i].p < fw_blobs[i - 1].p)
>>>                   continue;
>>>   +            /* Next platform revision is good: */
>>>               if (fw_blobs[i].p == fw_blobs[i - 1].p &&
>>>                   fw_blobs[i].rev < fw_blobs[i - 1].rev)
>>>                   continue;
>>>   -            drm_err(&i915->drm, "Invalid FW blob order: %s r%u 
>>> comes before %s r%u\n",
>>> -                intel_platform_name(fw_blobs[i - 1].p),
>>> -                fw_blobs[i - 1].rev,
>>> -                intel_platform_name(fw_blobs[i].p),
>>> -                fw_blobs[i].rev);
>>> +            /* Platform/revision must be in order: */
>>> +            if (fw_blobs[i].p != fw_blobs[i - 1].p ||
>>> +                fw_blobs[i].rev != fw_blobs[i - 1].rev)
>>> +                goto bad;
>>> +
>>> +            /* Next major version is good: */
>>> +            if (fw_blobs[i].blob.major < fw_blobs[i - 1].blob.major)
>>> +                continue;
>>> +
>>> +            /* New must be before legacy: */
>>> +            if (!fw_blobs[i].blob.legacy && fw_blobs[i - 
>>> 1].blob.legacy)
>>> +                goto bad;
>>> +
>>> +            /* New to legacy also means 0.0 to X.Y (HuC), or X.0 to 
>>> X.Y (GuC) */
>>> +            if (fw_blobs[i].blob.legacy && !fw_blobs[i - 
>>> 1].blob.legacy) {
>>> +                if (!fw_blobs[i - 1].blob.major)
>>> +                    continue;
>>> +
>>> +                if (fw_blobs[i].blob.major == fw_blobs[i - 
>>> 1].blob.major)
>>> +                    continue;
>>> +            }
>>> +
>>> +            /* Major versions must be in order: */
>>> +            if (fw_blobs[i].blob.major != fw_blobs[i - 1].blob.major)
>>> +                goto bad;
>>> +
>>> +            /* Next minor version is good: */
>>> +            if (fw_blobs[i].blob.minor < fw_blobs[i - 1].blob.minor)
>>> +                continue;
>>>   -            uc_fw->path = NULL;
>>> +            /* Minor versions must be in order: */
>>> +            if (fw_blobs[i].blob.minor != fw_blobs[i - 1].blob.minor)
>>> +                goto bad;
>>> +
>>> +            /* Patch versions must be in order: */
>>> +            if (fw_blobs[i].blob.patch <= fw_blobs[i - 1].blob.patch)
>>> +                continue;
>>> +
>>> +bad:
>>> +            drm_err(&i915->drm, "\x1B[35;1mInvalid FW blob order: 
>>> %s r%u %s%d.%d.%d comes before %s r%u %s%d.%d.%d\n",
>>> +                intel_platform_name(fw_blobs[i - 1].p), fw_blobs[i 
>>> - 1].rev,
>>> +                fw_blobs[i - 1].blob.legacy ? "L" : "v",
>>> +                fw_blobs[i - 1].blob.major,
>>> +                fw_blobs[i - 1].blob.minor,
>>> +                fw_blobs[i - 1].blob.patch,
>>> +                intel_platform_name(fw_blobs[i].p), fw_blobs[i].rev,
>>> +                fw_blobs[i].blob.legacy ? "L" : "v",
>>> +                fw_blobs[i].blob.major,
>>> +                fw_blobs[i].blob.minor,
>>> +                fw_blobs[i].blob.patch);
>>> +
>>> +            uc_fw->file_selected.path = NULL;
>>>           }
>>>       }
>>>   }
>>> @@ -259,7 +367,7 @@ static void __uc_fw_user_override(struct 
>>> drm_i915_private *i915, struct intel_uc
>>>       }
>>>         if (unlikely(path)) {
>>> -        uc_fw->path = path;
>>> +        uc_fw->file_selected.path = path;
>>>           uc_fw->user_overridden = true;
>>>       }
>>>   }
>>> @@ -283,7 +391,7 @@ void intel_uc_fw_init_early(struct intel_uc_fw 
>>> *uc_fw,
>>>        */
>>>       BUILD_BUG_ON(INTEL_UC_FIRMWARE_UNINITIALIZED);
>>>       GEM_BUG_ON(uc_fw->status);
>>> -    GEM_BUG_ON(uc_fw->path);
>>> +    GEM_BUG_ON(uc_fw->file_selected.path);
>>>         uc_fw->type = type;
>>>   @@ -292,7 +400,7 @@ void intel_uc_fw_init_early(struct intel_uc_fw 
>>> *uc_fw,
>>>           __uc_fw_user_override(i915, uc_fw);
>>>       }
>>>   -    intel_uc_fw_change_status(uc_fw, uc_fw->path ? *uc_fw->path ?
>>> +    intel_uc_fw_change_status(uc_fw, uc_fw->file_selected.path ? 
>>> *uc_fw->file_selected.path ?
>>>                     INTEL_UC_FIRMWARE_SELECTED :
>>>                     INTEL_UC_FIRMWARE_DISABLED :
>>>                     INTEL_UC_FIRMWARE_NOT_SUPPORTED);
>>> @@ -305,32 +413,32 @@ static void __force_fw_fetch_failures(struct 
>>> intel_uc_fw *uc_fw, int e)
>>>         if (i915_inject_probe_error(i915, e)) {
>>>           /* non-existing blob */
>>> -        uc_fw->path = "<invalid>";
>>> +        uc_fw->file_selected.path = "<invalid>";
>>>           uc_fw->user_overridden = user;
>>>       } else if (i915_inject_probe_error(i915, e)) {
>>>           /* require next major version */
>>> -        uc_fw->major_ver_wanted += 1;
>>> -        uc_fw->minor_ver_wanted = 0;
>>> +        uc_fw->file_wanted.major_ver += 1;
>>> +        uc_fw->file_wanted.minor_ver = 0;
>>>           uc_fw->user_overridden = user;
>>>       } else if (i915_inject_probe_error(i915, e)) {
>>>           /* require next minor version */
>>> -        uc_fw->minor_ver_wanted += 1;
>>> +        uc_fw->file_wanted.minor_ver += 1;
>>>           uc_fw->user_overridden = user;
>>> -    } else if (uc_fw->major_ver_wanted &&
>>> +    } else if (uc_fw->file_wanted.major_ver &&
>>>              i915_inject_probe_error(i915, e)) {
>>>           /* require prev major version */
>>> -        uc_fw->major_ver_wanted -= 1;
>>> -        uc_fw->minor_ver_wanted = 0;
>>> +        uc_fw->file_wanted.major_ver -= 1;
>>> +        uc_fw->file_wanted.minor_ver = 0;
>>>           uc_fw->user_overridden = user;
>>> -    } else if (uc_fw->minor_ver_wanted &&
>>> +    } else if (uc_fw->file_wanted.minor_ver &&
>>>              i915_inject_probe_error(i915, e)) {
>>>           /* require prev minor version - hey, this should work! */
>>> -        uc_fw->minor_ver_wanted -= 1;
>>> +        uc_fw->file_wanted.minor_ver -= 1;
>>>           uc_fw->user_overridden = user;
>>>       } else if (user && i915_inject_probe_error(i915, e)) {
>>>           /* officially unsupported platform */
>>> -        uc_fw->major_ver_wanted = 0;
>>> -        uc_fw->minor_ver_wanted = 0;
>>> +        uc_fw->file_wanted.major_ver = 0;
>>> +        uc_fw->file_wanted.minor_ver = 0;
>>>           uc_fw->user_overridden = true;
>>>       }
>>>   }
>>> @@ -341,8 +449,8 @@ static int check_gsc_manifest(const struct 
>>> firmware *fw,
>>>       u32 *dw = (u32 *)fw->data;
>>>       u32 version = dw[HUC_GSC_VERSION_DW];
>>>   -    uc_fw->major_ver_found = FIELD_GET(HUC_GSC_MAJOR_VER_MASK, 
>>> version);
>>> -    uc_fw->minor_ver_found = FIELD_GET(HUC_GSC_MINOR_VER_MASK, 
>>> version);
>>> +    uc_fw->file_selected.major_ver = 
>>> FIELD_GET(HUC_GSC_MAJOR_VER_MASK, version);
>>> +    uc_fw->file_selected.minor_ver = 
>>> FIELD_GET(HUC_GSC_MINOR_VER_MASK, version);
>>>         return 0;
>>>   }
>>> @@ -357,7 +465,7 @@ static int check_ccs_header(struct 
>>> drm_i915_private *i915,
>>>       /* Check the size of the blob before examining buffer contents */
>>>       if (unlikely(fw->size < sizeof(struct uc_css_header))) {
>>>           drm_warn(&i915->drm, "%s firmware %s: invalid size: %zu < 
>>> %zu\n",
>>> -             intel_uc_fw_type_repr(uc_fw->type), uc_fw->path,
>>> +             intel_uc_fw_type_repr(uc_fw->type), 
>>> uc_fw->file_selected.path,
>>>                fw->size, sizeof(struct uc_css_header));
>>>           return -ENODATA;
>>>       }
>>> @@ -370,7 +478,7 @@ static int check_ccs_header(struct 
>>> drm_i915_private *i915,
>>>       if (unlikely(size != sizeof(struct uc_css_header))) {
>>>           drm_warn(&i915->drm,
>>>                "%s firmware %s: unexpected header size: %zu != %zu\n",
>>> -             intel_uc_fw_type_repr(uc_fw->type), uc_fw->path,
>>> +             intel_uc_fw_type_repr(uc_fw->type), 
>>> uc_fw->file_selected.path,
>>>                fw->size, sizeof(struct uc_css_header));
>>>           return -EPROTO;
>>>       }
>>> @@ -385,7 +493,7 @@ static int check_ccs_header(struct 
>>> drm_i915_private *i915,
>>>       size = sizeof(struct uc_css_header) + uc_fw->ucode_size + 
>>> uc_fw->rsa_size;
>>>       if (unlikely(fw->size < size)) {
>>>           drm_warn(&i915->drm, "%s firmware %s: invalid size: %zu < 
>>> %zu\n",
>>> -             intel_uc_fw_type_repr(uc_fw->type), uc_fw->path,
>>> +             intel_uc_fw_type_repr(uc_fw->type), 
>>> uc_fw->file_selected.path,
>>>                fw->size, size);
>>>           return -ENOEXEC;
>>>       }
>>> @@ -394,16 +502,16 @@ static int check_ccs_header(struct 
>>> drm_i915_private *i915,
>>>       size = __intel_uc_fw_get_upload_size(uc_fw);
>>>       if (unlikely(size >= i915->wopcm.size)) {
>>>           drm_warn(&i915->drm, "%s firmware %s: invalid size: %zu > 
>>> %zu\n",
>>> -             intel_uc_fw_type_repr(uc_fw->type), uc_fw->path,
>>> +             intel_uc_fw_type_repr(uc_fw->type), 
>>> uc_fw->file_selected.path,
>>>                size, (size_t)i915->wopcm.size);
>>>           return -E2BIG;
>>>       }
>>>         /* Get version numbers from the CSS header */
>>> -    uc_fw->major_ver_found = FIELD_GET(CSS_SW_VERSION_UC_MAJOR,
>>> -                       css->sw_version);
>>> -    uc_fw->minor_ver_found = FIELD_GET(CSS_SW_VERSION_UC_MINOR,
>>> -                       css->sw_version);
>>> +    uc_fw->file_selected.major_ver = 
>>> FIELD_GET(CSS_SW_VERSION_UC_MAJOR,
>>> +                           css->sw_version);
>>> +    uc_fw->file_selected.minor_ver = 
>>> FIELD_GET(CSS_SW_VERSION_UC_MINOR,
>>> +                           css->sw_version);
>>>         if (uc_fw->type == INTEL_UC_FW_TYPE_GUC)
>>>           uc_fw->private_data_size = css->private_data_size;
>>> @@ -422,9 +530,11 @@ static int check_ccs_header(struct 
>>> drm_i915_private *i915,
>>>   int intel_uc_fw_fetch(struct intel_uc_fw *uc_fw)
>>>   {
>>>       struct drm_i915_private *i915 = __uc_fw_to_gt(uc_fw)->i915;
>>> +    struct intel_uc_fw_file file_ideal;
>>>       struct device *dev = i915->drm.dev;
>>>       struct drm_i915_gem_object *obj;
>>>       const struct firmware *fw = NULL;
>>> +    bool old_ver = false;
>>>       int err;
>>>         GEM_BUG_ON(!i915->wopcm.size);
>>> @@ -437,27 +547,33 @@ int intel_uc_fw_fetch(struct intel_uc_fw *uc_fw)
>>>       __force_fw_fetch_failures(uc_fw, -EINVAL);
>>>       __force_fw_fetch_failures(uc_fw, -ESTALE);
>>>   -    err = firmware_request_nowarn(&fw, uc_fw->path, dev);
>>> -    if (err && !intel_uc_fw_is_overridden(uc_fw) && 
>>> uc_fw->fallback.path) {
>>> -        err = firmware_request_nowarn(&fw, uc_fw->fallback.path, dev);
>>> -        if (!err) {
>>> -            drm_notice(&i915->drm,
>>> -                   "%s firmware %s is recommended, but only %s was 
>>> found\n",
>>> -                   intel_uc_fw_type_repr(uc_fw->type),
>>> -                   uc_fw->wanted_path,
>>> -                   uc_fw->fallback.path);
>>> -            drm_info(&i915->drm,
>>> -                 "Consider updating your linux-firmware pkg or 
>>> downloading from %s\n",
>>> -                 INTEL_UC_FIRMWARE_URL);
>>> -
>>> -            uc_fw->path = uc_fw->fallback.path;
>>> -            uc_fw->major_ver_wanted = uc_fw->fallback.major_ver;
>>> -            uc_fw->minor_ver_wanted = uc_fw->fallback.minor_ver;
>>> +    err = firmware_request_nowarn(&fw, uc_fw->file_selected.path, 
>>> dev);
>>> +    memcpy(&file_ideal, &uc_fw->file_wanted, sizeof(file_ideal));
>>> +    if (!err || intel_uc_fw_is_overridden(uc_fw))
>>> +        goto done;
>>> +
>>> +    while (err == -ENOENT) {
>>> +        __uc_fw_auto_select(i915, uc_fw);
>>> +        if (!uc_fw->file_selected.path) {
>>> +            /*
>>> +             * No more options! But set the path back to something
>>> +             * valid just in case it gets dereferenced.
>>> +             */
>>> +            uc_fw->file_selected.path = file_ideal.path;
>>> +
>>> +            /* Also, preserve the version that was really wanted */
>>> +            memcpy(&uc_fw->file_wanted, &file_ideal, 
>>> sizeof(uc_fw->file_wanted));
>>> +            break;
>>>           }
>>> +
>>> +        err = firmware_request_nowarn(&fw, 
>>> uc_fw->file_selected.path, dev);
>>>       }
>>> +
>>>       if (err)
>>>           goto fail;
>>>   +    old_ver = true;
>>> +done:
>>>       if (uc_fw->loaded_via_gsc)
>>>           err = check_gsc_manifest(fw, uc_fw);
>>>       else
>>> @@ -465,18 +581,39 @@ int intel_uc_fw_fetch(struct intel_uc_fw *uc_fw)
>>>       if (err)
>>>           goto fail;
>>>   -    if (uc_fw->major_ver_found != uc_fw->major_ver_wanted ||
>>> -        uc_fw->minor_ver_found < uc_fw->minor_ver_wanted) {
>>> -        drm_notice(&i915->drm, "%s firmware %s: unexpected version: 
>>> %u.%u != %u.%u\n",
>>> -               intel_uc_fw_type_repr(uc_fw->type), uc_fw->path,
>>> -               uc_fw->major_ver_found, uc_fw->minor_ver_found,
>>> -               uc_fw->major_ver_wanted, uc_fw->minor_ver_wanted);
>>> -        if (!intel_uc_fw_is_overridden(uc_fw)) {
>>> -            err = -ENOEXEC;
>>> -            goto fail;
>>> +    if (uc_fw->file_wanted.major_ver) {
>>> +        /* Check the file's major version was as it claimed */
>>> +        if (uc_fw->file_selected.major_ver != 
>>> uc_fw->file_wanted.major_ver) {
>>> +            drm_notice(&i915->drm, "%s firmware %s: unexpected 
>>> version: %u.%u != %u.%u\n",
>>> +                   intel_uc_fw_type_repr(uc_fw->type), 
>>> uc_fw->file_selected.path,
>>> +                   uc_fw->file_selected.major_ver, 
>>> uc_fw->file_selected.minor_ver,
>>> +                   uc_fw->file_wanted.major_ver, 
>>> uc_fw->file_wanted.minor_ver);
>>> +            if (!intel_uc_fw_is_overridden(uc_fw)) {
>>> +                err = -ENOEXEC;
>>> +                goto fail;
>>> +            }
>>> +        } else {
>>> +            if (uc_fw->file_selected.minor_ver < 
>>> uc_fw->file_wanted.minor_ver)
>>> +                old_ver = true;
>>>           }
>>>       }
>>>   +    if (old_ver) {
>>> +        /* Preserve the version that was really wanted */
>>> +        memcpy(&uc_fw->file_wanted, &file_ideal, 
>>> sizeof(uc_fw->file_wanted));
>>> +
>>> +        drm_notice(&i915->drm,
>>> +               "%s firmware %s (%d.%d) is recommended, but only %s 
>>> (%d.%d) was found\n",
>>> +               intel_uc_fw_type_repr(uc_fw->type),
>>> +               uc_fw->file_wanted.path,
>>> +               uc_fw->file_wanted.major_ver, 
>>> uc_fw->file_wanted.minor_ver,
>>> +               uc_fw->file_selected.path,
>>> +               uc_fw->file_selected.major_ver, 
>>> uc_fw->file_selected.minor_ver);
>>> +        drm_info(&i915->drm,
>>> +             "Consider updating your linux-firmware pkg or 
>>> downloading from %s\n",
>>> +             INTEL_UC_FIRMWARE_URL);
>>> +    }
>>> +
>>>       if (HAS_LMEM(i915)) {
>>>           obj = i915_gem_object_create_lmem_from_data(i915, 
>>> fw->data, fw->size);
>>>           if (!IS_ERR(obj))
>>> @@ -503,7 +640,7 @@ int intel_uc_fw_fetch(struct intel_uc_fw *uc_fw)
>>>                     INTEL_UC_FIRMWARE_ERROR);
>>>         i915_probe_error(i915, "%s firmware %s: fetch failed with 
>>> error %d\n",
>>> -             intel_uc_fw_type_repr(uc_fw->type), uc_fw->path, err);
>>> +             intel_uc_fw_type_repr(uc_fw->type), 
>>> uc_fw->file_selected.path, err);
>>>       drm_info(&i915->drm, "%s firmware(s) can be downloaded from 
>>> %s\n",
>>>            intel_uc_fw_type_repr(uc_fw->type), INTEL_UC_FIRMWARE_URL);
>>>   @@ -645,7 +782,7 @@ int intel_uc_fw_upload(struct intel_uc_fw 
>>> *uc_fw, u32 dst_offset, u32 dma_flags)
>>>     fail:
>>>       i915_probe_error(gt->i915, "Failed to load %s firmware %s 
>>> (%d)\n",
>>> -             intel_uc_fw_type_repr(uc_fw->type), uc_fw->path,
>>> +             intel_uc_fw_type_repr(uc_fw->type), 
>>> uc_fw->file_selected.path,
>>>                err);
>>>       intel_uc_fw_change_status(uc_fw, INTEL_UC_FIRMWARE_LOAD_FAIL);
>>>       return err;
>>> @@ -864,18 +1001,19 @@ size_t intel_uc_fw_copy_rsa(struct 
>>> intel_uc_fw *uc_fw, void *dst, u32 max_len)
>>>   void intel_uc_fw_dump(const struct intel_uc_fw *uc_fw, struct 
>>> drm_printer *p)
>>>   {
>>>       drm_printf(p, "%s firmware: %s\n",
>>> -           intel_uc_fw_type_repr(uc_fw->type), uc_fw->wanted_path);
>>> -    if (uc_fw->fallback.path) {
>>> -        drm_printf(p, "%s firmware fallback: %s\n",
>>> -               intel_uc_fw_type_repr(uc_fw->type), 
>>> uc_fw->fallback.path);
>>> -        drm_printf(p, "fallback selected: %s\n",
>>> -               str_yes_no(uc_fw->path == uc_fw->fallback.path));
>>> -    }
>>> +           intel_uc_fw_type_repr(uc_fw->type), 
>>> uc_fw->file_selected.path);
>>> +    if (uc_fw->file_selected.path != uc_fw->file_wanted.path)
>>> +        drm_printf(p, "%s firmware wanted: %s\n",
>>> +               intel_uc_fw_type_repr(uc_fw->type), 
>>> uc_fw->file_wanted.path);
>>>       drm_printf(p, "\tstatus: %s\n",
>>>              intel_uc_fw_status_repr(uc_fw->status));
>>> -    drm_printf(p, "\tversion: wanted %u.%u, found %u.%u\n",
>>> -           uc_fw->major_ver_wanted, uc_fw->minor_ver_wanted,
>>> -           uc_fw->major_ver_found, uc_fw->minor_ver_found);
>>> +    if (uc_fw->file_wanted.major_ver)
>>> +        drm_printf(p, "\tversion: wanted %u.%u, found %u.%u\n",
>>> +               uc_fw->file_wanted.major_ver, 
>>> uc_fw->file_wanted.minor_ver,
>>> +               uc_fw->file_selected.major_ver, 
>>> uc_fw->file_selected.minor_ver);
>>> +    else
>>> +        drm_printf(p, "\tversion: found %u.%u\n",
>>> +               uc_fw->file_selected.major_ver, 
>>> uc_fw->file_selected.minor_ver);
>>>       drm_printf(p, "\tuCode: %u bytes\n", uc_fw->ucode_size);
>>>       drm_printf(p, "\tRSA: %u bytes\n", uc_fw->rsa_size);
>>>   }
>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h 
>>> b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h
>>> index 7aa2644400b98..344763c942e37 100644
>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h
>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h
>>> @@ -64,6 +64,17 @@ enum intel_uc_fw_type {
>>>   };
>>>   #define INTEL_UC_FW_NUM_TYPES 2
>>>   +/*
>>> + * The firmware build process will generate a version header file 
>>> with major and
>>> + * minor version defined. The versions are built into CSS header of 
>>> firmware.
>>> + * i915 kernel driver set the minimal firmware version required per 
>>> platform.
>>> + */
>>> +struct intel_uc_fw_file {
>>> +    const char *path;
>>> +    u16 major_ver;
>>> +    u16 minor_ver;
>>> +};
>>> +
>>>   /*
>>>    * This structure encapsulates all the data needed during the process
>>>    * of fetching, caching, and loading the firmware image into the uC.
>>> @@ -74,11 +85,12 @@ struct intel_uc_fw {
>>>           const enum intel_uc_fw_status status;
>>>           enum intel_uc_fw_status __status; /* no accidental 
>>> overwrites */
>>>       };
>>> -    const char *wanted_path;
>>> -    const char *path;
>>> +    struct intel_uc_fw_file file_wanted;
>>> +    struct intel_uc_fw_file file_selected;
>>>       bool user_overridden;
>>>       size_t size;
>>>       struct drm_i915_gem_object *obj;
>>> +
>>>       /**
>>>        * @dummy: A vma used in binding the uc fw to ggtt. We can't 
>>> define this
>>>        * vma on the stack as it can lead to a stack overflow, so we 
>>> define it
>>> @@ -89,25 +101,8 @@ struct intel_uc_fw {
>>>       struct i915_vma_resource dummy;
>>>       struct i915_vma *rsa_data;
>>>   -    /*
>>> -     * The firmware build process will generate a version header 
>>> file with major and
>>> -     * minor version defined. The versions are built into CSS 
>>> header of firmware.
>>> -     * i915 kernel driver set the minimal firmware version required 
>>> per platform.
>>> -     */
>>> -    u16 major_ver_wanted;
>>> -    u16 minor_ver_wanted;
>>> -    u16 major_ver_found;
>>> -    u16 minor_ver_found;
>>> -
>>> -    struct {
>>> -        const char *path;
>>> -        u16 major_ver;
>>> -        u16 minor_ver;
>>> -    } fallback;
>>> -
>>>       u32 rsa_size;
>>>       u32 ucode_size;
>>> -
>>>       u32 private_data_size;
>>>         bool loaded_via_gsc;
>>> diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c 
>>> b/drivers/gpu/drm/i915/i915_gpu_error.c
>>> index b5fbc2252784a..9ea2fe34e7d30 100644
>>> --- a/drivers/gpu/drm/i915/i915_gpu_error.c
>>> +++ b/drivers/gpu/drm/i915/i915_gpu_error.c
>>> @@ -1022,8 +1022,10 @@ static void cleanup_params(struct 
>>> i915_gpu_coredump *error)
>>>     static void cleanup_uc(struct intel_uc_coredump *uc)
>>>   {
>>> -    kfree(uc->guc_fw.path);
>>> -    kfree(uc->huc_fw.path);
>>> +    kfree(uc->guc_fw.file_selected.path);
>>> +    kfree(uc->huc_fw.file_selected.path);
>>> +    kfree(uc->guc_fw.file_wanted.path);
>>> +    kfree(uc->huc_fw.file_wanted.path);
>>>       i915_vma_coredump_free(uc->guc.vma_log);
>>>       i915_vma_coredump_free(uc->guc.vma_ctb);
>>>   @@ -1705,12 +1707,10 @@ gt_record_uc(struct intel_gt_coredump *gt,
>>>       memcpy(&error_uc->guc_fw, &uc->guc.fw, sizeof(uc->guc.fw));
>>>       memcpy(&error_uc->huc_fw, &uc->huc.fw, sizeof(uc->huc.fw));
>>>   -    /* Non-default firmware paths will be specified by the modparam.
>>> -     * As modparams are generally accesible from the userspace make
>>> -     * explicit copies of the firmware paths.
>>> -     */
>>> -    error_uc->guc_fw.path = kstrdup(uc->guc.fw.path, ALLOW_FAIL);
>>> -    error_uc->huc_fw.path = kstrdup(uc->huc.fw.path, ALLOW_FAIL);
>>> +    error_uc->guc_fw.file_selected.path = 
>>> kstrdup(uc->guc.fw.file_selected.path, ALLOW_FAIL);
>>> +    error_uc->huc_fw.file_selected.path = 
>>> kstrdup(uc->huc.fw.file_selected.path, ALLOW_FAIL);
>>> +    error_uc->guc_fw.file_wanted.path = 
>>> kstrdup(uc->guc.fw.file_wanted.path, ALLOW_FAIL);
>>> +    error_uc->huc_fw.file_wanted.path = 
>>> kstrdup(uc->huc.fw.file_wanted.path, ALLOW_FAIL);
>>>         /*
>>>        * Save the GuC log and include a timestamp reference for 
>>> converting the
>>
>

