Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8900558D6DF
	for <lists+dri-devel@lfdr.de>; Tue,  9 Aug 2022 11:55:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB2E2919F6;
	Tue,  9 Aug 2022 09:55:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E113E90D22;
 Tue,  9 Aug 2022 09:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660038929; x=1691574929;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Ngy2Hs0iIAM0/RJBxq+PRFzbSHSSKnVL1SBz+/JmSEU=;
 b=Lst9aPPGcMCnf42fyXPBICTqH2a2qKX5zmzzMvrX6hoyPRt+iaSxBguk
 qjed63ty59CrB+1iDPVgSooEhHXtcK2L4vmw/CyoX8kgAeCGAhWU0JDJE
 K5yRGnLZ9SjTLk8QvJUFKIrQ4oPJKBHMrgz3zYW97dg1WFYsOLD6QkLDT
 hBKqG/6FTOEd4NaerIwS4p66mS1deUdHPDRx6seyVV2VwXCy+pxOwTbbC
 MhEppSfNyTB6WQqNK1I30MO52jSFe11SepFYLy1e5lY2Brhc3gqGMTLH+
 m+RTgj2hD70MFkTyTrEUJW14t9yvSjO4uH/8jRX2VIQ0aqLOLKapHghQ9 w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10433"; a="316726753"
X-IronPort-AV: E=Sophos;i="5.93,224,1654585200"; d="scan'208";a="316726753"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2022 02:55:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,224,1654585200"; d="scan'208";a="731075507"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga004.jf.intel.com with ESMTP; 09 Aug 2022 02:55:17 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Tue, 9 Aug 2022 02:55:17 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Tue, 9 Aug 2022 02:55:17 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Tue, 9 Aug 2022 02:55:17 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.170)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.28; Tue, 9 Aug 2022 02:55:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M/x2JR+oBlikRu0CPWa7pYFZOcsrxNmM/tFyOf1NDvFCgOllVCqdv4StMwk1AYiR+8qwH6/NtX8Ba7HO7an2WnDL2WYHF1G1s9vy9gWhfpEslyB5uAwdZMM8oywvqZlDUstzn9BMspjSYzuWmi62gYL0izlyBJJj/WuuZvdKdOb8SUpbb2VI7Y3mBE9x97nvDlu5FH9mNiwfiZLp9prxsqF6CGxMPA3iDHQcpHBENkymXBIZA7Si/Pm71KbQcS6XsAqiO1YbxQrE5TSglu+SA+f8zt88mi2UpW2jJG7NlrkU+U4N95aXe55EcuSqwWg3rxRIAIX9kJf9rvTQw7xyEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8NgoBPAA1s4ffzBJLNO/75NTKEDAhC07Y6lOhrYOcAI=;
 b=HKGaDlWxvDRXIzZkZhl2Cn0NilHBJvQ0olTRXyMxiVSyYMiMI1icMUFH7b2UMIUseIDvNywGYEQZWZnlMPiKTEtx0dLpoCar4lSJOazc3wblx4q1yPZdia/bLO8z1ONyEn+WjKRrXke1iRn7f8PlOmfs7+cXUk3NcqC1Sck1nCTb8CUlGSI85rbFnl83/b0p/rsEXGdTs8ewUneGv4KNYvE+o7Y+4LR1nIrpmG+/jLGQiN8InUsqzOKyFhbH7X+A6Nga8x05rwKaYo34nvBM/SwgXbV06W/HH8NeKgXLsWtkhjYaIYeOaCoJjsrDPaAt30ovVfNiy+L8ZKHYwmc6iA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SJ0PR11MB4958.namprd11.prod.outlook.com (2603:10b6:a03:2ae::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Tue, 9 Aug
 2022 09:55:15 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a968:40aa:6163:5c79]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a968:40aa:6163:5c79%6]) with mapi id 15.20.5504.014; Tue, 9 Aug 2022
 09:55:15 +0000
Date: Tue, 9 Aug 2022 05:55:10 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [Intel-gfx] [PATCH v2 18/39] drm/i915: intel_pm.c: fix some
 ascii artwork at kernel-doc
Message-ID: <YvIu/oCnkDbdLqou@intel.com>
References: <cover.1657699522.git.mchehab@kernel.org>
 <b3657e96ea87a5803ed27d1cc0d9fa44b2f164cf.1657699522.git.mchehab@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <b3657e96ea87a5803ed27d1cc0d9fa44b2f164cf.1657699522.git.mchehab@kernel.org>
