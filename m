Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4FAF4C785D
	for <lists+dri-devel@lfdr.de>; Mon, 28 Feb 2022 19:55:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56FF210E351;
	Mon, 28 Feb 2022 18:55:24 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3815510E351;
 Mon, 28 Feb 2022 18:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646074523; x=1677610523;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=yX6IwK9pHAdtg3v2bsu3r/hCpLHAjPXf8moqHcl00Bk=;
 b=M/H9M0q8fECIYK6BdAx2eWPFjE8nL7c0oFQQUZaBjtX8JOhtFoflbwCY
 /OSsMrIQzapLWLs9JgallavZE+IIBq4ZPSAU3QMQM4jzPVh5w2KMY5AvL
 lGGpnFBaEepJUGsPGV9KtQge633IEVR4zUesKDEKFH/fQpUf7UCwrlz1M
 BLwiOQpth6WvdQLXPgj40SJ9Sr0dWmK7MafCl9dG+LO+Zrzaznu0JA9a/
 YpqBW7NzTywXuckFoNVTNhr/wG+GdHCw0QLehvvdqnzs4wucFUbBiZG2Y
 6eqOaShX6CxOxXESY0+Sb3NYZYv6NWd307AEbl0miBk+zQg9S50y8L9mz Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10272"; a="316173869"
X-IronPort-AV: E=Sophos;i="5.90,144,1643702400"; d="scan'208";a="316173869"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2022 10:55:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,144,1643702400"; d="scan'208";a="534567636"
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
 by orsmga007.jf.intel.com with ESMTP; 28 Feb 2022 10:55:22 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Mon, 28 Feb 2022 10:55:22 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Mon, 28 Feb 2022 10:55:22 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.109)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Mon, 28 Feb 2022 10:55:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YsHqLoPbsa7NvZ6SahDMoRcrMNUdPi7dtnjlLY5/EjUfD/J2/12ZB2L+aXrJE00DrnM6UCXo/sz5VPVU1Y8zSAm8JA1aU0dluLxEpEzj49MqzoEikYZxy2E8f6HV2/Ziavagfabo274GOVdeZR1Q6O2MEAoNRI+JQ1G3fAefoaW/HUYt+P2cnNhMnHwKrB+eGPd8twZ+uUILjUPkunk8/H3Ymxts7NvkkaRidh2gsGumYalpH5ZJP0kFWHnZIvbZIXBO9HTJz1le+qqVvSTxScaWQAnkeChsjQDr+pUlSWv3vfki4v89KwirU5G5XLGriWfaI1a++n/p0huMN/YOVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7NfQI74HJR+BrLvMt7YwbtLCIWT2/IlMMby6Xec8z6c=;
 b=g5jZv/Oks3oDj9f600ZWhgpHkfeOkieqcm53pz7/KrTIjUQN8GYwo0ixPcJYNcprwj2a/rNb0dIsv7iq6c2+nFCcwNSN7TbbhLFeMXQ1ARuoHti1erMW0ZYBT8JixGRDlckJ6xkmEBrhO0U2u9O4oHDvXAmAaZIGP8vTTCeWm66U69+MAqVdMWXxBMuUZznLqGTOfTfVHSZH6rT4QGmZqfQJQS+aBN66WKg3W2lSIirvcUtE+eC8U+WU9kM9MaB9QHUuUsGnLCIUwSovBpX8p6l48FzJLso1/8eZIYXG3o+9t9NMyWEjikHgJBGMdNFemM6jCqSJWiljtmiWMWjNAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by MWHPR11MB1582.namprd11.prod.outlook.com (2603:10b6:301:c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.25; Mon, 28 Feb
 2022 18:55:19 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::dd36:1843:a629:4ad7]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::dd36:1843:a629:4ad7%4]) with mapi id 15.20.5017.027; Mon, 28 Feb 2022
 18:55:19 +0000
Message-ID: <9df22764-db87-a2d2-2b03-52b4d4c6da9c@intel.com>
Date: Mon, 28 Feb 2022 10:55:17 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.6.1
Subject: Re: [Intel-gfx] [PATCH 2/3] drm/i915/gt: Make the heartbeat play nice
 with long pre-emption timeouts
Content-Language: en-GB
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 <Intel-GFX@Lists.FreeDesktop.Org>
References: <20220218213307.1338478-1-John.C.Harrison@Intel.com>
 <20220218213307.1338478-3-John.C.Harrison@Intel.com>
 <2a486991-1bfd-9b23-0b43-9173d17b7e13@linux.intel.com>
 <e95e8710-8410-2869-dec1-7f7a9e9a74fb@intel.com>
 <18205069-1210-745f-3bcc-2eddb0d17da1@linux.intel.com>
 <94e9889d-d71a-1428-516d-2928807cbf43@intel.com>
 <6ee75384-2cf0-6b34-ed54-3c7dc9ca31a3@linux.intel.com>
 <d6624800-87b0-f992-bc83-868744e2839c@intel.com>
 <ed505a8e-2d2b-135b-aaab-7e4a0befd5ba@linux.intel.com>
 <f6c70184-121e-9a2b-6bbc-54a67af293cc@intel.com>
 <96b7ce40-12f1-9ca0-1c5a-323d63dd8153@linux.intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <96b7ce40-12f1-9ca0-1c5a-323d63dd8153@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MWHPR15CA0038.namprd15.prod.outlook.com
 (2603:10b6:300:ad::24) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 491fe901-5445-4c76-6785-08d9faebdde7
