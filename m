Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C9A85F7BAE
	for <lists+dri-devel@lfdr.de>; Fri,  7 Oct 2022 18:41:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E86310E361;
	Fri,  7 Oct 2022 16:41:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1446010E361;
 Fri,  7 Oct 2022 16:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665160894; x=1696696894;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=hXdD0ZjTjY0iVGZ709ocjn4hAA20rlKLuJgdr2O/owc=;
 b=PUmQ+UzjDrmm0BkEumsxnLb/DFjpviscbJm5yp4nERIRFjQ7bPLEjcFm
 kPHkIdZmAy1KlZi2K+bYkm1XOkS6KTr6e/cs85rbN/FsbnFp7sMmd/ATP
 zCAfAGEDvmz0XsCdeX/3pRg2YaNVjDgrWzLTDlOvMTXUc21WI7ztLFzQs
 EwqiGiKXsKGA3SmZshocPeaD2CWA5nWZC6a6m109Nw3vZwjrvFBFMJsLK
 UQRrMwWOwjjmeNgI2uJy3iJ7tcpVoUUVdbproHygdSmAsN27Vsctov7e6
 XTQH6jlGfOYX+5Mp1vIn14RmHVQnVTCRpP6+/ZO4Xb5henrXVxJMXchOl g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10493"; a="365721142"
X-IronPort-AV: E=Sophos;i="5.95,167,1661842800"; d="scan'208";a="365721142"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2022 09:41:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10493"; a="800358958"
X-IronPort-AV: E=Sophos;i="5.95,167,1661842800"; d="scan'208";a="800358958"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga005.jf.intel.com with ESMTP; 07 Oct 2022 09:41:32 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 7 Oct 2022 09:41:32 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 7 Oct 2022 09:41:32 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Fri, 7 Oct 2022 09:41:32 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.175)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Fri, 7 Oct 2022 09:41:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GqmSr04KKN0qkF0O6mB3BDs9PZTEmWiMeF3FhJSJQT8LWCHy2E5m4xriKdxbCxi2TTPFcAZnHPrIuJdOPp+qRJ+lgRuhMz+GbJ+akx7oMhSW5vk8RU2yAavZbUIlWNKWWmXxxFDXnL1LI0PBQHrsp/vzPOvrPdds5ytHWu0IMHuCwVHuiETFIgqa4/qIrrG4JS4Q8NPADPTm3PbHVat0BOwyjo4WbRZ6ooO9kQD8O2aB8xjXv8PREYPlMck9hEBCkvbi4LOlrpQEMrslCCQvAIKHJyLOdQ5LlUL4473Ypm8wB+zwuu5iVZHKjjdZY5/ZpgB4wLwL7YXtMN2TZI5STw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GEfEdJ2v9T1ZepdjbJhSIcPwQOF/IKcz+yE4nvYFpNs=;
 b=T+gk2mxKSGXwk/bHtQvXCPPI0U5faJSvySLszmrFVelLcx3L50OwhALuaSqPF9KFDVQLL97M+actaJRiQ5n85wjYwlnTwTNgkvkgZ8E2oG/3VdSyiqiiqU9Xy4hLuF3paYwOI7xFm1Sbhgzso/XRN7RMu40mDLNvkvDmjcl5EM5m+jcPrSahinzHmAXoAOhsLBP/dKjYElMy8fOy03FmDig5B0NJE62v4eZKs6nVIeGmdGIriEVhmmnKC4Ko/xAMb+7DHRcz6kKoiep3DWThimLex5iOlabjoXMfH1QA9jQGtsV1vvfueBI/zoU//Z1glnrRCBbFGLEUzKV0Xy4b+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5409.namprd11.prod.outlook.com (2603:10b6:610:d0::7)
 by BL1PR11MB5554.namprd11.prod.outlook.com (2603:10b6:208:31d::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.24; Fri, 7 Oct
 2022 16:41:25 +0000
Received: from CH0PR11MB5409.namprd11.prod.outlook.com
 ([fe80::54de:6030:7501:b7ae]) by CH0PR11MB5409.namprd11.prod.outlook.com
 ([fe80::54de:6030:7501:b7ae%8]) with mapi id 15.20.5676.032; Fri, 7 Oct 2022
 16:41:25 +0000
Message-ID: <1c7e171b-e5e8-7197-ddbc-346bac86176d@intel.com>
Date: Fri, 7 Oct 2022 19:40:36 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v13 5/9] drm/i915: Check for integer truncation on
 scatterlist creation
