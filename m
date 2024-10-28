Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F2869B22CA
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2024 03:37:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D4A810E30D;
	Mon, 28 Oct 2024 02:37:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="ISE4ff31";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2068.outbound.protection.outlook.com [40.107.20.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3112910E30D
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2024 02:37:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tWMUYLB/DGq/3pb/g8f9s3aG1M29Bhsi5II4cP6ClJIvHGqa2O+NbV7Ph4HZfTvAL0IiHRYk/XUrc8DnNLqR5Gf98/PE0MlE4taNWNXSmtS6XRxmy0hC5+h14rPX6Cd9qRZc4QzAI9I8leVoANXt/zIrYmtvETkYP4skqHnp6cL4oaD4fHfruZGrA9hX7N7Inqm9hOMuG+nzAF+uuLAjUdU2QQXKSOJcpDBSOKP97qjSZSD8tB/Xhok5GynHEnd2we4QhelQvZQ4Sj4IDXoW8BDWe9qA/K3ceuBHljj8KxnlGs7hZIN4DWjxDOatyCqCApIFxAvCp+b4Qo0wUmsVRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zo0YwwV4EUsttt9jsX8Bh4U/OjF0MaSDUSJB0d/lvH0=;
 b=KvlIXp51DjyTt7C1AWz4rQYuwfH77M31FMoYFUuykhWv/aJrmmgZRuFkPd2cxsFIAzu+2kTgEgnxHG3p2BDjDk50x3Cy135j0lEv+6klPOQU0cLpW9bCx3HZA0OIo+6SgFZF+ddVMGQWOslyJjlV3u+Ur5aOkZMgGLt4LbILBTJSDKu5do6B3ip57djnNBPApjgypQ2RbTyH5lO2aGQ5i3rWhXwt2qENq2taut8qo2I0MZTMHcTSvmgcFgymlOVrY3TCSIAChfjNigHhTKM0WQO9qkV+K4LfE0tFmmBAWwkpMm102VFpO2jhfjmkGhN4EohiY1CluOxX/PXUwt340w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zo0YwwV4EUsttt9jsX8Bh4U/OjF0MaSDUSJB0d/lvH0=;
 b=ISE4ff31E8spxmAi7iCGxGSx+6ud2EndUgv4Mn3e7RFqiJYoT5z2jw5GvWPbV1gy2zSpxnQNS5RESbGpD8zRewx21+NGdSMnB1hosKnXdu3L3hPvTS5QYVs+NFXVZikmpmV+1yXCwYRYM60Fdv1aHOkK/U6y3K6j2D+aBblbMWwmKs3KKKnJPb5F56n+vCLnURDajV6PxsCPCtrGZuBCtGHm4jhAVpPSjNK/jhLQ9949oUeE8Gln2zlsPhTRbNcbIIH0mfUL3onj48V9fnfwdgzUDqXT9VZoqPjck1vRklQYRTMKnQBcULg4I/joRlJZvv/X+OUkpvJFj6z+1pcWYw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DU2PR04MB8709.eurprd04.prod.outlook.com (2603:10a6:10:2dc::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Mon, 28 Oct
 2024 02:37:45 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%4]) with mapi id 15.20.8093.021; Mon, 28 Oct 2024
 02:37:45 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 quic_jesszhan@quicinc.com, mchehab@kernel.org, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 catalin.marinas@arm.com, will@kernel.org, sakari.ailus@linux.intel.com,
 hverkuil@xs4all.nl, tomi.valkeinen@ideasonboard.com,
 quic_bjorande@quicinc.com, geert+renesas@glider.be,
 dmitry.baryshkov@linaro.org, arnd@arndb.de, nfraprado@collabora.com,
 thierry.reding@gmail.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 sam@ravnborg.org, marex@denx.de, biju.das.jz@bp.renesas.com
