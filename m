Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 09CDC677583
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jan 2023 08:22:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CF1D10E1DB;
	Mon, 23 Jan 2023 07:22:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2088.outbound.protection.outlook.com [40.107.21.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E6D210E1DB
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 07:22:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N6yApAEfUL8fgcqHRttayKMIAHZnYxMpd/zol44ltxDR3tToKGBl9AW7dEhYiClxiRbAqyurE0kZ4yx26TfJvUksEBCK5noGbEheSIcE7d/zGaaMa73NBtP8mjdV8mfNbYZCA2OlLuxSucyhTGTeOw+nag+sEQEj4XVw9nJUGeYWW5qFmw4Kg1z1fLiGbdFirsw9k+pUL3QPdqgtoNQEk8Ws+HhJpbcm9WM3uIlygWgPEnhtem1869r+q6Jz/WqV8YgbQXRECrAcMq5xbV5J3CW/mBdUbbuDGe11rugR5IlMR2TkAcd7RrPRz3hY+K+Lh3WBikjT9PgHemj1vFGKFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q4YfyxNb1zolOCeqdqDO9Pkpxb956KD0y5tNtuFRZqY=;
 b=PI8UU/l9/EL4uqgyhwVXwsR1nnjrgveYY6XN4LYx3rZGNOswLnI9VedOLGpH7Tj2aqTxlqHvavL766XVPNAIX9uqZMwh4oot3u81I3rXSARlo9mWDwuKG/4SeFZ9jr0n096z7nM+xgcivlcAblOEFN09UQnE2lXjysitWnlHKpt+b5OkeNlGkcr2KW6qQGn6LA7j9T53GzkXp4GrXmbXkyCvaBvsGKqJsD6VWsX/W4sL1+FuP5TcJAgm/xYGzXGDz+ZS79pmX7cAmG3HRVnbUNxOdaQDJoPz0hk+KjRxd2S2eznhw59NHhUCF/SYu+MmAEvbP7eY643VvRNBZXEnNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q4YfyxNb1zolOCeqdqDO9Pkpxb956KD0y5tNtuFRZqY=;
 b=TsFPms06KhTBrferE54m02NfnBC6x5WwkLzh47MbBB8PiD4HGNCDTLUm0oO8fRa06ChAdeSHsEN6Z8/1EhNfUGF6+so3hPogCthshYabbLjuq6EiPWwiKY6Eu/zDB2bmeGr+GOKfqnwc7T7xuZfUY8gqkstgPscw+PtidVwK3v8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AS8PR04MB8184.eurprd04.prod.outlook.com (2603:10a6:20b:3fa::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Mon, 23 Jan
 2023 07:22:46 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::5725:92ec:f43e:f5fc]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::5725:92ec:f43e:f5fc%7]) with mapi id 15.20.6002.028; Mon, 23 Jan 2023
 07:22:46 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/2] drm: lcdif: Add i.MX93 LCDIF support
Date: Mon, 23 Jan 2023 15:23:56 +0800
Message-Id: <20230123072358.1060670-1-victor.liu@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR03CA0104.apcprd03.prod.outlook.com
 (2603:1096:4:7c::32) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AS8PR04MB8184:EE_
