Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A7A0573F39
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jul 2022 23:55:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 371619BE41;
	Wed, 13 Jul 2022 21:55:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67BC39BE3E;
 Wed, 13 Jul 2022 21:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657749313; x=1689285313;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=njRfWRCaGfDqGUB1KwQey2S1gtNp9nRsWjNYye1NEKs=;
 b=IIDau9OptULRbaeLzZII0/gReLzj/8NHVT93U5TncLREP95dZTwJvCqW
 8sFizHAyMqCnAXZWE/hTinNRbv5vF64vfBWcmQ/0qQdFSJf3NoiYbFTSr
 Dkn/tKuLydipOgCIcANzeyydelgnv6e1b+OQ+jtqeMhLcLYUq2BJN/rTL
 JcLmfySf01n41tu1FcyLAWOUSFO0Ddjiu8+YPa5G+3U+JwA5Kr23/du9i
 VMPNCUIaJ5wh7KcXIlv/rHnhmkM7OlW28hUTySCrNrjIOiPjB5DurPMLy
 hiyDva/VyPjOCIjSnqSy4uA/N/hZJ60NYRath4R1kdU/4ivf59Wdwho/2 Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10407"; a="310999652"
X-IronPort-AV: E=Sophos;i="5.92,269,1650956400"; d="scan'208";a="310999652"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2022 14:55:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,269,1650956400"; d="scan'208";a="698584246"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
 by fmsmga002.fm.intel.com with ESMTP; 13 Jul 2022 14:55:13 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Wed, 13 Jul 2022 14:55:12 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Wed, 13 Jul 2022 14:55:12 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.170)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Wed, 13 Jul 2022 14:55:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jRow/NhIHS5x75bec7rqJjwT2WR7xQqRkZ3WmaghaSsiUGJqL9EfBnA441zx8sgTuE4zfJrB7jdw8A12E1N8kkSwu644rJiSBSMi7E7C8TtweR3hyaf4IGtKPDtHpfcTXdJ9lph5dwnuu2tvvJkXPWZwsFOFFtkmk+vio01VT1PcKlC4JpiW8W5Q7KaSx1pfvDhtNE6aZwUmuiNOsI6JSKP0QTlnaxHhZtrbUmozOik+mJaYCIW6pq14Vr6gAzYH5Js237VseavQd2hrk52DWTDAE0D6HiK3oVmGTpZQyPeiCijnVXIdeaCK1ZsjwovyYnjrfhxfv85CPUkmxAUViA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Sv5SdGaioRLrici9+VI2huYrnhs563+V4zM7HM5pfQ=;
 b=n/bA6l6TEE6xxLKn8zKOXb89hZ3wBYk/LqSIQQHLseOl4tXoPaDDiIiGcrFcRNZ73qcFpdJIecWAStCmMDH7xhqiboxTvYKQ9q59mqQVqZYMVAGS+7uZliVT21LmixHHbWdq+lT4zT/EdKKXYsBMmTa/1ekP3Gdm8zm6rwzvCMCHxmMoiiFkQL8CkCNUcSq9M41uG/t19z776SFNdeZYXaVEZWDxx+aSug4Zm3p0VCZJX1AObSRnL68vj5djQxZ6ChFX+U0ETsPi1xQWA/YL47PgaHqDaCsb2IaAJ02Z6D5SsPN9vxTrVS2ZnaSJL9fGi2BmKEe5IoUsO4y9MXMcdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DM6PR11MB3947.namprd11.prod.outlook.com (2603:10b6:5:19f::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.25; Wed, 13 Jul
 2022 21:55:06 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::8053:3c59:9f5d:b615]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::8053:3c59:9f5d:b615%9]) with mapi id 15.20.5417.026; Wed, 13 Jul 2022
 21:55:06 +0000
Date: Wed, 13 Jul 2022 17:55:00 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [Intel-gfx] [PATCH v2 02/39] drm/i915/gvt: Fix kernel-doc for
 intel_vgpu_default_mmio_write
Message-ID: <Ys8/NEhhkBO2VpdJ@intel.com>
References: <cover.1657699522.git.mchehab@kernel.org>
 <e36ce9b22d4d9914cf5160ad31812a803e1ce1b6.1657699522.git.mchehab@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <e36ce9b22d4d9914cf5160ad31812a803e1ce1b6.1657699522.git.mchehab@kernel.org>
