Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 681D966E72A
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jan 2023 20:41:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2590610E32A;
	Tue, 17 Jan 2023 19:41:05 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA6B110E32A;
 Tue, 17 Jan 2023 19:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673984463; x=1705520463;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+FS4+vxAA3x2SRxcqyFoLICRTF1t+HKyPXEthca56cs=;
 b=YiEwSa9CgSw6XJyriPtWg4pIcnAJvpb7zqu/f9uHLfI+pIYTWg0ElltC
 LHB1ndgFCV2JziwM6bT5961yjY1HwozGVGudPqb6ug7nwj2l2PQnDnpay
 AmpesEzUn0K5snLVlJZaAir4Mqq047LA7kpZfyAffThmGE03kvAAm7wq6
 lbv1RBGK0tLTScpy2X4hI00nNjIFiB01fB51nXNHgXRQB6q0p1mDNsX5c
 AqcK8cVgJ961Sea+fw2yBm8Qy/OkUDARdtEBf/lwqz7D/yBKjEj8r6eF8
 GXoHC0JdTuiVpT59A88wq5h8Vi9AK5G1o5x22lEbLI+lAx0mC79De9SGF Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10593"; a="352039831"
X-IronPort-AV: E=Sophos;i="5.97,224,1669104000"; d="scan'208";a="352039831"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2023 11:41:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10593"; a="988257210"
X-IronPort-AV: E=Sophos;i="5.97,224,1669104000"; d="scan'208";a="988257210"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga005.fm.intel.com with ESMTP; 17 Jan 2023 11:41:02 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 17 Jan 2023 11:41:02 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 17 Jan 2023 11:41:01 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Tue, 17 Jan 2023 11:41:01 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.45) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Tue, 17 Jan 2023 11:41:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PMj+hqc86Qrs1tgKsfEtMDwBZBwm410PB2mT0HMBRkpTBJ5ue+SJXsWUYqQHsqOhehCfPCtM9B1qaczWh3j79jEtYyJw6htiR+g/2W3W0dWb7TV8H3meyyhLriLxC6zDhUxZ1N4zei4XSNfgZ8GCRkElagsR7yIJXKvoMl7WlJg75c5VuTCVFNLPNLuKYDO8Sjkfk8BXnyefCI7Ey3Mqe0w0uaAHzfwpnsQcPN31icovNZEp86zavaVEV3CYAxa4kY74SEI+MW0uftGslMw4GJvDSu0LmXKh4s89wDNIN3f/dc3E4pXKzq3lyL/6IK7L81Uu4XXhLecCC+BbDvRbkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2pgZWV0IFD/ffHgScweMEhDQ+GGWSF9RiOnZlgZvZc0=;
 b=TOLiCnG/RJwDTEMbMAWVJ91ZUeajhVAlBp6zjYOUKt1ZjLyDAwMO4xIGBatMYMmiigXLv+kqnHLf30u6o7LZROmFZDizS3dCFTenYcPJcyj7lA/L1jbnBU58IOfXhccZGJXRJkGQUGo1n/M088Dshy8EJCBwDf5SSgUCsNJsZONKC63rVI1IW1Re09AfPi1V+M9I0ktId0TyWLyBC74EDFZFbVXs26JIheXeTx8k+zaYhXcVPeASVWj1QND+GSOqblGp0EfbDtohnQdes9vnH7V4TCOmp2f41kKMJfdmgS8QbfdWXBYiCejBDXtKLqqZs+txkptk8hRQAo65/dyg6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by SJ0PR11MB4989.namprd11.prod.outlook.com (2603:10b6:a03:2d9::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.23; Tue, 17 Jan
 2023 19:41:00 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::81f2:9a76:638:28eb]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::81f2:9a76:638:28eb%2]) with mapi id 15.20.5986.023; Tue, 17 Jan 2023
 19:41:00 +0000
