Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MFMbNOEDlWlRKAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 01:12:17 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 831421521A5
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 01:12:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAFA010E541;
	Wed, 18 Feb 2026 00:12:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Akz8JV91";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010039.outbound.protection.outlook.com [52.101.56.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1D9E10E2C3;
 Wed, 18 Feb 2026 00:12:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jhdbmHDhC5Gu0Dq8L4kfGdpdV9mIhyPbQL64+zJsp8K3OdQSyVwGVppV5jviNFk9NchEjiiCYJINVmwaGsEvI38dO0YLJZXVAcfXhlJ/aHfPRhArHuY04Umd20W6G0gHvnBxPju7g4yKlAgzEGpU9l4AsHJIu8rX1v+wjEfupLcZIzXpbZukqh6dX9dxFLkwxor+y2R3MGZ27btP7a81e9cttQhQqifcd/z03MLM09zQEZZRWnH/4dg7hOh5OjXPJc3h1M1fJ6nNku6K4CK2hkJpHjtud5Qw6CVBJPWZLN7mz3TguJ/IaikZPnSVsc5wuwrdnPuOfqjRXKWp9Yhesw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+JGpwhn9XPkJf5xVXBBiiUjT6i3XvkNSpfIMRYjn2SQ=;
 b=raAKlecnFdDJBBx4wcZI7N+VvHHem/0YxaG4+ilU3yP6oTP7CeVpy3MVJeqEw8IyvyQnnF0ojQK0EB99CcNcoPlNmqglnv7FBe6nP95KN1Pfx/O0UgO7nHSugJhfSo6h8IIcN7WbRpYKWjApCmWgUYTFqc0yIEw3rwVKZVz0fvQSOQ9S5yGspPrk5RYybr/OJHDAW76dhb2e7L66A2ykdPDyVhenBuYyioTNi6NIYst/8Ky/LacecyYRDUacoMwYgGZEnaTFq87euhj6xdoue9YC4fJQpkHptqNWX3lSAUBoIdBYAXjQjpYx10THalvZ1u/eD5fGjzhE13iU5mfIDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+JGpwhn9XPkJf5xVXBBiiUjT6i3XvkNSpfIMRYjn2SQ=;
 b=Akz8JV919M7nlUWhGX/KbXee28PgdgSz6sq9uEC14etfVGEosYWoj95xSziAcX7JC+8w5GNDo0tPh5ibFBgFlNq1GExESy55Vnp9aOQ0QCsIUz7HLeJ48yJX+qi0AvmP5Do9mDjoTuu1eQVYTNlzYwV6uZtXFh1Jnv7Ofed2ncDjZq5LQ+S/MBYACJkjXxXxxkusDxCNbpQatBVy7qP9GD4xTzLz+H2P/TUoGKx7Eq4ylqTytCQARLfu3XoQmmwGQtbfoljiIJ11fGnUa3aVl5XAfuURwQ6P7tAo6LRkdSJ6Nzs4EnGlkh4UTpfuW3TTSbU3BYMTgPUipBPOZd5Z2w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by IA0PR12MB8421.namprd12.prod.outlook.com (2603:10b6:208:40f::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Wed, 18 Feb
 2026 00:12:01 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%5]) with mapi id 15.20.9611.013; Wed, 18 Feb 2026
 00:12:01 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: 
Cc: Christian Koenig <christian.koenig@amd.com>,
 Dongwon Kim <dongwon.kim@intel.com>, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, iommu@lists.linux.dev,
 Kevin Tian <kevin.tian@intel.com>, Leon Romanovsky <leonro@nvidia.com>,
 linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org,
 Matthew Brost <matthew.brost@intel.com>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Thomas Hellstrom <thomas.hellstrom@linux.intel.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>
