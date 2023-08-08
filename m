Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2072677390C
	for <lists+dri-devel@lfdr.de>; Tue,  8 Aug 2023 10:33:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3CC810E3C4;
	Tue,  8 Aug 2023 08:33:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2070.outbound.protection.outlook.com [40.107.21.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63CEA10E3C4
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Aug 2023 08:33:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JVvAEmxvs/GwqV1kZYRc5zgiN1ofk6LRAfb98y+vBoJikbnTuUNBnre3FiK4j0DtSt5lfqMmxCxUuXSMJvKHggyrwfSHSqyYPBroHmYv2DqgmZRdgZDqW9kRamA7QWV3Ai8KO3MA2Drwr7s+1FL+WJXdRGPUjusP2DzPeiFgkIwD9aM2OryZR6Agg4I/lUXHJWmhV2VzO3IXryu3vyFWBCBBDDadoTbFEFzTK2xTvhGN+KgtZZxHyuljDWN3K9FDfBvIHjKpir1bERqoip7emHX/3+zTdrA8umPHWG15TEpfA8ER63Ry1gvdppxXzXLVWj/aSb1KmdU27ulL5uTNRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LCFG0r+e9Tx7/xVcb9WiIrWpJRRmz2xsrP5p0FANTC0=;
 b=Db1u6z4/MS/E4VvO7jg9Awr6KHFx19rAOJzOo5pAe4kcIVtw7qVmywMzrU3e3QNaGllTju90IDut2cwXkKui7+w6Y/Pcdt8uanfHtVWGsF4ttbA4GcLVTIBoTQYZQhPoWXT3xJtwrYKcv3pzhWCZxxIuoylbiXzNr2aYvi9kAwfBeYq924zaiTNrzDrMlUvBhdc3NdEn38cPEDZSerSSVCPFCS9hHH3rxuQiIlaE9QKhacvmJZ/DUZAHl7f8XlrQrVqW30rhZ1vOosUWGGjMPyIzp2aLHwxXazNxWTZxFmsZpImPddhgezdXhmHD3RH4XO4EQcMjNhUMX3klvxyvgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LCFG0r+e9Tx7/xVcb9WiIrWpJRRmz2xsrP5p0FANTC0=;
 b=jqbdNEctknnVldl20L/q62I9TB/k9iQJ5Oa/5fqw3+JlhB6IF6S8KZ6aU/43QjNAay4TCr9nnhmdivaAPv/HKwl3sgKltHGogH/nIQxz4rjYI0dadQPwFuw4kntgkBqmo3WSDwRJ9p22HsXvnWEByJ84QBnOIJu3IETCplIYHNc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by VE1PR04MB7296.eurprd04.prod.outlook.com (2603:10a6:800:1aa::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.26; Tue, 8 Aug
 2023 08:33:32 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::3505:c499:96d4:1429]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::3505:c499:96d4:1429%4]) with mapi id 15.20.6652.026; Tue, 8 Aug 2023
 08:33:31 +0000
From: Sandor Yu <Sandor.yu@nxp.com>
To: andrzej.hajda@intel.com, neil.armstrong@linaro.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, airlied@gmail.com, daniel@ffwll.ch,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org,
 s.hauer@pengutronix.de, festevam@gmail.com, vkoul@kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org
