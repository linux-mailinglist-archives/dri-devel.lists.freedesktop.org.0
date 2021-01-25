Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A69CD30380D
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jan 2021 09:38:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6D2C6E430;
	Tue, 26 Jan 2021 08:37:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2116.outbound.protection.outlook.com [40.107.243.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C21289CDB
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jan 2021 11:11:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ha4uiTIAMIJ5SYS4srjIZDeqxBSt45Q7cbJPFCw+ngt5837UGsZnHpbX4VM133h38Y57eWhAZq2Ir8fBGk7PRTwMqV7g/fLmao+/5GB1aA48GhJ9XgLmPspZV8XILpsccrsIOg1xfgfVdgbIGp7L1js+KkHtrKmeMXjtwK8BsOvpbc0ih4cZMANv003xqYNyy+BCEfQ2koLx4JA0D9DEQs+mMP1kyxiAycArgL2TTX0xXQiX38ybdtJJsO0J4VEiVZQqRfzyjjH0BdMdf7s3eY977Dndv8zlPZgJUdJjUhNMu7lu5wtAsE4p2sqhYDsUPeGVz6QWJSu+dl9p+wrwmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=omUbABZOgw5Fp0Y1jelt4e+NPCWjpIOqJucYqVthNbI=;
 b=YGAbTPwJnodJRgMJGipxW21GgQpi7Zx5+M16+LMTmOyM6VVT0erV0W+vt45Q11bHg+cwQuU6LFQ5ImKFy/wRQi+u7XA5SGXjFX9utbIuOqKS6uhbYhiRhzM6F8/K3gLF/qxTqCtMGGHlt1xD0eLpwTIyZlFDe26dLyGQIcQ76ZEd49ydbnpLlGF1AeoEOJj0BmR0WUFw2trGfamYXt4cToaqaoAUI6Lhl8fRRKq1ntGNFs2nju4ybcGVVYno2p6bfOsuTMwdmy/yqlU7bll9XsBioFHv3IsaLyyPqIjqFljQikwJPrdfWVu6ghEkHldnIJPoGN0FSk1/BNEZ3LDqQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=omUbABZOgw5Fp0Y1jelt4e+NPCWjpIOqJucYqVthNbI=;
 b=nCIyQGrMyFBneI4eq1tzkx2a/yJzYc2UF8+yOyknNjFV6xVftldOaetkv5Fawh/r8x2aCFcQwcLRDhNnF+382tfPuaHtxg4xTp1tM+fAGQcHAdy1uGtMgkV7LuMgqL71BF4p76pTcoGtm9TvOGIxRX/gpPuSWqFEgkNoU5QkfAs=
Authentication-Results: driverdev.osuosl.org; dkim=none (message not signed)
 header.d=none;driverdev.osuosl.org; dmarc=none action=none
 header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by BYAPR04MB6262.namprd04.prod.outlook.com (2603:10b6:a03:e3::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.13; Mon, 25 Jan
 2021 11:11:09 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::5813:96a7:b2d6:132]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::5813:96a7:b2d6:132%6]) with mapi id 15.20.3763.015; Mon, 25 Jan 2021
 11:11:09 +0000
Date: Mon, 25 Jan 2021 19:10:39 +0800
From: Xin Ji <xji@analogixsemi.com>
To: Nicolas Boichat <drinkcat@google.com>, Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Subject: [PATCH v3 0/3] Add MIPI rx DPI support
Message-ID: <cover.1611572142.git.xji@analogixsemi.com>
Content-Disposition: inline
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Originating-IP: [61.148.116.10]
X-ClientProxiedBy: HK2PR02CA0174.apcprd02.prod.outlook.com
 (2603:1096:201:1f::34) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from zhaomy-pc (61.148.116.10) by
 HK2PR02CA0174.apcprd02.prod.outlook.com (2603:1096:201:1f::34) with Microsoft
 SMTP Server (version=TLS1_0, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA) id
 15.20.3784.12 via Frontend Transport; Mon, 25 Jan 2021 11:11:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e0f82def-f839-4747-751f-08d8c121ea7e
