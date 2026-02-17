Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OJd3LA5ylWn8RQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 09:02:22 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90829153D53
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 09:02:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78B1B10E2E4;
	Wed, 18 Feb 2026 08:02:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gehealthcare.com header.i=@gehealthcare.com header.b="cCJrMfLl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011018.outbound.protection.outlook.com [40.107.208.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EED4810E268
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Feb 2026 14:25:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MFopdbUIHuZIyouAzsfT6SDkwdB/ucZA9Ty9S2xt7uCxRXGgiELlX1UMEw61DsZByEaCqtxGvuk1CCRAoHbXVTAIg38TVJ2FMaPdlhdPBxNY2ItWLvQMQv9D5qhL1QOMMs7V5ujaaPZtDOXa88zc6e3sIU0d0SGqCbzkF5B9JQ+MjAl53R71yjnbP+y+WE6TtR+BpV2HrlqoFeg8V8ZcP1AxU7+XJc7rLOMOf4Bg+O02tS9siy51e7evb/XI3EeaJlyfdOru/cykNyoq5KBcXIRQ2bz7Bo6HzBwCrRO8sZEswjBeU8KuPXYXbRnkWlCIDcNMrYjNgi7fI00eScN0Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bBqtOfJUWsLTEplmoog7HkEMKQgIwKj2ZomOCk7Cia8=;
 b=VS9+lAxfFRFHLj7oTVTJVQVOLMdNqbMb9t8gc8zR7caQCxzrBGHxpHvQwSVqE/i4D8fokCFKU0dUpLwlj+coC2L3nTeW8MYVdS/pyqR4OQxpq92tiqR9B0h5EDhUGNXQnUkjcb7Tnt355xQfIDChtuF/1MpyyUGncBsoVYxZz5eqCXsR+FU9x+yyHP2d1IHuN30bwRDzEb3iGR0CxUAdgFOX9zGUu6rjHCoDhOPxOIjhmYUOTfvhXvR08SqYZGFFMLVMvLlPKQhdxNz3+ZKECZVvI706c7Kmd51IV7siQCZAbu3ByBlvyVGe/mqdHbbK0yMPo/uSMhp9FM+j1f8Gfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 165.85.157.49) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=gehealthcare.com; dmarc=fail (p=quarantine sp=quarantine
 pct=100) action=quarantine header.from=gehealthcare.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gehealthcare.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bBqtOfJUWsLTEplmoog7HkEMKQgIwKj2ZomOCk7Cia8=;
 b=cCJrMfLl3o7lJx+J76t9pFm38KR2cI91hu0xWIDz4QcmHbG8+bsjO4AIcj25lmXCcZfPyulq9OaE2os86zALaHhObNAkU0e7dollaU+/pV3D4mPjttd5Ky2MPzf5KeywMf4/tNiPTVKAU3oafOmsIsr6ZJvCPmTWl93fK8VsrY8w8Pj3b+pDOld7dthHkP3plRntMXI2h2rvnABd3G80b+0vlZXK9bUuVYt7b6OXokfL2J6Wilk/tB469KYW+WKc7PjMYvW5e5mCq22/OiDJMND8ybmGjjamsY92y6t8kHTnCsulGajDMo9iIUwQuX/By3Os0BZmgnCAGxtYvvvwyQ==
