Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46661BAAA86
	for <lists+dri-devel@lfdr.de>; Mon, 29 Sep 2025 23:44:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D205D10E13D;
	Mon, 29 Sep 2025 21:44:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a6eiqowK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E566110E118;
 Mon, 29 Sep 2025 21:44:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759182278; x=1790718278;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=RkWCc+S+DqYT2XCkirr12Lhrk9Em+YKmpCCz4Y61QsM=;
 b=a6eiqowKj7op9vhBx88HfjBU5ncxlHsIyU2osHx01496B3Y31/7RaoHK
 QE0/0XRyWl9Wsvp5Q4ojrgaexG0GwcthLhERkhCBonnHAPfdWStrSjHRR
 b0Pbkw+MTWo0qIoSHIe2SHnX3KARQroiOqwMyTbRsm67H3NHxvxImhPRk
 i1iAqImCpCXW9L47lA+9sW6glzBbPF0xqiRTLvS3KHavGTHF6iJQL3YxQ
 WItxdvF9DxOxlhDo6RIZviKK1dlw7O+8HnRbOPppx2CiLyTlyy8ptxp34
 e9SrpCZRsuLxH6a81fccmSx96mlHXNrXtLsH+jooayFJAFsgdJ/vYjs4d g==;
X-CSE-ConnectionGUID: iJlj5R7jTzelpRCwduQK8w==
X-CSE-MsgGUID: UDyvUYMiRGKlocVOwqH2Rw==
X-IronPort-AV: E=McAfee;i="6800,10657,11568"; a="61320506"
X-IronPort-AV: E=Sophos;i="6.18,302,1751266800"; d="scan'208";a="61320506"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 14:44:37 -0700
X-CSE-ConnectionGUID: HPA5DBpBS+y2gFhGQQUHsw==
X-CSE-MsgGUID: kCqbYO80Sn2lApRROEWICw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,302,1751266800"; d="scan'208";a="182363083"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 14:44:37 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 29 Sep 2025 14:44:36 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 29 Sep 2025 14:44:36 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.66) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 29 Sep 2025 14:44:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nhMVEZM8S++Z2xzlHXe2M96ncpyby/KJd+RATEFX8c1GlIJKAugD5p/nFuNTUCqWwt8qF4PedibB1iW6oCP8qTldLm7Whdd2/pOI9mlKI8SHCTFPJhmK+I0FMCRAIA3utIaai2I8yCC4rArDsdgdCY5b7N4vyzE4hS3VZdCq9tGg3Zk/RNS+Zh5cTEC2eKPg+RLpTWBk9Ge+rQTNi9Sip4AQGgmLL7X7sU52x7d51dTxUiqdYuDGZYqF8nKiNYIGJRDiNeC8wHJXdUteNQ1fnMSb9xwl/8dyutn/nGHWJy3yFnfG8+D8OZureVSq7MCdc/6W+J+/GqeVyCxDrmnvfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tIRJzbSE/CyTsvqRZY0lrrEHHGVZ5oOmmC5rGJApI4c=;
 b=P6J6IscD37I4tkxkxhCy/RDh68ZeBNw8hst3zbp0aiVuItNWXLW4zDdr52eYpXvWWswRr+NR7rq7lt/gydPcIFdEkiCxTvrZMr87dxiVEWvzn/bOVZSfNjvG525C8gz5anLwaqT/sL9PMKvDgKjyWKTKMGaO+xh3d7LL/A85YHB/Z9guJZs09qjf7XU5ObjAZ2HnZdwYvVEzwQQOVdliPG9Jy4WicuvNWFYckLCYxjnVzl6qvfjNRlSXGbPbNy4mwCF1a3k7R7sqlas+y1Ubf2DxTogif54wtg2yJKm4337jWvmilxu3GGZcrVSwO6vbnmxi2bXHMTEk2OjxOBU4Gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB8427.namprd11.prod.outlook.com (2603:10b6:806:373::19)
 by LV2PR11MB6069.namprd11.prod.outlook.com (2603:10b6:408:17a::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.16; Mon, 29 Sep
 2025 21:44:34 +0000
Received: from SA1PR11MB8427.namprd11.prod.outlook.com
 ([fe80::b156:b61b:d462:b781]) by SA1PR11MB8427.namprd11.prod.outlook.com
 ([fe80::b156:b61b:d462:b781%4]) with mapi id 15.20.9160.015; Mon, 29 Sep 2025
 21:44:33 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <dri-devel@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Hawking Zhang
 <Hawking.Zhang@amd.com>, Alex Deucher <alexander.deucher@amd.com>, "Zack
 McKevitt" <zachary.mckevitt@oss.qualcomm.com>, Lukas Wunner
 <lukas@wunner.de>, Dave Airlie <airlied@gmail.com>, Simona Vetter
 <simona.vetter@ffwll.ch>, Aravind Iddamsetty
 <aravind.iddamsetty@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>
Subject: [PATCH 0/2] Introduce DRM_RAS using generic netlink for RAS
Date: Mon, 29 Sep 2025 17:44:12 -0400
Message-ID: <20250929214415.326414-4-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.51.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR13CA0010.namprd13.prod.outlook.com
 (2603:10b6:a03:180::23) To SA1PR11MB8427.namprd11.prod.outlook.com
 (2603:10b6:806:373::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB8427:EE_|LV2PR11MB6069:EE_
X-MS-Office365-Filtering-Correlation-Id: bf7746cd-7e86-4864-be7d-08ddffa1609f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?bylbFqZlsaIGqByKlv55vLOBNyuQPdqfBWKbrF5v6QsGEgrvka029UDrj10k?=
 =?us-ascii?Q?eK9w5E9Xc7kImoQmc1Q1Rrk02K6R4yp9JELZmVxOhzkrFmTMPPJQpYv9O+sN?=
 =?us-ascii?Q?VaqrQWSmEztb4SI8K0G40s80WKtAg3lGzyYfKQRJs8vKMArxcMPrDPyw2rt9?=
 =?us-ascii?Q?MN0xkKRMMm3PFlzBaxiroRnDoGmIzd6UuaMQ/Yd/FZxrOPyPd90oBOLKKjF7?=
 =?us-ascii?Q?0Nnl0YWejpnmxd+W/gQ9x+g40MyCoxUvgO1fEPMvGaewk/68r6QdrFUInwBe?=
 =?us-ascii?Q?Qiv1EzvILgfDnXhk5okPOoMzLnJhcNfUd+eStKmTdRAo+qbmc86vGQ5IeDSx?=
 =?us-ascii?Q?lJ7gxBg9HHoahdfGEQLe8fiOdUY7kcHkbmopvrfAHuspjZTtEmMy+hLzXT/Z?=
 =?us-ascii?Q?gDaSZG7nHfoXSkBDQuxXMYfcQeu0lAptmynjMyCfvk3SPAmjajJpSFHDDUJe?=
 =?us-ascii?Q?li3sOSUThwA6VqJHF1FQPjnViB0LlxXOiyWXhZKMaWS2NkYdlnhDkcf/LO4W?=
 =?us-ascii?Q?vscpGBcTDue6nlG8VMJ3nHSQnXlcyOS68LiO13N/BtlQRfwciNqrSx3R+/dp?=
 =?us-ascii?Q?77XvGkIjKB0kB6XmO8Fn3GGuQGLkxCpd0J2rdW9G7joAcDioVR7oL/WhnuNV?=
 =?us-ascii?Q?Xc4rdWFqxWoO7AiLW/7fkTCTVK/qnLtU0anSV9wm5fY4JAq3xxlMeFlcUs0T?=
 =?us-ascii?Q?sJ2sV68VnJ8eaJEaAuxCIYFnTrE0hCjyIbDJntOZfLIq8vHoYMdOrrLgP8Ei?=
 =?us-ascii?Q?+5NPy+Vl+b2JKLSH48BMg+NZcx6hy3f+7GYBG3gWuaw8OTJci6hBMEM4od4f?=
 =?us-ascii?Q?QTaMorEcA7iiEtrHVvhDfRQXaAGqBjrXYG+rjj/5gzQVyZNkD/sYgkvFA8hw?=
 =?us-ascii?Q?9U7X2gCbqWE+hbiRBaNZylIEnfGZzUE7395p8mFCp37b97FGE7PNl5Hpv3W/?=
 =?us-ascii?Q?8/7MesCFSiS3EiG94d5RIL12MdvOVOyPsodPf/mJECq/lAPnMBMiuHuGmUAV?=
 =?us-ascii?Q?FBuYGdci0EqSvoO8vsW4zGND/vf9bG21LKql23WZGwTQT7ABPH9RMjyCaZZV?=
 =?us-ascii?Q?sRuYTY2Gw7NB3R36doKWiq9OBbT6geJY1krPEKPneatog9a10cWDlqanuKy5?=
 =?us-ascii?Q?jOEAEKdKMKEUeiXJGuFCTSgP/MeyNwMSsxcswnemtbzTEsySlQMgGgIe/mOy?=
 =?us-ascii?Q?c4/uqDyWUuD9ZIWJnRjGUvps8ZwiH6uUUezqHV1uvFtyofkJDQR2RxlG5l4W?=
 =?us-ascii?Q?maVverPKH+Um/EqqHebQVUwuyuRZo0dHhbJYOgsdVfxq6F4L1gsp8M0kQ3c4?=
 =?us-ascii?Q?/W6s+8m1pCG4Bp6ZbFQtLUNh/AF+OWt+D4jlx+58FTvRLiwExKj0fjt6OhK4?=
 =?us-ascii?Q?FoHW3Dbu4Pg8GSxP3b1Z/kV8FSTSyqxgCekDeNfVvjrvSO6uAw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB8427.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Rme8kpuvFARL1yZdKD84qYjqNYfIrbCqhMsn7tQu47iHLkbhr3IWLffkrp+v?=
 =?us-ascii?Q?di/p/FR6PLhwe2GC/e/DF+NKg51BxTIupkN22eq31aC6gr1KssmDZi2354H0?=
 =?us-ascii?Q?icG9HP3/oAJOJZIWNRlg/Y1xarPmBSsQArOmsbzC0NdN6usUDNMOpprkBHlT?=
 =?us-ascii?Q?pqflUmbeg8tQPd/ikvd6G7DF9nt4J35cnBXPAbZQDztWqbg9kPVdXK/etf3J?=
 =?us-ascii?Q?E52OjMM3dkOei7i4XZT6uU4sL0WkeTUQlLGd9nx3YbUqD/+/BKTB308GKsmp?=
 =?us-ascii?Q?0pO1ZYgOOp6+f8JJthqPuO7mWrJjJQsHJ4155hgfVZxhzdAuirLkD3iU63Sz?=
 =?us-ascii?Q?VL4wVViKdhozN7mFQRH7MbYiCS1KWVAbQGWOkc5bIRo+UHv/Zn3EYegcd5E1?=
 =?us-ascii?Q?GQvy6bteE08mlDw30KZPz3RoRU1l/Ign8wrOu8/Dx0Nf0GiXsCog/kSFeNwv?=
 =?us-ascii?Q?nNk6S3+4HbEQmFCASoKqCkIj3ogtr9FZIWFnbtLZ5PY1heNlUSgWJK0wRhg7?=
 =?us-ascii?Q?9MmCHx9+uUg1gnd0L3OLogOmNcne8Xaseh63kp5etMhv2ffi7iKVBv0Eb7gD?=
 =?us-ascii?Q?8M4YpZqeC+BqFh7cSuCVX9JDTjl+88AZQgD7CmWd7Et39DwcksnElYGiX8K5?=
 =?us-ascii?Q?HxHv5GMCG8i97rAMOVhGVfPQ/9bts7dYcTQfCpVz7mji5AnDbwOIh0Y3/Xj7?=
 =?us-ascii?Q?hzJG4tgEb1pQG7GKYtTD4OxoS65GAM7pGFUytJb7pvNVDhKHMIGfQZDhWYOh?=
 =?us-ascii?Q?x6HbuYxPveQpbFbVBCTv7+UlviZbgcWAPNoZVmsiBuOAQ3nsEzLUUhZop52/?=
 =?us-ascii?Q?4XfEDOPA8yFX9N7Tp6vsTx1VAmFbtoaIdFrJ2zwXgsq/juyj3KS70dBQUju+?=
 =?us-ascii?Q?l00AwM3pgxntgQpT8CFRERoF/NCfIv3FDtiHAgK5ALzBXi8eesIy5OroH965?=
 =?us-ascii?Q?/wYfTC2vzSP3ePDJywH0mMTiI04yo+M4OwuQN2kqv+iLopzhe02R0DfTkntR?=
 =?us-ascii?Q?j0QUnAStiNAuR0EMo3LupAvLPfggJwtrrY1CbtvonM7dfr7C3ONBVO3eInZa?=
 =?us-ascii?Q?AH96iy76QC/4F6xZ/tk94hPN7EBHNmzfCNLnRJPqtAAPFvKxIhbf5TFkmQiz?=
 =?us-ascii?Q?47ixvM0new3Q1KHthnz9R5ntotWqDo1wXxjv1rG0JPfnMZrlid0pvWGNbsZ4?=
 =?us-ascii?Q?gJPfuYcNmTWN6ipzywOxVsrYLAuCQP/EZD8WFF4Klf4RmxKA5emW5hfq7ggE?=
 =?us-ascii?Q?pnqXugfF9xIMikxezJLLhiNikSr+fMHkoFpm7nm6alzRnhG/y3VWI6PQpJCj?=
 =?us-ascii?Q?A16dxDnYIShROkWFsut/gnWxQj7Dj5oRStPklvIz2vPo4ax6x1Jr8hrjMjHw?=
 =?us-ascii?Q?H+iU2KEByl85T0wBC5X5t4rWJ6+iwIgG9VzvnpxZ4fKRBcj5Mel5RCCnHWdj?=
 =?us-ascii?Q?Zu5eJTSKi//3ccfibsTPQkM/9Kb92SOf3Bdfy6ORQQvt/CLrM7GtyrhMPd1K?=
 =?us-ascii?Q?kMnDJJnsSPh63qpb6L4I0Hch/4KmoPGicO7KuaFhZP8E/aReib00LcgKAtg3?=
 =?us-ascii?Q?8s9ppdr0n1KJZE/LNmJmK4XX1sjqzFbAmxdkyrv/?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bf7746cd-7e86-4864-be7d-08ddffa1609f
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB8427.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2025 21:44:33.4876 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9YCzk4IAmlHgdpDz9g0kDPQSLHYXhqA0Co8zdAID2GHzFRCFhjA4AgeBGrh7inA5xdwjlitnYSkdja3Bm/zFNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB6069
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

This work is a continuation of the great work started by Aravind ([1] and [2])
in order to fulfill the RAS requirements and proposal as previously discussed
and agreed in the Linux Plumbers accelerator's bof of 2022 [3].

[1]: https://lore.kernel.org/dri-devel/20250730064956.1385855-1-aravind.iddamsetty@linux.intel.com/
[2]: https://lore.kernel.org/all/4cbdfcc5-5020-a942-740e-a602d4c00cc2@linux.intel.com/
[3]: https://airlied.blogspot.com/2022/09/accelerators-bof-outcomes-summary.html

During the past review round, Lukas pointed out that netlink had evolved
in parallel during these years and that now, any new usage of netlink families
would require the usage of the YAML description and scripts.

With this new requirement in place, the family name is hardcoded in the yaml file,
so we are forced to have a single family name for the entire drm, and then we now
we are forced to have a registration.

So, while doing the registration, we now created the concept of drm-ras-node.
For now the only node type supported is the agreed error-counter. But that could
be expanded for other cases like telemetry, requested by Zack for the qualcomm accel
driver.

In this first version, only querying counter is supported. But also this is expandable
to future introduction of multicast notification and also clearing the counters.

This design with multiple nodes per device is already flexible enough for driver
to decide if it wants to handle error per device, or per IP block, or per error
category. I believe this fully attend to the requested AMD feedback in the earlier
reviews.

So, my proposal is to start simple with this case as is, and then iterate over
with the drm-ras in tree so we evolve together according to various driver's RAS
needs.

I have provided a documentation and the first Xe implementation of the counter
as reference.

Also, it is worth to mention that we have a in-tree pyynl/cli.py tool that entirely
exercises this new API, hence I hope this can be the reference code for the uAPI
usage, while we continue with the plan of introducing IGT tests and tools for this
and adjusting the internal vendor tools to open with open source developments and
changing them to support these flows.

Example on MTL:

$ sudo ./tools/net/ynl/pyynl/cli.py \
  --spec Documentation/netlink/specs/drm_ras.yaml \
  --dump list-nodes
[{'device-name': '00:02.0',
  'node-id': 0,
  'node-name': 'non-fatal',
  'node-type': 'error-counter'},
 {'device-name': '00:02.0',
  'node-id': 1,
  'node-name': 'correctable',
  'node-type': 'error-counter'}]

$ sudo ./tools/net/ynl/pyynl/cli.py \
  --spec Documentation/netlink/specs/drm_ras.yaml \
  --dump get-error-counters --json '{"node-id":1}'
[{'error-id': 0, 'error-name': 'GT Error', 'error-value': 0},
 {'error-id': 4, 'error-name': 'Display Error', 'error-value': 0},
 {'error-id': 8, 'error-name': 'GSC Error', 'error-value': 0},
 {'error-id': 12, 'error-name': 'SG Unit Error', 'error-value': 0},
 {'error-id': 16, 'error-name': 'SoC Error', 'error-value': 0},
 {'error-id': 17, 'error-name': 'CSC Error', 'error-value': 0}]

$ sudo ./tools/net/ynl/pyynl/cli.py \
  --spec Documentation/netlink/specs/drm_ras.yaml \
  --do query-error-counter --json '{"node-id": 0, "error-id": 12}'
{'error-id': 12, 'error-name': 'SG Unit Error', 'error-value': 0}

$ sudo ./tools/net/ynl/pyynl/cli.py \
  --spec Documentation/netlink/specs/drm_ras.yaml \
  --do query-error-counter --json '{"node-id": 1, "error-id": 16}'
{'error-id': 16, 'error-name': 'SoC Error', 'error-value': 0}

Thanks,
Rodrigo.

Cc: Hawking Zhang <Hawking.Zhang@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Zack McKevitt <zachary.mckevitt@oss.qualcomm.com>
Cc: Lukas Wunner <lukas@wunner.de>
Cc: Dave Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona.vetter@ffwll.ch>
Cc: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

Rodrigo Vivi (2):
  drm/ras: Introduce the DRM RAS infrastructure over generic netlink
  drm/xe: Introduce the usage of drm_ras with supported HW errors

 Documentation/gpu/drm-ras.rst              | 109 +++++++
 Documentation/netlink/specs/drm_ras.yaml   | 130 ++++++++
 drivers/gpu/drm/Kconfig                    |   9 +
 drivers/gpu/drm/Makefile                   |   1 +
 drivers/gpu/drm/drm_drv.c                  |   6 +
 drivers/gpu/drm/drm_ras.c                  | 357 +++++++++++++++++++++
 drivers/gpu/drm/drm_ras_genl_family.c      |  42 +++
 drivers/gpu/drm/drm_ras_nl.c               |  54 ++++
 drivers/gpu/drm/xe/regs/xe_hw_error_regs.h |  22 ++
 drivers/gpu/drm/xe/xe_hw_error.c           | 155 ++++++++-
 include/drm/drm_ras.h                      |  76 +++++
 include/drm/drm_ras_genl_family.h          |  17 +
 include/drm/drm_ras_nl.h                   |  24 ++
 include/uapi/drm/drm_ras.h                 |  49 +++
 14 files changed, 1049 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/gpu/drm-ras.rst
 create mode 100644 Documentation/netlink/specs/drm_ras.yaml
 create mode 100644 drivers/gpu/drm/drm_ras.c
 create mode 100644 drivers/gpu/drm/drm_ras_genl_family.c
 create mode 100644 drivers/gpu/drm/drm_ras_nl.c
 create mode 100644 include/drm/drm_ras.h
 create mode 100644 include/drm/drm_ras_genl_family.h
 create mode 100644 include/drm/drm_ras_nl.h
 create mode 100644 include/uapi/drm/drm_ras.h

-- 
2.51.0

