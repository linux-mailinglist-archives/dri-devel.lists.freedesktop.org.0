Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wLIoMpaGrWnZ3wEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 08 Mar 2026 15:24:22 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5D5C230A37
	for <lists+dri-devel@lfdr.de>; Sun, 08 Mar 2026 15:24:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D8FD10E464;
	Sun,  8 Mar 2026 14:14:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="AGJXakQJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazon11011058.outbound.protection.outlook.com [52.101.65.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7567010E12D;
 Sun,  8 Mar 2026 11:43:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cFXPMVSsRbSxNuIWDW6upJae0FKHfvcTps9TJ8YdrZelitzmedwnMowGZIKxsiJQbEurjzNeD+vcHp1eP16IK5TkBL0Vl0uB3cqBEms52Dt3ZV9ZbUKaS3TFMFKVY+u+c1qPVml1z7Ldez8hpn3a+vNz4MR74+KVoHCYJrfJg3fT15pmO3RYo4BOzpxU2gSv9rgztpbxefCB1t8/EnpSovUsbeztJwGjPWTPkT/B187kcO+llcKc53GDqTZMFSbVJSlvG+QO3GroFrkTzFbSpGt33QFrl/+OUULHV7gye16q+K9RmLXi0haX2CUxG5Y8C8nnxTUWbwDYqFSK0OQ8NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iCLSECPq+YAkPiWrC+WUpzW5VujTjlFTQFTWTVNI9i0=;
 b=NaOb0OB0ykwXU9aeuT4HUDkwYlrq2EIzdjIj88K+A2oIk7qH6k0vrkcwOEmsQv0mv6lChWpf1dfrgHvFCUqwQy4lA2yaJN0cEn1BsSkMalZ8FnVV22gAzwrSVelzpugRqEgddgKuV6Ph/9SHPs70CsypwhEMXZ/keb5KY6NEJnLC198Fc1NJfo4FhVq7NpjNmbX+qUKnHuAUZgDTaw7hI+V8kdb1HfCpe4MxlyrcLfHdD4ncZnoklT/Pup3pX2JoM58tofraX3ahhGq6oNrWg0om+xjDewVgZUxgGOAQFjHUqoGRzqkJpt7yD1M+shbyuzxlUYMRAcwiQFS4wlcOIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iCLSECPq+YAkPiWrC+WUpzW5VujTjlFTQFTWTVNI9i0=;
 b=AGJXakQJ17lnQGOQgDTr/18VrBBAWuVi2/LVKXpgLfdune4k/L2gkHS4JQ9/HXC2/SPk6c4X2vZakQGN6ZKzUnLenN3JDl7/VYZubXix0YfKD/UiAEt17WwYRH2jLpGJ4TSyTj7Jeh7pAZIjNeza5cvZZlvoH/rFocxM3HwEpFVLoXFzSAuD0HwQdkbJJydvkM8h4nR4pTM9aEWRcLElOhs16D8LxaCMND1sgQ0M6e4tMOKtujNpKqXh8z4lM4iX7pUXQbHe10hIKj6a/sEh/JyzUPTMhhNerpXGHUeKFA0X0P83cquiDQuwT5ZQasLLC2e5QqoJaa15U+zbiB1UWQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8585.eurprd04.prod.outlook.com (2603:10a6:20b:438::13)
 by AM9PR04MB8211.eurprd04.prod.outlook.com (2603:10a6:20b:3ea::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.22; Sun, 8 Mar
 2026 11:43:39 +0000
Received: from AM9PR04MB8585.eurprd04.prod.outlook.com
 ([fe80::f010:fca8:7ef:62f4]) by AM9PR04MB8585.eurprd04.prod.outlook.com
 ([fe80::f010:fca8:7ef:62f4%4]) with mapi id 15.20.9678.023; Sun, 8 Mar 2026
 11:43:39 +0000
From: vladimir.oltean@nxp.com
To: linux-phy@lists.infradead.org
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-can@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
 linux-usb@vger.kernel.org, netdev@vger.kernel.org,
 spacemit@lists.linux.dev, UNGLinuxDriver@microchip.com,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Shawn Lin <shawn.lin@rock-chips.com>
Subject: [PATCH v2 phy-next 22/24] phy: include PHY provider header (2/2)
Date: Sun,  8 Mar 2026 13:40:07 +0200
Message-ID: <20260308114009.2546587-23-vladimir.oltean@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260308114009.2546587-1-vladimir.oltean@nxp.com>
References: <20260308114009.2546587-1-vladimir.oltean@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: WA2P291CA0009.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::6) To AM9PR04MB8585.eurprd04.prod.outlook.com
 (2603:10a6:20b:438::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8585:EE_|AM9PR04MB8211:EE_
X-MS-Office365-Filtering-Correlation-Id: cbd3578d-2d9d-4c28-3681-08de7d07f0ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|10070799003|19092799006|7416014|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: M1Np2q5gFg+3xlJ9hwdeeT+M07tfBKaNydYStssnysBMURqzSs3+RWVZ5cEDrftfSMz4B9mpEAXfMuQ8acqGrMsPGDYfn6P8Qxn/7mIg+PqpRv+JnmY+JxXtgBkp3CvOgIYg8ups3IwpyB8H/dSCkpz1iiAeyJ/kj+szz/qTezUSwrSdO9ycSZyCy+uQCS2aWuRBYAs3ZeexrsigvEJX9D6Ir/t5t2fhDqPklLalIJu44pv5pnHY0IaUdinX8JukqKilS90gP2UF9QOcC3CMarq2w9ThOOWERXx4OLyo1+z6JRYeBxUd8rA061vLMbirxfp0KLdKC8PAYeh1LDvQPdoiXtbtRvNiUYPRjR5CpdsUvLzM/wvGWhZoWOC6+vqQIxjFPkrIstrRUFHeWswWDqhnBxY59UQOjH1/TW22GiwAUYFWQBEZro22gN++mm6LVx5YFPv6zydCTBwmuIiod4XCYZ4l7Qct+CzEPBxr8pGZNDm2TORScMJMdR7eUurT1t3Yjfnd4KuEbUqfeS0l5nJU9e0KnXuiljfoeZ561lHrMlZ6DL9iX4grnZfP4bZTqPnk6uJg7sU+mNhjkdXo0mjurizEFFoft6oTBcxF+LYl/WhNWUSDJ6WJmJteixQm19uCvSgxGk7dE8ZzmUiOvy/b4qWVInAxeioX8Na8a4WB7Lmdh5INY8Fl6dhWjC/2kCBPSo6bcJf1RXNyEeM9dqN80YLVVgzfBsDXnKPV4KQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR04MB8585.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(10070799003)(19092799006)(7416014)(376014)(1800799024);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vKdmiJPztuW8u8YXlQfKxRNc+5GQ9/VVd7TGKtqpKVKv+go5l3ovcaQwk6ub?=
 =?us-ascii?Q?aN/OJ3H+RxnByH4L8QYjWnrArQDK4+CprH11KZgh+29CpRebVL3O0o1L2H/3?=
 =?us-ascii?Q?lPSk1C9zj6sOiaegYD0rk/O46WLg+AO2ySpcD7Aj0AZUEqZ/vKorhrQLPJ/u?=
 =?us-ascii?Q?qXsqMCxPg93IkI+DmnbtHnagpv5UBrtx1uvJP3XbQ9xfw0bIiOOjPOKulinP?=
 =?us-ascii?Q?z1nSd1yCZMharSA74eECHOdbysoiEd1Q67iYNTk0NGca1U/Ux1TeifI0sYHM?=
 =?us-ascii?Q?cVqUjXtt1uzEGZyC3BvRT+gZLGIMFJe9nAqvwfpQql5N/vzvTBnb+l6uzleB?=
 =?us-ascii?Q?ydjOvZHYmx0KZSGIyxWVY+mlkDmHh7Arf6sjGdFb7ian/GHreAXt3dgJhf2b?=
 =?us-ascii?Q?cQhbrSZjg15F/aEDcxKEPxN3aLHhJwAUDPnk/l3a4l2ZOObVWV2Pw/CilrC5?=
 =?us-ascii?Q?yy9sO0zYwjTczt7/SleWYL5sf/Fz9CZMTUbLSxjBUJLBhrqYSUh79Fr4NDzw?=
 =?us-ascii?Q?DIo1k6yEB5Cj3wbRFbJvBWSVJ30Te2O8u6JEgJ55WQMenDDu+4NS2PU+bdlX?=
 =?us-ascii?Q?w6qJXjONmXwWIVUDUYVkuv9Zz64+F/4SFPMfuLPgQuxUeMXIc4kAp0ljeFzA?=
 =?us-ascii?Q?f+JiAtfNSeDQ1jUbQx3BRnZGTBm5pRrrAWiSTnIf/IPkrSIa+NDV10fOdxgx?=
 =?us-ascii?Q?RsHowWnFwTHqdd09zWvHgcKmiHTeBJQu5G0q3Gq6e2qJ4pUCloBSpdpZV/ap?=
 =?us-ascii?Q?S11h1btuSSteh+eNCpT6I/IdyU4SERocqNX6rk1eAuQW75Q7njxBtHg54eKo?=
 =?us-ascii?Q?AkjApwsRglGjQkpA/3uvaydARnxtZSZomRyZ6tozMlF6HvgqJDtWqv4v6JcR?=
 =?us-ascii?Q?BuUVjdzMzN6/E1vqxValHqj2EUBIlKTyTJnmuLpxJHzBN4sp8qG8fJjffHMV?=
 =?us-ascii?Q?ulBzQTeGq20mq2Q9nHb77kis8ZdapR+rARoPNSZt8zq57i6uEQr02D2l4FHH?=
 =?us-ascii?Q?PZkahRGRatAU0Kq1la6NwIMTocu5uby9bofxIyhu4zE6xLtQU8/ISlNm763q?=
 =?us-ascii?Q?Hn3DCrx4fLzr4LYr+NZlfiUYqsMJ4PpEICtJCQyQ0eCPKJkvxxYAzWh0+FjJ?=
 =?us-ascii?Q?05CG0t72cTtg2ki3//mJDSvqbzeJmT9wdh1nG6dHIZP8WrXTb+AVLsUYiR3D?=
 =?us-ascii?Q?3Zrem9O4JYIlEKopfDxEMmSC3Spy+GV8x775urhIm3UarPAQO1p/OzRQSv+e?=
 =?us-ascii?Q?qStbUH3b46JuAm/qzkHBpCT88dp7rcPtIH+BgDaJ7Z1poFnord3lsL8q98me?=
 =?us-ascii?Q?2pMK91DDh9mso63C6PWJM5hJlkZu/N6/jfKhPkwToqcV8477OFL1Wo9hmfzL?=
 =?us-ascii?Q?Kole9HzJaWbLviosoEPb0zHQt8pL26rx92WXXe43FBRPusMT4pSBuvR3+XsX?=
 =?us-ascii?Q?2AHz5bHK9lAPwBAWP/lFWEaxm4JYzjLCVLAq0GK6aceoFLXDLrWaDAz60mya?=
 =?us-ascii?Q?FEZrWdxDycCXK2wUF01DbXJHIPNykfbowKpcqhwLkzBPrgj3K2SA+MGYNebb?=
 =?us-ascii?Q?uFNmQZecEFykpXN2fk8EiDJr+0qceCbDhL59ehCb4pWwbihkv/jZyvwQHU0M?=
 =?us-ascii?Q?xaHMyEpF5ZdxXJXEapQBkctJWh8mZCspFTMj98K4/cMCURI7QH01kftbF5ZM?=
 =?us-ascii?Q?/MW1LsqDs8s4J/8pVh2D6RLULGQx9KiBQXJQnGEQ09WkEMzNIyC+BjvvAl1C?=
 =?us-ascii?Q?DhtIF/Uo6pJ4pFwJXFuHLOf63ahKMpJUBg0nxbhsPlGtXzMQ4hBb5vtl8pMG?=
X-MS-Exchange-AntiSpam-MessageData-1: JXnuEiEyfHJk1HXF7dqDKziXlWp4y1kZz0E=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cbd3578d-2d9d-4c28-3681-08de7d07f0ac
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8585.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2026 11:43:39.2016 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: io4iZPJ0UbCRtokwBtIQf4rkVqfhBhN68LG3StQ0L1L9WSpeP7fENt57iQV3ePUW2WWjPmudh3gRocBrgfbLsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8211
X-Mailman-Approved-At: Sun, 08 Mar 2026 14:13:21 +0000
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
X-Rspamd-Queue-Id: E5D5C230A37
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.978];
	FROM_NEQ_ENVFROM(0.00)[vladimir.oltean@nxp.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[nxp.com:+];
	TAGGED_RCPT(0.00)[dri-devel];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,nxp.com:dkim,nxp.com:email,nxp.com:mid,rock-chips.com:email,st.com:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

The majority of PHY drivers are PHY providers (obviously).

Some are chained PHY provider+consumer (phy-qcom-m31-eusb2.c,
phy-exynos5-usbdrd.c).

Others include <linux/phy/phy.h> because they call consumer functions
such as phy_pm_runtime_get() - phy-mapphone-mdm6600.c. See commit
2ad2af081622 ("phy: mapphone-mdm6600: Improve phy related runtime PM
calls") for the story behind that. My understanding is it's a pragmatic
shortcut, but it doesn't bother much.

Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> #phy/qualcomm
Acked-by: Shawn Lin <shawn.lin@rock-chips.com>
---
v1->v2: split in two parts to pass through linux-phy mailing list
moderation. The split is at letter 'q' (Qualcomm)
---
 drivers/phy/qualcomm/phy-ath79-usb.c               | 3 ++-
 drivers/phy/qualcomm/phy-qcom-apq8064-sata.c       | 3 ++-
 drivers/phy/qualcomm/phy-qcom-edp.c                | 3 ++-
 drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c     | 3 ++-
 drivers/phy/qualcomm/phy-qcom-ipq4019-usb.c        | 3 ++-
 drivers/phy/qualcomm/phy-qcom-ipq806x-sata.c       | 3 ++-
 drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c        | 3 ++-
 drivers/phy/qualcomm/phy-qcom-m31-eusb2.c          | 2 ++
 drivers/phy/qualcomm/phy-qcom-m31.c                | 3 ++-
 drivers/phy/qualcomm/phy-qcom-pcie2.c              | 3 ++-
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c          | 3 ++-
 drivers/phy/qualcomm/phy-qcom-qmp-pcie-msm8996.c   | 3 ++-
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c           | 3 ++-
 drivers/phy/qualcomm/phy-qcom-qmp-ufs.c            | 3 ++-
 drivers/phy/qualcomm/phy-qcom-qmp-usb-legacy.c     | 3 ++-
 drivers/phy/qualcomm/phy-qcom-qmp-usb.c            | 3 ++-
 drivers/phy/qualcomm/phy-qcom-qmp-usbc.c           | 3 ++-
 drivers/phy/qualcomm/phy-qcom-qusb2.c              | 4 ++--
 drivers/phy/qualcomm/phy-qcom-sgmii-eth.c          | 3 ++-
 drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c      | 3 ++-
 drivers/phy/qualcomm/phy-qcom-uniphy-pcie-28lp.c   | 3 ++-
 drivers/phy/qualcomm/phy-qcom-usb-hs-28nm.c        | 3 ++-
 drivers/phy/qualcomm/phy-qcom-usb-hs.c             | 3 ++-
 drivers/phy/qualcomm/phy-qcom-usb-hsic.c           | 3 ++-
 drivers/phy/qualcomm/phy-qcom-usb-ss.c             | 3 ++-
 drivers/phy/ralink/phy-mt7621-pci.c                | 3 ++-
 drivers/phy/ralink/phy-ralink-usb.c                | 3 ++-
 drivers/phy/realtek/phy-rtk-usb2.c                 | 3 ++-
 drivers/phy/realtek/phy-rtk-usb3.c                 | 3 ++-
 drivers/phy/renesas/phy-rcar-gen2.c                | 3 ++-
 drivers/phy/renesas/phy-rcar-gen3-pcie.c           | 3 ++-
 drivers/phy/renesas/phy-rcar-gen3-usb2.c           | 3 ++-
 drivers/phy/renesas/phy-rcar-gen3-usb3.c           | 3 ++-
 drivers/phy/renesas/phy-rzg3e-usb3.c               | 3 ++-
 drivers/phy/renesas/r8a779f0-ether-serdes.c        | 3 ++-
 drivers/phy/rockchip/phy-rockchip-dp.c             | 3 ++-
 drivers/phy/rockchip/phy-rockchip-dphy-rx0.c       | 3 ++-
 drivers/phy/rockchip/phy-rockchip-emmc.c           | 3 ++-
 drivers/phy/rockchip/phy-rockchip-inno-csidphy.c   | 3 ++-
 drivers/phy/rockchip/phy-rockchip-inno-dsidphy.c   | 4 ++--
 drivers/phy/rockchip/phy-rockchip-inno-hdmi.c      | 2 ++
 drivers/phy/rockchip/phy-rockchip-inno-usb2.c      | 3 ++-
 drivers/phy/rockchip/phy-rockchip-naneng-combphy.c | 3 ++-
 drivers/phy/rockchip/phy-rockchip-pcie.c           | 2 +-
 drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c  | 3 ++-
 drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c  | 2 ++
 drivers/phy/rockchip/phy-rockchip-snps-pcie3.c     | 3 ++-
 drivers/phy/rockchip/phy-rockchip-typec.c          | 4 ++--
 drivers/phy/rockchip/phy-rockchip-usb.c            | 3 ++-
 drivers/phy/rockchip/phy-rockchip-usbdp.c          | 2 ++
 drivers/phy/samsung/phy-exynos-dp-video.c          | 3 ++-
 drivers/phy/samsung/phy-exynos-mipi-video.c        | 3 ++-
 drivers/phy/samsung/phy-exynos-pcie.c              | 3 ++-
 drivers/phy/samsung/phy-exynos4210-usb2.c          | 3 ++-
 drivers/phy/samsung/phy-exynos4x12-usb2.c          | 3 ++-
 drivers/phy/samsung/phy-exynos5-usbdrd.c           | 2 ++
 drivers/phy/samsung/phy-exynos5250-sata.c          | 3 ++-
 drivers/phy/samsung/phy-exynos5250-usb2.c          | 3 ++-
 drivers/phy/samsung/phy-s5pv210-usb2.c             | 3 ++-
 drivers/phy/samsung/phy-samsung-ufs.c              | 2 +-
 drivers/phy/samsung/phy-samsung-ufs.h              | 3 ++-
 drivers/phy/samsung/phy-samsung-usb2.c             | 2 ++
 drivers/phy/samsung/phy-samsung-usb2.h             | 3 ++-
 drivers/phy/socionext/phy-uniphier-ahci.c          | 3 ++-
 drivers/phy/socionext/phy-uniphier-pcie.c          | 3 ++-
 drivers/phy/socionext/phy-uniphier-usb2.c          | 3 ++-
 drivers/phy/socionext/phy-uniphier-usb3hs.c        | 3 ++-
 drivers/phy/socionext/phy-uniphier-usb3ss.c        | 3 ++-
 drivers/phy/sophgo/phy-cv1800-usb2.c               | 3 ++-
 drivers/phy/spacemit/phy-k1-pcie.c                 | 4 ++--
 drivers/phy/spacemit/phy-k1-usb2.c                 | 3 ++-
 drivers/phy/st/phy-miphy28lp.c                     | 4 ++--
 drivers/phy/st/phy-spear1310-miphy.c               | 3 ++-
 drivers/phy/st/phy-spear1340-miphy.c               | 3 ++-
 drivers/phy/st/phy-stih407-usb.c                   | 3 ++-
 drivers/phy/st/phy-stm32-combophy.c                | 3 ++-
 drivers/phy/st/phy-stm32-usbphyc.c                 | 2 ++
 drivers/phy/starfive/phy-jh7110-dphy-rx.c          | 3 ++-
 drivers/phy/starfive/phy-jh7110-dphy-tx.c          | 3 ++-
 drivers/phy/starfive/phy-jh7110-pcie.c             | 3 ++-
 drivers/phy/starfive/phy-jh7110-usb.c              | 3 ++-
 drivers/phy/sunplus/phy-sunplus-usb2.c             | 3 ++-
 drivers/phy/tegra/phy-tegra194-p2u.c               | 3 ++-
 drivers/phy/tegra/xusb-tegra124.c                  | 2 +-
 drivers/phy/tegra/xusb-tegra186.c                  | 2 +-
 drivers/phy/tegra/xusb-tegra210.c                  | 2 +-
 drivers/phy/tegra/xusb.c                           | 2 +-
 drivers/phy/ti/phy-am654-serdes.c                  | 3 ++-
 drivers/phy/ti/phy-da8xx-usb.c                     | 3 ++-
 drivers/phy/ti/phy-dm816x-usb.c                    | 3 ++-
 drivers/phy/ti/phy-gmii-sel.c                      | 3 ++-
 drivers/phy/ti/phy-omap-usb2.c                     | 3 ++-
 drivers/phy/ti/phy-ti-pipe3.c                      | 3 ++-
 drivers/phy/ti/phy-twl4030-usb.c                   | 3 ++-
 drivers/phy/xilinx/phy-zynqmp.c                    | 4 ++--
 include/linux/phy/phy-sun4i-usb.h                  | 2 +-
 include/linux/phy/ulpi_phy.h                       | 2 +-
 97 files changed, 186 insertions(+), 96 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-ath79-usb.c b/drivers/phy/qualcomm/phy-ath79-usb.c
index f8d0199c6e78..2f07241be600 100644
--- a/drivers/phy/qualcomm/phy-ath79-usb.c
+++ b/drivers/phy/qualcomm/phy-ath79-usb.c
@@ -8,9 +8,10 @@
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
-#include <linux/phy/phy.h>
 #include <linux/reset.h>
 
+#include "../phy-provider.h"
+
 struct ath79_usb_phy {
 	struct reset_control *reset;
 	/* The suspend override logic is inverted, hence the no prefix
diff --git a/drivers/phy/qualcomm/phy-qcom-apq8064-sata.c b/drivers/phy/qualcomm/phy-qcom-apq8064-sata.c
index cae290a6e19f..dd73ecbb6c1e 100644
--- a/drivers/phy/qualcomm/phy-qcom-apq8064-sata.c
+++ b/drivers/phy/qualcomm/phy-qcom-apq8064-sata.c
@@ -13,7 +13,8 @@
 #include <linux/clk.h>
 #include <linux/slab.h>
 #include <linux/platform_device.h>
-#include <linux/phy/phy.h>
+
+#include "../phy-provider.h"
 
 /* PHY registers */
 #define UNIPHY_PLL_REFCLK_CFG		0x000
diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
index 7372de05a0b8..faddba0f20c7 100644
--- a/drivers/phy/qualcomm/phy-qcom-edp.c
+++ b/drivers/phy/qualcomm/phy-qcom-edp.c
@@ -13,7 +13,6 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/phy/phy.h>
 #include <linux/phy/phy-dp.h>
 #include <linux/platform_device.h>
 #include <linux/regulator/consumer.h>
@@ -22,6 +21,8 @@
 
 #include <dt-bindings/phy/phy.h>
 
+#include "../phy-provider.h"
+
 #include "phy-qcom-qmp-dp-phy.h"
 #include "phy-qcom-qmp-qserdes-com-v4.h"
 #include "phy-qcom-qmp-qserdes-com-v6.h"
diff --git a/drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c b/drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c
index efeec4709a15..5783bdabc287 100644
--- a/drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c
+++ b/drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c
@@ -8,7 +8,8 @@
 #include <linux/regulator/consumer.h>
 #include <linux/regmap.h>
 #include <linux/of.h>
-#include <linux/phy/phy.h>
+
+#include "../phy-provider.h"
 
 /* eUSB2 status registers */
 #define EUSB2_RPTR_STATUS		0x08
diff --git a/drivers/phy/qualcomm/phy-qcom-ipq4019-usb.c b/drivers/phy/qualcomm/phy-qcom-ipq4019-usb.c
index da6f290af722..f1c1c2969e37 100644
--- a/drivers/phy/qualcomm/phy-qcom-ipq4019-usb.c
+++ b/drivers/phy/qualcomm/phy-qcom-ipq4019-usb.c
@@ -14,10 +14,11 @@
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/of.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/reset.h>
 
+#include "../phy-provider.h"
+
 struct ipq4019_usb_phy {
 	struct device		*dev;
 	struct phy		*phy;
diff --git a/drivers/phy/qualcomm/phy-qcom-ipq806x-sata.c b/drivers/phy/qualcomm/phy-qcom-ipq806x-sata.c
index f5eb0bdac418..1a9d4dae6a33 100644
--- a/drivers/phy/qualcomm/phy-qcom-ipq806x-sata.c
+++ b/drivers/phy/qualcomm/phy-qcom-ipq806x-sata.c
@@ -13,7 +13,8 @@
 #include <linux/clk.h>
 #include <linux/slab.h>
 #include <linux/platform_device.h>
-#include <linux/phy/phy.h>
+
+#include "phy-provider.h"
 
 struct qcom_ipq806x_sata_phy {
 	void __iomem *mmio;
diff --git a/drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c b/drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c
index f22c0000479f..54144f0547f0 100644
--- a/drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c
+++ b/drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c
@@ -5,13 +5,14 @@
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/delay.h>
 #include <linux/regmap.h>
 #include <linux/mfd/syscon.h>
 #include <linux/bitfield.h>
 
+#include "../phy-provider.h"
+
 /* USB QSCRATCH Hardware registers */
 #define QSCRATCH_GENERAL_CFG		(0x08)
 #define HSUSB_PHY_CTRL_REG		(0x10)
diff --git a/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c b/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c
index 68f1ba8fec4a..9e3a911023cd 100644
--- a/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c
+++ b/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c
@@ -18,6 +18,8 @@
 
 #include <linux/regulator/consumer.h>
 
+#include "../phy-provider.h"
+
 #define USB_PHY_UTMI_CTRL0		(0x3c)
 #define SLEEPM				BIT(0)
 
diff --git a/drivers/phy/qualcomm/phy-qcom-m31.c b/drivers/phy/qualcomm/phy-qcom-m31.c
index 168ea980fda0..1a63a5807d37 100644
--- a/drivers/phy/qualcomm/phy-qcom-m31.c
+++ b/drivers/phy/qualcomm/phy-qcom-m31.c
@@ -10,11 +10,12 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/reset.h>
 #include <linux/slab.h>
 
+#include "../phy-provider.h"
+
 #define USB2PHY_PORT_UTMI_CTRL1		0x40
 
 #define USB2PHY_PORT_UTMI_CTRL2		0x44
diff --git a/drivers/phy/qualcomm/phy-qcom-pcie2.c b/drivers/phy/qualcomm/phy-qcom-pcie2.c
index 11a2bb958681..4c74d8e7722d 100644
--- a/drivers/phy/qualcomm/phy-qcom-pcie2.c
+++ b/drivers/phy/qualcomm/phy-qcom-pcie2.c
@@ -8,11 +8,12 @@
 #include <linux/clk.h>
 #include <linux/iopoll.h>
 #include <linux/module.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/reset.h>
 #include <linux/slab.h>
 
+#include "../phy-provider.h"
+
 #include <dt-bindings/phy/phy.h>
 
 #define PCIE20_PARF_PHY_STTS         0x3c
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index b9ea7d058e93..04c54c229f08 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -14,7 +14,6 @@
 #include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/of_graph.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/regulator/consumer.h>
@@ -28,6 +27,8 @@
 
 #include <dt-bindings/phy/phy-qcom-qmp.h>
 
+#include "../phy-provider.h"
+
 #include "phy-qcom-qmp-common.h"
 
 #include "phy-qcom-qmp.h"
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie-msm8996.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie-msm8996.c
index a7c65cfe31df..df38d5b6d5be 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie-msm8996.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie-msm8996.c
@@ -13,12 +13,13 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/regulator/consumer.h>
 #include <linux/reset.h>
 #include <linux/slab.h>
 
+#include "../phy-provider.h"
+
 #include "phy-qcom-qmp-common.h"
 
 #include "phy-qcom-qmp.h"
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
index fed2fc9bb311..06680151360e 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
@@ -15,7 +15,6 @@
 #include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/phy/pcie.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
@@ -24,6 +23,8 @@
 
 #include <dt-bindings/phy/phy-qcom-qmp.h>
 
+#include "../phy-provider.h"
+
 #include "phy-qcom-qmp-common.h"
 
 #include "phy-qcom-qmp.h"
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
index df138a5442eb..75cd5b10fdb2 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
@@ -13,7 +13,6 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/regulator/consumer.h>
 #include <linux/reset.h>
@@ -21,6 +20,8 @@
 
 #include <ufs/unipro.h>
 
+#include "../phy-provider.h"
+
 #include "phy-qcom-qmp-common.h"
 
 #include "phy-qcom-qmp.h"
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usb-legacy.c b/drivers/phy/qualcomm/phy-qcom-qmp-usb-legacy.c
index 2bd5862c5ba8..a682b30db03e 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usb-legacy.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usb-legacy.c
@@ -14,13 +14,14 @@
 #include <linux/of.h>
 #include <linux/of_device.h>
 #include <linux/of_address.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/regulator/consumer.h>
 #include <linux/reset.h>
 #include <linux/slab.h>
 
+#include "../phy-provider.h"
+
 #include "phy-qcom-qmp.h"
 #include "phy-qcom-qmp-pcs-misc-v3.h"
 #include "phy-qcom-qmp-pcs-usb-v4.h"
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c b/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
index d88b8a415e85..3db0a5282dbf 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
@@ -13,13 +13,14 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/regulator/consumer.h>
 #include <linux/reset.h>
 #include <linux/slab.h>
 
+#include "../phy-provider.h"
+
 #include "phy-qcom-qmp-common.h"
 
 #include "phy-qcom-qmp.h"
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
index f62e1f6ecc07..b77007f8fee3 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
@@ -14,7 +14,6 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
@@ -25,6 +24,8 @@
 #include <linux/usb/typec_mux.h>
 #include <dt-bindings/phy/phy-qcom-qmp.h>
 
+#include "../phy-provider.h"
+
 #include "phy-qcom-qmp-common.h"
 
 #include "phy-qcom-qmp.h"
diff --git a/drivers/phy/qualcomm/phy-qcom-qusb2.c b/drivers/phy/qualcomm/phy-qcom-qusb2.c
index 191040f6d60f..e5516099b911 100644
--- a/drivers/phy/qualcomm/phy-qcom-qusb2.c
+++ b/drivers/phy/qualcomm/phy-qcom-qusb2.c
@@ -3,6 +3,7 @@
  * Copyright (c) 2017, 2019, The Linux Foundation. All rights reserved.
  */
 
+#include <dt-bindings/phy/phy-qcom-qusb2.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/err.h>
@@ -12,7 +13,6 @@
 #include <linux/module.h>
 #include <linux/nvmem-consumer.h>
 #include <linux/of.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
@@ -20,7 +20,7 @@
 #include <linux/reset.h>
 #include <linux/slab.h>
 
-#include <dt-bindings/phy/phy-qcom-qusb2.h>
+#include "../phy-provider.h"
 
 #define QUSB2PHY_PLL			0x0
 #define QUSB2PHY_PLL_TEST		0x04
diff --git a/drivers/phy/qualcomm/phy-qcom-sgmii-eth.c b/drivers/phy/qualcomm/phy-qcom-sgmii-eth.c
index 5b1c82459c12..4f8ffc6524ab 100644
--- a/drivers/phy/qualcomm/phy-qcom-sgmii-eth.c
+++ b/drivers/phy/qualcomm/phy-qcom-sgmii-eth.c
@@ -7,10 +7,11 @@
 #include <linux/ethtool.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 
+#include "../phy-provider.h"
+
 #include "phy-qcom-qmp-pcs-sgmii.h"
 #include "phy-qcom-qmp-qserdes-com-v5.h"
 #include "phy-qcom-qmp-qserdes-txrx-v5.h"
diff --git a/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c b/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
index 8915fa250e81..17a33e545008 100644
--- a/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
+++ b/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
@@ -10,7 +10,6 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
@@ -18,6 +17,8 @@
 #include <linux/reset.h>
 #include <linux/slab.h>
 
+#include "../phy-provider.h"
+
 #define USB2_PHY_USB_PHY_UTMI_CTRL0		(0x3c)
 #define SLEEPM					BIT(0)
 #define OPMODE_MASK				GENMASK(4, 3)
diff --git a/drivers/phy/qualcomm/phy-qcom-uniphy-pcie-28lp.c b/drivers/phy/qualcomm/phy-qcom-uniphy-pcie-28lp.c
index 324c0a5d658e..13828d4f788e 100644
--- a/drivers/phy/qualcomm/phy-qcom-uniphy-pcie-28lp.c
+++ b/drivers/phy/qualcomm/phy-qcom-uniphy-pcie-28lp.c
@@ -12,12 +12,13 @@
 #include <linux/module.h>
 #include <linux/of_device.h>
 #include <linux/of.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/reset.h>
 #include <linux/units.h>
 
+#include "../phy-provider.h"
+
 #define RST_ASSERT_DELAY_MIN_US		100
 #define RST_ASSERT_DELAY_MAX_US		150
 #define PIPE_CLK_DELAY_MIN_US		5000
diff --git a/drivers/phy/qualcomm/phy-qcom-usb-hs-28nm.c b/drivers/phy/qualcomm/phy-qcom-usb-hs-28nm.c
index a52a9bf13b75..ce317deaeacb 100644
--- a/drivers/phy/qualcomm/phy-qcom-usb-hs-28nm.c
+++ b/drivers/phy/qualcomm/phy-qcom-usb-hs-28nm.c
@@ -11,12 +11,13 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_graph.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/regulator/consumer.h>
 #include <linux/reset.h>
 #include <linux/slab.h>
 
+#include "../phy-provider.h"
+
 /* PHY register and bit definitions */
 #define PHY_CTRL_COMMON0		0x078
 #define SIDDQ				BIT(2)
diff --git a/drivers/phy/qualcomm/phy-qcom-usb-hs.c b/drivers/phy/qualcomm/phy-qcom-usb-hs.c
index 98a18987f1be..95581926023f 100644
--- a/drivers/phy/qualcomm/phy-qcom-usb-hs.c
+++ b/drivers/phy/qualcomm/phy-qcom-usb-hs.c
@@ -8,11 +8,12 @@
 #include <linux/clk.h>
 #include <linux/regulator/consumer.h>
 #include <linux/of.h>
-#include <linux/phy/phy.h>
 #include <linux/reset.h>
 #include <linux/extcon.h>
 #include <linux/notifier.h>
 
+#include "../phy-provider.h"
+
 #define ULPI_PWR_CLK_MNG_REG		0x88
 # define ULPI_PWR_OTG_COMP_DISABLE	BIT(0)
 
diff --git a/drivers/phy/qualcomm/phy-qcom-usb-hsic.c b/drivers/phy/qualcomm/phy-qcom-usb-hsic.c
index 20f6dd37c7c1..fe9315a2f207 100644
--- a/drivers/phy/qualcomm/phy-qcom-usb-hsic.c
+++ b/drivers/phy/qualcomm/phy-qcom-usb-hsic.c
@@ -5,12 +5,13 @@
 #include <linux/module.h>
 #include <linux/ulpi/driver.h>
 #include <linux/ulpi/regs.h>
-#include <linux/phy/phy.h>
 #include <linux/pinctrl/consumer.h>
 #include <linux/pinctrl/pinctrl-state.h>
 #include <linux/delay.h>
 #include <linux/clk.h>
 
+#include "../phy-provider.h"
+
 #define ULPI_HSIC_CFG		0x30
 #define ULPI_HSIC_IO_CAL	0x33
 
diff --git a/drivers/phy/qualcomm/phy-qcom-usb-ss.c b/drivers/phy/qualcomm/phy-qcom-usb-ss.c
index a3a6d3ce7ea1..17ca14a0b34d 100644
--- a/drivers/phy/qualcomm/phy-qcom-usb-ss.c
+++ b/drivers/phy/qualcomm/phy-qcom-usb-ss.c
@@ -11,12 +11,13 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/regulator/consumer.h>
 #include <linux/reset.h>
 #include <linux/slab.h>
 
+#include "../phy-provider.h"
+
 #define PHY_CTRL0			0x6C
 #define PHY_CTRL1			0x70
 #define PHY_CTRL2			0x74
diff --git a/drivers/phy/ralink/phy-mt7621-pci.c b/drivers/phy/ralink/phy-mt7621-pci.c
index a591ad95347c..4865a264136d 100644
--- a/drivers/phy/ralink/phy-mt7621-pci.c
+++ b/drivers/phy/ralink/phy-mt7621-pci.c
@@ -10,11 +10,12 @@
 #include <linux/bitops.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/sys_soc.h>
 
+#include "../phy-provider.h"
+
 #define RG_PE1_PIPE_REG				0x02c
 #define RG_PE1_PIPE_RST				BIT(12)
 #define RG_PE1_PIPE_CMD_FRC			BIT(4)
diff --git a/drivers/phy/ralink/phy-ralink-usb.c b/drivers/phy/ralink/phy-ralink-usb.c
index 0ff07e210769..cc61139ce157 100644
--- a/drivers/phy/ralink/phy-ralink-usb.c
+++ b/drivers/phy/ralink/phy-ralink-usb.c
@@ -14,11 +14,12 @@
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/of.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/reset.h>
 
+#include "../phy-provider.h"
+
 #define RT_SYSC_REG_SYSCFG1		0x014
 #define RT_SYSC_REG_CLKCFG1		0x030
 #define RT_SYSC_REG_USB_PHY_CFG		0x05c
diff --git a/drivers/phy/realtek/phy-rtk-usb2.c b/drivers/phy/realtek/phy-rtk-usb2.c
index 248550ef98ca..a0431f11972e 100644
--- a/drivers/phy/realtek/phy-rtk-usb2.c
+++ b/drivers/phy/realtek/phy-rtk-usb2.c
@@ -16,9 +16,10 @@
 #include <linux/regmap.h>
 #include <linux/sys_soc.h>
 #include <linux/mfd/syscon.h>
-#include <linux/phy/phy.h>
 #include <linux/usb.h>
 
+#include "../phy-provider.h"
+
 /* GUSB2PHYACCn register */
 #define PHY_NEW_REG_REQ BIT(25)
 #define PHY_VSTS_BUSY   BIT(23)
diff --git a/drivers/phy/realtek/phy-rtk-usb3.c b/drivers/phy/realtek/phy-rtk-usb3.c
index cce453686db2..3f565c4d96be 100644
--- a/drivers/phy/realtek/phy-rtk-usb3.c
+++ b/drivers/phy/realtek/phy-rtk-usb3.c
@@ -16,9 +16,10 @@
 #include <linux/regmap.h>
 #include <linux/sys_soc.h>
 #include <linux/mfd/syscon.h>
-#include <linux/phy/phy.h>
 #include <linux/usb.h>
 
+#include "../phy-provider.h"
+
 #define USB_MDIO_CTRL_PHY_BUSY BIT(7)
 #define USB_MDIO_CTRL_PHY_WRITE BIT(0)
 #define USB_MDIO_CTRL_PHY_ADDR_SHIFT 8
diff --git a/drivers/phy/renesas/phy-rcar-gen2.c b/drivers/phy/renesas/phy-rcar-gen2.c
index 6c671254c625..ca5498986120 100644
--- a/drivers/phy/renesas/phy-rcar-gen2.c
+++ b/drivers/phy/renesas/phy-rcar-gen2.c
@@ -12,11 +12,12 @@
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/spinlock.h>
 #include <linux/atomic.h>
 
+#include "../phy-provider.h"
+
 #define USBHS_LPSTS			0x02
 #define USBHS_UGCTRL			0x80
 #define USBHS_UGCTRL2			0x84
diff --git a/drivers/phy/renesas/phy-rcar-gen3-pcie.c b/drivers/phy/renesas/phy-rcar-gen3-pcie.c
index 3e2cf59ad480..747a1cd74639 100644
--- a/drivers/phy/renesas/phy-rcar-gen3-pcie.c
+++ b/drivers/phy/renesas/phy-rcar-gen3-pcie.c
@@ -9,11 +9,12 @@
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/spinlock.h>
 
+#include "../phy-provider.h"
+
 #define PHY_CTRL		0x4000		/* R8A77980 only */
 
 /* PHY control register (PHY_CTRL) */
diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
index cfc2a8d9028d..48ae5a507752 100644
--- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
+++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
@@ -19,7 +19,6 @@
 #include <linux/mutex.h>
 #include <linux/mux/consumer.h>
 #include <linux/of.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/regulator/consumer.h>
@@ -29,6 +28,8 @@
 #include <linux/usb/of.h>
 #include <linux/workqueue.h>
 
+#include "../phy-provider.h"
+
 /******* USB2.0 Host registers (original offset is +0x200) *******/
 #define USB2_INT_ENABLE		0x000
 #define USB2_AHB_BUS_CTR	0x008
diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb3.c b/drivers/phy/renesas/phy-rcar-gen3-usb3.c
index 0420f5b283ce..3511831e95d2 100644
--- a/drivers/phy/renesas/phy-rcar-gen3-usb3.c
+++ b/drivers/phy/renesas/phy-rcar-gen3-usb3.c
@@ -10,10 +10,11 @@
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 
+#include "../phy-provider.h"
+
 #define USB30_CLKSET0		0x034
 #define USB30_CLKSET1		0x036
 #define USB30_SSC_SET		0x038
diff --git a/drivers/phy/renesas/phy-rzg3e-usb3.c b/drivers/phy/renesas/phy-rzg3e-usb3.c
index 6b3453ea0004..1c9e2276bb73 100644
--- a/drivers/phy/renesas/phy-rzg3e-usb3.c
+++ b/drivers/phy/renesas/phy-rzg3e-usb3.c
@@ -11,11 +11,12 @@
 #include <linux/iopoll.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/reset.h>
 
+#include "../phy-provider.h"
+
 #define USB3_TEST_RESET				0x0000
 #define USB3_TEST_UTMICTRL2			0x0b04
 #define USB3_TEST_PRMCTRL5_R			0x0c10
diff --git a/drivers/phy/renesas/r8a779f0-ether-serdes.c b/drivers/phy/renesas/r8a779f0-ether-serdes.c
index c34427ac4fdb..807af518aeda 100644
--- a/drivers/phy/renesas/r8a779f0-ether-serdes.c
+++ b/drivers/phy/renesas/r8a779f0-ether-serdes.c
@@ -10,11 +10,12 @@
 #include <linux/kernel.h>
 #include <linux/of.h>
 #include <linux/phy.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/reset.h>
 
+#include "../phy-provider.h"
+
 #define R8A779F0_ETH_SERDES_NUM			3
 #define R8A779F0_ETH_SERDES_OFFSET		0x0400
 #define R8A779F0_ETH_SERDES_BANK_SELECT		0x03fc
diff --git a/drivers/phy/rockchip/phy-rockchip-dp.c b/drivers/phy/rockchip/phy-rockchip-dp.c
index 592aa956eead..63e972969379 100644
--- a/drivers/phy/rockchip/phy-rockchip-dp.c
+++ b/drivers/phy/rockchip/phy-rockchip-dp.c
@@ -10,10 +10,11 @@
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 
+#include "../phy-provider.h"
+
 #define GRF_SOC_CON12                           0x0274
 
 #define GRF_EDP_REF_CLK_SEL_INTER_HIWORD_MASK   BIT(20)
diff --git a/drivers/phy/rockchip/phy-rockchip-dphy-rx0.c b/drivers/phy/rockchip/phy-rockchip-dphy-rx0.c
index e6a768bbb9b3..de7e00580e20 100644
--- a/drivers/phy/rockchip/phy-rockchip-dphy-rx0.c
+++ b/drivers/phy/rockchip/phy-rockchip-dphy-rx0.c
@@ -21,11 +21,12 @@
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/phy/phy.h>
 #include <linux/phy/phy-mipi-dphy.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 
+#include "../phy-provider.h"
+
 #define RK3399_GRF_SOC_CON9		0x6224
 #define RK3399_GRF_SOC_CON21		0x6254
 #define RK3399_GRF_SOC_CON22		0x6258
diff --git a/drivers/phy/rockchip/phy-rockchip-emmc.c b/drivers/phy/rockchip/phy-rockchip-emmc.c
index 5187983c58e5..fd292f063f48 100644
--- a/drivers/phy/rockchip/phy-rockchip-emmc.c
+++ b/drivers/phy/rockchip/phy-rockchip-emmc.c
@@ -13,10 +13,11 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 
+#include "../phy-provider.h"
+
 /*
  * The higher 16-bit of this register is used for write protection
  * only if BIT(x + 16) set to 1 the BIT(x) can be written.
diff --git a/drivers/phy/rockchip/phy-rockchip-inno-csidphy.c b/drivers/phy/rockchip/phy-rockchip-inno-csidphy.c
index c79fb53d8ee5..3b5d86b07564 100644
--- a/drivers/phy/rockchip/phy-rockchip-inno-csidphy.c
+++ b/drivers/phy/rockchip/phy-rockchip-inno-csidphy.c
@@ -13,13 +13,14 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_platform.h>
-#include <linux/phy/phy.h>
 #include <linux/phy/phy-mipi-dphy.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 #include <linux/reset.h>
 
+#include "../phy-provider.h"
+
 /* GRF */
 #define RK1808_GRF_PD_VI_CON_OFFSET	0x0430
 
diff --git a/drivers/phy/rockchip/phy-rockchip-inno-dsidphy.c b/drivers/phy/rockchip/phy-rockchip-inno-dsidphy.c
index 30d5e5ddff4a..5613b34958fe 100644
--- a/drivers/phy/rockchip/phy-rockchip-inno-dsidphy.c
+++ b/drivers/phy/rockchip/phy-rockchip-inno-dsidphy.c
@@ -15,13 +15,13 @@
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/phy/phy-mipi-dphy.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/reset.h>
 #include <linux/time64.h>
 
-#include <linux/phy/phy.h>
-#include <linux/phy/phy-mipi-dphy.h>
+#include "../phy-provider.h"
 
 #define UPDATE(x, h, l)	(((x) << (l)) & GENMASK((h), (l)))
 
diff --git a/drivers/phy/rockchip/phy-rockchip-inno-hdmi.c b/drivers/phy/rockchip/phy-rockchip-inno-hdmi.c
index 1483907413fa..82b5e7434f83 100644
--- a/drivers/phy/rockchip/phy-rockchip-inno-hdmi.c
+++ b/drivers/phy/rockchip/phy-rockchip-inno-hdmi.c
@@ -20,6 +20,8 @@
 #include <linux/phy/phy.h>
 #include <linux/slab.h>
 
+#include "../phy-provider.h"
+
 #define UPDATE(x, h, l)		(((x) << (l)) & GENMASK((h), (l)))
 
 /* REG: 0x00 */
diff --git a/drivers/phy/rockchip/phy-rockchip-inno-usb2.c b/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
index 8f4c08e599aa..f88e09f61994 100644
--- a/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
+++ b/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
@@ -18,7 +18,6 @@
 #include <linux/mutex.h>
 #include <linux/of.h>
 #include <linux/of_irq.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/power_supply.h>
 #include <linux/regmap.h>
@@ -27,6 +26,8 @@
 #include <linux/usb/of.h>
 #include <linux/usb/otg.h>
 
+#include "../phy-provider.h"
+
 #define BIT_WRITEABLE_SHIFT	16
 #define SCHEDULE_DELAY		(60 * HZ)
 #define OTG_SCHEDULE_DELAY	(2 * HZ)
diff --git a/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c b/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c
index b60d6bf3f33c..2deb2666acb1 100644
--- a/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c
+++ b/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c
@@ -9,12 +9,13 @@
 #include <linux/clk.h>
 #include <linux/mfd/syscon.h>
 #include <linux/of.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/reset.h>
 #include <linux/units.h>
 
+#include "../phy-provider.h"
+
 #define BIT_WRITEABLE_SHIFT		16
 #define REF_CLOCK_24MHz			(24 * HZ_PER_MHZ)
 #define REF_CLOCK_25MHz			(25 * HZ_PER_MHZ)
diff --git a/drivers/phy/rockchip/phy-rockchip-pcie.c b/drivers/phy/rockchip/phy-rockchip-pcie.c
index 126306c01454..604ff00653b0 100644
--- a/drivers/phy/rockchip/phy-rockchip-pcie.c
+++ b/drivers/phy/rockchip/phy-rockchip-pcie.c
@@ -13,12 +13,12 @@
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/property.h>
 #include <linux/regmap.h>
 #include <linux/reset.h>
 
+#include "../phy-provider.h"
 
 #define PHY_MAX_LANE_NUM      4
 #define PHY_CFG_DATA_MASK     GENMASK(10, 7)
diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c b/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
index 0f69060aa5d5..78a0446b81df 100644
--- a/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
+++ b/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
@@ -15,12 +15,13 @@
 #include <linux/module.h>
 #include <linux/mod_devicetable.h>
 #include <linux/of.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 #include <linux/reset.h>
 
+#include "../phy-provider.h"
+
 #define BIAS_CON0		0x0000
 #define I_RES_CNTL_MASK		GENMASK(6, 4)
 #define I_RES_CNTL(x)		FIELD_PREP(I_RES_CNTL_MASK, x)
diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
index 2d973bc37f07..01801a4dc436 100644
--- a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
+++ b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
@@ -21,6 +21,8 @@
 #include <linux/regmap.h>
 #include <linux/reset.h>
 
+#include "../phy-provider.h"
+
 #define GRF_HDPTX_CON0			0x00
 #define LC_REF_CLK_SEL			BIT(11)
 #define HDPTX_I_PLL_EN			BIT(7)
diff --git a/drivers/phy/rockchip/phy-rockchip-snps-pcie3.c b/drivers/phy/rockchip/phy-rockchip-snps-pcie3.c
index 4e8ffd173096..029566330aa0 100644
--- a/drivers/phy/rockchip/phy-rockchip-snps-pcie3.c
+++ b/drivers/phy/rockchip/phy-rockchip-snps-pcie3.c
@@ -14,11 +14,12 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/phy/pcie.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/reset.h>
 
+#include "../phy-provider.h"
+
 /* Register for RK3568 */
 #define GRF_PCIE30PHY_CON1			0x4
 #define GRF_PCIE30PHY_CON6			0x18
diff --git a/drivers/phy/rockchip/phy-rockchip-typec.c b/drivers/phy/rockchip/phy-rockchip-typec.c
index 0a318ccf1bbf..4a9756ca4f68 100644
--- a/drivers/phy/rockchip/phy-rockchip-typec.c
+++ b/drivers/phy/rockchip/phy-rockchip-typec.c
@@ -43,6 +43,7 @@
 #include <linux/io.h>
 #include <linux/iopoll.h>
 #include <linux/kernel.h>
+#include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/of.h>
@@ -53,8 +54,7 @@
 #include <linux/regmap.h>
 #include <linux/reset.h>
 
-#include <linux/mfd/syscon.h>
-#include <linux/phy/phy.h>
+#include "../phy-provider.h"
 
 #define CMN_SSM_BANDGAP			(0x21 << 2)
 #define CMN_SSM_BIAS			(0x22 << 2)
diff --git a/drivers/phy/rockchip/phy-rockchip-usb.c b/drivers/phy/rockchip/phy-rockchip-usb.c
index cef96739cf3f..0652f821332b 100644
--- a/drivers/phy/rockchip/phy-rockchip-usb.c
+++ b/drivers/phy/rockchip/phy-rockchip-usb.c
@@ -14,7 +14,6 @@
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/of.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/property.h>
 #include <linux/regulator/consumer.h>
@@ -23,6 +22,8 @@
 #include <linux/mfd/syscon.h>
 #include <linux/delay.h>
 
+#include "../phy-provider.h"
+
 static int enable_usb_uart;
 
 #define UOC_CON0					0x00
diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index fba35510d88c..cf2abf29512f 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -25,6 +25,8 @@
 #include <linux/usb/typec_dp.h>
 #include <linux/usb/typec_mux.h>
 
+#include "../phy-provider.h"
+
 /* USBDP PHY Register Definitions */
 #define UDPHY_PCS				0x4000
 #define UDPHY_PMA				0x8000
diff --git a/drivers/phy/samsung/phy-exynos-dp-video.c b/drivers/phy/samsung/phy-exynos-dp-video.c
index a636dee07585..00d0ed82a620 100644
--- a/drivers/phy/samsung/phy-exynos-dp-video.c
+++ b/drivers/phy/samsung/phy-exynos-dp-video.c
@@ -12,11 +12,12 @@
 #include <linux/module.h>
 #include <linux/mfd/syscon.h>
 #include <linux/of.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/soc/samsung/exynos-regs-pmu.h>
 
+#include "../phy-provider.h"
+
 struct exynos_dp_video_phy_drvdata {
 	u32 phy_ctrl_offset;
 };
diff --git a/drivers/phy/samsung/phy-exynos-mipi-video.c b/drivers/phy/samsung/phy-exynos-mipi-video.c
index be925508ed97..ce8a258a104e 100644
--- a/drivers/phy/samsung/phy-exynos-mipi-video.c
+++ b/drivers/phy/samsung/phy-exynos-mipi-video.c
@@ -11,13 +11,14 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/spinlock.h>
 #include <linux/soc/samsung/exynos-regs-pmu.h>
 #include <linux/mfd/syscon.h>
 
+#include "../phy-provider.h"
+
 enum exynos_mipi_phy_id {
 	EXYNOS_MIPI_PHY_ID_NONE = -1,
 	EXYNOS_MIPI_PHY_ID_CSIS0,
diff --git a/drivers/phy/samsung/phy-exynos-pcie.c b/drivers/phy/samsung/phy-exynos-pcie.c
index 53c9230c2907..9dd3a4a90fa7 100644
--- a/drivers/phy/samsung/phy-exynos-pcie.c
+++ b/drivers/phy/samsung/phy-exynos-pcie.c
@@ -12,9 +12,10 @@
 #include <linux/mfd/syscon.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
-#include <linux/phy/phy.h>
 #include <linux/regmap.h>
 
+#include "../phy-provider.h"
+
 #define PCIE_PHY_OFFSET(x)		((x) * 0x4)
 
 /* Sysreg FSYS register offsets and bits for Exynos5433 */
diff --git a/drivers/phy/samsung/phy-exynos4210-usb2.c b/drivers/phy/samsung/phy-exynos4210-usb2.c
index 3898a7f58217..beb2f96bebbf 100644
--- a/drivers/phy/samsung/phy-exynos4210-usb2.c
+++ b/drivers/phy/samsung/phy-exynos4210-usb2.c
@@ -8,8 +8,9 @@
 
 #include <linux/delay.h>
 #include <linux/io.h>
-#include <linux/phy/phy.h>
 #include <linux/regmap.h>
+
+#include "../phy-provider.h"
 #include "phy-samsung-usb2.h"
 
 /* Exynos USB PHY registers */
diff --git a/drivers/phy/samsung/phy-exynos4x12-usb2.c b/drivers/phy/samsung/phy-exynos4x12-usb2.c
index b528a5d037fe..a402f80d0aab 100644
--- a/drivers/phy/samsung/phy-exynos4x12-usb2.c
+++ b/drivers/phy/samsung/phy-exynos4x12-usb2.c
@@ -8,8 +8,9 @@
 
 #include <linux/delay.h>
 #include <linux/io.h>
-#include <linux/phy/phy.h>
 #include <linux/regmap.h>
+
+#include "../phy-provider.h"
 #include "phy-samsung-usb2.h"
 
 /* Exynos USB PHY registers */
diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c b/drivers/phy/samsung/phy-exynos5-usbdrd.c
index 5a181cb4597e..cb476d007e3f 100644
--- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
+++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
@@ -26,6 +26,8 @@
 #include <linux/usb/typec.h>
 #include <linux/usb/typec_mux.h>
 
+#include "../phy-provider.h"
+
 /* Exynos USB PHY registers */
 #define EXYNOS5_FSEL_9MHZ6		0x0
 #define EXYNOS5_FSEL_10MHZ		0x1
diff --git a/drivers/phy/samsung/phy-exynos5250-sata.c b/drivers/phy/samsung/phy-exynos5250-sata.c
index 595adba5fb8f..0f85ae0a5901 100644
--- a/drivers/phy/samsung/phy-exynos5250-sata.c
+++ b/drivers/phy/samsung/phy-exynos5250-sata.c
@@ -15,12 +15,13 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/spinlock.h>
 #include <linux/mfd/syscon.h>
 
+#include "../phy-provider.h"
+
 #define SATAPHY_CONTROL_OFFSET		0x0724
 #define EXYNOS5_SATAPHY_PMU_ENABLE	BIT(0)
 #define EXYNOS5_SATA_RESET		0x4
diff --git a/drivers/phy/samsung/phy-exynos5250-usb2.c b/drivers/phy/samsung/phy-exynos5250-usb2.c
index 21b06072f866..04815633f290 100644
--- a/drivers/phy/samsung/phy-exynos5250-usb2.c
+++ b/drivers/phy/samsung/phy-exynos5250-usb2.c
@@ -8,8 +8,9 @@
 
 #include <linux/delay.h>
 #include <linux/io.h>
-#include <linux/phy/phy.h>
 #include <linux/regmap.h>
+
+#include "../phy-provider.h"
 #include "phy-samsung-usb2.h"
 
 /* Exynos USB PHY registers */
diff --git a/drivers/phy/samsung/phy-s5pv210-usb2.c b/drivers/phy/samsung/phy-s5pv210-usb2.c
index 32be62e49804..4d72559d29a9 100644
--- a/drivers/phy/samsung/phy-s5pv210-usb2.c
+++ b/drivers/phy/samsung/phy-s5pv210-usb2.c
@@ -8,7 +8,8 @@
 
 #include <linux/delay.h>
 #include <linux/io.h>
-#include <linux/phy/phy.h>
+
+#include "../phy-provider.h"
 #include "phy-samsung-usb2.h"
 
 /* Exynos USB PHY registers */
diff --git a/drivers/phy/samsung/phy-samsung-ufs.c b/drivers/phy/samsung/phy-samsung-ufs.c
index ee665f26c236..b55a726cd44e 100644
--- a/drivers/phy/samsung/phy-samsung-ufs.c
+++ b/drivers/phy/samsung/phy-samsung-ufs.c
@@ -15,10 +15,10 @@
 #include <linux/iopoll.h>
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 
+#include "../phy-provider.h"
 #include "phy-samsung-ufs.h"
 
 #define for_each_phy_lane(phy, i) \
diff --git a/drivers/phy/samsung/phy-samsung-ufs.h b/drivers/phy/samsung/phy-samsung-ufs.h
index f2c2e744e5ba..90f4d4cef631 100644
--- a/drivers/phy/samsung/phy-samsung-ufs.h
+++ b/drivers/phy/samsung/phy-samsung-ufs.h
@@ -10,9 +10,10 @@
 #ifndef _PHY_SAMSUNG_UFS_
 #define _PHY_SAMSUNG_UFS_
 
-#include <linux/phy/phy.h>
 #include <linux/regmap.h>
 
+#include "../phy-provider.h"
+
 #define PHY_COMN_BLK	1
 #define PHY_TRSV_BLK	2
 #define END_UFS_PHY_CFG { 0 }
diff --git a/drivers/phy/samsung/phy-samsung-usb2.c b/drivers/phy/samsung/phy-samsung-usb2.c
index d2749b67cf8f..362dd4ae3cab 100644
--- a/drivers/phy/samsung/phy-samsung-usb2.c
+++ b/drivers/phy/samsung/phy-samsung-usb2.c
@@ -13,6 +13,8 @@
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/spinlock.h>
+
+#include "../phy-provider.h"
 #include "phy-samsung-usb2.h"
 
 static int samsung_usb2_phy_power_on(struct phy *phy)
diff --git a/drivers/phy/samsung/phy-samsung-usb2.h b/drivers/phy/samsung/phy-samsung-usb2.h
index ebaf43bfc5a2..515c7938fccd 100644
--- a/drivers/phy/samsung/phy-samsung-usb2.h
+++ b/drivers/phy/samsung/phy-samsung-usb2.h
@@ -10,12 +10,13 @@
 #define _PHY_EXYNOS_USB2_H
 
 #include <linux/clk.h>
-#include <linux/phy/phy.h>
 #include <linux/device.h>
 #include <linux/regmap.h>
 #include <linux/spinlock.h>
 #include <linux/regulator/consumer.h>
 
+#include "../phy-provider.h"
+
 #define KHZ 1000
 #define MHZ (KHZ * KHZ)
 
diff --git a/drivers/phy/socionext/phy-uniphier-ahci.c b/drivers/phy/socionext/phy-uniphier-ahci.c
index 28cf3efe0695..6b3ce56c7f0c 100644
--- a/drivers/phy/socionext/phy-uniphier-ahci.c
+++ b/drivers/phy/socionext/phy-uniphier-ahci.c
@@ -12,10 +12,11 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_platform.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/reset.h>
 
+#include "../phy-provider.h"
+
 struct uniphier_ahciphy_priv {
 	struct device *dev;
 	void __iomem  *base;
diff --git a/drivers/phy/socionext/phy-uniphier-pcie.c b/drivers/phy/socionext/phy-uniphier-pcie.c
index c19173492b79..00f6cdf846f1 100644
--- a/drivers/phy/socionext/phy-uniphier-pcie.c
+++ b/drivers/phy/socionext/phy-uniphier-pcie.c
@@ -12,12 +12,13 @@
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/reset.h>
 #include <linux/resource.h>
 
+#include "../phy-provider.h"
+
 /* PHY */
 #define PCL_PHY_CLKCTRL		0x0000
 #define PORT_SEL_MASK		GENMASK(11, 9)
diff --git a/drivers/phy/socionext/phy-uniphier-usb2.c b/drivers/phy/socionext/phy-uniphier-usb2.c
index c49d432e526b..6ee566478be0 100644
--- a/drivers/phy/socionext/phy-uniphier-usb2.c
+++ b/drivers/phy/socionext/phy-uniphier-usb2.c
@@ -10,11 +10,12 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_platform.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
 
+#include "../phy-provider.h"
+
 #define SG_USBPHY1CTRL		0x500
 #define SG_USBPHY1CTRL2		0x504
 #define SG_USBPHY2CTRL		0x508
diff --git a/drivers/phy/socionext/phy-uniphier-usb3hs.c b/drivers/phy/socionext/phy-uniphier-usb3hs.c
index 8c8673df0084..a08db863223f 100644
--- a/drivers/phy/socionext/phy-uniphier-usb3hs.c
+++ b/drivers/phy/socionext/phy-uniphier-usb3hs.c
@@ -17,12 +17,13 @@
 #include <linux/nvmem-consumer.h>
 #include <linux/of.h>
 #include <linux/of_platform.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/regulator/consumer.h>
 #include <linux/reset.h>
 #include <linux/slab.h>
 
+#include "../phy-provider.h"
+
 #define HSPHY_CFG0		0x0
 #define HSPHY_CFG0_HS_I_MASK	GENMASK(31, 28)
 #define HSPHY_CFG0_HSDISC_MASK	GENMASK(27, 26)
diff --git a/drivers/phy/socionext/phy-uniphier-usb3ss.c b/drivers/phy/socionext/phy-uniphier-usb3ss.c
index f402ed8732fd..8829305e9d4c 100644
--- a/drivers/phy/socionext/phy-uniphier-usb3ss.c
+++ b/drivers/phy/socionext/phy-uniphier-usb3ss.c
@@ -16,11 +16,12 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_platform.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/regulator/consumer.h>
 #include <linux/reset.h>
 
+#include "../phy-provider.h"
+
 #define SSPHY_TESTI		0x0
 #define TESTI_DAT_MASK		GENMASK(13, 6)
 #define TESTI_ADR_MASK		GENMASK(5, 1)
diff --git a/drivers/phy/sophgo/phy-cv1800-usb2.c b/drivers/phy/sophgo/phy-cv1800-usb2.c
index 6fe846534e9c..1fd7bba498ad 100644
--- a/drivers/phy/sophgo/phy-cv1800-usb2.c
+++ b/drivers/phy/sophgo/phy-cv1800-usb2.c
@@ -12,10 +12,11 @@
 #include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/platform_device.h>
-#include <linux/phy/phy.h>
 #include <linux/regmap.h>
 #include <linux/spinlock.h>
 
+#include "../phy-provider.h"
+
 #define REG_USB_PHY_CTRL		0x048
 
 #define PHY_VBUS_POWER_EN		BIT(0)
diff --git a/drivers/phy/spacemit/phy-k1-pcie.c b/drivers/phy/spacemit/phy-k1-pcie.c
index 75477bea7f70..6f8f2f39f7f8 100644
--- a/drivers/phy/spacemit/phy-k1-pcie.c
+++ b/drivers/phy/spacemit/phy-k1-pcie.c
@@ -5,6 +5,7 @@
  * Copyright (C) 2025 by RISCstar Solutions Corporation.  All rights reserved.
  */
 
+#include <dt-bindings/phy/phy.h>
 #include <linux/bitfield.h>
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
@@ -12,12 +13,11 @@
 #include <linux/kernel.h>
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/reset.h>
 
-#include <dt-bindings/phy/phy.h>
+#include "../phy-provider.h"
 
 /*
  * Three PCIe ports are supported in the SpacemiT K1 SoC, and this driver
diff --git a/drivers/phy/spacemit/phy-k1-usb2.c b/drivers/phy/spacemit/phy-k1-usb2.c
index 14a02f554810..f482b6c9b6d4 100644
--- a/drivers/phy/spacemit/phy-k1-usb2.c
+++ b/drivers/phy/spacemit/phy-k1-usb2.c
@@ -9,11 +9,12 @@
 #include <linux/bitfield.h>
 #include <linux/clk.h>
 #include <linux/iopoll.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/usb/of.h>
 
+#include "../phy-provider.h"
+
 #define PHY_RST_MODE_CTRL		0x04
 #define  PHY_PLL_RDY			BIT(0)
 #define  PHY_CLK_CDR_EN			BIT(1)
diff --git a/drivers/phy/st/phy-miphy28lp.c b/drivers/phy/st/phy-miphy28lp.c
index 43cef89af55e..e9792deb629a 100644
--- a/drivers/phy/st/phy-miphy28lp.c
+++ b/drivers/phy/st/phy-miphy28lp.c
@@ -7,6 +7,7 @@
  * Author: Alexandre Torgue <alexandre.torgue@st.com>
  */
 
+#include <dt-bindings/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/io.h>
 #include <linux/iopoll.h>
@@ -16,13 +17,12 @@
 #include <linux/of_platform.h>
 #include <linux/of_address.h>
 #include <linux/clk.h>
-#include <linux/phy/phy.h>
 #include <linux/delay.h>
 #include <linux/mfd/syscon.h>
 #include <linux/regmap.h>
 #include <linux/reset.h>
 
-#include <dt-bindings/phy/phy.h>
+#include "../phy-provider.h"
 
 /* MiPHY registers */
 #define MIPHY_CONF_RESET		0x00
diff --git a/drivers/phy/st/phy-spear1310-miphy.c b/drivers/phy/st/phy-spear1310-miphy.c
index c661ab63505f..86acc2412c46 100644
--- a/drivers/phy/st/phy-spear1310-miphy.c
+++ b/drivers/phy/st/phy-spear1310-miphy.c
@@ -14,10 +14,11 @@
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 
+#include "../phy-provider.h"
+
 /* SPEAr1310 Registers */
 #define SPEAR1310_PCIE_SATA_CFG			0x3A4
 	#define SPEAR1310_PCIE_SATA2_SEL_PCIE		(0 << 31)
diff --git a/drivers/phy/st/phy-spear1340-miphy.c b/drivers/phy/st/phy-spear1340-miphy.c
index 85a60d64ebb7..4dbd3158c060 100644
--- a/drivers/phy/st/phy-spear1340-miphy.c
+++ b/drivers/phy/st/phy-spear1340-miphy.c
@@ -14,10 +14,11 @@
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 
+#include "../phy-provider.h"
+
 /* SPEAr1340 Registers */
 /* Power Management Registers */
 #define SPEAR1340_PCM_CFG			0x100
diff --git a/drivers/phy/st/phy-stih407-usb.c b/drivers/phy/st/phy-stih407-usb.c
index 7a3e4584895c..497f9aa4139d 100644
--- a/drivers/phy/st/phy-stih407-usb.c
+++ b/drivers/phy/st/phy-stih407-usb.c
@@ -16,7 +16,8 @@
 #include <linux/regmap.h>
 #include <linux/reset.h>
 #include <linux/mfd/syscon.h>
-#include <linux/phy/phy.h>
+
+#include "../phy-provider.h"
 
 #define PHYPARAM_REG	0
 #define PHYCTRL_REG	1
diff --git a/drivers/phy/st/phy-stm32-combophy.c b/drivers/phy/st/phy-stm32-combophy.c
index 607b4d607eb5..8757b1993e90 100644
--- a/drivers/phy/st/phy-stm32-combophy.c
+++ b/drivers/phy/st/phy-stm32-combophy.c
@@ -10,12 +10,13 @@
 #include <linux/clk.h>
 #include <linux/mfd/syscon.h>
 #include <linux/platform_device.h>
-#include <linux/phy/phy.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 #include <linux/reset.h>
 #include <dt-bindings/phy/phy.h>
 
+#include "../phy-provider.h"
+
 #define SYSCFG_COMBOPHY_CR1 0x4c00
 #define SYSCFG_COMBOPHY_CR2 0x4c04
 #define SYSCFG_COMBOPHY_CR4 0x4c0c
diff --git a/drivers/phy/st/phy-stm32-usbphyc.c b/drivers/phy/st/phy-stm32-usbphyc.c
index b44afbff8616..647fbbe5c734 100644
--- a/drivers/phy/st/phy-stm32-usbphyc.c
+++ b/drivers/phy/st/phy-stm32-usbphyc.c
@@ -18,6 +18,8 @@
 #include <linux/reset.h>
 #include <linux/units.h>
 
+#include "../phy-provider.h"
+
 #define STM32_USBPHYC_PLL	0x0
 #define STM32_USBPHYC_MISC	0x8
 #define STM32_USBPHYC_MONITOR(X) (0x108 + ((X) * 0x100))
diff --git a/drivers/phy/starfive/phy-jh7110-dphy-rx.c b/drivers/phy/starfive/phy-jh7110-dphy-rx.c
index 0b039e1f71c5..099a1ebf6194 100644
--- a/drivers/phy/starfive/phy-jh7110-dphy-rx.c
+++ b/drivers/phy/starfive/phy-jh7110-dphy-rx.c
@@ -13,11 +13,12 @@
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/reset.h>
 
+#include "../phy-provider.h"
+
 #define STF_DPHY_APBCFGSAIF_SYSCFG(x)		(x)
 
 #define STF_DPHY_ENABLE_CLK			BIT(6)
diff --git a/drivers/phy/starfive/phy-jh7110-dphy-tx.c b/drivers/phy/starfive/phy-jh7110-dphy-tx.c
index c64d1c91b130..a5faf06b6d14 100644
--- a/drivers/phy/starfive/phy-jh7110-dphy-tx.c
+++ b/drivers/phy/starfive/phy-jh7110-dphy-tx.c
@@ -15,12 +15,13 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_device.h>
-#include <linux/phy/phy.h>
 #include <linux/phy/phy-mipi-dphy.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/reset.h>
 
+#include "../phy-provider.h"
+
 #define STF_DPHY_APBIFSAIF_SYSCFG(x)			(x)
 
 #define STF_DPHY_AON_POWER_READY_N_ACTIVE		0
diff --git a/drivers/phy/starfive/phy-jh7110-pcie.c b/drivers/phy/starfive/phy-jh7110-pcie.c
index 734c8e007727..d68d396ac3cc 100644
--- a/drivers/phy/starfive/phy-jh7110-pcie.c
+++ b/drivers/phy/starfive/phy-jh7110-pcie.c
@@ -12,10 +12,11 @@
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/mfd/syscon.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 
+#include "../phy-provider.h"
+
 #define PCIE_KVCO_LEVEL_OFF		0x28
 #define PCIE_USB3_PHY_PLL_CTL_OFF	0x7c
 #define PCIE_KVCO_TUNE_SIGNAL_OFF	0x80
diff --git a/drivers/phy/starfive/phy-jh7110-usb.c b/drivers/phy/starfive/phy-jh7110-usb.c
index b505d89860b4..5762586e5c7d 100644
--- a/drivers/phy/starfive/phy-jh7110-usb.c
+++ b/drivers/phy/starfive/phy-jh7110-usb.c
@@ -12,11 +12,12 @@
 #include <linux/io.h>
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/usb/of.h>
 
+#include "../phy-provider.h"
+
 #define USB_125M_CLK_RATE		125000000
 #define USB_CLK_MODE_OFF		0x0
 #define USB_CLK_MODE_RX_NORMAL_PWR	BIT(1)
diff --git a/drivers/phy/sunplus/phy-sunplus-usb2.c b/drivers/phy/sunplus/phy-sunplus-usb2.c
index 637a5fbae6d9..2ddbc37d09ee 100644
--- a/drivers/phy/sunplus/phy-sunplus-usb2.c
+++ b/drivers/phy/sunplus/phy-sunplus-usb2.c
@@ -17,10 +17,11 @@
 #include <linux/module.h>
 #include <linux/nvmem-consumer.h>
 #include <linux/of.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/reset.h>
 
+#include "../phy-provider.h"
+
 #define HIGH_MASK_BITS				GENMASK(31, 16)
 #define LOW_MASK_BITS				GENMASK(15, 0)
 #define OTP_DISC_LEVEL_DEFAULT			0xd
diff --git a/drivers/phy/tegra/phy-tegra194-p2u.c b/drivers/phy/tegra/phy-tegra194-p2u.c
index f49b417c9eb6..467b6b97e53d 100644
--- a/drivers/phy/tegra/phy-tegra194-p2u.c
+++ b/drivers/phy/tegra/phy-tegra194-p2u.c
@@ -11,9 +11,10 @@
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 
+#include "../phy-provider.h"
+
 #define P2U_CONTROL_CMN			0x74
 #define P2U_CONTROL_CMN_ENABLE_L2_EXIT_RATE_CHANGE		BIT(13)
 #define P2U_CONTROL_CMN_SKP_SIZE_PROTECTION_EN			BIT(20)
diff --git a/drivers/phy/tegra/xusb-tegra124.c b/drivers/phy/tegra/xusb-tegra124.c
index 70b6213370a8..21686c6fb2d7 100644
--- a/drivers/phy/tegra/xusb-tegra124.c
+++ b/drivers/phy/tegra/xusb-tegra124.c
@@ -8,7 +8,6 @@
 #include <linux/mailbox_client.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/regulator/consumer.h>
 #include <linux/reset.h>
@@ -16,6 +15,7 @@
 
 #include <soc/tegra/fuse.h>
 
+#include "../phy-provider.h"
 #include "xusb.h"
 
 #define FUSE_SKU_CALIB_HS_CURR_LEVEL_PADX_SHIFT(x) ((x) ? 15 : 0)
diff --git a/drivers/phy/tegra/xusb-tegra186.c b/drivers/phy/tegra/xusb-tegra186.c
index 1ddf11265974..e017cb1ff484 100644
--- a/drivers/phy/tegra/xusb-tegra186.c
+++ b/drivers/phy/tegra/xusb-tegra186.c
@@ -7,7 +7,6 @@
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/phy/phy.h>
 #include <linux/regulator/consumer.h>
 #include <linux/platform_device.h>
 #include <linux/clk.h>
@@ -15,6 +14,7 @@
 
 #include <soc/tegra/fuse.h>
 
+#include "../phy-provider.h"
 #include "xusb.h"
 
 /* FUSE USB_CALIB registers */
diff --git a/drivers/phy/tegra/xusb-tegra210.c b/drivers/phy/tegra/xusb-tegra210.c
index 1abc5913ec49..006aba47b93d 100644
--- a/drivers/phy/tegra/xusb-tegra210.c
+++ b/drivers/phy/tegra/xusb-tegra210.c
@@ -12,7 +12,6 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_platform.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
@@ -21,6 +20,7 @@
 
 #include <soc/tegra/fuse.h>
 
+#include "../phy-provider.h"
 #include "xusb.h"
 
 #define FUSE_SKU_CALIB_HS_CURR_LEVEL_PADX_SHIFT(x) \
diff --git a/drivers/phy/tegra/xusb.c b/drivers/phy/tegra/xusb.c
index 9d74c0ecc31b..07a2f5a4dbee 100644
--- a/drivers/phy/tegra/xusb.c
+++ b/drivers/phy/tegra/xusb.c
@@ -9,7 +9,6 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_platform.h>
-#include <linux/phy/phy.h>
 #include <linux/phy/tegra/xusb.h>
 #include <linux/platform_device.h>
 #include <linux/regulator/consumer.h>
@@ -19,6 +18,7 @@
 
 #include <soc/tegra/fuse.h>
 
+#include "../phy-provider.h"
 #include "xusb.h"
 
 static struct phy *tegra_xusb_pad_of_xlate(struct device *dev,
diff --git a/drivers/phy/ti/phy-am654-serdes.c b/drivers/phy/ti/phy-am654-serdes.c
index 5b6c27aa7e8b..8990b715525e 100644
--- a/drivers/phy/ti/phy-am654-serdes.c
+++ b/drivers/phy/ti/phy-am654-serdes.c
@@ -15,11 +15,12 @@
 #include <linux/mfd/syscon.h>
 #include <linux/mux/consumer.h>
 #include <linux/of_address.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 
+#include "../phy-provider.h"
+
 #define CMU_R004		0x4
 #define CMU_R060		0x60
 #define CMU_R07C		0x7c
diff --git a/drivers/phy/ti/phy-da8xx-usb.c b/drivers/phy/ti/phy-da8xx-usb.c
index 62fa6f89c0e6..261b65abd38b 100644
--- a/drivers/phy/ti/phy-da8xx-usb.c
+++ b/drivers/phy/ti/phy-da8xx-usb.c
@@ -11,12 +11,13 @@
 #include <linux/mfd/da8xx-cfgchip.h>
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_data/phy-da8xx-usb.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 
+#include "../phy-provider.h"
+
 #define PHY_INIT_BITS	(CFGCHIP2_SESENDEN | CFGCHIP2_VBDTCTEN)
 
 struct da8xx_usb_phy {
diff --git a/drivers/phy/ti/phy-dm816x-usb.c b/drivers/phy/ti/phy-dm816x-usb.c
index d274831b731c..515ef7812bde 100644
--- a/drivers/phy/ti/phy-dm816x-usb.c
+++ b/drivers/phy/ti/phy-dm816x-usb.c
@@ -12,10 +12,11 @@
 #include <linux/err.h>
 #include <linux/pm_runtime.h>
 #include <linux/delay.h>
-#include <linux/phy/phy.h>
 
 #include <linux/mfd/syscon.h>
 
+#include "../phy-provider.h"
+
 /*
  * TRM has two sets of USB_CTRL registers.. The correct register bits
  * are in TRM section 24.9.8.2 USB_CTRL Register. The TRM documents the
diff --git a/drivers/phy/ti/phy-gmii-sel.c b/drivers/phy/ti/phy-gmii-sel.c
index 6213c2b6005a..ce7dc692d7be 100644
--- a/drivers/phy/ti/phy-gmii-sel.c
+++ b/drivers/phy/ti/phy-gmii-sel.c
@@ -14,9 +14,10 @@
 #include <linux/of_address.h>
 #include <linux/of_net.h>
 #include <linux/phy.h>
-#include <linux/phy/phy.h>
 #include <linux/regmap.h>
 
+#include "../phy-provider.h"
+
 /* AM33xx SoC specific definitions for the CONTROL port */
 #define AM33XX_GMII_SEL_MODE_MII	0
 #define AM33XX_GMII_SEL_MODE_RMII	1
diff --git a/drivers/phy/ti/phy-omap-usb2.c b/drivers/phy/ti/phy-omap-usb2.c
index 1eb252604441..318f51d09c28 100644
--- a/drivers/phy/ti/phy-omap-usb2.c
+++ b/drivers/phy/ti/phy-omap-usb2.c
@@ -16,7 +16,6 @@
 #include <linux/of_platform.h>
 #include <linux/phy/omap_control_phy.h>
 #include <linux/phy/omap_usb.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/property.h>
@@ -25,6 +24,8 @@
 #include <linux/sys_soc.h>
 #include <linux/usb/phy_companion.h>
 
+#include "../phy-provider.h"
+
 #define USB2PHY_ANA_CONFIG1		0x4c
 #define USB2PHY_DISCON_BYP_LATCH	BIT(31)
 
diff --git a/drivers/phy/ti/phy-ti-pipe3.c b/drivers/phy/ti/phy-ti-pipe3.c
index b5543b5c674c..d63c8e872d5b 100644
--- a/drivers/phy/ti/phy-ti-pipe3.c
+++ b/drivers/phy/ti/phy-ti-pipe3.c
@@ -10,7 +10,6 @@
 #include <linux/platform_device.h>
 #include <linux/property.h>
 #include <linux/slab.h>
-#include <linux/phy/phy.h>
 #include <linux/of.h>
 #include <linux/clk.h>
 #include <linux/err.h>
@@ -22,6 +21,8 @@
 #include <linux/mfd/syscon.h>
 #include <linux/regmap.h>
 
+#include "../phy-provider.h"
+
 #define	PLL_STATUS		0x00000004
 #define	PLL_GO			0x00000008
 #define	PLL_CONFIGURATION1	0x0000000C
diff --git a/drivers/phy/ti/phy-twl4030-usb.c b/drivers/phy/ti/phy-twl4030-usb.c
index a26aec3ab29e..67c9883691fc 100644
--- a/drivers/phy/ti/phy-twl4030-usb.c
+++ b/drivers/phy/ti/phy-twl4030-usb.c
@@ -20,7 +20,6 @@
 #include <linux/io.h>
 #include <linux/delay.h>
 #include <linux/usb/otg.h>
-#include <linux/phy/phy.h>
 #include <linux/pm_runtime.h>
 #include <linux/usb/musb.h>
 #include <linux/usb/ulpi.h>
@@ -29,6 +28,8 @@
 #include <linux/err.h>
 #include <linux/slab.h>
 
+#include "../phy-provider.h"
+
 /* Register defines */
 
 #define MCPC_CTRL			0x30
diff --git a/drivers/phy/xilinx/phy-zynqmp.c b/drivers/phy/xilinx/phy-zynqmp.c
index fe6b4925d166..db40594622da 100644
--- a/drivers/phy/xilinx/phy-zynqmp.c
+++ b/drivers/phy/xilinx/phy-zynqmp.c
@@ -12,6 +12,7 @@
  * PCIe should also work but that is experimental as of now.
  */
 
+#include <dt-bindings/phy/phy.h>
 #include <linux/clk.h>
 #include <linux/debugfs.h>
 #include <linux/delay.h>
@@ -19,12 +20,11 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/slab.h>
 
-#include <dt-bindings/phy/phy.h>
+#include "../phy-provider.h"
 
 /*
  * Lane Registers
diff --git a/include/linux/phy/phy-sun4i-usb.h b/include/linux/phy/phy-sun4i-usb.h
index f3e7b13608e4..66612be0dac5 100644
--- a/include/linux/phy/phy-sun4i-usb.h
+++ b/include/linux/phy/phy-sun4i-usb.h
@@ -6,7 +6,7 @@
 #ifndef PHY_SUN4I_USB_H_
 #define PHY_SUN4I_USB_H_
 
-#include "phy.h"
+struct phy;
 
 /**
  * sun4i_usb_phy_set_squelch_detect() - Enable/disable squelch detect
diff --git a/include/linux/phy/ulpi_phy.h b/include/linux/phy/ulpi_phy.h
index 7054b440347c..0f9e8430d398 100644
--- a/include/linux/phy/ulpi_phy.h
+++ b/include/linux/phy/ulpi_phy.h
@@ -1,5 +1,5 @@
 /* SPDX-License-Identifier: GPL-2.0 */
-#include <linux/phy/phy.h>
+#include "../../drivers/phy/phy-provider.h"
 
 /**
  * Helper that registers PHY for a ULPI device and adds a lookup for binding it
-- 
2.43.0