Subject: [PATCH RFC 02/26] dma-buf: Add the SGT DMA mapping type
Date: Tue, 17 Feb 2026 20:11:33 -0400
Message-ID: <2-v1-b5cab63049c0+191af-dmabuf_map_type_jgg@nvidia.com>
In-Reply-To: <0-v1-b5cab63049c0+191af-dmabuf_map_type_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1P223CA0016.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:208:2c4::21) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|IA0PR12MB8421:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d8a5a9b-1b51-4024-40b7-08de6e82558b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Ng2TB3ShMIkhh2VqBbrLNDPP6X2D98FujP55cHLANP5XwpnA1+NC5rcUSYy8?=
 =?us-ascii?Q?XRryz2FJS6nlsFw6bI43e6tiYli/9Vc1wwysVq6TLvLUomToEev3ehxB/CeN?=
 =?us-ascii?Q?rn6NqIDajY+OwseNU/cm1/ow29R1a6dGMWPU6iObn2aWmn6gPhSSSGmGXbx8?=
 =?us-ascii?Q?Ly0BsO6iK7Va8sq4bE3nMrDNfEdklYZ/Wg0/OVy3zge1D0JBWW3eLfAQDM8p?=
 =?us-ascii?Q?EikrF5bPYq4vl3lHU9YjUrocEc+5cQ97cspDJMK5gH6wKNssoj+zMV9h95NP?=
 =?us-ascii?Q?Y6YfbySSSswtdgu1rPEowM4lhnEHiHdbUdus6PcZntmDROcb8WFzTA72rEEz?=
 =?us-ascii?Q?dWdt24VNiTg7IwpquyGmtU8xkbyM7q40zoiXw9mAaJ7U6P0qGrFwzCaRBwx7?=
 =?us-ascii?Q?y4ZhdZ8zT9dlA3flV3wPK14eeV15GQueljIls/7UTeZtx0MDZrTP8VGnAlev?=
 =?us-ascii?Q?JQi+2lys+I55gWKq9nCoj06kKguPK8gavAbXANsnZhklHA1cQoeUcynCxzYW?=
 =?us-ascii?Q?QWPPwkRzW4sQ4d9bGdqzNmwXzQS0IlriMrP1N5fhYH5g9jmiz1CvP9pmEATa?=
 =?us-ascii?Q?kr3mY0qwGKw++XPHackuM8VjELbqzhpXQ26Os2d7BDfcXg3/OR9EQMdUpYhg?=
 =?us-ascii?Q?4hLnjL10XVkDV5W1+Svu3109SjuN6S/ygKScj8cWKNjTlnRd0Xxi06KnQ62g?=
 =?us-ascii?Q?2rSIkzIv6aaOBzFq9UooQelUHAiNMOS/FEL/C1Dn1/ZT8GfIOugaRRo6MTke?=
 =?us-ascii?Q?J5abHorW0q9ixgeKBb8EEikJKGRhjocwLIXur+vefTM6u9VtlP/B3sTdzQtt?=
 =?us-ascii?Q?nn5siawM20x2Oj3mUojIXj4O56muqOFVynZxnytsVfRvwDXPJOEhdsvGgEqt?=
 =?us-ascii?Q?j/KrCF85xsQRrmnmCgungt/0JJF9GMiN8ksiKdmxHxBWBgrt7kYv1/e46shn?=
 =?us-ascii?Q?yGqzP1LOMzbA2nTSlDD8mu3A5EhFinjXyEZ1HbJO5xLH1wGKC/m2n7G95TW/?=
 =?us-ascii?Q?nfnlkfxuz89Fi3ndzyLLyENfdH2aYns7DEV2UhnF8awVo4UpluHAEH1x6Syy?=
 =?us-ascii?Q?ar7nTJy6jY9xxpt8q6t9j4pFBqPFMGL/VdtoDIyBe11RMTmwZFmm/ESfpGCH?=
 =?us-ascii?Q?PPYd1upOETc0Czns2yEOZb+Bhgk4F5vMlxLyrEKpGOaRuX6RHMg3TnqUIZ0e?=
 =?us-ascii?Q?JpFNFtSeL4xtiBtle90xUDp9MYnAYdrc9r2s3wXYTl+0hSh/FVPQUHv4N2hz?=
 =?us-ascii?Q?hfWWGeFhedghkssCEF9HHvTFuOLRSerEAGPUzOk6JNQWZWZ00IraX5qW3uCA?=
 =?us-ascii?Q?V4UDgMsNfrsjK4c/HP6EGwQNKf0njWBrRCu/d/S6iQS+2LtAXNAoW9VRsWCY?=
 =?us-ascii?Q?wNtVnF9i1aKZQVvhbACPjy/D1gWaglSiChH+MVEZDLjd3g3ZDf3NmBupQlOz?=
 =?us-ascii?Q?DehDIDMIBeeGB+9rVquODGvdsJ7ez8jMZOcTmq7YPWeaf5syIatH9yBJFXUs?=
 =?us-ascii?Q?IqUzKYda0ogO9fRO2PN+Av2jMTViO4PJhofuG1PNEtfEZGfXcCkkwh/lKtdo?=
 =?us-ascii?Q?hWHo+Dk3Eebp9CAur9s=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV8PR12MB9620.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?906EfSp4L/7P1GagFJddfICJV+Q1WsQcBOWJNatQU6BX0L+dA9VGzlT28yeu?=
 =?us-ascii?Q?lMYtuWFCkTtOaarsw4IaCPlTzatY4i1zakNtrw/0cq9uuskFUyeXKEXttHhS?=
 =?us-ascii?Q?zfZRCQM5NE5+izOJ4viXc/VWqz/57AMS4394CllunxjklJerjkFr0HMOv01R?=
 =?us-ascii?Q?/ya9bayziWtM5Z+fKtcEofvfNa9aWd7ANleg3hYgc1jX7JLTfjPVBkPPg2vc?=
 =?us-ascii?Q?zL9pwkCUENKN8WJurPpYenapEIdPPgDE56AZVIaQxGvaBDfuxtg3myiqjexB?=
 =?us-ascii?Q?ThDJ6TO9faGdR9rgQIPTzN6b0ygAptpTIsw7hQbxhuTAAE+AuCWpXtiHaYVo?=
 =?us-ascii?Q?mQJ/Xem6re3ZqvtGQnLY8mvyVSlSH3+o1AWM49ahD9UkidpPaaCgt2gw0+Wb?=
 =?us-ascii?Q?2qpT3uvdzUeP4ZiHTOIaICtXD+U9pTi8nnwKGAPt5OZCdib5Q9pwCOlzwmoj?=
 =?us-ascii?Q?O0wROqZ0UYaVD/xIxusPAVSJ7A6ipuY6jmOI6Kmewh6eqyEHiCmocc2Axg7z?=
 =?us-ascii?Q?Cl5xw+LUwgsTfi4I1zxMarZSTclNs+ijvFUUJltJQglZg5dg+fDp77ebmbaH?=
 =?us-ascii?Q?kL0STSgOFncEfW0pCJAP8ZqGtXG3YW32MHHlLeMfoT/gz1X62R0tTZsS9Tbv?=
 =?us-ascii?Q?crBCWfUVeju2VotAszE+cbHf42f6FbbmUxTqXIrq4RtuSLvQApJcgagdqaBj?=
 =?us-ascii?Q?soKU4w37s4yKrSl9A33h89n5cRJRC9ItvfmLpEEAt9GnU5KKB//apQj6J1Cm?=
 =?us-ascii?Q?xl3ZREYCMgU7pqrUJtI6c+f6Gw8HXOj/TQRqT2EAk3ZD3w5l3lPcA3DmSdeH?=
 =?us-ascii?Q?nFtloE7ENKJ5l9ki9KtCH1eRrP9euhBHVSBT2b6Pa+fm6gvzK3GzeEMei8sX?=
 =?us-ascii?Q?88dlFlmexJfyuAkfL5rjeMrr31rjOfeuk9AIhROOYOxyaiCyXeSzfvpEDunR?=
 =?us-ascii?Q?pIutJg1+BRWGjQYqzjKmsLa46imm+p1rpXjsUHqkjI+es0l5wQdcwRv5bMSb?=
 =?us-ascii?Q?rKhMX1CmuDKdjDNMAO6X7LlWbtCTJkcSDcjAE1VRgb9ThZhL+U23pmPcoEIt?=
 =?us-ascii?Q?CizBje+m5hm5qhZscSUPiVN2FH0MrFF1vbiCDpYHZcsa4pu9JVDaujNU571P?=
 =?us-ascii?Q?9MA02m9T0ZGfHU7HfAsNddEeMAofDZGW7CS3EeWzLkPE8Gnzidr/QNX/5cYg?=
 =?us-ascii?Q?LSdT0OR1t096iqcdIMlvkXUaCi8RAe27XYNcp6uq/7IycCKKFH3p304rQMnP?=
 =?us-ascii?Q?o9uce4CcVuvCGnjJ0h8kZXVAqtUPYM+RGh95VtF/1mKZl0RFjhBHn25no0Gs?=
 =?us-ascii?Q?gnHNWBRs1NafFruZltBKuaNKFegXZ2a0duQ45u8txYniu5jZDFkcaeqE92HC?=
 =?us-ascii?Q?kv7ZthaaTrTfKRDxcTl2MLXPy92rx27aB9B6I2IFqFAoy8JeXXQ3Qk5FEmVJ?=
 =?us-ascii?Q?ZoSAMn7pXpI88MO4OHVz0x8UXLijt9RMl66Gnz17hzUaJ67vePm5xCANp3MR?=
 =?us-ascii?Q?+NwGqGwTcQ7szEY7IT+tr+TjmvHEjZsaHpQv6pCwjlmH1KoNoQmD3nEFgZFu?=
 =?us-ascii?Q?QLsIREKRiF/srygyA7Ud+4+CdmUCeVmyU4dtdKQM1KJO5ItLA7gMgkSX3fJf?=
 =?us-ascii?Q?4iDAce7vdyHDQ8mDRaLIscwm3gi/yW5cQ/RUTpmRI4nCfau6iFyvq04naCbV?=
 =?us-ascii?Q?SLU7vbqeNTXE2QJjsi+fpWgFROwLzw2hmT1w0MiZAtmJuNxExll+bAz05+FA?=
 =?us-ascii?Q?21FX2P66fg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d8a5a9b-1b51-4024-40b7-08de6e82558b
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 00:11:59.5311 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V2kJ97Qi52m8M2yj0zMEdTdBA2TAbQNcfmGPEHnqZcYyVKO9dawl51jBEJPuQYZk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8421
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jgg@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:mid,nvidia.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,Nvidia.com:dkim]
X-Rspamd-Queue-Id: 831421521A5
X-Rspamd-Action: no action

