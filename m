Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52F296606B4
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jan 2023 19:57:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C97210E8BC;
	Fri,  6 Jan 2023 18:57:09 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA8CB10E8BB;
 Fri,  6 Jan 2023 18:57:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673031426; x=1704567426;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=WLr5gechOTh/uwLd/eCE7Fho/4+WHzwI/FQQlNxhk/k=;
 b=PHgcNiHcKHdhnS9IZjnLmkLYtLFZUWJ8gSPwQTshwoiF1Df4gQO6cFfg
 EsbnZZMqcVdCs+3kWQg2M7eh4sRSmEwFjFW7LcOu/R1/9wXUizWkjXn9X
 xqwLIspwEsGuAX8UQbo4eyAdtUEgtFthWKXM2jIUNwFgCBzJEvGEWra80
 r+k/MYORDGfol0uznCMGbo9CRHLqrerWfmEKtI2yzYY0dgqePcb9LTto5
 Tcu7DnI6cAXxhItUBnouah7uvS0hrvfgX2CpJRIQl9cd/ktkETidamyu4
 jsddCb+rWuvFl+JRsuOxTiXYIliXTqJ0ZroHR1nsbLR1ZWfxP/YF2Bvl3 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10582"; a="349747435"
X-IronPort-AV: E=Sophos;i="5.96,306,1665471600"; d="scan'208";a="349747435"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2023 10:57:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10582"; a="780052629"
X-IronPort-AV: E=Sophos;i="5.96,306,1665471600"; d="scan'208";a="780052629"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga004.jf.intel.com with ESMTP; 06 Jan 2023 10:57:06 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 6 Jan 2023 10:57:05 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 6 Jan 2023 10:57:05 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Fri, 6 Jan 2023 10:57:05 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Fri, 6 Jan 2023 10:57:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QPg7ci8OjR+yt/nEOdZxF4p1BSXvAidycwQTBNz9fAF+2jJdRpM+0CQE5pTFgTcL1zFeFbCN+uuzvIYzwKc9hdY4ZzTSXwdNEfNW3n7lnGrQc5aEqKNp372LzpPDvtqs18/L0fW8H3DDECP3nVvzKustUK3vq8dkiM/+HTy5VU9QKNFc2BNIhDrgebETyOw7y/s8XMWVYH2HCggAJqNvt7QRku/Ul6i5OYSq8pqMz6rb9dwGIvhh2uOOgcYh+fUEHt8UGk4K42mMMxkKCXQRkHROhoPkwvINDqhUCrqWOspThUzbGJAq9RK9PgiePkHnv7ARcrzviM3TB7vsLV0m1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2uPc+2JKTNTD7TVkU1Yb5PhSNtII5WdCMVakmZSLSyI=;
 b=Zv0gTVGU9oOe3lOMAhprLHCmGmRURi+6vWpCmE5v905BhbYpYZFb241N6ZUuYGduOgi9De/iEkZFw3Kf08c8lc9mj1yf7Nqn9d5eSKlLgDDcVeVFMWUukYLMdoLRNh+FN0x3ap5y3X2TJPor/igh6dSIop5RC5hACLKV0+yvwAaW5wH9rojZoxaYfFIQTFHqEqTrkmQM9o0s7Us+LiVh9hE5hkpA/81BX5g4J4oHpy4J7c457YucnnusXp9hUxxt8J4wzgaET7r1Eew7Xx+9NkgxRMDfOwl27xKRlnD95dk0jhX4WNWW2GWxv+won6UJVLbs77KWdC6vvVpqmTMWOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by MW5PR11MB5858.namprd11.prod.outlook.com (2603:10b6:303:193::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Fri, 6 Jan
 2023 18:57:03 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::ec2f:4a87:326b:2610]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::ec2f:4a87:326b:2610%7]) with mapi id 15.20.5944.019; Fri, 6 Jan 2023
 18:57:03 +0000
Message-ID: <127d50a6-b0c4-b87b-ddf5-6bd121d53f3c@intel.com>
Date: Fri, 6 Jan 2023 10:57:01 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.6.1
Subject: Re: [Intel-gfx] [PATCH v2 4/5] drm/i915/guc: Add GuC CT specific
 debug print wrappers
