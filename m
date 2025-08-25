Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2420B34A7C
	for <lists+dri-devel@lfdr.de>; Mon, 25 Aug 2025 20:40:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A937910E532;
	Mon, 25 Aug 2025 18:40:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=outlook.com header.i=@outlook.com header.b="Y4RJw0qz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazolkn19010001.outbound.protection.outlook.com [52.103.43.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28C3C10E359;
 Mon, 25 Aug 2025 18:40:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jSgJLjT4oLWFj3d+ag+9yTo1CeW64v2V1fA6FzsuEzCC9ZJHw33rrjyN+5CpIqvzL4fgPZbc3oFEiKfJUy/xyAsGW6mSaMtDXuKvNoEl0c5bTqGL1RA9dSmwH41wsp3/D57tQAHWakO3aPJJevW1HHzQic88KqwKzXFiReUniG84MhHUN+XxntLCz4pZZJZHUZy/TjkgyrCwfbi5XNbY6jYA+8xHgxBqsBr0L/9QBoQrTGU8oLfk9niWz9wI/C2QpdyLkyDFlI7er75p8eAVrK8FVzvA8t6Z1wO/EvLN7klOm/F7d/jLTmfSx+JDsqM1KEQpIqMt+opi0N6QQiKgww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k8aup2t1AImqoehN8J3xj3Qb3q66qD3uTBjCr/uLd3Y=;
 b=H+jm2x7E0OEYus9LgGqNYUb4O3kgsXz4ww/WSQiVh5kWIZ5DUAWoM6PHpjGJjzc2soSnreKOeGDzPFwKpEDWBGeUJIDLLna0TTwmENxAXnZKNMfNmi0b09YTL0r8Pw5yoNtLRtujx4eypAvSQJYXe/3eWevUmnf4nJ7zGUyAogiwl1wXRKi+QGEm2A4CeeSSRkDfgVm7FYOgnCxPFF7KDiwNgZDtr78cRbG5WjQDtccSS0zRcdJ/4H8HrmsJb05OI80ugnzNfxH+b/2HDq517gfOFR+E9bVfpAVXnLZFROhrT79Ze0s4EetuCJzNW32VKoaLQYitOMudMiaP4RfTwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k8aup2t1AImqoehN8J3xj3Qb3q66qD3uTBjCr/uLd3Y=;
 b=Y4RJw0qzgdfBCM2IeMNUPND5lDC+W3qzFP2Z+IRxqD/4DsMyMRA32kbHjM8lbh+7s2N5htkGL9+WrKZXLffx8QJhiEf3MAOszm8MA7LHhZiWRF+c66BGOgkLwBDdR5RYLlWuKmlVudoTl7XgSZSUkdsGTgr3328/1jUYe+pCVTG2whb6vbKqRj3Ls93KV5Vg40CzP/+AqNSytlkbP53nnHr7RMhMVRHxbBaCYVSQq1oadOMf4y4PYfH3iJnUDbdETvqXMbRzWjxs88DUazB5sntuqh5X9xYLeRfFLBheukkJ5FLtoKmif4UFr6PIaRQADaDYfKjwO23lnZJkzROE8g==
Received: from TY4PR01MB14432.jpnprd01.prod.outlook.com
 (2603:1096:405:235::10) by TY4PR01MB15954.jpnprd01.prod.outlook.com
 (2603:1096:405:2c8::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Mon, 25 Aug
 2025 18:40:08 +0000
Received: from TY4PR01MB14432.jpnprd01.prod.outlook.com
 ([fe80::7679:e9eb:aeb2:f12f]) by TY4PR01MB14432.jpnprd01.prod.outlook.com
 ([fe80::7679:e9eb:aeb2:f12f%7]) with mapi id 15.20.9052.019; Mon, 25 Aug 2025
 18:40:07 +0000
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
Subject: [PATCH v2 0/2] Add "pixel_encoding" to switch between RGB & YUV color
 modes
Date: Tue, 26 Aug 2025 02:39:59 +0800
Message-ID: <TY4PR01MB14432B688209B2AA416A95228983EA@TY4PR01MB14432.jpnprd01.prod.outlook.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGAP274CA0007.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::19)
 To TY4PR01MB14432.jpnprd01.prod.outlook.com
 (2603:1096:405:235::10)
