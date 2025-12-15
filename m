Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84783CBF861
	for <lists+dri-devel@lfdr.de>; Mon, 15 Dec 2025 20:24:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC13910E4CF;
	Mon, 15 Dec 2025 19:24:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m/MlechF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95FE310E187;
 Mon, 15 Dec 2025 19:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765826651; x=1797362651;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=fk5hAcbO+sbnvtfEQleremgvSQispexfa7GFYH/aPYE=;
 b=m/MlechFRdbgS6224kjCOZiXXECOXxMfUO27Upahig7adFEKob0s8GfG
 7kIvr+N7AsrFKt8bUHKofj9nG0hZdTDMWg6YUImTjlHZfTgmzdhQWRDE5
 xRexSZ7jEUjpeDHc5U1GGq3XqNo61WQm79wlBAb1BcLJllJ6yLmfpOAkX
 VTP1gvoVrwqTL7dk8WVntvdAeldEwMR6AV0bXzzayBQN+5At2qI2nfj+B
 7WsDStlh3r5KSkpsVzW9+tKA8Kio9s/2cUlfOPbWfJSZ03JpXd0uB6Vex
 4nqUMMmge602AHrAtZlw+WInZrNMyTZXwH3fH0xZHmoep07IX5GUUxN04 w==;
X-CSE-ConnectionGUID: hLx3weJUSi6UHb/Qyvra0Q==
X-CSE-MsgGUID: xY2k4CmaSy+8ZwsioerNUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="79106218"
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; d="scan'208";a="79106218"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 11:24:10 -0800
X-CSE-ConnectionGUID: kJblv8k3Si+T8wmGVk6JcQ==
X-CSE-MsgGUID: 12nwM+vuTjaPZfR4GBPYvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; d="scan'208";a="201986980"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 11:24:10 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 15 Dec 2025 11:24:09 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 15 Dec 2025 11:24:09 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.70) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 15 Dec 2025 11:24:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jZf3wr6Xt6Y22kGBIl+VvZv8OI116C48b2jM+YRJiKqcH5yPaVstXyjO2MiEPzNdaq09vARjEeE1a5jULroSqCRx6lgS/CrWE0IkNU6MejQ0Ozf6is/cqaSsdH5P7149OM6QAS2T0JmvptwvAX7If3vR2jCgcG5Z4smmbUo486emxUMbLMWAlJzJSekHDYRVfqjHnvQe3BC50lAPnt5H2ud+yY85smCtJVbu0mMPp8tYChw0BILiqzenVY8w9t8psG4mLS9ZeOv0ehKIKqlHSSx1YLA9utkISzqwXDH/cPCRA6XUO0/znZnW3zffd635EDWiTpfzGyffG/pEH7Og7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=infgX+aUx+qDoTdL1VIgCj3AvcPFKFaA+1ADtnUAMlQ=;
 b=OmYd/yFtFShzw0ffAIW71hU53YBAX4qD1h9bdyjUKSCTEv1ZdXFDgsy9UdejeoUUZkaY0DU3jQjkJk3ToLaTVighqgh3Z2fjsZKcb1oZjdRWrV0t/2ypQnM2RCXYAA991wpsiToLiEJ9g3xKJ29r7wZbMGWTD9xZTt0Z5BttUDY5T5lTJTFK3YiYQQY5uVfC2i1NgXMFQg7w7Gy9fwJwYVktdoma1qj92DgE2LJ8s+5OkDGP1f3FKqNyXqan4t2NC/LIqng06YytQsAgzRFzV0qMj8gwg/gMXlnHRTYL5UjruYRpjKmaqUh1mauuY8w9EhasB7oHb1kuIResaVq9rA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 by PH0PR11MB5128.namprd11.prod.outlook.com (2603:10b6:510:39::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Mon, 15 Dec
 2025 19:24:07 +0000
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f]) by SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f%3]) with mapi id 15.20.9412.011; Mon, 15 Dec 2025
 19:24:07 +0000
