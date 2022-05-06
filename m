Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9345551D766
	for <lists+dri-devel@lfdr.de>; Fri,  6 May 2022 14:18:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49E5D10FC8B;
	Fri,  6 May 2022 12:18:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12olkn2092.outbound.protection.outlook.com [40.92.22.92])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3269A10FC8B
 for <dri-devel@lists.freedesktop.org>; Fri,  6 May 2022 12:18:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eKXCyC3nBj3AJsA6SdtLT3NFCFqAFUXxW3700pqGEO6dyHrxbKeJzsteyPVvDQLZP/gcynps51MEcevQBQv4QybagMkWSR5neYEO8wKT+977Eja7uvJj/f59VqY7oTidqTOYwZjtKfELot/ELhne0iLxbl8n0GGH7dOwtn/1yFD5YWNdSipSlZg0NaMJhyvKMJadtjJTFQeH4lqQ1VTApe+QBfllCYiv9LSDtyLbTLuSau9DouwODazFqJJpK9UKCgn8o7oxCqM+yNNfGQWWihrBPiIuy90E/x4jKptG3ZcoSCP0bbKz6Cldpd5YLuozKc5SVOWTaVubsSHwEK0CSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VJ4NHBSvqoJEzSNxofZVHhrWnvcoF1MOO5OYANW4rqA=;
 b=mqJI/yjUkMW52YnVWD6Z2fdg6D+z1uioFpuYSSYkTXFZalglFf69l7vEdD7/g7dj3aU6l9/vmlIBkR7vxtOAi5bJW74XM7t9TnUttWVthiJ+OzEevNWUDx1leeNR/gN8OcJNDoIy3i/XY6coeW/T6A1H0RKHzacb1kbhliJG8jdhqM9i+nOMSq8ek2kxatzHTR8Kiob7YCM3ZSZyCxE8lm8ZVIJecBOCtKZ8T9VMNKAEhzpuKWiKdA2IJn3DoveZS3w88AkyYW6V2KS3WK47W+09sWWOprNVtnBbrREIEdJvWi+1KsEj1GSi2PD2nOLgdQTvSvrXW8fHwvPHqnCNDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from BY5PR02MB7009.namprd02.prod.outlook.com (2603:10b6:a03:236::13)
 by BL0PR02MB6497.namprd02.prod.outlook.com (2603:10b6:208:1c2::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.20; Fri, 6 May
 2022 12:18:03 +0000
Received: from BY5PR02MB7009.namprd02.prod.outlook.com
 ([fe80::303a:ab1:17c1:2d16]) by BY5PR02MB7009.namprd02.prod.outlook.com
 ([fe80::303a:ab1:17c1:2d16%7]) with mapi id 15.20.5206.028; Fri, 6 May 2022
 12:18:03 +0000
From: Joel Selvaraj <jo@jsfamily.in>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Stanislav Jakubek <stano.jakubek@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Corentin Labbe <clabbe@baylibre.com>,
 Oleksij Rempel <linux@rempel-privat.de>,
 Linus Walleij <linus.walleij@linaro.org>, Hao Fang <fanghao11@huawei.com>
Subject: [PATCH 1/3] dt-bindings: vendor-prefixes: Add prefix for EBBG
Date: Fri,  6 May 2022 17:47:33 +0530
Message-ID: <BY5PR02MB7009E985CDB281DC9BE9CF37D9C59@BY5PR02MB7009.namprd02.prod.outlook.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1651835715.git.jo@jsfamily.in>
References: <cover.1651835715.git.jo@jsfamily.in>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [mJfgWRlfwVkd0NwM6sfNMnFTxxwS9njEQRDBcgeLjQboe9v39RWjR4K5mcxHgLGt]
X-ClientProxiedBy: PN3PR01CA0135.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:bf::6) To BY5PR02MB7009.namprd02.prod.outlook.com
 (2603:10b6:a03:236::13)
