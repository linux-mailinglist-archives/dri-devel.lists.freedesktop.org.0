Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E6EAF506173
	for <lists+dri-devel@lfdr.de>; Tue, 19 Apr 2022 03:07:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E504810E158;
	Tue, 19 Apr 2022 01:07:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2046.outbound.protection.outlook.com [40.107.21.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACDB210E158
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Apr 2022 01:07:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bGrF1HSVnGgjwHNUnS1Q1MbSD/irRMF5Qlv0c9xFKpHXVKqAjswV06KgSKZxjrUhbidXxrlwAKVGCj9Jp/tl0p/TFQSeSChbGO3zMVxqfacq/VZDnk1oCZY2MTiQbs04v6rNbr+aXw+tdjwJsq+C9FMeqPiIf9F1j81DjSrEEbwbEdVZ3gz9Hq22iSHr1sOZG3v3ezCectmy3GuyEONwTe4c/Wiqe8J6s3Kqc1tRj/ij+ZMf8EiiBwUvVVScW8Vz68kdQUz/1buCCaIBJ52Fc6SvlgbdWsb8R2lYzrtpOaMgS24v+9tNrx6pNcHfAvyLOGu4mYHy3XQhMwju6Bltbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b+wH+EVeQJsUnn8AdmBh/OojI/62kuhWmmCeeg7yWPc=;
 b=FmlLN5cA4dC/EJVk5rpvPFb74E9yFU3G/VglwlY+qkvU1N+aQrqTdSssRJfhwN06Eup9bbmqmx6CE+oDhiYar6cj+VQOh9zgzz1oxUdLG6vGmc0QfrBjX1DL9EA4O2OMPQmLLM8dsDxkpgUYuQbhRtH1ZuCAEwsmQ31I4KnnPqqa9sUKsCeudZsoQ6vpQONxmy4AjGT5Z2chnr6Fh+2O+MH7WTqHIO2NNPwhWfO5beJyHpt+afXS/+n1Pn7GvVjG+LTtG45fA9S8cd+SukSgiUodyNz42xCl9qz8gVJh0+ngYqHX3YSNYDJrn5eTSLY/RE3s4WrgtcQOWrk265jNrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b+wH+EVeQJsUnn8AdmBh/OojI/62kuhWmmCeeg7yWPc=;
 b=SWmuIGCFst5vi1YUwW/T5DU2l/nTx5TEsYUNsYqVqFI2gPzqTyLAyaEdrnr9/hz6UIXAsfc92pOwNxnMRn/TV2Gnmia4QUbSALZOG+Cn8cP0aPgMZfRMCcFninTiUj6iLUPCBv4J+9+MsNarBHQwnhsP+jPgq7bREFZR/wJ8IOE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by HE1PR04MB3291.eurprd04.prod.outlook.com (2603:10a6:7:18::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Tue, 19 Apr
 2022 01:07:10 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::b09c:8ffe:8e02:7387]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::b09c:8ffe:8e02:7387%9]) with mapi id 15.20.5164.026; Tue, 19 Apr 2022
 01:07:10 +0000
From: Liu Ying <victor.liu@nxp.com>
To: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Subject: [PATCH resend v8 0/5] phy: phy-fsl-imx8-mipi-dphy: Add i.MX8qxp LVDS
 PHY mode support
Date: Tue, 19 Apr 2022 09:08:47 +0800
Message-Id: <20220419010852.452169-1-victor.liu@nxp.com>
X-Mailer: git-send-email 2.25.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2P153CA0023.APCP153.PROD.OUTLOOK.COM (2603:1096:4:190::6)
 To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7aa87591-fb85-4813-fe76-08da21a0edf9
