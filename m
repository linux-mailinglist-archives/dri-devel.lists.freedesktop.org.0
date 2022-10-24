Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E61DC60BC6D
	for <lists+dri-devel@lfdr.de>; Mon, 24 Oct 2022 23:46:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8233810E03A;
	Mon, 24 Oct 2022 21:46:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB5A510E02C;
 Mon, 24 Oct 2022 21:46:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666647973; x=1698183973;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=0y2a+JtMw7N9nMS6QA80dpcnkjbJ1zbGW8/fXyvFXf0=;
 b=V8ejb752UtTylyc0utJhZugpHPlyOBDKMEVpOogw30LFlT+A1wguO+NH
 InDRX14OanTCE7Mwu6IsbtErVdmdXqMpaz0/IA9Yc5ipP5MQI8w2sz35M
 p0MezZevmCO+9UWw9YbLr5Ns5WXa6F1fm7LaQwjuvMaWWGIepPaWbBGcA
 1/psIYoG/HOvjHu5rOkLQfXY+QkEziQT93/g7z7bDmmEkigfmsguf1Jtj
 oohksFjf2ezw+yk9K7eSaiJD6yBhdcwS4tvbdcqePRBNokyOHh3NbVesw
 IKEoPOvjCXQhjR1azyn/sFR10Iq08ct9r70UpleE7Zk1rr8TVLXJUK99Q g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10510"; a="294930562"
X-IronPort-AV: E=Sophos;i="5.95,210,1661842800"; d="scan'208";a="294930562"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2022 14:46:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10510"; a="700310112"
X-IronPort-AV: E=Sophos;i="5.95,210,1661842800"; d="scan'208";a="700310112"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga004.fm.intel.com with ESMTP; 24 Oct 2022 14:46:10 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 24 Oct 2022 14:46:10 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 24 Oct 2022 14:46:09 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Mon, 24 Oct 2022 14:46:09 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Mon, 24 Oct 2022 14:46:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dsIH0ZoDw0069OEbl8/SD3Wz3sbfkuDMqE4xIuRIUdDE0COhoFgGMoOp5WtJ5bW837fYSRs7IPGbYijCgQCwRtu5nl//rTTE32VvxMv/oQZc16cyU3LSujSZo84KpGjxIxJVrrMQt5FoA7NbF2+ZFWgNB2i0IJXVWol6Ed6UbHholr11NkI/0j/jSya2ShEx5dkvqZRmoTcKMbolkQ8M8GaM3a/MS68LeASzatdveUXUm5P1xL7mELNv6zOIuXFcJGr4j52xFx2x4dXWJ1RTsqvaXoPRS0QBaj1ogCfbQPmg7lDdSo8d70QRMnWStMSJS4Aq3aZRTZSNBqJ1XXZLjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5dml6ZtcyRxPPIOdtzfzEP+MavA+piy81tgaq90YWo0=;
 b=f2KBlSpU+jzOH3M/Azc+l2sRJsvouTxKM34Qe4fWaItwXSeGZUgvwoaqiT82wg7V7+jmUZF2FaIo/TYPM22CAE9fNo+CPVOmy2n9kIgAwNEPBzJnpmqvsBrhT+OxTMCpb8DRHnbZ9YWFzUJlW3VHSCsiGzIZQm63Z9OErMlu1/UWr/PnMkKTvGTy3HXmrixjpVcPNmdpogsnojre3EhDxyJyHzS+t1D7ukI++r13NQWYnWhEvUC3ylFtLIVG4lcnzbmNX5XFFI/EULbsXWbploPmbadcAL7yTRAiLQHpnJv0wYNoZNi7BwurbLz2bv7ymELad6pWOnTKx6k9PI3XeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by DM4PR11MB6335.namprd11.prod.outlook.com (2603:10b6:8:b7::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.21; Mon, 24 Oct
 2022 21:46:07 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::87a1:bf2f:7377:3036]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::87a1:bf2f:7377:3036%7]) with mapi id 15.20.5746.027; Mon, 24 Oct 2022
 21:46:07 +0000
Message-ID: <d01ff118-b1ea-54b2-2782-4e00a7f60e51@intel.com>
Date: Mon, 24 Oct 2022 14:46:05 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.4.0
Subject: Re: [PATCH v3 5/7] drm/i915/mtl: Handle wopcm per-GT and limit
 calculations.
Content-Language: en-GB
To: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 <intel-gfx@lists.freedesktop.org>
References: <20221022001008.2340224-1-daniele.ceraolospurio@intel.com>
 <20221022001008.2340224-6-daniele.ceraolospurio@intel.com>
 <e444179e-c722-2a06-4fa9-3122dbd39966@intel.com>
 <279ca89a-e00c-5d11-cf92-08873121d04a@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <279ca89a-e00c-5d11-cf92-08873121d04a@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR01CA0060.prod.exchangelabs.com (2603:10b6:a03:94::37)
 To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|DM4PR11MB6335:EE_
