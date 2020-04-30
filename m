Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7BED1C0EA5
	for <lists+dri-devel@lfdr.de>; Fri,  1 May 2020 09:23:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58CCC6EAE2;
	Fri,  1 May 2020 07:22:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2131.outbound.protection.outlook.com [40.107.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 198AE6E1A4
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Apr 2020 09:31:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ATpRf9wJ7xKwysWfc45YuFmLwb4XX5Dewt/DcbFPAdhqO1UDBennCNLNcFiEWluHViXHjD8tC1u68z1P3UOcC8pWEfMTEL2sx3v9dVJ7vsDeP5DT6l/IjBlCcxi5CL8IwHmfNXlB+COkmIlDBtnJjjSu16O2CWIyJTC2rN5Cbn91hQ52kWqrSWXtXdQjFygUnUEvRJVuluRjJNN6nhlQeEFek8C1oCg2WctI2JISqyxe+c+6gRStMxRTxbDGobUMDEK7sz2sTAL/ZM7Fx7Wxku5q1DfpN9Yfq3sbfPkRvVTRQTvxlsOi0FISD9ZuPxeUQxE8NY8O36mnZND+7XQoQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PjcputcpAVuejRSE+h+UbIwkTAKlbMOSs7rIgggz7jM=;
 b=H7vbsL5I7lmWwn0+eBaPPerx7Jwf291KCQ6Og4rp5AIkVlJLrg0V7iJJcoJ/4ZDQXvjxZq5Y3OodsblXT/LHoip5C/c2yAFkKndkL/cxmwmwM3IO2yMI+DrAPWSF6V45uMAZ+QozU7IbBrKRqtGq2GL+9b9teQBL+VRtSLYLubHLydl+xgpaFJLwSi2KpkTkb1dZ+lgoDPAQflX9PslHkGY0iReLnatfYSt/vG90tFQYjLqqENHfnyHa9ZJ1nISGBoHjU6iO6syvcuZKwKrySwTCIa43uzu96dl4VIbVuyNWXLv9dk6oi/HR5a78aZJK/Pzh2VwpLKrbzsnS1/D3sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PjcputcpAVuejRSE+h+UbIwkTAKlbMOSs7rIgggz7jM=;
 b=EcCinpGUCZSAbH0mArOawo0xEitT5exwza4JOZ6dWbPO6NXpH61bPu4lZ3nZciUtVvpURzAClKj/7Ywj8Ivfea4AcQ9EP9LVsx+QCyoJg407ITahLcVFAHwMyuMS1QH3PVxbcMRO4SmBV1nifbFBDsUHBkOl70MEp2qSPPM9gog=
Authentication-Results: analogixsemi.com; dkim=none (message not signed)
 header.d=none;analogixsemi.com; dmarc=none action=none
 header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by BY5PR04MB6625.namprd04.prod.outlook.com (2603:10b6:a03:219::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.19; Thu, 30 Apr
 2020 09:31:45 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::4517:bcc8:a3bd:407f]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::4517:bcc8:a3bd:407f%6]) with mapi id 15.20.2958.020; Thu, 30 Apr 2020
 09:31:44 +0000
Date: Thu, 30 Apr 2020 17:31:36 +0800
From: Xin Ji <xji@analogixsemi.com>
To: devel@driverdev.osuosl.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <a.hajda@samsung.com>, Nicolas Boichat <drinkcat@google.com>,
 Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v9 0/2] Add initial support for slimport anx7625
Message-ID: <cover.1588236052.git.xji@analogixsemi.com>
Content-Disposition: inline
User-Agent: Mutt/1.5.24 (2015-08-30)
X-ClientProxiedBy: HK2PR02CA0206.apcprd02.prod.outlook.com
 (2603:1096:201:20::18) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from xin-VirtualBox (114.247.245.254) by
 HK2PR02CA0206.apcprd02.prod.outlook.com (2603:1096:201:20::18) with Microsoft
 SMTP Server (version=TLS1_0, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA) id
 15.20.2958.19 via Frontend Transport; Thu, 30 Apr 2020 09:31:44 +0000