Subject: [PATCH v4 00/13] Add ITE IT6263 LVDS to HDMI converter support
Date: Mon, 28 Oct 2024 10:37:27 +0800
Message-Id: <20241028023740.19732-1-victor.liu@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0002.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::16) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|DU2PR04MB8709:EE_
X-MS-Office365-Filtering-Correlation-Id: 2cc00833-b372-425c-87a2-08dcf6f980dc
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|366016|376014|7416014|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?WtRaSyyx8fnywSJ5gx7NRoC/LZQcxIJJscVV/B+4PF70hmLGTZrP7F7WC+UE?=
 =?us-ascii?Q?ZWLeUuvh430M+KPrwd6bAl7Eu5dGgNYVPyL6jesO0gCalgwmovhcSiYvEs7L?=
 =?us-ascii?Q?V7PPAY5OU6UH6HJIHRzK+EPma5XfhQMaQ0YCCR90g0fe9nnxT7U7PBs25Hug?=
 =?us-ascii?Q?fKobWTlB8vD6aEMzUoFcONlAmISx9bI601WR1ctqXw/Kjtit1hhFmrGx4l57?=
 =?us-ascii?Q?5ftY1ZKDj0tZJXqwGaoS1EdbX2PQ6cDFp8cpAMBrhypqq38kIh6LZddM0DmO?=
 =?us-ascii?Q?jYc0iWS7JPCmOd0yWn8tTtd5xXXfaE3o38389hjy+ryHkQEhD2AYGsVxXG1h?=
 =?us-ascii?Q?nAffOFKj2LJsEkniPE4BHAztkAwq50CfnkciGg0VY3sdnRWVBFwPgO5d8Xof?=
 =?us-ascii?Q?P9F4XkO6DD1JDvkHNSzaUYBY/NyC7yBI2E6aso89sWYDqTstMhxFId/3BE+g?=
 =?us-ascii?Q?w+ltWb028mzr+u7lM1LS9yh/hI1Ee7r09HRTm8Nm3ncTjZTw/K7ygLJ1zYWt?=
 =?us-ascii?Q?M0BWf1ZtvW0pglOF/PagylelXpVHOt7cex/4Ddz16OB8pwiccjRDzZ5RJX5l?=
 =?us-ascii?Q?D7XdBlyb+16JZPX4qH9IbOZRP0zlsQini5NO8KtL3nHBkrVjPg8di3wC768/?=
 =?us-ascii?Q?6v7308A3y9BltkEfutuU24M/vFgk4J+THXUVlNcT85Iu4BHYYWmgUmoiu5kq?=
 =?us-ascii?Q?DoVFFuUQh/5sovCImHc07i2lR+u337MQ1nUUdximnjj+C212GYzajKesov42?=
 =?us-ascii?Q?ZROQhS7bijoW7ZhTL8R4foKz8IWYpj4PqEO86om5utTlobAULgs55gj6arQC?=
 =?us-ascii?Q?PG6QdINRuRPd7zEvCn7XvMTGYJFa2rekI4wRSmcW5uGKVvnDoURYf82tE4PW?=
 =?us-ascii?Q?nMzDOicBFcCplGfJDkl7IJ2SzsxVQ0PnlOad0Itd2FgcngzvTGvm0zDes/IL?=
 =?us-ascii?Q?Sa+bxEcGXcBe9G4W7/SW52k7mprwtMyPyX7hiBv6fGCHQse455uQeB4A9Gds?=
 =?us-ascii?Q?INIoIMqat4sIY1J4yWZveROytpoMhyFMqcjLrirnm9aypglH4k2YaeXcuPNJ?=
 =?us-ascii?Q?8gu+oTFer4obegkGPrF0aW2tqy7LyBoFsAolZlkrZmYs3VtY1n3eTnwqiuWd?=
 =?us-ascii?Q?vzyVbQqYeVEE1cGrtjrg/i7wB48B/c29hj2gQWRMtFVXQ8bWzPiZT6u8f+ak?=
 =?us-ascii?Q?h2qhtUpo78sC7l4GDmmw9rpgsU00o6bD1qKLNj93clQ94jEW5SYfxlENj8Y1?=
 =?us-ascii?Q?ye3bA/SIPFZcAk9kAN0L/+CBmZSjM6ttnC23ddxbtNV/YKKGtClJeIOkKNoU?=
 =?us-ascii?Q?Przy4UclDipZDsfrNujn96ldPj+bQxAgvISMIFUNg7RwTS3x0257bOexlAsk?=
 =?us-ascii?Q?Nc9V6tJakWYCK0Ub5VnCstwE3lNE?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(366016)(376014)(7416014)(1800799024)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TYZw0650iT9fWepSzp0jnvvPfLxPLdpKW993/z+2NFu17pvQPPHbX4xtmwft?=
 =?us-ascii?Q?WhxfQez4oK3exV8ssNEuVq3f+54o71mI1Zj6LNHdrNRhr6b/OrCtfevw8U2h?=
 =?us-ascii?Q?CMKBOWBiuCSMPZd5KcYSBzTq8WVTELeojX3+7QmDkVJcDPa48OaiZD0jeimI?=
 =?us-ascii?Q?FsiM7RTZTDT0TboPPqHbLYZuo9aQD4AJ9UJ4YTOESJqRi/90YAaFPZ8vUScy?=
 =?us-ascii?Q?75laFF9K3ugJc2PL19FfcepoN2IMxI1irpHWhDO4BjJy1Mhq2Uxvmzj3OQYl?=
 =?us-ascii?Q?Cqg46c+yx5EVTub+hbWF52TA5tE3F9F3+2F0IF9Wm50Ssbn51/00ii8q4vNp?=
 =?us-ascii?Q?8hQ39JpChAJoInqHitQ0D0Z58fgBGhksSGJDh9aSMP9t6HkbOSRZOG2OK7bh?=
 =?us-ascii?Q?BWCoDLAsTpOyZ1vewr7MPMt3suQGydo3y6MyLuwcOj5WVYYOIharxdyNb23N?=
 =?us-ascii?Q?4IgAe21w0uwFCVUkxqTz71otQhsBbh/PxIoRw2z+r/eNs3dPbEvz4AlVNRew?=
 =?us-ascii?Q?/CnCJ0tYI1dPjaxIS3Gz/9jf7csS3rUXhISvNIW8mvv2+dPGm9zxw2bp1oau?=
 =?us-ascii?Q?ZnHvdDZ29eYdt5SeU+mXZJL0uVRi5zVRfT70aejt8kywuFHz416g6eHDDXmU?=
 =?us-ascii?Q?Y4bJsIQhi79kuanN3MNrdHaz4Jlmv3wyvrBqYAc75z0yBY4Ekpe6Ra3aWurL?=
 =?us-ascii?Q?ASUUKA6VFsf0rk2j8gnqUZeFk1eEWuiyMpW09NG/iN8Wue1B83xE4yECV4OK?=
 =?us-ascii?Q?8wVjCBDgCYcxWmMZ3+taHggJSrb0BrW32te6mUH0QHMitESG4kPRSdq781dM?=
 =?us-ascii?Q?gPcd3qBv7YEYrXrHwjMfOyrg4YyatgZuvqOtK3CDoN8whubzDs/d2rXLgtN3?=
 =?us-ascii?Q?kUNrWpbPcoQDvYwJivY5HRRUkgJ/m5//zf8/jliRs296gzXOAU05+5EPyhPj?=
 =?us-ascii?Q?PE0/YnyZfNY8MoJwNmiZfFdvHsi79DvNL2GcSIC/pldl86mRNqaiDVwFAZUj?=
 =?us-ascii?Q?NLm45IkxB8HCsrONoiOVS5UuO8Edy1CjVO1EUuajiy9nAdeM4KWsTPO5MKxI?=
 =?us-ascii?Q?c8mYAS4IBEVVAiI0X0IY/DHOAHATwcrw90SJP7qSYfJAp+c6BG1cWa3Ud4SE?=
 =?us-ascii?Q?HOYi+argM40q9fEGlGRo6xpTkZvElSQfP4wRI9iPQgCjgoDdJws27YhbZePl?=
 =?us-ascii?Q?0r60hj/7XAy2wxhpnIblURbmrhtdE4ezyoGFGNImg/cUU/HAbEEjBUKTi7Zm?=
 =?us-ascii?Q?i72hGDFdmVnagBlkBtyw+2XKHwcxAjbsPppKWTf+PamtqmoL+L+tWcV9paNj?=
 =?us-ascii?Q?quCphxbiak5cWleUYTmKqFKmi8/M9eHCmtf+qaEZA+JdhJwVuBKnrOnlmG+u?=
 =?us-ascii?Q?KF+QwaaGpg5WJ8zH9QCXwMUivIlo1H5OyuRvn7EtpI7jwyfTfbo9q1ikJgYB?=
 =?us-ascii?Q?tM69fR+eonXSlmZxc3wiA13zCOP6WSxv9+Lez51gyIYeRP+OlOR8PAWwgFm7?=
 =?us-ascii?Q?6GSkCHycVDZOXOBKNoic2fu3MH7L3DRAT5kpBMAQZ8+6aikhC9gAqbFGepp1?=
 =?us-ascii?Q?hqo8NDcWk6nddGn9xELm4QVPkis2P0Rgm/DjDeE9?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cc00833-b372-425c-87a2-08dcf6f980dc
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2024 02:37:45.1063 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3i6hBm3zi1mgN8Fvh93PcNkKZpX5S4alaUZZcutcqIDDUwyU+9LzFjJ5QGmyZkDPLdgQyJE/7PvIdXvAKbGGTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8709
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

