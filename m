Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12415A08AA8
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jan 2025 09:47:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E9DA10F017;
	Fri, 10 Jan 2025 08:47:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="Q6BxD4HG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2077.outbound.protection.outlook.com [40.107.22.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61BB110F017
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2025 08:47:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uceAWkAPOqTOSxwHtE1lC6Gn3zWHYHPy7GtA6s894Jfhf7IWou+bTbHYLxsVOvop5z9ySKk+tMlyocBqB9bzbDxkxn4nQuYWATsaqeYNKXYq5lnQrD8vUpQjkcYYlxNVdX/WKPAw+P/A9YHs+CDdHdYgtsrvzEP8YqHMDTCc24veKMc0Xz9f1J7o4d1qMJB5PiFqVciiAl/bjbZzPfSLDYIBxSkCHrltl+wVcF4VWblLVuYAUBCRihsCpwIPyoo9uWkPv/Wb5BdRHAjpxTqH8qsApKSDhDdjJ6JCg6PRGSRnV7DNBkC+4Y5TdPXNQ/Hyh7IYBN2GAEoDuQ0/OLCDSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W+0aRxD9HX/5wghIEq45OBGh06i64y3li6G9yGCQfTQ=;
 b=ewd27kJNOmQG3/CTmkHdMBLBzrgPrHIyLpE7QYS66FFXQBLwfMvNwcchc1QzRC36TIdZq7LqGh1wuJngNMM6peggkKTJ1wMzCcROjCQsUaPIQsdyQlLMpKpnh0Zx5X1nOlMhTMuc++Xb1W66i29GPIENBNLvEWk29XxfqlnrAoFkDCNfdHRDQ6Z4sGstshyPzcQOIM5mgxWAy50Nh5Ss7cVKghLcfQZhDRQAMQWf6HN2tRLPiOiajk/8WuhaHq3ktbpwtfLrFyn6ElJGqUxj1ywyISuazciUqwokEJlhcPEbW6z5P8/tjEGuvjsL+Cf8l1wQNm/wbgv12q38VoezuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W+0aRxD9HX/5wghIEq45OBGh06i64y3li6G9yGCQfTQ=;
 b=Q6BxD4HGDyNJH7ItK6jhmhah4wGH3BwclpahTwwCyDuEM8Bi5LqkiEScA6apgbGkVejdMbFZILc/zGHU+d6QEe1VWfPCsZBv2P1XEkcn7i3a3zoXTBjP9Il5XzbBGY3Hmjg7jEXFLtaJno7KrMnxGkFEXJ0HKib7JdyuQRW9JsjV81l2KzLQzLyOJug2V91SP2sfZDBzVuWuCdI9Bn2xIYPlt7E/7fUTotrH2/7yvOqQ0Ai0sBF29Pn7Ap5ml06tE0/obPvXRC3Ksi6nzMuF7N2LFOzxxeNERlsQmrOSzN8P0yXOWmtHE5ymAvZGQvj3+2FUGz/ifsNepmsyWKuTBg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AS5PR04MB9770.eurprd04.prod.outlook.com (2603:10a6:20b:654::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.11; Fri, 10 Jan
 2025 08:47:50 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%4]) with mapi id 15.20.8335.012; Fri, 10 Jan 2025
 08:47:50 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, dmitry.baryshkov@linaro.org
Subject: [PATCH v2 2/2] drm/tests: hdmi: Add connector disablement test
Date: Fri, 10 Jan 2025 16:48:21 +0800
Message-Id: <20250110084821.3239518-3-victor.liu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250110084821.3239518-1-victor.liu@nxp.com>
References: <20250110084821.3239518-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: JH0PR01CA0186.apcprd01.prod.exchangelabs.com
 (2603:1096:990:75::11) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AS5PR04MB9770:EE_