The SGT (Scatter Gather Table) DMA mapping type represents the existing
sg_table/scatterlist based DMA mapping. It provides a sg_table based
map/unmap interface that exactly matches how things work today.

dma_buf_sgt_exp_compat_match will be used in the next patch to
transparently wrap an unaware exporter with a mapping type.

The SGT type handles the allow_peer2peer flag directly through matching
logic. The importer indicates if it is willing to accept peer2peer and the
exporter indicates if it requires peer2peer. A required peer2peer exporter
will not match to an importer that does not accept peer2peer.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/dma-buf/dma-buf-mapping.c |  95 ++++++++++++++++++++++++++++
 include/linux/dma-buf-mapping.h   | 101 ++++++++++++++++++++++++++++++
 include/linux/dma-buf.h           |  18 +++++-
 3 files changed, 213 insertions(+), 1 deletion(-)

diff --git a/drivers/dma-buf/dma-buf-mapping.c b/drivers/dma-buf/dma-buf-mapping.c
index 459c204cabb803..02f5cf8b3def40 100644
--- a/drivers/dma-buf/dma-buf-mapping.c
+++ b/drivers/dma-buf/dma-buf-mapping.c
@@ -6,6 +6,7 @@
 #include <linux/dma-buf-mapping.h>
 #include <linux/dma-resv.h>
 #include <linux/dma-buf.h>
