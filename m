Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AAD23CF0BD
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jul 2021 02:26:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4817689A8C;
	Tue, 20 Jul 2021 00:26:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F94689A8C;
 Tue, 20 Jul 2021 00:26:54 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10050"; a="209250042"
X-IronPort-AV: E=Sophos;i="5.84,253,1620716400"; d="scan'208";a="209250042"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2021 17:26:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,253,1620716400"; d="scan'208";a="632067807"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga005.jf.intel.com with ESMTP; 19 Jul 2021 17:26:52 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Mon, 19 Jul 2021 17:26:52 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Mon, 19 Jul 2021 17:26:51 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Mon, 19 Jul 2021 17:26:51 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Mon, 19 Jul 2021 17:26:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bhw0L52OvkRsaqPtHdyugAB9K88R+IE8qlwi9NIVJpUGdUuBcFs0yGojGnK+6N2+6NmWKdUBMxcuofddz3ry8Biqm3rXp7qxKFeW/uoxAX55cjUHUyKAzYWWbMfnB/PPVoRjIH5u8pD2SUzNq/UUkZId0kfuQUyZiSCv4rZD8WMPRVmQyepVyspWzrddBu8cDZxkqEWXQAD1tZSJ01Gf9RzXGuhuEEHXv3mkk4IJUgTq13IwW5nIpYME5mh4kJoOCpbQbZ2SHRIv9WBsvJTIFJD5RP0om35yOtU5WssH6VAk7UYoTa/wt7iz7UrEDf58ebkQ9umxH/Dq/1PXCnlJqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8igfOrC3Z6+XZ/Zc/9pl0JX/HW5OSa8URPgzqybLCKk=;
 b=TWFuJ7eScCL/hShzdMgfcHx/frZ/yGeHcWB+AZ7WcPcM25VIbsMkkttX5qAu81ctEP6DE//Tu88DeST0xjGkL31WahVQfm2YruvCKYZgeLPqLxnsEcsDqc17GvZUv0jrXvyRF4QjXwmC2aRnXYM+zGLl3lbziuIgZtFTTugbLJ1jC1LFFdGcnRmJ3aQOj36PjGoJqjqnsA4kOA5LuPGMQGu/2pjM9jSYUajq2WeCbBdnUtyM+w3YRJ7FOkfhRQMD4g/WhIqEgUfmZn7CdoPxtQ+nkpejmHj3Z3u5Ncm7AYs66XDdZ4U0b7wG+NrSiAvGu9GYQs/IXtOZsR8DJMtMIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8igfOrC3Z6+XZ/Zc/9pl0JX/HW5OSa8URPgzqybLCKk=;
 b=VoyeOTJzJo12HuF3uy7NjbMfhKwQ6ut0ceTtMiMvNzvtSAb2Z1XQpbuGBn8NqynHG6hLjCsa3FuPH6gDxq57+LhYRuMRml5XOulBez5LSgOyyZaWvCu41nVMDBtfoypnDMWNnBqRQ598zIzp/78yi9ULLXc/miCSxvzISONHmoc=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5642.namprd11.prod.outlook.com (2603:10b6:510:e5::13)
 by PH0PR11MB5577.namprd11.prod.outlook.com (2603:10b6:510:eb::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.22; Tue, 20 Jul
 2021 00:26:48 +0000
Received: from PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::c5a8:5a64:9118:95c4]) by PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::c5a8:5a64:9118:95c4%8]) with mapi id 15.20.4331.032; Tue, 20 Jul 2021
 00:26:48 +0000
Subject: Re: [PATCH 04/51] drm/i915/guc: Implement GuC submission tasklet
To: Matthew Brost <matthew.brost@intel.com>
References: <20210716201724.54804-1-matthew.brost@intel.com>
 <20210716201724.54804-5-matthew.brost@intel.com>
 <f64f3b3e-651d-7375-3aab-2c5ecdb09f70@intel.com>
 <20210719225544.GA24241@sdutt-i7>
