Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6215D6935F2
	for <lists+dri-devel@lfdr.de>; Sun, 12 Feb 2023 05:07:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58F7310E177;
	Sun, 12 Feb 2023 04:07:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on2054.outbound.protection.outlook.com [40.107.15.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7BA810E088
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Feb 2023 04:07:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nyo41S6if7VBieNm//9GrTxXLGp8L96crFqIhFeCY80l9IhIdk6bK3ZOU7l+jvlKoKCGlQvIEI+6yzFH+BbC+cPsZ8lea72nLuHPtkwNOfOMaXYqJibMXV7Qdx0aH2AwAgdLTwgOhb9knO6CCNd1bDuJO1whLiBkFM2OSXdCH9NgHeRB54S5S77XCj7E++6zEopWJfY/qEED1CUFrB8vjkDL57nwdjaXtnngbLoR2Iw/mwvZqoeg/cCClMei/1POqB2RpDPXw+huVbEVWHGctMjB3JuFaRWZW0X7e3ZVBZpUm0TPci2gKXn4/LO5n7g0mprbxlsPZXy200ykpH52xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wNcEEFDNJEwrEupJoQ2YgqwWAKHLc8hz4ZCqMz7yFdg=;
 b=DX0UNPWRkDVzbhCZoBaijf5WRa8T0DbKPfIJGs5YNjgBWqAcZz+swXI9SjD+F/1b9+uIbieUiLnGK3Yvwr0yppSC+7Wc5CjWPDsEiE7EhwYCWppea1qP3jMJnyuypJDeWjh66gQx0q8qYcXNkE7iw/IOLpkuT6kKsA9B4m5UhmUsJrLQLhwggIihfS+bSBFA44o7SUIdUqPXYXaUFmHlSohJqthCce7b0k5xSbz59E+LvSa9POOib8PatUcmcMN5hfunpt3xBY3/J3Z+T6KN1RAZUNYGtsvuXplStXqDtS3E3kYLZmVbczcALDjwnnNA3stAfpxoIHQRa6zeTwMUxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wNcEEFDNJEwrEupJoQ2YgqwWAKHLc8hz4ZCqMz7yFdg=;
 b=Ng/G+yd46VWzXdbGgqwYIM/SNREVbWQZdc83gbqkNVghU/mPWT6fQnXoSGdLKnKYQCjs3GhZ6GBkFZtSwfysTgpVAUDhInSmpRcZ5llSA1PPdq+Y1vANfWYSenz/swoTqwj0l4B/1060vuH3HYO1K36nUlCv6QOeFJNlW/N1gy4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AM0PR04MB7105.eurprd04.prod.outlook.com (2603:10a6:208:19b::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.23; Sun, 12 Feb
 2023 04:07:36 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::5725:92ec:f43e:f5fc]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::5725:92ec:f43e:f5fc%9]) with mapi id 15.20.6086.022; Sun, 12 Feb 2023
 04:07:36 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] drm/panel: panel-simple: Add BOE EV121WXM-N10-1850 panel
 support
