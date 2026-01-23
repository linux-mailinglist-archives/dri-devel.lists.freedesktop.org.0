Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UGcyFjKMc2l0xAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 15:56:50 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8C25774BE
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 15:56:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35D7510E2CE;
	Fri, 23 Jan 2026 14:56:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="JFleWCRI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazon11013013.outbound.protection.outlook.com [40.107.159.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA53610E2CE
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jan 2026 14:56:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NrK05cZqzbLg5JAmKgvzTc75yOuVcx2EiKoKpw6jGDGtXyiCo8NgfDxEIJxw6LLryxrMovHOBCgaxtgwW07X1OGwsw+6hGoq80gpEwE/N9T96syNkdVqvJgSKc/aFQsXkdMAfpuxa46ANSuok/Adnh9Q09IxJl+PXtUK9+wk9XfRXSwqJkYIJsQIxd9sKPWd4St1yIvWmflP5bsjBJD6zZGjKxenOGfJtz3m7914xso8oOxYwPX9cePPY7B/wTemFXKFHzZ0Fp3JKrYrvbfD/YjioePMm0Xb0IiFBdrsyl40yWj11Tqx/0TddMFt5maStUL166CtF1IRzK00lbZjDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w66doRx5svHFjsFPlOvY7X6fpaFyqN7z5w67/3MLyak=;
 b=aoXPiRWbGCp5TZnh+JmtjSKE/ctACF/YSlfRkMDWVQv7iZ47H45Wguldbrkd1hXHT0dfe6Mc4fzYJWah1NNWPJRgcKkHQ/KhAq3GSmeUwqhYb/EJXWZDtcvUj5rPCN9VUjdmAMdXd89JZbSk8nl2PjSqj62QSOFChNl0aI23kv/VI48EHJr9fQLwOTIU66T6RfA0vr93YyNCTUZS07crycmtbPGSDfOAE6X1vZVw8UC+yvlwHm561UhaX2XZykBwfxW6syQEC3GLX7HCyQjQ0AP7FiYRYDkSEXXz45tQedv+gfQGNZlIGK5wuCOC5dHV+IIXERR+iASG4r5ZJDzkFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w66doRx5svHFjsFPlOvY7X6fpaFyqN7z5w67/3MLyak=;
 b=JFleWCRIWx0Ivldkld4+H4joIuMB0GnfqgsnY1M7j9jTsxlNHSu0JlnG207RDdASmoMB/X/KYedv+UgDyZg0tU7zAOgEFDnUO/2KDcxzUhrvUews6Hj4Fp+vmLr1/JZc9nMo5cQftC6jC0eoQ7AS+QD4Ry7TEBYO4DU3j1hf0j4X8h2WDh9FougUW1wPkR+NAfCgheitUTPGCbJY+QOwA/mEIqzssqSe8ItNlvz9SnRPb6V6tTyssZ6SrBnXKWLqIsseg4TurrwDkTaNX2/EZuIk5grF/ZL26NKEbhg9BLxtoMRd8yHk/j86GkdfRNSWaMSoxca/DOCC48yQNo3qpw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8957.eurprd04.prod.outlook.com (2603:10a6:102:20c::5)
 by PA2PR04MB10159.eurprd04.prod.outlook.com (2603:10a6:102:406::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Fri, 23 Jan
 2026 14:56:42 +0000
Received: from PAXPR04MB8957.eurprd04.prod.outlook.com
 ([fe80::9c5d:8cdf:5a78:3c5]) by PAXPR04MB8957.eurprd04.prod.outlook.com
 ([fe80::9c5d:8cdf:5a78:3c5%3]) with mapi id 15.20.9499.005; Fri, 23 Jan 2026
 14:56:42 +0000
Date: Fri, 23 Jan 2026 09:56:32 -0500
From: Frank Li <Frank.li@nxp.com>
To: Liu Ying <victor.liu@nxp.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] drm/bridge: imx8qxp-pxl2dpi: Fix NULL pointer
 dereference in imx8qxp_pxl2dpi_bridge_destroy()
Message-ID: <aXOMIJCuLoLrq8BC@lizhi-Precision-Tower-5810>
References: <20260123-imx8qxp-drm-bridge-fixes-v1-0-8bb85ada5866@nxp.com>
 <20260123-imx8qxp-drm-bridge-fixes-v1-2-8bb85ada5866@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260123-imx8qxp-drm-bridge-fixes-v1-2-8bb85ada5866@nxp.com>