Received: from CH2PR18CA0058.namprd18.prod.outlook.com (2603:10b6:610:55::38)
 by IA0PPFAB28BD821.namprd22.prod.outlook.com
 (2603:10b6:20f:fc04::d41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.13; Tue, 17 Feb
 2026 14:25:34 +0000
Received: from CH3PEPF0000000B.namprd04.prod.outlook.com
 (2603:10b6:610:55:cafe::8a) by CH2PR18CA0058.outlook.office365.com
 (2603:10b6:610:55::38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13 via Frontend
 Transport; Tue, 17 Feb 2026 14:25:33 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 165.85.157.49)
 smtp.mailfrom=gehealthcare.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=gehealthcare.com;
Received-SPF: Fail (protection.outlook.com: domain of gehealthcare.com does
 not designate 165.85.157.49 as permitted sender)
 receiver=protection.outlook.com; client-ip=165.85.157.49;
 helo=atlrelay1.compute.ge-healthcare.net;
Received: from atlrelay1.compute.ge-healthcare.net (165.85.157.49) by
 CH3PEPF0000000B.mail.protection.outlook.com (10.167.244.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Tue, 17 Feb 2026 14:25:33 +0000
Received: from zeus.fihel.lab.ge-healthcare.net
 (zoo13.fihel.lab.ge-healthcare.net [10.168.174.111])
 by builder1.fihel.lab.ge-healthcare.net (Postfix) with ESMTP id A75FFE8F41;
 Tue, 17 Feb 2026 16:25:30 +0200 (EET)
From: Ian Ray <ian.ray@gehealthcare.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Sam Ravnborg <sam@ravnborg.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Ian Ray <ian.ray@gehealthcare.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/panel: simple: Correct G190EAN01 prepare timing
Date: Tue, 17 Feb 2026 16:25:26 +0200
Message-ID: <20260217142528.68613-1-ian.ray@gehealthcare.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000B:EE_|IA0PPFAB28BD821:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 0fdb055a-0048-4170-d0ae-08de6e306922
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?3CQ7fLLh55/Jo70EDCC7oeQTgcdGApu/n/fgjOEcTRDz54HNDFEWHq2FhF1+?=
 =?us-ascii?Q?RXIYEqAhblR641Zc6YbrPXMF8JUZaGgOwkFhgcPKi9dXY+3biiik0OYAaJTq?=
 =?us-ascii?Q?IrJETSLnfDE5zaqSDh04vhe7TNmfRMrn8PH7j3aww5zEeaOSb9XBFZadknJT?=
 =?us-ascii?Q?o42qtAGkNWQrEYqJFXKm8s8DDD6icftrhzQEVwvCWm8jyJRO/kDeBNE0s1am?=
 =?us-ascii?Q?7Rx5sPQdDolfdO5Unrc0bQMUTyx3cN1nQnchmGxJs8aiLhMaIwZyhKDBjnt5?=
 =?us-ascii?Q?SAmeL76+UUyBYApYAUZjywHELkvMHOqUn8tsIyu5GG4VT+ohxMkTfuOd3qZx?=
 =?us-ascii?Q?ipHdXgi+/Qar4deQpE1vvhOPsKfCAnNVofeGR+Hp/CszH4+IxvNpH4+ovncC?=
 =?us-ascii?Q?yicFOhxoCxISf8qG+zTYYICsFZ+LjfAt5SqaYVBKBTJhbxbV8MXM5K9pr1N2?=
 =?us-ascii?Q?LQtEuqFV4f0EQKqvr2xe5+xuNtUo0/T/jCskEpqRMoUO2Soto3yMnnMCpk3U?=
 =?us-ascii?Q?QBPoVjWG/HTgBgeK0AgePj9hXYb71GPAmVgvKKiB9czQzUgxQST3EoMtnhOq?=
 =?us-ascii?Q?bbK833KEf0en2pifBIb8Z8N6Np7WLlXLpIM4qJws7m2m9ZCaaqsH0JTAZHVs?=
 =?us-ascii?Q?qfSh+QM4dpqLs0QiQlihCaH8mkAd8bQ1sWA62ILSHka4yR/c98XwJjF2vBIa?=
 =?us-ascii?Q?31/kvMhQTZdrvoxTSOYDAxqyiK0nm2hKtyVhNGkhZQtwafs824I7GhZHMvlX?=
 =?us-ascii?Q?xIt++c5YT9ki5HnzcPr4HnRCqK51F/HqeM1XP5POz1jmHjhqmAU2ZiEUwEb6?=
 =?us-ascii?Q?Y1fdclqYrS/sFXP0sUwoikbvKkEWP8aco/U1+RAhTPJTI7dCAiwbncmsc8F1?=
 =?us-ascii?Q?cvYMqWLH2bTGj87GpcTWMwKtVrK4KlafHsHHBP/KaUdnQgVVXldVxUofA/Ji?=
 =?us-ascii?Q?9bfUzNoh6dAOlvTJxWNfPDxaYwVjux3am7xJVGXUQcBNVvMsdJmBOmgHmKmZ?=
 =?us-ascii?Q?k5c5rc5neJIhd2MyV/cKr+6CG/5n7iS8gmS/3sjOq/HvJbG7MFhcZRhYras6?=
 =?us-ascii?Q?WXBA9ZvKIJgyLQRnNPqvXyFKWnpjN8VKxsoU9pAAAN8uh0w8nfQ/Y6ulylpp?=
 =?us-ascii?Q?XeOUtCk2f2SsWWFpENaoxYSWnhIe1NbwO0zapZHYJU+jJjG9XIplCj4F9cAn?=
 =?us-ascii?Q?SAI2W7sBasPXytUo1rL+bUfiyueV2zttIrAr5ByFp5GtoPV3pDztWDh+H5PF?=
 =?us-ascii?Q?a6Z0pQT6abRTfZrnLjooegvTv/3A91xyZiuZUY5dyLVkYtRbWfREhIsUg0UU?=
 =?us-ascii?Q?iFkcZTuWy4Q4j/S+/Ii1UzeiuqACG9vI7OSRVHdMjkKLgMoe3Qy3BTZ7Tujg?=
 =?us-ascii?Q?fDNlrbL4onO5VrXY2O6q8WNpKOBa57bEjyQDBA+Fq9hhBnVnElWn73ga2XHH?=
 =?us-ascii?Q?Rw6377et4ZfkwQpWi7g691YxfoSbnb3iukdglxUBy0So8jGm7YmgSCiFVOa9?=
 =?us-ascii?Q?ifLMdpYsCN3OGLiCvViwpx5pNNkbY9lLGjDHa18LeMI0QKYQwAuSxY+aiJjn?=
 =?us-ascii?Q?IPcFekSLptQzAjGbOargRYuC++E4LnCieDJH+in5o2X2QIGtPt4a3CTr2Lds?=
 =?us-ascii?Q?9wd1AEkZ6lP8ra9NCn/LupmgbpE8k5vhlKYDu+m2fIMEJtaxRcflqjtLJpdO?=
 =?us-ascii?Q?vH1D6g=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.85.157.49; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:atlrelay1.compute.ge-healthcare.net;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: LvuTGMQ3MdyK5HmMg9XuFjtBvI+kdw8/fFfBHEprIPyDa2EMgbjhIUdPYOfITRxIp5xOB/9vC2TH8VtrM/tTeBdxOtgLG0Kibf/LJUC6+HVnWLnMX+RzxiIfoZd2W8gNGrw0ZGdKAqABB4MiQhsQO0OZiBkxQFmSIdsFsqOMc3mP9XFaQ9jTM7J4D8irTREd5J+DVmiihP1S8fF86jGRCUHnSURazdTO3VVskULoeKO6tIBu51/6IMyZmAQW+CHBKcsHGlSTNxjRVIt+tOaEzlFrED63idRfupj2BLxxXC9K1DvSQF9f0I31whZjiuLvpNN3ySUQIg1yrcTEnC8oaZ1qDoSJ/2lgpf4663g4NBvgtyCNKKxe7kvU3HrBKfn0LqTLSQOWf1KGKu4eIsI6H5S5mOt8fUo+/q5T9dZOxfYLtMn0/irTmJIJFOx2rAx3
X-OriginatorOrg: gehealthcare.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2026 14:25:33.3392 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fdb055a-0048-4170-d0ae-08de6e306922
X-MS-Exchange-CrossTenant-Id: 9a309606-d6ec-4188-a28a-298812b4bbbf
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=9a309606-d6ec-4188-a28a-298812b4bbbf; Ip=[165.85.157.49];
 Helo=[atlrelay1.compute.ge-healthcare.net]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH3PEPF0000000B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPFAB28BD821
X-Mailman-Approved-At: Wed, 18 Feb 2026 08:02:15 +0000
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gehealthcare.com,quarantine];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gehealthcare.com:s=selector1];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:neil.armstrong@linaro.org,m:jesszhan0024@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:sam@ravnborg.org,m:sebastian.reichel@collabora.com,m:ian.ray@gehealthcare.com,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[ian.ray@gehealthcare.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_TO(0.00)[linaro.org,gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,ravnborg.org,collabora.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gehealthcare.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ian.ray@gehealthcare.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 90829153D53
X-Rspamd-Action: no action

From: Sebastian Reichel <sebastian.reichel@collabora.com>

The prepare timing specified by the G190EAN01 datasheet should be
between 30 and 50 ms. Considering it might take some time for the
LVDS encoder to enable the signal, we should only wait the min.
required time in the panel driver and not the max. allowed time.

Fixes: 2f7b832fc992 ("drm/panel: simple: Add support for AUO G190EAN01 panel")
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Signed-off-by: Ian Ray <ian.ray@gehealthcare.com>
---
 drivers/gpu/drm/panel/panel-simple.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 91ab280869ba..a242ae284db5 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -1295,7 +1295,7 @@ static const struct panel_desc auo_g190ean01 = {
 		.height = 301,
 	},
 	.delay = {
-		.prepare = 50,
+		.prepare = 30,
 		.enable = 200,
 		.disable = 110,
 		.unprepare = 1000,
-- 
2.49.0

