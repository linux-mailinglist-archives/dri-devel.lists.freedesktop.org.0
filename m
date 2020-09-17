Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9489C26DD7D
	for <lists+dri-devel@lfdr.de>; Thu, 17 Sep 2020 16:07:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11E726EC12;
	Thu, 17 Sep 2020 14:07:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770109.outbound.protection.outlook.com [40.107.77.109])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB1756E994
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Sep 2020 08:16:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JPoEU+ODtEHMB9rK6rOVx20io1UsK4/gRGJtVj+PSANo+lMUiJMzsaCa1QzHe59bwx9fJtrDbCKVuK3mh+pZBDI0IBiJjv/N56BhXXLxYZ8m9LZkUFodY35kIuLi/Bgsgmc8VezNCxzD1vASIoTxzPk/bJIjkDwCoWRlpkrd0VxSusuhCuV8UWQVUZvNil0wKVITQTMVpZAGpaSt8l+tT6uYjpCuAz4tsmeaHaGqFT+RNR9REMbM9LPq9K0wq73f6LjiAOfpegvt/zPs7q5/2+JFaVWbwTNFvdlDO02iWJYoFmFI1o/7pVmFv2NXBHsjnRdHE9AnFasrXyB1dcrnjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kt+ABZFXET91HSDoDUgMjnqrBvUD32PtKh2vvAmOQrs=;
 b=OepJ7ElXXq8frgTZSH5zlQ0iik2FA5Ld+K0236XdmY2+ph/2Y8RKSMEGgZtmuUPMH5NSZrNyi1bnoPEzIs5/+Jv2XLoPCIPpFBRn5HX/UpYHV2F+2P8+7xBYzBHqvOrGNAvqTtf429zYH4FM+O42kbumjZ5FAVxgcVp2/lg88rxy7zYTilOBXJzJziZQKH9Zw2xD2scwCljpFNOO9LzB/I4RERgHlIcWqV23q45dL6KgsVFCIYZYhgDFuYCVLcYytQSYiVuS08bNU5kNSboDxiFtUhoClYHYpAGDv1nwmARDcxK7/7kNsLWiFdRJ0G1B6Lk6sB+gTLmtoSmHs3uiZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kt+ABZFXET91HSDoDUgMjnqrBvUD32PtKh2vvAmOQrs=;
 b=SQtU6f7Rc20WX8zFIxLiPMkRYY9hz746OLjqzWr5IzM9ReGjDHk+Zj6VF8jcJTRJLn1QCZu/pjLFO/jepD94ByNco57Dfqo2owo50ynswXcuAQ8+QlGUK6xymmXP90E/1pBS3fy3tFhATK9FYE3a8K1HuEq1sUKzPNo1G0jMQyA=
Authentication-Results: analogixsemi.com; dkim=none (message not signed)
 header.d=none;analogixsemi.com; dmarc=none action=none
 header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by BYAPR04MB3815.namprd04.prod.outlook.com (2603:10b6:a02:b4::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.11; Thu, 17 Sep
 2020 08:16:52 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::1dc0:7d4b:9820:e68]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::3c04:982f:7d75:779e%7]) with mapi id 15.20.3370.019; Thu, 17 Sep 2020
 08:16:52 +0000
Date: Thu, 17 Sep 2020 16:16:39 +0800
From: Xin Ji <xji@analogixsemi.com>
To: devel@driverdev.osuosl.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <a.hajda@samsung.com>, Nicolas Boichat <drinkcat@google.com>,
 Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v16 0/2] Add initial support for slimport anx7625
Message-ID: <cover.1600324894.git.xji@analogixsemi.com>
Content-Disposition: inline
User-Agent: Mutt/1.5.24 (2015-08-30)
X-ClientProxiedBy: HKAPR03CA0009.apcprd03.prod.outlook.com
 (2603:1096:203:c8::14) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pc-user (114.247.245.146) by
 HKAPR03CA0009.apcprd03.prod.outlook.com (2603:1096:203:c8::14) with Microsoft
 SMTP Server (version=TLS1_0, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA) id
 15.20.3412.6 via Frontend Transport; Thu, 17 Sep 2020 08:16:51 +0000