Hi,

This patch series aims to add ITE IT6263 LVDS to HDMI converter on
i.MX8MP EVK.  Combined with LVDS receiver and HDMI 1.4a transmitter,
the IT6263 supports LVDS input and HDMI 1.4 output by conversion
function.  IT6263 product link can be found at [1].

Patch 1 is a preparation patch to allow display mode of an existing
panel to pass the added mode validation logic in patch 3.

Patch 2 allows i.MX8MP LVDS Display Bridge(LDB) bridge driver to find
the next non-panel bridge, that is the IT6263 in this case.

Patch 3 adds mode validation logic to i.MX8MP LDB bridge driver against
"ldb" clock so that it can filter out unsupported display modes read
from EDID.

Patch 4 adds MEDIA_BUS_FMT_RGB101010_1X7X5_{SPWG,JEIDA} support, as they
are supported by IT6263(with LVDS data bit reversed order).

Patch 5 makes drm_of.c use MEDIA_BUS_FMT_RGB101010_1X7X5_{JEIDA,SPWG}.

Patch 6 supports getting dual-link LVDS pixel order for the sink side as
needed by IT6263 driver.

Patch 7 documents jeida-30 and vesa-30 data mappings in lvds-data-mapping.yaml,
as needed by IT6263 DT binding.

