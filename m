Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C90761D763
	for <lists+dri-devel@lfdr.de>; Sat,  5 Nov 2022 06:18:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8B9A10E0A6;
	Sat,  5 Nov 2022 05:18:23 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E153E10E059;
 Sat,  5 Nov 2022 05:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667625498; x=1699161498;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=+jiA9hUGkiK0JgGyxkcnhxmRsF4f2zeMy52xXSN1IDY=;
 b=hp9sR+swcTmRx8SfwvBLX4u9y2U4MjRRj6LAILVkIz1jRjsLWBsCB8v6
 29u/xKNI8HADre4hDGhIhjmxHCi2eXd4wKGQALn9KWcSFMOJtOxXi/FK2
 LQjurN5OYvuGXchgBGXV0lwYb094pCo03tnNT4LVA9Vgtuk5fogSsffmc
 JQEG9NK0c2SEtH8YLXP68axPD76KmD0tqZcjWOC7JDU58dEvUk5/aUDSr
 Hrzf5UUyc2emjRO2O6G2LQpWuuCRpQpVDVtc6l2sUaQQkqT6qrSuY9KeK
 gXzPgv5jnvvJR5/LHkJMBIla3tqY+B/06Gxe5Sw3xLgpy5J/Y6B+oFk13 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10521"; a="293464210"
X-IronPort-AV: E=Sophos;i="5.96,139,1665471600"; d="scan'208";a="293464210"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2022 22:18:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10521"; a="777939577"
X-IronPort-AV: E=Sophos;i="5.96,139,1665471600"; d="scan'208";a="777939577"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga001.fm.intel.com with ESMTP; 04 Nov 2022 22:18:17 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 4 Nov 2022 22:18:16 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Fri, 4 Nov 2022 22:18:16 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.44) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Fri, 4 Nov 2022 22:18:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ciFwy+9EOn7D5jH3clALSnk7dIkZ86oQ4vFhY4+s4zRGTItmxbDvk/soSu2D4UIukUIgXhM+g0igx3NcSXeZhhvp1ag5DIHFFX+mpBRDhGPuN8e50aNc1ZbIk7NjHw2nVWfWcpLTeQn4IEIDTqoGTKlARgxH2vomXm2U3RBzrzvetXLvYW8aUQaQ6cxbEeUJ/9FNKDGerMCy2utn50JGDQLzdhErejHQj+d7bTqpfiREKhHtP7MZyuXyiC0uZeytnrCRH40Rp4pUuoc6cNTbPpZ7AUVbW4BkRuxJXSlD2LMEh35vme+WMqWcsqoM4iB5r0TmmzbgIB0+BRJCYX0Iaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AHjaOXnMpFNu69TPB6AFFBhj3Tfg3/eBDBuYmkrMGps=;
 b=FDbRbsCDNn86v7JCE7sIacpgx4IE99tPaDpYwp/WfapW042M/UHCL7hL+/sjHCH5FXlZ1ff66mT9eJWKUzL+XMagVM5VRY3aFw9H9FZzOgODAK0TOuUlQHWu8PJcoca3YTznKvp6zjEqpuBLlKJOP64f4lF0rEoRHTt8sgyCorPLgzMlv7FyO0P3TD1Nch3kAHRAF6Z69NgwMOy8IE0JX0Jimc0HNfRisolj2QbeaIaeknMbSYa50MOIPlm4VxXWMchzsUhz7x6J2R1Zsyh4l/QYjaSQhHo/t0dJ1rwqJSjsbLRZh+ifrv+9mvlVZ7hJvp1JeU0aGIz61nD9G77PWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ0PR11MB5661.namprd11.prod.outlook.com (2603:10b6:a03:3b9::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.24; Sat, 5 Nov
 2022 05:18:10 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::22:fdef:cea5:e8f3]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::22:fdef:cea5:e8f3%3]) with mapi id 15.20.5791.022; Sat, 5 Nov 2022
 05:18:10 +0000
Date: Fri, 4 Nov 2022 22:18:07 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <John.C.Harrison@intel.com>
Subject: Re: [PATCH v2 1/2] drm/i915/guc: Properly initialise kernel contexts
Message-ID: <20221105051807.sktnewxh7m5qjwbd@ldmartin-desk2.lan>
X-Patchwork-Hint: comment
References: <20221102192109.2492625-1-John.C.Harrison@Intel.com>
 <20221102192109.2492625-2-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20221102192109.2492625-2-John.C.Harrison@Intel.com>
