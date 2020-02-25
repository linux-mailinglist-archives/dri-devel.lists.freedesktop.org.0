Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D2F2416BC4D
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2020 09:51:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECD246EA2F;
	Tue, 25 Feb 2020 08:50:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2132.outbound.protection.outlook.com [40.107.92.132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3952D6E0E8
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2020 06:11:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lnjfY/9PFhKOXMqzH0npClgg5CpA3VOWVgeCnZCigbgC/aRfHY+sbuI6Ein3Ie4F2ODKQEW1MCFhzeeQMwhAIXXpWtmiW/CLSZdu4cJ/zOxfBu1/Lo7C/4dh38Po/h/imCMp4IUWgvCpJ0cXZfn3UZIE6jls2iTKtz319pcQ96IlIOyW0gjjotv2rPfgJ2MFG+3LBL9iSpDeg2rGLDjHQmrOzQV2RVapPpIKwnRxvyY9m91oqTQ0Mhqto24fVLOko0qcW2T1UsBdcgJwyhcxXVox0LFLu2khnTSKWBYYrcw6P9BbV/LgbJmig+s7GdTTxVAw9tPcd9Lc53O6tr1HpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P5Ci8GWyK3SOB6xpXF/O/X6MBqh9rKxAjlXfoNb8Yp8=;
 b=CnGxx3zrX9O8r1pZa4IaBP5dgF8HSKlZv7u7n1Cb0XWBwXuMBwgFsUOxjiDg+2axXy9g/Fcy6Suo6RkrHuSbKi9yJ4tCfePRW4irpGb9AEeDWysA2JYSMcdJQJhwtAkoX4E24G5g0lcnhfTWvJmvO2hWSYkM6lQ36bXfSD5SlKThw+yVXp3MXUz/liZxGAaADQ6jU0c7kcDp3ib7tyIdWqOMtpQOiYd9NHp8SfDZRQCkRpKp6sbVgmO/B4MvlnOPFqNNbV6KyuYaO6gLsTLyZi0Xb/Qjaddy8aX+8w31Z8Lac38nmqkeTe37EN5evljLu5Zct9zQP0/nMZtMJxqj2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P5Ci8GWyK3SOB6xpXF/O/X6MBqh9rKxAjlXfoNb8Yp8=;
 b=lJFVgcKdtrqArdenYuMSCxLqyoKrqxLlJShypo5F4t44DaL8w38NxNBkH34qpJ7/l30nCUImIMnc+BrdGgbjYNAXe366CamkkgYbfUyXUMcJO2vxOawpmKYn1Ljb0vc1ihETD9hSDO2D0KTWuKkU9W75HT+lsMgsVJK3pwdl1zQ=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=xji@analogixsemi.com; 
Received: from SN6PR04MB4543.namprd04.prod.outlook.com (2603:10b6:805:a5::18)
 by SN6PR04MB5231.namprd04.prod.outlook.com (2603:10b6:805:fe::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2750.22; Tue, 25 Feb
 2020 06:11:49 +0000
Received: from SN6PR04MB4543.namprd04.prod.outlook.com
 ([fe80::9598:7ff:b397:ba56]) by SN6PR04MB4543.namprd04.prod.outlook.com
 ([fe80::9598:7ff:b397:ba56%7]) with mapi id 15.20.2750.021; Tue, 25 Feb 2020
 06:11:49 +0000
Date: Tue, 25 Feb 2020 14:11:39 +0800
From: Xin Ji <xji@analogixsemi.com>
To: devel@driverdev.osuosl.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH v7 0/2] Add initial support for slimport anx7625
Message-ID: <cover.1582529411.git.xji@analogixsemi.com>
Content-Disposition: inline
User-Agent: Mutt/1.5.24 (2015-08-30)
X-ClientProxiedBy: HK0PR03CA0117.apcprd03.prod.outlook.com
 (2603:1096:203:b0::33) To SN6PR04MB4543.namprd04.prod.outlook.com
 (2603:10b6:805:a5::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from xin-VirtualBox (114.247.245.254) by
 HK0PR03CA0117.apcprd03.prod.outlook.com (2603:1096:203:b0::33) with Microsoft
 SMTP Server (version=TLS1_0, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA) id
 15.20.2750.18 via Frontend Transport; Tue, 25 Feb 2020 06:11:48 +0000
X-Originating-IP: [114.247.245.254]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e946bed7-6089-420d-72a2-08d7b9b999a8
X-MS-TrafficTypeDiagnostic: SN6PR04MB5231:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR04MB5231F43C4E4EE82649E0AE6CC7ED0@SN6PR04MB5231.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-Forefront-PRVS: 0324C2C0E2
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10019020)(366004)(189003)(199004)(86362001)(6496006)(52116002)(2906002)(498600001)(110136005)(5660300002)(54906003)(4744005)(81166006)(2616005)(956004)(66476007)(81156014)(4326008)(66556008)(36756003)(8936002)(107886003)(6486002)(6666004)(16526019)(7416002)(8676002)(66946007)(186003)(26005);
 DIR:OUT; SFP:1102; SCL:1; SRVR:SN6PR04MB5231;
 H:SN6PR04MB4543.namprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
Received-SPF: None (protection.outlook.com: analogixsemi.com does not
 designate permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dsAj6hCelPNna0Kj+l8n6zzzIqY51lqP7wkHTuP34ZINmxv7vDTrofe92JhUvzDEbsIlLrTt7dblTeeEWY4sHdUtdTZaxqAgMEgcNCiC7wERiKik+tcWFkjun+deqA3P6d+DqnJ1heKAU3xSMLfOrZbq/gfH6a1eUP7U+6aEobvZRCtAJ+6haFgk1PSD+zwLbTHjAdNmS1wxb66kYfYORKitLujDzrHue93q3A5QsOzCFp+v4d/Tw+M/7qZtJLN61fNZY7AawdQbLc4cGv90GvpMmyt8XsOJ86kVeg/rznhwC2pg0wQ1CJmp3bXEJb8wtByTYeMOGbGr8Z+T1bclafIJ6Mvo8PSt12XOVYiIsOim3BlogTmoIH++kzzkAaSTYi7ETUn9ydSIoLBNEUXApFmqU1YRiC3w3sGlHMg5RC8XDbAwPQua1NBLGFBrW0K4
X-MS-Exchange-AntiSpam-MessageData: K2eF92iMU9tNhNVPeHjV/vO7gZeRbMDymSNqGzdfkPoRHDtKW5VO3Gx2amvf0tqHv/ZcWQYbaN5xaDTHbNzuEbi5+YcoIjGMRTXwXw4RHkYIQ5KnJLO0a6sNSphLX/b7srYkuyBnJpYEMWFz15mWFQ==
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e946bed7-6089-420d-72a2-08d7b9b999a8
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2020 06:11:49.6235 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uTbgyHNoogKZTgBB/4VwmDnCOOz37sjlgNSsRhUvBRlfHNTNDn+I47p8aPBVLGfqfjmS6VnwywE2a4sbwmIWXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR04MB5231
X-Mailman-Approved-At: Tue, 25 Feb 2020 08:50:43 +0000
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

The following series add initial support for the Slimport ANX7625 transmitter, a
ultra-low power Full-HD 4K MIPI to DP transmitter designed for portable device.

This is the initial version, any mistakes, please let me know, I will fix it in
the next series.

Thanks,
Xin


Xin Ji (2):
  dt-bindings: drm/bridge: anx7625: MIPI to DP transmitter binding
  drm/bridge: anx7625: Add anx7625 MIPI DSI/DPI to DP bridge driver

 .../bindings/display/bridge/anx7625.yaml           |   91 +
 drivers/gpu/drm/bridge/Makefile                    |    2 +-
 drivers/gpu/drm/bridge/analogix/Kconfig            |    6 +
 drivers/gpu/drm/bridge/analogix/Makefile           |    1 +
 drivers/gpu/drm/bridge/analogix/anx7625.c          | 2172 ++++++++++++++++++++
 drivers/gpu/drm/bridge/analogix/anx7625.h          |  410 ++++
 6 files changed, 2681 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/anx7625.yaml
 create mode 100644 drivers/gpu/drm/bridge/analogix/anx7625.c
 create mode 100644 drivers/gpu/drm/bridge/analogix/anx7625.h

-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
