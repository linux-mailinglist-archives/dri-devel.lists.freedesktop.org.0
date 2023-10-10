Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA4AF7C035F
	for <lists+dri-devel@lfdr.de>; Tue, 10 Oct 2023 20:25:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC4F110E3B2;
	Tue, 10 Oct 2023 18:25:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71BD310E3B2;
 Tue, 10 Oct 2023 18:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696962318; x=1728498318;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=PuTH1/eevUJFXAxqi6IElVQe01zGK8bwo2pbIFTyzUY=;
 b=Avf+wyfkPD276SiZLl6I4QmzSoTpO/U9/5gdGv65OfpWPnszceWxWo5E
 ecRcgPWu22PYQGPv1CdOKMgAq3+b8ieEOnxmrN8yt2TByjDB+q2Ul3EZF
 05Z8OMTw3EtjOabUXj8x1MYQl0bQ9SaYkPsg0jT7LDIPPkQFDKfTxbPiM
 uEaVKF5LkuLK5ybmnBqY9cQhMW6sApvSNrVmG3QLER96i8ay2Myvh0xmF
 HNX+CtQGd5jXjgSTIBpmMoX/8GJ6miB4OjjwG8/85MiJdMAaluEcIgF/7
 Vnl8cbTzewXlNqi9k1t5WE+vv4eboyFhmNTms5oYhjRjPbkBTCkYLqQt/ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="6039178"
X-IronPort-AV: E=Sophos;i="6.03,213,1694761200"; 
   d="scan'208";a="6039178"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2023 11:25:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="788685910"
X-IronPort-AV: E=Sophos;i="6.03,213,1694761200"; d="scan'208";a="788685910"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Oct 2023 11:25:09 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 10 Oct 2023 11:25:09 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 10 Oct 2023 11:25:09 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 10 Oct 2023 11:25:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RkGtIUdjeqLJq9W/atYrOpfTgpz28OdU93k5Edj9VpwPt+cadZHAZJXL43Iuw7SkJQ8RiJLGF6zxNpRC3fHZTVwxhqWRIFM1P+3Wg1UquJsCZ0alzBZoyHTkocHqfslN537XFEwgkrBSzIcG4hHU/vag33HD0aOSiXg9IEg4DRaHgar0xrkzF5bIIkFpDDv9vDli1yTpr/yi4hV43VGIOAGAYn9xjaRX7S79kcNclYMtHGCmEbKKf+vB8zYy7+XKJbJgKJCnatbkcHJlYK2OQG21W852q+PIFWEg+ykbtppFZASdgr6LduNROF/8k7agloR5Lt3YWZ/mPqRZCdLm4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HClsTr3P6ofJGrFXE1xwXZgCcTZAFxqqOVd9k6eyQCM=;
 b=gmorlN6ZZQV9fnm9A7ex/87Nj0tWTbA0p7SZea4nCJkMA+NgC6hdjB4V1itzvAc6uDuD7rP9G/3lOK4NpnxVakb8RlIYxF2njfXkYj7Hnpbb9m6IttKr01H8eRbLpW1fEVQ9eENycF36Eam+5vd6+OAQa+nbnra2Wx690e3SDyoJQpPAAnNR7TjkHPmiU8rzlyqQFcmgD9Tv7kYKmIC9OoVbR0XjWPfxPmsKsGq98xWa20o7p0QZQhmzBQV1UNqogAlhen+xo6zc5/HjYW2Z7EfosWLhloQ7X1uDfdkCgMQBTkgWxEkGNzQ3ir/2jyE0vkkhvmRHpGNgGZpcnHj7dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by CH3PR11MB7761.namprd11.prod.outlook.com (2603:10b6:610:151::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.38; Tue, 10 Oct
 2023 18:25:06 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::a782:6fec:8d96:27b5]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::a782:6fec:8d96:27b5%6]) with mapi id 15.20.6863.032; Tue, 10 Oct 2023
 18:25:06 +0000
Message-ID: <5f879ced-6d70-43e5-83d5-276f561f66f0@intel.com>
Date: Tue, 10 Oct 2023 11:25:03 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v2 0/2] Add drm_dbg_ratelimited()
Content-Language: en-GB
To: Andi Shyti <andi.shyti@linux.intel.com>, intel-gfx
 <intel-gfx@lists.freedesktop.org>, dri-devel
 <dri-devel@lists.freedesktop.org>
References: <20231010121545.1046793-1-andi.shyti@linux.intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20231010121545.1046793-1-andi.shyti@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0329.namprd04.prod.outlook.com
 (2603:10b6:303:82::34) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|CH3PR11MB7761:EE_
