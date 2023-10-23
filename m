Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95A147D3C95
	for <lists+dri-devel@lfdr.de>; Mon, 23 Oct 2023 18:31:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA99B10E0E3;
	Mon, 23 Oct 2023 16:31:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03olkn2013.outbound.protection.outlook.com [40.92.59.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D08A810E0E3
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Oct 2023 16:31:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LIBRL51diRWfPLPYnY/OgI2HUg1EKW3Ljw9917Jts6ngXUIfgOh/H2TeHDSju/2Aik2Ww0WXzAB6Z7UtTAtvF6tS6XMpfzFTKhz6IPw0rQRbMzucMJrqI8fK/KqcORXoq3H18zM+w8O5Oq6nu1Zg8v4YvCSNW2/OtMggavfJnmoOLlTk0LovWlaL0oys37U98zui7SIg1GCCNc799FOWJr04oarv+oLFy/Eie5NfRz2Vbbf6z5MhXLNCAFAzHse5qCeyq+60EQTluY10gbSBwbxHYzhUgjUxBJ6G7NpidqLP9VBoNnPBhpw9pcGjj37C4M9vBWWsSuZ/m5axCTzaQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s95eaJEGpJhC8TWxE2w607MSyguwKVfTqdxhWFvhOZ0=;
 b=g/VEB/5M+AjSSYldzq2anvrFh9w4ZGHyE6wiwnuwN8OujjRyqcreaSENFVU2jOam02Wqi3EXiQAdsdGBYEYg7LMoZb9JxBOj33hYoh8IWxYmTg24eHqppKwt7zgNNR3JNw9+uPRaCOlcLfFz7yGu32aSqjRbJkmFaEpwvZPe2fNZq2KKirEKKMLlkBsIACY75tyxmBiHO/4hzOOF6AaLNgns0rQarEO4TOh5mEyRGGVAMxz5HwpMs+XpePfUH1V225cpx2yI+HcAhY732sku7nXtipaZLq1KNkGkXijMOZ8HKtjYrXo2Nb//k5nSmGO9gO0zd0xfIh2Q0d8Xk4PQ2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s95eaJEGpJhC8TWxE2w607MSyguwKVfTqdxhWFvhOZ0=;
 b=FAkDOcdgOCUxZYjOfRbD+0joFDNvEnkDIIGt0pY6ZES2HEble2G8uhzF4NXxAl0qbq8DZof9tyLgk/rn33e2tg2QWujV+opL67d0uZfQ8XCuPI2HqnyT9hxTjkv0W69RbZXgV4IBhr78nGgiyTAbCG2XIPgyjqqiVObOlGwQR1r77oqMqoTYZKoJnR4pTvtJUqgf/wYvF6th/Y9+CCkOKCxR1LIdBZLa8FE7+Tvkie7Xbf7BShS/JKcFjfURgCi9yec+uWj+IcRIF+4hOXSwEBeDDSabwri0+H0RvHJVu9/ZwGA6NQQTUbCToiBxV0kTFTT2wH/e71jWXmrKRsWW1A==
Received: from DB3PR10MB6835.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:42a::7)
 by DU0PR10MB7213.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:44b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.26; Mon, 23 Oct
 2023 16:31:22 +0000
Received: from DB3PR10MB6835.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::e2b0:8d7e:e293:bd97]) by DB3PR10MB6835.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::e2b0:8d7e:e293:bd97%6]) with mapi id 15.20.6907.032; Mon, 23 Oct 2023
 16:31:22 +0000
From: Yuran Pereira <yuran.pereira@hotmail.com>
To: airlied@gmail.com
Subject: [PATCH] drm: docs: Remove item from TODO list
Date: Mon, 23 Oct 2023 22:00:56 +0530
Message-ID: <DB3PR10MB683528B8252ED2A802A0E154E8D8A@DB3PR10MB6835.EURPRD10.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [HAAyx/D21wTyCOngo4h/ipmusX5hvObQ]
X-ClientProxiedBy: JNXP275CA0045.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:18::33)
 To DB3PR10MB6835.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:42a::7)
