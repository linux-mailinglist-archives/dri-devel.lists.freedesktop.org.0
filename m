Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 228BB7AF1EF
	for <lists+dri-devel@lfdr.de>; Tue, 26 Sep 2023 19:48:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A59F10E141;
	Tue, 26 Sep 2023 17:48:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07DB210E141;
 Tue, 26 Sep 2023 17:48:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695750533; x=1727286533;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=a9hpIVKVSvYw7Va8ml6zCCdDHO++3UFVSxNNY7mevvU=;
 b=YgFeIAZS1t34MKlusNgR5dhngR3EYdU+OQkRUWxDPZNLZG2wiXu4qdaT
 Uco1p7jAEzwEgnEFy356bQOCIE4Kyedr/dkDzAMngDlWyWWl4lg9jT+8N
 SlgaPzK0VqGLajoQHsuTEH+JevjDPMQS6oXrWoYisdbJPecIDw2vIKjXN
 8+HMqvGzukGYNV9POwl14HZCW6NFqRcAD8u7pzJ0DELJuladHZk3yRRNB
 pdhpNLgOpD3/O8x5V1HimG0Ey4hmFFg7WWkwA0hs6Vf6Rl6yMmIJ5n78A
 STkQxtnaUonsQfwN0PUSS4kWbyNvmYbUXxNc5GjxGR7BRvMsYIm8iT8dD g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="381527681"
X-IronPort-AV: E=Sophos;i="6.03,178,1694761200"; d="scan'208";a="381527681"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2023 10:48:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="784026082"
X-IronPort-AV: E=Sophos;i="6.03,178,1694761200"; d="scan'208";a="784026082"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Sep 2023 10:48:45 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 26 Sep 2023 10:48:44 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 26 Sep 2023 10:48:44 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 26 Sep 2023 10:48:44 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 26 Sep 2023 10:48:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eZQ6RflhclAtuKRT/Iq6EwpACDtOKE7eUok8E8JoD0XuZChWOn1c93dMAyQ21r1qANSXvJOAbkrka5gLvq22J/xizQmdF1gRR7Y4bLZGmVi06hYMEGVCEDt2/DnAAmDieIlCUJq9risE5GEgXnieO4Kzyv2ogLiVQu2udSwh3FQCG/ldnpGbXFG0snoYB9lKNW0yhU/hQWwetPO8mrSN4JrWWx8jsjsVl5RuVnZmZDG0oVgsUOqwdJfPmJi7r6Igl0caC1dII945UlQ+dVG046j0L81IASgjrMDigVpfowI+StyCzFF/jfXE4QAkNFHqqHsX0dehJZ3X7YJPSq133Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4ZqxNZhSFwAwLnZYiG9/srUjggeo3BULnLmkm5d8Y9M=;
 b=HkGJ2LWCHaxRNCLx6izj2GxWO9oWjqfiv/+shmiReGfiZ2SbWzI/y1y87Z+N+xgC4cQVpr3e0pmmsW4uT80mU9xG3nuXzT+cMHdz//2gahsQnrA13GJ68MFU+IfgEVNYtAGKc00ajilHF6zNz38eUT8skMsdBxt+p4LYAJuUSf8Ig/SbU4sWn8zupRgZ0OesinE9581U4pK/A1kL2pGQd8ZNqqZzCOZhVQj0nhgcUgDylLZk7IP4XXm9rp7acpLbV84WBP+z3evNK65fRgBvK8xqLaID4I3VTyZg+hf5FtpV1FLfTLibhGmQLpLfy1X4gKNRFTfn1GQZN+or6a0Qhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 CO1PR11MB4819.namprd11.prod.outlook.com (2603:10b6:303:91::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6813.25; Tue, 26 Sep 2023 17:48:41 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::48d9:4c34:35b:f66]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::48d9:4c34:35b:f66%4]) with mapi id 15.20.6768.029; Tue, 26 Sep 2023
 17:48:41 +0000
