Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2EdhGpwbfWlQQQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 21:59:08 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8453BE992
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 21:59:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3070210E346;
	Fri, 30 Jan 2026 20:59:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=phytec.de header.i=@phytec.de header.b="ST8mo92U";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazon11020122.outbound.protection.outlook.com
 [52.101.84.122])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F32410E346
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jan 2026 20:59:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hbsbOBKWNo3EroTHIg0COnDSZhWLsWROlh9vZ7bwk8QN0TEpBw5ITh2HSfxvMFIiAyXKtxFlYYitzD88K+hVC1ruJ0/GVq7YTSSRRCJ2oVaOeuADLRbE8k/dZg6JHDTUNwoT8wLKeTrPHZn1vUs5//pGrdcTYD6+yka15//S4I+30AhGdmS7yRzjp9jAkOUgZQD9RQL1uXBjSt7MskNlYB8Z+5qQlvyRxPLkOPN6TZP5WQfIvBaCzBXRXBmcMVoCuVKmtEi6FwCOfSmKLugXoaILVrmP4tk7D4Ose2/fTt8sNcxlcezrqXSdGFdcNZbIvSAuSyxvdt02obM0IJkxaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cLXlEJC+h7rFBD3ibOdHu+KZ2buSm7zH+Rd1j7CaWJY=;
 b=Q5R33HO+dLEEoLhIiKayWHLEB0jCPkdR1GuRxsurjewbxmDPuacF9QgNsvsX+SugjF2pBabnRoVhIe6bgLI3Nm2+dDmaeDyQJvs0+wFzXQdYtmE0D25UUdEj3N3VTwuHfZVMkeCgCOXfhPwZ2NoPHy+rhI4NWPwqc1Plrt+Lcg+ddGBGZpjIFxiDTJggIHI4fx1FkBZ3Z0y1nbGuOoBYMNTUqK4F4fm5BVPwWkkfHAw6hIWp2WyUKUBU6/MFXxK7kInV+sRwjSv+FXXxf7yfhVysZffeGTorz1cUAvddX6GnpedTZLOVSCepW0WkzPwUTdnBNIZDa1UL7h1usJGNjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=gmail.com smtp.mailfrom=phytec.de;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=phytec.de; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cLXlEJC+h7rFBD3ibOdHu+KZ2buSm7zH+Rd1j7CaWJY=;
 b=ST8mo92Ug6nMSnURQsxpY31KU94JpoAqzt+bsYnQcDEEEQD80yzMwpXoZRKe/e76PApLPa5QJ+DX2jFjebIp5vCqKa7RBoaIDA/aAXZoXDNhFiNlSWvNKyIDjDzyEymzKM5NuXxVPRATVZ8Y8ViZdMmSL7twawC1VQ5wRpG6vpQa7orVq1Ya5DLS9UHjEanCIPxi6zkCT+C5pHLpq2aXD+Vi3iZQam/prJKYXlxcNLA3XoCfdIpknmjW8WLsWtkbiLtNeThYkeQGk91VYza9tkyZKxoeB5eSMjovRqPdPPfLC34vvkuShYXc27UyRqp4IjSJAJSiO545zydfm2ikkw==
