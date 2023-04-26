Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D60F86EFC07
	for <lists+dri-devel@lfdr.de>; Wed, 26 Apr 2023 22:57:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F60310E9D9;
	Wed, 26 Apr 2023 20:57:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CC1C10E143;
 Wed, 26 Apr 2023 20:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682542657; x=1714078657;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=PKUPodSWJm6zFdDK2CSJ3Idoh2Hab8QKsC+Rx6cwX9M=;
 b=ldvdeEeNA6I+YMW8EdReSspvUGeWxReYY1AF02TubdYK7ccoXBNl2pD5
 FUM5KsJWSZU2oPuYGGFfHRGzmCBUg+Hp1K+C+7F1J2g+KgtQf2Hel3qzt
 NrTd1O4Uk3cBDLttqre0FDP8K1HRFMwya+IMRQG/Z0VHO+b6YAfxdLefI
 mtXpMNnwUDtZQq9yAY6OuzUae394FGoXdfli1/HPqSp+EqF2stwL3BqDk
 ALfCvGfCFFZ76Obl5H+u5ufAtLfj1c0Vng6RfXPES75/jhXeTbOosoCFx
 5HAVjCPaft09io4uB4ksQxyf0sTPD+CpiuS2cKZhXXrQ1EUxZbJdGv7ig g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="410249461"
X-IronPort-AV: E=Sophos;i="5.99,229,1677571200"; d="scan'208";a="410249461"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2023 13:57:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="868435110"
X-IronPort-AV: E=Sophos;i="5.99,229,1677571200"; d="scan'208";a="868435110"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga005.jf.intel.com with ESMTP; 26 Apr 2023 13:57:36 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 26 Apr 2023 13:57:36 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 26 Apr 2023 13:57:36 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 26 Apr 2023 13:57:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VccsY5DIqZKYjv7ibGPJj+mCaDhIAhIO0H1KSKcbmZKf6pKrN7MdC+4ctFT6cwtyKyNEQn7JG0DdmuzLAsfTGLVahKSnsgWOHd8LMFuBghsvRD1Iu66GiudsPq+Wtvd6EXcfZ185a1QFZNSYPKb4sqTKHFDwX4FIB6SA8wq1AaJLPdvVKV7koZ3WNFI7zISy/McXnyZEYT2CASc+K2zwGgicp7O/QtOrFf5Oyht2I6o5nZmlWjsxJPIlaUh54eIflmOilRIoR+IMpcJQNCGpsPxbHVXNK2aQCvYvkpy+xh6nea2f1AuR9g8EfHYplodaKCK0puA2X8ppGqICxRp0oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KkQI9kylSSJRgpgSTvhUcpis4mtOqMyequN69k264Wk=;
 b=G573pewJ1Ayj0Ie8FsALAEwlWlglGZ66krtn0YdCkti321r89OHq4XWa43LXVAhl1GGQD58/BBVx5UOfvfdoZ4Mi/1I//UVpiLOt38qPJjOosgkJdrQ2NSQ6TdT10mH2XFRwmEoE8miCGxva+GzCDhqt6PZbVr/y//vPFa01B55Zawz2CHSJ29o0YzCYcD0pFkK2x1Lvde7VO1si0EqapV6lYYJuo20neTUdZkqHTiE8eut3P92ImncsV/0yDxcouwirp9FVVocH0hp3gMmtQOdUiyXi+ZeQEp2dNvBazcUEU8KJw/i9LJ1wr6FWLwRNcnWpZlZFN7cXO2PqTcYUvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by MN0PR11MB6182.namprd11.prod.outlook.com (2603:10b6:208:3c6::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.21; Wed, 26 Apr
 2023 20:57:34 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004%6]) with mapi id 15.20.6319.033; Wed, 26 Apr 2023
 20:57:34 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [PATCH 04/14] drm/xe: Extract non mapped regions out of GuC CTB into
 its own struct.
