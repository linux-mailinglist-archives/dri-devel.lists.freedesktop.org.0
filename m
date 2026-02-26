Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qKhaMdAUoGlAfgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 10:39:28 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 779FD1A3931
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 10:39:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75A8910E075;
	Thu, 26 Feb 2026 09:39:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="1og43MaS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012065.outbound.protection.outlook.com [52.101.53.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1064A10E075;
 Thu, 26 Feb 2026 09:39:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EUe/q02HSa2ypp4t+3hGQ5AxjNfKnqlKQ0dvoHWp0hIA257lnM+rpKFpDj3nbwpn5aKBN2sYHT9oqj5vbmlftm/2vugIY2v1ACy1dIawB+jN0uIWy5TkiL5fRS9fsWRt3pDnTkxietQH00VM9ILqpIroNeWVhn3PanFmhfZFG7btTcr9PHzpdF7WUMRy40gMuH5DpVCdXvFOWmBbKqI0w1ensXtlU6gdctHyAKsJDfHm2BOf0NqJ0O90GyN9U/OwOFWDJXlDe9ZFKUeOQHPFo3J9ZyeITJOFS/Ya8LmpcdezC+l2QcmmoPWC8TAZAv8yFZv8teKEHMo8XQwRaB6iCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uxLw4OKiqZ6b46fhIuE+QE7luBlDkZu03XbRWVWAkEk=;
 b=beIy2IV2xxDEM4icaVvEPywl/bGK/rIysBHNZrFAzfswVQQIVnD9CubB5euiwF1PS9SmIJBtiz+V5ZZeRT37JpgIbrKuTAKs6sisWyBsy7rI4a08z8Ii6S0nbpcT9H0cWc3RfHIxYjqBxUpR//qiB7XF3FuM8pqdeTgDIFF2h9OpJF8wn7NIbCUg3Qxzg69SmzB9me2NMG3twy/gYosP4sxq36DnYqY9jN1UKgP6LQZ1EAWavphRHuEvrUDIDS/4ziC9ejHaXuEOBi6MMLAU2Z/EVJPI9GPKBLsQi+CEdeJUre7xx4LgCaxFoDuow+Enz3ib9pohLmVl5w+/a5btww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uxLw4OKiqZ6b46fhIuE+QE7luBlDkZu03XbRWVWAkEk=;
 b=1og43MaSJuAU+k2+6dGBV72EIKT9FONlWESqN6RYIL0ocRL5ST3mrFABIYzhuw+gD7k+Q+Xt/uHBIuCm2nYcCDEj6zM4iAuONSxpfRz1xp2b1IdnALfBftj0r+9OBvdUurZEVDkdaWxMH4J+nrwgA9RnHOpnqyWasi9IWcMhtEo=
