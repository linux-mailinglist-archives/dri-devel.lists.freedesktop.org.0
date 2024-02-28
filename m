Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBA0786B0C2
	for <lists+dri-devel@lfdr.de>; Wed, 28 Feb 2024 14:51:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61D2C10E3BE;
	Wed, 28 Feb 2024 13:51:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=wolfvision.net header.i=@wolfvision.net header.b="YLsNoDi7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2109.outbound.protection.outlook.com [40.107.13.109])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77A4C10E295
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Feb 2024 13:51:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BKqU/85HsIbdNSMrEG1lwjrAN9FEy735tu3fgVRPYA8Oh0EC0dDe1xkxpr0lw1d6a6fEldkrPebTcHrodWljT6pShZIdhxAfHoUy/g8dcZGO/Cs7VloKhMCmp/TWhRfS6HhCJSeIfU6RiXz08zYdadAaWbtoAj9NpEx6stYmBBtiBTt7cd++5MzvyyB9xQflbiAUgJSv7CevhGYqIj1vuy10El+fLmcvJwHa6IZO2bP1XQh5Q5199VSGmy87kotfGp14+YSIhVS4W37oTsuMbBXRtRXz1wV8mSMbPLqkf+NE7EvaOTMBe93nYnwT6Zz6fe+GkLAGH5gYnStotsBELQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jbaOGiQnqMim73n95NNuOUW1VNxYpJ3bWE0RQMANOTk=;
 b=JNuRPAT37pNwvEG7bTydi9uQBNAucupHxJ+IErQQvdgZlYTN+JHWjox6R6Gy4joMmbxIfI3cyU6LToLPAF3b5trzO2gGDUHYJ7DBNhtjbGI53BeZKX2B2zEF895NkUNNCdpfWE+NxfyhTgYN6f8czV8YRQoZlZfvoApKiQrA1QJ298CzAd7fVEvD6iU6JMfLkxGFNzUQGGpTtcjyN05tuB/Av/fwncJLhv6CXuBYvwSK2Kyi3op9ZH7Yk+607/0vlbvSYrrMvp9I10PF3fiFVxP9lG47PESL7C4R8rBvkSUm98YTymQ12WkLROy4IQuxG7m3kmAJpgm5XtcFD4Ur7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jbaOGiQnqMim73n95NNuOUW1VNxYpJ3bWE0RQMANOTk=;
 b=YLsNoDi7l9R1QFTt2gRpjdC1hP06ZCJFlzFJt0cmGwTgdfJJg5HW04NCqP7dUStiaYGN/MpstQsRIGJcgbqmIungq13Md8h2misg47liIdITqfXx4db2HwvvEVCaeyRXjHhgxNBbywDM86HW9tCAD7tvOrdxw77MrgpqRbIw3cI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from VE1PR08MB4974.eurprd08.prod.outlook.com (2603:10a6:803:111::15)
 by GV1PR08MB10523.eurprd08.prod.outlook.com (2603:10a6:150:16a::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.40; Wed, 28 Feb
 2024 13:51:40 +0000
Received: from VE1PR08MB4974.eurprd08.prod.outlook.com
 ([fe80::9e35:6de9:e4fc:843f]) by VE1PR08MB4974.eurprd08.prod.outlook.com
 ([fe80::9e35:6de9:e4fc:843f%6]) with mapi id 15.20.7316.035; Wed, 28 Feb 2024
 13:51:40 +0000
From: Javier Carrasco <javier.carrasco@wolfvision.net>
Date: Wed, 28 Feb 2024 14:51:31 +0100
Subject: [PATCH v5 4/8] arm64: defconfig: update ONBOARD_USB_HUB to
 ONBOARD_USB_DEV
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240228-onboard_xvf3500-v5-4-76b805fd3fe6@wolfvision.net>
References: <20240228-onboard_xvf3500-v5-0-76b805fd3fe6@wolfvision.net>
In-Reply-To: <20240228-onboard_xvf3500-v5-0-76b805fd3fe6@wolfvision.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1709128293; l=792;
 i=javier.carrasco@wolfvision.net; s=20230509; h=from:subject:message-id;
 bh=Hn7W5NquFOfa2SPwHz+COI8OES/VcCwNF5nc43UmJR0=;
 b=VmKJ7Xcux+W6fAEx3Xp38ACKQhp6+Qy1MuZzC/eP9SrhshZGJ2dCLO8M6ihHyo53tOrpLylFg
 FYkWYW+yYSqD/5k2uIL3EyaM0BQJlzlbyXunq4UrUAJ1GD2SArZJm4r
X-Developer-Key: i=javier.carrasco@wolfvision.net; a=ed25519;
 pk=tIGJV7M+tCizagNijF0eGMBGcOsPD+0cWGfKjl4h6K8=
X-ClientProxiedBy: FR3P281CA0184.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a4::19) To VE1PR08MB4974.eurprd08.prod.outlook.com
 (2603:10a6:803:111::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR08MB4974:EE_|GV1PR08MB10523:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d70202a-28c4-4163-a390-08dc386463c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BDYWHIe0ZPYjksSqhvSZbRt2KGU6NDGjbmmibM/rQTManfboZhnshBWHEVGfcIBf95JKE5XpmW0XFgpnBnOO8ZsmPZQHWMwe7XsDDMQfPEwnq1TgaaRHW0Cvrj3q8fZuXlKwYbCx7+N8i8izgO5lKwAkO41Sdbj1otYViOC+xIzjEvVI7jS9lbsu+KIxY3NokXP0zfI4pN7DDBkXZ4zUxkrrrCOwUFSPjAem5E3H5kH36o7PeNZ4s+LIQakbHuzdbFVH+Sxv7ndacAbtcSDx+2Tmlb1/rxv7SSfViApZJrG6IAx7+XclkZ9EdgD/RpE3o1x18Z+Q442otrUYOsdnxKTpG7f3vrLJNuJAOZD71gwpXB3iAHn9jfum18FgPsSQpDBqNjABJHoEMHEMYNwuDjpzViKgIQ/V416Mt9KNkTW54YW1E6fmpu9cVN+NgitKJPnm4jERdUnZGjHSBLoawCYVwL/Ig/iJdAFJ3InsXEBAjFJ/2zcr7KJDgFIfzkH3I8mFvQrIY8q2TUtbSZe41YnKGkQTl0eLGoDntbKez0bAA6A+tezDYyLboo4HfXKHOb1n0Y3XizjNMze/9GGmYvlUTmnfhAXuoZwlqkv5/7PCLD3CsKED4ekirdT9VVhRZCIZZNOgffGkH3/jM6/0Qg2c0A2cb7UNjZIN9aplIghHeyvR/Bc6bADMDrmrOr0EiHKNrwWAY3YcgCaFEFB7K3cFsOJoe+nBguSfMtjeB2Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR08MB4974.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(921011)(38350700005); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RXdEOTJ1V2ZuV3haWlhzVFY5cVhMWHpPR3c4YUJvK1VPWFUvNWEyWmZaUzRs?=
 =?utf-8?B?cC9iRmMvdmZWSDNXTFNqbG9sS2owUFhTMzB6eDNmbE5FcFhFTjA5VE5odEF3?=
 =?utf-8?B?UC9Qdk84cVBrQXZhTUgxTnZoY0pWNkh0S2I3UnVmMHdXSGJFR2MzZnN4YVJ5?=
 =?utf-8?B?aml4TW5Ja250N21uM3lWWGU0YjVHNEFLOUUzSVRuZUlGNk9NVHpjZ2pCdncw?=
 =?utf-8?B?SmplT2hMZ0xVYVNUTHRDS1dLaHZzZlB3WGpKY294OE9BdmplUWxYNCtVaURl?=
 =?utf-8?B?V3NGQm5sSEtPQ0lLSWg0dVhsSGV5am03SWVBc2dsckhndGhXeGtMSm96N2JM?=
 =?utf-8?B?QmlZSVY4amJ6bWRQNVhqVGFvVkNHUUZVK3FuUEgwRFRlVFRxUnNDd05KSi80?=
 =?utf-8?B?bFNmWE1NbUhxZE1DcTVOVEtYN0lkOVdzOWtNaThndlplVnRwVzBvUjJmNE5H?=
 =?utf-8?B?TjNDVXordnkwQWgyQ0hmQUJJMURjZUFUNURjbXkyVlJ6cDE4QTZkYVJhTFFO?=
 =?utf-8?B?MGZUNm5RZjlWZFMxVlpzRTJTZlRoWUw5RGZYaWJLWGFubWoyK2Z1dEx1d2V1?=
 =?utf-8?B?NEUzS1kvL3U1bnY4d3VzRHJ1T2FvRmE5K3lPVU0wdjZsSEI4RXZ6QTl0ZFR4?=
 =?utf-8?B?QUJCSzN5Tk5uTGtzVTdGNHg3ZzZjcDZiUGZxMTRncm1FR2JqVU1nRk5iVGFJ?=
 =?utf-8?B?ek83MVpWak9VVGd6OWZ6TGxBbWNqR1QwMWN3bmcvR1Zxc1VpUGtlNlJKR2RW?=
 =?utf-8?B?YXhYZDBta01NNGVWV2prczVpeVdUcUpQRnkvYXpjeTEyYVQ5TFAwTGpMYkh2?=
 =?utf-8?B?cG85cG1HWmhSeWF3UFBidU9rUEUxbEU1Q3RWRnhTRndmUmJXdG1ETjhrUFZI?=
 =?utf-8?B?UjRIaXVmM3B4ckFMcXNlTUdaZGtGRkszd1N2T1NuRU1qZmtsVXdMTFBIczZK?=
 =?utf-8?B?Q2JWR0p4QlVlOWhoQmZIcFphMU1XNldLT2VDcm54OXFqQjQ4WWJzUFZ3cVZF?=
 =?utf-8?B?Yy9sVk05eHYvMmtCZUJDQkVNS1E1T2FFRUVhSHorMjloTkdERHVoTm5FQUpu?=
 =?utf-8?B?TStNRHBEekE3U25JMkJ0UnVLcUxsdUswZitrSUJsYUlSR1htSlM3N2ZWbTlW?=
 =?utf-8?B?WXVLOVV2amd5YitpaDF3R0Z0VTZmRnVWUktURzhjYktyb0l2Q2FWKzhNTkNv?=
 =?utf-8?B?RzZSUVZURjNZaTN5Ry8rR1YyUmxRYTdJZVlqRi80N29DZzBreU9TM3NMNzI0?=
 =?utf-8?B?R2VFaDhVNUprVWxzSnFXMnpvSXl1T3VLcWxDNGdBblhFR3AyT2VrWDF3OHdX?=
 =?utf-8?B?RkU2d0FtOVZxY0FtN3YrQkp5K1pFQlBNU2VXVjNEZk9tNHh2WlRCUFJIVWxR?=
 =?utf-8?B?NVlsYnROeWtSZ2p3bVNXY2Q1L3ZHT2dXU3o1QXVaa2hEc1UwaUh0aTdNUzZw?=
 =?utf-8?B?SkdSbFZKaWlCZ0U0Z2pYR0w3VmlyUFpnYjNOeHhPcVFhZEpqeXozbFFBejF3?=
 =?utf-8?B?UWxTOTFMYmxpVXBFZU5CRzV6YjBXOThBT25ObzloQjNBcENUbHc3b00xZDlJ?=
 =?utf-8?B?QVMwNzBwWTh2bUtYOWl5a0I4SVpsZmJsY3kyQlJmdmJZT244RXZJQlBLaDBK?=
 =?utf-8?B?Q2U4YUMySEJNKyt1U0J0elZZSVN0anVsNFhmNkxjWXVmOGxjS1U4Rmp0dy8v?=
 =?utf-8?B?Z3hNTFI2cDlwU1hrS2FxUkY0dFNTUFNqRzhiWkgvejk2SGtBUnlxWXpYMXJ3?=
 =?utf-8?B?RE0wR21PWjN3TzN1akhwS2dWYk5UTHN4QVdwY1N6MmNhaHpmWko3UVY1NzlL?=
 =?utf-8?B?eUxQQ0dFeDAzNGJLdlhNWkNMaHdZT1NiaGhnc0V0WTduckJJcXp2aTNNK1p3?=
 =?utf-8?B?aFhvUjlxNkg1V05tMml6by81djJvaDJkWVFLdDk2MlYwRkVzTHFqeUxuMm5L?=
 =?utf-8?B?Wnh4cm9hQSt2U25sRkk2VXBHTStBdnJuZ2Nzbmw0NEIzNndpRUEya241SHBw?=
 =?utf-8?B?OHd4UEppbFQySzJ6cTNYd2ZxbHZrREtTeHVOeGVXNzB0c1RKbGJRa0JwRUpN?=
 =?utf-8?B?SjN2N3RiNDdKZkU2dWRqUjcvaHN0TEp3VmRUNHNJUjJ4NWNDVzhQM1dWNVBQ?=
 =?utf-8?B?V2pZeGQzQ3JlRGFNbHFIdkNiNGJDYjBEa2dtaW1SNCtvVGQ4OEdBbXZsd1Jo?=
 =?utf-8?Q?z0iPRAK/TNSmIGpL88w//as=3D?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d70202a-28c4-4163-a390-08dc386463c8
X-MS-Exchange-CrossTenant-AuthSource: VE1PR08MB4974.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2024 13:51:40.3111 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3yxbFNhvl7c3fOcdaDTCJcQm4z0JjYoF44n28F3O/lboenj66wdbvk/iiw0cL8RYSJg4sd+SPBB5SgVbnkxLGZ0EDVprV7s34Ibq20jH8vY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB10523
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

Signed-off-by: Javier Carrasco <javier.carrasco@wolfvision.net>
---
 arch/arm64/configs/defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index e6cf3e5d63c3..3c6196b6c984 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1047,7 +1047,7 @@ CONFIG_USB_SERIAL_FTDI_SIO=m
 CONFIG_USB_SERIAL_OPTION=m
 CONFIG_USB_QCOM_EUD=m
 CONFIG_USB_HSIC_USB3503=y
-CONFIG_USB_ONBOARD_HUB=m
+CONFIG_USB_ONBOARD_DEV=m
 CONFIG_NOP_USB_XCEIV=y
 CONFIG_USB_GADGET=y
 CONFIG_USB_RENESAS_USBHS_UDC=m

-- 
2.40.1

