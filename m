Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 460505385DF
	for <lists+dri-devel@lfdr.de>; Mon, 30 May 2022 18:08:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DA5F8901F;
	Mon, 30 May 2022 16:08:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11olkn2082.outbound.protection.outlook.com [40.92.18.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2B5C10E61C
 for <dri-devel@lists.freedesktop.org>; Mon, 30 May 2022 16:08:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cleeF8eJ3F0vxOsGb00rWYGrDPFw2xSwHWn9ixHUNxQh5TcwYwEY1bZ9KLoc15SUru0CYZ5kYt2K19I33oTgu2O9KmAGY4EkyKffd9XEkpFGqpq+tzSfQCygZLbMjdxbQXlxa/wDTuzzlsrN8tYe+A11oVXoZSPSyEIXQtQpZULESCpn1i9cIUG9bJff36UegX8h2i+ZXKEv23k1SPOaS+DrdalYdae5MLP/yltpMoB0+OQiyN4T8smzG/8SMQNJDOAcDKGVtIew0prSSFLJOzHES8ys502c5BdMqsVk5TE4fO74vwFv89/+Ycd+1TN2IFeWJqnm3ZJIW6PTJNLG/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LY+P5rWMzICwvYrYpvhMcI5Krcm4OXnqLJJ5xCmhqN0=;
 b=U9D9OfCRRDpJnEEzWbUCQHu9ZEVEWnb4JgfwX9HwDmgN0D8D+yrdwmmlu3s4kI0ehHbnJW38WLj116uIWETA8uhiDRnTygPrk8skZA1G2EnvHoAP4XEP9me05CqVhYu5EBcIB99LFRpT/GDnt226bnIZ9So8s2G2yKKbSvD1a8FV9Xoe1JTL/dh6mihqwFFGRILuXpaMBbXidsQrncaKc7lOXOPetmFqs96N5mBrb7XbMqkfS4mJ3o4WlAancbCDDcHSXy3WTiETjVrRSSAf2A7XnYs3vp5pD8pIyEBgE30ItnlbKdSo15rMfShjX2zSyWJ+GRrey1dTAYRQQvjfZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from BY5PR02MB7009.namprd02.prod.outlook.com (2603:10b6:a03:236::13)
 by BYAPR02MB5880.namprd02.prod.outlook.com (2603:10b6:a03:11d::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Mon, 30 May
 2022 16:08:27 +0000
Received: from BY5PR02MB7009.namprd02.prod.outlook.com
 ([fe80::303a:ab1:17c1:2d16]) by BY5PR02MB7009.namprd02.prod.outlook.com
 ([fe80::303a:ab1:17c1:2d16%8]) with mapi id 15.20.5293.019; Mon, 30 May 2022
 16:08:27 +0000
From: Joel Selvaraj <jo@jsfamily.in>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Stanislav Jakubek <stano.jakubek@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Corentin Labbe <clabbe@baylibre.com>,
 Linus Walleij <linus.walleij@linaro.org>, Hao Fang <fanghao11@huawei.com>
Subject: [PATCH v3 1/3] dt-bindings: vendor-prefixes: Add prefix for EBBG
Date: Mon, 30 May 2022 21:37:51 +0530
Message-ID: <BY5PR02MB70092E9495F2A52F473DD31AD9DD9@BY5PR02MB7009.namprd02.prod.outlook.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220530160753.100892-1-jo@jsfamily.in>
References: <20220530160753.100892-1-jo@jsfamily.in>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [CMc40h3fA540/qxdO8AdvTsKy6M0YHtlUTFLJqymK8KuuzqHrqfjbw/2fdytKoQs]
X-ClientProxiedBy: PN2PR01CA0066.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:23::11) To BY5PR02MB7009.namprd02.prod.outlook.com
 (2603:10b6:a03:236::13)
X-Microsoft-Original-Message-ID: <20220530160753.100892-2-jo@jsfamily.in>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6c2e92b9-48d0-4746-4683-08da4256a15a
X-MS-TrafficTypeDiagnostic: BYAPR02MB5880:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8c3LmOnD2b+OEgLw/s/ehOULrH/mzJfJ8zjKc9ePsYmhZdCArSY78HtEGjgQYbYwm1HMwybA/g/UlbeAhbqeRO5xjPWNORh70FDGlXUYb9cvDygFVxKldmq5jCw+xiWB++dX2/vp9XnYEec4f5I2iS4Qj0MArRZxpsB6T+JqPOB3nvz0T0QZ8jVebDiYkmVGsuAkPUA+DvHA38RsQ5iWQzlYwN6DSe5YhvjYi1gspzzMbc+RMDAFWiDAV4Bb2OjvAIIzhmZZkPs0nukLNm2VKwtvv+jF5prCvoZ3ubWmWAMCu6Ayr0TIDwyVEMQQtHjF6ElfRYOPOVF1jBLVLmOPYGW+w3oUcJO+dIvU2MkUmiQeFkbv7mYwhlJC5+3GLgLFrep6yGxbuOYGChion02Tg9RIIC5mVPa07Ymb/qzYu0B4Is+nIHyIwffjpFieMSSmGV5eC50czMtDJjNdtb6r5wBj56rT5FrGYzCU+D4vY1tKZUK/9z9hkLfbmQEhR5lSZU0j74+lMJJEWvekl+1slJnQHJs9O/ksr94rsBVxlcAaSWAF/6Xu8zUgQLBYXa7VeXdJNHPhapCLWT+iS3G/Zw==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?D8Fc2U2T7cbYxL8KB9s+MtzB5jK2Z3QdXzq8VmgqqmvOSobzVg3vL2Kz021E?=
 =?us-ascii?Q?yNMgF592RwzbsaSFQdLhZLsi67YX0eYGy152nF5232tPQuhpxCCUkExbLLrt?=
 =?us-ascii?Q?TZ9H02GZDVvxbR7oLIITOImC44yvOW9OWsEkSG0rQ9MoIwka9xkFX/LMt1ZA?=
 =?us-ascii?Q?0j+7Cwhm9yPCb3X2DmDmzTmus332h6PLKkqhcfC+eGSA8urR63dbKtZb/fVx?=
 =?us-ascii?Q?Rs4Am8Qp7ERMQw8zXQ+WsXM+fC3a8idjofk0tOTQteABF2uREt4fcpTjyxpF?=
 =?us-ascii?Q?vJilL3VG0j6ze8efQj4bne3yjh2wZswFGgCjlCER3VvNRaFhVBHvhtEQBMPM?=
 =?us-ascii?Q?ZG/EqgM/eqcDjrGg68WRCrVmzvfycFnqilJTAFq6jtqJ4kfVB/wNIXIUpx2K?=
 =?us-ascii?Q?zQdvunxwdeMVJ/5r9o/TCYmcnPx97xsZmfn5t2RhVUd07qpWSnXD9T6Rt3Ae?=
 =?us-ascii?Q?4+RKyuPI/VYHiTa3HxtfvUS417/BBk276KCka/3GMMOD6ky9GVjMrbySMTkI?=
 =?us-ascii?Q?2RzmhcCCncaOq/s9yNPviKjkYChJcJABmCSiuwBX38zvdQ3rx9rXHKvu/mEF?=
 =?us-ascii?Q?0KwEWg/PaXlkpsd/fGxUCnETn58zjB1OdQneCWmDuHVnGRrX0DH+DTeFj4XX?=
 =?us-ascii?Q?EglyihNg7//1fAHRCc3gbYHHkne7wnrL0Z2K62aiHR9EuD6CL2Fv9cL3+VvO?=
 =?us-ascii?Q?mkFGxocX8gNp0OBQD4mICF5809y8fWaf0/JTpNqXZmLVhi15IdWddWzOinDX?=
 =?us-ascii?Q?h+wmbjJpuL2+4JUpeqrZAKMGGoA+JkMvJwigA7dizYXcsmfRSl1nT0yjI8Uz?=
 =?us-ascii?Q?96oWxs/8w36lT11D3XXN/eN17MHSbMcgXrRusSMDnXkmrwKghi8OFm9sUpvH?=
 =?us-ascii?Q?fRpJrrL/nCqk0z1EUFTBBpPMXEBcyZoQNKMsoVLadfF1L+0aICOwCxKv6MVA?=
 =?us-ascii?Q?YlrQngdWxyq6M3aGRzWjL9RXcaAsUp52glC78PEuSi6NfKheFN3stnOBSF+E?=
 =?us-ascii?Q?mk+j2ST+eCQ94aLdoYWFjBSILs9BeZT1iYzPSVCjm2D1zx1JokSkRi50eGHm?=
 =?us-ascii?Q?1Hl+H1BGbCmag12jb0kOaNhJkQZRbfoIajOZngOFIx8NFN6bEk2enoXCk+ox?=
 =?us-ascii?Q?sJMpcgyC3JQTr4wEIGGN9cDCCA5T608i1fQ25hwrkfbZrWMW2+kTxTmdlGBp?=
 =?us-ascii?Q?YtOxRuasM+dc8RLsORdic/BMwv9MOdFO4o3yX1NWkoLShbk1Wct9vkq5b71C?=
 =?us-ascii?Q?MNv14CyVjY27hBV+z2g06OjhfwwMxpWpZDZ6+dVTFsrmXXTkQbhpoIF5U4+S?=
 =?us-ascii?Q?fzqpAHJjqjCbMj+OQU/JHJiDAhIHUa1y3qHvKXvW+VmZ0z9uDSLtc0ha3qiE?=
 =?us-ascii?Q?BD14jRBUSeFOLGi05vglqiOfQAyb+AaFT9w6M0SKQUaLexYgjgr9hM7efGwE?=
 =?us-ascii?Q?jXnwwWtIBCbzcuyiXywr4rr2XzoX/VjMPJgH6kSm/eDHg/s/SsXxQA=3D=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-99c3d.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c2e92b9-48d0-4746-4683-08da4256a15a
X-MS-Exchange-CrossTenant-AuthSource: BY5PR02MB7009.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2022 16:08:27.2389 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB5880
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
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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