X-MS-TrafficTypeDiagnostic: MWHPR11MB1582:EE_
X-Microsoft-Antispam-PRVS: <MWHPR11MB1582033E72D827D60C83E363BD019@MWHPR11MB1582.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +kDSeyuCId2czAnP/INokcXRrb5ysp+h0LlscaPhBzW15JVU6HNqyVX7qtLOcgdX3TfbKSe+yrDi26Za9Qs/HwCyrT3q2Dv4ykPFkn53Ptm2U5D0n1sHiTVslH4gvLSQWWyo+JfjPZRjwWcftFhO5jrTxWsDfT+qCw8gTCpENwFISXKxU1LdOy7hqWCK2/8yaErqDN8+aySMO/JuyxRjkcOzbOQnnZERoRWOoT5rZnTNFL66Cp8l46EPsUhkRLoFedkiXbvWVYu0cLjdOVUmYMr6isKEmy0qFTm9puFlJcMzbVkg7ZNEu1UMNpDblqP80kMl85E7fILlO3Oprf/Cz4C2p4R5azdp4OxxVUaQ4dmAQoB/URTtc2A2d5LMv1CmHPr5/NmSy6UwIFaetNUQFyrwU44mjXsqZXYXBC60CuHdPoMa6jQGpYQCxjUDZ4BLZvY4YMvUDQ+VTb+KKux34YKM0Gd3an/pyqmjejrXrxzHuHy6HkQLD1LXRaaW+yeXem+s4pzWdy/TXdGN3DkFtTuxgGWO57bhx3q59JJBCGX+aWJlfBWL0rD6g1JWGpME+cEdcaabRfZPPHObu2B/NeinGZOrZMPBMUNEhyEm9afI2Ca3lpPXYsewk/vdkjx59e8ZGFhFlcwIm80hNz2M0cfY7oOgfVzHAC5uKFWXbABMxtHiwmfutZGiv4pABbYDTBgXoT4FVfS2wsMk7fk4tjgm146jS8N6Y+wdN6LCq5IzTUraOB0qEWNrJ2CYqUMQ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(31696002)(6486002)(66946007)(508600001)(83380400001)(31686004)(4326008)(8676002)(66476007)(66556008)(86362001)(36756003)(6506007)(53546011)(82960400001)(38100700002)(8936002)(6512007)(316002)(5660300002)(26005)(2906002)(186003)(30864003)(2616005)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QXJnNndHanJBOUJIaGtidlhYQ0lBalBTeGR4Wll2NzVCbi81Y0t6d1g2YzJr?=
 =?utf-8?B?di9nS3JHMVl5THZyNEM2cVRwbElhV3pVWmlKVUh2NkErZUl6U241WFEwVEVF?=
 =?utf-8?B?L0s5TXlGdzZPQkhQdlRJdVdYZUh6WU5uTXFTTUlQZTlLRytlSUtFVXVacjda?=
 =?utf-8?B?MmFHbkV3dXZoSDNmbjFSbWtWbnlpRWtHV0RxUWhmb1lna1BHb1JHcmRUT1c3?=
 =?utf-8?B?Z0wzZERZOU4zN0VqQVRxNTJQRjRBRVdhRHNTMHJad2l0MnYydWVnaDVvbzRr?=
 =?utf-8?B?Z2krbkRlK2tLOS9GY1RiQ0RTdEMzRk4rUFN0Z3Y4eU5KcHU5Q1RCdERTRWdJ?=
 =?utf-8?B?SU5lU01WSlpJVlJocHNrQnloSWtkeEh1YngwWWJwdXRBMHY3SGRYNlNLS1dS?=
 =?utf-8?B?QXZGY1FkUUpHNS9EeHB5ZjUvSmp2ZHV1dC9aNWN6dnhLQzBmdEJVTW9aN1Zq?=
 =?utf-8?B?YlFheU5vMXBhTXUrZkdmU1NBZ3pzaDIwemV2SDhHRFZYeGlmcjgySjZ1czRi?=
 =?utf-8?B?Z1NkV09yMGJDSlJWbWQvK3ZaaW8xY3hLcGtnOUhqazE0NHZqMHBRZ2Q0dFpZ?=
 =?utf-8?B?RWJra2pOV0YyUExkU2hyM2JkeFpkWkVRSmNKeDhPZTAxdngvbnlVdXBtbWdz?=
 =?utf-8?B?ak40NVY0NzNEOElxYjlBVFBDRFAzQkhVcHBoVGdVd2k3RU5iMkppc0Z6M0hK?=
 =?utf-8?B?T2I5WUtLOWhubC9QUVVBb1dvcmhDT1JjeWlQOFM0bGFDeXNwLy81YWNYT3VG?=
 =?utf-8?B?Z0F2RXR2RThGWUJISlBsaGtjRTdmb0ViRnBDUUdvckhjMEZrUlVvSlVWdGxp?=
 =?utf-8?B?MXVJYWJMQTFQeHRXU2hLOTdCeHIwU09DZzM4RFZ2MTdtY1I3SHlXendyWkRF?=
 =?utf-8?B?akNhajZBbW9pN0p6WVZhTHlwTW9YR1cwbmVzTzBwYStlc0loU0wwbWhha1Fs?=
 =?utf-8?B?a0FJcE02b0hEK1RuYjZ4UStpSU9RejZKR1pyKytWSXNTckFNQWpzS3pOa2Vz?=
 =?utf-8?B?Yk16TExhdjlrQlFVclM5Q3NiUm1lWGpYcS9iZ1JiVVRzeTg3TmF6dGY5bmln?=
 =?utf-8?B?Q2xoM1RoRGxkV0M1VjZOajJaSW1Sbll5RC9qWER1Q2tVMVpkajdGSk91eXEw?=
 =?utf-8?B?cytMMlJtT3JXcTZ4Y2pWeUpBZjVjWEx0dGRzNVJrSnFkcWRRUjBxaFZWb3Ev?=
 =?utf-8?B?b3dVMHlDc3ovYlZPNXBSaVpGNEs1Q1dXNW9RWmdveTZKZ2kzdENMTkhEYXpU?=
 =?utf-8?B?L1ZzNVJZYVVXbzFKalVQVFdRczdvazV5cUVhcndObXlwdk9kTVc2SnE3TEJU?=
 =?utf-8?B?TE56VCt3eWFUeGM1S1dLamQvaUZWV0ovZCtyVTJCVFEreFErVXFkR29xMHc4?=
 =?utf-8?B?dE52V1lDcitQUWE4NEpwU290b2IvL1FNd3BQOXBmMDI3ejRtZjY0azlqclBj?=
 =?utf-8?B?a3hid3hxTTBLNGZYQ1hJQWxkTFlLZktWZi9yUDEyK0hVUmd4V1FLMlRGQVZw?=
 =?utf-8?B?UlkrVmFhZVhsMTgxeDVmeEZzbFNGVmxEMXFFcWUyUzhZOFBvYjl1UTNWRDdp?=
 =?utf-8?B?ZnBzbXQ0Y3RYK3p4bDFzaTgrT2JjRVpUc1Y3eld1VW5PNTZKcmZpcUZtbTNs?=
 =?utf-8?B?VUNTbWNrMEtPVFFuaTFhQVBsUTBIWWVWYU45NHZtMUs3NjFMZ2pDZmJrMmxz?=
 =?utf-8?B?TXQ3dkNWUEI1enFwc3V5R2YyVDEyQ2VXb01HMkZUU2hmcHFpaDB5NXQ1Nk0v?=
 =?utf-8?B?bm5rWndEZzZ6N2RPVkV2RFF3aTVERWdYQkU5b29DS00vQzUrcDFPbG9vYzZu?=
 =?utf-8?B?VVpMUFZmeHp3SUNIaTY4Y2o2MWwvZFRSclY2aCtKeTdhemtqMEdJeVdDRTJp?=
 =?utf-8?B?TkIvMEhNN0NFK0xzNWMxdzVhZmtnNkhKZEtmOTEyRWM5YkRuaHpHQmhsMlNO?=
 =?utf-8?B?OGRzQUN3L0tBYk1XSkZmM25UVkMxNVMwbmUzaXppcVFUbTlHMGRXT3JmamlZ?=
 =?utf-8?B?cnZzY3NoUHUxbVAzaHYzUXZSY0xickRFMXd3WC9ITUhib1R3dFppOVpOTmJF?=
 =?utf-8?B?cFdUMUZON1JoTU83eUxqWTZGb1B2YjJRTHZWU0tYRlRJeUxWN0FtT2pqUFRJ?=
 =?utf-8?B?N05NOEZabTdYMGhkUzI4VTNzVERQRE9McngyYU9BZXR1clBYYkpBR2pMc3Vl?=
 =?utf-8?B?eWFwVEdJckhXTWFvbDA0YkUwMlVoY245M1NiMTY5WFp6N2hVd2lRTXNwbW5t?=
 =?utf-8?Q?fjPKeXxz6CBarZxqnyurZq8phHMTY/GYEUsn0A87aU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 491fe901-5445-4c76-6785-08d9faebdde7
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2022 18:55:19.8230 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 39PadrQMfsBpAMHeOIEpmkooPhOBFV4jQPYEF2ujXVVbKJk9pJFegRwCFvns4YQhL9C/aALC8CrbbsFW2ksnC8Zg8u99Q7bZ2hIPcAJGJDA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1582
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