From: Imre Deak <imre.deak@intel.com>
To: <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>
CC: <dri-devel@lists.freedesktop.org>, Luca Coelho <luciano.coelho@intel.com>
Subject: [PATCH 03/16] drm/i915/dp: Fix DSC sink's slice count capability check
Date: Mon, 15 Dec 2025 21:23:43 +0200
Message-ID: <20251215192357.172201-4-imre.deak@intel.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20251215192357.172201-1-imre.deak@intel.com>
References: <20251215192357.172201-1-imre.deak@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0093.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bc::18) To SJ0PR11MB4845.namprd11.prod.outlook.com
 (2603:10b6:a03:2d1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4845:EE_|PH0PR11MB5128:EE_
X-MS-Office365-Filtering-Correlation-Id: 5528c996-c70b-4f0d-c252-08de3c0f842e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|366016|376014|1800799024|10070799003;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?DLE6AOGXwv63EX6zG0mZf4VNftk8KygCFy0hHzCK89A17XAeWfGbn2zlAida?=
 =?us-ascii?Q?bNaH/auNjUg0LVlnCt6oBAjDSQGGTuiWzCID3Yu5HUKuzBlDvBiI/dVO0qgl?=
 =?us-ascii?Q?ZpjViWeRmvVlgyL84IXM4Tqxz7MIye1RYg6urNXIZf8lwjVqs7DbKCSXiftv?=
 =?us-ascii?Q?m2NTXVE6gygZhzNkP+QkXokFN8/dQ+dnApD6u42Msk+lvhkO2nSjOoNVAcDS?=
 =?us-ascii?Q?2tqvDMXF6TwMqRB7P/8SCeHNCmwuXwhxpUt+heImlNNuiI9DgsoC4CrOs5/K?=
 =?us-ascii?Q?8EYPgo2c5+F1qY3NFtLbYPXTKE+GJMzFciIaIUq/ClPdwHn8FC0Cfrw6cvow?=
 =?us-ascii?Q?R3xh8LFlNdCE6MBVs6CvkCZjZfL0uQUQKIGH0L4hWsewkGcO3FlpP/oqsDCb?=
 =?us-ascii?Q?qicbF/ebmLEqqWu1A2Ap/DOLpnE5Jo/EyKFswXSuXjn6/KBBJiBU0FVcbOwG?=
 =?us-ascii?Q?nPTt1n4jitetkLMlOa748w22UxbkKGRGUG9oJ59KgD49G2hnwQkygSs0PvwR?=
 =?us-ascii?Q?ixbdq4U8R23cPi4JLc56/aJIeUVqk7a7LCfDp9zDvwnGSsQ6ChdaLY9LAPwJ?=
 =?us-ascii?Q?XVDbNuixTC4qsuI4lXGreoAAwEiBPPcnrjUuRaUzzAC8UdjzEDQZsV+/tOpy?=
 =?us-ascii?Q?1Pp7GxUKzKJXtgwPzHES7om1DgQlWlT2Roa8m6H0WHA8ioYanRKwy0Ib2Pkk?=
 =?us-ascii?Q?igAooFcEult4HwALHddf4B2vgSBpa4nGK0+biORvqEwEvY+ycsVYzD54q/1S?=
 =?us-ascii?Q?EWNf9Ky7PiiogPA+u0A0i3sm7gIGMtxzSVqwmXBaLIqfQoybrnZm/hHzDplR?=
 =?us-ascii?Q?vm3SfzgO9oS/TUzN2CVtr/KO7VlPXPbA9fiI/tDkILK1KdPHD8/NCAW7coaj?=
 =?us-ascii?Q?73KMd+pPhjgeB5l4mAx7QmVJj+y2GF1lcAj521z4BySaTenPwP6uxvH7vqiw?=
 =?us-ascii?Q?jPRgYRNn4TM8l7i8gEdfb5JDNsUMQUHsC7KCqwjR2biYsJ+j44kmYbvBBWof?=
 =?us-ascii?Q?SCFgpwYwMIQuJIq6u4HiOIoatykOVTaKqvunuhXYB/K2+8gtXuCsvgyek0rR?=
 =?us-ascii?Q?q/I5fFq/jeS85R6zhRat2VVxmdUGWgO5xG4GWQ/xlS3LC+UzfKqeYYTUX5zt?=
 =?us-ascii?Q?mXSmGT6r4/mRy5GBe2lLRubx2rV335mCVjukCooWEzynlm04ClU3Wt3P3DQH?=
 =?us-ascii?Q?iPdTvNNtlskBkvaIIgh0fOi1oAhmUWSh3GLlqq/gRaBCeR8OBHHM7vBNnayU?=
 =?us-ascii?Q?zdDusdi6iCRFn/zqh7JuA0ujB6/xLVBTXIQFoCsh7suGk16F7/JfZWt2/4UO?=
 =?us-ascii?Q?FKV1oIqTNfMcX5GJzv0kRga75URnsiCaPp0OCOM+Vigr5/eG21ZyMPsnDrRu?=
 =?us-ascii?Q?d7+qJLQXM+mdfATh/MyfD3DKWpxNE2pFXFu2vNn3VMAY/u3PUZQ46fBfv9L/?=
 =?us-ascii?Q?P9QsZ/UdGzHTulphLaliFDxnAAMatXZA?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4845.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(10070799003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ztjv/Kj0Pju8ILvhZdiVdm5b89cjRQKfpPt4UhEJ7PtudauvFmnUogIR+wgy?=
 =?us-ascii?Q?ElybFSOkbCA+Hs1g5k9rNWTbpHBT/ZKKOZRXTuO7B7dkzGPtNJ4ORK5bR/+W?=
 =?us-ascii?Q?yEoaoepuhMvjvo+yvXiXE5mhRUfBg+WC6fn4L3zJUojtAHg1OclEOYfhzSV8?=
 =?us-ascii?Q?3fb0Kypn6d4qQs5UzIhjpk7dKfiaQMpzmAlVzpbatwgY6MZQkuSSwAbBMEXi?=
 =?us-ascii?Q?LKIJpsTxHFSTX1DbAMl0CgwZw6tPqXX3dbrAOBLAFAeFUgpdPlo61bkw9WSL?=
 =?us-ascii?Q?Z7DcSMexlXN8u1iCiZ6dtCVPml6kkCs6cCeANRe+bw+hT0muWALeQIW/Dyh5?=
 =?us-ascii?Q?ZiNSkJi9KCt+keoWHdU09G+FFKlUTmGOn9FewuGfMJ7F3DLIv8POvxNWNsc5?=
 =?us-ascii?Q?YOcHXrpg62KuTkswlqSQ/jX6KMv1NBnXgvjI4kLoMgv5XRW4STxGcAEFFI4H?=
 =?us-ascii?Q?7bUGsRqwDGdRkCKTsJb1vqR/O/1/sBtYWiGFyttSOvqeimJLE5txa40p8Ehe?=
 =?us-ascii?Q?S6Jcjk4ey4rDIbae5E8h54LVeTP/NOIGxVUXWS9NEp/Fa7oxrST5JdQR93Gc?=
 =?us-ascii?Q?6eomvlvBRuY7rKQlZumoZy8efH+IqWhp9nnE14gaUEuk3ux4OYc34ORUGg7M?=
 =?us-ascii?Q?eUS+cE02E//vKQBWV6x/GFqFTK4qe2EHShThTNH/wZ/g1wALiPhlMtjJpO9+?=
 =?us-ascii?Q?lmGZCWZI+r7h8WtrBd9VYOp47qKkG7MrGmQeinKcROonrhuQrdtFZb+u9PPd?=
 =?us-ascii?Q?96ebDz1g9fBOV0sd9n8m1xw7zcgOsDgul4BfY5dlBMB3kEY7n7LOgoNYIEN1?=
 =?us-ascii?Q?S5jR0PJ0/g2UHCTx1aYpS7fyX0Y++LW5yYv9fw09DuXfseksMGmOFZuBh7Fv?=
 =?us-ascii?Q?Db4gPTiJMtQk1N3SBELi+60ZKnoiiu6SObzgt5O3qXUkVNgXjnezRUN++lg6?=
 =?us-ascii?Q?skVEw/BOrVxZ2HxpZ62txq6LAEQBh5i9LT6ncAM17t74tnW/3BBxmOogA2mK?=
 =?us-ascii?Q?vM9LVfG/ihZS+LexeaoveYDYDDpaqdLDPata5fwKSxK4Of0f5xq4z9ScJ/lT?=
 =?us-ascii?Q?ZWwafZGpq0sSqiOgG3m8Q3mwNZyeDjWWYpXlTBswcGjyYtwawWeBF0RBg15a?=
 =?us-ascii?Q?t1vlwumj4VCmlBfd0W7uDsD/BRTtDuk9IKSNZl/8GSxF7hb6xGsMQCAJpN1e?=
 =?us-ascii?Q?Pc+XC0l0/ygcnM219UU1Tj1uOX+Y88o1wkLYEiDGnGtiQ7f0LyetgnJDoRsl?=
 =?us-ascii?Q?tgqzk0ZJz0Ej8Z00lFWfAMS1lQlBkGIzTfWjfcp4AwjCfKF7+qFZxOKHcxfw?=
 =?us-ascii?Q?9NmJmcrAhY8Guf7Sa7/ZtZIDlU1V7S/Vb1wTQAM5oqz1Hu4ve/mtf2kPL9Bz?=
 =?us-ascii?Q?/LA6L44hyxRimsohqJ77RrdJcN+k28gw3U01YTqTvEaOBhSkUU5F883Q3gh4?=
 =?us-ascii?Q?/BwA3WEgaVJfLYw60WxoHsZGitDEO3VEiEbFO2x20Vn61lR0wzohDpL/ztcX?=
 =?us-ascii?Q?HRB8uk4/skPUau12mm3nO6rH767DJx7p3jTyawXWTtXo1Ad6b0wR7XYB1LgO?=
 =?us-ascii?Q?mNtzpKxefXWETmn5SM/WBYzAyMILOj2nhogWwCgWe4FydaO5+43/slL+Gagg?=
 =?us-ascii?Q?cHx9qf/F2dqQ+HD4Nws4H4LzrI+efjGWbDYXMd7vbX9a?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5528c996-c70b-4f0d-c252-08de3c0f842e
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4845.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2025 19:24:07.4479 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xIEjy4AgaNQbPMNTs/13b/i8RERJ5pKQ/GnondfrN7He8W36b2eQfyw1g9PZejDfZyGC/2i3U9w+1rZkob6MXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5128
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

A DSC sink supporting DSC slice count N, not necessarily supports slice
counts less than N. Hence the driver should check the sink's support for
a particular slice count before using that slice count, fix
intel_dp_dsc_get_slice_count() accordingly.

Cc: dri-devel@lists.freedesktop.org
Reviewed-by: Luca Coelho <luciano.coelho@intel.com>
Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 4419954867455..892b0f8b5b39e 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -1013,6 +1013,8 @@ u8 intel_dp_dsc_get_slice_count(const struct intel_connector *connector,
 				int num_joined_pipes)
 {
 	struct intel_display *display = to_intel_display(connector);
+	u32 sink_slice_count_mask =
+		drm_dp_dsc_sink_slice_count_mask(connector->dp.dsc_dpcd, false);
 	u8 min_slice_count, i;
 	int max_slice_width;
 	int tp_rgb_yuv444;
@@ -1084,9 +1086,9 @@ u8 intel_dp_dsc_get_slice_count(const struct intel_connector *connector,
 		    (!HAS_DSC_3ENGINES(display) || num_joined_pipes != 4))
 			continue;
 
-		if (test_slice_count >
-		    drm_dp_dsc_sink_max_slice_count(connector->dp.dsc_dpcd, false))
-			break;
+		if (!(drm_dp_dsc_slice_count_to_mask(test_slice_count) &
+		      sink_slice_count_mask))
+			continue;
 
 		 /*
 		  * Bigjoiner needs small joiner to be enabled.
@@ -1103,8 +1105,14 @@ u8 intel_dp_dsc_get_slice_count(const struct intel_connector *connector,
 			return test_slice_count;
 	}
 
-	drm_dbg_kms(display->drm, "Unsupported Slice Count %d\n",
-		    min_slice_count);
+	/* Print slice count 1,2,4,..24 if bit#0,1,3,..23 is set in the mask. */
+	sink_slice_count_mask <<= 1;
+	drm_dbg_kms(display->drm,
+		    "[CONNECTOR:%d:%s] Unsupported slice count (min: %d, sink supported: %*pbl)\n",
+		    connector->base.base.id, connector->base.name,
+		    min_slice_count,
+		    (int)BITS_PER_TYPE(sink_slice_count_mask), &sink_slice_count_mask);
+
 	return 0;
 }
 
-- 
2.49.1

