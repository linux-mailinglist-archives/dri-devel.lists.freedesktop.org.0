Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39077B1DA01
	for <lists+dri-devel@lfdr.de>; Thu,  7 Aug 2025 16:39:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9757110E873;
	Thu,  7 Aug 2025 14:39:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="kdbvClXU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TYPPR03CU001.outbound.protection.outlook.com
 (mail-japaneastazon11012051.outbound.protection.outlook.com [52.101.126.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D1FD10E873
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Aug 2025 14:39:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fw25eXp7lE0NJX5Cit1mrhThT6jUkOL3H4qS79yka0C0jsAwE5OaBmXg0+eqv6vDa99KgKcNGfKUqsxQkPnd6EY6oPsOWz0CGhL75bHC8/8O3FmYXYIJoHHjYpC45EznmzTIlPXtttOWXVZN64jlxopMGagLT1QSup+PlYZNrf+4k+1+GblEcVeXGpjAmxivchV1xlpxsv2TNwB9MS3DWqufQ8FVHhBa52vp2C60cv4BKSURC5KcCNZGsWbR0MYnK9IbESOxucYq9n7DoT68VJUYv0inLbiEZJ85a21uXTJ+kF//xp1cGMfqX6oMqzckIS8NVPOUGVEh5cLvE7fLXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MNqdC+EGKriezHA3iUYZCf/NiZC26nxUAqGbQ7B89Hg=;
 b=FOxmUzrN2vc1BNHXwl5i3r2yq6SfjBlZ1QIphX2RCN2Bukj3jJG+Hd7bDbEs9JgOLElFQYbOzixXkCe1atEvRJM4hh2iKzNe31whBZJpUqo8M4zWDAe27K4LryyZ4YphhyUlaO0xL3HCxQSK1iZHmxGiX7HlDLrMHikVkBAleD9hVYs5t5tCpFzSFxK9OydTmlgmtEQmZIjPXpMcJXPh0rBBGnwluOH2YMjDpJghVgtIpjR3eL+QzhvrOgAEqPx+G3bOf635DDgj5YFnopiYCdL/goiT009ORFZP9lKK5M7fyJKK4Cmrd2uPeIeA/jnA1TR8eNCl0ryauOmpOjaqgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MNqdC+EGKriezHA3iUYZCf/NiZC26nxUAqGbQ7B89Hg=;
 b=kdbvClXUY1IQk6S+8+N4kPd/Jvn+uFI3ugO1L3R3PpPwMg8advmyMMxBKxEg2rR7xVNTil8DGQ3wYzaHMkUO+TXmR0C+6PI5OAINwd2yrxaRreK3UkYNszwIQFeF+TQ2U9Ow7eWgSG0lWKKfjE+rQMyKUm4T38Z2qJNtKuC7q0SG4Q+/rqVJa8DuhXfZO53y4wuFa18YzlbC98RoQ8ZN8l2uaK6B5V9ztMYVhipL3w37jI4YNcnE9lb0aHYwtu7MhdxoXZL4LjXEcD2rmLWrHMDtTIKESXRBjxrYxizpYNEPAiN3FAXeBlTX6twD4yRIHdRiw+3eNz0cOGAI9Qh4Lg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com (2603:1096:4:1af::9) by
 SEZPR06MB7175.apcprd06.prod.outlook.com (2603:1096:101:22a::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9009.14; Thu, 7 Aug 2025 14:39:40 +0000
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666]) by SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666%4]) with mapi id 15.20.9009.013; Thu, 7 Aug 2025
 14:39:40 +0000
From: Qianfeng Rong <rongqianfeng@vivo.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org (open list:DRM DRIVERS),
 linux-kernel@vger.kernel.org (open list)
Cc: willy@infradead.org,
	Qianfeng Rong <rongqianfeng@vivo.com>