X-ClientProxiedBy: SJ0PR03CA0183.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::8) To PAXPR04MB8957.eurprd04.prod.outlook.com
 (2603:10a6:102:20c::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8957:EE_|PA2PR04MB10159:EE_
X-MS-Office365-Filtering-Correlation-Id: 53516af7-e775-4efd-9804-08de5a8f9eb7
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|52116014|19092799006|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?DnzgWhNqETkfj7Kp7luy1DgXS8QtlCjklNMHJC+dTvIDMJBHpayzq1nX5GU+?=
 =?us-ascii?Q?OJiAJF0hG89PPl8d0HwW/zUWujbbA25r1WdRa4EYwuYvf3PpOm4uPwZEgWmq?=
 =?us-ascii?Q?BvY2hLfq7rs2ZsQmCPVIaCYh59GsU8PPmApbyBzn6rmNF5xnYG7mF1ARplgi?=
 =?us-ascii?Q?kTbOQR1Fa1gUU62soUrPxjDupzhj0ofEIxw70xiDgMzE2KdFsJO/8ZhHBPLU?=
 =?us-ascii?Q?qGA8LLoIaNTLSSmDNSiRKKspJykF6rbZXKDBfKfnxl3WcmdPQIjrXw9OqlL+?=
 =?us-ascii?Q?MZKTXXYNC4aTnvMqh6eCG+y7KyLWyZUBxR7Z/E2pWHhu8JPoYjLkiVcBL8v5?=
 =?us-ascii?Q?ExkiMUqNiQCpRglcNzoXdd+WkTlRu15l007MNYeyOzeOctNvVmw7jnuTBmpB?=
 =?us-ascii?Q?Z4JYh0qOT097nj028/7gDCxKI/KPgdL0a8zuWjNS5lIrGCdNeU7KUkpIU+kc?=
 =?us-ascii?Q?P5TgxcnnKTujhiUOW6cWx5I7vcxwtgZpvmEPZPGCGw3VNNokZ3Q44MHxiugk?=
 =?us-ascii?Q?FWJE0RkXWk3vHYe10M0oSjYz7oBd1cTQJWEdJqEZ+garlNU7tX4LsnVe+0LN?=
 =?us-ascii?Q?7he3W1JLotRX/6X6FJXYcZuVFTbN+WvVrKums1TTF+kKw8huPcttvxT5oNQv?=
 =?us-ascii?Q?Maz4N40lEVGlQr9qjQsapkt6Myr4j3XmrSLgQ6hg/iYFI9YFd22CDldaUXeM?=
 =?us-ascii?Q?Utc1HCb4qOgyToVSYSxDGWWKkzJ34vcDHjIcpZ3WGJN+mWp0/35GOF1XyZqY?=
 =?us-ascii?Q?I/YYzxFo12RwPS7BihN5zb9p2eDyP2HkP+1B7nzF5gqGRMZfrVeQNjuPu20D?=
 =?us-ascii?Q?KA6r8Vt9Nt4lJKwJWZaacgc/dGOzrJ2aezhGxP/+aydZsJ2CacVvubS0Xumr?=
 =?us-ascii?Q?ZrFQfBpXGUpfFB1qJVdslabVja6A2be3wVBUUwxVOoeutCo3+r0zK5URHGRX?=
 =?us-ascii?Q?Af0GI97JyvwlHRJVlZblmW+NXL050FXlv24Jmg3x7D7FhF7BsVkJPe5kXcpr?=
 =?us-ascii?Q?KPSSUP/Xo0oEFHQ3GJKvZorM7XV4PQ4uyNTS2GRzTqB4mXcri1lPNhQ+tcZC?=
 =?us-ascii?Q?qcgVF+y7M+ub6CZvsPs/2RsjOqJrCgN4Of6v2uECSosJYP53f8dSX+ZNu/uQ?=
 =?us-ascii?Q?uwXxCW7K/RcLAf6+RdHf/hIXYfIWgx5CpAruWn40mpWBm7jnOKI5UP9P3tQ9?=
 =?us-ascii?Q?7SokxL6XLowwjutXpP50UudizXibnvsNuRqoiiaf0ToHGa96bUR52OPQ0GhI?=
 =?us-ascii?Q?NvvCxX6cccOBr1+KMKOcuESGNWVRmzKovNCXdFqquqDfjllTq8gEQCdBHt9U?=
 =?us-ascii?Q?dR6ODp/y4s17aiHL2FhteyxtUCaMgqLo1a65cz7y0wIpVaxBajtT/nKvJ4SQ?=
 =?us-ascii?Q?4gd1BhhPa3Z8dT7gu5LUqVOIkaZXi4Ew4WEM45NxOOptBmMUXE6FFQdCiVyB?=
 =?us-ascii?Q?Da8rHSkwzoTCTfKbfxZtHp7XfKLRaMZg1Vx/WPLI+ebJWNta504Te/qeFcF6?=
 =?us-ascii?Q?uLO6Du6R2cYauhIam4d/A7RnMQsqxIjS/e9CfveBjmvbXhJjHmRFi+x1BVl+?=
 =?us-ascii?Q?3Cb3LTyynFzpEvWVRlmKb4jqYYh2bggT90Hkybt06DcIblnp+dyrgWWJgLG/?=
 =?us-ascii?Q?uPTs2bJhSBon9rrA14q/FOE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB8957.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(52116014)(19092799006)(1800799024)(366016)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oVrlLuc+KWUfHwV3bg95cXWLgz9bjK8c79DTjbAC9/tib31kwCAvPXhW+Ps+?=
 =?us-ascii?Q?Ld684Ai10c5WydWG6ZGcBB9AAsuAnA7cYopu77PjJorQZbjej45A/0gDLq1H?=
 =?us-ascii?Q?ETjQ1EnFDa4+4EWZJulCGs2uOZOHQ4l0PzXKngwMFRhwjEA8C9t/WLOYWGfY?=
 =?us-ascii?Q?5+oRpTNcFEX/d5fl+UGSvjHnJlDxwMHilNtuXxcHZAVSHOu6nQsRu8Bn5+fP?=
 =?us-ascii?Q?687KN46XHayFsWUU/GLT6PO5GNgnwqx7/R0745XTOrkAtDE2vuh0RH2ETtRe?=
 =?us-ascii?Q?cxd1bJnZzNKdCU3x3bYQP4cPCRIXgwp0I6T6uNMl8r0WuM2AF+2QPNSY/mmE?=
 =?us-ascii?Q?BUyfc3kCuUWd2b+/p762ciAYffvJwJ4Dae2yWBPbmqnr8AKB+Mqxs3vjcsbL?=
 =?us-ascii?Q?/L+b7Vif9EajJvU7AT2QeNnmRZR7C+OCIUmfFTa3Ryt2llWBjC7C8wt323uQ?=
 =?us-ascii?Q?2/iO6whRXXs70cPNkQ/YrqX7xg75+bZB1UdZD6iIdcV1n6VUDj2Hcp7vFcvM?=
 =?us-ascii?Q?sTAWVdcocbGRJ7U8GTEkF6NjQDa9hOJ+I71YUI4KC1+M5+pO0f9M2ECBN2IB?=
 =?us-ascii?Q?mGK7XoYzkH9fo+uuop7a5Xs2AWPZJfTuXlsk0/tYfB9CEy1EGS/CZlpqpZvL?=
 =?us-ascii?Q?lCgZd4eRnBWhE+RUlY7I7ZoZ4q5Hm+KsL1Tp3THrbR2t8WULKi+wut9EVqfx?=
 =?us-ascii?Q?UFwOg6xoUy+ZtLjG/saxDLIUqe/xW/4gwkDAkWYcJuif4I3JJ5Dx9JpSgHwE?=
 =?us-ascii?Q?I2u0fA2NQNwRJ8CjzoggEs9IymfCRan85/aldh9NnvCMfKQ0lKd6jO//F7u1?=
 =?us-ascii?Q?/AI/RKbWRsnMGyTn4iwllnWI/NckdRLZwUAWDf4w2JnyT8AnC2LgPmSNCXRb?=
 =?us-ascii?Q?mrTfCDSM+zxK2urcT1+y3fsxm1O7YLrUrQ/OF7D2UFNOhsjHiNOuzWCZbqdj?=
 =?us-ascii?Q?dQjg6l6Hu8fwynf51nNTDFjJldyOuoUkIgLnlZQK0aFe5MJ2kTCZvg8xLunl?=
 =?us-ascii?Q?kOGOgtRUOIdHdY5BceIoFPJ0wqqcWc/W329EpwyMvX9VqtXq/8EEnVwTai21?=
 =?us-ascii?Q?SnQ/sCAJbVfQRDt++wvJ1N68SNtZQbMvUckMfsN8MDzib+qTsHuT5fipwf54?=
 =?us-ascii?Q?JArfTvH0aL6sk4Z+nYXRfhlNQ5rZgmFJE5mNsSC73Fy98y9UO6N8hUoF3Bcb?=
 =?us-ascii?Q?Ekz/xdSoqg4w05nYlHuoTgKdDeINxB1yGYXZJxf1Z40xwFJoQDqg9Z7Aqweo?=
 =?us-ascii?Q?EJSKK41vvzf6rCB3SToTWeVNxeH+tU7dCw/BOtm4JpPLTd/+0atQmklY7oeY?=
 =?us-ascii?Q?JAzQjkMFJP4InGVCK7ehHAAmRdH++cYxSPm0wuLUkDNq+aLopMEiyR89ayNf?=
 =?us-ascii?Q?SE3gWN0tclgmCXp/DOhKvzqA4HzN1kIlLSBp/e168mRKozPiRYU2tUDGHK32?=
 =?us-ascii?Q?pizAQhpB/xy+iA+pLe0D4xCxjXFU2Kk+44DHfQ4CWddssWUIQM8q3+YeFbK9?=
 =?us-ascii?Q?arsYgGUxPMhC4O6Pj8nwh+vLWp0jkgdiF02Ty4yi5WMFo7M11S7P8tVfGDOp?=
 =?us-ascii?Q?wH83+wJYVJN/bgwLtgqfzGyl9jSv4oMum3mLXSaD3od2ptitEzynsZeqw9Ar?=
 =?us-ascii?Q?ayNsaAcvEg48kvr2n839Sb3ZcOee1v6naz6qQ9FxdB6XSId7tg/QmovSHELX?=
 =?us-ascii?Q?T8TYZwWwtnHnBMGrcZhRxQovWjlb9ICakWHqepJ2PZ8eiPKIuvL7OlbkapZ5?=
 =?us-ascii?Q?UnUbig6IUQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53516af7-e775-4efd-9804-08de5a8f9eb7
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8957.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 14:56:42.4486 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TNxv8swLHkb3JfcpoI6V5Sfl5zop15jWLqicvtl4Fb8BQldwvsIEp7WLkot5wKrfqrxDgJLVTNhIDtJ1UqqRRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR04MB10159
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:victor.liu@nxp.com,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:luca.ceresoli@bootlin.com,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[Frank.li@nxp.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.li@nxp.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch,pengutronix.de,bootlin.com,lists.freedesktop.org,lists.linux.dev,lists.infradead.org,vger.kernel.org];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_SPAM(0.00)[0.216];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,nxp.com:email,nxp.com:dkim]
X-Rspamd-Queue-Id: C8C25774BE
X-Rspamd-Action: no action

On Fri, Jan 23, 2026 at 05:22:16PM +0800, Liu Ying wrote:
> Pointer bridge->driver_private in imx8qxp_pxl2dpi_bridge_destroy()
> is NULL when imx8qxp_pxl2dpi_bridge_probe() returns error, because
> the pointer is initialized only when imx8qxp_pxl2dpi_bridge_probe()
> returns 0.  The NULL pointer would be set to pointer p2d and then
> NULL pointer p2d would be dereferenced.  Fix this by returning early
> from imx8qxp_pxl2dpi_bridge_destroy() if !p2d is true.
>
> Fixes: 900699ba830f ("drm/bridge: imx8qxp-pxl2dpi: get/put the companion bridge")
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c b/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c
> index f0814702b641..9dc2b3d2ecef 100644
> --- a/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c
> +++ b/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c
> @@ -67,6 +67,9 @@ static void imx8qxp_pxl2dpi_bridge_destroy(struct drm_bridge *bridge)
>  {
>  	struct imx8qxp_pxl2dpi *p2d = bridge->driver_private;
>
> +	if (!p2d)
> +		return;
> +
>  	drm_bridge_put(p2d->companion);
>  }
>
>
> --
> 2.43.0
>
