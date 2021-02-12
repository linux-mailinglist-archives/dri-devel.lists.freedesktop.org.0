Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7230531A215
	for <lists+dri-devel@lfdr.de>; Fri, 12 Feb 2021 16:51:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 981676EE49;
	Fri, 12 Feb 2021 15:51:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08olkn2100.outbound.protection.outlook.com [40.92.47.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1BCA6EE49
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Feb 2021 15:51:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ea9gBlI2qxJPDAyI3AXh2buEQ1ggP6bzzlJkopXBdH79rQt5m6nIkn99n7C9/FFwsWlVWu9iSoIxlz798zoZXzAq6qJe8pgVGmR0QC7WRtqHZiVH3q87Pdf/a7zv4XpenMowMPBLFWjdVRE5DtNMSMZIJPL9026GYJru+m0oeSHPDGUjDeNq8WcExFe7XJhINuYOjGc4ag9xvTq7SUeIo7blGYk0prI64RLm9QbqwMqgRmZ5fixs7jCKplpqFZo7JFoN+VlWDKudapNOLIPdqfEXZi6LzHDaPMmsqaBAA6pi3E/Dm8PP5KYjGLGYUCuu58/R3WnuOQRC7O3duurChw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/wna6KyD+fNptizWbA2irKD3iyuHAmn2TsYn3+KSl0g=;
 b=FvFrcHxKTGgrlLz77adFsLRrjXEMAm2KEHYmvXYadxqSHGlYK2SKaYA1/XiUqOSF6nNH0oWbegvGmiDs9TmiFn9hjDBoAPYgDMLx61CzGLXPgO39maHugiDvwbuVFAqIveGRXEMiWyvr6bx17Xp7S4lCDqwpFYgiNTlbvhk7eHDOFZaTWZBj6d7h7QsKwRLxuvcfKhwZy2JmXw2hUr+QMT6Gvqxxu3GVERUxJxdpkGJ124Iy0F6jn4jdIFKlN8o+huObCn50L5b7ccbxgyXKisEwwwwZ6RzKi71Sz5cH6FQUrj1ft6Q7FPwQvirTMVdYNKVGT+2AZ/D2UicgC2iiCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/wna6KyD+fNptizWbA2irKD3iyuHAmn2TsYn3+KSl0g=;
 b=PmtvBPVk9JBLdBcqHng8Nkw9oABkISGPQsLArIgDKJJuv32FNagtrcHPGW3q54HbjiJcFlxT5wszqAJXcqw6p2sUwhohGxjQnonLkTkjerF10jD+OPcV2UyKMNjAlGy5Qc+Y3ozrFJ15Rwq8157Gzug/IGSb15RN/01x/5Z/cULbx0kpFH9pmd32OVRRjJiKMM/ojDGDB4/x1CAXUGFRXEHQRRamWuHC3Q/txCDpxs8ujpAbCRIKFgtwXASqhm80UkDvxEx4IjhNFA+x7hlQ9WvDi9Hmot7IWFjTSP5s9WVC4TOAbHmY3WFT80RnP8Fm4QBh+WFpTrjEJLGnmPsI+A==
Received: from BN8NAM04FT017.eop-NAM04.prod.protection.outlook.com
 (2a01:111:e400:7e85::45) by
 BN8NAM04HT057.eop-NAM04.prod.protection.outlook.com (2a01:111:e400:7e85::128)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.25; Fri, 12 Feb
 2021 15:51:18 +0000
Received: from SN6PR06MB5342.namprd06.prod.outlook.com
 (2a01:111:e400:7e85::4c) by BN8NAM04FT017.mail.protection.outlook.com
 (2a01:111:e400:7e85::392) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.25 via Frontend
 Transport; Fri, 12 Feb 2021 15:51:18 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:22B3125F2F48DF81524F9D663381CD29A302F67EA28BB2AB7DA3C8766371012C;
 UpperCasedChecksum:697BD3C1660BE0B73BEA85E388615C69F8562557E544A1CDF10011891922C825;
 SizeAsReceived:7567; Count:47
Received: from SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::c1c9:7368:b8b3:454a]) by SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::c1c9:7368:b8b3:454a%3]) with mapi id 15.20.3846.027; Fri, 12 Feb 2021
 15:51:18 +0000
From: Chris Morgan <macromorgan@hotmail.com>
To: thierry.reding@gmail.com, sam@ravnborg.org, airlied@linux.ie,
 daniel@ffwll.ch, dri-devel@lists.freedesktop.org, HHheiko@sntech.de
Subject: [PATCH 2/2] drm/panel: correct typo in comments for Elida KD35T133
 panel driver
Date: Fri, 12 Feb 2021 09:50:22 -0600
Message-ID: <SN6PR06MB534273324998E0AC1E071C17A58B9@SN6PR06MB5342.namprd06.prod.outlook.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210212155021.10043-1-macromorgan@hotmail.com>
References: <20210212155021.10043-1-macromorgan@hotmail.com>
X-TMN: [qHE9R61xSVLVYGuUz3fzplF8vzoGVeBR]
X-ClientProxiedBy: SA9PR13CA0012.namprd13.prod.outlook.com
 (2603:10b6:806:21::17) To SN6PR06MB5342.namprd06.prod.outlook.com
 (2603:10b6:805:f9::31)
