Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1A2643D2E5
	for <lists+dri-devel@lfdr.de>; Wed, 27 Oct 2021 22:34:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68E2A6E8FA;
	Wed, 27 Oct 2021 20:34:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 481576E8F9;
 Wed, 27 Oct 2021 20:34:33 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10150"; a="217436020"
X-IronPort-AV: E=Sophos;i="5.87,187,1631602800"; d="scan'208";a="217436020"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2021 13:34:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,187,1631602800"; d="scan'208";a="597502343"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga004.jf.intel.com with ESMTP; 27 Oct 2021 13:34:31 -0700
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 27 Oct 2021 13:34:29 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Wed, 27 Oct 2021 13:34:29 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.175)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Wed, 27 Oct 2021 13:34:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oeL/yZxg3if55jwsaBHftUvYx0jF5nwWkepA0zBlG3OzR1HEDBLDuZ1mPFA6CqDlGeyIK/prxOSg6A6dExNRNrzUTqUKpEEvGvNaGt/RbZ0V53RqqDJqsc5DMyaQe1H7vvYWNW1lY1eLk24G7peTQVcd7NGUqAXlN9SlXAQkrdjNfnoREulhp7jSwz8zcwT9aCI1j3txbF4Sd92TjebbykNtpGWw+sHcgT7FPZDb3Eaf335OgCRWMP24bAgYsXpr+yM9QYuWjnJlbSTwBhyNHoKa9z7oVVMWRfXNrFJuU1/tZNvXi+1jRP4hQeguRLRef4Q0nQ1OjN1ZNGUWWNs0Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jWwhBKaf7RLYw4Op+y4FjVZeB9HbLImCZM5v5jQPK78=;
 b=QYtcfFSwreMA4auknTahIWOibTx49yBwPAvKZqE1LXjnvm2hZpxGfDEspCKX0Oa9V5VFmGdgCecfUkj2MzeKsbLyTHCNRuBLUi+8CzlxtfAnuo2+RrFVXix8liNim2MLpBXSKzS0PhXATFAAsk70inYJtPkNZydmgBpyX5Ruf1IbEOl1OiHNT20+/MMLNakL2iQ/Qq2qSySvVzbyWmhpjJJk98rEk3ufunKtisw7RRFMTT9hAJic7gZ4E+TCmf5OAcopR+f2kndgPPp6JYW3YUzAOr/kkPfLdNKapdGZbFrarqMIWUQc0fIeYcOTrb8axDPR1fBxv1NNtGeRpt+uYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jWwhBKaf7RLYw4Op+y4FjVZeB9HbLImCZM5v5jQPK78=;
 b=v0EX91OpPF/QlzEw6uZ12D5WL6KZprrD6rY0Mx+uCniKPpkSnR1X/E0qGSFC0OP+kkHNpuYHEGctniS5eDBm5lp79X8NX9m92riSE/gs0y+umsuN7Zp9irrbAesfSl3R4mqiTMxjHaVu1OG/+9j4qLl0f56seT6NIQ4taqQeSyc=
Authentication-Results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5642.namprd11.prod.outlook.com (2603:10b6:510:e5::13)
 by PH0PR11MB5577.namprd11.prod.outlook.com (2603:10b6:510:eb::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Wed, 27 Oct
 2021 20:34:26 +0000
Received: from PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::880d:1a54:ca07:738a]) by PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::880d:1a54:ca07:738a%9]) with mapi id 15.20.4628.018; Wed, 27 Oct 2021
 20:34:26 +0000
Message-ID: <fa2815fc-5adc-8df6-af19-93dea1edb5d1@intel.com>
Date: Wed, 27 Oct 2021 13:34:23 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.2.1
Subject: Re: [PATCH] drm/i915/selftests: Allow engine reset failure to do a GT
 reset in hangcheck selftest
Content-Language: en-GB
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>
CC: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20211011234705.30853-1-matthew.brost@intel.com>
 <f8f1ae021e8cabc2c6d76996b5e74912cb0913db.camel@linux.intel.com>
 <20211021203747.GA27209@jons-linux-dev-box>
 <ee989711-779e-874f-6737-ab9288557d1a@linux.intel.com>
 <5deddbeb-328c-62b3-38e2-d855fc99668b@intel.com>
 <5af5389a-2f42-16ad-90d2-d329801a882f@linux.intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <5af5389a-2f42-16ad-90d2-d329801a882f@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR04CA0055.namprd04.prod.outlook.com
 (2603:10b6:303:6a::30) To PH0PR11MB5642.namprd11.prod.outlook.com
 (2603:10b6:510:e5::13)