X-Microsoft-Original-Message-ID: <20231023163056.982019-1-yuran.pereira@hotmail.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB3PR10MB6835:EE_|DU0PR10MB7213:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d54ce5a-d974-43f7-2f40-08dbd3e57de0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Kttb5VoGZbJld5FqFw1PkoQiuNyBP5lSGfS53Knxo4azekiJrdMnYPWWdwqzBSXY2zz0LwEgs5ELLQm/s/qkZxLRVoZnDaKfO41DqWjUoqKu9zI1hSPXZnx1NGucQldokc58NOAimGQ3SfWqhnHMgErXDo8PVWAJO1dK58teyWaMqtvwRLpr4RpIziOEpPNY7/w5xAglxgi4raeTRCRgCw905Erg9KagEh87cbb5ALkjHeGHfjJCDNfDcTRtabrTy8Z2O+7hIHhhvn8JB7U9yKT5k5RFPzYvv1HX4rbRaQUNeOGK109BYCjpV+Wbf9/XWS80vNU/cjjwKMzRWOVvBs9UPGUFCY9i0WG80gnDTZKoE4S9smyzya/VQb4oSq2XOVzuVCgsUtqPjS7HpXECNWrEikHLf0FyvD6hCijUy+wImU6j2T8rojNaLyFXPQFfbA4u9InEbzhxBDuyI+pgCZMm7LnZaLZ/+7RC9wW3/Gyofu/vnWCPGZAAwp0iNzaL+bbOc8wCCOGTrPX2OVArPisbSgRbF2ALmQC8ewc2yRHOCbNxNihcPXr42yI+kbISp/cWUhR1wO4sBG6MP0o0o3WignsLj8XE6LQVYo0TV+g=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hy6ykNdk035v4TxyydInsHzqx5BGU3qu3KuHrrTBWG87dmsZrQyPBnvkBlH/?=
 =?us-ascii?Q?/5lbAF2oJ6Q7V1mjCW2u5/mpe0ik9XwkGYZLtQzVDY69RYc4C6F2+YwXVniD?=
 =?us-ascii?Q?QoGmMNNO4ayIIhApmNjFSChDiIS8GtwFaPYuTHHSQIq9CjWE+ZRligONFuhr?=
 =?us-ascii?Q?n0oXyot8ljr/DlWMNcX00dLyNvczcctzACQp+q4xYG0POZS3AKoq0Fa7RTyG?=
 =?us-ascii?Q?Gqy2CHKfDReGD+woHrFFXZXHc2ApM633nkO+om3h9uiB4RkVV0c5/OGLRPvy?=
 =?us-ascii?Q?Bjm8WJ/uJ8xGIe4FFIobwrGlp2cpGdVmdfJ6Gj7gUbuuigbInMJumZVGKqg9?=
 =?us-ascii?Q?dnz1jNDjPWPkV0R6QecK0DarXmNmabeyFtQQ0JLvblWu9zNW2h2cqwohHWyZ?=
 =?us-ascii?Q?d9gdSCyuLGiFfQswQ5WaGC/+plIah0QgdByRZC6FB9Tz7Enk9vgZ4bfvo5QI?=
 =?us-ascii?Q?PLOoLSicpt4S6h0RVnlWmKZl9ZCzDlZXvIr3opBw6TWN1m/p4agl0QOqET0A?=
 =?us-ascii?Q?0O7euRoQGzvhyxFXM/1CB5nw5/9/rqGnAPQKRkKAdHDjC+jh9aG9uZS8oLkj?=
 =?us-ascii?Q?4hV/zUCni/BwONMGpasqZBADVdERpGvIEb3N7luwwWbaVlv7g5DNXpRDhvFw?=
 =?us-ascii?Q?qfY6Xs8AQ9lUxjcjUVkvgl63wb9chbqBUr3Ggs2N4pPFIXd2k5mF2oO3oCap?=
 =?us-ascii?Q?s27cCNGUKLb5GL6BQ14sk6ht6zz+2ARKypjwUuwaQN4QKWEhAMI4is5w2bqE?=
 =?us-ascii?Q?tZlvgWVJp0vxblnw5KC0sBLQO8GOn3nKgvGsTIXR0jCTzVhK2i3Si0QUy/YE?=
 =?us-ascii?Q?ahrzMMW7Ygn0ytOQVegBimaBQ0AmJGCdTKOYpAPW50bZOWOgODMewTXbJ74E?=
 =?us-ascii?Q?heJ6PevDXcCvprkXfog0UidvvfWTWHZVY//Mh4o69DGfqfO0MQVLW4vyHeOn?=
 =?us-ascii?Q?exvcT6vg1wix5MnZAFO98Y4VoDWF4LUlnGYeOpnnuzRhyIDBGNtHXHTuXbkr?=
 =?us-ascii?Q?bshRz07QXWlTt0JKmLmr2THm4FmgzSdnMqO16pol/FPWJ/faPpdxKFDnOJqc?=
 =?us-ascii?Q?1Uu+SDHDvNtbMBNBTg3RqJG267SKE1ffo4lmH9FbNIBkbtC0QOmz5ncEJ61R?=
 =?us-ascii?Q?Gor3vCqwxtc2BmGf3M5NivDxJPE7BcKrY3X/XtoYr/ZnHT+mVWWh0C/w58Ks?=
 =?us-ascii?Q?Z5Dj78vCAhrRMgO2n+Y0sZkbuSD1wE2wMtKZXppCW6UYSSzetyc9V1zL60s?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-6b909.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d54ce5a-d974-43f7-2f40-08dbd3e57de0