X-ClientProxiedBy: SJ0PR03CA0368.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::13) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8b20fa71-fd72-496f-d929-08da79ed41e4
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4958:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kLFWTeEFizsE3T6p4v2cOf/rdmjGrCvuVm0P8UqADvutNJMuTNYHiYbie+l1OjJX40dZwm7Ptvh1MjzY+lm7JboeuP0r/d5bYblj6uJ8IocWyXulsvwy3nMvZghHJb4nfY3R+7Fg1Pg+/MFr/5PZi4DbGN69praY97opM6NLnt7cC3poY6u5MXKWJfbAoRyOaVXkzoU7mkERtFiOxq8qFdPK3RMHMJ53x8O9nnvzy7bVLppMM7aW1sJ8bgOMzuU1KUc+JOtqZdpuzj6RcHCVtTRlnAqBRbD/i7Oz/AXQjpH/NAsEjAAKZ89qiYROt1612SxqqVebV6LtoUGW+vPmgIT357hCkaoIfSxNy+XT6d1V84rmhUnOm6i+KQsFI+Lci09iWrNkPA3woboajjmM/XVkhZo0kq/vuo0BssbOab9n3cWwQyK/Za0WLFOmBAzNpiqn+wxfYQP/3NQZqCrqyOlJqOYlYmzbrQCEw01LQQC8UaFifZelVTvdTeltYBWPpCe8L0ykMTMHZNNlTtpLH5UlVSQQKYJDz2Xn6qD0K3383t1AhsirmdTgMmztu0k759VMZp4AhQ/CTOsKgycLJAYEFyVt+qBTH57UREwKLb1jlrD6991VPt1bFdwXRmCxTJKFMq8+DDPFhFU/tHTkqasVEtz1c4G7Hamu4Ut9gYCDJ8M0WhtJE6fcovV7NIf/tUilnJi/0IrOZ7LKTIIA1gj56hCgH12ECOU12EMBE0Pi2kA+NzraYgiG2eM0IoORXL1fCH6HOezl15rhl2dvig==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(39860400002)(396003)(136003)(376002)(366004)(346002)(36756003)(26005)(6512007)(6506007)(41300700001)(38100700002)(6666004)(966005)(6486002)(478600001)(83380400001)(86362001)(186003)(2616005)(82960400001)(8936002)(8676002)(2906002)(4326008)(66476007)(44832011)(66946007)(316002)(5660300002)(66556008)(6916009);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?91YRN0UbT493bRknOyLGzz2iFJXd8QnPtWgS2jrmM7YxKp6DwKOZVHVYFewE?=
 =?us-ascii?Q?t55/16S5bwB2UtHU2Nt0wfB+x3URzNfzkcyMGapFeYfGGOZJ9gfPV0hdq/yK?=
 =?us-ascii?Q?1xLjgy+PD34pM/l0hJiFj2I9T7/foa+P8sB77/ajDU5mSn3g0e08wOb5XAFv?=
 =?us-ascii?Q?bTvYJRyfTVFjEb1+NpVD/0Vh1xHjFI/7Ij+8AYWGFab54y8oKJB2AuQlOZVY?=
 =?us-ascii?Q?m27+7UI3Aa/FacyPsIezlFryMCFCigR0qp/abK6jlGGclsrb25aj62ZYT0/M?=
 =?us-ascii?Q?JVpPPnvR6unubOt9t053EeGZ9TpFBzUFSH0DsbKOWAENUZVC4knds7zO9MPV?=
 =?us-ascii?Q?KBb+h6UTo6LVKi3uxHWHFPJyvMvVKl0cgMnuxIOalpBuCTsJZQEsBx1Bf6vr?=
 =?us-ascii?Q?D/wL02qsnIay2EO0oksBF6G0cQWsr3seurwSRaap0hXl496jwN+gzBnVZnEM?=
 =?us-ascii?Q?YEWkDUUcqNvi07XPYPfQuxe8HOuRvG1jszSGU9/1qlAkQwDxEeDGQaCaX6RG?=
 =?us-ascii?Q?fox0VcTREi1IRlyODZzOu8Lc9Y/nbqPoR0psAit3dZn3BsuDivDuL8DE2L3R?=
 =?us-ascii?Q?9AAuUjStMInL8UlA5wTMlxlUGNreqdheVRZtcRb/Sf7a95AyKusY831Ns+YA?=
 =?us-ascii?Q?j8XKxVrKfVct366EBI6AKIkmIpka+mjCznkr4EfMjofDT8QQ7RD5qPAYBAsD?=
 =?us-ascii?Q?EvNBWOvgA6nKEsewWdqhJUR2sSui6T5MOKRGV+wZSYdPjWtDI6AZVOm6vLjX?=
 =?us-ascii?Q?B7ZI36IoIb5OVDMP2e1VImBzpAB5ws+dL/p6rx7oOhgqSfPmtqt/LWTz/jYl?=
 =?us-ascii?Q?vJBkktBT2dnCbdwBqD0yn4uJMAC+3hOok5/hCJbqTO/+NKYbx6oEcfC6ryno?=
 =?us-ascii?Q?0kdsaPK6ZWyZvRDuWjv8ht9LJqFHw6lx/ktrs4TYCs0gn21M3SZr7mx/3OOh?=
 =?us-ascii?Q?vxxxf1nwy9pjAoz+NF9S3ycQ0CrEmev8YWiQNYbzpzB/xKnuorBoA+fr3jAT?=
 =?us-ascii?Q?walITKRFlfRwT7JpctptpK+ZS6FnfADPZEO6PSZMJQVw02W/QC0DkLmucVKP?=
 =?us-ascii?Q?AMA3l1L5qQC+3YW0SBQocYkveQehgZUYXXKFTNYV8mGQIqPreVI70/uMYn/J?=
 =?us-ascii?Q?NuesYQO29p/S6bfPCyuO8AMFqNsp9SgxxPC3bbYJymlojbhpCUkCWVKKHmXJ?=
 =?us-ascii?Q?OYMy86T75ksAJj436TUaTL+/vC/ce3C1f56O3uOjoTaKSgyujHKYqx6GIgBc?=
 =?us-ascii?Q?22abDy+ilkcs62fEb7rAZAY/36qGazct87RVZZcH1ejkCgB/tCEKgKVNcwgn?=
 =?us-ascii?Q?B4wcFlu0AtddHed4JEhCl9Gw5PazJ5vGEdfTzR8ZTK88O18h3rHL3x8oRH/J?=
 =?us-ascii?Q?WpkCXwd5/puBdwTQ0cXhe3C9e529TPR9InNZKbDhFavVud1XFFVulwJ2Eo5i?=
 =?us-ascii?Q?BNFCiwUSmmQqa6Ca8tnzfV5ve4X1i3/9ltqZdxBxhvruQhA82A4R2UcfAYDB?=
 =?us-ascii?Q?R47tKg/0HIXFDEl2Rd6GfV6FJF4KLr7MZytP5mN1D/etNqcQoC8D6mxIq89+?=
 =?us-ascii?Q?UWQzcj+mmktgl9mA+Y6OXd2YY3Zk54KFVuo1flzEtDioK7ocykNAY9qhvZ7D?=
 =?us-ascii?Q?kQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b20fa71-fd72-496f-d929-08da79ed41e4
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2022 09:55:14.9812 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b4jqHGLIhD+V+O2BZCcbVcoEmiP0zNcbVPk7k1c5+rCzhsYROkCXCnPnvphmeaMtOaU46p+2S/clSnf2JfpL/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4958
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
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 13, 2022 at 09:12:06AM +0100, Mauro Carvalho Chehab wrote:
> Preserving ascii artwork on kernel-docs is tricky, as it needs
> to respect both the Sphinx rules and be properly parsed by
> kernel-doc script.
> 
> The Sphinx syntax require code-blocks, which is:
> 
> 	::
> 
> followed by a blank line and indented lines.
> 
> But kernel-doc only works fine if the first and the last line
> are indented with the same amount of spaces.
> 
> Also, a "\" at the end means that the next line should be merged
> with the first one.

