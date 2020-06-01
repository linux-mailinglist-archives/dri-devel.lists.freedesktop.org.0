Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12DA51EB669
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jun 2020 09:17:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B03576E18E;
	Tue,  2 Jun 2020 07:16:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr10059.outbound.protection.outlook.com [40.107.1.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C81D6E038
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jun 2020 06:20:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J7+EvTcEnGcdvWCx4Tn76MyK8T3QZMONgfhhk1hjjv4EhI4gibJubgmCSmZUcl4S5bHA808yZ19T6D4w6bPFwQpQgqpgNiXVmKJ3LJC/o5sUMtHs9dcrrAi6BB88Lf5YUy/8usmnc8sIQw/KtiKPN6Qb/acZ4Bby91e7f3DH7aJsap07JPLRLF71bHsusvcpOdqn/9Xcay0+SdgoruyWTo0X61tVXAbtPD2dPBexdBKtkQ1/AN0uA1gqFIBrPs4cmFRFa7OQHfT5Adjxp1dCMElQqnPc9y0DEm7vdyKXehbeQbjsPesJ8hMgCOIeDIRD7kL+FOp8u550oHiIChj1Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7l+SbfyR3cbOopK16bfV/qVu0oJcDY3U0FrcP3pOB9c=;
 b=SxytpVsJfmBawV8OYZV7s/7M+ofUzIvj/HgmeX6PG+xQhVwlXU/aSFePGZJaWWMMHEWvhsFLFabgnDNBhU7gG9H9AxXxgc+K8zsXOGeArqYX/ZO7shGQ2eIjeUXWKVXDKwqYxsoib/tTbXLNzzve0zyyuEK5wsovr+lcHeVSwSYfo1iWYNUS99ac56vXDi5/0isWTCg0Ro8LBmvnolChBojgUqKx+bXiiMnq/NR1mCM9zTd65tMnD9HyCCn02y1ZCCbehK3iMc2KEFfOdGw+FviZO1nksh6JQvseh4/s28M+ICIo6WD7QgfA4oj8TuchKXOD5oANJrW1Q3sf1j2Jbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7l+SbfyR3cbOopK16bfV/qVu0oJcDY3U0FrcP3pOB9c=;
 b=ZotBOc44d6uC4eN+jwvAnfb5xK+F2QCL1kWIGPKnuYmugF0Bfx8hvcWCU38wtr+UokNR/hXmlTaohMKOoiwOrnNdASgH2g/vwZAKd6zjfxfVcbr2+LnxRjssyKI5EOmHI8qal1WwXGWMUkaWX2voGbUP0m1eCt+ccABs2fONotA=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR04MB4543.eurprd04.prod.outlook.com (2603:10a6:803:6e::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.19; Mon, 1 Jun
 2020 06:20:37 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::250a:ccb1:b015:3b38]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::250a:ccb1:b015:3b38%5]) with mapi id 15.20.3045.024; Mon, 1 Jun 2020
 06:20:37 +0000
From: Liu Ying <victor.liu@nxp.com>
To: devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 0/2] drm/panel: simple: Add a KOE WUXGA 10.1" LVDS panel
 support