X-MS-Office365-Filtering-Correlation-Id: 83a4a29b-149b-4d3a-3d67-08dafd12a005
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: E2/kH1DUspRc4cKLe+qsHB3xZME0ZIABCeg8zxRo3Pr64QbnZe6F3nmDyPW71Z2DSgbWsO8McxhR7yYYW4x5ks3BWfKAa82Kol9XJSNopX1MhpkF29h5hMsQMKaH//Ym7PWPF4/zhO0drDhix0HILb7SsRLccmgeICkiobFXYvKTUqidTAQXZC12E6eDEdDGUeTauZ5CPfsPCZH4IihOSGV9zAj0ySJc2RPLFdAqOLLE7EU2RZ8gXApNCkVRkOAfbIwqU0kpObzoHnT4g6BA63KznNu8/I5TopywkyVeBpnErBgjBlGJZy07+sQyudJhheqFLBYxRz2W99k1CIY0s50zlSH8C/Bxhr0IGQJtJIOvgcdaTcnnsco2zXVm6Ao8rlk5osr5J0MOprboN6+ssGqRrzwWR6IMaFmDaWnSu1K4BXON4UIbkrhOpES7gVgm7uabmPwOD0ApQC5Pc2BPsEHEtCW3jUqHnJpzpxAg5Nk8l/fTUpZGuygxCTTK9UNvz4S/wsKganCCqWOe/iv2c0RDtjZMb3XxP2VxTmB0jgerLR1GnfX+GRw1pYuLLj5mPXEx/Igbr6FiVbJsvijZ1pg/fRX1ZV/O63Mi/tWCPC+/3y6i+p3Dp7BF6lWuf5y84o+XSU8YKl7OVSb86hGy9OpvbbPHVPDd+wq/aj1/SA6BsbIgl5bfu+Znai1UGwIeMB/ymvGzbW6BbTHg0kn4sQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(376002)(39860400002)(396003)(366004)(346002)(451199015)(36756003)(86362001)(7416002)(5660300002)(8936002)(2906002)(4744005)(4326008)(83380400001)(38100700002)(38350700002)(41300700001)(6486002)(478600001)(52116002)(8676002)(186003)(26005)(6512007)(6506007)(1076003)(316002)(66946007)(66556008)(2616005)(6666004)(66476007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kY+jGjgr1VoPYMCa3cQ41lvzke+u9qyxc7ijlrSRb91+vOuXrgSXu3zvkmt6?=
 =?us-ascii?Q?Nek3PH/IRuoL/29miGHDaPN001KWMB9dy+N6TR1/DSHywK3QqLvW4tycEiJJ?=
 =?us-ascii?Q?qTOEJRko8QccdVfMzaSF0fNboY2CHSVqEtsFBvC30OrL6Mx4sK/0jtC0kPfx?=
 =?us-ascii?Q?6wm1TQ9bFW7unt3QfdITWSYjCVwlVSVntU7mowD4Z4qyO8/r3x+dSOR7vMbx?=
 =?us-ascii?Q?3QpvDHjbhsfyZXRaayq/2wR7iiOolwj23tTIzu/l+ksjVaqIw8BSjkkKWHw5?=
 =?us-ascii?Q?3Pgm1efd2lDEhWuS0sVpaUCPxfZOlp3sw0EgE6KO5TUQJZLvav4lBTjUrY3d?=
 =?us-ascii?Q?OUEtnaRRQDWdrKypyy943/0OhlY65bN3BCCaPTiLc53c+Ygaw8ii9IVhK3nw?=
 =?us-ascii?Q?/NE2ZTacp4zjo30nL0KHsMZElU3vZu9V9iUxegZ2huW8QBD6s4HOfr50w4MW?=
 =?us-ascii?Q?ddoMUJtQlDxcmtL8gZNMP1Bc2bhp479ZcDCUr6//B0hBiumWtzUQR6Jghrqj?=
 =?us-ascii?Q?P3BQhZ30z+0sfUGhJU8xRmRC3/+5/xkTBNUr9B6y3AD13qc22IrNnl4ZIeek?=
 =?us-ascii?Q?/KN2t93XHPU61YjllBacU+4RqMotSZCwqm1izAzxWZaIAHDU2ck3b/+XYCgQ?=
 =?us-ascii?Q?vZtY8RnPIaq+szFsGNdm7253f8CDYG1OLSzpHZR4EoJtiiHBI5quAwT01utv?=
 =?us-ascii?Q?ofcjH68g8qIory4G5JMcd8vTNiFrgAxKUCDUSRncMkLQXq1ySWL6pxqA8Kyr?=
 =?us-ascii?Q?m0SRkikNFP1T7FXIudImhlLo5RREKAcvcE9YR7jNBfGyZwg17yXiUb2uavTQ?=
 =?us-ascii?Q?NU1srMfQZRvq+9KdGTpvbndXswRju1Pooo5aPnXCe5fPdT10o9d2RHTR56p3?=
 =?us-ascii?Q?e4CBPYpWBvFW7Hr5ZQsfnyaSEP2/AZXSonsxFhixtZb9KCBGDrvOMCUiMntx?=
 =?us-ascii?Q?onAbP8KOTfKkKLUgW8ZdSEQ34D3a52KrlA4SpV63JcMwNOrhzw/wJwJTN02f?=
 =?us-ascii?Q?tpdqACjaMnh57ym7KyL527QnpMngOQbXtwltujgf3EocgUiCzpUtKhwbzxDf?=
 =?us-ascii?Q?34MXIBx6V0tRMRBpEYtXFDf1sO5hPccST2eLn2MIpxx4v73YOt99F72wn1gm?=
 =?us-ascii?Q?ukGnlLmgf2LDypnFtSFlejPd3RE++IgYMZouKvDNeeyDptSdb34kvk7dUQFZ?=
 =?us-ascii?Q?rwlRPtQKcA9z2nhmZFqoDZQBeMrlf7gxo4Opy5dRiU2bzapf6TQGQiXRnyqr?=
 =?us-ascii?Q?3nn6ygQ/o1XpqZQEcNiZMDlYUWVAXhZVbmW1IqcR6aNMlhf2hRCtD7J24An3?=
 =?us-ascii?Q?eciafb7s/KbD8lr69yMtCVun1eDCt7e4V+hvwrzAMgYUQkPX54jOCPD14avU?=
 =?us-ascii?Q?HkPc+z00lxp9CJc4wFRQdEfYKjBv70sWRZivUbBTX7/wrfttHG3D3mm8wYtz?=
 =?us-ascii?Q?8Th0IBgOp1x4GAjvUb9Zh23k2BaegyacNTQeMzcbPyz30QdTQdxOJzPZmF3Y?=
 =?us-ascii?Q?k0wpNLcIVsyZNgLVSTg8FZbYiELwDqXe3Pq9Uk+OeOhvnjTnD8eU9WgMvdv7?=
 =?us-ascii?Q?Pjy6F1FSlM6x3odu6XlwbUYjgwH/K/V1ofLaz+tZ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83a4a29b-149b-4d3a-3d67-08dafd12a005
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2023 07:22:46.5563 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LN6QSY6gRG0/BLZfbwYf9iKRW8G0RycGxC4dzsd7zASbxEtB5dsAmf5fHcFeImiSkgFM2FGUYFM7m6ueq5Dp9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8184
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
Cc: marex@denx.de, shawnguo@kernel.org, s.hauer@pengutronix.de,
 robh+dt@kernel.org, linux-imx@nxp.com, krzysztof.kozlowski+dt@linaro.org,
 kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

This patch set aims to add i.MX93 LCDIF display controller support
in the existing LCDIF DRM driver.  The LCDIF embedded in i.MX93 SoC
is essentially the same to those embedded in i.MX8mp SoC.  Through
internal bridges, i.MX93 LCDIF may drive a MIPI DSI display or a LVDS
display or a parallel display.

Patch 1/2 adds device tree binding support for i.MX93 LCDIF in the
existing fsl,lcdif.yaml.

Patch 2/2 adds i.MX93 LCDIF support in the existing LCDIF DRM driver.

Liu Ying (2):
  dt-bindings: lcdif: Add i.MX93 LCDIF support
  drm: lcdif: Add i.MX93 LCDIF support

 .../bindings/display/fsl,lcdif.yaml           |   7 +-
 drivers/gpu/drm/mxsfb/lcdif_drv.c             |  73 ++++++-
 drivers/gpu/drm/mxsfb/lcdif_drv.h             |   6 +-
 drivers/gpu/drm/mxsfb/lcdif_kms.c             | 206 ++++++++++++------
 4 files changed, 214 insertions(+), 78 deletions(-)

-- 
2.37.1