Message-ID: <4bec6af7-90f5-46de-1df0-9af034662475@intel.com>
Date: Tue, 17 Jan 2023 11:40:57 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.6.1
Subject: Re: [Intel-gfx] [PATCH 1/4] drm/i915: Allow error capture without a
 request
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, "Hellstrom, Thomas"
 <thomas.hellstrom@intel.com>, "Intel-GFX@Lists.FreeDesktop.Org"
 <Intel-GFX@Lists.FreeDesktop.Org>
References: <20230112025311.2577084-1-John.C.Harrison@Intel.com>
 <20230112025311.2577084-2-John.C.Harrison@Intel.com>
 <f5edb1fa-6aba-1e02-f238-518518337f11@linux.intel.com>
 <79cd935a-5a7f-b709-ec05-c9cf5801f2dc@intel.com>
 <4acf4db5-97e9-34dc-2b89-517296ce4c3c@linux.intel.com>
 <7316954666eecb39aef79067bc590e58bee48389.camel@intel.com>
 <0b0f59dc-d50f-f491-ad0c-9030b799830e@intel.com>
 <75379a08-1a87-d3a3-01ee-781c73d40d6f@linux.intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <75379a08-1a87-d3a3-01ee-781c73d40d6f@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0225.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::20) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|SJ0PR11MB4989:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d30f7af-5ba9-4814-cbba-08daf8c2c28c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3UajWAh2KpqR9Gz1c5Lm91G89UJiyuDxHNU/KDVNYRFxnsEWYZwpKqyCUxXyjXtoPd6S+8NgpeY4f15n23TlL6/QPaRne5NRV2u6kUZoKEAljz8zpk4RJEgtSykpo1Bfl67DeaP44g+wNZujOvKjxYMXWRycbkZvmN8gaaMvN4yLJuMUFB7V1zlQMGn3Le0oG7BVQZukvw+bMGWOfc1j2dVWSECoQo0TpMq21WNYgwdA3+N46vLzQyUjy8nGsc8Q7jz8SMvdaVdwJnuYEjNUl89cwSxdMbwZ91vq1B0x/oy7JzBqVXyeD3uTlSEckDjrWTxS2gFrhBulqutODqY3BNGhSZZ4r8UpYBY9x+DHnst1Cr6//rnJ2L+v61+axWlGRJyw5TnHtTdyu4e2ZRwU0M0Odeq2wmASHhvV6W7YDc0koKVzYP8847+3qqIGhg5jHWVm/2R3l4FmNsv/cJT2kz8ehQW7xb0nCuBrWtWb8BiLaVKNi28S7atrI277XFVOeFCWTkpAtBL9nFwwpKfL6VhpxSbe+zpNrlsmyaLj5PN1Yi6ssn6u8DOZMArcOd2r2lhaWM0lZZ7dDsw3oKttGkfS3oxvfoyR2cl3hW16L/PfozCGDkEB6gZByYm4E+w9/k2JBmidjd5Gti6tLoWF/xDgcaC9M/ERu0YZWyqWQClFjB3Gi5X2kLqIg2oSXIjnXMRJre4dJ/iTyPrrB1W2KD6Qnyhy5PWBnScdpybaBNM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(39860400002)(376002)(346002)(396003)(366004)(136003)(451199015)(66899015)(31686004)(66946007)(6512007)(66476007)(66556008)(41300700001)(26005)(186003)(8676002)(4326008)(53546011)(2616005)(31696002)(36756003)(86362001)(5660300002)(82960400001)(8936002)(110136005)(478600001)(54906003)(6666004)(316002)(83380400001)(6506007)(38100700002)(6486002)(2906002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OU01S2R2YW52Vzg3bUJ2YkVSVVdpdUFFUjdsUGRpNUNkckRubStaRjhEUTlz?=
 =?utf-8?B?ajFCQnRqOXd5SmNnVXEwbkkrQlUzOTVCL3RUYWpJbGlhUERmNUhkZTdVckhh?=
 =?utf-8?B?MDNYU0U1MHF2UDM4akZjQVhiTU90d29ROFl4UUorUVl0ZjUvdklneTJ1N2lx?=
 =?utf-8?B?ME9LeFkyRFNSTkptcSt3QTN0aUVpZi9ueVpnWjlLZ2NSTDdvWFhjbkJQNGth?=
 =?utf-8?B?eW5tdWlvVnUwRXZIT3BJd1doTmJ6QUhJeFh1UEF6TWhrK1dKM002VGJzU2JQ?=
 =?utf-8?B?MVJjSUxmMjhpb05RcXlHTUdqN3NQbXFNSDJoSjF5aFBKWktVa1dzSVkzb0ty?=
 =?utf-8?B?TFJCNXN5SUZSM014UzNMTDJWTHNhNGZ5c2xPTk1IcUkrWm9JY2c5bndHL0VJ?=
 =?utf-8?B?ZFBJWDhZa014L25VbXdEaFVoaHNRZzlSVThseldGanNwMy94QWpXNXBsZGk3?=
 =?utf-8?B?UHRqcFo4eXBkT2hPN0IycU9KZ2RmODNSbERGcG5WTy9UME5qRmFJZ3BaNjdV?=
 =?utf-8?B?aDJkK0dEQXl6SDVlbWpGamg1bk5BUlpYMGdCU1JvNzJvWEVBYkxlaHhNdmkz?=
 =?utf-8?B?SzNvWFFPREhSOCtYZ05TdkdRV0tDeHZBZDB1U3BOcjIzekIwVzk4azVkNS9v?=
 =?utf-8?B?OVlTN2RSeDY5YUNXU0hrSTVwbmN6bFYzczA5WVZ0RHk5cmhPdzlWdGVoSk91?=
 =?utf-8?B?YVRNZTZyYzVIVEI3Qi83ZnB5RCtSZGcreW1wZUN5ckJBS2tTZFVObHdKcmhP?=
 =?utf-8?B?UnJZSEVZcDd4RElla04xYkpXZ2JXZGNOakhNQWl4UFBnYm9FdjRsZlB6QVVY?=
 =?utf-8?B?YzQxYlIxcDc4SWpZcDBmVVJsdlZhYlJybDZxbTRTRzJMaWNTM1JhM3lIeDhM?=
 =?utf-8?B?OW05VXZqWmVwSi81VFhaR3g1Y3ZuS1YwNkVaT1RoM2lXblBXRlh6bGFsYWFZ?=
 =?utf-8?B?UlBjbkljRlZBeUk2cUdJSDFqTFlscE1wcUprZDE0TE5UdUtKaGVna1k0Mk1i?=
 =?utf-8?B?cXRYLzk2aFY2TDFuRWtIb3Nva0VNbWRIMm5DeHBzS2Y1VVl5NGlMbjdGTFVV?=
 =?utf-8?B?aXRZaHVMajdIZy91cmMyUkFpNVNRVThVRnFEK1I4dkRJb2JuRXBjQXIwWWtU?=
 =?utf-8?B?bW1qZi9GK0x3ekdzSVA1cTQ1QStkRnl4OWE1Q2NMK0s3dDc4UDZ4SC9GOWxm?=
 =?utf-8?B?WW5YSyt1TXp5N3lJMWk0OXdJLytEVkI0M1hXNUFSeU5GQzVwcTE3K3MxVE1H?=
 =?utf-8?B?bHhzY2RHQVV2aklsZ3pVM1NmYUhpU3dDaitUYU9kNkhrc3JpRmI4QjNHNGNN?=
 =?utf-8?B?QVMydDN2UG9FNmxJbm9JclpOaE13aTR5bjdsK0J1RmxIVFFmN3UyUldxLys3?=
 =?utf-8?B?NmQ5MHJEMVpRcWduZFhJM1ovTExSL0lVeHVlQVNvVUpGZWNlcE9kRy9IbC9O?=
 =?utf-8?B?K1VVQzZ5eEtpRHplSThLUW9vNW5GY0FXREtXTnZOSWRJTktMaUF4NldmMXZS?=
 =?utf-8?B?ZFB3ajlLTWZWSXNLd0JyVWpUYVEzc3NaKzZ0eCtrUFBtZ1U2ZEpLMHNIZlM4?=
 =?utf-8?B?MFpjblJjdUNXVjNMMGdkT1FNRWtlYnY3Wi9sRU11MFU5ODZHQ09KVWxqcytn?=
 =?utf-8?B?dU9STmdFby9FTjZFeDlHWitGREttbTJ1dWd4RFZEbzM2SVVXYXBaWU1vMUR0?=
 =?utf-8?B?cjJNV0RGMGI5c01lWXJjTXVPUFJzUXVzK09SenZzdnVnMytQYlNVUEZuVS9O?=
 =?utf-8?B?cVp0cDg3cHpRaHREV3RjVVhUenZCQ1BVVVYrTldZc21DM1NvWFMvSGdoUHdM?=
 =?utf-8?B?VFhBSHZHS3dFNlJqZ2hqSVFhRTZIWTVrOENEN3d3R1plbFdIa1VKaTJiRkJB?=
 =?utf-8?B?U1NEWXJHSWxjZGhra2t3ZG0rdDd2MFRrbjgxSkswelV5V0lKcVR1cGJPSXdl?=
 =?utf-8?B?YkRmTWl4QXZVTmkvRFRURUprTElmWklVRVpOQnlZdXorUnQzVE9ZVnRQcDI2?=
 =?utf-8?B?YlBtWmFQR0dmNGVUU2lJWWdxTmNJNkRxNmxlMWl1Zno1Ny8vWkoxSUo0VmtX?=
 =?utf-8?B?aWd2QVFvQ0Fjb2N5ek9rYVM2b0ROQXgzbWpLTkp5ZEIvdkJKUGtTaEdOTTE4?=
 =?utf-8?B?RDVRS01tUlpIT2tHODJ1ekRDdnFVVExNUTk3cU1IL3paZDQ5eE9jK0FQQkIv?=
 =?utf-8?B?ZVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d30f7af-5ba9-4814-cbba-08daf8c2c28c
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2023 19:41:00.0353 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bovR9pa1odOpndx/spLj68JeOPChsvknqpTm+w9oNKtoDuR5tIG03t+WvvLNquPCPE4oppUjC52WvUf+ysjahMbDLeomHLDdel4a2rs4wG0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4989
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
Cc: "Auld, Matthew" <matthew.auld@intel.com>,
 "DRI-Devel@Lists.FreeDesktop.Org" <DRI-Devel@Lists.FreeDesktop.Org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/16/2023 04:38, Tvrtko Ursulin wrote:
