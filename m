Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 774ED6F7700
	for <lists+dri-devel@lfdr.de>; Thu,  4 May 2023 22:29:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40FB610E51E;
	Thu,  4 May 2023 20:29:46 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80A0F10E51E;
 Thu,  4 May 2023 20:29:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683232184; x=1714768184;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=XzI5tNsQw0Qm5yjVc/V3GzBQ9/+enMiSRH8TVOnptmU=;
 b=AOJKaXO2j9aTa9MdnEl+dUNv2zLR8MJfl+vIGr4+d0+h0TYTAR3/dlEL
 9jFib5YBzU4C8O+ofyeGp5dfzmKWqnShntnK0LprbiHW5yvM5uegX4xmJ
 UzFbwITdbW/sypkpMNEV7od4IdGUpESsRVU/vRTS1WpxToLagnxk8fz1H
 krIwM+Ooz2/0D6L3SEy+wqqP8xegH7sqX4wc5y9VdPVIYfI4f3WA9Fq29
 DHP/3yd0J9OkRBMmEXkSJKu1EifPQKWwhW609nG4a2zNd5AfypI/XeaVp
 oHJ4NYSksFNC0oCnnJ5Sh7H0McioMRvYwAXZJZc7cAosrAZyrnzH3WKf6 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="328674540"
X-IronPort-AV: E=Sophos;i="5.99,250,1677571200"; d="scan'208";a="328674540"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2023 13:29:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="729960774"
X-IronPort-AV: E=Sophos;i="5.99,250,1677571200"; d="scan'208";a="729960774"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga001.jf.intel.com with ESMTP; 04 May 2023 13:29:43 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 4 May 2023 13:29:42 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 4 May 2023 13:29:42 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 4 May 2023 13:29:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nGF0GqTH4wymp5X9Kty1CeTzIMzX1Jlvbe3e9TPzWWdMh3PSGwgJ+Tlpanh1/brx2FhlQ2/uMr7uZnz0pt5p4GGkN4wEK31050LT7QOiWtisoaFtOoNlibbDNgzKj6MvssOQMNQvdhBjGaqPFkxPuuPCbzojQpPTnBCaQjrlV+uGZ7yjhxkRNBcBx1nI5pYuZZodswhxLhGTBSTHoCYnU5wBjlbZPBESzt7mq9VczcTY8d6ywuQ9urSBVMAoYqMEjFX+SRDs0aoP6oEN8kXVU4HTQR3Lak7Eo0M44/HuH4xF1uWixxvUqnIZGvQU0RnI5EAJCSO1LlxQ+fVlXuCilQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=23cflBMDt87xCgxsJFIwU2m5cNc2tkbK/cA/KtKVTDk=;
 b=TDF58pL8BzITgrB0ZVrpclDaRv5Q9QmPFH51D1RO0tD5b4xdfYn4p/9Wnx7bCe+kY1ASjqe+CuVC41vh1yucsclce+KSuqb29aMZg9uwAYr0iA87cjPHoRVQztDy8qdgmPQnngDeQuQ784/PIaq7Fc9nptXxlBd235cch8tTp5hkKHWlggxcoNlThckjqLBbvuZUNeK99itZfPajJW8hawHLX7/0atqg1BWVxysYt5pxGg7UC2V+vtqMCgG/n0wN11Erb/YzHlukKcgltKBdZ5L8BsomoumnZZ/e/qkzBK5L1CmO/w4+DTtQ3bKHYewvdF+OrDZMwrzCUxyd2sHFNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ0PR11MB6574.namprd11.prod.outlook.com (2603:10b6:a03:44e::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.26; Thu, 4 May
 2023 20:29:41 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%3]) with mapi id 15.20.6363.026; Thu, 4 May 2023
 20:29:41 +0000
Date: Thu, 4 May 2023 13:29:37 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <John.C.Harrison@intel.com>
Subject: Re: [Intel-gfx] [PATCH 2/2] drm/i915/mtl: Update GuC firmware
 version for MTL to 70.6.6
Message-ID: <jo3pp2ew2qsckcrn4lvrkmhfilve6gjr6vb2iiof465dhj3uus@fppfx7jwt3q3>
References: <20230504202252.1104212-1-John.C.Harrison@Intel.com>
 <20230504202252.1104212-3-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230504202252.1104212-3-John.C.Harrison@Intel.com>
