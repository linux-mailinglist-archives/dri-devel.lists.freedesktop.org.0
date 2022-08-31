Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C1D05A8004
	for <lists+dri-devel@lfdr.de>; Wed, 31 Aug 2022 16:23:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8095F10E03B;
	Wed, 31 Aug 2022 14:23:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 389 seconds by postgrey-1.36 at gabe;
 Wed, 31 Aug 2022 14:23:02 UTC
Received: from de-smtp-delivery-113.mimecast.com
 (de-smtp-delivery-113.mimecast.com [194.104.109.113])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 634E510E03B
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Aug 2022 14:23:02 +0000 (UTC)
Received: from CHE01-GV0-obe.outbound.protection.outlook.com
 (mail-gv0che01lp2049.outbound.protection.outlook.com [104.47.22.49]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-3-FDhVL-ZiO4avT6c5oYFnvg-2; Wed, 31 Aug 2022 16:16:29 +0200
X-MC-Unique: FDhVL-ZiO4avT6c5oYFnvg-2
Received: from ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:2e::8) by
 ZR0P278MB0377.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:34::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5566.15; Wed, 31 Aug 2022 14:16:27 +0000
Received: from ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM
 ([fe80::6c6d:333:ab23:3f5b]) by ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM
 ([fe80::6c6d:333:ab23:3f5b%2]) with mapi id 15.20.5588.010; Wed, 31 Aug 2022
 14:16:27 +0000
From: Francesco Dolcini <francesco.dolcini@toradex.com>
To: dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v1] drm/panel: simple: set bpc field for logic technologies
 displays
Date: Wed, 31 Aug 2022 16:16:22 +0200
Message-ID: <20220831141622.39605-1-francesco.dolcini@toradex.com>
X-Mailer: git-send-email 2.25.1
X-ClientProxiedBy: MR1P264CA0039.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:3e::31) To ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:2e::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d8125b9b-434d-41e4-3b10-08da8b5b64a8
X-MS-TrafficTypeDiagnostic: ZR0P278MB0377:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: YezYz4cv7STuSaBtz3TIXnJqTr4RAbVVx8cTgRFwd6LV9h1g3NW/BmEWpE0v+GVcB1fSpjiKbUO+3Hnpz1jG4JB0YE+G3HQW3tZVIQw92lsCW/Vo2yKy25Ree4X/8/GzlMn9UlIe8i+YGgeObLjwbFgCkh6r+bOcEXLfOPdXTxG8YZSos2jctUCOm1IiyeUcAaLwU97JQOt5tEwp1wAsPoqc4hmFy/rqSK2+D1LqVAABY0QWK9NnOnkS73qmgN7XIzS5pGJi7QoSvktyiPONqiBp84K/dhsly7sQP0kjgIRkoBFQyNuEDt8mwoLJeb61zEwNH89NdLaUCFScTz1XDztosD5d8juE92MuRBPJd4G/e0RjTqlcmDESZ99T114xCEEGtQWPaDxjhYe8HEMPmOqxklyXaMfgzVcUd16Y1+HRO/Z7k0QZPK2lDpUn3LF1YiElN6oPKapkm6q90epl/IM+TBIQYkmC1MCZNxl2yU0elfZUpB9vYypUHdnZmL1IPk9kTjieSeHSY3tqtlNzebCrOh6XxW9GuPpymEYI5xJNGFF3Eo+7ORPe0tT/qIv9J1WcvO73POY2x3e/cJlXdN5ZR2B6Yc5XZa3ZJMAj/jseu9MIr+Bda4dgn/PiXceONYT1/FtYXYG6hxAkiPu8A5tC3hP2fdJR39tnz26EscZnKUDobJh42aFZf6XtnBJghcn3D5eq4+svxFzOjR6or/raVxyuJ2pCSA7VD5lNtsl5qXh3NceKjc20mjDPqaF5
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(346002)(39840400004)(366004)(396003)(136003)(6512007)(2616005)(1076003)(316002)(186003)(26005)(6916009)(52116002)(86362001)(36756003)(6666004)(2906002)(6506007)(44832011)(107886003)(38350700002)(478600001)(66476007)(41300700001)(8936002)(8676002)(38100700002)(5660300002)(54906003)(6486002)(4326008)(66946007)(66556008);
 DIR:OUT; SFP:1102
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?C0vZLy/ntNT3UebFrRA+hPMyufYrkCAwNpa3rAfMq1GNHgadyh6jbuYpqOfd?=
 =?us-ascii?Q?7H5JosLBzUSo4/63mFM8Zwbk/Zq4QHfsPC6mWkKPa0GASfFRtuRF9HBVvjPN?=
 =?us-ascii?Q?ZOqD6aml/tpMqt/sAETkjPjc6x+hkiNYzLFdiQrH9Z/YrD8gv0lcRb2F+Hj9?=
 =?us-ascii?Q?ogf/U3nU83X/cuF+ILIGp92pXy8TFMxeWEUVXbLvycoWtpluJgXMl30R6ZZU?=
 =?us-ascii?Q?QRhouYaBKSFyUngfG8WWmjOOtglioubDQK5xfUYHe+HqXOorUb7RQuMl3VUM?=
 =?us-ascii?Q?7lxHslvUIMZQGR7BMX2XSq1R38IbQTvMY8aOKtvAOEXiRhZqn8psCFtjmmdV?=
 =?us-ascii?Q?CNxOhd31qihwb5mHmbVUn/YUMrAiuHBiTsgiggh+HaN8he0nOzPRy5Fk8qN4?=
 =?us-ascii?Q?KbuzyMS1DPEn/jWqn2zxEfmeB3zSukzE8aEZYIJISX7eW/l5cMeDYo+JN9Tp?=
 =?us-ascii?Q?7yEtKkg+fmWtTrYy6fckOBw8fbbRFGSU418q4jpBZZdP0dFwO/yh2MZrTgBp?=
 =?us-ascii?Q?JPylMkXZa046jtYix9wl65LKvwO6VRJtkdZhBOwJ/7ha4QyUEaq65SVU41qm?=
 =?us-ascii?Q?VBry1RTPf6YdUROL8U1obA6nTju9AgqMMq50pGeZ5bxddlJ04MGyPG6r++Jb?=
 =?us-ascii?Q?940/K1qbcUygvAbm10eF2vHuKwbxvzYCp4+zjrFzERPpi9yCom9K7wKJ35f2?=
 =?us-ascii?Q?lfgs0Pa5eX3cqsXA/xHq++hQpmzHZiQF2vCQVw+BuBKq+OojaJoC4G2ZGwsk?=
 =?us-ascii?Q?81sZ4di1lcgXPfVrcCXt6K1+/bZNzXzBDmeGoxirGDh1lDVzqOr7WZzWVmob?=
 =?us-ascii?Q?ZaSvV8jhsxVOPB9WpMxAkCRnV4HdGDRCc8qBzZyIsw+sk5goOt2BisntkIcz?=
 =?us-ascii?Q?3DoDH3riXhyR+WP5o7S++Y0UQXFyDXNZCn4SPrsgOIfo3A6Ye9b9OIREvzq4?=
 =?us-ascii?Q?JR/K6DUMKi8KvfMyAfh0H8pFXh5vFBdfTwg0M9RMPGjoVK93gX/4FD7LeJ15?=
 =?us-ascii?Q?dnP+14j6q1zjK6FvYU26hbDIlK2nbjhe0exaslxlCulaJBW2g7PA0ClMh9cE?=
 =?us-ascii?Q?KF1ixU9/yDnbxSSdl3bI3AkNareTt2wPvZqpm3xK6VrTpx77b+R2UPPY1fkh?=
 =?us-ascii?Q?nZHy3L9hSImG+qA7QOBwf3cfkmFWZcol4EHBgKJxkyZaTSVPJz0Y3vIE1ncL?=
 =?us-ascii?Q?Xh7O98CWrHgD3uZXgaL5dPbUnsac9nCzov72Cbs7yUuh9FDniySlhJGPTaeW?=
 =?us-ascii?Q?XSRT8ypv1jNqmvq2DpkjlG96R2cgN9jCGe4U6hbYqE8T+wBGJXKRyJf4wPjX?=
 =?us-ascii?Q?RakTffXZ30eFlQXGX2U3f5EVkoCW+Pa/PRmzL+wJPn3/+rIlzPErspi+5SZ/?=
 =?us-ascii?Q?Jm3CjdbCRHZ9OiMwM0WRFSCmC9zfIkYIWrGjK17uVKrUQRb0Kv2gVbn+0PmL?=
 =?us-ascii?Q?GRZKZBgDTHbd0+g3Hlbsd2Zu73KRKIlyM2KgI4636IP/ZxJE7pEarhbJaaVM?=
 =?us-ascii?Q?CUi5COSNhSMS/rLgHT9QGaIn6rBTal0yTMux31B9KEMEWHwZY3dePCY1iYHH?=
 =?us-ascii?Q?km8mIkMnHU5EgereUxxzIwK4V8wfVlSpk/mWA1BaexmUAOkmr39Hzr7ttnRf?=
 =?us-ascii?Q?Eg=3D=3D?=
