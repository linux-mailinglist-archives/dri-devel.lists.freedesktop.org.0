Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 417E0520784
	for <lists+dri-devel@lfdr.de>; Tue, 10 May 2022 00:23:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BB7B10EFB6;
	Mon,  9 May 2022 22:23:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D90DF10EFD1
 for <dri-devel@lists.freedesktop.org>; Mon,  9 May 2022 22:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652134985; x=1683670985;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=8iRWAYGz4LaKm3fkdkbeJFO0lZSpktDRGpL7euHYBsE=;
 b=gCEGr2ogsVNpynWBkSAr0CtntOEvgzIeIMCX9IQQAq8TiRfEi0L7tpAi
 p3F/+ModIRRYTa8sr3LxwZ0oUFRWdDR1jrMDbrq8GdHckdf/j2TwKNArr
 jXI/Vc4QUmS1SOp6HNIPRjy1JqpbFokdBKEDhuqPx4aaKoMOfLH1OpEPn
 7sZrDVObl+QFdk+vj8GheVnNz1lup7nTtuIUsfY+EWNnyCuPpwmfaQTsW
 vi3u9HQkFvU7AXm3WZC0pwsPzD+u+SbzwOvEzo7kvEbPm/VMta+kYSjex
 5B4y02x2J+313ZtD/BisOChFr+wVFfyfWu5oLHZ26eBzIvWXbqt6b9zg5 g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10342"; a="268025593"
