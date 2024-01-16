Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 347F582FBE1
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jan 2024 23:06:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 314A910E5EF;
	Tue, 16 Jan 2024 22:05:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50D7E10E5EF;
 Tue, 16 Jan 2024 22:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705442738; x=1736978738;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=WqueaAxEIGmoC+IIPvplYXfhT6BepMDniAnS9Ucb7dY=;
 b=n7h69oE3NqmUhgBirxNM9Qa77Uu2GmWjRkt/V1HkUm8LjfDCh/hWjGKc
 0+TBEdpuwOArM1Wl9gB7eSGx7TkcnTJSnzNaXUcA9tbZjmFK35hVS9FSp
 sY+en8oW0xGBw3l/3blKJInzJSTnyspEo9Oy4H2ZimUfsjZZ+coyZawIB
 T1QLn5lpu0/uvIC+5hjQHEnGV63RP0KyzXT6zA2RdwXSfEOWff6yDyU2S
 ptOsqVM+JBrSUIo+8Vc9ij8ihHZCHzFa1V+8vJiI5QzfZiXtgaSEvVLTX
 t1+MPa+I1ddd5p+RSig0vj2mjjcxGNn/+/STifjnO1ULqanM3jDpb9CTs A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="403755868"
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; d="scan'208";a="403755868"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2024 14:03:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="787599527"
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; d="scan'208";a="787599527"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Jan 2024 14:03:39 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 16 Jan 2024 14:03:39 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 16 Jan 2024 14:03:39 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 16 Jan 2024 14:03:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DbtxiOmED1gVRtItY7ZF1neDh5g7IPrUcPCEWyvfaE8D8fo8L8MjknLXXwPjveIbEER8YwI6N1oIF3wsaWyyqfNsB7R4S8VHC6gHAV+f9FxTylhmig8uIsLfKeoIIxHaiIsRmdAWlbwNrZTNmoWPQUC9w3Swj/O+6QJO17XRVE8G3OR4neIGqbL7nk7ysVAWiWRcBVZIp+upobkuaIhgrdpXJ6caBvsVDDsmbWRQSnv3L8fxCmJIwR+5oQ0zNFXqK0AiToHap0zP3qzQzpBz6c/w6iOC0KKo3KIMRskt2B89hDunKMJX9ZDSJ17uuK290XV2ZUtOyZZTCRWKKNT0ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rtqzWdiyODhJC50hGt1Y22fPLoGp8fQO6G6QzVaIm1U=;
 b=IhAaFX9t4VLu3DBK3PceIOf9AC3/7Fh3Q/qFppo9qS40yxCX8ps4pvG013RiUNWpBaCtAeIPBlXjkCoInGfu/DD2EjB1LLvsaEUUqJb/goG5cmOWd+1j78fH1POC0Mx+T9/6bcZpn8O3MsZoBbOasRHSorZlw+p784OEjil1hRu+9Hm1EGVJZnbF41HGFBl6xAJeuskywxD6yGwgwS/eOBvv6bEuUPyREcr0Ny1YidDFRjN/sMIaQVJtefIRn037KgtfTUUAYM7r//GdSqsfMOKDZVzaR1HoALaa2ZwwdBOcNrCHz8BoJLLL+omRYOhbVhszdyT3A+QQzr1adeNFdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH8PR11MB6830.namprd11.prod.outlook.com (2603:10b6:510:22e::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.17; Tue, 16 Jan
 2024 22:03:35 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7181.027; Tue, 16 Jan 2024
 22:03:35 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <dri-devel@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>