X-OriginatorOrg: toradex.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8125b9b-434d-41e4-3b10-08da8b5b64a8
X-MS-Exchange-CrossTenant-AuthSource: ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2022 14:16:27.4159 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d9995866-0d9b-4251-8315-093f062abab4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5Z5cjQm2se4lxOCni1oYmkN2CLsy9N5ct++f7AcbrQH+6FjMo1JWDlJksnTB/SJ2nE6m3X9Wq7kGa3pgU8WK4CEV0tpcTVQOU6k4Cx/yTRI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR0P278MB0377
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: toradex.com
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=WINDOWS-1252
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
Cc: David Airlie <airlied@linux.ie>,
 Aishwarya Kothari <aishwarya.kothari@toradex.com>,
 linux-kernel@vger.kernel.org, Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 Francesco Dolcini <francesco.dolcini@toradex.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Aishwarya Kothari <aishwarya.kothari@toradex.com>

In case bpc is not set for a panel it then throws a WARN(). Add bpc to
the panels logictechno_lt170410_2whc and logictechno_lt161010_2nh.

Fixes: 5728fe7fa539 ("drm/panel: simple: add display timings for logic tech=
nologies displays")
Signed-off-by: Aishwarya Kothari <aishwarya.kothari@toradex.com>
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 drivers/gpu/drm/panel/panel-simple.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/p=
anel-simple.c
index ff5e1a44c43a..fef3fb0f45c9 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -2505,6 +2505,7 @@ static const struct display_timing logictechno_lt1610=
10_2nh_timing =3D {
 static const struct panel_desc logictechno_lt161010_2nh =3D {
 =09.timings =3D &logictechno_lt161010_2nh_timing,
 =09.num_timings =3D 1,
+=09.bpc =3D 6,
 =09.size =3D {
 =09=09.width =3D 154,
 =09=09.height =3D 86,
@@ -2534,6 +2535,7 @@ static const struct display_timing logictechno_lt1704=
10_2whc_timing =3D {
 static const struct panel_desc logictechno_lt170410_2whc =3D {
 =09.timings =3D &logictechno_lt170410_2whc_timing,
 =09.num_timings =3D 1,
+=09.bpc =3D 8,
 =09.size =3D {
 =09=09.width =3D 217,
 =09=09.height =3D 136,
--=20
2.25.1