On 2/28/2022 09:12, Tvrtko Ursulin wrote:
> On 25/02/2022 18:48, John Harrison wrote:
>> On 2/25/2022 10:14, Tvrtko Ursulin wrote:
>>>
>>> I'll try to simplify the discussion here:
>>>
>>> On 24/02/2022 19:45, John Harrison wrote:
>>>> On 2/24/2022 03:41, Tvrtko Ursulin wrote:
>>>>> On 23/02/2022 20:00, John Harrison wrote:
>>>>>> On 2/23/2022 05:58, Tvrtko Ursulin wrote:
>>>>>>> On 23/02/2022 02:45, John Harrison wrote:
>>>>>>>> On 2/22/2022 03:19, Tvrtko Ursulin wrote:
>>>>>>>>> On 18/02/2022 21:33, John.C.Harrison@Intel.com wrote:
>>>>>>>>>> From: John Harrison <John.C.Harrison@Intel.com>
>>>>>>>>>>
>>>>>>>>>> Compute workloads are inherantly not pre-emptible for long 
>>>>>>>>>> periods on
>>>>>>>>>> current hardware. As a workaround for this, the pre-emption 
>>>>>>>>>> timeout
>>>>>>>>>> for compute capable engines was disabled. This is undesirable 
>>>>>>>>>> with GuC
>>>>>>>>>> submission as it prevents per engine reset of hung contexts. 
>>>>>>>>>> Hence the
>>>>>>>>>> next patch will re-enable the timeout but bumped up by an 
>>>>>>>>>> order of
>>>>>>>>>> magnititude.
>>>>>>>>>
>>>>>>>>> (Some typos above.)
>>>>>>>> I'm spotting 'inherently' but not anything else.
>>>>>>>
>>>>>>> Magnititude! O;)
>>>>>> Doh!
>>>>>>
>>>>>> [snip]
>>>>>>
>>>>>>>> Whereas, bumping all heartbeat periods to be greater than the 
>>>>>>>> pre-emption timeout is wasteful and unnecessary. That leads to 
>>>>>>>> a total heartbeat time of about a minute. Which is a very long 
>>>>>>>> time to wait for a hang to be detected and recovered. 
>>>>>>>> Especially when the official limit on a context responding to 
>>>>>>>> an 'are you dead' query is only 7.5 seconds.
>>>>>>>
>>>>>>> Not sure how did you get one minute?
>>>>>> 7.5 * 2 (to be safe) = 15. 15 * 5 (number of heartbeat periods) = 
>>>>>> 75 => 1 minute 15 seconds
>>>>>>
>>>>>> Even ignoring any safety factor and just going with 7.5 * 5 still 
>>>>>> gets you to 37.5 seconds which is over a half a minute and likely 
>>>>>> to race.
>>>>>
>>>>> Ah because my starting point is there should be no preempt timeout 
>>>>> = heartbeat * 3, I just think that's too ugly.
>>>> Then complain at the hardware designers to give us mid-thread 
>>>> pre-emption back. The heartbeat is only one source of pre-emption 
>>>> events. For example, a user can be running multiple contexts in 
>>>> parallel and expecting them to time slice on a single engine. Or 
>>>> maybe a user is just running one compute task in the background but 
>>>> is doing render work in the foreground. Etc.
>>>>
>>>> There was a reason the original hack was to disable pre-emption 
>>>> rather than increase the heartbeat. This is simply a slightly less 
>>>> ugly version of the same hack. And unfortunately, the basic idea of 
>>>> the hack is non-negotiable.
>>>>
>>>> As per other comments, 'tP(RCS) = tH *3' or 'tP(RCS) = tP(default) 
>>>> * 12' or 'tP(RCS) = 7500' are the available options. Given that the 
>>>> heartbeat is the ever present hard limit, it seems most plausible 
>>>> to base the hack on that. Any of the others works, though. Although 
>>>> I think a explicit hardcoded value is the most ugly. I guess the 
>>>> other option is to add CONFIG_DRM_I915_PREEMPT_TIMEOUT_COMPUTE and 
>>>> default that to 7500.
>>>>
>>>> Take your pick. But 640ms is not allowed.
>>>>
>>>>>
>>>>>>> Regardless, crux of argument was to avoid GuC engine reset and 
>>>>>>> heartbeat reset racing with each other, and to do that by 
>>>>>>> considering the preempt timeout with the heartbeat interval. I 
>>>>>>> was thinking about this scenario in this series:
>>>>>>>
>>>>>>> [Please use fixed width font and no line wrap to view.]
>>>>>>>
>>>>>>> A)
>>>>>>>
>>>>>>> tP = preempt timeout
>>>>>>> tH = hearbeat interval
>>>>>>>
>>>>>>> tP = 3 * tH
>>>>>>>
>>>>>>> 1) Background load = I915_PRIORITY_DISPLAY
>>>>>>>
>>>>>>> <-- [tH] --> Pulse1 <-- [tH] --> Pulse2 <-- [tH] --> Pulse3 
>>>>>>> <---- [2 * tH] ----> FULL RESET
>>>>>>> |
>>>>>>> \- preemption triggered, tP = 3 * tH ------\
>>>>>>> \-> preempt timeout would hit here
>>>>>>>
>>>>>>> Here we have collateral damage due full reset, since we can't 
>>>>>>> tell GuC to reset just one engine and we fudged tP just to 
>>>>>>> "account" for heartbeats.
>>>>>> You are missing the whole point of the patch series which is that 
>>>>>> the last heartbeat period is '2 * tP' not '2 * tH'.
>>>>>> +        longer = READ_ONCE(engine->props.preempt_timeout_ms) * 2;
>>>>>>
>>>>>> By making the last period double the pre-emption timeout, it is 
>>>>>> guaranteed that the FULL RESET stage cannot be hit before the 
>>>>>> hardware has attempted and timed-out on at least one pre-emption.
>>>>>
>>>>> Oh well :) that probably means the overall scheme is too odd for 
>>>>> me. tp = 3tH and last pulse after 2tP I mean.
>>>> To be accurate, it is 'tP(RCS) = 3 * tH(default); tH(final) = 
>>>> tP(current) * 2;'. Seems fairly straight forward to me. It's not a 
>>>> recursive definition or anything like that. It gives us a total 
>>>> heartbeat timeout that is close to the original version but still 
>>>> allows at least one pre-emption event.
>>>>
>>>>>
>>>>>> [snip]
>>>>>>
>>>>>>
>>>>>>> <-- [tH] --> Pulse1 <-- [tH] --> Pulse2 <-- [tH] --> Pulse3 
>>>>>>> <---- [2 * tH] ----> full reset would be here
>>>>>>>                |
>>>>>>>                \- preemption triggered, tP = 3 * tH 
>>>>>>> ----------------\
>>>>>>> \-> Preempt timeout reset
>>>>>>>
>>>>>>> Here is is kind of least worse, but question is why we fudged tP 
>>>>>>> when it gives us nothing good in this case.
>>>>>>>
>>>>>> The point of fudging tP(RCS) is to give compute workloads longer 
>>>>>> to reach a pre-emptible point (given that EU walkers are 
>>>>>> basically not pre-emptible). The reason for doing the fudge is 
>>>>>> not connected to the heartbeat at all. The fact that it causes 
>>>>>> problems for the heartbeat is an undesired side effect.
>>>>>>
>>>>>> Note that the use of 'tP(RCS) = tH * 3' was just an arbitrary 
>>>>>> calculation that gave us something that all interested parties 
>>>>>> were vaguely happy with. It could just as easily be a fixed, hard 
>>>>>> coded value of 7.5s but having it based on something configurable 
>>>>>> seemed more sensible. The other option was 'tP(RCS) = tP * 12' 
>>>>>> but that felt more arbitrary than basing it on the average 
>>>>>> heartbeat timeout. As in, three heartbeat periods is about what a 
>>>>>> normal prio task gets before it gets pre-empted by the heartbeat. 
>>>>>> So using that for general purpose pre-emptions (e.g. time slicing 
>>>>>> between multiple user apps) seems reasonable.
>>>>>
>>>>> I think the fact you say tP fudge is not related to heartbeats and 
>>>>> then go to mention heartbeat even in the "formula" which uses no 
>>>>> tH is saying something (at least that's how I read the 7.5s 
>>>>> option). :)
>>>> I said the tP fudge is not because of the heartbeat. It is 
>>>> obviously related.
>>>>
>>>> As per comment above, the fudge factor is based on the heartbeat 
>>>> because the heartbeat is the ultimate limit. But the *reason* for 
>>>> the fudge fact has nothing to do with the heartbeat. It is required 
>>>> even if heartbeats are disabled.
>>>>
>>>>>
>>>>>>> B)
>>>>>>>
>>>>>>> Instead, my idea to account for preempt timeout when calculating 
>>>>>>> when to schedule next hearbeat would look like this:
>>>>>>>
>>>>>>> First of all tP can be left at a large value unrelated to tH. 
>>>>>>> Lets say tP = 640ms. tH stays 2.5s.
>>>>>> 640ms is not 'large'. The requirement is either zero (disabled) 
>>>>>> or region of 7.5s. The 640ms figure is the default for 
>>>>>> non-compute engines. Anything that can run EUs needs to be 'huge'.
>>>>>>
>>>>>>
>>>>>>>
>>>>>>> 1) Background load = I915_PRIORITY_DISPLAY
>>>>>>>
>>>>>>> <-- [tH + tP] --> Pulse1 <-- [tH + tP] --> Pulse2 <-- [tH + tP] 
>>>>>>> --> Pulse3 <-- [tH + tP] --> full reset would be here
>>>>>> Sure, this works but each period is now 2.5 + 7.5 = 10s. The full 
>>>>>> five periods is therefore 50s, which is practically a minute.
>>>>>
>>>>> No, in my proposal it is 3 * (2.5s + 640ms) =~ 9.3s.
>>>> Not good enough. After 2.5s, we send a pulse. After a further 640ms 
>>>> we perform an engine reset. That means your compute workload had 
>>>> only 640ms after being told to pre-empt to reach a pre-emption 
>>>> point. That won't work. It needs to be multiple seconds.
>>>>
>>>>>
>>>>>> [snip]
>>>>>>
>>>>>>> Am I missing some requirement or you see another problem with 
>>>>>>> this idea?
>>>>>>>
>>>>>>>>> On a related topic, if GuC engine resets stop working when 
>>>>>>>>> preempt timeout is set to zero - I think we need to somehow 
>>>>>>>>> let the user know if they try to tweak it via sysfs. Perhaps 
>>>>>>>>> go as far as -EINVAL in GuC mode, if i915.reset has not 
>>>>>>>>> explicitly disabled engine resets.
>>>>>>>> Define 'stops working'. The definition of the sysfs interface 
>>>>>>>> is that a value of zero disables pre-emption. If you don't have 
>>>>>>>> pre-emption and your hang detection mechanism relies on 
>>>>>>>> pre-emption then you don't have a hang detection mechanism 
>>>>>>>> either. If the user really wants to allow 
>>>>>>>
>>>>>>> By stops working I meant that it stops working. :)
>>>>>>>
>>>>>>> With execlist one can disable preempt timeout and "stopped 
>>>>>>> heartbeat" can still reset the stuck engine and so avoid 
>>>>>>> collateral damage. With GuC it appears this is not possible. So 
>>>>>>> I was thinking this is something worthy a log notice.
>>>>>>>
>>>>>>>> their context to run forever and never be pre-empted then that 
>>>>>>>> means they also don't want it to be reset arbitrarily. Which 
>>>>>>>> means they would also be disabling the heartbeat timer as well. 
>>>>>>>> Indeed, this is what we 
>>>>>>>
>>>>>>> I don't think so. Preempt timeout is disabled already on TGL/RCS 
>>>>>>> upstream but hearbeat is not and so hangcheck still works.
>>>>>> The pre-emption disable in upstream is not a valid solution for 
>>>>>> compute customers. It is a worst-of-all-worlds hack for general 
>>>>>> usage. As noted already, any actual compute specific customer is 
>>>>>> advised to disable all forms of reset and do their hang detection 
>>>>>> manually. A slightly less worse hack for customers that are not 
>>>>>> actually running long compute workloads (i.e. the vast majority 
>>>>>> of end users) is to just use a long pre-emption timeout.
>>>>>
>>>>> If disabled preemption timeout is worst of all words and compute 
>>>>> needs to disable heartbeat as well then why did we put it in? 
>>>>> Perhaps it was not know at the time it would not be good enough. 
>>>>> But anyway, do I read you correct that current thinking is it 
>>>>> would be better to leave it at default 640ms?
>>>> No. We cannot have the RCS default to 640ms.
>>>>
>>>> Note that there is a difference between 'general end user who might 
>>>> run some compute' and 'compute focused customer'. The driver 
>>>> defaults (disabled or 7500ms) are for the general user who gets the 
>>>> out-of-the-box experience and expects to be able to run 'normal' 
>>>> workloads without hitting problems. I.e. they expect hung tasks to 
>>>> get reset in a timely manner and while they might run some AI or 
>>>> other compute workloads, they are not a HPC datacenter. Whereas the 
>>>> compute datacenter customer expects their workloads to run for 
>>>> arbitrarily long times (minutes, hours, maybe even days) without 
>>>> being arbitrarily killed. Those customers will be explicitly 
>>>> configuring their datacenter server for that scenario and thus 
>>>> don't care what the defaults are.
>>>
>>> Okay maybe I misunderstood what you were saying earlier about worst 
>>> of all worlds and all. But tell me this, if preemption timeout on 
>>> RCS is not directly related to hearbeats, but to some pessimistic 
>>> expected user workloads, what is wrong with my scheme of calculating 
>>> the next heartbeat pulse as tH + tP?
>>>
>>> We can leave tH as default 2.5s and tP you set for RCS to 12s if 
>>> that is what you say is required. Or whatever long value really.
>>>
>>> Your only objection is that ends up with too long total time before 
>>> reset? Or something else as well?
>> An unnecessarily long total heartbeat timeout is the main objection. 
>> (2.5 + 12) * 5 = 72.5 seconds. That is a massive change from the 
>> current 12.5s.
>>
>> If we are happy with that huge increase then fine. But I'm pretty 
>> sure you are going to get a lot more bug reports about hung systems 
>> not recovering. 10-20s is just about long enough for someone to wait 
>> before leaning on the power button of their machine. Over a minute is 
>> not. That kind of delay is going to cause support issues.
>
> Sorry I wrote 12s, while you actually said tP * 12, so 7.68s, chosen 
> just so it is longer than tH * 3?
>
> And how do you keep coming up with factor of five? Isn't it four 
> periods before "heartbeat stopped"? (Prio normal, hearbeat, barrier 
> and then reset.)
Prio starts at low not normal.

