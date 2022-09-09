Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5574C5B2AED
	for <lists+dri-devel@lfdr.de>; Fri,  9 Sep 2022 02:15:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78D4C10E84A;
	Fri,  9 Sep 2022 00:15:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B63510E84A;
 Fri,  9 Sep 2022 00:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662682523; x=1694218523;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/UEZVc9IWqYTabTTvDxP8yMBJxuCs2GTssZeaWT/yiA=;
 b=eHyDiOOt0MsSP8yeNGHHbdF4BYlNjyQOMvahsdHZ4UgYQM4cyUck+QiA
 lWMEXtz0ftLQpyR7USHxflLjloBAZ4Nqk55NDLA8eSJb7vIjG0oabKky5
 fh53y3vsMLL4JXrw5l52KZw2jr9pp+XJN0qsU6voVfL5Rp/jvxiDi+Zla
 x6XUH3LjSDYKa4R/UhF+32pSVu2cM/mI0x5YqaJUVNHwWs301mb8p2Kqp
 HWaSX/pPVhuxgRfXqsObnmgKWRZltkENBFc8KHfKsAQ6X+/lUzOL0d7EF
 68Cea+yJpOhrGywc5+d/PERQleOE095UcCE5u5JjsB7DoVxD8QpKWl1DC A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10464"; a="277746230"
X-IronPort-AV: E=Sophos;i="5.93,300,1654585200"; d="scan'208";a="277746230"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2022 17:15:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,300,1654585200"; d="scan'208";a="566163748"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga003.jf.intel.com with ESMTP; 08 Sep 2022 17:15:22 -0700
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 8 Sep 2022 17:15:21 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 8 Sep 2022 17:15:21 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Thu, 8 Sep 2022 17:15:21 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Thu, 8 Sep 2022 17:15:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AOYZ+HWZ7ApU7wQmNUPD/R0tbzXHlVAcZr7GCBBiRd3SKIv13c14LuWqvZSbVoVZrlEgsEd8z537Dtg6hflT9q4e7+hNj9bAbtWKCB+hWBKpBe8Um3qHYMb2Mhmqzsk3ZJO+bFtD4jiXG1xt9WHvA9CRUMjW9gdAl8UOJN80wb5nzsqP5/SsMAX2lvhCUULtaaknMTm1fY8frIaSAUho5bgUJKTFVYHZ49YBAq3O3kbEa3XD+6H9yUgqpnaOXlGS3MStIeP3K0RocXxACEk8fEMDxPqlML3sYOh5kEyuGC8t/LoaFjCbDDGXo0CZWixbVrdZR0VvHKF6KFQ4fo0R2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7LR89BvvITnirZhp8SPDwV7tAzWLka2Cf5razgpK/q0=;
 b=EwEDQo8PgoBrUD4Y47ZluHvoizvw9G/nZS4S4Xu+ZczG+9UteL2hldWjIVckVV7/gRHA9cPzbx0boaT6yYll5fiyaKjaK+pJV1dYoxGFwoubCrnmAkDAx/SEHFa6qG3tYcYnOsEsxJU3+xPFVnfCOPNd3WUFTcAnlc6AHEAtsQft+UJ0TDuRisMKbGAtayXKzfrdBvuXnvzedBR6BErRDmjdxhjYRnpnWxXq86dCXqHbiynrVhcBAUhlmD0VM8VSaFbrUMsbJ+QARFlOoqwWszstXAh9f6ePada2rtqZgDnUHRs6G6Eflegl9W9n7AUMyIvAQd8YqT54gS0CotHmHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 PH0PR11MB4823.namprd11.prod.outlook.com (2603:10b6:510:43::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5612.12; Fri, 9 Sep 2022 00:15:06 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::1977:59e7:5a28:24e1]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::1977:59e7:5a28:24e1%9]) with mapi id 15.20.5588.017; Fri, 9 Sep 2022
 00:15:06 +0000
