Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E82251047B
	for <lists+dri-devel@lfdr.de>; Tue, 26 Apr 2022 18:49:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FB9910E8BB;
	Tue, 26 Apr 2022 16:49:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF6AA10E8AE;
 Tue, 26 Apr 2022 16:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650991792; x=1682527792;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=dorz5fXXTtoMQvY8q8gf4blFt0NnUPIKZBg7zdrcJ/Q=;
 b=Nr/Hu6cw03DJB/kNspDInKIpnxKeLlAyI+zEy4+QgsTjOH9L+6qs+n/U
 XLafscoZPpqpJ7nWJODxcNPYSRcfEJazetQt8PEwtFiAUQ4xtJza5F5Zd
 BdgD4A4LbW/NwG8dOP3H0ry7aPCft/lK678T8h3qoRHTLfRxEfopMAqbp
 KYUYOWdmyVPjbZX2GCjM63esHoiHmigEvQmGfQ9QpeHpFcf0o4SxyUyxy
 nJ1cRlrgkGV3iHDMXknJFAMMDO02MZzNw1U4RTwZwFmVg+GAsgnKzP+np
 9q2qADAy5GV/XR+EKGhCMDgh9eTgNouYxTL2OZD1PbnbW681KBtfLwj7q Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10329"; a="245575714"
