Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 96FF6522BA6
	for <lists+dri-devel@lfdr.de>; Wed, 11 May 2022 07:28:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5580B10E108;
	Wed, 11 May 2022 05:28:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10olkn2077.outbound.protection.outlook.com [40.92.42.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C620110E108
 for <dri-devel@lists.freedesktop.org>; Wed, 11 May 2022 05:28:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PNRj2sEseTLbfjmmCdBEzhyYkb2NMISxlDNI4ID39vsPo2wTn9WVcfUXE/A3gSIsj7BwjEPLDN5/H8sWuFGjEi2tq/0nyhjSVd5LJO/ThQpHlShsFaYAPP8Ld1MNzNntSJq05u/fVpAEKM+jXGjl8BFsrnycq/3vE05YIXKuTa8dFdvC9rVd+Kkn5QMzITtuiACgRs3jKB6Y7GTdRg9a17OzYzOG5ygUBEa6i+y146oTqOAAsYHP8KX60yQEXl2U4qbh6bjHdfe1i0tOITRPfReDDwO5G55DZxtisBUvRuSQwr0BeiXUjnp6bQlir5bLLZrk6Y6tnh8ovmlF69Xu4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cDTuvnfoUIFFv0ZdRbKe8LW7Yvq6FtVZnHgQrIFbYkY=;
 b=nrVvD5wixzo5SzkhIDPe7xB3hCodLHVDpEKotQKc8ngTrMUlep9KeuJrJ7C/TkLbgXD7/F4cbt2UeWohrMXl70LdY0rTV62U6H0mW0YVjLwxKlelMI2r0WMjhtFF2ciVXHvyuLVTIraS2414i10vephzpFnh27OfJZdgKpv8UB7JP3gTrmdnVUlkSDru3u+5zMZ3WoBsqro8rINuSF3YGJ9HIFxwqD/XyuuvCNNDWPWZERqsGsgZ9m0UL98K8Nbk6b8JES/RNXPoRtoGxb68lWZ5mJWQMSdYkQn1VaewCDr7QaBL6kSlaYbAhDkF+CXnbR9Eh+tzI6xqtd+RJq2x9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from BY5PR02MB7009.namprd02.prod.outlook.com (2603:10b6:a03:236::13)
 by BN7PR02MB5313.namprd02.prod.outlook.com (2603:10b6:408:32::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.23; Wed, 11 May
 2022 05:28:42 +0000
Received: from BY5PR02MB7009.namprd02.prod.outlook.com
 ([fe80::303a:ab1:17c1:2d16]) by BY5PR02MB7009.namprd02.prod.outlook.com
 ([fe80::303a:ab1:17c1:2d16%9]) with mapi id 15.20.5227.023; Wed, 11 May 2022
 05:28:41 +0000
From: Joel Selvaraj <jo@jsfamily.in>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Stanislav Jakubek <stano.jakubek@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Corentin Labbe <clabbe@baylibre.com>,
 Oleksij Rempel <linux@rempel-privat.de>,
 Linus Walleij <linus.walleij@linaro.org>, Hao Fang <fanghao11@huawei.com>
Subject: [PATCH v2 1/3] dt-bindings: vendor-prefixes: Add prefix for EBBG
Date: Wed, 11 May 2022 10:58:09 +0530
Message-ID: <BY5PR02MB700946D0A3DA7AB7BE2CBBEBD9C89@BY5PR02MB7009.namprd02.prod.outlook.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <cover.1652245767.git.jo@jsfamily.in>
References: <cover.1652245767.git.jo@jsfamily.in>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [ZeSgUFANGl+cQO41vqchURwmL2YJtBLtC05eoGgNXLw+Fp72Mnchh0S3fXNde3Xy]
X-ClientProxiedBy: PN2PR01CA0092.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:27::7) To BY5PR02MB7009.namprd02.prod.outlook.com
 (2603:10b6:a03:236::13)
X-Microsoft-Original-Message-ID: <0ac66064eb6bfd76b3c394cfa29c429afdbdfb23.1652245767.git.jo@jsfamily.in>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eec90c1c-bdfe-44d1-1db9-08da330f1bc8
X-MS-TrafficTypeDiagnostic: BN7PR02MB5313:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: C7p3Sh0McObL0pQWfe9xN58KT2dvZcPCcf2P7taFHL2N3KP04IFvEcLhge5yhBLJaD2oX1EX0uOhK1nHj5Uqgcgne3fbL/KaYPxfZh2tyXgAO3ev6YpC8TI1WLrUrsCM6Ej0ml3x4y3pCvkQ3LNxJ0Ufk8yB63j1pGQkkTXAKtixGlO7WaPEMtk2tCHuYJiHSgX5AcWgvkYDoISm0TcJB13zV7B5KHZqWm0XazbuTww3yKxPCP/Gb1/ZRZDjypVTIaD4AZHHhsGq8DNBNVDsMZEde+MC+QtjqXS5sLkg7qla6Sg/8Cuy2ow3ZtRnA0XkRdQUdLZJ9rKm8HevngUOoGyoh3e5RhbVJVslGhis9gAirm5+wfZVUxaICv2ZKjntCphh/6EZFt9R7G5wk6KW7YCBNtByFSHdxdXCxsaVrL0keP8bn1Lb+9eIuuTnI+j/rZOUPPrCTCt1LBFnB0/yQyuZqV5B624Caisq28SAjWcx6gIQr2m/y5DRxexhEqJtyAZOJZRC3wnwxXTovD1pIdu5gikXxSCJLNGROfZApPm29F/tW6bx0hxT5FZ1aMv+wKfCXSaCBqX4dxFDs6+AkVe83v9yL/OhPXnxLWOXUwB+8CmVB5k4gPsy8ROEAavo
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5IAfAls2DmB1bjB0WL1Gm7JeGd9qjJc0LPF1EenliZQBHv75Z3B2X0O9Tlei?=
 =?us-ascii?Q?D5KFGTXL3sjSxN7Pbd3ZhbZmA0KmpKPjIefPxUOCUQp32eVTdGfINobp7hud?=
 =?us-ascii?Q?0rPSLdovDEnb9xAZcKO2tWCww0pUvlD3Bk5EauyVEUaK/iVFOnC6RXwLn8Kb?=
 =?us-ascii?Q?Pl2cEyGII8uJPYctyLgtuFFVaXuMimWoZdnzIhcBQqzodk+ojyAO1tPFI3oS?=
 =?us-ascii?Q?fqoqG/IEl8xNnmBrJ68/LAv2X2ZNpEZ3xEs0wJ0YD+4owF8ljJQv0KbmTCys?=
 =?us-ascii?Q?73+YtwUzKmppDtvUgZ/78i5vzZ0dtdIn9xBg/GlhxALQHtjgb7pJLjB65N+m?=
 =?us-ascii?Q?8KPALb4kCwETAqBwbK9P7B83xsRvU0Q29WJbF3K9vlJVve4nUQZggzmdv8re?=
 =?us-ascii?Q?PnBqj2qKllVzbPDcVXXPoprROFZ7jmTbI5E63+yUIBiGm5OjHnv34+EqaF+C?=
 =?us-ascii?Q?rqJMKOvFWa+3Yyl4p7TqIKlYbRf5rLgUB4MTS1XMC+QqWWoX4GAEshm61No/?=
 =?us-ascii?Q?o2CUt0kOhR+GBhLeD0DMYwAMGGg3hA21z23LSAIq00RN+wjSh+O5AjBLFvUX?=
 =?us-ascii?Q?guzaBZTdn08atbNl+CZ0oC2v/F0YBdSaCjx4AxXUweTmzf4YKM4hsoUN2pva?=
 =?us-ascii?Q?7YrVDll6aSvhv7r+CvuwdLCbKzeYoXuq7HichkSrn0Sv7tIzb95Bz/yA7Hy2?=
 =?us-ascii?Q?Ta9gR1toq7f06cHh/9vgeE0MmPkuJ0gd7MEqsOJnbuVPNz2yXZtPqT2wU0cR?=
 =?us-ascii?Q?XdYQHrMctDrdi6tNPRXT4f+cf+d1RoT1u6o/J01aG1bYSuqKu/eWF1APEWmy?=
 =?us-ascii?Q?qAJ9XtaglHE/iUP2g7C813cRWx8GiBlrnkbNUN7z/aubuvmriFFVQwIyWfgH?=
 =?us-ascii?Q?awYqAntxxy4SJ9+ifjF0G/t49i68nRI+VxiP663ioUN2hGtZY3aCDvM0zvLQ?=
 =?us-ascii?Q?hs4oTPASf5XzF4ig7g/g3yWvtWGv4TZI3RWoM3XqTqaJHLrsNG/e2Qo4Fevr?=
 =?us-ascii?Q?4X7mLp1fonuhunaYtEnfX7Ot1G3gNaq4OT0HatvkejuDEF5628vlWV41Syz5?=
 =?us-ascii?Q?lWWJVNhF+OzKgOzAqGtNhNrRzz0g+grRLehPV9JhIjIwd7rQtbbiLxWYtR1N?=
 =?us-ascii?Q?2jvPR1imPuaQAEey7ORkSquqCqm8i91kyDgzntNNNLcRUBqAc+1/Mtd/RqB+?=
 =?us-ascii?Q?EpnwyKsgxEIhFHNvp5LXTIDXYM1M5IaN/226VGGWgCYfoqsmdI8s7cRKdV7m?=
 =?us-ascii?Q?SronyRIDwF5tRPvL3BEqgjtjoMQnnFWU2a8IbyHwhbUrlycOwrzBobjAupga?=
 =?us-ascii?Q?TE70XCYw6PN2lMVObgNGsArJoIrM+F2ZwP+7dC94gpf/uCSMKnWrWvhtndY9?=
 =?us-ascii?Q?OKWVIfxHqiorkQFuGjAlu3nWgGlB6uJjhJGGM3h3gGq3ZgV5krl3dLt8itqm?=
 =?us-ascii?Q?CeILd4nrSVwDhlCEHhEzPZovsiG21cwpWzGbBUjemMpkwspRAMGLxA=3D=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-99c3d.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: eec90c1c-bdfe-44d1-1db9-08da330f1bc8
X-MS-Exchange-CrossTenant-AuthSource: BY5PR02MB7009.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2022 05:28:41.5908 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR02MB5313
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org, Joel Selvaraj <jo@jsfamily.in>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a prefix for EBBG. They manufacture displays which are used in some
Xiaomi phones, but I could not find much details about the company.

Signed-off-by: Joel Selvaraj <jo@jsfamily.in>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 80e80fa53f8a..effd1cb995cf 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -337,6 +337,8 @@ patternProperties:
     description: Embedded Artists AB
   "^ebang,.*":
     description: Zhejiang Ebang Communication Co., Ltd
+  "^ebbg,.*":
+    description: EBBG
   "^ebs-systart,.*":
     description: EBS-SYSTART GmbH
   "^ebv,.*":
-- 
2.36.1

