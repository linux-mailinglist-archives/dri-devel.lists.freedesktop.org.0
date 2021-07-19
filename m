Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 062AD3CD196
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jul 2021 12:10:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C1FC89FF6;
	Mon, 19 Jul 2021 10:10:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2121.outbound.protection.outlook.com [40.107.244.121])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED69889FF6
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jul 2021 10:10:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dRVcdImujNLseqXrM1cnd74MsJF1VY8dI7BQ86bhSi3yXCfS+ty7c83NBNNMouP3pocX3R4iKCCiUlCH8bW+fmm07X5Z5UNLYFGvhI2Acbn4STTDLBYy/bJ6us7Pk1nNfyvu3hly/cUdEO+oXn03cUuJxlHdEns0/9sTr6geybNiEd8YlIuk8rpvrYJyeWlduM8OTm0x7zZWTRp/8/hRV0gT/n2eC/9Ow0Rb3gAtG/BDVYE09nzj6ojR37Y55foxHhOdFXIDs/XSNIVnexj0s0qX47ZNoQGbVe+eEuhItMEbxxtDy1/UCX0V93CCbZzD7r/T/nCI/rMjwyiT/AMm6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lx1/ZatFg+OE6FxKtG8VLpqvIFWtgtaWAuXTsYaByWg=;
 b=ec0/iLz53gb+SfhxueFgyPKArhkXzQQ0iNfNOgSTyMTjOPnEYoXV7lC1PgE3siTI2Cmz0No7eyyLZVpDqVYfHFRkjgtdUv77iCKBPsIiKviMOdTf5vExaFTo1zK7d/DNSpUErWAgWdh8SfPmKmtjv/nuN67FMitw21z11SFMnty98Q0+6yPf/J/fgbipqfP/mcgMwzGsqKl67OXXgMybYtBIq5fDEUCkUYohRNv+lMg1uBYRIeP/QPs/llB91yJmXpunCimUL5yde2NIAci+Lw/3xba8IS/aEezwj9UxnwT+bKTVxifvv4eLRLZb4G+iHfmPyrsKjWk1sRLhnfDoBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lx1/ZatFg+OE6FxKtG8VLpqvIFWtgtaWAuXTsYaByWg=;
 b=Ob+aHqR0+Jygo+DJMXHd3Tpo719CTOv9LduHS2nA+ekoyPWTGWVnYf6d5CX+3xzwdjufYjMIjiSO8SWNjg+svruNBPF0UEkGd6iGOznJ/jUg0uK+3fdqIEn0XyPff6vB3PGjKMqf0SL3eEhY3PmSSXnQzH9NR06xSPDjuJGM+gU=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none
 header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by BY5PR04MB6568.namprd04.prod.outlook.com (2603:10b6:a03:1de::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Mon, 19 Jul
 2021 10:10:15 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::5c0e:fbe5:2bd6:ec6]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::5c0e:fbe5:2bd6:ec6%4]) with mapi id 15.20.4331.033; Mon, 19 Jul 2021
 10:10:15 +0000
Date: Mon, 19 Jul 2021 18:10:09 +0800
From: Xin Ji <xji@analogixsemi.com>
To: Rob Herring <robh+dt@kernel.org>, David Airlie <airlied@linux.ie>,
 Nicolas Boichat <drinkcat@google.com>, Hsin-Yi Wang <hsinyi@chromium.org>