X-ClientProxiedBy: BYAPR04CA0034.namprd04.prod.outlook.com
 (2603:10b6:a03:40::47) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ0PR11MB5661:EE_
X-MS-Office365-Filtering-Correlation-Id: f6387268-2a9d-4104-b3dd-08dabeed2106
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1hCHB5GXOJjf3TAWXEmugMstx9+2K7p+LcrVZ9Tt1vY1Ni99MScw5EAK/Y9LIwNdJiJb5YTWijxXK6soKSmcBYg7dssnuRq9Uwe742XUsqRXSxol4M6Zdln1bZAW5r4GoWrybpSMr3QWTTx7VpJtEosD8qExVR5m83XaMoFoQIZLXAIwHNg2DaPIolUtTkZ/TKTXD+pNiY4a/UjbtHNCP2xneIECXPJoXFU08vOmCeQqD4YgNKkw7OYgoEmVcVC3QZ7dq4eJtlV+WV1F/LCyyF6Y8ZkNKtseowfYECXQEShgwHdFcc2dXVu653Zv2xDuD+CFzURCpkt9AqLqZEt6eP7ju7GfZ0//S+84ecutmC9k0H0Wcdb7Zu8UED10CiBZP0mzVgVu76bvDHEhr+GClIzEaYQWGH4AgyH57QNNKipyUzESMbCap2ltz9AQhSX9CExb+v76pdcaGHY+9G0bZ0wdeY1vz6f8N2uvHyDM9gCKAh6fTrdAYvcBdFz8xmBRwKP7NZ9d6H/mehxR+lEkOZCrMFf8ybQg2CsX8gS0VR0T6+hZsrPRgtIDMGLU1TOyHFWYPSR4dz0XwW7vE64XwGzp9GETdRQjH7wuYRgO+n7pUnhJ6V4TvDg/aHlW1AVUVtfAVgiFZN7LDhgv+VawT88n5WtUP2ByaGP2ft2GUHn2kRc5jMRpgKPw8PKr8uBJy1gsEwMnn9VsW1MPc4HzRw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(136003)(346002)(366004)(39860400002)(396003)(376002)(451199015)(8936002)(36756003)(186003)(1076003)(5660300002)(9686003)(6506007)(6512007)(450100002)(66946007)(26005)(66556008)(66476007)(8676002)(4326008)(34206002)(41300700001)(82960400001)(86362001)(38100700002)(83380400001)(2906002)(316002)(6486002)(478600001)(6666004)(6636002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OuFd9puZHjFHdQtSLZ9NCpB/Kg17MUum/2jB2r4pDDIvQS31vATP1a42XjRr?=
 =?us-ascii?Q?dEz+h9Rc0p4ar9iOMNumV5WyljNXHUz3Gx+0MdsnDDdbkEp1Dmq6JAXGIDv+?=
 =?us-ascii?Q?GedQtUY536p4U2QnO15ZUKnh0cuoO63B/XcfYGlBqL5/Dsbywl+vhxGchkpf?=
 =?us-ascii?Q?p5UZYavL0cir5TKWKghaVm/s+nKRiGe1D4eZWxyjclmY3WM8W+eEHJ/TOjEh?=
 =?us-ascii?Q?rWQm0U41NeCRvJkEWLYU3xwvU1zIzotItWwJVCssZXU56HnMXwdj9tI9ol3S?=
 =?us-ascii?Q?sL+3EUyanyJFfvDcPi2Z+lwgG9qaPvq43QS3o7yis0s20xrLw7TKo2i0DCpN?=
 =?us-ascii?Q?RLiYd475zs+YW3hrH1ZfdlbkFemCAwGWCJvqL7cGp98L6rb/DaIhaFPBqDe2?=
 =?us-ascii?Q?4EsI0MAc6G8tHxxkOaMDG1/Sq8tPB1TFTjarlmNsKTVG9s7Br9dujyo0KmIw?=
 =?us-ascii?Q?o39RR40AlYnycTy0CP4HwdMTa5DK7n2icKbFJuYDOutUqMWN/5dZC78vIfuB?=
 =?us-ascii?Q?G+42an3X3/PLewrzs9bFvZuALlGTv9gMy/1G2ngW9vV3vzQq7+IkBEFVvYc/?=
 =?us-ascii?Q?34IYfyXOtcpN1V64pI3Ct9NLeP4jvmOWfaYzVkScfC0AE8TGy9JMj7YU3nR1?=
 =?us-ascii?Q?Db6eDlP3t3ktXSGpNTkzf9OyczSwyPPNlP12O39WgFIVAOuZ4eZu3aE3wTQU?=
 =?us-ascii?Q?oeoLRy/3EixNl4vfvYsDUT77jmTn+12K/afDCYAy1/DIZlrYi78fyb5z9iGz?=
 =?us-ascii?Q?LIoeWlrb12k57QDSCWg2UN8uGw3KsTMoGf7Azh5ok5AH4B9/+1Rp8yAJBbF/?=
 =?us-ascii?Q?MIDQOcuB0FZkan8LOx+YEYwlAMBk8T6T6N/pBvU26PfZ+UQljbGx1dvBDw64?=
 =?us-ascii?Q?OocG4Wn/lP0dkMy4GdX5a8RCMX1zFQjmoJmguwsxd3uCAOLits7GkYK8Y4FE?=
 =?us-ascii?Q?ZrOOOXwiJXqLMHyaUKTIR7oC3EJ4BEouMAOiMlTbf+djK4DVFB9f4ujQBQP4?=
 =?us-ascii?Q?2Bwzpw1DPss5t1FycFZeGp8+4wn7YWd0zrD+WS9CRFVAqD2niIu83hLe3K+m?=
 =?us-ascii?Q?O2CQg+ltP37UrGz7n/VX3iBQ0OZX6vnYFEnGhAGVFu/u7+JEddWuVoQq/2au?=
 =?us-ascii?Q?AarQnuLBdeYC+72AyjENCMwSLsrMOIG2tiaMFkppdcI5videge1zbYEWxLpE?=
 =?us-ascii?Q?8ROLbUl3SAXeA7IpIzYYyNv1AyKoOu29nqHA4LBNrIzZUnlrtmfJ1TCceRA1?=
 =?us-ascii?Q?w5sXhSo7q3rWgEDsL1rI8hPsL6v3Dox9iUB2iEfC8SazB+iXX9iXh07skIYy?=
 =?us-ascii?Q?GBOsnsWwebmiz775iN2aFZbgx8HKXKMLqLMG/R+EfKQkBfco8fEhsKyCFlZ/?=
 =?us-ascii?Q?ASNmxmiYe/GRuOSpN6taGVjoze0LCLDpHsLiPGW+bcb0CJFFG+6JDQXGxpoB?=
 =?us-ascii?Q?LRfZCDWidhWBVvZ1DWISj3i6cOpjpOVfBbQ7EfH8RsCyml9aVuwiEx9QlLo+?=
 =?us-ascii?Q?sNfb5ZiMrNpLXVQblU2fr0TWgiBdg8a5E11VSqaO7EHCjL2PJm9jLKuqJqUW?=
 =?us-ascii?Q?R+BkEutfUQKK96OUxKVZaaoibGrrdHp13ICC3M9HNNWIKdz/GAamdaKNbE/R?=
 =?us-ascii?Q?2w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f6387268-2a9d-4104-b3dd-08dabeed2106
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2022 05:18:09.8991 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JX9vprp4cxAdWuIg9l7V2t7nLvI1y1sHR+gakgj7hLexqRl44l7a2HbohFK3mkfcQrZT5v8D0SfBdUuOJGnyxeOnnWMW5XpNa0ufdqgoIBE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5661
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
Cc: Intel-GFX@lists.freedesktop.org, DRI-Devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 02, 2022 at 12:21:08PM -0700, John.C.Harrison@Intel.com wrote:
>From: John Harrison <John.C.Harrison@Intel.com>
>
>If a context has already been registered prior to first submission
>then context init code was not being called. The noticeable effect of
>that was the scheduling priority was left at zero (meaning super high
>priority) instead of being set to normal. This would occur with
>kernel contexts at start of day as they are manually pinned up front
>rather than on first submission. So add a call to initialise those
>when they are pinned.
>
>Signed-off-by: John Harrison <John.C.Harrison@Intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi <lucas.demarchi@intel.com>

>---
> drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 3 +++
> 1 file changed, 3 insertions(+)
>
>diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>index 4ccb29f9ac55c..941613be3b9dd 100644
>--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>@@ -4111,6 +4111,9 @@ static inline void guc_kernel_context_pin(struct intel_guc *guc,
> 	if (context_guc_id_invalid(ce))
> 		pin_guc_id(guc, ce);
>
>+	if (!test_bit(CONTEXT_GUC_INIT, &ce->flags))
>+		guc_context_init(ce);
>+
> 	try_context_registration(ce, true);
> }
>
>-- 
>2.37.3
>
