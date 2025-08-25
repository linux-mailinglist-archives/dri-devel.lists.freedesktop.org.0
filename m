Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE736B34A7F
	for <lists+dri-devel@lfdr.de>; Mon, 25 Aug 2025 20:40:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C711810E561;
	Mon, 25 Aug 2025 18:40:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=outlook.com header.i=@outlook.com header.b="bl9p1o2R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU010.outbound.protection.outlook.com
 (mail-japanwestazolkn19011024.outbound.protection.outlook.com [52.103.66.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 697B110E53C;
 Mon, 25 Aug 2025 18:40:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kiRA4xWvegrCozbr7KSpqJLsqroafoYIEBnVYFfjH5FOrdUS20WEydJsKOXyRX8ZRKtQoWO5J+oDmC4h9zjHXhf3gD+JkZP7W92TzunAIOnqWT+aahqUSZTzt+mRzGNrb7XOsXhmcO7/UFYSdCykMFQxpiVPKLUkQgLwYxYz0NpsSYZ1+3qQrlhBad7wyK+m6/JewA2wS6qpCoz52hOO999yC4hf7EiWpMQ2n3AeHrh7hZl0lEDKShnpTljx78M/oNpilBb/g8EzRlYZAsq7k67WwoaAP4IUfPOYPGzyQ9BAA4bfia0RZhLsAEejP/eT+rKrPcnqJRdxU/p2si5gKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hD1XJOl31y8OZd6SpV/B2Jfi8KwrMjXOwmrBCiEi9O8=;
 b=ORyPpmfFmnEryD4AmrcnN81MoHKZDm6Fq5rSR7mXrC2ioJWEgDU+sRH1xw23MkXfJbCPXaT+C/D2QYVa2MhsYG2/g52mRzoep4FPwHPuyDQOM3twp6zMtX92F+RKfSZ9d3X6EDTlB/HUql0abEzteaeb7/Sg0idlLOHjH+zFrlgrrnc3ig+Hfhg2NDInFXxZQFsHk2M1kN9sbznP443zNCjyJ16awQWdhaBkEfa3VcFZXD+are9FhfrzSRDKlJt6SIoa72iUo3kLylcKQACt/wdZuoK1ISui3ATpMX/iD/237BLWXP9Ak0ZO+ccsQpLEIdewL2ZTC07REkozr5WQog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hD1XJOl31y8OZd6SpV/B2Jfi8KwrMjXOwmrBCiEi9O8=;
 b=bl9p1o2RWtoawp0dHWxTiCBAJjPF6ps8A91dioSR1z053106s2q5IX548E4d4KynpvB6FrD4lnxQyA1+vHFcfQv6YB3eit1Cc7ymybo2qFJpKP5AaPn3fBrv5Kji3HNjKJJWQ/JXPbGHPsxkT8FjkwiBBUVeflAWhPuaRYKCtinlhjIn2b/c+ntHOxARN/pQ2eg81taTMG9aiclC5zgIDw1dQ/WD9cQwNsguNDF9XX1orGZ+CHlKRd6jZrw7gunGzPRGOLXG7w+8qAk7TqePVnpPQEPTvuiv+h7yNSHFfW/XdSkFIFbkCPGqCL+KmO4ConhtMMrkXunyq3fv/+7lyw==
Received: from TY4PR01MB14432.jpnprd01.prod.outlook.com
 (2603:1096:405:235::10) by TY4PR01MB15954.jpnprd01.prod.outlook.com
 (2603:1096:405:2c8::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Mon, 25 Aug
 2025 18:40:16 +0000
Received: from TY4PR01MB14432.jpnprd01.prod.outlook.com
 ([fe80::7679:e9eb:aeb2:f12f]) by TY4PR01MB14432.jpnprd01.prod.outlook.com
 ([fe80::7679:e9eb:aeb2:f12f%7]) with mapi id 15.20.9052.019; Mon, 25 Aug 2025
 18:40:16 +0000
From: Shengyu Qu <wiagn233@outlook.com>
To: alexander.deucher@amd.com, christian.koenig@amd.com, airlied@gmail.com,
 simona@ffwll.ch, harry.wentland@amd.com, sunpeng.li@amd.com,
 siqueira@igalia.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, contact@rafaelrc.com, lijo.lazar@amd.com,
 jesse.zhang@amd.com, tim.huang@amd.com, dark_sylinc@yahoo.com.ar,
 mario.limonciello@amd.com, alex.hung@amd.com, aurabindo.pillai@amd.com,
 sunil.khatri@amd.com, chiahsuan.chung@amd.com, mwen@igalia.com,
 Roman.Li@amd.com, Wayne.Lin@amd.com, dominik.kaszewski@amd.com,
 alvin.lee2@amd.com, Aric.Cyr@amd.com, Austin.Zheng@amd.com,
 Sung.Lee@amd.com, PeiChen.Huang@amd.com, dillon.varone@amd.com,
 Richard.Chiang@amd.com, ryanseto@amd.com, linux@treblig.org,
 haoping.liu@amd.com, Relja.Vojvodic@amd.com, Yihan.Zhu@amd.com,
 Samson.Tam@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 wayland-devel@lists.freedesktop.org
Cc: Shengyu Qu <wiagn233@outlook.com>
Subject: [PATCH v2 2/2] drm/amdgpu: Add "pixel_encoding" DRM connector
 property support for amdgpu
Date: Tue, 26 Aug 2025 02:40:01 +0800
Message-ID: <TY4PR01MB1443220EA19800A1CA021847A983EA@TY4PR01MB14432.jpnprd01.prod.outlook.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250825184001.6524-1-wiagn233@outlook.com>
References: <20250825184001.6524-1-wiagn233@outlook.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGAP274CA0024.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::36)
 To TY4PR01MB14432.jpnprd01.prod.outlook.com
 (2603:1096:405:235::10)
X-Microsoft-Original-Message-ID: <20250825184001.6524-3-wiagn233@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY4PR01MB14432:EE_|TY4PR01MB15954:EE_
X-MS-Office365-Filtering-Correlation-Id: 22ccc116-d729-4f8e-a30f-08dde406d55b
X-MS-Exchange-SLBlob-MailProps: quCBMN2EvO+pPRgpcRKeMpPKDEKjvqeWS5kVaUuSeEE3th1VZbLX1nHMNzrpCYZvP6K8NTbx72K1CpmGZUKqJLf1G9qLC5HM8E4Jx6guc5klGHC+tie45Kr7btLIa6NRnI6fPKb7yHq47OE6Q7/86yWq6Iy0Zxwe4h1yEZXQZnQjJY2T+QlTQc1kvLKh3H2yFRsmXO+Nu58zZUDrnqe7CbXc6Ce6fHD3ZUjAycAGe4t1Wc53AOdt7PgEUhtO+1kmXvN4CcMC2xWQ3zJKX8gxjecjDfPgb/thke/ulwGQttZ8E47orifPKe+vPUD3TPMuwVPm0eX1GTClnPDl83BjYdnCu4j2lx/cSUtRXLGvJw9T7A5mg5OkscRS5pYvq/TXFWD/OHvfTEO3zQgYa/xtqsBG9m5WUXo4JN3FWfCr4MSypAWxqCa5mS/V0qM8mD//9uG5+mCUbKDjGAJtw43kmswPGUDZuFRlAwMql9iNT1LPh/2s/b1PwB8bbeRcddohNyl07wqTNdqL2KbKXEgy223NNUx/NVaODxDpz9E/c5G52SeJZr4pAsFMbPTQEDBJa5vB5nogialP7dQFSQfzHx1e0CsqD+jSieZT6UBohgZVhWA8Co3Xx+xMEfFw1t/cHUCpJ68Atyom/y9oC+BKbyBGYkqnFO4jKRbFwrKWOR/tVw3IZd7Pze8jeg2OVKP2Xl5b+Z+NuqTBTvTkryhl1w==
X-Microsoft-Antispam: BCL:0;
 ARA:14566002|8060799015|19110799012|5072599009|41001999006|15080799012|461199028|23021999003|3412199025|40105399003|440099028|26104999006|1710799026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ZZ28kFv4w99stHpv8ymKTKw/SS3ncoHjQAzEikDFwrXQ2IG+JZR17T95AlzS?=
 =?us-ascii?Q?GD9h/QpyRDqkpVF+bi6cZWU+ekkOicRT6Tk6vFv+G2StoseNpfwcse8veOnp?=
 =?us-ascii?Q?f85fZZGH092M6vCbsHn2mhnJp+HjbqGzRBgEK+Xg+TSyry0aG5jsGo2xfYhn?=
 =?us-ascii?Q?FZ1tRPoulbO0wUhGQlnSVKvztxGFJJmjG5kOkRv2cwZysJSyCiHff/HxxDvo?=
 =?us-ascii?Q?IXSlcPFz4SZ6oPvB7V/jNczWZ3vsJuxGuBX3tpfqCcyuZ54rQ2CneztcZxC/?=
 =?us-ascii?Q?x1300YaCgZT4uCTeRr0xzJyptgrTJy5iDlLSwupDAB+NosgHNK6ybRP/I1rB?=
 =?us-ascii?Q?7k70v5ToLC8YQ+itDFklWktGBTZyzUtoj8CHqhot9tqzQUJjEOAMbSTI9ua1?=
 =?us-ascii?Q?6a2kpboAjg7T3YuQSOEG/pfiMLpaUHCqwKT0hIBfH21zoe35I+CB9FAss49Q?=
 =?us-ascii?Q?dL8ajmOCn7URmPPOo6YlXv+21HhAd9hZAN0wGfISvhVNllQoT1AVrxbaEbtB?=
 =?us-ascii?Q?OegAzQ6nauSXLQWG9qBic0TVs6A8Be/APZNCPucpe8r1h7770JGEW0Jk/FOi?=
 =?us-ascii?Q?nXcbVeUo9B0l3u8CIQ+JH3HAeTGE164Ccg4XaR8QcGsUPePgHGKPLofjn6Dr?=
 =?us-ascii?Q?pOi51yI50abXS7+0BO5Xmzp0C5deuDt/BiNs4tKWJqU6hxYbPWB4WnK/k3+U?=
 =?us-ascii?Q?ZNc7UChX+mXoOjgfFPSUE+vuN98er+wduO/NT8DxNPw0E5hvPGpkG+LoGt/I?=
 =?us-ascii?Q?cV3c1itKwPrEg2AhjUw59WtvIM1yEB2UiSbBYu1MyroPsGSG2hEBt6LNA17O?=
 =?us-ascii?Q?zt+nPUwwNwQ1dNvFNx4qqDvz+RQdeXaZP0JXgFMM2igj6D16XWcdvLVoPtZH?=
 =?us-ascii?Q?tFmA/1Gy2QRC4mTCMNMcFQWJN9C8hEPnDu+mbMUiYqySlKHtzWdhvCYoYrYm?=
 =?us-ascii?Q?3yH4F3c9B9DyI1oR3VqZpFx7PSUsMmuYJWf23B2WyEJ0M7aNTZ/09tEMGFxS?=
 =?us-ascii?Q?/ZUDzCIiy3sGIKA/zzq5VevMp6wXvOwsmxyYI29JGuk9Ve8cwQFPlOVPxjhn?=
 =?us-ascii?Q?BgCy8262mliC5Yo7PEc+fZ8FYghgoEDkDhnuvbd1B5KocZR3rXNdIaGrW+Dy?=
 =?us-ascii?Q?c8RKha0gX6i2+Kez1OeLdBD1lpw3Sp0VyU+p0A4DjDQYf9juAcEjyuDE1X9H?=
 =?us-ascii?Q?h9otzwSh3m63GcKb45ZDzTKjZQZKWVzR+mwKL51DjVSAV1CH25X2c4g8BqA?=
 =?us-ascii?Q?=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?eunwigZqDj7dufOYZeMdkIoWVltfujXThUR2lq/eAsHu/LtMoTPqCa2X3Qb+?=
 =?us-ascii?Q?/kPeBUD0cljd2FsbeDEhTZVNkLscMsXyw/DHsa9gdHJzQWqpcVPViU9lCPFO?=
 =?us-ascii?Q?N7Bnd4PFdvQU+kaFuUFZjwXFzMsIyZdsVCd0CaljZstLcwLn225RHoPA1af+?=
 =?us-ascii?Q?cbVY9RtTZqO3nZW3KgieA6lW4eIzfro4OCAmWX4y78raZt/Z/u62Ql87JMrF?=
 =?us-ascii?Q?ugAm9RJjU1x6sbrqX8E5Bzlcf6nrCRhXf5v5AwWGiYzk2wgqlEkc6M7/B4zU?=
 =?us-ascii?Q?2ghpdAZwwTLhhYE3lPrjE5+ncAK7YKoyxKFmWGEOTbMK3dpW2cz9ER3UGJrv?=
 =?us-ascii?Q?SPFOQDv0dEosgNtGE4ZsFk3PvfRBEZ56pi+APRF/rRO54TIDDXvGbSonf7SU?=
 =?us-ascii?Q?b4lfdGoQt/xgerSZhzLa/67K0FUieUuVAzzD+a7rDeRwC/uuXBpXars93S9j?=
 =?us-ascii?Q?lQSmHHz2bkA/THvYAT/yzXeZP7Tyt/hrrFDpne7XmMmjm+HIjbKTIL1PcQ9r?=
 =?us-ascii?Q?B6JrZkBlomhcA+UHNtUr367t/VbwrfrMhCxMIJuMlAHihRTEbcmGdvpUHecb?=
 =?us-ascii?Q?qertoopFq0kIzLgghx/jtdg39ojCH7NxUN3vmlBS3cge6fVrvxZdB52SeCyO?=
 =?us-ascii?Q?lXSDJgdgePgMlMQIj3WjUlkc5mdGnUh8YYbPUBVvzz/DYPyMD28ag3T+jboV?=
 =?us-ascii?Q?anZicn7KIJdUomm6g+/BO/G9NEGcAGIBdVN8WnAWXj2HETodIHU3Mn3BDV4z?=
 =?us-ascii?Q?mzDxfz5QTWngw1uDcxGJobYTmpe7ZWjYJIWb3HtM5JlPbTreQvitMKnaWL63?=
 =?us-ascii?Q?UA88M2s5QTYIOlV4OPsc4TCWs42W3BlJtCRcC2HxrM8klJxM207K6PVh+Dec?=
 =?us-ascii?Q?ZrhV7PY2ZtuIqfF5kS7t+dg8lDW841FNMJ0X++K4d78CRPDLIHgyOaL9sqS1?=
 =?us-ascii?Q?BlJ0UDdY/L30YY9wnAPu4/Sxdm73D0lDycMk4iZWwSEF4hwHEmesqVD3Aruc?=
 =?us-ascii?Q?EBUzFn0Wa8VWEN9KyB1QI+T9wfYgBxhaWN3QFWpGkt1l5he6PZE2g9pbiSQJ?=
 =?us-ascii?Q?0imwTDr1f5CFuCoeKHjy1+QAgHtzMpLJ5VWqcBrg6zguyQ1c6HgcwoBi+6fO?=
 =?us-ascii?Q?kHMv58BvOg70Zf1XbGtrJEN07BiKq3Yg9qBFhGo5HaQXtlIfjOB6ClBnWu2d?=
 =?us-ascii?Q?5oOoIoxNPvtVOT+/LUo6t+tTMRb9Ny1Kv1POo3wtHxvKRqKpVperj00DdfBZ?=
 =?us-ascii?Q?/gMWwU4vX3kJWeFgh11pfgWTTVvA9VZ7+TbF+D3deNVQ/J2yokifvRz8Leu1?=
 =?us-ascii?Q?GaI=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22ccc116-d729-4f8e-a30f-08dde406d55b
X-MS-Exchange-CrossTenant-AuthSource: TY4PR01MB14432.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2025 18:40:16.2046 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB15954
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

This patch adds support for "pixel_encoding" connector property to amdgpu,
also adds a module parameter for the driver to force override initial
output pixel format encoding.

usage: amdgpu.pixel_encoding=<encoding> or
amdgpu.pixel_encoding=<monitor>:<encoding>,<monitor>:<encoding>

Supported encodings are: "auto" (0) (Default and original behavior), "rgb"
(1), "ycbcr444" (2), "ycbcr422" (4), and "ycbcr420" (8).

Signed-off-by: Matias N. Goldberg <dark_sylinc@yahoo.com.ar>
Signed-off-by: Rafael Carvalho <contact@rafaelrc.com>
Signed-off-by: Shengyu Qu <wiagn233@outlook.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c   |  36 +++
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.h   |   3 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h      |   2 +
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 273 +++++++++++++++++-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |   1 +
 drivers/gpu/drm/amd/display/dc/core/dc.c      |   8 +
 drivers/gpu/drm/amd/display/dc/dc_stream.h    |   2 +
 7 files changed, 314 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
index 9e463d3ee927..89c173649615 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
@@ -1363,6 +1363,34 @@ static const struct drm_prop_enum_list amdgpu_dither_enum_list[] = {
 	{ AMDGPU_FMT_DITHER_ENABLE, "on" },
 };
 
+static const struct drm_prop_enum_list amdgpu_user_pixenc_list[] = {
+	{ 0, "auto" },
+	{ DRM_COLOR_FORMAT_RGB444, "rgb" },
+	{ DRM_COLOR_FORMAT_YCBCR444, "ycbcr444" },
+	{ DRM_COLOR_FORMAT_YCBCR422, "ycbcr422" },
+	{ DRM_COLOR_FORMAT_YCBCR420, "ycbcr420" },
+};
+
+bool amdgpu_user_pixenc_from_name(
+	unsigned int *user_pixenc,
+	const char *pixenc_name)
+{
+	bool found = false;
+
+	if (pixenc_name && (*pixenc_name != '\0')) {
+		const int sz = ARRAY_SIZE(amdgpu_user_pixenc_list);
+		int i;
+
+		for (i = 0; !found && i < sz; ++i) {
+			if (strcmp(pixenc_name, amdgpu_user_pixenc_list[i].name) == 0) {
+				*user_pixenc = amdgpu_user_pixenc_list[i].type;
+				found = true;
+			}
+		}
+	}
+	return found;
+}
+
 int amdgpu_display_modeset_create_props(struct amdgpu_device *adev)
 {
 	int sz;
@@ -1409,6 +1437,14 @@ int amdgpu_display_modeset_create_props(struct amdgpu_device *adev)
 					 "dither",
 					 amdgpu_dither_enum_list, sz);
 
+	sz = ARRAY_SIZE(amdgpu_user_pixenc_list);
+	adev->mode_info.pixel_encoding_property =
+		drm_property_create_enum(adev_to_drm(adev), 0,
+			"pixel encoding",
+			amdgpu_user_pixenc_list, sz);
+	if (!adev->mode_info.pixel_encoding_property)
+		return -ENOMEM;
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.h
index dfa0d642ac16..4c4f607d1b68 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.h
@@ -54,4 +54,7 @@ int amdgpu_display_resume_helper(struct amdgpu_device *adev);
 int amdgpu_display_get_scanout_buffer(struct drm_plane *plane,
 				      struct drm_scanout_buffer *sb);
 
+bool amdgpu_user_pixenc_from_name(unsigned int *user_pixenc,
+				  const char *pixenc_name);
+
 #endif
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
index 6da4f946cac0..e56a772376a1 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
@@ -326,6 +326,8 @@ struct amdgpu_mode_info {
 	struct drm_property *audio_property;
 	/* FMT dithering */
 	struct drm_property *dither_property;
+	/* output pixel format encoding override */
+	struct drm_property *pixel_encoding_property;
 	/* hardcoded DFP edid from BIOS */
 	const struct drm_edid *bios_hardcoded_edid;
 
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index b944abea306d..76525b8b7e1e 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -176,6 +176,14 @@ static void reset_freesync_config_for_crtc(struct dm_crtc_state *new_crtc_state)
 static struct amdgpu_i2c_adapter *
 create_i2c(struct ddc_service *ddc_service, bool oem);
 
+/**
+ * DOC: pixel_encoding (string)
+ * Specify the initial output pixel format encoding used by a connector.
+ */
+static char amdgpu_pixel_encoding[MAX_INPUT];
+MODULE_PARM_DESC(pixel_encoding, "Override pixel encoding");
+module_param_string(pixel_encoding, amdgpu_pixel_encoding, sizeof(amdgpu_pixel_encoding), 0444);
+
 static enum drm_mode_subconnector get_subconnector_type(struct dc_link *link)
 {
 	switch (link->dpcd_caps.dongle_type) {
@@ -6368,6 +6376,119 @@ static bool adjust_colour_depth_from_display_info(
 	return false;
 }
 
+/* convert an pixel encoding property value to a dc_pixel_encoding */
+static bool drm_prop_to_dc_pixel_encoding(
+	enum dc_pixel_encoding *dc_pixenc,
+	unsigned int propval)
+{
+	bool ret = false;
+
+	switch (propval) {
+	case 0:
+		*dc_pixenc = PIXEL_ENCODING_UNDEFINED;
+		ret = true;
+		break;
+	case DRM_COLOR_FORMAT_RGB444:
+		*dc_pixenc = PIXEL_ENCODING_RGB;
+		ret = true;
+		break;
+	case DRM_COLOR_FORMAT_YCBCR444:
+		*dc_pixenc = PIXEL_ENCODING_YCBCR444;
+		ret = true;
+		break;
+	case DRM_COLOR_FORMAT_YCBCR422:
+		*dc_pixenc = PIXEL_ENCODING_YCBCR422;
+		ret = true;
+		break;
+	case DRM_COLOR_FORMAT_YCBCR420:
+		*dc_pixenc = PIXEL_ENCODING_YCBCR420;
+		ret = true;
+		break;
+	default:
+		break;
+	}
+	return ret;
+}
+
+/* convert an dc_pixel_encoding to a pixel encoding property value */
+static unsigned int dc_pixel_encoding_to_drm_prop(
+	enum dc_pixel_encoding pixel_encoding)
+{
+	unsigned int propval = 0;
+
+	switch (pixel_encoding) {
+	case PIXEL_ENCODING_RGB:
+		propval = DRM_COLOR_FORMAT_RGB444;
+		break;
+	case PIXEL_ENCODING_YCBCR444:
+		propval = DRM_COLOR_FORMAT_YCBCR444;
+		break;
+	case PIXEL_ENCODING_YCBCR420:
+		propval = DRM_COLOR_FORMAT_YCBCR420;
+		break;
+	default:
+		break;
+	}
+	return propval;
+}
+
+/*
+ * Tries to read 'pixel_encoding' from the pixel_encoding DRM property on
+ * 'state'. Returns true if a supported, acceptable, non-undefined value is
+ * found; false otherwise. Only modifies 'pixel_encoding' if returning true.
+ */
+bool get_connector_state_pixel_encoding(
+	enum dc_pixel_encoding *pixel_encoding,
+	const struct drm_connector_state *state,
+	const struct drm_display_info *info,
+	const struct drm_display_mode *mode_in)
+{
+	bool ret = false;
+	struct dm_connector_state *dm_state;
+
+	dm_state = to_dm_connector_state(state);
+	if (!dm_state)
+		return false;
+
+	/* check encoding is supported */
+	switch (dm_state->pixel_encoding) {
+	case PIXEL_ENCODING_RGB:
+		ret = (info->color_formats & DRM_COLOR_FORMAT_RGB444);
+		break;
+	case PIXEL_ENCODING_YCBCR444:
+		ret = (info->color_formats & DRM_COLOR_FORMAT_YCBCR444);
+		break;
+	case PIXEL_ENCODING_YCBCR420:
+		ret = drm_mode_is_420(info, mode_in);
+		break;
+	default:
+		break;
+	}
+
+	if (ret)
+		*pixel_encoding = dm_state->pixel_encoding;
+
+	return ret;
+}
+
+/*
+ * Writes 'pixel_encoding' to the pixel_encoding DRM property on 'state', if
+ * the enum value is valid and supported; otherwise writes
+ * PIXEL_ENCODING_UNDEFINED which corresponds to the "auto" property state.
+ */
+void set_connector_state_pixel_encoding(
+	const struct drm_connector_state *state,
+	enum dc_pixel_encoding pixel_encoding)
+{
+	struct dm_connector_state *dm_state;
+
+	dm_state = to_dm_connector_state(state);
+	if (!dm_state)
+		return;
+
+	dm_state->pixel_encoding = pixel_encoding;
+}
+
 static void fill_stream_properties_from_drm_display_mode(
 	struct dc_stream_state *stream,
 	const struct drm_display_mode *mode_in,
@@ -6393,19 +6514,23 @@ static void fill_stream_properties_from_drm_display_mode(
 	timing_out->h_border_right = 0;
 	timing_out->v_border_top = 0;
 	timing_out->v_border_bottom = 0;
-	/* TODO: un-hardcode */
-	if (drm_mode_is_420_only(info, mode_in)
+
+	if (!get_connector_state_pixel_encoding(&timing_out->pixel_encoding,
+		connector_state, info, mode_in)) {
+		/* auto-select a pixel encoding */
+		if (drm_mode_is_420_only(info, mode_in)
 			&& stream->signal == SIGNAL_TYPE_HDMI_TYPE_A)
-		timing_out->pixel_encoding = PIXEL_ENCODING_YCBCR420;
-	else if (drm_mode_is_420_also(info, mode_in)
+			timing_out->pixel_encoding = PIXEL_ENCODING_YCBCR420;
+		else if (drm_mode_is_420_also(info, mode_in)
 			&& aconnector
 			&& aconnector->force_yuv420_output)
-		timing_out->pixel_encoding = PIXEL_ENCODING_YCBCR420;
-	else if ((connector->display_info.color_formats & DRM_COLOR_FORMAT_YCBCR444)
-			&& stream->signal == SIGNAL_TYPE_HDMI_TYPE_A)
-		timing_out->pixel_encoding = PIXEL_ENCODING_YCBCR444;
-	else
-		timing_out->pixel_encoding = PIXEL_ENCODING_RGB;
+			timing_out->pixel_encoding = PIXEL_ENCODING_YCBCR420;
+		else if ((connector->display_info.color_formats & DRM_COLOR_FORMAT_YCBCR444)
+				&& stream->signal == SIGNAL_TYPE_HDMI_TYPE_A)
+			timing_out->pixel_encoding = PIXEL_ENCODING_YCBCR444;
+		else
+			timing_out->pixel_encoding = PIXEL_ENCODING_RGB;
+	}
 
 	timing_out->timing_3d_format = TIMING_3D_FORMAT_NONE;
 	timing_out->display_color_depth = convert_color_depth_from_display_info(
@@ -6479,6 +6604,9 @@ static void fill_stream_properties_from_drm_display_mode(
 		}
 	}
 
+	/* write back final choice of pixel encoding */
+	set_connector_state_pixel_encoding(connector_state, timing_out->pixel_encoding);
+
 	stream->output_color_space = get_output_color_space(timing_out, connector_state);
 	stream->content_type = get_output_content_type(connector_state);
 }
@@ -7181,6 +7309,9 @@ int amdgpu_dm_connector_atomic_set_property(struct drm_connector *connector,
 	} else if (property == adev->mode_info.underscan_property) {
 		dm_new_state->underscan_enable = val;
 		ret = 0;
+	} else if (property == adev->mode_info.pixel_encoding_property) {
+		if (drm_prop_to_dc_pixel_encoding(&dm_new_state->pixel_encoding, val))
+			ret = 0;
 	}
 
 	return ret;
@@ -7223,6 +7354,9 @@ int amdgpu_dm_connector_atomic_get_property(struct drm_connector *connector,
 	} else if (property == adev->mode_info.underscan_property) {
 		*val = dm_state->underscan_enable;
 		ret = 0;
+	} else if (property == adev->mode_info.pixel_encoding_property) {
+		*val = dc_pixel_encoding_to_drm_prop(dm_state->pixel_encoding);
+		ret = 0;
 	}
 
 	return ret;
@@ -7367,6 +7501,48 @@ static void amdgpu_dm_connector_destroy(struct drm_connector *connector)
 	kfree(connector);
 }
 
+/*
+ * Returns the default pixel encoding, depending on the pixel_encoding
+ * module parameter if given.
+ */
+static enum dc_pixel_encoding pixel_encoding_reset(
+	const struct drm_connector *connector)
+{
+	char *param_str = NULL;
+	char *param_str_ptr = NULL;
+	char *param_item = NULL;
+	char *param_item_sep = NULL;
+	char *pixenc_mode = NULL;
+	unsigned int user_pixenc;
+	enum dc_pixel_encoding pixel_encoding = PIXEL_ENCODING_UNDEFINED;
+
+	/* default in absence of module param */
+	if (*amdgpu_pixel_encoding == '\0')
+		return PIXEL_ENCODING_UNDEFINED;
+
+	/* decode param string */
+	param_str = kstrdup(amdgpu_pixel_encoding, GFP_KERNEL);
+	param_str_ptr = param_str;
+	while ((param_item = strsep(&param_str_ptr, ","))) {
+		param_item_sep = strchr(param_item, ':');
+		if (param_item_sep) {
+			if (!strncmp(connector->name, param_item,
+				   param_item_sep - param_item)) {
+				pixenc_mode = param_item_sep + 1;
+				break;
+			}
+		} else
+			pixenc_mode = param_item;
+	}
+
+	/* compare mode string and set */
+	if (amdgpu_user_pixenc_from_name(&user_pixenc, pixenc_mode))
+		drm_prop_to_dc_pixel_encoding(&pixel_encoding, user_pixenc);
+
+	kfree(param_str);
+	return pixel_encoding;
+}
+
 void amdgpu_dm_connector_funcs_reset(struct drm_connector *connector)
 {
 	struct dm_connector_state *state =
@@ -7395,6 +7571,24 @@ void amdgpu_dm_connector_funcs_reset(struct drm_connector *connector)
 				state->abm_level = amdgpu_dm_abm_level;
 		}
 
+		switch (connector->cmdline_mode.pixel_encoding) {
+		case DRM_COLOR_FORMAT_RGB444:
+			state->pixel_encoding = PIXEL_ENCODING_RGB;
+			break;
+		case DRM_COLOR_FORMAT_YCBCR444:
+			state->pixel_encoding = PIXEL_ENCODING_YCBCR444;
+			break;
+		case DRM_COLOR_FORMAT_YCBCR422:
+			state->pixel_encoding = PIXEL_ENCODING_YCBCR422;
+			break;
+		case DRM_COLOR_FORMAT_YCBCR420:
+			state->pixel_encoding = PIXEL_ENCODING_YCBCR420;
+			break;
+		default:
+			break;
+		}
+
+		state->pixel_encoding = pixel_encoding_reset(connector);
 		__drm_atomic_helper_connector_reset(connector, &state->base);
 	}
 }
@@ -7421,6 +7615,7 @@ amdgpu_dm_connector_atomic_duplicate_state(struct drm_connector *connector)
 	new_state->underscan_vborder = state->underscan_vborder;
 	new_state->vcpi_slots = state->vcpi_slots;
 	new_state->pbn = state->pbn;
+	new_state->pixel_encoding = state->pixel_encoding;
 	return &new_state->base;
 }
 
@@ -8552,6 +8747,12 @@ void amdgpu_dm_connector_init_helper(struct amdgpu_display_manager *dm,
 
 		if (adev->dm.hdcp_workqueue)
 			drm_connector_attach_content_protection_property(&aconnector->base, true);
+
+		if (adev->mode_info.pixel_encoding_property) {
+			drm_object_attach_property(&aconnector->base.base,
+				adev->mode_info.pixel_encoding_property, 0);
+			DRM_DEBUG_DRIVER("amdgpu: attached pixel encoding drm property");
+		}
 	}
 
 	if (connector_type == DRM_MODE_CONNECTOR_eDP) {
@@ -9833,6 +10034,38 @@ static void amdgpu_dm_commit_audio(struct drm_device *dev,
 	}
 }
 
+static void update_stream_for_pixel_encoding(
+	struct dc_stream_update *stream_update,
+	struct drm_connector *connector,
+	struct dm_crtc_state *dm_old_crtc_state,
+	struct dm_crtc_state *dm_new_crtc_state,
+	struct dm_connector_state *dm_new_con_state)
+{
+	struct amdgpu_dm_connector *aconnector =
+		to_amdgpu_dm_connector(connector);
+	struct dc_stream_state *new_stream = NULL;
+
+	if (aconnector)
+		new_stream = create_validate_stream_for_sink(
+			aconnector,
+			&dm_new_crtc_state->base.mode,
+			dm_new_con_state,
+			dm_old_crtc_state->stream);
+	if (new_stream) {
+		dm_new_crtc_state->stream->timing =
+			new_stream->timing;
+		stream_update->timing_for_pixel_encoding =
+			&dm_new_crtc_state->stream->timing;
+
+		dm_new_crtc_state->stream->output_color_space =
+			new_stream->output_color_space;
+		stream_update->output_color_space =
+			&dm_new_crtc_state->stream->output_color_space;
+
+		dc_stream_release(new_stream);
+	}
+}
+
 /*
  * amdgpu_dm_crtc_copy_transient_flags - copy mirrored flags from DRM to DC
  * @crtc_state: the DRM CRTC state
@@ -10316,6 +10549,7 @@ static void amdgpu_dm_atomic_commit_tail(struct drm_atomic_state *state)
 		struct dc_info_packet hdr_packet;
 		struct dc_stream_status *status = NULL;
 		bool abm_changed, hdr_changed, scaling_changed, output_color_space_changed = false;
+		bool pixenc_changed;
 
 		memset(&stream_update, 0, sizeof(stream_update));
 
@@ -10345,7 +10579,11 @@ static void amdgpu_dm_atomic_commit_tail(struct drm_atomic_state *state)
 		hdr_changed =
 			!drm_connector_atomic_hdr_metadata_equal(old_con_state, new_con_state);
 
-		if (!scaling_changed && !abm_changed && !hdr_changed && !output_color_space_changed)
+		pixenc_changed = dm_new_con_state->pixel_encoding !=
+			dm_old_con_state->pixel_encoding;
+
+		if (!scaling_changed && !abm_changed && !hdr_changed &&
+			!output_color_space_changed && !pixenc_changed)
 			continue;
 
 		stream_update.stream = dm_new_crtc_state->stream;
@@ -10375,6 +10613,13 @@ static void amdgpu_dm_atomic_commit_tail(struct drm_atomic_state *state)
 			stream_update.hdr_static_metadata = &hdr_packet;
 		}
 
+		if (pixenc_changed) {
+			update_stream_for_pixel_encoding(&stream_update,
+				connector,
+				dm_old_crtc_state, dm_new_crtc_state,
+				dm_new_con_state);
+		}
+
 		status = dc_stream_get_status(dm_new_crtc_state->stream);
 
 		if (WARN_ON(!status))
@@ -11922,6 +12167,12 @@ static int amdgpu_dm_atomic_check(struct drm_device *dev,
 		if (dm_old_con_state->abm_level != dm_new_con_state->abm_level ||
 		    dm_old_con_state->scaling != dm_new_con_state->scaling)
 			new_crtc_state->connectors_changed = true;
+
+		if (dm_old_con_state->pixel_encoding !=
+		    dm_new_con_state->pixel_encoding) {
+			new_crtc_state->connectors_changed = true;
+			new_crtc_state->mode_changed = true;
+		}
 	}
 
 	if (dc_resource_is_dsc_encoding_supported(dc)) {
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
index cbd107493f8a..0ef6050182b2 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
@@ -987,6 +987,7 @@ struct dm_connector_state {
 	uint8_t abm_level;
 	int vcpi_slots;
 	uint64_t pbn;
+	enum dc_pixel_encoding pixel_encoding;
 };
 
 #define to_dm_connector_state(x)\
diff --git a/drivers/gpu/drm/amd/display/dc/core/dc.c b/drivers/gpu/drm/amd/display/dc/core/dc.c
index c30d9ee51c83..6ed03dbc6c4d 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc.c
@@ -2993,6 +2993,11 @@ static enum surface_update_type check_update_surfaces_for_stream(
 		if (stream_update->output_csc_transform)
 			su_flags->bits.out_csc = 1;
 
+		if (stream_update->timing_for_pixel_encoding) {
+			su_flags->bits.pixel_encoding = 1;
+			elevate_update_type(&overall_type, UPDATE_TYPE_FULL);
+		}
+
 		/* Output transfer function changes do not require bandwidth recalculation,
 		 * so don't trigger a full update
 		 */
@@ -3347,6 +3352,8 @@ static void copy_stream_update_to_stream(struct dc *dc,
 			update->dsc_config = NULL;
 		}
 	}
+	if (update->timing_for_pixel_encoding)
+		stream->timing = *update->timing_for_pixel_encoding;
 	if (update->scaler_sharpener_update)
 		stream->scaler_sharpener_update = *update->scaler_sharpener_update;
 	if (update->sharpening_required)
@@ -3600,6 +3607,7 @@ static void commit_planes_do_stream_update(struct dc *dc,
 					stream_update->vsc_infopacket ||
 					stream_update->vsp_infopacket ||
 					stream_update->hfvsif_infopacket ||
+					stream_update->timing_for_pixel_encoding ||
 					stream_update->adaptive_sync_infopacket ||
 					stream_update->vtem_infopacket) {
 				resource_build_info_frame(pipe_ctx);
diff --git a/drivers/gpu/drm/amd/display/dc/dc_stream.h b/drivers/gpu/drm/amd/display/dc/dc_stream.h
index 5fc6fea211de..3e1a46291dfe 100644
--- a/drivers/gpu/drm/amd/display/dc/dc_stream.h
+++ b/drivers/gpu/drm/amd/display/dc/dc_stream.h
@@ -144,6 +144,7 @@ union stream_update_flags {
 		uint32_t mst_bw : 1;
 		uint32_t crtc_timing_adjust : 1;
 		uint32_t fams_changed : 1;
+		uint32_t pixel_encoding : 1;
 		uint32_t scaler_sharpener : 1;
 		uint32_t sharpening_required : 1;
 	} bits;
@@ -352,6 +353,7 @@ struct dc_stream_update {
 	struct dc_mst_stream_bw_update *mst_bw_update;
 	struct dc_transfer_func *func_shaper;
 	struct dc_3dlut *lut3d_func;
+	struct dc_crtc_timing *timing_for_pixel_encoding;
 
 	struct test_pattern *pending_test_pattern;
 	struct dc_crtc_timing_adjust *crtc_timing_adjust;
-- 
2.43.0

