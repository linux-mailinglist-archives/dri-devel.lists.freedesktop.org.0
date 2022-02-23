Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 117D14C1104
	for <lists+dri-devel@lfdr.de>; Wed, 23 Feb 2022 12:09:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 209AA89BA9;
	Wed, 23 Feb 2022 11:09:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B62689BA9;
 Wed, 23 Feb 2022 11:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645614555; x=1677150555;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=kxbaHhgozXihhL3UHBaSeZfPLcz8kepF9s5rfGDqhGI=;
 b=EAKUFimJU8F+Jyr/O9GGMB0P6oQAj/IFDG+UjO/3q/MbkqaDgXnGLS5i
 d7aZ62jAQ5vVcvtyd2bIbyvhXr+0jj2l0UA68V6+D5SnacOvr3uKHAg6E
 plMqxTNCDQpSRMQSt7irvxAy58Y5uqIycUuUsm4h+RWBLNZvWOrqWTOSh
 1HCZOcuFSwaFjHaKhKyA+ya/yHH0V2vN1i3VUZ9GTabyd7QtSfIzekrhL
 USkgIzFzhm6GVC24uBnrf+GbjbWD2EJmKYIC1xay8BeKRiSRVetkaOzqj
 rXIuMF1RoEFHBSdcsTnKGswYiEalEdFq5IMsK0St4d+IYIM/FxxKVpA9P Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10266"; a="232561147"