X-Originating-IP: [114.247.245.146]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8a372adb-dc6a-4516-fb3e-08d85ae207e2
X-MS-TrafficTypeDiagnostic: BYAPR04MB3815:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR04MB3815CAE6DA79BAF9771209F2C73E0@BYAPR04MB3815.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: r5On4gL7ZyIYl7zQ9foxeSkqcgDUpxgGhjwzPxN5xxZZS4zmYOuvcHoLvitwC+4hHRCnnkUX6Z2j8lqUwTjVABdhK5pnHXKDVtMh79Pd7DQ2RM0uHfe3mRynQCO9o5+Lu/RDVXy2u+/Z0N92keEaD0Ok+wtq5rwI9lPHYUH8RKwggz6ul3MxsZLRC+S5Pn1Ff6xO8QwK5Ohs1fwrLHBNu5kKWzJjMDYfktFRSfxVARVMiU/SNQjkfs44rl1SCCANA0UdJmU30GXJ5JnBnxEyQyJkg/GKG7vSNtMpj9EGVUeXxDPRgfJvz8hJypdpyEyLhNezp+Z5pBI1FMxZDO+J2voireGD7wMO+AbqUa1TLtS2PFsfV7cPYA+m8977SCR7
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(366004)(376002)(39850400004)(396003)(136003)(2616005)(86362001)(110136005)(956004)(36756003)(5660300002)(54906003)(6496006)(6666004)(107886003)(4326008)(8676002)(52116002)(66476007)(66556008)(66946007)(6486002)(478600001)(7416002)(8936002)(16526019)(26005)(83380400001)(2906002)(186003)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: 9s2U67NYd2ob5dwi4o2CAhPjBrQ11qlWmErKMLLG4UqdhRhQmKNzOwfri1sG8H2X7anHoMNVB2uA3nAZA5AiRODtXzHoLm+j1ptjzpizCzPRdfDAET25Dp3N9boA2Zl7pFD/Jpfa9Xwu4GGcQAFTOEAdisovgAFbX0WfIO5M8hJlyGtuUqGaJJybSl2Z28HVHaRmu+jC8xAQ5nrSZY+9u1O1pHTnO7MajGT0ChmeQFZdQwuw8AjgFT4ZptDhHupqU4cZexhX43yi6d/eXIijQegcrgKRhR+y9xJ9NY2NMOhnHnPdC4Cu4OqVH6y/XlFBiQ02lKis6J7kheHJAKMMFJ6MTLuFYjZqBiQPNMzDpAUOBkn5ScopLuMaqP2qOTnhv/nnvXE/g5U3dRiN/dIotmLmIhts+x0ELJkkOPK00Lb4l0A1hYohPxwexfyRFJwbBS9qhqR2A0LpzxNfVyb7MrKDg6d4N9OG3HxDeHHcCWLrxsx1sa96i783uiINLtkH6keWq/sn+7VKivMyBT01EPiFXvBu6ihlKggGFyJ3Pl0yK4hDjskwrFHXuzJ8+3fMTbkLW5OIZfCh10HbIB4MsnGLzELOpCvrTpEJeT5UXcdc1l/NEiUWMf+/7KLI7OmApJbujsmkO8lOPxf8gwtx5g==
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a372adb-dc6a-4516-fb3e-08d85ae207e2
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2020 08:16:51.7964 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tKHnIEDU2SZohWH8xQReCjMPBLkEMnX/pOocZthdMiaAR6XI4hjmW9GkywN9LwPmtahEb7qxpWu5ube0bYUSng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB3815
X-Mailman-Approved-At: Thu, 17 Sep 2020 14:07:28 +0000
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


This is the v16 version, any mistakes, please let me know, I will fix it in
the next series.

Change history:
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
 drivers/gpu/drm/bridge/analogix/anx7625.c          | 1849 ++++++++++++++++++++
 drivers/gpu/drm/bridge/analogix/anx7625.h          |  390 +++++
 5 files changed, 2344 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
 create mode 100644 drivers/gpu/drm/bridge/analogix/anx7625.c
 create mode 100644 drivers/gpu/drm/bridge/analogix/anx7625.h

-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
