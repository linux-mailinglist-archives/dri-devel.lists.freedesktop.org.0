Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9613E601F95
	for <lists+dri-devel@lfdr.de>; Tue, 18 Oct 2022 02:29:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F55310E1B4;
	Tue, 18 Oct 2022 00:29:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0CB010E2C3;
 Tue, 18 Oct 2022 00:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666052950; x=1697588950;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=SnscIVc2aAulVyFZO1+At6rPVTdHMMve2CxS4WfC/4Q=;
 b=ALkW8Lv2H/ezVCejtaWsV7q2clSj2Qr5pP6ZF/LCLQrGByAEYrvR3AOs
 CmVKM2sqC1n6VziOc2/Bi2x2wYApRO389coc2DEJp/r0gnFa3Pmv3+6gS
 TyN7bahpOsYqdqcpQsqYGm56uobZfjjNvJYIgl4Ek/2bBTTdbaSUtEKvz
 eDCgw70tNm6imVPaPq+afrtZgZAO+KLqGWzGHfYpbAqTbCb7rsec6NqXC
 cV4sevjxGcw2QmTp+RIl/tASpr3uDUtLzc7P2X8QVi4Ey1HdAAu1+XEcB
 81ZwdDXrpcIkwySszV0pqyNTOv7xPoetHN3dmNEtyy4247R/XMGgEPV0e w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10503"; a="304694783"
X-IronPort-AV: E=Sophos;i="5.95,192,1661842800"; d="scan'208";a="304694783"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2022 17:29:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10503"; a="770970926"
X-IronPort-AV: E=Sophos;i="5.95,192,1661842800"; d="scan'208";a="770970926"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga001.fm.intel.com with ESMTP; 17 Oct 2022 17:29:10 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 17 Oct 2022 17:29:09 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 17 Oct 2022 17:29:09 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Mon, 17 Oct 2022 17:29:09 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Mon, 17 Oct 2022 17:29:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LrG34M1siD1Z/bdD+879nii+pefFGmUnO6CvvUflevJMEA3lAM3/EcDw+V0EPU4I7gzUrTE8nN1nubFek0d9Tg/Y9TFwTv3n31GdM/YxjEtlAC2VBy1GNiiF9z5OpZry094/ugGDyNJOe9tv4EMzy3gsHP9i4GjWI+CINPGSRwBaL8nieBnjKEMr/8UnXO8GX3rm3XTsyNM9RUeIv90jSPMhxY4hCIFg8k0fsR36NrBojCcZ3++UyxSzNVgOz38Txx4+m+ZfS2Xsv7QxDuDmlxfx9zjDJrxQzAszQoJzdrxmIKBT6tJvUYkkc1CwhhmkrFKcNJkUI3q+GaBaPLonGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SnscIVc2aAulVyFZO1+At6rPVTdHMMve2CxS4WfC/4Q=;
 b=C3Q5t80NzgpTHQ+wmS1Ks5cvbEPvKFnbDKAzN69tZqajF5lIoQ+jDlgZIyCLp8NhlIL+xf7AxJZawk1cu59/jatEANk1fX415JC9EGTanNHuoxriuRJlTrAEdY/bToa3BmIgZfnADE5tYkIJR6eP9GkgYT9dupgijaLjPwHNT6zqRT0LZGsaz/Rd0PEpnfaRw53ktVPRjPr6kEULRjEaoQpByNnfks87jmlQ3+Vxrm7SZe7Z0R1lIQOjX9394R7ImGIhcS4Sq5+qLzOq56VkyubOyjSnuJ3ratvAr3hwdz8jHGPmYT9kci/BXEG0yBMwYSvJSD1+lVGFFkdk7szUxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CO1PR11MB5058.namprd11.prod.outlook.com (2603:10b6:303:99::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.21; Tue, 18 Oct
 2022 00:29:07 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7246:dc8c:c81f:5a10]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7246:dc8c:c81f:5a10%3]) with mapi id 15.20.5723.033; Tue, 18 Oct 2022
 00:29:07 +0000