X-Microsoft-Original-Message-ID: <20250825184001.6524-1-wiagn233@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY4PR01MB14432:EE_|TY4PR01MB15954:EE_
X-MS-Office365-Filtering-Correlation-Id: 9bf4253f-fef6-44b6-cded-08dde406d05e
X-MS-Exchange-SLBlob-MailProps: iS5pQZgsAQAQzPBsqL0qQYWYJhuVqIOibFQzn61jGyp6AaF2dIQ4aOuze+uUNvymfnIuYNqqkKgkL2vgN3y+c8hAwIf5jyIYC6z3fHf0pJSQ+j6iAy1gYm9SV6rSiGV3hR/M3RrgS6ammtaSuiEwM0eIBbb5SRfgtayic45MW6K3bP0L4es4Xtm2VyCd33KYeqfdOk4vjN0niRBLkoXyQbBm/rz/fNWOFAoChY0CqAsB+TVZkLKAqyxPyJStD7h2rEsAMScwro/2o5g69wwA3VoIds3u1f5fjrsY7g62bweny09aRofrrT7FTxOmr48k8tnfC0jcybTFqN9G8dJEBuXrq4TH9kzVohIq18BZGpMOYX3GtefZsCDSuZgKZh5bu8bxi/UxzE1q11GMeNylOzTdPPnRfPEMq+PZAhwhPGTTXJVQSkY2f50ZR/DJOg2xFIo8xdIDuRnkMYAG8KY83ZgvXrKte0LBsC9QuSw/tmh1iUsSCW2f6ndVTS98Yfr05ZaSjlQW5TzkK545jDqb5q0sP07bFX4xBO/G4IqpD2d4eL0miU+Rcr4W9iBMg1eSZ/bCAMlP+Vl2JbZYufVpN3kewYzXLzw4h00nt0+4nOEnYpw1JXwtVAZNflzdq/Y5sFWc6YkCnyIo/HGssr3c5GHjXqx7HroEZoCtcr+c8QQMHFLFQxpNhuNCqr79EgTaGdRVSNSx4VK8HHE3BHdD25fcQqwBonSW1rUIMdwgueEE66IbFW58518NXPwZLbH9YrCA+qgvut9c6xIvpCb7225KK9mgGn6OYlZQGvGgumrBA2bYQLS8BviSUy9xiDbt
X-Microsoft-Antispam: BCL:0;
 ARA:14566002|8060799015|19110799012|5072599009|15080799012|461199028|23021999003|3412199025|4302099013|53005399003|40105399003|41105399003|440099028|26104999006|10035399007|1602099012|1710799026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?qzX8k5sEMVNQKbcRNsWBz0PhrX1rIPRvl7QJqAA5nyu0nfzCSkuOO3CT3jay?=
 =?us-ascii?Q?LHHTOP22ZSORaKC3gXH6tncEQH/XfTXQ77dYhgZxh5vftcYlMa6WJCqpHi9b?=
 =?us-ascii?Q?qu9/+4eLgI9UijdB5Ywmo8wxFQTdU/4RNUa8St9A8ycgPWQNfUycO1g9w4bN?=
 =?us-ascii?Q?2XpgvCTQEGyrOWhMJVe24Pctn4JnChcCwAlFIYYaMc+uyuEqMpotJ6mksI8U?=
 =?us-ascii?Q?FRDORD0gzS/w4P22v0j3FQ2Z7QeJZHls11VUqOIXFYvwaK3XvtCvdtyQaEsh?=
 =?us-ascii?Q?hNSh3INZ5MVqKSEb5RZqzmt2MzknksizAzCGPALUEcJgIe7Ju8xn/j0higi7?=
 =?us-ascii?Q?tydbmdatDB+9Iil1RzShWqp95+mHlkqcECb8S3EfMx5KOmVwTiJsEkDRdOwZ?=
 =?us-ascii?Q?5GY6XTMjdLZNdjSDgx6W1ruRmr4WRcxb12/GYRhfukRgB7INiW1bi1hyDN6O?=
 =?us-ascii?Q?ar4j07/dHgw4AGiW6+USIpHm49bB/7y3bcNllmVNRsvFq9GGVz8wO6KRlp54?=
 =?us-ascii?Q?/B1+v3kK6z8s+UOg5fjBRUunvhpUZ3Bdkr0/CrsMXeVooLsQufc7HYybFz3E?=
 =?us-ascii?Q?cQ9TV4gaQLW/qexuo0nHqTLaqcpeaCJB+rdZv1RyW+HpE2w6OsFjyoMybzfB?=
 =?us-ascii?Q?qy+kxR1eqMluAL22SgTutjNOS1OkKkUULSEFTyvkhvStRnVXT6UkFItt+e3B?=
 =?us-ascii?Q?u2LKAqYk+9yhmO80c1J04pi60yXngOeu+RDXjxD0gYvILaH+40n6Ww+1z8QI?=
 =?us-ascii?Q?LxMhS32VlACGcsvtiUqy3L1WxMtZ4wE9YXhW+727cdQGzHdfyW7fWXrIMCxx?=
 =?us-ascii?Q?TJfwAUzcCZDHlfe7pkgO3VU3x8bOKeZP98qUxGYU3vnNR/ue5Ym0XF3LG8Fg?=
 =?us-ascii?Q?ayqxX3VLIm7QC8LE6Uljf7ls4weXOW4BCAyxiOmiGLfOYnikR3uZ64ii1djj?=
 =?us-ascii?Q?DSmvPVNdoTEjDNnW1Gx8O7BI3bZUY4/0++DNjJT9h/z7YfOUYsvLTTXbvQse?=
 =?us-ascii?Q?IWBB/XtPx38snRK7jEjVpN7uKWpKKtwVvGXcNECikuEfWnhO76kEzPdCIqAK?=
 =?us-ascii?Q?SKYES/3UUJrkTkUTc0zlRJQBoZno+0UoHwoc3FMghEUuwfCEh//Xb4/OnVRs?=
 =?us-ascii?Q?k3hIln/S6Y/uK+Zzhjgc4XJJtziqYm8C57rzYO9VLu8Qi3ZDvlJmxGm3ahjL?=
 =?us-ascii?Q?8cY/8f4FPl5Kur5C+CXASw2OMLxbwjw+PohdKFbWRjhPcv3dHD2E4i5hG4ig?=
 =?us-ascii?Q?w5zS4UIbdZDtcIyuMow0nK6k5C8rQ+oiXqvikADzZIkutuYMuRkBOGAX+ClS?=
 =?us-ascii?Q?3WFz50p1xwv+uZ6rEkWzpTIBvq2MtIcBcXIPEygcmTX1TQ=3D=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dFOEP2UY23p4+KsqHZaiNAt0QvvOW8eU/8qvxijtpocWeWklZTH40agIlUC1?=
 =?us-ascii?Q?E85/Ceg4+Wmx4C9cPXG/3V3UI2Kqn+WBKdEhfqjqf2qURrzQBkS/RQkEb3l4?=
 =?us-ascii?Q?WPm+zfXI4MTPGdr8y96iPV4ikN+gq84o0QgOZovCZSeZk89IvcqRqkQqfHQU?=
 =?us-ascii?Q?Ml+rLe9dRCm467/Z+tjUQMbomK53U8e8a4jgSkF6QE6Vhx2uUG4WzWTQK7qI?=
 =?us-ascii?Q?IqOaSdSFbjQKH+OxRYLzUxzAzIOrNCS8HVlAudeXkkLPgBbFs2lpASPpEF/c?=
 =?us-ascii?Q?tXi+RvkncadoA32bZknAA03Y2+baxw2MEp1NUCXEHU5x1AHY/P11oOzshxHk?=
 =?us-ascii?Q?DtFvHxFp0H2BbExQFdUf6Pv7CxWjj8b/3W/o4iNeN9zx5+fJChzOu/Z31zIg?=
 =?us-ascii?Q?Zst/l21qX6d7mATYiwvf39WgdChqKbj6JCERAh+CNSM65e740NOmXm7nEHbp?=
 =?us-ascii?Q?cQy5trz9h69Yx6nm39MIzgpCAs3Mym+/FRviQJyl/M0NL7q+aIE0lsY8xBLJ?=
 =?us-ascii?Q?Op3jO1sdTcQUouYRMr41RkPt+Eu58A5TCIMdtSLU6SvaG/EbCPg12uARgM0C?=
 =?us-ascii?Q?cXL6nBupmuKJtd9pywThnb2lvG+g9STb7xm8lCW+61EBLDTM6YQp9R8mgiqp?=
 =?us-ascii?Q?ed6IwMLp1ZIJ8UscrHIHsEM/uQKwLIQy+YfguWqYuPrZp5yEbQh/MOXIL18T?=
 =?us-ascii?Q?Y3qfjLfOB12ESpCEycNRSSgGjFvGT3Zz66hBUN+mvWfgnxWHD1XtYZ9/k/Pi?=
 =?us-ascii?Q?OMXTNJ2RQcykJRyl4V+hrM0JHdjymWumaAfXuC0AKkSk6b1SSl768rKctrwg?=
 =?us-ascii?Q?1CmLJ7/B7blGNoqYPGMk3SM+z/R4dBY4wFiawuhXnT4U3locYY+5o/XvElPi?=
 =?us-ascii?Q?r71M1v6ZBmw+jo9zXoeXJhhxH6ezfyHbKmsDNDTFNdzYmtVxmqzCbCupyxwc?=
 =?us-ascii?Q?1uRINXrPjU+PDIPCBE3MWV1G57hkbgHqnu276ATIn759XgdgOqPQLms63mmy?=
 =?us-ascii?Q?cQNlBwQq8XnyQYt353JZGofyvJPublkYkEOatPaRn2XNz6u3PQTUFcRQNq9a?=
 =?us-ascii?Q?xys/g9Sdx5/yR7/81Y8/e6olXnjwiuM2EceUdM+IJn9VSQ/MRHEAgQxOFwCK?=
 =?us-ascii?Q?l/kE/ioCRIRa7dPuGlR3I+UF2YEe2BJocJnxGRrcgSOxndaf2i8FJVEbpLfa?=
 =?us-ascii?Q?XaEzw8xYi3aozHjVGJYfIngqP2hvcIwPgomCU8kGg0dIciN0t1pqGsBdVI2K?=
 =?us-ascii?Q?0HDO6PTDoCb04HObT5XmoJ/vYsB+yKmichionu4DkK9hu3yx0SbSJiy4Lhyl?=
 =?us-ascii?Q?M/A=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bf4253f-fef6-44b6-cded-08dde406d05e