X-IronPort-AV: E=Sophos;i="5.91,212,1647327600"; d="scan'208";a="268025593"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2022 15:23:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,212,1647327600"; d="scan'208";a="570373999"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga007.fm.intel.com with ESMTP; 09 May 2022 15:23:05 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 9 May 2022 15:23:04 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 9 May 2022 15:23:04 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Mon, 9 May 2022 15:23:04 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Mon, 9 May 2022 15:23:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iSl1BCrr15RWYcH213kTpoTzp1IUbjsjWHHkMCTU6miBweAgDtC1gD2BsofYBi8C7Fdw3hSsv4OD5jzeswkUZU7hIcZBmamCQu7S8GRCOKuFDh1RhSCSf4Wa/qXNlfhWVPw9gwILT7RmhUffsWT88g04r0DLw+qreY8H5/ohzoeay2/gGVsdx5J8ua315BPgbkQcKjhfMh3G7nT+VBH1dCJlO3cWR9j9lwGSHEpcNt9MooH4x8RCUejC2yfyqeueJcB+7OaCNOencPe3yS6IqRfZ+2K6LcWuYWlhDonb9TAe8t84JVyKr91SO7iUr04ow+Gg6EXZFJjTgA6n9Cn3bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N9n0rPApAmESjuk0e3cLhO+VzZe14HltW1ZZlMmSkvc=;
 b=gREZz92O6Znlgdn+haITgDoHCqZg0PKClmq2PEiU5XW76XD9+GQ0U/kyeLx88A7eE/n/xSC6lWYj+JcTuW26VOVGjFHN38rs34v+7OF2jn3L1UnzYix0Hn1lzeqb+SNH/Eu8oUJnf6Zs/FcKfR6w2oJ+mLpR85j/m/lNgH0kpFvr+6ZmDm/w42zazOiIKtTw1aiZ3/g4jpKg5EYxhTQ/qphWR/fiRo3ipr6Yk8IZFsi4stUPD9uGSpOBVhw6uhkl3629urY28LBk52ixnuYNS5Jb+Dh3nlqqafDrYWUgAN+mRbBWqSHqapk0vEDceM1fuae5QxVJVZi/0vXcnbMzhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB3180.namprd11.prod.outlook.com (2603:10b6:5:9::13) by
 BYAPR11MB2583.namprd11.prod.outlook.com (2603:10b6:a02:c6::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5227.20; Mon, 9 May 2022 22:23:02 +0000
Received: from DM6PR11MB3180.namprd11.prod.outlook.com
 ([fe80::b1fa:393c:9fb6:6871]) by DM6PR11MB3180.namprd11.prod.outlook.com
 ([fe80::b1fa:393c:9fb6:6871%5]) with mapi id 15.20.5227.022; Mon, 9 May 2022
 22:23:02 +0000
Message-ID: <fc3e8a40-664f-07ae-7474-c0412a1ab1b5@intel.com>
Date: Tue, 10 May 2022 00:22:55 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.8.1
Subject: Re: [PATCH v3 1/4] fbdev: Prevent possible use-after-free in
 fb_release()
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, <linux-kernel@vger.kernel.org>
References: <20220505215947.364694-1-javierm@redhat.com>
 <20220505220413.365977-1-javierm@redhat.com>
 <753d0350-42dc-389b-b10b-4533ddcf32ac@intel.com>
 <1f788b8f-0bea-1818-349e-b1bc907bf251@redhat.com>
 <a339df59-9e00-c7cb-e33d-2ac626443639@intel.com>
 <3b7fe4fe-fdec-cef2-4e0e-309d9dc4a8af@redhat.com>
 <b5ab1c49-04e7-36c3-677d-2989b79e50ca@suse.de>
 <2bf27b09-0896-1849-254f-d5b19abdc892@redhat.com>
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <2bf27b09-0896-1849-254f-d5b19abdc892@redhat.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0380.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a3::32) To DM6PR11MB3180.namprd11.prod.outlook.com
 (2603:10b6:5:9::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 70bcc92a-89c5-4256-c373-08da320a7afe
X-MS-TrafficTypeDiagnostic: BYAPR11MB2583:EE_
X-Microsoft-Antispam-PRVS: <BYAPR11MB2583F1E72D895604B17DECF4EBC69@BYAPR11MB2583.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3DFCi9E+gX+WXyFVwZcnNolZgvZ2WZydR++82YX6fhdeqsYpo5fi7/vuyq5RvtEOkTXDOHNM2WYMzhOmpRk7gl1IFT7RNGxV0MKaPuQdzSvYyHsGqEYgl2oN4DjM/4A5bX6p68C5qvv2FFkDDrd6HMvuIHm4dvDiOULnpdX/EPR/l09utAZyt5t5Mwg9mjF0ARDUyRcRDELi86Rs0wOwmv38Zd1Lww07GgLfrICMWSxYaT1tvIU2UEEepVfmriALS6Kp1D24jcEvQmndbU2Zx/t5GKerducN8HFOSYA8FNkXL8OCUoexDYDTc9HY2jsWNb9v7Hvbxg+/zM29uOWg03UxiLU6U1cDur08BhLfcQNz6jUQTcHNDDVmN1C7o4yas7hGCB9XhLDgLO9Lt4a/Fw9rQE8fANduMr6s+EPq0lG7GeVwGHOVwqp5nq7+Fle/tDtNPkTRxMDzYBZW4368EtfeMd3PmRE6ki8OQrytKijnxhtTSTJqBtJvkiYIOM14rj9P3tn/ygRm2hT7sWaOKPGgdApKNS/oYDzB6Jert9PKSzrEUuHCApAOuroIeB2gDAI86u39aGtinQAb1I9Q2AGzPUUi3iN9Qm/L8XWENsAwgTwqz+gPbjrwzkNtlo4W/r9U6i4D/agAGJRVFGxhQu2My0gPQL0hwPcVzaEXqS6N8TXxc+GXcp6ZiNIBchWX5AlVEq+BcAz5jy4AJjvyrjr7dgBB4LfHqCw5pM7f+5o=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB3180.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(4326008)(8676002)(66476007)(83380400001)(66946007)(2906002)(66556008)(110136005)(53546011)(316002)(54906003)(36756003)(6666004)(6506007)(6486002)(36916002)(508600001)(31686004)(2616005)(107886003)(5660300002)(6512007)(31696002)(86362001)(186003)(26005)(8936002)(82960400001)(44832011)(38100700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R3JBdXhvTDQrWTNtSStUZHphajRBM1VPOGtGb3NQczVxSXFmR1A5L21pdGFY?=
 =?utf-8?B?WjZrWTdDbEN4R0wxdS9ySnlFbDVTKzFBcytBYjhQeFVoVWZzd2l3dU4xUlJu?=
 =?utf-8?B?bmUxYVpGZy8yTUJDQ1Z6dzVucFdQU3hwSWxUbzR4OTRPUFBxejRleWYxTmNZ?=
 =?utf-8?B?YlU1SC9ySzJyN01EWXJqbGR0R1VCaEx1WEtnYkErZC9WRnZFNkFmTE9nS3hY?=
 =?utf-8?B?R3lQVjBPdmg2TE81MCsvRHpqeXVYOTNlT3ppeHlacklocFNRU1Uvem0rQXpI?=
 =?utf-8?B?VWdReEFQcThzRjlWUlFJOUdzN3VpVkE3c1dlb1NWdWhyL1pIQUcyeG1nQnJr?=
 =?utf-8?B?L3VzVks1Wk9VSEExMzViOG5tOVBBRzIrQ1FIL3hLSlMwTEJnZkdVZThId3R5?=
 =?utf-8?B?ZkpBYkYwbTFnek5EZDVqWWZTNmIxeUZIS0JXRTJmeDBvYm8zUURHNlFTRG5X?=
 =?utf-8?B?NTBiZmJhTDdiVFgxSndWTW5GS2ZzeVZwQUpwOXloMW5aR1Q1SURaR0w3T0py?=
 =?utf-8?B?UGRsbUpXTjQ3KzRtU1NqbVNnR2liRm1UejR4Ny9sWHd1OWYwM2NRQ2VOOFNu?=
 =?utf-8?B?eFFiV0xlMmk0VVg1SHRxM2YveUpzZXBYc09PR295UXRLQ09xUGowbjI1NzhY?=
 =?utf-8?B?NFNDcFlybEZSa2pKYUlqZGp3NXZtR0UvWGhNWHBLcTRVWk5ZblZiVmtvcGdM?=
 =?utf-8?B?RzJycm5XMzc0VWswOG9IeWhHZ1lCaEJubkxydkcyaE1MSUZJc2doSzZQZXkr?=
 =?utf-8?B?Umo2NnVFSEk2VXRkL2ZrLzZDdU05UkNhZ2kzelQwSXA0Q0RnSGhFR2xtWTdo?=
 =?utf-8?B?Q093T3NXUmMyOS9BeW5oanVYcnl6QW5taXJNWkEwVFkvd3RmMFZUZU05MzlI?=
 =?utf-8?B?UXBIWk9BWXNaMkRCWGtUZWxvSHpMa0oxaUIvelVGZjRLUWtNYXlzMXU0Ly9i?=
 =?utf-8?B?ZG43WjRwTmlvWVphZ3ZBQTIrRkVkdkIraWFxYml0SEhxMG0wNUlNZEZCcGdm?=
 =?utf-8?B?QXljdjlESDlIL0dsZ0lDbm50bm1oci93dkp0SENCQ2NCajhZYm43MHduZytr?=
 =?utf-8?B?dWxwam1CazYza3pGTVpwcVNZU3QwbGJmRzhpRDIxTjRtT1F3S1A2NkZmQmJy?=
 =?utf-8?B?Z2xIWEJJSktkVkVabmpzVURVSC9Db3ZvQUFmKzdBR0liUUpnVUZjL29kSk15?=
 =?utf-8?B?NURJbzFzVTlZVWJVODlkNkd6UHJkWStEaEh2ZHVnaTFyR1MvaTY4b1diZE1K?=
 =?utf-8?B?aVQ0SkxyU2ZSc25lZ0VEVDZ3U2M0T2ZZbUxObTdIdEVpTFFzTGNqMWVXcnds?=
 =?utf-8?B?S2J0WFdDbXQ4L2NxNFluVXhMZHcvNEUzdnRlNDZPSG56c3NLVXVWaGMvVDVo?=
 =?utf-8?B?VWhocUo3KzJwQXlhVmVxeGdKaFpXV0hzaHNxOWExUG5UamE3RnBoWHBqNWR6?=
 =?utf-8?B?NFZPOVJkczJiQkxrenhkbFVmVzVSVkhLTW9TdDVSTytBNlJtRGdWZmI3emth?=
 =?utf-8?B?dmtvNHBpTm1yRzVOTlZpeEp3VUh5b0oyQ2padHlDdERwaDFqSWNxY0lCaHhG?=
 =?utf-8?B?K3VoclRRYXliUEsvMjQvY1RtZm5WWnFBQXVUMTJUN2ZPdEJKNGExOWMrUFVI?=
 =?utf-8?B?Mk9ZVmNqTmdvRTE1TndDbWIzaGJuMkI1RCtpcVFsM2lSTHNXTHU0c3d3Vjls?=
 =?utf-8?B?TEFWYndPWDg1eUN2bmdlSDV0bEJqVHN5RXh2UEJKaURxa0tsVGxPbit2UVUx?=
 =?utf-8?B?SWk2Lzl6bm5SeGk4cGdsb0VYV0dTTXI3UStjeDRlay9tVlRyWHVGRHIzajVl?=
 =?utf-8?B?N1lVTEUyR0dDVUd5VTMwMS9rTkNlRHV2dENQZDdrVUZaNEN5NFFKZzViUjdL?=
 =?utf-8?B?SmNRV3BhT1J0OTRUUVdxOURXb1dmVEpIbkNkQWpXc2tEQXJrVlZvSFR3MVpN?=
 =?utf-8?B?Wm1IMXYzN2ZSMnkyT1NlYVdNU3hkNzNDaXhrdFRxaklLaEtITXZkY1V5c0RZ?=
 =?utf-8?B?b1h6UVpGcytHMG5JclRUVERkSVd2RnM5QncxRDBUV3Rjb3RYR2xhN2djOWNl?=
 =?utf-8?B?NGk0S3JIZmNuY1RJLzIzK3haK2tqazcvQTU1Kzg1WUY0czlRMFRQeEZrYWow?=
 =?utf-8?B?YmlEUzlYUVhDWmlmV2lteTZDRHk5ZnJia3NTencvbFVhRmZ0dDZVckc3c2ZG?=
 =?utf-8?B?THN3d2RJaTZYdm5lanF1UUtyeStrdEhycUY2NXU1c0N2b3R6dDdyRWdzaHdP?=
 =?utf-8?B?enVsSWQ3QkVEZlljaWNtQ3hJM2FQOVlTUlRNdmMrRGQ0WnJmMmp6c1V5aEdq?=
 =?utf-8?B?blFSUVRHRi9tM0JpQUtSM0pmZzJlYkR2SXpkL2tXbkMzc2tWMjVoWjdLSmMv?=
 =?utf-8?Q?M4NDy94iBtyB/1oA=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 70bcc92a-89c5-4256-c373-08da320a7afe
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3180.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2022 22:23:02.3112 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4Rn1ajGKRQgvVcG/8GZ3mkURqyG93UHWx+VdW/sethRrnTujHs7QwZutI3zBCpMEeCnh48KBcS8seFXb96ejXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2583
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, linux-fbdev@vger.kernel.org,
 Helge Deller <deller@gmx.de>, dri-devel@lists.freedesktop.org, Daniel
 Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 09.05.2022 22:03, Javier Martinez Canillas wrote:
> On 5/9/22 20:12, Thomas Zimmermann wrote:
>
> [snip]
>
>>> I actually thought about the same but then remembered what Daniel said in [0]
>>> (AFAIU at least) that these should be done in .remove() so the current code
>>> looks like matches that and only framebuffer_release() should be moved.
>>>
>>> For vesafb a previous patch proposed to also move a release_region() call to
>>> .fb_destroy() and Daniel also said that it was iffy and shouldn't be done [1].
>>>
>>> But I'm also not fb expert so happy to move fb_dealloc_cmap() as well if that
>>> is the correct thing to do.
>> The cmap data structure is software state that can be accessed via icotl
>> as long as the devfile is open. Drivers update the hardware from it. See
>> [1].  Moving that cleanup into fb_destroy seems appropriate to me.
>>
> I see, that makes sense. Then something like the following instead?
>
> diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
> index d265a73313c9..ce0d89c49e42 100644
> --- a/drivers/gpu/drm/drm_fb_helper.c
> +++ b/drivers/gpu/drm/drm_fb_helper.c
> @@ -627,12 +627,6 @@ void drm_fb_helper_fini(struct drm_fb_helper *fb_helper)
>          cancel_work_sync(&fb_helper->resume_work);
>          cancel_work_sync(&fb_helper->damage_work);
>   
> -       info = fb_helper->fbdev;
> -       if (info) {
> -               if (info->cmap.len)
> -                       fb_dealloc_cmap(&info->cmap);
> -               framebuffer_release(info);
> -       }
>          fb_helper->fbdev = NULL;
>   
>          mutex_lock(&kernel_fb_helper_lock);
> @@ -2111,7 +2105,11 @@ static void drm_fbdev_release(struct drm_fb_helper *fb_helper)
>    */
>   static void drm_fbdev_fb_destroy(struct fb_info *info)
>   {
> +       if (info->cmap.len)
> +               fb_dealloc_cmap(&info->cmap);
> +
>          drm_fbdev_release(info->par);
> +       framebuffer_release(info);

I would put drm_fbdev_release at the beginning - it cancels workers 
which could expect cmap to be still valid.

Regards
Andrzej


>   }
>   
>   static int drm_fbdev_fb_mmap(struct fb_info *info, struct vm_area_struct *vma)
>