X-MS-Office365-Filtering-Correlation-Id: eefbfb5c-c8e2-4872-f2de-08dbc9be3a4d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2h5QvbTR/pOwwh+SV/lEJE8OZLu1Idb+gzG9EBvf95Gl1eBYozF7EsCck17uPFq7UXZ+RIYfRALmqPyE2I8LbJXWVTdE/KSOOsAWaRnMwGh0okPguyU45BBizy+r+jKr/D1b/49p1hc6/a2at8FBKvtTJKoCZoxa/7TfvssllF8OxguKgUed3p0v7G9y56BIRjmh4yv7+d/V4bB40ecdEfTufvxqO4eOxVjkCpdfkQPE+TDBV+szvx4xuqOnSN5TTuCpmZRWN7egOcl/E7/26/r8g0e5uBuO1j8m9gEBwd7P+pJeukiPSbtzKm8C6b7vy58J7qvaVgniJKhdJtU89FEh6oLRE5ZSakatFX14MK8rI2Y8qujyvYrbzxpS5H2Pd5zuPse6oqvwJgPADenarBml98cYIskz5dPOeoSTWw0Eq3sCkYwPNn6vjbDaXIjX+FHlbq5f68ncDxUfcTu6nEDU4GykCrj8tvpwZUjduSwrHIXZMsgjd9fwegb7RUE3Vccf1KK2SfM6a02IySBQ2Fyxr07rXWsF6nkj+S+0XKFbt8f7YMU6pF5/ltHndmdXsnPO5Q2Qcjnwcr5onRimt/0UZveR3U5z+NUQ6rVYeEjXYyp5gFgPrWu9k1v9TL5u
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(136003)(366004)(39860400002)(396003)(346002)(230922051799003)(1800799009)(451199024)(186009)(64100799003)(31686004)(83380400001)(2616005)(110136005)(26005)(316002)(54906003)(66946007)(66476007)(41300700001)(53546011)(66556008)(38100700002)(4326008)(82960400001)(8936002)(8676002)(2906002)(4744005)(5660300002)(31696002)(86362001)(6666004)(6506007)(36756003)(6512007)(478600001)(6486002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NmR3TFZZM0p1V2JzYnljMnh1VVVtRitwMnFHUjJNbFRWcE5leVRLZ3htTnVJ?=
 =?utf-8?B?cDdKLzR4NE1aQUNvQnhSMEU0VDRkaEdBWVFXWm5Ud1Nnb3hud1M5OU43dU8y?=
 =?utf-8?B?UDNDVFFKMVREak8yamRrZmpmUUVHMGVFbzVjVnFCaTBzbXVadVFGQ3ZBelQ2?=
 =?utf-8?B?U040WlVBcHQ5Y2oyTVVnUXdxZEpwTW5hNWNuR2dRNUtyMWtqbXljTUdyWEVu?=
 =?utf-8?B?MnVPRUY0VE1PYzJQa1hpZFVVdlpVVmtNbGFHamY1YkZSTUYybForUDNyMjFp?=
 =?utf-8?B?VUc5emdSb3E5MHQvdmlNN0ZnbUhpcmtldW1MVW5FU3duL2Rpc1NWT0NsRHdw?=
 =?utf-8?B?bTk0M0FVRE1wVTZONHRRSDV6eGlzZjA4bXFsWis0NUJjeVl3RTJYWnZwVGVD?=
 =?utf-8?B?djRqb0lWcCtFdjRQcnc4eEllczR3WEZaMkpkWW1jbjFmMmZNcHlRa1kveWdh?=
 =?utf-8?B?RjZYcnNwU0tjMlg4Uk5URlo1UU0rd0NYNS9xRm5VNTU2YjJpT1F5MHk3S1RG?=
 =?utf-8?B?M2pQeTU2RkR5TzBPT0xMS1dCOEJqL0FwT0cxcVhIRFp4N05jaU13R2pzRlVQ?=
 =?utf-8?B?S3BWWndBbHNMK2NXQk9YV0VjUTJHYVJienhleFVvdmRzVnZteEVsdHphVHAz?=
 =?utf-8?B?R3dNeXptVTlYa3hmZ3VmcVFzQzFldmRaSndyZFJjYzFldU9sdGxLNENjQ05v?=
 =?utf-8?B?WGJLY0puaU5WRFZvWTRySzErMWhId3hiUzYyYzdiamJEa01ERlR2K3luVFRk?=
 =?utf-8?B?MUVhbkZXQzNOeVZpdy9xc0hKL1NkZjc1SHkwVkkzNWhzN2VuR2pMNE9ranZC?=
 =?utf-8?B?Q3R2QXNkYUN6MXNmdUVXTGx1WFFJL2JGcU1xK01XeGI3aWFFVE1aOEZVeWt4?=
 =?utf-8?B?aGxjZVlCT3lMOFU1bm0vdUZFUGNHOUdvWUw1cGhuZ0JMVnRPZTVwaVQzSVhP?=
 =?utf-8?B?U1hiODBCNGVBQzRGOStHdncvUUdUT0JuaEsrQ3JYQzFyL3NrSENMVWY5M0Vq?=
 =?utf-8?B?Wi94S0lSZ0xUUjJQV3JnK2s5ZlA1M1J1bWZUc3JTd2RGUm5DRDRkelJCd3VM?=
 =?utf-8?B?b1M2RXFxMmFOQktNVmZab2orUExGZHNzSGVRaGdpM01KRTJUbDZaZlUyc2FJ?=
 =?utf-8?B?bms0c0p1R29wcXBtSVpwRkVYOFJWMjA4eStIU2VaNlhqSUk0eEIyWURKZ2Q2?=
 =?utf-8?B?NWpsb3NocDBPZ3ViT0pEWTVUWUwvWFRDa2JQWEN1bHIySndUaTFmdVFuN285?=
 =?utf-8?B?aUtXNHlEcjFmbW1hTUt5R283MjF1dWM4ZGdRaXZTUVhKR3BJQXdnVmM4QlVT?=
 =?utf-8?B?RE8ya3JxM3RmYTFkTVVTTzNNdDRPOGdmRGlHaEdKTzZRaUJZWVA5UlgvUzV1?=
 =?utf-8?B?ZmkxNzRpcTRad2tVTzJtM3BIVXgrWm1BNzBYa1FWUzhJUUxkSzhlcmdXSmRx?=
 =?utf-8?B?aXRpL3hvamZ2MWoxeDUwemczWUxpZlF5L2tVRlpSOXE0cnRna0hiZnRRMHJn?=
 =?utf-8?B?U1k1SEZwMWE0MUdHNzNvMExOc01ucENpbzdDdk9FOWJJMS95b1hRbTZVREVt?=
 =?utf-8?B?eHQ4c3d6M3Z1Y29sVWFCZTFEUUsrQlZYL01jZGVRMXVldWxYUEpvK3ROcTdK?=
 =?utf-8?B?SjdIL2xHclRjL205VVNJQS9UcndieUN2Ykl4UGNVSEFYaVNnRW9sd3VqRDVE?=
 =?utf-8?B?WHZadEZGSUE3djRheDUrbXhmaXRrYnlzeExvNXFTRTcwT29ZQTBpL3BuQmc5?=
 =?utf-8?B?eGljOXd3SWRRL0xuV0F0ck5HOElnVzBsekRCbEtGc3JCQ1BPcUZtM0FCMUor?=
 =?utf-8?B?ZmtXMENuR3o0MGU0clpITktKMk5UaytIdUJmM3V2S2FTb0tER0tQOEIzUjBr?=
 =?utf-8?B?SUxNc0MyRzlSNzFyNGVFK2VrNWkzL0tHOXA1bWNXbHQvMUwwV0hPeGh6Tkht?=
 =?utf-8?B?R09Md0Fuc2dLWkxwTXIrQ0NsUGhYQjIrSG9hUzYrZVNSK0ZnRzFLZHV3dzZ4?=
 =?utf-8?B?alBkSlExMzJQVitjVmd1ZmdsdnIrQTRiUmNlV09vcFcvdUZSYlZseXJBb2s3?=
 =?utf-8?B?R3BNRVBaVGc1UDRCdGt2SUpnUDVPWDRhOWQ1VnhJUGdhMXlzQlFhdlFaaWJw?=
 =?utf-8?B?d21maGFoSWN2aThWSXg3cVFFMGdlTXBDaFcwQ1lGY28vK0l6Z05JWWVkRXZN?=
 =?utf-8?B?bUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: eefbfb5c-c8e2-4872-f2de-08dbc9be3a4d
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2023 18:25:06.3586 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FtE/O1PWaiGGkKG3dZc2Y23/70ayMbNHsAWbgWfmjLUBM7wDUZiWszqncK8SEkPPERr0vKE/W9qyvNevTY4asKYML521n8ofPGnZhb7KeYY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7761
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
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>,
 Maxime Ripard <mripard@kernel.org>, Matthew Auld <matthew.auld@intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/10/2023 05:15, Andi Shyti wrote:
> Hi,
>
> I might have picked up the wrong series and missed some reviews
> and the extra patch from Nirmoy with a real use of the
> drm_dbg_ratelimited() that John was looking for.
>
> Thanks,
> Andi
I just found the original post of this from back in January 
(https://patchwork.freedesktop.org/series/112925/). Is there a reason 
why it was never merged? As noted, it appears to have a whole bunch of 
r-b's on it.

John.

> v2:
> pick the right patch with the following changes:
>   - add more r-b's
>   - add a patch 2 where the drm_dbg_ratelimited is actually used.
>
> Nirmoy Das (2):
>    drm/print: Add drm_dbg_ratelimited
>    drm/i915: Ratelimit debug log in vm_fault_ttm
>
>   drivers/gpu/drm/i915/gem/i915_gem_ttm.c | 5 +++--
>   include/drm/drm_print.h                 | 3 +++
>   2 files changed, 6 insertions(+), 2 deletions(-)
>