+#include <linux/seq_file.h>
 
 static struct scatterlist *fill_sg_entry(struct scatterlist *sgl, size_t length,
 					 dma_addr_t addr)
@@ -292,3 +293,97 @@ int dma_buf_match_mapping(struct dma_buf_match_args *args,
 	return -EINVAL;
 }
 EXPORT_SYMBOL_NS_GPL(dma_buf_match_mapping, "DMA_BUF");
+
+static int dma_buf_sgt_match(struct dma_buf *dmabuf,
+			     const struct dma_buf_mapping_match *exp,
+			     const struct dma_buf_mapping_match *imp)
+{
+	switch (exp->sgt_data.exporter_requires_p2p) {
+	case DMA_SGT_NO_P2P:
+		return 0;
+	case DMA_SGT_EXPORTER_REQUIRES_P2P_DISTANCE:
+		if (WARN_ON(!exp->sgt_data.exporting_p2p_device) ||
+		    imp->sgt_data.importer_accepts_p2p !=
+			    DMA_SGT_IMPORTER_ACCEPTS_P2P)
+			return -EOPNOTSUPP;
+		if (pci_p2pdma_distance(exp->sgt_data.exporting_p2p_device,
+					imp->sgt_data.importing_dma_device,
+					true) < 0)
+			return -EOPNOTSUPP;
+		return 0;
+	}
+	return 0;
+}
+
+static inline void
+dma_buf_sgt_finish_match(struct dma_buf_match_args *args,
+			 const struct dma_buf_mapping_match *exp,
+			 const struct dma_buf_mapping_match *imp)
+{
+	struct dma_buf_attachment *attach = args->attach;
+
+	attach->map_type = (struct dma_buf_mapping_match) {
+		.type = &dma_buf_mapping_sgt_type,
+		.exp_ops = exp->exp_ops,
+		.sgt_data = {
+			.importing_dma_device = imp->sgt_data.importing_dma_device,
+			/* exporting_p2p_device is left opaque */
+			.importer_accepts_p2p = imp->sgt_data.importer_accepts_p2p,
+			.exporter_requires_p2p = exp->sgt_data.exporter_requires_p2p,
+		},
+	};
+
+	/*
+	 * Setup the SGT type variables stored in attach because importers and
+	 * exporters that do not natively use mappings expect them to be there.
+	 * When converting to use mappings users should use the match versions
+	 * of these instead.
+	 */
+	attach->dev = imp->sgt_data.importing_dma_device;
+	attach->peer2peer = attach->map_type.sgt_data.importer_accepts_p2p ==
+			    DMA_SGT_IMPORTER_ACCEPTS_P2P;
+}
+
+static void dma_buf_sgt_debugfs_dump(struct seq_file *s,
+				     struct dma_buf_attachment *attach)
+{
+	seq_printf(s, " %s", dev_name(dma_buf_sgt_dma_device(attach)));
+}
+
+struct dma_buf_mapping_type dma_buf_mapping_sgt_type = {
+	.name = "DMA Mapped Scatter Gather Table",
+	.match = dma_buf_sgt_match,
+	.finish_match = dma_buf_sgt_finish_match,
+	.debugfs_dump = dma_buf_sgt_debugfs_dump,
+};
+EXPORT_SYMBOL_NS_GPL(dma_buf_mapping_sgt_type, "DMA_BUF");
+
+static struct sg_table *
+dma_buf_sgt_compat_map_dma_buf(struct dma_buf_attachment *attach,
+			       enum dma_data_direction dir)
+{
+	return attach->dmabuf->ops->map_dma_buf(attach, dir);
+}
+
+static void dma_buf_sgt_compat_unmap_dma_buf(struct dma_buf_attachment *attach,
+					     struct sg_table *sgt,
+					     enum dma_data_direction dir)
+{
+	attach->dmabuf->ops->unmap_dma_buf(attach, sgt, dir);
+}
+
+/* Route the classic map/unmap ops through the exp ops for old importers */
+static const struct dma_buf_mapping_sgt_exp_ops dma_buf_sgt_compat_exp_ops = {
+	.map_dma_buf = dma_buf_sgt_compat_map_dma_buf,
+	.unmap_dma_buf = dma_buf_sgt_compat_unmap_dma_buf,
+};
+
+/*
+ * This mapping type is used for unaware exporters that do not support
+ * match_mapping(). It wraps the dma_buf ops for SGT mappings into a mapping
+ * type so aware importers can transparently work with unaware exporters. This
+ * does not require p2p because old exporters will check it through the
+ * attach->peer2peer mechanism.
+ */
+const struct dma_buf_mapping_match dma_buf_sgt_exp_compat_match =
+	DMA_BUF_EMAPPING_SGT(&dma_buf_sgt_compat_exp_ops);
diff --git a/include/linux/dma-buf-mapping.h b/include/linux/dma-buf-mapping.h
index 080ccbf3a3f8b8..360a7fe0b098be 100644
--- a/include/linux/dma-buf-mapping.h
+++ b/include/linux/dma-buf-mapping.h
@@ -12,6 +12,12 @@ struct dma_buf;
 struct dma_buf_attachment;
 struct dma_buf_mapping_exp_ops;
 
