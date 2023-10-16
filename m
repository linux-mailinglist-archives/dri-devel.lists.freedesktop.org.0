Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A44B77CB6F7
	for <lists+dri-devel@lfdr.de>; Tue, 17 Oct 2023 01:24:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AE3210E241;
	Mon, 16 Oct 2023 23:24:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6805A10E241;
 Mon, 16 Oct 2023 23:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697498677; x=1729034677;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ewp/FbdDoPHusEbrvUeAqmRMvO7WuziLrgMg6ecQdnc=;
 b=Nl3IYFYyHGzUyH061u9U39BA5vVLfbXq4o8/9GLtl1T6jUR8eF88HYmv
 Jw73iVvPk2XwjYipkpU5ygUqTOtFdJWII3EoFIZ2oQwwaf32ml7+BvL+W
 +A0x79LjNJrDLt7UbUYjF1HL2XKbiTFxs5Yv3C/22qe4HTS77+FnSzbb+
 Dgr4KCnMi1+X80KFK2D+26AiTlhAA35yoAX+DhPFoBjKz29YDj2mQzg5E
 ZgM85usdhWX3C4dQSmCDE60p0MKnBKbwvASu5xL0W367PXe+aJYcZOpbv
 n9vmYo3YhjZXf+JVROypYMLBiYcylkKQldXXd0uWmFsl4QFHE2r7mOZ7n g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="376030233"
X-IronPort-AV: E=Sophos;i="6.03,230,1694761200"; d="scan'208";a="376030233"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2023 16:24:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="929535571"
X-IronPort-AV: E=Sophos;i="6.03,230,1694761200"; d="scan'208";a="929535571"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Oct 2023 16:24:36 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 16 Oct 2023 16:24:36 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 16 Oct 2023 16:24:36 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 16 Oct 2023 16:24:36 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 16 Oct 2023 16:24:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W5KIHAZrS/WV6R8HoCHdCDK1SmV6yf99o4x5a10BvSJBpUaCX6KZkNMyVjORhvE5cYKcLfoEwvd2jS4jJLzIVLt8bzlv6E7e0MRNUXWaQGxH4gU7U3pnYhYi2EELeyCsI8C9Fh0ukWwnwaLqVMUdfbZcOp/INpJwiQWOqh35D2PVGTJTyNjb9C9C0efN4pQuahxTo14HLfma+6pqIwjDtFVkS7CsXAqkE4auGKCfH+HxjnH9Iv+XtLJcF+D0Tk/8vGNbj18A7Dys998YkDrcl8a+Vufr8bXCLrK3uxOATags2QmaYEI2DkECRiHPPOmRD6bVX47qP7Ko18ZFl0/GYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cTqKoMH/spi75S+/18L9JCnXpeDPMrFEVjEL3vNhIHw=;
 b=Z8SW741qU+Cry1E7hGjnsarcpRovEV5RLLPViVDYE1UF7zCyBQ+XaaqtaZVCnYRdTlEf7SnyfJeoHFZFO97X6IlnEP+5gKNxUyxzKM31EH7W126MYACZgjakxh+ro6cRdwogSMtCTPer9BEOlkvilak35RnocUpZhoP+0+WrYqqxG8H9ZNifCFMx8/I/o4xp0PpP+rOueQCBPZjWUhSqi96nvkw3S+8e3yguNjlgq1Kue9uZ/xPFhOod5u0IRDY9uER7kytrGqM0OIHWu3tpI+TL/Nkt8TUjt0qfCtAnNDTzbgKcDU5z80qIABSwey3ibiHQTPRikjjJMAuZCfiLWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by SA3PR11MB8074.namprd11.prod.outlook.com (2603:10b6:806:302::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.36; Mon, 16 Oct
 2023 23:24:34 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::5dc4:882d:948f:55d4]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::5dc4:882d:948f:55d4%6]) with mapi id 15.20.6886.034; Mon, 16 Oct 2023
 23:24:34 +0000
