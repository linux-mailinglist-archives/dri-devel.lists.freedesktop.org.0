Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7CAE3724D5
	for <lists+dri-devel@lfdr.de>; Tue,  4 May 2021 06:12:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41C226EA77;
	Tue,  4 May 2021 04:12:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2043.outbound.protection.outlook.com [40.107.21.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C83F16EA77
 for <dri-devel@lists.freedesktop.org>; Tue,  4 May 2021 04:12:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UD5xIEfmK06jU+REbk5/Nn0PJsm8jJUMcRuBCD0GxqRVGE7STVzHlfJgWvnCmEpWO/4vjXqH1rNPFOEr8k04TOaZq4gF5YqitFK/tzqqG3gNgvTmCdMtNcvDYRYi4ugJQrohrtA0BuUjf5KzqTeUVUEHOl3Ve75d+5FuwtDrBd4uHie5cmT2EurIHuF6ij0NbUjzyUlu3joGwssyFLeoQssEkaJYdUa/cwnUBnd2yjZyoNC6sYLoi3f3CIKPgQ3J7HWqvVZLByKTNcEqie+/4iKCjjy64WIiITxZfQvbKKDkrHiWrduNls22aeiVF2/DEtn6ObbjiZtb5IwP8UcYKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dPEJ/lG8JU2bVyaakuHpugrhFip501JmG2op396PoF0=;
 b=HiKeo0rKoTGbCQ7MBEhKRswwiyr3b6eSpmR30h0ffa0KXqcruF3sl+UX6MV9aefrFR25mhNI1BCc2G0g+WJw/JJ53mRW1BCUkBFGP3POLgu4RFC4wqX8/SkWBb00zJx/kOuMOMkLtGfZWIbogv3NBZivQ/WvB45gXm+2/h+ZTOts825AbmAWVs2Q4zbnruoyCpvcvY37IV4QDSSa6eBFjDTCsioPSTY+XPK4TYomT7y5QUXrkx4E55/rDAiDuHd56mLOp724yb3soA2XdID1W4Ee4IEsORfJ3d4DLKuGGkaNxHKkU5UIQ1q59BTKvWlQ7SC57/CRjdaZci2d9HZ3Sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dPEJ/lG8JU2bVyaakuHpugrhFip501JmG2op396PoF0=;
 b=Zvdc7++YtBsB+4kJo+uICyabU4/ZaIrjypeGs4fTspKN3jAlX17dWtNoSjsR212jC637tZmjSSrikjfitLVoAoZBzoS2VZT37zrOkiwWfMgoq+lSa23W6P4cO0UJZFBU7l2k686cypmA5yMrMwN7hgiDlrIVMX5T8d2NB0Mb/ak=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AM6PR04MB5703.eurprd04.prod.outlook.com (2603:10a6:20b:a3::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.38; Tue, 4 May
 2021 04:12:51 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::20f0:2b28:70c3:fb0]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::20f0:2b28:70c3:fb0%4]) with mapi id 15.20.4087.044; Tue, 4 May 2021
 04:12:51 +0000
