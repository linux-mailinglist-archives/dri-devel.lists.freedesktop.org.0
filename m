Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 02A8648C910
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jan 2022 18:06:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1C6210E75B;
	Wed, 12 Jan 2022 17:06:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6161110E75B;
 Wed, 12 Jan 2022 17:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642007181; x=1673543181;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=WlnQeN2ML2cXZ4qmD10h1e2KWbNu9705de2RQ4vbXSQ=;
 b=hiqvCwoNHDmK0PmPPh+2NWnXNCLLxnOi3yL8Q+LpEJ2A21dlAMv1Ovby
 vtTNvVop1WRpFez9xC4eSBqi9pa8Wy/BtOWGuhn4ID5oXZoPjwIoeFSkK
 Juz5TuvILEFD40eQZ4wmA/2rgrBmOM2QxkEouWRrakYOI8OgBHrCpzzv6
 yow0cMOPqGYJGKaeWvIruwlAxASkXyS6YgLsATVGcNxl1Y/KoG4Phc+4L
 Se1ZI1s6W/JR5rFTuB0iY8z0rCkNtwV47PMv99Rax+n9UqHMbjh9PKDo8
 nlamsOe+LU+A10oHR0lzfdnK4m+83Kgeli9xGFbnAVZnJ9pSlOzvQzR3r g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10225"; a="330130087"