Message-ID: <ee2be6d4-1bc6-4516-80cb-408ad6731787@intel.com>
Date: Mon, 16 Oct 2023 16:24:30 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [Intel-gfx] [PATCH] drm/i915/mtl: Don't set PIPE_CONTROL_FLUSH_L3
Content-Language: en-GB
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20231016225530.2152896-1-vinay.belgaumkar@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20231016225530.2152896-1-vinay.belgaumkar@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0225.namprd04.prod.outlook.com
 (2603:10b6:303:87::20) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|SA3PR11MB8074:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a892874-f7cd-4603-912e-08dbce9f0e51
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9e3iCauaAUh0PcXsjEfgf1WfPhe11zIfe5cwp+BdvOP7lrBel5VIO/krJmvCKdBhwvjZDADGGTt2SMIHOG/7PvtUhg9GUYye0qQ0Cd439WxXvuoCYq2pSRCMJcbULfyK9xLjbL/IRdJziJm8AsbZxgBNIxt2oa5v9+h51vrUW4Sowb7FvxcRVQgNGFccyCQOEyeev/DxApcTd03bRh0MZ+vsvrvMzoVNGtVE8JQapFPFbK2bnkJsLGjVy4YAwMDQGLLRV43SzBlbmfgq1YMjgD0fZkX5U0OcJBXIp98K9+mtuS4tekFCwQl/K7oy+QLBhZ+RgbpFiWCr66z8tNghjL4p/Dv36VJn60K/xfyxK/88mgWgAlcbmt+bAsiqxp5N0u0nErYsOGMp6yqSDrtBC/QMp19IkIJqYNWjLgWzgnl6Iqu9gfn4xC8NWPNNBte76Kk/kB+asL0SpfD3jndiugt6udl0oabPZhAXYWKzWB6psRjmXI46H5SbQwJdVzhFdM7SPKMPXIBwI+WlxWK/IVwZk7e/p91CUurjJg6zhSmOxl2BvQ5IEIS3jln9YqE9D8YciF5P0z/jXNgmAQfFdAG/aKftdEwNeHmSAklpNuKIkBAFYY0TqjAbtZ+Q2glG13nqfJGZgVx3BPP0EqLfig==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(39860400002)(396003)(376002)(136003)(366004)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(478600001)(6486002)(66946007)(6666004)(54906003)(66476007)(66556008)(107886003)(26005)(316002)(6506007)(53546011)(6512007)(2616005)(450100002)(4326008)(8676002)(2906002)(8936002)(5660300002)(41300700001)(36756003)(86362001)(31696002)(83380400001)(82960400001)(38100700002)(66899024)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SkRiSCsrVVdraEFabFRmdnRrLzE4RUUvK2FLOUdvVE9WU1FXZzJqclNzaGxP?=
 =?utf-8?B?dWd3dCt6TjlzZ0Y2UkY1MHFnYnNRS1hoYUpmb2h3RS9XU1JtM0gwTGhoa0NG?=
 =?utf-8?B?d2cvMmVrK1NaM2lhVVIxaEZtaG5CRjU4ZmVZMVFUeEF1Y2lBa0VtUDl1ZWt6?=
 =?utf-8?B?QzAybS9DWjg1dUZjS2VhMXh1dHZKU05jOFlKdmtNaERZRTlWaFhFNEJ0MVoz?=
 =?utf-8?B?T2V5RXV4NFcwcDFHM3M4NUxkWU8wVjVHcEdSMEsvQmNFN3Mwd3p2L1oxU0xx?=
 =?utf-8?B?TERvSzVielJldlZ5c3FLN3U5TGhsQmVGLzJPUnN4dHpuQkxoQWhHSUQ2YkRW?=
 =?utf-8?B?S05tOWtNbHk2dm95cHlDbGQyZXFzakRpNk1NeGN3SUUvQ1c2NTJmZlhWSWcr?=
 =?utf-8?B?aEFzS3pBdE9VUDYyZGNQWnh2UHBxeXRxREM3MzdwVlVJZnNPbEdOd3pqMGpn?=
 =?utf-8?B?eFhJcHVMWElpQVI2aUlQK2krMnZrdnlhWFI1MENWS0crNTdDbVdVT1BWeVFt?=
 =?utf-8?B?MkRjYTdoYUdFZVEzNTNmbjU4aWovNCsveGlIWHlrRThocE9PYXVEcDU4ZHFh?=
 =?utf-8?B?OTc3NkMvMzU2eENtVmdrU3IvVUZBNmR0NGpxM1ZjMXdVdXlOeUh4QkRqVVJ4?=
 =?utf-8?B?K0U5TzlFcFFYVjNyRGd4UVNheXd5ZFZWVHJ4QXZTd2JPTzhhKzVjVnlxaVhH?=
 =?utf-8?B?YkNQVmUyK0w0YXZFVUxaRVQrVzdOVVFrWmk4M2ZQekNTanYyRXEreTRlVmZW?=
 =?utf-8?B?ejc0dkVYcFNlYWt5enV1R2Jxamh0cG9WSlphUTRqL2xqTnNnZG52eE90ZHE1?=
 =?utf-8?B?a1RvV0o5RkU2VHNDTU9vRlg4ZVNwWG5FbjYwMFYvOXFMc0ZKa21MeDVkOStl?=
 =?utf-8?B?ZERCdkdMaUJ3RlBIN2dIa1JMTE9HM0JPbXo5VEtHNkFqMVQyQ1loaGswRUtE?=
 =?utf-8?B?NXkxVW1Sb0VlRFJMM2pGWXVIUDdpOXErQkI0d0xHbDNpV2N0QjlwY045UkZw?=
 =?utf-8?B?UW1LRitmTkdTVjl3V213cmM1MGgyUy95NUxvNm1zVXNUem5QNCsxVnBmL2dL?=
 =?utf-8?B?K1RBcUliUGlMaE5CSDJnakEvaWtwR1UxdnlGU1lYYlRSYi82WU1STU1JSnd6?=
 =?utf-8?B?QTZxdjdldXo2Z1VTWjN0TjAzL2dTeFlKNzRLR29DTURpVkxTQzNPVFphQ1Y5?=
 =?utf-8?B?UGUreHAwNFpHR1pFM1hGSGlwSzRrenZkQ1RYNi9VdDJjRHMreFlWb1dFUjFY?=
 =?utf-8?B?MTZ3YzlzVnduaUJCSVZCWkUxUjRuQ1dKMGVRM3NlOXNIV3dPOGhKSG1RdDBN?=
 =?utf-8?B?UmIwdUNyR2swY2tMSmpyZ3B1cGlkSFB5YjZSeElUbXJZbWVvWXY3Y1B2NmhK?=
 =?utf-8?B?U2FtTEtReWpndGc1dXEwYjJUakF3UHJoZ0tyUjI1a2YvQkZWVXJiYXoyRDRn?=
 =?utf-8?B?ZkQyS28xNFQwSFYvb21IU0ZLWEM1MDB0S2Fnd1RBays5N1Y4eXZqQTBzVWtI?=
 =?utf-8?B?R0QzZ0d0ZC9wTUdxVGcwQWJUSys5MEY3YUNuRWE4K0JWRnpGUHUvSkNHWVpU?=
 =?utf-8?B?dXA5T1loMktXNFhvd2JxMmZ0VDlsSHd6S2VjNmhkN01nUDhnb3VLdi9LR3RL?=
 =?utf-8?B?ZG54bVRJaUtmMWVUTHY1NkZGaXpHMlQwVHNrUk95VHRSUmhkOHdMeGlQcEw2?=
 =?utf-8?B?YVkxRkJ1Q2h0TnBDT3JKZHZFdXFPdUZmdjV6SGR4Yk9vd3JTQm12SFFEVjhl?=
 =?utf-8?B?UG9HaXc4QURpeWU1eGFkeEZpVjRzaExEcWRoaGJ0Q0hRcnBrQXZKd0NyRUd2?=
 =?utf-8?B?aTVxRFlpUStxOUJ0bmVKamdRZGg4VFhnSE5tOG5VWUNPdUFnc3o1TGRuVDU2?=
 =?utf-8?B?dnR5cVZnNkFCNW1iVWJCalBuYmdhblM5bkViem1helVKbzZhZkJMVnBJY1VY?=
 =?utf-8?B?NkpVTWZleE9wSzFlOXBjZWVQTmI4amZzYzRXaGRKTGUvZXFFMElKZzN6bnA3?=
 =?utf-8?B?MkVyMzNYbnNkVXFQLzhUbThRQy9XUGtjSVR5aGhhOGdaY2VESmZmOEV3bnI0?=
 =?utf-8?B?YXB0dlY1WGUwYXVzZk1hL2gzY1QxY2k2djNXTmRveVVzTGZHd1dGV1hNZ2hW?=
 =?utf-8?B?NTloNG93a3VDUllDWEp4eHdmMlY4UVdLR0pLQmdPNGdqOTlyNFZ4SGNyOVZ0?=
 =?utf-8?B?NFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a892874-f7cd-4603-912e-08dbce9f0e51
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2023 23:24:33.9614 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A1inoyCq9zP83/0T/9rVrAxndVi84zhyW02YTzs5BCrSqXLka5mgdJ4vkyughVp9SOAGW20JQSWf/vZuBlAneu/J51fGI6D4o+Aef+Hd69M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8074
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
Cc: Nirmoy Das <nirmoy.das@intel.com>, Mikka Kuoppala <mika.kuoppala@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/16/2023 15:55, Vinay Belgaumkar wrote:
> This bit does not cause an explicit L3 flush. We already use
At all? Or only on newer hardware? And as a genuine spec change or as a 
bug / workaround?