From: Liu Ying <victor.liu@nxp.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] MAINTAINERS: Fix file name for simple framebuffers' drm driver
Date: Tue,  4 May 2021 11:56:51 +0800
Message-Id: <1620100611-30978-1-git-send-email-victor.liu@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: HK2PR04CA0090.apcprd04.prod.outlook.com
 (2603:1096:202:15::34) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by
 HK2PR04CA0090.apcprd04.prod.outlook.com (2603:1096:202:15::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.4087.44 via Frontend Transport; Tue, 4 May 2021 04:12:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9b7a4306-35b6-45f2-954f-08d90eb2e221
X-MS-TrafficTypeDiagnostic: AM6PR04MB5703:
X-Microsoft-Antispam-PRVS: <AM6PR04MB570354D16A628C3BFAF16068985A9@AM6PR04MB5703.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nliwRr8DwSESFWo/6P/1MIqnBT6hyouM+6jeacGa4/p/vzsABDVzpWFSwvgrFBSNYSmuD7jJFJdjIl1O/97X7VTqdWGswvVRoCyXn9A71LSf8Z4HjyX3BE48/ruYV2Luy0P5QZYPtvWJTs9D9bQoN3KYpvrxW7Mg3QNxDbQkbhTAXJeibptzmdXhx2VTvWjKb01U/FmIbDk6+nWO9L309j6/kMXEbcrAveLwtE7HAv2F0lJ3ngrufzD/O2FdG5yw/MKwCbez4BszScNCyHneKF05na+LHNcP01PasBtwlhLItNwKteQjaoEoN+MdIvYgvsjyZF04OocCP111Qa4Lgn4DgOwXZAqMbFYP7mprar3ryCMdG/zNJf4p0dDgPNFSPLefm0QTWjL4qn92A3sjOCisnSMzAcMdzvpk2jpEXGm1iNUuMjKou1qbXxbYnnNdkz/tIXFQxYV3YCbCyLErt7FfZpzcoqrTWoCAGzQAEHjXiOdy6taLDTtZU/8LKxI4EOgvbCcSwiPPNu2IRD6tAnRweGOP223e24WGhgWqnafHfZs2YeiUgPArW0ReJelv2dvY0FFEJGV9czm/Xg+dg9izW03eswofiXcrG4WxRYcS/HRfM+kLRz5eIJPu5dKtTzOHqmSJ2OO4gyl7Wh67Ws3zAv5WweBn8E2iXa8h3pIzdnJJNUFGPWX+yT29vP9d
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(396003)(39860400002)(136003)(366004)(5660300002)(8936002)(6486002)(38100700002)(8676002)(38350700002)(316002)(83380400001)(4744005)(36756003)(956004)(6512007)(478600001)(66946007)(26005)(6666004)(66476007)(6506007)(4326008)(66556008)(52116002)(86362001)(16526019)(2616005)(2906002)(186003)(69590400013);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?w76mClu1AQoLB4elqi+JccSW2Wfk1F+GOGsijORK96k58aUA/Ng/iF2Ei9dt?=
 =?us-ascii?Q?pi/4D19GD299BVw7c7tjhWAvuffXzpggH9iHXYxltWDj2CyoRVlv97bIcyfV?=
 =?us-ascii?Q?D4RUOTA6k26Ll2aCxx+s6S5Cez02482QY4R67Rhd5F8wqkTRQ4+ZwU5bPTqH?=
 =?us-ascii?Q?vUUkgNitjmzizpnC5f0Q7Q8x0FuLSxDcFwjvW5ZWyBLx9+Ea/zHsIlE7Mpts?=
 =?us-ascii?Q?mRzCb4rzbHjlxDC9zsGIVPqO/WZXuhp2dO49btKECH89aTnIxqyatr3BSkoI?=
 =?us-ascii?Q?pprhZWYi9O5CDRew1fDMUvu/QbmFI0uk7GRACHinMVK/lZhjccJSDnUvxx6O?=
 =?us-ascii?Q?BJ3OvdaR6FiO+x6nFZzbY92JteOpbLA0OWM/U3a3GCM4mMOIlIt8F18dJ6L9?=
 =?us-ascii?Q?8uXID1ftzJWN1CZ6blUp+L+wRRvDFOYv603fJq7EWH1Iu9dh/jtltFMOlr1Q?=
 =?us-ascii?Q?5yOxZULUVaCNZQjL1/XoZZ5r6uOi1DL7zC9FfZlCxFb4AJbeKuB6qK4VWMRU?=
 =?us-ascii?Q?8SQ+2ZDS+SxmvkQ9JdyI8osPDkr+Yp/DWnJg9KHCwM2/xBAO1rW80/Uyx3Cv?=
 =?us-ascii?Q?so7J8a/zji1mL1/TWrzXB06vGhgfWzptJebq8CYjlrydsHFz9J5s7mLtnr4W?=
 =?us-ascii?Q?lTyPaQpPY2r1+j5e/6R2oHtq7InIOTEUoa5vMdj5n9phYhL6j/ylYDOKKGYn?=
 =?us-ascii?Q?WeJpT0ndMISf+gHn32wGxpTn8v45diRzHwrKRxikrndRW1WTQCGqtOiVmFcr?=
 =?us-ascii?Q?NIcaWbTDF0Hts51/6Kr1776rYDvaelL7xzJLDN7ock+vjTHo9fpQNNDB7uX0?=
 =?us-ascii?Q?aDIb4r6DXc4gML6ap6UZdawmGuiN5KH56GVGK3fJK2su7UbGepe08ftPHfv3?=
 =?us-ascii?Q?rBgT+/ezKHAIVP3uerKMKIhHyKhPjgl9Q3XD6CIwYtsV0iiw+B2vld+yoGw6?=
 =?us-ascii?Q?j2f6IAbQq/jdfE7tvqTdz+kF0/DZ2G+aWGV4oVycRDS5FwpZGvSMBGLuPULn?=
 =?us-ascii?Q?5ZWpMCc5y/1X6W6CAZs24z+U2a4g0ABXpQq8m5/13+fz4QBedBwyiQkY2Wi9?=
 =?us-ascii?Q?4f6MOgImJwbZejX7iMR6JK9XCf0kv7kP1gmAFns4ywQl3AwgI43km8GM98T2?=
 =?us-ascii?Q?fRCKuKd9TPISYsckJsKoNbDx6orYlgWu+gSR9/RBPzLJZG2npWgARzJ4aw51?=
 =?us-ascii?Q?BbR82HdJwRtR5vwR0rX4a5gP75TP+e6i4Z4IDp1eCGqlmn5XGyglSEOoYCpB?=
 =?us-ascii?Q?gihO1GyrrT2/WyIzjIpbNhKH44sEivsU8j7Veo4VdAkgC+I9Wud0boZv8sF4?=
 =?us-ascii?Q?hcDL8veLA0BKez8whFRG+L5l?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b7a4306-35b6-45f2-954f-08d90eb2e221
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2021 04:12:51.4387 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YULqSssWRGoDESMbDiKNgsew4VSt52/4StfKu+TR0nxTrDHTyoqNVBGypgXsop1IA5bWSApXBl3GxP5kuxwGLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5703
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
Cc: tzimmermann@suse.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The file name for simple framebuffers' drm driver should be
'simpledrm.c' rather than 'simplekms.c'. This patch fixes it.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 4d10ad6586042..7a9879c14742b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5770,7 +5770,7 @@ M:	Thomas Zimmermann <tzimmermann@suse.de>
 L:	dri-devel@lists.freedesktop.org
 S:	Maintained
 T:	git git://anongit.freedesktop.org/drm/drm-misc
-F:	drivers/gpu/drm/tiny/simplekms.c
+F:	drivers/gpu/drm/tiny/simpledrm.c
 
 DRM DRIVER FOR SIS VIDEO CARDS
 S:	Orphan / Obsolete
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