my first reaction was: "do we really need those new empty ( ) blocks?"

Then I read this ;)

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> 
> Change the ascii artwork to be on code-blocks, starting all
> lines at the same characters and not ending with a backslash.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> ---
> 
> To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
> See [PATCH v2 00/39] at: https://lore.kernel.org/all/cover.1657699522.git.mchehab@kernel.org/
> 
>  drivers/gpu/drm/i915/intel_pm.c | 33 ++++++++++++++++++---------------
>  1 file changed, 18 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/intel_pm.c b/drivers/gpu/drm/i915/intel_pm.c
> index f06babdb3a8c..d3393752b04b 100644
> --- a/drivers/gpu/drm/i915/intel_pm.c
> +++ b/drivers/gpu/drm/i915/intel_pm.c
> @@ -684,18 +684,20 @@ static const struct intel_watermark_params i845_wm_info = {
>   * FIFO is relatively small compared to the amount of data
>   * fetched.
>   *
> - * The FIFO level vs. time graph might look something like:
> + * The FIFO level vs. time graph might look something like::
>   *
> - *   |\   |\
> - *   | \  | \
> - * __---__---__ (- plane active, _ blanking)
> - * -> time
> + *   ^
> + *   |   |\   |\      (                          )
> + *   |   | \  | \     (                          )
> + *   |   __---__---__ (- plane active, _ blanking)
> + *   +-------------------> time
>   *
> - * or perhaps like this:
> + * or perhaps like this::
>   *
> - *   |\|\  |\|\
> - * __----__----__ (- plane active, _ blanking)
> - * -> time
> + *   ^
> + *   |     |\|\  |\|\   (                          )
> + *   |   __----__----__ (- plane active, _ blanking)
> + *   +-------------------> time
>   *
>   * Returns:
>   * The watermark in bytes
> @@ -731,13 +733,14 @@ static unsigned int intel_wm_method1(unsigned int pixel_rate,
>   * FIFO is relatively large compared to the amount of data
>   * fetched.
>   *
> - * The FIFO level vs. time graph might look something like:
> + * The FIFO level vs. time graph might look something like::
>   *
> - *    |\___       |\___
> - *    |    \___   |    \___
> - *    |        \  |        \
> - * __ --__--__--__--__--__--__ (- plane active, _ blanking)
> - * -> time
> + *   ^
> + *   |     |\___       |\___        (                          )
> + *   |     |    \___   |    \___    (                          )
> + *   |     |        \  |        \   (                          )
> + *   |  __ --__--__--__--__--__--__ (- plane active, _ blanking)
> + *   +---------------------------------> time
>   *
>   * Returns:
>   * The watermark in bytes
> -- 
> 2.36.1
> 