If the hardware has re-purposed the bit then it is probably worth at 
least adding a comment to the bit definition to say that it is only 
valid up to IP version 12.70.

> PIPE_CONTROL_DC_FLUSH_ENABLE for that purpose.
>
> Cc: Nirmoy Das <nirmoy.das@intel.com>
> Cc: Mikka Kuoppala <mika.kuoppala@intel.com>
> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/gen8_engine_cs.c | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> index ba4c2422b340..abbc02f3e66e 100644
> --- a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> +++ b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> @@ -247,6 +247,7 @@ static int mtl_dummy_pipe_control(struct i915_request *rq)
>   int gen12_emit_flush_rcs(struct i915_request *rq, u32 mode)
>   {
>   	struct intel_engine_cs *engine = rq->engine;
> +	struct intel_gt *gt = rq->engine->gt;
>   
>   	/*
>   	 * On Aux CCS platforms the invalidation of the Aux
> @@ -278,7 +279,8 @@ int gen12_emit_flush_rcs(struct i915_request *rq, u32 mode)
>   		 * deals with Protected Memory which is not needed for
>   		 * AUX CCS invalidation and lead to unwanted side effects.
>   		 */
> -		if (mode & EMIT_FLUSH)
> +		if ((mode & EMIT_FLUSH) &&
> +		    !(IS_GFX_GT_IP_RANGE(gt, IP_VER(12, 70), IP_VER(12, 71))))
Why stop at 12.71? Is the meaning only changed for 12.70 and the 
old/correct version will be restored in later hardware?

John.


>   			bit_group_1 |= PIPE_CONTROL_FLUSH_L3;
>   
>   		bit_group_1 |= PIPE_CONTROL_TILE_CACHE_FLUSH;
> @@ -812,12 +814,14 @@ u32 *gen12_emit_fini_breadcrumb_rcs(struct i915_request *rq, u32 *cs)
>   	u32 flags = (PIPE_CONTROL_CS_STALL |
>   		     PIPE_CONTROL_TLB_INVALIDATE |
>   		     PIPE_CONTROL_TILE_CACHE_FLUSH |
> -		     PIPE_CONTROL_FLUSH_L3 |
>   		     PIPE_CONTROL_RENDER_TARGET_CACHE_FLUSH |
>   		     PIPE_CONTROL_DEPTH_CACHE_FLUSH |
>   		     PIPE_CONTROL_DC_FLUSH_ENABLE |
>   		     PIPE_CONTROL_FLUSH_ENABLE);
>   
> +	if (!(IS_GFX_GT_IP_RANGE(gt, IP_VER(12, 70), IP_VER(12, 71))))
> +		flags |= PIPE_CONTROL_FLUSH_L3;
> +
>   	/* Wa_14016712196 */
>   	if (IS_GFX_GT_IP_RANGE(gt, IP_VER(12, 70), IP_VER(12, 71)) || IS_DG2(i915))
>   		/* dummy PIPE_CONTROL + depth flush */