>
> From the point of view of user experience I agree reasonable 
> responsiveness is needed before user "reaches for the power button".
>
> In your proposal we are talking about 3 * 2.5s + 2 * 7.5s, so 22.5s.
>
> Question of workloads.. what is the actual preempt timeout compute is 
> happy with? And I don't mean compute setups with disabled hangcheck, 
> which you say they want anyway, but if we target defaults for end 
> users. Do we have some numbers on what they are likely to run?
Not that I have ever seen. This is all just finger in the air stuff. I 
don't recall if we invented the number and the compute people agreed 
with it or if they proposed the number to us.

>
> What if we gave them a default of 2.5s? That would be 4 * (2.5s + 
> 2.5s) = 20s worst case until reset, comparable to your proposal. Are 
> there realistic workloads which are non-preemptable for 2.5s? I am 
> having hard time imagining someone would run them on a general purpose 
> desktop since it would mean frozen and unusable UI anyway.
>
> Advantage still being in my mind that there would be no fudging of 
> timeouts during driver load and heartbeat periods depending on 
> priority. To me it feels more plausible to account for preempt timeout 
> in heartbeat pulses that to calculate preempt timeout to be longer 
> than hearbeat pulses, just to avoid races between the two.
Except that when the user asks for a heartbeat period of 2.5s you are 
actually setting it to 5s. How is that not a major fudge that is totally 
disregarding the user's request?


