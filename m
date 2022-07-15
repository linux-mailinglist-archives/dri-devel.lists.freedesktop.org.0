Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 44D66576F0E
	for <lists+dri-devel@lfdr.de>; Sat, 16 Jul 2022 16:40:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DA5210FC99;
	Sat, 16 Jul 2022 14:36:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 460DF10E153;
 Fri, 15 Jul 2022 21:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657921354; x=1689457354;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=6uV8DJH6N7TVINtjTLwamp8oalvI5U0aKjDcNTL2BvI=;
 b=gvkgQi+c9aCf/ObdO3zx6DWeJOZ7NCH8RYfp1+RmqeULwA3dJ2DRDJ5U
 idfRjyDDsW+RVoqeVT5MUV/sIpfEqE9gyDRiMGK1NNxjk8WSaKvVfVUzR
 bTFiricUnXFKzox4QIvUZ83uWsaCfW0Dv3JBdmrcw4YocHsfFRk+M1XgP
 YVxXLpZLFjAeY8SnXpVEZBmuQuu4zp7ZKgTuZjEZp+mrOF5+XKP6zweQ2
 53IJL5GRk+PvU0KJcxsMLP2A4xuTkHGiNF/XlvjoxTNcL9Xf2d+ZtEG+h
 s4rjiSxmYSR+lEqODSXwBqfjh445apydHTmeMQYMQaQ9xRTxLPZeFKemr w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10409"; a="347593242"
X-IronPort-AV: E=Sophos;i="5.92,275,1650956400"; d="scan'208";a="347593242"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2022 14:42:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,275,1650956400"; d="scan'208";a="773126557"
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
 by orsmga005.jf.intel.com with ESMTP; 15 Jul 2022 14:42:31 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Fri, 15 Jul 2022 14:42:31 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Fri, 15 Jul 2022 14:42:31 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Fri, 15 Jul 2022 14:42:31 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Fri, 15 Jul 2022 14:42:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F5nC2wT7y5kmes8PRkJbGcreO2UG6z3FNUYtkthUD77jKcb/sz2+NFi1MvRA5cwkcIDRLU4ZM6U5J1vdHxk2OYMeNu7Qzt8QFn6HtWjuDjh4Zv/AaL2YTHxVbmdyRzzfpzb0qKgtmmyH3y9KniPviOsqsBZVwSlUnYiS+yg4RXG4HlnQw4V6W4zUFClnreFFb7E+vq0bydvhwNsx43ffUp+Qzd5JKpCW715hx3YQNJ6KCB3shPIamzfGUU+KUMgeY/VZTJTLZUb9CzJvPa3I58aGqu8QSMRwlw9Vy33Ajjz+7i7q2WEPZfExzXXvrA7dNCL0b3nayIRf+ysf+OMhuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X/+92oYAbjQv5q6emaiCAyuqESZBfqplb+PMb6FcZoM=;
 b=ccORs8GpImiiSYUJBHshSxzUnp4GmmBiDpl1p9afS3IhsuTLOuYJbbqP4rpgn5mbr34hT7qCbS+WMut2Awyp6vHlhF0bLTSf5rk9rRpdol5op0aa2/fAqfofFjcU94AJo44+7cT1t3hneMzrtMXiWOQOukmpxaOHWu+TvAThzBMkofgCeJ5ux7ivmIuFnZxX2fXuVRbQz+ts7rP4a/JIh65UHQRBZ4XW4vMhZl4gGNLfoKaEItBUk4ayve0c+HzSc4daAxKsHi5kOGjTR+X32ZXR+rfbH1qp7jPxSkAAms9kRsu80x5JtP4ZNEhw5MO4eBwv2y66Um8YTVBf6joHeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by MN2PR11MB3615.namprd11.prod.outlook.com (2603:10b6:208:ec::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.12; Fri, 15 Jul
 2022 21:42:29 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::8053:3c59:9f5d:b615]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::8053:3c59:9f5d:b615%9]) with mapi id 15.20.5417.026; Fri, 15 Jul 2022
 21:42:29 +0000
Date: Fri, 15 Jul 2022 17:42:23 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v2 17/39] drm/i915: skl_scaler: fix return value
 kernel-doc markup
Message-ID: <YtHfP/SZj/WlGi6y@intel.com>
References: <cover.1657699522.git.mchehab@kernel.org>
 <58fa90350ac1fc4f2b37a50179bdb38613d5fa5d.1657699522.git.mchehab@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <58fa90350ac1fc4f2b37a50179bdb38613d5fa5d.1657699522.git.mchehab@kernel.org>
X-ClientProxiedBy: BYAPR04CA0010.namprd04.prod.outlook.com
 (2603:10b6:a03:40::23) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b588342e-6646-4598-d860-08da66aaea71
