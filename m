Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 264B268352B
	for <lists+dri-devel@lfdr.de>; Tue, 31 Jan 2023 19:27:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 939C610E37D;
	Tue, 31 Jan 2023 18:27:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 430EA10E2AB;
 Tue, 31 Jan 2023 18:27:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675189659; x=1706725659;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=BM/DnObLh0oVzsJsBLfgNSnhUTgqik9GkCOd+/iewRI=;
 b=Y/QzNh1Eea9qPigmhHrtPsGjScBPi3XGbl0X/uPzdi8jVIfQcfWL3lNj
 iIIw1OVz2/99AIQ2/pc5diu7MYVhjjFV7AnfpULzfZQYo1DL201q74F7L
 k9OcLD+iexGdIYI7zVmZ4C0IYr2fRjwvh979xMMXJXH9nISYreA2DA4AA
 w3+vZzhvWVC3YGp96Kz+e3wDV3T1GrfNqMFssCjpgtB5gnhhLDAnAYfLf
 sggTYauC/tGjjyis0fJStsjtm2h5viMsCfjlyA3i4QtT3cl7jU8iHkAk6
 JA/VZ7zM5cBz9lvU+ClD12stnvxfrc5g9idOBNEfrwK0G6U4FIYDUPaPM g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10607"; a="326579941"
X-IronPort-AV: E=Sophos;i="5.97,261,1669104000"; d="scan'208";a="326579941"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2023 10:27:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10607"; a="993378263"
X-IronPort-AV: E=Sophos;i="5.97,261,1669104000"; d="scan'208";a="993378263"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga005.fm.intel.com with ESMTP; 31 Jan 2023 10:27:38 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 31 Jan 2023 10:27:38 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Tue, 31 Jan 2023 10:27:38 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.175)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Tue, 31 Jan 2023 10:27:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dismMuuMGRLbIkjRCXPCOisBXuSA0VbjiAio0yyC3Kp4yHB6VH82hoFzWdNhUwTQz2sO1vy2nm5Ekjs/WdaNrNffGqKT0rnl0zLLbuLnqerDTAmFwgEYd4NPkcNHcykiFNjUrHlcNvMs4Okj6YfIKXzSiue8TXCC78YzNWlP6pTpCsporFAlpgF7B5+IfYSYju3VRL0fgrnJRxMF6ovjp5fMySFggN8+bMk3gruWIv5pClPVf9iXR967exHE8KPfy/IRniq477OhlhBoyiw3DpzoVeF964LbLb38oUflpybUnjI5mSsxIvnL0+5JwQb4bhzlOrfIFSbnh29dcnE3ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TIAJ0U9fSiya3/HsrD4wE4dAjRxuXaAxm8frmTd1hFc=;
 b=YGIFUADsNZ3ln9+15uu0ptsenDKj5/59yK8mmt2t9Re7ZvsNNB+X4yTVOIOjX3I9roxdEFqEPwFjPUF0FdqyincMrSsrJ6xzm+X90RN8CDS9PWAMvYa6zfiugIFFppp6egGjGF0ych9Z1H4a6czJ5Ck++Bf2OjBQt57pjdpFjksp2KGX1v8zElAOfWHwakcfyQ209Wg1emDiQivgNRtmMW+Zrjp3+c39UBSC9iSv+EzMi7CKiBIKSND2oyqybeb62P//9AyI9RzhBsFI+19Kcy331Y6BXmMqOB1I8vlWyoAHQxadkEubpCQw0ZYNvcu1fCMHfKLSz9cqFRE151kUWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by IA1PR11MB6145.namprd11.prod.outlook.com (2603:10b6:208:3ef::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.36; Tue, 31 Jan
 2023 18:27:31 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::e1a3:6ad3:9f43:5f25]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::e1a3:6ad3:9f43:5f25%4]) with mapi id 15.20.6043.036; Tue, 31 Jan 2023
 18:27:31 +0000
Message-ID: <9566dc52-2ff1-760d-c9cb-fdfef9278f05@intel.com>
Date: Tue, 31 Jan 2023 10:27:29 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.6.1
Subject: Re: linux-next: manual merge of the usb tree with the drm-intel-fixes
 tree
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Stephen Rothwell
 <sfr@canb.auug.org.au>
References: <20230131130305.019029ff@canb.auug.org.au>
 <Y9kNRVppj5Uxa9ub@smile.fi.intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <Y9kNRVppj5Uxa9ub@smile.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0131.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::16) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|IA1PR11MB6145:EE_