Date: Sun, 12 Feb 2023 12:08:41 +0800
Message-Id: <20230212040843.231934-1-victor.liu@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGBP274CA0024.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::36)
 To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AM0PR04MB7105:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ed4d22b-ace8-4b1f-669d-08db0caeac99
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2cnwLTBShqMeKg7zRZgfJaI4ayHDK05xUFGmAlDnuFduvyAU9r3AEgEJxdeWB6L7box8xBQpyXlNJ/vA8xXzlv6J3xKL+/7IN7+vrayWNdiB34yeaxp8qlBY+0PXJWhNJZu0VSEcgrAa1UdW/pLy05qeYJhZKmcf0AZFmymZ2pt4PptlEoQL1tfVX3VgmeyftQiXzIQts7j9OM28QK6NN+PqfsEUpNZEUPIdzCsG7Ti4+emvNTC4FiXqApmNhgeLNdAozJiWOVCZnD6TQmIinz+/q/edM0rbgUGst6TdJIJSlQ9V/hRxY9qfT+qkQbos8amhFbYPnksiD0bR8PEQAr7Wa841FoarBCw/RB7E4VCrA8o20O/v4BLtzLv+zWf0113nIIPAuDRk40LJuBwOKEbNEhhNpe/v7R0gkHXhz/ZRuHkOg+VZQic/iXy5PH0LgzvdPtxAaGYcdObNXAwO6KZ7Nh+0j4saCgreGVBAUoZdqCjsIRW1fyIiI+SLQweiNEJIWYMtNlDMrmZdxMHPMdRvEfURKcxLDL0xjfdd8LGs35PXFB6liXKym/xJ5Lf0x4AjtC3JtUXvvOyFEoLIC03L+xW4bvjlnVFJl3d/zc/1ZYgtfVAr5zgfvemcXXbaPuPKGVtXXXQV+PvyWpnDAZIgV0zOAk/D8SrKld70HCBzjxNziFjXbfEgYlBsqKMqtxCHkgDCcWmCMF0cZfArDw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(366004)(346002)(136003)(39860400002)(376002)(396003)(451199018)(86362001)(316002)(2616005)(6506007)(6512007)(6666004)(26005)(186003)(1076003)(478600001)(52116002)(6486002)(2906002)(4744005)(8936002)(38350700002)(38100700002)(36756003)(41300700001)(5660300002)(66476007)(66556008)(8676002)(4326008)(66946007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2bxh6X1gY9Ln6V97tJDNcvBABvHSljKGS66qM15sFWiRcV7Y+huwC80Nycpf?=
 =?us-ascii?Q?Ag6tmVbML4fL/p5iahikloh/90xgJ0wvMrmtnGRA0UPBvaOe6p8SE+vSXp/r?=
 =?us-ascii?Q?amnYOTlrUNjFHrpWpoRoE7dyfgS200MOKN3cNnJ+EjQl7ftyifiFc4HsoBdc?=
 =?us-ascii?Q?JCtT+/HKhCyQoMpNcHJ+RhSH+wvVTd+R9N/SUFJGznSQHn1WDgCtJ0B4Q6X7?=
 =?us-ascii?Q?nJY8l3vY4EdbU7OPuSWrSKJrAnx/D7gumcpj2piTMuIqkuGPxSxq6izfzRF0?=
 =?us-ascii?Q?tOzE68cOnEsDjCtDrPOaK4CqXI3MG4K8DTH8WdkwJ3DDu/IAKi3mcgOluegn?=
 =?us-ascii?Q?vlOH3QdV44vX29/vsFXoYI3daSoBGBUTDbXLEJG9kLXB2Z4K1BRIZaadNOgg?=
 =?us-ascii?Q?6R+qNpJbpNavEscZA2KsIaON+z8Aw7zqrP9Qs7wAVEkxd7KaHNYe9Wvwg8Zf?=
 =?us-ascii?Q?D+KLlMxo/EuHSO8vkn5/HZDxJqoGH5B0XdJZzNBqp90eVLZKi2wfyJGJImhh?=
 =?us-ascii?Q?tQoHJFs3p10NLBjHfP/94jfW3kUqASIMfmCP+JBywDHC7urZQhj3AGN8GEdG?=
 =?us-ascii?Q?6gabE7wiQpsT2ryKXiR0g7h88leSQLXgnAwKvujpuRYoTZKg97TBbAY8+RS4?=
 =?us-ascii?Q?iM7jE200tCnX7gHoSg3AGSY3YPZUkIdPSTLFipcytf1+W9l6QJojwAgKE+SS?=
 =?us-ascii?Q?i9UGX+4E3d/Sg21iY7RfAStugvgEjh/bIeKMPgx5POgBfv5qks0CD+YXRalh?=
 =?us-ascii?Q?x53Bckc1zbaXz2nJKTD+d7DbxPstQMECPOUeaoXVPvsjMQXwlIXXQl8/PJvE?=
 =?us-ascii?Q?QGdTIhaoUmghnHAq6Q9yFEhKDlboXcPbsMdSUupzEB0Aj+plvzgGz6gH5xtV?=
 =?us-ascii?Q?vUNzmmkc44aWSeU2QFaHatkPG1Ri9ActKx8rjejsnWPWcBBWMOGUBbh003jd?=
 =?us-ascii?Q?H+WwikrRDZWClSu3fZ+6sbvNTdxEgcs7F6MHHqoLlIGgABCEmDSthVdlR7h8?=
 =?us-ascii?Q?O4tcNSgMhUgYU55EgXNrbuMxrgUIpC4stpKASG5mB+nY02kCp2s1TuCM4kBm?=
 =?us-ascii?Q?d2IRPTl40rESbNzYEqxNTsprBWT9NpeEOo3+1sBsumBe4O6zVZMbpoWRfZTu?=
 =?us-ascii?Q?pjPp2h5MxvWy59P/s5EV62+BYMgVLl3GvhBbPxMHoljYziCeSYsKOyWhj9Wk?=
 =?us-ascii?Q?1YJp1iu54pXdO5pL4maOqk0agmX0bIc3OmVv3U2k3l/nhUPJ0qNyx+byqiEa?=
 =?us-ascii?Q?cS7kuleYdP2O3ZHQSOC4udK4bM9a+T+bPiaNSqq9dN2eM2BGweXyyZ4E8qEl?=
 =?us-ascii?Q?Gr8iM171Yn8zb9iA5Ky5GQW6HfC00/QlyTS8VlfvEmrhgNuQ/zJBCOmogp6g?=
 =?us-ascii?Q?JGUynIu06ynKDRBoi/skCt2vCWhSB5Adju8rkfTfUXY1BwNlKJ1NraMaWcXm?=
 =?us-ascii?Q?eXl762RTRApD1HzCIHj+xdMExCAVxycXLpjQqe9Snuhi68gTEzdW2RESKr5O?=
 =?us-ascii?Q?TQzsLexr6781Xgfe41OuhnCZraVQut5OIxxUZHSuX7fGPgWFfXm/ZC0bF16x?=
 =?us-ascii?Q?FecPXptoW09pfoxR2l24WuP/diEHMh6Df5Jen9Xy?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ed4d22b-ace8-4b1f-669d-08db0caeac99
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2023 04:07:36.6383 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tUzex9QcgTMoEVZ99gfIrkuJF1/FIJX4Lpo6aqzSQiyOrEbWe8jAHTn7qTV1/O4hYbTb/uy5ur7Vu9giZQGxFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7105
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
Cc: sam@ravnborg.org, robh+dt@kernel.org, thierry.reding@gmail.com,
 linux-imx@nxp.com, krzysztof.kozlowski+dt@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

This patch series aims to add BOE EV121WXM-N10-1850 panel support
in the DRM simple panel driver.

Patch 1/2 adds dt-bindings support for the panel.
Patch 2/2 adds the panel support in the DRM simple panel driver.

Liu Ying (2):
  dt-bindings: display: simple: Add BOE EV121WXM-N10-1850 panel
  drm/panel: panel-simple: Add BOE EV121WXM-N10-1850 panel support

 .../bindings/display/panel/panel-simple.yaml  |  2 ++
 drivers/gpu/drm/panel/panel-simple.c          | 33 +++++++++++++++++++
 2 files changed, 35 insertions(+)

-- 
2.37.1