+enum dma_sgt_requires_p2p {
+	DMA_SGT_NO_P2P = 0,
+	DMA_SGT_EXPORTER_REQUIRES_P2P_DISTANCE,
+	DMA_SGT_IMPORTER_ACCEPTS_P2P,
+};
+
 /* Type tag for all mapping operations */
 struct dma_buf_mapping_exp_ops {};
 
@@ -90,4 +96,99 @@ int dma_buf_match_mapping(struct dma_buf_match_args *args,
 			  const struct dma_buf_mapping_match *exp_mappings,
 			  size_t exp_len);
 
+/*
+ * DMA Mapped Scatterlist Type
+ *
+ * When this type is matched the map/unmap functions are:
+ *
+ *  dma_buf_map_attachment()
+ *  dma_buf_unmap_attachment()
+ *
+ * The struct sg_table returned by those functions has only the DMA portions
+ * available. The caller must not try to use the struct page * information.
+ *
+ * importing_dma_device is passed to the DMA API to provide the dma_addr_t's.
+ */
+extern struct dma_buf_mapping_type dma_buf_mapping_sgt_type;
+
+struct dma_buf_mapping_sgt_exp_ops {
+	struct dma_buf_mapping_exp_ops ops;
+	struct sg_table *(*map_dma_buf)(struct dma_buf_attachment *attach,
+					enum dma_data_direction dir);
+	void (*unmap_dma_buf)(struct dma_buf_attachment *attach,
+			      struct sg_table *sgt,
+			      enum dma_data_direction dir);
+};
+
+/**
+ * dma_buf_sgt_dma_device - Return the device to use for DMA mapping
+ * @attach: sgt mapping type attachment
+ *
+ * Called by the exporter to get the struct device to pass to the DMA API
+ * during map and unmap callbacks.
+ */
+static inline struct device *
+dma_buf_sgt_dma_device(struct dma_buf_attachment *attach)
+{
+	if (attach->map_type.type != &dma_buf_mapping_sgt_type)
+		return NULL;
+	return attach->map_type.sgt_data.importing_dma_device;
+}
+
+/**
+ * dma_buf_sgt_p2p_allowed - True if MMIO memory can be used peer to peer
+ * @attach: sgt mapping type attachment
+ *
+ * Should be called by exporters, returns true if the exporter's
+ * DMA_SGT_EXPORTER_REQUIRES_P2P_DISTANCE was matched.
+ */
+static inline bool dma_buf_sgt_p2p_allowed(struct dma_buf_attachment *attach)
+{
+	if (attach->map_type.type != &dma_buf_mapping_sgt_type)
+		return false;
+	return attach->map_type.sgt_data.exporter_requires_p2p ==
+	       DMA_SGT_EXPORTER_REQUIRES_P2P_DISTANCE;
+}
+
+static inline const struct dma_buf_mapping_sgt_exp_ops *
+dma_buf_get_sgt_ops(struct dma_buf_attachment *attach)
+{
+	if (attach->map_type.type != &dma_buf_mapping_sgt_type)
+		return NULL;
+	return container_of(attach->map_type.exp_ops,
+			    struct dma_buf_mapping_sgt_exp_ops, ops);
+}
+
+static inline struct dma_buf_mapping_match
+DMA_BUF_IMAPPING_SGT(struct device *importing_dma_device,
+		     enum dma_sgt_requires_p2p importer_accepts_p2p)
+{
+	return (struct dma_buf_mapping_match){
+		.type = &dma_buf_mapping_sgt_type,
+		.sgt_data = { .importing_dma_device = importing_dma_device,
+			      .importer_accepts_p2p = importer_accepts_p2p },
+	};
+}
+#define DMA_BUF_EMAPPING_SGT(_exp_ops)                                      \
+	((struct dma_buf_mapping_match){ .type = &dma_buf_mapping_sgt_type, \
+					 .exp_ops = &((_exp_ops)->ops) })
+
+/*
+ * Only matches if the importing device is P2P capable and the P2P subsystem
+ * says P2P is possible from p2p_device.
+ */
+static inline struct dma_buf_mapping_match
+DMA_BUF_EMAPPING_SGT_P2P(const struct dma_buf_mapping_sgt_exp_ops *exp_ops,
+			 struct pci_dev *p2p_device)
+{
+	struct dma_buf_mapping_match match = DMA_BUF_EMAPPING_SGT(exp_ops);
+
+	match.sgt_data.exporter_requires_p2p =
+		DMA_SGT_EXPORTER_REQUIRES_P2P_DISTANCE;
+	match.sgt_data.exporting_p2p_device = p2p_device;
+	return match;
+}
+
+extern const struct dma_buf_mapping_match dma_buf_sgt_exp_compat_match;
+
 #endif
diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
index a2b01b13026810..3bcd1d6d150188 100644
--- a/include/linux/dma-buf.h
+++ b/include/linux/dma-buf.h
@@ -30,6 +30,7 @@ struct dma_buf_attachment;
 struct dma_buf_mapping_type;
 struct dma_buf_mapping_exp_ops;
 
+
 /*
  * Match items are generated by the importer using the DMA_BUF_IMAPPING_*() and
  * the exporter using the DMA_BUF_EMAPPING_*() functions. Each mapping type
@@ -39,7 +40,22 @@ struct dma_buf_mapping_match {
 	const struct dma_buf_mapping_type *type;
 	const struct dma_buf_mapping_exp_ops *exp_ops;
 	union {
-		/* Each mapping_type has unique match parameters here */
+		/* For dma_buf_mapping_sgt_type */
+		struct {
+			struct device *importing_dma_device;
+			/* Only used if DMA_SGT_EXPORTER_REQUIRES_P2P_DISTANCE */
+			struct pci_dev *exporting_p2p_device;
+			/*
+			 * These p2p flags are used to support the hard coded
+			 * mechanism for p2p. If an exporting device knows it
+			 * will put MMIO into the sgt then it should set
+			 * exporter_requires_p2p. Importers should set
+			 * importer_accepts_p2p unless it is known that the
+			 * importing HW never supports P2P because of HW issues.
+			 */
+			u8 importer_accepts_p2p;
+			u8 exporter_requires_p2p;
+		} sgt_data;
 	};
 };
 
-- 
2.43.0

