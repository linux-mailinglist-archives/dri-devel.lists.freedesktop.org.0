Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93B2B4E9868
	for <lists+dri-devel@lfdr.de>; Mon, 28 Mar 2022 15:39:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4760010EBBB;
	Mon, 28 Mar 2022 13:38:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2E3C10EBB3;
 Mon, 28 Mar 2022 13:38:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648474736; x=1680010736;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ICVJhYkUnk6r0Ia65M5ygWCwGvlcRrKw4fpaB1lQdkQ=;
 b=DQWRG2h0kIPZZNhRlgrk5NNRtOJP8TcDbHQ2HGbXQ3Jnf+ZSEyH2uPkh
 t+eWSedXZnlP4H5cd4ddSZ9A4FYXFXRaMgfGvp9+urhYzGCYBxDnOKPjB
 gJHm4CcvVNpr0xhpyw7H4UA+xCccWMGVu7hHvPAYrUgALIcPmiSLNtKMH
 vVXdBmOXe6K4TQXcfLYr+yBlWLDAn4QDdVj5oLuizll9RTmhHQbU9u4YJ
 u8NWMfTHEIOhIXONgoEhZzapZABlpMFlzPosWR+0C/gK3K9Pf5/PlxEdE
 qqQuZKE0Ny4fbA9fq7vFt/Zhxdufezzhgzr9EUcFq228ciPegyieT/z4J A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10299"; a="345434156"