Message-ID: <95b7cfa6-01d0-eaf9-6bc4-007068594a11@intel.com>
Date: Thu, 8 Sep 2022 17:15:03 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v4 00/15]
Content-Language: en-US
To: <intel-gfx@lists.freedesktop.org>
References: <20220909001055.728322-1-daniele.ceraolospurio@intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <20220909001055.728322-1-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0P220CA0024.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::32) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fc5091df-a467-4d37-1124-08da91f858fc
X-MS-TrafficTypeDiagnostic: PH0PR11MB4823:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Iy3jz7XDRJDmPx9gwvQzqBE5d8lPMHL/AL3Il3dWDvaykd3jFXqAXc3QNv5A15BanxmC0QFk2HoPaNsilbW2HTDQDUjFjxO8eUZoklK1g95MQC+NiR8qRscNQ0tDvGApmNrxMsmfrYTyn1Oat3J3eDZ7XxyV66KBaTlAdbD/rabUo2jWCg/GEshqpn5bxmhzta7xJEwIlw9vi+ZuelDObdDYNAtNVmDJxWMF/CNlsfOOUbOvMh1uW8wH0sqNIyjH809N6VqH8pk4rH4DD9tS7psBoSGHoc8Cu3Cwk71msCDbMK1drvhPDlN0q2Q9sG0+V80xnMQaCwJ4VBfmEenlT0/dD6+uY1YY1EWMlR1MSprEMNO+xVo/cQZQvmoXeZ3TuIGwMAZ2TGVdfj/7b5305MsMrONnPcVPEzjNRm/Z0mXbXfb4/WYIwf/nAn55+opI4j5GeJBU7i6yvUYI5b7GCcRXY8Fc66RLU4zQDBcWTQx7Ic3vUXXiaLCwoA8e2PwE7SVKaedqeNbsckvQSp/kv115jjGRijk+0Q0sSMw9a5AWFLDqffB7ix7ErymXSUBLXjZfmB+fE4olx8zie/8fiqiAPYzazIT4Cx2uq8YTEgalYHvqtiItZ5qngCyoDNsMYndklVOUAvUOhxxPQQVmzzvBGvbsjunEnFLxSIhZI0JVRVO3vBW0NcarNbbHgNE+0cJczKvAnKjF3ZOuUU+ixpU378FiANmKHLr/7hhPrWlwFIHnx3GwX49SXwmryddj36l+1cfnntYK8nuLrFjAJR5Ms5xdNnA5avpYY0MuQ1U=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(396003)(346002)(136003)(39860400002)(366004)(376002)(31686004)(36756003)(82960400001)(66556008)(66946007)(316002)(8676002)(66476007)(4326008)(31696002)(86362001)(38100700002)(83380400001)(2616005)(186003)(26005)(41300700001)(6506007)(6486002)(8936002)(6666004)(478600001)(6916009)(53546011)(54906003)(6512007)(2906002)(5660300002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c1lKYysrMm5VTVBhdk54QTA4eldRbXUzNXM3Um5CcDN4aVRLbmFoVDlYdVFG?=
 =?utf-8?B?ZzNtczBVREFwdTVYTmFEWEZkdkdZVVlOUzFnNmVpd2xoRXdxckQ3NnB4RzdM?=
 =?utf-8?B?a1F0WldqR0JWTUdxSU5NeU01bUNFbllicjRCYkt6QTV6WDFHZ3VpNjlGYVlq?=
 =?utf-8?B?Y0h5NTJVdTVueG9lSFlvNzN2N3N3TDZtSlVHbk9kek1ldTYvMFhEZEphOENu?=
 =?utf-8?B?aWI2K0Y1NmZEdERmQmJ2MVlSN1FoU1crWlRUTFB2MXFrNllVL25LZGVyU0JS?=
 =?utf-8?B?VUh3dnp5d1I5Z013eWFpM1RZWGN5Tkwrdm5IbUUyNTlqbzVIeDJ0blpqQVM1?=
 =?utf-8?B?ekI1cmNhTGcraVdzVG0xalhXbWpiVWNJVjVlZGxLTWVvd25lYko4UUlWNll6?=
 =?utf-8?B?clB1b3R1aHkwaGJCVldOTHJJY3NYa1FqUk5rbmxISDU3WnM4UStRNHplcDFM?=
 =?utf-8?B?NXBwU3VPRHpGR0ZlemhUd3dKcVdyNHZBcTAyVmZtOXEwZUkwd24wK1RRNHNo?=
 =?utf-8?B?L2o4WDd4bGtQK1lHdStPZ1hpZ21XU20wZGxsamdDejJjVEtwck1WVHRvMlVn?=
 =?utf-8?B?MnJJY25qLzRyc21YaFU2b0ovdCtjczBuYVBzT3VhdnpGYXh6dFkxdWtpdXBi?=
 =?utf-8?B?YmhPZHdEblNBUnVndlY4ZGxxMkZ0cFdmZ1hsMWJoMGRXZFZzcS9ra3BBNFNW?=
 =?utf-8?B?OGEvdllUdGpIZkN4US9LRldZRjVXbXJmRzlMZTNoZ2J5TlJOYUpJdUluY3Mr?=
 =?utf-8?B?SGJYcmM3aVJxTGpGOUw3SG1jY1FOT3NhUHRHU1kyOU1uUHkyTlZ6YVVWdkM4?=
 =?utf-8?B?RjFtYUFvWm5oYlVpdW1JcTllL0xBOVpKMkMrL1QrYU5RVVhDMTdDN1AyZnYy?=
 =?utf-8?B?WERUdEsyNDI1ZUthN09SeXFDOTR2cGpxbERSbVpNUTNQWFhhVFovc1B6bFNU?=
 =?utf-8?B?TC9YeTFwaGt4SHJRV25MN25JY3hlYjNnTVkxSUFPeUxIUTRuZ2tNdXNwTTVX?=
 =?utf-8?B?MjN6ZUdSamdGU1VVTWthU2dkeC85UzlnT3lRK2FqSWZEYUJxRE11QXdkaXF1?=
 =?utf-8?B?WW1LZk9JdDV1eC9PQStBdXhxZ05NcjVmN2FiVTNGcDgyN21zZ0FjN1UydHNC?=
 =?utf-8?B?TXQ3bEZwa0FoY0F0dWdiMzhzN1lqTTJiNzlrYy8wV2Vpa1o5UXhQNzJOV0tp?=
 =?utf-8?B?eXhsRzdKeVhIbitaSlc0MHBMbjBVOU9zUS8yeHI2a0xYNmZGN25XZEw2MC9E?=
 =?utf-8?B?K2R4WU9HSklJUUJnZTFSdTU5a1ozUldSZGg1cHY5VEFEM2xsejkxazFFSlIy?=
 =?utf-8?B?dGJKSW5oMldsb1gyVWliKzV2eklGaTZVTHY3NHk2ZmlqK2JPeWl1NjU3UGpl?=
 =?utf-8?B?V1hWR2p4aWwrSU5NZ1dNMHJ0cmFQeHVDZkFUUFF4ZGV1NDJ4VEFmSGw2UGll?=
 =?utf-8?B?c0JwS1N1eVZRYlFab0VGbzVFTVYwMDFsZHRVdHByYyt0UjZEWC9CUlZrK2dM?=
 =?utf-8?B?eGhoYnNFbU4rWHNoajlBOWFiWWV4UFlQaUVkL2VZUzVxcjZoQVBSZlNDYXZp?=
 =?utf-8?B?dzFCWHArR2RkdW8xWU42MktvQTlHWUt2ell5RHpzMFRrTkNTTnUyaFd5UlVz?=
 =?utf-8?B?ZFdlZXdCbFE4bTVKUjFVUnhsSWNoaWpGTU5COTVkYkkwUWIyVGkwNnNzbUdX?=
 =?utf-8?B?Z2pEbGZwTDVpbHhUTFc3b2YwWTAxVjdJWUhidFkxMWkrTms0V1JibEhQYXhD?=
 =?utf-8?B?S1dZM21TMUtEU20rV005M2JnWnVpaEN3em0rSHpBMHVBMkVGN29LRnh6ZzN3?=
 =?utf-8?B?YlV1OUxuWkNPVTlpZVRpa1AxRVF0Zm93REl3aVhUdWJpUUtEb2RabDhNNnVC?=
 =?utf-8?B?emN0TVAvZ0dHL0JzdnoySE9NanhzUUFOT3dYdmNNSFhWeWZrRjJWUTdUR0JZ?=
 =?utf-8?B?aGFFSTFxUmNDVmVBQVVCaWFmcnprbElHOFN1d1M3VFNmWUhML09JWU1LdkZK?=
 =?utf-8?B?a0tseDIzVVZxWWU2MnV5WXVJemdCb1dKK0VCQTQybXpodzNrSXZjODBwbll3?=
 =?utf-8?B?V0h3Z3QvS3VvMmx6NHhVVDNka0VzdFZGMUtRUzQvSG5WZnNXdGVCY3Nhakpk?=
 =?utf-8?B?TVNTL25jTWwzZkRWMUdjR2JjSmlGOGRqN24zV290N0pnbVV2SklCOFdXUzd3?=
 =?utf-8?Q?Ntt3Yz//c/D5CqfuVTQJ2go=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fc5091df-a467-4d37-1124-08da91f858fc
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2022 00:15:05.9520 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J4HcRzRdWvTc5n5qbZNtUS1oPiDT6AJchRQoWPOLaRtvu/UulYMH59S4aBaUfKuZZuEj8nbeYWmBdZmegJLBOOzrLg2RoPdXaniQJniykF4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4823
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
Cc: Tony Ye <tony.ye@intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alexander
 Usyskin <alexander.usyskin@intel.com>, dri-devel@lists.freedesktop.org,
 Tomas Winkler <tomas.winkler@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Please ignore this cover letter, I've only realized I was missing a 
title and aborted the git-send after sending it. Proper series coming in 
a couple of mins.

Daniele

On 9/8/2022 5:10 PM, Daniele Ceraolo Spurio wrote:
> On DG2, HuC loading is performed by the GSC, via a PXP command. The load
> operation itself is relatively simple (just send a message to the GSC
> with the physical address of the HuC in LMEM), but there are timing
> changes that requires special attention. In particular, to send a PXP
> command we need to first export the GSC as an aux device and then wait
> for the mei-gsc and mei-pxp modules to start, which means that HuC
> load will complete after i915 load is complete. This means that there
> is a small window of time after i915 is registered and before HuC is
> loaded during which userspace could submit and/or check the HuC load
> status, although this is quite unlikely to happen (HuC is usually loaded
> before kernel init/resume completes).
> We've consulted with the media team in regards to how to handle this and
> they've asked us to stall all userspace VCS submission until HuC is
> loaded. Stalls are expected to be very rare (if any), due to the fact
> that HuC is usually loaded before kernel init/resume is completed.
>
> Timeouts are in place to ensure all submissions are unlocked in case
> something goes wrong. Since we need to monitor the status of the mei
> driver to know what's happening and when to time out, a notifier has
> been added so we get a callback when the status of the mei driver
> changes.
>
> Note that this series includes several mei patches that add support for
> sending the HuC loading command via mei-gsc. We plan to merge those
> patches through the drm tree because i915 is the sole user.
>
> v2: address review comments, Reporting HuC loading still in progress
> while we wait for mei-gsc init to complete, rebase on latest mei-gsc
> series.
>
> v3: fix cc list in mei patches.
>
> v4: update mei patches, fix includes, rebase on new FW fetch logic and
> merged mei-gsc support.
>
> Test-with: 20220818224216.3920822-1-daniele.ceraolospurio@intel.com
> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
> Cc: Tony Ye <tony.ye@intel.com>
> Cc: Alexander Usyskin <alexander.usyskin@intel.com>
> Cc: Tomas Winkler <tomas.winkler@intel.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>
> Daniele Ceraolo Spurio (7):
>    drm/i915/pxp: load the pxp module when we have a gsc-loaded huc
>    drm/i915/dg2: setup HuC loading via GSC
>    drm/i915/huc: track delayed HuC load with a fence
>    drm/i915/huc: stall media submission until HuC is loaded
>    drm/i915/huc: better define HuC status getparam possible return
>      values.
>    drm/i915/huc: define gsc-compatible HuC fw for DG2
>    HAX: drm/i915: force INTEL_MEI_GSC and INTEL_MEI_PXP on for CI
>
> Tomas Winkler (5):
>    mei: add support to GSC extended header
>    mei: bus: enable sending gsc commands
>    mei: adjust extended header kdocs
>    mei: pxp: support matching with a gfx discrete card
>    drm/i915/pxp: add huc authentication and loading command
>
> Vitaly Lubart (3):
>    mei: bus: extend bus API to support command streamer API
>    mei: pxp: add command streamer API to the PXP driver
>    drm/i915/pxp: implement function for sending tee stream command
>
>   drivers/gpu/drm/i915/Kconfig.debug            |   2 +
>   drivers/gpu/drm/i915/Makefile                 |  11 +-
>   drivers/gpu/drm/i915/gt/intel_gsc.c           |  22 +-
>   drivers/gpu/drm/i915/gt/uc/intel_guc.c        |   1 +
>   drivers/gpu/drm/i915/gt/uc/intel_huc.c        | 254 ++++++++++++++++--
>   drivers/gpu/drm/i915/gt/uc/intel_huc.h        |  31 +++
>   drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c     |  34 +++
>   drivers/gpu/drm/i915/gt/uc/intel_huc_fw.h     |   1 +
>   drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c      |  24 +-
>   drivers/gpu/drm/i915/i915_request.c           |  24 ++
>   drivers/gpu/drm/i915/pxp/intel_pxp.c          |  32 ++-
>   drivers/gpu/drm/i915/pxp/intel_pxp.h          |  32 ---
>   drivers/gpu/drm/i915/pxp/intel_pxp_huc.c      |  69 +++++
>   drivers/gpu/drm/i915/pxp/intel_pxp_huc.h      |  13 +
>   drivers/gpu/drm/i915/pxp/intel_pxp_irq.h      |   8 +
>   drivers/gpu/drm/i915/pxp/intel_pxp_session.c  |   8 +-
>   drivers/gpu/drm/i915/pxp/intel_pxp_session.h  |  11 +-
>   drivers/gpu/drm/i915/pxp/intel_pxp_tee.c      | 138 +++++++++-
>   drivers/gpu/drm/i915/pxp/intel_pxp_tee.h      |   5 +
>   .../drm/i915/pxp/intel_pxp_tee_interface.h    |  23 +-
>   drivers/gpu/drm/i915/pxp/intel_pxp_types.h    |   6 +
>   drivers/misc/mei/bus.c                        | 145 +++++++++-
>   drivers/misc/mei/client.c                     |  55 ++--
>   drivers/misc/mei/hbm.c                        |  13 +
>   drivers/misc/mei/hw-me.c                      |   7 +-
>   drivers/misc/mei/hw.h                         |  65 ++++-
>   drivers/misc/mei/interrupt.c                  |  47 +++-
>   drivers/misc/mei/mei_dev.h                    |   8 +
>   drivers/misc/mei/pxp/mei_pxp.c                |  41 ++-
>   include/drm/i915_pxp_tee_interface.h          |   5 +
>   include/linux/mei_cl_bus.h                    |   6 +
>   include/uapi/drm/i915_drm.h                   |  16 ++
>   32 files changed, 1035 insertions(+), 122 deletions(-)
>   create mode 100644 drivers/gpu/drm/i915/pxp/intel_pxp_huc.c
>   create mode 100644 drivers/gpu/drm/i915/pxp/intel_pxp_huc.h
>

