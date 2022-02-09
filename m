Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA7CB4AED19
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 09:51:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0312710E4DE;
	Wed,  9 Feb 2022 08:51:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80040.outbound.protection.outlook.com [40.107.8.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93C4E10E4DE
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Feb 2022 08:51:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WkSp4CtYvHysXqm7u5v0XOfuoUyItoDVvZEvBxlfQp2xv4Dki3mqP9E5kGrWxujOm3gFVLZNUs8KpCXRZ/LlpDugVQb7QX39yms9xjcq599jh1PIgUp/y5Yp6o2UHKfQGIuorQHBlBdwbcJhOG6HqzEsouin+fNA6PK6yGz+f2HTKFOpOR5LLO4v4lLHJnz0qq6mx/m8bjGBmUy+cjhSKYQN3++hnYBqSsTAA1Vs6EyXc66u1wnVqme0C/hG/B0k8zTnIdgJRw46hH3JmGNVXjBnXhO6mYyGs2PC9jfNc9YHPIzYKSavVz1V1v/fk/ANEcvqzcosL/9l+Ip41AH28Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ebd/xWBE7cuYoi5NM7TI8HQepa2HmQ7VskUhFTenCLM=;
 b=LqurX2nlDxfplxswkjnbwB7VWN7dZSzz/njBxBVutf3omdjsKYhsjU3T8ZS16/CcGzNo2r4Du5MVtkwLw/oTH+AZG2V5ZvOQ7uheMZHBXwUpC2Mia41s7J7ZH2gcGFTIjMpstQ1HZ+C3GASVkKJ+TLOqNSZTSxjzlHRb0kCvHITCfRouzOd1zA6uZCma4BGGOb1H+3TX/T4hJRYBtLYITTtgG6n9CDyfPO9tAlwuZf81du0DKQ3tR5Sg/QBfnI+f/9sotupNqpx26nEy907fMd2LrjuYaPMJ37c2RscyhbZru2MM86xmBje+Ek87OnZgwvfcJTUyNsUDNzUeK7tKuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ebd/xWBE7cuYoi5NM7TI8HQepa2HmQ7VskUhFTenCLM=;
 b=grB9hMgvQR00iwNS+nJwBfKrCtn6iAPMy0lvWwYQ2PzsTBgs8N1BOdQvraWnMHoU2Q5FOiozjaiaCA23xbzIl6kguiuwWd5yL13MX1Osh+kSpl8zGOt1cNqnp53wPViwLSp2OBKIGkdkjSyfUVWjWxAy8WHzHPypfSAk4xCh4xw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from HE1PR0802MB2426.eurprd08.prod.outlook.com (2603:10a6:3:e1::23)
 by DB6PR0802MB2488.eurprd08.prod.outlook.com (2603:10a6:4:a1::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Wed, 9 Feb
 2022 08:51:23 +0000
Received: from HE1PR0802MB2426.eurprd08.prod.outlook.com
 ([fe80::e14f:197:5001:4c56]) by HE1PR0802MB2426.eurprd08.prod.outlook.com
 ([fe80::e14f:197:5001:4c56%3]) with mapi id 15.20.4951.019; Wed, 9 Feb 2022
 08:51:22 +0000
From: Michael Riesch <michael.riesch@wolfvision.net>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org
Subject: [PATCH v5 0/5] Add GPU for RK356x SoCs
Date: Wed,  9 Feb 2022 09:51:05 +0100
Message-Id: <20220209085110.3588035-1-michael.riesch@wolfvision.net>
X-Mailer: git-send-email 2.30.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR0P278CA0072.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:21::23) To HE1PR0802MB2426.eurprd08.prod.outlook.com
 (2603:10a6:3:e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dc0a57c1-0f0c-4d67-4b05-08d9eba958e7
X-MS-TrafficTypeDiagnostic: DB6PR0802MB2488:EE_
X-Microsoft-Antispam-PRVS: <DB6PR0802MB2488B7643E49D2EE86307751F22E9@DB6PR0802MB2488.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2331;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +UcC6Q6qNYJbB6EF2pk5lQgxhvSGUuifFxXQm3hHszji8BsLyTaypqP2jzD/rDMhGPFXo3DD9zmcAVmDnhtyRA7THt6cj5sqNtTzoFX1G9yCbSX367x/g21ysi+P/hCYrFYj5fnelm2N6XGYeP3cO4M9v4fqMm6WXlV2hnPBPUrf7WCFTu/N4o6nHESvrR7tOmww2DWQpyRUjKE5j6Vj2OjKq2+CQN/a8fGPAjyVH+J06naOmxsrO86D2L8TywSVkLcirdQo8oAsbUL1TskJTiGIdoLc7UXXulIwgJI0Zyeq3+anOXm9d7GtnmCSyZuoOBiCISwfqvYck0KTMvT3oimIDetbkSnhmhC0zH69TicWyD/ZPkCRGjci4PGkA7dnusSC5+SWIoYd9+uu6DP0w6D0o+8N9ceOvpuMgjnEGDX0GPJUSQXPiwZ+Zw3aMhjeSsUvVKt9g4EqFsPLqJqAdmXNhb0bZuoy7MgHhr1Uo1AX7tCeju8tmS9svMc/aoXsZpUdSYwvMN8890dvH6l3IzGIdM53Oj/SwQNvIeC7ag7jZ6GXOj/bSvFCbbARNaFQGp1d1XdKYGWepR1vRcuR59yJSIqwBiqjOG4vFBfv9y0zAlPNburOo+Bv+M+RIo/37DlplAFi9+rlEWBNnRdGPi0eKsDvc4GnCNreTQbYOba/wKrEGSanjSKZNyqTwVV6Vtk+ss+wfV8p50U+WZhZXmIHmK75ZlLpcAo+eyxXpZGtmwVmS6ZDVZ51VgZTsu9Rlr5ze99IyWCn0/8tIggZvA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HE1PR0802MB2426.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(6029001)(4636009)(366004)(8676002)(6666004)(44832011)(508600001)(6512007)(6486002)(4326008)(5660300002)(6506007)(52116002)(966005)(36756003)(86362001)(83380400001)(316002)(2616005)(1076003)(186003)(38100700002)(7416002)(66946007)(66556008)(66476007)(2906002)(8936002)(54906003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?L5Pdhcgq+4xSfNOftGzGrjC8Hs8RvCUu/9JLam+UBQLXvS17peNc564XDjko?=
 =?us-ascii?Q?CIyU0Nr8H6KdNdv8tx8A3q20ElGFxEh2h6oSYnUzYYqUJ9fXRHpe1ioNKZeC?=
 =?us-ascii?Q?54XWS2tjV1okg0RVYdabwTT9G5ndgFNO7m84GvQBK1RxMWc+jtRko7TKS3qw?=
 =?us-ascii?Q?ut/YxmSgjhkRoLMJWJx/TH/hiSKYENd+E/mmvveqhdyWiGYL0JP6lpeWfgSA?=
 =?us-ascii?Q?KUvoMiDTHN6cE3cYtrXwR69eDpRcTHvYSvemdoTtS1wWIg3bFjWX5Ut3fc8g?=
 =?us-ascii?Q?zvUH+8yb4pxCYoG6zhJJ/VPMvqzxvJ/yULEqMA98ld9M5H9Yt0vnSncaD6rM?=
 =?us-ascii?Q?jdnAhR+JX45n/QFW7X9R4H31FWWyFyfJ/HN5rzkwRV9o3Vgv6QHhsYvOHI0+?=
 =?us-ascii?Q?kECmy8X1FJSmkGKuAeQoMoICmopAW0uAEnthP1v53n3cu+MYL/ScxhBTmioJ?=
 =?us-ascii?Q?U/rqyNclR/25oXFDq5ZmgC3bQPRTibjm+blJWsxZkrO6pIVd/jFtjZ79cQ7I?=
 =?us-ascii?Q?z/U77RcC0TdjQ2T/MGsfmxONecxqQ9c+dFBivvFekd9zloo1P44pXyjDGrx0?=
 =?us-ascii?Q?2niKSFVjuoDRnC0OtC+KrLxlJfuzEGY43906UQDhWZkQxksH4KIk0HMowGxG?=
 =?us-ascii?Q?nYLJULzIKQZxH/4aRHcnWyB+x8v9HofAK+CSB7wGMNmadpfG7OjNOrnv8/s0?=
 =?us-ascii?Q?U8XWpnNL9IAyzHoSxwSczZpDf4+ExbFEH/mXpQEYNopAIWYD/aZR0J6mt35x?=
 =?us-ascii?Q?ISqE4l6FV5rPOPzoxUR59l/M0TbHV9icU81fOa5h9dHfPBFuJ81vuOwN3g4s?=
 =?us-ascii?Q?SUa9abjBQnGAwU8fj6QwKjB7AxR4K1snj8qvm3+ZnvDNf7qlyCoqakQemWur?=
 =?us-ascii?Q?fPKfj251+I8anB149zDXblQGEr/06c7Dqcq9QdornXaMixOR/EhlY3U0iptp?=
 =?us-ascii?Q?zRUb23meT+uFisjBhV1FazAzKztHRvplKrcl0oH9TUEj9mTM0YrLqw2EnrOP?=
 =?us-ascii?Q?HT5Pbua69WUiUuDoaFRQOKuT99WBoXd018Gpp/jpyMMJBOTgoi4lVFMTwW19?=
 =?us-ascii?Q?DFBc4GFRfNlprjWbGWRYAkajKfFpKsfNjNntlaz7cuUXq3oZoiaJzVLslZIF?=
 =?us-ascii?Q?OBXwwz/4WQ272uGHe7cgfgeWTRejKLanHEZgGkHxjjy23FN9jGXiVqbBbVGs?=
 =?us-ascii?Q?qBKnntT8QTnhxtKaAnnpE1Ou9pdapMcRoDBXe2Ab9erK71ilp8y7AuXdaFDi?=
 =?us-ascii?Q?506LQBmQxvc4qtnVppyZfpf5yBDYXNHl28MhRSst2wdK0AgyrTCpSNc3neyu?=
 =?us-ascii?Q?j/URcw2hAMdeU3oUTnD50bX5+86Z1IMCAg6aQ8LEM/5Si2y33L0hDz5mw0gM?=
 =?us-ascii?Q?dDY8kPg37qK45aAq0qqLh2cENhX1L+6Nc7o+Hb4ywjc+hRpXzN2sQT5Ead/X?=
 =?us-ascii?Q?VB1/fCooaVryTEQwMI1gV7KzgLr+zk0GTiExPlViDl/59bJyTzY7PJT6Y868?=
 =?us-ascii?Q?1NjCZ9O1uh0Bjny6ebFSPFVZpYK6qosHZb+K5EXoS1vB+ZK+yPRtj+HAzm3z?=
 =?us-ascii?Q?dB9PZjQioG23ALPp6dVuGMEX4y0ZiN35nd3WJ9O6CTR0MR6ORK+s3XEeb4oB?=
 =?us-ascii?Q?yk+8kwlC8CMK60OJq9J4I2szJM+ewCi8SzxW4CUOKj4rTTFyVFknIDqQRxRs?=
 =?us-ascii?Q?7+iWFQOrl5MzEOxEXR3yCQblLu3yzjl3mjIPGXjxKF2OpGhC30hjlcQuWRJY?=
 =?us-ascii?Q?O2v251mF+N42wmrFzzr5C0noxMZ+5os=3D?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: dc0a57c1-0f0c-4d67-4b05-08d9eba958e7
X-MS-Exchange-CrossTenant-AuthSource: HE1PR0802MB2426.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2022 08:51:22.5376 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yu0B7mcBgwh5vKFk10BPKNZq3RsZ7bCAWwIM75FTDfgxWE2QTAcZULPLf2cVYJh693fQKFd8vgpvYBxc4+q4pNBwPXv50peGA91TGy0F6qE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0802MB2488
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
Cc: David Airlie <airlied@linux.ie>, Sascha Hauer <s.hauer@pengutronix.de>,
 Alex Bee <knaerzche@gmail.com>,
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Michael Riesch <michael.riesch@wolfvision.net>,
 Peter Geis <pgwipeout@gmail.com>, Liang Chen <cl@rock-chips.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi all,

This series seems to be abandoned so I would like to pick it up in order to
bring the GPU support for the RK356x mainline.

The series (in conjunction with the VOP2/HDMI TX patches v4 [0]) has been tested
successfully on a RK3568 EVB1 with weston and glmark2-es2-wayland.

It should be noted that on the RK3568 EVB1 the supply of the GPU power domain needs
to be set to "always-on" in the device tree. There is an ongoing discussion to
provide a clean solution [1], in the meantime one has to apply a hack.

Looking forward to your comments!

Best regards,
Michael

v5:
- address Rob's comments, describe clocks in SoC specific region
- move gpu_opp_table so that nodes without a reg are sorted alphabetically
- add GPU support to the RK3568 EVB1

v4: see https://lore.kernel.org/linux-rockchip/20211126151729.1026566-1-knaerzche@gmail.com/
v3: see https://lore.kernel.org/linux-rockchip/20210805025948.10900-1-ezequiel@collabora.com/
v2: see https://lore.kernel.org/linux-rockchip/20210730164515.83044-1-ezequiel@collabora.com/

[0] https://lore.kernel.org/linux-rockchip/20220126145549.617165-1-s.hauer@pengutronix.de/
[1] https://lore.kernel.org/linux-rockchip/20211217130919.3035788-1-s.hauer@pengutronix.de/

Alex Bee (2):
  dt-bindings: gpu: mali-bifrost: describe clocks for the rk356x gpu
  arm64: dts: rockchip: add cooling map and trip points for gpu to
    rk356x

Ezequiel Garcia (2):
  arm64: dts: rockchip: add gpu node to rk356x
  arm64: dts: rockchip: enable the gpu on quartz64-a

Michael Riesch (1):
  arm64: dts: rockchip: enable the gpu on rk3568-evb1-v10

 .../bindings/gpu/arm,mali-bifrost.yaml        | 15 ++++
 .../boot/dts/rockchip/rk3566-quartz64-a.dts   |  5 ++
 .../boot/dts/rockchip/rk3568-evb1-v10.dts     | 11 +++
 arch/arm64/boot/dts/rockchip/rk356x.dtsi      | 76 +++++++++++++++++++
 4 files changed, 107 insertions(+)

-- 
2.30.2