X-MS-Exchange-CrossTenant-AuthSource: TY4PR01MB14432.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2025 18:40:07.7347 (UTC)
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

Usage:
 - X11: xrandr --output <output name> --set "pixel encoding" <encoding>
 - Wayland: proptest -M amdgpu -D <card path> <connector ID> connector
   <pixel encoding ID> <encoding (ID)>
 - Kernel Param: amdgpu.pixel_encoding=<encoding>
   or amdgpu.pixel_encoding=<monitor>:<encoding>,<monitor>:<encoding>

Supported encodings are: "auto" (0) (Default and original behavior), "rgb"
(1), "ycbcr444" (2), "ycbcr422" (4), and "ycbcr420" (8).

This patch series allow users to switch between pixel encodings, which is
specially important when auto gets it wrong (probably because of monitor's
manufacturer mistake) and needs user intervention.

Changes since v1:
 - Some cleanup and rebase
 - Added YUV422 support

Full discussion:
https://gitlab.freedesktop.org/drm/amd/-/issues/476#note_2628536

Original patch by Yassine Imounachen, current version is modified based on
this patch(was rebased by Rafael Carvalho):
https://lists.freedesktop.org/archives/amd-gfx/2024-October/116195.html

Shengyu Qu (2):
  drm/connector: Add "pixel_encoding" to switch between RGB & YUV color
    output modes
  drm/amdgpu: Add "pixel_encoding" DRM connector property support for
    amdgpu

 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c   |  36 +++
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.h   |   3 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h      |   2 +
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 273 +++++++++++++++++-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |   1 +
 drivers/gpu/drm/amd/display/dc/core/dc.c      |   8 +
 drivers/gpu/drm/amd/display/dc/dc_stream.h    |   2 +
 drivers/gpu/drm/drm_modes.c                   |  32 ++
 include/drm/drm_connector.h                   |   7 +
 9 files changed, 353 insertions(+), 11 deletions(-)

-- 
2.43.0

