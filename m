Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BD046B6F52
	for <lists+dri-devel@lfdr.de>; Mon, 13 Mar 2023 06:55:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40B9A10E011;
	Mon, 13 Mar 2023 05:55:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2080.outbound.protection.outlook.com [40.107.104.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E35D310E011
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Mar 2023 05:55:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GhJlzjNsx9fbSfZYTgMZRb/0AHcQlUKteECJKh4ZHKn9wQljEvxfG4azhNNqKwq/R7ELsq6Y2NF/jtZTHinDs1e7Avw1FSGeCKHTlh0UL3zTEdh9wt6/mXczqkGXxRMehAxrg+z85nCUaeeh4+soPANt0JGJ9ChjMT9S9J/op1tXtTw+t7p/XbbUqHLmB2W5ovCgV+SwzWhi/J0vfFyI3Ct1O8krcSljgytmlmXJ3YrUjyV3Cd2tfeF/W4Xg0sx6UaoAB1Yi1DEz5mf2QddaGTqEiuKMd301b+g8jeTzkhoK1Z+RnEZAi/VHdkTp8WvXcFSngrwH3I9aOvOVL1N+8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nSfpNRGIsZuPDM1IiUDsEdIFwYT9KprD6GQx/kILjOI=;
 b=kml7NZl1yH7YoUcH0DD/3dGS1sXLgGJHz9oJPVTMh0Ux//VG31jQzuQrn5DrQFwVR20bT7Nkfit1frbs/ab/a7L/k2n/j1rZ9TI+emZ8JBl8G0VvrHMih7VSy3LG4DYIbmjF0t6s7IV7uc68crKEqTm/c9bSXnb2/a2Jyuz9r9egGLAXpgWBkJu3PieOo25DGXcrCJKQYY0RawfPgu8WtHfPt361/5DiUMHYmfJEIDWR9SYH0W4AZH32dXQLm5Q52qe5GXcz0C7VPz+oGPU/LEIk0KAW+LjoGisjOJrq7wVRcKTjmH4L1bC64eaUF1haGpA/qTSRhS9MlhUC7ygAGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nSfpNRGIsZuPDM1IiUDsEdIFwYT9KprD6GQx/kILjOI=;
 b=bpdRRDIr4FegTQZKAP24xNWVOBJuYvZArzL5c+CKg22ykUsMxKN9n37eIBLlsJcHxSSzOouQT79OdXaQ2ZfTsytLzHg3eqLg3WTckzKzXLXvcb+F32BLQ7ujOg2BHmUu1nuY3Qbio4L/9TjKwPU7dQkwbE2z6iseanpM13y2ADY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PAXPR04MB8733.eurprd04.prod.outlook.com (2603:10a6:102:21d::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Mon, 13 Mar
 2023 05:55:30 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d555:5ebe:1938:29e2]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d555:5ebe:1938:29e2%7]) with mapi id 15.20.6178.023; Mon, 13 Mar 2023
 05:55:30 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] MAINTAINERS: Add include/drm/drm_bridge.h to DRM DRIVERS FOR
 BRIDGE CHIPS
Date: Mon, 13 Mar 2023 13:59:51 +0800
Message-Id: <20230313055951.2997299-1-victor.liu@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0037.apcprd02.prod.outlook.com
 (2603:1096:4:196::8) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|PAXPR04MB8733:EE_
