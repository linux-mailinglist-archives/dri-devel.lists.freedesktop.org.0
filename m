Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C84795FA40E
	for <lists+dri-devel@lfdr.de>; Mon, 10 Oct 2022 21:18:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13A3210E6C9;
	Mon, 10 Oct 2022 19:18:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A6DA10E6C9;
 Mon, 10 Oct 2022 19:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665429488; x=1696965488;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=XfXhl1QSTkv/CfthBx/iF/qs+bETWckYmAo7uXHhWMM=;
 b=aas1X2DqDysT8HlqqUZf9V2K8PHo1CZ5Pnr9ZUTI2VJsHcG0AqxQ1I6d
 D1aPiMKphlGQxcY0VXgqjn4JwkgZXXd0FtI8cb8lFopgox7Of6A8ZNKu/
 30O0eIZy3xZzzlWUpKW4VmiPFGTsHz8mJVGK2A9+GN/F4uzYHHhhBP7Bq
 j3jX1F+DcuCGTLt+jAqxIAh3nii/KS1+axXvpi82hiEaBWd5feoealxw5
 Rm12hf904h857wMu/VM9vqNC/BkpQnjYo3WGKVhVxyO3JbZM7v/hHRZic
 h7AiqZzr+8S4mHBdgJ4oVPWt1aFDX9ZlI7LROx0iU4ncGInndRQ3GwXNN Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10496"; a="330787062"
X-IronPort-AV: E=Sophos;i="5.95,173,1661842800"; d="scan'208";a="330787062"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2022 12:18:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10496"; a="577162106"
X-IronPort-AV: E=Sophos;i="5.95,173,1661842800"; d="scan'208";a="577162106"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga003.jf.intel.com with ESMTP; 10 Oct 2022 12:18:07 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 10 Oct 2022 12:18:07 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Mon, 10 Oct 2022 12:18:07 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.176)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Mon, 10 Oct 2022 12:18:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gy66X6twr81YQ8Oexcqk+uWcRwqUHmSOcf9jX1XqTt2rkXubWYgo4772nf2g+gMHEnSK4USBYmzt14cDr7/jB0OIG696ZUwIFACX+r1ZkKqONudSTYaBoQwA29jMeo/2GIFtSaV0r7Y9E6q4bBVDnjmp+y77J44m+A9mpcymRtmp7xHXdSm5hJYEthbaW8PWHIsRZhohcZFLGjulo8OjEUIfkRsztBqiQbNmP2f5gjCIIcKzuw2TOuFTAQ7lExLTUAB19L9yhXFMyY77TgxjtD4WD4dZ5jSx6e+iiNjlecqwv2TPXJAxMQvuaTg3trcPZuEgzTgbEY+xKuexQyljZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6pVW/4FzLmNSVKqX9x3kycIblL37hNSLhWS7a8iKX3Q=;
 b=lKxDNvx2pAjvF582t/5GeV+kSHwiOQnGJoFDRO0JyDwEIN6Jl3/IGZczdQBg5rn+m+NdSL82e3qZJdG+tIvMG/0uJj8POvV14rinwrGzIjidX6vB7vqTxrT0bR60GAe2ZNnu3htY75/RqX2rZMQlpT3PucXaA331KflnFYuhPaUmEVomtY1gzaH9BWj89DOAgmgwj/AjtupSiDiUuG43pGWUVzTFJwt/mMd+7vJPZzjFT1GQ8XqlrEpILxmFPrZImttbZ6gNV44xSwM3r+H5a6exPd4wEbe/OcocY4ZxbvRMXZDhDf4YhNd9pEICb+P2RdLdklvmAVLXrgFcAQbN1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by SJ0PR11MB4943.namprd11.prod.outlook.com (2603:10b6:a03:2ad::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.24; Mon, 10 Oct
 2022 19:18:04 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::87a1:bf2f:7377:3036]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::87a1:bf2f:7377:3036%7]) with mapi id 15.20.5709.015; Mon, 10 Oct 2022
 19:18:04 +0000
