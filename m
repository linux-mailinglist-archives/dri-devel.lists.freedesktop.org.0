Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 519FC6434E1
	for <lists+dri-devel@lfdr.de>; Mon,  5 Dec 2022 20:53:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C290D10E290;
	Mon,  5 Dec 2022 19:53:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71E3910E283;
 Mon,  5 Dec 2022 19:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1670269996; x=1701805996;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=CPttRgqYzHI3YuDUN2mnZpDZSf91NOQjMNVVCP/E5HY=;
 b=fJdJfuyrTTAdYjshgwdlevmkyEYYCzSI7IwQG1kFAUmqklc+ju4juOcO
 cwxhoM/2Q/ln7C6f2ysTEshaePwCZ/OeKFClsGvf6ybfe4q5YWm1orCWY
 9VjqAGzjdHXxIp82nPKCs5R/IQ01PzM30h+EFywqpAKUu11LVRTUN7q0N
 z30OC5jpBJitndri5nD9C0z1lr+b6XVVEyN5MXZxjOmUBrAeuohQliLvv
 5Py0yWMPFx/JyrE/MqMjYTXMaG8GatEySJ+ZWubrKQZUMtf562/xY75Ec
 nlwf5qUyDrhuCJmccaF9JCjv0cbzg0lsm44KuKVnMU2Bd69YLCwVTXRK9 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10552"; a="402725130"
X-IronPort-AV: E=Sophos;i="5.96,220,1665471600"; d="scan'208";a="402725130"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2022 11:53:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10552"; a="623633755"
X-IronPort-AV: E=Sophos;i="5.96,220,1665471600"; d="scan'208";a="623633755"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga006.jf.intel.com with ESMTP; 05 Dec 2022 11:53:14 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 5 Dec 2022 11:53:14 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 5 Dec 2022 11:53:13 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Mon, 5 Dec 2022 11:53:13 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.105)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Mon, 5 Dec 2022 11:53:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D2sNdxEFliUTnJqALucnzIz5eRJyXIj999TSBYR1GINqDh9XhZssNO7CPctcExkeKLAebAPzhxqRi5l7xtBvLVn+HmyxGJiaMVdx/76pTKZQDGfyr2tEG+H863dkb0qD+QMcK3WPi6rFWjOPLtwVRpFAKNRf/LhaSV1AF3ydfDbIqSQhZz5iMPPTJjwT0WAdnVxBobAfXnjoLhM8eEr2osh1x2o50TYsSsiD7Def1HtuCMrKzguZo6Sgdk7AJft9eaBHGYdhkhf8a2x30gAO8zXVK058G+9j7zrZRLIcqvpyy9V2uCN8BcDtHjZm0yALDLm472hIlrSr8EF4rs/DJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0vv8eVGndFh0Nw+kvZAeBKTULJNr402iE0uhr5A9uc4=;
 b=NK5d8AcInkBkYfYx0wgjpei7pfV8P1RAs/lKuy66Fozz1NDyISELEKz/236sKU81LL4q6SicWqLW+1rFd6h2ofbwsSgnHP7tG7XZY7/UGNhWL/P7NBAabYc5kcxHnEHKKXbeEXEoD2pybp6N3Mzrm5cREgJox/cVfd/jFQO21wVCFT9G4HtRnwz66PT9lT4Z4gRZdn3FBIAi5gyURunC4dbErTO6DBExLwH1O9ZNvK5w25dMuC4sxVGDILjV5H5WjSnDcYUnQAqWvsHWWmweYQUrBYG/4uDYhG3PzDqN4sT+fyeY6vDKM86QS+a69tqe5r/x3By0WfXrLbmUmn1sQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5880.8; Mon, 5 Dec 2022 19:53:06 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::f7a8:6d03:2464:2afd]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::f7a8:6d03:2464:2afd%5]) with mapi id 15.20.5880.014; Mon, 5 Dec 2022
 19:53:06 +0000
Message-ID: <9f03dd59-07d9-a7f1-d59e-8c57cc0f64d6@intel.com>
Date: Mon, 5 Dec 2022 11:53:03 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v8 1/1] drm/i915/pxp: Promote pxp subsystem to top-level
 of i915
Content-Language: en-US
To: Alan Previn <alan.previn.teres.alexis@intel.com>,
 <intel-gfx@lists.freedesktop.org>
References: <20221202232821.4144884-1-alan.previn.teres.alexis@intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <20221202232821.4144884-1-alan.previn.teres.alexis@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR08CA0038.namprd08.prod.outlook.com
 (2603:10b6:a03:117::15) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5488:EE_|DM4PR11MB5373:EE_
