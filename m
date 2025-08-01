Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C15BB18826
	for <lists+dri-devel@lfdr.de>; Fri,  1 Aug 2025 22:32:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DAE610E8EB;
	Fri,  1 Aug 2025 20:32:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VddjH5li";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0B8710E8EB;
 Fri,  1 Aug 2025 20:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754080372; x=1785616372;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=r1QrTHGuCDa0J0ayTmARrT6KZ2C9jflcZnV5ZFP/uWo=;
 b=VddjH5li85pzcLoTgesBpmkMFzryAQ1CvmtbVkq1m6rs1y4QqPI+7kez
 SQMEon1axbPkuB3LtFCD8YuJxzCcjXmeTjBcPK/cfH5TF1tb7cxxkIpfQ
 HG92tvfmFMXLASpFouKqLlEcFXBeNsKmybJGn6OurgfhdlO7frDYNZ1dk
 qetb4qMNaKjKP1lKznDe70xYAVIVZKk8hsfY/1jqqQx56HNFJhApmml5f
 oSTsCR8qJuYpnjQExll0uiEAWUcr0xyRHP5mEM8ypO57f87PGkBFrtCIb
 0Gfiq1ubtX7OnM9/sTYaboxOiwJ//sPeSEdyQCRAHMsOmRJWr18p3Qt/w w==;
X-CSE-ConnectionGUID: MyHjEvbFQpGjlqybmyG43w==
X-CSE-MsgGUID: ltBQAMj1Qbm3pL+mD6Sbug==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="67129776"
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; d="scan'208";a="67129776"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2025 13:32:51 -0700
X-CSE-ConnectionGUID: kmGj6tsZQlyda520xBimYw==
X-CSE-MsgGUID: n/zX63VoStanDH1OJuE6Xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; d="scan'208";a="163997316"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2025 13:32:51 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 1 Aug 2025 13:32:50 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Fri, 1 Aug 2025 13:32:50 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.69)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 1 Aug 2025 13:32:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dhG4qfTk1/YXRLYlovICNv2lDtM8mdxww7kamxbsRkPE2l3k4BO2GM+7SVG3c94EG7iIft9bS2T43QpFB0pqUsJXJVdb7d3nY3i/MDiQpdueaL/FIYfGw8HdCdBCkM/ibm6PDjYYiGeEareTd77AJPGwAKDyNBaJQTkLqjE1xpnxcphf7I71Hci/R9Xo4/03su+dfrUnCuz1Tog35eXEDCZDP+cP0YAWILPuXC9Wv9bNoSr8mAZoZKcqdppmg8BMkN8BDjaBEUfn6Hp2reTL+NO6M3i6V7eQ37M6ImuxvkO9azDhtbGsRCy87Yf43WgBCxAqsuX58d96tbhnpDepmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xjh514C+3yNK+8JoUUB94d/sAX/qrvi2/edYL3pwOog=;
 b=xgNStCjFsJgsk4pOw/01K8oy6xWGTK8GLOJW3HVOjUbIzoBnglFGP2mKUOf4kbSOv27X2/5v7XoS3rxoUXJDUaVr9jXO+zl1QFJHy/7TSXeWcYSuoHrC1GifqQAzaMt1aVt0VRpqHS6MtHj+e7qnKVGvwjJWYmtrvYxvcpB+N4jUQyXWvk4SIU5AGsB+otE0hCnvRx01V0ea5WEWZ1G/GhLEr/errGPU1J1fayQeELpni5LSswyO93I9UwDVe50M/QYZvdKRvDWHh81vPLfwUXyTeTjm8tnbcMMEdKvi7bURvNdNssc8q5BI7pzmMHeFg3vM69t9L1C5mqO9f+QDVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by CH3PR11MB8435.namprd11.prod.outlook.com (2603:10b6:610:169::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.14; Fri, 1 Aug
 2025 20:32:07 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%5]) with mapi id 15.20.8989.011; Fri, 1 Aug 2025
 20:32:07 +0000
