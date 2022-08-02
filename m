Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CAC035887DB
	for <lists+dri-devel@lfdr.de>; Wed,  3 Aug 2022 09:22:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA74210F68D;
	Wed,  3 Aug 2022 07:21:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2059.outbound.protection.outlook.com [40.107.20.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86D6710FCB5
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Aug 2022 09:58:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eDwRj+yjEJSvNRpVq6aK1qC7Qip5Q3RIwjQDOR1lseqtlBfg1kvRCocdKywFRzWy/0r8hHIiOpNV7AwTX3UVGvGxHW9MnGyOY9PMlhiMZZdKHJaCJXS/PfVDzHCyujsco+eXUf7B8nV0RzPwQuWWDOFMBT084pcBH8o5b/Ru48R/Z5ZRBKpfTDd1ZV//cu2VcPGmbGJfAg7PU15JBjcxIWl/2Vjz9LgBJDr0kU7VksO/PPFndELkYxTeVj/gBoVJdJOyX65B6eoOX0NFL5KQcIWclQ5wM5G/8sECSgv+WieTRxhchV91eTAxHv33ewp7dqV2duTVzPm3RUa9/KTPuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JMaUYaQcN4WcuDP2F3cy1CDudujZulTsfHyIvpHi2No=;
 b=icpEcizahJ3iDQv9xzooReFlRHAgJF3ZDylbfL9d/th3Ocz8cTSvY/GJ4VvdSX3ribyAsXfOq228v4oo4dfZ5Yq96PR/tOzUtPjnRFJ1e7vm58MPYAfM1MYP7/D0BS/1klDynUZ9rfAumrb1zkh70pzyrflWI/3Uqh8m/RmHWAd2EAY8KQyJrsMnN4Wdt8apIXUBFE5s4oIEdIPJfMB5aqj/6XZPChH2fZw+ov8Rmrr/Uub4o0BhysTMf74wRegR/RgWKhjDJ6VO63N7ZIFyaotp3jSZwEc+Ua9TTthzcdiGZv9KH8Kp81RUK80Y8bPSl/vvEK7/KVBfF5sn/aGzyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JMaUYaQcN4WcuDP2F3cy1CDudujZulTsfHyIvpHi2No=;
 b=ITC6Q6ai+LFYlnRUbOVAtjiEoF37uJn7lVsueg7ZLJBpXVlDDyzFcPwEyj+EWcYczcJrFfnCSgLcok6CQyT2cjENCFPXbkj4kfbZBSs/GvYUDp2A13e/ZmHYC2L3MwnNdwNF7vvLa5Z1XDssz1DDWbcsz4HqNSWkp2zl2puNzrw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB6737.eurprd04.prod.outlook.com (2603:10a6:208:176::18)
 by AS8PR04MB8341.eurprd04.prod.outlook.com (2603:10a6:20b:3b0::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.16; Tue, 2 Aug
 2022 09:58:54 +0000
Received: from AM0PR04MB6737.eurprd04.prod.outlook.com
 ([fe80::6ca7:299e:d92f:7d1b]) by AM0PR04MB6737.eurprd04.prod.outlook.com
 ([fe80::6ca7:299e:d92f:7d1b%5]) with mapi id 15.20.5482.011; Tue, 2 Aug 2022
 09:58:54 +0000
From: Olivier Masse <olivier.masse@nxp.com>
To: sumit.semwal@linaro.org, benjamin.gaignard@collabora.com,
 Brian.Starkey@arm.com, christian.koenig@amd.com,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: [PATCH 5/5] plat-hikey: Add linaro,secure-heap compatible
Date: Tue,  2 Aug 2022 11:58:43 +0200
Message-Id: <20220802095843.14614-6-olivier.masse@nxp.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20220802095843.14614-1-olivier.masse@nxp.com>
References: <20220802095843.14614-1-olivier.masse@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM3PR07CA0145.eurprd07.prod.outlook.com
 (2603:10a6:207:8::31) To AM0PR04MB6737.eurprd04.prod.outlook.com
 (2603:10a6:208:176::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 219c9b1e-b2c4-4692-8da2-08da746d9be6
X-MS-TrafficTypeDiagnostic: AS8PR04MB8341:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7dpQHTNFi7odGQcvJk16ccjyLXpRdt16fWo4qhXIVDJf3UZz7uCLvjC/5JnmtfozspZlAgwNFycRj8g4r+YeHsmaBRC98e5CnEC+xpfnvw/PgGiPlepeu6EZy1zYg1ecaUmgQ70d5jbKZxikCKPrymdFtRwNeGiZC4g7l4tT+HblPbUlNAw9IuqMuqrbHP/Wswq7lvJBYVimgWnE3gvUEEL0KZrIgjGLCvyAjnUebkWGsSpffoGJ+Kc5HQ+rF91OJ7PFcJ7AtVaybrbpRr82enf58zEXlHbfZS90VUwGm/+/hXaM31bWXXSHTJpLiDopWFHp8AQlsOfPtzW2vZQFMKklvKET6sIVW3/fyKnMkIfh8ttS4MRMnVWvWMrU0UCjjXJ6nFFmHrOPeNPoq8dZtvimksgiv/k3EXt0uxXDCExkFAVUJ3SM4e8zbjJApxh6qMZ9EwiFm+u8h8Nj814mOCk9jDhasjdDzRHHUq+bNofRzr52UxVzx28FtvQzYMp4esmnf+O0J7rgeDPDKINetdgDgW1Q8IiQu2zYxH+e22qOLMllFHHkGVbzbJmOY+KdOcdrvAS45a88VS1MTOrow4F3zEHOxJQx4psR0YXsMX1nM1fsAU6kqOKZAqAPLvFcHwmtiFog5TorBVh0rIMqIkq0Yt7uh9kurU2bLSYhIdmCvoiaIElsKXljO7MbejNurJVA/AdGy8CKQiabCzjZIAae6WQMKNwXSpHZZ3870CAr98KR6WXZ+qQ1wbJ4MthWfqN149LXcy6fI4VvnIOV9WJnRQInAD/q+1DfoNHJCsI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR04MB6737.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(346002)(366004)(136003)(39860400002)(376002)(41300700001)(2906002)(83380400001)(2616005)(86362001)(6666004)(52116002)(6506007)(44832011)(1076003)(36756003)(26005)(6512007)(38100700002)(186003)(38350700002)(6486002)(5660300002)(8676002)(66556008)(66476007)(66946007)(8936002)(478600001)(4326008)(316002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?w44S6pk0jx5fXLp4QdyaZ1RCUQh13jmGIQ0caYHy7TLUvg0m1QEmImdq/eDE?=
 =?us-ascii?Q?E18iktoe3LZBKzF2r2l+lxS0jll3NZt3Ak7xPbWZA/XOkSsKC0EV2sVVYzkE?=
 =?us-ascii?Q?0oAHJi0+2VzphTpy9JyX9eW9Yic1e5p2+PAMVlgM5oTzyHZ/f6Ag5q1+xbVm?=
 =?us-ascii?Q?USwmeg7jDobMyW6TW8yt/mAzbsgqSWinSTP0iij/wU34wl37uUzuiQoTkeQn?=
 =?us-ascii?Q?YROzQgMADxkyBbzS6KKjXNJcqHCWivhu3SrjpmP9NjS2voK6Tf0EDwYVd7oz?=
 =?us-ascii?Q?qYiGh8qIbl7aK+W8DNFWUevbkGKrFqP3PqP17FIUkUyTxBG1KClSpbXii5M7?=
 =?us-ascii?Q?NucMl0gNCwKXRPmBUxS2OkQ4GsolrdwEqHdGMn3t7OI0aKCAnFSUQh5yyE2E?=
 =?us-ascii?Q?5VNoDChyVPqpQwwC3wGW1E+WSPryEWEAfD2UYgViowrSRWKT3TCM6CAnBjDX?=
 =?us-ascii?Q?sIpbFxoQvrPfIf1hq/5S79TPotyTNzMRd/6bncdFAm/liAAnK2bHwXE4N+1K?=
 =?us-ascii?Q?nhaQn3musgza7T6rtlgCRFA2jeM2+NDHtggtILtAJdDLVc2tdY2j2UNfoOR2?=
 =?us-ascii?Q?RQX6oenQtZe2N5vhARUywUaVlEkiScf/ga8cadEPAmFzJiWwoH++HZf0ldPe?=
 =?us-ascii?Q?KU6VzaWkmP6MAnjgAZL8j24jVJAs4YKmuLZNhcGWEZo477bTm3WzeEh7ciLV?=
 =?us-ascii?Q?8EXPXiaArxOIrUFKA/BFOaRvjv4JnEw3xIHs43OzttEKvvDhCAxIm1iRmTS2?=
 =?us-ascii?Q?7iulAA07fxUPUavq7dPOco6wcwsJxqM6g+bFT0dS/9t7ArEzdAQZVooQilRI?=
 =?us-ascii?Q?pHU5gXSnY9nEWmIvu0a+LiBbgRiW2Ztl2eAT1j6rEBZ+M7KGRDD6LgBhkD7S?=
 =?us-ascii?Q?X3f5N1zM8fjet9/eD8yYt+5X/Y6CL/mUfqsVN/ZxxLl37ut8r/s4Dmcfd7FD?=
 =?us-ascii?Q?DG28pdtMFfV3YeEPV4DNx3kuVWofRNqBm/hQw7I2fOsox25qbu/abN1+T/A9?=
 =?us-ascii?Q?BZmHSANSgfyDWOgUOr7dQlt+WufYdk+Eko0AZM0fgFkxqs+Wl2v8GxkKaSvO?=
 =?us-ascii?Q?mbhGea/r8pz8+7Wz1Gtmt4rCJEimvqLEZtxViIGzWUMdQvBc07O6RrmxHRfx?=
 =?us-ascii?Q?ymrFrQfH9koVNSI4rxPtGA0jmeWwL7hUvVOKTYvyfQB0OtwNe55xuhvcDHV3?=
 =?us-ascii?Q?DTbgdEVi6l056lJPMBo775fF5Q3K0Tuu0i11ojWf1Z2dblT0NbZVQTRuiuYy?=
 =?us-ascii?Q?U6XiQeHCnZGRc56Nfg9QIqYOB2NZdaqIy3/NmuMGgU3mBW/JNZf8IBFCsOWG?=
 =?us-ascii?Q?/ZaKFCFiX7gbUOZkwXenJHFfQqnBc9xlVS1NncYu+BMMGeVUa0SduJqEB2ew?=
 =?us-ascii?Q?0+PDs786jw07/agkR9qhlsKLHjW9pfP1n7qHTUcCk0BFg/BSjV9B9efs60Mf?=
 =?us-ascii?Q?BTlIQzA2lqIKmcMVW1JOkC2ZRrndKeD/iFaPlwI4rUeNrQroQEZDk7IU0VG/?=
 =?us-ascii?Q?G1S5+Oszs3xE6afG64oUzxAwZXizyI9ier27cVjLi2w0YzIiue6ayZd3iIJk?=
 =?us-ascii?Q?/Z4JA2+Utt/T9nZFZpLskxUt4/xGPZMrF0NXRUa2?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 219c9b1e-b2c4-4692-8da2-08da746d9be6
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB6737.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2022 09:58:54.3587 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XbUbVGGO3CBWraDX6qkrzPjjNmBRvqTX9hINUUh2Of1C44RobwJOOdDpd+US+wC7bKn0V4ldQp0PDyx8NceGXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8341
X-Mailman-Approved-At: Wed, 03 Aug 2022 07:21:28 +0000
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
Cc: clement.faure@nxp.com, olivier.masse@nxp.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add DMABUF_HEAPS_SECURE in defconfig

Signed-off-by: Olivier Masse <olivier.masse@nxp.com>
---
 arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts | 11 +++++++++++
 arch/arm64/configs/defconfig                   |  4 ++++
 2 files changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts b/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts
index 3df2afb2f637..e4af0d914279 100644
--- a/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts
+++ b/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts
@@ -258,6 +258,17 @@ optee {
 		};
 	};
 
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		sdp@3e800000 {
+			compatible = "linaro,secure-heap";
+			no-map;
+			reg = <0 0x3E800000 0 0x00400000>;
+		};
+	};
+
 	sound_card {
 		compatible = "audio-graph-card";
 		dais = <&i2s0_port0>;
diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index c09b07c22d57..4b625043313d 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1465,6 +1465,10 @@ CONFIG_CRYPTO_DEV_HISI_SEC2=m
 CONFIG_CRYPTO_DEV_HISI_ZIP=m
 CONFIG_CRYPTO_DEV_HISI_HPRE=m
 CONFIG_CRYPTO_DEV_HISI_TRNG=m
+CONFIG_DMABUF_HEAPS=y
+CONFIG_DMABUF_HEAPS_DEFERRED_FREE=y
+CONFIG_DMABUF_HEAPS_PAGE_POOL=y
+CONFIG_DMABUF_HEAPS_SECURE=y
 CONFIG_CMA_SIZE_MBYTES=32
 CONFIG_PRINTK_TIME=y
 CONFIG_DEBUG_KERNEL=y
-- 
2.25.0

