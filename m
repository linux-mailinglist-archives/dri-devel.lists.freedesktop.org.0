Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DFE26F0BD7
	for <lists+dri-devel@lfdr.de>; Thu, 27 Apr 2023 20:25:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5A4F10E108;
	Thu, 27 Apr 2023 18:25:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7368210E108;
 Thu, 27 Apr 2023 18:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682619904; x=1714155904;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=PtQ68yBfrMKEBjIPqEERM7B7C32duH6axciHsuH4MPk=;
 b=PFGTJlaSdW/gfCxTYmMERXj060Yzrf+0qFdFUuoIt7m68BNs2ET8Xy3I
 izNla9YoQUPFDDxz09aCwDnTdVN6Ocux+bU0SysFGhRWgRRoEE3xxoZGy
 SOGIv69cd8HkAnDzi8tLXow1I1ltn/Lsf70J6fSW0eJZ1zJHXw2yQLGgG
 dzOaCvEnGYpZEfuid0PxWNP/QU7yUEDcjBMTRp6FU7zUmStdkJnF4V37H
 ByEql2Ye8biZEG7wM8fML3qIVCyg3zx89nyDEXM062EGRAJMyHOP/7YHA
 +zl6WZhzAiv58peUip2Nuoi+s3hGiMPyd9bEcS11+YuAehEtGaKaWq8gB A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="346293730"