X-MS-TrafficTypeDiagnostic: BYAPR04MB6262:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR04MB62627C13E06F594DAC2546A7C7BD9@BYAPR04MB6262.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PiOA886UvjzA6p3oHSUVXXIBd7Uzr4YB6pQJP7ZZp/1fH75OlM9F3epS3nlF0aRqTy1wAslgAI6BJUuQktfm/o4fuIMT1jA24OwsFR55T9TVsBqoogRvJmQ/j7rhrr0dOiCKWUspowDC523KNB1Jj65VVhbz93ZxO4KZIvBNwQGuH9OCnO7Bb7VtxxuL5nsKz6SkFMx322NEatyd9/V9mkGUfSxDGI43fLC22ANqn9rrPL1C/ZZEeo3HiuD7y2KEsIXM+HdoCHpjlBn7ICaxRVBgdOB0dxxtBNbqYPGy3MVfO872fOBcFjX/7TIdmA1YUPgVPraa9zNE1bNYxYeTc4w5aCa1g8y1LSOCN+375C0xB9QILsAwkqRzpEkEwUfeqfmVNLgpkDtpd66FBLNhYo1l2h45RjdYYWzanRXzyph92YQbwvv0hwUCsi7pm5dQAsHDqZtiAupeEG9vzYAiqUkCGU/x9Z1/pyZTH4dZuqJLpKF8kBhteTFMeE7KF1uFcjzBKMz/bpffeFjXlJgbRPYKiV7I4btrYaQkoGmR0ecl4OhIM7JiyagHZUoQhgCA+TQc9J/X7BxGeFkALo56ZQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(366004)(39840400004)(136003)(376002)(346002)(26005)(186003)(6486002)(16526019)(83380400001)(2616005)(956004)(478600001)(66946007)(316002)(110136005)(54906003)(8676002)(8936002)(6496006)(66476007)(52116002)(4326008)(66556008)(86362001)(36756003)(7416002)(5660300002)(2906002)(6666004)(16060500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?y3e+LDXMO9ZyrqgtC3vdRjuKhTwqqZX5FlfZkgjobKC8jREXMRntSCklS8L6?=
 =?us-ascii?Q?ca4P884/I8FPJBIclIwcvT0Wwp9uKKcbDmW7wODkMwGQUYfhveG+HeTVFHkE?=
 =?us-ascii?Q?NXdTIKR02hYfn2M7DhEGLl/yG0wJZZoMwYREJiKB8uRbaW1w6DjnM0zKAhUW?=
 =?us-ascii?Q?TNPhlmxhySprZDSVw+X3fQoFcbjz7w8ev3InDLBLCUccrGhbeuy8BYg3UHmP?=
 =?us-ascii?Q?SfHyWTcXH5I+mZ80lLAOFHK/kkLV7sJf0t1H0d6nrTbl3beYgLqnLs3NwZwb?=
 =?us-ascii?Q?n+4qDyV8jnXIS8QjSF81b7l2MODp9IxVS/D5a2q6mlKOvktuvAvBvTkZyt9+?=
 =?us-ascii?Q?pMYLNwvrhaNEW5tOsBECMsVfEy1FrxpyvJZ0hkZl2k7QXnCHhlFfDxMtnBxm?=
 =?us-ascii?Q?GLhFX4Dau5pyho+lkdTh3rdNm56QKVZ88eyVCtsikfSmSP5iXzUF4F062hpu?=
 =?us-ascii?Q?a4wwGB2PlLJRfkaXxfkP9QCgIakTunJR4PeaDtdz2uotbjK62bmrCxXyxh7S?=
 =?us-ascii?Q?vi0A586oYp8EDbhwBofUJUCjbkgEsZsGDiuKMQV/M8sCB4wYo/hhOoYIg10f?=
 =?us-ascii?Q?GN75bNZ2PpHZdeQ6aQ8MtJOqFRjhRMK1GKbOYQdy6IDOLm5SD0T35r7SoI12?=
 =?us-ascii?Q?T1p7Rg36Nxmv6wiiGuFvO6j114Kptg8R+7k3A34+v5jqH3a2Rskx97ZxFr8g?=
 =?us-ascii?Q?S+DTdS09zHElkL5JMywmblDck2dx+MD2Jh9xdMDWCAkIP2+kzlk/rFS0G2/+?=
 =?us-ascii?Q?VaY1uEB8fw+UdDy08/XQthRT7jb/Qat0s6U+4lLfsqNUB2286UA5yRqqNkhy?=
 =?us-ascii?Q?oPo6rYRNdGsSy7dyrRChcNZH/ZBEElK2VfMTBOPiiPK6ImE/vFBpJMLkh+lJ?=
 =?us-ascii?Q?FjgjxWE0uIFGJSsqFjmQdR8tB2X/IwNFuwkemAU9Msa7OYhOl95Lq6lmQVsR?=
 =?us-ascii?Q?uQB66lSrNqgaHysoNm2gqL5mi+uQ40LyOmZ5vsepBY6bRRn6E21x/sDNYjW8?=
 =?us-ascii?Q?LsIutMfel4oZtjaKj3S3S2PDPGX148MsEfaudO4jc9aSYbQg5IZG0HHVjI/S?=
 =?us-ascii?Q?Mv2E7UP+?=
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0f82def-f839-4747-751f-08d8c121ea7e
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2021 11:11:08.9075 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /C+L6S/U4v5L3dqoEAcYATGtPaMLj3dl6c+o3MqXEFeAJ8zM9JloFuAjdC10i4KsQbWbv5lW+pcYLjHI1jEhrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB6262
X-Mailman-Approved-At: Tue, 26 Jan 2021 08:37:37 +0000
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
Cc: devel@driverdev.osuosl.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Vasily Khoruzhick <anarsoul@gmail.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, Torsten Duwe <duwe@lst.de>,
 Sheng Pan <span@analogixsemi.com>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Sam Ravnborg <sam@ravnborg.org>, Dan Carpenter <dan.carpenter@oracle.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi all, this patch series implement MIPI rx DPI feature. Please help to review.

This is the v3 version, any mistakes, please let me know,
I'll fix it in the next series.

Change history:
v3: Fix Rob Herring, Dan Carpenter, Nicolas comments
 - Split the patch, fix not correct return data
 - Fix several coding format
 - Split DP tx swing register setting to two property
 - Add HDCP support vender flag
 - remove 'analogix,swing-setting' and 'analogix,mipi-dpi-in' property

v2: Fix Rob Herring comment
 - Fix yamllint warnings/errors in analogix,anx7625.yaml
 - Fix kernel robot compile warning

v1: initial MIPI rx DPI feature support


Xin Ji (3):
  dt-bindings:drm/bridge:anx7625:add HDCP support flag and swing reg
  drm/bridge: anx7625: fix not correct return value
  drm/bridge: anx7625: add MIPI DPI input feature support

 .../bindings/display/bridge/analogix,anx7625.yaml  |  57 +++-
 drivers/gpu/drm/bridge/analogix/anx7625.c          | 330 +++++++++++++++++----
 drivers/gpu/drm/bridge/analogix/anx7625.h          |  20 +-
 3 files changed, 341 insertions(+), 66 deletions(-)

-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