X-MS-TrafficTypeDiagnostic: HE1PR04MB3291:EE_
X-Microsoft-Antispam-PRVS: <HE1PR04MB32919EF247F0CB3F21765E7498F29@HE1PR04MB3291.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ndH2dJ+Y+JNhJPz+VM/TAQnFaQ0rMuVUW/cD6Dh9LabD9lPryp7OZ5/c2r2TURiHoKVvceuFgFd5my2anXbvfd4nwwrX/vv/rc2P22Rd1u3SJMm4gHtnY+h2kIYzObNyWj6zsbUJB6E5YMQmqCRG2WuK2Ru8v0HvCpeWHG4RooFQBQZ7Q5RLvx110nZHlzWFNU639r0JCPkV6hU8/VU+OwlGU0LMkh0Pjzgfqh6NoSz1qq36WoNmAKttM+cXbL3RujavNhsjfMEP7Js91zSHr9CBrhDZuCwhugxE8uTqMKafHgnrBuzaPklSvuMu8WE90okROu2WxT5wRzfcX5ZVhFL+K9jzsRtL9EOI1kGGS/hTxwo8owyYqmVTxqj1mQ0FXr6KlJP2FUKX1ox5UQzNFFzGdARwhdaxwOelLB35vUVCMK7/nwDgFvrEBUSC8m6kF7T/Nu4+lBo9Z8tPA/oHZLY1O498mweDGgTRVZRg94eouy25E7lT0dNouK5qCXAsYNlcsyKnrfRTjqC1YvRmi5wCj+JYpcmZs/KnKsbioVouNupTqbSjR8wwj0MHPbk4fUcSc4uuYanc8hawOc4/9QUYOgRv5Fnf0xCl9f40EoaRHfR33Q5tTLlIP1yx0cdGMbFTGUcwBdKcbTMmPCP3u5wmbXJ0K2F3lgpoNBvLBb5pkMebE07uaM4/V76+g3pn3sSayt5XFKrNlAp43rxr8A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(66946007)(508600001)(8676002)(4326008)(86362001)(6486002)(36756003)(52116002)(6512007)(6506007)(6666004)(316002)(66556008)(66476007)(2906002)(26005)(186003)(83380400001)(2616005)(1076003)(5660300002)(7416002)(8936002)(38100700002)(38350700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z2czMUxzeVNZOTAwd3c2Rm4zOWw2elhWUnZpc1pzWSs4VDJXQmFQZDRabVlk?=
 =?utf-8?B?a0hXeTNlRGNhQ2hJOVNFT2EzbThUL1BFdmxxbUFjeDdOUDUzaVZFcjUvNzJu?=
 =?utf-8?B?R3l0K3RlYVV3THdjR0czN0JSNG8rMi9hd1JCRWNkY1ovMlVzcXpwenVucEF2?=
 =?utf-8?B?eXc1aUNSZm9GZU5ZQ21IR0RmRjRKSENsaTloSVpYVDY1dkdQTm1LalhoZVRx?=
 =?utf-8?B?Ym9ibEk3VUFTOXNoQ2tMQUNBSnV2R0tIbDVFVVdZMHFvTEs4SXNOUkZBNXZx?=
 =?utf-8?B?Q1J5N0FkM2xsTDY4WlhORFJYa3FXVlpvVy9PSlRUWVdOMnB2Yi9yOHJFTTdI?=
 =?utf-8?B?dGpNRzRhWjJiNTQzZFE4SDRaZGJ5MHFLTExjaFluSDlGZzFtOThscTg3eXNX?=
 =?utf-8?B?MG45dHFUUEFmVWxUTk9Xb0U0WVdPL2hPb1djOWtYbzRXNmlhQlBWOU9IZzQw?=
 =?utf-8?B?Sy9DTUdDMW9kR3I1eksrR2szUFN2cU02R1o2c3kyaDA3c1lmNHFGOFkzbXFl?=
 =?utf-8?B?WlZtbGk0UitKdXJZb1A3Q1pQMEFlYm5YbjFOd0g1b3dIb3piejQ4SWM5ZlIz?=
 =?utf-8?B?WDZ6NHY4TXNlOGVtNXptaEcyZnVpdmhKUDFVRmhtQzRmd01Nb2JOTVk2SEd4?=
 =?utf-8?B?aWRkOXZCTmVTSGxqRlpRTm9aYmhUS01FOTdMUFpFRTBvbUR2ekFQem9reTE3?=
 =?utf-8?B?WGZPWEpyUzFLNHZ5YnhrS2ZmSXN6Wk9uUDg4eGtjZU1Dc2hTdW45UVplTk1R?=
 =?utf-8?B?eThOSVVFeFN2TnIydzRvZlVERTVPZkp6SHZWRWJOS3ZNWDVXU05RUzNiVW82?=
 =?utf-8?B?WndVcGQyWkpHVzk1Z1BsTnh4Y3dIdE1QODVqbTQ2aExMTEtRdUFIZ2ZORlRZ?=
 =?utf-8?B?UE1SUUo0TEFZekZONk9pQjVLbHFMT2tra2FvNnpGZ0RZUmgwWlFxbUdZMjlJ?=
 =?utf-8?B?SFBJMXdDZlZ1U081SHFMMXpVV1U2SSt6eU9FY0NSZDJpdkI2clRjRlM0U0pT?=
 =?utf-8?B?NDJHazU4Zk8zMFQ2aTJ3YUhJWXlnWEpSdzNQL1ZxSFhJUnp3RUNJaGZCaGRT?=
 =?utf-8?B?bk5aS3k2Sy9NZHl0bGN2UWlXU2RsRHZYSXNGUFNTdUhOcGpISlk0V21XYVgx?=
 =?utf-8?B?SVdQVm9XaFBKYVlwQ1FRejhHWjZYWkdaa0JkL2JzdUw0UmhRbTBBWVhMMnNE?=
 =?utf-8?B?dHBzQ0ZXVU9BM0dBWEJVYUlDNnM3R0RMOGFtWmtrOWlNS1FEYzJiUm1tS1dI?=
 =?utf-8?B?cFRueVdGVHE0UWUvVVRERDFCUUZnc2JRdWx1UUhhS3IxcmlKbFBSenVTZEo3?=
 =?utf-8?B?L1hLcndKcEFxTFF3Ty9iUUR2RS8vMVlHOC9WTjd4ZlMwRnNITytNY29RbnE3?=
 =?utf-8?B?Vm5CZjlFTG9xVTFDNVhCYUEyZ3A0TTVCRUp5K3FlbFFWa1hXaVNEQWZITFFp?=
 =?utf-8?B?T1N6NVhKYWNYWFFXcHpMdDlodElsdTJzOERReDN6VFVmNUhoMU10TjFpWk5x?=
 =?utf-8?B?YkM1UFU0TXhEd0c5V2t4cXM0OUF5dE81eFpEbnVNc1p0aVpjS0ZEaUxLWFpp?=
 =?utf-8?B?d0FHSGJTTzRtbjk4ekxaUVJlVFMzb1NhNWcvdmlNdy9XMkJzQjVOdXVuRU5t?=
 =?utf-8?B?N0NwOW9UL2k4bmdxVFU1UFN0aTFaelh5SThoN01aM0ZmQWs5V2dXSlZ1bTB3?=
 =?utf-8?B?UXQ2MzNubUFYK0l1NXdaem8rSjFNNFh5eWRQOWlRODU1S0k2b05DS1RIWVRu?=
 =?utf-8?B?VEJJOXByN0dUSVFVTUx3QzQxRXViOFZQWGwzVlU4eGo1Q21BNVB0Z0hJZWM1?=
 =?utf-8?B?NUt4UlY3V3Vnd01qai8xZE5VNXZLSU9jUlQ2VWtLeFprdzRGZkR2VlRCcFNZ?=
 =?utf-8?B?eEpKUDVveGo3VitHQSs0MDRKUFA5YlVXaTdTOXp5RUk3aUdXWVhrMGtwbExQ?=
 =?utf-8?B?RmN1TkF3bUo2RVVhZDNZTHBrekxTODdycFdvenVuaS9jWDNiektvQXdKd2JF?=
 =?utf-8?B?ZklXa3c3ZmV1VjdwdkNoa29vN2p0SXhXODN5TUw2VGsxQkhHY0xzZnVTekFY?=
 =?utf-8?B?bnJkNW1zZmNGcGo2QndMYTBNVXNlODh3cWZpQjBKc1VhQzU5UjNST2JPSldZ?=
 =?utf-8?B?V3ZJbmUyUEFYd1FGMGtzaWVzWEVjcnl6OC82Y1BDSzlvS2lqNEV2Z2dhUEVE?=
 =?utf-8?B?VXhQL1A5YzRXUDl2Ui92RGZDMFRaQ1dHNkRtR0ZqL3pwTnI4OVNrdTJ3VDQ0?=
 =?utf-8?B?THo4b2RzdTdjVTZtdmRVcFFudjVyWUg5cFkzSFA5Y1JTTU91b0J2TXlXVmtp?=
 =?utf-8?B?SE92eTl6MzM1VENCYVFBOFArVnZ6OTRNSW9nM2ZKZG56M3ZnNFZ3QT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7aa87591-fb85-4813-fe76-08da21a0edf9
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2022 01:07:10.0226 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zwp6fQl1iV6QsEz7pmNksnaUqxkm6kxJ1PLtkNeYZwm7cwQqMEM412rD9LH+dflFf8CZjcPJeegZHOXjnMOd9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR04MB3291
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
Cc: martin.kepplinger@puri.sm, agx@sigxcpu.org, jernej.skrabec@gmail.com,
 narmstrong@baylibre.com, airlied@linux.ie, s.hauer@pengutronix.de,
 jonas@kwiboo.se, robert.foss@linaro.org, kishon@ti.com, vkoul@kernel.org,
 robh+dt@kernel.org, Laurent.pinchart@ideasonboard.com, andrzej.hajda@intel.com,
 robert.chiras@nxp.com, krzk+dt@kernel.org, shawnguo@kernel.org,
 kernel@pengutronix.de, linux-imx@nxp.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

This is the v8 series to add i.MX8qxp LVDS PHY mode support for the Mixel
PHY in the Freescale i.MX8qxp SoC.

The Mixel PHY is MIPI DPHY + LVDS PHY combo, which can works in either
MIPI DPHY mode or LVDS PHY mode.  The PHY mode is controlled by i.MX8qxp
SCU firmware.  The PHY driver would call a SCU function to configure the
mode.

The PHY driver is already supporting the Mixel MIPI DPHY in i.MX8mq SoC,
where it appears to be a single MIPI DPHY.


Patch 1/5 sets PHY mode in the Northwest Logic MIPI DSI host controller
bridge driver, since i.MX8qxp SoC embeds this controller IP to support
MIPI DSI displays together with the Mixel PHY.

Patch 2/5 allows LVDS PHYs to be configured through the generic PHY functions
and through a custom structure added to the generic PHY configuration union.

Patch 3/5 converts mixel,mipi-dsi-phy plain text dt binding to json-schema.

Patch 4/5 adds dt binding support for the Mixel combo PHY in i.MX8qxp SoC.

Patch 5/5 adds the i.MX8qxp LVDS PHY mode support in the Mixel PHY driver.


Welcome comments, thanks.

v7->v8:
* Trivial kernel doc style fix for patch 2/5 - add '*'.
* Resend with reviewer mail addresses updated for patch 1/5.

v6->v7:
* Update the year of copyright for patch 2/5.
* Better variable explanation for bits_per_lane_and_dclk_cycle in patch 2/5.
* Use marco instead of magic number for CCM and CA values for patch 5/5.
* Suppress 'checkpatch --strict' warnings for patch 5/5.

v5->v6:
* Rebase the series upon v5.17-rc1.
* Set PHY mode in ->mode_set() instead of ->pre_enable() in the nwl-dsi
  bridge driver in patch 1/5 due to the rebase.
* Drop Guido's R-b tag on patch 1/5 due to the rebase.

v4->v5:
* Align kernel-doc style of include/linux/phy/phy-lvds.h to
  include/linux/phy/phy.h for patch 2/5. (Vinod)
* Trivial tweaks on patch 2/5.
* Drop Robert's R-b tag on patch 2/5.

v3->v4:
* Add all R-b tags received from v3 on relevant patches and respin. (Robert)

v2->v3:
* Improve readability of mixel_dphy_set_mode() in the Mixel PHY driver. (Guido)
* Improve the 'clock-names' property in the PHY dt binding.

v1->v2:
* Convert mixel,mipi-dsi-phy plain text dt binding to json-schema. (Guido)
* Print invalid PHY mode in dmesg from the Mixel PHY driver. (Guido)
* Add Guido's R-b tag on the patch for the nwl-dsi drm bridge driver.

Liu Ying (5):
  drm/bridge: nwl-dsi: Set PHY mode in nwl_dsi_mode_set()
  phy: Add LVDS configuration options
  dt-bindings: phy: Convert mixel,mipi-dsi-phy to json-schema
  dt-bindings: phy: mixel: mipi-dsi-phy: Add Mixel combo PHY support for
    i.MX8qxp
  phy: freescale: phy-fsl-imx8-mipi-dphy: Add i.MX8qxp LVDS PHY mode
    support

 .../bindings/phy/mixel,mipi-dsi-phy.txt       |  29 --
 .../bindings/phy/mixel,mipi-dsi-phy.yaml      | 107 +++++++
 drivers/gpu/drm/bridge/nwl-dsi.c              |   6 +
 .../phy/freescale/phy-fsl-imx8-mipi-dphy.c    | 276 +++++++++++++++++-
 include/linux/phy/phy-lvds.h                  |  32 ++
 include/linux/phy/phy.h                       |   4 +
 6 files changed, 414 insertions(+), 40 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/phy/mixel,mipi-dsi-phy.txt
 create mode 100644 Documentation/devicetree/bindings/phy/mixel,mipi-dsi-phy.yaml
 create mode 100644 include/linux/phy/phy-lvds.h

-- 
2.25.1