X-MS-Office365-Filtering-Correlation-Id: 881ba49e-3c8a-4d75-51ef-08dad6fa53ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: E2bUX/E65MN1h16ztNcAgN9sTrm03APrwkfXgRBVZhMqNd95ANDBBR85yBZa78QQEpRAfmxOg9delKqAHISUbXkPNojiNKGC3ZpS4FxuE5ETO5XbJC9EAnwq5TD0Jmu7sbTz4IAjvvbsS0aE4cLGfxW65xiqZvgMNMfUwssC9ttUf27gin42C8B8cTST9Gqv0NMagKAOuCItnLVM6O2saAxJNxJ/r7zOnQny+a6LO+dNbR/pjtUNctdW9MO2ETNYD2R7B4UFnTz5i2CMJhWe4a+jpXp5aTelLgfPQZSc7KOR4sFyLeDPrFH6YMyBmS+HGRXa9uiDKaKGn2ackWXTVW907z6r0REsCiWFvuM2dYchoxOc0SvEJKj4yII/SJ65oyJNAGllPU1UFFXJUIjyvoboUcuEyUhgnkUOmVqgRsG9WkxgMsasmJMchcb+8rKYB1GLCNvbiYS0FEjrM12OIh/o14MKtw5JmVC+78qNP6Y4/4IZ65IfpNkxalmpWFjQkcODEbJ2bivWNdtje6m1w0MIMg3fMvBigmTThMGTCXcescNztnb95cB9SoS3SepzbHPq4BuNCPfhs9HhHr1vFqaUiTEGTH5DicHrB1wKPW5R9EvPyatGML6nFY2waZ+eU9xZpLvSTGYPEPfSY4oPa1wqIM8Dl3hJ3sQFafjZtpd9pQFCa/LLIFQqLH3ixYwf
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(39860400002)(136003)(366004)(346002)(396003)(376002)(451199015)(31696002)(6486002)(36756003)(86362001)(6506007)(53546011)(6512007)(966005)(5660300002)(30864003)(478600001)(6666004)(41300700001)(316002)(8676002)(8936002)(54906003)(2906002)(66556008)(66946007)(82960400001)(4326008)(66476007)(38100700002)(83380400001)(26005)(186003)(2616005)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QlYrK2tFR1hwd0pRcUd0QU5TUytPckZZY0t2am5IenhoYWhkVko4ait5ZnFE?=
 =?utf-8?B?OHAzNTh5bi9yRzlQelltQkNDZnk2bW5DdSt2VE9YblliL0xRRDV5OHZGRG5w?=
 =?utf-8?B?cThKRzFaY0dveVdVV3g1MjlETlF2dmV4TTR1Z0NFL3BkR3R3MW5nQUV5UHRo?=
 =?utf-8?B?WGVRaUdLZ3FRb0JvcUF0aU15VmFXWFJUV2dwSmQwelJkQXVodFFtK1FmaElO?=
 =?utf-8?B?dUdPcjN2VmUvL3JXOGVOcDIwL0hhd1V2WEtjWHRHMnZ1aUtuWEVOdlUxVEJG?=
 =?utf-8?B?MEFrWHV1UjZQRFliTjNHWUFvRXRWZ29TNGFBdm9QckY0MmVsWGdGbnJadWl0?=
 =?utf-8?B?YndWdlJsWDZlOEI3ekFuVG9xSDViQ1ZjVi91WHU5aW02aStKY3lWZm1OZFA1?=
 =?utf-8?B?a1ZLQTBILzYzSDRnamdhbXB2dllXVjZYSE5zOWdNTzl6WnF4bUkrOVRxKytT?=
 =?utf-8?B?eWlYeHkxbi8rbEk5cEd0K0hwdmJ4elR3SkkvWVRDNDQ4cjlSaUcwRXg3bnFM?=
 =?utf-8?B?dlBmanhXZ0RWSVB0b0toMDU0S3BNMHNLKzlLelZVR1VlblRhRUF6SnFjN2hB?=
 =?utf-8?B?RjB2Y2FlbVducEtNdnBFN3J0QTcveC9lQkd0TUxCRGtBMDZiZlVIb2YwOGNI?=
 =?utf-8?B?N0s1VElwQnlQOXhiRXlRQ3JpWTNPZ1dnK0xveTFkcG9rUlNmWjkrYlJXY3dp?=
 =?utf-8?B?dWhHYmJZT1Q3QkVXdWFoN1RybVpNMDltbTVLV2pidnF5cldkVTFwU0xPU202?=
 =?utf-8?B?WEEvcXJJNXNoZ2tkZ2dGSnhLZTduOVhKeTVMbGNXdEgyRDYxdkg1ZGZHY1FB?=
 =?utf-8?B?VndmTWlkdDlVelZuVGFRSnR5aFpDM3dXRXpxNW5uU1VhUnRFWUd5NmQ5TWRi?=
 =?utf-8?B?K3ZuSnRlMGJHLy9PTWQ2bmRsdkpLaTdnUTRoWkRwbXVRb1c2U0FVOVJkcUdT?=
 =?utf-8?B?M1UySVRBN3ZQTnFiVDlpSkhDMjJUOWZaYVhpeUM4SW45d3Y1Tm1Jd1d0TDNR?=
 =?utf-8?B?Nk1kd0xEeXRad09wOHBVQ1lvMVVmOGN2RWR5SnNwN0FJalpybmFFVXFDejJk?=
 =?utf-8?B?YWNzbHB4M0REQjZ0bFhIbXV5WGxpQmRTb2dhVjJDVU5PNUlBOEJkTHZJWExT?=
 =?utf-8?B?NUlMaURwSER2dEJZeCs5eHQxYzc3aTEydVRjRDhhNkw3S1o0WUV6WTZ6cVU4?=
 =?utf-8?B?Rkw1SzZTcHI2bU9zbEdQY1pOYVdpdkNSVm9vZUhBMWxJWXo3aWFyZDlwS0pn?=
 =?utf-8?B?SzI2VjgvOHNySk95UzRHakI5UVdsb2JPM2h4UFVkTGtHVEpIdGlxRTF6bW9p?=
 =?utf-8?B?MWpJUXZ5N1daSUsySWtzZFpKWEZzcUFhcUZmSlV1bk85V2ppWFlERGw2MGIx?=
 =?utf-8?B?bmtTWEI0K2RTZERoUWs2b0tESFJKdy9IYXpDQkcxeGJ1VVM2MHhXSnRoRGE5?=
 =?utf-8?B?T2VhRWhTNjVpL2VzSExGVTdXdStyOUdVTjlTTVhuRU5qS3NHREFtdnhMTHJX?=
 =?utf-8?B?VmxyemFETXJRSEdOZVNzNGJYTFBYN25VWVVMVkdCVXBUUWloUjBiejF3NDRJ?=
 =?utf-8?B?Tlhyb2p4YXRudlBhV3Jwemg4RjNsdk1IWExmMWRwYi9iSDhVeG5OSFY1R29M?=
 =?utf-8?B?SmIvWEppRDNBbUo2bWNWSU4xYUlGb3I1ZTlBd2NOaWJScloybFA1WXlmbVI5?=
 =?utf-8?B?ZlJrU1Q0NDE5TGNtZTZQVEhZc1FIU05zM2F2UU8vaGg3akM3dnMweVdUWmlH?=
 =?utf-8?B?b1BVeWVZb05QcVFZWG5QT2ZzbkhGRnpwNVVFUkpEOWxRRzJmSkhqa2NoVzFN?=
 =?utf-8?B?c1dBajlQeHBTMXVMUFhrSXRkc1lOMERyaFhtenRpNExVSDVXUjlqRS9mSU4r?=
 =?utf-8?B?SkdCR0dtVWtud0NCTnlxTC9SOHh2N3ZVeWlXR1UyUFhWK2lhemc2SkV6b3ox?=
 =?utf-8?B?MGNoL0VIb3JJMzQ3cE9reGVocmNZNGcwVnp1c3doM3UyTTRra0dXZGxkcDBn?=
 =?utf-8?B?MWtKZnBJNUNReDU1TzNEUWd5VzcvUncxU3F5M1p6eEdaOFRBMnIvbDZJMG5M?=
 =?utf-8?B?NTNZQWx0UUliZnJBK2hraGZkWjUrU09TS0J3QWdMMmh4R3A1ckM1dHljdXhi?=
 =?utf-8?B?VVRzWU9LcXNjT29EVlA3T1pSN1UweENIekNTS2E1Y0VySldldkxqQ1lxLzd2?=
 =?utf-8?B?TWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 881ba49e-3c8a-4d75-51ef-08dad6fa53ba
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2022 19:53:06.3265 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dswtychTnj2Xp9b6W8WvJ48gHIU6J0Mhb8OPKzimoXlhop63P/GKKGr6xKVTGweKktDYb6luaOlEZZs364NnIrK4GfsuNkMJjqyrSYv0fcE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5373
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
Cc: John Harrison <john.c.harrison@intel.com>, dri-devel@lists.freedesktop.org,
 Rodrigo <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 12/2/2022 3:28 PM, Alan Previn wrote:
