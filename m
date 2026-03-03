Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wE+5J5X8pmk7bgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 16:21:57 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6CBA1F2708
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 16:21:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA60A10E832;
	Tue,  3 Mar 2026 15:21:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=inmusicbrands.com header.i=@inmusicbrands.com header.b="Iv1rs07b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11021114.outbound.protection.outlook.com [52.101.62.114])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 581AB10E832
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2026 15:21:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=petrX4HUcpU4ZHx7KNd63I4Jv8ZwKnFOM3MLJ0zekN+OOxey1+p3WCmtwPsUbXM6xHXYO3rCOsYBPxHG736EzMbH9qWmINqKacWoPsyFE/LrC40Sbns/mVmJY7+Bszg2L4KvCfa+fnPTP4+1lnLjExQIj8W8pslGmqIZBXY0dpoob1GKkONsWLB8BKsN0GczdoUCkZyDGab+IxM85V2lMI4o7NAJ0iW2X/5TIFaPh/nq+uQfqVrkEWI7suqgNmVI02Kh/HXnF+8FQxfRsW/T/4upifZLL+GZzVx9yL99veOLjfDNomHJrNFa5iAnfEQm2FTQxVH5ZEdG5npuctHFSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CikKXBF1yaWuV5g4FOH0eax5SLODx2kEeSmGxSyd95w=;
 b=Ex3JBHz3Au0u6wmqSjzngCawxvl3Wo+7Lsp5sNfUi4Fo5NnsqOO+QaXEY/PM/Gbe1Upaj9D9ct50f3Qb2xQR6n7SXBFvvSwE2uCtMjRp80NDQgz96HGUKvf0KGJc4Nb95TBivjrXV969TJfU/nqFBzTMCQaCVolFmt8B3jP9LZFN4RXyIadCm1M01+ozKb4OyUmZsUHd4RyslrFCcx4l8wLx+mJL6RU8vowd8He7b9CGVip3I4OLP3JwFmTBjVTZCcmn3O75wL+NrbodPbpi27BjZ15QB3oU8DKPSvDE0+Jiwmmr8DshqdqQcWZcgs2uwZ3VMr0F03qaSFNk7OSC7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=inmusicbrands.com; dmarc=pass action=none
 header.from=inmusicbrands.com; dkim=pass header.d=inmusicbrands.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inmusicbrands.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CikKXBF1yaWuV5g4FOH0eax5SLODx2kEeSmGxSyd95w=;
 b=Iv1rs07b7NYKzJoFvzhNgurQP8+j7BQupFnJpNquJbGUk4ig/LbbVvW5Ekvh2t/2/L9vJTybwVbUN0G627zZW6cxjDAuIYalzrJFevEMcUsgxr9Ri0csYGvk3PSMrhde+JA9nu2LKHYj6ks85iBGcI6Bedq5XiTPCdfwXozYjCo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=inmusicbrands.com;
