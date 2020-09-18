Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF626270BF5
	for <lists+dri-devel@lfdr.de>; Sat, 19 Sep 2020 10:46:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 319456E1A5;
	Sat, 19 Sep 2020 08:46:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2109.outbound.protection.outlook.com [40.107.223.109])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B7C06E139
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Sep 2020 10:20:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UHCCPzKjoJZ8F61DOqhV4v2NCoGM8VSqY7OcRyUNRXC8rzgzNwGwwyEzYKmc2yhOROLl7qglN5tuytGk6WTsY5Qyh4hrgGyQRk60U2fm0CVXSD9dQYUw3jDlXg6xan5Q/j7mHLaUFa6m3qgwPA3ZBRGz/VKPW735rbb33mkeQxyEpEtA8h9NT873EcR3U22G3eedjoy9E0of8jzMVnrThsdZhihVA4yAv5B5Ze0mgAckkPdVxjjVDZNBh5Y91BXC2jAAd2dSt6tHZl/1amxPk6ghX9B+bPcJt8bjCFXgCteaXzHCph8WMEtxD0jr47aFuSTHLeBo5k3d3uOh6NhzSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nZhlc7jzBwVNIYmd2xAMmyD9JrveXlLu+ZNIynDF2kU=;
 b=DnLfVDl/5OzK6CeKeKysFhPVXNOosx+QA1YKQ9EQ+0Omf6uFL4K7K8YxDuySaDKttQeiqkchXw5LzVpNVSGrmCABZMufW/y1mBqmZWZekdU9v8maGzTHrlincqyrmnhIvnEgAfzNLginhTAOpUoKTU8jZ2Z48sTB2y4/TpGQKh78YQfHRo7IChpptEA8aZMahxKGaONPENozq85RY9PRAlp7TYR5yGBiPVbPQU0ScBJYwEMiCn8ppfPCV9BBoU4HT4EpgAFAgLXw5ECIlQNsbKAVPIjOYqPyu2vZvqpn6Q4DyNh5EP/avQFr7Pl4frELfcJGUk+uiJZtr6LQmZytQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nZhlc7jzBwVNIYmd2xAMmyD9JrveXlLu+ZNIynDF2kU=;
 b=fKYe5GajoE3uR4xZp1YUAhJ70owRpcon8q4YaarAxgT3nl0tavKuYsia532m9p4JeGAGiRZtdr6z3hSkqsk6arOib7zkVjkh+tndBg09j6I815vbJcjTKnCqpGd9iM7Ol+CeSTEKYLm+H0SdtbaMrhpHrE/qYf+cPMkhc8zXHAw=
Authentication-Results: analogixsemi.com; dkim=none (message not signed)
 header.d=none;analogixsemi.com; dmarc=none action=none
 header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by BYAPR04MB4582.namprd04.prod.outlook.com (2603:10b6:a03:13::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.18; Fri, 18 Sep
 2020 10:20:37 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::1dc0:7d4b:9820:e68]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::3c04:982f:7d75:779e%7]) with mapi id 15.20.3370.019; Fri, 18 Sep 2020
 10:20:37 +0000
Date: Fri, 18 Sep 2020 18:18:19 +0800
From: Xin Ji <xji@analogixsemi.com>
To: devel@driverdev.osuosl.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <a.hajda@samsung.com>, Nicolas Boichat <drinkcat@google.com>,
 Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v17 0/2] Add initial support for slimport anx7625
Message-ID: <cover.1600423931.git.xji@analogixsemi.com>
Content-Disposition: inline
User-Agent: Mutt/1.5.24 (2015-08-30)
X-ClientProxiedBy: HK0PR01CA0070.apcprd01.prod.exchangelabs.com
 (2603:1096:203:a6::34) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pc-user (114.247.245.146) by
 HK0PR01CA0070.apcprd01.prod.exchangelabs.com (2603:1096:203:a6::34) with
 Microsoft SMTP Server (version=TLS1_0,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA) id 15.20.3391.14 via Frontend
 Transport; Fri, 18 Sep 2020 10:20:36 +0000