X-IronPort-AV: E=Sophos;i="5.90,217,1643702400"; d="scan'208";a="345434156"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2022 06:38:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,217,1643702400"; d="scan'208";a="649062984"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by fmsmga002.fm.intel.com with ESMTP; 28 Mar 2022 06:38:41 -0700
Received: from fmsmsx604.amr.corp.intel.com (10.18.126.84) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 28 Mar 2022 06:38:41 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Mon, 28 Mar 2022 06:38:41 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.171)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.21; Mon, 28 Mar 2022 06:38:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bEpNSGl10TKmON5YCy6BEv5qJmMWsrkgvuG6XA2oW5xQo5zPNkzbS5DlXNbt9hQSz0Meg/ocByXo+w1xukRnN4Vrf/IuuczzwWodtTFrPtsslm3z9PPERkdE4DJpKT6aeQMxVYYhVcb7gl9o07arii7f8nbSIN4rn1ON5r/GIa1jNtJfFiZfxAuMQqlF32Af7gQMUVjpbcEaDGVpbwJPaFzMuFvyg8YWbfqg0vt3ooEPXxCROsWqArY08JWrPcFLxinxuJOudSteK05uvwTdipdPhnBLE6OaA3BKKDYLKF5net/+jBC+MaoSwOksBx8Cfy64kF25oAb4osd7JrUXHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NfAdl733e3nHuTn2ON0NhgE/8awnA2zrXX3jXKCnBCs=;
 b=NgYmF3f40H3bvwmMy8F7Xp1dyxMVarIzKx/bxbNyn3PqdlDYG7jdLgx6/j4XfLGbnVU3qizbbvaVge3XutI4C7yo3yzLn3PIaKPzY30CdFcgrM9f/h9hEHj0vva8Y1NqkGgy+lVJMY0EQoC/aeSCyPqsrY7bl3q1LkeVroML9qycbaruh9YfGXpe3T6KEQ0ezV6fcq+24RWQqbCMV51/TOSUz+CayKbcyA/jQgdkpRXqum6Lz9AFRY3ZlHtlRoXEGV7oblJxkcv7t8dY5xlCewIKbh1rVKF8uxhSPBm82STADO7DnEU3Ws858Cgnqhgzno0efUL3J3LAEcVblRDrzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4894.namprd11.prod.outlook.com (2603:10b6:a03:2d4::5)
 by BN0PR11MB5712.namprd11.prod.outlook.com (2603:10b6:408:160::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.17; Mon, 28 Mar
 2022 13:38:39 +0000
Received: from SJ0PR11MB4894.namprd11.prod.outlook.com
 ([fe80::99ce:ec02:b430:2564]) by SJ0PR11MB4894.namprd11.prod.outlook.com
 ([fe80::99ce:ec02:b430:2564%8]) with mapi id 15.20.5102.023; Mon, 28 Mar 2022
 13:38:38 +0000
Date: Mon, 28 Mar 2022 19:08:25 +0530
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [Intel-gfx] [PATCH v2 5/7] drm/i915/selftests: use the
 memcpy_from_wc call from the drm
Message-ID: <YkG6Ubbm0sR/6umk@bvivekan-mobl.gar.corp.intel.com>
References: <20220303180013.512219-1-balasubramani.vivekanandan@intel.com>
 <20220303180013.512219-6-balasubramani.vivekanandan@intel.com>
 <20220321230056.6wtj5om5stg6p6eu@ldmartin-desk2>
 <20220321230712.jkltx5nvrjenjcnl@ldmartin-desk2>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20220321230712.jkltx5nvrjenjcnl@ldmartin-desk2>
X-ClientProxiedBy: BM1PR0101CA0061.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:19::23) To SJ0PR11MB4894.namprd11.prod.outlook.com
 (2603:10b6:a03:2d4::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 297dfcc4-4453-465e-735d-08da10c043d8
X-MS-TrafficTypeDiagnostic: BN0PR11MB5712:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <BN0PR11MB5712E7A636B3A1A2076865B69F1D9@BN0PR11MB5712.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: v2LYMi1DpimdszMIthO1nBiCuRydyKNPEpN3nYTGP/nrlP35YPQyyL8SfbocfcA19Ct+xPUXVhy3Zld9sHl+LgxexoqT/kcnedG5Tkvh3dBkgd8wFedPzzgd63MpkFYH7LB/GSdkY4mRAB04iU1JUutQ+VpcqDkTB5q48XUxSiw4SaaTkA31chJFvC3gQDajgP5rsUBqAwIHEg7oB+VUze7SW3jiP2lHHlrgEUAjDQiA08uE3s/6FPnTdMZs38rumyaEEg2vo9BNqVqBBRJIw2Uswf6UcpdHTgbjG6IcQ8cSt2SZ9W+8wyS2CqVB6lM4z00Xj+F0U4GUn2uvS86JuWoKw43Q5t+0uKjXVttdNcAesODjimicifsE76SD6vsMpxDXWA3PHYn8+qrC6sDPRMV6zkUtI1mav9dtxjqGCctvTtg9UbdiKmCzf3kO0ie6SsKMWhLnwYqEzf7AnPnJjZdb2BxrvzhgbzUCARCkBIj08OYkazqr4e2vwAJ/Sf+mPdB5i923BNmLg0mwXrFNgDuo5Z5aY5aM5srKv52QnR1Q/E3nhOlBL4Un9+VsVDenxGDXNjgQWCHccQE4GYBlwjvwFoboZF9cxaHFHX1oJ4o58J6OxhVTT9jfI0OpmZ2BZ8Xv5mahxjAcirndIHIl1g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4894.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(82960400001)(66946007)(6862004)(2906002)(8676002)(66556008)(66476007)(4326008)(8936002)(86362001)(6636002)(316002)(54906003)(44832011)(26005)(186003)(5660300002)(6666004)(6506007)(6512007)(53546011)(38100700002)(508600001)(6486002)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T3NNcHBRdWwwMk9EQTRQRXMxNHY1eWhRNERaMnB4LzJHMGZ1Q2xaUjRHelZZ?=
 =?utf-8?B?Q3FNT29Cdm45U0dpVTRDV3JBNUdLbU5OUWk3VVgranRZUWhtMUM3ZGovelBn?=
 =?utf-8?B?cmtxL0VOeG1nRlZqTDFkNEpMc28zU1FQQU1WZHlRWXVrNXhNUm9tY1U3OXNm?=
 =?utf-8?B?WXpkZmtiTzlCVmNYN0YzYW9uSXJ4Szk3eDJtOUg1UlltZlptWWJneDFycXI2?=
 =?utf-8?B?b0lXTTljdHU5NmpkZ2ZvK05iK1NQUVZKSnNSNGRTYStOS1FKZlJBUDNuYjkz?=
 =?utf-8?B?OFR4N1Z1ZnhLZXR4bEtvcjBHQUJiSWR4UUQ2c213N0p1dHNQTHpQdGhTc1Ja?=
 =?utf-8?B?THhPbXlEUEMyaC9aSEg5c0RLNUQrV1BXdmdQajRsN1MwRHM5dk1kK2RMdFN6?=
 =?utf-8?B?Q1JGYmlOd1pvVUxMQTNPVDdZQlovNVdMdzRWS1BjaHE4SHlBZEdub3piMGhL?=
 =?utf-8?B?aldUN1drTFF5NGd3Nmdvanoxcnl6K0pQRFZnZExKNnQ4dHpNQ3pFRDI1ZWtp?=
 =?utf-8?B?WnVFTGFhUHZNbmlqY2lMdC9sZm1sNVI2S2tidUdzMW5OZXhWdlZGUlhrZndR?=
 =?utf-8?B?VzVJWDkrbjhqYk5kSGtIYzFYVXpQUUNsNFJLdzdPaHJzMW0yTzZOYzZRNld5?=
 =?utf-8?B?SXgvN2NpS0Z4WkpTc0ZGTEZGNnBlZHNTYytqUW03NitqWnZNOGhGL1BNZzhK?=
 =?utf-8?B?YVdqSE12KzhGbHdGNFBIUTAyZGdCVG0zRktFUWdnTGErR05XVXgyZ3N3RkNI?=
 =?utf-8?B?S3hFQVZIbjhLQ3BlbXpjQ0xHeEJVeXhvVXVEMTBKd1ZBbU1WNXFNeWJiN1ZN?=
 =?utf-8?B?RHJ0L0hObTR2T1NmVEZhS1FmVXF4QkpaMkNqRUEwZCtyTGs3Q2k1amZIdkVq?=
 =?utf-8?B?RFd0NytqWnJKM2xqd0Y3azVtRmRrQzdHTlJsOGN1OUxyUWxDOFhCYWN2bXdw?=
 =?utf-8?B?MllhbDZ3Yms2RnRLTmJNaVpyY3FOUkg5dHFsY25DeGdLRDBjT0dRRDRoNmlh?=
 =?utf-8?B?R2J6cW5SQ2czK0Zndmdqb1RiNktXTHUxdHVjclFtbTd2U1B1RHlHa1VwelFj?=
 =?utf-8?B?RWJhWkZzTXVMRDB1cXNyWkFXc0FjdkhQSzVMaTE1cW41WFR4VGxuM0xudzB1?=
 =?utf-8?B?VGFwNnY2V1pJZzJXaWlvb21XclFPQUE2VnpFUkhVOE45a1NDb0FMVmtjdUVo?=
 =?utf-8?B?M2RmdDlDSlR4OWpPN3VhVEpxZkczWDNpVWhZVlpWdUVMMk5tNEh2Y0REMkRh?=
 =?utf-8?B?OTI3VHp5OG14L1hFdzE1dUhxc2o5R2lVQ1ZCck0vbEthWjVQZGlhUVE1SjEv?=
 =?utf-8?B?WDlwdi9QTE9xNHBDMXFFekhOTW4zVGpJYW12RUtzVXpmclJTRDhGWUJ0TmxN?=
 =?utf-8?B?QU1wNnU4Q2FhZVZZUTc0SGlPR1BVdnI3RkdCM0xZZDI5OFpPOUloVHVJeXZG?=
 =?utf-8?B?UW5lNFJONkc2QkF2dVN1bnNIVDB3TERTYkcvRjJqc3l5MHhuc2MxR0NZT3Qw?=
 =?utf-8?B?cVlqSFNtY01wN1NUWmFwRzhEYThXZEpkYVFOTHJUNldKb1BXTEdaR0hQblRX?=
 =?utf-8?B?OCtoQ1ZqOE8ycVdWdG1SZ0k4OE5oSjNZUFZobmpoWlQ2a0JpV0xyS0U4ZzZm?=
 =?utf-8?B?QzFwVXArUWJYY2pvbllHeFQ0ak1CbUpFWFVOU1FMVytJTmNjN3JmZmZ0QXlV?=
 =?utf-8?B?U3R6dDBlYTMzQ2FOWTEvR1ZGVDA1OFE3K3h1VjhjN0FIWmFmMHJIVHhUZ2Y1?=
 =?utf-8?B?cXoxUTJjZWRsQTMrNHFydWhiMkhJS3VaRTRxdTZ0M1AzVFVrWVBLL2ZHZmJI?=
 =?utf-8?B?UHdBTHdTeXg3Y05EcFJNVXhJeGlBUTVRRFg5UE1nWCtCSGpoOVVoNkI4Vm4x?=
 =?utf-8?B?V0t4NW5QTkFEVEFyWXRTbUdqelpOTzE2VEZXT24yY2cyNzlLL1lod3BoWXpK?=
 =?utf-8?B?SzdmU1piMGZjNkNLbGQzbDg5UkF2NitsdGpmS3dVSXY0Y3hMZlRQdllYM1BX?=
 =?utf-8?B?dEFPT2NXUVl2NDAyVy9qLzNReGpoMFNnbXVpb2VSR05zM3dwZEhWTi9pUFlD?=
 =?utf-8?B?UnVGMTM0bnJERzJTbkE5bjB2QThOdWpGWWdMWmlzWkNIZ01WdWtQYXUxN2wz?=
 =?utf-8?B?WlRUaGk2TGhkbjBpNTZLSTNIaHpsODkrR2l1OU00QUVZRDZVWE9iNkNEMWJ0?=
 =?utf-8?B?VzNxNVRiNmNvQmhrTGY5MzQ2SUFZY043LzFkRkk0SDRmbVlmczFwcUxYSjB5?=
 =?utf-8?B?ZjRIREJoUFV1R00rWGxxWDRmWHlHWjFZby9Fa0ErVnNKVFJFdmZUcEljNnR2?=
 =?utf-8?B?SkZ3eGhKZERpTVpEUGZZVUh3aHZhSkZVejkxeTc0eDNUZUwwOXdkK1VkMG94?=
 =?utf-8?Q?PtDlXf2QKD9/cYuAoH5qKOh7rv7vQEoMuRMud?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 297dfcc4-4453-465e-735d-08da10c043d8
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4894.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2022 13:38:38.9369 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RC5aaWLJHBHBMsIe7PobhLIX0C4vvs6bG51gF+PgL5CHW7Z6mBqhBXHgg7/hkwdBsMfVN5B4RVNRweuJkWGUWyiOcQkHDVoASZu/9hMZ2zXuPmH2Csm1UFxVTnMfVZ2u
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR11MB5712
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
 michael.cheng@intel.com, Daniel
 Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, siva.mullati@intel.com,
 Matthew Auld <matthew.auld@intel.com>, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 21.03.2022 16:07, Lucas De Marchi wrote:
> Now Cc'ing Daniel properly
> 
> Lucas De Marchi
> 
> On Mon, Mar 21, 2022 at 04:00:56PM -0700, Lucas De Marchi wrote:
> > +Thomas Zimmermann and +Daniel Vetter
> > 
> > Could you take a look below regarding the I/O to I/O memory access?
> > 
> > On Thu, Mar 03, 2022 at 11:30:11PM +0530, Balasubramani Vivekanandan wrote:
> > > memcpy_from_wc functions in i915_memcpy.c will be removed and replaced
> > > by the implementation in drm_cache.c.
> > > Updated to use the functions provided by drm_cache.c.
> > > 
> > > v2: check if the source and destination memory address is from local
> > >   memory or system memory and initialize the iosys_map accordingly
> > >   (Lucas)
> > > 
> > > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> > > Cc: Matthew Auld <matthew.auld@intel.com>
> > > Cc: Thomas Hellstr_m <thomas.hellstrom@linux.intel.com>
> > > 
> > > Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> > > ---
> > > .../drm/i915/selftests/intel_memory_region.c  | 41 +++++++++++++------
> > > 1 file changed, 28 insertions(+), 13 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/i915/selftests/intel_memory_region.c b/drivers/gpu/drm/i915/selftests/intel_memory_region.c
> > > index ba32893e0873..d16ecb905f3b 100644
> > > --- a/drivers/gpu/drm/i915/selftests/intel_memory_region.c
> > > +++ b/drivers/gpu/drm/i915/selftests/intel_memory_region.c
> > > @@ -7,6 +7,7 @@
> > > #include <linux/sort.h>
> > > 
> > > #include <drm/drm_buddy.h>
> > > +#include <drm/drm_cache.h>
> > > 
> > > #include "../i915_selftest.h"
> > > 
> > > @@ -1133,7 +1134,7 @@ static const char *repr_type(u32 type)
> > > 
> > > static struct drm_i915_gem_object *
> > > create_region_for_mapping(struct intel_memory_region *mr, u64 size, u32 type,
> > > -			  void **out_addr)
> > > +			  struct iosys_map *out_addr)
> > > {
> > > 	struct drm_i915_gem_object *obj;
> > > 	void *addr;
> > > @@ -1153,7 +1154,11 @@ create_region_for_mapping(struct intel_memory_region *mr, u64 size, u32 type,
> > > 		return addr;
> > > 	}
> > > 
> > > -	*out_addr = addr;
> > > +	if (i915_gem_object_is_lmem(obj))
> > > +		iosys_map_set_vaddr_iomem(out_addr, (void __iomem *)addr);
> > > +	else
> > > +		iosys_map_set_vaddr(out_addr, addr);
> > > +
> > > 	return obj;
> > > }
> > > 
> > > @@ -1164,24 +1169,33 @@ static int wrap_ktime_compare(const void *A, const void *B)
> > > 	return ktime_compare(*a, *b);
> > > }
> > > 
> > > -static void igt_memcpy_long(void *dst, const void *src, size_t size)
> > > +static void igt_memcpy_long(struct iosys_map *dst, struct iosys_map *src,
> > > +			    size_t size)
> > > {
> > > -	unsigned long *tmp = dst;
> > > -	const unsigned long *s = src;
> > > +	unsigned long *tmp = dst->is_iomem ?
> > > +				(unsigned long __force *)dst->vaddr_iomem :
> > > +				dst->vaddr;
> > 
> > if we access vaddr_iomem/vaddr we basically break the promise of
> > abstracting system and I/O memory. There is no point in receiving
> > struct iosys_map as argument and then break the abstraction.
> > 
Hi Lucas,
  I didn't attempt to convert the memory access using iosys_map
interfaces to abstract system and I/O memory, in this patch. The
intention of passing iosys_map structures instead of raw pointers in the
test functions is for the benefit of igt_memcpy_from_wc() test function.
igt_memcpy_from_wc() requires iosys_map variables for passing it to
drm_memcpy_from_wc().
In the other test functions, though it receives iosys_map structures I
have retained the behavior same as earlier by converting back the
iosys_map structures to pointers.
I made a short try to use iosys_map structures to perform the memory
copy inside other test functions, but I dropped it after I realized that
their is support lacking for (a) mentioned below in your comment.
Since it requires some discussion to bring in the support for (a), I did
not proceed with it.

Regards,
Bala

> > > +	const unsigned long *s = src->is_iomem ?
> > > +				(unsigned long __force *)src->vaddr_iomem :
> > > +				src->vaddr;
> > > 
> > > 	size = size / sizeof(unsigned long);
> > > 	while (size--)
> > > 		*tmp++ = *s++;
> > 
> > 
> > so we basically want to copy from one place to the other on a word
> > boundary. And it may be
> > 
> > 	a) I/O -> I/O or
> > 	b) system -> I/O or
> > 	c) I/O -> system
> > 
> > (b) and (c) should work, but AFAICS (a) is not possible with the current
> > iosys-map API. Not even the underlying APIs have that abstracted. Both
> > memcpy_fromio() and memcpy_toio() expect one of them to be RAM (system
> > memory)
> > 
> > I remember seeing people using a temporary in buffer in system memory
> > for proxying the copy. But maybe we need an abstraction for that?
> > Also adding Thomas Zimmermann here for that question.
> > 
> > and since this is a selftest testing the performance of the memcpy from
> > one memory region to the other, it would be good to have this test
> > executed to a) make sure it still works and b) record in the commit
> > message any possible slow down we are incurring.
> > 
> > thanks
> > Lucas De Marchi
> > 
> > 
> > > }
> > > 
> > > -static inline void igt_memcpy(void *dst, const void *src, size_t size)
> > > +static inline void igt_memcpy(struct iosys_map *dst, struct iosys_map *src,
> > > +			      size_t size)
> > > {
> > > -	memcpy(dst, src, size);
> > > +	memcpy(dst->is_iomem ? (void __force *)dst->vaddr_iomem : dst->vaddr,
> > > +	       src->is_iomem ? (void __force *)src->vaddr_iomem : src->vaddr,
> > > +	       size);
> > > }
> > > 
> > > -static inline void igt_memcpy_from_wc(void *dst, const void *src, size_t size)
> > > +static inline void igt_memcpy_from_wc(struct iosys_map *dst, struct iosys_map *src,
> > > +				      size_t size)
> > > {
> > > -	i915_memcpy_from_wc(dst, src, size);
> > > +	drm_memcpy_from_wc(dst, src, size);
> > > }
> > > 
> > > static int _perf_memcpy(struct intel_memory_region *src_mr,
> > > @@ -1191,7 +1205,8 @@ static int _perf_memcpy(struct intel_memory_region *src_mr,
> > > 	struct drm_i915_private *i915 = src_mr->i915;
> > > 	const struct {
> > > 		const char *name;
> > > -		void (*copy)(void *dst, const void *src, size_t size);
> > > +		void (*copy)(struct iosys_map *dst, struct iosys_map *src,
> > > +			     size_t size);
> > > 		bool skip;
> > > 	} tests[] = {
> > > 		{
> > > @@ -1205,11 +1220,11 @@ static int _perf_memcpy(struct intel_memory_region *src_mr,
> > > 		{
> > > 			"memcpy_from_wc",
> > > 			igt_memcpy_from_wc,
> > > -			!i915_has_memcpy_from_wc(),
> > > +			!drm_memcpy_fastcopy_supported(),
> > > 		},
> > > 	};
> > > 	struct drm_i915_gem_object *src, *dst;
> > > -	void *src_addr, *dst_addr;
> > > +	struct iosys_map src_addr, dst_addr;
> > > 	int ret = 0;
> > > 	int i;
> > > 
> > > @@ -1237,7 +1252,7 @@ static int _perf_memcpy(struct intel_memory_region *src_mr,
> > > 
> > > 			t0 = ktime_get();
> > > 
> > > -			tests[i].copy(dst_addr, src_addr, size);
> > > +			tests[i].copy(&dst_addr, &src_addr, size);
> > > 
> > > 			t1 = ktime_get();
> > > 			t[pass] = ktime_sub(t1, t0);
> > > -- 
> > > 2.25.1
> > > 
