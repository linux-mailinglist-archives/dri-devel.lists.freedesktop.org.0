Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D522B8A5CF
	for <lists+dri-devel@lfdr.de>; Fri, 19 Sep 2025 17:42:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 859F010EA35;
	Fri, 19 Sep 2025 15:42:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="aGN6HhD1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazon11013025.outbound.protection.outlook.com
 [40.107.162.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B61A10EA35
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Sep 2025 15:42:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cOzP5bEYj4elSHhf32dvsIUXf4BRX113arVx4aBsd2GQiQEi1yiddPAa0k2UHeDCgo7AvJZCssO/2JAfUiYps2xFna4U5mqL2H3aF7wK61eDQ1DN7YYfjVfD/f3f3Yn+usTAb+GnsY5ptHwhLUwGZ9GtB22oOnbdJq9flLYZMUPvAhsaeKkkdCk1e/2ZROoFcg3DLL18uvJOHFAZ23p6R+dw72C+Ste+Xf7BhRsR2gIMrdmuzMZ9wAjqh40AnvHwsx58tVjHWynhcD2KnklnmPD6xueNuMyKjNhKEdmceU6Vxlh5YHskBy0rO1+v2Wdu85yD0j1XS4DlWIzeSJLZHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b9dRhHSXL0wMw/ljVz3n2rP4K/yEet3akWmBDVqmHiU=;
 b=yk9JP1bTP55ZOuRWZQGksaMS6wUL5S8rqTLZZHddul1ESkpZRx2Qur4kEzMW4kqbjsyiYYJsadA2+XQrIyxM5f4U2SXTyUjB/ogkekpQVg5b6eMduipfly88mPkVtsCMCwsSEdhTmqZddVEQ7Xc9COjcLP8Kx2uHqbjUB+f/EKsbTDknG/mRBbMFHaaO4co2Yt9QJaRONTENTIX0qOZwZtbzWfapr0kCBpp2Tl/v2NCI/Twavc7DLmll2lStSr3b+BWGkUcemJrjxyCHSP7PjuVFIwWjWXrh+a9WB2JX+ZRQOK5IHXOJuZ4rW9lnItmk/QYPIngJFDuY3u9eI/r26g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b9dRhHSXL0wMw/ljVz3n2rP4K/yEet3akWmBDVqmHiU=;
 b=aGN6HhD1jVIw1ogSduU1yZhlEkQACDstKP0jcSazGynd4gj92bUkj1Lvs4s2zMiIvq69XbGxUNygf+vTNv5gkfh+QBpQNd/ZuGTeEyw1fvb8sVsn/lMbaXixsJsms16Ob6ltXi8O4gvVBPmMa2KD4CAWXUvFjp7OQpiPwIBC1Gb2ny/guAanNnmzWZl3wJs8AUqLsdQrHdWoTyc6c/HopX/OmUTbfnwgABQejrF608PmVNHnxVhxp1RwaVYQbYNVH2zo9SlXPTrXj+g/ahpPijR86W+3Y+WSE0NbjDug6HGiXjBBLGHpfwVXe2yhVxYP9qj4k12oLfHfWcCkte/vRg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com (2603:10a6:102:23f::21)
 by AM9PR04MB8456.eurprd04.prod.outlook.com (2603:10a6:20b:3df::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.16; Fri, 19 Sep
 2025 15:42:09 +0000
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15]) by PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15%6]) with mapi id 15.20.9137.015; Fri, 19 Sep 2025
 15:42:09 +0000
Date: Fri, 19 Sep 2025 11:41:59 -0400
From: Frank Li <Frank.li@nxp.com>
To: Liu Ying <victor.liu@nxp.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 14/14] drm/imx: dc: Use prefetch engine
Message-ID: <aM15xwZvPRw8WOCD@lizhi-Precision-Tower-5810>
References: <20250704-imx8-dc-prefetch-v1-0-784c03fd645f@nxp.com>
 <20250704-imx8-dc-prefetch-v1-14-784c03fd645f@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250704-imx8-dc-prefetch-v1-14-784c03fd645f@nxp.com>
