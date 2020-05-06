Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C59A1C832E
	for <lists+dri-devel@lfdr.de>; Thu,  7 May 2020 09:06:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B8AA6E94B;
	Thu,  7 May 2020 07:05:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2096.outbound.protection.outlook.com [40.107.243.96])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D11E46E288
 for <dri-devel@lists.freedesktop.org>; Wed,  6 May 2020 07:03:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bd3MXJ21fiiJBi6q/qEgZA0gBPDObtZCu6QcKcJXzZbFI6CRO/2XmnfdYMVenUvr+Jk76qtgQDSYN0ufzrIKXfK53sJtKadGaR0wCLAviDC5bxQkZknvBQ726Kj6ox5jS3/vC/5PI0zNT0mm57MxwIzCbGstj3UhRJUFbX5HlTE4RpC63yeSUJr25VVerFyOc2o6NPn+f8QagTHXQNdT9ANT5c9kBNdFVvYRGWSkSORjRxEzqVDm7vSX8gy8iR85s79s2653pvn3tlz6WqIbz/v4x7gYETsOLg2oMSNZw57aL7mO8SnaZVes6JmC9xvYs2vq+k02cLX3w15xH687aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=arPWgkbqCxYiF846dvxZKrNCNOffi3X8NaWn5xGkDM0=;
 b=OPdwZZdzlsvIsKJ3YvW3w78GDHBucd+2r1FPYMWBMWDtVcIkfPHkppuij+hXC72XX9kpHgeFJXunOWzr2vURRrssrK++xv2UzvnsSDID+XFVl/OBKntxOEsfx2MkPE+6NBvdr7hi9t+JeAdhsAZzEZ2LQ3fHIIDInfh5nLlxcVx1E/GJPJsTvi63NK9xAwExhwPCjKJCIwZSkFRoJLv35+aObByDN2xGgNjeXFUveNNN4UXzJglkTzpNeamwA0yecM3AmiEYzNlPizL/ZA2fEnshwWAAz5wq5N8zRb+9A3SwXqXmTx+zTudf7o4eDkTPUoM3rxSMc62PaQUxDPZE4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=arPWgkbqCxYiF846dvxZKrNCNOffi3X8NaWn5xGkDM0=;
 b=AJ4likgLNpQH4aswzibrMY/cetKXaofqPuC71Rvfsv12mMP6VDk0TiQyOEwYO1FbC9krwRjvqZ8tP6VYgFzEyNSFtoybrgA+27IzXuvxeMThBHSIORiXNcVEWUYvI/eMgRiNN/8jIGwGJ4IiRAkZtZ6Kb+d2CgDnwy+INNbGpy4=
Authentication-Results: analogixsemi.com; dkim=none (message not signed)
 header.d=none;analogixsemi.com; dmarc=none action=none
 header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by BY5PR04MB6755.namprd04.prod.outlook.com (2603:10b6:a03:22d::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.28; Wed, 6 May
 2020 07:03:13 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::4517:bcc8:a3bd:407f]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::4517:bcc8:a3bd:407f%6]) with mapi id 15.20.2979.028; Wed, 6 May 2020
 07:03:13 +0000
Date: Wed, 6 May 2020 15:03:08 +0800
From: Xin Ji <xji@analogixsemi.com>
To: devel@driverdev.osuosl.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <a.hajda@samsung.com>, Nicolas Boichat <drinkcat@google.com>,
 Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v10 0/2] Add initial support for slimport anx7625
Message-ID: <cover.1588747998.git.xji@analogixsemi.com>
Content-Disposition: inline
User-Agent: Mutt/1.5.24 (2015-08-30)
X-ClientProxiedBy: HK2PR04CA0071.apcprd04.prod.outlook.com
 (2603:1096:202:15::15) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from xin-VirtualBox (114.247.245.254) by
 HK2PR04CA0071.apcprd04.prod.outlook.com (2603:1096:202:15::15) with Microsoft
 SMTP Server (version=TLS1_0, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA) id
 15.20.2979.27 via Frontend Transport; Wed, 6 May 2020 07:03:12 +0000