X-MS-TrafficTypeDiagnostic: MN2PR11MB3615:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4Zv8Iy85JYlln/ibhcV1/Z1Qj+h/ZoQr/KJsySb6xtwciIsP9phavGuGITjJANLfXuo1E+aiyAtXFFRZ/F3ZFdzTKi1pyhQJQWqHytA6orkK4ayGcJumhKQ/L/BzI6u5DcUSSSRV7QRrZ36GGSXJqqHHvOKeX+1EwV7715M4hu3lN1UfTdz63YgUNXtOPXkrVb3cB7xisLirQrdinvKuO2r+h26Vl9HbMY0WqNqEapS+L0fb5wdCNeYC8OM1xFQ/Qxs7M3kAGXV9MgCbRfhGPK+qc4vCHNggce9dy95667MbQGLcw/ALl2U27NHq2O5/mfjh/cD9eiebnSThbpp9t03chFoevPdkd2tIIHBSKjHxaJqLNGXUJiyY7IA7FT7N2D9KyvV3f9vhHd22ZzrZmwju1siLRWwlVvZH1pAIgNnLPVmM68fm6a00QMNRGDYNOH2XgSYbkmM3saVmH6yifboRykXrxsTy8oarcnBgqtkdzrAF91y8RRKJPE9L2BGBqtagUPSzpBkKrDjzWqM93qQYd3tmeWq2vmnH9XAkQ/ZiSnTbAHDpnBW+Q1mL0bSVvvNnA6ZaPxz9zuWDA7HsU5bAgVmN7GOpJMA/XpA/gu0D8fBUbBq/FkdQF9Dk52kUOyE6cm5HhIfrq0K0froVzIlCpzd2LCZtEdBxWa6DuCDfIepe9cywuNmi9FN60nfLYdi0PDKbb8iEGzZ20WBW+9QqZQEAPIdQhXAFtQZxJTkEtoqK8/HvXQwWh97fTrksqpDl+EyMlV2UOFt1zm/cr4YlsT4ke94nr5U7dSiWz04=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(346002)(39860400002)(376002)(136003)(396003)(5660300002)(2906002)(8936002)(44832011)(4326008)(66476007)(8676002)(66556008)(83380400001)(86362001)(36756003)(38100700002)(82960400001)(478600001)(6486002)(966005)(66946007)(316002)(54906003)(186003)(2616005)(6916009)(41300700001)(6506007)(26005)(6666004)(6512007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xf6KD5uNm+/L6eDjeKZB2uLgOh1V4Yb2P1k3CqM0HJ7alfHIB6xDdsebDINS?=
 =?us-ascii?Q?DfGXiuG5GV0s3lHZBr8npjxacOJ0CwLF7yaEHJ4ULQIwakGcZfLqxkkQgqgx?=
 =?us-ascii?Q?f8cPda6fpA9Car9mon4A5XnVRcwbPKkow3XnYvWF/hqFGEn/x/My3pcMl0ku?=
 =?us-ascii?Q?c1g0bY5x0GagfjILx5ykpcFZ87gaWd+jchVZE6BnGMbZCT/+EUpjDdqX8ljV?=
 =?us-ascii?Q?EdtXCGP7hRv3N7eX0CXusUcDx8PLSl+Wz9t1bkOHrYtysRzA8yFirAPGxt5Y?=
 =?us-ascii?Q?J7CWQQ5Nc/oVjnSYeoDuZbttkH7Jy1O/8ued2i3ZM7najbg4C4BVUW+QCMPc?=
 =?us-ascii?Q?5RbPOKK9EDmdLP6eIr20Wj7//uGPPs8D4v8IIkj3jUfIuhPGc3ajITyAehVn?=
 =?us-ascii?Q?a5oW0UWMdOyrA+dkQkH7IPKOVkOf5aTN2WuDGbmuu4fzJ8PSLxOvOEklMeX7?=
 =?us-ascii?Q?IG+agudybkKj/P/+9SBkFbACLkqtS1dCJ/xU2DJ36U5r5XIYayRLa2df96gh?=
 =?us-ascii?Q?W3NATX9cu9flQ6cqpNj5wW1y5K6WDNzpmbPEuTU3ikrcOspSIYBW7Y5atlzj?=
 =?us-ascii?Q?cBAi2U8KDapsg3p7ZSOKrIm6WkLi9ofZQbWaGxYPousI8ctopWsP8KNaqRg4?=
 =?us-ascii?Q?5Plf+X5v4Ii1oWsSi008e+uDsJVnmePLjwE9t/YpTxhxLVFgN7FTEbrqrDUW?=
 =?us-ascii?Q?59Bvbmfk6YWxbMJ11LxB00//3m5t2xM0zu/BKKAkBsRJeQx2zGF7zlI4j0Oe?=
 =?us-ascii?Q?uKC9ThRU05qrPHABiUYZ7smwCqVG2qFpRnp+vGDrJmA0zh1qtske3kl7NdGf?=
 =?us-ascii?Q?rk7dHZIf3zRBBE+48D3sC08UFi+EMCW7/F98u4b3Oer4VcFNMsIWbTNVCIiU?=
 =?us-ascii?Q?E/LLsYIm3mdAoIpSjBz6abI1GK47gjNfL4XHv7P6bTFs2bySBVrf87r5v2MK?=
 =?us-ascii?Q?Hmb+6WzrDu26UNJFvOPyCmOBv2IS1GLNSz+h/YhbvnIFqCFVDwM+rKAGekZ9?=
 =?us-ascii?Q?UesMQKzmuUHudQi7gju18MH/Mg8J4zJshHaV0AJrQU8AkKRq44MEQAPt9Ss5?=
 =?us-ascii?Q?tlWXn59FRstXBhkj7RTF0WKEf9zscvFJ/UDZTkNVV7mfpCAXmBNArU7ppy33?=
 =?us-ascii?Q?oIp4BrmWQtYhRzocjwbXu0yWdeZ6eTMUXjHSG7+KHQ+U/IVWeMUmSE3+KimA?=
 =?us-ascii?Q?L1rOTeloJumeiUOe9W2WG3GkOEBggQA5PcNWd4pkj6bUGYS8iWc6gcUCSwUV?=
 =?us-ascii?Q?ST6dvG9Ie4jSfeSo6qs+Z2uguWFiMI8MIYtTblPpnG/3KcMcOqjpZFb2l3rt?=
 =?us-ascii?Q?r3cHvNzrFyj1qxW0OcAgi/J4DvVq/XzojDdp4ZZGXd8bWO7xjVPcRZIU1+Tu?=
 =?us-ascii?Q?TeHsJiEraE079k031sFXxiM9SzTekjITcPpQo1WTv2HZ/oLbByvs6jEhKTfz?=
 =?us-ascii?Q?D5BTZb4TCuESmlx5QRFArkGRmjk/M7Y5Bxc0o1Le5sTqwAdafeWKZ3PHclQJ?=
 =?us-ascii?Q?uuKYveLXPEA8z5eXKnHTOTRBT3iKP+Q8j7KXdGolP1xq0IEaZ6ke2PlUhD/C?=
 =?us-ascii?Q?FZ6HdHG4tZ0HaBsdEMXZluoVVFamiTbMTXdz0FjsI4x23FsUEsum7b9zWDR9?=
 =?us-ascii?Q?Tg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b588342e-6646-4598-d860-08da66aaea71
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2022 21:42:29.2961 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f87K1X5lQwcQO+uoynlh7tWOX2srV5mPQwf/K2UHXNmCRnNS23gl+1u7PcTJ0RBJ7Ue+7WV4e4ocrQ9ARRYHrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3615
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
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org, Lucas De
 Marchi <lucas.demarchi@intel.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 Manasi Navare <manasi.d.navare@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 13, 2022 at 09:12:05AM +0100, Mauro Carvalho Chehab wrote:
> The way it is, it produces this warning:
> 
> 	Documentation/gpu/i915:150: ./drivers/gpu/drm/i915/display/skl_scaler.c:213: WARNING: Block quote ends without a blank line; unexpected unindent.
> 
> Use list markups to suppress the warning.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
> 
> To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
> See [PATCH v2 00/39] at: https://lore.kernel.org/all/cover.1657699522.git.mchehab@kernel.org/
> 
>  drivers/gpu/drm/i915/display/skl_scaler.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/skl_scaler.c b/drivers/gpu/drm/i915/display/skl_scaler.c
> index 4092679be21e..59099f793d3e 100644
> --- a/drivers/gpu/drm/i915/display/skl_scaler.c
> +++ b/drivers/gpu/drm/i915/display/skl_scaler.c
> @@ -208,9 +208,9 @@ int skl_update_scaler_crtc(struct intel_crtc_state *crtc_state)
>   * @crtc_state: crtc's scaler state
>   * @plane_state: atomic plane state to update
>   *
> - * Return
> - *     0 - scaler_usage updated successfully
> - *    error - requested scaling cannot be supported or other error condition
> + * Return:
> + * * 0 - scaler_usage updated successfully
> + * * error - requested scaling cannot be supported or other error condition
>   */
>  int skl_update_scaler_plane(struct intel_crtc_state *crtc_state,
>  			    struct intel_plane_state *plane_state)
> -- 
> 2.36.1
> 
