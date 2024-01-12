Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CDAC82C536
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jan 2024 19:08:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C815910EB8A;
	Fri, 12 Jan 2024 18:07:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on2059.outbound.protection.outlook.com [40.107.6.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 437A710EB6F
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jan 2024 18:07:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m056r+427aVT1kwdQR/96bOD6mde9dn6rW2UNdZvD0HkCHbkHTFjvy2mrl7+E4/rgN2mdx/Ey788uG9gmY57koD9L+gK8DN1qLvc8J0sSdf3Db59LQ68Bz4aE4zU8+6GaYLDd23EyGnJ7E2oXPOsuYvdffk2nqJUB7gdJPYciask+UxEP4QUZFZA57wgiVIRxmBxS/QAw4BUbCjrSFDwfd52svELbeDl/jCQ2FnPAutejMazArzky07Jq8F5cwOjiSaAXzlxGHAWA4vck5723wHC0ED/3Qo7qU9Y2VR6gdpkKC6bVZgwGld7MK/UXraMN2Cz9KfhoKwNYPdlxOg9Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8MbqTnf16hJDRVDy4ZeUcvi0Kn7jwlOdRZtBNsoowE0=;
 b=A0VxeBjQJLBKmNhbBL6+DzXVzgzif8+KCEKJrA+6d6JO394oRzgBERjtKfT+nhun3IvoIsxPMHD7zx282rJAv7QsKwSPQHrk1A/LEvSkBuM2D6Ba8dZgbDvPtnsKl45WAH5UcwjqvWbxGDQJKgoSOrW+uD5kpakosLNYYYJMbgNFnCJck7ixP/xw5iG1Dk6pS2ApM7fPyobhbK1KJqPp0Ce7aaBzIzLTxcZpRNryZCwMPaFVlVKTLOvxXXRSHqSbuFjTrQ1W0p/haYiUlZUMD4SlnmVSANGJ6Q8cRcACU0EhuWo9ByzcecYqBdALanlTW7mltojsu0wM/xuwg2O6vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=theobroma-systems.com; 
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8MbqTnf16hJDRVDy4ZeUcvi0Kn7jwlOdRZtBNsoowE0=;
 b=bjPAeYVvGDyHWrF7zICcZ85+9a6vD/kANix6ukiNZIX+C8aN9M5JIfINC5JSPrVf5UOu+ctYhrKGkOT9asWR5DZwos0Zb03Yesi2/CqGePfomMaHxcDmWNgc4581MzMgk6B5TVaXVTtfUJ41rj2PN8vcFaxFolkx9ZA6PNUcj7/f5rrYADFlfUOJ1GsgFgHOzwr5VHm9nljvTcn8zNUt+Et6NskbSjtkfL427TOcS1/3mPxZ7YpD93Ny04nXvYvoa5WZ8kIO4ue86IAbWrc+Wi+uR+azEJA3dgvJN1rRAtQQlQ1B/8fr60NhULRDW0tp7MjLWJ3UPRSQwXx/Pz4w+Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from VE1PR04MB6382.eurprd04.prod.outlook.com (2603:10a6:803:122::31)
 by DU0PR04MB9467.eurprd04.prod.outlook.com (2603:10a6:10:35b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.21; Fri, 12 Jan
 2024 18:07:51 +0000
Received: from VE1PR04MB6382.eurprd04.prod.outlook.com
 ([fe80::d4b1:cea8:7085:ec50]) by VE1PR04MB6382.eurprd04.prod.outlook.com
 ([fe80::d4b1:cea8:7085:ec50%4]) with mapi id 15.20.7181.015; Fri, 12 Jan 2024
 18:07:51 +0000
From: Farouk Bouabid <farouk.bouabid@theobroma-systems.com>
To: victor.liu@nxp.com, andrzej.hajda@intel.com, neil.armstrong@linaro.org,
 rfoss@kernel.org, jonas@kwiboo.se, jernej.skrabec@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 linux-imx@nxp.com, khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, hjc@rock-chips.com, heiko@sntech.de,
 yannick.fertre@foss.st.com, raphael.gallais-pou@foss.st.com,
 philippe.cornu@foss.st.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH] drm/bridge: synopsys: dw-mipi-dsi: fix deferred dsi host
 probe breaks dsi device probe
Date: Fri, 12 Jan 2024 19:07:37 +0100
Message-Id: <20240112180737.551318-1-farouk.bouabid@theobroma-systems.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR07CA0144.eurprd07.prod.outlook.com
 (2603:10a6:802:16::31) To VE1PR04MB6382.eurprd04.prod.outlook.com
 (2603:10a6:803:122::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6382:EE_|DU0PR04MB9467:EE_
X-MS-Office365-Filtering-Correlation-Id: 15ae7662-3396-40bf-093f-08dc1399643f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yk5HFFpmdrXTkoFGcLiwgk03ea82TAVijCtZL7xyCYN8qb5ESH8cgFV6rS2r6hE9Ie3uQ7mb+Ia1hs3b11EJCpsN6Md5nDwMfmzGvvDW1A6T5tEDYihCMpZbTRffrf4FOxbYPlvG6zQ2jjLS2EUZdIF7UGvPtzgf9+YlWyBVxur8476KH6vjkVqG+Te2yEiZTmXbAsokAR45TDPYK2yydkRkIx0dQEidimzTJzE+UNxUT9Ep083S0hT2I6RacxlEEfxGeLFjaXdSttL6hLQYWVlw8HipGFjH8Kuodaf+MyXdBraEqojvui4fcCgikDlzzfd5/yahN4yz+c85lOBNe89TlzeBC/VGhR3VYEQ5UWVUKjOdw8jJSp8CpUibVz1nXZeQIc9WGCG5ZelIYO9Do9tRSxZrblI/q1yWiC20LvkeqdgidphkZ8sh7+HJFxPWVnRM0QyjKQ6OgHaFeB9yKoGTdiQsNQ8DVi1Cew6TN5OGy8ssG+jRY+miN+T7XVYLtGZbllHPwXdl3FkUCFOua8UT+wkyYxga/DFrRITXy0TwxWd+ZeEEbapR3Nbg1RAKsgEsSh2/kt8trfPbu7+3Yy1QWcBYQPGNt8q3YgU534aqyNt/KLG0K+8X7x5bK4F2DaYT+w8YDXzQIZsC7G3taA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR04MB6382.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39850400004)(136003)(346002)(366004)(396003)(376002)(230922051799003)(186009)(1800799012)(64100799003)(451199024)(5660300002)(30864003)(86362001)(8676002)(8936002)(4326008)(7416002)(2906002)(7406005)(1076003)(2616005)(38100700002)(26005)(83380400001)(107886003)(52116002)(6506007)(44832011)(6512007)(6666004)(478600001)(66946007)(36756003)(316002)(66556008)(66476007)(921011)(41300700001)(6486002)(38350700005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?W3UyzkIvmSIrjMIoXL/xXzNcA0gwyY9r7NAAQvY4PpDwKYW78Aw9la2zGe5d?=
 =?us-ascii?Q?CpaVWlp5Pfi/IaNglzjcW3aiR2yT7O3R72GIFE5rSqwaXLzaoOEaogRenl9t?=
 =?us-ascii?Q?5TYI9+ZnawR3puVAHNSgX2WFjyIP1Y9IKFxmr4w7C/JsDe5ocE/yQr+snYxH?=
 =?us-ascii?Q?qIjN+BtxiHNn6NNrUReWKwCSNxobAa9T2CeiwD82yCOwz9mDBe8sJdwThMn8?=
 =?us-ascii?Q?WTQ0BKtvH9gACfLebvXv1UA866J8TyN4O+5/O+roxFESGZABLUk4t2I0gJli?=
 =?us-ascii?Q?y2/8DRpxJ/iXwZbsuX97Tk8wo1S9/8qmwA9scXqhg3/FKe42w4VCKh1KwNES?=
 =?us-ascii?Q?qeGBRffOIoqaM6bdgxsAxtkZCMF4NQh30ngmgZDYKgsyhbvluXpGh7O9gfXu?=
 =?us-ascii?Q?t8XWjS5SzN3IjOwmz0g21CMUeKQAAJANwqAnAiML+7eIHdOnVejqG2XR+sS+?=
 =?us-ascii?Q?t3MtPwcGamwt7vt4SLR/1QKrOOd/9mu0K1tgFsy2bk/+amiz2V/aRr6uLIIM?=
 =?us-ascii?Q?qy9fy6A/+6fc8jxzBS9pGrMYPgP+0O7g2rn5o3uguud8cfuhRFBNJCOo/wbl?=
 =?us-ascii?Q?N4d/EEiwCGaxaFQWhHJSlRIPnYZD7KkhDhBFyjYfsYHIz1E13s4jfEwpbQWg?=
 =?us-ascii?Q?AvicY98rf0vc33B8lSkJRaVumsWrs00bW/94lGx87ptq/SnQl2rvkeu5TwN9?=
 =?us-ascii?Q?5AtYXdm+aWF+EaDRb9TBhT8qYp3r1F0QncJZeoJxlLop9ZUpHKXvT2w9EGwD?=
 =?us-ascii?Q?GU822GN/k+IYRwtpdjoNkxOq4tnedD34P3MvCi81leQsRMUdlyxRlsHmb0TY?=
 =?us-ascii?Q?Br7aKpFl7UVrO17W2Ai7P4TDB3O7aVvqKLX4nsnQ3j16qsRzEvD8qyZ/ixzM?=
 =?us-ascii?Q?Kl9BPS6i+GEvE8rjyM/djFG3zSR9367QUEGFkH7b2QmGyEkxLVy4NxqcINfn?=
 =?us-ascii?Q?fpXzvhwxrewh+EPtoKRh/KdOs6XDyFJZcYWMvxQanj5VaSmM9kxxofsvfJDG?=
 =?us-ascii?Q?aZxiHM5gdlu0VDTsPhNflZi70jBj+/dw11JVxynCAx+qcuSJyxF/kZxqmY60?=
 =?us-ascii?Q?bpHR83QCckZb1xQ25HjWVoOxPzTIiAGC5c6Vd/xiXQnXF7jbT4++vHYw9crr?=
 =?us-ascii?Q?CouKivnTH+T80QvgEkBUq/791PQXsCL6lXJca1dEYwP1NYRj1AMai2NUTqGl?=
 =?us-ascii?Q?RxQqMtZt/Gu/ab7XF2ubq/g1tTtjrTnOzK02lboW/rIn50fGf00gQssZyL0A?=
 =?us-ascii?Q?V587FkJYDs7AxM21l9AL/+7FzhbojxSxIkThABg/o/ti0hnGy6yYiFxJ84Lv?=
 =?us-ascii?Q?5elX+qv0SOZ3xkxhsiJdsg5jAXAQGS+hiOWf/5MOdzf1UuezMMkR2+FXjV85?=
 =?us-ascii?Q?iJTu/0NcSxZTO9Xfdgf25WKNI1goka8dTXhJmN2GOmjWA4YHzF1RFu77pL3S?=
 =?us-ascii?Q?WuWLi7WO5+AuzkdNYEjRyqe15aKbYYD9HTwUd5ua7ESeWId6JH8ejs2KbU5H?=
 =?us-ascii?Q?B9AK0K/5OlG+NcJ0A0lEqNvoWuPX76YqI1bbE3eAQDmirNRw3oq/zCTm2A3y?=
 =?us-ascii?Q?t7bsIPHOarUzYz49tTwf9rJgnSg0VJEOyauAKSKNRHFMmr4vZ/i0Khdlh6v5?=
 =?us-ascii?Q?iUulBZDuKJAVWskeRC2ZXuM=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15ae7662-3396-40bf-093f-08dc1399643f
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6382.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2024 18:07:51.4062 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1rRjF/cX6hDFIkhssql5kt3+B2HlctKwnEPsCgXj/9DPmgFc7eqEXLJMYj+Sa0quTlfvmCjbj/gYkyBnbctIDD4AwIoGr79lGgaN/ICRU6DKq7FcWkV1/1dGpJaqKnVf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9467
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
Cc: bouabid.farouk97@gmail.com, quentin.schulz@theobroma-systems.com,
 Farouk Bouabid <farouk.bouabid@theobroma-systems.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

dw-mipi-dsi based drivers such as dw-mipi-dsi-rockchip or dw_mipi_dsi-stm
depend on dw_mipi_dsi_probe() to initialize the dw_mipi_dsi driver
structure (dmd pointer). This structure is only initialized once
dw_mipi_dsi_probe() returns, creating the link between the locally created
structure and the actual dmd pointer.

Probing the dsi host can be deferred in case of dependency to a dsi
phy-supply (eg. "rockchip,px30-dsi-dphy"). Meanwhile dsi-device drivers
like panels (eg. "ltk050h3146w") can already be registered on the bus.
In that case, when attempting, to register the dsi host from
dw_mipi_dsi_probe() using mipi_dsi_host_register(), the panel probe is
called with a dsi-host pointer that is still locally allocated in
dw_mipi_dsi_probe().

While probing, the panel driver tries to attach to a dsi host
(mipi_dsi_attach()) which calls in return for the specific dsi host
attach hook. (e.g. dw_mipi_dsi_rockchip_host_attach()).
dw_mipi_dsi_rockchip uses the component framework.
In the attach hook, the host component is registered which calls in return
for drm_bridge_attach() while trying to bind the component
(dw_mipi_dsi_bind())

drm_bridge_attach() requires a valid drm bridge parameter. However, the
drm bridge (&dmd->bridge) that will be passed, is not yet initialized since
the dw_mipi_dsi_probe() has not yet returned. This call will fail with a
fatal error (invalid bridge) causing the panel to not be probed again.

To simplify the issue: drm_bridge_attach() depends on the result pointer
of dw_mipi_dsi_probe().
While, if the dsi probe is deferred, drm_bridge_attach() is called before
dw_mipi_dsi_probe() returns.

drm_bridge_attach+0x14/0x1ac
dw_mipi_dsi_bind+0x24/0x30
dw_mipi_dsi_rockchip_bind+0x258/0x378
component_bind_all+0x118/0x248
rockchip_drm_bind+0xb0/0x1f8
try_to_bring_up_aggregate_device+0x168/0x1d4
__component_add+0xa4/0x170
component_add+0x14/0x20
dw_mipi_dsi_rockchip_host_attach+0x54/0x144
dw_mipi_dsi_host_attach+0x9c/0xcc
mipi_dsi_attach+0x28/0x3c
ltk050h3146w_probe+0x10c/0x1a4
mipi_dsi_drv_probe+0x20/0x2c
really_probe+0x148/0x2ac
__driver_probe_device+0x78/0x12c
driver_probe_device+0xdc/0x160
__device_attach_driver+0xb8/0x134
bus_for_each_drv+0x80/0xdc
__device_attach+0xa8/0x1b0
device_initial_probe+0x14/0x20
bus_probe_device+0xa8/0xac
device_add+0x5cc/0x778
mipi_dsi_device_register_full+0xd8/0x198
mipi_dsi_host_register+0x98/0x18c
__dw_mipi_dsi_probe+0x290/0x35c
dw_mipi_dsi_probe+0x10/0x6c
dw_mipi_dsi_rockchip_probe+0x208/0x3e4
platform_probe+0x68/0xdc
really_probe+0x148/0x2ac
__driver_probe_device+0x78/0x12c
driver_probe_device+0xdc/0x160
__device_attach_driver+0xb8/0x134
bus_for_each_drv+0x80/0xdc
__device_attach+0xa8/0x1b0
device_initial_probe+0x14/0x20
bus_probe_device+0xa8/0xac
deferred_probe_work_func+0x88/0xc0
process_one_work+0x138/0x260
worker_thread+0x32c/0x438
kthread+0x118/0x11c
ret_from_fork+0x10/0x20
---[ end trace 0000000000000000 ]---

Fix this by initializing directly the dmd pointer in dw_mipi_dsi_probe(),
which requires also initializting the dmd->bridge attributes that are
required in drm_bridge_attach() before calling mipi_dsi_host_register().

Signed-off-by: Farouk Bouabid <farouk.bouabid@theobroma-systems.com>
---
 drivers/gpu/drm/bridge/imx/imx93-mipi-dsi.c   |  4 +-
 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c | 42 ++++++++++---------
 drivers/gpu/drm/meson/meson_dw_mipi_dsi.c     |  8 ++--
 .../gpu/drm/rockchip/dw-mipi-dsi-rockchip.c   |  5 +--
 drivers/gpu/drm/stm/dw_mipi_dsi-stm.c         |  5 +--
 include/drm/bridge/dw_mipi_dsi.h              |  5 ++-
 6 files changed, 35 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/bridge/imx/imx93-mipi-dsi.c b/drivers/gpu/drm/bridge/imx/imx93-mipi-dsi.c
index 3ff30ce80c5b..469976ad3b19 100644
--- a/drivers/gpu/drm/bridge/imx/imx93-mipi-dsi.c
+++ b/drivers/gpu/drm/bridge/imx/imx93-mipi-dsi.c
@@ -881,8 +881,8 @@ static int imx93_dsi_probe(struct platform_device *pdev)
 	dsi->pdata.priv_data = dsi;
 	platform_set_drvdata(pdev, dsi);
 
-	dsi->dmd = dw_mipi_dsi_probe(pdev, &dsi->pdata);
-	if (IS_ERR(dsi->dmd))
+	ret = dw_mipi_dsi_probe(pdev, &dsi->pdata, &dsi->dmd);
+	if (ret < 0)
 		return dev_err_probe(dev, PTR_ERR(dsi->dmd),
 				     "failed to probe dw_mipi_dsi\n");
 
diff --git a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
index 824fb3c65742..306cba366ba8 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
@@ -1184,18 +1184,19 @@ static void dw_mipi_dsi_debugfs_remove(struct dw_mipi_dsi *dsi) { }
 
 #endif /* CONFIG_DEBUG_FS */
 
-static struct dw_mipi_dsi *
-__dw_mipi_dsi_probe(struct platform_device *pdev,
-		    const struct dw_mipi_dsi_plat_data *plat_data)
+int __dw_mipi_dsi_probe(struct platform_device *pdev,
+		    const struct dw_mipi_dsi_plat_data *plat_data, struct dw_mipi_dsi **dsi_p)
 {
 	struct device *dev = &pdev->dev;
 	struct reset_control *apb_rst;
 	struct dw_mipi_dsi *dsi;
 	int ret;
 
-	dsi = devm_kzalloc(dev, sizeof(*dsi), GFP_KERNEL);
-	if (!dsi)
-		return ERR_PTR(-ENOMEM);
+	*dsi_p = devm_kzalloc(dev, sizeof(*dsi), GFP_KERNEL);
+	if (!*dsi_p)
+		return -ENOMEM;
+
+	dsi = *dsi_p;
 
 	dsi->dev = dev;
 	dsi->plat_data = plat_data;
@@ -1203,13 +1204,13 @@ __dw_mipi_dsi_probe(struct platform_device *pdev,
 	if (!plat_data->phy_ops->init || !plat_data->phy_ops->get_lane_mbps ||
 	    !plat_data->phy_ops->get_timing) {
 		DRM_ERROR("Phy not properly configured\n");
-		return ERR_PTR(-ENODEV);
+		return -ENODEV;
 	}
 
 	if (!plat_data->base) {
 		dsi->base = devm_platform_ioremap_resource(pdev, 0);
 		if (IS_ERR(dsi->base))
-			return ERR_PTR(-ENODEV);
+			return -ENODEV;
 
 	} else {
 		dsi->base = plat_data->base;
@@ -1219,7 +1220,7 @@ __dw_mipi_dsi_probe(struct platform_device *pdev,
 	if (IS_ERR(dsi->pclk)) {
 		ret = PTR_ERR(dsi->pclk);
 		dev_err(dev, "Unable to get pclk: %d\n", ret);
-		return ERR_PTR(ret);
+		return ret;
 	}
 
 	/*
@@ -1233,14 +1234,14 @@ __dw_mipi_dsi_probe(struct platform_device *pdev,
 		if (ret != -EPROBE_DEFER)
 			dev_err(dev, "Unable to get reset control: %d\n", ret);
 
-		return ERR_PTR(ret);
+		return ret;
 	}
 
 	if (apb_rst) {
 		ret = clk_prepare_enable(dsi->pclk);
 		if (ret) {
 			dev_err(dev, "%s: Failed to enable pclk\n", __func__);
-			return ERR_PTR(ret);
+			return ret;
 		}
 
 		reset_control_assert(apb_rst);
@@ -1255,19 +1256,20 @@ __dw_mipi_dsi_probe(struct platform_device *pdev,
 
 	dsi->dsi_host.ops = &dw_mipi_dsi_host_ops;
 	dsi->dsi_host.dev = dev;
+	dsi->bridge.driver_private = dsi;
+	dsi->bridge.funcs = &dw_mipi_dsi_bridge_funcs;
+	dsi->bridge.of_node = pdev->dev.of_node;
+
 	ret = mipi_dsi_host_register(&dsi->dsi_host);
 	if (ret) {
 		dev_err(dev, "Failed to register MIPI host: %d\n", ret);
 		pm_runtime_disable(dev);
 		dw_mipi_dsi_debugfs_remove(dsi);
-		return ERR_PTR(ret);
+		return ret;
 	}
 
-	dsi->bridge.driver_private = dsi;
-	dsi->bridge.funcs = &dw_mipi_dsi_bridge_funcs;
-	dsi->bridge.of_node = pdev->dev.of_node;
 
-	return dsi;
+	return 0;
 }
 
 static void __dw_mipi_dsi_remove(struct dw_mipi_dsi *dsi)
@@ -1301,11 +1303,11 @@ EXPORT_SYMBOL_GPL(dw_mipi_dsi_get_bridge);
 /*
  * Probe/remove API, used from platforms based on the DRM bridge API.
  */
-struct dw_mipi_dsi *
-dw_mipi_dsi_probe(struct platform_device *pdev,
-		  const struct dw_mipi_dsi_plat_data *plat_data)
+int dw_mipi_dsi_probe(struct platform_device *pdev,
+		  const struct dw_mipi_dsi_plat_data *plat_data,
+		  struct dw_mipi_dsi **dsi_p)
 {
-	return __dw_mipi_dsi_probe(pdev, plat_data);
+	return __dw_mipi_dsi_probe(pdev, plat_data, dsi_p);
 }
 EXPORT_SYMBOL_GPL(dw_mipi_dsi_probe);
 
diff --git a/drivers/gpu/drm/meson/meson_dw_mipi_dsi.c b/drivers/gpu/drm/meson/meson_dw_mipi_dsi.c
index e5fe4e994f43..b103f3e31f2a 100644
--- a/drivers/gpu/drm/meson/meson_dw_mipi_dsi.c
+++ b/drivers/gpu/drm/meson/meson_dw_mipi_dsi.c
@@ -262,6 +262,7 @@ static int meson_dw_mipi_dsi_probe(struct platform_device *pdev)
 {
 	struct meson_dw_mipi_dsi *mipi_dsi;
 	struct device *dev = &pdev->dev;
+	int ret;
 
 	mipi_dsi = devm_kzalloc(dev, sizeof(*mipi_dsi), GFP_KERNEL);
 	if (!mipi_dsi)
@@ -315,10 +316,9 @@ static int meson_dw_mipi_dsi_probe(struct platform_device *pdev)
 	mipi_dsi->pdata.priv_data = mipi_dsi;
 	platform_set_drvdata(pdev, mipi_dsi);
 
-	mipi_dsi->dmd = dw_mipi_dsi_probe(pdev, &mipi_dsi->pdata);
-	if (IS_ERR(mipi_dsi->dmd))
-		return dev_err_probe(dev, PTR_ERR(mipi_dsi->dmd),
-				     "Failed to probe dw_mipi_dsi\n");
+	ret = dw_mipi_dsi_probe(pdev, &mipi_dsi->pdata, &mipi_dsi->dmd);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "Failed to probe dw_mipi_dsi\n");
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
index 6396f9324dab..4df32747476c 100644
--- a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
@@ -1457,9 +1457,8 @@ static int dw_mipi_dsi_rockchip_probe(struct platform_device *pdev)
 	if (IS_ERR(phy_provider))
 		return PTR_ERR(phy_provider);
 
-	dsi->dmd = dw_mipi_dsi_probe(pdev, &dsi->pdata);
-	if (IS_ERR(dsi->dmd)) {
-		ret = PTR_ERR(dsi->dmd);
+	ret = dw_mipi_dsi_probe(pdev, &dsi->pdata, &dsi->dmd);
+	if (ret < 0) {
 		if (ret != -EPROBE_DEFER)
 			DRM_DEV_ERROR(dev,
 				      "Failed to probe dw_mipi_dsi: %d\n", ret);
diff --git a/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c b/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c
index d5f8c923d7bc..44dbbfc277d8 100644
--- a/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c
+++ b/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c
@@ -518,9 +518,8 @@ static int dw_mipi_dsi_stm_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, dsi);
 
-	dsi->dsi = dw_mipi_dsi_probe(pdev, &dw_mipi_dsi_stm_plat_data);
-	if (IS_ERR(dsi->dsi)) {
-		ret = PTR_ERR(dsi->dsi);
+	ret = dw_mipi_dsi_probe(pdev, &dw_mipi_dsi_stm_plat_data, &dsi->dsi);
+	if (ret < 0) {
 		dev_err_probe(dev, ret, "Failed to initialize mipi dsi host\n");
 		goto err_dsi_probe;
 	}
diff --git a/include/drm/bridge/dw_mipi_dsi.h b/include/drm/bridge/dw_mipi_dsi.h
index 65d5e68065e3..f073e819251e 100644
--- a/include/drm/bridge/dw_mipi_dsi.h
+++ b/include/drm/bridge/dw_mipi_dsi.h
@@ -76,9 +76,10 @@ struct dw_mipi_dsi_plat_data {
 	void *priv_data;
 };
 
-struct dw_mipi_dsi *dw_mipi_dsi_probe(struct platform_device *pdev,
+int dw_mipi_dsi_probe(struct platform_device *pdev,
 				      const struct dw_mipi_dsi_plat_data
-				      *plat_data);
+				      *plat_data,
+					  struct dw_mipi_dsi **dsi_p);
 void dw_mipi_dsi_remove(struct dw_mipi_dsi *dsi);
 int dw_mipi_dsi_bind(struct dw_mipi_dsi *dsi, struct drm_encoder *encoder);
 void dw_mipi_dsi_unbind(struct dw_mipi_dsi *dsi);
-- 
2.34.1