Received: from MW4PR08MB8282.namprd08.prod.outlook.com (2603:10b6:303:1bd::18)
 by DS4PR08MB10752.namprd08.prod.outlook.com (2603:10b6:8:27f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Tue, 3 Mar
 2026 15:21:39 +0000
Received: from MW4PR08MB8282.namprd08.prod.outlook.com
 ([fe80::c887:c930:70aa:b156]) by MW4PR08MB8282.namprd08.prod.outlook.com
 ([fe80::c887:c930:70aa:b156%5]) with mapi id 15.20.9654.020; Tue, 3 Mar 2026
 15:21:39 +0000
From: John Keeping <jkeeping@inmusicbrands.com>
To: dri-devel@lists.freedesktop.org
Cc: John Keeping <jkeeping@inmusicbrands.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/panel: ilitek-ili9882t: use gpiod_set_value_cansleep()
Date: Tue,  3 Mar 2026 15:21:24 +0000
Message-ID: <20260303152124.187791-1-jkeeping@inmusicbrands.com>
X-Mailer: git-send-email 2.53.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO3P123CA0005.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:ba::10) To MW4PR08MB8282.namprd08.prod.outlook.com
 (2603:10b6:303:1bd::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR08MB8282:EE_|DS4PR08MB10752:EE_
X-MS-Office365-Filtering-Correlation-Id: de86f0a3-ba1f-4973-0d7a-08de7938907f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|52116014|376014|38350700014; 
X-Microsoft-Antispam-Message-Info: WD76Umvexv/wf0Xgd0sIGqjpiE07WGLgYPJlDfmD1h6obVD7gUgUXw8vMq5uc6CroTu3rtGK/WCoGBqMn49/Zxb2AfU7/MFWD4A1hkVm7ge8nrQa+zGvZ+7Wxoguj/gGjFVmJ+OX+SKEUNzgSQccHtSbQZzrGPv3g3WXT6bYMmLrR5CwnaaxC3lqAWBR2C04KytmQwHtdKAlIpztSWW923MDzX4Y55JqYNC8ZQt2g09DKwHKBy1vpDaFJBN/bKDmuXnO8ObnkInaOAHr+4SzFo9lWcelAbHXZKsGls+oSONMd0ZtDlEuz5ogEDzNzRiHGtcv8wHHE6B/hCCeEhQBScUnZAvbNSdNDxJyhyEZSNX959oHfhnbq8qrgGLkAbQN3w4EjoK2SjEdy2LtZwdHZLI1z0MUjrb5GxcOsO3iHx9mpSjsCkrW1bW2qaQjsG/k7M7my+lR2S653lhkIeG0+eHXdiLqCgMOSXlO4/OkxDlJX86nVDDRGibfTd2T7eZvObAOWqvziJd8mfFgqK099AsP5043KHmggsdJ1OUBg9eWRkkyKxm+d6+KuTCw/g65RqieZIap5ui9cyp1Bw657hwzuCee3dVJ+B1kJ1dg4Vb9ixf6ZE9s+93AckiyvS6pUHxYrodvCIUotqy0F2lMBCzOuclFo+JN9OLSqzk7eytp6XtJJRjIitCZpdvFADizMg8grz27r+JavO+l1yNb87o++wR3lWF3XAq3m/OwxMTCJRxWz64Ci+oYj6VnDY58g8EzFBYoBZ1z3b5G0AKHVB+FVf4gxWHpRzkdYtTp5nE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR08MB8282.namprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014); DIR:OUT;
 SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4o1+kaaSSJsB6r0C/sXTJegF2mLK1Jrls8wUKbQDD93iK5yE5wBK8V4Z0mvl?=
 =?us-ascii?Q?me/sDrlTWK7SyFLaSHbJdUFIlbSfG/ioByHGKxgz9+pURHZt/z5YmWGpHrxL?=
 =?us-ascii?Q?eL3AxttQo+8xQmR3PAyBmBaWqnoQexOJk48inoY075/Aq6lj/LvjiExlPzxb?=
 =?us-ascii?Q?Zm2jIGfjqXZ+WNCd4Z7s3pIZWEjEeqsUDVwPufzIJpOIAUBx5Gae9g7XXfO3?=
 =?us-ascii?Q?VI9zRESVb+okCCAuCnctJhE0vwvXyjnPSRHyEv1opqXmrhX0UPsydh6ikCCt?=
 =?us-ascii?Q?jYpn87v3Tu2jFxNGllyQo8Ti9bQCS7XGeJOnbnMcO2Tq+sxVBqPRYBpVrGy5?=
 =?us-ascii?Q?b+sglverL1oTGVZnJj7bbcsOAxDAFujkoPTQY6DWo5g1FiMlGRmV+H8MmLEI?=
 =?us-ascii?Q?Kf1EFV8JFm5MHTc4LlMkiELWPblaLVeDd/KXq9kwBfCGsRlq1pY1O23N8/s3?=
 =?us-ascii?Q?Du3Fesb6N3u7RLDTJhyq5UgTLyI0O74zv0GdS4N2k9ngQRv5jX1n8UI1uOsN?=
 =?us-ascii?Q?cIJD4HPLedwzGfYHRn+11XDePGD/EPDqxJ3ZNyjS3J4ZLKJL9HMR6RsQidYQ?=
 =?us-ascii?Q?qtJfEolmGqF3UIboGKYlA6w0g3jfP8kF61HDD5J9JsmrUaxDnDuRN7laKmn8?=
 =?us-ascii?Q?aIpna017W00rlJLtGckYFQrKlT6oveLVo97WY3bVBhi7qoP1bEb17QGuS3DN?=
 =?us-ascii?Q?dkHws+BMgdYUbChw/KDXLLkNQiHBDV4bJVdo293sWBNCh/wZB/tMNSfPtNjG?=
 =?us-ascii?Q?RO7DWpbrKsZgqq38HKFn1vOKP6fTL8c9jiZlsmF/1q9ggM4TpppoT/4iYTsw?=
 =?us-ascii?Q?YzOyC1tnyWMurdoYSWK4/QwmLfdPKOIALtWWvB63VL8igyW4FnClTyylhouI?=
 =?us-ascii?Q?/hN2TF8Yy9D7VDHAgbDX4SiAvb2740A8L9g4OckYkgYgRi2EuYrWZ35b0YYw?=
 =?us-ascii?Q?Vg3uK3cxGR2ez/G2tlLlWgTUjVozkRr5AO0/BW2VvItNKhAv16WDrN7c2xPX?=
 =?us-ascii?Q?JSGSuQaIYupNjBj9HvKki5dnkmFDXMdhI2ZVVwklhnbesvxp7b1WJqWX8jhG?=
 =?us-ascii?Q?pXyL2H3U232/4KV6aLZRVum59mQlSrG2krkhfKXwrCLUHcWw4DW9Q67lB1M7?=
 =?us-ascii?Q?pGXXL+ogpAADqSW/tVZsFRPS37AB/i5bnZPdW2sUiEsuupfMtKDeQ5E/IOfG?=
 =?us-ascii?Q?EILJ0T9lZ2y5SkkqS4z/H2J1K9aeZ8KOdPMb0sXfjOH6mDdQJot9kMnhFxJH?=
 =?us-ascii?Q?mVID8aTL7pSUkkxUcvrri7CpoBBwZ8iKkhHJil9ftrfDxzEbcRNiR0T9lZy+?=
 =?us-ascii?Q?0JLwM1A61aO+WZTjsQuiZx+HDPlSYhi1d5J5/iNzwsL0unMjzvLfwCfgfSSU?=
 =?us-ascii?Q?hvu4uv6Oy8Jzo8LYW6V07u4uUMWwXO37btwR+Or5zySh9AhWNZJGXFF+J4ps?=
 =?us-ascii?Q?m8kaUNtRZITI+5LAIweTN5tNr9e610WB8yHmDWXy8AbD0ZT/6F4K4n49R31A?=
 =?us-ascii?Q?6AEqB5MCJnB4PhxVGwtoCaJZKnmckczxc/4Hr6ZSCdlnmzbSNB+9P+rf7hIu?=
 =?us-ascii?Q?X91ssj98n4OV0hRocKX3ykFMdFQ8T7+qtkXDhCrPGbteOsmlUUXmmV4Wimkj?=
 =?us-ascii?Q?b7R9ErHAwhxdWVZ5uXwholaKGZ3hUaqi3gv+TeZcDSoEdHhD43pT+dj69n2w?=
 =?us-ascii?Q?d5sRYBmbSLSiqd32aYVS8NR8Y3SWh9QQL10PQwoNMaXjzxmriJWMCJt8SaWP?=
 =?us-ascii?Q?jVcoYfVkXVmRFvrNBKrpS1CNbp3JEBI=3D?=