Date: Tue, 26 Sep 2023 10:48:37 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>
Subject: Re: [PATCH] drm/i915: Don't set PIPE_CONTROL_FLUSH_L3 for aux inval
Message-ID: <20230926174837.GU233750@mdroper-desk1.amr.corp.intel.com>
References: <20230926142401.25687-1-nirmoy.das@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230926142401.25687-1-nirmoy.das@intel.com>
X-ClientProxiedBy: SJ0PR13CA0102.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::17) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|CO1PR11MB4819:EE_
X-MS-Office365-Filtering-Correlation-Id: dd51fd18-46e8-4c3d-51a3-08dbbeb8d1f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: P0SyyIgtqM984fsulrQRlfCsfsEvnR9LGyuHCJULD+EBs+zeZ0r1ZJh7f4Mtlr8NlluyHJ7XN+Qr0oSF9AR8M7lBBUgvK9pV7/rtMUMm/gvnsBav32sWoic5eZ5eVD2E6a9WBOTnjaKnkB86PmFEqhbKKa4nfN5E8zUC9wZa+bOz5jvrYUSMAssrevOtoO6/FqHgMldl+kXqXwP6u7sqlBnbbV8qAnH3z0xJnNbszGvc+woZq+/teCGH+camCLFh7Ppu66cn7KUM7Zjt/wt5Peig9Bn/PGgo5t53JGQqWumygs11Cu6Zs+UxLVXK++IA8hhVnm6P81KbpUPRkStDM63gJgfPKNvMQxp4CvezTm1q/kD/SGtQelm+7hJtZ/Xqg4zYLXjz3/a4HmXNt//KAmakto6PlIKJn1xECoWTS40XpsYrE/8o8eL7h6S2t37TYChFCI17p6roz2e0CZspZ9mHLv3M+zj0HTd3WhBv02X+a37zfNSktFiRnY6vrI+7BgCTvDK3PoStjZehmK+PA/4ACXtqwuNeyZkq6iYCT4xOuBDp/qQk9lK8Q2JnKEgF
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(136003)(366004)(39860400002)(396003)(346002)(230922051799003)(186009)(451199024)(1800799009)(66946007)(2906002)(5660300002)(8676002)(4326008)(66556008)(8936002)(66476007)(478600001)(6666004)(6512007)(66899024)(6486002)(6506007)(316002)(26005)(6636002)(41300700001)(54906003)(1076003)(83380400001)(6862004)(86362001)(38100700002)(66574015)(82960400001)(33656002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?xv4h2hShREuzt+LPLFHBmbA+EUnPleh3pBA3RdUCjb0HnG2OdJmOgOoq5K?=
 =?iso-8859-1?Q?Fmnbx1u9u6BMN/UUCfFbWk8L2wICmygCyUZCBpdwttNREcS56YpMxGkJqU?=
 =?iso-8859-1?Q?9hqCp6Rko/r7h7t/FgKsOja8nV20HEvquS3RJgGqrXDnDldDFAEvbAC5ae?=
 =?iso-8859-1?Q?PeM0yao3h0cr8Glfuqsk44Tlqo6fH9QHQ5i8PL1cX1E5AVCPIX36PH7YN5?=
 =?iso-8859-1?Q?diF425ji5C7yRUbbYSkNmkDgobqwBSYZKL07dziesKecTEiIeujQ/A2WfO?=
 =?iso-8859-1?Q?utKwMv63ij8kKRQ3a/sw1BtItdSgLDE+kA0tc17HvtzS+vbhHlBumjCxgN?=
 =?iso-8859-1?Q?7j+jnCurBMZfCtr2yNkQm0Cpy2ye4tMWEtz41r7czu4sgGV7A19TBwKuZ9?=
 =?iso-8859-1?Q?0RxTq+bxKK5pVRXy4uYragrVmwU4Ho1EvI7TNPSgV8zoW1iaekPTKsvvBN?=
 =?iso-8859-1?Q?LqqaGjnsbKsmDhYOoiPE2KHHmnhhznOyHmvrwt0+C80phssk/ELnOmrbgz?=
 =?iso-8859-1?Q?gO6iGYXyjwh+jkkueBzz1Z5qJCDCqm+x/A4YR8BFx42UVZ6bjruT04WkwA?=
 =?iso-8859-1?Q?JEby5yXA0QH+TMIRZ4PZ6S5Rd8oFwn68jbcQRDeRHwQ4N0C8HiSg8Z8a3s?=
 =?iso-8859-1?Q?5W8jvngyOfEYRsfd4oGqG6vAermDLTEHQ6LYbu6N+c66rhXDMRon7Wh/ER?=
 =?iso-8859-1?Q?43SqSQ9Ry2KpYX7mW/4RpyPYvQV1cdeyqCAOVrr7HY0cY+kiGltQautu6/?=
 =?iso-8859-1?Q?1x0ndVTB1BNHC8R6UJTSrVwgfBoAWtjRU641R74qcpbQ0N+Zu7hmLmLvWu?=
 =?iso-8859-1?Q?3P96uGR7rv6Koa/TPlORceX72Q6JF2Oc7WXBN6IHquYAfqxGXIugCsPEsc?=
 =?iso-8859-1?Q?Ae8WnKSNCWQZW59bg/gGDrAUoLbB4bcUZSwu9o3GIKvA1DdQQi0MaiVXnb?=
 =?iso-8859-1?Q?obvd3HbJTNE671AeXZk0RjWy+iDxnZqkK3Ssv7r8gBO0kVgV4Fi34Qk4J/?=
 =?iso-8859-1?Q?oeSZg+Z14iiwLUKHgCa/vexLEUd78Y/2o0m6DPG58kSt8dyIthNGlm0A3U?=
 =?iso-8859-1?Q?jtEI/EeRZx8MaYtdkwN6MdPhMZjyRALn68oVWqd42ey0YiJsTtBMLv2OYs?=
 =?iso-8859-1?Q?EmbCNqg50eOfbGknOa+8q70J+lZxon9YRtSC9/Sy9DslaOJwrIc6UH64P8?=
 =?iso-8859-1?Q?E2V/BQsqocXNo32ADU+24gxuzJ7fKeQ+5W+q+xPezPx092CoNlPbZvpTSv?=
 =?iso-8859-1?Q?fWzAibaUaOZQMfH42OOBythPdhxrdLd+OBR7mbFZhNlj32DLZADwgIaRP4?=
 =?iso-8859-1?Q?Ns0qZ77epfJSOpXpthxSnbL64THPoizOXFc0aoiz3nP7JVxBsdbMeyFj+X?=
 =?iso-8859-1?Q?9cixtJY0sR+WO987NN18Z6Slz7E4noTDh2wqn44fut+b5pOIH42Jb5sebb?=
 =?iso-8859-1?Q?df4IzQfO+CfQB8y/NJqYKLYq9J0wFezMzqn5E6nN16RF6ei5h2BnuR3nSh?=
 =?iso-8859-1?Q?r9Q58AURE7F0XGKOgMCNi7+Fw9gWQaWvaNzQ78SAKqBqdxvRPx2QjdVT1b?=
 =?iso-8859-1?Q?s53z+GGB/93byYV/pOPezbFlg3T9HmyXeno7NmbKLxPeoKMi/cgQEe1j14?=
 =?iso-8859-1?Q?no0HKL6OMn8BMgmS4uR+auHToruvPCIBAR4uhH4LzozfiaD4bwZ54WJg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dd51fd18-46e8-4c3d-51a3-08dbbeb8d1f6
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2023 17:48:41.0552 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OLOP0/qXi66YmqsSHsW9o3KYJycsyP1nBWuufzv2Jpk9YYzJnLFso5/WFNT1P6leqTa1l1Ym9m6uon0Fk3F2yKgypFfPl1mGVsbC4N2/kI8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4819
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
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, intel-gfx@lists.freedesktop.org,
 Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>, stable@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Andi Shyti <andi.shyti@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Prathap Kumar Valsan <prathap.kumar.valsan@intel.com>,
 Mark Janes <mark.janes@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 26, 2023 at 04:24:01PM +0200, Nirmoy Das wrote:
> PIPE_CONTROL_FLUSH_L3 is not needed for aux invalidation
> so don't set that.
> 
> Fixes: 78a6ccd65fa3 ("drm/i915/gt: Ensure memory quiesced before invalidation")
> Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Cc: Andi Shyti <andi.shyti@linux.intel.com>
> Cc: <stable@vger.kernel.org> # v5.8+
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Prathap Kumar Valsan <prathap.kumar.valsan@intel.com>
> Cc: Tapani Pälli <tapani.palli@intel.com>
> Cc: Mark Janes <mark.janes@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>

Acked-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/i915/gt/gen8_engine_cs.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> index 0143445dba83..ba4c2422b340 100644
> --- a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> +++ b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> @@ -271,8 +271,17 @@ int gen12_emit_flush_rcs(struct i915_request *rq, u32 mode)
>  		if (GRAPHICS_VER_FULL(rq->i915) >= IP_VER(12, 70))
>  			bit_group_0 |= PIPE_CONTROL_CCS_FLUSH;
>  
> +		/*
> +		 * L3 fabric flush is needed for AUX CCS invalidation
> +		 * which happens as part of pipe-control so we can
> +		 * ignore PIPE_CONTROL_FLUSH_L3. Also PIPE_CONTROL_FLUSH_L3
> +		 * deals with Protected Memory which is not needed for
> +		 * AUX CCS invalidation and lead to unwanted side effects.
> +		 */
> +		if (mode & EMIT_FLUSH)
> +			bit_group_1 |= PIPE_CONTROL_FLUSH_L3;
> +
>  		bit_group_1 |= PIPE_CONTROL_TILE_CACHE_FLUSH;
> -		bit_group_1 |= PIPE_CONTROL_FLUSH_L3;
>  		bit_group_1 |= PIPE_CONTROL_RENDER_TARGET_CACHE_FLUSH;
>  		bit_group_1 |= PIPE_CONTROL_DEPTH_CACHE_FLUSH;
>  		/* Wa_1409600907:tgl,adl-p */
> -- 
> 2.41.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