Date: Mon, 17 Oct 2022 17:29:05 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
Subject: Re: [PATCH v2 1/2] drm/i915: Add intel_ prefix to struct ip_version
Message-ID: <20221018002905.ar57vvbq2ekqjxan@ldmartin-desk2.lan>
X-Patchwork-Hint: comment
References: <20221011153851.3781507-1-radhakrishna.sripada@intel.com>
 <20221017172956.qxsw4ursv6665b3r@ldmartin-desk2.lan>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20221017172956.qxsw4ursv6665b3r@ldmartin-desk2.lan>
X-ClientProxiedBy: BYAPR05CA0025.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::38) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CO1PR11MB5058:EE_
X-MS-Office365-Filtering-Correlation-Id: edc6c5a8-c490-4699-a173-08dab09fc4db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RT8vDiKnGP9UPcjc4IfgD4pcK6/ITJhPTHZQKJdr+cG9MU5Jx+gtSrAknYhZjv3hFm4YgYQ9XlodZ1w87ildQ3a9c3eJww00Xya3hwO9BHt42MRA1vw2q5NXKfQ2vJOg/RFdDAQ0O2zCMjHizXjmaECo5r2TDssjm1pgpsuhoETLAwRwLFB8srF/BoPuQxykiexdcosUrpl7hxBBg7882Ak87PyEiJrmKjhPzamjm65rjkzsBbYks64cVejgbMp4U5bekqD/aRALn25ORj4RjBCVTh6/Wk04QJ6fCF4Og4y1EhhqcIlTaxc1w9rl/qX3sUBCHub/oxjuYMOnLXFzLSTlGEC6Md9J1+Hz/3ejclzY1U/rHUSgIIWaizMG5/8TBN2QApk9nc7fh3153xcHCsqBZ/KL5O6p9nnijIUAaqAVxWKI8X12I022iY7u5aV2d12jr1nsd1J80OuoTyLqXhQI1tAY2S2+bx9NubC7+SveXKuOzJby4w4NT6TeEPEoPZ6BnbzX5tMrmqHw3g0YLc7ewontXb/prdM6h/z6UCqFutpxT68/JMOpOxY3tlAsZMV4PcXhsxeQHpk63hlPgxot3rBRPpo4SOYlyMASSY8HiJJMM/gSiffwMlMu9Iz0MZcbTNoFnD+lGXidBvnuhUSjcdtdme0Pu5hCDCrgP74v4ohPtFX8rromGWitqGG4iE/4qf4Uge1qT2JbVuJeOw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(396003)(346002)(136003)(39860400002)(376002)(451199015)(1076003)(2906002)(66946007)(66556008)(6862004)(66476007)(8936002)(5660300002)(316002)(4326008)(8676002)(450100002)(478600001)(86362001)(6486002)(36756003)(4744005)(41300700001)(186003)(9686003)(6512007)(6506007)(6636002)(82960400001)(38100700002)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mNqSjjeQ8WTzeg2PF7Z2QS8Tpjx1l0QmXMt0K59s/S63Wi9AbR4e6GCYnYSR?=
 =?us-ascii?Q?VnPUeCl/rDE3UQ1dq7BzFa0N3bLoEM0nNKGTgVn91XMHfbRBVjcM6kfxdH+v?=
 =?us-ascii?Q?PDhGc5/5HHR7WYfIHr7VyURL2GiuNPps7GAv/eYDFMLox1Cfd7x2JEFxBMUT?=
 =?us-ascii?Q?vlFc08K+qmtOs1WMAbjW+thkIcN9PpvFa+Xq37WPpXxIU7Ue+WwDItuznGQb?=
 =?us-ascii?Q?ZYyEIV1VdK2vtzJP0y6+BjJa0pRg39oeewac/y/N9znnyIb9UHRO7vYHObTm?=
 =?us-ascii?Q?c+QqHVFfFpH4iWtdAttGXJvn3LTEE5X9fy9By8LuqN0yywQ+8qmlhISbbF6y?=
 =?us-ascii?Q?evfGx740t/fCwQ8AhUt23ewDU2B3670ioujpRX5huQNc0wq46P2A3tKA2umU?=
 =?us-ascii?Q?IQhefrkGUpcK+thyqDSMbuLRYJJD44qdDx1M0O38iPDRQj/vrboPWgHbBIL9?=
 =?us-ascii?Q?xDDGTMA4gSf75Bt+uIUkbPSM7m96kv6uOwYCiSekEDfmlS9M3qaEyyyFLfIX?=
 =?us-ascii?Q?2ebqXkvrAhJ29qBWZj+qK6gxHJoJiTaJwSV8y5ymAlHAsBveQvtib+zJnubx?=
 =?us-ascii?Q?/blM1p6Tp5/8qzUQxFhJmw1EGMROydHqQ3CmoS5TISK5zCSdQxhOtPkazwEM?=
 =?us-ascii?Q?orDTyMZ/TNtaAt3abCpIwSc1dtPaKq03obPeMG4/VkUD2O+l1jxgA/bmSrPp?=
 =?us-ascii?Q?ShKa9shsmFqkfYZshlvM1cCI8ay85c6MrO7GavjPjcfdw4Md73O4X3dE2/p8?=
 =?us-ascii?Q?C1/MpDRnUohYCeUxivtOXt0bYMFEKisIu28cqF6RvScu8ZZ1tMjH7u3ZiZA0?=
 =?us-ascii?Q?8SiXVH4yA1qJYBlS0ytay2x3kpL7o5e+QBOQEYHSH0uqwMvuKoj5cPMH8Jcv?=
 =?us-ascii?Q?k4+RXSI+CfgAQJJPSMmiVk/S/py1Qg6uCnt+TiimKx+kqYw4hXnMUqnqgHf5?=
 =?us-ascii?Q?5rQYunM3jtbCE1NWaze/oRN0JfDtDDD4WQ9ZsAQzv0SbtSBbotrP2ihMpSYU?=
 =?us-ascii?Q?sQCUKXXYzbJwnA1bLwa5xXjEcwEqNCFDiZU9LUgxxq8eiqBdGWkXWjB3vNId?=
 =?us-ascii?Q?eaAuvYINAHhJkTRbmOR/N6esZoyRK6Lg/6Ac1hxzOQFeITupgMPWFjgMQzmw?=
 =?us-ascii?Q?/gPTxCVPRHNsVC0kxX0n2YBGYGBtFoVqbpOaHyo1saM8EqyV4V9rYV0Jg5lH?=
 =?us-ascii?Q?Ix6vIjWzdaAVdPVOVMLIQUC7MimPqds3VN69ibcCTZ+J+xyx/ANUeWD6/2qP?=
 =?us-ascii?Q?giw+JPBCcxTwCkdfwW5etvL84mWdPz1u/zudgZgxoJ4DnlyBeSPFIjeYnsLL?=
 =?us-ascii?Q?9C2NLTIOdOcK29Pzlzd20V3CkH/rqGm4RfVxc4h/bO8wd+acXrl5DgsC4I0f?=
 =?us-ascii?Q?j1vzi7od+tmVJ16Y+HlrFPC8ohZkbiHhm4iohhqS8xKyU2bQ5XDaVjURR4KD?=
 =?us-ascii?Q?csz5Bk9Br1MZtsRHcNXg3Zgn3D7kyU5jp2TxgBiuzhxaZ57uulMJuPhsaYLY?=
 =?us-ascii?Q?h6q3I12jxcmC7BmCKuCsLOwcMnL1jbqBh96YRstGliyoWhoPrSckhZu8e7QU?=
 =?us-ascii?Q?r23iOREfmz6zmT/T7xy8kiP8sTJ3bCH8lKl/oo/efFdxprcR/vH7KnxZu06h?=
 =?us-ascii?Q?fg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: edc6c5a8-c490-4699-a173-08dab09fc4db
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2022 00:29:07.6925 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wd2jKKw3SkB8tuQfhd+OxTyozKw+Ju+rfSYSRessnIVsz91phx0RHOQmh/+CcChq5cXeQcpAfpbH8okYF10MhBU7aeuMRRnbm260pc0C26Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5058
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Oct 17, 2022 at 10:29:56AM -0700, Lucas De Marchi wrote:
>On Tue, Oct 11, 2022 at 08:38:50AM -0700, Radhakrishna Sripada wrote:
>>Rename struct ip_version to intel_ip_version to comply with the
>>naming conventions for structures.
>>
>>Suggested-by: Jani Nikula <jani.nikula@linux.intel.com>
>>Signed-off-by: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
>
>
>Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

both patches pushed,

thanks
Lucas De Marchi