Patch 8 extracts common dual-link LVDS display properties into new
lvds-dual-ports.yaml so that IT6263 DT binding can reference it.

Patch 9 adds DT binding for IT6263.

Patch 10 adds IT6263 bridge driver.  Only video output is supported.

Patch 11 adds DT overlays to support NXP adapter cards[2][3] with IT6263
populated.

Patch 12 enables the IT6263 bridge driver in defconfig.

Patch 13 updates MAINTAINERS to add maintainer for IT6263 driver.

Note that patch 3 depends on patch[4] in shawnguo/imx/fixes.

[1] https://www.ite.com.tw/en/product/cate1/IT6263
[2] https://www.nxp.com/part/IMX-LVDS-HDMI
[3] https://www.nxp.com/part/IMX-DLVDS-HDMI
[4] https://patchwork.kernel.org/project/linux-arm-kernel/patch/20241017031146.157996-1-marex@denx.de/

v4:
* Squash change for advantech,idk-2121wr.yaml and
  panel-simple-lvds-dual-ports.yaml with lvds-dual-ports.yaml in patch 8.  (Rob)
* Improve description in lvds-dual-ports.yaml in patch 8.  (Krzysztof)
* Require dual-lvds-odd-pixels or dual-lvds-even-pixels DT properties for port@1
  in ite,it6263.yaml in patch 9.