> Starting with MTL, there will be two GT-tiles, a render and media
> tile. PXP as a service for supporting workloads with protected
> contexts and protected buffers can be subscribed by process
> workloads on any tile. However, depending on the platform,
> only one of the tiles is used for control events pertaining to PXP
> operation (such as creating the arbitration session and session
> tear-down).
>
> PXP as a global feature is accessible via batch buffer instructions
> on any engine/tile and the coherency across tiles is handled implicitly
> by the HW. In fact, for the foreseeable future, we are expecting this
> single-control-tile for the PXP subsystem.
>
> In MTL, it's the standalone media tile (not the root tile) because
> it contains the VDBOX and KCR engine (among the assets PXP relies on
> for those events).
>
> Looking at the current code design, each tile is represented by the
> intel_gt structure while the intel_pxp structure currently hangs off the
> intel_gt structure.
>
> Keeping the intel_pxp structure within the intel_gt structure makes some
> internal functionalities more straight forward but adds code complexity to
> code readibility and maintainibility to many external-to-pxp subsystems
> which may need to pick the correct intel_gt structure. An example of this
> would be the intel_pxp_is_active or intel_pxp_is_enabled functionality
> which should be viewed as a global level inquiry, not a per-gt inquiry.
>
> That said, this series promotes the intel_pxp structure into the
> drm_i915_private structure making it a top-level subsystem and the PXP
> subsystem will select the control gt internally and keep a pointer to
> it for internal reference.
>
> Changes from prior revs:
>     v7: - Drop i915_dev_to_pxp and in intel_pxp_init use 'i915->pxp'
>           through out instead of local variable newpxp. (Rodrigo)
>         - In the case intel_pxp_fini is called during driver unload but
>           after i915 loading failed without pxp being allocated, check
>           i915->pxp before referencing it. (Alan)
>     v6: - Remove HAS_PXP macro and replace it with intel_pxp_is_supported
>           because : [1] introduction of 'ctrl_gt' means we correct this
>           for MTL's upcoming series now. [2] Also, this has little impact
>           globally as its only used by PXP-internal callers at the moment.
>         - Change intel_pxp_init/fini to take in i915 as its input to avoid
>           ptr-to-ptr in init/fini calls.(Jani).
>         - Remove the backpointer from pxp->i915 since we can use
>           pxp->ctrl_gt->i915 if we need it. (Rodrigo).
>     v5: - Switch from series to single patch (Rodrigo).
>         - change function name from pxp_get_kcr_owner_gt to
>           pxp_get_ctrl_gt.
>         - Fix CI BAT failure by removing redundant call to intel_pxp_fini
>           from driver-remove.
>         - NOTE: remaining open still persists on using ptr-to-ptr
>           and back-ptr.
>     v4: - Instead of maintaining intel_pxp as an intel_gt structure member
>           and creating a number of convoluted helpers that takes in i915 as
>           input and redirects to the correct intel_gt or takes any intel_gt
>           and internally replaces with the correct intel_gt, promote it to
>           be a top-level i915 structure.
>     v3: - Rename gt level helper functions to "intel_pxp_is_enabled/
>           supported/ active_on_gt" (Daniele)
>         - Upgrade _gt_supports_pxp to replace what was intel_gtpxp_is
>           supported as the new intel_pxp_is_supported_on_gt to check for
>           PXP feature support vs the tee support for huc authentication.
>           Fix pxp-debugfs-registration to use only the former to decide
>           support. (Daniele)
>         - Couple minor optimizations.
>     v2: - Avoid introduction of new device info or gt variables and use
>           existing checks / macros to differentiate the correct GT->PXP
>           control ownership (Daniele Ceraolo Spurio)
>         - Don't reuse the updated global-checkers for per-GT callers (such
>           as other files within PXP) to avoid unnecessary GT-reparsing,
>           expose a replacement helper like the prior ones. (Daniele).
>     v1: - Add one more patch to the series for the intel_pxp suspend/resume
>           for similar refactoring
>
> References: https://patchwork.freedesktop.org/patch/msgid/20221202011407.4068371-1-alan.previn.teres.alexis@intel.com
> Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
> ---
>   .../drm/i915/display/skl_universal_plane.c    |  2 +-
>   drivers/gpu/drm/i915/gem/i915_gem_context.c   |  6 +-
>   drivers/gpu/drm/i915/gem/i915_gem_create.c    |  2 +-
>   .../gpu/drm/i915/gem/i915_gem_execbuffer.c    |  2 +-
>   drivers/gpu/drm/i915/gt/intel_gt.c            |  5 --
>   drivers/gpu/drm/i915/gt/intel_gt_debugfs.c    |  1 -
>   drivers/gpu/drm/i915/gt/intel_gt_irq.c        |  2 +-
>   drivers/gpu/drm/i915/gt/intel_gt_pm.c         |  8 --
>   drivers/gpu/drm/i915/gt/intel_gt_types.h      |  3 -
>   drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c     |  2 +-
>   drivers/gpu/drm/i915/i915_driver.c            | 18 +++++
>   drivers/gpu/drm/i915/i915_drv.h               |  7 +-
>   drivers/gpu/drm/i915/pxp/intel_pxp.c          | 77 ++++++++++++++-----
>   drivers/gpu/drm/i915/pxp/intel_pxp.h          | 10 ++-
>   drivers/gpu/drm/i915/pxp/intel_pxp_cmd.c      |  8 +-
>   drivers/gpu/drm/i915/pxp/intel_pxp_debugfs.c  | 44 +++++++----
>   drivers/gpu/drm/i915/pxp/intel_pxp_debugfs.h  |  4 +-
>   drivers/gpu/drm/i915/pxp/intel_pxp_irq.c      | 10 ++-
>   drivers/gpu/drm/i915/pxp/intel_pxp_pm.c       |  4 +-
>   drivers/gpu/drm/i915/pxp/intel_pxp_tee.c      | 17 ++--
>   drivers/gpu/drm/i915/pxp/intel_pxp_types.h    |  8 ++
>   21 files changed, 154 insertions(+), 86 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
> index 76490cc59d8f..4b79c2d2d617 100644
> --- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
> +++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
> @@ -1848,7 +1848,7 @@ static bool bo_has_valid_encryption(struct drm_i915_gem_object *obj)
>   {
>   	struct drm_i915_private *i915 = to_i915(obj->base.dev);
>   
> -	return intel_pxp_key_check(&to_gt(i915)->pxp, obj, false) == 0;
> +	return intel_pxp_key_check(i915->pxp, obj, false) == 0;
>   }
>   
>   static bool pxp_is_borked(struct drm_i915_gem_object *obj)
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> index 7f2831efc798..46e71f62fcec 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> @@ -257,7 +257,7 @@ static int proto_context_set_protected(struct drm_i915_private *i915,
>   
>   	if (!protected) {
>   		pc->uses_protected_content = false;
> -	} else if (!intel_pxp_is_enabled(&to_gt(i915)->pxp)) {
> +	} else if (!intel_pxp_is_enabled(i915->pxp)) {
>   		ret = -ENODEV;
>   	} else if ((pc->user_flags & BIT(UCONTEXT_RECOVERABLE)) ||
>   		   !(pc->user_flags & BIT(UCONTEXT_BANNABLE))) {
> @@ -271,8 +271,8 @@ static int proto_context_set_protected(struct drm_i915_private *i915,
>   		 */
>   		pc->pxp_wakeref = intel_runtime_pm_get(&i915->runtime_pm);
>   
> -		if (!intel_pxp_is_active(&to_gt(i915)->pxp))
> -			ret = intel_pxp_start(&to_gt(i915)->pxp);
> +		if (!intel_pxp_is_active(i915->pxp))
> +			ret = intel_pxp_start(i915->pxp);
>   	}
>   
>   	return ret;
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_create.c b/drivers/gpu/drm/i915/gem/i915_gem_create.c
> index 33673fe7ee0a..005a7f842784 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_create.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_create.c
> @@ -384,7 +384,7 @@ static int ext_set_protected(struct i915_user_extension __user *base, void *data
>   	if (ext.flags)
>   		return -EINVAL;
>   
> -	if (!intel_pxp_is_enabled(&to_gt(ext_data->i915)->pxp))
> +	if (!intel_pxp_is_enabled(ext_data->i915->pxp))
>   		return -ENODEV;
>   
>   	ext_data->flags |= I915_BO_PROTECTED;
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> index 29e9e8d5b6fe..ed74d173a092 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> @@ -869,7 +869,7 @@ static struct i915_vma *eb_lookup_vma(struct i915_execbuffer *eb, u32 handle)
>   		 */
>   		if (i915_gem_context_uses_protected_content(eb->gem_context) &&
>   		    i915_gem_object_is_protected(obj)) {
> -			err = intel_pxp_key_check(&vm->gt->pxp, obj, true);
> +			err = intel_pxp_key_check(vm->gt->i915->pxp, obj, true);

nit: eb->i915->pxp is one less pointer jump

>   			if (err) {
>   				i915_gem_object_put(obj);
>   				return ERR_PTR(err);
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
> index 8b5077d630a7..930e68b43462 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt.c
> @@ -8,7 +8,6 @@
>   
>   #include "gem/i915_gem_internal.h"
>   #include "gem/i915_gem_lmem.h"
> -#include "pxp/intel_pxp.h"
>   
>   #include "i915_drv.h"
>   #include "i915_perf_oa_regs.h"
> @@ -762,8 +761,6 @@ int intel_gt_init(struct intel_gt *gt)
>   
>   	intel_migrate_init(&gt->migrate, gt);
>   
> -	intel_pxp_init(&gt->pxp);
> -
>   	goto out_fw;
>   err_gt:
>   	__intel_gt_disable(gt);
> @@ -803,8 +800,6 @@ void intel_gt_driver_unregister(struct intel_gt *gt)
>   	intel_rps_driver_unregister(&gt->rps);
>   	intel_gsc_fini(&gt->gsc);
>   
> -	intel_pxp_fini(&gt->pxp);
> -
>   	/*
>   	 * Upon unregistering the device to prevent any new users, cancel
>   	 * all in-flight requests so that we can quickly unbind the active
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_debugfs.c b/drivers/gpu/drm/i915/gt/intel_gt_debugfs.c
> index dd53641f3637..7876f4c3d0f1 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_debugfs.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_debugfs.c
> @@ -99,7 +99,6 @@ void intel_gt_debugfs_register(struct intel_gt *gt)
>   	intel_sseu_debugfs_register(gt, root);
>   
>   	intel_uc_debugfs_register(&gt->uc, root);
> -	intel_pxp_debugfs_register(&gt->pxp, root);

Nit: the pxp header inclusion can now be removed from this file.

>   }
>   
>   void intel_gt_debugfs_register_files(struct dentry *root,
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_irq.c b/drivers/gpu/drm/i915/gt/intel_gt_irq.c
> index 6f6b9e04d916..8fac2660e16b 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_irq.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_irq.c
> @@ -76,7 +76,7 @@ gen11_other_irq_handler(struct intel_gt *gt, const u8 instance,
>   		return gen11_rps_irq_handler(&media_gt->rps, iir);
>   
>   	if (instance == OTHER_KCR_INSTANCE)
> -		return intel_pxp_irq_handler(&gt->pxp, iir);
> +		return intel_pxp_irq_handler(gt->i915->pxp, iir);
>   
>   	if (instance == OTHER_GSC_INSTANCE)
>   		return intel_gsc_irq_handler(gt, iir);
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm.c b/drivers/gpu/drm/i915/gt/intel_gt_pm.c
> index 16db85fab0b1..c065950d0bad 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_pm.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_pm.c
> @@ -304,8 +304,6 @@ int intel_gt_resume(struct intel_gt *gt)
>   
>   	intel_uc_resume(&gt->uc);
>   
> -	intel_pxp_resume(&gt->pxp);
> -
>   	user_forcewake(gt, false);
>   
>   out_fw:
> @@ -339,8 +337,6 @@ void intel_gt_suspend_prepare(struct intel_gt *gt)
>   {
>   	user_forcewake(gt, true);
>   	wait_for_suspend(gt);
> -
> -	intel_pxp_suspend_prepare(&gt->pxp);
>   }
>   
>   static suspend_state_t pm_suspend_target(void)
> @@ -365,7 +361,6 @@ void intel_gt_suspend_late(struct intel_gt *gt)
>   	GEM_BUG_ON(gt->awake);
>   
>   	intel_uc_suspend(&gt->uc);
> -	intel_pxp_suspend(&gt->pxp);
>   
>   	/*
>   	 * On disabling the device, we want to turn off HW access to memory
> @@ -393,7 +388,6 @@ void intel_gt_suspend_late(struct intel_gt *gt)
>   
>   void intel_gt_runtime_suspend(struct intel_gt *gt)
>   {
> -	intel_pxp_runtime_suspend(&gt->pxp);
>   	intel_uc_runtime_suspend(&gt->uc);
>   
>   	GT_TRACE(gt, "\n");
> @@ -411,8 +405,6 @@ int intel_gt_runtime_resume(struct intel_gt *gt)
>   	if (ret)
>   		return ret;
>   
> -	intel_pxp_runtime_resume(&gt->pxp);
> -
>   	return 0;
>   }
>   
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_types.h b/drivers/gpu/drm/i915/gt/intel_gt_types.h
> index f519aa4a004a..0b6da2aa9718 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_types.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_types.h
> @@ -30,7 +30,6 @@
>   #include "intel_rps_types.h"
>   #include "intel_migrate_types.h"
>   #include "intel_wakeref.h"
> -#include "pxp/intel_pxp_types.h"
>   #include "intel_wopcm.h"
>   
>   struct drm_i915_private;
> @@ -275,8 +274,6 @@ struct intel_gt {
>   		u8 wb_index; /* Only used on HAS_L3_CCS_READ() platforms */
>   	} mocs;
>   
> -	struct intel_pxp pxp;
> -
>   	/* gt/gtN sysfs */
>   	struct kobject sysfs_gt;
>   
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c
> index 4f246416db17..534b0aa43316 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c
> @@ -32,7 +32,7 @@ int intel_huc_fw_load_and_auth_via_gsc(struct intel_huc *huc)
>   
>   	GEM_WARN_ON(intel_uc_fw_is_loaded(&huc->fw));
>   
> -	ret = intel_pxp_huc_load_and_auth(&huc_to_gt(huc)->pxp);
> +	ret = intel_pxp_huc_load_and_auth(huc_to_gt(huc)->i915->pxp);
>   	if (ret)
>   		return ret;
>   
> diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
> index 4e1bb3c23c63..d716d12c7fc9 100644
> --- a/drivers/gpu/drm/i915/i915_driver.c
> +++ b/drivers/gpu/drm/i915/i915_driver.c
> @@ -73,6 +73,8 @@
>   #include "gt/intel_gt_pm.h"
>   #include "gt/intel_rc6.h"
>   
> +#include "pxp/intel_pxp.h"
> +#include "pxp/intel_pxp_debugfs.h"
>   #include "pxp/intel_pxp_pm.h"
>   
>   #include "i915_file_private.h"
> @@ -759,6 +761,8 @@ static void i915_driver_register(struct drm_i915_private *dev_priv)
>   	for_each_gt(gt, dev_priv, i)
>   		intel_gt_driver_register(gt);
>   
> +	intel_pxp_debugfs_register(dev_priv->pxp);
> +
>   	i915_hwmon_register(dev_priv);
>   
>   	intel_display_driver_register(dev_priv);
> @@ -790,6 +794,8 @@ static void i915_driver_unregister(struct drm_i915_private *dev_priv)
>   
>   	intel_display_driver_unregister(dev_priv);
>   
> +	intel_pxp_fini(dev_priv);
> +
>   	for_each_gt(gt, dev_priv, i)
>   		intel_gt_driver_unregister(gt);
>   
> @@ -933,6 +939,8 @@ int i915_driver_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>   	if (ret)
>   		goto out_cleanup_modeset2;
>   
> +	intel_pxp_init(i915);
> +
>   	ret = intel_modeset_init(i915);
>   	if (ret)
>   		goto out_cleanup_gem;
> @@ -1168,6 +1176,8 @@ static int i915_drm_prepare(struct drm_device *dev)
>   {
>   	struct drm_i915_private *i915 = to_i915(dev);
>   
> +	intel_pxp_suspend_prepare(i915->pxp);
> +
>   	/*
>   	 * NB intel_display_suspend() may issue new requests after we've
>   	 * ostensibly marked the GPU as ready-to-sleep here. We need to
> @@ -1248,6 +1258,8 @@ static int i915_drm_suspend_late(struct drm_device *dev, bool hibernation)
>   
>   	disable_rpm_wakeref_asserts(rpm);
>   
> +	intel_pxp_suspend(dev_priv->pxp);
> +
>   	i915_gem_suspend_late(dev_priv);
>   
>   	for_each_gt(gt, dev_priv, i)
> @@ -1360,6 +1372,8 @@ static int i915_drm_resume(struct drm_device *dev)
>   
>   	i915_gem_resume(dev_priv);
>   
> +	intel_pxp_resume(dev_priv->pxp);
> +
>   	intel_modeset_init_hw(dev_priv);
>   	intel_init_clock_gating(dev_priv);
>   	intel_hpd_init(dev_priv);
> @@ -1643,6 +1657,8 @@ static int intel_runtime_suspend(struct device *kdev)
>   	 */
>   	i915_gem_runtime_suspend(dev_priv);
>   
> +	intel_pxp_runtime_suspend(dev_priv->pxp);
> +
>   	for_each_gt(gt, dev_priv, i)
>   		intel_gt_runtime_suspend(gt);
>   
> @@ -1747,6 +1763,8 @@ static int intel_runtime_resume(struct device *kdev)
>   	for_each_gt(gt, dev_priv, i)
>   		intel_gt_runtime_resume(gt);
>   
> +	intel_pxp_runtime_resume(dev_priv->pxp);
> +
>   	/*
>   	 * On VLV/CHV display interrupts are part of the display
>   	 * power well, so hpd is reinitialized from there. For
> diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
> index a8a5bd426e78..7a4e9dc15b69 100644
> --- a/drivers/gpu/drm/i915/i915_drv.h
> +++ b/drivers/gpu/drm/i915/i915_drv.h
> @@ -72,6 +72,7 @@ struct intel_encoder;
>   struct intel_limit;
>   struct intel_overlay_error_state;
>   struct vlv_s0ix_state;
> +struct intel_pxp;
>   
>   #define I915_GEM_GPU_DOMAINS \
>   	(I915_GEM_DOMAIN_RENDER | \
> @@ -364,6 +365,8 @@ struct drm_i915_private {
>   		struct file *mmap_singleton;
>   	} gem;
>   
> +	struct intel_pxp *pxp;
> +
>   	u8 pch_ssc_use;
>   
>   	/* For i915gm/i945gm vblank irq workaround */
> @@ -919,10 +922,6 @@ IS_SUBPLATFORM(const struct drm_i915_private *i915,
>   
>   #define HAS_GLOBAL_MOCS_REGISTERS(dev_priv)	(INTEL_INFO(dev_priv)->has_global_mocs)
>   
> -#define HAS_PXP(dev_priv)  ((IS_ENABLED(CONFIG_DRM_I915_PXP) && \
> -			    INTEL_INFO(dev_priv)->has_pxp) && \
> -			    VDBOX_MASK(to_gt(dev_priv)))
> -
>   #define HAS_GMCH(dev_priv) (INTEL_INFO(dev_priv)->display.has_gmch)
>   
>   #define HAS_GMD_ID(i915)	(INTEL_INFO(i915)->has_gmd_id)
> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp.c b/drivers/gpu/drm/i915/pxp/intel_pxp.c
> index 5efe61f67546..91e1cfa81373 100644
> --- a/drivers/gpu/drm/i915/pxp/intel_pxp.c
> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp.c
> @@ -3,13 +3,19 @@
>    * Copyright(c) 2020 Intel Corporation.
>    */
>   #include <linux/workqueue.h>
> +
> +#include "gem/i915_gem_context.h"
> +
> +#include "gt/intel_context.h"
> +#include "gt/intel_gt.h"
> +
> +#include "i915_drv.h"
> +
>   #include "intel_pxp.h"
>   #include "intel_pxp_irq.h"
>   #include "intel_pxp_session.h"
>   #include "intel_pxp_tee.h"
> -#include "gem/i915_gem_context.h"
> -#include "gt/intel_context.h"
> -#include "i915_drv.h"
> +#include "intel_pxp_types.h"
>   
>   /**
>    * DOC: PXP
> @@ -39,9 +45,15 @@
>    * performed via the mei_pxp component module.
>    */
>   
> -struct intel_gt *pxp_to_gt(const struct intel_pxp *pxp)
> +struct intel_gt *pxp_to_gt(struct intel_pxp *pxp)
>   {
> -	return container_of(pxp, struct intel_gt, pxp);
> +	return pxp->ctrl_gt;
> +}

not sure if this wrapper is worth it anymore now that it doesn't hide a 
container_of cast. Not a blocker.

> +
> +bool intel_pxp_is_supported(const struct intel_pxp *pxp)
> +{
> +	return (IS_ENABLED(CONFIG_DRM_I915_PXP) && pxp->ctrl_gt &&
> +		INTEL_INFO(pxp->ctrl_gt->i915)->has_pxp && VDBOX_MASK(pxp->ctrl_gt));
>   }
>   
>   bool intel_pxp_is_enabled(const struct intel_pxp *pxp)
> @@ -130,7 +142,7 @@ static void pxp_init_full(struct intel_pxp *pxp)
>   	if (ret)
>   		goto out_context;
>   
> -	drm_info(&gt->i915->drm, "Protected Xe Path (PXP) protected content support initialized\n");
> +	drm_info(&gt->i915->drm, "Protected Xe Path v7B (PXP) protected content support initialized\n");

This looks like a leftover debug addition

>   
>   	return;
>   
> @@ -138,31 +150,60 @@ static void pxp_init_full(struct intel_pxp *pxp)
>   	destroy_vcs_context(pxp);
>   }
>   
> -void intel_pxp_init(struct intel_pxp *pxp)
> +static struct intel_gt *pxp_get_ctrl_gt(struct drm_i915_private *i915)
>   {
> -	struct intel_gt *gt = pxp_to_gt(pxp);
> +	struct intel_gt *gt = NULL;
> +	int i = 0;
> +
> +	for_each_gt(gt, i915, i) {
> +		/* There can be only one GT that supports PXP */
> +		if (HAS_ENGINE(gt, GSC0))
> +			return gt;
> +	}

Note that the GSC engine will be disabled if the GSC FW is not 
available, so in that case falling back to the root GT will be an error. 
Maybe just change the below check to be:

/*
  * The GSC engine can be turned off, but on platform that
  * can have it we don't want to fall back to root GT.
  * On older platforms we rely instead on the mei PXP module.
  */
if (IS_ENABLED(CONFIG_INTEL_MEI_PXP) && !915->media_gt)


>   
>   	/* we rely on the mei PXP module */
> -	if (!IS_ENABLED(CONFIG_INTEL_MEI_PXP))
> -		return;
> +	if (IS_ENABLED(CONFIG_INTEL_MEI_PXP))
> +		return &i915->gt0;
> +
> +	return NULL;
> +}
> +
> +int intel_pxp_init(struct drm_i915_private *i915)
> +{
> +	i915->pxp = kzalloc(sizeof(*i915->pxp), GFP_KERNEL);
> +	if (!i915->pxp)
> +		return -ENOMEM;

A failure in intel_pxp_init is non-fatal, so we can exit here without 
allocating i915->pxp and still complete driver load (although it's very 
unlikely). This means that functions that can be called from outside the 
PXP subsystem need to check if the pxp structure is allocated.

> +
> +	i915->pxp->ctrl_gt = pxp_get_ctrl_gt(i915);
> +	if (!i915->pxp->ctrl_gt)
> +		return -ENODEV;

I would do a kfree here, so the only pointer that needs to be checked is 
i915->pxp (i.e., guarantee that if i915->pxp is valid then 
i915->pxp->ctrl_gt is also valid), otherwise pxp_to_gt could return NULL 
when passing in a valid PXP pointer; although I think that all the calls 
to pxp_to_gt are guarded via a pxp_is_enabled/supported check, it's not 
intuitive for that function to return NULL (all other callers of that 
type that we have do always return a valid pointer).

>   
>   	/*
>   	 * If HuC is loaded by GSC but PXP is disabled, we can skip the init of
>   	 * the full PXP session/object management and just init the tee channel.
>   	 */
> -	if (HAS_PXP(gt->i915))
> -		pxp_init_full(pxp);
> -	else if (intel_huc_is_loaded_by_gsc(&gt->uc.huc) && intel_uc_uses_huc(&gt->uc))
> -		intel_pxp_tee_component_init(pxp);
> +	if (intel_pxp_is_supported(i915->pxp))
> +		pxp_init_full(i915->pxp);
> +	else if (intel_huc_is_loaded_by_gsc(&i915->pxp->ctrl_gt->uc.huc) &&
> +		 intel_uc_uses_huc(&i915->pxp->ctrl_gt->uc))
> +		intel_pxp_tee_component_init(i915->pxp);
> +
> +	return 0;
>   }
>   
> -void intel_pxp_fini(struct intel_pxp *pxp)
> +void intel_pxp_fini(struct drm_i915_private *i915)
>   {
> -	pxp->arb_is_valid = false;
> +	if (!i915->pxp)
> +		return;
>   
> -	intel_pxp_tee_component_fini(pxp);
> +	i915->pxp->arb_is_valid = false;
>   
> -	destroy_vcs_context(pxp);
> +	intel_pxp_tee_component_fini(i915->pxp);
> +
> +	destroy_vcs_context(i915->pxp);
> +
> +	kfree(i915->pxp);
> +	i915->pxp = NULL;
>   }
>   
>   void intel_pxp_mark_termination_in_progress(struct intel_pxp *pxp)
> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp.h b/drivers/gpu/drm/i915/pxp/intel_pxp.h
> index 2da309088c6d..81f4c71c12cb 100644
> --- a/drivers/gpu/drm/i915/pxp/intel_pxp.h
> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp.h
> @@ -9,15 +9,17 @@
>   #include <linux/errno.h>
>   #include <linux/types.h>
>   
> -struct intel_pxp;
>   struct drm_i915_gem_object;
> +struct drm_i915_private;
> +struct intel_pxp;
>   
> -struct intel_gt *pxp_to_gt(const struct intel_pxp *pxp);
> +struct intel_gt *pxp_to_gt(struct intel_pxp *pxp);
> +bool intel_pxp_is_supported(const struct intel_pxp *pxp);
>   bool intel_pxp_is_enabled(const struct intel_pxp *pxp);
>   bool intel_pxp_is_active(const struct intel_pxp *pxp);
>   
> -void intel_pxp_init(struct intel_pxp *pxp);
> -void intel_pxp_fini(struct intel_pxp *pxp);
> +int intel_pxp_init(struct drm_i915_private *i915);
> +void intel_pxp_fini(struct drm_i915_private *i915);
>   
>   void intel_pxp_init_hw(struct intel_pxp *pxp);
>   void intel_pxp_fini_hw(struct intel_pxp *pxp);
> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_cmd.c b/drivers/gpu/drm/i915/pxp/intel_pxp_cmd.c
> index f41e45763d0d..0eee51c4a772 100644
> --- a/drivers/gpu/drm/i915/pxp/intel_pxp_cmd.c
> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp_cmd.c
> @@ -3,9 +3,6 @@
>    * Copyright(c) 2020, Intel Corporation. All rights reserved.
>    */
>   
> -#include "intel_pxp.h"
> -#include "intel_pxp_cmd.h"
> -#include "intel_pxp_session.h"
>   #include "gt/intel_context.h"
>   #include "gt/intel_engine_pm.h"
>   #include "gt/intel_gpu_commands.h"
> @@ -13,6 +10,11 @@
>   
>   #include "i915_trace.h"
>   
> +#include "intel_pxp.h"
> +#include "intel_pxp_cmd.h"
> +#include "intel_pxp_session.h"
> +#include "intel_pxp_types.h"
> +
>   /* stall until prior PXP and MFX/HCP/HUC objects are cmopleted */
>   #define MFX_WAIT_PXP (MFX_WAIT | \
>   		      MFX_WAIT_DW0_PXP_SYNC_CONTROL_FLAG | \
> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_debugfs.c b/drivers/gpu/drm/i915/pxp/intel_pxp_debugfs.c
> index 4359e8be4101..a1ce43c999f5 100644
> --- a/drivers/gpu/drm/i915/pxp/intel_pxp_debugfs.c
> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp_debugfs.c
> @@ -9,18 +9,20 @@
>   #include <drm/drm_print.h>
>   
>   #include "gt/intel_gt_debugfs.h"
> +
>   #include "i915_drv.h"
> +
>   #include "intel_pxp.h"
>   #include "intel_pxp_debugfs.h"
>   #include "intel_pxp_irq.h"
> +#include "intel_pxp_types.h"
>   
>   static int pxp_info_show(struct seq_file *m, void *data)
>   {
>   	struct intel_pxp *pxp = m->private;
>   	struct drm_printer p = drm_seq_file_printer(m);
> -	bool enabled = intel_pxp_is_enabled(pxp);
>   
> -	if (!enabled) {
> +	if (!intel_pxp_is_enabled(pxp)) {
>   		drm_printf(&p, "pxp disabled\n");
>   		return 0;
>   	}
> @@ -30,7 +32,19 @@ static int pxp_info_show(struct seq_file *m, void *data)
>   
>   	return 0;
>   }
> -DEFINE_INTEL_GT_DEBUGFS_ATTRIBUTE(pxp_info);
> +
> +static int pxp_info_open(struct inode *inode, struct file *file)
> +{
> +	return single_open(file, pxp_info_show, inode->i_private);
> +}
> +
> +static const struct file_operations pxp_info_fops = {
> +	.owner = THIS_MODULE,
> +	.open = pxp_info_open,
> +	.read = seq_read,
> +	.llseek = seq_lseek,
> +	.release = single_release,
> +};
>   
>   static int pxp_terminate_get(void *data, u64 *val)
>   {
> @@ -59,23 +73,23 @@ static int pxp_terminate_set(void *data, u64 val)
>   }
>   
>   DEFINE_SIMPLE_ATTRIBUTE(pxp_terminate_fops, pxp_terminate_get, pxp_terminate_set, "%llx\n");
> -void intel_pxp_debugfs_register(struct intel_pxp *pxp, struct dentry *gt_root)
> +
> +void intel_pxp_debugfs_register(struct intel_pxp *pxp)
>   {
> -	static const struct intel_gt_debugfs_file files[] = {
> -		{ "info", &pxp_info_fops, NULL },
> -		{ "terminate_state", &pxp_terminate_fops, NULL },
> -	};
> -	struct dentry *root;
> +	struct drm_minor *minor;
> +	struct dentry *pxproot;
>   
> -	if (!gt_root)
> +	if (!intel_pxp_is_supported(pxp))
>   		return;
>   
> -	if (!HAS_PXP((pxp_to_gt(pxp)->i915)))
> +	minor = pxp->ctrl_gt->i915->drm.primary;
> +	pxproot = debugfs_create_dir("pxp", minor->debugfs_root);

can minor->debugfs_root be NULL ? in gt_debugfs_register we check for that.

Daniele

> +	if (IS_ERR(pxproot))
>   		return;
>   
> -	root = debugfs_create_dir("pxp", gt_root);
> -	if (IS_ERR(root))
> -		return;
> +	debugfs_create_file("info", 0444, pxproot,
> +			    pxp, &pxp_info_fops);
>   
> -	intel_gt_debugfs_register_files(root, files, ARRAY_SIZE(files), pxp);
> +	debugfs_create_file("terminate_state", 0644, pxproot,
> +			    pxp, &pxp_terminate_fops);
>   }
> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_debugfs.h b/drivers/gpu/drm/i915/pxp/intel_pxp_debugfs.h
> index 7e0c3d2f5d7e..299382b59e66 100644
> --- a/drivers/gpu/drm/i915/pxp/intel_pxp_debugfs.h
> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp_debugfs.h
> @@ -10,10 +10,10 @@ struct intel_pxp;
>   struct dentry;
>   
>   #ifdef CONFIG_DRM_I915_PXP
> -void intel_pxp_debugfs_register(struct intel_pxp *pxp, struct dentry *root);
> +void intel_pxp_debugfs_register(struct intel_pxp *pxp);
>   #else
>   static inline void
> -intel_pxp_debugfs_register(struct intel_pxp *pxp, struct dentry *root)
> +intel_pxp_debugfs_register(struct intel_pxp *pxp)
>   {
>   }
>   #endif
> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_irq.c b/drivers/gpu/drm/i915/pxp/intel_pxp_irq.c
> index c28be430718a..fd30befbf784 100644
> --- a/drivers/gpu/drm/i915/pxp/intel_pxp_irq.c
> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp_irq.c
> @@ -3,14 +3,18 @@
>    * Copyright(c) 2020 Intel Corporation.
>    */
>   #include <linux/workqueue.h>
> -#include "intel_pxp.h"
> -#include "intel_pxp_irq.h"
> -#include "intel_pxp_session.h"
> +
>   #include "gt/intel_gt_irq.h"
>   #include "gt/intel_gt_regs.h"
>   #include "gt/intel_gt_types.h"
> +
>   #include "i915_irq.h"
>   #include "i915_reg.h"
> +
> +#include "intel_pxp.h"
> +#include "intel_pxp_irq.h"
> +#include "intel_pxp_session.h"
> +#include "intel_pxp_types.h"
>   #include "intel_runtime_pm.h"
>   
>   /**
> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_pm.c b/drivers/gpu/drm/i915/pxp/intel_pxp_pm.c
> index 6a7d4e2ee138..37371f44a550 100644
> --- a/drivers/gpu/drm/i915/pxp/intel_pxp_pm.c
> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp_pm.c
> @@ -3,11 +3,13 @@
>    * Copyright(c) 2020 Intel Corporation.
>    */
>   
> +#include "i915_drv.h"
> +
>   #include "intel_pxp.h"
>   #include "intel_pxp_irq.h"
>   #include "intel_pxp_pm.h"
>   #include "intel_pxp_session.h"
> -#include "i915_drv.h"
> +#include "intel_pxp_types.h"
>   
>   void intel_pxp_suspend_prepare(struct intel_pxp *pxp)
>   {
> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c b/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c
> index b0c9170b1395..30a45c1821bd 100644
> --- a/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c
> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c
> @@ -11,18 +11,13 @@
>   #include "gem/i915_gem_lmem.h"
>   
>   #include "i915_drv.h"
> +
>   #include "intel_pxp.h"
> -#include "intel_pxp_session.h"
> -#include "intel_pxp_tee.h"
>   #include "intel_pxp_cmd_interface_42.h"
>   #include "intel_pxp_huc.h"
> -
> -static inline struct intel_pxp *i915_dev_to_pxp(struct device *i915_kdev)
> -{
> -	struct drm_i915_private *i915 = kdev_to_i915(i915_kdev);
> -
> -	return &to_gt(i915)->pxp;
> -}
> +#include "intel_pxp_session.h"
> +#include "intel_pxp_tee.h"
> +#include "intel_pxp_types.h"
>   
>   static int intel_pxp_tee_io_message(struct intel_pxp *pxp,
>   				    void *msg_in, u32 msg_in_size,
> @@ -127,7 +122,7 @@ static int i915_pxp_tee_component_bind(struct device *i915_kdev,
>   				       struct device *tee_kdev, void *data)
>   {
>   	struct drm_i915_private *i915 = kdev_to_i915(i915_kdev);
> -	struct intel_pxp *pxp = i915_dev_to_pxp(i915_kdev);
> +	struct intel_pxp *pxp = i915->pxp;
>   	struct intel_uc *uc = &pxp_to_gt(pxp)->uc;
>   	intel_wakeref_t wakeref;
>   	int ret = 0;
> @@ -164,7 +159,7 @@ static void i915_pxp_tee_component_unbind(struct device *i915_kdev,
>   					  struct device *tee_kdev, void *data)
>   {
>   	struct drm_i915_private *i915 = kdev_to_i915(i915_kdev);
> -	struct intel_pxp *pxp = i915_dev_to_pxp(i915_kdev);
> +	struct intel_pxp *pxp = i915->pxp;
>   	intel_wakeref_t wakeref;
>   
>   	if (intel_pxp_is_enabled(pxp))
> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_types.h b/drivers/gpu/drm/i915/pxp/intel_pxp_types.h
> index f74b1e11a505..7dc5f08d1583 100644
> --- a/drivers/gpu/drm/i915/pxp/intel_pxp_types.h
> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp_types.h
> @@ -12,12 +12,20 @@
>   #include <linux/workqueue.h>
>   
>   struct intel_context;
> +struct intel_gt;
>   struct i915_pxp_component;
> +struct drm_i915_private;
>   
>   /**
>    * struct intel_pxp - pxp state
>    */
>   struct intel_pxp {
> +	/**
> +	 * @ctrl_gt: poiner to the tile that owns the controls for PXP subsystem assets that
> +	 * the VDBOX, the KCR engine (and GSC CS depending on the platform)
> +	 */
> +	struct intel_gt *ctrl_gt;
> +
>   	/**
>   	 * @pxp_component: i915_pxp_component struct of the bound mei_pxp
>   	 * module. Only set and cleared inside component bind/unbind functions,
>
> base-commit: b36215855627efb694b50c6cc0ba47b0e78d5aa5

