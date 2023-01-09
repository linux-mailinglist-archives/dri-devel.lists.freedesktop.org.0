Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2F16663190
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jan 2023 21:33:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D26410E505;
	Mon,  9 Jan 2023 20:33:32 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6BC010E502;
 Mon,  9 Jan 2023 20:33:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673296409; x=1704832409;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=SUd/UerKrBeDkJI6YzXm423o3HmGi5iHg4YvMfc7fYQ=;
 b=YyT3XAmKjijuJUq9B0wY40kje+eYM74wNwfdgDNE695hPv54e+GCL2C7
 w4DMKe+zD61RJL+fwzFf7MY7XeFY8FyjxYVCRKCAyYxZ1G2F9JncZ32tJ
 X6TZBMEzsZ8YkkfOw5yESb/I/0eg+aAoCu8oYcfXnUgTuuhOo6uVajWyn
 7ev3u34Bwntq4z/OPhUeoGOMB5TtNShNWH3PFmPnymIUdhY9KCgA3NhBH
 8MDdrOLRWaXOQzo0FgT44s3d7/DkCrxTTdE+R1wzrWPFSro42Zg0Cp2p4
 lWJbDrIkaLhjoiFy3VDjPLBEaga+zeLdVwbzkRyVxkYC9LVVMMNiQLdHl g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10585"; a="323048202"
X-IronPort-AV: E=Sophos;i="5.96,313,1665471600"; d="scan'208";a="323048202"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2023 12:33:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10585"; a="780806345"
X-IronPort-AV: E=Sophos;i="5.96,313,1665471600"; d="scan'208";a="780806345"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga004.jf.intel.com with ESMTP; 09 Jan 2023 12:33:28 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 9 Jan 2023 12:33:27 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Mon, 9 Jan 2023 12:33:27 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Mon, 9 Jan 2023 12:33:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bfZgcW0TTGsXTA3kpK37QGoZespaFTC1jKO3jAUXiOb7hT2lf24b4Nu4wv5EgBEIxRklGU6QmqqiIPN1Y1oNoSjaJ3Wy6a+XdGPpH4VASJw/7zGBeEdheeT3u1lsKfoWviZCo63aVX74nsn3tbJnnqJib6G2SqQtVQ6qChNTd1uqEbJXIf+7/MpgPUbzqxnxKhdPG+GN7DmkhYJsw2X8DBdkhtapR+Lb+TKQAWX3oSI8QbyaaDukmACzADTmsGMSOong1YgN9lJW1BXreWR1K+1cpw5F1V1emaKokT0oPXwkEoCPiiw+pr0lwMDwkJclrdpLb8ZHC6v/UupgM3d1EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RydP1uhLavvQnfyWwL+PDLve7vuFjhpweEEWJ4FnPXM=;
 b=DTJszGeYm5ljZRWJ793kaZU0XHNiNRlS3y3ker+sfyj2m/Tfba2CmcM02j7j2TILGp8S3AXM1Uv8NEIQCS2zv+6pB+MA6HGf/BAxdsa8gkSXKvlmEp9FRimsyKM5z+6Oe0c+ytwQXHCPSQDATRvMDkaC2elJpitoWSdvafDjIt6nPoLEZw53b1Z30XdLO+fSZmndhSNx9VYGWm8S0Nj604NhO5onj/A1snpgduIHCYjgGCJLpBiT/LgxPhL1WXU32TbXXkTqtZR5DNbgs5QAQ/5PvMWVshDnv8NbRzKd1i2U1WxNMeM8XJeQwdM+CWYWTSNthwRsQXz7W4ncGMj1zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by BN9PR11MB5356.namprd11.prod.outlook.com (2603:10b6:408:11d::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Mon, 9 Jan
 2023 20:33:25 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::ec2f:4a87:326b:2610]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::ec2f:4a87:326b:2610%7]) with mapi id 15.20.5986.018; Mon, 9 Jan 2023
 20:33:25 +0000