X-MS-Exchange-CrossTenant-AuthSource: DB3PR10MB6835.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2023 16:31:21.9175 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB7213
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
Cc: neil.armstrong@linaro.org, dianders@chromium.org, tzimmermann@suse.de,
 corbet@lwn.net, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, mripard@kernel.org,
 christian.koenig@amd.com, linaro-mm-sig@lists.linaro.org,
 dri-devel@lists.freedesktop.org, Yuran Pereira <yuran.pereira@hotmail.com>,
 sam@ravnborg.org, sumit.semwal@linaro.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since "Clean up checks for already prepared/enabled in panels" has
already been done and merged [1], I think there is no longer a need
for this item to be in the gpu TODO.

[1] https://patchwork.freedesktop.org/patch/551421/

Signed-off-by: Yuran Pereira <yuran.pereira@hotmail.com>
---
 Documentation/gpu/todo.rst | 25 -------------------------
 1 file changed, 25 deletions(-)

diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
index 03fe5d1247be..280020b0ad4d 100644
--- a/Documentation/gpu/todo.rst
+++ b/Documentation/gpu/todo.rst
@@ -460,31 +460,6 @@ Contact: Thomas Zimmermann <tzimmermann@suse.de>
 
 Level: Starter
 
-Clean up checks for already prepared/enabled in panels
-------------------------------------------------------
-
-In a whole pile of panel drivers, we have code to make the
-prepare/unprepare/enable/disable callbacks behave as no-ops if they've already
-been called. To get some idea of the duplicated code, try::
-
-  git grep 'if.*>prepared' -- drivers/gpu/drm/panel
-  git grep 'if.*>enabled' -- drivers/gpu/drm/panel
-
-In the patch ("drm/panel: Check for already prepared/enabled in drm_panel")
-we've moved this check to the core. Now we can most definitely remove the
-check from the individual panels and save a pile of code.
-
-In adition to removing the check from the individual panels, it is believed
-that even the core shouldn't need this check and that should be considered
-an error if other code ever relies on this check. The check in the core
-currently prints a warning whenever something is relying on this check with
-dev_warn(). After a little while, we likely want to promote this to a
-WARN(1) to help encourage folks not to rely on this behavior.
-
-Contact: Douglas Anderson <dianders@chromium.org>
-
-Level: Starter/Intermediate
-
 
 Core refactorings
 =================
-- 
2.25.1