X-Microsoft-Original-Message-ID: <0ac66064eb6bfd76b3c394cfa29c429afdbdfb23.1651835715.git.jo@jsfamily.in>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 60f6f892-e991-48e6-c2f1-08da2f5a7792
X-MS-TrafficTypeDiagnostic: BL0PR02MB6497:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: izurhWxjHMIln1u0iPaLTqhXopZ6+Ufh9n0IWH6QK8QMoHgg7vU2Fr5tsvGTrF+dAqaKIE/DmIKYzoUfaS4w2bJLdE3mlh+BCZetlxovEHFd9HXZvxhvUg/31wGJdTqOSjdSpQshFTjiWk2/ckGi6UQT2+wfqfpZ/d5GCbiyluIg0a1PHbimXvOnmi0LmStzt1R4YR3I0XyacQ9SjP0uiYO3UzgMAdnaZU3qlU07d67jyKupQghjxw2CHS5jHY+1OehyZUK+1Q5ZVsfuqC2AspfyXAQhcyHV1o+nZH3vflSUQfk4KGTnIRqCV8iiaqiuHE+JFDL/X3ZqW+/Ox8ap/ThRT2WNSChAZRf4jFAOgorqqawudnRHKm3j5+QB2WeznbQtAb+s370Aytw9fuLVUp/Q3ErL/cFdln3JAJiejvrCuu4IEQEinhWPFktz/BXTSOQ8+D6izyEThWtRD5bx3IA3J4nAZRnLnotq3JvNkG3NtS+ukV6DF8tQEkteZlPkVZ6WdzTdlUZXDrDIYjExD/55qWID8SyDunRmsOqu2C2J4Rao2uXUHztmbI3NC05aIYxDoK8jCDuiywqk9i/NKXhOjvObjET1Yhvdb8fA60kwLFiSllIdkaofXxJtcsQQ
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?aoMKrbnyMGlUbTmfYC4f++jhT6PBtEEMbcuVi6WFTDN4+Xb/SNCUJRi5WZRX?=
 =?us-ascii?Q?PwUH5ywl172YxpOYZm9Obfhyfp2qzTis27PG0G+w0S2KZ3tmBvJp+zsiidfw?=
 =?us-ascii?Q?JodOUS14338pm7FPwCAsDNRP8H6UYDSjD4lu4hUa7taKWGTeVoNCwH/uTbkT?=
 =?us-ascii?Q?sY8yxLd+JCyJHLBBUoczKDH9ox0k1eZHjVew04KQamGka5tjY+Hob8rmNF4U?=
 =?us-ascii?Q?nOTKOzhm6dyTv20+LMZpCnP+HXufthBgWAG25U+Cy3ijj6dXQbgdXsHq5v8N?=
 =?us-ascii?Q?EegCJxoa62L9t3fsJuwRjnbYkPkx0XXPh0alLO6E0F01rqJMMcWq50ZwuEsW?=
 =?us-ascii?Q?n8u07m8tq3Z8cPFrMP+oPm633VO/NGp2At+j2Rn66Yna6pq302Q6Xv9H0Zfy?=
 =?us-ascii?Q?I4oLCLYjIzCFdgnZz1vYIn2d5uJNsUw0wvJT5rbJyUcgOwx4MkWphwguTCUH?=
 =?us-ascii?Q?CscB/3TsbuXEiFFtJBYn8pgxAEMxvA3IC1i2h9jAFafHcc/WvfxiGivetXdV?=
 =?us-ascii?Q?X5NUKl2MV0LQY7fMTXmrsQYL8NGgCOv3JMkCB9sxa5yx89Xe0Cyn4xMZYLvY?=
 =?us-ascii?Q?gzP4jYgrT1t126hM5RiW5dYNsbmtXKw7I2G8MLP7akFhEb5AH9zYYtN9uON1?=
 =?us-ascii?Q?KNQk0cdkq7qLxfhI6A1k6W1RLabTVAGEm9jRoUSW08gwer9o/dS/Dw1HpAHO?=
 =?us-ascii?Q?qvc6RyDpsnZKWK7oqneNTPZm7eRJUPv9mpi1dJ/8I3/7sBW4cD21EY9ORpzU?=
 =?us-ascii?Q?SGnQd7N6LlRQOH3STOQkNSesXTZcMX/WkjY5QZZh8Olmjz9jksnbIZdt9CB8?=
 =?us-ascii?Q?5EYmIZGcYHyRAqZ1xnE/MhsaElBy6oA+MIO1rOVVdfaRyLfbwSMJAcSinBez?=
 =?us-ascii?Q?R1XVFw9gzB58Rb1S8qTdFbM/z5A/IafhZolJEe0ZJ3Df77jpeNoKhqzbbejD?=
 =?us-ascii?Q?Tt817vB4cSfZbH43z+zZXLF0esGc3UYCbOPNspbRfGgEciKWoYeGZWkZpLC/?=
 =?us-ascii?Q?cQrP/TeaRq5rdEQcFGQ0uuTJwbWbVoS8Rj5r1BqVvxcGszcAxXCC3IfaqhGp?=
 =?us-ascii?Q?baXDROAVw2ADOQZEk5Pb+V1Co6bqdftS3Kmt3O+n+Iv/2GdLOpYXDVlvNrfw?=
 =?us-ascii?Q?Rgjbywse4b+8onKi9gVrf7hJFKIglHrgYiaklGrx3n+VXwHWv8Dg+AQfqhXw?=
 =?us-ascii?Q?qKTDtrA88YESzsZ6AadERBMhV8n+YJnP19XLHlEUOHJLuUX29ZqvtAgbwMT/?=
 =?us-ascii?Q?6NZJSGp++mvx69u4taLGYEzyyKU2ukspqy42rWSCDWi6q7junNRFc9mUh3iX?=
 =?us-ascii?Q?jjFX23FG6mafJtx4n1rLxJW7aMAtGmFdkxPkluaHQLwUV0D5Ka6Iz2K6Iwlc?=
 =?us-ascii?Q?thPvfBiJEYuyTRwWB2V4BKuSqIuuM9f324KuBARGoULmBhBeisPeyg8eOh0G?=
 =?us-ascii?Q?x9cYLda1ymNSlIGCltvGkhl0LtVmx9N5Tid44bI9PppT76ylIPHgiQ=3D=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-99c3d.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 60f6f892-e991-48e6-c2f1-08da2f5a7792
X-MS-Exchange-CrossTenant-AuthSource: BY5PR02MB7009.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2022 12:18:03.0702 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR02MB6497
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
2.35.1