Subject: [PATCH v2 1/2] drm/locking: remove redundant __GFP_NOWARN
Date: Thu,  7 Aug 2025 22:39:10 +0800
Message-Id: <20250807143919.575439-2-rongqianfeng@vivo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250807143919.575439-1-rongqianfeng@vivo.com>
References: <20250807143919.575439-1-rongqianfeng@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0115.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29c::19) To SI2PR06MB5140.apcprd06.prod.outlook.com
 (2603:1096:4:1af::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SI2PR06MB5140:EE_|SEZPR06MB7175:EE_
X-MS-Office365-Filtering-Correlation-Id: ecbc9236-4eb1-4ef9-33c4-08ddd5c03d4a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|366016|1800799024|376014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ROilySlRhWp6wm0fvxoKHR+MnlADKC9yPXb4p0yemJzqNRBAU1oS5cFSRX8s?=
 =?us-ascii?Q?1lFktLNnpkFansfxa7qxOz8NvRVZd16pOGYfQev8DII96kw4IJiqlGNFL8+B?=
 =?us-ascii?Q?Rp+DQVkIxndE4/pXMuj/WTALEv/4azA2xWQU/7R+NfC3bXIiSRb3XDxfigJL?=
 =?us-ascii?Q?Q3mBlreJ911bUrcWeW75SmjFq9bE9S7mXaQ970XJCBxdA6FxRjXpLK9Xeojo?=
 =?us-ascii?Q?14+jWWp6v1OhXcKfPCuCutlap2r+lBjino0qbsA555jUT1b9U7P++GO6qaUr?=
 =?us-ascii?Q?sVipGz7dpvuHPUEcHJQrXvre9oclmzJg37qSGnC/OQ1rU5tDVyouxAnSqkdf?=
 =?us-ascii?Q?JGUmPKAQI+YHHW7mAIzt6h8KTQ1yacIBLxQr7Ahh1ofuwziSdXkAOxgw/+FX?=
 =?us-ascii?Q?Uv5092uQBQ2dw2wjNgogBI4QSKc6x0umL2JDlkOiavzbriFsNpPA8k90/5LH?=
 =?us-ascii?Q?OQlhGti+IKA5VMQ2eLIyysoIjfj4GA/utqnQ1fa/T5RoiO8tkCe1EsoiFKE+?=
 =?us-ascii?Q?efX7evl9xNeLIflngMx/B8wnpbMLqCvyvs+zMURkYG4ljGC0pK4S3ECnu6va?=
 =?us-ascii?Q?l38eY5HrbBLWgEUN05buUGZsYiUm4/aIqX+M1ZxV74llOqEwnjNyzCehYWj/?=
 =?us-ascii?Q?Sf1VcZboZxqZyAI5Gvo/s5iUvI5hMhtn2BaXmWluYEcVTYizBlrv1SM9G//a?=
 =?us-ascii?Q?nlcjLEnTgCUaGBhpIhY54nd9KyJMbn5TQYliGvvcqyU2SdtgH9/t5gY1ljX9?=
 =?us-ascii?Q?f1u6Q4CMUHPBr9WPx2MQ//fby47iajT0nd0mmHVj8/B1ydP+helc1mM8pGiK?=
 =?us-ascii?Q?K1eB3DL96V6rlRRmE1xEYeLF08AHPutLNGqTMQcydMUn5BCqvh+L0oXC+onr?=
 =?us-ascii?Q?A4/5Ei8WV97TXCe6J5Bnd7Mo3sdKl1I0QMyg4o/EA7/iVOEGvHO9dXpzgONP?=
 =?us-ascii?Q?N3YKlVwYuAMXNQM7KLNOwLggCnSBoFmYa6oFCvJeDpidjeJaG8pq6QDqwLEU?=
 =?us-ascii?Q?S//poeFbGR9HyX0hSPGKbvj4kCzkvqCDr4nD/EdmHWunvZ6IVdVRNDGmkRPG?=
 =?us-ascii?Q?Du0qn8b3yQ2sXXyMFqNudFP2aAnNmxVShjMjjCSgyeBmUHXjzN22b0RHy/Tt?=
 =?us-ascii?Q?kfr/KNzw+ep3mCVLoaRIvA5xd4LrElU/K6pjh+15RoX45kNr/YqGb6+z/fCi?=
 =?us-ascii?Q?gysH8FGjB4gQZG0fNqqI7NBBQilib1y+1cOUNNEE1IaDPwjH1lE1Eit9l4PF?=
 =?us-ascii?Q?19siAZIpibAesWWPWS62HHbTOiegxMMWjFL+wFw7k0CYHh5n5SVuh3h+aSRv?=
 =?us-ascii?Q?1AqovMcy/QyKO5QsFW9wu66fBqEFeSOv3hg5Dd/aBqD8Cm105VuTLgCAY4O4?=
 =?us-ascii?Q?L9ITO1Hyy6/jFWg4DNCQHoD/fz1bY7POe1mJ0sA+NuEX6m76TIgJocE6p+Cv?=
 =?us-ascii?Q?JzPDy0QpXcLeV+N4xhylVRWg3tXbQi7OphgBbX33yWSai9LYpWZBLQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SI2PR06MB5140.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(366016)(1800799024)(376014)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?06UWyy8V8/7AmS7c4IhJ4faRS6MdG3xrANudplL4wyt94aZLFlEuASynFvR6?=
 =?us-ascii?Q?4xkVSw4yTNT6A6/SL6omrvEPBejjl1VsPsg5xjzUbMihfmamR/8UexJH+tw4?=
 =?us-ascii?Q?O/fTVeQXZjNWbgJ5bMDfqA4A+vTpzF6tgX8iPEw9yGU0hrRd/tWdrU5nnFie?=
 =?us-ascii?Q?Do86jFA9E3T/xnGtXbbCS7OQ0lPOanZmtrURTtB3u/HlZYsGEDxL+t6ZDtID?=
 =?us-ascii?Q?uHxK7iOnBzy/YayGyQiclnBU0ELjm+iNLwuAlMbAhYcA6tMO9wc5I751yLDo?=
 =?us-ascii?Q?v5WiRNmA3WeoqOiWXwia87+n9vEYCOWL7oo5eZgdkHhxK+s0xXVtUR+pmFbn?=
 =?us-ascii?Q?0uc5uProQiEigFqOzsoknwyZe14KHXMVT+00bDrrNsotilABy4gYEb6/0aZk?=
 =?us-ascii?Q?mDDUB0EcdSVni/37KDaT+LKdJyMxiX9qcanPTnBU/I95Eszv2gzhaqcBOd/8?=
 =?us-ascii?Q?QtgI8Gckl4dm574EiIseJbLB/4KbjouUm45x+UJngrBF1yTvVGSnT5Z4vexc?=
 =?us-ascii?Q?VSEeA9eDV40Ihg9Js7gPYwPEDjFsVfjy3By4z4A5UcwqpS0SVP9M/+f29khX?=
 =?us-ascii?Q?FJtN8tSBWUWW+ICPAr1rJO3CqWgD4Ld4OuhiGVhKxVciTVD5DGxeGYG/vnnu?=
 =?us-ascii?Q?PxWL8h8iNuXBiX6aSa2/RFuPHleeBnGdOhYYyyKf+oenjXePJJ8cYDWzl1LB?=
 =?us-ascii?Q?HXrXgc6c6270FwQj1kebAaeGpAtuai4BHpviHW5nGPjQVacc7KX0nLPhTPQp?=
 =?us-ascii?Q?C7Dm6f4HdEH/ucFiryLI6BFNpMrEh8KbzfK2SIOPxgvyvhZoR7X3Los+eR2R?=
 =?us-ascii?Q?AiCtK/fFaoWBJRd0Qp4FYu/a53G3mVuIildMuJgiS8gb/O+YnZe0FV8FtWzG?=
 =?us-ascii?Q?GcTYIY5EkKYfcT9ZNnyaCFt6rGGV17jkXLzTZwK6dawT9nDQcdup8b8Z2V1w?=
 =?us-ascii?Q?q78luXqb7i3kDw4gbiozhYTM+CXk8pfRY6LycoUyFhQyCj1NnUR6kbraFLrl?=
 =?us-ascii?Q?05ZCK7vaXcnKkbUVv97pwEYEM8YFJ9cEvih/SfT14BcaehOzWRmNrJA3mQBm?=
 =?us-ascii?Q?YzsxB2oNAcyEoxsrrMDL5A7KVwqDYwrK/MeEjs4laUl2lHQEtg8aNzm/PXIx?=
 =?us-ascii?Q?+b4TMGKIaGC2hEdRaYWaLjBXQKoYxEpb/ury8b7Tj8p8DgzjgzZpsEIEnIJw?=
 =?us-ascii?Q?9N/buC8oOHo9WIjyLoKvcVFtb3XPtmaRJi8QByYLAbtpCtSUkd9tMeDOXZt5?=
 =?us-ascii?Q?EVLjGKo+xB0k41IMf5Fx2nw5RF7N9s/8qPY+hhf25P+JBBK4gFM0aWPpH+ro?=
 =?us-ascii?Q?LUX5qmHZ3IsSvlhDfDKSNASloBWyxafBtoj0mKcrOXNWJShvUck+sQl3ZytJ?=
 =?us-ascii?Q?3iWC8bNae9JKElmiorVKUWirASMVFI7gPzReOthg3VNp0Th6SBh/icLMlXIk?=
 =?us-ascii?Q?gDkP4sywcBN54+AYQdv6ViT1PJsIgMVforD9AkcPEA3egjRBxCwxF3VZmJc1?=
 =?us-ascii?Q?lDEIkKdu1BLPo4nAC7HMPFF0HbIanSqQf0+tQrjI1EXakZQGEkM3y7OBhaWo?=
 =?us-ascii?Q?NkpuvfEB2L4TWN6ilvwToB5dqzOKFOnSrVTiA86y?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ecbc9236-4eb1-4ef9-33c4-08ddd5c03d4a
X-MS-Exchange-CrossTenant-AuthSource: SI2PR06MB5140.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2025 14:39:39.8907 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D0/cPUwRn7d2jrIHkcDS7UT+mht8p8YOUg0KITjMV/lo+q9NGGJLIlHEiGUlblVECQuZc64iH/6LSFrdE2hQLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB7175
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

GFP_NOWAIT already includes __GFP_NOWARN, so let's remove the redundant
__GFP_NOWARN.

Signed-off-by: Qianfeng Rong <rongqianfeng@vivo.com>
---
 drivers/gpu/drm/drm_modeset_lock.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_modeset_lock.c b/drivers/gpu/drm/drm_modeset_lock.c
index beb91a13a312..58eac20a8138 100644
--- a/drivers/gpu/drm/drm_modeset_lock.c
+++ b/drivers/gpu/drm/drm_modeset_lock.c
@@ -88,7 +88,7 @@ static noinline depot_stack_handle_t __drm_stack_depot_save(void)
 
 	n = stack_trace_save(entries, ARRAY_SIZE(entries), 1);
 
-	return stack_depot_save(entries, n, GFP_NOWAIT | __GFP_NOWARN);
+	return stack_depot_save(entries, n, GFP_NOWAIT);
 }
 
 static void __drm_stack_depot_print(depot_stack_handle_t stack_depot)
@@ -98,7 +98,7 @@ static void __drm_stack_depot_print(depot_stack_handle_t stack_depot)
 	unsigned int nr_entries;
 	char *buf;
 
-	buf = kmalloc(PAGE_SIZE, GFP_NOWAIT | __GFP_NOWARN);
+	buf = kmalloc(PAGE_SIZE, GFP_NOWAIT);
 	if (!buf)
 		return;
 
-- 
2.34.1

