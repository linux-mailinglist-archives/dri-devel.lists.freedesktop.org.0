Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05AFD86C39D
	for <lists+dri-devel@lfdr.de>; Thu, 29 Feb 2024 09:35:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B583110E2FE;
	Thu, 29 Feb 2024 08:35:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=wolfvision.net header.i=@wolfvision.net header.b="L94uPR0e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2110.outbound.protection.outlook.com [40.107.22.110])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E7E110E116
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Feb 2024 08:35:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GZbFehUjKvkXPh4coxyVfhzXhRcuURNpaQylt1ua8cQV2IQHLBVjkaCwZp7r0oG7+mnE6yZsYei079nHy4vE6pt+JgTJUaK+EubgpLlqpilO5cYtA9dz8FD57a6JZbLYoc2RBPf62jXMQqW7thSewQE0i1XPkHaQOCZGQq8g6iXNDnvXDINHOzLKBDPVDx4Q8NPUL/QQYwTQiFqZUCdVpP+Z5g3MWDnKdtgQT6c2t9N3zD5OaTlsL5/1dLL9goRnjOyl6NlXP0/aS6Nu79BL4gwKBq16CgkLhBQIQn3NWpvnCyiHnViA506/OdDRw2IAYWuk/5mmigDeO0e5I6EcVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MWT5qTUoBybcuWRrrtvTKlGHfdiit8E0volSwnQvULs=;
 b=QxGyhAbM2yjJpwhq3JKeLUD5XD3e9c2Rwh9jswoEZdoP1ddVAWWppObC1iW8tkoWZjeaiH2CDg3162izFNVt4FKF4pJOh3bRq8MXgvfrL47hcwWITeEaCJ1k5wR3i7s0ooMCb8Cf99aAPXj7/CyKj27J1XCJQAtN6oYPRybVDiEHgYH22m4OS1qImp4ozs4B3phyiSudzS/o7MSpkbw9iAVupAaW998jJaFsnwHgUdgbkvC7+Q+6XmsN5P67jXJOHOSVF0TLu/WvPzrPF1xO2mJJkAQpVkVpvPFvsDQ8Qfos/UX6oauMvqWVbZwId3f43JWuQrNQxBb6xqZAmcR+CQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MWT5qTUoBybcuWRrrtvTKlGHfdiit8E0volSwnQvULs=;
 b=L94uPR0e2NWCb1XaR1tn9Y3a72bJE41fC0Z8Cas80NjUQQqX/TZ43Fp6RtBbJQRKMDf0xMlub6WliII1Qyp/PmrU4HI8EbuwV2GWaqDyxJWoB7OUTAFcJ8Su+t8ysjy+Qxn+vZrCtSHFxe3D04+kYtIyX5knHtMAw5b6PA7PuNY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from VE1PR08MB4974.eurprd08.prod.outlook.com (2603:10a6:803:111::15)
 by DU0PR08MB9727.eurprd08.prod.outlook.com (2603:10a6:10:445::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.41; Thu, 29 Feb
 2024 08:34:57 +0000
Received: from VE1PR08MB4974.eurprd08.prod.outlook.com
 ([fe80::9e35:6de9:e4fc:843f]) by VE1PR08MB4974.eurprd08.prod.outlook.com
 ([fe80::9e35:6de9:e4fc:843f%6]) with mapi id 15.20.7316.035; Thu, 29 Feb 2024
 08:34:57 +0000
From: Javier Carrasco <javier.carrasco@wolfvision.net>
Date: Thu, 29 Feb 2024 09:34:47 +0100
Subject: [PATCH v6 4/9] drm: ci: arm64.config: update ONBOARD_USB_HUB to
 ONBOARD_USB_DEV
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240229-onboard_xvf3500-v6-4-a0aff2947040@wolfvision.net>
References: <20240229-onboard_xvf3500-v6-0-a0aff2947040@wolfvision.net>
In-Reply-To: <20240229-onboard_xvf3500-v6-0-a0aff2947040@wolfvision.net>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Matthias Kaehlcke <mka@chromium.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Helen Koike <helen.koike@collabora.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Russell King <linux@armlinux.org.uk>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 Javier Carrasco <javier.carrasco@wolfvision.net>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1709195691; l=1052;
 i=javier.carrasco@wolfvision.net; s=20230509; h=from:subject:message-id;
 bh=8N+eqRO95PGeajXAAAiRwSPUATjuHBDxxAPxCCAJmv0=;
 b=djF8NfiKqAfVC16/JUrhMCP05aTDqkFUZ6E5NfjMvcZd9wHXT8V4l9OyFzGyZnGmppFUG6+n3
 EI8L7WQQDzTA0wCTDzwZ0ndPZXsFjUK00EAXW0KPU9v8enroVfu2MdH
X-Developer-Key: i=javier.carrasco@wolfvision.net; a=ed25519;
 pk=tIGJV7M+tCizagNijF0eGMBGcOsPD+0cWGfKjl4h6K8=
X-ClientProxiedBy: FR3P281CA0020.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::21) To VE1PR08MB4974.eurprd08.prod.outlook.com
 (2603:10a6:803:111::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR08MB4974:EE_|DU0PR08MB9727:EE_
X-MS-Office365-Filtering-Correlation-Id: ca5fea34-ddff-47db-63c6-08dc39014fa1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GB2lPSk8vmg07IVBKnP4pYU1UCyMmOzrn25OzXyR7ohNDkyQ3T9LFmxb0P0V4lkMhONgdS4rlTnK9AwAThNorypmaxAisBmw8TXHXwjxYXjQYG0WUeLMcS2oVwB2aPATW+BKOWWiDHEZMmcxg5H1IKYdChGzk0AUE+7ZI8BgE8QL56T01BlSo0W62r3pfANl/O/yNXvkX3tcwBLnF4wKmhYrsnYsEtHNASMF4b13T7oBWX3njmVtgAJS2AxzVS1+dTrGsxqVBaEqxG32dPXgpdiCWHUE1HQrQjX+av0wjD1TGHfobNfX043sH20pTtG0tL7kiXQ67YSVzhP9mzqsOovYikTmQG4YaAjCohbTAA/4JRGwACqaC+jHk6lvdfedrGufnHDhH+tCZfI3TKbM/JgrTVDfRva3VqKdaVEvUTd3NMEiuAgaILdvFmRodBSl+UqS/ytH/zrYWwIR8v0V8utU2dN/FOTvFmCd4g46qjRLfn9Fdkvhfmu9+PLXFCPp0UUbV7EGEgN2EPwkvgr8RaVNz01+6dL2jLifTZzPkt3xb5HLz/cB/TQaC3POKyl6r88Hj4sOM+RmRvaVliVkjK5O8QLDlChkgUaezmFWSo0EvGIUqdpJfhcGRKeNdTarc3/mG0gEHg/MZ/ZVIwdxuuOnkKm5nD7ePukkdiO1tyv+XfB6z7TZqsgHL9w8buKgr+w3IGf+dO1a7dRJ4y5WiYYKnAa9lLlAOomT7tcw/fg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR08MB4974.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(921011)(38350700005); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MnNESzB0L1oxSjhNVHhFQ2VwTEtyWkduTklnclB6dHFPQ04xeVRHbTc0Yzcv?=
 =?utf-8?B?amNmeXBDUUphVGpKcEVvK1Nwc2xmODBNTHlTWlpuMWtMQnlwdk5xcDNzTjg0?=
 =?utf-8?B?N05JRWszaDVUTUR5cmZVckpKck5mMDVURUF2UTNCakVDcjJjekk5Tlk0WUhh?=
 =?utf-8?B?Ym0rTmJ0THVvZWtPd1BvRThRNHltL1h4SVhVSXdIbDVHeGEwVjBYUDJUTk0y?=
 =?utf-8?B?WWdNVXIxeitETktkVWZKU0RKbDVtS1FJY0pQT1RoNjBBTHpiMWN1dkVWR0tp?=
 =?utf-8?B?L2FzVVNZZ2lUOUd6aWEybGZXbkRlTG51bi9WdXFnQnFsVVJqYU84bHZ2NGd2?=
 =?utf-8?B?aWdud2t3MXdDY1doWDZQRURkalNMelhxNkUrVTNrTzVGekRuWHlpR3NhejZw?=
 =?utf-8?B?NXM2M1RNRWRQdVVWKzNCRHQ3SUh3SkwzeVZJZ1VlZ1BPRGdIUlhRQkk1UXRB?=
 =?utf-8?B?Ti9TY0pVdGJsNDFwdWw0K1Nld0s4UFRkaHRzMmhqVFhWUjREZEM5ZWdjVG9S?=
 =?utf-8?B?aGpaV3lsaVBrQTF6ZDBBdkRQODdUeFp5eGVmYWhFOVd5M3VlY1NjaFp4T05y?=
 =?utf-8?B?SisrTVhTZjVlSjMzYjl2QWpRc2lteXdzcjFSYjlVZnF5d01INTBBUjdYZHpS?=
 =?utf-8?B?bytzcTMvSEdVblRKNUtVOW56RFJFeHVycm43WGUzY04vM2NmMkZ3RDQ0TnNp?=
 =?utf-8?B?bzl6TER4Yk01Yjd6d2ZWWDRmOWNOaFlUQWdXZjFFN3JiSy96L0hmd2NnQXUv?=
 =?utf-8?B?UGZ0bWtSWXFUSm5UV25IZ0k1a0JIMDBOVzh1dG5kTkIrQVBueHVUS1Bpckk3?=
 =?utf-8?B?Y2d1MWZ1OXhLZ05uRzNBYTQwbjkwZXYwNEVTSEZjUnN3VGRQQkRlN1J3dVhW?=
 =?utf-8?B?TzlrLzlnL0Z5SHdaeGpnTzRYYStwOXB5Y2kyZkRzMlRDYUJQMUdWSzhvbElV?=
 =?utf-8?B?RWdSaFVKa2kyQnJTelJhclY0NDRvd3FpTjdvWmJyVVNSd29xL3JxMDEwa1lF?=
 =?utf-8?B?T2twRUlqK3pINUpxODE1N3ZCYXAvSmFEQmh5YlpLbjZzYUtnSVJnKzBianFj?=
 =?utf-8?B?U2dBL2hqaEJ4Z2VsRG5xclJhU2F5NkZ3V2Qzb2V5WE40b0F0UUZiVHd0cVlv?=
 =?utf-8?B?SUMreXAweHIzYzJ2RXNkckRJYkloL0lFUnRmdHBXVnZKZkovWWxGU3hCa3c3?=
 =?utf-8?B?bEpDM2FMMnk1RHh0OEhsOTZXUjJpTjFoUHlibUNwS3lRWGdaRlAzaDl2SXpr?=
 =?utf-8?B?bGhLODh0eTVvSzdMMFRJRkdmOXI1ckMzVHJFaFlCRWJUalMwNzVGVzVwejVq?=
 =?utf-8?B?a3NJSGhmWjBBcGkzVW14WnpORmNNUXQzOFB6eHdtREQyL29IRklkSUdrOWJI?=
 =?utf-8?B?eUhHblY4Yy9RR0x4THlYL3NjcnBVdVRiSjJQWTdmajVoczR5T050bldlMmh0?=
 =?utf-8?B?d0t2WDdGQm5HZGRyVXo0U00zM3ZjeklDU3dqR3piUWpmcnNpbnRPK0lTM25t?=
 =?utf-8?B?R3ByYVdVMnZiTWw2eXM3bEUxUGI3dVRoM2hva2JIMTNYZmtocmxqcVNFbVRh?=
 =?utf-8?B?Z3dqYjRkazY5VlNYTHJBUXI4eWdYaEJpN29oUDdEWVphZEhnUHRDTVgvaVh1?=
 =?utf-8?B?YWJ4c3pleWZNZmF6ZTRvOEFxSmxPRmdwU2YyU2l1UTNQWTMxZXlMSWZRMVI1?=
 =?utf-8?B?eGtZc0w1UlB2aEdETFQ5QmJPTzRjd2c0bTdTeUhEWldrcTFIeWk2NmdTV0t1?=
 =?utf-8?B?NDlsQ1NkWG9aT0NlVHFEaHZSSXBlWFBaUlovZGc5ZjE2WG9GMEpUV1NPYUFh?=
 =?utf-8?B?dUNCK3FmUVdMZjhHcU9PbkppR0pEQmJ1cjBGZUdpSHRsck9KcWs4SVp1eVp1?=
 =?utf-8?B?dC9JVm5wa01rS1U3MlFob2JVbU1qODhmL2ZSRStLd1hQeGdKSCtrV0ZHeWpz?=
 =?utf-8?B?ZTRrbDMzdlBYR1M2R3p0TGJDUWdrODZ3QS9Ma0o5VEFLeXBJY2hOUHFDMklN?=
 =?utf-8?B?RHhtSE5kZDJ3dTk4NnE5aFZtTjQ5dkYrWHZocW1OcE9Qc05maWtmRU9vY2Nt?=
 =?utf-8?B?eFdIdkM2K3BOelM5YnlMdlRINnJ5c2lkV2ZpZUV1bzdlNEtLSVBOTFN0azA4?=
 =?utf-8?B?bCtLVnlkdm9HWENOd1lwQXhSMk0wb01LajIwTVdOODMrN210R3dMYjRhaTNl?=
 =?utf-8?Q?gnfxDc4ou4GOoYtVgJosuj4=3D?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: ca5fea34-ddff-47db-63c6-08dc39014fa1
X-MS-Exchange-CrossTenant-AuthSource: VE1PR08MB4974.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Feb 2024 08:34:57.4894 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qj14XHEr/ZU3L07Blmsmm0BlURjNX0Zj3bny8dVa8Z30mjQMkZuQOuVG2Cck/3erIKyhC/QaD6YZLThZZ1KOyOmiNuO4s/8sqplBHgNAicA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9727
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

The onboard_usb_hub driver has been updated to support non-hub devices,
which has led to some renaming.

Update to the new name (ONBOARD_USB_DEV) accordingly.

Acked-by: Helen Koike <helen.koike@collabora.com>
Signed-off-by: Javier Carrasco <javier.carrasco@wolfvision.net>
---
 drivers/gpu/drm/ci/arm64.config | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/ci/arm64.config b/drivers/gpu/drm/ci/arm64.config
index 8dbce9919a57..4140303d6260 100644
--- a/drivers/gpu/drm/ci/arm64.config
+++ b/drivers/gpu/drm/ci/arm64.config
@@ -87,7 +87,7 @@ CONFIG_DRM_PARADE_PS8640=y
 CONFIG_DRM_LONTIUM_LT9611UXC=y
 CONFIG_PHY_QCOM_USB_HS=y
 CONFIG_QCOM_GPI_DMA=y
-CONFIG_USB_ONBOARD_HUB=y
+CONFIG_USB_ONBOARD_DEV=y
 CONFIG_NVMEM_QCOM_QFPROM=y
 CONFIG_PHY_QCOM_USB_SNPS_FEMTO_V2=y
 
@@ -97,7 +97,7 @@ CONFIG_USB_RTL8152=y
 # db820c ethernet
 CONFIG_ATL1C=y
 # Chromebooks ethernet
-CONFIG_USB_ONBOARD_HUB=y
+CONFIG_USB_ONBOARD_DEV=y
 # 888 HDK ethernet
 CONFIG_USB_LAN78XX=y
 

-- 
2.40.1