X-IronPort-AV: E=Sophos;i="5.88,390,1635231600"; d="scan'208";a="232561147"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2022 03:09:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,390,1635231600"; d="scan'208";a="573780534"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
 by orsmga001.jf.intel.com with ESMTP; 23 Feb 2022 03:09:14 -0800
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Wed, 23 Feb 2022 03:09:14 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Wed, 23 Feb 2022 03:09:13 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Wed, 23 Feb 2022 03:09:13 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Wed, 23 Feb 2022 03:09:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OEvJB43wlmbGPeqE4rK9LlUpPp9yAPRH2UnADdBQK147Y9MwH2gjmcTc6IxpGFRt4dwoTQJBXl8bW9bIdmYd8qi3IX5B6igFCC2vRFk56Za7hadWObYQ+gtiUMjp1rSs02z5HWZ7gD2aweCA9/Qn2ZOpjLm659DKn7w2S+bNcSDsdg4n5ttV0jGyeJV2QVAlIOXOOd20VtOVnlCqq5rkmRrU8ePEbfFie8r+CZXGcII5INpocVwO0XplxQmYOuhrQiX0V0y6ZvV3oyHsai4k3H7NqLRtTuK6eceMxpyAbVxw0hbDlMfBhZY49Ap33DJFu37w1VvMIwsu77Gmp9npVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jgx2/XfJzCCmIYZmrr7ldTbXrXsG2Obu446PTdySW6Q=;
 b=Hug4dMIIVxGQWIeQEGWntfaUqpx1NRxC4N4oN6Qt3N0UB2YvLbzZQNAaBowThLEmJpQ1QkAaJTSWouruqkEVTY9YdfMRXuBp92Cu8BkSmwvfWUMwuweSHhMe1vq8zd8VMMp5e6I5YvW4vYUxS1/ueOPDl3L8Wzvkwd0mPirfh8AuYS+YK04JsIywNegvIxq3BX8ZBIl3kdgACggckrsF5AkXbezWfNZptxtMT3suefTgIMa64WekWZt1UKyCE2UJ9YbceQNU/ZblArorSXjvwTAi0veg0Wh+k7di8F7vyz6aAEHzY8jEMbw4MsELCXAyVawJaDFKenz5RUK63EPcIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4894.namprd11.prod.outlook.com (2603:10b6:a03:2d4::5)
 by MW5PR11MB5859.namprd11.prod.outlook.com (2603:10b6:303:19e::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.16; Wed, 23 Feb
 2022 11:09:11 +0000
Received: from SJ0PR11MB4894.namprd11.prod.outlook.com
 ([fe80::d67:8a16:f4cd:b475]) by SJ0PR11MB4894.namprd11.prod.outlook.com
 ([fe80::d67:8a16:f4cd:b475%9]) with mapi id 15.20.5017.022; Wed, 23 Feb 2022
 11:09:11 +0000
Date: Wed, 23 Feb 2022 16:38:57 +0530
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: "Das, Nirmoy" <nirmoy.das@linux.intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: Re: [Intel-gfx] [PATCH 0/7] drm/i915: Use the memcpy_from_wc
 function from drm
Message-ID: <YhYVyZM3TsC5wtL5@bvivekan-mobl.gar.corp.intel.com>
References: <20220222145206.76118-1-balasubramani.vivekanandan@intel.com>
 <02d3850b-5481-d142-f1d4-b408ea2b2431@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <02d3850b-5481-d142-f1d4-b408ea2b2431@linux.intel.com>
X-ClientProxiedBy: BM1PR0101CA0035.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:1a::21) To SJ0PR11MB4894.namprd11.prod.outlook.com
 (2603:10b6:a03:2d4::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3a4279fb-c17a-4ec1-313c-08d9f6bceb4d
X-MS-TrafficTypeDiagnostic: MW5PR11MB5859:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <MW5PR11MB585922667B4F5FEDE401C79E9F3C9@MW5PR11MB5859.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: o05eLtBTS/I1fIAs0XNB35RRwOosuqsXUAd+e/bkLILFK/Fstj0/KGaXObKgtkZ3Iv7haxTk6016d1IlyNE71/WHKe1OyEFjdh4+k2CPJhYAcQ8YZaYtwOQ3u2LdVKqQk6ui0sv91bmfucFpmM5rQSfzqQJ4Rto3k3/2oLAyD1YUeWzM+CktkaaOjiTd3pMojt8Yv0tYvwPOsCQsPxKt2aK7YbX8qWn35PdknbipO8vM6+eluOihWpMb7dh1epNUKnidDGNUL+N6JgdB/z57VuNFoAee5SPm2fRiNeuJsTyWdVTRXiSU/PzmUicHbvgseBBn4+lQklFOKRot/LK0TXaKrKB79FAoY62/tlhVWrLjKUSWNrtN0Fblzp0920SzxC5Q2M9tEauVnOL7gwrjSwTgwrEitkmYm58j8yH1GHfbP3sjIvkjJX3t2z/zXrbUwBnmweKVoR8n+XBOwSa5J5ofyNysadzjuoMbDYmjYXbLEI/GR4WuTNNWWYMW7aIqnwgFJzs2zWQZLJC1esSk6k8FkmP75fk+cb3X2EVCpO4si1y1naaC/30UGm932iPKG9cZd6hYEogzIgSyWGSYQuMqHdJBayJc2NZZFlAN4cHPUyTO7MeWzcb1GOUocrSi6EB64aDWu/jw8GVtsKhKAw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4894.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6486002)(44832011)(966005)(86362001)(82960400001)(316002)(6512007)(26005)(54906003)(508600001)(53546011)(2906002)(38100700002)(83380400001)(8936002)(66946007)(66476007)(66556008)(4326008)(6506007)(5660300002)(6666004)(186003)(8676002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?KyttcDMrS3N2UWNiM0RaZDQyZTQvQ0toVFdLVjY4YlpSb2hpMXRuN1FFbXJt?=
 =?utf-8?B?UVhYU0t1aXEvbktBQmFMOWY1czhSTDFwbmxuSHNyL1VTWWEyaklsU251THpD?=
 =?utf-8?B?SWtibFIybzNJellUMktMeStDT3A1L2JMNHhzV0NvMlJ0R1lxR0pXZnFJbFg0?=
 =?utf-8?B?MXFsUTVMbVNqSWxTd2xUd3hSWkRrNjhQM0dtWVBGRW1zU0djdTdNcjhYNlZT?=
 =?utf-8?B?bXBYbkhQTmt4YmhtWUhCZFRhS3BBNDl6RTZKMXBnNmZRVVp6YnZobGdwdFRB?=
 =?utf-8?B?cjFiUEtQVkQyK0U0MjFoOWJXOEVQZkpYT1ZrMytscTgyUFhNZ0NGNm9VQlpo?=
 =?utf-8?B?cktyOCswMXBzMHIvMzQ5RGpFeHpOYXM0VXU3NmF6SzBWcE1FcitacjlFTXRn?=
 =?utf-8?B?cGhLcFQ3TGxDTFhnQVBDMnVsY0lJNnBiOFREd1hoQjNISjJCRW5kYXVDa2VE?=
 =?utf-8?B?UVZWdXFQTFNuVEJFLy9IdlpSYXY3K2pMeVFiWDdjN001M3dPSGtScVVVQjRC?=
 =?utf-8?B?WS9UbHhsSWRCTXFrTDNHZ1Z0VmIzUXJhaU5NcHg1WE9hN0UrSENGdDdoKzRQ?=
 =?utf-8?B?Y2dIUFA4YWNNckJmTjR2ZEhpcytFYm1hbGdFWFZDbjBxbmF4dm1qSklvekdE?=
 =?utf-8?B?UHZ5dXE1czN2UmwyU1dCVVltcmtyS3pSNytERDdJS3lqSDdYa25SQm1PclU1?=
 =?utf-8?B?U3lKT1dSV200UnFzWGozR0g1d095YzJvdGs3RTVRUDhMYjZ0cmZVdG8yNEo2?=
 =?utf-8?B?K3BQd29wODJxWkpVYnhrc3lqZWVBR1d5STh2Q2R5U2dSb1pxdENsY28xRVQx?=
 =?utf-8?B?b3EwY2ErSjFCdWpadWxqbkQ2dVZMaHFZdm1pTkk2dTBSenAzeUJZMXZLL2hT?=
 =?utf-8?B?MHUzRGtBRnNzUDRZL0YyZzhkc3NLUko2a2FidGNKUEIxQzZOdlVRYWVYaW5K?=
 =?utf-8?B?eHdIclZnTjYzd1I4QjNZajgrQzlBejhKUFUyaFl0ZGpiN2dNblFmNWtSUWFp?=
 =?utf-8?B?UlVBenM1RDcrYzRVcHg4YWFTbHQzazZUaXNLYzFublJ0NktCNzBoVWVLNHNv?=
 =?utf-8?B?UVFrdjkxdzlyRWJidkFncXorNlhYNVFrT0tjSElNcUpyYVJpcTBOMlVzaVVP?=
 =?utf-8?B?Nk1PQzhESVg4QTYwWk94R0V3UFg2dy9DZkRjenRYNlI0K3lZOUtjeDhkeTNK?=
 =?utf-8?B?U2FNdUZwbS9YRGF5dmgvbmRoQ2dJdXA4NGYzREZ1YjBXMDd2L1BFeTdjRXo4?=
 =?utf-8?B?VUdSU1hIT1MzS09SUlM2SmJmQWM2MTlpaG1Sd1cyQ2lrK2tobTJQYWVuK2pz?=
 =?utf-8?B?Nm4zbjdEajBidldNai9Ebnk0eWNKWTB5T2grczJ2cS9xWWMzam8vQjRmUmw5?=
 =?utf-8?B?K2EvQjBsZFNxOStMWC9teU90Wjh1Ui83RERSaW9sRy9CZ0tUM081czE5Q0E3?=
 =?utf-8?B?UGQzcElzQjRMRFlyNHlEU1diRlJOeVdnd1JhUVRNRTZnMy9LMzliSkdOQ2kr?=
 =?utf-8?B?ZFl4ZmtTVmpKZmgvUVBBWjNZN1E0N2YvYVltbitSVmRFOHpVUDRSMVlFU2la?=
 =?utf-8?B?alhySjBCdTFKY2ZJTlZVSC81aWp3alZFZ3M3Y01uRndVMmxZaW9Jb0FsZXFF?=
 =?utf-8?B?ZUlEbi9vQzUrc0ZWdzFRaHJ3SjNiMzBIQWI1ZlEvWUNnWUtvbDhkaytQdzNQ?=
 =?utf-8?B?RU5mTlQ5cmJyWFYxM0pTbDBUd01BMzM1K1V3d3Q1T2hzL0xEWXZGL2t3eTV2?=
 =?utf-8?B?RTRvWW1kUldzL2pxeGtMNXVKcFF6OVFMVDBlTUtIOG05ZmE3ZlZreWhDV0R2?=
 =?utf-8?B?OVJQOVJkREZJZXVhb1JiK0ZjQ3FSdy9leWJJYWlBSy82amY3QkcvMjBSYnNG?=
 =?utf-8?B?OVA2SUkzcnFnY053R212UVFHTUFobXZhNlhXbmdvVGs2UzgwbG4ya2VxaHRs?=
 =?utf-8?B?ekEyMzMzNmVCL3prb0NraWhRZDQ1MVNKQ1BZNmhMelZvUStTd3lyYVBLelhC?=
 =?utf-8?B?NUVhYjRhYnB4eG5JZW0rRWFFOTZJUDBZQWdLS2RhRURIL3BlU1V4VHZ6UzF4?=
 =?utf-8?B?UlFCaXJMOGFoWjloY0F4bnhIZFJNYXlybXZVSGdMaWFyQ1lRL0prSmFZNjNh?=
 =?utf-8?B?NHF1dkpsNkxtRG5Jakd6ZWhJMGFNNTNNdit3THhFNWQ0N3k4MFFROStkektR?=
 =?utf-8?B?NVc2OUhPQVRmOXczaDVFYitDdE5qbXVrUHRHSUU0cHpSMzZVelNlRFFPMlFV?=
 =?utf-8?B?MEpxOUI3VHBRUEFNUHlQRUM3NEpHR1FsVlNscFBFQTBVdHZpVXBSNWxCMTc1?=
 =?utf-8?B?L0htT1hjemVxaDR2bXBkUUxzTlUxK2ZYOEtFMDBzNVFEVWZaYzRPdz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a4279fb-c17a-4ec1-313c-08d9f6bceb4d
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4894.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2022 11:09:11.3968 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QplWIqI1CPorqVlEUvYea+nsWJNm3/blYu0/W0iHbGnS/j8u88cpg+fKa40qTmlUcSaGrCPyHHB7hUAMTffZsXKFcBcp23amNXrDiOIyI6dRaSLIl0fgNPAkss0AmFir
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5859
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
Cc: Thomas Hellstr_m <thomas.hellstrom@linux.intel.com>,
 michael.cheng@intel.com, Jani Nikula <jani.nikula@intel.com>,
 lucas.demarchi@intel.com, Chris Wilson <chris.p.wilson@intel.com>,
 siva.mullati@intel.com, David Airlie <airlied@linux.ie>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 23.02.2022 10:02, Das, Nirmoy wrote:
> 
> On 22/02/2022 15:51, Balasubramani Vivekanandan wrote:
> > drm_memcpy_from_wc() performs fast copy from WC memory type using
> > non-temporal instructions. Now there are two similar implementations of
> > this function. One exists in drm_cache.c as drm_memcpy_from_wc() and
> > another implementation in i915/i915_memcpy.c as i915_memcpy_from_wc().
> > drm_memcpy_from_wc() was the recent addition through the series
> > https://patchwork.freedesktop.org/patch/436276/?series=90681&rev=6
> > 
> > The goal of this patch series is to change all users of
> > i915_memcpy_from_wc() to drm_memcpy_from_wc() and a have common
> > implementation in drm and eventually remove the copy from i915.
> > 
> > Another benefit of using memcpy functions from drm is that
> > drm_memcpy_from_wc() is available for non-x86 architectures.
> > i915_memcpy_from_wc() is implemented only for x86 and prevents building
> > i915 for ARM64.
> > drm_memcpy_from_wc() does fast copy using non-temporal instructions for
> > x86 and for other architectures makes use of memcpy() family of
> > functions as fallback.
> > 
> > Another major difference is unlike i915_memcpy_from_wc(),
> > drm_memcpy_from_wc() will not fail if the passed address argument is not
> > alignment to be used with non-temporal load instructions or if the
> > platform lacks support for those instructions (non-temporal load
> > instructions are provided through SSE4.1 instruction set extension).
> > Instead drm_memcpy_from_wc() continues with fallback functions to
> > complete the copy.
> > This relieves the caller from checking the return value of
> > i915_memcpy_from_wc() and explicitly using a fallback.
> > 
> > Follow up series will be created to remove the memcpy_from_wc functions
> > from i915 once the dependency is completely removed.
> 
> Overall the series looks good to me but I think you can add another patch to
> remove
> 
> i915_memcpy_from_wc() as I don't see any other usages left after this series, may be I
> am missing something?

I have changed all users of i915_memcpy_from_wc() to drm function. But
this is another function i915_unaligned_memcpy_from_wc() in
i915_memcpy.c which is blocking completely eliminating the i915_memcpy.c
file from i915.
This function accepts unaligned source address and does fast copy only
for the aligned region of memory and remaining part is copied using
memcpy function.
Either I can move i915_unaligned_memcpy_from_wc() also to drm but I am
concerned since it is more a platform specific handling, does it make
sense to keep it in drm.
Else I have retain to i915_unaligned_memcpy_from_wc() inside i915 and
refactor the function to use drm_memcpy_from_wc() instead of the
__memcpy_ntdqu().
But before I could do more changes, I wanted feedback on the current
change. So I decided to go ahead with creating series for review.

Regards,
Bala

> 
> Regards,
> Nirmoy
> 
> > 
> > Cc: Jani Nikula <jani.nikula@intel.com>
> > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> > Cc: David Airlie <airlied@linux.ie>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Cc: Chris Wilson <chris.p.wilson@intel.com>
> > Cc: Thomas Hellstr_m <thomas.hellstrom@linux.intel.com>
> > Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> > 
> > Balasubramani Vivekanandan (7):
> >    drm: Relax alignment constraint for destination address
> >    drm: Add drm_memcpy_from_wc() variant which accepts destination
> >      address
> >    drm/i915: use the memcpy_from_wc call from the drm
> >    drm/i915/guc: use the memcpy_from_wc call from the drm
> >    drm/i915/selftests: use the memcpy_from_wc call from the drm
> >    drm/i915/gt: Avoid direct dereferencing of io memory
> >    drm/i915: Avoid dereferencing io mapped memory
> > 
> >   drivers/gpu/drm/drm_cache.c                   | 98 +++++++++++++++++--
> >   drivers/gpu/drm/i915/gem/i915_gem_object.c    |  8 +-
> >   drivers/gpu/drm/i915/gt/selftest_reset.c      | 21 ++--
> >   drivers/gpu/drm/i915/gt/uc/intel_guc_log.c    | 11 ++-
> >   drivers/gpu/drm/i915/i915_gpu_error.c         | 45 +++++----
> >   .../drm/i915/selftests/intel_memory_region.c  |  8 +-
> >   include/drm/drm_cache.h                       |  3 +
> >   7 files changed, 148 insertions(+), 46 deletions(-)
> > 