* Drop "data-mirror: true" from ite,it6263.yaml in patch 9.
* Use local variable reset_gpio in IT6263 driver's probe() in patch 10.  (Biju)
* Move pixel clock rate validation from mode_valid callback to
  hdmi_tmds_char_rate_valid callback in IT6263 driver in patch 10.  (Maxime)
* Document IT6263 video processing throughput constraints by adding comments
  in IT6263 driver in patch 10.  (Maxime)
* Fix IT6263 LVDS 8-bit color depth macro BIT8 in IT6263 driver in patch 10.
* Drop 30-bit LVDS data bit order validation in IT6263 driver in patch 10.
* Rebase patch 11 upon next-20241025 to resolve conflicts when apply.
* Collect R-b and A-b tags.

v3:
* Use assigned-clock-rates DT property to set pixel clock rate for
  "multi-inno,mi1010ait-1cp" LVDS panel in patch 1 instead of using
  panel-timing node.  (Marek)
* Drop the patch for fixing pixel clock rate for "edt,etml1010g3dra"
  LVDS panel because there is already another better patch[4].
* Collect Dmitry's R-b tag for patch 2.
* Define MEDIA_BUS_FMT_RGB101010_1X7X5_{SPWG,JEIDA} in patch 4.
* Use MEDIA_BUS_FMT_RGB101010_1X7X5_{JEIDA,SPWG} in drm_of.c in patch 5.
* Add drm_of_lvds_get_dual_link_pixel_order_sink() in patch 6.  (Dmitry)
* Document jeida-30 and vesa-30 in lvds-data-mapping.yaml in patch 7.
* Extract dual-link LVDS display common properties(patch 8-10).  (Dmitry)
* Reference lvds-dual-ports.yaml in ite,it6263.yaml in patch 11.  (Dmitry)
* Add data-mapping DT property in ite,it6263.yaml in patch 11.  (Dmitry, Biju)
* Allow data-mirror in ite,it6263.yaml in patch 11.
* Drop ite,lvds-link-num-data-lanes DT property from ite,it6263.yaml
  in patch 11.  (Dmitry, Biju)
* Use HDMI connector framework in IT6263 driver in patch 12.  (Maxime)
* Control the missing HDMI_REG_AVI_INFOFRM_CTRL register in IT6263 driver
  in patch 12.
* Validate the maximal HDMI TMDS character rate in IT6263 driver in patch 12.
  (Dmitry)
* Get LVDS data mapping from data-mapping DT property in IT6263 driver
  in patch 12.  (Dmitry, Biju)
* Validate 30bit LVDS data bit order by checking data-mirror DT property
  in IT6263 driver in patch 12.
* Use drm_of_lvds_get_dual_link_pixel_order_sink() in IT6263 driver
  in patch 12.  (Dmitry)
* Initialize a bridge connector instead of open coding in IT6263 driver
  in patch 12.  (Dmitry)
* Add a comment that IT6263 chip has no HPD IRQ support in IT6263 driver
  in patch 12.  (Dmitry)
* Use devm_drm_bridge_add() instead of drm_bridge_add() in IT6263 driver
  in patch 12.  (Dmitry)
* Fix a minor build warning reported by kernel test robot in IT6263 driver
  in patch 12.
* Use data-mapping DT property instead of ite,lvds-link-num-data-lanes
  in i.MX8MP evk DT files in patch 13.  (Dmitry, Biju)

v2:
* Add more comments in fsl-ldb.c and commit message about pixel clock
  rate validation for patch 4.  (Maxime)
* Document number of LVDS link data lanes in patch 5.  (Biju)
* Simplify ports property by dropping "oneOf" in patch 5.  (Rob)
* Add AVI inforframe support in patch 6.  (Maxime)
* Add DRM_MODE_CONNECTOR_HDMIA in patch 6.  (Biju)
* Rename it6263_reset() to it6263_hw_reset() in patch 6.  (Biju)
* Check number of LVDS link data lanes in patch 6.  (Biju)
* Add ite,lvds-link-num-data-lanes properties in patch 7.
* Update MAINTAINERS.  (Maxime)

