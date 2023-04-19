Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 949906E80B1
	for <lists+dri-devel@lfdr.de>; Wed, 19 Apr 2023 19:57:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EC0D10EA54;
	Wed, 19 Apr 2023 17:57:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84AE510EA39;
 Wed, 19 Apr 2023 17:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681927037; x=1713463037;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=ICFwj3LSsnneqRC8pBvtL0nGndzJnsGniMtGw1uWFDc=;
 b=PmhSlNdk+jVceu7CSnk7aTbm+w1Hwyhi7MHNe8r2tbDh7g4GIJmMpOPW
 F9qotoxq+lclPbunsuMPPxihq2F19y+8Dd4L8tgC5KMCJMxbeulVpkVZj
 67vqOv20Gsokjq7scomHNtGWb9zajpemiA0IPFTyt1BN8NPAUNN7G6LFS
 4ZMoc0GXZMigEkjjYsgwju0sPMnO8NqfnHu4GgBYkeKR2gei8PPl8842z
 1600GK2A6Q63P6eUF3dKA3kCYfbNyUQUTl2D4w88ZgRzj/HySDt2pg4Ga
 mdBzTAgWFaUVfexZIHEO9X00yUF3mDnkavMHFXoDnQXsfF5zV+vyMR/tw A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="373401979"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; d="scan'208";a="373401979"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 10:57:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="685055101"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; d="scan'208";a="685055101"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga007.jf.intel.com with ESMTP; 19 Apr 2023 10:57:16 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 19 Apr 2023 10:57:15 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 19 Apr 2023 10:57:15 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.44) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 19 Apr 2023 10:57:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V0CzbwcF6AgLFPz/9Sa+FCPUyKtl+CEw5I8Gxf9stZv5pWSoGC3wsfJAQvf7G5gwSi/f58hm3OrPjxSFdenDtF92MieOSMU+/JGJeuq1UD8CvzaSDRLz4TW9CmM+4lnV1aD9fZaNl8rlVdN10R/q7ATvwgoUEfdyj8KlMPhETE4QdqlIxrpWhyIFDP7DgFMLOEIBxkubL/pWK/5Wvs2I3lyf/CFPtokhl/keFbMWhE2o0x4oR+1Z1hTJ5rL+tr9QMW64FxsCMxzxFYoHkswWv8bQAqWSJMuMBjH2QUv9ozrTTHcRBstDUGN0Jw1B2CiHKlMu5NdmNvANLvukknrRZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OReqnnuDOxM/MPo2msDlv9YaNzhSmj+JzVI+Dr2b9y0=;
 b=P+WRyDinSZqMrwStyDon6ZwT9awj9Tl1LaA66963cOGSqKOtbT9mnT/BGWTIbPUSQ/TUZTOuO4/TKyVnhgCN0fj767Di27fwxSDlsGRGDZdzTS01YmwWedggbpbE/IeQeABOlJuP/P4aKquBgTQDm+aWad/L6b09kk3aEbtbqoOHpphmmqZxFlXCnpRj8ITjnfTT5V2HHQp7mTEBxoj/FGlWdZLTqUTUNk64Jak2Yscz48qBA5Iqe3JJYYqom0OR/yTPcC/Fdp87p2NZHekr0DuvRcx4WbbSw74KbRxG6e5oYqRFnPaTTdBDeZJ3zQkuki0uFLbJFmK5IJKcPN7NIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5389.namprd11.prod.outlook.com (2603:10b6:5:394::17)
 by SA1PR11MB6848.namprd11.prod.outlook.com (2603:10b6:806:29c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Wed, 19 Apr
 2023 17:57:14 +0000
Received: from DM4PR11MB5389.namprd11.prod.outlook.com
 ([fe80::31f7:5096:35b0:b458]) by DM4PR11MB5389.namprd11.prod.outlook.com
 ([fe80::31f7:5096:35b0:b458%2]) with mapi id 15.20.6319.020; Wed, 19 Apr 2023
 17:57:14 +0000
From: Francois Dugast <francois.dugast@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [PATCH v3 2/3] drm_exec: fix double dma_resv unlock
Date: Wed, 19 Apr 2023 19:56:49 +0200
Message-ID: <20230419175650.3259121-3-francois.dugast@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230419175650.3259121-1-francois.dugast@intel.com>
References: <20230419175650.3259121-1-francois.dugast@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO6P123CA0005.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:338::10) To DM4PR11MB5389.namprd11.prod.outlook.com
 (2603:10b6:5:394::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5389:EE_|SA1PR11MB6848:EE_
X-MS-Office365-Filtering-Correlation-Id: 9351ae99-afdd-4546-7e62-08db40ff81c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Q22pOlZij/VjB8ibMueaOYZ2D4YXtIp6xWOdeAXRdlIzD0fEvQxfE1M6CuVPDs1hFPhnib60WvbJc3NIO3tBKENxrQLuLZhVnaMiMKmI+nTXsEJdwGUI2aRr8IT7TjlmQj9dRZZTeuTS/ZFmfu2wwnzEMigR+47hBcfx5jG3gian6A1P5i7MwtjtPaeIBU9ctqAZj/8B+0MdrLZJsO7EoE7UB1gQeZLlj/zBLlHyj2tkS10CHv3B/qpbD1n0Vi0i2O8OaXgkZ44tmCkKdAdeIZoL5ij+8rMG6Z41nFF8jsHS9Bm5aMVYZde5E9zk1DYcIOihA1wShLtTj1PYRjLERNRz5Z3hv4fb7mkPef6E686EhXYcFqnI3h8tUY6GCF94+g1y7W8qGMcA3+pmJaY7cIZ3zU2eOPUKatCC2lAcmlJxS8tbJ9XzqB5GzQkdwYqpl54moBse1KhDQktg9xJztOE+VH9ovRoTf4U3sCETsqgS9DutUnO/WPX6LeY4ctWeFUoviPzB+FHcugGO7tGHEH3G/JfjO1nSoftrlnRZwHBX5RsFxKW29IacERysxbeY
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5389.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(396003)(376002)(346002)(39860400002)(366004)(451199021)(36756003)(4326008)(316002)(6916009)(66946007)(66556008)(66476007)(6486002)(41300700001)(6666004)(478600001)(5660300002)(8676002)(8936002)(2906002)(44832011)(4744005)(86362001)(38100700002)(2616005)(107886003)(6506007)(1076003)(26005)(83380400001)(82960400001)(186003)(6512007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?S/eGeg/7ph4p/Sh9BRJ3b9g3uzYdSC2hUZDUITfoAan0TEgpq5Jnni0mLW0D?=
 =?us-ascii?Q?EG3FE/gbZy0iRpvHYthKCP2GS/hKx0nY4bSxHypUL90xvndDNR1nWJ3giDCu?=
 =?us-ascii?Q?GNdopz9pA5PxTZc8qp9S3/ukNKpP1ygK5HdQEQzDz/UKIhPCbOxj5bXfI0m2?=
 =?us-ascii?Q?+S0zJIEd9VpMI+tQ0BgQvZTmultxZiy1fK38eQpBdjZmUzJibkt4mEFJTMxM?=
 =?us-ascii?Q?ubFDOKiYLCObuva8LQiCoC4tK8+FlEaEt8hhBTQjN5E+ysBypzmIWrF7jKG8?=
 =?us-ascii?Q?f94XKK/k10/HaYl6XpNu0CgoxnsPBpm+7BZWNLV/y92iHQEw+nAQWIZaiiAu?=
 =?us-ascii?Q?MH3MBbv5W1F8Ql+ZXBWZoP8oBolfZ7GSXeOo1zmhESTj8ZHHIOQWG1h4gAN4?=
 =?us-ascii?Q?APm0SScVI8iz2Y3wZwfMCo6+6ij7BEW3590pnKM8LM28w9SYWb4yRo5sOcX/?=
 =?us-ascii?Q?3cUu5WMjg9o0sjmLN3Sihx7TZvdumcnRuEck3A4v6V4RrGRhMql+AcHJour3?=
 =?us-ascii?Q?g6ktzxVazb2/OUpiWdXJrr8gFstAg7pHHsmgaV9gaOJ+/xlDcoyuHSwpgl7Q?=
 =?us-ascii?Q?rHeajTqTo2LjlZeS3NpNI5QDX9JXkGAcfp9OowFBzsF1ztAXfwjGBbKp5v1o?=
 =?us-ascii?Q?ocX3DrKkyT0SfvCIEIKlWakqyjaTZRs4vf7u5+/A5PVPLyWSlLXDqjigZ8Lb?=
 =?us-ascii?Q?OOig88ymzE46oF9YfMx+rVlTQoegr6a7r1vnfJi8ohmnUDo2kygZ/Wq4PYZu?=
 =?us-ascii?Q?gFfwulVZziQvlXka8Cv9QulJM4W8rhp1dQU2q4d1bkS+hWy0lZ7H177qcWF2?=
 =?us-ascii?Q?8k81ZofiAfnjsehrwIYjgIafteY21m5MM3Qne0KrSVGxjImVI858Hmo4E/ar?=
 =?us-ascii?Q?86wa532FVYMFnFb51LQyOjuM64VWSFsW8kTNreX36jQykjDQv+aoITIJESBc?=
 =?us-ascii?Q?9q/0ssFB1Wt9y6erqjXWv2ydzhMoyAiZvXOnC3rMZORg9Kw5KdU6NgZqq7p3?=
 =?us-ascii?Q?6bPQ8AKSTTLbVamHAurRSs8T4Iz8OXc/+ar13QA67ykSmNqYyrnKogEurot+?=
 =?us-ascii?Q?LQprQYMKZbTSMNe3CH+e13I4Pci7s5Idt7mhycHbWPwJwtFIdv/7lHC6RU7l?=
 =?us-ascii?Q?8t8iLx0yFOTHnqEtPXz7TmZXUvsc2pyorVitPk9S1Z2NoX0h4PWEEsfrp3of?=
 =?us-ascii?Q?9YW1wrY0IpHmfOGPfTfzEPY4R3f2EgW/MpVOwq/zJfV8nqbB3jnJgnxLhsQJ?=
 =?us-ascii?Q?vbR10FcjHPNPJnoQVctr6syZTmMTEUEJn6PCckSrHigdy4IO87v0m2o/SYeE?=
 =?us-ascii?Q?ygSYpW0eLrRDFO9FMHx3xyznd1lERNaCPIlPqBwuRrlLfELk3WwmsJTUEvIe?=
 =?us-ascii?Q?c0TJGGO2NOZTLcYLJSCK/fOpEJ/FQ5h9GAbRdNtxMsolp8FxnTX9oOhKoGRz?=
 =?us-ascii?Q?zTWCneUrPY5u1ry5COVq/Ds4tf1rM/JEHmQeX4nuc+7d0KPmPdrvs1gnilRO?=
 =?us-ascii?Q?SAfX5w+chGR7uoMBKvRQYL8sb5wKtkbCO/Sy613eVHi5NciuqrNEzkqGso1J?=
 =?us-ascii?Q?AZrBAP9egNzckusd4G40+ck8v6UuUUBw8xCgYqqCeTFgc7BbcA1zek9YxGJI?=
 =?us-ascii?Q?Jg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9351ae99-afdd-4546-7e62-08db40ff81c3
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5389.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2023 17:57:14.4571 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v/RLTlqiNGWBhlLiZOJhdhewQ5HTE0v3dX/jgZplLh0+oSH3m2uTm1d9TJJzixFd5SMBjuXV/12D4KbUiinH0t8Sh/uYj1Y2jF+Gx2rZFU8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6848
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
Cc: matthew.brost@intel.com, lucas.demarchi@intel.com, dakr@redhat.com,
 christian.koenig@amd.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Danilo Krummrich <dakr@redhat.com>

Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 drivers/gpu/drm/drm_exec.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_exec.c b/drivers/gpu/drm/drm_exec.c
index df546cc5a227..f645d22a0863 100644
--- a/drivers/gpu/drm/drm_exec.c
+++ b/drivers/gpu/drm/drm_exec.c
@@ -62,7 +62,6 @@ static void drm_exec_unlock_all(struct drm_exec *exec)
 	}
 
 	if (exec->prelocked) {
-		dma_resv_unlock(exec->prelocked->resv);
 		drm_gem_object_put(exec->prelocked);
 		exec->prelocked = NULL;
 	}
-- 
2.25.1