Subject: [PATCH] drm/doc/rfc: Removing missing reference to xe.rst
Date: Tue, 16 Jan 2024 17:03:31 -0500
Message-ID: <20240116220331.145607-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR01CA0040.prod.exchangelabs.com (2603:10b6:a03:94::17)
 To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH8PR11MB6830:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f59858b-b099-49c9-1e35-08dc16defc91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VGV3+WbtVAcwfMG9vz1skk24a4umhM2d3JyixpvlKM8Sd0LVTAhQPZS3DOEfffORIAUm0DVdG9RJTYWqpLlHlp5tNfRO2WnTO0Y4Yl/BpvJKhH+8mON+UhzXj7RbzBspL2YlXUzvK9m5ql5Hdda+t2NLQHcX0w2EJzU7fO+1NizZdtQ4U8Ma2QlCuviXRFq4cnT0/WQ/aOVG9uSIvmph1wJDA1nQi7U0tvv1SaCiaP5x7YO8RzJde8CJGVcaU3GyUoYPbbjUQ5+eCdNy8bRA6JhUCdAKn5yXZ6lBRhKnEIFtjKFvRX6pNa8z6Jd/SXKPeSwW/pEPnWNsJc6hsL8O/qsjfhwuUMbTrt3BF40ecGnfxsee0HrDl8mHgfQ+aOY0rqCBqv/FfY6tHYW3lNlxZ95MKHphlMFBTJjmSZ2TtOaw+oTdei7dquDzpgWjmii7QI5juRXt2KOLfePNlWgX8PWYgBSS9Nbgq9suP36tPmhXvKtM4PIaagHjNR4na3TjgoEmuOGjDpF3zTzhTpZvodOUYaxaduPSqSq46ZzuSP6E3jWjgABm5XxG1UMt7qQG
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(346002)(39860400002)(396003)(136003)(376002)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(2906002)(6666004)(478600001)(5660300002)(8936002)(4744005)(82960400001)(44832011)(4326008)(2616005)(26005)(6486002)(66476007)(83380400001)(66556008)(54906003)(8676002)(6512007)(86362001)(6506007)(107886003)(1076003)(38100700002)(41300700001)(66946007)(36756003)(450100002)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?C2YPl/DBGlEMzZgnuIW01kB0+3JX/5BpnrudosWhmbTfWbi7P7TY2cyBl4vM?=
 =?us-ascii?Q?qa5GR0A1rojKy05TOL7bLxwTsPy9PyGwsqWY7EenZ6PHOTPIMXIY7UdC80Er?=
 =?us-ascii?Q?Ck74lRk9bqZa6XUb8eQaOqUFqMcag4dY0otjY1PihpbixZkx5Po8AngTde38?=
 =?us-ascii?Q?JyH/nbiCai9KhWG6AJJX7XiwmfwNgi8QOTrVyN5UrViJQYl1L26RALqHUemV?=
 =?us-ascii?Q?7rGiTPXwu0Ltp4zXGbrST0aLXZgq200gPUSUWVPh5X8g8N52s16wDqNVxce4?=
 =?us-ascii?Q?au+T51vr+DNsnzLJ5OfJRWCrefbbum8xo0zYqtnrr9fmlj4MNhzr7GFH4bd1?=
 =?us-ascii?Q?8shuaYnUsT9yWwOjFPacngh3/2NYq+hbpdquaOSCbstSxRGvBhv5wXAABGic?=
 =?us-ascii?Q?mYW7OFJgYLNVwW3CWz+qCV0jrCEtZUG3AO872ckump+Qgn33y/4ElleNEIAR?=
 =?us-ascii?Q?tOsM3rQ6+hpoagPMLKbwBNFOyFOElesX09/tLiNDVs+av2Y2HF4HcCQsbLbO?=
 =?us-ascii?Q?SamRXs5PAyo3RPyi+OqpJzVLxcnCw8CrBXNCZgq0A/clfwKNeWjoPbL85bgm?=
 =?us-ascii?Q?sEePaaNzSvqh8iGj+sV0WUC8KTAHERMgJSXKcyQZCwePWxorhL1O7gmqXzja?=
 =?us-ascii?Q?oSqIbaiUIpAOX84R8gBPS9pXFKtGv35pvr1+xjUL07azLlMJ+zEBjSWfSU2I?=
 =?us-ascii?Q?gJjPeBmbUdYLbvVfJyBPf5O9Szbjxp+6WDMO2Hmc6BhW1Pe1nMv2/I6qmvY2?=
 =?us-ascii?Q?wQDi0a6a4BVz8PMQKqyiCy2al8TYMAVB0Gsi6DafiMTHJNx81NTtRx21aEK8?=
 =?us-ascii?Q?FhnD87NElakV+z2ZbQfF6EUPzeu/b9ci8szEwerplP4O76TqMNXtNtjc3QBj?=
 =?us-ascii?Q?iEKmRPEQ++iHMuNONzmC7rWxC5MB38n+fU2YoHt9DUGEaa54OTdT/u1R63pv?=
 =?us-ascii?Q?yUlbGo1khTHXr0u+8cSlY4T/Isi+9fVrnxVt479zXyHWKP6BiZHrqy9PqNnz?=
 =?us-ascii?Q?EFiucgCScxWwYUyjTdxhcPteLAWTqRRA91QgyswvZLAFxsZrH5eothYVXi56?=
 =?us-ascii?Q?H6+gYYkvXDtEfwzay/SPahJ7B/ZW32jXmd38LAxd4vxHMhICMoj6FyLxCyzq?=
 =?us-ascii?Q?KVIBIcZ65DcoDpMI+swDvo785zan7Di38Le8MVo2tAGC5U6Fc/siES8GnKpZ?=
 =?us-ascii?Q?a2pS8jaENIbrNSPvfh1WzyBNE3+Ka2Parbbl5BGMG+q5QMRhTmknA3LbbPsk?=
 =?us-ascii?Q?sd1gmzqkjDP79Ns/rYkBRA9gcdVO5esWYeKv8TmVW1mEZxVoKuWUi/IfWtn1?=
 =?us-ascii?Q?TSHKIlB/8LrBjmNSDw/7PaxRztEDTqnIBKfC2POMFhoMPb5IhuIY0RVr6uqN?=
 =?us-ascii?Q?Ur8OMPMCYj6jSCBwspDb/TVxNDYvwj0m4bCYMeOHNmseG0ce/BFAFUPAaI6O?=
 =?us-ascii?Q?04n6txzwTsJHxYOkIvdxOeaBhtJz2+bEpNYo2YShXPUBirtXwMnCoDxsqfXf?=
 =?us-ascii?Q?BmWWX1cP/5BK7SQYhvWEPAKNdHRH96UEMHK7RXVmy45+hB717rXoGKIbMTnj?=
 =?us-ascii?Q?ceB+lfpPMtcSgID04Wk1EaQw9+0TaqlH60YhtVxA?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f59858b-b099-49c9-1e35-08dc16defc91
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2024 22:03:35.7142 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r4b2RMVq5jvsK2B2NE2sg5kn4L2bilVv0uncsaXQvRmFZerSUTjAHUx3Dkc8O/zd+AtPD9ruJYNwg4ODzHem4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6830
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The file has already been deleted as the tasks were completed.
However the index reference was missed behind.

Fixes: d11dc7aa98e5 ("drm/doc/rfc: Remove Xe's pre-merge plan")
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 Documentation/gpu/rfc/index.rst | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/Documentation/gpu/rfc/index.rst b/Documentation/gpu/rfc/index.rst
index e4f7b005138d..476719771eef 100644
--- a/Documentation/gpu/rfc/index.rst
+++ b/Documentation/gpu/rfc/index.rst
@@ -31,7 +31,3 @@ host such documentation:
 .. toctree::
 
     i915_vm_bind.rst
-
-.. toctree::
-
-   xe.rst
-- 
2.43.0