>
>>> It's long but it is correct in a way. Because we can't expect 
>>> hearbeat to react quicker than the interval + preempt timeout (or 
>>> timeslice for equal priority) + some scheduling latency.
>>>
>>> I conceptually disagree with the last hearbeat pulse being special. 
>>> If the user concept is "after N heartbeats you are out" and you want 
>>> to make it "after N-1 heartbeats plus 2 preemption periods you are 
>>> out", where preemption period actually depends on heartbeat period, 
>>> then that sounds really convoluted to me.
>>>
>>> And we don't know which of the pulses will trigger preemption since 
>>> user priority we don't control. So low priority compute task gets 
>>> reset after 5s, normal priority gets to run for 12s. Effectively 
>>> making context priority a variable in hangcheck.
>> It already is. That is no different. The pre-emption is not triggered 
>> until the pulse is of equal or higher priority than the busy task. 
>> That is the case no matter whether you are running GuC or execlist, 
>> whether you have the original driver or an updated one.
>>
>> And it doesn't matter which pulse triggers the pre-emption. All that 
>> matters is that once a pre-emption is attempted, if the busy context 
>> fails to relinquish the hardware within the pre-emption timeout limit 
>> then it will be forcibly evicted.
>>
>>
>>>
>>>>>
>>>>> If so, if we went with my proposal, would everyone be happy? If 
>>>>> yes, isn't it a simpler scheme? No special casing when setting the 
>>>>> preempt timeout, no special casing of the last heartbeat pulse. 
>>>>> Works predictably regardless of the priority of the hypothetical 
>>>>> non-preemptible workload.
>>>> No, we have to have the increased pre-emption timeout. And that has 
>>>> ripple effects of making very long heartbeats or risking races with 
>>>> the heartbeat beating the per engine reset.
>>>>
>>>>
>>>>>
>>>>>>>> advise compute customers to do. It is then up to the user 
>>>>>>>> themselves to spot a hang and to manually kill (Ctrl+C, kill 
>>>>>>>> ###, etc.) their task. Killing the CPU task will automatically 
>>>>>>>> clear up any GPU resources allocated to that task (excepting 
>>>>>>>> context persistence, which is a) broken and b) something we 
>>>>>>>> also tell compute customers to disable).
>>>>>>>
>>>>>>> What is broken with context persistence? I noticed one patch 
>>>>>>> claiming to be fixing something in that area which looked 
>>>>>>> suspect. Has it been established no userspace relies on it?
>>>>>> One major issue is that it has hooks into the execlist scheduler 
>>>>>> backend. I forget the exact details right now. The implementation 
>>>>>> as a whole is incredibly complex and convoluted :(. But there's 
>>>>>> stuff about what happens when you disable the heartbeat after 
>>>>>> having closed a persistence context's handle (and thus made it 
>>>>>> persisting). There's also things like it sends a super high 
>>>>>> priority heartbeat pulse at the point of becoming persisting. 
>>>>>> That plays havoc for platforms with dependent engines and/or 
>>>>>> compute workloads. A context becomes persisting on RCS and 
>>>>>> results in your unrealted CCS work being reset. It's a mess.
>>>>>>
>>>>>> The comment from Daniel Vetter is that persistence should have no 
>>>>>> connection to the heartbeat at all. All of that dynamic behaviour 
>>>>>> and complexity should just be removed.
>>>>>
>>>>> Dependent engines is definitely a topic on it's own, outside 
>>>>> hearbeats, persistence and all.
>>>> Except that it has implications for persistence which the current 
>>>> driver does not take into account.
>>>
>>> Well current driver does not take RCS+CCS dependency into account so 
>>> that should come first, or all in one package at least.
>> Not sure what you are arguing for here? Simplifying persistence as 
>> described will fix all the problems in one easy go. There is no point 
>> in adding yet more hideously complex code to make one corner case 
>> work when the real fix is to rip it all out.
>
> It sounded like you were arguing there was an issue with context 
> persistence and dependent engines so my reply was that if there are no 
> dependent engines in upstream there is no issue with persistence. Once 
> dependent engines are brought upstream then any reset caused by 
> persistence can be looked at and determined if there is any conceptual 
> difference between that and any random reset.
There are issues with context persistence and *everything*. Dependent 
engines is just one of may problems with persistence.

