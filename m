Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 927A63EDA56
	for <lists+dri-devel@lfdr.de>; Mon, 16 Aug 2021 17:59:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97BDF6E030;
	Mon, 16 Aug 2021 15:59:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAD2189AE6;
 Mon, 16 Aug 2021 15:59:05 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10078"; a="215885514"
X-IronPort-AV: E=Sophos;i="5.84,326,1620716400"; d="scan'208";a="215885514"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2021 08:58:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,326,1620716400"; d="scan'208";a="519705107"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by FMSMGA003.fm.intel.com with ESMTP; 16 Aug 2021 08:58:56 -0700
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Mon, 16 Aug 2021 08:58:56 -0700
Received: from orsmsx606.amr.corp.intel.com (10.22.229.19) by
 ORSMSX609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Mon, 16 Aug 2021 08:58:56 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Mon, 16 Aug 2021 08:58:56 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.175)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Mon, 16 Aug 2021 08:58:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P82xolWLKsuo1h391W/Woaze/9svaHaAgpbmcb93+JgCcv1R83BP2pfK2emuQOUpssjEbN3+3CkACXcrAIKPniJ+DrkEoLP+af5id3x4RdTZz3QVOSFiS5J+tbneSqIOfHNxS9UbMqLS3yoqBl7/SLCIfAb0MTo6XQFfjlSvEVZP2iOjXPtaGy2BcqKqhjJjFb5MWnPfd51MJ3Y7+Kyk3P0s3MY4HTgqq9MaN8NKQ0JHagouBnaFkr95vd3a0KmgWfmiYPrSVp7P5flT9lkA0+EQA2jahJcEKlOYMY8hEV6iu0SwCFnIMCKkQcBvRy3WVk17qYhufNDKPILmqyagVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q4fxf69PPt76dnR/nRj4JdMcB9c/xRJkqU14rRjn4Vk=;
 b=L51h5eT5nW862xvRvoDnbUN+ryQSZFM49G4yYZ3PaZzTVQLP/BXP09Nkx8nEcuQpCUI0CUS9036dfpGgLuW6Xny2mXynpDIND6Qh0Z4qdQwqcUzeCTwoj0VLlsaRbRmoLsVXdyAcOw5g1ELMa6oTDQOtDYIb9HGW6CGVqkmwo4Vq2q8QG7nyZIcp48FeePEt8o4g2ueL/8BO99LezuXiUNtSJDDQFe1c77PN+AIiAChVjv/piuXxzfkloSHxwLP1xofgJZixFkPXsTnMXrVra1R3xDqAvNAODyyTFE83FZsiq1gvCoseol+pAqyOITTs8KgHQdwu6FaQLFVa5JsiQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q4fxf69PPt76dnR/nRj4JdMcB9c/xRJkqU14rRjn4Vk=;
 b=VYsSwSs3t/mGKffkAdIA/VZ7H84m8RSEL7/JSc7clGVDIx2nWCz3K0LFzHV0jfZEC1ObRQ7aU8IzVXxS+jctQ59Lq8s3wE6XL9Zu7UVO+R1fXtZ12zEf2hcVVsx4PjhtWxIDnxQMmd5LvFf91IciZe/BAMafkLYVFgRhz9YCaiQ=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 DM5PR11MB1915.namprd11.prod.outlook.com (2603:10b6:3:110::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.20; Mon, 16 Aug 2021 15:58:53 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::b96b:79f6:c1fb:13ff]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::b96b:79f6:c1fb:13ff%7]) with mapi id 15.20.4415.023; Mon, 16 Aug 2021
 15:58:53 +0000
Subject: Re: [Intel-gfx] [PATCH v6 10/15] drm/i915/pxp: interfaces for using
 protected objects
To: Daniel Vetter <daniel@ffwll.ch>
CC: <intel-gfx@lists.freedesktop.org>, Daniel Vetter
 <daniel.vetter@intel.com>, Chris Wilson <chris@chris-wilson.co.uk>,
 <dri-devel@lists.freedesktop.org>, Bommu Krishnaiah
 <krishnaiah.bommu@intel.com>, Lionel Landwerlin
 <lionel.g.landwerlin@intel.com>