Subject: [PATCH v10 1/4] dt-bindings:drm/bridge:anx7625:add vendor define flags
Message-ID: <85126d087cb045ea5e00a5100fc7d81840744a68.1626685856.git.xji@analogixsemi.com>
References: <cover.1626685856.git.xji@analogixsemi.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1626685856.git.xji@analogixsemi.com>
X-ClientProxiedBy: TYWPR01CA0026.jpnprd01.prod.outlook.com
 (2603:1096:400:aa::13) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from anxtwsw-Precision-3640-Tower (60.251.58.79) by
 TYWPR01CA0026.jpnprd01.prod.outlook.com (2603:1096:400:aa::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.21 via Frontend Transport; Mon, 19 Jul 2021 10:10:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 77870901-4206-4363-f51a-08d94a9d672a
X-MS-TrafficTypeDiagnostic: BY5PR04MB6568:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR04MB6568E2DC2DA11AC51BD95253C7E19@BY5PR04MB6568.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OPVpCJiopYVkf1P1g61BMW0dLYIfHY85190uUCB2nfq/UVEB7BCfanp6hP+bWxq+5Km81M/ZhhG/1CRv3mKEI+vVrfwgui3tdaOgFziu9VKB4WSB0pSP3pT3pfMEO70cIRfFxGLGEVLGZ2jGrj+3nMRwBNM1uPuIcATSM8EhB3xN3kbVb0y0o9dU7L1RYUbIlx02e5R7QoclB1TA34BuEuIfeVsXub+LjRZGJF+ntDs0w7hXd1ahnM2henrXEEsD56uJ7UrLqRbk21ujwWZzYmSXeby33ssUmKeUeObsOoVAcAL9GP6FEraG8syBWYm+DNxkshDUW4TVAkD0/W7jxNIYFbhXJBlcMfmfzHCCi2X7E8XrGqdFW93yUq7j7LJDGMlDzMBLWbREgegBn5Xo2JJRAY497w8lP84C8N/1w0ILmruR/mIDtgmABCB+vRqpyi65aY2Blq2bMqgXrLgOWR5rlq3/rnmWDVGwa3wW2PVFqQXFQQ8bf/OOvjWT+NIWI09A9iLBQKWfUOrh2t0MAp86QtPXCSd7ylxaUXf9au2LeZchAZ7D+Hkve4PI+mhJX5DGIjFxhTZhl26DVNlt/v1uP/lRtIZ2Vlhvy01MLIRzeBdw/DceF0sPSY6PEIJbIn1CCKv1bBAbGgxn2Ah/EFa+e+x25UvJCtbsFeHHu9Il8Nk5hZIdNH6W1OVuQDNfVD9USHirNDEqImFBrh7/cg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(136003)(376002)(39840400004)(396003)(346002)(186003)(52116002)(83380400001)(6486002)(8936002)(86362001)(4326008)(6666004)(26005)(2906002)(55236004)(36756003)(5660300002)(66556008)(7416002)(66476007)(54906003)(956004)(316002)(2616005)(8676002)(110136005)(38350700002)(66946007)(38100700002)(6496006)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Rwd2NWQ6wJglOkpPxbrEOvU5L+EpEVPZRMvWt66tHR2B/5NNcwPUdHzo81A8?=
 =?us-ascii?Q?cQXj3s1OrX0WnHWgAVQn3+pSTZ31oMW+Xje8Wt5IqDpk7Ad79ht+Vvcom9AN?=
 =?us-ascii?Q?9tNV7JyuloPRnHwhfmYIBU+FXSbBVY4GrwMog0N3GWHJj+NLTZGRor1MkNS7?=
 =?us-ascii?Q?zm9UPxa80jzniQTFisLOIC5oXsSPaTmWTiGpjwtWtex/nwT/Tg/r6IHSPn1d?=
 =?us-ascii?Q?UtSHxu0vZH8j8ujAH9qQtL2xbDuEpQR7f4BNkhpZEnFfHl56pshuHJN5p19b?=
 =?us-ascii?Q?L0nQc3wyvxtoBs25VswMaShFtAUyxHY3YjC6eAPTy4Yw9Lo0/GLrCR+BqXoE?=
 =?us-ascii?Q?GqPlzVlxSaoLNmo8Rkv3h2dI2Bmj9xV4fJw7cuQHb1pN1TULWB24bfzCF3/0?=
 =?us-ascii?Q?3782uma+zmEbIAk03K3LmPUr49nxmgRTh+N0w5bCzzdV3ywo3+PnhUWEqH+H?=
 =?us-ascii?Q?f0OlznTDRbpYlDesQjNXBw9azf3K8aZth+OeKu6bBcAA7jOKq4qChwtEBEmQ?=
 =?us-ascii?Q?qS7hjhiqXsfhCnJuRKWm4Qq9z64uMWSvCQEoeaVWUafVVD0+0/jI3Q4OIHmz?=
 =?us-ascii?Q?0FQRxjoQVC35JfNcV8go0gTMc0O3wvIxWXBebaGDBr3XRPobFpdTzWbAs9Sy?=
 =?us-ascii?Q?uAaRhmGf5IhvLHD7Ed+LLKLLFYhUydLdZus9wEzxkyA4zjd3nJWmhMm9eV+N?=
 =?us-ascii?Q?jkpS6uBjN5bo+2mjTtl7MUHkyT+GmqGa8ZTspFVqQjKiS26ZhedM90i7mLNd?=
 =?us-ascii?Q?+qHaS4+y6J6mvr+iK32Ni5m055JJw+xwuDuo75+RrXAccqvHF6MZABx1jLl6?=
 =?us-ascii?Q?WnQmbk/7lO5QoEcsZ7RJOb5XloSObVPMt9n/PiNLI+wQqqWzSGJITuNSI4pS?=
 =?us-ascii?Q?uCFWag/AOnAZ+y7UdtOud8L7AoPVeMH8J9CZrwsAyaydJA4bl65Ka+94d4ou?=
 =?us-ascii?Q?HORoZWNi/1PHNkmgpOrjdvWxIqvo/3Iwpju7jmpz5x7lqx8cdvcD0Yi5KOnE?=
 =?us-ascii?Q?y9yc7esK1SSdt1ElYx14effOebTCPIXlZ4/Ry/kUguFYHq96UhuSKubHrMLv?=
 =?us-ascii?Q?kr34BU3XPjYuuhtFdS6yoE3/zMtA8nhSfz+4zItYHohoxECVF3CdrXSK/9ne?=
 =?us-ascii?Q?gkJ2fyAoNSMEk3Fgcc3f5DFIWRKAK352vJD5mCqrWf/gLv96yKsKgN0zRw3k?=
 =?us-ascii?Q?YGGClstVIM+HZDnSyKdkuvERHUKjglttsKKN7FUTQ85JCJ9DlLwkmTBgsaf7?=
 =?us-ascii?Q?htoUa6EjLD2TbZQ9xAmQ9q2wGXPFki+yd8JotzveT6yKu/hZTcCeHEDB4Owr?=
 =?us-ascii?Q?AVSvnGu3D8GRdYyApHbo5cAJ?=
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77870901-4206-4363-f51a-08d94a9d672a
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2021 10:10:15.3871 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lg+NY8/S6eLDooXGy+XavqW+GEfKY7D3pB4P/8SgeN7CPkdbRmCaMXj71Enzdgp2bpsdjS7QUrmnhIRavWGhiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR04MB6568
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
Cc: devicetree@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, dri-devel@lists.freedesktop.org,
 Zhen Li <zhenli@analogixsemi.com>,
 Ricardo =?iso-8859-1?Q?Ca=F1uelo?= <ricardo.canuelo@collabora.com>,
 Bernie Liang <bliang@analogixsemi.com>, Sheng Pan <span@analogixsemi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add 'bus-type' and 'data-lanes' define for port0. Define DP tx lane0,
lane1 swing register array define, and audio enable flag.

The device which cannot pass DP tx PHY CTS caused by long PCB trace or
embedded MUX, adjusting ANX7625 PHY parameters can pass the CTS test. The
adjusting type include Pre-emphasis, Vp-p, Rterm(Resistor Termination)
and Rsel(Driven Strength). Each lane has maximum 20 registers for
these settings.

For the DP tx swing setting, each lane has 10 different combination for
swing, as Pre0: swing3|swing2|swing1|swing0, Pre1: swing2|swing1|swing0,
Pre2: swing1|swing0, Pre3: swing0.

Register definition as:
[Boost_ctrl]
These registers control post cursor manual, increase the Boost_Ctrl
setting can increase Pre-emphasis value separately.
Lane	Condition	Register address
Lane0	Swing0_Pre0	0x7a:0x00 bit[3:0]
Lane0	Swing1_Pre0	0x7a:0x01 bit[3:0]
Lane0	Swing2_Pre0	0x7a:0x02 bit[3:0]
Lane0	Swing3_Pre0	0x7a:0x03 bit[3:0]
Lane0	Swing0_Pre1	0x7a:0x04 bit[3:0]
Lane0	Swing1_Pre1	0x7a:0x05 bit[3:0]
Lane0	Swing2_Pre1	0x7a:0x06 bit[3:0]
Lane0	Swing0_Pre2	0x7a:0x07 bit[3:0]
Lane0	Swing1_Pre2	0x7a:0x08 bit[3:0]
Lane0	Swing0_Pre3	0x7a:0x09 bit[3:0]
Lane1	Swing0_Pre0	0x7a:0x14 bit[3:0]
Lane1	Swing1_Pre0	0x7a:0x15 bit[3:0]
Lane1	Swing2_Pre0	0x7a:0x16 bit[3:0]
Lane1	Swing3_Pre0	0x7a:0x17 bit[3:0]
Lane1	Swing0_Pre1	0x7a:0x18 bit[3:0]
Lane1	Swing1_Pre1	0x7a:0x19 bit[3:0]
Lane1	Swing2_Pre1	0x7a:0x1a bit[3:0]
Lane1	Swing0_Pre2	0x7a:0x1b bit[3:0]
Lane1	Swing1_Pre2	0x7a:0x1c bit[3:0]
Lane1	Swing0_Pre3	0x7a:0x1d bit[3:0]

[Swing_ctrl]
These registers control swing manual, increase Swing_Ctrl setting can
increase Vp-p value separately.
Lane	Condition	Register address
Lane0	Swing0_Pre0	0x7a:0x00 bit[6:4]
Lane0	Swing1_Pre0	0x7a:0x01 bit[6:4]
Lane0	Swing2_Pre0	0x7a:0x02 bit[6:4]
Lane0	Swing3_Pre0	0x7a:0x03 bit[6:4]
Lane0	Swing0_Pre1	0x7a:0x04 bit[6:4]
Lane0	Swing1_Pre1	0x7a:0x05 bit[6:4]
Lane0	Swing2_Pre1	0x7a:0x06 bit[6:4]
Lane0	Swing0_Pre2	0x7a:0x07 bit[6:4]
Lane0	Swing1_Pre2	0x7a:0x08 bit[6:4]
Lane0	Swing0_Pre3	0x7a:0x09 bit[6:4]
Lane1	Swing0_Pre0	0x7a:0x14 bit[6:4]
Lane1	Swing1_Pre0	0x7a:0x15 bit[6:4]
Lane1	Swing2_Pre0	0x7a:0x16 bit[6:4]
Lane1	Swing3_Pre0	0x7a:0x17 bit[6:4]
Lane1	Swing0_Pre1	0x7a:0x18 bit[6:4]
Lane1	Swing1_Pre1	0x7a:0x19 bit[6:4]
Lane1	Swing2_Pre1	0x7a:0x1a bit[6:4]
Lane1	Swing0_Pre2	0x7a:0x1b bit[6:4]
Lane1	Swing1_Pre2	0x7a:0x1c bit[6:4]
Lane1	Swing0_Pre3	0x7a:0x1d bit[6:4]

[Rsel_ctrl]
These registers control resistor compensation manual, increase Rsel_ctrl
can increase the IO driven strength, increase Vp-p simultaneously.
Lane	Condition	Register address
Lane0	Swing0_Pre0	0x7a:0x0a bit[4:0]
Lane0	Swing1_Pre0	0x7a:0x0b bit[4:0]
Lane0	Swing2_Pre0	0x7a:0x0c bit[4:0]
Lane0	Swing3_Pre0	0x7a:0x0d bit[4:0]
Lane0	Swing0_Pre1	0x7a:0x0e bit[4:0]
Lane0	Swing1_Pre1	0x7a:0x0f bit[4:0]
Lane0	Swing2_Pre1	0x7a:0x10 bit[4:0]
Lane0	Swing0_Pre2	0x7a:0x11 bit[4:0]
Lane0	Swing1_Pre2	0x7a:0x12 bit[4:0]
Lane0	Swing0_Pre3	0x7a:0x13 bit[4:0]
Lane1	Swing0_Pre0	0x7a:0x1e bit[4:0]
Lane1	Swing1_Pre0	0x7a:0x1f bit[4:0]
Lane1	Swing2_Pre0	0x7a:0x20 bit[4:0]
Lane1	Swing3_Pre0	0x7a:0x21 bit[4:0]
Lane1	Swing0_Pre1	0x7a:0x22 bit[4:0]
Lane1	Swing1_Pre1	0x7a:0x23 bit[4:0]
Lane1	Swing2_Pre1	0x7a:0x24 bit[4:0]
Lane1	Swing0_Pre2	0x7a:0x25 bit[4:0]
Lane1	Swing1_Pre2	0x7a:0x26 bit[4:0]
Lane1	Swing0_Pre3	0x7a:0x27 bit[4:0]

[Rterm_ctrl]
These registers adjust 50ohm impedance of DP tx
00:55 ohm
01:50 ohm(default)
10:45 ohm
11:40 ohm
Lane	Condition	Register address
Lane0	Swing0_Pre0	0x7a:0x0a bit[6:5]
Lane0	Swing1_Pre0	0x7a:0x0b bit[6:5]
Lane0	Swing2_Pre0	0x7a:0x0c bit[6:5]
Lane0	Swing3_Pre0	0x7a:0x0d bit[6:5]
Lane0	Swing0_Pre1	0x7a:0x0e bit[6:5]
Lane0	Swing1_Pre1	0x7a:0x0f bit[6:5]
Lane0	Swing2_Pre1	0x7a:0x10 bit[6:5]
Lane0	Swing0_Pre2	0x7a:0x11 bit[6:5]
Lane0	Swing1_Pre2	0x7a:0x12 bit[6:5]
Lane0	Swing0_Pre3	0x7a:0x13 bit[6:5]
lane1	Swing0_Pre0	0x7a:0x1e bit[6:5]
Lane1	Swing1_Pre0	0x7a:0x1f bit[6:5]
Lane1	Swing2_Pre0	0x7a:0x20 bit[6:5]
Lane1	Swing3_Pre0	0x7a:0x21 bit[6:5]
Lane1	Swing0_Pre1	0x7a:0x22 bit[6:5]
Lane1	Swing1_Pre1	0x7a:0x23 bit[6:5]
Lane1	Swing2_Pre1	0x7a:0x24 bit[6:5]
Lane1	Swing0_Pre2	0x7a:0x25 bit[6:5]
Lane1	Swing1_Pre2	0x7a:0x26 bit[6:5]
Lane1	Swing0_Pre3	0x7a:0x27 bit[6:5]

Signed-off-by: Xin Ji <xji@analogixsemi.com>
---
 .../display/bridge/analogix,anx7625.yaml      | 55 ++++++++++++++++++-
 1 file changed, 54 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
index ab48ab2f4240..77b160d7c269 100644
--- a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
@@ -43,6 +43,24 @@ properties:
   vdd33-supply:
     description: Regulator that provides the supply 3.3V power.
 
+  analogix,lane0-swing:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 1
+    maxItems: 20
+    description:
+      an array of swing register setting for DP tx lane0 PHY.
+
+  analogix,lane1-swing:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 1
+    maxItems: 20
+    description:
+      an array of swing register setting for DP tx lane1 PHY.
+
+  analogix,audio-enable:
+    type: boolean
+    description: let the driver enable audio HDMI codec function or not.
+
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
 
@@ -50,13 +68,43 @@ properties:
       port@0:
         $ref: /schemas/graph.yaml#/properties/port
         description:
-          Video port for MIPI DSI input.
+          MIPI DSI/DPI input.
+
+        properties:
+          endpoint:
+            $ref: /schemas/media/video-interfaces.yaml#
+            type: object
+            additionalProperties: false
+
+            properties:
+              remote-endpoint: true
+              bus-type: true
+              data-lanes: true
+
+            required:
+              - remote-endpoint
+
+        required:
+          - endpoint
+
 
       port@1:
         $ref: /schemas/graph.yaml#/properties/port
         description:
           Video port for panel or connector.
 
+        properties:
+          endpoint:
+            $ref: /schemas/media/video-interfaces.yaml#
+            type: object
+            additionalProperties: false
+
+            properties:
+              remote-endpoint: true
+
+            required:
+              - remote-endpoint
+
     required:
       - port@0
       - port@1
@@ -87,6 +135,9 @@ examples:
             vdd10-supply = <&pp1000_mipibrdg>;
             vdd18-supply = <&pp1800_mipibrdg>;
             vdd33-supply = <&pp3300_mipibrdg>;
+            analogix,audio-enable;
+            analogix,lane0-swing = <0x14 0x54 0x64 0x74 0x29 0x7b 0x77 0x5b>;
+            analogix,lane1-swing = <0x14 0x54 0x64 0x74 0x29 0x7b 0x77 0x5b>;
 
             ports {
                 #address-cells = <1>;
@@ -96,6 +147,8 @@ examples:
                     reg = <0>;
                     anx7625_in: endpoint {
                         remote-endpoint = <&mipi_dsi>;
+                        bus-type = <5>;
+                        data-lanes = <0 1 2 3>;
                     };
                 };
 
-- 
2.25.1