*** BLURB HERE ***

Liu Ying (13):
  arm64: dts: imx8mp-skov-revb-mi1010ait-1cp1: Set "media_disp2_pix"
    clock rate to 70MHz
  drm/bridge: fsl-ldb: Get the next non-panel bridge
  drm/bridge: fsl-ldb: Use clk_round_rate() to validate "ldb" clock rate
  media: uapi: Add MEDIA_BUS_FMT_RGB101010_1X7X5_{SPWG, JEIDA}
  drm: of: Get MEDIA_BUS_FMT_RGB101010_1X7X5_{JEIDA, SPWG} LVDS data
    mappings
  drm: of: Add drm_of_lvds_get_dual_link_pixel_order_sink()
  dt-bindings: display: lvds-data-mapping: Add 30-bit RGB pixel data
    mappings
  dt-bindings: display: Document dual-link LVDS display common
    properties
  dt-bindings: display: bridge: Add ITE IT6263 LVDS to HDMI converter
  drm/bridge: Add ITE IT6263 LVDS to HDMI converter
  arm64: dts: imx8mp-evk: Add NXP LVDS to HDMI adapter cards
  arm64: defconfig: Enable ITE IT6263 driver
  MAINTAINERS: Add maintainer for ITE IT6263 driver

 .../bindings/display/bridge/ite,it6263.yaml   | 250 +++++
 .../bindings/display/lvds-data-mapping.yaml   |  31 +
 .../bindings/display/lvds-dual-ports.yaml     |  76 ++
 .../display/panel/advantech,idk-2121wr.yaml   |  14 +-
 .../panel/panel-simple-lvds-dual-ports.yaml   |  20 +-
 .../media/v4l/subdev-formats.rst              | 156 ++-
 MAINTAINERS                                   |   8 +
 arch/arm64/boot/dts/freescale/Makefile        |   8 +
 .../imx8mp-evk-imx-lvds-hdmi-common.dtsi      |  29 +
 ...8mp-evk-lvds0-imx-dlvds-hdmi-channel0.dtso |  44 +
 ...imx8mp-evk-lvds0-imx-lvds-hdmi-common.dtsi |  43 +
 .../imx8mp-evk-lvds0-imx-lvds-hdmi.dtso       |  28 +
 ...8mp-evk-lvds1-imx-dlvds-hdmi-channel0.dtso |  44 +
 ...imx8mp-evk-lvds1-imx-lvds-hdmi-common.dtsi |  43 +
 .../imx8mp-evk-lvds1-imx-lvds-hdmi.dtso       |  28 +
 arch/arm64/boot/dts/freescale/imx8mp-evk.dts  |   6 +
 .../imx8mp-skov-revb-mi1010ait-1cp1.dts       |   8 +-
 arch/arm64/configs/defconfig                  |   1 +
 drivers/gpu/drm/bridge/Kconfig                |  11 +
 drivers/gpu/drm/bridge/Makefile               |   1 +
 drivers/gpu/drm/bridge/fsl-ldb.c              |  55 +-
 drivers/gpu/drm/bridge/ite-it6263.c           | 898 ++++++++++++++++++
 drivers/gpu/drm/drm_of.c                      |  82 +-
 include/drm/drm_of.h                          |   9 +
 include/uapi/linux/media-bus-format.h         |   4 +-
 25 files changed, 1827 insertions(+), 70 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/ite,it6263.yaml
 create mode 100644 Documentation/devicetree/bindings/display/lvds-dual-ports.yaml
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-evk-imx-lvds-hdmi-common.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-evk-lvds0-imx-dlvds-hdmi-channel0.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-evk-lvds0-imx-lvds-hdmi-common.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-evk-lvds0-imx-lvds-hdmi.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-evk-lvds1-imx-dlvds-hdmi-channel0.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-evk-lvds1-imx-lvds-hdmi-common.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-evk-lvds1-imx-lvds-hdmi.dtso
 create mode 100644 drivers/gpu/drm/bridge/ite-it6263.c

-- 
2.34.1