Content-Language: en-US
To: Kees Cook <keescook@chromium.org>, Linus Torvalds
 <torvalds@linux-foundation.org>
References: <20220928081300.101516-1-gwan-gyeong.mun@intel.com>
 <20220928081300.101516-6-gwan-gyeong.mun@intel.com>
 <CAHk-=wivJwvVbMUKma8600F6qaVLZHT=BY90SEnjiHWw2ZUVEg@mail.gmail.com>
 <202209281102.A86D736@keescook>
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
In-Reply-To: <202209281102.A86D736@keescook>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P193CA0097.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:88::38) To CH0PR11MB5409.namprd11.prod.outlook.com
 (2603:10b6:610:d0::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5409:EE_|BL1PR11MB5554:EE_
X-MS-Office365-Filtering-Correlation-Id: b74003b3-885e-4f87-dcc7-08daa882c605
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pIn7Zg8U693/XI7M6nGZbVkSePcRYQLfdTeL/N18PysZzZxiMYiwgRIsHnvBb+3F9HB2lIkBN/objC6Mwu03epIp9yJ2t7dAbmwX+PztznYcqO335U/19lioEkk8jiy2dmc5D1nWgpX/+xeGlB7w+/aUNprhH4KhsNbIefZdrWFJmZForYP0AoCvJCAh2tYoNLbTXSfDsPpJG5J+qMh74pnSSq2gIBaBXfH9PbrghMaQpfIDDCh7XcG+K9duFOZEARELi0DVD4W6MmqtfTZ6xmr8vfsWBJLKM3JqVQOsfHZN2qTbsL4yTRH2C5/H72lf5IsmdYeNnZGQVX1F6J6+Oki8KpKVgHY9LGvO5BRNY45QiEyWZMWhXiVqfW6WpHjK8belsJJY+WiV1uxqRw9kLn+tLlfrZjy+RG+oywUWn+/bXnl6/s0LtPgoZuIMm3Ymt4j9s3ls35gCz302MQ+iMqt4wsfGRJlEUqLV7WfiudpBrCC8oGe0cEpegCV+ouLqRS6e/2qVCISDbUH1Iia6THCpllCSvGcQ53jq+Bz/FMjEODLBUI52+wxYGhTBhU2H1T4BH+YRi+Os0UjxlD02H+ctvL+BR6dxxb1/VRttxKvuXtm/1UkuxPTCq4sW6pkSHblneLBoiWG8Dc6vU3FuSyRQD1D/65rfY1XHRkzaJUmzV0BJaTBqPyS26hy8N4lZ6mPshgJcxDt3ScIgNz+Nv+e/92LhphVib6ENdJYgebiBjCbWSL6NMwGy4hEbNIGvduTFqgUKUbeS6Aztziy0JY6rRqscVuB6S+1izX6eiJM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5409.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(396003)(376002)(136003)(346002)(39860400002)(366004)(451199015)(36756003)(38100700002)(86362001)(31696002)(316002)(6486002)(110136005)(8936002)(82960400001)(8676002)(4326008)(66556008)(41300700001)(5660300002)(4744005)(186003)(2906002)(83380400001)(6666004)(478600001)(7416002)(66476007)(2616005)(53546011)(6506007)(66946007)(6512007)(31686004)(26005)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bWozTnBaY0E4amE3UG5PZ09ITWd3b0tLcUFrNUhONHBtc0VaOEJSWE9oeVFK?=
 =?utf-8?B?TTdtZFQzaHAyakRqbnBORTFLeUpJaGxKWmdzcXAzbktOU01QZUQxV3dueW1y?=
 =?utf-8?B?TkwzR3QwaWoraXFVZHFIWFlnR3NEdUxoZWtiUnB4c0ZINHRiNW9mTG9xaXMw?=
 =?utf-8?B?cTJ6KzFLdStnbVNvc2dDQkpKM3ZLTXFZc0xSZEdSeURBNmdVKzVEOWpmSmxV?=
 =?utf-8?B?N2NDVFpVWk1pcGF1U0Zyek1KQ2pFeEQxTGZhcHpIMDVnRjMyc0ZhTWROZEJP?=
 =?utf-8?B?RUZlSUVDdDV4cTNTZ1dXeHNUSTNQY3UvT3ZJdXYxb0dYRVRIazdUTi9CY0Js?=
 =?utf-8?B?QkhReEN4M05iSkZ0V04xbkw0cklOU25oWXUwU1RlL1ZCdUU4YmxaRlZlTUx3?=
 =?utf-8?B?TWtTRkFvWWtCeWpzMkdxUHBkTHhVaEdvTjFLeHY2Q2FYNG5TMStNUW90cmtV?=
 =?utf-8?B?NWRyUVp3bDYyeUVlMjRMdVcwLzZOVDN4UC9VMk9panFYcE5iVUtzWlNBY0NQ?=
 =?utf-8?B?My9lRjA5SGhqUnhMK0JlYlY4Nnp2akhIL2pTOXJrTUZXR0ZWdnVlV1pZMFkx?=
 =?utf-8?B?RnJkWDBxZ1dWcWpjR2xWSndhakRmWlZUbWlvZFRwbmpRS2dyWEhVYkM0MHlt?=
 =?utf-8?B?RDJCRmJ5T0RmYmZwTVFPT0c2RTBpOWFIS2pqOXRaOUxuWjlQQTdGOEJwQVN0?=
 =?utf-8?B?alRha01OSGp3c09zck1IQWNQdVJtQktQMEZRZEl0Smh0ZnZJaEs4WlRGMG1I?=
 =?utf-8?B?VjlwemlxZUFvVmNIOGYzSW5sWFAvelNwVHRwNUx3K3MwODJKMlZnS3VxTFJp?=
 =?utf-8?B?RHdyc0oyOHdFRHdiei9MNVdYb0lFeXp4WGVlV1Arb1FFcFh2Nk5STGNzdFN1?=
 =?utf-8?B?alhHQ3Yxams0SmRkWGFlbE8xazlMUGdFV2t2ZkZuOGdYN3JybnJMN3N2eWRE?=
 =?utf-8?B?OFNMbGNJOXlFbHlaSUkrRnV2bThXODlVWjcwbXV6NEJ6d0FDWmhPUUxnK0ZZ?=
 =?utf-8?B?RGtLVVJ1dFJJV2ZxK0g5Nlh3djJBQ0lOSFZUb2xUM2hSZTVKWmZlajR4dzNS?=
 =?utf-8?B?OVNjc3VGZXRXVHpFLzNCVGNlTjJiTjVvL1BLNVNxMXdhZjVPYUtGQU5CbHlF?=
 =?utf-8?B?amhyTncvWXZEU2VNNkxEYmJUTkFaV0lrMmtTWUJWNFZkMlZJYnVtdGY5TG9y?=
 =?utf-8?B?SUFFOVBnUUwvUlgreXNodmxWQmtoZGw3RmluK0VuWXY1bTVoVzNSMm9yTkZz?=
 =?utf-8?B?aWc3bFd2MmxZa2ZacWdUem1lNlVHc1ZiTmw0dVR5U0JTT3g5ZVlzUE9iZ3VM?=
 =?utf-8?B?NHE2REdwdXdEUjBFRUZJeklZUStiVENmaWw2L3krMkFqU2VKTk1vc2h6NkRa?=
 =?utf-8?B?SHZ1MjJCUHhLTnhTaGFMSEcwQmFDcnhuZy9IRDN6ckwybFd2Z005OTJNTmlZ?=
 =?utf-8?B?bVB3TUNwWDQ2amZSUE9SQXFmalB5VTF3SDlBeTkwdkNXd3JxdSsvWFdwV2Jm?=
 =?utf-8?B?S2NLREdmUWpacWNOU0krbVFwTTV5RndVcUlLdlNtQXBRRGFDcHkrRXhxN2FP?=
 =?utf-8?B?b00ySFRIZExrcUY4ckN5RXRaejN0NmxoN0VvVmdyUXJ1NG1LemszeEhpZVZM?=
 =?utf-8?B?UmhRZVpBUmFSeEl3cHhGVGU1S2RBSWVzMlByOCtkWS9ueUVXNUpadUQ0N3c0?=
 =?utf-8?B?T2pHdklhYnVESkU0N25uQmR4TTJQbjJTaTBhVVdGMTFmRlFRYkdxejg4WFJ0?=
 =?utf-8?B?Sm1zb1hhc2FLVXhWVjFZbUkrKytWK3ViSjJzekgyRGdKNVJwb2Z0TWc5WVFQ?=
 =?utf-8?B?ZkJQMXBVZUx0bHF2N0RnQUhSdENheFFjWlZjVG12UEtRa2txWXUrVWZsejBZ?=
 =?utf-8?B?SEtHTHI4ejlxWmlNZjZPSHZiUTdNRUhXMUFDTnJZZk4xQnlmMDZhYVVDQzlD?=
 =?utf-8?B?NTRzVVdFNTJkR21IL1hHTlloR3gyTlg3dUR6NFJtZVRlZjVEblp6QnA4SGJC?=
 =?utf-8?B?VzNMRy81ZmFPVElTU2Y3c0lxam1scDRnNzEyRmR1eENhK2NZY3dVVkhONDA1?=
 =?utf-8?B?UXZEYjd0SGlXeGdyakNQTURSN2VESFNjSlF3MFhQY0tnRkUxclcvTWU0STFk?=
 =?utf-8?B?Tkszc1gxbWpFc1NpN1BaS0p0TXJzbGc5ckVZSldzT1BKTlc5N2p4c1BrajJN?=
 =?utf-8?B?MEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b74003b3-885e-4f87-dcc7-08daa882c605
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5409.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2022 16:41:25.3302 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OC/tG4ewmci69i4S6Lh5PCqiy8488EkWxbbUetzVfZ8CLxBY7Tw3Tn0kbfTYanNh7LkfTFBrSRDsCwhajGbrvvsXMIkDBTSfduJ/5IMwuko=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5554
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
Cc: gustavoars@kernel.org, trix@redhat.com, dlatypov@google.com,
 llvm@lists.linux.dev, linux@rasmusvillemoes.dk,
 dri-devel@lists.freedesktop.org, chris@chris-wilson.co.uk,
 linux-hardening@vger.kernel.org, andrzej.hajda@intel.com,
 linux-sparse@vger.kernel.org, matthew.auld@intel.com,
 andi.shyti@linux.intel.com, airlied@redhat.com,
 thomas.hellstrom@linux.intel.com, jani.nikula@intel.com,
 intel-gfx@lists.freedesktop.org, nathan@kernel.org, mchehab@kernel.org,
 mauro.chehab@linux.intel.com, ndesaulniers@google.com,
 linux-kernel@vger.kernel.org, vitor@massaru.org, luc.vanoostenryck@gmail.com,
 nirmoy.das@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Linus and Kees, I also understood that I should not make and use the 
macro that performs assignment and checking at the same time, and I will 
drop it and update it.

Kees, the overflows_type() macro had several updates as input from you 
and the community, and there is an advantage when moving to Linux common.
What are your thoughts on continuing to add the overflows_type() macro 
to overflows.h?

Br,

G.G.

On 9/28/22 9:06 PM, Kees Cook wrote:
> On Wed, Sep 28, 2022 at 10:09:04AM -0700, Linus Torvalds wrote:
>> Kees, you need to reign in the craziness in overflow.h.
> 
> Understood. I've been trying to help the drm folks walk a line between
> having a bunch of custom macros hidden away in the drm includes and
> building up generalized versions that are actually helpful beyond drm.
> But I can see that it doesn't help to have a "do two things at the same
> time" macro for the assignment checking.
> 