What I am arguing for is ripping out all the hideously complex 
persistence code that it is extremely fragile and does not work with 
modern platforms. Instead, replacing it with some massively simpler, 
much more maintainable and compatible with all platforms - past, present 
and future.


>
>>>>> Otherwise there is definitely complexity in the execlists backend 
>>>>> but I am not sure if logic persistence and heartbeats are so very 
>>>>> connected. It does send a pulse when heartbeat interval is 
>>>>> changed, which if going to zero, it will kick of closed contexts 
>>>>> if it can:
>>>>>
>>>>> static struct intel_engine_cs *
>>>>> __execlists_schedule_in(struct i915_request *rq)
>>>>> {
>>>>>     struct intel_engine_cs * const engine = rq->engine;
>>>>>     struct intel_context * const ce = rq->context;
>>>>>
>>>>>     intel_context_get(ce);
>>>>>
>>>>>     if (unlikely(intel_context_is_closed(ce) &&
>>>>>              !intel_engine_has_heartbeat(engine)))
>>>>>         intel_context_set_banned(ce);
>>>>>
>>>>>     if (unlikely(intel_context_is_banned(ce) || bad_request(rq)))
>>>>>         reset_active(rq, engine);
>>>>>
>>>>> Is this what you mean? The point of this is to make sure 
>>>>> persistent context does not hog the engine forever if hangcheck 
>>>>> has been disabled.
>>>>>
>>>>> Reminds me of my improvement to customer experience which never 
>>>>> got in 
>>>>> (https://patchwork.freedesktop.org/patch/451491/?series=93420&rev=2). 
>>>>> Point of that one was to avoid engine reset (or worse) after user 
>>>>> presses "Ctrl-C" if something takes just over 1ms to cleanly 
>>>>> complete.
>>>> The plan is that the persistent contexts would still get the 
>>>> default grace period (pre-emption timeout at least) to finish but 
>>>> Ctrl+C will kill it within a timely manner if it does not finish.
>>>
>>> Yes my patch does that. ;) Currently non-persistent is killed to 
>>> quickly triggering pointless and alarming engine resets. Users 
>>> reported this last year and I tried to fix it.
>> Except that your patch is adding yet more complexity to an already 
>> complex feature. The desire is to simplify the driver and make it 
>> more maintainable not complicated it further.
>
> It is fixing an user reported issue and is not really adding 
> complexity apart from enabling us to distinguish the reason for 
> revoking a request (ban vs soft close). I think we should care to fix 
> user reported issues in a reasonable time frame. It's a patch from 
> last summer or so..
>
>>>>>> Persistence itself can stay. There are valid UMD use cases. It is 
>>>>>> just massively over complicated and doesn't work in all corner 
>>>>>> cases when not using execlist submission or on newer platforms. 
>>>>>> The simplification that is planned is to allow contexts to 
>>>>>> persist until the associated DRM master handle is closed. At that 
>>>>>> point, all contexts associated with that DRM handle are killed. 
>>>>>> That is what AMD and others apparently implement.
>>>>>
>>>>> Okay, that goes against one recent IGT patch which appeared to 
>>>>> work around something by moving the position of _context_ close.
>>>> No it does not. The context close is not the trigger. The trigger is 
>>>
>>> Well patch says:
>>> """
>>> The spin all test relied on context persistence unecessarily by trying
>>> to destroy contexts while keeping spinners active.
>>> The current implementation of context persistence in i915 can cause
>>> failures with GuC enabled, and persistence is not needed for this test.
>>>
>>> Moving intel_ctx_destroy after igt_spin_end.
>>> """
>>>
>>> Implying moving context close to after spin end fixes things for 
>>> GuC, not fd close.
>> That's because persistence is currently a big pile of poo and does 
>> not work in all the corner cases. The correct solution is to leave 
>> the IGT alone and just fix the implementation of persistence. 
>> However, the IGT update to not use the broken feature is a trivial 
>> test change (two lines?) whereas fixing the broken feature is a 
>> significant KMD re-work. It needs to be done but no-one currently has 
>> the time to do it. But trivially changing the test allows the test to 
>> work and test the features it is meant to be testing (which is not 
>> persistence).
>
> Clear as mud. If the statement is that persistence cannot simply be 
> removed, then for sure it cannot be said that anything can be fixed or 
> unblocked by allowing some test to pass with GuC, by making them avoid 
> using persistence (and not even explicitly with a context param). It 
> implies persistence does not work with the GuC, which is then in 
> contradiction with the statement that we cannot just remove 
> persistence. I truly have no idea what the argument is here.
Persistence works in the right set of circumstances. Those circumstances 
do not involve dynamically changing heartbeat settings, platforms with 
dependent engines, etc. The correct fix is to leave the IGT test alone 
and fix the persistence implementation. However, that is not trivial and 
we have many other high priority holes still to plug. Whereas changing 
the IGT to not use a feature it is not intended to be testing anyway is 
a trivial change and gets us the test coverage of what that IGT is meant 
to be for.

John.


>
> Regards,
>
> Tvrtko