Date: Mon,  1 Jun 2020 14:09:35 +0800
Message-Id: <1590991775-24188-1-git-send-email-victor.liu@nxp.com>
X-Mailer: git-send-email 2.7.4
X-ClientProxiedBy: SG2PR01CA0138.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::18) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by
 SG2PR01CA0138.apcprd01.prod.exchangelabs.com (2603:1096:4:8f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3045.25 via Frontend
 Transport; Mon, 1 Jun 2020 06:20:34 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [119.31.174.66]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 521edab2-d3f9-468a-f661-08d805f3e5f1
X-MS-TrafficTypeDiagnostic: VI1PR04MB4543:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB45437858B71A26C2552059A6988A0@VI1PR04MB4543.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-Forefront-PRVS: 0421BF7135
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2WO5YGFO8dfA+Lb5B1mJCRk8TbnPDahiFttidEYhjtvAy/NpZWmdQ1mEUbRLGJ8T/8sIPrfamBTf3QdMLjH6uFLrnJXc7Xz2TsV7YWdDkCRZJAof35haXurqCwLiWxxsJVJwusXkfRil0ODCciw867BUKeep9p+L3XTP23b98Jio9nYRpy+RGysRlKaILBpowbpakiLLKgESDRDYkCZNlPxPMrFpQ+cfqs9ZCi9a9ghY1ql97/2czYywAKRhunByLaf5yllKFNKnU9qu9KkWxnU50plA5tzjJjBbZd25LWumtGSLqsIFkXHlRml3AXhb+CvC7c0uwA+KNBLEe+/A+8eV/miUyYIeKO238nY0zvxenUMUZN6Hwj0N3+kbgtM1dYsBdJhfO1CKoo5EpHrNJ0nzWTpsr3Hdk+iCGTTnFqRu1yTOjDom+awOBYmrRYLZ25vaL8GCKyX+q8cgwESB1g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(39860400002)(396003)(366004)(346002)(136003)(376002)(6506007)(186003)(956004)(2616005)(16526019)(2906002)(52116002)(26005)(6486002)(5660300002)(478600001)(8676002)(4326008)(966005)(316002)(8936002)(69590400007)(6512007)(86362001)(66556008)(36756003)(66946007)(66476007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: c6MAc+ZYePssjzC1kod7mRENEbCEjLFldgW0KjEZYNkL9boOZd6OfjjxXOPVBv/AFEAXU9mXxGk2dXVJApbPtgEHQkhGsjCKtqOMdbIJ5ku9j78aJZ4n5/Jh/UD0wzMRRSSWb22Tn3as4oObHVB3euv+ilTCb2xN4zDEv+uKhgWVqnQHhKPYCjIPV3s5iKwNx7xd3zAdxg2ar98g+/ettJsj5QaMY/48V1UhXP2g7+tG7qwZ8kbd6ElGjju0bRs6TIiPcwDSVVF2SY2FvRmQbqS33VAHy3Ayvu41y2XIdzs+alotM22TVRJwWU1C4h4UiKCGoioLpl+WyWKTlXmNxAgUtGBHV+k1ddOtTYAVgiKbmZs3B3mtZaW75JwMnw1TQrNRpds9Cacmb56Wb71WuQUXb1hROibAXb4aTbW1l70yY6Jhw0hFU8J01OW4iAsW+Th5pZBZAU30PF0dAEAh4eG058S6n9cRYARMBKYvCkQ=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 521edab2-d3f9-468a-f661-08d805f3e5f1
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2020 06:20:37.0833 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /zAXv6zc2B9VXbevYAMI1x3Hp2OaSWECubde9SSq0yFKAL4BvXgXs8EA3cBB5FQFI3O4IbA12LAnMt9MNmXtkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4543
X-Mailman-Approved-At: Tue, 02 Jun 2020 07:16:26 +0000
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
Cc: thierry.reding@gmail.com, sam@ravnborg.org, linux-imx@nxp.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch set adds a KOE WUXGA 10.1" LVDS panel support.
The panel type is TX26D202VM0BWA.
The panel has dual LVDS channels.

My panel is manufactured by US Micro Products(USMP).  There is a tag at
the back of the panel, which indicates the panel type is 'TX26D202VM0BWA'
and it's made by KOE in Taiwan.

The panel spec from USMP can be found at:
https://www.usmicroproducts.com/sites/default/files/datasheets/USMP-T101-192120NDU-A0.pdf

The below panel spec from KOE is basically the same to the one from USMP.
However, the panel type 'TX26D202VM0BAA' is a little bit different.
It looks that the two types of panel are compatible with each other.
http://www.koe.j-display.com/upload/product/TX26D202VM0BAA.pdf

Patch 1/2 adds compatible for the panel in the panel-simple DT binding doc.
Patch 2/2 adds the panel support in the DRM panel-simple driver.

Liu Ying (2):
  dt-bindings: panel-simple: Add koe,tx26d202vm0bwa compatible
  drm/panel: simple: Add support for KOE TX26D202VM0BWA panel

 .../bindings/display/panel/panel-simple.yaml       |  2 ++
 drivers/gpu/drm/panel/panel-simple.c               | 34 ++++++++++++++++++++++
 2 files changed, 36 insertions(+)

-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