X-ClientProxiedBy: SJ0PR03CA0238.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::33) To PAXSPRMB0053.eurprd04.prod.outlook.com
 (2603:10a6:102:23f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXSPRMB0053:EE_|AM9PR04MB8456:EE_
X-MS-Office365-Filtering-Correlation-Id: 58fe4424-5722-44b8-1feb-08ddf793180f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|7416014|376014|19092799006|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?gme6RwRfsdfWwbyt99eRKn3Lky5fHNmqI1S0sMLZkWL24n8h0Tmg4KJuaD+Z?=
 =?us-ascii?Q?4+ZtEAw0HJNUXKN6QZNRjJ0e2mfrcTMnpCp+m+0+nppkxSfgcqq7HgfRlfMA?=
 =?us-ascii?Q?ZXwnVLiaWWNxxTMzCtz23sp9l7cqihqBB0pWLA9LkYuuquMqHbei8Bz86gjW?=
 =?us-ascii?Q?ypI0UlnXyDJS6rsG44KGhr+iVh7IAC4xUkLxYgsjSBOhPY2jZBwvaGFQg6zm?=
 =?us-ascii?Q?V12V+TsGws0U+PMGaZhFe3nMl6MlSIVTljT3rb49oBXJ3uh3Sb7hkv052pQx?=
 =?us-ascii?Q?aliWSPYIVjPumWFnZ7lPcwvItGVo2CJCbuPRuJpP756mJ+LQVBYo/cIkApz6?=
 =?us-ascii?Q?nrQXzVfzbMg8KygxMlokLB91Hi3OghVks8N6Ox+FfnHSmlrxzI48m4s+z0AL?=
 =?us-ascii?Q?DTQRfGUA8YruSWET4f+M/172OvmEd+H06Sb33ONNmyqWX9kZpMav4oDkWq4B?=
 =?us-ascii?Q?KxRROA3cnnOvWLSV4hbRvD6ojl6oIa9VdhT0cfngV6OdIUKYCuIEtinFVu3G?=
 =?us-ascii?Q?+fHw4x4ll9zBrFrYh8b0M32IEEGJ44U8xsAYksyKO5EaI1bY9WkZBm1HKwf0?=
 =?us-ascii?Q?IHobi89Me6w+f+1xfKi7WKvZWtViihmlQIJD7z4qJmgjc0awDx+LjIFArmZ4?=
 =?us-ascii?Q?+1UStXTxGCZFG2cDKPv6f+DV4q6CeqMCLHR9QoBrXNlZOjbQs3q2uCgYIviA?=
 =?us-ascii?Q?f9dVfHi3ei5dEbcotqzKPf14Dyv6bK1zJb93Z3P8ifRGLnk8Xonxbob2EX8+?=
 =?us-ascii?Q?n8Eu9jKeHKxdejmEw5roqo717ypU6a9kZ6BqZLOdDgFD+ccKn/AK5bQ3jbTk?=
 =?us-ascii?Q?8UQPo+6K1lsPJcjmjpL32q1nE0mtRx3+TV8LEUe36I9JknZ13ICmty+sVC+M?=
 =?us-ascii?Q?wEGrKn9x8WThy7AM4zT991OTu1GQAmI3lhVhDJVyU/LlEZpq/nffa74tpCJS?=
 =?us-ascii?Q?v424WB1TbwZFgiF6eRggYdqgGjRm0UTtk/skGxLjsKjLYF5JjruPgtx36D+b?=
 =?us-ascii?Q?KyzALYkliGP4rYfaH7pHVcEVyFW5rbWAvqKgcdo7254qBCv9FK0rZ09wNTuN?=
 =?us-ascii?Q?OPzCbube0yVElL5zc35Op+y+c5T3OYZ2Gnq3qT7Aeby4+rcVI4l7rdKQ4/18?=
 =?us-ascii?Q?iazSejxlQLr3TSoCl3lvh74y8i57/xgAtuUhCoOKbJ/hIgZzxKu6gWAdlgeE?=
 =?us-ascii?Q?VtwFlug0JuQbR7XcrifQuEEbg1OmSkU5sDnQh7o9hmmzG7VVQtrjDg1i249u?=
 =?us-ascii?Q?bqGaW4Mv1JPDWfXFlcvoGDDMl1C03brDbK5pFNZfjlsJTwAfgiyxWaXD5BJH?=
 =?us-ascii?Q?RnJnzA7sDNL8l6lpZ4QbxeNtugvpLcWKUquS7bbWeZFsJBX3TyDlQoU4kNy+?=
 =?us-ascii?Q?WgNQ7RWDDAsmvFR4o945wtzzNIrv1CSx+WqtB6fR0CekjyfJBa7XyFQQuLSl?=
 =?us-ascii?Q?RN4gJZLYg6nu9LqSXxq0WZxPg6Z4YJL/wg5OI8g4NUEiMxlJnxXaQw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXSPRMB0053.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(7416014)(376014)(19092799006)(1800799024)(366016)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FHGfW+R8inU6fuM/SspmYVtzYXodnAEH5CBCnuvcFWsnYWWzsoBFPemiX5hP?=
 =?us-ascii?Q?JuobhPR2aHzjyTV/qjYGNPWIn8VJVVtaaBpXllmVR3PoS+ey2na/arjGHiGU?=
 =?us-ascii?Q?kpZuwlGxTt/btByvb9K2t8nXOG+azVscbSNIKiVENrmJyK6KvhC7Z0PNv0OU?=
 =?us-ascii?Q?dmqK81B20mOeCbuiPmaX4RRcmemicg3WojL2tjYTcuUNnexfK8ogckBDVlVg?=
 =?us-ascii?Q?pgN5UN776acopWNywOE+QRjqsKCC8MD9B58ai7qvxQF8xusEKMYTePAz5Sov?=
 =?us-ascii?Q?O3AYJ0AdcfRsGmS7rzYCk26ZfnaudegOok7ayw0Csy5eL7OboetkHkcDaEzz?=
 =?us-ascii?Q?rnWdukC+Dqx5crqvMZFvR68jxD6AxhFvAz4rb71hN6nP4gBQ4RDm2xDdkwTf?=
 =?us-ascii?Q?Eh1DczpR/q2k2s6lkyBM1nBAAr7PnL08+4nZWxgMTKP1ICYgvGF5/i3t9N5l?=
 =?us-ascii?Q?kRhcgjSWvVVKZPtHfLJbI4z3RfDhAYLNH1ejkwvR8kDLnvRtDtbVSfTo0fUg?=
 =?us-ascii?Q?AKDRWirGYwBo86rekTEYEgT9hGsG2tsPdwncccS7A4z9L1TtzaztioIIrYyS?=
 =?us-ascii?Q?95wgakEwAXavFXqsTNI0b5vWYM02d61cC67CemZqixtqLAHgH5z8mqhEGdqo?=
 =?us-ascii?Q?Sf0N2XaOA2/Txr4//gy66VPNy/gjJ6xDcT5//VfW0gLI97r4egdUZSyMYRMe?=
 =?us-ascii?Q?0dIK96MlotmNhF8TDI6lMFwnLWVXpnQxC8k33vqIpRBQX3GcYB01zHJkWoGi?=
 =?us-ascii?Q?OdOzzrcdRgu3IdTabjMjcyXzE09ICOtC0zDfV6q8NBMgnocxL9jXv0XymWdY?=
 =?us-ascii?Q?/AkWHTrwbsVdrQaKPuSs7T32plO1Z9JUBJs4V6stkHMUhL8q4wY0U+8Dsp7f?=
 =?us-ascii?Q?rYAMGQM1oA22NTMRawn63knQFckI+yt1CUqPGNy2LbU+Ey1dZPoI5JmHcMcd?=
 =?us-ascii?Q?T+TNHPMDbi5QU3rM26IBATQAuh14pDhgyvgO8ZOVRQ1ACJzda9cPLnyoLVt7?=
 =?us-ascii?Q?zlNYfjrUsc522dIqozGferazTVNwIuogBuQxTw3ZQVebSgB5i5tktIw/0qcN?=
 =?us-ascii?Q?3nev2uAo+ZBW49jd4KaRh7XSXotdRQ/oy58eMu6FX/VqAI9b92fQD8cbbhjz?=
 =?us-ascii?Q?oXOG3VwoLN1pvxOLraG8tXfojDkUv97SyWUwxnNFBkbM0jR9WoS/K7rxzXeg?=
 =?us-ascii?Q?xvun7vGbG+nRjmWaQnkqnbD2IU9qGa8jVb9GIDp+5HxRODOFvFP7E6YvA8Jy?=
 =?us-ascii?Q?t4zc5d6eIX+J/SVBAYDTc6+JAllQg4lgmTIezgSBQffo+XQogKyvR3rFxdPG?=
 =?us-ascii?Q?DYNU80RGhwLs3cfhLiPnS0P72tUXjzsbsBUcTCZvPZ9DzOi2vRXf6S2cbkCB?=
 =?us-ascii?Q?uSIAmrq9rEQ0191Jw8lkIsw/A527VPEM8x+5f+Fvlzp7oggauFUsN47I2XeJ?=
 =?us-ascii?Q?i6dK6h16UglbHYTGpKu7cDHr/LAX71TkHZDXeGC58Fz1nBAH2HtkLdmw34tF?=
 =?us-ascii?Q?j788UmXltkX7lE47OnlOAUjMe/OgXIpaLx74iQFcqghH45kWdy6oYm532aEX?=
 =?us-ascii?Q?ngbrx6wWLi9CF2WYs68=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58fe4424-5722-44b8-1feb-08ddf793180f
X-MS-Exchange-CrossTenant-AuthSource: PAXSPRMB0053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2025 15:42:09.4978 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n26kJHJXEGJvJ2LAdIe3kXo5T2lq4YE62NxRWZCjS1W3OioPhC5ZNSk6nNbrUPTwrTz+Kq+PaKf+q9HsOX2m8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8456
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

On Fri, Jul 04, 2025 at 05:04:01PM +0800, Liu Ying wrote:
> One prefetch engine consists of one DPR channel and one or two PRGs.
> Each PRG handles one planar in a pixel format.  Every FetchUnit used
> by KMS may attach to a PRG and hence use a prefetch engine.  So, to
> simplify driver code, always use prefetch engines for FetchUnits in
> KMS driver and avoid supporting bypassing them.  Aside from configuring
> and disabling a prefetch engine along with a FetchUnit for atomic
> commits, properly disable the prefetch engine at boot and adapt burst
> size/stride fixup requirements from PRG in FetchUnit driver.
>
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
>  drivers/gpu/drm/imx/dc/dc-crtc.c  | 139 +++++++++++++++++++++++++++++++++++---
>  drivers/gpu/drm/imx/dc/dc-fu.c    |  27 +++++++-
>  drivers/gpu/drm/imx/dc/dc-fu.h    |   2 +-
>  drivers/gpu/drm/imx/dc/dc-kms.h   |   5 ++
>  drivers/gpu/drm/imx/dc/dc-plane.c |  46 +++++++++++--
>  5 files changed, 197 insertions(+), 22 deletions(-)
>
> diff --git a/drivers/gpu/drm/imx/dc/dc-crtc.c b/drivers/gpu/drm/imx/dc/dc-crtc.c
> index 9e9e86cd5202bcb0bb4d5627dbcefcc3f4e2ead0..4c7aab360616cb1c84c31c83f16df703b1c2c6d7 100644
> --- a/drivers/gpu/drm/imx/dc/dc-crtc.c
> +++ b/drivers/gpu/drm/imx/dc/dc-crtc.c
> @@ -25,6 +25,7 @@
>  #include <drm/drm_vblank.h>
>
>  #include "dc-de.h"
> +#include "dc-dprc.h"
>  #include "dc-drv.h"
>  #include "dc-kms.h"
>  #include "dc-pe.h"
> @@ -204,7 +205,13 @@ dc_crtc_atomic_flush(struct drm_crtc *crtc, struct drm_atomic_state *state)
>  				drm_atomic_get_old_crtc_state(state, crtc);
>  	struct drm_crtc_state *new_crtc_state =
>  				drm_atomic_get_new_crtc_state(state, crtc);
> +	struct drm_plane_state *old_plane_state =
> +			drm_atomic_get_old_plane_state(state, crtc->primary);
> +	struct drm_plane_state *new_plane_state =
> +			drm_atomic_get_new_plane_state(state, crtc->primary);
> +	struct dc_plane *dc_plane = to_dc_plane(crtc->primary);
>  	struct dc_crtc *dc_crtc = to_dc_crtc(crtc);
> +	bool disabling_plane;
>  	int idx;
>
>  	if (drm_atomic_crtc_needs_modeset(new_crtc_state) ||
> @@ -216,13 +223,40 @@ dc_crtc_atomic_flush(struct drm_crtc *crtc, struct drm_atomic_state *state)
>
>  	enable_irq(dc_crtc->irq_ed_cont_shdload);
>
> -	/* flush plane update out to display */
> -	dc_ed_pec_sync_trigger(dc_crtc->ed_cont);
> +	disabling_plane = drm_atomic_plane_disabling(old_plane_state,
> +						     new_plane_state);
> +
> +	if (disabling_plane) {
> +		unsigned long flags;
> +
> +		dc_crtc_dbg(crtc, "disabling plane\n");
> +
> +		/*
> +		 * Don't relinquish CPU until DPRC REPEAT_EN is disabled and
> +		 * sync is triggered.
> +		 */
> +		local_irq_save(flags);
> +		preempt_disable();
> +
> +		DC_CRTC_WAIT_FOR_FRAMEGEN_FRAME_INDEX_MOVING(dc_crtc->fg);
> +		dc_dprc_disable_repeat_en(dc_plane->fu->dprc);
> +		/* flush plane update out to display */
> +		dc_ed_pec_sync_trigger(dc_crtc->ed_cont);
> +
> +		local_irq_restore(flags);
> +		preempt_enable();

preempt_enable();
local_irq_restore(flags);

look symmetry() with enter this sections.

> +	} else {
> +		/* flush plane update out to display */
> +		dc_ed_pec_sync_trigger(dc_crtc->ed_cont);
> +	}
>
>  	DC_CRTC_WAIT_FOR_COMPLETION_TIMEOUT(ed_cont_shdload_done);
>
>  	disable_irq(dc_crtc->irq_ed_cont_shdload);
>
> +	if (disabling_plane)
> +		dc_dprc_disable(dc_plane->fu->dprc);
> +
>  	DC_CRTC_CHECK_FRAMEGEN_FIFO(dc_crtc->fg);
>
>  	drm_dev_exit(idx);
> @@ -320,14 +354,33 @@ dc_crtc_atomic_enable(struct drm_crtc *crtc, struct drm_atomic_state *state)
>  	dc_crtc_queue_state_event(new_crtc_state);
>  }
>

...

> +	struct drm_crtc_state *old_crtc_state =
> +				drm_atomic_get_old_crtc_state(state, crtc);
>  	struct dc_drm_device *dc_drm = to_dc_drm_device(crtc->dev);
> +	struct dc_plane *dc_plane = to_dc_plane(crtc->primary);
>  	struct dc_crtc *dc_crtc = to_dc_crtc(crtc);
>  	int idx, ret;
>
>  	if (!drm_dev_enter(crtc->dev, &idx))
>  		goto out;
>
> -	__dc_crtc_disable_fg(crtc);
> +	enable_irq(dc_crtc->irq_dec_seqcomplete);
> +
> +	if (old_crtc_state->plane_mask)
> +		__dc_crtc_disable_fg_along_with_dprc_repeat_en(crtc);
> +	else
> +		dc_fg_disable(dc_crtc->fg);
> +
> +	DC_CRTC_WAIT_FOR_COMPLETION_TIMEOUT(dec_seqcomplete_done);
> +	disable_irq(dc_crtc->irq_dec_seqcomplete);

Are you sure irq is disabled when call this function?

Frank
> +
> +	if (old_crtc_state->plane_mask)
> +		dc_dprc_disable(dc_plane->fu->dprc);
> +
>  	dc_fg_disable_clock(dc_crtc->fg);
>
>  	/* request pixel engine power-off as plane is off too */
> @@ -373,7 +441,10 @@ dc_crtc_atomic_disable(struct drm_crtc *crtc, struct drm_atomic_state *state)
>  void dc_crtc_disable_at_boot(struct drm_crtc *crtc)
>  {
>  	struct dc_drm_device *dc_drm = to_dc_drm_device(crtc->dev);
> +	struct dc_plane *dc_plane = to_dc_plane(crtc->primary);
>  	struct dc_crtc *dc_crtc = to_dc_crtc(crtc);
> +	enum dc_link_id ed_src, lb_sec;
> +	bool disable_dprc = false;
>  	int ret;
>
>  	ret = pm_runtime_resume_and_get(dc_crtc->de->dev);
...

>  	fu_ops->set_src_buf_dimensions(fu, DC_FETCHUNIT_FRAC0, src_w, src_h);
>  	fu_ops->set_fmt(fu, DC_FETCHUNIT_FRAC0, fb->format);
>  	fu_ops->set_framedimensions(fu, src_w, src_h);
> @@ -161,6 +190,9 @@ dc_plane_atomic_update(struct drm_plane *plane, struct drm_atomic_state *state)
>
>  	dc_plane_dbg(plane, "uses %s\n", fu_ops->get_name(fu));
>
> +	dc_dprc_configure(fu->dprc, new_state->crtc->index, src_w, src_h,
> +			  fb->pitches[0], fb->format, baseaddr, prefetch_start);
> +
>  	dc_lb_pec_dynamic_prim_sel(lb, dc_cf_get_link_id(dplane->cf));
>  	dc_lb_pec_dynamic_sec_sel(lb, fu_ops->get_link_id(fu));
>  	dc_lb_mode(lb, LB_BLEND);
>
> --
> 2.34.1
>