Received: from SN7PR04CA0166.namprd04.prod.outlook.com (2603:10b6:806:125::21)
 by DM4PR12MB6542.namprd12.prod.outlook.com (2603:10b6:8:89::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.14; Thu, 26 Feb 2026 09:39:17 +0000
Received: from SA2PEPF00001509.namprd04.prod.outlook.com
 (2603:10b6:806:125:cafe::8e) by SN7PR04CA0166.outlook.office365.com
 (2603:10b6:806:125::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.25 via Frontend Transport; Thu,
 26 Feb 2026 09:39:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SA2PEPF00001509.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Thu, 26 Feb 2026 09:39:16 +0000
Received: from FRAPPELLOUX01-WSLPUB.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 26 Feb 2026 03:39:14 -0600
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 1/6] drm/amdgpu: include ip discovery data in devcoredump
Date: Thu, 26 Feb 2026 10:37:19 +0100
Message-ID: <20260226093727.2584-1-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001509:EE_|DM4PR12MB6542:EE_
X-MS-Office365-Filtering-Correlation-Id: 8aa76ff7-7992-413b-a94e-08de751ae881
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|82310400026|376014; 
X-Microsoft-Antispam-Message-Info: ZiLPvUHFbqT+/PQ2pgIWThhPLw+ENLez4rSGGLv30wylnLCeSU/biOekNPN7AV2Oo+dGMIrA2cTkrSu3dGL4V0aKs1kiqyJF0qee0TrjWyOmUJo9mFrJJ+AxOhKHw3YYh7gfAWTKfHrNG+32l+7zQH5MEKr0aHTAA94a8poAsrxGRI+xKd87p6Z/Dsl0TKub5vRWTif+SuruLs78xXmp9rihWDiGEOTmDUu6F3K5RtrqHxOEU3CVGOxk3HH9uZujuwYZ5bJ3jn+ETMumPxkiu9DFA0w1wy/uGMVOdmnx3ymwilontFf5FiamQGdkSAndWYuSQ6G00pTBJ87jU10NGRMgT8oVLd6oYtfZzB4T4JIYSpsCqsp9gx8wN2z7GWRajEUYPeo4fQXiZiKPm1e4FB09rYuS74Pjlgc6pUJWp3EZHHXtjUcuMvVWZG10oRCcFF8AK031reICHhos2dUTmP6TdHueRWVseJ7jlfRhk3uvarZkbM7csK2ISwvoB+8t+e0RQr+O2TaULx8iRrHKD68RH53k/v6gLv82gv1dy8LMlCHFgxcuQ3Be7+08RX9WIe2ppeiDZtlsCcN3X/fmEHFfcf9rW9wsGUVGmHTXPC9f0ex3qKw1MrcA2K/2DLupk0d/5fGGc8jVRJfmiA9cH6WGG93cAjdYOAIoOCM16UtQ+uTfJaTquhD3E02M4qeQ39Dh8JqS/tWegAuWpBU73YRdfReAyR/aCU4jAQv9J+yK1ep3zOf4P8Fvop6Uvo4BVtab0sVXAALQTB4f1Q4JY/E2O19XbKUQEdeoGghqS2AvOn+S1pGvPH8+0fSclpdL7Sh/u0NV8rw82wwfYw5oZw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: QuhDvQH/Y2WVywd6Rxz1nFmHmmYBwoBrhK049eL7zcmh7JoQUxyK6dNB1hu6EwzT6taSlLLtjHDem+bu8lh3GxmnPhw1zu7YuEhnpZS8ZfF5yfb69auwdprfnRo2a9TqayVJDzWAGN0i1A3/nvOUIK53Bj4r4Tk5Vd2HH33O7raQARitKsE89OW/jeaR/0IwDV5F/EhxaqIhM4Xa8S9xWtq+0vBp6WkoWA1Q27cZHw6E9N4w1+yEmL6vDAY11ntG1fEI58RhaZL60UfCbDaouOms3wiXNyS2Tef9FaTGuMzGox52d87LgFFScUnB7Czji+jBAY+IBU7SDM3XEY9ejhUzvlgmYtn62rPWSkVaratnWX9qnyhyV8REIwJAwK/Hu5LybETiGiACyUMD7j2zh2xvJzSklPUkG0kXKl6C0XFrP0oSiKpqNq10N60O1rzh
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 09:39:16.2990 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8aa76ff7-7992-413b-a94e-08de751ae881
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00001509.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6542
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
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[amd.com,gmail.com,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[pierre-eric.pelloux-prayer@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_XOIP(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:mid,amd.com:dkim,amd.com:email]
X-Rspamd-Queue-Id: 779FD1A3931
X-Rspamd-Action: no action

This is the best way to describe the GPU to a tool loading
the devcoredump.

Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
---
 .../gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c  |  2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c | 42 +++++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.h |  3 ++
 3 files changed, 47 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c
index 0bb430853a9f..42a969512dcc 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c
@@ -262,6 +262,8 @@ amdgpu_devcoredump_read(char *buffer, loff_t offset, size_t count,
 		}
 	}
 
+	amdgpu_discovery_dump(coredump->adev, &p);
+
 	/* IP firmware information */
 	drm_printf(&p, "\nIP Firmwares\n");
 	amdgpu_devcoredump_fw_info(coredump->adev, &p);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
index 41e63c286912..d7325c23fa53 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
@@ -1380,6 +1380,48 @@ static void amdgpu_discovery_sysfs_fini(struct amdgpu_device *adev)
 	kobject_put(&ip_top->kobj);
 }
 
+/* devcoredump support */
+void amdgpu_discovery_dump(struct amdgpu_device *adev, struct drm_printer *p)
+{
+	struct ip_discovery_top *ip_top = adev->discovery.ip_top;
+	struct ip_die_entry *ip_die_entry;
+	struct list_head *el_die, *el_hw_id, *el_hw_inst;
+	struct ip_hw_id *hw_id;
+	struct kset *die_kset;
+	struct ip_hw_instance *ip_inst;
+	int i = 0, j;
+
+	die_kset = &ip_top->die_kset;
+
+	drm_printf(p, "\nHW IP Discovery\n");
+	spin_lock(&die_kset->list_lock);
+	list_for_each(el_die, &die_kset->list) {
+		drm_printf(p, "die %d\n", i++);
+		ip_die_entry = to_ip_die_entry(list_to_kobj(el_die));
+
+		list_for_each(el_hw_id, &ip_die_entry->ip_kset.list) {
+			hw_id = to_ip_hw_id(list_to_kobj(el_hw_id));
+			drm_printf(p, "hw_id %d %s\n", hw_id->hw_id, hw_id_names[hw_id->hw_id]);
+
+			list_for_each(el_hw_inst, &hw_id->hw_id_kset.list) {
+				ip_inst = to_ip_hw_instance(list_to_kobj(el_hw_inst));
+				drm_printf(p, "\tinstance %d\n", ip_inst->num_instance);
+				drm_printf(p, "\tmajor %d\n", ip_inst->major);
+				drm_printf(p, "\tminor %d\n", ip_inst->minor);
+				drm_printf(p, "\trevision %d\n", ip_inst->revision);
+				drm_printf(p, "\tharvest 0x%01X\n", ip_inst->harvest);
+				drm_printf(p, "\tnum_base_addresses %d\n",
+					   ip_inst->num_base_addresses);
+				for (j = 0; j < ip_inst->num_base_addresses; j++)
+					drm_printf(p, "\tbase_addr[%d] 0x%08X\n",
+						   j, ip_inst->base_addr[j]);
+			}
+		}
+	}
+	spin_unlock(&die_kset->list_lock);
+}
+
+
 /* ================================================== */
 
 static int amdgpu_discovery_reg_base_init(struct amdgpu_device *adev)
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.h
index 4ce04486cc31..c8242992c912 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.h
@@ -30,6 +30,7 @@
 #define DISCOVERY_TMR_OFFSET    (64 << 10)
 
 struct ip_discovery_top;
+struct drm_printer;
 
 struct amdgpu_discovery_info {
 	struct debugfs_blob_wrapper debugfs_blob;
@@ -47,4 +48,6 @@ int amdgpu_discovery_get_nps_info(struct amdgpu_device *adev,
 				  struct amdgpu_gmc_memrange **ranges,
 				  int *range_cnt, bool refresh);
 
+void amdgpu_discovery_dump(struct amdgpu_device *adev, struct drm_printer *p);
+
 #endif /* __AMDGPU_DISCOVERY__ */
-- 
2.43.0

