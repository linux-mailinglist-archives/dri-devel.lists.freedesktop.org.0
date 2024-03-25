Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DADD688976D
	for <lists+dri-devel@lfdr.de>; Mon, 25 Mar 2024 10:15:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F7CB10E684;
	Mon, 25 Mar 2024 09:15:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=wolfvision.net header.i=@wolfvision.net header.b="o4xODtFQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on2091.outbound.protection.outlook.com [40.107.8.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55D4610E684
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 09:15:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RwZ8DX1JUQKH8nC6SC/SHM+nTF/N65ED0uj5qTuNgoKj8FqDKihSXs5bj9gWUaxmJJTLegZnODIJcyywbjtejiQlei5aaB+ur+reVLu24EKOoOO0M8z5cX4iZXQbgyb4geEMkFrZmBTphJkTuo5OZyliVr2w40MfrND18Ohkl9kGwuBzxO6KQIK+BKqCHG6Hn0cmqAzcuDT/75tuo81wqewAaOxNUsm9nuXDD/aQw8Y0r5spfC7gsmTIvoMxNxTvwNTyn39c8Y56uDGfWkOQCo+o010N7JFoEEuoa9a/NLJ7Ne2kAgpKsIz7rCylly+YBcx853I0WYvFdrnNLUxMug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=27+M+LbDLnHsClzqGVg0LPstQNKuBSCxXcEAn92RFTc=;
 b=Vp/GLoTukD1e0qhqGYGxMobbCtLu5OwyTieUXcHMWUHaodRuDcfTZy/TcNU4f3Ub2e91lbERtQ84xM1SdfiiInz4+T7IKCSI6CW1MegaJn5b7XrHyCF0DOyZwD2RcsvUJ5e1OSeVOgZXtLrv3N0YJgBXB+4Pu7bpKA84vtaxXnmHAAQhX9FGMjsEPxOQO/eQfhTXe3jiOPAbVCuMxeLjHKJaJoEpUeiN1Ee3IXFQy4RlLOTPpNTONFhQroNTrQYOtu4skqUywKbL9u9fygmvysbGczQv5jJCrXfiY+VlVaBli34pP2NTnMGrxX1YJLqfqOgSlsTBCtqC6t0fdl1yig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=27+M+LbDLnHsClzqGVg0LPstQNKuBSCxXcEAn92RFTc=;
 b=o4xODtFQ2Q8V7q/X2BfVDvHEX5CXPV4k7kQX7xKddk5kDWCPsRENOCXtbDEm4THSbxARALTZBzAVuNF6umvM7AVai/26K8lennOYnwrgoH0Sr44nQqsJhhX8Vx9AUy7T4ntAPEctHw+/5MjBjHNa5KvO5GMJhYk1XBlmWSl3rdg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from VE1PR08MB4974.eurprd08.prod.outlook.com (2603:10a6:803:111::15)
 by GV1PR08MB9916.eurprd08.prod.outlook.com (2603:10a6:150:a6::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.31; Mon, 25 Mar
 2024 09:15:18 +0000
Received: from VE1PR08MB4974.eurprd08.prod.outlook.com
 ([fe80::9e35:6de9:e4fc:843f]) by VE1PR08MB4974.eurprd08.prod.outlook.com
 ([fe80::9e35:6de9:e4fc:843f%7]) with mapi id 15.20.7409.028; Mon, 25 Mar 2024
 09:15:18 +0000
From: Javier Carrasco <javier.carrasco@wolfvision.net>
Date: Mon, 25 Mar 2024 10:15:13 +0100
Subject: [PATCH v8 3/8] drm: ci: arm64.config: update ONBOARD_USB_HUB to
 ONBOARD_USB_DEV
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240325-onboard_xvf3500-v8-3-29e3f9222922@wolfvision.net>
References: <20240325-onboard_xvf3500-v8-0-29e3f9222922@wolfvision.net>
In-Reply-To: <20240325-onboard_xvf3500-v8-0-29e3f9222922@wolfvision.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1711358115; l=1103;
 i=javier.carrasco@wolfvision.net; s=20240320; h=from:subject:message-id;
 bh=DmgEWOcnW+zWzi4DnyV1Dvia2Y3q3WjzCukDR64EU/g=;
 b=UNIYRRZr6YsraDPLYbMW8uAQtKABw/zfT0ZuHTJTlc800mDSSbAPFV0oQ9R8582k/gx8McDgd
 sj0UY5lXm1CB4JaGbgWiYDK+lj5SNbbTx6s+E659iM9cRhIZFQt6UNs
X-Developer-Key: i=javier.carrasco@wolfvision.net; a=ed25519;
 pk=Vxk2/0sGIxM8rsKnceszFuSuHVfQwa1Yo8+is7BX2nY=
X-ClientProxiedBy: VI1PR08CA0223.eurprd08.prod.outlook.com
 (2603:10a6:802:15::32) To VE1PR08MB4974.eurprd08.prod.outlook.com
 (2603:10a6:803:111::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR08MB4974:EE_|GV1PR08MB9916:EE_
X-MS-Office365-Filtering-Correlation-Id: d50c49b1-2589-4dc5-39bb-08dc4cac16af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PR3kVn9wsFqDTIe03bcYnDKqa/sAfQ6sbhGyo+bMh0FxaUrLDnntbE/S3kQR9EY04/XZje/ScqSDcGitTwQquMFSG+f2zWlVRR3d6fXxn6/zJWYFRiqz8463c8zlmlnYzreWmc7VRXB/N0mrNL3D2l4rQnTmhmfmu/nVdWnW1OL/tKzNWsW5QcLd75HladcN1ak1CjLpLDQBZqyeu0iUeKQIPXl67gPEG4AtPIeh4g8Ne2b3IiUzU14AkLeBagCtxp/5iRwk6X5B7VvigxRpX6rfyDpn7g9eFXS1bViImu/DKjjMeL4KlXNLYqOP9qY/okUw+FMahv4HbEq4SDYFe5vFjn5H6wTYf5Sy2oK+YvEC+e98U4aHXfyhLYY4U675BdAXyIAOxWs0N67HlD2lqeJyyPeSHhdGHDuTIfuu5IMqa9y7H7Je4WHqqKPDazRE+cmTAFx4OWPO6SpSOqTZrOhfeOazpKYg5+LpkH+nvwy+hdysT+xTp6nm+Ac2ugxfjt24+FF54LfpxYBe1ZMLKQAKZwuI+2YZG97vKk+qeROQ+hgiGmceRsCrohylQymRTixEqRQymH5eDyC971w9IsQvDiUREiZeOaJBXix4OcWfxoSZlQnPWyq3dxsaaPYWjIHLNGfvHzK9dvNslmKDcqTy4XbBp7bbMkRWW2rU990G4XRIQWGo64HBMQjrwRZoxEIuLmU5jMZO27R9P9GoBQxK3b5QbunLaehqkyG6LSI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR08MB4974.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(52116005)(7416005)(376005)(366007)(921011)(38350700005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NkNncWY0MWJ5d0JmV2JFd1REQTRrU2hJbnNSOFc3TWpQUmVmWjZnK0gzd2Iv?=
 =?utf-8?B?T0lYRksxTC9iQnRhajZXM1NxRVdmbnpLVjhRVFNnZHBqZGgwYnN4aGJDTjVv?=
 =?utf-8?B?QmwxazE2Q0x5c1hpWHZTbGIwL1Q3QktoZlYrazRxN3pFRFlJb0xyOStMdERL?=
 =?utf-8?B?aWVGSWk2WGhPdVNwcm1rcm9oQS9WdFBjNDBtYTBoSGRqVnZVbU11MU9zbS8z?=
 =?utf-8?B?SFFZS3JSODk4QUt1NnA3WXl6OWEwRUdDTEdCZnQydDBHWlNZdHZrdnFaaVJz?=
 =?utf-8?B?UmhsRTVHMWlNa2Vsako4UHhXSDU3V1gwSG10YXBuaEs1aEtXNzd1VktmUjN1?=
 =?utf-8?B?TC9vNUEwRlBjY1ZkQzdkYUZEdXRtSkV6N0U4ckN6Mk1JQXNKZWJOQnNNZ3hF?=
 =?utf-8?B?V29rZy9Sb3RRQTh4bWwyQXlVaWJBT1l0RVorV1hNQTVmZXkwbVVqcUNMalJx?=
 =?utf-8?B?MUlUQmk2bEZManR3OWo4QlU5Z2JYVk1sYkxTdEh5ZENsRmpXMm81eXR6QWxY?=
 =?utf-8?B?Nm16WU1GSWw2MFo1RGZnVzhhM21ONmg5bkhmWFJkS3FhQ0phNkQ3N1RNZ3Jr?=
 =?utf-8?B?bTJvVENpVHJhU0l5a0pOMGVHdVBZdSt3SE02bWNrV09YK0IyaE11VCt0ZUxL?=
 =?utf-8?B?cVRSbGhSQk1LSTQ1ZzczUnh2WXlMVWtRdUU2MVZ2WFR6UUZkcU1WQlo0UzZm?=
 =?utf-8?B?US82SDA0dFozV0dNazdCOGhMbGE3VnNLcHRmSTBjWFJEVlUreVdmUll4Nkhu?=
 =?utf-8?B?ZldhTmlkaDJJblcxVlVEYkFTMG5mZkI2djFWNVhmU2x1RW9seHk2aDVsWnRN?=
 =?utf-8?B?TzJmNVBzb0prN3ZoTXZTblcxTjNOeVR6dDdPWUZ6U1p5Um1Oa2dOcnNEL3kz?=
 =?utf-8?B?bkNBSUc4OUNET0xFU2REVzA0a1BsQkNSN09iV1J2eTVlL3NVYit6dU5pYS9y?=
 =?utf-8?B?dzFXVHpBSm50R1lILzdmdjc5WENmNHMzZzNsekVpZWNFRFNUSG1HNm9BRGRz?=
 =?utf-8?B?Ky9meHBjSXRaVUQvdExqeFd3WmdsT0ZGRDFydGo4Skt5bUl3ZWhkVGpqdE1W?=
 =?utf-8?B?bXhzNWt5VmRYcDE0aGdIalRaeVR2OUNuZDlHY2hZR3ZDVmN6ZE16WXluVWVj?=
 =?utf-8?B?RjBBRnJST1Z3KzBWMVhCMDVEZlFlWmlYSlBUaHhEQ0N0QUJEeGRJS2RST1Ft?=
 =?utf-8?B?Y2hoc2xTb1dVVUtQTjE3OTlxcXVOQ1pGTFk0NjBEczlTVDA4aEl3YzVnMldl?=
 =?utf-8?B?QUxxeFZuV1loTnlVR2FMV0x0VW53QXl5RDN3aGk5N2pPM01hMmZPV0dsZ3d0?=
 =?utf-8?B?bXM4NmpjR0pmUEJxdmZDalVvQkZzNTU5RG56b0svWC9hbWcrRE1CcE9rTldw?=
 =?utf-8?B?VThCYUcxaGJoUVBkQWcvOWJNV3RaV2l2ZWVYOHlFMUdTQWVJUk1FTXcvZU5y?=
 =?utf-8?B?WlU4bi9MUFROeEtSM3RqdlBRa0c2bXJaZTJTTVBPRW5RN1BYdlhuMW93VjFn?=
 =?utf-8?B?clllNDFxQlYzUk1PcnVPb2pkdDlWNTB1ZS9NS2ZHeDhXWEMwcGppR01JakNI?=
 =?utf-8?B?N3ljYnNlenI2V0E1OVJ1eGt4K3dvQVlidWRwdE9vZ01pRy9GYWRLQ0JHK0tr?=
 =?utf-8?B?K1BMdTVHVTZTZXh2OWQwdUJsZXJDZFVZVHphSERrYlZQWUlaKys4ejhFUzI5?=
 =?utf-8?B?eHBoNG5iTjBxTkZtdng1bzRRbU9VN2xnZm9PS2s3S0pGSEpFRWlaNTVqZi85?=
 =?utf-8?B?dC9lS2IxVm1pemdMdnZ0eElrVzJlMUJoUFdTaWgzd2dPRk9Mc2xmTk14TzZp?=
 =?utf-8?B?eHhxclFlaWYzdGhFQ09aZFUxdnMvTHNHWmVBc285ZHRtdlV2SkthR2Q4VEF4?=
 =?utf-8?B?TUxsOHlXSXlXMExnVm9vM1E0M2xZL05LdWhHbDRpTXFnQW9peCtBdWRPVG5x?=
 =?utf-8?B?aW9iRnl4b0lCMmt5YUVId1Z4NkFzR1JYNDBsQi83QXBRRlFTdXFHbE1nNVhD?=
 =?utf-8?B?SE5Bc2xRZmFYT0VNdU9WOU9nUWV2ZGdNM0RZbFdaSGF0TmVzdkZpaEhmY0c3?=
 =?utf-8?B?bEJoUHNXeVk3bUF6UnRJYThyNjdncFpzdWYwZEQrM0xvakhJSEVEQkJ5Sm9C?=
 =?utf-8?B?Ym1KSXVndzZGNVJTMU5jT1JTYVVqQlYwc0ozMjU1Q0RhZVhWREswcHY3VjQx?=
 =?utf-8?Q?anE7MtagiVs7rGWXgDi2TOc=3D?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: d50c49b1-2589-4dc5-39bb-08dc4cac16af
X-MS-Exchange-CrossTenant-AuthSource: VE1PR08MB4974.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2024 09:15:17.9433 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o2wPMienWiIWf/OBpOXBVgu4QdmM4Ee2X6bCABpfh4ZqRxjYO9ZvFTvkRve6YhZhBP6vAMPvc1p0WrzIH6hGAWAvFLdG9pSMCcK6rCwMHGw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB9916
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
Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
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