Date: Wed, 26 Apr 2023 16:57:03 -0400
Message-ID: <20230426205713.512695-5-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230426205713.512695-1-rodrigo.vivi@intel.com>
References: <20230426205713.512695-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0177.namprd05.prod.outlook.com
 (2603:10b6:a03:339::32) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|MN0PR11MB6182:EE_
X-MS-Office365-Filtering-Correlation-Id: 13a13a6e-3760-4866-368e-08db4698dbc5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mZ7TFysjinr4GfAGugkzgpUaYMM6OgynbaW+5avKiA5QsgoYnWe9cosE/glXHS3YuH0ETonJ5ya42a6Sg3aiI+RDMKFDveeRB1W/r4BGYMATznRSaj15R/xnFCyyEDcDRivnd38pQWTq++3HjdRrcznkynUkPV8xH6Q6KFqJXySTm7bItiBM2dPH3+1GdoJwwAS0lso604CVB1KbhMF97ZS4XMGm+OrsisTHvj8B2FKln1H6ahLIpJDz5GeTCA5QUKRzZyqXvCSU3Ns7EPOZcnvc4i/+hSfDo5ybyX/xFhhiD0oUaiBQ843TNhnYEn25FYVCsFbi0/iL5GrjnLwDgOVHkdyn+TcD/xO1cueRlf0ycGlTotvQFo68fxgkNbEC/WjbxuKNA0IcVpMcoIgsn7LcC3A8NxcJ6E5Jz/ELadD0CIvt6vBRVMpKhljYaz0fDwjWT40cA+BWnSproyWBb3IYWXI6T4K+X1FzCjaeqgj6l2lMxyWpsyxEyiaDMLRq5EplICFxSgojl7y9UGQAu36TEasE2wMIW9xo+Y55cEOP4kxHutHdQ/EuQhIzxm0N
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(39860400002)(366004)(136003)(376002)(396003)(451199021)(2616005)(83380400001)(186003)(1076003)(26005)(6506007)(6512007)(316002)(6916009)(66476007)(86362001)(4326008)(450100002)(38100700002)(82960400001)(66556008)(66946007)(2906002)(30864003)(44832011)(41300700001)(107886003)(478600001)(5660300002)(36756003)(8676002)(6486002)(6666004)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?N4kO88fk53tn1/8FVx8M0Vv4JjgY5ePE7hzdujAcsUyuEzbkDMxKnXDoxC5B?=
 =?us-ascii?Q?e4/RLMTiYunSxXTiDTT2ETjUoyN3ap4uyAhOuY+2IudEA4Q2hFnGhB3lnf3B?=
 =?us-ascii?Q?oeL68Tby+MqDo/J101UvQFLaZJ3m8HtPFbfVJXQIQaN8KZvkesyBJkrYkIh0?=
 =?us-ascii?Q?wxgPy1QvR0RixiwA7L+W7MEM1qfIRqloWuMGrFFfy7zUB7yNSpFNC/3utGqH?=
 =?us-ascii?Q?UdMcaJcJ8fMvBcJWC0sJP4q3u3GmQMQtZAm6OoEBPAcpIyeyAZoYYOoSKj4F?=
 =?us-ascii?Q?x5zCZ46WqR27rS7FdAjaSFagBNF4jJD0hLINgP/zoNtkt5bCbdLCdvO+bd5k?=
 =?us-ascii?Q?RgAfRGB8wcgsvs6BOGQXZsOaljO/8/S5aPVYpSkTcBoFxk9oaFbVMf0ZqOGA?=
 =?us-ascii?Q?ovDbZNVaUuiXk+xkw4fYyZHW0O/Z1L+wJVioaYkl98lHA4y7zJUXGzB++UNQ?=
 =?us-ascii?Q?VmtpOfaMUab+k+FuFudea/VeRoiVz62Tx9gZPxWEvFfWiMs5nA504p0mP1D+?=
 =?us-ascii?Q?KgLCJdjyq+memaJGgUpKRdA1DAueqJHbAVeT9nBfqPJVLdztSfyxMv7g+HxP?=
 =?us-ascii?Q?qpMF295ARMLGmISYY8VuHW4T08dcgaAXpNs96m3viSIwPvIX0hGEiDs0TI1l?=
 =?us-ascii?Q?k+GXKlLc0NgZ/ASHXgutj8GdvzYBlq0k7vxvMPNMZ7VO0c+RyhBtClbY3QmO?=
 =?us-ascii?Q?sVjP9J3YjQUJH0FT7DB4aTOJvhdpJARhOEIbbrVnakM/3PwbVUI8o+IF+tV5?=
 =?us-ascii?Q?GXImrha0s8SlLWrsG2FT5w34ypWUBlfeQwVt0lbdM2AshDmjEKlgL8Qfih0r?=
 =?us-ascii?Q?v38FIE92w1HA+BRzcQRbC2cJ+FS6vcBozXcVcAAapAKagRlmLWZ/U5i0Uzjn?=
 =?us-ascii?Q?SCZfY5ZVA2ykUE7TCZPMbE2sqFE5EQ/5fU57IoOMmXQbLkHJ8bEEVd6TnfDN?=
 =?us-ascii?Q?Za0VJh4d++XULR557Ig8fUBwBIp3Env7YJsvJ4ZQqAn7a01KTGUnayGz78i2?=
 =?us-ascii?Q?6tma0Jr9uBArEIYTmuJG8NMSgQWDmkYxG5iZDNkTi7zexCqhvwQjD2j9og+x?=
 =?us-ascii?Q?2u2OFzY3o2LDYLM9Eg2ftLakUFNs2oFnW5ruILqtWOOgDcxJOSBIT5mSx9V8?=
 =?us-ascii?Q?JeD7CLwmyHeJLjqA9LK8qqx8fXB6aewj/WCToV1/obBf+1z/7VKOY8xFvX9Y?=
 =?us-ascii?Q?vOvgfpty2wf+Fi3ouCHHEVRvjtLDEdsX1PcQqUS6guOQ5oro+5gMFzHzcGmG?=
 =?us-ascii?Q?MuU3+GPFatGJaHB5ft2+stFBEBluZSY/c4BK+yGJ8uO5ToqNysng2o8NOYPF?=
 =?us-ascii?Q?7j6WktqeLbw0F/a0ZwXGH48b4SMakvScsqZBuPnudML8iUuHGN8iBJhfyGu7?=
 =?us-ascii?Q?hTEodwSE0I20EnZvga6bnGP3Yxmhuy/Co+8K0e5ufVO8ClPCwQuxgrlLKqtD?=
 =?us-ascii?Q?HnQJdkaL86D5uw8/mZbKpQB+VvRvADGuoDc+rXNhYjkbSp3VcqNcoxcwDdMd?=
 =?us-ascii?Q?dq9IJp+cOO63c04Fv5Dl9Up4J/vZ55mL6IgURzVAC3UsKNkhqs3yymxEvcYf?=
 =?us-ascii?Q?XAU2QrxSUaCj0kY6EaqwkAQjaowaWF712XRvSjONWjvC1aSYiBwMJjOI7h7a?=
 =?us-ascii?Q?ng=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 13a13a6e-3760-4866-368e-08db4698dbc5
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2023 20:57:34.1800 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xFdas2ARE6YRffRfONS57sM1aUWO86wI15r5VCBuRYOyztPxHEPJ2Y57T6mIZP+SpiEETqXAu3aFECE7NAP2sQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6182
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
Cc: dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