Received: from DU7P191CA0002.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:54e::31)
 by DBAP195MB1084.EURP195.PROD.OUTLOOK.COM (2603:10a6:10:1c2::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.11; Fri, 30 Jan
 2026 20:59:00 +0000
Received: from DB1PEPF000509E4.eurprd03.prod.outlook.com
 (2603:10a6:10:54e:cafe::eb) by DU7P191CA0002.outlook.office365.com
 (2603:10a6:10:54e::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.16 via Frontend Transport; Fri,
 30 Jan 2026 20:58:55 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de;
 dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Postix.phytec.de (91.26.50.189) by
 DB1PEPF000509E4.mail.protection.outlook.com (10.167.242.54) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Fri, 30 Jan 2026 20:59:00 +0000
Received: from lws-haller-privat.phytec.de (172.25.39.212) by Postix.phytec.de
 (172.25.0.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Fri, 30 Jan
 2026 21:58:57 +0100
From: Dominik Haller <d.haller@phytec.de>
To: <adrien.grassein@gmail.com>, <jernej.skrabec@gmail.com>, <onas@kwiboo.se>, 
 <Laurent.pinchart@ideasonboard.com>, <krzk+dt@kernel.org>,
 <conor+dt@kernel.org>, <robh@kernel.org>
CC: <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <upstream@lists.phytec.de>, "Dominik
 Haller" <d.haller@phytec.de>
Subject: [PATCH 0/6] k3-am68-phyboard-izar dsi support
Date: Fri, 30 Jan 2026 12:58:10 -0800
Message-ID: <20260130205820.83189-1-d.haller@phytec.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.25.39.212]
X-ClientProxiedBy: Postix.phytec.de (172.25.0.11) To Postix.phytec.de
 (172.25.0.11)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509E4:EE_|DBAP195MB1084:EE_
X-MS-Office365-Filtering-Correlation-Id: 72bca447-7cef-40e0-78a4-08de60426473
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|7416014|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?xucHCrC0NmFkWoZ9LGxXdZxtWGVHXOt6l7ve0NO/AhDpMtPy1lcq2lZEs63s?=
 =?us-ascii?Q?nMXPbp3bkfrSeNjihCKDEh2pt0lIQlDo+kfwYKlM0xTOT9HeHMloiIZ83ehA?=
 =?us-ascii?Q?K7q3D7tI+98J2bdsHWGAaVSZZsQKpVYnzqWc3G1p7BnDjOExf9qNN5DPetWG?=
 =?us-ascii?Q?VGtL6cnsJRLKC54632nGPMXKo+5Z4aJ4JhFukWsLPLd+mGii3R0cCRGRWuMB?=
 =?us-ascii?Q?QxGeasm6PXf5PD6HvfLT9VTb5+LQqSSXBkLwZfzZIAdADda+ljLfzXcXYAG4?=
 =?us-ascii?Q?tsrI5nWxEzIUQjTCRjjmo2CqBxpoaq0EJUartMzoqdES+b5yCJypGrvpUoTE?=
 =?us-ascii?Q?clndIQJZaJ2yp4I1fm5T3l2VIRxllNEqpRcn+zHfzw/7oBUfftas/Zk+ScVA?=
 =?us-ascii?Q?bbRy/kKqhwMjAsAB4a7SS3YVnHttT27e7hcU2NKBYjjoDj66K2NfZ7nrv7ka?=
 =?us-ascii?Q?X4eLumr20/jfKPu/BTNEDMM9zBk9wfKqm+AnaXit3UOw9yWlE5EzkENeV+O+?=
 =?us-ascii?Q?MckAog1ci6UvGPvEr48GQxcC5syHc/KcaE7p3wYVsk8LcWjSJo1wgHZz7qMi?=
 =?us-ascii?Q?O9YaOHNImQhQgZkVBufBtu+wo44BfYNaJxXkeR1OUZE5tyMP+ejxPKEkeOKz?=
 =?us-ascii?Q?IuQpFgGA6ra0zQzqVasNTk1BYxlSjCWUJ04EU1izEe6LZEoi7yLXMAakIUeR?=
 =?us-ascii?Q?xUrG9cBypogwQJ81QkQYWmOflTs+pi8CBEbqHyVNO/fdyMX6lRoOs8Zo9Pyi?=
 =?us-ascii?Q?mVXn+yl5fVPz9CpNfuGZN2eVWxabCttMN/L/0Kz/rLBWHYNhMCwgfPQs0G8d?=
 =?us-ascii?Q?VuB86FpB/dset0i/2R/0VUr6xO3adeG3up5+R7GuHDL8gk7P+XpT2xwbjRKZ?=
 =?us-ascii?Q?q4FvsnZOvmdEQpUWr5QD7QAb3MAV+lHyorzwHnBepbnjaTOhC/wL6UrHJ09i?=
 =?us-ascii?Q?5aULmhbw/CmX5s+TKvXMqyUzpz0ZLtn/FYascEFG2ylyv261afpQ/6HnLUku?=
 =?us-ascii?Q?7GmE/cdgYg4b6ZH7VTTpwYpHq8fjVIf22TtkOchNPj51qIYCNcVgawaPO7J4?=
 =?us-ascii?Q?2sCFnI5pBRfPsQ/e9uQBMN9x644EAdZsqviEWWugR26DDTF3mlSD+sVf4rnE?=
 =?us-ascii?Q?s2CZT9t1iDFee1N5g48odLDP6Bi8hnOt8Bnw3NMPnuFN7jyfJ4BaiHmfnW6x?=
 =?us-ascii?Q?f6niLg4RxMpp9QSxNv9Z0uXoiveFSoAuNn3+zJDGO2SLRa+lURMxdP8vZlnn?=
 =?us-ascii?Q?y3r/XYAkfPCbpiMiLx3+QlMEObpqbff/t5L9kEVXGQA2sWmYG/GPZa7VkwGX?=
 =?us-ascii?Q?BEA8sEe8jgVclWSZxOXQdBGFJEBMuUML1ZLZCC5F3IyEHaJpRZQAumKmyf7J?=
 =?us-ascii?Q?kftQ9WdF56MuWXPVVwVkhDSKsqC7ua4YWthsSBDlwQ4myoT0NjiAa451r0D5?=
 =?us-ascii?Q?hGKH2Ei5rzDDpfdRvGQUyiXkJT8WfBSDk2heuw/1QoReX8kWyeBburOVuHYq?=
 =?us-ascii?Q?SmfItyDDK/aP9Gpin/a2wkWjc+44iAvVaEbZf/9qo+3P5WJSNbgkbgmexyEw?=
 =?us-ascii?Q?OX3MorPPzalbkx1HOO5rksP2zDL+NxyCWIVdNd9yVKJBenSGZ+60LjBaLlIb?=
 =?us-ascii?Q?58tWVGi3/iaG+avP4w5sSgTFSJiV7QxDxgsuA/la6KRem6yvAniX0qbysFcu?=
 =?us-ascii?Q?Yq2LJw=3D=3D?=
X-Forefront-Antispam-Report: CIP:91.26.50.189; CTRY:DE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:Postix.phytec.de; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(7416014)(1800799024)(36860700013); DIR:OUT;
 SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: +Ik7Fe/L4yv+goirL+jHg+caRT5O4kTyKejWht+WQPXDjYDPSxAwbEnovdL/XgmiKksYVlLtpEZ2yTTEbDME8TuokYCohUBCz80G7f8OW5LMHYgVPWlpKHMMVIUXIr7fAWYF6t8UD22eu1comCO1Cl2i25BkZ3akU8XuBw9/1FxPG92+byXr+o8HhLVshVPtAVBDzFSrFQNp9K+JCP9qo2JcdKTIyu+rcMdZtwB0RqE7wgJpmnCf2Pp2tE/0K5XQRWqsxVClENgSVeTOwFQK6PtYYmDsQjqz7bzqNcGSrrk10nM/GCET0xgpgtQKYryXiZc9sjmGgvR7C7l+R3xWa5Bumc8Uii1+WBaVBNshNWW0HzbOeXRSnWmN90kYS5+lFqvTIuIJ2sfAGFZ3EbKkDuvksuIqHrp0LHbRjddVvRQpeZa1aZHGhI+/apQPArpk
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 20:59:00.1890 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 72bca447-7cef-40e0-78a4-08de60426473
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29; Ip=[91.26.50.189];
 Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509E4.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAP195MB1084
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[phytec.de,quarantine];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[phytec.de:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_TO(0.00)[gmail.com,kwiboo.se,ideasonboard.com,kernel.org];
	FORGED_SENDER(0.00)[d.haller@phytec.de,dri-devel-bounces@lists.freedesktop.org];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:adrien.grassein@gmail.com,m:jernej.skrabec@gmail.com,m:onas@kwiboo.se,m:Laurent.pinchart@ideasonboard.com,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:robh@kernel.org,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:upstream@lists.phytec.de,m:d.haller@phytec.de,m:adriengrassein@gmail.com,m:jernejskrabec@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[d.haller@phytec.de,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[phytec.de:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.689];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	HAS_XOIP(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: C8453BE992
X-Rspamd-Action: no action

This series adds support for the two dsi based display interfaces of the
phyboard-izar with the phycore-am68x/tda4x som.

dsi0 gets converted to lvds on the som using a SN65DSI83 bridge in the
default configuration. The phyboard-izar kit comes with a 10.1" lvds
display with usb touch as addon.

dsi1 is routed to the carrier board onto a connector. To use that Phytec
has developed a small extension board "PEB-AV-15" with a Lontium LT8912B
dsi->hdmi bridge.

Dominik Haller (6):
  arm64: dts: ti: k3-am68-phyboard-izar: Assign dss clocks
  arm64: dts: ti: k3-am68-phycore-som: Add DSI->LVDS bridge
  arm64: dts: ti: k3-am68-phyboard-izar: Add LVDS-Display
  arm64: dts: ti: k3-j721s2-main: Add DSI1
  dt-bindings: display: bridge: lt8912b: Drop reset gpio requirement
  arm64: dts: ti: k3-am68-phyboard-izar: Add PEB-AV-15 overlay

 .../display/bridge/lontium,lt8912b.yaml       |   1 -
 arch/arm64/boot/dts/ti/Makefile               |   8 +
 ...-am68-phyboard-izar-lvds-ph128800t006.dtso | 125 ++++++++++++
 .../ti/k3-am68-phyboard-izar-peb-av-15.dtso   | 192 ++++++++++++++++++
 .../boot/dts/ti/k3-am68-phyboard-izar.dts     |  18 ++
 .../boot/dts/ti/k3-am68-phycore-som.dtsi      |  17 ++
 arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi    |  39 ++++
 7 files changed, 399 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am68-phyboard-izar-lvds-ph128800t006.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-am68-phyboard-izar-peb-av-15.dtso

-- 
2.43.0