X-ClientProxiedBy: BY5PR03CA0013.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::23) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1c350524-6da9-4722-3e3a-08da651a58a1
X-MS-TrafficTypeDiagnostic: DM6PR11MB3947:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JK9pfCqeHF4uykp0ZrOvIEyg/io1m1L6JDaCjHpBYDoCLo3s/t6M+04xInxc3xTKmn3LbAtoRQTidabN2h85bE3weWv8bwPxk/1iKvyKm03VVaKvcTO82Du77MyuaBI311LpV8VXx9u1gxOx6SWLkAV8T6p8bKr0ojLTR9xkzUSsCfcYiyau+kE5WD/941pICXLmgmZACZewJiNfGTmmt7z06FIZ4FEAWRbLbKc5c7nXzq/5u3frFM/mp/egocqUZvp5054cxtElMH7M49uC4wWMP+5aVdLEk2RlUjNv67+FCr5Xseed4SlH+uEVPTWMX8iGQj6gLzMRynftC8UXBoAHxjP/0pX42zLVr83hbIDtzTEm3F/t1X9G3ikei4lsJNSqxZJfP0rAS7UKwRYkwkBMEFbEVMKuxHvUHeS8Tx+/Z3X+18JZMNYwvswXbDUXtPLOJcz1bd0Ku3DKM0+KUoVnuFVfc94+CUEecfImLDkABjyC6mUykviQnuDBpqdEAVrUfW/uWeYFH3rJSYx/StalX2Lelpx9Thae/1CWXs11BGp0IumIaDGOhZlXiZ1zFR7aFuKNvbyU/se1HdJKpKXMti7STVXwIVWwSR068LA6ThBMC9DEWlkkN3jXnU0YVhP+WVdhXRccoccOze0us9LSyBwxnSq3tTCPwgHwdElNCwlnmvu4vgPGkWiR5BFojeXa+J++1aX5BjtZis73q+GvDKn1cwErTUMaUcATvxart2UD6eSDzN2gXd87pKj1dA0PAvGgHAy0lOnQ612BxGmZOpEPgtMf3xwyZ5DD1gg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(346002)(39860400002)(376002)(136003)(396003)(366004)(186003)(66476007)(6506007)(86362001)(6512007)(4326008)(8676002)(2906002)(26005)(6486002)(478600001)(6666004)(54906003)(966005)(66946007)(6916009)(82960400001)(66556008)(2616005)(316002)(5660300002)(41300700001)(44832011)(38100700002)(36756003)(83380400001)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5aLaYXIn0nO3vyM+0n86e56kSLrgc9kH+FEs557R+2XTwsVOuaaSe9L4ta8n?=
 =?us-ascii?Q?VZyyDPgWFVhzFh2/QVvn57rfDuaeIDVlYuXrHe/f9atgcf/PtLmQ/RoDC/l8?=
 =?us-ascii?Q?5h5CE0AuB8sJd0PspwgpNWWPCuVuxf82uvG9nyHzx0gFIpsAmJRlLmt7n6OH?=
 =?us-ascii?Q?ml/7S7P1AQhcwMP0H/dHM0CLSn7zc2XQbCh/ewuFn9k3AS4Gd0e3dJNh6uzt?=
 =?us-ascii?Q?L6snXuewCTi/wMHEM9ST5kMrECzrSXgFO9tFr2t7teOEPaqB46MOTksxy3g8?=
 =?us-ascii?Q?PuDBrjED69IitztqVkNwU7WBSeuDqvFaR4IaCi9OVVU/S9Wny5/+GDWZYtoh?=
 =?us-ascii?Q?CHgXT+zEoFclA8lhodbjqClJdWGYJtmWCLEk8RyJf3N4JP6+AGmxZmR1O1xb?=
 =?us-ascii?Q?IhF+Hv8lQfAV1KQDjmhG+oNuyGoFbHNJ9RkkSb2UlRX2nuYXpxnXePrxR1K8?=
 =?us-ascii?Q?UoO4jhzJ6Jpj6QrO+JtGdPQyA1/4TFq1gCKR2YhF4b1EzXALkNJrTheVuLIx?=
 =?us-ascii?Q?0q5QAU8BMRXtz/3ZCdiy0MRSXDWUYrWoax9Met/ZbJCOQIXmWju3zMCCZoQk?=
 =?us-ascii?Q?s2gCismmjv96ArhfwYDN+7PfOmueGvs2VG1LRUM4lkr8R0lP6ahfcW2RDaPX?=
 =?us-ascii?Q?StIM26sGNSYTxgj6T6p7GSesP620TccjEdMUOq7ifkWwykqZmeA/krQIiAmf?=
 =?us-ascii?Q?vfSsY7Sa7503nVQOdXT0rTOKtapiU35zIiIBruhMZbkAVunAxJHH/x/WBrMb?=
 =?us-ascii?Q?TYo6YajcYjJUFJSXEH+n4MszlvgZt4H71BPOwL4Z+l+dvikUa0nFN4cx49db?=
 =?us-ascii?Q?VGSBOwCwv7kKjHRYYCiGgtciFB+NB6PPIN1duKLgTVNvtelKC5UZcwgeOMdR?=
 =?us-ascii?Q?B5FSrgyNaaSTYYr54kuvt0LjzBU+M3tJd+WwQQc1pLssh57/npERrtxI8SR5?=
 =?us-ascii?Q?d6DU1VzvxbXLHxHxO0jwze6NBfv+2wvuV+W6IWpiyr2/XEVaxAeacHBM1D7K?=
 =?us-ascii?Q?O86Y2KrYu+HwMI+Fp6X0yxURAEJKN5js74paSBszgHXJd+9BO6xg+HboV+fC?=
 =?us-ascii?Q?YKzrj30tFIiWhiXLqLUQOD0z3KuSZFdjQbmhncz4rp6tadvlFhYyvrs9mNiC?=
 =?us-ascii?Q?gJcvmFYMUE0Yai/507z3TbliwoA8qBzLuLINXe0ilzUXgVDT9TGcQvK3c7ng?=
 =?us-ascii?Q?tN60vOLdeYFmxZ+hclK1r0gs/6ngkNmwQl1lEseGH7Ex355hx7Np/qj9x3ef?=
 =?us-ascii?Q?rka3vLjbrdypLSaNBU7gGXvDmSNho4u35Gj142I/+qOP3st5llmFweaWvaz/?=
 =?us-ascii?Q?suazuRkQE2fd1mzpP1CM0nJKvzgxCW5WBxoJ+B6Vr9RZm+3f4ZaZu3zc8e3D?=
 =?us-ascii?Q?XvtU8xqdfsviWicqL5Mpwen7xZHTw+BBVv0ZwwhTLlTAw6lpzcbCU0QixEfQ?=
 =?us-ascii?Q?/Wx9S+XxoLgmy3xmB2sx2qFlMkNVfEIpEOm1xH96WWgQCPFcM7FDUwU/cDO9?=
 =?us-ascii?Q?HYcRnrPBis/Ac0vfSzW7MFL5y/vp4t/szvAu3y/vJsOBVXB/Q0HZwYDR1upF?=
 =?us-ascii?Q?Qgl2Exrgb4Qy8TZwnm4Hhz91ZyC5ydDtctjhocAFg/CrWC6TqtFF4ttufYvZ?=
 =?us-ascii?Q?6g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c350524-6da9-4722-3e3a-08da651a58a1
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2022 21:55:06.0915 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QK3wpOO9iUPZLxaEg8cdp5u76d5kCOc5sTFhG4aIe5yyn3/rlklG/adnThjcthsfrOkeUN0DTTtHb7MORv5SSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3947
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
Cc: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 Abaci Robot <abaci@linux.alibaba.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 13, 2022 at 09:11:50AM +0100, Mauro Carvalho Chehab wrote:
> From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> 
> Fix the following W=1 kernel warnings:
> 
> drivers/gpu/drm/i915/gvt/handlers.c:3066: warning: expecting prototype
> for intel_t_default_mmio_write(). Prototype was for
> intel_vgpu_default_mmio_write() instead.
> 
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> Acked-by: Zhenyu Wang <zhenyuw@linux.intel.com>
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
> 
> To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
> See [PATCH v2 00/39] at: https://lore.kernel.org/all/cover.1657699522.git.mchehab@kernel.org/
> 
>  drivers/gpu/drm/i915/gvt/handlers.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/gvt/handlers.c b/drivers/gpu/drm/i915/gvt/handlers.c
> index beea5895e499..9c8dde079cb4 100644
> --- a/drivers/gpu/drm/i915/gvt/handlers.c
> +++ b/drivers/gpu/drm/i915/gvt/handlers.c
> @@ -3052,7 +3052,7 @@ int intel_vgpu_default_mmio_read(struct intel_vgpu *vgpu, unsigned int offset,
>  }
>  
>  /**
> - * intel_t_default_mmio_write - default MMIO write handler
> + * intel_vgpu_default_mmio_write() - default MMIO write handler
>   * @vgpu: a vGPU
>   * @offset: access offset
>   * @p_data: write data buffer
> -- 
> 2.36.1
> 