Subject: [PATCH v8 0/7] Initial support Cadence MHDP8501(HDMI/DP) for i.MX8MQ
Date: Tue,  8 Aug 2023 16:32:36 +0800
Message-Id: <20230808083243.3113192-1-Sandor.yu@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI1PR02CA0010.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::17) To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|VE1PR04MB7296:EE_
X-MS-Office365-Filtering-Correlation-Id: 3201602f-854b-45b4-59bb-08db97ea25dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: joXUA5LvnF66+TEv9jDjBAAPKsTsn+Vc5Dsbba3QjtOzTb4KN4j9rVYblCO4zyih9duW+LyNJnvTeJI4qLleUQxlnCEJAWMNqWfYMhfFquazomjTpHhm/t+R94HQS+WvAdt3OMManjkzHAMxSB95KknKiIj36VezyCh96ibuMLaSuzl0Izkn8kLL5sbKSbmm4iG8wxVytD9UNjKdGg2hWNO1xFch366q+CWocV5Qe1dDFpFD00OM4RBBjhfERRBz0M5CqLXRB48YSeFW1d+g//lnVp18IyntrZrCHsnpvICu1j8F1w5yJy+zSSOGDrCAn+slRGk5W9AEDG6uvtXOJtbgYRY9bh2ufBTCW1GkzPzeUNJ2XqzQJG0HGmUI1KCdCaWK0akfakfdAbg00GXApzf4PSJCKnXQe/FB/rAAglYzIxsdSTjuaKjSYoyMnbPt/9HpYt/etRrk9sJy7Z9kgFKGFzpyIO8vxb7e1ddSEqqrtIbrB3iFKVL2h2SYvryuGwHgpSxAMh+pcM3d3BHy4kxKqbpLcWjZPaWKhMyqJRIjFBzxqLOvWmk8vMHDdV7wXE4p6TRA8cjPEPj5zQN5hHc59+dAThvRLgreVWWp/0qjK0P9M6HaqjSla19d2VnD
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9448.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(396003)(376002)(39860400002)(366004)(346002)(451199021)(1800799003)(186006)(83380400001)(36756003)(2906002)(5660300002)(2616005)(38100700002)(52116002)(38350700002)(6486002)(66476007)(66556008)(921005)(66946007)(966005)(6512007)(4326008)(316002)(41300700001)(86362001)(8676002)(26005)(7416002)(1076003)(8936002)(6506007)(478600001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?czVzT3U0cEIyM3UvTzVtSmg2SlRhODhJdlNaeCtPOW1zZ1BXK2Z5SFFaUlVq?=
 =?utf-8?B?WllrMGJHQTQ0Y3hmYlVGN003NGZQZVFTTjRxQS9UMHZtOEJnTnF4c2xBWjZJ?=
 =?utf-8?B?YlFnVWY1dGdZTFZZWmxKcFJKcWJMYmRxL0ZudStKME82UW41bnJWeGV6dFdR?=
 =?utf-8?B?VHVYODlIOWV4THZNZ0dBRzUxUTZPL0NNTXRqam1IeG9kZ21sa3A5QjR2Z21l?=
 =?utf-8?B?MDB1Q1d5QTZ5NHdjVWRBTzMzNVdiY1JjblNFZmtMRHp4bHljN1dWYmJ3QnQx?=
 =?utf-8?B?SThFcG56Wk0wVjE0NXZoc244aTE3am5jSVlJQWJLT2ZyL29IRFVadUxQU2tv?=
 =?utf-8?B?REpWVzJHdVh3ZmdYV21Xb0JaRkZMS0NRVlVBcFZoZi9LZ2hDQ1k1aDlSUHhL?=
 =?utf-8?B?dUlKUDkzdjhpVEhOVS9WbFZ0OXkzRUFkdXRQZUtRRkFNTUdETUNwS0NhSVZ0?=
 =?utf-8?B?TS9KQ1ozZW5QYS9vckw2bzVkZjh1SjYvUktDTjVBbnh2NkIvTmVuVVN2RDY2?=
 =?utf-8?B?L1FIeXpRMzVJdzloalpXU2QrVkUxRURXaFdkazhRVUZkWnRvNUFrQTYrenBC?=
 =?utf-8?B?cG9aM2hhZU5aUExNZTFNd3czZjc0dVZHcHJHL3lJQWpsa044TUlKWk5paXJ1?=
 =?utf-8?B?L3ZxUi96YzVOQTk2RXF6QTBEVGNqd0NCS0xSb2NITnhadTB1dWFJcFpQc2g4?=
 =?utf-8?B?M1dpSTFNWkUza2JyVDlaV0k1WWFibnRGUFpHNEdrR0FkS3RCWGFYRng2RlVV?=
 =?utf-8?B?WGNpZ1ZxSVF6amZyTFRHc1hQM3paRENOS1dMaXRhRzFCNWIrSUtLb1JFWC9G?=
 =?utf-8?B?ODZodlFuVXpOUUZZb0dDRWdUZTRkdDc4RkZJQldKSjlkQk8rT3hudThOYzFk?=
 =?utf-8?B?Uk1pdUlRYUk1bU80M2ZUNDYvQW9naVQyZy96dDNaRW1TK2dkbkJiQ0tsSHVO?=
 =?utf-8?B?SEtXc2tWWEJRUkdqMkFZVE9MMGJVYzdSSFVzZ0RIQWRocHpzcmhJOWowZ0tG?=
 =?utf-8?B?dWlnTmlHMHpJVm9OM1dVQllXUnYrRno5dzJKNFRLYkNxOWVnOFVNdjArMlNL?=
 =?utf-8?B?MW5JZDR6alJ3YUVXZC9lVWhKbzRDMDJEZkVaVS85OFdOVndkbnkyNzJZdnBU?=
 =?utf-8?B?V2ZYV0FpM2JNZFR1WEt4eGRNbEt1aS96dms5TnNvcjk4MnB0Qlg0SVJlUUxh?=
 =?utf-8?B?R3B4VGk0QTMzWEF0Zm0rM0V1cVNWODVsQmpKdUNJZEJ6SjdOb3J2NkNKWDIx?=
 =?utf-8?B?d1FoNEM1ald2WmgvRjNMSll6bjI0eFpzZ3Y1M1ZkbUhzdmJuSndJblB2cGg0?=
 =?utf-8?B?UEg0YmtJUjN3Q1NjZ2lBYk8rVEdvcWUvYXArR1kvayswZkVhYWxuT2M1VWZO?=
 =?utf-8?B?SlZJc3pkY2ZqandFUktRWWd4Rjh6VGN0R1BTRU9jYUxXQmNEQ0lZTmFJUnJF?=
 =?utf-8?B?TUl1dkNXRXVhbWZ6YkFMQnNYcUZoS1o4blRpNG5ZNkMvRUwvMlAvL1VYTDJJ?=
 =?utf-8?B?ZHdCZG1zNXI1eEh1a3JPWmZDdHpxTlBsUU1yeWRRM3ZjVTgrM2JpRC9aMk95?=
 =?utf-8?B?S2FBWHdwTGNyNlp0OWV2WU53WTJ5aGh4MDhhTlBJaXRBU2I2M1N1clgxVFhW?=
 =?utf-8?B?L2hGRXV5RGNNakJxU1hTaFlpb1JyVDk1MHQzTzV1TlAvVUdPTklIQVhkQ3dW?=
 =?utf-8?B?em8rRHZsU3hjZEN6QThTcEdUdWNubSticm9ZU3FmbUFwZEkwYXFWc05RU1JD?=
 =?utf-8?B?eEQwQ0pERGNhNVZCVm9aZ09oN0FXN0tQTmNOS2FjVDd2N291eHBLbUtkdzVJ?=
 =?utf-8?B?MUVuZnlIRmw5TWdKMUVjZE9nYjZTQy9taVl2eVNiUDNlVWkwelQ1eTYyYkZU?=
 =?utf-8?B?eXZCUVQ0R1M4eklFT3V6R0V3RzFqMEJtVEdnOXp1MEtTcVVFTlpXN0FqS1hK?=
 =?utf-8?B?UkZSa25qbGpWSi9QZnFjSm5objJwcDFyOTdaNEpUNXFFcUhROWVkelJwZnB2?=
 =?utf-8?B?YkhPTE56SEJ2ZVpSN1FVVHRnZHJUZmdpR3RaT09MaURVUDgzWGY0NW5nSmwz?=
 =?utf-8?B?MlZqNzFJdythZUdpZUFITmw3aGxrcG9RTVFRN1Q0KzFPK0IvT25oL3RrbzhR?=
 =?utf-8?Q?qwdGXEDn4yn9hN3nsh285dams?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3201602f-854b-45b4-59bb-08db97ea25dd
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2023 08:33:31.8692 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8dlDYfWc9igraLM83oYw5IW/moqyQsFMAdGvtrlLvAxShukGIDF81pNtsdms91+8nRLxS1XlT3wDSfN0n8Ly2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7296
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
Cc: oliver.brown@nxp.com, alexander.stein@ew.tq-group.com, Sandor.yu@nxp.com,
 linux-imx@nxp.com, kernel@pengutronix.de, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The patch set initial support Cadence MHDP8501(HDMI/DP) DRM bridge
drivers and Cadence HDP-TX PHY(HDMI/DP) drivers for Freescale i.MX8MQ.

The patch set compose of DRM bridge drivers and PHY drivers.

Both of them need the followed two patches to pass build.
  drm: bridge: Cadence: convert mailbox functions to macro functions
  phy: Add HDMI configuration options

DRM bridges driver patches:
  dt-bindings: display: bridge: Add Cadence MHDP850
  drm: bridge: Cadence: Add MHDP8501 DP/HDMI driver

PHY driver patches:
  dt-bindings: phy: Add Freescale iMX8MQ DP and HDMI PHY
  phy: freescale: Add DisplayPort PHY driver for i.MX8MQ
  phy: freescale: Add HDMI PHY driver for i.MX8MQ

v7->v8:
MHDP8501 HDMI/DP:
- Correct DT node name to "display-bridge".
- Remove "cdns,mhdp8501" from mhdp8501 dt-binding doc.

HDMI/DP PHY:
- Introduced functions `wait_for_ack` and `wait_for_ack_clear` to handle
  waiting with acknowledgment bits set and cleared respectively.
- Use FIELD_PRE() to set bitfields for both HDMI and DP PHY.

v6->v7:
MHDP8501 HDMI/DP:
- Combine HDMI and DP driver into one mhdp8501 driver.
  Use the connector type to load the corresponding functions.
- Remove connector init functions.
- Add <linux/hdmi.h> in phy_hdmi.h to reuse ‘enum hdmi_colorspace’.

HDMI/DP PHY:
- Lowercase hex values
- Fix parameters indent issue on some functions
- Replace ‘udelay’ with ‘usleep_range’

v5->v6:
HDMI/DP bridge driver
- 8501 is the part number of Cadence MHDP on i.MX8MQ.
  Use MHDP8501 to name hdmi/dp drivers and files. 
- Add compatible "fsl,imx8mq-mhdp8501-dp" for i.MX8MQ DP driver
- Add compatible "fsl,imx8mq-mhdp8501-hdmi" for i.MX8MQ HDMI driver
- Combine HDMI and DP dt-bindings into one file cdns,mhdp8501.yaml
- Fix HDMI scrambling is not enable issue when driver working in 4Kp60
  mode.
- Add HDMI/DP PHY API mailbox protect.

HDMI/DP PHY driver:
- Rename DP and HDMI PHY files and move to folder phy/freescale/
- Remove properties num_lanes and link_rate from DP PHY driver.
- Combine HDMI and DP dt-bindings into one file fsl,imx8mq-dp-hdmi-phy.yaml
- Update compatible string to "fsl,imx8mq-dp-phy".
- Update compatible string to "fsl,imx8mq-hdmi-phy".

v4->v5:
- Drop "clk" suffix in clock name.
- Add output port property in the example of hdmi/dp.

v3->v4:
dt-bindings:
- Correct dt-bindings coding style and address review comments.
- Add apb_clk description.
- Add output port for HDMI/DP connector
PHY:
- Alphabetically sorted in Kconfig and Makefile for DP and HDMI PHY
- Remove unused registers define from HDMI and DP PHY drivers.
- More description in phy_hdmi.h.
- Add apb_clk to HDMI and DP phy driver.
HDMI/DP:
- Use get_unaligned_le32() to replace hardcode type conversion
  in HDMI AVI infoframe data fill function.
- Add mailbox mutex lock in HDMI/DP driver for phy functions
  to reslove race conditions between HDMI/DP and PHY drivers.
- Add apb_clk to both HDMI and DP driver.
- Rename some function names and add prefix with "cdns_hdmi/cdns_dp".
- Remove bpc 12 and 16 optional that not supported.

v2->v3:
Address comments for dt-bindings files.
- Correct dts-bindings file names 
  Rename phy-cadence-hdptx-dp.yaml to cdns,mhdp-imx8mq-dp.yaml
  Rename phy-cadence-hdptx-hdmi.yaml to cdns,mhdp-imx8mq-hdmi.yaml
- Drop redundant words and descriptions.
- Correct hdmi/dp node name.

v2 is a completely different version compared to v1.
Previous v1 can be available here [1].

v1->v2:
- Reuse Cadence mailbox access functions from mhdp8546 instead of
  rockchip DP.
- Mailbox access functions be convert to marco functions
  that will be referenced by HDP-TX PHY(HDMI/DP) driver too.
- Plain bridge instead of component driver.
- Standalone Cadence HDP-TX PHY(HDMI/DP) driver.
- Audio driver are removed from the patch set, it will be add in another
  patch set later.

[1] https://patchwork.kernel.org/project/linux-rockchip/cover/cover.1590982881.git.Sandor.yu@nxp.com/

Sandor Yu (7):
  drm: bridge: Cadence: convert mailbox functions to macro functions
  phy: Add HDMI configuration options
  dt-bindings: display: bridge: Add Cadence MHDP850
  drm: bridge: Cadence: Add MHDP8501 DP/HDMI driver
  dt-bindings: phy: Add Freescale iMX8MQ DP and HDMI PHY
  phy: freescale: Add DisplayPort PHY driver for i.MX8MQ
  phy: freescale: Add HDMI PHY driver for i.MX8MQ

 .../display/bridge/cdns,mhdp8501.yaml         | 104 ++
 .../bindings/phy/fsl,imx8mq-dp-hdmi-phy.yaml  |  53 +
 drivers/gpu/drm/bridge/cadence/Kconfig        |  15 +
 drivers/gpu/drm/bridge/cadence/Makefile       |   2 +
 .../drm/bridge/cadence/cdns-mhdp8501-core.c   | 313 ++++++
 .../drm/bridge/cadence/cdns-mhdp8501-core.h   | 410 ++++++++
 .../gpu/drm/bridge/cadence/cdns-mhdp8501-dp.c | 780 ++++++++++++++
 .../drm/bridge/cadence/cdns-mhdp8501-hdmi.c   | 674 ++++++++++++
 .../drm/bridge/cadence/cdns-mhdp8546-core.c   | 195 +---
 .../drm/bridge/cadence/cdns-mhdp8546-core.h   |   1 -
 drivers/phy/freescale/Kconfig                 |  18 +
 drivers/phy/freescale/Makefile                |   2 +
 drivers/phy/freescale/phy-fsl-imx8mq-dp.c     | 714 +++++++++++++
 drivers/phy/freescale/phy-fsl-imx8mq-hdmi.c   | 955 ++++++++++++++++++
 include/drm/bridge/cdns-mhdp-mailbox.h        | 240 +++++
 include/linux/phy/phy-hdmi.h                  |  24 +
 include/linux/phy/phy.h                       |   7 +-
 17 files changed, 4311 insertions(+), 196 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/cdns,mhdp8501.yaml
 create mode 100644 Documentation/devicetree/bindings/phy/fsl,imx8mq-dp-hdmi-phy.yaml
 create mode 100644 drivers/gpu/drm/bridge/cadence/cdns-mhdp8501-core.c
 create mode 100644 drivers/gpu/drm/bridge/cadence/cdns-mhdp8501-core.h
 create mode 100644 drivers/gpu/drm/bridge/cadence/cdns-mhdp8501-dp.c
 create mode 100644 drivers/gpu/drm/bridge/cadence/cdns-mhdp8501-hdmi.c
 create mode 100644 drivers/phy/freescale/phy-fsl-imx8mq-dp.c
 create mode 100644 drivers/phy/freescale/phy-fsl-imx8mq-hdmi.c
 create mode 100644 include/drm/bridge/cdns-mhdp-mailbox.h
 create mode 100644 include/linux/phy/phy-hdmi.h

-- 
2.34.1