Message-ID: <9032f9a9-be19-9358-e458-91b5dca0d544@intel.com>
Date: Mon, 10 Oct 2022 12:18:02 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.2.2
Subject: Re: [PATCH 3/7] drm/i915/uc: use different ggtt pin offsets for uc
 loads
Content-Language: en-GB
To: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 <intel-gfx@lists.freedesktop.org>
References: <20220922221117.458087-1-daniele.ceraolospurio@intel.com>
 <20220922221117.458087-4-daniele.ceraolospurio@intel.com>
 <28a2896a-f240-e7b7-a127-b2782164ff58@intel.com>
 <31387d98-9e17-3998-6d38-ad3b5115f2f3@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <31387d98-9e17-3998-6d38-ad3b5115f2f3@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR08CA0048.namprd08.prod.outlook.com
 (2603:10b6:a03:117::25) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|SJ0PR11MB4943:EE_
X-MS-Office365-Filtering-Correlation-Id: 72db7282-dc62-47aa-4879-08daaaf427df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gBVzf00gTXCzByCXCY15jDQ5fBZWoZvyK3zMXZJV7HFcc8U0OuVkK+UyPoYL3R+9nVnJgql6wjHlCCp7+/9kHj0ZDluAzAAmVzR/DR4f93oialDec4FG5ydafxLtMQGxZWvO9jB8cxVl7bwguw5KZXhxsA+3JPXxSmRD87IBAf3CBT7ZnOX6sB3pAXFEz3GNg6hP+C0RlWK9ukdDMLM/6CRYzSwFzYtc6bLT+7moU+CiL+HDZMjUB/Y/oJFKew4WfElaBiZ/EdXjp6SRBifhyZfynj7BbPd2VsciuW36j9vwjT+kkZJTyVWuDrUB9WaRZNADbDZFZSFlhMDZMQceLkivX6qbsUYhYlmQU/VGH3q5rCho3oVHs+hOrqfP041nMACfJe1ehGeTttN+0bSc83S7fl29jdG0VyzLDFAUpHXFQkCQKeVW1t79xKETfmuz2y9V1qStwx7vHOFVns2KaCBToYaBnb6b/7p2ZpzL3j26nyr7D7M5ZGzl9t/uhMkPL0+KayZF+EsgZ8PIgzhwKibLyq5CqMZ6nC2jTu7eRMEsQBSYIhXV+VcTW//YADFnsblVk6g/fayNaMLF/wKQkeQqNiCxFfi9G9+ml1eZFyHY57wHhrzH9riIOizPO2rdk9N7Hv34joJ4Mb5fLOJ15xayDQJG4Ca8WGLNxrS8JFhYEZu8naJjBNOCpnIyhI5bZK8SpNqkC0zl3Vh9/j+4Wlk60lLFaK+sfrquJKLRefff5BOSvtYVKm32iuAit6bIdP2JYcqnPYbAsreZYPhrLPmfMIcT1GlU2ZElmHtLlbE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(39860400002)(346002)(366004)(396003)(376002)(136003)(451199015)(66556008)(83380400001)(2616005)(186003)(82960400001)(26005)(38100700002)(2906002)(41300700001)(107886003)(316002)(8936002)(478600001)(8676002)(6512007)(6506007)(66946007)(4326008)(6486002)(450100002)(53546011)(66476007)(5660300002)(31696002)(36756003)(31686004)(86362001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?di9LS0Y4RDRpSDlaNTlVTUtJenY1eHZyeVhKdzh1L0g4U2ZtQzBKTHU5NlNB?=
 =?utf-8?B?ZXNDaTVDaUk0amVUKzNOeHFCWnhEenVoUTJBZWZqdzErQ3VEWitBK1lFVmNl?=
 =?utf-8?B?MFdvWDhpQkVTajdBTnJzdFUrdUpBeGdPRlJvTTQ2czVtWnkrcG9NT3hCTnMx?=
 =?utf-8?B?d0gvamtNODVVSHRPSVYvOWV0eVNFNXFzWDlWQklobHpmTHhub0UvRTdYeGpU?=
 =?utf-8?B?Y1F6Lzg0cmh1cThoaGp6dDFqaWgzc09DemJOWk8xVE4vQUs3eXlqVmVVSXBi?=
 =?utf-8?B?d0tqTGZ5K1A1QXFCVmVzeVVaREpIWHpRRytsTEdDbDhPVTFIcTBzdXJ3S29l?=
 =?utf-8?B?K3JLMDJPUW94bjZjbkRPUlFaR0NRTUIwSkF0cHVBRmJJRnBjTWxxYzcwSkgz?=
 =?utf-8?B?ZGcwTDE5bHRxWWhMVlhUT0pmdUFvOVlXTjhPejVVNVNXM0tXbjc3TzB2ZW5z?=
 =?utf-8?B?aFNibElER2RscW44d0ZzemNPTTlVbnYxREZFSGNWZnAvSW5DVDRjS0xadjBV?=
 =?utf-8?B?RUViMmxkcjROMFA5cUY4Q2Y4QngzQU12M2kxQTlOMjNTOSt5eTQzY2V1QnI5?=
 =?utf-8?B?NEJ5TDlObHRFNWlsWUloRnNEU2dTeCtkeUNsdWEzS0wydUR4L3NXTkVucU5B?=
 =?utf-8?B?di9uSXdIYUtES0tuUW1YdENzd1JGWnRxaWtaelNmNVBud0c3S2prRGhXVW1m?=
 =?utf-8?B?bk5lVnZxYTlqQnVTVTJkR2xKZmxCL2N2b2pMTFhJWUpFekU4QVF4cEM1RkEw?=
 =?utf-8?B?SWx5aS9hMERxQXZ3RmZkeEdnaVJhYnFvV25JeElueE9ydU9hOVNZdlpORjZJ?=
 =?utf-8?B?ekp1aFdUNGt4bVl0bnppdjhYN2p0b3FLT2lTN0RRTjRCRHBhYUR4NjdKR3dF?=
 =?utf-8?B?c0FEZml6U2dmUXh6SnJUenRjUm1VOVZKNHBMVmVkRHRkelQzUC9OWjBIQi9N?=
 =?utf-8?B?cjZTaUpZSTUvS0NkWGFOcm9MckFaNnF3SkpTdDZSUjJuTTcxK3NodkZpUCtj?=
 =?utf-8?B?NS8vUEJDQlpTdjU0VS8yYmdNMWgzc3JZZ016SnM1KzRsdFloOGcvVUZuSkl3?=
 =?utf-8?B?YUFvMmJpL3hZbG9jdThTanhoR040elFSMFpBaHhEb09ET1J5aEFiUzI5alpt?=
 =?utf-8?B?TlpFUkxwbXNFaWdmRmVJV1lWdG43aVRQYXpQRTNQemdSdTU1NFVaNVY5Zy9q?=
 =?utf-8?B?bXRRYlR3OUQrclNxdHdKWlB4bEljTThjdkZ6dUJKMWVHa0I0YzYrdThIUFFr?=
 =?utf-8?B?MXBrd05RNjAxN0U3eWFSR0pVMWRMc2NZYSt6emxLOFZkcW5LZmF6TTRiZnhu?=
 =?utf-8?B?UEt0VVB6cTZNdUV1YzV1UlR2SnpwNC82VWduZ1Uxd3RsanVaYkp2WEFIL05s?=
 =?utf-8?B?U1N4cStUbmJWMDJwNFpmTzBpWU9TdE9wWVNHcGVuRHpkNzQrOFV1djkxV1Y4?=
 =?utf-8?B?RVpQTnhLMENhL2d0RnF2UzJweEo4WlNPYVRBcWozWmZ3WHh4Ry83ei9ldksx?=
 =?utf-8?B?b3NYWWVFWUY0NkdZUktJQ0kySEt6dndnTGVXdUduRjNIN0xYNk5rQk4vYkdE?=
 =?utf-8?B?S0Y2aTMzaENhMFZ5WndvOGkyMzhFT2p2N2t4U3NMaVRiWnlma3lIYU9MK3dY?=
 =?utf-8?B?cCtZeXVUKzkyQlBxeTFoL2E1ejB3YktYekNKNFl2SWJsM0pZbzlkZE5GczRG?=
 =?utf-8?B?Snh1NFFHc0JqRmh1YUc1NmVndVVEbDhvNU56S0owMFZBV0Z1aDVHcFEwK3FH?=
 =?utf-8?B?UWVSekwvWnFaeFVWL3lEcVdKd2JDTittUjJzcWhZK0hDUTdsSGNmRlFUUmR0?=
 =?utf-8?B?Y2lOeFFLc1p0M3ZWekZmR0hlSmFSeWdDWUxXZDVDTHhURmVyR3lMUHhDUlEy?=
 =?utf-8?B?WVJQeFJBTzE0dGI0MzdVUzhSRDBkUHJBNGFRQjNXMjNnMWpCL0JFQXExN3pl?=
 =?utf-8?B?UkM1azFkUTZhek1TTVBYRGJVakNCZXZpOWp2VTgrOTJBRUNId0lDaytYd3VE?=
 =?utf-8?B?SitNY1B2ZlZXellKUjhxeVQ5MC9SSEVFbVRpaWc1UCtSYWNqSG9SZ3F3cmtj?=
 =?utf-8?B?ZnlFSGVTazM2L1lxQ1BhYXlVOWpiN1pGV3VXaWhRQ2xpUkV4YXhhaDZQRmkr?=
 =?utf-8?B?bWR1Ry9lVXMwTFdPb2Z1dzJrSWIzaVM5cU9qdkV5dU00Wk44TXliRkRSQStO?=
 =?utf-8?B?MFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 72db7282-dc62-47aa-4879-08daaaf427df
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2022 19:18:04.4814 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l5NDPGO+78iJGMJhvf7IIKwMfDNhuCk+qRlBCu7QrAjcFjlFE+zReorwX1MuNDfWAmxYdfwkM+zJIJAsjDCTYGy8dj6TbTsLRGheof2Xqfw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4943
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
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 9/30/2022 16:42, Ceraolo Spurio, Daniele wrote:
> On 9/30/2022 4:24 PM, John Harrison wrote:
>> On 9/22/2022 15:11, Daniele Ceraolo Spurio wrote:
>>> Our current FW loading process is the same for all FWs:
>>>
>>> - Pin FW to GGTT at the start of the ggtt->uc_fw node
>>> - Load the FW
>>> - Unpin
>>>
>>> This worked because we didn't have a case where 2 FWs would be 
>>> loaded on
>>> the same GGTT at the same time. On MTL, however, this can happend if 
>>> both
>> The point being that the mapping is done using a single 'dummy' vma 
>> that can't be mapped to two different places at the same time? But 
>> isn't there a separate dummy object per uc instance. So there would 
>> be one for the GuC on the render GT and another for the GuC on the 
>> media GT. So each would be mapped separately to it's own unique 
>> address and there is no conflict? Or what am I missing?
>
> The issue is that without this patch all the dummy vmas are inserted 
> at the same address (start of the reserved node), which only works if 
> they can't be mapped at the same time. Note that we don't use the 
> generic vm functions to insert the dummy vma and we instead specify 
> the exact offset we want it mapped at. This patch makes it so that 
> each dummy vma has its own private offset.
>
Got it. I think it would be worth adding some documentation about the 
forced mapping address and why it is necessary.