> On 13/01/2023 21:29, John Harrison wrote:
>> On 1/13/2023 09:46, Hellstrom, Thomas wrote:
>>> On Fri, 2023-01-13 at 09:51 +0000, Tvrtko Ursulin wrote:
>>>> On 12/01/2023 20:40, John Harrison wrote:
>>>>> On 1/12/2023 02:01, Tvrtko Ursulin wrote:
>>>>>> On 12/01/2023 02:53, John.C.Harrison@Intel.com wrote:
>
> [snip]
>
>>>>>>> + engine->name);
>>>>>>> +            rq = NULL;
>>>>>>> +        }
>>>>>>>        } else {
>>>>>>>            /*
>>>>>>>             * Getting here with GuC enabled means it is a forced
>>>>>>> error
>>>>>>> capture
>>>>>>> @@ -1622,22 +1645,24 @@ capture_engine(struct intel_engine_cs
>>>>>>> *engine,
>>>>>>>                               flags);
>>>>>>>            }
>>>>>>>        }
>>>>>>> -    if (rq)
>>>>>>> +    if (rq) {
>>>>>>>            rq = i915_request_get_rcu(rq);
>>>>>>> +        capture = intel_engine_coredump_add_request(ee, rq,
>>>>>>> ATOMIC_MAYFAIL);
>>>>>>> +    } else if (ce) {
>>>>>>> +        capture = engine_coredump_add_context(ee, ce,
>>>>>>> ATOMIC_MAYFAIL);
>>>>>>> +    }
>>>>>>>    -    if (!rq)
>>>>>>> -        goto no_request_capture;
>>>>>>> -
>>>>>>> -    capture = intel_engine_coredump_add_request(ee, rq,
>>>>>>> ATOMIC_MAYFAIL);
>>>>>>>        if (!capture) {
>>>>>>> -        i915_request_put(rq);
>>>>>>> +        if (rq)
>>>>>>> +            i915_request_put(rq);
>>>>>>>            goto no_request_capture;
>>>>>>>        }
>>>>>>>        if (dump_flags & CORE_DUMP_FLAG_IS_GUC_CAPTURE)
>>>>>>> intel_guc_capture_get_matching_node(engine->gt, ee,
>>>>>>> ce);
>>>>>> This step requires non-NULL ce, so if you move it under the "else
>>>>>> if
>>>>>> (ce)" above then I *think* exit from the function can be
>>>>>> consolidated
>>>>>> to just:
>>>>>>
>>>>>> if (capture) {
>>>>>>      intel_engine_coredump_add_vma(ee, capture, compress);
>>>>>>      if (rq)
>>>>>>          i915_request_put(rq);
>>>>> Is there any reason the rq ref needs to be held during the add_vma
>>>>> call?
>>>>> Can it now just be moved earlier to be:
>>>>>       if (rq) {
>>>>>           rq = i915_request_get_rcu(rq);
>>>>>           capture = intel_engine_coredump_add_request(ee, rq,
>>>>> ATOMIC_MAYFAIL);
>>>>>           i915_request_put(rq);
>>>>>       }
>>>>>
>>>>> The internals of the request object are only touched in the above
>>>>> _add_request() code. The later _add_vma() call fiddles around with
>>>>> vmas
>>>>> that pulled from the request but the capture_vma code inside
>>>>> _add_request() has already copied everything, hasn't it? Or rather,
>>>>> it
>>>>> has grabbed its own private vma resource locks. So there is no
>>>>> requirement to keep the request itself around still?
>>> That sounds correct. It was some time ago since I worked with this code
>>> but when i started IIRC KASAN told me the request along with the whole
>>> capture list could disappear under us due to a parallel capture.
>>>
>>> So the request reference added then might cover a bit too much now that
>>> we also hold references on vma resources, which it looks like we do in
>>> intel_engine_coredump_add_vma().
>> So that means we end up with:
>>      rq = intel_context_find_active_request(ce);
>>      ...
>>      [test stuff like i915_request_started(rq)]
>>      ...
>>       if (rq) {
>>          rq = i915_request_get_rcu(rq);
>>          capture = intel_engine_coredump_add_request(ee, rq, 
>> ATOMIC_MAYFAIL);
>>          i915_request_put(rq);
>>      }
>>
>> What is special about coredump_add_request() that it needs the 
>> request to be extra locked for that call and only that call? If the 
>> request can magically vanish after being found then what protects the 
>> _started() query? For that matter, what stops the request_get_rcu() 
>> itself being called on a pointer that is no longer valid? And if we 
>> do actually have sufficient locking in place to prevent that, why 
>> doesn't that cover the coredump_add_request() usage?
>
> There is definitely a red flag there with the difference between the 
> if and else blocks at the top of capture_engine(). And funnily enough, 
> the first block appears to be GuC only. That is not obvious from the 
> code and should probably have a comment, or function names made 
> self-documenting.
In terms of 'red flag', you mean the apparent difference in locking in 
this section?
         ce = intel_engine_get_hung_context(engine);
         if (ce) {
                 intel_engine_clear_hung_context(engine);
                 rq = intel_context_find_active_request(ce);
                 if (!rq || !i915_request_started(rq))
                         goto no_request_capture;
         } else {
                 /*
                  * Getting here with GuC enabled means it is a forced 
error capture
                  * with no actual hang. So, no need to attempt the 
execlist search.
                  */
                 if (!intel_uc_uses_guc_submission(&engine->gt->uc)) {
spin_lock_irqsave(&engine->sched_engine->lock, flags);
                         rq = 
intel_engine_execlist_find_hung_request(engine);
spin_unlock_irqrestore(&engine->sched_engine->lock,
                                                flags);
                 }
         }