References: <20210729020106.18346-1-daniele.ceraolospurio@intel.com>
 <20210729020106.18346-11-daniele.ceraolospurio@intel.com>
 <YRaDwS+dUMjbgd+z@phenom.ffwll.local>
 <a371dac0-1a5d-bf96-1193-7aac28d97b9d@intel.com>
 <YRqBKoqfokaasYmr@phenom.ffwll.local>
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Message-ID: <d27be6ed-dac9-5ae0-b7dd-aea2061908f7@intel.com>
Date: Mon, 16 Aug 2021 08:58:49 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.12.0
In-Reply-To: <YRqBKoqfokaasYmr@phenom.ffwll.local>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: MW4P220CA0029.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:303:115::34) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.65] (99.72.232.53) by
 MW4P220CA0029.NAMP220.PROD.OUTLOOK.COM (2603:10b6:303:115::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.13 via Frontend Transport; Mon, 16 Aug 2021 15:58:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e165ca06-0825-4524-915f-08d960cebeb2
X-MS-TrafficTypeDiagnostic: DM5PR11MB1915:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR11MB1915AEE39193C4558E0B8135F4FD9@DM5PR11MB1915.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lkiQZkz2ITs1xiakmbo8O2COKaYLgV89JmM2Ea+Yn2HwHccpzqTeZMxPu8LrhCyjxlKPathb90Xb+DtwAyazgpjYmiNlE3pTpB3TsxVWDS6UQIKM/p6uRBQJoJlN9FI7dBaIcfk7Wk38gkW0KIEUUFsHeyA1nkFQCN4H1D7xTGZ88UUPDudOpMcrYbUR+zTBq2Wfk3bD1oC7w+RUzZDaSCv49yooA0LT/vO0pX5E87aghPpaGU5JUWsRFhUTC5S1PhbJoacaeH9yA3U1CXXqdUrXcR6K4+WH1Apu8zKHKgRdypUzQHxnLsZFYTPo+L8d1hD10HS0FkOw4Mk92CGUAwPT2b/UdJK53ZZ3CAwKlzICVr153RpMm6x4I2IuPcKPhCShSLhsJfnu5h2tWxZoO4UlEqJ+18jyh0X43uiZ2x9xuiSPoNS3u4iJsXVktBRGGGgnBMknGu/F0+SY2KUYl8maBNHhR1wFD31xp5qwlFG1HUOJiWepnfFMo/LufLAwkMdRLcZyM5iYJWpnxvAOrkSwf9xXfK6PpXGF3gjisHOR0W2T4ZTLft1CtyES7Q5AFLeRE+xSU+L/AONrNbrAPJ6oqkb5CnVdOk+2T4hoEj6TW/0vV7rUJtWT1uwDBb+F7Mq78heT8IRBah7oBJTYBaOt7ve7vor+z2b7L3z+LiigJwONlH5DuQ+baeQilWBQQsfijbXuGg4AVCgIDfehm9zwQGmD5oJkAI1A3jgQ36w=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66476007)(66556008)(66946007)(6486002)(6916009)(966005)(31686004)(5660300002)(508600001)(107886003)(86362001)(53546011)(4326008)(31696002)(36756003)(26005)(186003)(956004)(8676002)(2616005)(16576012)(38100700002)(2906002)(8936002)(83380400001)(54906003)(316002)(30864003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d2dGUURyeW14NTZRUHBZZ3grTDR2VjZDOWk4RFJWN0VlL0d6cDJxSjlINEMy?=
 =?utf-8?B?UW1WOGNQdEUzTE9VemFNS1RDUlFKRmczbjZPLzRxQWloRFVBY0JITHBoTFFL?=
 =?utf-8?B?d2FPTXU5Z2JyemlVeDN0Ni9OQW5nN0RJdXdGcjdnZENvRjAzSGJkNlhrTlRh?=
 =?utf-8?B?MzdkUDRZQ3NBK28zYVZDWVl3dHBXcG1rUlhDbXo4bmQ2RFZsb05hYXRCK21L?=
 =?utf-8?B?YlFTaXhyVVpSckcwbkRQeVFWNUxQbC9kckZWck96QmJlNzBtYVZ2eTk2Qm1r?=
 =?utf-8?B?QitUK25CY0NMRlJYbHFmK3VoMW01RnZFTWZVLzdNRW9sU3o1Z3dvbkd2a2Y1?=
 =?utf-8?B?eU5pZVVzN0dUbDFvUjlFUTRwdVVlNlE0Zk9YRDc5UVVWcEtBNVJDUTFNcFlF?=
 =?utf-8?B?SERITmVkWjdNcFdkTGdJM0Zob2FwcW5sam56TXdWSm5ibmg2OTBFWk8zUmk2?=
 =?utf-8?B?VXdxeHFKNk5CQ1Q0S1V5ajI5bGNuNmZzaWl2RVJQdGpYK0ZSU2pkOEQzM0Nn?=
 =?utf-8?B?TFRvekgwdFUxdTVnUW0rdGZtcURxMHJDcDdxQnlIQTBpTzdIU3Z6UlgxN0FS?=
 =?utf-8?B?Rmxic3g1RlI5MWlnZ1M2cjFRVGp4aDFyWGtGY09RRi9PR3JPNExxdEY2VVNl?=
 =?utf-8?B?YXpndUdvN2k1aEtISUtQYlBpZWxnZXVsa1JDWjNnd2xyUXk3MDF4blVSOE9D?=
 =?utf-8?B?MG5Tb1BSOXlIMUs2NUpLNGNTSW5hL0dadUlBejluYUx3UWZkbTlKSlFUaHV3?=
 =?utf-8?B?M2s2bE1BcVFIYjZFY0psUllheDAxNWk0K1lKaTVwN050UWxxVVJ4S1J4M0k3?=
 =?utf-8?B?d2hiRWh6MzFwMTMwbUNiYk1TbXJyU3RGOGRlVXlvY0tQeVFKZmtQR1JlOHlU?=
 =?utf-8?B?Z3p2SElEYnR5TmdQcUZFdnZieW9JOEc4dTUrNzRCV3k4cm15aWpOK1FlaFo1?=
 =?utf-8?B?SEc4cHpEdXhFUG9NUC91L1RSMUp1QzAvaktCRG1jVVI5UU1LZFdFallWcFpq?=
 =?utf-8?B?MVBNaWJHWUFud0tPbTVld09wWXdhWXRKZ2poQm1pUG9hdDFwYm1NbHlHcW9E?=
 =?utf-8?B?bXhkUVBMY0dUY2EyYWM2aUZ2OHo1eGlvVm1oMm4rNm1rdzJOa3dHTC9nR0VH?=
 =?utf-8?B?TDVtQkNxRzh3aWFLVHQ0RWFSRVdMR2hiY3lrRUs3dlFmNVJaSVVTc0h6QnYv?=
 =?utf-8?B?MWxqaTI1aEdFZ290ZGVuVGZSby80UjdxZ1dLSjl6VmliRWdLcFdIZm13QTFU?=
 =?utf-8?B?WmdBMGNoLzF2L3laS3NCcjFYQnVsbVhaTW4rMjVORDFsdGh0UHNMb2t1ZUJq?=
 =?utf-8?B?TnFYWjVvS3p3ZkdGTmpBOFJieUtuVjB0OEE1dTE2TThiN2FoRzIxVm0wd0sx?=
 =?utf-8?B?YWxiSzVNY1J0SFdBZnFTaGEzbVBDdFIxLzB1Q21QbHk0OGVFcXFFZUJPTUE1?=
 =?utf-8?B?MEsyUXpyWHlxMWo2Vld3U1ZNVWZ3b0pMMFE3eldRKy9rVTlaMDd6YWNMSlZh?=
 =?utf-8?B?QjRVQVpGeTJvbXl4Zk9RUnhhZjlOYzlGeE1SVWwyRVREY3JNZWNtQUdLM1Vk?=
 =?utf-8?B?ZmR4VFFHb3hjdHdZbVZsNDloU0NCR2FIOG1vTlIrTm1naUR1STBuM0ZNNkVq?=
 =?utf-8?B?UkNoVFdLYzlaWnRub24zYkU0ZXlwTjN1azFpOVBTaFJqVkdYSC9XbnRKYTNV?=
 =?utf-8?B?anlhZzdCZkVtYndFR2xNSmFUYkczeXZSazk5VkVEU1F3cC9EeWhRdEpkWGNi?=
 =?utf-8?Q?sOLjccnk8qF1Puog4ydbvCdMexBeU/XaMTG4Y0k?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e165ca06-0825-4524-915f-08d960cebeb2
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2021 15:58:53.0112 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LWZajSRCfQpX/0JeHOmqGyFKh8Qxhn+/7PjWrx7WWx+tKV6leWJXI1aC9O9IhAJ+nPQO3lSVpZi6Edg6t2U8on1L97caDwobtNizMpxtS6k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1915
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



On 8/16/2021 8:15 AM, Daniel Vetter wrote:
> On Fri, Aug 13, 2021 at 08:18:02AM -0700, Daniele Ceraolo Spurio wrote:
>>
>> On 8/13/2021 7:37 AM, Daniel Vetter wrote:
>>> On Wed, Jul 28, 2021 at 07:01:01PM -0700, Daniele Ceraolo Spurio wrote:
>>>> This api allow user mode to create protected buffers and to mark
>>>> contexts as making use of such objects. Only when using contexts
>>>> marked in such a way is the execution guaranteed to work as expected.
>>>>
>>>> Contexts can only be marked as using protected content at creation time
>>>> (i.e. the parameter is immutable) and they must be both bannable and not
>>>> recoverable.
>>>>
>>>> All protected objects and contexts that have backing storage will be
>>>> considered invalid when the PXP session is destroyed and all new
>>>> submissions using them will be rejected. All intel contexts within the
>>>> invalidated gem contexts will be marked banned. A new flag has been
>>>> added to the RESET_STATS ioctl to report the context invalidation to
>>>> userspace.
>>>>
>>>> This patch was previously sent as 2 separate patches, which have been
>>>> squashed following a request to have all the uapi in a single patch.
>>>> I've retained the s-o-b from both.
>>>>
>>>> v5: squash patches, rebase on proto_ctx, update kerneldoc
>>>>
>>>> v6: rebase on obj create_ext changes
>>>>
>>>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>>>> Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
>>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>>> Cc: Chris Wilson <chris@chris-wilson.co.uk>
>>>> Cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
>>>> Cc: Jason Ekstrand <jason@jlekstrand.net>
>>>> Cc: Daniel Vetter <daniel.vetter@intel.com>
>>>> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com> #v5
>>>> ---
>>>>    drivers/gpu/drm/i915/gem/i915_gem_context.c   | 68 ++++++++++++--
>>>>    drivers/gpu/drm/i915/gem/i915_gem_context.h   | 18 ++++
>>>>    .../gpu/drm/i915/gem/i915_gem_context_types.h |  2 +
>>>>    drivers/gpu/drm/i915/gem/i915_gem_create.c    | 75 ++++++++++++----
>>>>    .../gpu/drm/i915/gem/i915_gem_execbuffer.c    | 40 ++++++++-
>>>>    drivers/gpu/drm/i915/gem/i915_gem_object.c    |  6 ++
>>>>    drivers/gpu/drm/i915/gem/i915_gem_object.h    | 12 +++
>>>>    .../gpu/drm/i915/gem/i915_gem_object_types.h  |  9 ++
>>>>    drivers/gpu/drm/i915/pxp/intel_pxp.c          | 89 +++++++++++++++++++
>>>>    drivers/gpu/drm/i915/pxp/intel_pxp.h          | 15 ++++
>>>>    drivers/gpu/drm/i915/pxp/intel_pxp_session.c  |  3 +
>>>>    drivers/gpu/drm/i915/pxp/intel_pxp_types.h    |  5 ++
>>>>    include/uapi/drm/i915_drm.h                   | 55 +++++++++++-
>>>>    13 files changed, 371 insertions(+), 26 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
>>>> index cff72679ad7c..0cd3e2d06188 100644
>>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
>>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
>>>> @@ -77,6 +77,8 @@
>>>>    #include "gt/intel_gpu_commands.h"
>>>>    #include "gt/intel_ring.h"
>>>> +#include "pxp/intel_pxp.h"
>>>> +
>>>>    #include "i915_gem_context.h"
>>>>    #include "i915_trace.h"
>>>>    #include "i915_user_extensions.h"
>>>> @@ -241,6 +243,25 @@ static int proto_context_set_persistence(struct drm_i915_private *i915,
>>>>    	return 0;
>>>>    }
>>>> +static int proto_context_set_protected(struct drm_i915_private *i915,
>>>> +				       struct i915_gem_proto_context *pc,
>>>> +				       bool protected)
>>>> +{
>>>> +	int ret = 0;
>>>> +
>>>> +	if (!intel_pxp_is_enabled(&i915->gt.pxp))
>>>> +		ret = -ENODEV;
>>>> +	else if (!protected)
>>>> +		pc->user_flags &= ~BIT(UCONTEXT_PROTECTED);
>>>> +	else if ((pc->user_flags & BIT(UCONTEXT_RECOVERABLE)) ||
>>>> +		 !(pc->user_flags & BIT(UCONTEXT_BANNABLE)))
>>>> +		ret = -EPERM;
>>>> +	else
>>>> +		pc->user_flags |= BIT(UCONTEXT_PROTECTED);
>>>> +
>>>> +	return ret;
>>>> +}
>>>> +
>>>>    static struct i915_gem_proto_context *
>>>>    proto_context_create(struct drm_i915_private *i915, unsigned int flags)
>>>>    {
>>>> @@ -686,6 +707,8 @@ static int set_proto_ctx_param(struct drm_i915_file_private *fpriv,
>>>>    			ret = -EPERM;
>>>>    		else if (args->value)
>>>>    			pc->user_flags |= BIT(UCONTEXT_BANNABLE);
>>>> +		else if (pc->user_flags & BIT(UCONTEXT_PROTECTED))
>>>> +			ret = -EPERM;
>>>>    		else
>>>>    			pc->user_flags &= ~BIT(UCONTEXT_BANNABLE);
>>>>    		break;
>>>> @@ -693,10 +716,12 @@ static int set_proto_ctx_param(struct drm_i915_file_private *fpriv,
>>>>    	case I915_CONTEXT_PARAM_RECOVERABLE:
>>>>    		if (args->size)
>>>>    			ret = -EINVAL;
>>>> -		else if (args->value)
>>>> -			pc->user_flags |= BIT(UCONTEXT_RECOVERABLE);
>>>> -		else
>>>> +		else if (!args->value)
>>>>    			pc->user_flags &= ~BIT(UCONTEXT_RECOVERABLE);
>>>> +		else if (pc->user_flags & BIT(UCONTEXT_PROTECTED))
>>>> +			ret = -EPERM;
>>>> +		else
>>>> +			pc->user_flags |= BIT(UCONTEXT_RECOVERABLE);
>>>>    		break;
>>>>    	case I915_CONTEXT_PARAM_PRIORITY:
>>>> @@ -724,6 +749,11 @@ static int set_proto_ctx_param(struct drm_i915_file_private *fpriv,
>>>>    						    args->value);
>>>>    		break;
>>>> +	case I915_CONTEXT_PARAM_PROTECTED_CONTENT:
>>>> +		ret = proto_context_set_protected(fpriv->dev_priv, pc,
>>>> +						  args->value);
>>>> +		break;
>>>> +
>>>>    	case I915_CONTEXT_PARAM_NO_ZEROMAP:
>>>>    	case I915_CONTEXT_PARAM_BAN_PERIOD:
>>>>    	case I915_CONTEXT_PARAM_RINGSIZE:
>>>> @@ -1798,6 +1828,18 @@ static int set_priority(struct i915_gem_context *ctx,
>>>>    	return 0;
>>>>    }
>>>> +static int get_protected(struct i915_gem_context *ctx,
>>>> +			 struct drm_i915_gem_context_param *args)
>>>> +{
>>>> +	if (!intel_pxp_is_enabled(&ctx->i915->gt.pxp))
>>>> +		return -ENODEV;
>>>> +
>>>> +	args->size = 0;
>>>> +	args->value = i915_gem_context_uses_protected_content(ctx);
>>>> +
>>>> +	return 0;
>>>> +}
>>>> +
>>>>    static int ctx_setparam(struct drm_i915_file_private *fpriv,
>>>>    			struct i915_gem_context *ctx,
>>>>    			struct drm_i915_gem_context_param *args)
>>>> @@ -1821,6 +1863,8 @@ static int ctx_setparam(struct drm_i915_file_private *fpriv,
>>>>    			ret = -EPERM;
>>>>    		else if (args->value)
>>>>    			i915_gem_context_set_bannable(ctx);
>>>> +		else if (i915_gem_context_uses_protected_content(ctx))
>>>> +			ret = -EPERM; /* can't clear this for protected contexts */
>>>>    		else
>>>>    			i915_gem_context_clear_bannable(ctx);
>>>>    		break;
>>>> @@ -1828,10 +1872,12 @@ static int ctx_setparam(struct drm_i915_file_private *fpriv,
>>>>    	case I915_CONTEXT_PARAM_RECOVERABLE:
>>>>    		if (args->size)
>>>>    			ret = -EINVAL;
>>>> -		else if (args->value)
>>>> -			i915_gem_context_set_recoverable(ctx);
>>>> -		else
>>>> +		else if (!args->value)
>>>>    			i915_gem_context_clear_recoverable(ctx);
>>>> +		else if (i915_gem_context_uses_protected_content(ctx))
>>>> +			ret = -EPERM; /* can't set this for protected contexts */
>>>> +		else
>>>> +			i915_gem_context_set_recoverable(ctx);
>>>>    		break;
>>>>    	case I915_CONTEXT_PARAM_PRIORITY:
>>>> @@ -1846,6 +1892,7 @@ static int ctx_setparam(struct drm_i915_file_private *fpriv,
>>>>    		ret = set_persistence(ctx, args);
>>>>    		break;
>>>> +	case I915_CONTEXT_PARAM_PROTECTED_CONTENT:
>>>>    	case I915_CONTEXT_PARAM_NO_ZEROMAP:
>>>>    	case I915_CONTEXT_PARAM_BAN_PERIOD:
>>>>    	case I915_CONTEXT_PARAM_RINGSIZE:
>>>> @@ -2174,6 +2221,10 @@ int i915_gem_context_getparam_ioctl(struct drm_device *dev, void *data,
>>>>    		args->value = i915_gem_context_is_persistent(ctx);
>>>>    		break;
>>>> +	case I915_CONTEXT_PARAM_PROTECTED_CONTENT:
>>>> +		ret = get_protected(ctx, args);
>>>> +		break;
>>>> +
>>>>    	case I915_CONTEXT_PARAM_NO_ZEROMAP:
>>>>    	case I915_CONTEXT_PARAM_BAN_PERIOD:
>>>>    	case I915_CONTEXT_PARAM_ENGINES:
>>>> @@ -2250,6 +2301,11 @@ int i915_gem_context_reset_stats_ioctl(struct drm_device *dev,
>>>>    	args->batch_active = atomic_read(&ctx->guilty_count);
>>>>    	args->batch_pending = atomic_read(&ctx->active_count);
>>>> +	/* re-use args->flags for output flags */
>>>> +	args->flags = 0;
>>>> +	if (i915_gem_context_invalidated(ctx))
>>>> +		args->flags |= I915_CONTEXT_INVALIDATED;
>>>> +
>>>>    	i915_gem_context_put(ctx);
>>>>    	return 0;
>>>>    }
>>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.h b/drivers/gpu/drm/i915/gem/i915_gem_context.h
>>>> index 18060536b0c2..d932a70122fa 100644
>>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_context.h
>>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.h
>>>> @@ -108,6 +108,24 @@ i915_gem_context_clear_user_engines(struct i915_gem_context *ctx)
>>>>    	clear_bit(CONTEXT_USER_ENGINES, &ctx->flags);
>>>>    }
>>>> +static inline bool
>>>> +i915_gem_context_invalidated(const struct i915_gem_context *ctx)
>>>> +{
>>>> +	return test_bit(CONTEXT_INVALID, &ctx->flags);
>>>> +}
>>>> +
>>>> +static inline void
>>>> +i915_gem_context_set_invalid(struct i915_gem_context *ctx)
>>>> +{
>>>> +	set_bit(CONTEXT_INVALID, &ctx->flags);
>>> Do we _really_ need a new bit in this already very complex state
>>> machinery, and can't we reuse the BANNED flag instead?
>>>
>>> This ctx->flags is atomic, unorderd, and that means you need barriers and
>>> everything.
>>>
>>> If you don't actually need the atomic state bit machinery because you're
>>> using simple locking, then pls use your own boolean, and document by which
>>> lock it's protected.
>> The BANNED flag is at the intel_context level, while I needed something at
>> the gem_context level to report out. Can make it a bool if you prefer.
>> The invalidation process is inherently racy (the teardown can always occur
>> after we've checked the flag) so no amount of locking can help there. The
>> flag itself is only set once and never cleared, so no risk of a set and
>> clear racing.
> Yes the invalidate is racy, but we still need to make guarantees
> internally in the kernel that nothing escapes and falls through cracks.

We can't make that guarantee, because we get the invalidation interrupt 
after the HW has already processed all the invalidations. A protected 
object might already be in use on an engine (in which case it is too 
late to pull it out) or have been submitted for a flip when we get the 
interrupt; we could also end up using the invalidated objects before we 
manage to process the interrupt. The whole invalidation tracking is best 
effort by HW design, AFAIU it was deemed acceptable to potentially get 1 
corrupted frame as long as we do our best to keep the window short.

>
> Wrt reporting out, this should be exactly the same flow as a gpu reset
> that results in a banned gem context. We really shouldn't duplicate
> infrastructure here.

AFAICS there is no banning of gem_context (unless it is named something 
different). There is banning of intel_context and full on banning of the 
file. There was an explicit request from mesa to add something new at 
the reset_stats level because what we already had didn't work. If there 
is a different solution that works for them I'm happy to switch (+ 
Lionel for comments).

>
>
>>>> +}
>>>> +
>>>> +static inline bool
>>>> +i915_gem_context_uses_protected_content(const struct i915_gem_context *ctx)
>>>> +{
>>>> +	return test_bit(UCONTEXT_PROTECTED, &ctx->user_flags);
>>> For immutable state (I really hope this is immutable) pls don't reuse the
>>> atomic bitfield of mutable state, but create a flag of your own.
>> It is immutable. Should we have a ctx->immutable_flags, or better a bool?
> Yeah just make it a bool, and add a kerneldoc comment that it's immutable
> and never changes.

Ok. The fact that this is immutable is already in the doc for the 
create_ext, but I'll add it next to the variable as well.

>
>>> Also please document all the rules around how this is set/changed in the
>>> kerneldoc header comments for the data structure. Finally if you never set
>>> it except at creation.
>>>
>>>> +}
>>>> +
>>>>    /* i915_gem_context.c */
>>>>    void i915_gem_init__contexts(struct drm_i915_private *i915);
>>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context_types.h b/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
>>>> index 94c03a97cb77..1aa2290aa3c7 100644
>>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
>>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
>>>> @@ -301,6 +301,7 @@ struct i915_gem_context {
>>>>    #define UCONTEXT_BANNABLE		2
>>>>    #define UCONTEXT_RECOVERABLE		3
>>>>    #define UCONTEXT_PERSISTENCE		4
>>>> +#define UCONTEXT_PROTECTED		5
>>>>    	/**
>>>>    	 * @flags: small set of booleans
>>>> @@ -308,6 +309,7 @@ struct i915_gem_context {
>>>>    	unsigned long flags;
>>>>    #define CONTEXT_CLOSED			0
>>>>    #define CONTEXT_USER_ENGINES		1
>>>> +#define CONTEXT_INVALID			2
>>>>    	/** @mutex: guards everything that isn't engines or handles_vma */
>>>>    	struct mutex mutex;
>>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_create.c b/drivers/gpu/drm/i915/gem/i915_gem_create.c
>>>> index 23fee13a3384..0e48629316bb 100644
>>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_create.c
>>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_create.c
>>>> @@ -6,6 +6,7 @@
>>>>    #include "gem/i915_gem_ioctls.h"
>>>>    #include "gem/i915_gem_lmem.h"
>>>>    #include "gem/i915_gem_region.h"
>>>> +#include "pxp/intel_pxp.h"
>>>>    #include "i915_drv.h"
>>>>    #include "i915_trace.h"
>>>> @@ -82,21 +83,11 @@ static int i915_gem_publish(struct drm_i915_gem_object *obj,
>>>>    	return 0;
>>>>    }
>>>> -/**
>>>> - * Creates a new object using the same path as DRM_I915_GEM_CREATE_EXT
>>>> - * @i915: i915 private
>>>> - * @size: size of the buffer, in bytes
>>>> - * @placements: possible placement regions, in priority order
>>>> - * @n_placements: number of possible placement regions
>>>> - *
>>>> - * This function is exposed primarily for selftests and does very little
>>>> - * error checking.  It is assumed that the set of placement regions has
>>>> - * already been verified to be valid.
>>>> - */
>>>> -struct drm_i915_gem_object *
>>>> -__i915_gem_object_create_user(struct drm_i915_private *i915, u64 size,
>>>> -			      struct intel_memory_region **placements,
>>>> -			      unsigned int n_placements)
>>>> +static struct drm_i915_gem_object *
>>>> +__i915_gem_object_create_user_ext(struct drm_i915_private *i915, u64 size,
>>>> +				  struct intel_memory_region **placements,
>>>> +				  unsigned int n_placements,
>>>> +				  unsigned int ext_flags)
>>>>    {
>>>>    	struct intel_memory_region *mr = placements[0];
>>>>    	struct drm_i915_gem_object *obj;
>>>> @@ -135,6 +126,12 @@ __i915_gem_object_create_user(struct drm_i915_private *i915, u64 size,
>>>>    	GEM_BUG_ON(size != obj->base.size);
>>>> +	/* Add any flag set by create_ext options */
>>>> +	flags |= ext_flags;
>>>> +
>>>> +	if (i915_gem_object_is_protected(obj))
>>>> +		intel_pxp_object_add(obj);
>>>> +
>>>>    	trace_i915_gem_object_create(obj);
>>>>    	return obj;
>>>> @@ -145,6 +142,26 @@ __i915_gem_object_create_user(struct drm_i915_private *i915, u64 size,
>>>>    	return ERR_PTR(ret);
>>>>    }
>>>> +/**
>>>> + * Creates a new object using the same path as DRM_I915_GEM_CREATE_EXT
>>>> + * @i915: i915 private
>>>> + * @size: size of the buffer, in bytes
>>>> + * @placements: possible placement regions, in priority order
>>>> + * @n_placements: number of possible placement regions
>>>> + *
>>>> + * This function is exposed primarily for selftests and does very little
>>>> + * error checking.  It is assumed that the set of placement regions has
>>>> + * already been verified to be valid.
>>>> + */
>>>> +struct drm_i915_gem_object *
>>>> +__i915_gem_object_create_user(struct drm_i915_private *i915, u64 size,
>>>> +			      struct intel_memory_region **placements,
>>>> +			      unsigned int n_placements)
>>>> +{
>>>> +	return __i915_gem_object_create_user_ext(i915, size, placements,
>>>> +						 n_placements, 0);
>>>> +}
>>>> +
>>>>    int
>>>>    i915_gem_dumb_create(struct drm_file *file,
>>>>    		     struct drm_device *dev,
>>>> @@ -224,6 +241,7 @@ struct create_ext {
>>>>    	struct drm_i915_private *i915;
>>>>    	struct intel_memory_region *placements[INTEL_REGION_UNKNOWN];
>>>>    	unsigned int n_placements;
>>>> +	unsigned long flags;
>>>>    };
>>>>    static void repr_placements(char *buf, size_t size,
>>>> @@ -356,8 +374,28 @@ static int ext_set_placements(struct i915_user_extension __user *base,
>>>>    	return set_placements(&ext, data);
>>>>    }
>>>> +static int ext_set_protected(struct i915_user_extension __user *base, void *data)
>>>> +{
>>>> +	struct drm_i915_gem_create_ext_protected_content ext;
>>>> +	struct create_ext *ext_data = data;
>>>> +
>>>> +	if (copy_from_user(&ext, base, sizeof(ext)))
>>>> +		return -EFAULT;
>>>> +
>>>> +	if (ext.flags)
>>>> +		return -EINVAL;
>>>> +
>>>> +	if (!intel_pxp_is_enabled(&ext_data->i915->gt.pxp))
>>>> +		return -ENODEV;
>>>> +
>>>> +	ext_data->flags |= I915_BO_PROTECTED;
>>>> +
>>>> +	return 0;
>>>> +}
>>>> +
>>>>    static const i915_user_extension_fn create_extensions[] = {
>>>>    	[I915_GEM_CREATE_EXT_MEMORY_REGIONS] = ext_set_placements,
>>>> +	[I915_GEM_CREATE_EXT_PROTECTED_CONTENT] = ext_set_protected,
>>>>    };
>>>>    /**
>>>> @@ -392,9 +430,10 @@ i915_gem_create_ext_ioctl(struct drm_device *dev, void *data,
>>>>    		ext_data.n_placements = 1;
>>>>    	}
>>>> -	obj = __i915_gem_object_create_user(i915, args->size,
>>>> -					    ext_data.placements,
>>>> -					    ext_data.n_placements);
>>>> +	obj = __i915_gem_object_create_user_ext(i915, args->size,
>>>> +						ext_data.placements,
>>>> +						ext_data.n_placements,
>>>> +						ext_data.flags);
>>>>    	if (IS_ERR(obj))
>>>>    		return PTR_ERR(obj);
>>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
>>>> index 1ed7475de454..04f33d163340 100644
>>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
>>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
>>>> @@ -21,6 +21,8 @@
>>>>    #include "gt/intel_gt_pm.h"
>>>>    #include "gt/intel_ring.h"
>>>> +#include "pxp/intel_pxp.h"
>>>> +
>>>>    #include "i915_drv.h"
>>>>    #include "i915_gem_clflush.h"
>>>>    #include "i915_gem_context.h"
>>>> @@ -751,6 +753,11 @@ static int eb_select_context(struct i915_execbuffer *eb)
>>>>    	if (unlikely(IS_ERR(ctx)))
>>>>    		return PTR_ERR(ctx);
>>>> +	if (i915_gem_context_invalidated(ctx)) {
>>>> +		i915_gem_context_put(ctx);
>>>> +		return -EACCES;
>>>> +	}
>>>> +
>>>>    	eb->gem_context = ctx;
>>>>    	if (rcu_access_pointer(ctx->vm))
>>>>    		eb->invalid_flags |= EXEC_OBJECT_NEEDS_GTT;
>>>> @@ -819,7 +826,7 @@ static struct i915_vma *eb_lookup_vma(struct i915_execbuffer *eb, u32 handle)
>>>>    	do {
>>>>    		struct drm_i915_gem_object *obj;
>>>>    		struct i915_vma *vma;
>>>> -		int err;
>>>> +		int err = 0;
>>>>    		rcu_read_lock();
>>>>    		vma = radix_tree_lookup(&eb->gem_context->handles_vma, handle);
>>>> @@ -833,6 +840,26 @@ static struct i915_vma *eb_lookup_vma(struct i915_execbuffer *eb, u32 handle)
>>>>    		if (unlikely(!obj))
>>>>    			return ERR_PTR(-ENOENT);
>>>> +		/*
>>>> +		 * If the user has opted-in for protected-object tracking, make
>>>> +		 * sure the object encryption can be used.
>>>> +		 * We only need to do this when the object is first used with
>>>> +		 * this context, because the context itself will be banned when
>>>> +		 * the protected objects become invalid.
>>>> +		 */
>>>> +		if (i915_gem_context_uses_protected_content(eb->gem_context) &&
>>>> +		    i915_gem_object_is_protected(obj)) {
>>>> +			if (!intel_pxp_is_active(&vm->gt->pxp))
>>>> +				err = -ENODEV;
>>>> +			else if (!i915_gem_object_has_valid_protection(obj))
>>>> +				err = -ENOEXEC;
>>>> +
>>>> +			if (err) {
>>>> +				i915_gem_object_put(obj);
>>>> +				return ERR_PTR(err);
>>>> +			}
>>>> +		}
>>>> +
>>>>    		vma = i915_vma_instance(obj, vm, NULL);
>>>>    		if (IS_ERR(vma)) {
>>>>    			i915_gem_object_put(obj);
>>>> @@ -2752,6 +2779,17 @@ eb_select_engine(struct i915_execbuffer *eb)
>>>>    	intel_gt_pm_get(ce->engine->gt);
>>>> +	if (i915_gem_context_uses_protected_content(eb->gem_context)) {
>>>> +		err = intel_pxp_wait_for_arb_start(&ce->engine->gt->pxp);
>>>> +		if (err)
>>>> +			goto err;
>>>> +
>>>> +		if (i915_gem_context_invalidated(eb->gem_context)) {
>>>> +			err = -EACCES;
>>> Shouldn't the normal banned context handling takee care of anything that
>>> slips through? Rolling your own racy invalidation checks doesn't look like
>>> a good idea.
>> This is to bail out early and report the error to userspace. If the
>> invalidation flag gets set after this check then we'll still catch it later
>> as you said, but IMO there is value in bailing out early when possible,
>> especially since it is a low-effort check. The invalidation flag can't be
>> cleared, so no risk of rejecting something that shouldn't be.
> Nah, that just papers over races and means you now have to validate more
> code for correctness - the later catching still must happen, but it's now
> much harder to trigger.
>
> Also, the context banning should do this for us already. Maybe a good idea
> to audit and document that, to make sure it's working correctly and we're
> using it correctly for pxp, but this wheel should exist and we don't need
> a new one.

Ok, I can rely on the intel_context being banned directly (it's checked 
earlier) but as mentioned above we do need but-in from mesa to drop the 
new invalidation flag at the gem_context level.

Daniele

>
> Except if the uapi promise is that we send back a different errno, but
> that again should be integrated into the context banning stuff.
> -Daniel
>
>> Daniele
>>
>>>> +			goto err;
>>>> +		}
>>>> +	}
>>>> +
>>>>    	if (!test_bit(CONTEXT_ALLOC_BIT, &ce->flags)) {
>>>>    		err = intel_context_alloc_state(ce);
>>>>    		if (err)
>>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c b/drivers/gpu/drm/i915/gem/i915_gem_object.c
>>>> index 6fb9afb65034..658a42a7fa07 100644
>>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
>>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
>>>> @@ -25,6 +25,7 @@
>>>>    #include <linux/sched/mm.h>
>>>>    #include "display/intel_frontbuffer.h"
>>>> +#include "pxp/intel_pxp.h"
>>>>    #include "i915_drv.h"
>>>>    #include "i915_gem_clflush.h"
>>>>    #include "i915_gem_context.h"
>>>> @@ -73,6 +74,8 @@ void i915_gem_object_init(struct drm_i915_gem_object *obj,
>>>>    	INIT_LIST_HEAD(&obj->lut_list);
>>>>    	spin_lock_init(&obj->lut_lock);
>>>> +	INIT_LIST_HEAD(&obj->pxp_link);
>>>> +
>>>>    	spin_lock_init(&obj->mmo.lock);
>>>>    	obj->mmo.offsets = RB_ROOT;
>>>> @@ -231,6 +234,9 @@ void __i915_gem_free_object(struct drm_i915_gem_object *obj)
>>>>    		spin_unlock(&obj->vma.lock);
>>>>    	}
>>>> +	if (i915_gem_object_has_valid_protection(obj))
>>>> +		intel_pxp_object_remove(obj);
>>>> +
>>>>    	__i915_gem_object_free_mmaps(obj);
>>>>    	GEM_BUG_ON(!list_empty(&obj->lut_list));
>>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h b/drivers/gpu/drm/i915/gem/i915_gem_object.h
>>>> index 48112b9d76df..137ae2723514 100644
>>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
>>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
>>>> @@ -269,6 +269,18 @@ i915_gem_object_clear_tiling_quirk(struct drm_i915_gem_object *obj)
>>>>    	clear_bit(I915_TILING_QUIRK_BIT, &obj->flags);
>>>>    }
>>>> +static inline bool
>>>> +i915_gem_object_is_protected(const struct drm_i915_gem_object *obj)
>>>> +{
>>>> +	return obj->flags & I915_BO_PROTECTED;
>>>> +}
>>>> +
>>>> +static inline bool
>>>> +i915_gem_object_has_valid_protection(const struct drm_i915_gem_object *obj)
>>>> +{
>>>> +	return i915_gem_object_is_protected(obj) && !list_empty(&obj->pxp_link);
>>>> +}
>>>> +
>>>>    static inline bool
>>>>    i915_gem_object_type_has(const struct drm_i915_gem_object *obj,
>>>>    			 unsigned long flags)
>>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
>>>> index 2471f36aaff3..38e4a190607a 100644
>>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
>>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
>>>> @@ -298,6 +298,7 @@ struct drm_i915_gem_object {
>>>>    			     I915_BO_ALLOC_USER)
>>>>    #define I915_BO_READONLY         BIT(4)
>>>>    #define I915_TILING_QUIRK_BIT    5 /* unknown swizzling; do not release! */
>>>> +#define I915_BO_PROTECTED        BIT(6)
>>>>    	/**
>>>>    	 * @mem_flags - Mutable placement-related flags
>>>> @@ -537,6 +538,14 @@ struct drm_i915_gem_object {
>>>>    		bool created:1;
>>>>    	} ttm;
>>>> +	/*
>>>> +	 * When the PXP session is invalidated, we need to mark all protected
>>>> +	 * objects as invalid. To easily do so we add them all to a list. The
>>>> +	 * presence on the list is used to check if the encryption is valid or
>>>> +	 * not.
>>>> +	 */
>>>> +	struct list_head pxp_link;
>>>> +
>>>>    	/** Record of address bit 17 of each page at last unbind. */
>>>>    	unsigned long *bit_17;
>>>> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp.c b/drivers/gpu/drm/i915/pxp/intel_pxp.c
>>>> index b0c7edc10cc3..f418281e8c10 100644
>>>> --- a/drivers/gpu/drm/i915/pxp/intel_pxp.c
>>>> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp.c
>>>> @@ -7,6 +7,7 @@
>>>>    #include "intel_pxp_irq.h"
>>>>    #include "intel_pxp_session.h"
>>>>    #include "intel_pxp_tee.h"
>>>> +#include "gem/i915_gem_context.h"
>>>>    #include "gt/intel_context.h"
>>>>    #include "i915_drv.h"
>>>> @@ -70,6 +71,9 @@ void intel_pxp_init(struct intel_pxp *pxp)
>>>>    	mutex_init(&pxp->tee_mutex);
>>>> +	spin_lock_init(&pxp->lock);
>>>> +	INIT_LIST_HEAD(&pxp->protected_objects);
>>>> +
>>>>    	/*
>>>>    	 * we'll use the completion to check if there is a termination pending,
>>>>    	 * so we start it as completed and we reinit it when a termination
>>>> @@ -166,3 +170,88 @@ void intel_pxp_fini_hw(struct intel_pxp *pxp)
>>>>    	intel_pxp_irq_disable(pxp);
>>>>    }
>>>> +
>>>> +int intel_pxp_object_add(struct drm_i915_gem_object *obj)
>>>> +{
>>>> +	struct intel_pxp *pxp = &to_i915(obj->base.dev)->gt.pxp;
>>>> +
>>>> +	if (!intel_pxp_is_enabled(pxp))
>>>> +		return -ENODEV;
>>>> +
>>>> +	if (!list_empty(&obj->pxp_link))
>>>> +		return -EEXIST;
>>>> +
>>>> +	spin_lock_irq(&pxp->lock);
>>>> +	list_add(&obj->pxp_link, &pxp->protected_objects);
>>>> +	spin_unlock_irq(&pxp->lock);
>>>> +
>>>> +	return 0;
>>>> +}
>>>> +
>>>> +void intel_pxp_object_remove(struct drm_i915_gem_object *obj)
>>>> +{
>>>> +	struct intel_pxp *pxp = &to_i915(obj->base.dev)->gt.pxp;
>>>> +
>>>> +	if (!intel_pxp_is_enabled(pxp))
>>>> +		return;
>>>> +
>>>> +	spin_lock_irq(&pxp->lock);
>>>> +	list_del_init(&obj->pxp_link);
>>>> +	spin_unlock_irq(&pxp->lock);
>>>> +}
>>>> +
>>>> +void intel_pxp_invalidate(struct intel_pxp *pxp)
>>> There is a lot of locking going on here. Please make sure it's all
>>> properly documented what the rules are in kerneldoc, even for existing
>>> stuff.
>>>
>>> Especially anytime there's anything tricky going on, like:
>>> - kref_get_unless_zero
>>> - test_bit (that's an unorderd atomic, so either you don't actually need
>>>     the atomic, or you need a pile of barriers and comments about them)
>>> - hiddent atomic ops like intel_context_set_banned or
>>>     i915_gem_context_set_invalid also need great care, least because the
>>>     current rules aren't documented really. So step one here before using
>>>     them is documenting the rules of how banning works.
>>>
>>>> +{
>>>> +	struct drm_i915_private *i915 = pxp_to_gt(pxp)->i915;
>>>> +	struct drm_i915_gem_object *obj, *tmp;
>>>> +	struct i915_gem_context *ctx, *cn;
>>>> +
>>>> +	/* delete objects that have been used with the invalidated session */
>>>> +	spin_lock_irq(&pxp->lock);
>>>> +	list_for_each_entry_safe(obj, tmp, &pxp->protected_objects, pxp_link) {
>>>> +		if (i915_gem_object_has_pages(obj))
>>>> +			list_del_init(&obj->pxp_link);
>>>> +	}
>>>> +	spin_unlock_irq(&pxp->lock);
>>>> +
>>>> +	/* ban all contexts marked as protected */
>>>> +	spin_lock_irq(&i915->gem.contexts.lock);
>>>> +	list_for_each_entry_safe(ctx, cn, &i915->gem.contexts.list, link) {
>>>> +		struct i915_gem_engines_iter it;
>>>> +		struct intel_context *ce;
>>>> +
>>>> +		if (!kref_get_unless_zero(&ctx->ref))
>>>> +			continue;
>>>> +
>>>> +		if (likely(!i915_gem_context_uses_protected_content(ctx)) ||
>>>> +		    i915_gem_context_invalidated(ctx)) {
>>>> +			i915_gem_context_put(ctx);
>>>> +			continue;
>>>> +		}
>>>> +
>>>> +		spin_unlock_irq(&i915->gem.contexts.lock);
>>>> +
>>>> +		/*
>>>> +		 * Note that by the time we get here the HW keys are already
>>>> +		 * long gone, so any batch using them that's already on the
>>>> +		 * engines is very likely a lost cause (and it has probably
>>>> +		 * already hung the engine). Therefore, we skip attempting to
>>>> +		 * pull the running context out of the HW and we prioritize
>>>> +		 * bringing the session back as soon as possible.
>>>> +		 */
>>>> +		for_each_gem_engine(ce, i915_gem_context_lock_engines(ctx), it) {
>>>> +			/* only invalidate if at least one ce was allocated */
>>>> +			if (test_bit(CONTEXT_ALLOC_BIT, &ce->flags)) {
>>>> +				intel_context_set_banned(ce);
>>>> +				i915_gem_context_set_invalid(ctx);
>>>> +			}
>>>> +		}
>>>> +		i915_gem_context_unlock_engines(ctx);
>>>> +
>>>> +		spin_lock_irq(&i915->gem.contexts.lock);
>>>> +		list_safe_reset_next(ctx, cn, link);
>>>> +		i915_gem_context_put(ctx);
>>>> +	}
>>>> +	spin_unlock_irq(&i915->gem.contexts.lock);
>>>> +}
>>>> +
>>>> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp.h b/drivers/gpu/drm/i915/pxp/intel_pxp.h
>>>> index 074b3b980957..4f7647f34153 100644
>>>> --- a/drivers/gpu/drm/i915/pxp/intel_pxp.h
>>>> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp.h
>>>> @@ -9,6 +9,8 @@
>>>>    #include "gt/intel_gt_types.h"
>>>>    #include "intel_pxp_types.h"
>>>> +struct drm_i915_gem_object;
>>>> +
>>>>    static inline struct intel_gt *pxp_to_gt(const struct intel_pxp *pxp)
>>>>    {
>>>>    	return container_of(pxp, struct intel_gt, pxp);
>>>> @@ -33,6 +35,11 @@ void intel_pxp_fini_hw(struct intel_pxp *pxp);
>>>>    void intel_pxp_mark_termination_in_progress(struct intel_pxp *pxp);
>>>>    int intel_pxp_wait_for_arb_start(struct intel_pxp *pxp);
>>>> +
>>>> +int intel_pxp_object_add(struct drm_i915_gem_object *obj);
>>>> +void intel_pxp_object_remove(struct drm_i915_gem_object *obj);
>>>> +
>>>> +void intel_pxp_invalidate(struct intel_pxp *pxp);
>>>>    #else
>>>>    static inline void intel_pxp_init(struct intel_pxp *pxp)
>>>>    {
>>>> @@ -46,6 +53,14 @@ static inline int intel_pxp_wait_for_arb_start(struct intel_pxp *pxp)
>>>>    {
>>>>    	return 0;
>>>>    }
>>>> +
>>>> +static inline int intel_pxp_object_add(struct drm_i915_gem_object *obj)
>>>> +{
>>>> +	return 0;
>>>> +}
>>>> +static inline void intel_pxp_object_remove(struct drm_i915_gem_object *obj)
>>>> +{
>>>> +}
>>>>    #endif
>>>>    #endif /* __INTEL_PXP_H__ */
>>>> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_session.c b/drivers/gpu/drm/i915/pxp/intel_pxp_session.c
>>>> index 67c30e534d50..0edd563a653d 100644
>>>> --- a/drivers/gpu/drm/i915/pxp/intel_pxp_session.c
>>>> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp_session.c
>>>> @@ -85,6 +85,9 @@ static int pxp_terminate_arb_session_and_global(struct intel_pxp *pxp)
>>>>    	/* must mark termination in progress calling this function */
>>>>    	GEM_WARN_ON(pxp->arb_is_valid);
>>>> +	/* invalidate protected objects */
>>>> +	intel_pxp_invalidate(pxp);
>>>> +
>>>>    	/* terminate the hw sessions */
>>>>    	ret = intel_pxp_terminate_session(pxp, ARB_SESSION);
>>>>    	if (ret) {
>>>> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_types.h b/drivers/gpu/drm/i915/pxp/intel_pxp_types.h
>>>> index 475e3312c287..be2bed3a2e4e 100644
>>>> --- a/drivers/gpu/drm/i915/pxp/intel_pxp_types.h
>>>> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp_types.h
>>>> @@ -7,7 +7,9 @@
>>>>    #define __INTEL_PXP_TYPES_H__
>>>>    #include <linux/completion.h>
>>>> +#include <linux/list.h>
>>>>    #include <linux/mutex.h>
>>>> +#include <linux/spinlock.h>
>>>>    #include <linux/types.h>
>>>>    #include <linux/workqueue.h>
>>>> @@ -43,6 +45,9 @@ struct intel_pxp {
>>>>    	u32 session_events; /* protected with gt->irq_lock */
>>>>    #define PXP_TERMINATION_REQUEST  BIT(0)
>>>>    #define PXP_TERMINATION_COMPLETE BIT(1)
>>>> +
>>>> +	spinlock_t lock; /* protects the objects list */
>>>> +	struct list_head protected_objects;
>>>>    };
>>>>    #endif /* __INTEL_PXP_TYPES_H__ */
>>>> diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
>>>> index 4393eef59d9b..2c9febdae6a5 100644
>>>> --- a/include/uapi/drm/i915_drm.h
>>>> +++ b/include/uapi/drm/i915_drm.h
>>>> @@ -1843,12 +1843,32 @@ struct drm_i915_gem_context_param {
>>>>     * attempted to use it, never re-use this context param number.
>>>>     */
>>>>    #define I915_CONTEXT_PARAM_RINGSIZE	0xc
>>>> +
>>>> +/*
>>>> + * I915_CONTEXT_PARAM_PROTECTED_CONTENT:
>>>> + *
>>>> + * Mark that the context makes use of protected content, which will result
>>>> + * in the context being invalidated when the protected content session is. The
>>>> + * invalidation is reported back to userspace via the RESET_STATS ioctl (see
>>>> + * relevant doc for details).
>>>> + * This flag can only be set at context creation time and, when set to true,
>>>> + * must be preceded by an explicit setting of I915_CONTEXT_PARAM_RECOVERABLE
>>>> + * to false. This flag can't be set to true in conjunction with setting the
>>>> + * I915_CONTEXT_PARAM_BANNABLE flag to false.
>>>> + *
>>>> + * In addition to the normal failure cases, setting this flag during context
>>>> + * creation can result in the following errors:
>>>> + *
>>>> + * -ENODEV: feature not available
>>>> + * -EPERM: trying to mark a recoverable or not bannable context as protected
>>>> + */
>>>> +#define I915_CONTEXT_PARAM_PROTECTED_CONTENT    0xd
>>>>    /* Must be kept compact -- no holes and well documented */
>>>>    	__u64 value;
>>>>    };
>>>> -/*
>>>> +/**
>>>>     * Context SSEU programming
>>>>     *
>>>>     * It may be necessary for either functional or performance reason to configure
>>>> @@ -2181,6 +2201,12 @@ struct drm_i915_reg_read {
>>>>    struct drm_i915_reset_stats {
>>>>    	__u32 ctx_id;
>>>>    	__u32 flags;
>>>> +	/*
>>>> +	 * contexts marked as using protected content are invalidated when the
>>>> +	 * protected content session dies. Submission of invalidated contexts
>>>> +	 * is rejected with -EACCES.
>>>> +	 */
>>>> +#define I915_CONTEXT_INVALIDATED 0x1
>>>>    	/* All resets since boot/module reload, for all contexts */
>>>>    	__u32 reset_count;
>>>> @@ -2959,8 +2985,12 @@ struct drm_i915_gem_create_ext {
>>>>    	 *
>>>>    	 * For I915_GEM_CREATE_EXT_MEMORY_REGIONS usage see
>>>>    	 * struct drm_i915_gem_create_ext_memory_regions.
>>>> +	 *
>>>> +	 * For I915_GEM_CREATE_EXT_PROTECTED_CONTENT usage see
>>>> +	 * struct drm_i915_gem_create_ext_protected_content.
>>>>    	 */
>>>>    #define I915_GEM_CREATE_EXT_MEMORY_REGIONS 0
>>>> +#define I915_GEM_CREATE_EXT_PROTECTED_CONTENT 1
>>>>    	__u64 extensions;
>>>>    };
>>>> @@ -3018,6 +3048,29 @@ struct drm_i915_gem_create_ext_memory_regions {
>>>>    	__u64 regions;
>>>>    };
>>>> +/**
>>>> + * struct drm_i915_gem_create_ext_protected_content - The
>>>> + * I915_OBJECT_PARAM_PROTECTED_CONTENT extension.
>>>> + *
>>>> + * If this extension is provided, buffer contents are expected to be protected
>>>> + * by PXP encryption and require decryption for scan out and processing. This
>>>> + * is only possible on platforms that have PXP enabled, on all other scenarios
>>>> + * using this extension will cause the ioctl to fail and return -ENODEV. The
>>>> + * flags parameter is reserved for future expansion and must currently be set
>>>> + * to zero.
>>>> + *
>>>> + * The buffer contents are considered invalid after a PXP session teardown.
>>>> + *
>>>> + * The encryption is guaranteed to be processed correctly only if the object
>>>> + * is submitted with a context created using the
>>>> + * I915_CONTEXT_PARAM_PROTECTED_CONTENT flag. This will also enable extra checks
>>>> + * at submission time on the validity of the objects involved.
>>>> + */
>>>> +struct drm_i915_gem_create_ext_protected_content {
>>>> +	struct i915_user_extension base;
>>>> +	__u32 flags;
>>>> +};
>>>> +
>>>>    /* ID of the protected content session managed by i915 when PXP is active */
>>>>    #define I915_PROTECTED_CONTENT_DEFAULT_SESSION 0xf
>>>> -- 
>>>> 2.32.0
>>>>
>>>> _______________________________________________
>>>> Intel-gfx mailing list
>>>> Intel-gfx@lists.freedesktop.org
>>>> https://lists.freedesktop.org/mailman/listinfo/intel-gfx