X-Originating-IP: [114.247.245.254]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 22c94a82-492b-48d9-47ce-08d7f18b8ab6
X-MS-TrafficTypeDiagnostic: BY5PR04MB6755:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR04MB6755AB72B0C2EED881FDF4B9C7A40@BY5PR04MB6755.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-Forefront-PRVS: 03950F25EC
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yYYdGn5EEcsKQ2yHXoLhy5RqW5wot4Hf+gRzhl7rRIOQ5uO3c/F0oCa6yKPzrBGOSylYC8AKioQjFpd70F6iquKqEyoS+0FcKWdKCAyGCfE8/ao1VZsE+7CJ4qVcy7M7sVT+JKJaCP6Wmvjpvqky+xCyfCe8Nd+z/STEtFn+OPIChQD0i6s2yDZKZI7MXqjsU+TJLDKMCiKBVZd9AM1aIDK7YoNtXXnIju5rw1lxNXVB/0ynX3HZlLv2hgVK2yGvAwntYvMTwLIAwIYOdlk4EuxK/KflS0zvwJgalvKBJqcVfurkeewjgjQAuN8iN+WdHvc29hNMll6uzmztcf0elPBIm03jhIYIxZ4j5JgsKdutBoQjr/UO2NtSp7MIZi7053b+5ydFAOx+u3nsvvBloHBSMqe3LZgBX5cQvxQM746X69vRcpOmtFcGLnoHLMuIaH20h+4bLB3i+TTf2WtcmD+HvhKty/hdyzIdlvtKFgGW/X+0rbLTPqcGOSGgZh1+tjQKQF2YkBgQf5pJTxo7dA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(396003)(346002)(39830400003)(136003)(376002)(366004)(33430700001)(7416002)(186003)(5660300002)(36756003)(478600001)(16526019)(8676002)(33440700001)(66946007)(66476007)(316002)(66556008)(4326008)(54906003)(110136005)(52116002)(956004)(2616005)(86362001)(6666004)(8936002)(6486002)(6496006)(107886003)(26005)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: a35T7SjFWfRtW9UDn5EBmhVOyoLLi0f0PfW5FZfFjWxGkVevRFe0LEzauZC1pdKw01Lnx3ZC8u+ie/4IXDlsTcrdJtEY3j9eqptxuZPJ58sLii8uLp+MY5+iFOvqW9okUIspO5s6KjQSGviVXs19AjH5IP2CWeOBF9gLVU0P8ZpNUjVawAd/jrAr0M1RVrlfzwhGVhN2h+b73PF2E4btlROTuOcAR9BlMenM1LaGCZxUL1HlCp/sJ8bYTG92b2SVjhJ+UMKBqLT0/Ol0oEd/7Dr2jCzZLtLEL3JZmaLLPbOGPkxljGsGGsqy8R47mv/lpMs+vT8a1EKHkM9fVfTSBBJ/9ed3OrY47zSwB7JfpVTG0qFQj1FVTokkgdRpxQgICaUawGQeUqqgb/Kd0ikdaG+xEFrp7HNMEkYZTzW7NqWK+64Ke1fECUtvClC0MXGhUYOSXbsQTbYk2xKeFM68HoS678M/HddxOFfEjACwGX1Jyxo1yU8F4zB6Dnmg6A+Yftfkb/cuUEiw0RAAV32fnbatRxj5bqxI4zFUtxJ0KgnjXyRLMpFaDUNpnHiey8C5RBiHqi7bbXAa6FAcJE7QF4aFthauD+6EJ8k81Whqa4Ceaz4+ccW4T5FgZUnLkwRwjYzxuickoUYGui0v2+7NmU4xNFWnOMS8qO2oKog3D5ypZuiXhUTblUqlkrlbwDf+1Wmwd4cmV9r4FFCMnn3haJER8tMlqz6xvKqUSeesnNuSpciHqRKMXZkZ3qm1tFHiYcafrl3/eYFYGjM+ZXNQowfhzH1QvhbZ3AD7MLt6/dzOL+NvgjZGsdYAlIwXeQMf
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22c94a82-492b-48d9-47ce-08d7f18b8ab6
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2020 07:03:13.0933 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eMU0laaag6aqTKuZ3fTXuKNknVqUO4NuTA0qrGf/0PaC+Mmb2SB6PqNRJ3nKjbz9HqoMgMMnPIwwfwhCgBiXJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR04MB6755
X-Mailman-Approved-At: Thu, 07 May 2020 07:05:09 +0000
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


This is the v10 version, any mistakes, please let me know, I will fix it in
the next series.

Change history:
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
  dt-bindings: drm/bridge: anx7625: MIPI to DP transmitter binding
  drm/bridge: anx7625: Add anx7625 MIPI DSI/DPI to DP bridge driver

 .../bindings/display/bridge/analogix,anx7625.yaml  |   98 +
 drivers/gpu/drm/bridge/Makefile                    |    2 +-
 drivers/gpu/drm/bridge/analogix/Kconfig            |    8 +
 drivers/gpu/drm/bridge/analogix/Makefile           |    1 +
 drivers/gpu/drm/bridge/analogix/anx7625.c          | 1961 ++++++++++++++++++++
 drivers/gpu/drm/bridge/analogix/anx7625.h          |  397 ++++
 6 files changed, 2466 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
 create mode 100644 drivers/gpu/drm/bridge/analogix/anx7625.c
 create mode 100644 drivers/gpu/drm/bridge/analogix/anx7625.h

-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