X-IronPort-AV: E=Sophos;i="5.90,291,1643702400"; d="scan'208";a="245575714"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2022 09:49:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,291,1643702400"; d="scan'208";a="513249754"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga003.jf.intel.com with ESMTP; 26 Apr 2022 09:49:40 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 26 Apr 2022 09:49:36 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Tue, 26 Apr 2022 09:49:36 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.177)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Tue, 26 Apr 2022 09:49:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LObGGn2+jpSAaQVywnJUJxz5XxSTjQpfYrrV3+DjeI1xqgM+nO6CWiIOlIHicOynk+PvbPZTMSiMxJgqTSGE9o627qWVZXpcZP6/dBexVJuCmspZQ9Q/fjw7GWzTBuQTZ/CrBTj48QLSwLK/XdfuBQiqiYKWyuL16RUbCsgbB8tyd3HHQOy+pSPftGKIiyRod1h55H9IKW3qQmH+vHW4jfeup2yLTDnwUET568aTfQdpj9lrSMHmyPP8hsTYAchu6JpJJIVdEH564nFvouVJ68YcZfJ+PxSYTLhdowxgrm+r6DdXodTlh1Z4zY/aZuR/D1lZ3+zHOdOSkuPtE5qwAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DqG4Bb6lA5bkE1wS2P8hx5s5GBJbSFKhAt5S9Pk/4Hg=;
 b=DMFF867gkDYNPoowTIVAZ0i1GJS4TP4vHuVoNrpVKIkAIRhwMSzjLPEmFmhUwsQzecd1zJx45mDXYXLLRRt50+8uXV7OSqWz9xgz90M2vxpjXDPKj1q8WVWGoB/LD1uMEJC+DXH5fyG6yYfF/NyUpbhAkrVPuxN04qqeARSwny6LC4i61DrL/woVq0Bw3YcbcOlHwnUwbPipGReykcuSIJe1C/hiiijJCA/LLajUZruWdb/WKg5QqAlsKaEOj6NP9gcEVo5hFApURmts5FNs5kchAXrMsy88PB8RCuX+nGLm4mEzw2qjt9ELaNma+brv4+Jc045fi6D5UK6bsG1OsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4894.namprd11.prod.outlook.com (2603:10b6:a03:2d4::5)
 by DM6PR11MB3658.namprd11.prod.outlook.com (2603:10b6:5:142::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15; Tue, 26 Apr
 2022 16:49:33 +0000
Received: from SJ0PR11MB4894.namprd11.prod.outlook.com
 ([fe80::3d83:3af5:c95f:e062]) by SJ0PR11MB4894.namprd11.prod.outlook.com
 ([fe80::3d83:3af5:c95f:e062%7]) with mapi id 15.20.5186.021; Tue, 26 Apr 2022
 16:49:33 +0000
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH v3 1/7] drm: Relax alignment constraint for destination address
Date: Tue, 26 Apr 2022 22:21:42 +0530
Message-ID: <20220426165148.1784-2-balasubramani.vivekanandan@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220426165148.1784-1-balasubramani.vivekanandan@intel.com>
References: <20220426165148.1784-1-balasubramani.vivekanandan@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN2PR01CA0020.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:25::25) To SJ0PR11MB4894.namprd11.prod.outlook.com
 (2603:10b6:a03:2d4::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d620f100-34f7-4da4-d46a-08da27a4bd9a
X-MS-TrafficTypeDiagnostic: DM6PR11MB3658:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtFwd,ExtAddr
X-Microsoft-Antispam-PRVS: <DM6PR11MB365856F04C39F0D892F9C23B9FFB9@DM6PR11MB3658.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hFCJrD/2w10IZcHYkw9DaVZ7DzsjUt+CV1k8eEt+fJWNGpAgfjwOQyTuCYqPYzuVmWLcaqOD0TRUzg8N6A9xp4gYEil+RT/sF6+Oj07tB+hVEjgp1jDiFLVbvXkfSny8LqduRhBOmjJKgpOn+HpNj4ynZzigNXIFqEb4jrVOokZHjZMUOx9EIGE5HU5ThivAaVZMl9Y7EoIe3tG+as/gQ2vzeDOub2d8LGq9XCQlGcFTO9GT19PnWxH8NbGA61uoUW7wRh4emCI1OztnAG/2lloHzrcP1CZT6NkWZEU2Jhp8WweNMYvPpBqzRAoQmZoSBe18bNSKE4Tt6lHzi9tkfiKnCJr8bfgDkmWf4xbQugfi60w4CNhdIz2i/R4e2gNCg9A1gYcJr9VH42yklG10tHtn5cNREzp8/3jP+xrvAp8826joyDzsteeolnYb50YArHdY+3yn+cJ4By8xFN93Zs+mhcE+T+DQ5PyrmwLNLkw1/sJXhX3f4gqnVxfXlvfleLjGOhNwsfoOYy+4103zYxc/zZh6bGd2F7ESeDb5ZrCXnWIZPZqxBZhoUnxEJKQXQEbtrnnJ8ujnhGIt8csNMuIXjmmOQJ9RRe19J9dD4RUhkIX4CzTS9BbYCR72bRNdpO8ofbYWhW/oughZRd8Giw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4894.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6666004)(6506007)(6512007)(186003)(83380400001)(1076003)(2616005)(2906002)(316002)(54906003)(86362001)(82960400001)(36756003)(6486002)(508600001)(5660300002)(44832011)(4326008)(26005)(66556008)(8936002)(38100700002)(66476007)(8676002)(66946007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?voWor1Ld4WNinVkngz+FA1hka875wIRoaItwf9xEecPpAS5HH1mLlfpp3qEU?=
 =?us-ascii?Q?qrNUJxCcItDrHlVFAAnAxbO04S42HytVmnyOu8xZWJhMXpAlr6X+8f4sSrPH?=
 =?us-ascii?Q?deL1yETMmvrfglJuyBmBIgODsE38LhplV+sSH8zAeOkIEbnAsNP0t3U31i86?=
 =?us-ascii?Q?PpNsLWcoNmyUd7uOx6f8ka044gkWwzM6CYDm7HuIR7s2J4KDJf5PGB9RFTuf?=
 =?us-ascii?Q?XpAU5cYtk7tiBehPRHvtFwPzItIr8SvDx1YNeLx5FOEDcKggejQ/xoguLIny?=
 =?us-ascii?Q?bJ13CHbvwFNQwBj2J7G/u82PXds3hRpBP+L95RrMKFLiqecR9YckF4c/7ESg?=
 =?us-ascii?Q?GVVv1FwezIWMTSM6Q3UjkSmeBUovfV6ouQIw1aPHMim7UzhZrAsZA+SB9j1T?=
 =?us-ascii?Q?Hyl9O67FpDFDLdr2OBzV7z70GeZdgYsM3yiPXKPjeO2hSS7RDPqzU/3hXW/z?=
 =?us-ascii?Q?Op+yhtJ1I/manbHsmBM0PYXunszMhJbe84CcO7xNVg4QJJTvcUgH9jhxHMTV?=
 =?us-ascii?Q?BZM0e7eIMB3J1WHLlKBlh2jKNgXX4I6w0HBivCSezHpieQ2868R4KgXFFbWV?=
 =?us-ascii?Q?pZ/spydB0N06PslcFPl+bde6bByLb/Z/SQeYx4RyWhjjmU+j1IwJNIf81R+G?=
 =?us-ascii?Q?wpS7z7MhfIc5Ca+W+dunC54snNLWWxemw7rQhTdvlrZcBm9Aey+b7aPE03PA?=
 =?us-ascii?Q?Xq+fP+kIYCPFwGZo0NVoa2vfPZbEFGfdZ68avYbtY3KlIULOqpFU6Q8cbomn?=
 =?us-ascii?Q?c/+sVngKFeix/8hycwUutMn25KCEzfT6BNkz+gGHzoUcbeecvv14wqmjg2G8?=
 =?us-ascii?Q?wooKE37hAF4KHtooHj89w5qtlCCzYBWVyg183yDJ7uek1QCc/CEKmGr4/g48?=
 =?us-ascii?Q?lu5MjviuccEm46JwFb+eStaYnHHm7SIJwzCVLOFKgluTepUlKnrct00Ppqcs?=
 =?us-ascii?Q?tnL6yWBHYwVvYBAAE9xN9YOvEOZNxj9tBtIh11DEBfIFw8hcTV9hsZlROVtI?=
 =?us-ascii?Q?0svXskTPKmD6IYasahx1Sg9KAfPqS+Vyv88biTDi4WfURNlDyYWXDAmgj8Ma?=
 =?us-ascii?Q?rL6ZJGvyU+THwzekOBYALpSo41SejDGX+2ZK7cUuxrO5xZr3hFfQc4kk7ic7?=
 =?us-ascii?Q?nWfNGdOjrxudLDR8J3IkLdfya6B5P8fDd9f+5nLfaDgka+bXiDJm249V8XVQ?=
 =?us-ascii?Q?zrAhOhBcolA9iAjapxOWiI7R+vK0lzscPMBs+rsX3XURMqpvu17q88Ow9P5M?=
 =?us-ascii?Q?8N3Hv+zQcXX/yaxQjAJY0SpNP4sqkfjSzmYT7k+vLYKOey2hzX8UUaGBP7Fo?=
 =?us-ascii?Q?DJoBvznmB9CaAPKfhxj/6hRHbyHl6W0bv3+e+iccdIlzElgTzHas4Sf5Y5E3?=
 =?us-ascii?Q?2Pcw3OfbOfHdGF8MW/BuILo+ApRjUJa9XKPqpVUOdcyac63TN0AneaD7yFrE?=
 =?us-ascii?Q?wdG6qGGXCP2Hdn0JgMzS7IvfWXP+7L7xHM7tTBsDLmMyUlZi8jm5gP5jSui3?=
 =?us-ascii?Q?cbksm5t5XY6Q5+jpLXfzchfRrdxN+STvHSKNKnerxAGd/HjUTEn50UXSEECJ?=
 =?us-ascii?Q?NOlR2rd0OJO8HRXtnY/ZGS7AxiTmMZIrPOLfGUiw1S0jI9cbD5tE0+7+pDks?=
 =?us-ascii?Q?BpjTEWiTkLc9GKDM9RhH7n9N9nySZC5dJgAoa1SKGNxe9cWjMbPuKOVBLts7?=
 =?us-ascii?Q?X6Qf7qCVhsHY2aUA11mJqHvAoAOONFfDETO7Ip9hQtjOHKP7WlApbzl28SCV?=
 =?us-ascii?Q?eTex7/10Mp88CqTUOcWgYywPbAPGlu/azt4i3Mgx7n+Arml9TXEa?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d620f100-34f7-4da4-d46a-08da27a4bd9a
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4894.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2022 16:49:33.6444 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DM+shLvY/L9QCM+g9PqVhHnLk5pGkfUaN/rh3P3SSayxHY5Y5R5ZqIEISG7V3pfOqEXPWsuzt/SdK8oRiSZV0ADt2QGE95reM/9bGRSe407GEguN5+J/6mY7pmNZDQK9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3658
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
Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 David Airlie <airlied@linux.ie>, lucas.demarchi@intel.com,
 siva.mullati@intel.com, Chris Wilson <chris.p.wilson@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There is no need for the destination address to be aligned to 16 byte
boundary to be able to use the non-temporal instructions while copying.
Non-temporal instructions are used only for loading from the source
address which has alignment constraints.
We only need to take care of using the right instructions, based on
whether destination address is aligned or not, while storing the data to
the destination address.

__memcpy_ntdqu is copied from i915/i915_memcpy.c

Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Chris Wilson <chris.p.wilson@intel.com>

Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/drm_cache.c | 44 ++++++++++++++++++++++++++++++++-----
 1 file changed, 38 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_cache.c b/drivers/gpu/drm/drm_cache.c
index 7051c9c909c2..2e2545df3310 100644
--- a/drivers/gpu/drm/drm_cache.c
+++ b/drivers/gpu/drm/drm_cache.c
@@ -278,18 +278,50 @@ static void __memcpy_ntdqa(void *dst, const void *src, unsigned long len)
 	kernel_fpu_end();
 }
 