X-Originating-IP: [114.247.245.146]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e5eca7a3-e998-468d-0e02-08d85bbc7c30
X-MS-TrafficTypeDiagnostic: BYAPR04MB4582:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR04MB458257C41EAFE24D5D642F78C73F0@BYAPR04MB4582.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fnmNgGUueYPIjJuEQD8ggpM/5Uuq1d67Dl+oJJWeogfTgUug/N/w4gdtyFqQMoXnJzlaopN3R5Yrahnot3VG44b3ksoaADHSsf882QD8NIWMcnUtBENGHu7uHnSo19UdGfy27PDICZ5qB3hRIUf0z3YVyFzcQWYjgeFjlctGl8r9ohBzMAWpBh/YKKbnP024cZ3L/ddhL1Bz0KyvAh5jB6Zaeo8FOsVHEAGGfAxVLN2btGuY5dUriRx9613QfSLGPy1HM2s+wfMrx15ru1ksL1QQo0hWZkEu8lWCY1pqspq3khoIRZN7pn6qiKX/i632
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(39840400004)(346002)(396003)(376002)(136003)(2906002)(5660300002)(52116002)(956004)(2616005)(7416002)(16526019)(478600001)(6496006)(4326008)(186003)(26005)(54906003)(6486002)(110136005)(83380400001)(8676002)(107886003)(6666004)(8936002)(316002)(66556008)(36756003)(66946007)(66476007)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: VNFGPccqQJzLbbZ8B3dwL+00wiTWgAff3O1EOCkDKI8ClHIHU5cA96SJFHUKZ4o8rWw+Td3JHIu1V9s4s3V888Z6byv5Y7X8FlKbYufPqAL7ahWunndmSsTrZg15aLaQt/mD09vK/WMGwD0vebHR6cxyfG0Vx6z8GCm/2eOu9AZeiV3+WfQxHUmSYVsYaIX/AZwRgn+1K3dVuxZ+SdUlMwuJnNit9wFLt/HMXPpMByA7vyHUyvRAMi8Ti5/+gNNydMQR6gcURMUzDMWVHS30l3GY7L3jEU7Glp06tsbisyEl7MtXipSSMN/jZiptDC3prZ2kWDvaMQUmKwrnW4nS5PKpyhwUkeCVQ9tChbXYnGdr2RPQj4yN7wEGhXHUPdrhX/DelNYUIDdGpmYIpkVjerhDfPYYnrgGakus31Qy1ffgIFFuAhVjvNtOL/9/u6CT1qhBaKAOsQIqW9xNXKJuUbapHZ6hg4gAkF/7YIc0HaIMHgNjzclFNUOYgwHa6K7r8di9/qw325BPcp8GYUUgzxWcAIoQxhhYKWq7y39FoTIfTgqFyXm8wbJCIxqfVOLSRq+ZVCuXacLPo+6kQa8TyENFFujviPXRN6L79OC7/FqrlwO2759RRs+n5GEdN2zUeADWgkz/A7r7/Z1i/zCvpw==
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5eca7a3-e998-468d-0e02-08d85bbc7c30
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2020 10:20:37.0987 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iLc90AOdPW3aGPgnjub1Ej91BlmcXX5Vk5IBi5A+tzraB81CAH/5cH7NBoa+fvu6CIVA2Z/boKU3ijDZTtDcgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB4582
X-Mailman-Approved-At: Sat, 19 Sep 2020 08:46:17 +0000
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
 Hsin-Yi Wang <hsinyi@chromium.org>, Sam Ravnborg <sam@ravnborg.org>,
 Dan Carpenter <dan.carpenter@oracle.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi all,

The following series add support for the Slimport ANX7625 transmitter, a
ultra-low power Full-HD 4K MIPI to DP transmitter designed for portable device.


This is the v17 version, any mistakes, please let me know, I will fix it in
the next series.

Change history:
v17: Fix comments from Dan
 - Fix possible memory leak of 'edid'

v16: Fix compile error
 - Fix compiling error of incompitible interface of ".mode_valid()"

v15: Fix comments from Sam and Hsin-Yi Wang
 - Remove connector
 - Allocate memory for edid at ".get_edid()"

v14: Fix comments from Sam and Nicolas
 - Check flags at drm_bridge_attach
 - Use panel_bridge instead of drm_panel
 - Fix not correct return value

v13: Fix comments from Launrent Pinchart and Rob Herring
 - Picked up Rob's Reviewed-By
 - Add .detect and .get_edid interface in bridge funcs.

v12: Fix comments from Hsin-Yi Wang
 - Rebase the code on kernel 5.7, fix DRM interface not match issue.

v11: Fix comments from Rob Herring
 - Update commit message.
 - Remove unused label.

v10: Fix comments from Rob Herring, Daniel.
 - Fix dt_binding_check warning.
 - Update description.

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
  dt-bindings: drm/bridge: anx7625: MIPI to DP transmitter DT schema
  drm/bridge: anx7625: Add anx7625 MIPI DSI/DPI to DP

 .../bindings/display/bridge/analogix,anx7625.yaml  |   95 +
 drivers/gpu/drm/bridge/analogix/Kconfig            |    9 +
 drivers/gpu/drm/bridge/analogix/Makefile           |    1 +
 drivers/gpu/drm/bridge/analogix/anx7625.c          | 1850 ++++++++++++++++++++
 drivers/gpu/drm/bridge/analogix/anx7625.h          |  390 +++++
 5 files changed, 2345 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
 create mode 100644 drivers/gpu/drm/bridge/analogix/anx7625.c
 create mode 100644 drivers/gpu/drm/bridge/analogix/anx7625.h

-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