X-IronPort-AV: E=Sophos;i="5.99,232,1677571200"; d="scan'208";a="346293730"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2023 11:24:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="688528968"
X-IronPort-AV: E=Sophos;i="5.99,232,1677571200"; d="scan'208";a="688528968"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga007.jf.intel.com with ESMTP; 27 Apr 2023 11:24:11 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 27 Apr 2023 11:24:10 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 27 Apr 2023 11:24:10 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 27 Apr 2023 11:24:10 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 27 Apr 2023 11:24:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YevELEPoQ01SYyWe0uGIAMQzh2TUp9L+iwKWYhyjGUp9G1Fy5ta/KPnUW1DEwPB1kU9eYUtHztabgCCo/4/iENKovdq/Vu4GPdL8Ngt+AVCVIiiSNce8KbfSfmUoB+rO+hDoDouEmWGsN8s8iH176mTLuFu122gYcugt7WjTO3mH3tXT7cv3WTfE75n4vrSN+atXuF9EZkL57ZK9VEnoxZ85DNthOj8MFna2Q7Z4DuxP0Z4pZTmbumDR1/VveH71/BoafE/XxfL3SPUelqCHLVoeuRyV66+8esCDd+PaYC71SQD1fQemBASgE2DOqZ6QUtTwX0i49hYhfdL8gpLgrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aWUW8xj5IiK8AP8lnYZqYIg5tRXoVi4syrlxUkAI34k=;
 b=neX674qBX1/RQ2Z6OXns3INktH8zfNKSFqNSMDPBK17utYFqK+1mSEeUg6U+3YSfLSds383Th8p2n0KmRaoT76T+bSWnEeltpxmK/H29dO/QeIjsDqeolH19yQzC+j/iKsZpME05gI8WsnaNqVgyQ+Hd3ktEUUfBM1dnWW7MXEEbLj+roKkjh+jVJTSDAk9c3lTUHof0tRuWn2H7KEAWt6Wweev29uKcnI292bkguCDuAU3GPuM/P20gxp2aJDWNDdY4xY9rGzDrQj+V7J94sSnk8VKBSET7WQhS2823zOfb26tKfUwetw1UiZN2Na8fwmKwkenhtfKwdQ8/Zsz9jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN6PR11MB8146.namprd11.prod.outlook.com (2603:10b6:208:470::9)
 by CY5PR11MB6307.namprd11.prod.outlook.com (2603:10b6:930:21::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.22; Thu, 27 Apr
 2023 18:24:08 +0000
Received: from MN6PR11MB8146.namprd11.prod.outlook.com
 ([fe80::ab78:f580:c203:edb8]) by MN6PR11MB8146.namprd11.prod.outlook.com
 ([fe80::ab78:f580:c203:edb8%7]) with mapi id 15.20.6340.022; Thu, 27 Apr 2023
 18:24:07 +0000
Message-ID: <c633a14d-2122-a461-d217-329aec066327@intel.com>
Date: Thu, 27 Apr 2023 21:24:09 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.10.0
Subject: Re: [Intel-gfx] [PATCH v8 6/8] drm/i915/uapi/pxp: Add a GET_PARAM for
 PXP
Content-Language: en-US
To: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>, "Justen, 
 Jordan L" <jordan.l.justen@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>
References: <20230421053410.1836241-1-alan.previn.teres.alexis@intel.com>
 <20230421053410.1836241-7-alan.previn.teres.alexis@intel.com>
 <82cab075a8330355b3844cad26fcf842b275afb9.camel@intel.com>
 <168254855442.392286.5736829518983136908@jljusten-skl>
 <27483f34611239dc4a73ff832cda9abc9074a88f.camel@intel.com>
 <6ebdd6168e68ce81806f9aaed9356a3bdb7fcfa6.camel@intel.com>
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
In-Reply-To: <6ebdd6168e68ce81806f9aaed9356a3bdb7fcfa6.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0138.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::17) To MN6PR11MB8146.namprd11.prod.outlook.com
 (2603:10b6:208:470::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN6PR11MB8146:EE_|CY5PR11MB6307:EE_
X-MS-Office365-Filtering-Correlation-Id: 82272e5b-be58-484e-2279-08db474c964d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NkthikLjOtptm9PUUKxzpnzIXKoLoeDqyYa7qZVqHhFzgNzmE/VQdpP0UEIVTDUIGmFXUpxcaS+BtiB0TH9TlGSpmhi02Yid17NLa/TmUKoIU2s7HUYDGmIoHsx5dqG6WLu9SNgBXAcQBlWkx6ZQ2UQ94PZFefdeeE+EiC5rjF9MYZSjNHaWZPwoVe4jmcB6K62zhpLcA5tYPfGDM9Bbi8F6DL+WhVvH4K26I74II+2Ouynk0SVHgdGCJIwgVfJcZ8wn+hxxRbxM/weaDKxqk+lOwMlK4dib1O/5Qb/v+OSuEOSGxSDEuBWPgn5kvdrSZarf9NRzJUyw68gm7oDmNwoCf85na/ni/QgcPdw++KnaTW/LFiMqhm6Qxc7BAbggtEVkL8XSU3+fol6QJ/bCiKBiZ7+aLIKL6BqfQ6g0eLpIbtCicufqx8uw3+vTcdkHOtmZwnelqmNr2VDEYTPwONOjzULFYMpFobAnczB6XGlr3h1UlHTdqWXNMxzRbD/SMfqr+G7UzvIermbhiNrxOqz2EDU6UM4uFTeLEihEt1yLOYudUqX0Ge7D/L6JA3loBbow8Y1isXSJcw6nPYXq7lzYBwOczKb/7sdkZ/Jd21lVJl6pmLwxiWXEGnuTRUDCaHgzxHLs39ljphCRqzjGFA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN6PR11MB8146.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(366004)(376002)(39860400002)(136003)(346002)(451199021)(478600001)(110136005)(36756003)(54906003)(38100700002)(8936002)(8676002)(5660300002)(2906002)(316002)(66946007)(66556008)(41300700001)(66476007)(4326008)(82960400001)(31696002)(107886003)(6506007)(31686004)(26005)(2616005)(186003)(86362001)(53546011)(6512007)(6486002)(83380400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z3RHcW1RL1AvaDBYWjFPNGtreG5STVF2aXhnaWJNQUpWSGZCR3dEZkExMkVk?=
 =?utf-8?B?ZjNuRFduZzZRemFiSnlUdzJVN3FSSVVKTWNhdDZQWUVJeGtRU1NiQmxUOXhK?=
 =?utf-8?B?VmFlOTVZYVhFcXZKUFVydkZBS040QmhnaTQzMWp5NUJhNXdGWHlTMUlUdGt6?=
 =?utf-8?B?WGNVbWZoY281ZU9wL0xQQVBjeGpMdFNmQ2hQaWdOdEI0YTc5MHBWbWhadG9S?=
 =?utf-8?B?VDltOTExS3RsUmVKbm1nY3VNelpGSXhVWnRYQ3lsVDRwUXlBUXhaa1hpSlRu?=
 =?utf-8?B?dmEyYVpQS3dpM0FtZE0wNWxZNzBkWTlkTjdCaHNCZ01YOXJnYU9VMDB3bnZq?=
 =?utf-8?B?NUkwYmRHYjQ2VmlMYTVacmRob0dYUnNHalV0eDlUWC8wNVltTWV0TFc2VFFT?=
 =?utf-8?B?TXNycHd5Q1JHVDZVT1oxM2RWcGE0Z2RUdUxmYTVFMkd3MUJSekoxTHRDOG51?=
 =?utf-8?B?ZDBNZndJdWNGbG5JaTNXQksyRFJaL3FkQkZ0SUlpNU9xZWtDYVZLak12amo2?=
 =?utf-8?B?ZXlERC9FbE5xM2ZmQXYxTWxpN2FJUTM3QStzV1A4eitNMm13OFZjNmxmR1A4?=
 =?utf-8?B?OWNvaWRad0RrOEZYeHQ0eXBwb3VJMXFIMWl1Vy9aK0N3bGdyaGErUURjYnU1?=
 =?utf-8?B?R2E5akdqSFduTjN0Q0tpb0ZCRzNDMHJDT2NtWmxhU3oyVFlpUEV3aFQzdmpO?=
 =?utf-8?B?UmwxMkJ4TG9KYlppRUwxTlVHajltZ1gwcklpOWZwdDJLNGFMbER3N0VxTUFY?=
 =?utf-8?B?M2ZvdWpzSW5YRGZjRm9LdlhoRUttYmxiYU9qY1JFSUc3MWgyQlFnOE41RXpw?=
 =?utf-8?B?SVlWTUlqcTVaa2kyU0srb2c5UlZNb29MMmI3dEVCWCt6d0k4am9nNkhsQ1Az?=
 =?utf-8?B?VlpubllXRXpuRVphdnpFYXNNZllodC9SdEVwMmVpdkFsdElxZDZDMTZlMWw4?=
 =?utf-8?B?NFQ2TTM2dUg3eWczYkNXSHl4SFIwbVkwVkF2Q3ZzNkJwbG1rUHJHUmVwNWtQ?=
 =?utf-8?B?WUF0Q2ZzQXNyNVFWd2MyWXR0QzRWbmhvS3FFTGg5Slk3Rkd1TUF5Qkx6TlRV?=
 =?utf-8?B?M1pseTBid3dMM1IvUEJpMkpBNG1YYllHNFMxbDE4QnJ0MnVsQmZucFBNVXM4?=
 =?utf-8?B?bVNhWnVudkF1Zy9penVLK1hQTmRrcnlvNXBHNmZVY0pmbnVoTUEwaEhta0Zx?=
 =?utf-8?B?ZWdQRXdqUDNkNEx2SVR5V0owRTdvQVhWOFZqdkdUM0dLSkVSTThVaXZpZ0Nm?=
 =?utf-8?B?VU9ncFIzaGcyWDk3MFZ0VkRVazhXUGZNZHlZNVpKYVo3Zk9RZE5MVTZxSHJn?=
 =?utf-8?B?ZkF2cXBGR0w4NUh6SElpZ1EyL2V0SWRFY3psMTJ0Ry91Qms4SEVSbWZ6Yyth?=
 =?utf-8?B?UGRzZ1NFY21URE1ERUFvYzVucVNKZnVsN1FVOHo1K0xiS1BwMHdsYUlTNVgx?=
 =?utf-8?B?RDRyRGxSVG51UW5jQ0crWjIyZEdUNkd0WDFhOW01Mk11WjFqZm1FaGFqSERQ?=
 =?utf-8?B?emlxOEF6UEVpSk11T1pyTHlHVGpodFFHaUtWY21UWlpVSEk0RXBCLzdiVEpN?=
 =?utf-8?B?bDg3NXNTMGl1b2pNc0JrSDkwRXdmQnRveXE3bzQrWkFFYmwzWDczWnFXeWxW?=
 =?utf-8?B?ZEFQT2ZjWUZ0RWtYTEpNeVJSYVNNYjJJYWxCUmdxeVl6KzRyRlVWL2YwT1dk?=
 =?utf-8?B?MlI4S0kxV0RDTkloWVdnQ29tWXlwV05ra2Y3dnNiTGNQd2J4enJGekJ2UDlk?=
 =?utf-8?B?QVFxdktlZzZjQ24zWnlzOU51eXhIUFVZZjZySDFjYUt4RWdWTkovd1R6MmxH?=
 =?utf-8?B?QVZLYmdjM2E3REQ2VGZ0SXJhQm9TM3N4d2dxNG8ybnhGYkpPTzdkWEg0Vm1J?=
 =?utf-8?B?czNUdmFIMUhhMXdmc1dObytGT2J3T0tobnd4NDlXb25SV0g4UXhQODN4anFw?=
 =?utf-8?B?aWc3QmxST3FWVTY2Q0dTb1FKR0VCUWZDanNleVdyS1VWaG4vcTRwUXJsSTZs?=
 =?utf-8?B?TVB0RWdOemk1SW44TndFSGM5R3RPUm1JMkNnRTdGdHZsUm8yMWtCUjJNdFh4?=
 =?utf-8?B?Q2taZ0JWWU9vMjVaVVRlWFJDSGJ2aG01TlN6NWphSUdwYmplenh3aUs4SmpR?=
 =?utf-8?B?NlZRRVo3L1RDTjNpNnlOVkUyRkRsaHNOZzlONEQwNDlKNitWMUp4T200Y1Jr?=
 =?utf-8?B?RVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 82272e5b-be58-484e-2279-08db474c964d
X-MS-Exchange-CrossTenant-AuthSource: MN6PR11MB8146.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2023 18:24:06.9497 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5Vkou4jcpMk5bbeOVOp21wc7tKEiIOuQ2Cpvfrw8Muu4yvE3nHVmKWrb1pdlUmKrKx8HodG5HPGafqwH3RLzGSf8J1SC/ogXC58XUhkLa6U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6307
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
Cc: "Ursulin, Tvrtko" <tvrtko.ursulin@intel.com>,
 "justonli@chromium.org" <justonli@chromium.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 27/04/2023 21:19, Teres Alexis, Alan Previn wrote:
> (fixed email addresses again - why is my Evolution client deteorating??)
>
> On Thu, 2023-04-27 at 17:18 +0000, Teres Alexis, Alan Previn wrote:
>> On Wed, 2023-04-26 at 15:35 -0700, Justen, Jordan L wrote:
>>> On 2023-04-26 11:17:16, Teres Alexis, Alan Previn wrote:
>> alan:snip
>>> Can you tell that pxp is in progress, but not ready yet, as a separate
>>> state from 'it will never work on this platform'? If so, maybe the
>>> status could return something like:
>>>
>>> 0: It's never going to work
>>> 1: It's ready to use
>>> 2: It's starting and should work soon
>>>
>>> I could see an argument for treating that as a case where we could
>>> still advertise protected content support, but if we try to use it we
>>> might be in for a nasty delay.
>>>
>> alan: IIRC Lionel seemed okay with any permutation that would allow it to not
>> get blocked. Daniele did ask for something similiar to what u mentioned above
>> but he said that is non-blocking. But since both you AND Daniele have mentioned
>> the same thing, i shall re-rev this and send that change out today.
>> I notice most GET_PARAMS use -ENODEV for "never gonna work" so I will stick with that.
>> but 1 = ready to use and 2 = starting and should work sounds good. so '0' will never
>> be returned - we just look for a positive value (from user space). I will also
>> make a PR for mesa side as soon as i get it tested. thanks for reviewing btw.
> alan: I also realize with these final touch-ups, we can go back to the original
> pxp-context-creation timeout of 250 milisecs like it was on ADL since the user
> space component will have this new param to check on (so even farther down from
> 1 sec on the last couple of revs).
>
> Jordan, Lional - i am thinking of creating the PR on MESA side to take advantage
> of GET_PARAM on both get-caps AND runtime creation (latter will be useful to ensure
> no unnecesssary delay experienced by Mesa stuck in kernel call - which practically
> never happenned in ADL AFAIK):
>
> 1. MESA PXP get caps:
> 	- use GET_PARAM (any positive number shall mean its supported).
> 2. MESA app-triggered PXP context creation (i.e. if caps was supported):
> 	- use GET_PARAM to wait until positive number switches from "2" to "1".
> 	- now call context creation. So at this point if it fails, we know its
> 	  an actual failure.
>
> you guys okay with above? (i'll re-rev this kernel series first and wait on your
> ack or feedback before i create/ test/ submit a PR for Mesa side).
>

Sounds good.

Thanks,


-Lionel