No functional change here. The goal is to have a clear split between
the mapped portions of the CTB and the static information, so we can
easily capture snapshots that will be used for later read out with
the devcoredump infrastructure.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ct.c       | 155 ++++++++++++++-------------
 drivers/gpu/drm/xe/xe_guc_ct_types.h |  20 ++--
 2 files changed, 95 insertions(+), 80 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 9055ff133a7c..e16e5fe37ed4 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -172,13 +172,14 @@ int xe_guc_ct_init(struct xe_guc_ct *ct)
 static void guc_ct_ctb_h2g_init(struct xe_device *xe, struct guc_ctb *h2g,
 				struct iosys_map *map)
 {
-	h2g->size = CTB_H2G_BUFFER_SIZE / sizeof(u32);
-	h2g->resv_space = 0;
-	h2g->tail = 0;
-	h2g->head = 0;
-	h2g->space = CIRC_SPACE(h2g->tail, h2g->head, h2g->size) -
-		h2g->resv_space;
-	h2g->broken = false;
+	h2g->info.size = CTB_H2G_BUFFER_SIZE / sizeof(u32);
+	h2g->info.resv_space = 0;
+	h2g->info.tail = 0;
+	h2g->info.head = 0;
+	h2g->info.space = CIRC_SPACE(h2g->info.tail, h2g->info.head,
+				     h2g->info.size) -
+			  h2g->info.resv_space;
+	h2g->info.broken = false;
 
 	h2g->desc = *map;
 	xe_map_memset(xe, &h2g->desc, 0, 0, sizeof(struct guc_ct_buffer_desc));
@@ -189,13 +190,14 @@ static void guc_ct_ctb_h2g_init(struct xe_device *xe, struct guc_ctb *h2g,
 static void guc_ct_ctb_g2h_init(struct xe_device *xe, struct guc_ctb *g2h,
 				struct iosys_map *map)
 {
-	g2h->size = CTB_G2H_BUFFER_SIZE / sizeof(u32);
-	g2h->resv_space = G2H_ROOM_BUFFER_SIZE / sizeof(u32);
-	g2h->head = 0;
-	g2h->tail = 0;
-	g2h->space = CIRC_SPACE(g2h->tail, g2h->head, g2h->size) -
-		g2h->resv_space;
-	g2h->broken = false;
+	g2h->info.size = CTB_G2H_BUFFER_SIZE / sizeof(u32);
+	g2h->info.resv_space = G2H_ROOM_BUFFER_SIZE / sizeof(u32);
+	g2h->info.head = 0;
+	g2h->info.tail = 0;
+	g2h->info.space = CIRC_SPACE(g2h->info.tail, g2h->info.head,
+				     g2h->info.size) -
+			  g2h->info.resv_space;
+	g2h->info.broken = false;
 
 	g2h->desc = IOSYS_MAP_INIT_OFFSET(map, CTB_DESC_SIZE);
 	xe_map_memset(xe, &g2h->desc, 0, 0, sizeof(struct guc_ct_buffer_desc));
@@ -212,7 +214,7 @@ static int guc_ct_ctb_h2g_register(struct xe_guc_ct *ct)
 
 	desc_addr = xe_bo_ggtt_addr(ct->bo);
 	ctb_addr = xe_bo_ggtt_addr(ct->bo) + CTB_DESC_SIZE * 2;
-	size = ct->ctbs.h2g.size * sizeof(u32);
+	size = ct->ctbs.h2g.info.size * sizeof(u32);
 
 	err = xe_guc_self_cfg64(guc,
 				GUC_KLV_SELF_CFG_H2G_CTB_DESCRIPTOR_ADDR_KEY,
@@ -240,7 +242,7 @@ static int guc_ct_ctb_g2h_register(struct xe_guc_ct *ct)
 	desc_addr = xe_bo_ggtt_addr(ct->bo) + CTB_DESC_SIZE;
 	ctb_addr = xe_bo_ggtt_addr(ct->bo) + CTB_DESC_SIZE * 2 +
 		CTB_H2G_BUFFER_SIZE;
-	size = ct->ctbs.g2h.size * sizeof(u32);
+	size = ct->ctbs.g2h.info.size * sizeof(u32);
 
 	err = xe_guc_self_cfg64(guc,
 				GUC_KLV_SELF_CFG_G2H_CTB_DESCRIPTOR_ADDR_KEY,
@@ -329,11 +331,12 @@ static bool h2g_has_room(struct xe_guc_ct *ct, u32 cmd_len)
 
 	lockdep_assert_held(&ct->lock);
 
-	if (cmd_len > h2g->space) {
-		h2g->head = desc_read(ct_to_xe(ct), h2g, head);
-		h2g->space = CIRC_SPACE(h2g->tail, h2g->head, h2g->size) -
-			h2g->resv_space;
-		if (cmd_len > h2g->space)
+	if (cmd_len > h2g->info.space) {
+		h2g->info.head = desc_read(ct_to_xe(ct), h2g, head);
+		h2g->info.space = CIRC_SPACE(h2g->info.tail, h2g->info.head,
+					     h2g->info.size) -
+				  h2g->info.resv_space;
+		if (cmd_len > h2g->info.space)
 			return false;
 	}
 
@@ -344,7 +347,7 @@ static bool g2h_has_room(struct xe_guc_ct *ct, u32 g2h_len)
 {
 	lockdep_assert_held(&ct->lock);
 
-	return ct->ctbs.g2h.space > g2h_len;
+	return ct->ctbs.g2h.info.space > g2h_len;
 }
 
 static int has_room(struct xe_guc_ct *ct, u32 cmd_len, u32 g2h_len)
@@ -360,16 +363,16 @@ static int has_room(struct xe_guc_ct *ct, u32 cmd_len, u32 g2h_len)
 static void h2g_reserve_space(struct xe_guc_ct *ct, u32 cmd_len)
 {
 	lockdep_assert_held(&ct->lock);
-	ct->ctbs.h2g.space -= cmd_len;
+	ct->ctbs.h2g.info.space -= cmd_len;
 }
 
 static void g2h_reserve_space(struct xe_guc_ct *ct, u32 g2h_len, u32 num_g2h)
 {
-	XE_BUG_ON(g2h_len > ct->ctbs.g2h.space);
+	XE_BUG_ON(g2h_len > ct->ctbs.g2h.info.space);
 
 	if (g2h_len) {
 		spin_lock_irq(&ct->fast_lock);
-		ct->ctbs.g2h.space -= g2h_len;
+		ct->ctbs.g2h.info.space -= g2h_len;
 		ct->g2h_outstanding += num_g2h;
 		spin_unlock_irq(&ct->fast_lock);
 	}
@@ -378,10 +381,10 @@ static void g2h_reserve_space(struct xe_guc_ct *ct, u32 g2h_len, u32 num_g2h)
 static void __g2h_release_space(struct xe_guc_ct *ct, u32 g2h_len)
 {
 	lockdep_assert_held(&ct->fast_lock);
-	XE_WARN_ON(ct->ctbs.g2h.space + g2h_len >
-		   ct->ctbs.g2h.size - ct->ctbs.g2h.resv_space);
+	XE_WARN_ON(ct->ctbs.g2h.info.space + g2h_len >
+		   ct->ctbs.g2h.info.size - ct->ctbs.g2h.info.resv_space);
 
-	ct->ctbs.g2h.space += g2h_len;
+	ct->ctbs.g2h.info.space += g2h_len;
 	--ct->g2h_outstanding;
 }
 
@@ -400,20 +403,21 @@ static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
 	u32 cmd[GUC_CTB_MSG_MAX_LEN / sizeof(u32)];
 	u32 cmd_len = len + GUC_CTB_HDR_LEN;
 	u32 cmd_idx = 0, i;
-	u32 tail = h2g->tail;
+	u32 tail = h2g->info.tail;
 	struct iosys_map map = IOSYS_MAP_INIT_OFFSET(&h2g->cmds,
 							 tail * sizeof(u32));
 
 	lockdep_assert_held(&ct->lock);
 	XE_BUG_ON(len * sizeof(u32) > GUC_CTB_MSG_MAX_LEN);
-	XE_BUG_ON(tail > h2g->size);
+	XE_BUG_ON(tail > h2g->info.size);
 
 	/* Command will wrap, zero fill (NOPs), return and check credits again */
-	if (tail + cmd_len > h2g->size) {
-		xe_map_memset(xe, &map, 0, 0, (h2g->size - tail) * sizeof(u32));
-		h2g_reserve_space(ct, (h2g->size - tail));
-		h2g->tail = 0;
-		desc_write(xe, h2g, tail, h2g->tail);
+	if (tail + cmd_len > h2g->info.size) {
+		xe_map_memset(xe, &map, 0, 0,
+			      (h2g->info.size - tail) * sizeof(u32));
+		h2g_reserve_space(ct, (h2g->info.size - tail));
+		h2g->info.tail = 0;
+		desc_write(xe, h2g, tail, h2g->info.tail);
 
 		return -EAGAIN;
 	}
@@ -445,11 +449,11 @@ static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
 	xe_device_wmb(ct_to_xe(ct));
 
 	/* Update local copies */
-	h2g->tail = (tail + cmd_len) % h2g->size;
+	h2g->info.tail = (tail + cmd_len) % h2g->info.size;
 	h2g_reserve_space(ct, cmd_len);
 
 	/* Update descriptor */
-	desc_write(xe, h2g, tail, h2g->tail);
+	desc_write(xe, h2g, tail, h2g->info.tail);
 
 	return 0;
 }
@@ -466,7 +470,7 @@ static int __guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action,
 	XE_BUG_ON(!g2h_len && num_g2h);
 	lockdep_assert_held(&ct->lock);
 
-	if (unlikely(ct->ctbs.h2g.broken)) {
+	if (unlikely(ct->ctbs.h2g.info.broken)) {
 		ret = -EPIPE;
 		goto out;
 	}
@@ -554,8 +558,9 @@ static int guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action, u32 len,
 		if (sleep_period_ms == 1024)
 			goto broken;
 
-		trace_xe_guc_ct_h2g_flow_control(h2g->head, h2g->tail,
-						 h2g->size, h2g->space,
+		trace_xe_guc_ct_h2g_flow_control(h2g->info.head, h2g->info.tail,
+						 h2g->info.size,
+						 h2g->info.space,
 						 len + GUC_CTB_HDR_LEN);
 		msleep(sleep_period_ms);
 		sleep_period_ms <<= 1;
@@ -565,15 +570,16 @@ static int guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action, u32 len,
 		struct xe_device *xe = ct_to_xe(ct);
 		struct guc_ctb *g2h = &ct->ctbs.g2h;
 
-		trace_xe_guc_ct_g2h_flow_control(g2h->head,
+		trace_xe_guc_ct_g2h_flow_control(g2h->info.head,
 						 desc_read(xe, g2h, tail),
-						 g2h->size, g2h->space,
+						 g2h->info.size,
+						 g2h->info.space,
 						 g2h_fence ?
 						 GUC_CTB_HXG_MSG_MAX_LEN :
 						 g2h_len);
 
 #define g2h_avail(ct)	\
-	(desc_read(ct_to_xe(ct), (&ct->ctbs.g2h), tail) != ct->ctbs.g2h.head)
+	(desc_read(ct_to_xe(ct), (&ct->ctbs.g2h), tail) != ct->ctbs.g2h.info.head)
 		if (!wait_event_timeout(ct->wq, !ct->g2h_outstanding ||
 					g2h_avail(ct), HZ))
 			goto broken;
@@ -590,7 +596,7 @@ static int guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action, u32 len,
 broken:
 	drm_err(drm, "No forward process on H2G, reset required");
 	xe_guc_ct_print(ct, &p);
-	ct->ctbs.h2g.broken = true;
+	ct->ctbs.h2g.info.broken = true;
 
 	return -EDEADLK;
 }
@@ -656,7 +662,7 @@ static bool retry_failure(struct xe_guc_ct *ct, int ret)
 		return false;
 
 #define ct_alive(ct)	\
-	(ct->enabled && !ct->ctbs.h2g.broken && !ct->ctbs.g2h.broken)
+	(ct->enabled && !ct->ctbs.h2g.info.broken && !ct->ctbs.g2h.info.broken)
 	if (!wait_event_interruptible_timeout(ct->wq, ct_alive(ct),  HZ * 5))
 		return false;
 #undef ct_alive
@@ -821,7 +827,7 @@ static int parse_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
 		drm_err(&xe->drm,
 			"G2H channel broken on read, origin=%d, reset required\n",
 			origin);
-		ct->ctbs.g2h.broken = true;
+		ct->ctbs.g2h.info.broken = true;
 
 		return -EPROTO;
 	}
@@ -840,7 +846,7 @@ static int parse_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
 		drm_err(&xe->drm,
 			"G2H channel broken on read, type=%d, reset required\n",
 			type);
-		ct->ctbs.g2h.broken = true;
+		ct->ctbs.g2h.info.broken = true;
 
 		ret = -EOPNOTSUPP;
 	}
@@ -919,36 +925,37 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
 	if (!ct->enabled)
 		return -ENODEV;
 
-	if (g2h->broken)
+	if (g2h->info.broken)
 		return -EPIPE;
 
 	/* Calculate DW available to read */
 	tail = desc_read(xe, g2h, tail);
-	avail = tail - g2h->head;
+	avail = tail - g2h->info.head;
 	if (unlikely(avail == 0))
 		return 0;
 
 	if (avail < 0)
-		avail += g2h->size;
+		avail += g2h->info.size;
 
 	/* Read header */
-	xe_map_memcpy_from(xe, msg, &g2h->cmds, sizeof(u32) * g2h->head, sizeof(u32));
+	xe_map_memcpy_from(xe, msg, &g2h->cmds, sizeof(u32) * g2h->info.head,
+			   sizeof(u32));
 	len = FIELD_GET(GUC_CTB_MSG_0_NUM_DWORDS, msg[0]) + GUC_CTB_MSG_MIN_LEN;
 	if (len > avail) {
 		drm_err(&xe->drm,
 			"G2H channel broken on read, avail=%d, len=%d, reset required\n",
 			avail, len);
-		g2h->broken = true;
+		g2h->info.broken = true;
 
 		return -EPROTO;
 	}
 
-	head = (g2h->head + 1) % g2h->size;
+	head = (g2h->info.head + 1) % g2h->info.size;
 	avail = len - 1;
 
 	/* Read G2H message */
-	if (avail + head > g2h->size) {
-		u32 avail_til_wrap = g2h->size - head;
+	if (avail + head > g2h->info.size) {
+		u32 avail_til_wrap = g2h->info.size - head;
 
 		xe_map_memcpy_from(xe, msg + 1,
 				   &g2h->cmds, sizeof(u32) * head,
@@ -983,8 +990,8 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
 	}
 
 	/* Update local / descriptor header */
-	g2h->head = (head + avail) % g2h->size;
-	desc_write(xe, g2h, head, g2h->head);
+	g2h->info.head = (head + avail) % g2h->info.size;
+	desc_write(xe, g2h, head, g2h->info.head);
 
 	return len;
 }
@@ -1093,12 +1100,12 @@ static void guc_ct_ctb_print(struct xe_device *xe, struct guc_ctb *ctb,
 {
 	u32 head, tail;
 
-	drm_printf(p, "\tsize: %d\n", ctb->size);
-	drm_printf(p, "\tresv_space: %d\n", ctb->resv_space);
-	drm_printf(p, "\thead: %d\n", ctb->head);
-	drm_printf(p, "\ttail: %d\n", ctb->tail);
-	drm_printf(p, "\tspace: %d\n", ctb->space);
-	drm_printf(p, "\tbroken: %d\n", ctb->broken);
+	drm_printf(p, "\tsize: %d\n", ctb->info.size);
+	drm_printf(p, "\tresv_space: %d\n", ctb->info.resv_space);
+	drm_printf(p, "\thead: %d\n", ctb->info.head);
+	drm_printf(p, "\ttail: %d\n", ctb->info.tail);
+	drm_printf(p, "\tspace: %d\n", ctb->info.space);
+	drm_printf(p, "\tbroken: %d\n", ctb->info.broken);
 
 	head = desc_read(xe, ctb, head);
 	tail = desc_read(xe, ctb, tail);
@@ -1114,7 +1121,7 @@ static void guc_ct_ctb_print(struct xe_device *xe, struct guc_ctb *ctb,
 			drm_printf(p, "\tcmd[%d]: 0x%08x\n", head,
 				   xe_map_rd(xe, &map, 0, u32));
 			++head;
-			if (head == ctb->size) {
+			if (head == ctb->info.size) {
 				head = 0;
 				map = ctb->cmds;
 			} else {
@@ -1168,12 +1175,12 @@ void xe_guc_ct_selftest(struct xe_guc_ct *ct, struct drm_printer *p)
 	if (!ret) {
 		xe_guc_ct_irq_handler(ct);
 		msleep(200);
-		if (g2h->space !=
-		    CIRC_SPACE(0, 0, g2h->size) - g2h->resv_space) {
+		if (g2h->info.space !=
+		    CIRC_SPACE(0, 0, g2h->info.size) - g2h->info.resv_space) {
 			drm_printf(p, "Mismatch on space %d, %d\n",
-				   g2h->space,
-				   CIRC_SPACE(0, 0, g2h->size) -
-				   g2h->resv_space);
+				   g2h->info.space,
+				   CIRC_SPACE(0, 0, g2h->info.size) -
+				   g2h->info.resv_space);
 			ret = -EIO;
 		}
 		if (ct->g2h_outstanding) {
@@ -1185,12 +1192,12 @@ void xe_guc_ct_selftest(struct xe_guc_ct *ct, struct drm_printer *p)
 
 	/* Check failure path for blocking CTs too */
 	xe_guc_ct_send_block(ct, bad_action, ARRAY_SIZE(bad_action));
-	if (g2h->space !=
-	    CIRC_SPACE(0, 0, g2h->size) - g2h->resv_space) {
+	if (g2h->info.space !=
+	    CIRC_SPACE(0, 0, g2h->info.size) - g2h->info.resv_space) {
 		drm_printf(p, "Mismatch on space %d, %d\n",
-			   g2h->space,
-			   CIRC_SPACE(0, 0, g2h->size) -
-			   g2h->resv_space);
+			   g2h->info.space,
+			   CIRC_SPACE(0, 0, g2h->info.size) -
+			   g2h->info.resv_space);
 		ret = -EIO;
 	}
 	if (ct->g2h_outstanding) {
diff --git a/drivers/gpu/drm/xe/xe_guc_ct_types.h b/drivers/gpu/drm/xe/xe_guc_ct_types.h
index fd27dacf00c5..64e3dd14d4b2 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_ct_types.h
@@ -19,13 +19,9 @@
 struct xe_bo;
 
 /**
- * struct guc_ctb - GuC command transport buffer (CTB)
+ * struct guc_ctb_info - GuC command transport buffer (CTB) info
  */
-struct guc_ctb {
-	/** @desc: dma buffer map for CTB descriptor */
-	struct iosys_map desc;
-	/** @cmds: dma buffer map for CTB commands */
-	struct iosys_map cmds;
+struct guc_ctb_info {
 	/** @size: size of CTB commands (DW) */
 	u32 size;
 	/** @resv_space: reserved space of CTB commands (DW) */
@@ -40,6 +36,18 @@ struct guc_ctb {
 	bool broken;
 };
 
+/**
+ * struct guc_ctb - GuC command transport buffer (CTB)
+ */
+struct guc_ctb {
+	/** @desc: dma buffer map for CTB descriptor */
+	struct iosys_map desc;
+	/** @cmds: dma buffer map for CTB commands */
+	struct iosys_map cmds;
+	/** @info: CTB info */
+	struct guc_ctb_info info;
+};
+
 /**
  * struct xe_guc_ct - GuC command transport (CT) layer
  *
-- 
2.39.2