X-ClientProxiedBy: SJ0PR13CA0021.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::26) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ0PR11MB6574:EE_
X-MS-Office365-Filtering-Correlation-Id: 830a1e9e-ca43-47ac-4a51-08db4cde49d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZCM2aXeJGPDQeXuXiNYte3ZQ1ti3S6/HjVDiAOHwPJ/gIktPKKFW6tca1z0+UIqYuyOQzXTDvmbrbif4K7PWb+6XreUeURpu7sjdv8mw5/gI9QNP/rWcB6/ezIW+x99fmvy+0bl03vYosD3yo9HfvdeguXs//XxwOyJxWJvdXsJ717+FSCb2xwNezfbQyydDQKxvpFC+Qq9jr+IP67WYSC0JIXFzj4U/OCyOm/qQRJ7ls2/cwf8FL48t6WZa7I2dBLIPVtd5lCwiJFOPjsgRdqqTT2+6xPFsL91S8jfaDmsiYQaVCPPjD46HAWXwO6OD8A/Lp3TaVbnrwIx0s7elyWAOZnH8bZ/m8oGWT1LxIWVPKNSbKQCWohGUgeXU9s6q30UHoEApWdJI6JbRiFHqwws/nEY/fn1RBx9d7O9bPPPZLkLDfo1yXS6JzgzKDEX2C9gMg/rcku6yjstOYIdP5fIQfXmowHkHx7kMDPXKyt3OjnjCeRHA95gw/T51Z+keRzL6qMbrePdIDff5zcwMRnT0vZFLkRU/W++mul4zrEG6ns9VDJVH0LiOmydf4QKy
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(39860400002)(376002)(366004)(346002)(396003)(136003)(451199021)(33716001)(38100700002)(86362001)(186003)(82960400001)(83380400001)(8676002)(34206002)(8936002)(2906002)(316002)(41300700001)(6666004)(5660300002)(478600001)(6486002)(66556008)(66476007)(66946007)(4326008)(6636002)(26005)(6512007)(15650500001)(450100002)(6506007)(9686003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?r0cNFTW7aGdPkU4z+Bl0fglInaVCrZ1cZ2Rs+EI70JOqY9t7z7vfEFmmgImL?=
 =?us-ascii?Q?AGJrZDJUm8QOFDmWZXBEDqvutYehgaGbc1pUqQBjf1uOwGOU7edoPkgxDql0?=
 =?us-ascii?Q?t1XU5A9hCLiqsHXfIQpvEu5qFgDbhe+SYHg90tz5RBQThmrC/W9bkrLZNYZK?=
 =?us-ascii?Q?10zWePSXqihCxWmBY5Uwoqt2XVjq7sceiEPz5fYU9NGoyUvSpSINarWjUge2?=
 =?us-ascii?Q?SJgRxxFfWAU4IZA5dYD0RRpYcWoK/eCy7chBB5gmGOvMFcyZdpPljzVRy7us?=
 =?us-ascii?Q?67CZqAi3rKJ6RNKIxJCiassHcbXnyEjfKeh36h2E81sREHpCRuHQ3ahHVv5h?=
 =?us-ascii?Q?edZitqUSsrfJlHf0Kk0Pgk3FHBAE4PKoidGg6rjngWOvfNRd1zrdTAwLopK+?=
 =?us-ascii?Q?wjxGAtlrYfad/Nyi+4Znnt3hFxPpQCP4aObfRsi20d01o4kG08O4ZHhttIRW?=
 =?us-ascii?Q?GNhudy7mWpCMxJnu2QiH8PYkvCAEX9TjBqQvS+SFmMfyJ6YJ5jHe50Tg80Wq?=
 =?us-ascii?Q?qXT3KsxuBx54psVTkvmcUflMrZqpINkZ8uKVymi81wc8cLwSsG+NlkgeQ0Kh?=
 =?us-ascii?Q?H6dvgNA1YBjwcQUV6mw6N5eLZ6kZdgITwxscCDqHByFycz7ClXDIDRz8VbVd?=
 =?us-ascii?Q?JFZipmf7ANODZ9m0xaQBZM8FRjFllfQvij4K6tlxvngiJElGqo1YCMlp2YSI?=
 =?us-ascii?Q?G49hxDpfUkbxaCT1nxKGmZA6H+AhqScRmnuD71iStKttIXhgRKj9GZVnEzAk?=
 =?us-ascii?Q?0JydVTbUsoOJjR+VOUhHpUg4uy4uSoz8ApVp1ri2RlE98BLD5XKw6cofdGw6?=
 =?us-ascii?Q?JOm0v1oO8/LK8+0V8jIRGBu0pWzkbQiOhkmHlVwZjIRhY8c9vv5spcB+w5l4?=
 =?us-ascii?Q?qby5BOfCkMs/5m8LJ91nogQHS95ZAzGh269fdJ+hXoLA5MC8z6wKkYTuUfK/?=
 =?us-ascii?Q?47hv0HpPqCm/3hI+Dlkh3AsosMbHfPoltNOSUESb2d4fRuodfb5W+K3suFT8?=
 =?us-ascii?Q?Ug876x9Xr2m8yfn8qYUQKPqpajPBBJQ+2ww9ZzFozNuZ79ybRJhEaBgTd43t?=
 =?us-ascii?Q?DkmS2fIEow/9wMJBx5I5Aie2O0lJO7ZOGhA8oAJRqSUK7a/HjVveKOemZkvR?=
 =?us-ascii?Q?W018PaGJF5/synBh0fwv0+uwyhAmdMpMr6TAHYp42yLVA145I9+SDjfXRNCP?=
 =?us-ascii?Q?6SpmqwwD0J8gBoEB/hZzKBg+y4y5KUq7W9hJpHbybwnUCgk/rIwWb5bVJ4r+?=
 =?us-ascii?Q?SOgjNrzzIrMWEJZgsluVoeXX7gCPJIp+0cwC1BNA9B73eZIq8DqLGeU+/tD4?=
 =?us-ascii?Q?Eq/oyxDU/nZ7brHXS2YFC3t+O9hsevdP65BhpDtDs5QO3t4+IUYq3M30R7EZ?=
 =?us-ascii?Q?dUmEv54Yq2Pij8U0HznFju+7DFbltNDT4qdGXRcSoVqm8P9CvoK3RjOrIkl3?=
 =?us-ascii?Q?pK8kX7BlWi1dXM3gz3GQBmaC5KVGI7ytoZwwKEuR6jaMWKy0ODbSJPnPUALN?=
 =?us-ascii?Q?B2FXKP6Gf/Gv+iWs3FLe0sYzYRqokCDRJvqx8P29fql7Z19yQ3wRs63ozV6z?=
 =?us-ascii?Q?1xn0XrFqAGijCozejOw4DAjKVAHBwJzj9n3AjlZeJI7I0VJWrzoqdAyyykB4?=
 =?us-ascii?Q?yw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 830a1e9e-ca43-47ac-4a51-08db4cde49d0
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2023 20:29:40.9576 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d0jodjUL+A7TdKw7s7Cnh0ot7F8+iplhxD1xa010HNeEm8TFO7ojLu7i1KAezybJCJ7LKR7rtJmJEPBtFdKWDyxwhVTxrcFtBiMEmoQyffc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6574
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

On Thu, May 04, 2023 at 01:22:52PM -0700, John.C.Harrison@Intel.com wrote:
>From: John Harrison <John.C.Harrison@Intel.com>
>
>Also switch to using reduced version file naming as it is no longer
>such a work-in-progress and likely to change.
>
>Signed-off-by: John Harrison <John.C.Harrison@Intel.com>


commit message here will be bogus as it will be the first time MTL will
actually have the define.

Better to do it like this:

	git revert 5c71b8b8ac87
	then this patch, with a better commit message

or I can change the commit message of this commit while applying to:

	drm/i915/mtl: Define GuC firmware version for MTL

	First release of GuC for Meteorlake.

	Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
	Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>---
> drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
>index 55e50bd08d7ff..10e48cbcf494a 100644
>--- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
>+++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
>@@ -79,7 +79,7 @@ void intel_uc_fw_change_status(struct intel_uc_fw *uc_fw,
>  * security fixes, etc. to be enabled.
>  */
> #define INTEL_GUC_FIRMWARE_DEFS(fw_def, guc_maj, guc_mmp) \
>-	fw_def(METEORLAKE,   0, guc_mmp(mtl,  70, 6, 5)) \
>+	fw_def(METEORLAKE,   0, guc_maj(mtl,  70, 6, 6)) \
> 	fw_def(DG2,          0, guc_maj(dg2,  70, 5, 1)) \
> 	fw_def(ALDERLAKE_P,  0, guc_maj(adlp, 70, 5, 1)) \
> 	fw_def(ALDERLAKE_P,  0, guc_mmp(adlp, 70, 1, 1)) \
>-- 
>2.39.1
>