+static void __memcpy_ntdqu(void *dst, const void *src, unsigned long len)
+{
+	kernel_fpu_begin();
+
+	while (len >= 4) {
+		asm("movntdqa   (%0), %%xmm0\n"
+		    "movntdqa 16(%0), %%xmm1\n"
+		    "movntdqa 32(%0), %%xmm2\n"
+		    "movntdqa 48(%0), %%xmm3\n"
+		    "movups %%xmm0,   (%1)\n"
+		    "movups %%xmm1, 16(%1)\n"
+		    "movups %%xmm2, 32(%1)\n"
+		    "movups %%xmm3, 48(%1)\n"
+		    :: "r" (src), "r" (dst) : "memory");
+		src += 64;
+		dst += 64;
+		len -= 4;
+	}
+	while (len--) {
+		asm("movntdqa (%0), %%xmm0\n"
+		    "movups %%xmm0, (%1)\n"
+		    :: "r" (src), "r" (dst) : "memory");
+		src += 16;
+		dst += 16;
+	}
+
+	kernel_fpu_end();
+}
+
 /*
  * __drm_memcpy_from_wc copies @len bytes from @src to @dst using
- * non-temporal instructions where available. Note that all arguments
- * (@src, @dst) must be aligned to 16 bytes and @len must be a multiple
- * of 16.
+ * non-temporal instructions where available. Note that @src must be aligned to
+ * 16 bytes and @len must be a multiple of 16.
  */
 static void __drm_memcpy_from_wc(void *dst, const void *src, unsigned long len)
 {
-	if (unlikely(((unsigned long)dst | (unsigned long)src | len) & 15))
+	if (unlikely(((unsigned long)src | len) & 15)) {
 		memcpy(dst, src, len);
-	else if (likely(len))
-		__memcpy_ntdqa(dst, src, len >> 4);
+	} else if (likely(len)) {
+		if (IS_ALIGNED((unsigned long)dst, 16))
+			__memcpy_ntdqa(dst, src, len >> 4);
+		else
+			__memcpy_ntdqu(dst, src, len >> 4);
+	}
 }
 
 /**
-- 
2.25.1