Content-Language: en-GB
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, <Intel-GFX@Lists.FreeDesktop.Org>
References: <20221118015858.2548106-1-John.C.Harrison@Intel.com>
 <20221118015858.2548106-5-John.C.Harrison@Intel.com>
 <48f594de-9682-4b60-f934-9420d02b405e@intel.com>
 <dd9559e8-7d65-d7bb-ea1a-d169a1c7eec3@intel.com>
 <4579b7e8-eae7-b760-66aa-b01273d18aab@intel.com>
 <d658f8fa-a063-aa0c-48ff-14f32cb6b339@intel.com>
 <9a5a84be-a5ae-7be2-f522-5e976511e4e1@intel.com>
 <143a660d-de2d-a77a-b490-8ad2add80420@linux.intel.com>
 <dd787d9d-8559-1da4-7e99-2635ef1341a8@intel.com>
 <c5622088-e381-1df4-417d-9b033b0a6afe@linux.intel.com>
 <467f47f4-c30f-16ba-3330-a3d4752366a8@intel.com>
 <f0ebffa1-45b7-d6f9-4341-3fa8aabae3f5@linux.intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <f0ebffa1-45b7-d6f9-4341-3fa8aabae3f5@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0275.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::10) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|MW5PR11MB5858:EE_
X-MS-Office365-Filtering-Correlation-Id: 14a5cfcf-a8b2-42f1-55d8-08daf017cc5c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: s5SRCAu330NdvmtMmZg9suCsyKkWpXaNlmt9iTG0IQVUzSgnAAiHvwDOqvZVV1HI6efDCMS3oK730k7bG/MO6mg35Lmp3rVnf58L4WluyCGg8E/qaqlSJzpyyM6C7alLKTBLRkr0kcrP8YYBWKjzCQFGVdhFeSLSXyekXqjJTtwp/xx4AO8s2tqeEOSTCG7pIlDDt2FkDhlLMkiGYnfH9Url6ZmazGoTtIKyqqg5OjK1MZyTFjVHqUOvMrvMgL+m8mBHyLX9xwtQES5GRDMCKbY6c2pr8gjtB3sgiTINV412u4ZRlDCSmt57XFTtttnLN/xmBpZK8dQK9Y3I4N02V9+bSfEliAx8cTqSkGsYs//eMJ3RvOpY4goVuT2dSvFpb2BO+VMBRISZyqnhpJQKa6Amof/MMMkWcjUbVoCYYqLpZnnPWvRrtgpdxwBW5SnA4DmGMi0bq5L2OWkMOlCIdUSFZqhkIa54D63+dKZvYnlghcKrJgiitC58DQ1FTAHIBIzxYLdARbs0khXSFUxJSDU8FW43xL4Zk7C9KhC2Yc4mOLhD1sBls1MLTBmW54jh7At4rQjWJVaXWMvBOPZtT6VJ3gLrNk7mE8VXG6DGbkLu1kolmDD1DQccVWXyOlKLwyGCzqMhBIdA00lIvHL5Cb9Hni9D6vLOQCaamqY9bbNxGO4/1KpTHMtWN3ALGnNTd3QWag0pCgDoKp6kTsdGcJCU+VaQkALVfKjE+ILjqN9bTPO2P8+Zr7V4B3n/Hea0
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(376002)(39860400002)(346002)(366004)(136003)(396003)(451199015)(2906002)(66476007)(8936002)(83380400001)(66899015)(41300700001)(38100700002)(82960400001)(31686004)(8676002)(66556008)(5660300002)(66946007)(4326008)(186003)(478600001)(6512007)(26005)(6486002)(316002)(2616005)(31696002)(54906003)(53546011)(110136005)(86362001)(36756003)(6506007)(21314003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QVBCOENRQ200YUxldEpnV2t3QkpIZXZCQ09qeFZ6NzM4OHlkVmI5bDhFc1Z6?=
 =?utf-8?B?ZFl6VU1jcXFBRmFBZEd6S3FjVnc5cjRrMVdublF2cm1vUnRQVitsWjBBUkRL?=
 =?utf-8?B?WGZsL1RWcWZCcUFoaTdhMnpJSkh5dmtVU3g5cm5tcWNuVG9ML1N0RzBzd0xa?=
 =?utf-8?B?L0JhUmtZdDh6eDVqVjNlTHZJZ0tsYmp2WWxaTUo3R2xNajVUbFhDbElDbGJp?=
 =?utf-8?B?aUx5RTBDUm5RVE1ySzRIT3dPN2w2MmswdDBOMnZuUHVpQXZtdk9QNVNhb1Qx?=
 =?utf-8?B?eGhYWWQrbWxXOEZJdGlYbmxVT3pVMkJFdTRQRTFHcFA5aUQ1UDN4ai9sSEs4?=
 =?utf-8?B?dy8vY0RXeTN3TmxxanV5L1lkWlVSUG9wYWpGNVpvcyt3QkpKUSsybHJoZ3BP?=
 =?utf-8?B?eml3YlBoVkVWMk8zYkk4UXRDNzRmT2Y5YW1YdGhVN0hZV3FDajEwVldWSkF2?=
 =?utf-8?B?T3hjUDA2NDRUeGdVY2hlKzlCQVNSYU1PS3hkQ1BtM3p4UDdiTTNERHhWV2VI?=
 =?utf-8?B?RkF0eTQyVk1rRTBFSFVsNW03R2Uwdk1OM1BRNXJXTWFmOHBKM3JKQ3BHdy8x?=
 =?utf-8?B?bERaWjVFYVNYcm1GVmRXdzZVenVVVzcxdVJ6NGUzcFdkOHJjOEcyYWtUYmwy?=
 =?utf-8?B?eTBOb0dhdHFSdlZEQUJtY0o4S2htbjhiSXY1K3hHb1lNbXZQQTE1S0FDcktL?=
 =?utf-8?B?VWNXQVkvRGhPdVNyWUs3OTltWTFEK0NWclVZRldsOWtiY3pSWFRMd1Zqd1NN?=
 =?utf-8?B?amo5SStYT3pLRjFvSjRuSmJVZklLT1NiNjJJYXVZeHdESWlqUWVLZlFqaXI0?=
 =?utf-8?B?RVErM3JtQjZwOTdBOU1CbG5JOG1Zc3lwUXJobHlmU3F0dWxtV3FuYVFtU3h3?=
 =?utf-8?B?MG5laDU3MytVSldOMjM4a3ZJY08wWGwzblFOaU9kTGRLdG5scGZiSk5XeUNa?=
 =?utf-8?B?RnZQTHVCcmtXaDNFVFN3SkpsbE0vTGZ5QkJpbnF5anNWV1BMbG8zU2hyZGhK?=
 =?utf-8?B?TG5oOEN4Wnc4Z2lJOWs3ZEVxbWRtanIyeXVLL20vV04ybnZNdUsxcU9sTm5O?=
 =?utf-8?B?a3NmNlZwa2YzL2JtWlR6YWhMZ0U4LzVPNnFHU2IvWjkrREJzT3A3UGFWRDlG?=
 =?utf-8?B?RUpFcndXNEpRK3pjaElNN2UranR1ZzEyRlBDcjJNTzJpTHpOT2NFZncxaiti?=
 =?utf-8?B?bnpMQW1MYUpmRWEyYnROMHNPZGdjeVQ3QXhTUWxWbk14QW1zU2RCc2J4V25q?=
 =?utf-8?B?Q1NDWjRxMWFhN1htUVNTQ1FLWUlSeEJJOHFpQXBabnhUbUNiSTJjeHNTeHVX?=
 =?utf-8?B?VFJuQUhpRHFlbjNHcUMzRkVINCtBaGVaQm9FeWVFbU1pWEV5ajliTnVobnZN?=
 =?utf-8?B?NUdGQmpaaWhNMytjak9jTk8ybiszczlNSHM4RjRhdk1UTkdLTUM1OXZ3b3pK?=
 =?utf-8?B?VXo2eTJwKzk2SXVlRFYrWjJkaGVLWGRYTzZzODlNaEx1SFppMXYzTlVuOG81?=
 =?utf-8?B?blU1b3pJVlB4V3V4R2pzc25yRHZSYlNpZzUwWHBBMXVKckErRklmaHh3MGR3?=
 =?utf-8?B?MTJhL3g3dUNBdkQ4NlU2YlJNanBmeUcxbmpOWkU4VGswU2l5R2UwbER2T0FW?=
 =?utf-8?B?MGJGYzg5TDhVdGc0alRwRjBGdWRnRzZwcEtvaXVMRFNrOGRHSno3Vm5rYm9X?=
 =?utf-8?B?cVhKV0pPTkplczM1R09VSitycThsK2VVNUNYaktzRmZTRGU1Wmo3enNkcllH?=
 =?utf-8?B?cjVHOVRhNU1mWkZITU4wTFJCZVNEcVJ0dEJFc2N0UFhyM3BTeUlKbytxTXk1?=
 =?utf-8?B?YkdJdVk2NS9mbWZGWVpKU3RPTERiU0dpNFpWb3Z5Z1UwYWhIckgrWnd5ejgr?=
 =?utf-8?B?V1RsaGxuSFREOHp6ZUM5cm9FQTdUZDY4UkFZS2t6clJYSEMxbDJXOFJwWG5m?=
 =?utf-8?B?UWhlU21GYVU0dWUySkpzZkJ0TlREc1hkcEV5bXMyS3Y3YlU3WFgxUzAwbjQz?=
 =?utf-8?B?OEZJOGlNQTF3ZDVmZGdmVlRBdHpsSmY5TWJ5UHk4bjR2TGhMYWRTU0xja3NX?=
 =?utf-8?B?d1hVVUxsZWtTTUIwMmFEQ2hJaVBiVW5QTHVmdE1JVWU3OXV5bjVIVy85VWJH?=
 =?utf-8?B?S2JUUHYzVDR0SUQ3SXR4NXYzWlB2ME9IQ3FGMDhvdThUZCtONkRKZmN4M0ZE?=
 =?utf-8?B?MUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 14a5cfcf-a8b2-42f1-55d8-08daf017cc5c
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2023 18:57:03.1270 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Sqso6aYasLZna8lq355MwWRglY7pzlIwlay0sGnbd2pRyCFB9qm0E8QwHCRGoZdZt/ZcjbrIhE26pMS2hTrHPka3rZ7LozRAZD8wbn/S5M8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5858
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
Cc: "Ewins, Jon" <jon.ewins@intel.com>, DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/6/2022 03:06, Tvrtko Ursulin wrote:
> On 05/12/2022 18:44, Michal Wajdeczko wrote:
>> On 05.12.2022 14:16, Tvrtko Ursulin wrote:
>>> On 02/12/2022 20:14, John Harrison wrote:
>>> [snip]
>>>
>>>> Random meaningless (to me) message that is apparently a display thing:
>>>> drm_dbg_kms(&dev_priv->drm, "disabling %s\n", pll->info->name);
>>>> i915 0000:00:02.0: [drm:intel_disable_shared_dpll [i915]] disabling
>>>> PORT PLL B
>>>
>>> Plan is to not touch outside gt/.
For some unexplicable reason that means it is almost impossible to see 
the actual problems in most CI dmesg logs because they are swamped with 
irrelevant display messages that cannot be filtered out. For example, I 
recently manually grep'd out all the display spam from a bug report log. 
The dmesg file went from 12MB to 700KB. That is a significant problem 
that makes bug triage way harder than it needs to be.

>
> Maybe as a way forward work could be split? If John wants to deal with 
> gt_xxx macros, avoid touching GuC (putting his original motivation 
> aside) and you want to convert the gt/uc folder? Assuming John you are 
> okay with "GuC:" and "CT:" prefixes.
Meaning just repost patch #1 only and expand to more intel_gt_* files? 
Sure, if someone will actually reply to that patch with some kind of r-b 
first so I know I'm not still wasting my time on a huge re-write that 
will to be redone multiple times when someone objects to the use of a 
colon or the lack of spaces, braces or whatever.

John.

