Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 74FA951DD82
	for <lists+dri-devel@lfdr.de>; Fri,  6 May 2022 18:23:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 904AA10F103;
	Fri,  6 May 2022 16:22:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71F4310F0EC;
 Fri,  6 May 2022 16:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651854177; x=1683390177;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=Ph0/i9zNFry6C6gU/LgKeZi+odOcRkivGsLoUOmPg1w=;
 b=kdaoVL3NUECbLzpaOSgOgbgHU7PlLAVb08DAuh7AgMRjD8aluk1pOypB
 uJGYhujfrFEBRc3dkZI0I29z3eHF2S5JEIpWtfKJ1yk4jzeTXb7wenncT
 SChUVuN4ZtXwCELe0I1bDpHXPWa6ek0XgY4EbwUzlmB69OG3B7h4OwYjB
 +aaNNlHfd/A/RT8uTGdoeB5415ymxZA+Gcs28jjdBoVwzBxWUE6fpyXc2
 nUDRZuuEqo91NwdOT2LBEOTVcAmYDpCJ7ON2V85UFTvWw96AyfdT5YsNY
 4QgQj5GZPpvORmBXKYynf5Xs2jLuk+dXu+uU/5tUFWYBKNlD/nH1hk7ll Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10339"; a="250515340"
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; d="scan'208";a="250515340"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2022 09:21:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; d="scan'208";a="537954903"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by orsmga006.jf.intel.com with ESMTP; 06 May 2022 09:21:32 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Fri, 6 May 2022 09:21:32 -0700
Received: from orsmsx605.amr.corp.intel.com (10.22.229.18) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Fri, 6 May 2022 09:21:31 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Fri, 6 May 2022 09:21:31 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Fri, 6 May 2022 09:21:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JoH1PznZ/sP6OmNPxdGBjz5YjyIYzeZoArWgHk5wskhgDxvs2fm9vB1iwiaYIj4KupXNJ4ZQQGfhatZORAQh+rZVitfFhilez2uPr2lbwUDPN2Qv1KEeCnFF+P8h//MmNpVGCuQVPk32DrUWelTLTC9DxXBuxmqcU7ge3W/a407xXYPGjH2OW3+0myD3RBB7fPhQ1MJRg3i5N9fNOF1NkBYIPJH9UxNqbPgP4XFTMe7IhM/+ZNL811iHyeX4QkL+W0HgF7jPZjajXNXJaGFjnL9LW6iS+KooDxA/PWDGn2GhYNWpAR0Sfb4IFO2zlEu155JLZ1bvGeHvoRogJcZpqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=66Df7UMbOyYpZiMj67rhS5ww4h1fssXpoYK4lNuLv/Y=;
 b=H1eFXl7N6EyLcQt0cenAZjpqrhFkJXo/cLWszHu/wPDswP1mr01lqIh4zXrlg1AUljKD14kFEYKWcr7tT7kVqHVZ2gvA9z+tTM2bv9XlY+Ziy0vzYy8olFO+y+5FqgSdCs/sQxC9gX3gR4SLFxV24EIl6D93z/UvLfrk4ztBIaF0deckG9v3y8vhMCba4ijjx8GsAIV3EdPUP2u54vhjKodLnewjWT8lCpf0JmxnBHklQz4jqceZDkpOChjx7Xmu/znexE1qS+P1Xw1vc6Ekng82vdyjj5Jq9B5Vrtv5R3clN/b5y01r9wwb50YtfKwveg58bJ6JCzIhJy1TqPtKTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4274.namprd11.prod.outlook.com (2603:10b6:a03:1c1::23)
 by BN7PR11MB2578.namprd11.prod.outlook.com (2603:10b6:406:b2::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.27; Fri, 6 May
 2022 16:21:29 +0000
Received: from BY5PR11MB4274.namprd11.prod.outlook.com
 ([fe80::587d:a946:3907:11c8]) by BY5PR11MB4274.namprd11.prod.outlook.com
 ([fe80::587d:a946:3907:11c8%6]) with mapi id 15.20.5206.028; Fri, 6 May 2022
 16:21:29 +0000
Message-ID: <f7e4b196-6ce9-ee61-4314-0baf8450bc45@intel.com>
Date: Fri, 6 May 2022 09:21:27 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [Intel-gfx] [PATCH] drm/i915/guc/slpc: Use non-blocking H2G for
 waitboost
Content-Language: en-US
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, John Harrison
 <john.c.harrison@intel.com>, <intel-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>
References: <20220505054010.21879-1-vinay.belgaumkar@intel.com>
 <de063b19-e5f6-342b-d816-c112c446a68f@linux.intel.com>
 <8c8dea74-aa2b-44c1-e1d7-1f613c05bf32@intel.com>
 <032467b7-8794-882a-e45f-6e9d85a716df@intel.com>
 <1d15f38e-c3d8-a521-4a15-50341dae5000@linux.intel.com>
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <1d15f38e-c3d8-a521-4a15-50341dae5000@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY5PR17CA0049.namprd17.prod.outlook.com
 (2603:10b6:a03:167::26) To BY5PR11MB4274.namprd11.prod.outlook.com
 (2603:10b6:a03:1c1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: af567ab0-2d9a-484f-84bd-08da2f7c7a0e
X-MS-TrafficTypeDiagnostic: BN7PR11MB2578:EE_
X-Microsoft-Antispam-PRVS: <BN7PR11MB2578756010CAE0E063C9433585C59@BN7PR11MB2578.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Q6a9mIY/w4vsbSzebP4moZKiSTHhSSDDXFx4hLeOksbfD+RDDARfOmNvcqKTKMBFZdXBcpHgEAzUVQLmtpXoplViaeZUO4Rge652YqiYt73QCx4pj3IIgBZOePjSqLMn68/lFDl5yLk/p94JVa8uDhc5k1B88k+5fDEvkPMq59xWvZbaIN5RdmJhJcUYuKGy9hVPaP28HlYk28xaUEOGwb9657WjQMPUNhiWg20mYghDftE6YSLVzD0uxugrrKWrh79Nj6DkrEAsTMj+/V78ibyrLoXYh36yLjpArhtGib4K3kCnKJgGcD+dB4YJ0CDFdu/qzWinC+stxa68E6mZf7oqY5PBVMRlL1QnovkUunlK9OK/zYCpfg8mpefxEeiiLC5PBdOTEv8Cd3iHxHEtbdbjDlczXfX+77f+pWqsUsPyNCRN7WqnUpmDZO5CaylwANucT34IzdSpEgdm4vx1BOVab89w9DGmCScFB3bwL7/CU4VLHl05AeNw3eWMznxFJirOGaHuT24bSe6GQck0jpFPaRGqOHTs5pCA2VivYKyxI5Sh1M6YVWT5r2hxG/h81pciLVVejlmrkAMxZFquRo7mFcaYaSDZJoxCJfxUlQ/aMcHP4/WrjhPksGgYnjKlYF+OrvZ5XGHg3Q1RvdONZ2BcGPnjDkw869C3QTJ/7/V5IZmT711D1tBdsiY1lw+dqF4NCZi3S/XsGdKjunp+1N5LO6EGgpJyBD5/nn597NMg3leRM20kgUsB+oeVORvI
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4274.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(82960400001)(6512007)(38100700002)(186003)(26005)(31686004)(2906002)(83380400001)(2616005)(36756003)(6506007)(8936002)(5660300002)(53546011)(508600001)(86362001)(31696002)(6486002)(316002)(66556008)(66476007)(110136005)(8676002)(66946007)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dkRnUGpOZlg5eHpDSDZvWG84bzduOTF3c2I5TXUwN0Yzdm8xY2Zwbk9xMUJY?=
 =?utf-8?B?b21hdkk2ank5YlhoSnNyOVhmS05ySm1rSGUySE1DSnVEY29hM29VM2ZuTEF0?=
 =?utf-8?B?S3NvZHZkSWtWU3czckRwWHR2bWlrbVZaTWRjQ3I0K0t1Mi9OR3RoUFZOTVZs?=
 =?utf-8?B?QWpPbjVHcFFpVHkyNGtrTzlYbGV0RlVVeFlHTTFhcEFnNGN6QkxhUldsVEM4?=
 =?utf-8?B?Sk5FR2Jld2FiMmhkTTl3K3dCdVczYWVYaFhieS9YaTljWXZVNlN1UXZOVFNo?=
 =?utf-8?B?NEF4TnZCeis1MkQ0Z0JDbzcvVVNOTjYxcExIVTJSbGJDRG9uVGxJMkpjd1VY?=
 =?utf-8?B?d0xxUWFRaDg4aGhTempmMTU5eEVsUm1wYlRibVhCUVB2cTVqaWhKR1NYV0xu?=
 =?utf-8?B?b01mZmI0Q3B5bmoySEtISGNjaFVzcHJhZG4xdHIzUjM0NC9DWVhWaGxkdDlP?=
 =?utf-8?B?ek9ndUxoN05zb2l1RHNURDRQcTQ3eFdDbE1kbUpkMThNRTdsR1pvUUYwcllJ?=
 =?utf-8?B?SGk4SU9GNk81c00rQmE5by80SnhCSXpHTUt6aklzY01GNXY0c1dMQTVHR3Rv?=
 =?utf-8?B?cmFNaldVbG1PWUxiWDRDc3FnSk5XNUdOZlpHa3I3bmFqYmxJdElOaGlwWmYx?=
 =?utf-8?B?Tk5XNnd4VllVOTdBNnZZYmk2WGNoVGVIc3dzb2FPN05laUo5UHpqM0VleTdy?=
 =?utf-8?B?OGt5L3B1eHlLMWlQUXh6a2h6cU51SVA4YTd6cytNR1F0N1NrU1NVck5CUGpM?=
 =?utf-8?B?WjJ6MTd4ekZ5RDlKdFUwZzg1cVA0UjdMRW5YSFpranpjaEg2dWlGR1hSK2xR?=
 =?utf-8?B?Zzd2bVFEVWlZenNFV0lnd013U2oyeWdxeCtZVm92cTE0dVhRY3dKNEFXQ3Jn?=
 =?utf-8?B?Zm1mWmN2LzdYc2ovSkFjUEtEdnpKK1RDbmRqdDdFMEdFb0NMcUYyaFltZnpI?=
 =?utf-8?B?R081aGFuSGJGN2tsdU1wdFBSVG00OE95UzJtMGprSHJBbmt6STR3YW5WREtE?=
 =?utf-8?B?TzdmeVZUb1ZianV1alZFdGFCVG1XN2FTSVFianhJTzZmWFFvN05BYkR4b3po?=
 =?utf-8?B?WUpPNmpaVWVHZjBySDkxeGNXMnVHNDVWNkU3WGwrdWd1clZpSVZlbjVqT3Fv?=
 =?utf-8?B?OGNQdENQWGpoUUtFdjZlT0IwSmE2TkhvNFdVOHgzcjQwOWRQTG9obFdpMkkw?=
 =?utf-8?B?aEVFWmZjb1dBNDgvWGZKbVRkcTlFSzVuc1hVSy9SN0d6YVNQV3BYRFZJbmFB?=
 =?utf-8?B?RmRrUjhvMGVqNmJrSUVad3dCSDFvREE5eW5zKzJvRldpRnBDRFArcVlhdmJI?=
 =?utf-8?B?L0Vad2JYNmtXZXQxdnlic3pSV2sxb011WThoUEY1OUQyRjlraDhaQmtieHJB?=
 =?utf-8?B?K1A3SlZ6V0RjYW0xVWVxNHlDU2Zpc0lYRUJXbFpEQXlBSnFUdWNFak1NMFpN?=
 =?utf-8?B?L3Y2VGNJRzNUUlhMU3hHbUJ3WWhLakhnL2NzaU1DZzdqa2UrN2QvVUlST0RL?=
 =?utf-8?B?TktsbG5jMzJUUno0OU52MG5nc2Z5ajhnZnRCQzFyWjQzb3puQUVISytuWm5Q?=
 =?utf-8?B?UVErOVdySWhxNDloUGV0YXBHQzBFS2ZTcmlYODg5MkdtQnFwUWVielQ5K0Jh?=
 =?utf-8?B?Nm5CVXIzaWxJYjFzSDFGTnM3azdpY1lid3YwWDFRUDI0T3ZPaFVRaTZSaWpx?=
 =?utf-8?B?Z2w4Ri9FRlJDNnFkelR1VlkzU2ZSdDBXZVE5QmJNWVd2Rkgxbzl4S1UxVjVk?=
 =?utf-8?B?TE1sc1FPM1UwSTg3MWhpeEpnMFU2blU5bDVYRzhkaW9QV0pvL24vNnR3U01n?=
 =?utf-8?B?VFVGQjYwSzJSRi9oc2pRVjFUTHNmM29TcTJpeFFGWUFJVVJaYWV6cHN2MFpQ?=
 =?utf-8?B?QlBRTGlTbkdQaCtWS0ZodXFlVllmRExKSEpuT3c3emV1L2h1MXVnOVNOVXJG?=
 =?utf-8?B?bjRoNUJhYTVydVpybk9KMWpUQVJUZXlXSVZGUisrandtYy9CN0pURG00NUpy?=
 =?utf-8?B?QllQVTZLc3dHZ0tidEJFNTBaakljdjhsNzBGVTkwNEh1cjZYNjFOS3lnMnlm?=
 =?utf-8?B?bWU3aE5yY0xTVm90TGYvRmlTVUpZQ1NBa3dBeDhoSnphU3p6dmtneEV5eEo3?=
 =?utf-8?B?SG1tV0pZd2JNSTZZTVozR29zSFRYWGdFSDZ5VEY5RlBTVFk0dmY2bW5NM055?=
 =?utf-8?B?WnBVbkFueXFyby8vV1hyT0xwSFhFc1RtZzQxVHFRWnZZK3U1b3RBUDE3Vy9K?=
 =?utf-8?B?MVJJdFMxcUNhL21Ma1l4a1dkWnhvZzRJUHJBYmRFblRqODh4ek15alFxcFNl?=
 =?utf-8?B?N3JneUw3OU91bGhNY2dNK1o5QW85eUh6OG11VGdNYUwyQjd6WlZ0eXFESTJa?=
 =?utf-8?Q?qnvpwNnirj55N88k=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: af567ab0-2d9a-484f-84bd-08da2f7c7a0e
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4274.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2022 16:21:29.7974 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zSM3mcvqAtvo2IlF5z1Ck55nkCo/VhbfbuUhSktuNc7pkIcHFgGfhOkXnNHL/egydtixNt+GFti6ZBuUraatxg7F30dVdaYJJrf3jdLGnAU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR11MB2578
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


On 5/6/2022 12:18 AM, Tvrtko Ursulin wrote:
>
> On 05/05/2022 19:36, John Harrison wrote:
>> On 5/5/2022 10:21, Belgaumkar, Vinay wrote:
>>> On 5/5/2022 5:13 AM, Tvrtko Ursulin wrote:
>>>> On 05/05/2022 06:40, Vinay Belgaumkar wrote:
>>>>> SLPC min/max frequency updates require H2G calls. We are seeing
>>>>> timeouts when GuC channel is backed up and it is unable to respond
>>>>> in a timely fashion causing warnings and affecting CI.
>>>>
>>>> Is it the "Unable to force min freq" error? Do you have a link to 
>>>> the GitLab issue to add to commit message?
>>> We don't have a specific error for this one, but have seen similar 
>>> issues with other H2G which are blocking.
>>>>
>>>>> This is seen when waitboosting happens during a stress test.
>>>>> this patch updates the waitboost path to use a non-blocking
>>>>> H2G call instead, which returns as soon as the message is
>>>>> successfully transmitted.
>>>>
>>>> AFAIU with this approach, when CT channel is congested, you instead 
>>>> achieve silent dropping of the waitboost request, right?
>>> We are hoping it makes it, but just not waiting for it to complete.
>> We are not 'hoping it makes it'. We know for a fact that it will make 
>> it. We just don't know when. The issue is not about whether the 
>> waitboost request itself gets dropped/lost it is about the ack that 
>> comes back. The GuC will process the message and it will send an ack. 
>> It's just a question of whether the i915 driver has given up waiting 
>> for it yet. And if it has, then you get the initial 'timed out 
>> waiting for ack' followed by a later 'got unexpected ack' message.
>>
>> Whereas, if we make the call asynchronous, there is no ack. i915 
>> doesn't bother waiting and it won't get surprised later.
>>
>> Also, note that this is only an issue when GuC itself is backed up. 
>> Normally that requires the creation/destruction of large numbers of 
>> contexts in rapid succession (context management is about the slowest 
>> thing we do with GuC). Some of the IGTs and selftests do that with 
>> thousands of contexts all at once. Those are generally where we see 
>> this kind of problem. It would be highly unlikely (but not 
>> impossible) to hit it in real world usage.
>
> Goto ->
>
>> The general design philosophy of H2G messages is that asynchronous 
>> mode should be used for everything if at all possible. It is fire and 
>> forget and will all get processed in the order sent (same as batch 
>> buffer execution, really). Synchronous messages should only be used 
>> when an ack/status is absolutely required. E.g. start of day 
>> initialisation or things like TLB invalidation where we need to know 
>> that a cache has been cleared/flushed before updating memory from the 
>> CPU.
>>
>> John.
>>
>>
>>>>
>>>> It sounds like a potentially important feedback from the field to 
>>>> lose so easily. How about you added drm_notice to the worker when 
>>>> it fails?
>>>>
>>>> Or simply a "one line patch" to replace i915_probe_error (!?) with 
>>>> drm_notice and keep the blocking behavior. (I have no idea what is 
>>>> the typical time to drain the CT buffer, and so to decide whether 
>>>> waiting or dropping makes more sense for effectiveness of 
>>>> waitboosting.)
>>>>
>>>> Or since the congestion /should not/ happen in production, then the 
>>>> argument is why complicate with more code, in which case going with 
>>>> one line patch is an easy way forward?
>
> Here. Where I did hint I understood the "should not happen in 
> production angle".
>
> So statement is GuC is congested in processing requests, but the h2g 
> buffer is not congested so no chance intel_guc_send_nb() will fail 
> with no space in that buffer? Sounds a bit un-intuitive.
>
> Anyway, it sounds okay to me to use the non-blocking, but I would like 
> to see some logging if the unexpected does happen. Hence I was 
> suggesting the option of adding drm_notice logging if the send fails 
> from the worker. (Because I think other callers would already 
> propagate the error, like sysfs.)
>
>   err = slpc_force_min_freq(slpc, slpc->boost_freq);
>   if (!err)
>        slpc->num_boosts++;
>   else
>        drm_notice(... "Failed to send waitboost request (%d)", err);

Ok, makes sense. Will send out another rev with this change.

Thanks,

Vinay.


>
> Something like that.
>
> Regards,
>
> Tvrtko
>
>
>>> Even if we soften the blow here, the actual timeout error occurs in 
>>> the intel_guc_ct.c code, so we cannot hide that error anyways. 
>>> Making this call non-blocking will achieve both things.
>>>
>>> Thanks,
>>>
>>> Vinay.
>>>
>>>>
>>>> Regards,
>>>>
>>>> Tvrtko
>>>>
>>>>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>>>>> ---
>>>>>   drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c | 38 
>>>>> ++++++++++++++++-----
>>>>>   1 file changed, 30 insertions(+), 8 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c 
>>>>> b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>>>>> index 1db833da42df..c852f73cf521 100644
>>>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>>>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>>>>> @@ -98,6 +98,30 @@ static u32 slpc_get_state(struct intel_guc_slpc 
>>>>> *slpc)
>>>>>       return data->header.global_state;
>>>>>   }
>>>>>   +static int guc_action_slpc_set_param_nb(struct intel_guc *guc, 
>>>>> u8 id, u32 value)
>>>>> +{
>>>>> +    u32 request[] = {
>>>>> +        GUC_ACTION_HOST2GUC_PC_SLPC_REQUEST,
>>>>> +        SLPC_EVENT(SLPC_EVENT_PARAMETER_SET, 2),
>>>>> +        id,
>>>>> +        value,
>>>>> +    };
>>>>> +    int ret;
>>>>> +
>>>>> +    ret = intel_guc_send_nb(guc, request, ARRAY_SIZE(request), 0);
>>>>> +
>>>>> +    return ret > 0 ? -EPROTO : ret;
>>>>> +}
>>>>> +
>>>>> +static int slpc_set_param_nb(struct intel_guc_slpc *slpc, u8 id, 
>>>>> u32 value)
>>>>> +{
>>>>> +    struct intel_guc *guc = slpc_to_guc(slpc);
>>>>> +
>>>>> +    GEM_BUG_ON(id >= SLPC_MAX_PARAM);
>>>>> +
>>>>> +    return guc_action_slpc_set_param_nb(guc, id, value);
>>>>> +}
>>>>> +
>>>>>   static int guc_action_slpc_set_param(struct intel_guc *guc, u8 
>>>>> id, u32 value)
>>>>>   {
>>>>>       u32 request[] = {
>>>>> @@ -208,12 +232,10 @@ static int slpc_force_min_freq(struct 
>>>>> intel_guc_slpc *slpc, u32 freq)
>>>>>        */
>>>>>         with_intel_runtime_pm(&i915->runtime_pm, wakeref) {
>>>>> -        ret = slpc_set_param(slpc,
>>>>> - SLPC_PARAM_GLOBAL_MIN_GT_UNSLICE_FREQ_MHZ,
>>>>> -                     freq);
>>>>> -        if (ret)
>>>>> -            i915_probe_error(i915, "Unable to force min freq to 
>>>>> %u: %d",
>>>>> -                     freq, ret);
>>>>> +        /* Non-blocking request will avoid stalls */
>>>>> +        ret = slpc_set_param_nb(slpc,
>>>>> + SLPC_PARAM_GLOBAL_MIN_GT_UNSLICE_FREQ_MHZ,
>>>>> +                    freq);
>>>>>       }
>>>>>         return ret;
>>>>> @@ -231,8 +253,8 @@ static void slpc_boost_work(struct work_struct 
>>>>> *work)
>>>>>        */
>>>>>       mutex_lock(&slpc->lock);
>>>>>       if (atomic_read(&slpc->num_waiters)) {
>>>>> -        slpc_force_min_freq(slpc, slpc->boost_freq);
>>>>> -        slpc->num_boosts++;
>>>>> +        if (!slpc_force_min_freq(slpc, slpc->boost_freq))
>>>>> +            slpc->num_boosts++;
>>>>>       }
>>>>>       mutex_unlock(&slpc->lock);
>>>>>   }
>>
