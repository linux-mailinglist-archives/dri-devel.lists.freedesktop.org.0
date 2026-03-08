Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id u64VL5mGrWk04AEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 08 Mar 2026 15:24:25 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 352CF230AC5
	for <lists+dri-devel@lfdr.de>; Sun, 08 Mar 2026 15:24:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFAA710E458;
	Sun,  8 Mar 2026 14:13:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="iez6sp/a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazon11011007.outbound.protection.outlook.com [40.107.130.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38A2C10E135;
 Sun,  8 Mar 2026 11:43:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nrAcpxqgB8cAyyZ968oCzQGfmw35++c6JGKuksJaQJjMg0AOjJkGjHrRBEMO9QVDzJ8JaX7JPNwR1ldZm0yM+1Fpv86fgyluqbuWEu/dzZ3J/JxExGFDILKhK3mtog1QYTU35fIXg65FVfrLNji/MmwFDDKlmaJQpTRKoaC2Tmnq2n8rypFNRvVagP4tMRQQDdZdifcbu7vGU9iDpUvPYNholFJwn/EsPBY5K3DmuSl043nMEHUUpUFcJdTNUZUrfIgkGiRkC192n4z51yXR8muk0cEwodreYUrpIZwViWV9O7Uz4R0ha5lAFKWNiE2d2t3t4ShMAJj+jUz9rV35lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KJnwXiCgrKov0AaYW8eJ6oAdki+aNrxUoQv+1qDtlJI=;
 b=KntxdJBGKA+dlU4nfe/RhcZotVjawlddXS1hjz8EIr+u0WUjcOR5XqMqrPToBhFjIWtdYlowKcoLL0/mYzR0GuVqANHMgfQM/EslDUdX4yahnwp+j2F7CLIl9YoMsY09OQyOYYuM0XeHoqZAOha68XGCCvPFtQZVb7lrUA6zm4BWqzlaXyRkKTPv76Kc5d4rTIDhSYrkayoZgtseOLJqM9JWVZk4lHA8r0OjMzsnt7R1qo2KvQTWuDmJd6SJU866ien3iPkh1LjpXJ1X1R+4BmHKm0I5kuHhCw/+pqRC1s8L3TnAUiD5QvCRHc+sbjk+lYN3aXw7rt3fMSLC0DncSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KJnwXiCgrKov0AaYW8eJ6oAdki+aNrxUoQv+1qDtlJI=;
 b=iez6sp/agTifT3TJJWOok0HkSFQZe5qi7364OoUCOztgnoSFxwxjLRqXxIa5Ep2chJq6PO5sGLhNrT+3+4ovz2tqQpFM7Fc24RHtV3RadU8CzfHI2NxROtocCW06LR43hZRbUz96RApRw3/18dBcz1idv02RWguhWwSxP3kzNNuoab9BQ8wdHF+A0Z01eRgyE33zfUCe9T2PT9nnnKug41Vz/6cgLlHUVMPpsOWhfs2Wd33SEYl6uKmjgiauBtiz4FNReurCmUR20bS6oUD02UJjsSSSZbwJgInKTMUwoQL98uLHU/0aPuDDVGG1gDcOUe91UP8KQTL6XJUfPG5ZAQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8585.eurprd04.prod.outlook.com (2603:10a6:20b:438::13)
 by AM9PR04MB8211.eurprd04.prod.outlook.com (2603:10a6:20b:3ea::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.22; Sun, 8 Mar
 2026 11:43:37 +0000
Received: from AM9PR04MB8585.eurprd04.prod.outlook.com
 ([fe80::f010:fca8:7ef:62f4]) by AM9PR04MB8585.eurprd04.prod.outlook.com
 ([fe80::f010:fca8:7ef:62f4%4]) with mapi id 15.20.9678.023; Sun, 8 Mar 2026
 11:43:37 +0000
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
 spacemit@lists.linux.dev, UNGLinuxDriver@microchip.com
Subject: [PATCH v2 phy-next 21/24] phy: include PHY provider header (1/2)
Date: Sun,  8 Mar 2026 13:40:06 +0200
Message-ID: <20260308114009.2546587-22-vladimir.oltean@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260308114009.2546587-1-vladimir.oltean@nxp.com>
References: <20260308114009.2546587-1-vladimir.oltean@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR02CA0072.eurprd02.prod.outlook.com
 (2603:10a6:802:14::43) To AM9PR04MB8585.eurprd04.prod.outlook.com
 (2603:10a6:20b:438::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8585:EE_|AM9PR04MB8211:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e5ed606-9951-490f-bd0c-08de7d07ef74
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|10070799003|19092799006|7416014|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: ytoY0weIllSWJJGCJqmWvrJMyR8UyPYf7VL9m1qCn7UE2O9NEEICbHtzUJEpxJZKGYd30Un/+yMgGnGLo16FC+C5riSlr1QsMSaOkKxr73WgPmmW1zUubRNpRCXpn3+GeyZRkjE7m4h766s5aRsV5rHpvYijju/13XpDzG+Pq4e6XDmhFk4Rl07taURfSikrMHFZqlJdMWaSuk4ZJWXAiWpq+ytSS5eSpCc+lrRF1BlXL0pzXANP+OvPfZ+1bPSvmf6L0hjalR3BGKofuw/80KokOnlNk8LMdIcO5Msch8mNG+9RtZnxMtLffn6PutSnXdqnYHevjecH9wLqvxvJocGSEDITM0HFQFqhvIyspOAP5JzuDSs6PE+ibMhp4myQ8j6syWOYpjvAYGrNLaX/E9UfsZITBR5mf5cyPxsguZckkt9fLoRCWD5eFIpHa5eKd+m3X4LzPnQcY16pkBja0nUyi8d9JrOlLdhchT0HwyRbWt/93T4sc8yhDZ2MufWpanjbnu8pqLSbgEgtBhVQPDiqT6n5HeRezWRkxuW6v2k+nC5gKi9QARTaRIKDtVbc1hj019GAv+iHmZp4aCJtRpa9El5wxEE7uwniNrkvuIkoO35SNN/Y74x1hVR5CWkpI+71tSHn+lc5iwXEsPtvsMU1glHddn/tJk/BvuIKeB6kNtKOz/I6ryQGwV3diwsEUgTcz2pPtux+M7j7h6iUHvJXGmLqBy666tYK7jC5DW8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR04MB8585.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(10070799003)(19092799006)(7416014)(376014)(1800799024);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0vVzhrXTR7iiss5RlhqUs4H3DQfJwjm9rl3VKQnj2tbt8f0q8S450c7wDCvQ?=
 =?us-ascii?Q?LfVOwG4E3bl2NPzeozGKaj1Yp8WIQH8nPuaBYZqxYRG4dgdm2B94Q+P8WowW?=
 =?us-ascii?Q?buoBMri3O+Bpa/1AdVf54JWzJkjefCe0Is+dR9lQivMWeQnMG3z6n/VtKowT?=
 =?us-ascii?Q?6fo6Oa0T1wWwU18+N81l5DRdOwtOGl2cwb6PeEFjTGbsttR99WmJjCKHRPIc?=
 =?us-ascii?Q?5dmWtHI2AbAqYO2TfvouKS1Q+rowVT6i97d5FDRLDR70gs4idHCE6qLoquip?=
 =?us-ascii?Q?Js8KMe/eD1V8YzoNFdFtJk5PXn1GqFhhzZB2FtF1xMdDuJ97U3D9FVypJnv+?=
 =?us-ascii?Q?Bib12d1/lk9nEAW86OovdaL/a56lvn4B/vJieAWUUDXt1rffRdl0m3yGO0WU?=
 =?us-ascii?Q?bF45RiBSc8iJ38spNU0YD8xEIiA2uctn9GMVhGlx/cemKGsR/Z62J1n30src?=
 =?us-ascii?Q?jfUZwGy668gqpmuViokOavEtQYnF56ahi0xog9KR/7+BxIHLmoCvHmwvsXwD?=
 =?us-ascii?Q?NdzHdUpJnU4w28XWhMtAnAOSpuEq4bHFRoGXiJFz2gYFgPK5AbJlOjln0/FK?=
 =?us-ascii?Q?VlcQZgDDCXzOObNxg7mq7c7ymVpWoDLkAKXuTd0pojsXS7rhzJA7OjLvmRmH?=
 =?us-ascii?Q?iA2NcrajqxpNB0WWtTEPkfZ4n4XBMJO2bqA9xqkdG13VtANnavPkuMjS7FG7?=
 =?us-ascii?Q?ZfM4Yzq53AAUiRkacnv9/46wqHJAoiwmFqmYahs/fkLwRczbBHH3TfWxIo1a?=
 =?us-ascii?Q?VxZMXWp5A98G6fMbAxVueQlhvfdAMxgVygWCEFw7CmafQSN5pIBEOZ+nFg5k?=
 =?us-ascii?Q?rlAdrgtRLp4mk5S9LyglcUGQCn9XTiKWPA3lWTjaK/+g6Lg3PHSPGXAB+xVa?=
 =?us-ascii?Q?Y8S5KouLbUcpHrIgTyV0WZOYrq1GBBnKZkyZ1DyR5ntW6zqCz8IelzpwccGT?=
 =?us-ascii?Q?lJSCBmCGI73VzAab4WDVKC6wt6RYH1lXgSDZ0QASzqwPByVB2VWYGAEzCCR2?=
 =?us-ascii?Q?BMv4wD+iJZ0uKJM2OWRelOuLaU5eOf1OmUdVhWt7CL9ZQjaVqijpfksZ/i5I?=
 =?us-ascii?Q?U+auoMDJsl5lD3rWaH8S7K8pItj4LEb5ZL83Sr1b4AJraKspKlFCm8ZmRfJh?=
 =?us-ascii?Q?aKl8c5xnxNUT6oZpHQQ8NwRjPp/HlM55I5CQU/09zyqtAgAVmrDnnyiU40M7?=
 =?us-ascii?Q?A1/c1nCOxAKTd+OJSopaHPSpa70G4w0KLRRUXTBaQVp72m1oP4fi569mFcOl?=
 =?us-ascii?Q?Kt9GSK8hGPGGqfllNZ2EeOyorS4oVCvojTXxDj+eJpiPVplvLAuEhV9tngyq?=
 =?us-ascii?Q?2TpBF4uHnzATcmacNg3wR9UfigZpBiBE7lmHmr7MriAREWpAZCn3Ho+xnDcV?=
 =?us-ascii?Q?kcd5hsarW3X3Dc9lIX3ApVBa3tcDxHCqzEa2kWrm2r4nprZbTH6F5WZSFEyO?=
 =?us-ascii?Q?B7zTDfBfFBKIdFBOF0xfsUGWgNEV3enV/BerUiuIlADeLaWGSIv4HMEmaxNk?=
 =?us-ascii?Q?S212TmfUPjx6eJTkCgwNIO/XEtt6JbqPMU0f2K/uDxD0RbntDFytvEmewDcF?=
 =?us-ascii?Q?qTg/65MrDwx8QSwWKErQOI2Et2+VrIZMjh1Cij8KXqyq/A5QKp81SFp+e0Lb?=
 =?us-ascii?Q?UrK89/qHYbcw933sB42niufLqwXxLAziiok5KrCSCfU9pVXbwl/3Q0ey9z/m?=
 =?us-ascii?Q?CFCZOJTPk8iaa31cw0faOj75CHEyyQUl/i6a9FBNvVGH7OSobN/kOWmAyZ0w?=
 =?us-ascii?Q?ghw2pGxL9rZASxPEWyJl2d8tPFwrrNBpCctazin5GuR010eolo/sQBqfH7Mm?=
X-MS-Exchange-AntiSpam-MessageData-1: UI21bKsCoi3d7JN2VPg75o0iNPggRQ5KZYc=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e5ed606-9951-490f-bd0c-08de7d07ef74
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8585.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2026 11:43:37.1226 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mhT4Aa4oGQiFath1wIpzLVYBbJALzcU3oAHSCw0qnKLwOZElhZkbW7NiV+cMaHqTfnjY9w3sOkApDLL+y1MJcw==
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
X-Rspamd-Queue-Id: 352CF230AC5
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
	RCPT_COUNT_TWELVE(0.00)[23];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.979];
	FROM_NEQ_ENVFROM(0.00)[vladimir.oltean@nxp.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[nxp.com:+];
	TAGGED_RCPT(0.00)[dri-devel];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,nxp.com:dkim,nxp.com:email,nxp.com:mid]
X-Rspamd-Action: no action

The majority of PHY drivers are PHY providers (obviously).

Some are providers *and* consumers (phy-meson-axg-mipi-dphy,
phy-meson-axg-pcie). These are the Amlogic AXG SoCs, which split the
physical layer into two chained PHYs: the digital layer and the analog
layer. The DSI or PCIe controller interacts only with the digital PHY,
presumably for simplicity.

The rest of PHY drivers which include <linux/phy/phy.h> do so because
they call phy_set_bus_width(), a consumer function.

Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
---
v1->v2: split in two parts to pass through linux-phy mailing list
moderation
---
 drivers/phy/allwinner/phy-sun4i-usb.c                 | 3 ++-
 drivers/phy/allwinner/phy-sun50i-usb3.c               | 3 ++-
 drivers/phy/allwinner/phy-sun6i-mipi-dphy.c           | 4 ++--
 drivers/phy/allwinner/phy-sun9i-usb.c                 | 3 ++-
 drivers/phy/amlogic/phy-meson-axg-mipi-dphy.c         | 2 ++
 drivers/phy/amlogic/phy-meson-axg-mipi-pcie-analog.c  | 3 ++-
 drivers/phy/amlogic/phy-meson-axg-pcie.c              | 2 ++
 drivers/phy/amlogic/phy-meson-g12a-mipi-dphy-analog.c | 3 ++-
 drivers/phy/amlogic/phy-meson-g12a-usb2.c             | 2 ++
 drivers/phy/amlogic/phy-meson-g12a-usb3-pcie.c        | 3 ++-
 drivers/phy/amlogic/phy-meson-gxl-usb2.c              | 3 ++-
 drivers/phy/amlogic/phy-meson8-hdmi-tx.c              | 3 ++-
 drivers/phy/amlogic/phy-meson8b-usb2.c                | 3 ++-
 drivers/phy/apple/atc.c                               | 3 ++-
 drivers/phy/broadcom/phy-bcm-cygnus-pcie.c            | 3 ++-
 drivers/phy/broadcom/phy-bcm-kona-usb2.c              | 4 +++-
 drivers/phy/broadcom/phy-bcm-ns-usb2.c                | 3 ++-
 drivers/phy/broadcom/phy-bcm-ns-usb3.c                | 3 ++-
 drivers/phy/broadcom/phy-bcm-ns2-pcie.c               | 3 ++-
 drivers/phy/broadcom/phy-bcm-ns2-usbdrd.c             | 3 ++-
 drivers/phy/broadcom/phy-bcm-sr-pcie.c                | 3 ++-
 drivers/phy/broadcom/phy-bcm-sr-usb.c                 | 3 ++-
 drivers/phy/broadcom/phy-bcm63xx-usbh.c               | 3 ++-
 drivers/phy/broadcom/phy-brcm-sata.c                  | 3 ++-
 drivers/phy/broadcom/phy-brcm-usb.c                   | 2 +-
 drivers/phy/cadence/cdns-dphy-rx.c                    | 3 ++-
 drivers/phy/cadence/cdns-dphy.c                       | 4 ++--
 drivers/phy/cadence/phy-cadence-salvo.c               | 3 ++-
 drivers/phy/cadence/phy-cadence-sierra.c              | 3 ++-
 drivers/phy/cadence/phy-cadence-torrent.c             | 3 ++-
 drivers/phy/canaan/phy-k230-usb.c                     | 3 ++-
 drivers/phy/eswin/phy-eic7700-sata.c                  | 3 ++-
 drivers/phy/freescale/phy-fsl-imx8-mipi-dphy.c        | 3 ++-
 drivers/phy/freescale/phy-fsl-imx8m-pcie.c            | 4 ++--
 drivers/phy/freescale/phy-fsl-imx8mq-usb.c            | 3 ++-
 drivers/phy/freescale/phy-fsl-imx8qm-hsio.c           | 6 +++---
 drivers/phy/freescale/phy-fsl-imx8qm-lvds-phy.c       | 3 ++-
 drivers/phy/freescale/phy-fsl-lynx-28g.c              | 3 ++-
 drivers/phy/hisilicon/phy-hi3660-usb3.c               | 3 ++-
 drivers/phy/hisilicon/phy-hi3670-pcie.c               | 3 ++-
 drivers/phy/hisilicon/phy-hi3670-usb3.c               | 3 ++-
 drivers/phy/hisilicon/phy-hi6220-usb.c                | 3 ++-
 drivers/phy/hisilicon/phy-hisi-inno-usb2.c            | 4 +++-
 drivers/phy/hisilicon/phy-histb-combphy.c             | 3 ++-
 drivers/phy/hisilicon/phy-hix5hd2-sata.c              | 3 ++-
 drivers/phy/ingenic/phy-ingenic-usb.c                 | 3 ++-
 drivers/phy/intel/phy-intel-keembay-emmc.c            | 3 ++-
 drivers/phy/intel/phy-intel-keembay-usb.c             | 3 ++-
 drivers/phy/intel/phy-intel-lgm-combo.c               | 4 ++--
 drivers/phy/intel/phy-intel-lgm-emmc.c                | 3 ++-
 drivers/phy/lantiq/phy-lantiq-rcu-usb2.c              | 3 ++-
 drivers/phy/lantiq/phy-lantiq-vrx200-pcie.c           | 4 ++--
 drivers/phy/marvell/phy-armada375-usb2.c              | 3 ++-
 drivers/phy/marvell/phy-armada38x-comphy.c            | 3 ++-
 drivers/phy/marvell/phy-berlin-sata.c                 | 3 ++-
 drivers/phy/marvell/phy-berlin-usb.c                  | 3 ++-
 drivers/phy/marvell/phy-mmp3-hsic.c                   | 3 ++-
 drivers/phy/marvell/phy-mmp3-usb.c                    | 3 ++-
 drivers/phy/marvell/phy-mvebu-a3700-comphy.c          | 3 ++-
 drivers/phy/marvell/phy-mvebu-a3700-utmi.c            | 3 ++-
 drivers/phy/marvell/phy-mvebu-cp110-comphy.c          | 3 ++-
 drivers/phy/marvell/phy-mvebu-cp110-utmi.c            | 3 ++-
 drivers/phy/marvell/phy-mvebu-sata.c                  | 3 ++-
 drivers/phy/marvell/phy-pxa-28nm-hsic.c               | 3 ++-
 drivers/phy/marvell/phy-pxa-28nm-usb2.c               | 3 ++-
 drivers/phy/marvell/phy-pxa-usb.c                     | 3 ++-
 drivers/phy/mediatek/phy-mtk-dp.c                     | 3 ++-
 drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c            | 1 -
 drivers/phy/mediatek/phy-mtk-hdmi.h                   | 3 ++-
 drivers/phy/mediatek/phy-mtk-mipi-csi-0-5.c           | 2 +-
 drivers/phy/mediatek/phy-mtk-mipi-dsi.h               | 3 ++-
 drivers/phy/mediatek/phy-mtk-pcie.c                   | 2 +-
 drivers/phy/mediatek/phy-mtk-tphy.c                   | 2 +-
 drivers/phy/mediatek/phy-mtk-ufs.c                    | 2 +-
 drivers/phy/mediatek/phy-mtk-xfi-tphy.c               | 2 +-
 drivers/phy/mediatek/phy-mtk-xsphy.c                  | 2 +-
 drivers/phy/microchip/lan966x_serdes.c                | 4 ++--
 drivers/phy/microchip/sparx5_serdes.c                 | 2 +-
 drivers/phy/motorola/phy-cpcap-usb.c                  | 3 ++-
 drivers/phy/motorola/phy-mapphone-mdm6600.c           | 4 +++-
 drivers/phy/mscc/phy-ocelot-serdes.c                  | 3 ++-
 drivers/phy/nuvoton/phy-ma35d1-usb2.c                 | 3 ++-
 drivers/phy/phy-airoha-pcie.c                         | 2 +-
 drivers/phy/phy-can-transceiver.c                     | 3 ++-
 drivers/phy/phy-core-mipi-dphy.c                      | 4 ++--
 drivers/phy/phy-core.c                                | 2 ++
 drivers/phy/phy-google-usb.c                          | 3 ++-
 drivers/phy/phy-lpc18xx-usb-otg.c                     | 3 ++-
 drivers/phy/phy-nxp-ptn3222.c                         | 3 ++-
 drivers/phy/phy-pistachio-usb.c                       | 4 ++--
 drivers/phy/phy-snps-eusb2.c                          | 2 ++
 drivers/phy/phy-xgene.c                               | 3 ++-
 92 files changed, 177 insertions(+), 97 deletions(-)

diff --git a/drivers/phy/allwinner/phy-sun4i-usb.c b/drivers/phy/allwinner/phy-sun4i-usb.c
index e2fbf8ccf99e..9a03b5944b98 100644
--- a/drivers/phy/allwinner/phy-sun4i-usb.c
+++ b/drivers/phy/allwinner/phy-sun4i-usb.c
@@ -23,7 +23,6 @@
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/of.h>
-#include <linux/phy/phy.h>
 #include <linux/phy/phy-sun4i-usb.h>
 #include <linux/platform_device.h>
 #include <linux/power_supply.h>
@@ -33,6 +32,8 @@
 #include <linux/usb/of.h>
 #include <linux/workqueue.h>
 
+#include "../phy-provider.h"
+
 #define REG_ISCR			0x00
 #define REG_PHYCTL_A10			0x04
 #define REG_PHYBIST			0x08
diff --git a/drivers/phy/allwinner/phy-sun50i-usb3.c b/drivers/phy/allwinner/phy-sun50i-usb3.c
index 363f9a0df503..d38b26e4bf95 100644
--- a/drivers/phy/allwinner/phy-sun50i-usb3.c
+++ b/drivers/phy/allwinner/phy-sun50i-usb3.c
@@ -18,10 +18,11 @@
 #include <linux/io.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/reset.h>
 
+#include "../phy-provider.h"
+
 /* Interface Status and Control Registers */
 #define SUNXI_ISCR			0x00
 #define SUNXI_PIPE_CLOCK_CONTROL	0x14
diff --git a/drivers/phy/allwinner/phy-sun6i-mipi-dphy.c b/drivers/phy/allwinner/phy-sun6i-mipi-dphy.c
index 36eab95271b2..e96162d078eb 100644
--- a/drivers/phy/allwinner/phy-sun6i-mipi-dphy.c
+++ b/drivers/phy/allwinner/phy-sun6i-mipi-dphy.c
@@ -10,12 +10,12 @@
 #include <linux/clk.h>
 #include <linux/module.h>
 #include <linux/of_address.h>
+#include <linux/phy/phy-mipi-dphy.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/reset.h>
 
-#include <linux/phy/phy.h>
-#include <linux/phy/phy-mipi-dphy.h>
+#include "../phy-provider.h"
 
 #define SUN6I_DPHY_GCTL_REG		0x00
 #define SUN6I_DPHY_GCTL_LANE_NUM(n)		((((n) - 1) & 3) << 4)
diff --git a/drivers/phy/allwinner/phy-sun9i-usb.c b/drivers/phy/allwinner/phy-sun9i-usb.c
index 2f9e60c188b8..f667f3f4b307 100644
--- a/drivers/phy/allwinner/phy-sun9i-usb.c
+++ b/drivers/phy/allwinner/phy-sun9i-usb.c
@@ -15,11 +15,12 @@
 #include <linux/err.h>
 #include <linux/io.h>
 #include <linux/module.h>
-#include <linux/phy/phy.h>
 #include <linux/usb/of.h>
 #include <linux/platform_device.h>
 #include <linux/reset.h>
 
+#include "../phy-provider.h"
+
 #define SUNXI_AHB_INCR16_BURST_EN	BIT(11)
 #define SUNXI_AHB_INCR8_BURST_EN	BIT(10)
 #define SUNXI_AHB_INCR4_BURST_EN	BIT(9)
diff --git a/drivers/phy/amlogic/phy-meson-axg-mipi-dphy.c b/drivers/phy/amlogic/phy-meson-axg-mipi-dphy.c
index c4a56b9d3289..60d17973a38f 100644
--- a/drivers/phy/amlogic/phy-meson-axg-mipi-dphy.c
+++ b/drivers/phy/amlogic/phy-meson-axg-mipi-dphy.c
@@ -20,6 +20,8 @@
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 
+#include "../phy-provider.h"
+
 /* [31] soft reset for the phy.
  *		1: reset. 0: dessert the reset.
  * [30] clock lane soft reset.
diff --git a/drivers/phy/amlogic/phy-meson-axg-mipi-pcie-analog.c b/drivers/phy/amlogic/phy-meson-axg-mipi-pcie-analog.c
index c0ba2852dbb8..21e8e2a5563a 100644
--- a/drivers/phy/amlogic/phy-meson-axg-mipi-pcie-analog.c
+++ b/drivers/phy/amlogic/phy-meson-axg-mipi-pcie-analog.c
@@ -7,7 +7,6 @@
 #include <linux/bitfield.h>
 #include <linux/bitops.h>
 #include <linux/module.h>
-#include <linux/phy/phy.h>
 #include <linux/regmap.h>
 #include <linux/delay.h>
 #include <linux/mfd/syscon.h>
@@ -15,6 +14,8 @@
 #include <linux/platform_device.h>
 #include <dt-bindings/phy/phy.h>
 
+#include "../phy-provider.h"
+
 #define HHI_MIPI_CNTL0 0x00
 #define		HHI_MIPI_CNTL0_COMMON_BLOCK	GENMASK(31, 28)
 #define		HHI_MIPI_CNTL0_ENABLE		BIT(29)
diff --git a/drivers/phy/amlogic/phy-meson-axg-pcie.c b/drivers/phy/amlogic/phy-meson-axg-pcie.c
index 14dee73f9cb5..c4d9faf3a805 100644
--- a/drivers/phy/amlogic/phy-meson-axg-pcie.c
+++ b/drivers/phy/amlogic/phy-meson-axg-pcie.c
@@ -13,6 +13,8 @@
 #include <linux/bitfield.h>
 #include <dt-bindings/phy/phy.h>
 
+#include "../phy-provider.h"
+
 #define MESON_PCIE_REG0 0x00
 #define		MESON_PCIE_COMMON_CLK	BIT(4)
 #define		MESON_PCIE_PORT_SEL	GENMASK(3, 2)
diff --git a/drivers/phy/amlogic/phy-meson-g12a-mipi-dphy-analog.c b/drivers/phy/amlogic/phy-meson-g12a-mipi-dphy-analog.c
index 46e5f7e7eb6c..11626f4528dd 100644
--- a/drivers/phy/amlogic/phy-meson-g12a-mipi-dphy-analog.c
+++ b/drivers/phy/amlogic/phy-meson-g12a-mipi-dphy-analog.c
@@ -9,7 +9,6 @@
 #include <linux/bitfield.h>
 #include <linux/bitops.h>
 #include <linux/module.h>
-#include <linux/phy/phy.h>
 #include <linux/regmap.h>
 #include <linux/delay.h>
 #include <linux/mfd/syscon.h>
@@ -17,6 +16,8 @@
 #include <linux/platform_device.h>
 #include <dt-bindings/phy/phy.h>
 
+#include "../phy-provider.h"
+
 #define HHI_MIPI_CNTL0 0x00
 #define		HHI_MIPI_CNTL0_DIF_REF_CTL1	GENMASK(31, 16)
 #define		HHI_MIPI_CNTL0_DIF_REF_CTL0	GENMASK(15, 0)
diff --git a/drivers/phy/amlogic/phy-meson-g12a-usb2.c b/drivers/phy/amlogic/phy-meson-g12a-usb2.c
index 66bf0b7ef8ed..6e599b933153 100644
--- a/drivers/phy/amlogic/phy-meson-g12a-usb2.c
+++ b/drivers/phy/amlogic/phy-meson-g12a-usb2.c
@@ -20,6 +20,8 @@
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 
+#include "../phy-provider.h"
+
 #define PHY_CTRL_R0						0x0
 #define PHY_CTRL_R1						0x4
 #define PHY_CTRL_R2						0x8
diff --git a/drivers/phy/amlogic/phy-meson-g12a-usb3-pcie.c b/drivers/phy/amlogic/phy-meson-g12a-usb3-pcie.c
index 5468831d6ab9..60e9c3c1c449 100644
--- a/drivers/phy/amlogic/phy-meson-g12a-usb3-pcie.c
+++ b/drivers/phy/amlogic/phy-meson-g12a-usb3-pcie.c
@@ -12,12 +12,13 @@
 #include <linux/clk.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/phy/phy.h>
 #include <linux/regmap.h>
 #include <linux/reset.h>
 #include <linux/platform_device.h>
 #include <dt-bindings/phy/phy.h>
 
+#include "../phy-provider.h"
+
 #define PHY_R0							0x00
 	#define PHY_R0_PCIE_POWER_STATE				GENMASK(4, 0)
 	#define PHY_R0_PCIE_USB3_SWITCH				GENMASK(6, 5)
diff --git a/drivers/phy/amlogic/phy-meson-gxl-usb2.c b/drivers/phy/amlogic/phy-meson-gxl-usb2.c
index 6b390304f723..b8d5b12cffc8 100644
--- a/drivers/phy/amlogic/phy-meson-gxl-usb2.c
+++ b/drivers/phy/amlogic/phy-meson-gxl-usb2.c
@@ -12,9 +12,10 @@
 #include <linux/module.h>
 #include <linux/regmap.h>
 #include <linux/reset.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 
+#include "../phy-provider.h"
+
 /* bits [31:27] are read-only */
 #define U2P_R0							0x0
 	#define U2P_R0_BYPASS_SEL				BIT(0)
diff --git a/drivers/phy/amlogic/phy-meson8-hdmi-tx.c b/drivers/phy/amlogic/phy-meson8-hdmi-tx.c
index 2617f7f6c2ec..2a8c93dcda7e 100644
--- a/drivers/phy/amlogic/phy-meson8-hdmi-tx.c
+++ b/drivers/phy/amlogic/phy-meson8-hdmi-tx.c
@@ -11,11 +11,12 @@
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/property.h>
 #include <linux/regmap.h>
 
+#include "../phy-provider.h"
+
 /*
  * Unfortunately there is no detailed documentation available for the
  * HHI_HDMI_PHY_CNTL0 register. CTL0 and CTL1 is all we know about.
diff --git a/drivers/phy/amlogic/phy-meson8b-usb2.c b/drivers/phy/amlogic/phy-meson8b-usb2.c
index a553231a9f7c..b288868b2d9e 100644
--- a/drivers/phy/amlogic/phy-meson8b-usb2.c
+++ b/drivers/phy/amlogic/phy-meson8b-usb2.c
@@ -14,10 +14,11 @@
 #include <linux/property.h>
 #include <linux/regmap.h>
 #include <linux/reset.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/usb/of.h>
 
+#include "../phy-provider.h"
+
 #define REG_CONFIG					0x00
 	#define REG_CONFIG_CLK_EN			BIT(0)
 	#define REG_CONFIG_CLK_SEL_MASK			GENMASK(3, 1)
diff --git a/drivers/phy/apple/atc.c b/drivers/phy/apple/atc.c
index e9d106f135c5..de9453d13c0e 100644
--- a/drivers/phy/apple/atc.c
+++ b/drivers/phy/apple/atc.c
@@ -32,7 +32,6 @@
 #include <linux/mutex.h>
 #include <linux/of.h>
 #include <linux/of_device.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/reset-controller.h>
 #include <linux/soc/apple/tunable.h>
@@ -44,6 +43,8 @@
 #include <linux/usb/typec_mux.h>
 #include <linux/usb/typec_tbt.h>
 
+#include "../phy-provider.h"
+
 #define AUSPLL_FSM_CTRL 0x1014
 
 #define AUSPLL_APB_CMD_OVERRIDE 0x2000
diff --git a/drivers/phy/broadcom/phy-bcm-cygnus-pcie.c b/drivers/phy/broadcom/phy-bcm-cygnus-pcie.c
index 462c61a24ec5..e10274f53c10 100644
--- a/drivers/phy/broadcom/phy-bcm-cygnus-pcie.c
+++ b/drivers/phy/broadcom/phy-bcm-cygnus-pcie.c
@@ -5,9 +5,10 @@
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 
+#include "../phy-provider.h"
+
 #define PCIE_CFG_OFFSET         0x00
 #define PCIE1_PHY_IDDQ_SHIFT    10
 #define PCIE0_PHY_IDDQ_SHIFT    2
diff --git a/drivers/phy/broadcom/phy-bcm-kona-usb2.c b/drivers/phy/broadcom/phy-bcm-kona-usb2.c
index e9cc5f2cb89a..356f42a08941 100644
--- a/drivers/phy/broadcom/phy-bcm-kona-usb2.c
+++ b/drivers/phy/broadcom/phy-bcm-kona-usb2.c
@@ -12,9 +12,11 @@
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/phy/phy.h>
+#include <linux/phy/phy.h> /* for phy_set_bus_width() */
 #include <linux/platform_device.h>
 
+#include "../phy-provider.h"
+
 #define OTGCTL			(0)
 #define OTGCTL_OTGSTAT2		BIT(31)
 #define OTGCTL_OTGSTAT1		BIT(30)
diff --git a/drivers/phy/broadcom/phy-bcm-ns-usb2.c b/drivers/phy/broadcom/phy-bcm-ns-usb2.c
index c5d35031b398..95331d08b367 100644
--- a/drivers/phy/broadcom/phy-bcm-ns-usb2.c
+++ b/drivers/phy/broadcom/phy-bcm-ns-usb2.c
@@ -13,11 +13,12 @@
 #include <linux/module.h>
 #include <linux/of_address.h>
 #include <linux/of_platform.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/slab.h>
 
+#include "../phy-provider.h"
+
 struct bcm_ns_usb2 {
 	struct device *dev;
 	struct clk *ref_clk;
diff --git a/drivers/phy/broadcom/phy-bcm-ns-usb3.c b/drivers/phy/broadcom/phy-bcm-ns-usb3.c
index 6e56498d0644..f2aa4014f197 100644
--- a/drivers/phy/broadcom/phy-bcm-ns-usb3.c
+++ b/drivers/phy/broadcom/phy-bcm-ns-usb3.c
@@ -19,10 +19,11 @@
 #include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/platform_device.h>
-#include <linux/phy/phy.h>
 #include <linux/property.h>
 #include <linux/slab.h>
 
+#include "../phy-provider.h"
+
 #define BCM_NS_USB3_PHY_BASE_ADDR_REG	0x1f
 #define BCM_NS_USB3_PHY_PLL30_BLOCK	0x8000
 #define BCM_NS_USB3_PHY_TX_PMD_BLOCK	0x8040
diff --git a/drivers/phy/broadcom/phy-bcm-ns2-pcie.c b/drivers/phy/broadcom/phy-bcm-ns2-pcie.c
index 67a6ae5ecba0..9c2c603426ca 100644
--- a/drivers/phy/broadcom/phy-bcm-ns2-pcie.c
+++ b/drivers/phy/broadcom/phy-bcm-ns2-pcie.c
@@ -6,7 +6,8 @@
 #include <linux/of_mdio.h>
 #include <linux/mdio.h>
 #include <linux/phy.h>
-#include <linux/phy/phy.h>
+
+#include "../phy-provider.h"
 
 #define BLK_ADDR_REG_OFFSET	0x1f
 #define PLL_AFE1_100MHZ_BLK	0x2100
diff --git a/drivers/phy/broadcom/phy-bcm-ns2-usbdrd.c b/drivers/phy/broadcom/phy-bcm-ns2-usbdrd.c
index 8473fa574529..7543211fb998 100644
--- a/drivers/phy/broadcom/phy-bcm-ns2-usbdrd.c
+++ b/drivers/phy/broadcom/phy-bcm-ns2-usbdrd.c
@@ -14,12 +14,13 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/slab.h>
 #include <linux/workqueue.h>
 
+#include "../phy-provider.h"
+
 #define ICFG_DRD_AFE		0x0
 #define ICFG_MISC_STAT		0x18
 #define ICFG_DRD_P0CTL		0x1C
diff --git a/drivers/phy/broadcom/phy-bcm-sr-pcie.c b/drivers/phy/broadcom/phy-bcm-sr-pcie.c
index 706e1d83b4ce..8f4e44d1dea6 100644
--- a/drivers/phy/broadcom/phy-bcm-sr-pcie.c
+++ b/drivers/phy/broadcom/phy-bcm-sr-pcie.c
@@ -9,10 +9,11 @@
 #include <linux/module.h>
 #include <linux/mfd/syscon.h>
 #include <linux/of.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 
+#include "../phy-provider.h"
+
 /* we have up to 8 PAXB based RC. The 9th one is always PAXC */
 #define SR_NR_PCIE_PHYS               9
 #define SR_PAXC_PHY_IDX               (SR_NR_PCIE_PHYS - 1)
diff --git a/drivers/phy/broadcom/phy-bcm-sr-usb.c b/drivers/phy/broadcom/phy-bcm-sr-usb.c
index 6bcfe83609c8..4c863738bdca 100644
--- a/drivers/phy/broadcom/phy-bcm-sr-usb.c
+++ b/drivers/phy/broadcom/phy-bcm-sr-usb.c
@@ -8,9 +8,10 @@
 #include <linux/iopoll.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 
+#include "../phy-provider.h"
+
 enum bcm_usb_phy_version {
 	BCM_SR_USB_COMBO_PHY,
 	BCM_SR_USB_HS_PHY,
diff --git a/drivers/phy/broadcom/phy-bcm63xx-usbh.c b/drivers/phy/broadcom/phy-bcm63xx-usbh.c
index 29fd6791bae6..63099da486c6 100644
--- a/drivers/phy/broadcom/phy-bcm63xx-usbh.c
+++ b/drivers/phy/broadcom/phy-bcm63xx-usbh.c
@@ -18,10 +18,11 @@
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/reset.h>
 
+#include "../phy-provider.h"
+
 /* USBH control register offsets */
 enum usbh_regs {
 	USBH_BRT_CONTROL1 = 0,
diff --git a/drivers/phy/broadcom/phy-brcm-sata.c b/drivers/phy/broadcom/phy-brcm-sata.c
index fb69e21a0292..ab826f9c8678 100644
--- a/drivers/phy/broadcom/phy-brcm-sata.c
+++ b/drivers/phy/broadcom/phy-brcm-sata.c
@@ -13,9 +13,10 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 
+#include "../phy-provider.h"
+
 #define SATA_PCB_BANK_OFFSET				0x23c
 #define SATA_PCB_REG_OFFSET(ofs)			((ofs) * 4)
 
diff --git a/drivers/phy/broadcom/phy-brcm-usb.c b/drivers/phy/broadcom/phy-brcm-usb.c
index 59d756a10d6c..d660a0ed03ee 100644
--- a/drivers/phy/broadcom/phy-brcm-usb.c
+++ b/drivers/phy/broadcom/phy-brcm-usb.c
@@ -11,7 +11,6 @@
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/interrupt.h>
 #include <linux/soc/brcmstb/brcmstb.h>
@@ -19,6 +18,7 @@
 #include <linux/mfd/syscon.h>
 #include <linux/suspend.h>
 
+#include "../phy-provider.h"
 #include "phy-brcm-usb-init.h"
 
 static DEFINE_MUTEX(sysfs_lock);
diff --git a/drivers/phy/cadence/cdns-dphy-rx.c b/drivers/phy/cadence/cdns-dphy-rx.c
index 3ac80141189c..7097ac17443f 100644
--- a/drivers/phy/cadence/cdns-dphy-rx.c
+++ b/drivers/phy/cadence/cdns-dphy-rx.c
@@ -9,12 +9,13 @@
 #include <linux/iopoll.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
-#include <linux/phy/phy.h>
 #include <linux/phy/phy-mipi-dphy.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/sys_soc.h>
 
+#include "../phy-provider.h"
+
 #define DPHY_PMA_CMN(reg)		(reg)
 #define DPHY_PCS(reg)			(0xb00 + (reg))
 #define DPHY_ISO(reg)			(0xc00 + (reg))
diff --git a/drivers/phy/cadence/cdns-dphy.c b/drivers/phy/cadence/cdns-dphy.c
index d5b0e516b93c..40bc18405082 100644
--- a/drivers/phy/cadence/cdns-dphy.c
+++ b/drivers/phy/cadence/cdns-dphy.c
@@ -10,11 +10,11 @@
 #include <linux/iopoll.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/phy/phy-mipi-dphy.h>
 #include <linux/platform_device.h>
 #include <linux/reset.h>
 
-#include <linux/phy/phy.h>
-#include <linux/phy/phy-mipi-dphy.h>
+#include "../phy-provider.h"
 
 #define REG_WAKEUP_TIME_NS		800
 #define DPHY_PLL_RATE_HZ		108000000
diff --git a/drivers/phy/cadence/phy-cadence-salvo.c b/drivers/phy/cadence/phy-cadence-salvo.c
index f461585c84c6..8ed74db50dfa 100644
--- a/drivers/phy/cadence/phy-cadence-salvo.c
+++ b/drivers/phy/cadence/phy-cadence-salvo.c
@@ -10,12 +10,13 @@
 #include <linux/clk.h>
 #include <linux/io.h>
 #include <linux/module.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/delay.h>
 #include <linux/of.h>
 #include <linux/of_platform.h>
 
+#include "../phy-provider.h"
+
 #define USB3_PHY_OFFSET			0x0
 #define USB2_PHY_OFFSET			0x38000
 /* USB3 PHY register definition */
diff --git a/drivers/phy/cadence/phy-cadence-sierra.c b/drivers/phy/cadence/phy-cadence-sierra.c
index 92ab1a31646a..fb44b8fc5e3f 100644
--- a/drivers/phy/cadence/phy-cadence-sierra.c
+++ b/drivers/phy/cadence/phy-cadence-sierra.c
@@ -12,7 +12,6 @@
 #include <linux/err.h>
 #include <linux/io.h>
 #include <linux/module.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
@@ -23,6 +22,8 @@
 #include <dt-bindings/phy/phy.h>
 #include <dt-bindings/phy/phy-cadence.h>
 
+#include "../phy-provider.h"
+
 #define NUM_SSC_MODE		3
 #define NUM_PHY_TYPE		5
 
diff --git a/drivers/phy/cadence/phy-cadence-torrent.c b/drivers/phy/cadence/phy-cadence-torrent.c
index d446a0f97688..974e12e34ae1 100644
--- a/drivers/phy/cadence/phy-cadence-torrent.c
+++ b/drivers/phy/cadence/phy-cadence-torrent.c
@@ -17,11 +17,12 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/reset.h>
 #include <linux/regmap.h>
 
+#include "../phy-provider.h"
+
 #define REF_CLK_19_2MHZ		19200000
 #define REF_CLK_25MHZ		25000000
 #define REF_CLK_100MHZ		100000000
diff --git a/drivers/phy/canaan/phy-k230-usb.c b/drivers/phy/canaan/phy-k230-usb.c
index 52dad35fc6cf..4305763a5456 100644
--- a/drivers/phy/canaan/phy-k230-usb.c
+++ b/drivers/phy/canaan/phy-k230-usb.c
@@ -8,9 +8,10 @@
 #include <linux/bitfield.h>
 #include <linux/io.h>
 #include <linux/of_address.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 
+#include "../phy-provider.h"
+
 #define MAX_PHYS		2
 
 /* Register offsets within the HiSysConfig system controller */
diff --git a/drivers/phy/eswin/phy-eic7700-sata.c b/drivers/phy/eswin/phy-eic7700-sata.c
index c33653d48daa..387d5c8c11d9 100644
--- a/drivers/phy/eswin/phy-eic7700-sata.c
+++ b/drivers/phy/eswin/phy-eic7700-sata.c
@@ -14,11 +14,12 @@
 #include <linux/io.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/reset.h>
 
+#include "../phy-provider.h"
+
 #define SATA_AXI_LP_CTRL			0x08
 #define SATA_MPLL_CTRL				0x20
 #define SATA_P0_PHY_STAT			0x24
diff --git a/drivers/phy/freescale/phy-fsl-imx8-mipi-dphy.c b/drivers/phy/freescale/phy-fsl-imx8-mipi-dphy.c
index 0928a526e2ab..314aa227f753 100644
--- a/drivers/phy/freescale/phy-fsl-imx8-mipi-dphy.c
+++ b/drivers/phy/freescale/phy-fsl-imx8-mipi-dphy.c
@@ -16,11 +16,12 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_platform.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <dt-bindings/firmware/imx/rsrc.h>
 
+#include "../phy-provider.h"
+
 /* Control and Status Registers(CSR) */
 #define PHY_CTRL			0x00
 #define  CCM_MASK			GENMASK(7, 5)
diff --git a/drivers/phy/freescale/phy-fsl-imx8m-pcie.c b/drivers/phy/freescale/phy-fsl-imx8m-pcie.c
index 7f5600103a00..6197cfc9b9a4 100644
--- a/drivers/phy/freescale/phy-fsl-imx8m-pcie.c
+++ b/drivers/phy/freescale/phy-fsl-imx8m-pcie.c
@@ -3,6 +3,7 @@
  * Copyright 2021 NXP
  */
 
+#include <dt-bindings/phy/phy-imx8-pcie.h>
 #include <linux/bitfield.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
@@ -12,12 +13,11 @@
 #include <linux/mfd/syscon/imx7-iomuxc-gpr.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/reset.h>
 
-#include <dt-bindings/phy/phy-imx8-pcie.h>
+#include "../phy-provider.h"
 
 #define IMX8MM_PCIE_PHY_CMN_REG061	0x184
 #define  ANA_PLL_CLK_OUT_TO_EXT_IO_EN	BIT(0)
diff --git a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
index b05d80e849a1..9b938b446996 100644
--- a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
+++ b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
@@ -7,11 +7,12 @@
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/regulator/consumer.h>
 #include <linux/usb/typec_mux.h>
 
+#include "../phy-provider.h"
+
 #define PHY_CTRL0			0x0
 #define PHY_CTRL0_REF_SSP_EN		BIT(2)
 #define PHY_CTRL0_FSEL_MASK		GENMASK(10, 5)
diff --git a/drivers/phy/freescale/phy-fsl-imx8qm-hsio.c b/drivers/phy/freescale/phy-fsl-imx8qm-hsio.c
index 279b8ac7822d..b274fd24b59a 100644
--- a/drivers/phy/freescale/phy-fsl-imx8qm-hsio.c
+++ b/drivers/phy/freescale/phy-fsl-imx8qm-hsio.c
@@ -3,6 +3,8 @@
  * Copyright 2024 NXP
  */
 
+#include <dt-bindings/phy/phy.h>
+#include <dt-bindings/phy/phy-imx8-pcie.h>
 #include <linux/bitfield.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
@@ -11,13 +13,11 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/pci_regs.h>
-#include <linux/phy/phy.h>
 #include <linux/phy/pcie.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 
-#include <dt-bindings/phy/phy.h>
-#include <dt-bindings/phy/phy-imx8-pcie.h>
+#include "../phy-provider.h"
 
 #define MAX_NUM_LANE	3
 #define LANE_NUM_CLKS	5
diff --git a/drivers/phy/freescale/phy-fsl-imx8qm-lvds-phy.c b/drivers/phy/freescale/phy-fsl-imx8qm-lvds-phy.c
index ece357443521..55c23bef5121 100644
--- a/drivers/phy/freescale/phy-fsl-imx8qm-lvds-phy.c
+++ b/drivers/phy/freescale/phy-fsl-imx8qm-lvds-phy.c
@@ -9,12 +9,13 @@
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 #include <linux/units.h>
 
+#include "../phy-provider.h"
+
 #define REG_SET		0x4
 #define REG_CLR		0x8
 
diff --git a/drivers/phy/freescale/phy-fsl-lynx-28g.c b/drivers/phy/freescale/phy-fsl-lynx-28g.c
index 2b0fd95ba62f..c4df5966ddfb 100644
--- a/drivers/phy/freescale/phy-fsl-lynx-28g.c
+++ b/drivers/phy/freescale/phy-fsl-lynx-28g.c
@@ -5,10 +5,11 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/phy.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/workqueue.h>
 
+#include "../phy-provider.h"
+
 #define LYNX_28G_NUM_LANE			8
 #define LYNX_28G_NUM_PLL			2
 
diff --git a/drivers/phy/hisilicon/phy-hi3660-usb3.c b/drivers/phy/hisilicon/phy-hi3660-usb3.c
index e2a09d67faed..b66ff3be1aed 100644
--- a/drivers/phy/hisilicon/phy-hi3660-usb3.c
+++ b/drivers/phy/hisilicon/phy-hi3660-usb3.c
@@ -12,10 +12,11 @@
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 
+#include "../phy-provider.h"
+
 #define PERI_CRG_CLK_EN4			0x40
 #define PERI_CRG_CLK_DIS4			0x44
 #define GT_CLK_USB3OTG_REF			BIT(0)
diff --git a/drivers/phy/hisilicon/phy-hi3670-pcie.c b/drivers/phy/hisilicon/phy-hi3670-pcie.c
index dbc7dcce682b..b7cf44078e0d 100644
--- a/drivers/phy/hisilicon/phy-hi3670-pcie.c
+++ b/drivers/phy/hisilicon/phy-hi3670-pcie.c
@@ -26,11 +26,12 @@
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/types.h>
 
+#include "../phy-provider.h"
+
 #define AXI_CLK_FREQ				207500000
 #define REF_CLK_FREQ				100000000
 
diff --git a/drivers/phy/hisilicon/phy-hi3670-usb3.c b/drivers/phy/hisilicon/phy-hi3670-usb3.c
index 40d3cf128b44..004c51500597 100644
--- a/drivers/phy/hisilicon/phy-hi3670-usb3.c
+++ b/drivers/phy/hisilicon/phy-hi3670-usb3.c
@@ -14,10 +14,11 @@
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 
+#include "../phy-provider.h"
+
 #define SCTRL_SCDEEPSLEEPED		(0x0)
 #define USB_CLK_SELECTED		BIT(20)
 
diff --git a/drivers/phy/hisilicon/phy-hi6220-usb.c b/drivers/phy/hisilicon/phy-hi6220-usb.c
index 22d8d8a8dabe..1b5a2d3e3e44 100644
--- a/drivers/phy/hisilicon/phy-hi6220-usb.c
+++ b/drivers/phy/hisilicon/phy-hi6220-usb.c
@@ -8,9 +8,10 @@
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
-#include <linux/phy/phy.h>
 #include <linux/regmap.h>
 
+#include "../phy-provider.h"
+
 #define SC_PERIPH_CTRL4			0x00c
 
 #define CTRL4_PICO_SIDDQ		BIT(6)
diff --git a/drivers/phy/hisilicon/phy-hisi-inno-usb2.c b/drivers/phy/hisilicon/phy-hisi-inno-usb2.c
index c843923252aa..4a4701d0fc9c 100644
--- a/drivers/phy/hisilicon/phy-hisi-inno-usb2.c
+++ b/drivers/phy/hisilicon/phy-hisi-inno-usb2.c
@@ -10,10 +10,12 @@
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/phy/phy.h>
+#include <linux/phy/phy.h> /* for phy_set_bus_width() */
 #include <linux/platform_device.h>
 #include <linux/reset.h>
 
+#include "../phy-provider.h"
+
 #define INNO_PHY_PORT_NUM	2
 #define REF_CLK_STABLE_TIME	100	/* unit:us */
 #define UTMI_CLK_STABLE_TIME	200	/* unit:us */
diff --git a/drivers/phy/hisilicon/phy-histb-combphy.c b/drivers/phy/hisilicon/phy-histb-combphy.c
index 9dd0bd00b4e4..9b6ed1644d74 100644
--- a/drivers/phy/hisilicon/phy-histb-combphy.c
+++ b/drivers/phy/hisilicon/phy-histb-combphy.c
@@ -14,12 +14,13 @@
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/reset.h>
 #include <dt-bindings/phy/phy.h>
 
+#include "../phy-provider.h"
+
 #define COMBPHY_MODE_PCIE		0
 #define COMBPHY_MODE_USB3		1
 #define COMBPHY_MODE_SATA		2
diff --git a/drivers/phy/hisilicon/phy-hix5hd2-sata.c b/drivers/phy/hisilicon/phy-hix5hd2-sata.c
index 1b26ddb4c8a7..57994f69417d 100644
--- a/drivers/phy/hisilicon/phy-hix5hd2-sata.c
+++ b/drivers/phy/hisilicon/phy-hix5hd2-sata.c
@@ -9,10 +9,11 @@
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 
+#include "../phy-provider.h"
+
 #define SATA_PHY0_CTLL		0xa0
 #define MPLL_MULTIPLIER_SHIFT	1
 #define MPLL_MULTIPLIER_MASK	0xfe
diff --git a/drivers/phy/ingenic/phy-ingenic-usb.c b/drivers/phy/ingenic/phy-ingenic-usb.c
index 7e62d46850fd..d656f97729c4 100644
--- a/drivers/phy/ingenic/phy-ingenic-usb.c
+++ b/drivers/phy/ingenic/phy-ingenic-usb.c
@@ -12,10 +12,11 @@
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/regulator/consumer.h>
 
+#include "../phy-provider.h"
+
 /* OTGPHY register offsets */
 #define REG_USBPCR_OFFSET			0x00
 #define REG_USBRDT_OFFSET			0x04
diff --git a/drivers/phy/intel/phy-intel-keembay-emmc.c b/drivers/phy/intel/phy-intel-keembay-emmc.c
index 0eb11ac7c2e2..fdba1d050439 100644
--- a/drivers/phy/intel/phy-intel-keembay-emmc.c
+++ b/drivers/phy/intel/phy-intel-keembay-emmc.c
@@ -11,10 +11,11 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 
+#include "../phy-provider.h"
+
 /* eMMC/SD/SDIO core/phy configuration registers */
 #define PHY_CFG_0		0x24
 #define  SEL_DLY_TXCLK_MASK	BIT(29)
diff --git a/drivers/phy/intel/phy-intel-keembay-usb.c b/drivers/phy/intel/phy-intel-keembay-usb.c
index c8b05f7b2445..4e690f3eb560 100644
--- a/drivers/phy/intel/phy-intel-keembay-usb.c
+++ b/drivers/phy/intel/phy-intel-keembay-usb.c
@@ -10,10 +10,11 @@
 #include <linux/delay.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 
+#include "../phy-provider.h"
+
 /* USS (USB Subsystem) clock control registers */
 #define USS_CPR_CLK_EN		0x00
 #define USS_CPR_CLK_SET		0x04
diff --git a/drivers/phy/intel/phy-intel-lgm-combo.c b/drivers/phy/intel/phy-intel-lgm-combo.c
index 9ee3cf61cdd0..2a8b0caa0e59 100644
--- a/drivers/phy/intel/phy-intel-lgm-combo.c
+++ b/drivers/phy/intel/phy-intel-lgm-combo.c
@@ -5,6 +5,7 @@
  * Copyright (C) 2019-2020 Intel Corporation.
  */
 
+#include <dt-bindings/phy/phy.h>
 #include <linux/bitfield.h>
 #include <linux/clk.h>
 #include <linux/iopoll.h>
@@ -12,12 +13,11 @@
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/of.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/reset.h>
 
-#include <dt-bindings/phy/phy.h>
+#include "../phy-provider.h"
 
 #define PCIE_PHY_GEN_CTRL	0x00
 #define PCIE_PHY_CLK_PAD	BIT(17)
diff --git a/drivers/phy/intel/phy-intel-lgm-emmc.c b/drivers/phy/intel/phy-intel-lgm-emmc.c
index 703aeb122541..479a530dd630 100644
--- a/drivers/phy/intel/phy-intel-lgm-emmc.c
+++ b/drivers/phy/intel/phy-intel-lgm-emmc.c
@@ -11,10 +11,11 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 
+#include "../phy-provider.h"
+
 /* eMMC phy register definitions */
 #define EMMC_PHYCTRL0_REG	0xa8
 #define DR_TY_MASK		GENMASK(30, 28)
diff --git a/drivers/phy/lantiq/phy-lantiq-rcu-usb2.c b/drivers/phy/lantiq/phy-lantiq-rcu-usb2.c
index 82f1ffc0b0ad..eb6c201f7c87 100644
--- a/drivers/phy/lantiq/phy-lantiq-rcu-usb2.c
+++ b/drivers/phy/lantiq/phy-lantiq-rcu-usb2.c
@@ -12,12 +12,13 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/property.h>
 #include <linux/regmap.h>
 #include <linux/reset.h>
 
+#include "../phy-provider.h"
+
 /* Transmitter HS Pre-Emphasis Enable */
 #define RCU_CFG1_TX_PEE		BIT(0)
 /* Disconnect Threshold */
diff --git a/drivers/phy/lantiq/phy-lantiq-vrx200-pcie.c b/drivers/phy/lantiq/phy-lantiq-vrx200-pcie.c
index 406a87c8b759..70da76399e30 100644
--- a/drivers/phy/lantiq/phy-lantiq-vrx200-pcie.c
+++ b/drivers/phy/lantiq/phy-lantiq-vrx200-pcie.c
@@ -11,6 +11,7 @@
  * TODO: PHY modes other than 36MHz (without "SSC")
  */
 
+#include <dt-bindings/phy/phy-lantiq-vrx200-pcie.h>
 #include <linux/bitfield.h>
 #include <linux/bits.h>
 #include <linux/clk.h>
@@ -18,13 +19,12 @@
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/property.h>
 #include <linux/regmap.h>
 #include <linux/reset.h>
 
-#include <dt-bindings/phy/phy-lantiq-vrx200-pcie.h>
+#include "../phy-provider.h"
 
 #define PCIE_PHY_PLL_CTRL1				0x44
 
diff --git a/drivers/phy/marvell/phy-armada375-usb2.c b/drivers/phy/marvell/phy-armada375-usb2.c
index 3731f9b25655..d5c100096c3d 100644
--- a/drivers/phy/marvell/phy-armada375-usb2.c
+++ b/drivers/phy/marvell/phy-armada375-usb2.c
@@ -16,9 +16,10 @@
 #include <linux/io.h>
 #include <linux/kernel.h>
 #include <linux/of_address.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 
+#include "../phy-provider.h"
+
 #define USB2_PHY_CONFIG_DISABLE BIT(0)
 
 struct armada375_cluster_phy {
diff --git a/drivers/phy/marvell/phy-armada38x-comphy.c b/drivers/phy/marvell/phy-armada38x-comphy.c
index 5063361b0120..9653863f90bb 100644
--- a/drivers/phy/marvell/phy-armada38x-comphy.c
+++ b/drivers/phy/marvell/phy-armada38x-comphy.c
@@ -9,10 +9,11 @@
 #include <linux/iopoll.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/phy/phy.h>
 #include <linux/phy.h>
 #include <linux/platform_device.h>
 
+#include "../phy-provider.h"
+
 #define MAX_A38X_COMPHY	6
 #define MAX_A38X_PORTS	3
 
diff --git a/drivers/phy/marvell/phy-berlin-sata.c b/drivers/phy/marvell/phy-berlin-sata.c
index c90e2867900c..4d4013d115ca 100644
--- a/drivers/phy/marvell/phy-berlin-sata.c
+++ b/drivers/phy/marvell/phy-berlin-sata.c
@@ -10,10 +10,11 @@
 #include <linux/clk.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/phy/phy.h>
 #include <linux/io.h>
 #include <linux/platform_device.h>
 
+#include "../phy-provider.h"
+
 #define HOST_VSA_ADDR		0x0
 #define HOST_VSA_DATA		0x4
 #define PORT_SCR_CTL		0x2c
diff --git a/drivers/phy/marvell/phy-berlin-usb.c b/drivers/phy/marvell/phy-berlin-usb.c
index f26bf630da2c..a3e58deaaa74 100644
--- a/drivers/phy/marvell/phy-berlin-usb.c
+++ b/drivers/phy/marvell/phy-berlin-usb.c
@@ -9,11 +9,12 @@
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/property.h>
 #include <linux/reset.h>
 
+#include "../phy-provider.h"
+
 #define USB_PHY_PLL		0x04
 #define USB_PHY_PLL_CONTROL	0x08
 #define USB_PHY_TX_CTRL0	0x10
diff --git a/drivers/phy/marvell/phy-mmp3-hsic.c b/drivers/phy/marvell/phy-mmp3-hsic.c
index 72ab6da0ebc3..90498211431b 100644
--- a/drivers/phy/marvell/phy-mmp3-hsic.c
+++ b/drivers/phy/marvell/phy-mmp3-hsic.c
@@ -7,9 +7,10 @@
 #include <linux/io.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 
+#include "../phy-provider.h"
+
 #define HSIC_CTRL	0x08
 #define HSIC_ENABLE	BIT(7)
 #define PLL_BYPASS	BIT(4)
diff --git a/drivers/phy/marvell/phy-mmp3-usb.c b/drivers/phy/marvell/phy-mmp3-usb.c
index 5b71deb08851..ba67bcc2c3f9 100644
--- a/drivers/phy/marvell/phy-mmp3-usb.c
+++ b/drivers/phy/marvell/phy-mmp3-usb.c
@@ -8,10 +8,11 @@
 #include <linux/io.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/soc/mmp/cputype.h>
 
+#include "../phy-provider.h"
+
 #define USB2_PLL_REG0		0x4
 #define USB2_PLL_REG1		0x8
 #define USB2_TX_REG0		0x10
diff --git a/drivers/phy/marvell/phy-mvebu-a3700-comphy.c b/drivers/phy/marvell/phy-mvebu-a3700-comphy.c
index 1d1db1737422..3acfd74c3eca 100644
--- a/drivers/phy/marvell/phy-mvebu-a3700-comphy.c
+++ b/drivers/phy/marvell/phy-mvebu-a3700-comphy.c
@@ -21,10 +21,11 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/phy.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/spinlock.h>
 
+#include "../phy-provider.h"
+
 #define PLL_SET_DELAY_US		600
 #define COMPHY_PLL_SLEEP		1000
 #define COMPHY_PLL_TIMEOUT		150000
diff --git a/drivers/phy/marvell/phy-mvebu-a3700-utmi.c b/drivers/phy/marvell/phy-mvebu-a3700-utmi.c
index 04f4fb4bed70..c17ce28ceb0b 100644
--- a/drivers/phy/marvell/phy-mvebu-a3700-utmi.c
+++ b/drivers/phy/marvell/phy-mvebu-a3700-utmi.c
@@ -14,10 +14,11 @@
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 
+#include "../phy-provider.h"
+
 /* Armada 3700 UTMI PHY registers */
 #define USB2_PHY_PLL_CTRL_REG0			0x0
 #define   PLL_REF_DIV_OFF			0
diff --git a/drivers/phy/marvell/phy-mvebu-cp110-comphy.c b/drivers/phy/marvell/phy-mvebu-cp110-comphy.c
index 71f9c14fb50d..18ad172135ea 100644
--- a/drivers/phy/marvell/phy-mvebu-cp110-comphy.c
+++ b/drivers/phy/marvell/phy-mvebu-cp110-comphy.c
@@ -13,10 +13,11 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/phy.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 
+#include "../phy-provider.h"
+
 /* Relative to priv->base */
 #define MVEBU_COMPHY_SERDES_CFG0(n)		(0x0 + (n) * 0x1000)
 #define     MVEBU_COMPHY_SERDES_CFG0_PU_PLL	BIT(1)
diff --git a/drivers/phy/marvell/phy-mvebu-cp110-utmi.c b/drivers/phy/marvell/phy-mvebu-cp110-utmi.c
index dd3e515a8e86..f3e2ef54c37b 100644
--- a/drivers/phy/marvell/phy-mvebu-cp110-utmi.c
+++ b/drivers/phy/marvell/phy-mvebu-cp110-utmi.c
@@ -13,12 +13,13 @@
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/usb/of.h>
 #include <linux/usb/otg.h>
 
+#include "../phy-provider.h"
+
 #define UTMI_PHY_PORTS				2
 
 /* CP110 UTMI register macro definetions */
diff --git a/drivers/phy/marvell/phy-mvebu-sata.c b/drivers/phy/marvell/phy-mvebu-sata.c
index 89a5a2b69d80..b9a9eca74789 100644
--- a/drivers/phy/marvell/phy-mvebu-sata.c
+++ b/drivers/phy/marvell/phy-mvebu-sata.c
@@ -8,11 +8,12 @@
 #include <linux/kernel.h>
 #include <linux/init.h>
 #include <linux/clk.h>
-#include <linux/phy/phy.h>
 #include <linux/io.h>
 #include <linux/mod_devicetable.h>
 #include <linux/platform_device.h>
 
+#include "../phy-provider.h"
+
 struct priv {
 	struct clk	*clk;
 	void __iomem	*base;
diff --git a/drivers/phy/marvell/phy-pxa-28nm-hsic.c b/drivers/phy/marvell/phy-pxa-28nm-hsic.c
index eff6dd6b2dd0..6feee8d1ca70 100644
--- a/drivers/phy/marvell/phy-pxa-28nm-hsic.c
+++ b/drivers/phy/marvell/phy-pxa-28nm-hsic.c
@@ -17,7 +17,8 @@
 #include <linux/clk.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
-#include <linux/phy/phy.h>
+
+#include "../phy-provider.h"
 
 #define PHY_28NM_HSIC_CTRL			0x08
 #define PHY_28NM_HSIC_IMPCAL_CAL		0x18
diff --git a/drivers/phy/marvell/phy-pxa-28nm-usb2.c b/drivers/phy/marvell/phy-pxa-28nm-usb2.c
index 64afb82cf70e..39b8344803cb 100644
--- a/drivers/phy/marvell/phy-pxa-28nm-usb2.c
+++ b/drivers/phy/marvell/phy-pxa-28nm-usb2.c
@@ -17,7 +17,8 @@
 #include <linux/clk.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
-#include <linux/phy/phy.h>
+
+#include "../phy-provider.h"
 
 /* USB PXA1928 PHY mapping */
 #define PHY_28NM_PLL_REG0			0x0
diff --git a/drivers/phy/marvell/phy-pxa-usb.c b/drivers/phy/marvell/phy-pxa-usb.c
index c0bb71f80c04..9a8ab813d001 100644
--- a/drivers/phy/marvell/phy-pxa-usb.c
+++ b/drivers/phy/marvell/phy-pxa-usb.c
@@ -10,9 +10,10 @@
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/of_address.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 
+#include "../phy-provider.h"
+
 /* phy regs */
 #define UTMI_REVISION		0x0
 #define UTMI_CTRL		0x4
diff --git a/drivers/phy/mediatek/phy-mtk-dp.c b/drivers/phy/mediatek/phy-mtk-dp.c
index d7024a144335..ab3778447570 100644
--- a/drivers/phy/mediatek/phy-mtk-dp.c
+++ b/drivers/phy/mediatek/phy-mtk-dp.c
@@ -10,10 +10,11 @@
 #include <linux/io.h>
 #include <linux/mfd/syscon.h>
 #include <linux/of.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 
+#include "../phy-provider.h"
+
 #define PHY_OFFSET			0x1000
 
 #define MTK_DP_PHY_DIG_PLL_CTL_1	(PHY_OFFSET + 0x14)
diff --git a/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c b/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
index 1426a2db984d..30015bac3f73 100644
--- a/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
+++ b/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
@@ -7,7 +7,6 @@
 #include <linux/io.h>
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/regulator/driver.h>
 #include <linux/regulator/of_regulator.h>
diff --git a/drivers/phy/mediatek/phy-mtk-hdmi.h b/drivers/phy/mediatek/phy-mtk-hdmi.h
index 99d917e0036a..bfddd8dbe9dd 100644
--- a/drivers/phy/mediatek/phy-mtk-hdmi.h
+++ b/drivers/phy/mediatek/phy-mtk-hdmi.h
@@ -11,12 +11,13 @@
 #include <linux/delay.h>
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/regulator/driver.h>
 #include <linux/regulator/machine.h>
 #include <linux/types.h>
 
+#include "../phy-provider.h"
+
 struct mtk_hdmi_phy;
 
 struct mtk_hdmi_phy_conf {
diff --git a/drivers/phy/mediatek/phy-mtk-mipi-csi-0-5.c b/drivers/phy/mediatek/phy-mtk-mipi-csi-0-5.c
index 058e1d926630..5e008204ecca 100644
--- a/drivers/phy/mediatek/phy-mtk-mipi-csi-0-5.c
+++ b/drivers/phy/mediatek/phy-mtk-mipi-csi-0-5.c
@@ -12,10 +12,10 @@
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 
+#include "../phy-provider.h"
 #include "phy-mtk-io.h"
 #include "phy-mtk-mipi-csi-0-5-rx-reg.h"
 
diff --git a/drivers/phy/mediatek/phy-mtk-mipi-dsi.h b/drivers/phy/mediatek/phy-mtk-mipi-dsi.h
index 5d4876f1dc95..676c8f78d9d6 100644
--- a/drivers/phy/mediatek/phy-mtk-mipi-dsi.h
+++ b/drivers/phy/mediatek/phy-mtk-mipi-dsi.h
@@ -13,9 +13,10 @@
 #include <linux/module.h>
 #include <linux/nvmem-consumer.h>
 #include <linux/platform_device.h>
-#include <linux/phy/phy.h>
 #include <linux/slab.h>
 
+#include "../phy-provider.h"
+
 struct mtk_mipitx_data {
 	const u32 mppll_preserve;
 	const struct clk_ops *mipi_tx_clk_ops;
diff --git a/drivers/phy/mediatek/phy-mtk-pcie.c b/drivers/phy/mediatek/phy-mtk-pcie.c
index a2f69d6c72f0..1ab7c1dc2753 100644
--- a/drivers/phy/mediatek/phy-mtk-pcie.c
+++ b/drivers/phy/mediatek/phy-mtk-pcie.c
@@ -8,10 +8,10 @@
 #include <linux/module.h>
 #include <linux/nvmem-consumer.h>
 #include <linux/of.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 
+#include "../phy-provider.h"
 #include "phy-mtk-io.h"
 
 #define PEXTP_ANA_GLB_00_REG		0x9000
diff --git a/drivers/phy/mediatek/phy-mtk-tphy.c b/drivers/phy/mediatek/phy-mtk-tphy.c
index acf506529507..6f98de067327 100644
--- a/drivers/phy/mediatek/phy-mtk-tphy.c
+++ b/drivers/phy/mediatek/phy-mtk-tphy.c
@@ -15,10 +15,10 @@
 #include <linux/nvmem-consumer.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 
+#include "../phy-provider.h"
 #include "phy-mtk-io.h"
 
 /* version V1 sub-banks offset base address */
diff --git a/drivers/phy/mediatek/phy-mtk-ufs.c b/drivers/phy/mediatek/phy-mtk-ufs.c
index 0cb5a25b1b7a..de517fcc4f3e 100644
--- a/drivers/phy/mediatek/phy-mtk-ufs.c
+++ b/drivers/phy/mediatek/phy-mtk-ufs.c
@@ -9,9 +9,9 @@
 #include <linux/io.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 
+#include "../phy-provider.h"
 #include "phy-mtk-io.h"
 
 /* mphy register and offsets */
diff --git a/drivers/phy/mediatek/phy-mtk-xfi-tphy.c b/drivers/phy/mediatek/phy-mtk-xfi-tphy.c
index 100a50d0e861..036a4bb58dcf 100644
--- a/drivers/phy/mediatek/phy-mtk-xfi-tphy.c
+++ b/drivers/phy/mediatek/phy-mtk-xfi-tphy.c
@@ -17,8 +17,8 @@
 #include <linux/clk.h>
 #include <linux/reset.h>
 #include <linux/phy.h>
-#include <linux/phy/phy.h>
 
+#include "../phy-provider.h"
 #include "phy-mtk-io.h"
 
 #define MTK_XFI_TPHY_NUM_CLOCKS		2
diff --git a/drivers/phy/mediatek/phy-mtk-xsphy.c b/drivers/phy/mediatek/phy-mtk-xsphy.c
index c0ddb9273cc3..5e61abddaf54 100644
--- a/drivers/phy/mediatek/phy-mtk-xsphy.c
+++ b/drivers/phy/mediatek/phy-mtk-xsphy.c
@@ -14,10 +14,10 @@
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/of_address.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 
+#include "../phy-provider.h"
 #include "phy-mtk-io.h"
 
 /* u2 phy banks */
diff --git a/drivers/phy/microchip/lan966x_serdes.c b/drivers/phy/microchip/lan966x_serdes.c
index 835e369cdfc5..8769518f9708 100644
--- a/drivers/phy/microchip/lan966x_serdes.c
+++ b/drivers/phy/microchip/lan966x_serdes.c
@@ -1,15 +1,15 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 
+#include <dt-bindings/phy/phy-lan966x-serdes.h>
 #include <linux/err.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_platform.h>
 #include <linux/phy.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 
-#include <dt-bindings/phy/phy-lan966x-serdes.h>
 #include "lan966x_serdes_regs.h"
+#include "../phy-provider.h"
 
 #define PLL_CONF_MASK		GENMASK(4, 3)
 #define PLL_CONF_25MHZ		0
diff --git a/drivers/phy/microchip/sparx5_serdes.c b/drivers/phy/microchip/sparx5_serdes.c
index 320cf5b50a8c..09c22a6a2639 100644
--- a/drivers/phy/microchip/sparx5_serdes.c
+++ b/drivers/phy/microchip/sparx5_serdes.c
@@ -17,8 +17,8 @@
 #include <linux/io.h>
 #include <linux/clk.h>
 #include <linux/phy.h>
-#include <linux/phy/phy.h>
 
+#include "../phy-provider.h"
 #include "sparx5_serdes.h"
 
 #define SPX5_SERDES_10G_START 13
diff --git a/drivers/phy/motorola/phy-cpcap-usb.c b/drivers/phy/motorola/phy-cpcap-usb.c
index 7cb020dd3423..66a834c208fc 100644
--- a/drivers/phy/motorola/phy-cpcap-usb.c
+++ b/drivers/phy/motorola/phy-cpcap-usb.c
@@ -24,10 +24,11 @@
 #include <linux/gpio/consumer.h>
 #include <linux/mfd/motorola-cpcap.h>
 #include <linux/phy/omap_usb.h>
-#include <linux/phy/phy.h>
 #include <linux/regulator/consumer.h>
 #include <linux/usb/musb.h>
 
+#include "../phy-provider.h"
+
 /* CPCAP_REG_USBC1 register bits */
 #define CPCAP_BIT_IDPULSE		BIT(15)
 #define CPCAP_BIT_ID100KPU		BIT(14)
diff --git a/drivers/phy/motorola/phy-mapphone-mdm6600.c b/drivers/phy/motorola/phy-mapphone-mdm6600.c
index ce1dad8c438d..92f63e52bd1d 100644
--- a/drivers/phy/motorola/phy-mapphone-mdm6600.c
+++ b/drivers/phy/motorola/phy-mapphone-mdm6600.c
@@ -15,10 +15,12 @@
 
 #include <linux/gpio/consumer.h>
 #include <linux/of_platform.h>
-#include <linux/phy/phy.h>
+#include <linux/phy/phy.h> /* for phy_pm_runtime_*() */
 #include <linux/pinctrl/consumer.h>
 #include <linux/pm_runtime.h>
 
+#include "../phy-provider.h"
+
 #define PHY_MDM6600_PHY_DELAY_MS	4000	/* PHY enable 2.2s to 3.5s */
 #define PHY_MDM6600_ENABLED_DELAY_MS	8000	/* 8s more total for MDM6600 */
 #define PHY_MDM6600_WAKE_KICK_MS	600	/* time on after GPIO toggle */
diff --git a/drivers/phy/mscc/phy-ocelot-serdes.c b/drivers/phy/mscc/phy-ocelot-serdes.c
index 1cd1b5db2ad7..13f83876d954 100644
--- a/drivers/phy/mscc/phy-ocelot-serdes.c
+++ b/drivers/phy/mscc/phy-ocelot-serdes.c
@@ -12,12 +12,13 @@
 #include <linux/of.h>
 #include <linux/of_platform.h>
 #include <linux/phy.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <soc/mscc/ocelot_hsio.h>
 #include <dt-bindings/phy/phy-ocelot-serdes.h>
 
+#include "../phy-provider.h"
+
 struct serdes_ctrl {
 	struct regmap		*regs;
 	struct device		*dev;
diff --git a/drivers/phy/nuvoton/phy-ma35d1-usb2.c b/drivers/phy/nuvoton/phy-ma35d1-usb2.c
index 9a459b700ed4..520c86188fe2 100644
--- a/drivers/phy/nuvoton/phy-ma35d1-usb2.c
+++ b/drivers/phy/nuvoton/phy-ma35d1-usb2.c
@@ -10,10 +10,11 @@
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 
+#include "../phy-provider.h"
+
 /* USB PHY Miscellaneous Control Register */
 #define MA35_SYS_REG_USBPMISCR	0x60
 #define PHY0POR			BIT(0)  /* PHY Power-On Reset Control Bit */
diff --git a/drivers/phy/phy-airoha-pcie.c b/drivers/phy/phy-airoha-pcie.c
index 56e9ade8a9fd..d9817eed2631 100644
--- a/drivers/phy/phy-airoha-pcie.c
+++ b/drivers/phy/phy-airoha-pcie.c
@@ -9,11 +9,11 @@
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 
 #include "phy-airoha-pcie-regs.h"
+#include "phy-provider.h"
 
 #define LEQ_LEN_CTRL_MAX_VAL	7
 #define FREQ_LOCK_MAX_ATTEMPT	10
diff --git a/drivers/phy/phy-can-transceiver.c b/drivers/phy/phy-can-transceiver.c
index 330356706ad7..d1e90fe6b68b 100644
--- a/drivers/phy/phy-can-transceiver.c
+++ b/drivers/phy/phy-can-transceiver.c
@@ -6,13 +6,14 @@
  *
  */
 #include <linux/of.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/module.h>
 #include <linux/gpio.h>
 #include <linux/gpio/consumer.h>
 #include <linux/mux/consumer.h>
 
+#include "phy-provider.h"
+
 struct can_transceiver_data {
 	u32 flags;
 #define CAN_TRANSCEIVER_STB_PRESENT	BIT(0)
diff --git a/drivers/phy/phy-core-mipi-dphy.c b/drivers/phy/phy-core-mipi-dphy.c
index f4956a417a47..770cfe2a2279 100644
--- a/drivers/phy/phy-core-mipi-dphy.c
+++ b/drivers/phy/phy-core-mipi-dphy.c
@@ -4,13 +4,13 @@
  * Copyright (C) 2018 Cadence Design Systems Inc.
  */
 
+#include <linux/phy/phy-mipi-dphy.h>
 #include <linux/errno.h>
 #include <linux/export.h>
 #include <linux/kernel.h>
 #include <linux/time64.h>
 
-#include <linux/phy/phy.h>
-#include <linux/phy/phy-mipi-dphy.h>
+#include "phy-provider.h"
 
 /*
  * Minimum D-PHY timings based on MIPI D-PHY specification. Derived
diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
index 737a760d97d1..02af89ee64a3 100644
--- a/drivers/phy/phy-core.c
+++ b/drivers/phy/phy-core.c
@@ -20,6 +20,8 @@
 #include <linux/pm_runtime.h>
 #include <linux/regulator/consumer.h>
 
+#include "phy-provider.h"
+
 #define	to_phy(a)	(container_of((a), struct phy, dev))
 
 /**
diff --git a/drivers/phy/phy-google-usb.c b/drivers/phy/phy-google-usb.c
index 48cfa2e28347..539732f4869e 100644
--- a/drivers/phy/phy-google-usb.c
+++ b/drivers/phy/phy-google-usb.c
@@ -14,13 +14,14 @@
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/of.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 #include <linux/reset.h>
 #include <linux/usb/typec_mux.h>
 
+#include "phy-provider.h"
+
 #define USBCS_USB2PHY_CFG19_OFFSET 0x0
 #define USBCS_USB2PHY_CFG19_PHY_CFG_PLL_FB_DIV GENMASK(19, 8)
 
diff --git a/drivers/phy/phy-lpc18xx-usb-otg.c b/drivers/phy/phy-lpc18xx-usb-otg.c
index f905d3c64584..554dfa55fe7e 100644
--- a/drivers/phy/phy-lpc18xx-usb-otg.c
+++ b/drivers/phy/phy-lpc18xx-usb-otg.c
@@ -10,10 +10,11 @@
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 
+#include "phy-provider.h"
+
 /* USB OTG PHY register offset and bit in CREG */
 #define LPC18XX_CREG_CREG0		0x004
 #define LPC18XX_CREG_CREG0_USB0PHY	BIT(5)
diff --git a/drivers/phy/phy-nxp-ptn3222.c b/drivers/phy/phy-nxp-ptn3222.c
index c6179d8701e6..ae75b760a30d 100644
--- a/drivers/phy/phy-nxp-ptn3222.c
+++ b/drivers/phy/phy-nxp-ptn3222.c
@@ -7,10 +7,11 @@
 #include <linux/i2c.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/phy/phy.h>
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
 
+#include "phy-provider.h"
+
 #define NUM_SUPPLIES 2
 
 struct ptn3222 {
diff --git a/drivers/phy/phy-pistachio-usb.c b/drivers/phy/phy-pistachio-usb.c
index 231792f48ced..8eed6f505a31 100644
--- a/drivers/phy/phy-pistachio-usb.c
+++ b/drivers/phy/phy-pistachio-usb.c
@@ -5,6 +5,7 @@
  * Copyright (C) 2015 Google, Inc.
  */
 
+#include <dt-bindings/phy/phy-pistachio-usb.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/io.h>
@@ -12,11 +13,10 @@
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 
-#include <dt-bindings/phy/phy-pistachio-usb.h>
+#include "phy-provider.h"
 
 #define USB_PHY_CONTROL1				0x04
 #define USB_PHY_CONTROL1_FSEL_SHIFT			2
diff --git a/drivers/phy/phy-snps-eusb2.c b/drivers/phy/phy-snps-eusb2.c
index f90bf7e95463..9062737bfad4 100644
--- a/drivers/phy/phy-snps-eusb2.c
+++ b/drivers/phy/phy-snps-eusb2.c
@@ -13,6 +13,8 @@
 #include <linux/regulator/consumer.h>
 #include <linux/reset.h>
 
+#include "phy-provider.h"
+
 #define EXYNOS_USB_PHY_HS_PHY_CTRL_RST	(0x0)
 #define USB_PHY_RST_MASK		GENMASK(1, 0)
 #define UTMI_PORT_RST_MASK		GENMASK(5, 4)
diff --git a/drivers/phy/phy-xgene.c b/drivers/phy/phy-xgene.c
index 5007dc7a357c..90a00498ec0a 100644
--- a/drivers/phy/phy-xgene.c
+++ b/drivers/phy/phy-xgene.c
@@ -43,9 +43,10 @@
 #include <linux/platform_device.h>
 #include <linux/io.h>
 #include <linux/delay.h>
-#include <linux/phy/phy.h>
 #include <linux/clk.h>
 
+#include "phy-provider.h"
+
 /* Max 2 lanes per a PHY unit */
 #define MAX_LANE			2
 
-- 
2.43.0