From: John Harrison <john.c.harrison@intel.com>
Message-ID: <430fc61b-6fac-34b4-daf4-17b4bb8b3140@intel.com>
Date: Mon, 19 Jul 2021 17:26:46 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.12.0
In-Reply-To: <20210719225544.GA24241@sdutt-i7>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: MWHPR14CA0050.namprd14.prod.outlook.com
 (2603:10b6:300:81::12) To PH0PR11MB5642.namprd11.prod.outlook.com
 (2603:10b6:510:e5::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.221] (73.157.192.58) by
 MWHPR14CA0050.namprd14.prod.outlook.com (2603:10b6:300:81::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.22 via Frontend Transport; Tue, 20 Jul 2021 00:26:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4a1a1e2e-f363-4815-d5f6-08d94b150fda
X-MS-TrafficTypeDiagnostic: PH0PR11MB5577:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <PH0PR11MB557724AD3B38FE3C2F67ECA8BDE29@PH0PR11MB5577.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XqzMbCGWC1KvFAs6lzmgrqeHksVsYycsXg8LcFCMeLWQvj1yFvnwP3PUg1vNP7UikiPUvWuDlfuDKaDfcKOaryV7GNytXOPdFmWcxUWrflvpwdCuHQM2NgA11nb1xacLbdU1pU3KoFCHbitfg3c0FE165V4J3ASALlNQ4+kjxB10ovgX1Xns9FgyAd8lQ8TW9SpMKTnxRUxU8aDGSVI6la3wTOvQbZUMt3VRuCcRt3I4b+5Cnh4WkHK4jB6A24fad2fBM3k32X3+ubfyWBtjJPDUQosS+riQoqIr8CZIycsqwzt9cp/8pkOZ4uKdFTvyJDkfIK68b85GirvNFvxr2dnV0lc65kHUuP1QRDdhnY217kSC8IPuXI1bA1KwiL5lMePA0Y67SImALLGeXlaU5qskl/cMnKiX9ziPc2zBFEaj0JkyhgDDrNCmq2pyw3ktg//0ITABf8yRroTIkMhlVcBuQU8Ou79KbAQlviJ+UcM8mkARyyRH2PT2LPpaRGMGCaaXXXuqhkkOnn2d8G2640U5F1Ef8vwrtLjMyYKr0xlchPXcvgsSjs2tioklCZdQDU9GvLdPsRg42MxNMZVLn3KEJNA7wAro5e4nLZgAXrM/doyi7xb7XkU4TfUwgoIQ7Ir1p5WfmUIfiZZYW5kAqBaAirYh3UsSezHl2Jtk5IHCdWzBJKHToYX2w7/eOeVqm7ghYzgW8pnkhnCvGyHKwb6AX02BcdpXyN4iURho/10KmVnOdgHktWXlHxbpAS17
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5642.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(396003)(346002)(366004)(376002)(136003)(2906002)(53546011)(86362001)(16576012)(6486002)(8676002)(6636002)(38100700002)(316002)(4744005)(37006003)(31696002)(83380400001)(31686004)(478600001)(26005)(6862004)(66556008)(107886003)(66476007)(36756003)(450100002)(66946007)(186003)(4326008)(8936002)(956004)(5660300002)(2616005)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ckp4cE9JNDZoeCttWjlScFFiNVVMLzRRQnVGdDJWSnhkQ2lXSEJ3cmFhVk5q?=
 =?utf-8?B?TU1Bd2FmSWlsWDR3NkxkcUtvamV0TGZlcTZmZmYzcUlwWi9jWHlHb1dKcm96?=
 =?utf-8?B?a0o5SUNHZFRqSUpYbDJSaDFobTdTeXYydk9ZRGRVTE5jb1p5TlpJT2hDV3RO?=
 =?utf-8?B?dEtKZXJLSGZDaW5OTDJJelJoOGs5VkozWi9CTnhUVXRGYmg4cUF2WmdlSlox?=
 =?utf-8?B?UzBQaitsSVJjV3d2UDRlVElLV09CN1VCTTlYYnZTUTVaS2tId2ZoWE4rSmVZ?=
 =?utf-8?B?WXNxbFJxVnNXTjB0djZFYWJxYU9qazA1cjdhV1hIc3l3d3lCVDFRMDRkdUdT?=
 =?utf-8?B?Wlg5dGlWZncydzIrR0JZL3RBeTI2U25tK2Y2SXBweVJYaEs4bUNrR3BiRWV4?=
 =?utf-8?B?d2VVYzkxM2Mxbndic0RLWVZoTW0vaTM5NWpYeDQwRUtNNkFteEZ2dXZxbDBB?=
 =?utf-8?B?V2hKTmlsRXVBcTlQUUlmeDgzMjRLNE4zVExOaVFhc2tHb0NNditUMTVtc2dO?=
 =?utf-8?B?TnFtL0FUa3Z4dlNyMk5YMGdBNlJxOVJiRnlOSkxkaWhIR29pNE9qUmdndzNR?=
 =?utf-8?B?MjYrcUpEWmMyS1pZRUN0S3NseFJJNzR4QTVWN2RzdFVIWlNyWW54RDIrblVJ?=
 =?utf-8?B?Q1NhdkhXY1BOUVJyOVNQU0V5QmJyell1RXZ1SVA0N2orbkwybXo0SEVEL0ZD?=
 =?utf-8?B?dndSQzBPOFpPb01CZ0d5WnMzMDJhMzJVaGx2S3UyWFI0eWtvZEVVVmpSbThx?=
 =?utf-8?B?YXo1VmRMc0FFWGVXWWJTSktqVUx4TUpKQnVpZ01nSHBkZ05MOTV4SVp0cnV0?=
 =?utf-8?B?OGcvdEIrZ3Y5a0UyOVVmOFFQdUtrcHZ5VE4yekFTZ3h5Z1ZKNFpLN0JlZHRV?=
 =?utf-8?B?dW9LQjVWZ2ZHZzhoL0pnYVZGdnVpWjRrWENwMnlNL0E5NDhpaG1jZWVwNHdw?=
 =?utf-8?B?M2J5c0Fwc05EL29BeVBHanBKS1Q3a0JiNlg0eHpXWEppcnJmZGNrNFd6VlMx?=
 =?utf-8?B?akhUbGVOSVlXak81YU5oUmw1b3JQZFVwZVl4c1p0WlZxSlExRHBIQS80MUZB?=
 =?utf-8?B?V2UwMlBZQmhNcDV0UmIrdTFDYmZWcm02Rkh6WlQ2ZHhCZ2hEL2RMYUNmRVRZ?=
 =?utf-8?B?VTZiVHhTSnlWQmJBNE5IOE1WWUFtbWVDMGNPM0hnbFZ1Yk1xWXBGZHVYcm80?=
 =?utf-8?B?YjFUcGcwZE1hN0VoMWxEdHhlam9NbHQ3M2JqV0w3RWtIczdPMVNkd2JRNk5F?=
 =?utf-8?B?Ry9Wa21ZWU1ia1habStDWVpuWFFHT0s4MlRZR1dUNkRiQWl3clpXYWlwckQz?=
 =?utf-8?B?UWRHNFJ4ei9lbWZZa3kwdHRTcE5jak5mQ3pmZnB2K2pmL0hLR2MxZnZuS2U4?=
 =?utf-8?B?bi9CVzVCV1phR0lySXN4eE96bFpidWZoZUovMkxMVXc3dVpxVElnWDk1bWJV?=
 =?utf-8?B?TkE2MDJwZDFWYmhhVU1QVVBod0NuVUJRN0UrdjgzUzc0dE84ZHArK1RzZEZY?=
 =?utf-8?B?V3JQc2RIcWw2WjVoNERnd1ZiL0VZbTJRUThYYllwSnpETFdTNGdKYWdVU0xC?=
 =?utf-8?B?TWx5UEF3YS8wMFNsMFBJU1lsZWVsQXpQRFlmZHlDZnllN2hHUHdrUyttZjdK?=
 =?utf-8?B?bkg5bnRpVi9yTHRhZWtCcUJNTllUVC9reXp2N2pGeWxvZ3R1TTd6OTh4Uk03?=
 =?utf-8?B?ZXdKQWpPYm8rTExYdno3dFRuVWRGTkw4NFNJU1NZcG1TOUNVSmNVMVJqSjV1?=
 =?utf-8?Q?rQ6dhC+W71DR+ZYtg35Cl4nwYXnIDMf5bupn9Ti?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a1a1e2e-f363-4815-d5f6-08d94b150fda
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5642.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2021 00:26:48.3406 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YeprU/D5cDFoY7U40Kqa+jX6ZK3L9dzqp50HX2LapMFgRnFC1ARJ47DFfyPy1eo4OB63kDKSwqkXMd7uqB69VfDQh9BSDlZpEPAr0psnqBI=
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
Cc: intel-gfx@lists.freedesktop.org, daniele.ceraolospurio@intel.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/19/2021 15:55, Matthew Brost wrote:
> On Mon, Jul 19, 2021 at 04:01:56PM -0700, John Harrison wrote:
>> On 7/16/2021 13:16, Matthew Brost wrote:
>>> Implement GuC submission tasklet for new interface. The new GuC
>>> interface uses H2G to submit contexts to the GuC. Since H2G use a single
>>> channel, a single tasklet submits is used for the submission path.
>> This still needs fixing - 'a single tasklet submits is used' is not valid
>> English.
>>
> Will fix.
>
>> It also seems that the idea of splitting all the deletes of old code into a
>> separate patch didn't happen. It really does obfuscate things significantly
>> having completely unrelated deletes and adds interspersed :(.
>>
> I don't recall promising to do that.
>
> Matt
"No promises but perhaps I'll do this in the next rev."

Well, this is the next rev. So I am expressing my disappointment that it 
didn't happen. Reviewability of patches is important.

John.