X-MS-Office365-Filtering-Correlation-Id: 86c1f6f8-d350-4407-e82e-08dab6092858
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Pa05gL4f6dW0w09wEMoYKXo2xMAYgRMSQQ3uzRHFmaHT7Gzk27McS88wf/YQGaK19bDK5YGsYGwzFLtVSIk3m6udPsd0kVE3tNAB4iTj4ytcJCKiuzhO68/46K/1Q7qp+R+JWzS99zfuzppv78PMh6yRjbhF/tU8+/ZJUBuoHUVsmTyNGTn6SkgLUBRKEUOYyJurrTsrUqDCg6YtJfVrGLMvp5zeesv/KJqYfIbi65eb8ZmaapMQbVqV3hjWLlcbvJiu3yvS4GYg+/X5upxMFzdUwsICfGC8qF75gTSmg18LEpxXD1ft65Meg+gvyZY1x63bMEUr+wJ5AIgGKMjFMQG01nsNNg4+FbytBL33WiP73knoco+vC6tFmIqgYIkfE9/Fbx7d+xiqxdPtk3ec/IVie7l48r/nb7bVdXOtxCthSiTaLwxPB9nRVctaaRRFWgNDfiXcxPmP3wMNA0oesxh3kZOIXbICyUO/Yk0LVgduXxraQXO4v88LGw8hiQ5yt63yFbD+IqLkeKiLo+NkdNtqVoZfCMEStHX90OWvk/pnamErRbgH+g0DzPDHVcaVrllD2amMNkqYPrFXzUB9y3Tk2QZSjuP35J1z0CxEwRahyZX3UWVfKRQ+ChEpvJEuzsqkou3vA03r+Eb2tqQkMBdSGWT/HAMYQ2p0YvpWHHnG5uf7QeGWWIU8vOij1KqVjDwLc9JfbIFktE76pDkxycfpd6TkU9xFKWqHUWf7a6bQIbnDO1ORySL1gN40HBtzBO9VZtgjm1QYq197k5dgt/Dwt7wlcVYpi93zUVgt8oc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(346002)(136003)(39860400002)(376002)(396003)(451199015)(6486002)(31686004)(66899015)(478600001)(31696002)(86362001)(83380400001)(82960400001)(6506007)(66476007)(66556008)(5660300002)(53546011)(54906003)(2616005)(8676002)(316002)(36756003)(2906002)(186003)(6512007)(26005)(4326008)(41300700001)(30864003)(38100700002)(66946007)(8936002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UU5DTU1udnlBYm55RWlXUnhyVUZjTTRSZmx2ZkZLazdvQlpTM3hicjZlWDc0?=
 =?utf-8?B?NWNiOGtHYTIzUzFQbS90L1IwSVZBQTZoU0U5S014THV4WDJ1eHB5SGk4MWJj?=
 =?utf-8?B?N3JhY2lTcXJCOUs5SW53REEyQk5PL0YrUFJkQXNqTlRJYzhDa2d6NVQ5Qnlo?=
 =?utf-8?B?NUM5OTZ2QkRIRGVDcWZOMEpUbUF4d3ZsNldNWllWRlRBczE5N28wQlZNMG1X?=
 =?utf-8?B?SFMxZmpSYk12K2k5WVNXdmdpZWN1c2xTVVpteFRhQXZKUjM5MW5oVXFwRG5D?=
 =?utf-8?B?Qk9GOW0yVm5oUEF3UEJ5ditMaWdBUFlib29oOWd5UTNlcFp1SzEzU3IwdDUy?=
 =?utf-8?B?dzhDREJrdHZqS2p3UmFFaUo1NU5HTVJDOG9haWZkWlV0WGwrTDJLZkRBYndC?=
 =?utf-8?B?MmEwNk1yQUNnOGh1MWNYNnVkdDFPVEZENGhrOUV4YWh3Rlp0cUZMOStkcTAz?=
 =?utf-8?B?UlVuQ25CNUVqcnRmejhEbXA0K0lmT1lJeGZpT0ErZTNxQ3k4QkVUdndxdGdt?=
 =?utf-8?B?bzg1NE9GVnB2YVdMMXFMbTZ5N01Dd28zR0pFMnF2VWlGWEc3RzRUQTRKM2ti?=
 =?utf-8?B?RXFXVHp2R2tIZ1hIeDZNeW5uemNhTGpwNUFEMktZUXBhaXMwNHdoWUk1VDlE?=
 =?utf-8?B?MHA4dzgwK2Y1cHhUU1BSVVNUNGY0ekxvQi82Wi8xS1NKMmVnOEw4VEFuZUJQ?=
 =?utf-8?B?YUlwbDA4bGVTUDV5OXpGcjJMV2FWOFo3dENsWHZZYjIrNnAvSGJlb3JNdWR5?=
 =?utf-8?B?NHkvamxwRC9qYlZIZGFBTDN4UnNXaTlzczhYVXZiTnE4a3IwQ21JMjd4MjF4?=
 =?utf-8?B?dFIxcHpMMmVualVqcE9VQ3dHcmZ6TXlBM1hxdlNXSjFQdW1nNWhVTncyRTRB?=
 =?utf-8?B?bEE1Q1U0OEdHczF6Q2JMVkRHUnlaUlVzNG9ZTmRWTUJOS3ZJUmdsam5IVXV5?=
 =?utf-8?B?Q2NPN2JGVGZraEJzb3NMWHR2dEVsN284R2NBYXNnWldlT05WT1I1TVFOcUxz?=
 =?utf-8?B?RXpTQjUweWhKZmcwVnF3SVZTTnBMNXd6UzFRa01KMk5kS2RSSjFBUWpCWmRu?=
 =?utf-8?B?WlF0MTBRK3JlS2d4NmoxYVB6VnpJMW1DVnNtK2pQQTdwSDIxZzZHUW9qTjF3?=
 =?utf-8?B?T3E2U0phZzdGODZCbDc3SmI4eEdYekNEcklBWTdjdko1aVFjOWJkb0JaVGFZ?=
 =?utf-8?B?ejRQdHFQRG5pOXJvc2Z2SVNISlplTkZrdlh4UVV4TElPWUtqd240Y2psWGQ5?=
 =?utf-8?B?RFp6eFRMZEcvSDFuRXVkNUE1QWRBRnlWNlNQQUE1UnZnMDRFUU5mNDdrTExi?=
 =?utf-8?B?VXhWUk04ZVI4cVlUdUJzUHhEcWhSbTk2OFV5TS9zZnJuOG1QT1M1WXU3TS92?=
 =?utf-8?B?bjV6WE9KMit5dFFkK3kwY0lVbU9CVCs0NXlmTU1seWhkaFR6TVNYaUxPQkFw?=
 =?utf-8?B?am5tTUJHS3VNeCt0QUgrTWluZXlsa01Nd2orazZwVkNsYjRHNzhybXc5UzdB?=
 =?utf-8?B?Z3BJMTl0R0Z0YXhNcTExNjl0cU9jcnlKaEFGR2Y2U3RSU2F5Qk9IU0RJb1NR?=
 =?utf-8?B?M0hBSUVvZ2cxNk9mUW8vZG1IVFByaVc1ZFl6QVJxY2RZek9hK2FBN2NKZCs4?=
 =?utf-8?B?NkNudFhlTVBadU92a2taVzFnWEdHM3Z2WmpTRFhsNUgwMUlQUFZNWmNHZ0oy?=
 =?utf-8?B?NmI4Zmd0S3VDQ0FhWU4zK0QrcGExdXBYN2dkWTA1cW8yZlFRSFZJRlNRTkJP?=
 =?utf-8?B?MHNpY1RQc1dYSmJWYWNYRGFYR3U4MFp2clRZeDZrcXhlcDRHUkl2MDFRZDlB?=
 =?utf-8?B?R2lHZHorWUZSU2J5NytSalNyNldsQlEzQkpMZUxyZUFjV3FMQWcwaExZTmpl?=
 =?utf-8?B?Y2NLSmJrVU5YWSs5eEphOEZVdzdSbkk3ZVRvUXM2SG5VMVpJT3lwdlcwcFZC?=
 =?utf-8?B?M29udFBHK1Y5dXdTWDVQMHcwZEdQR21DK2FQTlk2NDhGUjhPNzhjSTNnRE5a?=
 =?utf-8?B?UG1PR2lVZGpTZTA0UnIvNDAwRVY3UFdqMWZDODhISUJwK1V6V0xFM3RsMWpO?=
 =?utf-8?B?UE84Tjh0LzZaYWpnNVJidkh1ZHAzbnJoT2lSc1B1VlV3NUYxRkRZSHhqY3o4?=
 =?utf-8?B?TDltd1p0YVBwUGRPblpqR1FsSy9LL1M5UGd3cG02SUVlbE9nMHdCOFhseWVr?=
 =?utf-8?B?OFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 86c1f6f8-d350-4407-e82e-08dab6092858
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2022 21:46:07.6253 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VfLcmeiAQwviQw3w56MpuIbTqPvStCPI3NlsIcXsqqq7Y57VsSt6PdI+PBGN/zbWlZR20EXxKQuHdwK+MZDkY/uQVrNLSDt8sBxumKbBLrY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6335
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
Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>,
 dri-devel@lists.freedesktop.org, Alan
 Previn <alan.previn.teres.alexis@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/24/2022 14:39, Ceraolo Spurio, Daniele wrote:
> On 10/24/2022 2:33 PM, John Harrison wrote:
>> On 10/21/2022 17:10, Daniele Ceraolo Spurio wrote:
>>> From: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
>>>
>>> With MTL standalone media architecture the wopcm layout has changed 
>>> with
>>> separate partitioning in WOPCM for GCD/GT GuC and SA Media GuC. The 
>>> size
>>> of WOPCM is 4MB with lower 2MB for SA Media and upper 2MB for GCD/GT.
>> Given that GCD is not a term used anywhere in the driver, I think it 
>> either needs to be either explained or dropped. Plus, Graphics 
>> Companion Die seems a confusing name for the root GT. Surely the 
>> media GT is the companion? Especially as the code seems to be written 
>> such that the 'companion' is required but the media is optional.
>>
>> While on the subject, the explanation of SA should be more explicit. 
>> E.g. "With MTL Stand Alone Media architecture, the wopcm...".
>
> would this work:
>
> With MTL standalone media architecture the wopcm layout has changed, with
> separate partitioning in WOPCM for the root GT GuC and the media GT GuC.
> The size of WOPCM is 4MB with the lower 2MB reserved for the media GT and
> the upper 2MB for the root GT.
Except that the diagram below still talks about GCD and SA...

>
>>
>>>
>>>      +=====+===> +====================+ <== WOPCM TOP
>>>      ^     ^     |                    |
>>>      |     |     |                    |
>>>      |    GCD    |   GCD RC6 Image    |
>>>      |    GuC    |    Power Context   |
>>>      |    WOPCM  |                    |
>>>      |    Size   +--------------------+
>>>      |     |     |   GCD GuC Image    |
>>>      |     |     |                    |
>>>      |     v     |                    |
>>>      |     +===> +====================+ <== SA Media GuC WOPCM Top
>>>      |     ^     |                    |
>>>      |   SA Media|                    |
>>>      |    GuC    | SA Media RC6 Image |
>>>      |   WOPCM   |    Power Context   |
>>>      |    Size   |                    |
>>>    WOPCM   |     +--------------------+
>>>      |     |     |                    |
>>>      |     |     | SA Media GuC Image |
>>>      |     v     |                    |
>>>      |     +===> +====================+ <== GuC WOPCM base
>>>      |           |     WOPCM RSVD     |
>>>      |           +------------------- + <== HuC Firmware Top
>>>      v           |      HuC FW        |
>>>      +=========> +====================+ <== WOPCM Base
>>>
>>> Given that MTL has GuC deprivilege, the WOPCM registers are pre-locked
>>> by the bios. Therefore, we can skip all the math for the partitioning
>>> and just limit ourselves to sanity checking the values.
>>>
>>> v2: fix makefile file ordering (Jani)
>>> v3: drop XELPM_SAMEDIA_WOPCM_SIZE, check huc instead of VDBOX (John)
>>>
>>> Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
>>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>>> Cc: Matt Roper <matthew.d.roper@intel.com>
>>> Cc: John Harrison <john.c.harrison@intel.com>
>>> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
>>> Cc: Jani Nikula <jani.nikula@linux.intel.com>
>>> ---
>>>   Documentation/gpu/i915.rst                  |  2 +-
>>>   drivers/gpu/drm/i915/Makefile               |  5 ++-
>>>   drivers/gpu/drm/i915/gt/intel_ggtt.c        |  2 +-
>>>   drivers/gpu/drm/i915/gt/intel_gt.c          |  1 +
>>>   drivers/gpu/drm/i915/gt/intel_gt_types.h    |  2 +
>>>   drivers/gpu/drm/i915/{ => gt}/intel_wopcm.c | 44 
>>> +++++++++++++++------
>>>   drivers/gpu/drm/i915/{ => gt}/intel_wopcm.h |  0
>>>   drivers/gpu/drm/i915/gt/uc/intel_uc.c       |  4 +-
>>>   drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c    | 14 ++++---
>>>   drivers/gpu/drm/i915/i915_driver.c          |  2 -
>>>   drivers/gpu/drm/i915/i915_drv.h             |  3 --
>>>   drivers/gpu/drm/i915/i915_gem.c             |  5 ++-
>>>   12 files changed, 52 insertions(+), 32 deletions(-)
>>>   rename drivers/gpu/drm/i915/{ => gt}/intel_wopcm.c (87%)
>>>   rename drivers/gpu/drm/i915/{ => gt}/intel_wopcm.h (100%)
>>>
>>> diff --git a/Documentation/gpu/i915.rst b/Documentation/gpu/i915.rst
>>> index 4e59db1cfb00..60ea21734902 100644
>>> --- a/Documentation/gpu/i915.rst
>>> +++ b/Documentation/gpu/i915.rst
>>> @@ -494,7 +494,7 @@ WOPCM
>>>   WOPCM Layout
>>>   ~~~~~~~~~~~~
>>>   -.. kernel-doc:: drivers/gpu/drm/i915/intel_wopcm.c
>>> +.. kernel-doc:: drivers/gpu/drm/i915/gt/intel_wopcm.c
>>>      :doc: WOPCM Layout
>>>     GuC
>>> diff --git a/drivers/gpu/drm/i915/Makefile 
>>> b/drivers/gpu/drm/i915/Makefile
>>> index 2535593ab379..cf3a96b3cd58 100644
>>> --- a/drivers/gpu/drm/i915/Makefile
>>> +++ b/drivers/gpu/drm/i915/Makefile
>>> @@ -127,9 +127,11 @@ gt-y += \
>>>       gt/intel_sseu.o \
>>>       gt/intel_sseu_debugfs.o \
>>>       gt/intel_timeline.o \
>>> +    gt/intel_wopcm.o \
>>>       gt/intel_workarounds.o \
>>>       gt/shmem_utils.o \
>>>       gt/sysfs_engines.o
>>> +
>>>   # x86 intel-gtt module support
>>>   gt-$(CONFIG_X86) += gt/intel_ggtt_gmch.o
>>>   # autogenerated null render state
>>> @@ -183,8 +185,7 @@ i915-y += \
>>>         i915_trace_points.o \
>>>         i915_ttm_buddy_manager.o \
>>>         i915_vma.o \
>>> -      i915_vma_resource.o \
>>> -      intel_wopcm.o
>>> +      i915_vma_resource.o
>>>     # general-purpose microcontroller (GuC) support
>>>   i915-y += gt/uc/intel_uc.o \
>>> diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt.c 
>>> b/drivers/gpu/drm/i915/gt/intel_ggtt.c
>>> index 6b58c95ad6a0..9263f10ecd28 100644
>>> --- a/drivers/gpu/drm/i915/gt/intel_ggtt.c
>>> +++ b/drivers/gpu/drm/i915/gt/intel_ggtt.c
>>> @@ -560,7 +560,7 @@ static int init_ggtt(struct i915_ggtt *ggtt)
>>>        * why.
>>>        */
>>>       ggtt->pin_bias = max_t(u32, I915_GTT_PAGE_SIZE,
>>> - intel_wopcm_guc_size(&ggtt->vm.i915->wopcm));
>>> + intel_wopcm_guc_size(&ggtt->vm.gt->wopcm));
>>>         ret = intel_vgt_balloon(ggtt);
>>>       if (ret)
>>> diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c 
>>> b/drivers/gpu/drm/i915/gt/intel_gt.c
>>> index 27dbb9e4bd6c..8c751314df3d 100644
>>> --- a/drivers/gpu/drm/i915/gt/intel_gt.c
>>> +++ b/drivers/gpu/drm/i915/gt/intel_gt.c
>>> @@ -56,6 +56,7 @@ void intel_gt_common_init_early(struct intel_gt *gt)
>>>       seqcount_mutex_init(&gt->tlb.seqno, &gt->tlb.invalidate_lock);
>>>       intel_gt_pm_init_early(gt);
>>>   +    intel_wopcm_init_early(&gt->wopcm);
>>>       intel_uc_init_early(&gt->uc);
>>>       intel_rps_init_early(&gt->rps);
>>>   }
>>> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_types.h 
>>> b/drivers/gpu/drm/i915/gt/intel_gt_types.h
>>> index 64aa2ba624fc..2d18fd9ab11f 100644
>>> --- a/drivers/gpu/drm/i915/gt/intel_gt_types.h
>>> +++ b/drivers/gpu/drm/i915/gt/intel_gt_types.h
>>> @@ -30,6 +30,7 @@
>>>   #include "intel_migrate_types.h"
>>>   #include "intel_wakeref.h"
>>>   #include "pxp/intel_pxp_types.h"
>>> +#include "intel_wopcm.h"
>>>     struct drm_i915_private;
>>>   struct i915_ggtt;
>>> @@ -100,6 +101,7 @@ struct intel_gt {
>>>         struct intel_uc uc;
>>>       struct intel_gsc gsc;
>>> +    struct intel_wopcm wopcm;
>>>         struct {
>>>           /* Serialize global tlb invalidations */
>>> diff --git a/drivers/gpu/drm/i915/intel_wopcm.c 
>>> b/drivers/gpu/drm/i915/gt/intel_wopcm.c
>>> similarity index 87%
>>> rename from drivers/gpu/drm/i915/intel_wopcm.c
>>> rename to drivers/gpu/drm/i915/gt/intel_wopcm.c
>>> index 322fb9eeb880..c91f234adc55 100644
>>> --- a/drivers/gpu/drm/i915/intel_wopcm.c
>>> +++ b/drivers/gpu/drm/i915/gt/intel_wopcm.c
>>> @@ -64,9 +64,9 @@
>>>   #define GEN9_GUC_FW_RESERVED    SZ_128K
>>>   #define GEN9_GUC_WOPCM_OFFSET    (GUC_WOPCM_RESERVED + 
>>> GEN9_GUC_FW_RESERVED)
>>>   -static inline struct drm_i915_private *wopcm_to_i915(struct 
>>> intel_wopcm *wopcm)
>>> +static inline struct intel_gt *wopcm_to_gt(struct intel_wopcm *wopcm)
>>>   {
>>> -    return container_of(wopcm, struct drm_i915_private, wopcm);
>>> +    return container_of(wopcm, struct intel_gt, wopcm);
>>>   }
>>>     /**
>>> @@ -77,7 +77,8 @@ static inline struct drm_i915_private 
>>> *wopcm_to_i915(struct intel_wopcm *wopcm)
>>>    */
>>>   void intel_wopcm_init_early(struct intel_wopcm *wopcm)
>>>   {
>>> -    struct drm_i915_private *i915 = wopcm_to_i915(wopcm);
>>> +    struct intel_gt *gt = wopcm_to_gt(wopcm);
>>> +    struct drm_i915_private *i915 = gt->i915;
>>>         if (!HAS_GT_UC(i915))
>>>           return;
>>> @@ -157,14 +158,16 @@ static bool check_hw_restrictions(struct 
>>> drm_i915_private *i915,
>>>       return true;
>>>   }
>>>   -static bool __check_layout(struct drm_i915_private *i915, u32 
>>> wopcm_size,
>>> +static bool __check_layout(struct intel_gt *gt, u32 wopcm_size,
>>>                  u32 guc_wopcm_base, u32 guc_wopcm_size,
>>>                  u32 guc_fw_size, u32 huc_fw_size)
>>>   {
>>> +    struct drm_i915_private *i915 = gt->i915;
>> This is no longer required now that the MEDIA_VER check is gone?
>
> This is still needed because i915 is still used (e.g. in the line 
> below). It was passed as a parameter before, but now that we pass in 
> intel_gt we need to define it locally.
Doh! Just call me blind.

John.

>
>>>       const u32 ctx_rsvd = context_reserved_size(i915);
>>>       u32 size;
>>>         size = wopcm_size - ctx_rsvd;
>>> +
>> Likewise, is this blank line still intended?
>
> No, I'll drop it.
>
> Daniele
>
>>
>> John.
>>
>>>       if (unlikely(range_overflows(guc_wopcm_base, guc_wopcm_size, 
>>> size))) {
>>>           drm_err(&i915->drm,
>>>               "WOPCM: invalid GuC region layout: %uK + %uK > %uK\n",
>>> @@ -181,12 +184,14 @@ static bool __check_layout(struct 
>>> drm_i915_private *i915, u32 wopcm_size,
>>>           return false;
>>>       }
>>>   -    size = huc_fw_size + WOPCM_RESERVED_SIZE;
>>> -    if (unlikely(guc_wopcm_base < size)) {
>>> -        drm_err(&i915->drm, "WOPCM: no space for %s: %uK < %uK\n",
>>> -            intel_uc_fw_type_repr(INTEL_UC_FW_TYPE_HUC),
>>> -            guc_wopcm_base / SZ_1K, size / SZ_1K);
>>> -        return false;
>>> +    if (intel_uc_supports_huc(&gt->uc)) {
>>> +        size = huc_fw_size + WOPCM_RESERVED_SIZE;
>>> +        if (unlikely(guc_wopcm_base < size)) {
>>> +            drm_err(&i915->drm, "WOPCM: no space for %s: %uK < %uK\n",
>>> +                intel_uc_fw_type_repr(INTEL_UC_FW_TYPE_HUC),
>>> +                guc_wopcm_base / SZ_1K, size / SZ_1K);
>>> +            return false;
>>> +        }
>>>       }
>>>         return check_hw_restrictions(i915, guc_wopcm_base, 
>>> guc_wopcm_size,
>>> @@ -228,8 +233,8 @@ static bool __wopcm_regs_writable(struct 
>>> intel_uncore *uncore)
>>>    */
>>>   void intel_wopcm_init(struct intel_wopcm *wopcm)
>>>   {
>>> -    struct drm_i915_private *i915 = wopcm_to_i915(wopcm);
>>> -    struct intel_gt *gt = to_gt(i915);
>>> +    struct intel_gt *gt = wopcm_to_gt(wopcm);
>>> +    struct drm_i915_private *i915 = gt->i915;
>>>       u32 guc_fw_size = intel_uc_fw_get_upload_size(&gt->uc.guc.fw);
>>>       u32 huc_fw_size = intel_uc_fw_get_upload_size(&gt->uc.huc.fw);
>>>       u32 ctx_rsvd = context_reserved_size(i915);
>>> @@ -274,6 +279,19 @@ void intel_wopcm_init(struct intel_wopcm *wopcm)
>>>           goto check;
>>>       }
>>>   +    /*
>>> +     * On platforms with a media GT, the WOPCM is partitioned 
>>> between the
>>> +     * two GTs, so we would have to take that into account when 
>>> doing the
>>> +     * math below. There is also a new section reserved for the GSC 
>>> context
>>> +     * that would have to be factored in. However, all platforms 
>>> with a
>>> +     * media GT also have GuC depriv enabled, so the WOPCM regs are
>>> +     * pre-locked and therefore we don't have to do the math 
>>> ourselves.
>>> +     */
>>> +    if (unlikely(i915->media_gt)) {
>>> +        drm_err(&i915->drm, "Unlocked WOPCM regs with media GT\n");
>>> +        return;
>>> +    }
>>> +
>>>       /*
>>>        * Aligned value of guc_wopcm_base will determine available 
>>> WOPCM space
>>>        * for HuC firmware and mandatory reserved area.
>>> @@ -295,7 +313,7 @@ void intel_wopcm_init(struct intel_wopcm *wopcm)
>>>           guc_wopcm_base / SZ_1K, guc_wopcm_size / SZ_1K);
>>>     check:
>>> -    if (__check_layout(i915, wopcm_size, guc_wopcm_base, 
>>> guc_wopcm_size,
>>> +    if (__check_layout(gt, wopcm_size, guc_wopcm_base, guc_wopcm_size,
>>>                  guc_fw_size, huc_fw_size)) {
>>>           wopcm->guc.base = guc_wopcm_base;
>>>           wopcm->guc.size = guc_wopcm_size;
>>> diff --git a/drivers/gpu/drm/i915/intel_wopcm.h 
>>> b/drivers/gpu/drm/i915/gt/intel_wopcm.h
>>> similarity index 100%
>>> rename from drivers/gpu/drm/i915/intel_wopcm.h
>>> rename to drivers/gpu/drm/i915/gt/intel_wopcm.h
>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.c 
>>> b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
>>> index dbd048b77e19..4cd8a787f9e5 100644
>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc.c
>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
>>> @@ -357,8 +357,8 @@ static int uc_init_wopcm(struct intel_uc *uc)
>>>   {
>>>       struct intel_gt *gt = uc_to_gt(uc);
>>>       struct intel_uncore *uncore = gt->uncore;
>>> -    u32 base = intel_wopcm_guc_base(&gt->i915->wopcm);
>>> -    u32 size = intel_wopcm_guc_size(&gt->i915->wopcm);
>>> +    u32 base = intel_wopcm_guc_base(&gt->wopcm);
>>> +    u32 size = intel_wopcm_guc_size(&gt->wopcm);
>>>       u32 huc_agent = intel_uc_uses_huc(uc) ? HUC_LOADING_AGENT_GUC 
>>> : 0;
>>>       u32 mask;
>>>       int err;
>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c 
>>> b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
>>> index 81e06d71c1a8..0c80ba51a4bd 100644
>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
>>> @@ -478,10 +478,11 @@ static int check_gsc_manifest(const struct 
>>> firmware *fw,
>>>       return 0;
>>>   }
>>>   -static int check_ccs_header(struct drm_i915_private *i915,
>>> +static int check_ccs_header(struct intel_gt *gt,
>>>                   const struct firmware *fw,
>>>                   struct intel_uc_fw *uc_fw)
>>>   {
>>> +    struct drm_i915_private *i915 = gt->i915;
>>>       struct uc_css_header *css;
>>>       size_t size;
>>>   @@ -523,10 +524,10 @@ static int check_ccs_header(struct 
>>> drm_i915_private *i915,
>>>         /* Sanity check whether this fw is not larger than whole 
>>> WOPCM memory */
>>>       size = __intel_uc_fw_get_upload_size(uc_fw);
>>> -    if (unlikely(size >= i915->wopcm.size)) {
>>> +    if (unlikely(size >= gt->wopcm.size)) {
>>>           drm_warn(&i915->drm, "%s firmware %s: invalid size: %zu > 
>>> %zu\n",
>>>                intel_uc_fw_type_repr(uc_fw->type), 
>>> uc_fw->file_selected.path,
>>> -             size, (size_t)i915->wopcm.size);
>>> +             size, (size_t)gt->wopcm.size);
>>>           return -E2BIG;
>>>       }
>>>   @@ -554,7 +555,8 @@ static int check_ccs_header(struct 
>>> drm_i915_private *i915,
>>>    */
>>>   int intel_uc_fw_fetch(struct intel_uc_fw *uc_fw)
>>>   {
>>> -    struct drm_i915_private *i915 = __uc_fw_to_gt(uc_fw)->i915;
>>> +    struct intel_gt *gt = __uc_fw_to_gt(uc_fw);
>>> +    struct drm_i915_private *i915 = gt->i915;
>>>       struct intel_uc_fw_file file_ideal;
>>>       struct device *dev = i915->drm.dev;
>>>       struct drm_i915_gem_object *obj;
>>> @@ -562,7 +564,7 @@ int intel_uc_fw_fetch(struct intel_uc_fw *uc_fw)
>>>       bool old_ver = false;
>>>       int err;
>>>   -    GEM_BUG_ON(!i915->wopcm.size);
>>> +    GEM_BUG_ON(!gt->wopcm.size);
>>>       GEM_BUG_ON(!intel_uc_fw_is_enabled(uc_fw));
>>>         err = i915_inject_probe_error(i915, -ENXIO);
>>> @@ -615,7 +617,7 @@ int intel_uc_fw_fetch(struct intel_uc_fw *uc_fw)
>>>       if (uc_fw->loaded_via_gsc)
>>>           err = check_gsc_manifest(fw, uc_fw);
>>>       else
>>> -        err = check_ccs_header(i915, fw, uc_fw);
>>> +        err = check_ccs_header(gt, fw, uc_fw);
>>>       if (err)
>>>           goto fail;
>>>   diff --git a/drivers/gpu/drm/i915/i915_driver.c 
>>> b/drivers/gpu/drm/i915/i915_driver.c
>>> index ffff49868dc5..ba4b71aedc40 100644
>>> --- a/drivers/gpu/drm/i915/i915_driver.c
>>> +++ b/drivers/gpu/drm/i915/i915_driver.c
>>> @@ -371,8 +371,6 @@ static int i915_driver_early_probe(struct 
>>> drm_i915_private *dev_priv)
>>>       if (ret)
>>>           goto err_ttm;
>>>   -    intel_wopcm_init_early(&dev_priv->wopcm);
>>> -
>>>       ret = intel_root_gt_init_early(dev_priv);
>>>       if (ret < 0)
>>>           goto err_rootgt;
>>> diff --git a/drivers/gpu/drm/i915/i915_drv.h 
>>> b/drivers/gpu/drm/i915/i915_drv.h
>>> index 9453fdd4205f..66aa2cd9aefe 100644
>>> --- a/drivers/gpu/drm/i915/i915_drv.h
>>> +++ b/drivers/gpu/drm/i915/i915_drv.h
>>> @@ -62,7 +62,6 @@
>>>   #include "intel_runtime_pm.h"
>>>   #include "intel_step.h"
>>>   #include "intel_uncore.h"
>>> -#include "intel_wopcm.h"
>>>     struct drm_i915_clock_gating_funcs;
>>>   struct drm_i915_gem_object;
>>> @@ -235,8 +234,6 @@ struct drm_i915_private {
>>>         struct intel_gvt *gvt;
>>>   -    struct intel_wopcm wopcm;
>>> -
>>>       struct pci_dev *bridge_dev;
>>>         struct rb_root uabi_engines;
>>> diff --git a/drivers/gpu/drm/i915/i915_gem.c 
>>> b/drivers/gpu/drm/i915/i915_gem.c
>>> index 9093d2be9e1c..7a9ce81600a0 100644
>>> --- a/drivers/gpu/drm/i915/i915_gem.c
>>> +++ b/drivers/gpu/drm/i915/i915_gem.c
>>> @@ -1140,9 +1140,10 @@ int i915_gem_init(struct drm_i915_private 
>>> *dev_priv)
>>>       if (ret)
>>>           return ret;
>>>   -    for_each_gt(gt, dev_priv, i)
>>> +    for_each_gt(gt, dev_priv, i) {
>>>           intel_uc_fetch_firmwares(&gt->uc);
>>> -    intel_wopcm_init(&dev_priv->wopcm);
>>> +        intel_wopcm_init(&gt->wopcm);
>>> +    }
>>>         ret = i915_init_ggtt(dev_priv);
>>>       if (ret) {
>>
>