X-MS-Office365-Filtering-Correlation-Id: 404ddd12-1fb9-40fe-7c44-08db23878d42
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: E1/SC0m7j6s+iZtInaI3QzP7vHNiROSjcOIFpGrsgOXFC7reHaLbILCEWqmC1Ov1CGtGkS6dcX48tXG9enAUHerlbJKLCh8pAXsR87KIv0sc2yXTFSiyl15j/FKqBphyxLdMrxCb1BT1yLE5Y0FeKiYhzWlGJ1cC55BMNADtpWdfRa/zDXqLTEXgVEJIiO2YiGgK6qMLbNyPne63hVh5oXcpDS9UcJVUVoeU1I7N/DKs/6nFjQiNcpiTrGJBqWGKlm8JNqktFOc3sRJ6lM60E2JwgEjlRHAqTImfd3+RU1MDjANoFaUEUQ7hE2H5iYraUNBhHC23c/xlFLwXMGr6aLTWnHuQd/N4DrnqnMsJjTyskecnGWQLhxsKwLDYPO6PQegI1dGiJvSuB0yPdgy4IB00cEvIbJnIpmjWywLAcK795XsC+TjK+FZUPBYWP1xBWdrUPAV/ZvRc0cpKmmr9wqjGBsbZT4vGuPb4EqBp8I492EoBiuTW+qprWvNbJbVxKJ3RLXi36Peq2mqbEJkJoQa4Ezu7KxtYJ7Kf0LXa1UZV4mPINT3G6MYbcrGqqDrhWGwzJW+lR/Gs/FeJFkt/KN8PMOrxa2GJ8T7vNW5Le6Y5qqxM75BL+hUuaiUJLVr16sMLM1DB4DQ50B4ia9kBNc78sJDkrX+HPp7h7qyXq3VMh+K/3ytEI7T5LaMFBKg0/OQnUYNuJdgCaxg8E9BVWw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(396003)(136003)(39860400002)(346002)(366004)(451199018)(2906002)(36756003)(4744005)(7416002)(5660300002)(66556008)(66946007)(8676002)(8936002)(41300700001)(66476007)(4326008)(38350700002)(38100700002)(316002)(86362001)(186003)(478600001)(2616005)(26005)(6506007)(52116002)(6666004)(6512007)(1076003)(6486002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rfxxbCQHGldnP1zkUsfKF08qaYposCVysNbH+dxyEn7rPi9PK5021VP/3XaO?=
 =?us-ascii?Q?hm5HR+nsxKY/V7hnnnb7EgLBKQbpoBYpZSAvpMzneo05jqFO99UGHe+0UpBa?=
 =?us-ascii?Q?gHO6/86aYylSHiC63B9+J46PvXnD46LE/ltpvUM2pAek9I+z6zXRMX4hUk99?=
 =?us-ascii?Q?abkISAzOeoeinn/NLgM8okL5C7WJMg52WtZgBkkq7OVfkGFR98C+7+IQlZ+C?=
 =?us-ascii?Q?rzLKPGg7jXIg+Tl8B6gxDrYmlCXBre46JlMT8eH9zTpjOEStubo9YZ9909XD?=
 =?us-ascii?Q?neBDyoIaiIZ86Yjo7XARbZ1Pg7JAV4CUwYjEF4W+GlL6JkE0ME4IGDsDQS38?=
 =?us-ascii?Q?sjgyNb0/8NvDeKHYhuZ0sUGzEKwt360kcGCEI7HGuWqNHi6etjjI2bJsHTw+?=
 =?us-ascii?Q?BfZnqwDi5JXYnGHCG1tm1uZ8lDl+Co/f8vo/vY791I7po2gd1ACcxfMUJbav?=
 =?us-ascii?Q?awYy7vSJk4VxkiL9imGaUcQ9KNEYye1BaevSQ8XwOhnqRiFj5dFcD1W50dX3?=
 =?us-ascii?Q?XkJcZQ2pxbcthoEDhioCt/srcBkpshD4qbcz2j4el+atas9ZmyyFkeakv+jV?=
 =?us-ascii?Q?OFkQGBnJmNUbX6obaGNVuGpunUbIVBaPzojvnsXU4jvpyjyfVlyZCthjU8jk?=
 =?us-ascii?Q?Lu6AtTC1R+U/WE7H4Zi95vkbefaXqd+g79RRK9njegZP+qWobDZTblTRCBJL?=
 =?us-ascii?Q?hmV7i5EguqvUcZ/1LiRExruaE78HYzmJDZqcemmxBJX2umPVt+U2ECIMX+y9?=
 =?us-ascii?Q?6sxZMtqWWqo/ODFA7pCj1npaqDEc75Cy2/L673lSkEZXAtMvh7u5+Hupq+AN?=
 =?us-ascii?Q?gfheUg17taGWKE6k3PQbck2arc82fGIAI2iPEDvpsmmSMuxpDyBtH316O4BZ?=
 =?us-ascii?Q?6WpPxkuup+95NrsmFmA0golZqZYco83K1TnqiNS9/1yLXDJN+vaZ9gEzCEv1?=
 =?us-ascii?Q?Sr806gH2zzdZIkf3sgl1bmYIlKlWKcucCLS/whfO4fURLY0rnZMxJD7KhB9M?=
 =?us-ascii?Q?8CuIsDghWm23hUkT/3e4WpKQ4hWGmeBwtXKjPx+AdLvY4652BSmHBIkVOrOB?=
 =?us-ascii?Q?05jMevpfC2Srz3q84mgJPuCGkWr+8niBjmKKTEnoi048hK/yPIuq3OMlSyoa?=
 =?us-ascii?Q?Dcht3re4uUaHJ+HeJROWDKg1uWe2Yy7yJ8vOu2fQYCo+ubJE7xZ/KUjKj2R1?=
 =?us-ascii?Q?ejZtncgddUd0dpmcsK8ZKwHXqNQ0ag4kjfAVegARSmDQN7YWAeHqKfNDyfoi?=
 =?us-ascii?Q?YkEeZ2rVgLmsIcInMQ2KLBbFw3e/SenVUQcZJ4XYOwEG+mTpwVQkaS3ceRLk?=
 =?us-ascii?Q?ln++6O8pbiebfxvCQKCRVSNdpc4NNamTNFMKV/5h3Wl3FgaHt9TKFZPPWGsi?=
 =?us-ascii?Q?F1tvmMra+ohtiyPdbuDdYZHyDcezr0WYsSp0NOq3hL31yPaY8YR8MFzXrc7Y?=
 =?us-ascii?Q?GNax0xVPXXYbF1gxXmYJ/K4IDlG5ACsgpi5AO6Qxcvon1MO4FxVUdplvRRBl?=
 =?us-ascii?Q?13kDRz14OZ+yGTxy3t++8OiTc6n9pYMXL2GCPH7uH41u6NOG8r0F0ZSuUYIB?=
 =?us-ascii?Q?sPbcWEltHHum6YeAcT/EVR0AlC2qwxVSVUT2ydzX?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 404ddd12-1fb9-40fe-7c44-08db23878d42
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2023 05:55:30.4308 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lXCCOi08U5Zrdya7pWXFjr+3/CIyhWUN/8OoWKTxUyOopDQ7S4DWiYOYG1ez7wCCpijPN2VUklv2YuCAZCw+dA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8733
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
Cc: neil.armstrong@linaro.org, jernej.skrabec@gmail.com, rfoss@kernel.org,
 tzimmermann@suse.de, jonas@kwiboo.se, Laurent.pinchart@ideasonboard.com,
 andrzej.hajda@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Appropriate maintainers should be suggested for changes to the
include/drm/drm_bridge.h header file, so add the header file to the
'DRM DRIVERS FOR BRIDGE CHIPS' section.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 3d409875740d..b6e7ac70b8a8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6824,6 +6824,7 @@ S:	Maintained
 T:	git git://anongit.freedesktop.org/drm/drm-misc
 F:	Documentation/devicetree/bindings/display/bridge/
 F:	drivers/gpu/drm/bridge/
+F:	include/drm/drm_bridge.h
 
 DRM DRIVERS FOR EXYNOS
 M:	Inki Dae <inki.dae@samsung.com>
-- 
2.37.1