X-MS-Office365-Filtering-Correlation-Id: 8256447d-dad7-4aef-d5f7-08dd31537682
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|52116014|1800799024|7416014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?YZg5x1dKxeotAc66J1HuMxxGVu/Q7oH8dwAOm8wgZF8nsSffJBXvhhMvKlRm?=
 =?us-ascii?Q?R/1+OBksrlqrQy2fnLxo6DtGS9C5dLkXQnuDoWKDq0+5UVHZn0FI4Jul+aFT?=
 =?us-ascii?Q?I/HIZ2ksmGPZIzqwNmLXgqed31aJKZIUvN4bZvDpn2pBH84jZiFptcBUVbDR?=
 =?us-ascii?Q?56qUykNeRFzuzXvMEwWvG7VSm/vADY86epSCI9WfIbzIBzMNoj8DA9ZAElAg?=
 =?us-ascii?Q?rNKCTMWTa9iK3KLBnOjLXjbjJGWw+c2KZMOPW//Jrq4U8U8fWEMiAWU+Gmzb?=
 =?us-ascii?Q?l8ZtRqL6SxumqTTU87in0K0RclBAR3QY+96d6Eey9e3025/aBw0F7CAlug+y?=
 =?us-ascii?Q?zoGk5shV9HZQzKXFT/ejBThAbP6EPDZrywCwqkNEofXgzAWq4ZS9KRBVFsDr?=
 =?us-ascii?Q?qxmPytif0S4W6X6VbeUbGLOyK9quFv7BZGW9r2whok7xLaP6Y4mLj/uOX1VJ?=
 =?us-ascii?Q?usk2cdxhOMytgV+S9MQnI0OnpbEP1DuOe1kv9LfpE5uRoNIfjAitt0Snf8tq?=
 =?us-ascii?Q?NLmr4JecDo2dF8MpjFu4L63EwiqbN7/PtbkT5oR+Kgc9FFn8EbfpKrCKlFhu?=
 =?us-ascii?Q?J7RlyvEWTiM/oCSG0GMp0SnzpdF309lcBSTzRGqWZFvYHnSN6O3C0HxZWl6k?=
 =?us-ascii?Q?oMpd+FDXQ2ZelGKH4OC5RpwmxpFh7bjB4LmwSvNlEdg1c2dr4Izjn27X/0Vt?=
 =?us-ascii?Q?PFobP2ekIcanHAG5eqtnS6c45lYHrgipuVR2fJvpBVcBgwO2ISxbKxZr70OL?=
 =?us-ascii?Q?ufzEcwTq+z+WsquAzwShuRvHb5PGdoQgy73/zsf0ok3+8PwAVL7yWNEB2ktN?=
 =?us-ascii?Q?UigDlP1V73NQdEQIKCZMy5snTcS2JfUXXlnNO809BcMcWCD5WEp6/CZsJqCd?=
 =?us-ascii?Q?Qk+wadVR+1hWMVHKHB/VmIaFV1yosXzlzvB10Cca9vFbGEVCzC1WiAsVUZxV?=
 =?us-ascii?Q?as9G9crrtmXPfxbZ5+gz1T6E5pQndOorLExQ6DK/g+O/v/9Eh8CY/Rk4aLXT?=
 =?us-ascii?Q?+8d9fR5cNqof7JXG64aPHNkIveGrXEIv/9olh0vFCu9Kc6vUGmVDU9AZHN82?=
 =?us-ascii?Q?Aj8df8eY5e/Pd3ysFPmaOiNY5SNc8i5oUzRIokxcPxKitQWPC/KZIdVr+qC2?=
 =?us-ascii?Q?+ne9yIwhvfyB4CKeSKPNgSOvfitMKMfW5zes0VfgddIqjwv3Pj7K8FSytPjr?=
 =?us-ascii?Q?ZOCUzzOL1TUnEkfwYmoVWmWSVlx3BZ36wt2w9FhbbqYj15eUrUGHhuePonwO?=
 =?us-ascii?Q?c+1mWshj++yQvLXpVSI31dAp0VHjZXC5J4FyWeOVAQYltsJ0w0dbWnjJJZQj?=
 =?us-ascii?Q?FBIQq4NjoZGFzGlfyjErnrwTEja4MK/t3FTYin1qTVSXcH7/uBlJoy/gNLpN?=
 =?us-ascii?Q?K/EqjN2+hsRNx7yovBaXdD5vVd46A+ke0c7lFcTop7FnqwWyPS7vBQ86weLy?=
 =?us-ascii?Q?hFum/z62IB5V9Tlf1xNppVi63yyDPlYJ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(52116014)(1800799024)(7416014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ngoqXJ47kWsiOarpvTWtTaXkVzWUmYi23T9RpzYo4NWoA9bmv6ALuzciC+Po?=
 =?us-ascii?Q?o9lsv41SdaMamOIfwspFzEHWHijBGKA5u/RLZJgw4vZpSWm7Q8iTPcG0L4LN?=
 =?us-ascii?Q?wbFwERAM85qUdlvFqFgCh2uNc4XD+16+VMyzp972R/R5nV5tT8nFVTPWBF3h?=
 =?us-ascii?Q?V6IVSp2X9WOuITPvBJhzPil4MLgm0SB8fBH+iEptMtn8wNRXtwRyPPtFGL6O?=
 =?us-ascii?Q?O7g2CzbBqS4SOqluL7NUVo6MESPAhPKDfyG/WdqdswM62L3eVVtjhp+cBc9j?=
 =?us-ascii?Q?6tHLGqUW83HuqvPZ3cTfRXkNAJ2nNEJ6+C73G8Wvfn4pX+K6MWHAd7h81YRl?=
 =?us-ascii?Q?UsnqMeqo/TxE+cQT9mbmePlMdco1+x4myfd6TpXi+MEvwaBsKD8BxpW1XfgT?=
 =?us-ascii?Q?PgimHBGblk3oGSa0Q+sncw5Ar0thchW8SdHJfI4vYJqy19CyRJ6b0sgsEk/K?=
 =?us-ascii?Q?FhpWZ815GdUfsumHKcoQBXv7wkzNASFXVZQnII0GGBhOCbmWBXaSoYUIg6Jt?=
 =?us-ascii?Q?QGWUUVezAeVRNuW9912+jLy8v++nYQSFIIDqw/lvPjnBtItw0A6YnyqJiLfk?=
 =?us-ascii?Q?5ZakCPPQ5Prn/qyoPsOErINrk1au49fEBjTLzFXMXGifgHYQKoCdDkZo0SZT?=
 =?us-ascii?Q?hfK7vT+5fu5GfxuIM9VbvJretvlnQYZdEmeiW8HMK8X0K2s8r3NVU4MtLRG6?=
 =?us-ascii?Q?C0x792MP1k76Dx2t2vBW4BVXngWC4IdETiu30d3vX6RcRh+GKJk6OKvA/uzT?=
 =?us-ascii?Q?M+yGfbcvI2CyZZwb8Uz/TJP6f59TUlrBuYQIQz0dX0nSEVJa7WVp3b3tFI9/?=
 =?us-ascii?Q?u15R78vWfmocnuG5fnIwtStN9eDfVRUIrEbsie2j409RsQkahCKKFYQQLFeP?=
 =?us-ascii?Q?m1l5btM702DZXBUb9zn6wu1oUet+ijkFTl6fHN/bT1KxN304yaovUCCDqp1V?=
 =?us-ascii?Q?yGwf9eECMQTO1scIKjip2JHcCURsv9zNELNhpBmLGL5dGRNAPVo49dGvRVfv?=
 =?us-ascii?Q?0494Ewd0mYgldL0j/L0KQUZlapzP9d22/zV5oN2A0Iy7EcG5GDrCvMFSmVAQ?=
 =?us-ascii?Q?mJDIz4bSL0sKNeqDpo7PcPbhf2WdxNH6gGyIh7XK/QtQzG3bakWvCBKc2fxy?=
 =?us-ascii?Q?thrlsRPpHI3oV/zjzV2Vvuhkl4+yzEtXI1J1lp9JlYfzpbr5mRb5zhV5276G?=
 =?us-ascii?Q?kedBXFNLEx/ZiW8xw+LvamX2m+bquQhghnvHt9XUBlgGi8ureggmm9bRQmcQ?=
 =?us-ascii?Q?f+ADXgcIEuvy/NW0I5p4x9iVll6p+FDS6X+dEfO1qivILScaLQIA4sjL5v/d?=
 =?us-ascii?Q?rGcI5DEmhCdxD5noFv/GBpTmOH3tLXdBhWBNbDdRvyDUEWdtkIv+yIwlvkBc?=
 =?us-ascii?Q?2lv4rJGRi8oPnrBtFiLw3UQjUqohGEe3nxiZ5A56PDNrJAGmkLmkr4IiVbI3?=
 =?us-ascii?Q?2/9R7S7ClGNNkCanCUHkmP6lq1ESAiQVZvCK4s7Fb/AXugI7RJrpJowSbncQ?=
 =?us-ascii?Q?zrKGpRqgg9k5wMQ156mOdI1EubDK8y0i9lBwu6LIw39JDswnyTxZTlsb1jaZ?=
 =?us-ascii?Q?2tzwS8IRHPNYx4NDBnRFWAdUsw5sCkrnohPqjQKE?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8256447d-dad7-4aef-d5f7-08dd31537682
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2025 08:47:49.9475 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lULyVqKivg4clVF8Aji4VLZ5mwqDNcef9o6YYS7HenL1a6utfng0ivhUHUaMKzM5K15afnjxI5YBVp3efcVtsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9770
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

Atomic check should succeed when disabling a connector. Add a test
case drm_test_check_disabling_connector() to make sure of this.

Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v2:
* New patch to add the test case. (Dmitry)

 .../drm/tests/drm_hdmi_state_helper_test.c    | 52 +++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
index c3b693bb966f..8f7a39c9a1bb 100644
--- a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
@@ -1568,6 +1568,57 @@ static void drm_test_check_output_bpc_format_display_8bpc_only(struct kunit *tes
 	KUNIT_EXPECT_EQ(test, conn_state->hdmi.output_format, HDMI_COLORSPACE_RGB);
 }
 
+/* Test that atomic check succeeds when disabling a connector. */
+static void drm_test_check_disabling_connector(struct kunit *test)
+{
+	struct drm_atomic_helper_connector_hdmi_priv *priv;
+	struct drm_modeset_acquire_ctx *ctx;
+	struct drm_connector_state *conn_state;
+	struct drm_crtc_state *crtc_state;
+	struct drm_atomic_state *state;
+	struct drm_display_mode *preferred;
+	struct drm_connector *conn;
+	struct drm_device *drm;
+	struct drm_crtc *crtc;
+	int ret;
+
+	priv = drm_kunit_helper_connector_hdmi_init(test,
+						    BIT(HDMI_COLORSPACE_RGB),
+						    8);
+	KUNIT_ASSERT_NOT_NULL(test, priv);
+
+	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
+
+	conn = &priv->connector;
+	preferred = find_preferred_mode(conn);
+	KUNIT_ASSERT_NOT_NULL(test, preferred);
+
+	drm = &priv->drm;
+	crtc = priv->crtc;
+	ret = light_up_connector(test, drm, crtc, conn, preferred, ctx);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	state = drm_kunit_helper_atomic_state_alloc(test, drm, ctx);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
+
+	crtc_state = drm_atomic_get_crtc_state(state, crtc);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, crtc_state);
+
+	crtc_state->active = false;
+	ret = drm_atomic_set_mode_for_crtc(crtc_state, NULL);
+	KUNIT_EXPECT_EQ(test, ret, 0);
+
+	conn_state = drm_atomic_get_connector_state(state, conn);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, conn_state);
+
+	ret = drm_atomic_set_crtc_for_connector(conn_state, NULL);
+	KUNIT_EXPECT_EQ(test, ret, 0);
+
+	ret = drm_atomic_check_only(state);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+}
+
 static struct kunit_case drm_atomic_helper_connector_hdmi_check_tests[] = {
 	KUNIT_CASE(drm_test_check_broadcast_rgb_auto_cea_mode),
 	KUNIT_CASE(drm_test_check_broadcast_rgb_auto_cea_mode_vic_1),
@@ -1605,6 +1656,7 @@ static struct kunit_case drm_atomic_helper_connector_hdmi_check_tests[] = {
 	 * picked up aside from changing the BPC or mode which would
 	 * already trigger a mode change.
 	 */
+	KUNIT_CASE(drm_test_check_disabling_connector),
 	{ }
 };
 
-- 
2.34.1

