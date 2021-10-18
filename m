Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AE1A343175B
	for <lists+dri-devel@lfdr.de>; Mon, 18 Oct 2021 13:31:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 304686E9DD;
	Mon, 18 Oct 2021 11:31:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-HK2-obe.outbound.protection.outlook.com
 (mail-eopbgr1300091.outbound.protection.outlook.com [40.107.130.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F18226E9DE
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Oct 2021 11:31:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A75y6MMPVr7+3CP/57iAdTMd0GubqaJfBlMmd9tHtGA6MyEkOygW6HC00xaj97Emmh8NG+UStJAa7xFg0WLxNXC3JLZ4mQrFbqqTXtCqs+fOkZXYdQ7jPgXhrV7lJCZb5qFOKNuSGI6vaK25Dvpl5Ka+FHqgcqmL6+4mX3AsdDEEcqEN/zIxK9yXC6CxQKgJqYxBIyWiJgc4WW6ejNcY8QdG7fKmsoZ2uxT4s77iBDgqAjeNL3yi7Hw1GPHgNZD4em/5xMsGo8EV9eQxfqB866RMBxMO5/Ngi19MhwC31wM48bNdaNYGYrHu+4o3ZpeTc/lviKGcyouoXDu3Ko/nLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uzCTLSE0U3sPmOwaI1mqQNh+nIOHVaQrncpJfQuvg0Y=;
 b=VtGCRks3WZn4Cv7EWlZLpF+fv/tJn43f4ykO2YnqY4QuqvND8Ildu37tezooxOb6VhLSY0wvtWcFyzpMF4bWaHyipJpN8A54IYzAMEfP6qm7Z1A1B/5c2kZANc3YzxRWwGhUTvAQK5BcUchmq10U8Gy3Q8izvXyIphjaqGmouEl/Cy6qh4vvyFnNVJAwYgMB7ywto6F2Pue6Jn20Mws4qMaknsRxPk6m1EhdCjMuk/UPRHIYPV7z3pPcwWFZtNNv+fgO/rzpoeoqxHabEFgAnRSnPm11gF43NuM4APX5aJ0KgK516PIqszI5z4OVD+u6290dh7OOxA0Qf2hRHyoJfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uzCTLSE0U3sPmOwaI1mqQNh+nIOHVaQrncpJfQuvg0Y=;
 b=cqjsfEtZkQLiB7kWAqiXDNei5x2BENwd7mUvvggIOD4jdY2OgqOvbACSQxlqjS9oPGykgaXAcyBCFhryj+DIZNw33yZf1vySVUxosklmpZHmYfOK+KRxkEbAmJNIU54hbbIJ9fUK8W87fbJ26sXDyDXJU3YcshJXaGBKf2HXot8=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=vivo.com;
Received: from SL2PR06MB3082.apcprd06.prod.outlook.com (2603:1096:100:37::17)
 by SL2PR06MB2986.apcprd06.prod.outlook.com (2603:1096:100:2e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Mon, 18 Oct
 2021 11:31:34 +0000
Received: from SL2PR06MB3082.apcprd06.prod.outlook.com
 ([fe80::4c9b:b71f:fb67:6414]) by SL2PR06MB3082.apcprd06.prod.outlook.com
 ([fe80::4c9b:b71f:fb67:6414%6]) with mapi id 15.20.4608.018; Mon, 18 Oct 2021
 11:31:34 +0000
From: Qing Wang <wangqing@vivo.com>
To: Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Jonathan Hunter <jonathanh@nvidia.com>,
 dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Qing Wang <wangqing@vivo.com>
Subject: [PATCH V2] gpu: drm: tegra: switch over to vmemdup_user()
Date: Mon, 18 Oct 2021 04:31:26 -0700
Message-Id: <1634556686-38846-1-git-send-email-wangqing@vivo.com>
X-Mailer: git-send-email 2.7.4
Content-Type: text/plain
X-ClientProxiedBy: HKAPR03CA0009.apcprd03.prod.outlook.com
 (2603:1096:203:c8::14) To SL2PR06MB3082.apcprd06.prod.outlook.com
 (2603:1096:100:37::17)
MIME-Version: 1.0
Received: from ubuntu.localdomain (218.213.202.189) by
 HKAPR03CA0009.apcprd03.prod.outlook.com (2603:1096:203:c8::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.4628.13 via Frontend Transport; Mon, 18 Oct 2021 11:31:32 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b4f5e4d7-b9c8-4ddf-befa-08d9922ad6a6
X-MS-TrafficTypeDiagnostic: SL2PR06MB2986:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SL2PR06MB29862CEE0459A53F3C3498CCBDBC9@SL2PR06MB2986.apcprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2657;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JQKwi04IeP03v+ymNmioQ5lqs50Qm+UB1djQMMG0mHhoh4tVlI5pdd9QzlJUzvrdAPtlUt4bWuup9rQBhi20E4n1VD4LsUmAuPhNOxnVVHKInKabr/h7vrC3OpZZ+WKQsl9+Kn9wamxDX7c5/BOujBMk5ULU1m08Y7448k9aqvdZ1w5g1ZXui1BMi4mJjLUvVHb5nQZSAu/bzkrQ2HBXpG3mcjS2QrmliFVUra02bUER14mjdELHR+10LBa06Pq1Ko/ekrSVgL8yc76ItkHSwicRZlqlTsw1D2QC1YwAvPijQ7q5hyVO19wkmprKj2HJyNMHHMPIiJNoPpIEDgwQV7VV+dUP2Uarp5SWl6cAIY36R4RbHL8PDmos0LZW15oVTgbKFq5yJ6FcmQvedHp1WYN5JkPjbnivcMjVp389wgeOrGATxENDF8alwb5ZqqnfMfMZBiCYzM4eJPnuYIKEQG3PdVmnCWO1fk3/JInrdm4ozdyRuWzE+K09Bqb8fk4RM/Ene1FabYjC4FhoFsHQf+LqvOhfb614Jjq4IYhYsSR+C+xXzaIFy+etYAUZCG1wsGL2P69g+cnjeSPvBvWdYRuGVZpPrQ4QAgxmUYj5btGHI3/LVsGeVotUPWuCxjSuFU4SQXQKQ3S74dpDrX5AovktqMvHoEiUvD8KOE37p1js7ygWhdGDTJcbmvp8nitFP8D89vv4BAIaTMt9yzXkdw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SL2PR06MB3082.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6666004)(2616005)(956004)(107886003)(5660300002)(8676002)(8936002)(4744005)(83380400001)(26005)(86362001)(110136005)(66476007)(36756003)(4326008)(186003)(66556008)(66946007)(6512007)(6486002)(316002)(38350700002)(508600001)(2906002)(6506007)(52116002)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jvVMoV+Hrv2IZp+BikHO6BXGkevHZvv8mUpscrhX7CMzzmTkHfVtUn8UKA7S?=
 =?us-ascii?Q?IuOL/1B5YZSJs+m8aCToOjxY9CX3nWnw4WXkHIjZU+jcnCxwVUF0CCX30ckX?=
 =?us-ascii?Q?KjDi0iiBIxoqA5kkX+JpBztXRyLcMgUjyifP4DmB851EGobxUZ19tCrd/AFZ?=
 =?us-ascii?Q?1vdgNrOTXIkTAAMGrB3C4uekVWh6sdrGFZjCQYRu1WAMQw3gUHpDkR+7qEHS?=
 =?us-ascii?Q?+9rC+ZM3VaH+bNxNjHCNLTMnKrdSFa8Q3dvC3wVneIjbJjuRqBbbvmn19Eqq?=
 =?us-ascii?Q?p+qPqCyrB3N0FvuVSqcX3DobtAkb7w1RoK+ePpr+4umQ7A5ASAlMOx1bcmo8?=
 =?us-ascii?Q?cb1Oh+sbeKuTTp0lJ1Bj4lJyuSjrNQ9VG6SnZUaDaQS2uJ3283bo+4UPPq/K?=
 =?us-ascii?Q?1374yNAEOZ7CwwTvA1NWGwHh2HH8ow46LuNubi3GoCUA3+JaGPMtkXrF2iDF?=
 =?us-ascii?Q?GgovpLXbtdWIbJB7tRfOQsH00P3M//nBVnxe2ydNaobP/0MkbaAK4OV275ll?=
 =?us-ascii?Q?9laJ9kZYaOSTtTtdXU6K51zpO/ugy+S5JMBZR+p9m+apXq+LrQhvCHeywyfN?=
 =?us-ascii?Q?p8vA3/PRpyZ3hOZYD4UxRFlZwa69e7QoqJC+Znhacr9jDZslDS7rcP964eJZ?=
 =?us-ascii?Q?t67l9NnuoOtqJX6spxrarnt5Xgywi+/CrX3kX4IF32QANCQLlXx5U9sc0Axv?=
 =?us-ascii?Q?Irw2B7DpcJwwXv4RoMbL8q9AKLlAHNW9yjBmDQh02/B6e/y0xGtCP6zFchc/?=
 =?us-ascii?Q?Rw8ut4w4Li0hJeH4y97hrKOPJDMn9yBsDL39eTmyXq5Ogy5ZRjWIxez31R8+?=
 =?us-ascii?Q?JpZXeGEsVRKOycL0uqvp8B4glsUz15ZTNglZLibZMgAloq4v9/S0RjXo0YN3?=
 =?us-ascii?Q?Rxs/WY7wpH2Od5MA9zJULTPqFcEHGd6Yfj66Kz1zG0nerU64BFsAtgRiECNB?=
 =?us-ascii?Q?m2IDhz1gbais7TUXqpYm1kErIsj9xEpojMsqskPT2/BBNr3sR/c2AHNPxn0V?=
 =?us-ascii?Q?l6IyPp9OaXEqBJM7VMCm6a7wObM/Rc1YGvpiUnuAj7IwKEeuPCCNHE0pZmXd?=
 =?us-ascii?Q?WYq7DUIbTGF4+TXupH1E6QEUzbNs5LijPdlUCZgmL+XpfiBfrUA9JRqN+C43?=
 =?us-ascii?Q?gYionPQm4LyawfDCKgt4ZX6L9wkOb+OUm31aUFdbNDuiAtrGpZcg1lXytuIl?=
 =?us-ascii?Q?3fkL2y78Ezn8xHAjd734Tar1C9MrJmJh70yvddTvl+cjL2YNlvUe0UkXEAZ/?=
 =?us-ascii?Q?HellKy9FttLqmxBb7RG9k8E8vtL5Fsfq+d7Ycb58XzBoRiDy0GApTvbJ1mqV?=
 =?us-ascii?Q?+p3XXLqlDkLVHprxOgH85Brol4Qy/grSiUGeTTueFmtqZg=3D=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4f5e4d7-b9c8-4ddf-befa-08d9922ad6a6
X-MS-Exchange-CrossTenant-AuthSource: SL2PR06MB3082.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2021 11:31:33.8848 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oLLkSn8AkHpwUeiSDLw4EHm847k55UO948hDFO90KgOhTisQ0N0kQ0txMfZdFTYDBvMVKlDLgB8Zw/t2SpKz1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SL2PR06MB2986
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

This patch fixes the following Coccinelle warning:

drivers/gpu/drm/tegra/submit.c:173: WARNING opportunity for vmemdup_user
	
Use vmemdup_user rather than duplicating its implementation
This is a little bit restricted to reduce false positives

Signed-off-by: Qing Wang <wangqing@vivo.com>
---
 drivers/gpu/drm/tegra/submit.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/tegra/submit.c b/drivers/gpu/drm/tegra/submit.c
index c326984..0b11f1a
--- a/drivers/gpu/drm/tegra/submit.c
+++ b/drivers/gpu/drm/tegra/submit.c
@@ -169,14 +169,9 @@ static void *alloc_copy_user_array(void __user *from, size_t count, size_t size)
 	if (copy_len > 0x4000)
 		return ERR_PTR(-E2BIG);
 
-	data = kvmalloc(copy_len, GFP_KERNEL);
-	if (!data)
-		return ERR_PTR(-ENOMEM);
-
-	if (copy_from_user(data, from, copy_len)) {
-		kvfree(data);
-		return ERR_PTR(-EFAULT);
-	}
+	data = vmemdup_user(from, copy_len);
+	if (IS_ERR(data))
+		return ERR_CAST(data);
 
 	return data;
 }
-- 
2.7.4