There is no actual locking difference. The first thing 
intel_context_find_active_request() does is to acquire the relevant 
spinlock for the list it is about to traverse. I assume 
intel_engine_execlist_find_hung_request() must be called from other 
places that already have the appropriate lock and hence the lock must be 
done externally for all callers.

Technically, the first part does not have to be GuC only. It is entirely 
possible that a future improvement to execlists would add support for 
tagging the hanging context up front without requiring a fresh search 
here (based on pre-emption timeouts, heartbeat timeouts, or whatever it 
was that decided to call the error capture code in the first place). So 
there is no reason to add unnecessary enforcement of backend 
implementation details to this higher level by marking that as GuC only. 
Whereas, the search for an individual request after the hang has 
happened is an execlist only implementation detail. Hence the 
enforcement that we don't do that for GuC (with comment to explain).

>
> I guess the special thing about intel_engine_coredump_add_request() is 
> that it dereferences the rq. So it is possibly 573ba126aef3 
> ("drm/i915/guc: Capture error state on context reset") which added a 
> bug where rq can be dereferenced with a reference held. Or perhaps 
> with the GuC backend there is a guarantee request cannot be retired 
> from elsewhere while error capture is examining it.
"added a bug where rq can be dereferenced with a reference held." <-- 
did you mean 'with' or 'without'? Dereferencing with a reference held 
sounds correct to me.