Message-ID: <36d58ee5-1004-6a20-a6e4-cf8e910c2c47@intel.com>
Date: Mon, 9 Jan 2023 12:33:23 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.6.1
Subject: Re: [Intel-gfx] [PATCH v2 4/5] drm/i915/guc: Add GuC CT specific
 debug print wrappers
Content-Language: en-GB
To: Jani Nikula <jani.nikula@linux.intel.com>, Tvrtko Ursulin
 <tvrtko.ursulin@linux.intel.com>, Michal Wajdeczko
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
 <127d50a6-b0c4-b87b-ddf5-6bd121d53f3c@intel.com> <874jt02gk8.fsf@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <874jt02gk8.fsf@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0037.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::12) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|BN9PR11MB5356:EE_
X-MS-Office365-Filtering-Correlation-Id: 26955f4e-230e-4b84-0c88-08daf280c24d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /nbkrLZLwMy6qcguBGmxqE/gFjVicNjjC1c/QfiuI8ukpG56phqLqmtyB6YNzYffuGlr9zbZFcoAqdMcdtc4zBIdhbXkYejEdYnbv/r7CQhRzhFVfTF4mLmBlQA4pmVe3cTsYjk3SAodInw27hkFsLKlPkw0Lhoj5Bu4qmdqgnO98fsicEfvvDWUtN0qIPDMqcB6aG5+P1IMfdqhA5QGHCaksE/BHOtmFf4YLzBbRaX1IwyjOc+vBSL7eU5Byh1FH1lIxC4y+G4JWaj6AEA/C0VsbzWBppMzaZ6v9d3q+J0Vlyw3kZXrIEoHZGeCNG5jxhepF1kn53P+0uzwbQgEifq/OVsB2YeEIdw1Nmsa1yXCSxBENXZP9C1Rn/87A5IfoDlDq66Db2HrSoCWfea99lH7ZUlNcUf7FAQ5Z3dXuzf5W3D5XDZAem3wj7OIM/qxUafA3uYSJA7DDCC+IT3YbvqwTZMVkHCGXTsB1dj3HziqwpZzp7ntlptDBVlRiCGJteCw3KW2QPOpAjFrE1TK2JpfIbP8nBUz2LujZ1mldVIB56YlJBOTEG82LQs66zlC+kQCciXFff5MvAKE/Lu9WFff9gARfdiugQJhZarM2EEx+4Vq1RmIBTaWcgkFpWpguaoBs6y/5A9PnCyp6aJ+fLeQpOnQH8q2ZObLxr4YdbzVTFFS8HhAFTCJUypGI3ja2iXZ1P+ud6DxXwaitOaq+g2+7/Tt4LhNDEbM4EKwIh0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(396003)(136003)(346002)(376002)(39860400002)(451199015)(8936002)(2906002)(5660300002)(41300700001)(4326008)(8676002)(66476007)(66556008)(316002)(66946007)(110136005)(186003)(26005)(6512007)(2616005)(38100700002)(31686004)(86362001)(83380400001)(31696002)(36756003)(82960400001)(478600001)(53546011)(6506007)(6486002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Qk5YREdBMlFiMXNIZVBubWRqVlNqSFVFUFJ3bVRHL2JmZnE4WFQvb3JxM0U0?=
 =?utf-8?B?a2JCNzNiQ2pSV203K2Q0dUExNUlqSUVVdlI5aWpIbkJmZW9EdklkbHQyNGdN?=
 =?utf-8?B?SjQ4UGxJU2xkNWxHbk1qaTlxdEhuaHNNNnA3VmtYVzhuODRuTGNVSWFHcGRk?=
 =?utf-8?B?UE9sWEphZGptOFNYZFlQL3B5WWdTTFVySUxEV0pEV1czNStzcGF0WGxjempi?=
 =?utf-8?B?clhvWksrckJXRTZpZ254L2JKdCtTS3pmTWNxNVNqNjVjcDNFTUtNZVY0VU5n?=
 =?utf-8?B?NjBUVDdyNzdZOEYyNG5xOUNkQmwyRHJKSnVtT3VGNUhtcDZrMGlmVFBhTUM1?=
 =?utf-8?B?WGpTcGFkL0xJOWFTWEIwVTQzSko1N3gvVlhaSC9sSkgyRzVQV0xZMmlJcDls?=
 =?utf-8?B?Vm55M3hkeXp0MzIyK21vUnRzZlplaElQcnBFVlF0YnJuUUVWYmRBYnBKRDlB?=
 =?utf-8?B?dmtydDFnZ0R3bjlUYUxxc1pVQ01oWUY4MkdpVTBZWlVGRjhYTFplL3o4aDJm?=
 =?utf-8?B?TW05M1UzcG9HLzVwbC9qWGQyMi9QMVVESkJQRlc4Y3RPak1tcVZvZnRlYlhX?=
 =?utf-8?B?R2hNRzRNL3E3ODJQcTRFWU5kdFNMSllkLzFjanIrdGhGVmMwOVk1bTlEQysw?=
 =?utf-8?B?Y3hvdTBUN3VYbDdFZVdTdWdvNTRpMGVRTmNsUnA4U0daSDh6UFFKcHUyc0F5?=
 =?utf-8?B?Qk5jdWxxWmgxSGwzSVkxL00xZkMyNFUvSzk4UHV5ZlM5NGQwTUdoZTN6TWd3?=
 =?utf-8?B?bUlzYzA2RzJ2Q3VORUo1KzhwUUIwZ3dCWkNucW1ZK2c5c1VNQWNJd24vbVBC?=
 =?utf-8?B?UUFhR0FtVTREZmJXNVZIRGhXUld3OFNHaE9tMzFHYzh3NEFqMTFqVm5iYzY0?=
 =?utf-8?B?SFdPODlXbEoraW9LU3g3NUJ4Mjg3eUdMc1pCbVQ1WDl4TjBIRGthbkIxbS9p?=
 =?utf-8?B?aFpiK3V3L3ZCRUg2RzhXSllkZWpLRDlyVmM1UkNxSHExeW5YSlpuQkdoSEdw?=
 =?utf-8?B?SEk0MVJnTGhZQ1NKc0NZUzc1TUVnOTVzVU5LUGZEdVNTM2Z6QUE5aXRsK2My?=
 =?utf-8?B?cXhJWTNzcjhRYnVHdFRlbFUxemV1VUdDblgxY1JsMUR1bGRSMno1Y01wNTJn?=
 =?utf-8?B?eEpzbXkvb2tPRlVyenUrLzJTSCtXSmVVSXkwbUw1dVBWcEsrVWdTK1dNdjBo?=
 =?utf-8?B?bjhONGxodUZobFhFL1pVTTBNMUwva3dzR3Z6UlFuN0RTcUE4V1ZCamhvNUcw?=
 =?utf-8?B?ZC83NGF3RUJLNEkyYTBQb0ZST2RaT25wZGp3YTJGc0QxSzFtOE1JZVY0V0Nk?=
 =?utf-8?B?bEYvMUQrWURpRzZvbjc0Q2pENExKMkV4VXU2TGd6TXlVVzhLNE9Id25EaXhh?=
 =?utf-8?B?L1ZYNDlTc1pTT3FWajNGT0VFSnhScGh4Y29QTTh5ODB4U2ZlbzNEZ1hZL095?=
 =?utf-8?B?dzU4SWxCQUVZY1VGNDRkRGtVclpqYnZybExhRG5kQVpJRmp2eTM4YlZNeEZB?=
 =?utf-8?B?MlQyZk1OblNIOVFHaitrUUF1SVNaWVFjRlFZSVpTbmRiQmpjc0lZVm04QXJC?=
 =?utf-8?B?QisybjA3eVhaUFNocXJTdGR3UmpnRjBjMXp1SUVhOEUrSUlHUE13d2YxdDln?=
 =?utf-8?B?dGlKM0dTYVZRdFFYYmdEV2dkaXlONVZOYk9tSkYxdUtsMVp0ZHpBM2ZJek9M?=
 =?utf-8?B?MFpiT2xnVEFRdThyMVhBcUMzN0JlZklWSzVKTEVPejJuOGw3eHBvL0tONkFi?=
 =?utf-8?B?dVRJbmxPODQyRzlzRmJmb1lmRDFWcGFCdkZQUmZ5UFVuSG5tbVo5Sjd2bVdU?=
 =?utf-8?B?dGFQZjkvbUQ3TXdFcWZHWjlWbkhkV0M3L3l1QUxlK3dvUHphcml2d1ZjeUFW?=
 =?utf-8?B?YzBnR01GcWY5UmxjVEJGTTVQT3U0SzBhMW9Qdzl5VFBBenFwSStpOTFTbEw2?=
 =?utf-8?B?dE5tMG9sNHo3ZkhDK2dORlR1S0F5Wi9HN3c0bkpuRXZUVFFJbkdLRFk0dzUv?=
 =?utf-8?B?aUl0MW1pWjhUd3Z6TnlKUzFwcFhoVnZOaDFJQ2N2TnlNYU5iTDJrdldacnZD?=
 =?utf-8?B?UHRGemdmVHZtejErVkxsR3RrVUJzUmRZdEJ4dk40NzJuY2JDL0ZWRkJEMW1L?=
 =?utf-8?B?SUdkeXB5bWhyVG1WNTFHMmdJZVlkSzl2VEpQMGJUMnFGVGdwTWVoam14TTIw?=
 =?utf-8?B?QkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 26955f4e-230e-4b84-0c88-08daf280c24d
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2023 20:33:25.7161 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TKI22e6oj4wenNEbxgSp/hPHD5PtTOLHEKKxC8uDeeXaxrgwdBp8xlADz7ZPMKQPL8EFhsTpfHJpRXHfJi4H4evfaJ19ALFLRXl5LdgfUG4=
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
Cc: "Ewins, Jon" <jon.ewins@intel.com>, DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/9/2023 01:38, Jani Nikula wrote:
> On Fri, 06 Jan 2023, John Harrison <john.c.harrison@intel.com> wrote:
>> On 12/6/2022 03:06, Tvrtko Ursulin wrote:
>>> On 05/12/2022 18:44, Michal Wajdeczko wrote:
>>>> On 05.12.2022 14:16, Tvrtko Ursulin wrote:
>>>>> On 02/12/2022 20:14, John Harrison wrote:
>>>>> [snip]
>>>>>
>>>>>> Random meaningless (to me) message that is apparently a display thing:
>>>>>> drm_dbg_kms(&dev_priv->drm, "disabling %s\n", pll->info->name);
>>>>>> i915 0000:00:02.0: [drm:intel_disable_shared_dpll [i915]] disabling
>>>>>> PORT PLL B
>>>>> Plan is to not touch outside gt/.
>> For some unexplicable reason that means it is almost impossible to see
>> the actual problems in most CI dmesg logs because they are swamped with
>> irrelevant display messages that cannot be filtered out. For example, I
>> recently manually grep'd out all the display spam from a bug report log.
>> The dmesg file went from 12MB to 700KB. That is a significant problem
>> that makes bug triage way harder than it needs to be.
> You can adjust drm.debug module parameter to get rid of almost all
> display debugs. They're logged using the appropriate debug categories.
No, you can't. See above comment about 'most CI dmesg logs'. This is 
when trying to triage bugs created by the CI systems. In that case, the 
log already exists and it was generated at full debug and it is tens if 
not hundreds of MBs in size. And there is no single tag attached to the 
display messages to run 'grep -v' on. They are just a random collection 
of disparate function names.

John.

>
>
> BR,
> Jani.
>
>