X-Microsoft-Original-Message-ID: <20210212155021.10043-2-macromorgan@hotmail.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from wintermute.localdomain (76.183.140.3) by
 SA9PR13CA0012.namprd13.prod.outlook.com (2603:10b6:806:21::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3868.15 via Frontend Transport; Fri, 12 Feb 2021 15:51:17 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 47
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 111fe5b4-5373-438a-2df3-08d8cf6e0931
X-MS-Exchange-SLBlob-MailProps: CaK+F7me6CmH3riu7F4l46QSPcUarSK0S4VxDkLJUn3gbHslO4hsnpt2JlpZnM9M86d4P0yL3ThFnuHYcJ3cxLJ5t3K4qN8MBsFH0YPOYjl434Hx2S5+x+0BzLzBLj/Rb+R38+3vbUta7Y/0yY0l+O04gNQqehhjgp4V9W916Rb074XrcBsj6FZBsUD5Qz8YuH46RH5U55/6UDHMnaAujDIInUAniR9CajktxRrwFX5j7CeLfb8e6LKmrDUweVXljex1zWQ25TuTgKblAdNfU2lrKNp9YwhTr1TRhPiWxLb962id3Cg9AhuKBr96GhfRhBTAUKzz+6/w0XqRPN6aZ1U2bob7Xe8AseUOtTpTq8Em4IzMKk5ntbl9rjTqav2nncoaem/0ZuG9O0WUwJqeE1gxJHCwYWS7QvlDwiqs/MgaT6+nofJxciq4kmj4+/EsJa+XbwkMQrXZN/ddpGVLHaiXDxwV/xWf9LEQjoAb433l7nJUELQkSp3YiHEoQ+yaW5RtBEcGendPCChnd/lGn9gGOosSWNRjA6vDAUvJHuwOX1W0o23JooEb5UQ3l6wysQIoLM1vvGZ6n7Ic6IbNyGDFGBnV/H+BwELfywK1q9HbtaIppGOoMOiGq0IderKpnhhe2UI2cGGGA7yFZE0uKc36Sh0zdqA7mIw3SYaRHUf4LxslH+aGXKnsVva14i8aCUzHmAEpczHBdlfbMeJNrre4JoM0o0HS4uexpro6hyOyYMtUgPrb8g==
X-MS-TrafficTypeDiagnostic: BN8NAM04HT057:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 23nlR+LDfl0fCjEhPWAZ9GNkjaXJCWB1QZ+OAX5S2XGmXewGSpFzo6ZPw46dyp0OcqY/FkIFSzRVSr8VgJ5sJnPQDHIJLPSXA6Z7Y5lJxhBfMAMwYaS8RMAcnC8w9oVOBzZmaL3WO40k6hh2N4NgFttppVmmWa5HA8mrbpdsZsEsm9xVXGaP+n9tflm30a16A/njUXGLINqn4bSl24BvSzaUgVOsqbLFfu28NvXeyPJ2h9alZiMwCNompPwQ6MXFsZrQggx4i8UVr3dP++yJ4qZS9JsVJ6ZIWpUINFTRCxWGrkq9Rd+8LRVZU1QsMKtc58ez+U2OQFRymL8pHhdPHRL9yIFMSY7LpFDO4HtY/KSJE+PBX9n+zD1mJZ+oLuS0MwtO3+3hV3OEMXE/nWP3mQ==
X-MS-Exchange-AntiSpam-MessageData: 6H1ShuGGUusdJyuECHwGiWIK+jNp/UAt7C53CMqoxj0yZclHE7RW8KHT010nxpKkex537j6XT5gu9gSPQSllRu9xZqxjQ4kcsjO5A9IkDxkxAxNdEbhyGxv7USKAKgvyRcjkTRI5RwZzyP5doofDqQ==
X-OriginatorOrg: hotmail.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 111fe5b4-5373-438a-2df3-08d8cf6e0931
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2021 15:51:18.3963 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM04FT017.eop-NAM04.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8NAM04HT057
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
Cc: Chris Morgan <macromorgan@hotmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Update the comments to state this is a 3.5" display and not a 5.5" display

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 drivers/gpu/drm/panel/panel-elida-kd35t133.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-elida-kd35t133.c b/drivers/gpu/drm/panel/panel-elida-kd35t133.c
index d8534406d1ef..bce84d2e6ada 100644
--- a/drivers/gpu/drm/panel/panel-elida-kd35t133.c
+++ b/drivers/gpu/drm/panel/panel-elida-kd35t133.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Elida kd35t133 5.5" MIPI-DSI panel driver
+ * Elida kd35t133 3.5" MIPI-DSI panel driver
  * Copyright (C) 2020 Theobroma Systems Design und Consulting GmbH
  *
  * based on
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