You are meaning the loop in intel_context_find_active_request()? It gets 
the lock on the list of requests that it is scanning through. Presumably 
requests can't vanish which they are on that list, they must have been 
reference counted when adding. So dereferencing within the list has to 
be safe, yes? The issue is that there needs to be an extra get on the 
reference that is returned before dropping the list lock. And that 
reference would have to be released by the caller. Yes? And likewise, 
the request_get that currently exists in capture_engine() needs to be 
inside the execlist spinlock. Which is how it used to be before the GuC 
support was added in the above patch. Or rather, there was no explicit 
request_get at all but all the request processing was done inside the 
execlist spinlock (which seems bad given that it would be allocating 
memory and such within the spinlock?!).

Presumably engine_dump_active_requests() is also broken. It asserts that 
the execlist spinlock is held but does nothing about the GuC's 
equivalent spinlock despite pulling a request of the GuC state's list 
and then doing lots of dereferencing on that. It will also need to have 
intel_context_find_active_request() return an extra reference count on 
the request (before dropping the GuC lock as described above) and then 
manually put the request iff it got it via the hung context route rather 
than the hung request route! Or more simply, also get a local reference 
in the hung request path and then just unconditionally put at the end.

Sound plausible?

>
> To unravel the error entry points into error capture, from execlists, 
> debugfs, ringbuffer, I don't have the time to remind myself how all 
> that works right now. Quite possibly at least some of those run async 
> to the GPU so must be safe against parallel request retirement. So I 
> don't know if the i915_request_get_rcu safe in all those cases without 
> spending some time to refresh my knowledge a bit.
>
> Sounds like the best plan is not to change this too much - just leave 
> the scope of reference held as is and ideally eliminate the necessary 
> goto labels. AFAIR that should be doable without changing anything 
> real and unblock these improvements.
Hmm. If you want it all left unchanged, I don't think you can eliminate 
the goto. But it seems like the fix is to move the existing get into the 
execlist only spinlock and add a new get to 
intel_context_find_active_request(). Then everything should be 
guaranteed protected at all times.

John.

>
> Regards,
>
> Tvrtko