X-MS-Office365-Filtering-Correlation-Id: 08d6f128-25c1-493a-b7be-08db03b8d0a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iZ/Au43rPuEvBNoYKuPq1IlX1jWcOvx2KKR+CulWtbNtaDaCpOmzc1WxW6pRCCbN4tV5b5PmQjbGqSfB3YWXG9GxAbTMSHtZZpjMeLcqzPJE0Xq7xbPp104pQjwqwjAFcCGBFOAhe/pdX44LLZzANGLtuUSiuP3rs9JmTOtzWFY5eXFjri68yf6Um5FDvOm6NNWx33XOYuQLdtbu1Q0OBMPIez1cMTgwnypO+aOOvNcbvmxpntF8MDXwp1ybiuMIrtH5syJa1ChS4yMKl+S7BPj/RxMm7hnCF3c7kPu4u6lrh6MTbP+3r8gQ0Iq7sfYkgppFV+FhColoaZBEwb5VoSwkBgpPM3mrVp4yc005jMWF72vByzPig57TYs17WRixt2mTtz2CJO1nEnG+SS3DQnA9ihfBDMHMpRNuguYD+SRmXelAqRYeQGkNi1DbXbsTSMmvmPfT4LiEzeffg0+nAe6igEiOZwj43/mrMmmFkmqxC03aeIh4zOC2gbknI6u2ICs8ZfieZJ1JEEMwtxtEBqqBudyZWyCB4hT+golpJAyt5UZDx5EQYaHvjn2TEvghY1d3CtMVwg1PaY2tKsZSIM7eEcKE6D63EjRRP4T3cftCFdmpJV6cTeFMkBwn3JmKEQrCGni5yvuPzmQ+pwkaa5TVlDh8v2PNwrBub/m3dRTL1l2ip5asOoaMHwI9e8Z6hs5x/W8SAUpcmy0GJCaEZvM9B+vmgjO6rEWZAs0EL6Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(39860400002)(346002)(376002)(366004)(396003)(136003)(451199018)(31696002)(31686004)(66476007)(8676002)(66556008)(4326008)(8936002)(41300700001)(66946007)(83380400001)(86362001)(478600001)(82960400001)(316002)(2906002)(6506007)(6486002)(38100700002)(26005)(186003)(5660300002)(6512007)(53546011)(7416002)(54906003)(36756003)(110136005)(2616005)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L2YzMDEwdVN5OElsUFRRcEtvdHRTa1ozYjlPdldSaUJSYWFHZTg5RnRTUU1O?=
 =?utf-8?B?SzQzZTVkb0tOOTJQYjE4WkRpU3pxSktMOWh1aldrSTNrMkFyTnVFUlNITVlw?=
 =?utf-8?B?UU9FTU9RQmhyYVd5aElCSVdSaHZBZkhKRG42WThqcXJWdXpSc25iNHluSWdm?=
 =?utf-8?B?enhRVDVaNzU2cTdFM29KOVU4cHBjaVFpNXZOd2llZzBHMWF6WVlKWmQxbW9s?=
 =?utf-8?B?SFdvUWVyVXFQcktlZjRQRG9MR3hhQWY5QjhKdG55NU9XQzZLMUpZNUllYTVH?=
 =?utf-8?B?UldpcC9HTkt2b3NyT3RuSzNSeWt3WndRWWpSWmJJd25kQkJac0d1a1Z6YVVJ?=
 =?utf-8?B?TVhEdVM4MmxrUmlzZHZCYzQ5MmRpUDVVSUN6WEkyRWFFVWlWOU1CU2NObFcz?=
 =?utf-8?B?VGtLL3J0ZE9janhZWXVEWXFRTkJNOE1BRHlVckpZMnlaRUZ2Q2tIOXR2OVFj?=
 =?utf-8?B?NzhhalBGampBbk5ZcU9ld09lOXdiTGEwV3J1SExsOWlPTENvKzBpZFpsM2xq?=
 =?utf-8?B?UUVDQkVCYU1IZEM3OSttZ0wraThTQU13d1FCRmNPRzBwWGZwYmNEa2tHZlMw?=
 =?utf-8?B?VzhGTUtBTWhZZVluMmtIMnJyRmkwZU5DSkgrTVlkdnFLRWlBRFZIZngrMUFZ?=
 =?utf-8?B?bVhDZ2NZeWFpckFFVTF0ZWJmQU1UdUMvUTQ3aGx3NzUrWFVOeUtheS9YSmdZ?=
 =?utf-8?B?TGIvTVJRVkc3OVlPcG1ZTlYvYkl5K1R0MkpvVkxyTE9ORG80MGJETlpscXha?=
 =?utf-8?B?T1M3RGJoZytXRkU1M0FKYllPR0RrZE0rRHVTZlkxbDRpNlBHemFQUjVCT0RV?=
 =?utf-8?B?a2g1SHNHbkpzbVlPN3ltZDRxR2ZhM2dLYzZUTWRSWXpLTTBKbC9XQTVoeEVk?=
 =?utf-8?B?NmlBKzU5aHFHb2lYK2JFWUIzWnIybDZpUmxtUDJZSlNEcC9lbE5LYTBxQ1Vx?=
 =?utf-8?B?R3Y0cUpOdUZQb3I0TmxEdDg3U1VxTFlLU0VWVS9waDN5SUdBenFjMXoxWU1k?=
 =?utf-8?B?M0NmNUdsUDBtb2tiRDJlY0g5QVRQaVFzbkpQcmVPdGhqYUNRZllsUkFHMk5y?=
 =?utf-8?B?OWd5RnN2ZitwZzB2WlVhdEJjTUdOY05kU0dWb1B4RTNraTlScDRJOEdVRy9q?=
 =?utf-8?B?SWlYWUNPbmxORG9ybGVGRGg5cEYrYVhIODh4Z1hCRmkxZDVEL2ljUXFWVjNw?=
 =?utf-8?B?QzhVN3dya0FnSGhmb3d2aVo1V2c5TU8za2N0aFZ4UHJOVW9xQm5RdmRQMTNj?=
 =?utf-8?B?dDRkQThhNzBhVy84WXFkNmI4TTNlTFZlVFlRSzU5RlUwbEt0ZFNrTTZJVVJC?=
 =?utf-8?B?MXAyaE1taFNEWTJLdldxUTYwb2dpa1ZKQTJIaVNGT2gxUmZYaHMyRWpNWTE4?=
 =?utf-8?B?RWRRelZZQWlsWGJTTzM5T2l4T2d4WlJnWnF0Y2ZrRnMzaU5ITDBwVTlMUmJy?=
 =?utf-8?B?UTFHbm5xZGpEN1FiV25lakZLekIxZzNyNnlEZGUzYUpsMW0vamVHY3o2SHVQ?=
 =?utf-8?B?R2ltYVNBaFViREdpdHkxdUF6UUVrc3EyaytwckRrR01HMXJjZlExL2xYb0Fh?=
 =?utf-8?B?MVM3NnR0YWh3K2tTZkdqZ3N6OGtRUmlDN0FURGZpMGJYSU5hYld6OThnZ252?=
 =?utf-8?B?T3lZZHRkSC90N0ZUTmhwRmI5SjNGY2FydlM1YzBuSXhyblp5MSsreEt1b1dV?=
 =?utf-8?B?S3pmd1NtUXN1RkJOK0VGWVYyQlNRMC9YWGFueTU5VU9aQTg4Wk13N3Y3ZFFH?=
 =?utf-8?B?SXp0b3YvbGtYOUhlUmFyOFBVa25MbU90ajYvbmFxV2JhTzFDeHk1a284Y25Z?=
 =?utf-8?B?RkZJVHJFTThWTy9leWRRN0szV3pHN0hSL3F2RjdRTU41UEg5TGVhUGpGdXZp?=
 =?utf-8?B?NFJieFluOEFzRzhETXZLdzNRRnRxd0h4VWpoaFMzbVVTamVmL2JsMHAxUnIw?=
 =?utf-8?B?emQ1MVBWYWxjeDdJUjQzS0Y3d2RrL01oQ0tueHlvWVhWUHEyKzJocHo5NFN0?=
 =?utf-8?B?djhkajNBclZmcndLZUduNTcybWV5eUNUd3BYdU1VV1ZoVHBLZWZ1ZCsrK2tM?=
 =?utf-8?B?OGN4dnZKS002b3haSExjUGZ5bjJ4SFZYVTNWMlp2SHZ1SXBwVVVBbndGUXZk?=
 =?utf-8?B?NitwcFEvVXVObFRaV1BYNXdlRnE5bExmSkgvczVLVUZISWdLWmQxZFhwTmhj?=
 =?utf-8?B?Tnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 08d6f128-25c1-493a-b7be-08db03b8d0a6
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2023 18:27:31.4384 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 42epu6PIDzWHK+yuB2lVv3O9NtmbbIctVjoDXfEg7VGfRap0GODuTT4fmZ67yNid6fBsB3D+1gtAQGUa0CYvLb/TwLUzXM5/G0m7tlKWI6w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6145
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Greg KH <greg@kroah.com>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/31/2023 04:44, Andy Shevchenko wrote:
> On Tue, Jan 31, 2023 at 01:03:05PM +1100, Stephen Rothwell wrote:
>> Hi all,
>>
>> Today's linux-next merge of the usb tree got a conflict in:
>>
>>    drivers/gpu/drm/i915/gt/intel_engine_cs.c
>>
>> between commit:
>>
>>    5bc4b43d5c6c ("drm/i915: Fix up locking around dumping requests lists")
>>
>> from the drm-intel-fixes tree and commit:
>>
>>    4d70c74659d9 ("i915: Move list_count() to list.h as list_count_nodes() for broader use")
>>
>> from the usb tree.
>>
>> I fixed it up (the former removed the code changed by the latter)
> Hmm... Currently I see that 20230127002842.3169194-4-John.C.Harrison@Intel.com
> moves the code to the drivers/gpu/drm/i915/gt/intel_execlists_submission.c.
>
> Is there any new series beside the above mentioned that touches that file and
> actually _removes_ that code?
As long as the removal is limited to list_count/list_count_nodes, that's 
fine. I only moved it from one file to another because the one and only 
function that was using it was being moved to the other file. If someone 
else has found a use for the same and wants to move it to a more common 
place then great. I assume there was no conflict happening in the i915 
specific code.

John.

>
>> 	and
>> can carry the fix as necessary. This is now fixed as far as linux-next
>> is concerned, but any non trivial conflicts should be mentioned to your
>> upstream maintainer when your tree is submitted for merging.  You may
>> also want to consider cooperating with the maintainer of the conflicting
>> tree to minimise any particularly complex conflicts.