X-IronPort-AV: E=Sophos;i="5.88,282,1635231600"; d="scan'208";a="330130087"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2022 09:03:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,282,1635231600"; d="scan'208";a="490795276"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga002.jf.intel.com with ESMTP; 12 Jan 2022 09:03:49 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Wed, 12 Jan 2022 09:03:49 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Wed, 12 Jan 2022 09:03:49 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.106)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Wed, 12 Jan 2022 09:03:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BxKeu5xWmPYAI5NvmksqUBACUr74pW7iYLmnnru5OmXGBwvlrplFLTM0iblGdjAJZq12mNBSUw7JIdUOmT8eZ4zCockm/YOn5XZKWus2ouC+LcBvwjiK1ixjNVij8TYf5bENE+Rfdt7PhhRlDTX0lKoCB/tMFgrve46ymoRs6ZnbOeBllHRekb0b8EZHBfPX+9M1Oqzgar0nds5mb4iioL/sPmI2EYC33zEjGNnmCmQQrc36GBoiv/JopATT5HGF4GUZcjG5c5q9rC1mE/1d168LxxgSPtt1z08pX32QKmPnMzSt/ODDkrLLliufGfgTlk30/2JEXSLtBjIVbFH1BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H/QOZzsbI31lfy94gR0TI0TjMxxVuz7bPvclSmd/0t0=;
 b=cHCjWNpOemrJkZGg8ufdz8jleRzHZ7e6lkMgZUiflMoxu+HRcVTJ38Yc4r4r9e76o93fPO9TNfcavUUjsQ0hxaLg4aQKoj6LBQXScQBaKUkwlOIDCshe1GdVwQhLT6zh/HFSarCoZl6k64iTlGl/acxTGtPysIh8UCqZhkcbB7tFTwUeLTuW2gRVkKfZd+uGnEUhZvOU9JQnSrACTLmVFph+LX6CqS/e9dek0wLlDHYEjrj8Vwdp/hNoaknZOxM0HVwsJFr9zBsDCm4Rh92iR3Q9W4CFTJ3/Q02YcYla9OtrjsltbArDOHT1gp48ohWi3TdfcH/jwxK1RN7IzMRpTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY4PR11MB1367.namprd11.prod.outlook.com (2603:10b6:903:2d::16)
 by CY4PR11MB1912.namprd11.prod.outlook.com (2603:10b6:903:127::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.9; Wed, 12 Jan
 2022 17:03:36 +0000
Received: from CY4PR11MB1367.namprd11.prod.outlook.com
 ([fe80::c90d:4984:8cac:1d0b]) by CY4PR11MB1367.namprd11.prod.outlook.com
 ([fe80::c90d:4984:8cac:1d0b%10]) with mapi id 15.20.4867.012; Wed, 12 Jan
 2022 17:03:36 +0000
Date: Wed, 12 Jan 2022 18:09:06 +0100
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Flip guc_id allocation partition
Message-ID: <20220112170906.ln6es7v7f7gyaj5g@intel.com>
References: <20220111163019.13694-1-matthew.brost@intel.com>
 <4f9a8e6a-5a12-2d6b-bdb9-f40269045874@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4f9a8e6a-5a12-2d6b-bdb9-f40269045874@linux.intel.com>
X-ClientProxiedBy: LO2P265CA0089.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8::29) To CY4PR11MB1367.namprd11.prod.outlook.com
 (2603:10b6:903:2d::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 979737a3-125a-43bf-1fa0-08d9d5ed7886
X-MS-TrafficTypeDiagnostic: CY4PR11MB1912:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <CY4PR11MB1912937C54F0FCB9006CAACF97529@CY4PR11MB1912.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:196;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5ujypekb//7Mv1my46yhXSEe827PBlkG679g5xmEKZamNUGFcx1tpsTNawO3DuNf3L4xy8R8CDZumpLvVEvDNepFAPxcWT2s1gPHDWXE5mh+9Od6Gw1ZS3OAAkH2NqMlBrr5OjZtkbFrFHZvw3ShVGbE+8L1NVQRTddRGGpsrVMITu8VG0ks+zksPrkyVIv01hTxESEDO27FbCuuMkdfALaWfumtE7ZZToc/ME3oGiwKka98PqU6Vmjjo43rduIjaSkVQ+K1+PNphiyN7MQLBGW/pZWblTK87o/qho9Mrw70L71W73ek0PEUFxg+0zTn2PqHRn4Q8aUi8yfuXRbtiZtuJcOnfho7E29d8rdsmAHtW7CERq3T89sVQYBQDmx3sswllfPxjXaxAkZ/2RH46KlILKopUvoAjz01LrZFzrJzIPJZr/WT1mj+o/WnI2T9ZqorjvSLrsu2p26wAdfJM//drnbZN3loOY2CCRQk1Oc1QZBXSfqdw+YGyphnV50lLwZ7qDyRBRbrKTxRskWDLb/90teICelnuPNSKljHD10Va1PAZNoWU/QH/hKpGfi7mItIW1cJbhSDAAwcm3qpxjfOtbyPMK7e3aRVKWRX6fkw2isyyoZ08QRrTmOKiactkT5fKZqNnEhHaEB8YtF4Mw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR11MB1367.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(316002)(66574015)(37006003)(36756003)(4326008)(38100700002)(53546011)(86362001)(6636002)(6862004)(8936002)(66946007)(5660300002)(508600001)(66556008)(8676002)(66476007)(6506007)(6486002)(2906002)(6666004)(2616005)(1076003)(26005)(83380400001)(82960400001)(6512007)(186003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b0lCUVpKREhTaldkeVFBWGtaSWlLV1RhL0tVSzZ0UlNmV3ZCM2JjQ1ZybWZY?=
 =?utf-8?B?VHF5dVNZeUxEMXJ4bnYxaEgxRmRXdVVJUlgvR05kQVNmaXRFcWJMSUpnelZL?=
 =?utf-8?B?UjY5cldZWTgyS2ZzemRJNE5WTlNGaFd4R3RkMTY1NENFL240M0E5OWR5emQ2?=
 =?utf-8?B?bHU3d2FkRlJnYm1seEZsZVhianBpUEhkelRFNzIwcU1Ld2RKYkNHUUxKMDZH?=
 =?utf-8?B?b2k2dzdVOGloRU9jZmNpcFYxMzRFeERrbW5CQU5iSkRoTjVrbk1ibHE5d25P?=
 =?utf-8?B?NVRxbXZOelFBV2JQZWwwZGZKTjVNMXdoRTRWRUt4aXZoSzlXRWVjTlZKc3Bh?=
 =?utf-8?B?VHhRZkgweHE5Z3YxRnNJcmZhQ2F0YWs0aUFpSDNFRjdqbmQ3aUdrbVpTT01E?=
 =?utf-8?B?MEdleE5lWk9ad2pnTjUySHJZNGZ3dlRXc0d3aU1mbDF5TVM5UTc4cThiclIr?=
 =?utf-8?B?akUrMHpSYzJPSlMxVWswc0ZVeWVreXZFUGVmN3pobXlueWMxb1hSd2xqemM0?=
 =?utf-8?B?SGlmTHJ4cWNuQUpKNDVYVEo3aS9BZzVtQ0tTTXpEWEExdkViYjVyKzZQSXNL?=
 =?utf-8?B?MW9KaUdEZVFLMlZaNXF4dXNydWo0RlVsQ1NjblZaRi9yN1RPNFhoUUdmSG0r?=
 =?utf-8?B?L2RhZVQ4c1ZQOEdLRE0rOHEyMlhhZHo1UytYVHdKNU11WEh2THNXTlUyMUVJ?=
 =?utf-8?B?bU00ZFZ0b3JDVlFPSXNRa2FJNDA1bjNoOENORFk0ZjZjaXU1aWFTSUdidzZB?=
 =?utf-8?B?WUZXeHBERDNLcVJRM0pkTU13RldoQmQwVnlqeS9tQzFoLzZWeVAzWmlmV21I?=
 =?utf-8?B?b280ZmdLRFZRNTUxN2ZXNHM4dnVOdXFHOCtDOWhwWmlFNGp2cGhBRTZwd005?=
 =?utf-8?B?VUxyRUJhL0xDU3luc25ZU1RRVTZMeFd1bWh4enV5MUVkaDVHT0RGcis1Zjc3?=
 =?utf-8?B?K2JneXdnMXduV0JPTWRtR1RsaG92VGhCQ04vUm90c0hYeWVIU2s4VHNQMkVi?=
 =?utf-8?B?VEIxWlpXbWlRMWlWQjZrcS9jQ0N5ODJYY0hPWVJjWUxKMWZFNmkyVUJzRzVp?=
 =?utf-8?B?M1dZdGt4amhURFVZT3lmRENvUUVKK3V0Sy96NHZRbmQ1SzBPbjdWUVgyWnpn?=
 =?utf-8?B?bU1YbmJKbHA4Vncxd2RtMW12N0ZkOWF2M1YwSWlNQjFjMVgwSnpzbTdBTVRH?=
 =?utf-8?B?UGh0aWZOd0o2NERuRzFuRFplM0pySHh2Ky9VWjRmNXdZdjdjLzFXdGVvRits?=
 =?utf-8?B?UmxQMm1IL2krSm1COTNyTFFWNEtZTWN0dmF6K3c4MHdXTkszSjRwMWFncHl4?=
 =?utf-8?B?VFltOE5MQnptRmwrOTBGUm9EZHY0Z1pNbWZGTDB6KzlnRUg5ZmU5cGV5eXN3?=
 =?utf-8?B?TXBnelRDb2hWWElmd25Hbk12ZHc1bTIvMU10dzlPMDlpTnNPUzRubGVhcXBO?=
 =?utf-8?B?WVBTU0ZQN2NxdG5oVmE3YmJMVjlUcUV1dENzcjVBVUV2U0xHVHNsaGJ3dXRL?=
 =?utf-8?B?N0E3c1lmZ0hLd2xUcHFFSmEzK080NkUyZE1pbHRlMW1HUlhjemYvZmxuWnZq?=
 =?utf-8?B?Nk5BK3BXcE9YQXpjSmdYSXlvdzBkNmg5TXVWbHF1WlpUbmtvZFA2ZktrRzAz?=
 =?utf-8?B?T01zcWw4UHh2Rm1QMGpYNW5TR3p0MWZMMDlQMGcyQ1BqTnBjVEZYUVBLVVBp?=
 =?utf-8?B?eHlKM3dlYmNveTRmVFp1Q3oxRmt6UE81NW56SDRUT0xZcUdETDBRN0NZNHpH?=
 =?utf-8?B?TXYyODA3dG9Edlo2YVk0M0V4bmZiM2hRci9Ra1d0TmZKemRSOXJyMnpIeGxk?=
 =?utf-8?B?WThSQWxIQ0FoSi9ncjBVTmtCSkJ5ZnJ0dFgzRzNndHZTN054eVNxSUkvYXZ0?=
 =?utf-8?B?ck14anBIZ3ZTeHBkQlFjdFlNdTg5VldXVDljRzgxRnhQck9sUklwN0EyVEJs?=
 =?utf-8?B?ODExbDloNFY2Q1crQXUwaSt3MVdlSlRxZW5ITXBtRFhFQmJDbk1XUExRalZ4?=
 =?utf-8?B?VE9QNHpnb3BtdXF3citjTDFhTy9VZ0lpZWJLMWp1b3VFc3MremlhaXZiNVFE?=
 =?utf-8?B?akdFc1E2TEU4SEd4VmNQRGI5QnFoaWF3U25xanNpQTd3a0lqcTVxbG1RZ2lj?=
 =?utf-8?B?ZTNzcTcvVndKdkdKVUxlelkrSEs0S0RTdDIvVVhTWkRuYWVUMFBHNi94b2F1?=
 =?utf-8?B?Q3BabHVLMzluYklaNThpWWNoZ0Ztbk5YbHVSR05GSEcwV0hQQzJ2QmUwaFYz?=
 =?utf-8?B?SEpNTDFKMVhTZTlMV1E0MkpFaDBnPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 979737a3-125a-43bf-1fa0-08d9d5ed7886
X-MS-Exchange-CrossTenant-AuthSource: CY4PR11MB1367.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2022 17:03:36.0344 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4kLR5CpIehL5lA9aWJr07rKZS9U6fp1jKPZYniFTJ3fM7YL/n+iJ/sePx4Psw1t4Tohe3it8XDo0S2Eonew30yFgoKMOZ2SQfumg+Eh8cYI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB1912
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com> wrote on śro [2022-sty-12 08:54:19 +0000]:
> 
> On 11/01/2022 16:30, Matthew Brost wrote:
> > Move the multi-lrc guc_id from the lower allocation partition (0 to
> > number of multi-lrc guc_ids) to upper allocation partition (number of
> > single-lrc to max guc_ids).
> 
> Just a reminder that best practice for commit messages is to include the
> "why" as well.
> 
> Regards,
> 
> Tvrtko
> 

 In my opinion this patch is good step forward.
 Lazy allocation of the bitmap for MLRC and moving the MLRC pool to the 
 end will allow easier development contexts for SR-IOV.
 Introduction of two new helpers (new_mlrc_guc_id and new_slrc_guc_id) cleans up the code.

 I agree with Tvrtko's comment that you should expand your commit
 message.

One thing I personally don't like is this NUMBER_SINGLE_LRC_GUC_ID definition (same for MLRC)
In my opinion it should be inline function and this value 1/16 defined as constant

- Piotr
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >   .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 57 ++++++++++++++-----
> >   1 file changed, 42 insertions(+), 15 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > index 9989d121127df..1bacc9621cea8 100644
> > --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > @@ -147,6 +147,8 @@ guc_create_parallel(struct intel_engine_cs **engines,
> >    */
> >   #define NUMBER_MULTI_LRC_GUC_ID(guc)	\
> >   	((guc)->submission_state.num_guc_ids / 16)
> > +#define NUMBER_SINGLE_LRC_GUC_ID(guc)	\
> > +	((guc)->submission_state.num_guc_ids - NUMBER_MULTI_LRC_GUC_ID(guc))
> >   /*
> >    * Below is a set of functions which control the GuC scheduling state which
> > @@ -1776,11 +1778,6 @@ int intel_guc_submission_init(struct intel_guc *guc)
> >   	INIT_WORK(&guc->submission_state.destroyed_worker,
> >   		  destroyed_worker_func);
> > -	guc->submission_state.guc_ids_bitmap =
> > -		bitmap_zalloc(NUMBER_MULTI_LRC_GUC_ID(guc), GFP_KERNEL);
> > -	if (!guc->submission_state.guc_ids_bitmap)
> > -		return -ENOMEM;
> > -
> >   	spin_lock_init(&guc->timestamp.lock);
> >   	INIT_DELAYED_WORK(&guc->timestamp.work, guc_timestamp_ping);
> >   	guc->timestamp.ping_delay = (POLL_TIME_CLKS / gt->clock_frequency + 1) * HZ;
> > @@ -1796,7 +1793,8 @@ void intel_guc_submission_fini(struct intel_guc *guc)
> >   	guc_flush_destroyed_contexts(guc);
> >   	guc_lrc_desc_pool_destroy(guc);
> >   	i915_sched_engine_put(guc->sched_engine);
> > -	bitmap_free(guc->submission_state.guc_ids_bitmap);
> > +	if (guc->submission_state.guc_ids_bitmap)
> > +		bitmap_free(guc->submission_state.guc_ids_bitmap);
> >   }
> >   static inline void queue_request(struct i915_sched_engine *sched_engine,
> > @@ -1863,6 +1861,33 @@ static void guc_submit_request(struct i915_request *rq)
> >   	spin_unlock_irqrestore(&sched_engine->lock, flags);
> >   }
> > +static int new_mlrc_guc_id(struct intel_guc *guc, struct intel_context *ce)
> > +{
> > +	int ret;
> > +
> > +	GEM_BUG_ON(!intel_context_is_parent(ce));
> > +	GEM_BUG_ON(!guc->submission_state.guc_ids_bitmap);
> > +
> > +	ret =  bitmap_find_free_region(guc->submission_state.guc_ids_bitmap,
> > +				       NUMBER_MULTI_LRC_GUC_ID(guc),
> > +				       order_base_2(ce->parallel.number_children
> > +						    + 1));
> > +	if (likely(!(ret < 0)))
> > +		ret += NUMBER_SINGLE_LRC_GUC_ID(guc);
> > +
> > +	return ret;
> > +}
> > +
> > +static int new_slrc_guc_id(struct intel_guc *guc, struct intel_context *ce)
> > +{
> > +	GEM_BUG_ON(intel_context_is_parent(ce));
> > +
> > +	return ida_simple_get(&guc->submission_state.guc_ids,
> > +			      0, NUMBER_SINGLE_LRC_GUC_ID(guc),
> > +			      GFP_KERNEL | __GFP_RETRY_MAYFAIL |
> > +			      __GFP_NOWARN);
> > +}
> > +
> >   static int new_guc_id(struct intel_guc *guc, struct intel_context *ce)
> >   {
> >   	int ret;
> > @@ -1870,16 +1895,10 @@ static int new_guc_id(struct intel_guc *guc, struct intel_context *ce)
> >   	GEM_BUG_ON(intel_context_is_child(ce));
> >   	if (intel_context_is_parent(ce))
> > -		ret = bitmap_find_free_region(guc->submission_state.guc_ids_bitmap,
> > -					      NUMBER_MULTI_LRC_GUC_ID(guc),
> > -					      order_base_2(ce->parallel.number_children
> > -							   + 1));
> > +		ret = new_mlrc_guc_id(guc, ce);
> >   	else
> > -		ret = ida_simple_get(&guc->submission_state.guc_ids,
> > -				     NUMBER_MULTI_LRC_GUC_ID(guc),
> > -				     guc->submission_state.num_guc_ids,
> > -				     GFP_KERNEL | __GFP_RETRY_MAYFAIL |
> > -				     __GFP_NOWARN);
> > +		ret = new_slrc_guc_id(guc, ce);
> > +
> >   	if (unlikely(ret < 0))
> >   		return ret;
> > @@ -1989,6 +2008,14 @@ static int pin_guc_id(struct intel_guc *guc, struct intel_context *ce)
> >   	GEM_BUG_ON(atomic_read(&ce->guc_id.ref));
> > +	if (unlikely(intel_context_is_parent(ce) &&
> > +		     !guc->submission_state.guc_ids_bitmap)) {
> > +		guc->submission_state.guc_ids_bitmap =
> > +			bitmap_zalloc(NUMBER_MULTI_LRC_GUC_ID(guc), GFP_KERNEL);
> > +		if (!guc->submission_state.guc_ids_bitmap)
> > +			return -ENOMEM;
> > +	}
> > +
> >   try_again:
> >   	spin_lock_irqsave(&guc->submission_state.lock, flags);
> > 

-- 