X-Originating-IP: [114.247.245.254]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 813215dc-d5f7-4de6-d1d4-08d7ece94c1d
X-MS-TrafficTypeDiagnostic: BY5PR04MB6625:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR04MB6625230A8C5E304C1DB0F5CAC7AA0@BY5PR04MB6625.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-Forefront-PRVS: 0389EDA07F
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oHh5ZHcBhVY1LkzUt35CHsQF+drWUKmfGLxxDy4vYfGhYLtsttnOGrtnEd+9SMNXGRRtFd5I+6Yp0GuvxN7pN0TkcKi1vo23Afu1JE9h7hMbNvsBYi+OwQyy0zFxYTCMtsZs22yExeYv0vukdaXOFNk2mduldlMB+Sg6T1X13N3R0OnYCjbZ3KvlsM6Zf6y6Huk8MTWh1P/LyOQ1KEkau+nimkEDrWOh/B/Dewgj5Zh+PmFLgZKTdJTVii6gBnIPDYOQ9z5gIccGG8piBQhsZW1FnIG+ljmw1/jhNYZcjPq9Nudjw0vFbNGtpzUvG5xCIqWge2AHJNIbnJ85jS7sqv+GzAvdjLECGp9A80H6VDwuxS2/BodmjO2k/HMer8bAne06r1iQaXpdCrKTQ8nw0jAHZwVwVPwdTLcstF9DaUW+ifQIpiYYJTS0YmWRXBhI
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(136003)(376002)(346002)(396003)(366004)(39840400004)(26005)(7416002)(2906002)(16526019)(186003)(5660300002)(2616005)(86362001)(956004)(52116002)(478600001)(316002)(6496006)(6666004)(8676002)(8936002)(36756003)(4326008)(107886003)(54906003)(6486002)(66476007)(66946007)(66556008)(110136005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: gUYdRKjnIidZhk4/KobQo9qmzZKdTLMuNA+jKlY6Edu2PWighVmwNABYPEOhVSQAt5MMnJHQLhD/SMGjcYVJG9IQO85Nv/p7JfcA0uMHv/18Ovl3llD7Iag2FyNV7lwijFG1sGcZ1pbtHzYMGCxmWyrxdkR+xTzKSXA/pUNtBO+BMib6hoF9suuhPEbNL6OVgfiYUgLKY9hJXz/omyWSyTwhiUB0YOgKKgUKs8ajliHo1d7DLR9ilgnLnUlwQ+bTLeq8KljffTnfm5TQvYUt2LtoHLHCCiHFPfLBKz5pnNTBcfNXD0mLZK87HxXXiQ18WFf84IRXRln3q8KY+5X23V8HdmSeNnRTrlA2KXAIodRZjxNvfM/PT2m0KHMegSnl2txLREQtndAvf+tlp0q1uMeZTMD1hL005qTmOBlYlxxbeW+ysUxCEN6zm3FY/bXxRtyg2c6ThggO/r24sv4lZgdDjATz87L1wF9bGkCPyWVldIAszJG2G1U3Nk3ZAMkhK5FP7viJJscIWy+H/1HKAiGfbJcVqAu4YapPiCWgr7LDJBqcQPcw1Ktzcxn3Rl/9KhxYRzOsjqKa59xbZ2K54u3OP9Tv+VhVZbFgCgDhFCGoSjlJpIrfOBiUIWrYbhiDMXXZ0MgZb6rdZWPV96kehlMIBE215iz6vCnLsYbtQR3jIEs3f1cen0wAHA+1BNJFXL+1pJZVJn3OtyBQFsdlk7qzCyhDA1Ayv2nDIDSZgWKSXkIavxS3NHzDsFWBvJW/GOZSXakYpVb5lXW3Q84kucfzPXtBU9ts7SEDip8kY2jDfV6lUaKqT00X9Nl2sTtl
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 813215dc-d5f7-4de6-d1d4-08d7ece94c1d
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2020 09:31:44.6893 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KdZ9dOSajEN9oIiE78XWCnkgyzspLif2NVEVNKhbylvAQWC8hAuGw1sd+hYRK6WfnsQYuAkP7BWMT2r0erYGsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR04MB6625
X-Mailman-Approved-At: Fri, 01 May 2020 07:22:25 +0000
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Nicolas Boichat <drinkcat@chromium.org>, Pi-Hsun Shih <pihsun@chromium.org>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Sheng Pan <span@analogixsemi.com>,
 Dan Carpenter <dan.carpenter@oracle.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi all,

The following series add support for the Slimport ANX7625 transmitter, a
ultra-low power Full-HD 4K MIPI to DP transmitter designed for portable device.


This is the v9 version, any mistakes, please let me know, I will fix it in
the next series.

Change history:
v9: Fix comments from Sam, Nicolas, Daniel
 - Remove extcon interface.
 - Remove DPI support.
 - Fix dt_binding_check complains.
 - Code clean up and update description.

v8: Fix comments from Nicolas.
 - Fix several coding format.
 - Update description.

v7:
 - Fix critical timing(eg:odd hfp/hbp) in "mode_fixup" interface,
   enhance MIPI RX tolerance by setting register MIPI_DIGITAL_ADJ_1 to 0x3D.


Xin Ji (2):
  dt-bindings: drm/bridge: anx7625: MIPI to DP transmitter binding
  drm/bridge: anx7625: Add anx7625 MIPI DSI/DPI to DP bridge driver

 .../bindings/display/bridge/analogix,anx7625.yaml  |   97 +
 drivers/gpu/drm/bridge/Makefile                    |    2 +-
 drivers/gpu/drm/bridge/analogix/Kconfig            |    8 +
 drivers/gpu/drm/bridge/analogix/Makefile           |    1 +
 drivers/gpu/drm/bridge/analogix/anx7625.c          | 1959 ++++++++++++++++++++
 drivers/gpu/drm/bridge/analogix/anx7625.h          |  397 ++++
 6 files changed, 2463 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
 create mode 100644 drivers/gpu/drm/bridge/analogix/anx7625.c
 create mode 100644 drivers/gpu/drm/bridge/analogix/anx7625.h

-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