>>> GTs are reset at the same time, so we can't pin everything in the same
>>> spot and we need to use separate offset. For simplicity, instead of
>>> calculating the exact required size, we reserve a 2MB slot for each fw.
>>>
>>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>>> Cc: John Harrison <john.c.harrison@intel.com>
>>> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
>>> ---
>>>   drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c | 22 +++++++++++++++++++---
>>>   1 file changed, 19 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c 
>>> b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
>>> index b91ad4aede1f..d6ca772e9f4b 100644
>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
>>> @@ -666,16 +666,33 @@ int intel_uc_fw_fetch(struct intel_uc_fw *uc_fw)
>>>       return err;
>>>   }
>>>   +/*
>>> + * The reserved GGTT space is ~18 MBs. All our blobs are well below 
>>> 1MB, so for
>>> + * safety we reserve 2MB each.
>>> + */
>>> +#define INTEL_UC_RSVD_GGTT_PER_FW SZ_2M
>>>   static u32 uc_fw_ggtt_offset(struct intel_uc_fw *uc_fw)
>>>   {
>>> -    struct i915_ggtt *ggtt = __uc_fw_to_gt(uc_fw)->ggtt;
>>> +    struct intel_gt *gt = __uc_fw_to_gt(uc_fw);
>>> +    struct i915_ggtt *ggtt = gt->ggtt;
>>>       struct drm_mm_node *node = &ggtt->uc_fw;
>>> +    u32 offset = uc_fw->type * INTEL_UC_RSVD_GGTT_PER_FW;
>>> +
>>> +    /*
>>> +     * To keep the math simple, we use 8MB for the root tile and 
>>> 8MB for
>>> +     * the media one.
>>> +     */
>>> +    BUILD_BUG_ON(INTEL_UC_FW_NUM_TYPES * INTEL_UC_RSVD_GGTT_PER_FW 
>>> > SZ_8M);
>> Doesn't this need to be >= ?
>
> No, this is a size check and 8MB is fine for a size.
>
>>
>>> +    if (gt->type == GT_MEDIA)
>>> +        offset += SZ_8M;
>>>         GEM_BUG_ON(!drm_mm_node_allocated(node));
>>>       GEM_BUG_ON(upper_32_bits(node->start));
>>>       GEM_BUG_ON(upper_32_bits(node->start + node->size - 1));
>>> +    GEM_BUG_ON(offset + uc_fw->obj->base.size > node->size);
>>> +    GEM_BUG_ON(uc_fw->obj->base.size > INTEL_UC_RSVD_GGTT_PER_FW);
>> Given that the firmware blob is loaded from the disk and therefore 
>> under user control, is a BUG_ON appropriate? Although there doesn't 
>> look to be any obvious way to abort at this point. Could the size 
>> check be moved to where we actually load the firmware rather than 
>> where it is being mapped?
>
> My idea was that we wouldn't release a blob that violates this without 
> updating the kernel first, so the only way a user can violate this is 
> if they try to load a bogus file. But I can still move this check to 
> fetch time and fail the fetch if the size is too big, so we can 
> fall-back to something sensible.
Can't trust those pesky users. They can download a HTML page of an ASCII 
dump of a firmware blob and try to load that. For example. I've seen 
that before. So yeah, I think there definitely needs to be a 'drm_err; 
goto fail' rather than a BUG_ON somewhere.

Otherwise, it all seems good.

John.


>
>>
>>>   -    return lower_32_bits(node->start);
>>> +    return lower_32_bits(node->start + offset);
>>>   }
>>>     static void uc_fw_bind_ggtt(struct intel_uc_fw *uc_fw)
>>> @@ -690,7 +707,6 @@ static void uc_fw_bind_ggtt(struct intel_uc_fw 
>>> *uc_fw)
>>>       dummy->bi.pages = obj->mm.pages;
>>>         GEM_BUG_ON(!i915_gem_object_has_pinned_pages(obj));
>>> -    GEM_BUG_ON(dummy->node_size > ggtt->uc_fw.size);
>> Why remove this?
>
> The new GEM_BUG_ONs in the function above perform a more strict test, 
> so this is redundant.
>
> Daniele
>
>>
>> John.
>>
>>>         /* uc_fw->obj cache domains were not controlled across 
>>> suspend */
>>>       if (i915_gem_object_has_struct_page(obj))
>>
>