X-OriginatorOrg: inmusicbrands.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de86f0a3-ba1f-4973-0d7a-08de7938907f
X-MS-Exchange-CrossTenant-AuthSource: MW4PR08MB8282.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 15:21:38.8187 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 24507e43-fb7c-4b60-ab03-f78fafaf0a65
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5zH+97fgIpm5+53KkTwCqEFdXzVwkuM9WlwLEsTUlbEdvDccCORY19mWMc+HXl5EQUCAko9zeIulHK0huJupUIpAgE/kCbGqLJAeeiHa+LA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR08MB10752
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
X-Rspamd-Queue-Id: C6CBA1F2708
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[inmusicbrands.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[inmusicbrands.com:s=selector2];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[inmusicbrands.com,linaro.org,gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[jkeeping@inmusicbrands.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[inmusicbrands.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,inmusicbrands.com:dkim,inmusicbrands.com:email,inmusicbrands.com:mid]
X-Rspamd-Action: no action

All of these GPIO calls are in process context where they can sleep.
Use the appropriate function call to allow use of this driver with GPIO
controllers that might sleep.

Signed-off-by: John Keeping <jkeeping@inmusicbrands.com>
---
 drivers/gpu/drm/panel/panel-ilitek-ili9882t.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9882t.c b/drivers/gpu/drm/panel/panel-ilitek-ili9882t.c
index 8b2bfb7d36385..5f4e0d82ee673 100644
--- a/drivers/gpu/drm/panel/panel-ilitek-ili9882t.c
+++ b/drivers/gpu/drm/panel/panel-ilitek-ili9882t.c
@@ -592,7 +592,7 @@ static int ili9882t_unprepare(struct drm_panel *panel)
 {
 	struct ili9882t *ili = to_ili9882t(panel);
 
-	gpiod_set_value(ili->enable_gpio, 0);
+	gpiod_set_value_cansleep(ili->enable_gpio, 0);
 	usleep_range(1000, 2000);
 	regulator_disable(ili->avee);
 	regulator_disable(ili->avdd);
@@ -608,7 +608,7 @@ static int ili9882t_prepare(struct drm_panel *panel)
 	struct ili9882t *ili = to_ili9882t(panel);
 	int ret;
 
-	gpiod_set_value(ili->enable_gpio, 0);
+	gpiod_set_value_cansleep(ili->enable_gpio, 0);
 	usleep_range(1000, 1500);
 
 	ret = regulator_enable(ili->pp3300);
@@ -638,11 +638,11 @@ static int ili9882t_prepare(struct drm_panel *panel)
 	}
 	usleep_range(1000, 2000);
 
-	gpiod_set_value(ili->enable_gpio, 1);
+	gpiod_set_value_cansleep(ili->enable_gpio, 1);
 	usleep_range(1000, 2000);
-	gpiod_set_value(ili->enable_gpio, 0);
+	gpiod_set_value_cansleep(ili->enable_gpio, 0);
 	msleep(50);
-	gpiod_set_value(ili->enable_gpio, 1);
+	gpiod_set_value_cansleep(ili->enable_gpio, 1);
 	usleep_range(6000, 10000);
 
 	ret = ili->desc->init(ili);
@@ -652,7 +652,7 @@ static int ili9882t_prepare(struct drm_panel *panel)
 	return 0;
 
 poweroff:
-	gpiod_set_value(ili->enable_gpio, 0);
+	gpiod_set_value_cansleep(ili->enable_gpio, 0);
 	regulator_disable(ili->avee);
 poweroffavdd:
 	regulator_disable(ili->avdd);
@@ -793,7 +793,7 @@ static int ili9882t_add(struct ili9882t *ili)
 		return PTR_ERR(ili->enable_gpio);
 	}
 
-	gpiod_set_value(ili->enable_gpio, 0);
+	gpiod_set_value_cansleep(ili->enable_gpio, 0);
 
 	err = of_drm_get_panel_orientation(dev->of_node, &ili->orientation);
 	if (err < 0) {
-- 
2.53.0