MIME-Version: 1.0
Received: from [192.168.1.106] (73.157.192.58) by
 MW4PR04CA0055.namprd04.prod.outlook.com (2603:10b6:303:6a::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4649.14 via Frontend Transport; Wed, 27 Oct 2021 20:34:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b6bdf9f5-eceb-4455-9fd5-08d999892b25
X-MS-TrafficTypeDiagnostic: PH0PR11MB5577:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <PH0PR11MB5577DD47116C6CC5949A7194BD859@PH0PR11MB5577.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: J0GwMj9LvARedtfb3R2BZaL+u/Zm+36ynaNyiez+Abs8XVrbzU6UmfWPImIoTQ9c8/Qcb79WDOk1hWnbrc0yXnRj2apggLabgX6I9GJH/frrByDJK8E4LCXZys/Emteb22/kavULW/C9R3md3kXgvYbXMN+C6p4YVRGrHNGNTOnpFnaj47QMX8/192TiZYM+EDGUa78gbkaqQM8eM4H4iWU9bxX5RYLwzF/1oz3Pn48BmaebmvqcilriqNAZUuvo9IMEiTDBvug0fRgE1mp9Y9/DbaPXL8YrOC/c4NizgNnSMe6+28d85imd5+RG5R24igrzfqS4rpY5UG8SUztVgFic17XZd7XnkUe4i7E6/wxc9q+rSGDCT0f+OKr4QMcM9QDNO5+DLFwWGSfzg3yBYzFcUxqSq0NECSDUfzcQn55d1fHRqtefaJI7Mre+VUfhaMfs8ypcLOJHEii3bYV6I3YP5L2goZ3NVkOCc6RoAi/gFKdnjeFfVx2bLHv9cYoDCQSutkA+ajF7RjwUCIWDEmgXfLuSFJxEC0u5mWwYLIxm9Z67xpMGFjBlMosufNNNRiFpQeWe3JzUJSdt4Ezni9mfkpzzj/hgZp4SLRXg3SvxXY3zUVaBYjD8CGcVMg2EG/o53rAqXOAZZv780+UR/aIuWXp5HsE+EZV37vz+YBeXOD9RMrvO2IYOz2w2+Svqrj9ccG1s8Ts84ZkWvID3TortdK1xMnozKI4/IUz1DlrtUXbu9UNWjypVQW/vgr4s
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5642.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(31686004)(82960400001)(508600001)(66574015)(4001150100001)(36756003)(26005)(31696002)(186003)(38100700002)(5660300002)(6636002)(83380400001)(2616005)(6486002)(66946007)(316002)(2906002)(66556008)(66476007)(956004)(53546011)(110136005)(86362001)(4326008)(16576012)(8676002)(8936002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aTMrNElCTmc0ZEp5a2NLQkNEWk5TMVNoOWt2OFc3SHpwZm9DNmRXcFBsYTBz?=
 =?utf-8?B?dlo1TjBCK01EbWU1UzB0dk5qNEY4UmwvYVhoQ29qQlJxcEx1dTNtbktmVG4z?=
 =?utf-8?B?N3Q5LzE4bjFiQ1lUNUZ4NHhLMVVkZFo2Tk1OdGx0S0kzcmNubDZsQS9TZEFn?=
 =?utf-8?B?YlQ2REVLOEE0RkNrM2tPM05JcjZWQ0xITmRLekpFYzM5VktUVkdBL29pSENR?=
 =?utf-8?B?elpZNkNBRDVwS09JcFk0UzQ3ZEJSeDJlRDZCVG4vanJQM1hDd0hUTDFJK09F?=
 =?utf-8?B?RzdmMHJDa21lOHFqV3RsdjZ1bjRXUGlvM1Q1YnFDeitjd3BkTnJsMUxFQllX?=
 =?utf-8?B?c214ZU9FeUZFdThaUXVKdzFrdUZ3dFQ5aEUwSVRqY0pHMVk2VVFSQUs5djJt?=
 =?utf-8?B?dE00VTBIRXNyaXRodTRrd3ZqaTNONlNlMldQa2lEVlRPZ09hZi9OSFNaK1h1?=
 =?utf-8?B?dHpSUFVVbG9INkMzSG9rVDVaY25DQmlmNENVZjlBTG04UU9TRGVuSTlTSEFi?=
 =?utf-8?B?NjM2MnJVQ2l4bEd3aGxOZlB5dkpYY0JFQlBuWkVRYkl5L08vWjhUbkxheFNm?=
 =?utf-8?B?WFBndjcyVXROV0svTk5ZQmFVd0xUSlIyRlJTYUF4cmdDY0VmaXN0WHRvTjZq?=
 =?utf-8?B?NkVCa1lwbDk1SUNiMGk0SUkyazNXRzFqTUtBV2xjTXcvYTZuMDQ4a2UzVmlD?=
 =?utf-8?B?Q3JQalk5OFphejdNVGNrejg2WXFCM29FSjB2OFU3UUVPVnJBMk9hZFV0Z3FX?=
 =?utf-8?B?emR2dDkyMHZuK3JFWTUwc01TRGpFZ1NxVzEzdXg2alhxNGVjRlVKSUhHMGdL?=
 =?utf-8?B?ZE5BVWdpWktRWXJtVWJTWUJxQXlsU0hrVmNCVmlPcTJjMWE3VDlRdUdZaEFN?=
 =?utf-8?B?VTJHSXMvMHc4ZVhKaGtmSk44ZUhGb0liUXNhMWEzaWE2VVZNdW54TVNRdW5h?=
 =?utf-8?B?N0JvZjhTMTBQdldUbHFvb2plWGw5bnY0bHBrTVN1SUgwR1o3MG1SUUZEZW1G?=
 =?utf-8?B?eWFabkgyZ3ZZakU3YjBKSERNajJYemJWUSttMzhkNXZNb3JEOWhidFpmYTE2?=
 =?utf-8?B?MWhZVHBScVlLYmtXUFFFNk1xeTNMUHR0QWdrQkxNOWJkOUtsOG83MHhKSXpO?=
 =?utf-8?B?Yit0T01ubjFkMGREWDVBODlub1NUbVA4akxKQjJKNUFNV3ozTnBQMzJvQTBx?=
 =?utf-8?B?M0VaSTJsVUltUkQxVUhndlNEbUtJZ09BTGpKV3BDU1AxRHhUeFUvUVVnMTky?=
 =?utf-8?B?M0c3ZTJjVTE3Nno2WlhiaU5FbGhpM1czRklDblc1MHRjYllMYmVRRVNnN0Rl?=
 =?utf-8?B?VzhxSnBJQnE5TmNwMUo5cWtTYzF2QXZxb2twcW9TdzVid3FpY1J0NkZrb3Q1?=
 =?utf-8?B?MVRQOVZabW1lbnJYWjJCY3BXa284UTdSUnJ6cGpRL3FaaVF2LzRMRVpxT1VN?=
 =?utf-8?B?UnBha2NFTnZLei9zQ24xTzZ0TmRiSFpHVTlTQmYzNnh0NVQxMVdDZzFRL1hZ?=
 =?utf-8?B?NklXcllFc2hNVThKSzFYbG0wQTUzVnRIYU5FWEU3aWdXOGZaWHdJd3lEMkxs?=
 =?utf-8?B?QXhPdm1VbUdpTGxQVmVZWUVpMy9UTTY3WDBkNEI1WHdKN3JXdVBvS3A4aUo4?=
 =?utf-8?B?WDZZYXdXY1NlRGhqU2hOVlhZK0ZTeExxbWJvaWNrM3k2azNnTTVNY25XVzB2?=
 =?utf-8?B?Rkg1OWx3VlJsODJ5SldmcDlXbDZkTTh6WlZUVEVHQTlxU29oeDNLcW9QZXJQ?=
 =?utf-8?B?YTZrTlhHZ0dRVlpvejJqMUhOb2hxaVZXSXlSTTlrditaMGlXSnUwcDRRaHNt?=
 =?utf-8?B?bFRoQjQrbVYweXNQdk5ESVh5TW1pOEdlUkdGckNVejgxcDdKTHgzaXZwdS9X?=
 =?utf-8?B?SnlIS1hHdGJrN0dRYjlGUnMvMEg0VmdNQlgvUTJtUmRGYm9KL3RpbmdLVStZ?=
 =?utf-8?B?U1NCaXYxczBxQTl2KzdwUTE1KzNYNnNzWXF0QTdDdHVYVnV5Vm40Z3pZUmdY?=
 =?utf-8?B?ZDI5b3liUTZSRU5pRzh0bC9COEM3UDFWLy9HRGpDWEkzT0Z6SkRMdEVmVFd4?=
 =?utf-8?B?Y3lwTXlFdFgwdTVrQXdVaERiT2I2MmVxNjdxVE5oS1RzUEo4UFBVNklTK2tF?=
 =?utf-8?B?dFBvdnJhS2hrbjR2d2JqaUZ0VHpkODBQNWlDaE1hLy80Vk9oVSszSFVubEd4?=
 =?utf-8?B?WUw1ZXRmRndERnRLTWNKelFzNVhQRXhaUzlrTUVzRUFLWEtlaHB1eTdHK0la?=
 =?utf-8?Q?QtBEAp92qXoR+j+FVeZZTlSpwEGqIedFEB2iUEIhBY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b6bdf9f5-eceb-4455-9fd5-08d999892b25
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5642.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2021 20:34:26.4385 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mq3hTcu3Hv0eEuHJKa69wrQtDdgpTgNS1cVNWBdG+EASI13c92FlmmsATJKKOyCnkfQNufg0cBFpzwO6e2pHCLpvYt87rL+2feq+ooM5Jqw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5577
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/26/2021 23:36, Thomas Hellström wrote:
> Hi, John,
>
> On 10/26/21 21:55, John Harrison wrote:
>> On 10/21/2021 23:23, Thomas Hellström wrote:
>>> On 10/21/21 22:37, Matthew Brost wrote:
>>>> On Thu, Oct 21, 2021 at 08:15:49AM +0200, Thomas Hellström wrote:
>>>>> Hi, Matthew,
>>>>>
>>>>> On Mon, 2021-10-11 at 16:47 -0700, Matthew Brost wrote:
>>>>>> The hangcheck selftest blocks per engine resets by setting magic 
>>>>>> bits
>>>>>> in
>>>>>> the reset flags. This is incorrect for GuC submission because if the
>>>>>> GuC
>>>>>> fails to reset an engine we would like to do a full GT reset. Do no
>>>>>> set
>>>>>> these magic bits when using GuC submission.
>>>>>>
>>>>>> Side note this lockless algorithm with magic bits to block resets
>>>>>> really
>>>>>> should be ripped out.
>>>>>>
>>>>> Lockless algorithm aside, from a quick look at the code in
>>>>> intel_reset.c it appears to me like the interface that falls back 
>>>>> to a
>>>>> full GT reset is intel_gt_handle_error() whereas intel_engine_reset()
>>>>> is explicitly intended to not do that, so is there a discrepancy
>>>>> between GuC and non-GuC here?
>>>>>
>>>> With GuC submission when an engine reset fails, we get an engine reset
>>>> failure notification which triggers a full GT reset
>>>> (intel_guc_engine_failure_process_msg in intel_guc_submission.c). That
>>>> reset is blocking by setting these magic bits. Clearing the bits in 
>>>> this
>>>> function doesn't seem to unblock that reset either, the driver 
>>>> tries to
>>>> unload with a worker blocked, and results in the blow up. Something 
>>>> with
>>>> this lockless algorithm could be wrong as clear of the bit should
>>>> unlblock the reset but it is doesn't. We can look into that but in the
>>>> meantime we need to fix this test to be able to fail gracefully and 
>>>> not
>>>> crash CI.
>>>
>>> Yeah, for that lockless algorithm if needed, we might want to use a 
>>> ww_mutex per engine or something,
>>> but point was that AFAICT at least one of the tests that set those 
>>> flags explicitly tested the functionality that no other engines than 
>>> the intended one was reset when the intel_engine_reset() function 
>>> was used, and then if GuC submission doesn't honor that, wouldn't a 
>>> better approach be to make a code comment around 
>>> intel_engine_reset() to explain the differences and disable that 
>>> particular test for GuC?. Also wouldn't we for example we see a 
>>> duplicated full GT reset with GuC if intel_engine_reset() fails as 
>>> part of the intel_gt_handle_error() function?
>> Re-reading this thread, I think there is a misunderstanding.
>>
>> The selftests themselves have already been updated to support GuC 
>> based engine resets. That is done by submitting a hanging context and 
>> letting the GuC detect the hang and issue a reset. There is no 
>> mechanism available for i915 to directly issue or request an engine 
>> based reset (because i915 does not know what is running on any given 
>> engine at any given time, being disconnected from the scheduler).
>>
>> So the tests are already correctly testing per engine resets and do 
>> not go anywhere near either intel_engine_reset() or 
>> intel_gt_handle_error() when GuC submission is used. The problem is 
>> what happens if the engine reset fails (which supposedly can only 
>> happen with broken hardware). In that scenario, there is an 
>> asynchronous message from GuC to i915 to notify us of the failure. 
>> The KMD receives that notification and then (eventually) calls 
>> intel_gt_handle_error() to issue a full GT reset. However, that is 
>> blocked because the selftest is not expecting it and has vetoed the 
>> possibility.
>
> This is where my understanding of the discussion differs. According to 
> Matthew, the selftest actually proceeds to clear the bits, but the 
> worker that calls into intel_gt_handle_error() never wakes up. (and 
> that's probably due to clear_bit() being used instead of 
> clear_and_wake_up_bit()).
Hmm, missed that point. Yeah, sounds like the missing wake_up suffix is 
what is causing the deadlock. I can't see any other reason why the reset 
handler would not proceed once the flags are cleared. And it looks like 
the selftest should timeout out waiting for the request and continue on 
to clear the bits just fine.


>
> And my problem with this particular patch is that it adds even more 
> "if (!guc_submission)" which is already sprinkled all over the place 
> in the selftests to the point that it becomes difficult to see what 
> (if anything) the tests are really testing.
I agree with this. Fixing the problem at source seems like a better 
solution than hacking lots of different bits in different tests.


> For example igt_reset_nop_engine() from a cursory look looks like it's 
> doing something but inside the engine loop it becomes clear that the 
> test doesn't do *anything* except iterate over engines. Same for 
> igt_reset_engines() in the !TEST_ACTIVE case and for 
> igt_reset_idle_engine(). For some other tests the reset_count checks 
> are gone, leaving only a test that we actually do a reset.
The nop_engine test is meant to be a no-op. It is testing what happens 
when you reset an idle engine. That is not something we can do with GuC 
based engine resets - there are no debug hooks into GuC specifically to 
trigger an engine reset when there is no hang. The same applies to the 
!TEST_ACTIVE case (which is igt_reset_idle_engine). Hence those are 
skipped for GuC.

The reset_count tests are still present. They are looking for global 
resets occurring when they should not. It is the reset_engine_count 
check that is disabled for GuC. Again, because GuC is handling the reset 
not i915. GuC tells us when a context is reset, it does not report any 
specifics about engines. So this is not a count we can maintain when 
using GuC submission.

>
> So if possible, as previously mentioned, I think a solution without 
> adding more of this in the selftests is preferrable. To me the best 
> option is probably be the one you suggest in your previous email: 
> Don't wait on the I915_RESET_ENGINE bits with GuC in 
> intel_gt_handle_error(), (or perhaps extract what's left in a separate 
> function called from the GuC handler).
I don't like the idea of splitting intel_gt_handle_error() apart. It is 
meant to be the top level reset handler that manages all resets - per 
engine and full GT (and potentially FLR in the future). Certainly, none 
of it should be pulled out into GuC specific code.

One less than ideal aspect of the current reset support is that 
'intel_has_reset_engine()' is ambiguous. With GuC submission, we have 
per engine reset. It's just not managed by i915. So code that wants to 
know if engines can be reset individual wants a true response. But code 
such as intel_gt_handle_error() needs to know *who* is doing that reset. 
Hence it needs the GuC specific check on top to differentiate. Ideally, 
there would be separate intel_has_reset_engine() and 
intel_does_i915_do_engine_reset() queries. Then the reset code itself 
would not need to query GuC submission. However, that seems like 
overkill to remove a couple of GuC tests. Maybe it could be done as 
future work, but it is certainly not in the scope of making this 
selftest not hang the system.

John.


>
> Thanks,
>
> Thomas
>
>
>