Date: Fri, 1 Aug 2025 16:32:03 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
CC: Colin Ian King <colin.i.king@gmail.com>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH][next] drm/i915/bw: Remove space before newline
Message-ID: <aI0kQ6dt-Dd2mlPU@intel.com>
References: <20250801164658.2438212-1-colin.i.king@gmail.com>
 <CH0PR11MB54449F6E173608467F11206CE526A@CH0PR11MB5444.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CH0PR11MB54449F6E173608467F11206CE526A@CH0PR11MB5444.namprd11.prod.outlook.com>
X-ClientProxiedBy: BY5PR16CA0025.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::38) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|CH3PR11MB8435:EE_
X-MS-Office365-Filtering-Correlation-Id: 55ff787a-bcab-4c45-ace7-08ddd13a7b8f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|1800799024|376014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?7jQ1nBwZv7ZIRMEpyxBakTJPC1ro/VF8fM/DEX6BZ4uIt2PDaMftQ/1ZXseb?=
 =?us-ascii?Q?LUBF4tXAJ3ZmVeaCJIy/4uViAfuGeOmImO1Izwl0HmfqebQ3ZPDgMGQ7VGkb?=
 =?us-ascii?Q?i+H07kQYDQB+Te9Xj2GuMJPeZTP32pjCpTNL+a1m0tcOdCHBMA5YKPu0kx91?=
 =?us-ascii?Q?+F910Ps6KkDFaGD9BPefl2FCcpONTOplHaQ11p2TnvPERmk7sB6pGOX09/1c?=
 =?us-ascii?Q?i3W8VFj6gLknAan02NDZCtGOeiRkQeBBIAvLbJqN45eeqpHJqCeyW5fkQzu0?=
 =?us-ascii?Q?bjvsdj67JpNtWB/R4YTZIrnIoZ3qs82EPuozINb+PgiCxoC+HQYBJ4nis8Iy?=
 =?us-ascii?Q?e7aJEJ9jSR1ylN/cxGkImYu9Xp+v7PQ9QuZLNbHpx43jlt5hqcMesBZQAgJV?=
 =?us-ascii?Q?8rHmAqdAzxAElrmsaKcYYy6kXWtQk3std0R+OGOgFZTcau44UuMDER+8QWiQ?=
 =?us-ascii?Q?0Y78JWcXcE+KBkF5jmeDv9CbIHR4QmFaY5GM5lJYygO7RwTt9ZwmWJvTTg0W?=
 =?us-ascii?Q?dOlMCVvqyNP4lGauWiTbLn/GAt4FRSrGG5LKtmwkwVQaYLdlnWQ/5m33qVSc?=
 =?us-ascii?Q?LA8d/ymk3LOHEg/WG7ZHoIwtIvikSVoC3oi1bg1j+ET3ACmgW7qELF/+ETkV?=
 =?us-ascii?Q?M/FsbVvuzMBUpGVaHF6Syjn0IAk4i4gt+wEKH2iIG+5+bG5SNcM3NRfHEB/6?=
 =?us-ascii?Q?4UfLWXonEI1nmn8YHUaOJ9eghUYAQ+i6qGNx4EIxYKWSaUaIrswIuCCS2gxw?=
 =?us-ascii?Q?5uSCB8X0/IMoD0Sl12HpCBejNJRHOGN9wG0+WMb9ENm+a4JsHRN8L3qGO0/h?=
 =?us-ascii?Q?hRR6COnh4VbiO9hX7ej3QOx7ZnP3xDmPR8IxbScGxtX8zYG036EsG6lIr2M9?=
 =?us-ascii?Q?QzJ/kAcH8aZFyBlaBiye06KGCg6ga0qzOX14STpHDoQRYDTOD8Pq5orJiP2Q?=
 =?us-ascii?Q?caqeKkvnLyPj79oQ99XNBHPYYAillLcD4mbH0o9ed0bCKaJB4zw59cOZobkS?=
 =?us-ascii?Q?3nxybgSIqrIcO/bbExmGPsBORT86P/kVrYTG1FpRXwA3ecvn5CRigl49kIoL?=
 =?us-ascii?Q?4OFORGrWIDYRf9AfCbdYOt8o9dhimR1p1A/aKDfj/jQlzttwXwnKL6VlBiqn?=
 =?us-ascii?Q?Z91/iK/pCXav4jQS3x++Wlc3Bw8R63qeqBoBBk9w50U3Vq6KiDzCiRkJ+3YT?=
 =?us-ascii?Q?lkZS0AM/pswlYL0OwBcUOMNP19S6atW9AsIngjroFKB5vV5BcQbouFmLlww9?=
 =?us-ascii?Q?LUEfTCVH5vmBnuHHcKEgnjrtxD8SqSndn9W7fMBtE7yvL53aG5jZ15BPuV5G?=
 =?us-ascii?Q?sH4RcdGZ0dJA6m8r70J+AqjiSTWXfhmRe8eyb8w26Dph3uT1D0p9x1H4OVym?=
 =?us-ascii?Q?2D9dd+tt4Ofpocab/QgG4/sIHfhbradCJ4KHu6YK4ZdmT9+MnbJWOuCr7zlf?=
 =?us-ascii?Q?4BklOwzQJc8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(1800799024)(376014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?G+lXv7FfSAWlxWYLMHNuzprVQ0tsD4LJrxfEQ5p/oY5J/AwT3FPTTaZ8ovb5?=
 =?us-ascii?Q?nJnJVw3YbexYz53XoGsYt7vICNikIlFcKMJtIXMq3tNBbmUZq0VBA8IB8oWU?=
 =?us-ascii?Q?ljWm2oCZbYJoiQH7l5eQIfsWNN9WzUSp/CGVyUBLkTZXDeZVSDFHG1WJFasy?=
 =?us-ascii?Q?Q98SaxmiMPKY7cXrteVgD5NfLCA1Y56l33361vBZL0KljEVf7UtLUkLwu9If?=
 =?us-ascii?Q?qXfww5JWtBsGMrIdKJI6deZB0F0+8tdH5kzNxaGKTLf5MLTzCnar2phHG1+L?=
 =?us-ascii?Q?XxDfqLCALNaKlC+LV5Z1K80bSP5vMeu7FjLxfI4vc1oRUrwUGLPBdz6/eEu7?=
 =?us-ascii?Q?gKsjHkDlL82MuPkNag2fc0wfnm2K8UBpwxk5Pe0ZhBmEWt1VBC2lFv9aj9UY?=
 =?us-ascii?Q?fdEy7KVF1kfKjbuhLRsouMH5RISTdDKV1+Ewh7EN6RZnHdYNxmoj4q9Wjlhb?=
 =?us-ascii?Q?G8qC9/AX6uAh/1y5Luojk24CnPezvDSjVns8xgSuUvnOVeiLp3H2Lc59CKjY?=
 =?us-ascii?Q?hU0i3GEa5KYEogf1NMK5uNDWIUZFvYVg/vM8PtA2ExS3wsGDZ006JHOvob27?=
 =?us-ascii?Q?QBM1sbH7F6euidvie+F5ABinCYeAs4e94PPxIV+PBW0mSg4UYa+UPUZPTSMm?=
 =?us-ascii?Q?BISE/7+SMDHvDSaQ/F9OoIsSiO+JheV4A47qma7JH4koFnFNCkf8rnziPm0O?=
 =?us-ascii?Q?LwFcPH6CgAI5ZNjTRmQir5CytX9jtpFhbErazZBHgyRjNbrdKnUcTIbasB/J?=
 =?us-ascii?Q?EnfyvxbV3VdHX6iUDm92EKd1Gki5Uz7z76F6GFyvE8I38KVpAVGqfKTt/icb?=
 =?us-ascii?Q?HKmM30oVHJBM0GiDccUo6sAfix1ny+qyrebwzQHBaKn7QebQJdZjWFnrJB6M?=
 =?us-ascii?Q?AVwDtbOmW4jJ89pxjV6k5bXX/xiuzZ3SsUc2puLjPwurB8DHka3rvZ2vqQFj?=
 =?us-ascii?Q?GxyCV6wK8TYb187c91JX5kT1p2iJw57sKk100q4yQEVyl0ln417IUGgPEp4L?=
 =?us-ascii?Q?PKW5k90+hmACTnJo47c2dx5ca4/d69XXf9ZIb+DtOhM3dNTlSJDKPhmkLUY7?=
 =?us-ascii?Q?TS6LisnEb9Dc6rA9ZmnQ7Uu7hifDV5+EbyShCbTECySDXdw5jHOyrZ8w4BYd?=
 =?us-ascii?Q?UXOrQ7STy/zCYYWJyGj1p3nrnauBvAh9PF6zaxa9YfAkTWBWovJlSYwgFsOW?=
 =?us-ascii?Q?sjHYnIEfEANDZUK6ZR4hinv6JowfZ/+W2242mGMT/gA/7ej9PYO4AGJMJBMX?=
 =?us-ascii?Q?LwAmhcJ4EAUcH2uG77Rn2/piOixQ54aLTx2ko3wdRSl8jmcKCRiyjfkqoM0k?=
 =?us-ascii?Q?wQTsNOcVP2rEjhxL8GvjhBRxQsBePfJmHtcuxkevtP11aiuYpOvGnI2BAjfO?=
 =?us-ascii?Q?FojomL3LZ5l6+NKAdsSMQfJLzshRwETjZV31hXInTMpFnAIW4I544U0IQpLj?=
 =?us-ascii?Q?IUP+y8+7NAYFcCFUzB0Do2kSE6Yi2lAU0Jsw/OGxwsQ4fPMHT4ayt0N9Q3ix?=
 =?us-ascii?Q?4rR9R36MQRdCqNm0vk9CK7NDPHYcSjed8iH6/T6wH5nHdf3UgaAd9gjIj0eu?=
 =?us-ascii?Q?V5KOCGMEdIHIl8gi4COQsvIFkTTPUHw3oJs+h4wgljpbgYvMYpXwOCqcmvuT?=
 =?us-ascii?Q?uw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 55ff787a-bcab-4c45-ace7-08ddd13a7b8f
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2025 20:32:06.9624 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zvdUQ0pFNTn6rjxF6Yrg2rsNSCeSf9///mRl4jLuO7YfDjf6rUqgI7DYNKjT1Fje/aLsme44mRuPXycMYj4wCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8435
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Aug 01, 2025 at 06:27:25PM +0000, Cavitt, Jonathan wrote:
> -----Original Message-----
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Colin Ian King
> Sent: Friday, August 1, 2025 9:47 AM
> To: Jani Nikula <jani.nikula@linux.intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>; Joonas Lahtinen <joonas.lahtinen@linux.intel.com>; Tvrtko Ursulin <tursulin@ursulin.net>; David Airlie <airlied@gmail.com>; Simona Vetter <simona@ffwll.ch>; intel-gfx@lists.freedesktop.org; intel-xe@lists.freedesktop.org; dri-devel@lists.freedesktop.org
> Cc: kernel-janitors@vger.kernel.org; linux-kernel@vger.kernel.org
> Subject: [PATCH][next] drm/i915/bw: Remove space before newline
> > 
> > There is an extraneous space before a newline in a drm_dbg_kms message.
> > Remove the space.
> > 
> > Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> 
> Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>

pushed to drm-intel-next

> -Jonathan Cavitt
> 
> > ---
> >  drivers/gpu/drm/i915/display/intel_bw.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/display/intel_bw.c b/drivers/gpu/drm/i915/display/intel_bw.c
> > index d29a755612de..ac6da20d9529 100644
> > --- a/drivers/gpu/drm/i915/display/intel_bw.c
> > +++ b/drivers/gpu/drm/i915/display/intel_bw.c
> > @@ -359,7 +359,7 @@ static int icl_get_qgv_points(struct intel_display *display,
> >  
> >  		for (i = 0; i < qi->num_psf_points; i++)
> >  			drm_dbg_kms(display->drm,
> > -				    "PSF GV %d: CLK=%d \n",
> > +				    "PSF GV %d: CLK=%d\n",
> >  				    i, qi->psf_points[i].clk);
> >  	}
> >  
> > -- 
> > 2.50.0
> > 
> > 
