Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A35543438B4
	for <lists+dri-devel@lfdr.de>; Mon, 22 Mar 2021 06:37:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20F6789F3C;
	Mon, 22 Mar 2021 05:37:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr10052.outbound.protection.outlook.com [40.107.1.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E55989F3C
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Mar 2021 05:37:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NbbEll5xQ+sISwsU6g6Fq1M899+Jd9cjbMfVZZNP8KCir/QQ6PySKjCdFGQC1Ob2cdWrOUqzAZ1gg2I4BrglI82ibR80b744+vPOC4ntNbLGFJ0wptDxuQ6HoppfowdOn7hv/68ytgtY1Fkm3RZ2daIEaIGHx2rILTFBxlBKK3HmUzq5VDUesZ1PjE654/IzxcDpdR5Tqj2VX8fRzqYN6OkdA2ZdidEcGwi+qDyYmhOm6ITtMwZ9Zl6z5mB0cv3k9R0lX5KZPJPpTS8kkaAfRw4kHcQIkC1eQ9mn54YrQgyxw3V1VTr7bdtqfdoLdLk8PggBCjgIAlsoGVXmFiK/Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HpwuJNNpVX8ai3Yg++Ep7MI2l4Sjc4nP3uy8qhKDtIE=;
 b=AnemrYiOzuUoxyYbgHBACCBEcQe8e1JtiiknMRTR0l5r5P7gyssHHPQwdquShNRjadSd0yleeCysEB/XoORdoeMhAPAcNg82jSPrczOse7dYL+kt+LEJJDm3hkKCa5C0DYtifYaUE+hltTq6FU6oLiw+ItLFN3MXAqm0jcO+9iGDAPu7SyB02kvAXp7lZm0RzB9js6VL6yyIcKvtmAyehaaeoqbzMoTIqUZWxZES38wQ6v/V2C2jj72sLt4Q3aS5/3IKHKUmm9XgxEYogNF8ivrj6XtRqRUWvKV9L/puztd35aFueHhb+EsARUyMM5Ol+iKqFnynVKnQzZvHmLuicA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HpwuJNNpVX8ai3Yg++Ep7MI2l4Sjc4nP3uy8qhKDtIE=;
 b=g5jRP+09wi4eVFRJ+byjyctsu/GpfwcF66IuiHiJQ2Cw3tzY/FjrXd2PnhaxJzJ26hu/vIocShlWEYIPSH8LcowIyavYBps46yglphJe47LppTRzeE9mp90DlL0+0FqqUlI5oBczoBTwbBt65mbGEClOZ9xzA4q8ePcwmcBw9QA=
Authentication-Results: lists.infradead.org; dkim=none (message not signed)
 header.d=none;lists.infradead.org; dmarc=none action=none
 header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR04MB4654.eurprd04.prod.outlook.com (2603:10a6:803:71::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Mon, 22 Mar
 2021 05:37:50 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::3ce1:4759:5c33:514c]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::3ce1:4759:5c33:514c%5]) with mapi id 15.20.3955.025; Mon, 22 Mar 2021
 05:37:50 +0000
From: Liu Ying <victor.liu@nxp.com>
To: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/imx: ipuv3-plane: Remove two unnecessary export symbols
Date: Mon, 22 Mar 2021 13:24:00 +0800
Message-Id: <1616390640-22289-1-git-send-email-victor.liu@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: HK2PR0401CA0009.apcprd04.prod.outlook.com
 (2603:1096:202:2::19) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by
 HK2PR0401CA0009.apcprd04.prod.outlook.com (2603:1096:202:2::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3955.18 via Frontend
 Transport; Mon, 22 Mar 2021 05:37:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: e553a953-32dc-4d9e-60e5-08d8ecf4a18d
X-MS-TrafficTypeDiagnostic: VI1PR04MB4654:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB4654501209E5C175A2C144CD98659@VI1PR04MB4654.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +UM+LBWi+E3JCgyN0QpPTpoHKzvzcg7FKWqFVGI5hW7n6EVtKF8vg9lXxIdA70jeAlYnVr9iJCAf0FWvHr+AjRytNnROCdYlmVfE1x1NAOuAF7ATnModExb0QZyH46o7iEp3/20hVCvjyElzFhEvnu3Wi4MhVtVjToY+jiCAKm2n4/2gsr3bjtJBmZu0GHaTTAlP93GUgv/HlPhchiun46Tklv49o7+UKrOsMujQb0/yaH6jvQAnGtX3QCLc0/D1oS6BdsMZJAVlOmr7+N8Qv76iV84Kq/YIGKWPJDksfGIa8WjMdpoGq1z/3+2JC/AmwlGHPJjx5Vm56LGZCJomnwV5fZ2m6lj7TLU7uZBELP7Ey/1Q3mM4j/CeQqHObyKikeJhAMyjmPzYZZYpyXHR3LtBQzJKgWeDQHyOLNKHjSSvZRi9fl01N0LjwnGWAeaZ8kyGuRFJx768/fromSh+Cg2aYXHi3/9oArrAppolBtmx+Hl72UK6pzbV/BQGhrMCaWijvODsv6B5sS8PdGUF6AKMXYfx9US2xTbDFgadS6KmbztsOL+HsTf9VeU8iVanlsDM4rgQruN2Y7f0ZTou8D+fnf2Qkth/xU+38V4i6C04nq5TAbFzJxX/rlbx7MAVFbRBZZAw2VM3QVQN0DZG1P79Lur/uk2n6HJ8SR0KdmM6UipHQjpdHBpJ9pzA+/0h
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(396003)(39860400002)(136003)(376002)(36756003)(66946007)(16526019)(316002)(66556008)(52116002)(66476007)(83380400001)(478600001)(5660300002)(186003)(6506007)(8936002)(26005)(6666004)(956004)(2616005)(6512007)(38100700001)(86362001)(6486002)(2906002)(69590400012)(4326008)(8676002)(7416002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?MGVx7m1mM/hXp2ZwnzyXNSs5j2oF1EEUX8O//KSKenDvPoZyRMOxQbb8kypI?=
 =?us-ascii?Q?L6V4O6f90mGV5ujMxMDxAfacP/qslbTq5pRgJbAvpH3hGrx24XqRZsV7Z1oO?=
 =?us-ascii?Q?9Jszc/lgW4XuT/0EnA97mNiA4zHNVmUs/00or+ZJNWVOcrB0AI8det5X3bn7?=
 =?us-ascii?Q?+kgL8rcy8H4ipUVwG9mivt9JhxkCIyVrASmxsVD9nSNubD2BNhm8u7rjhoD+?=
 =?us-ascii?Q?ViIY8//icXQf6OaVSLVutBHBOhgaiLuy+tK8K/DXJDcBmm9SXrJ1PWsmXX9V?=
 =?us-ascii?Q?tUMkClJ/blC8U+IBMb/+tJheUGKT+q0jqr/dAu+i/dpOBm5afBxDGTc4VOS2?=
 =?us-ascii?Q?cWZ7jrwGdZ2sXHVNYQT+7fzoxkCqidsYbCPmCiZq0iuW0sQzk8RwMoVcm4Qg?=
 =?us-ascii?Q?EL8PTGeY/kMZOqWtL9nEyg6kWrsBep1xCyKPWXM7itcw9xYZG8576LcuNvRW?=
 =?us-ascii?Q?bqWMm7qcepHOlQ4kTItK+mCYD/dqVejzWyDXxCfq+x4DQmgzuabx3DoYFiG4?=
 =?us-ascii?Q?QtHoCIo/m77Yi9AS+h1+W1f4dPimpkwCel3ogxsboDZcvKVrtnx8qFAsUeQf?=
 =?us-ascii?Q?ppUkuYYvJ9iH9sgZt/lhCN+yiwtBQkUmdItSb+QqNjJQABSp/MGPGk9hRT/c?=
 =?us-ascii?Q?twcXIUSv2OSUyZxy7klS8iz4h+hMivIuB2pafxI2/52O+ZLNVKD7io1putSf?=
 =?us-ascii?Q?TZ2vpo6N9is2NNnfsCw1zIUid8vmgPk5zaFvy8D8f2QIAON0h3HiAhvPcQvL?=
 =?us-ascii?Q?7kDK7wponyxGRYfikFRIH4n1qzVP72jO26Xop9CHTsXtQHN9FzBKe6L5jtpp?=
 =?us-ascii?Q?npVPF1VODgl7/EwvaOxV7zuEny+Gx1Pbf6w0kF+NrDNtHfhUb7bsDrd/Bwf3?=
 =?us-ascii?Q?5rv3z0nUQPwv9ARJWyLsvVqheAGAgbkT1+DPGceFAoz5W+4PGLDGKwN/dgGo?=
 =?us-ascii?Q?f+U6mz6v6tDYZ0PxRSyDnUp5DpJTs2/F3jDcTnGbsW18RvAHkrojzyqznU2a?=
 =?us-ascii?Q?OdjMQR3L5kUU/+6tKvreSfjL7jKlDpjvXFev8Dby7Fs5U0P2avlO/MxDnKYe?=
 =?us-ascii?Q?XvpggNydqIEQCyUO2tcso/JS6uptetU+fwUgAOOh+HIdHzcw8NevuzQli7uD?=
 =?us-ascii?Q?bYBvyXzClTX+i02ubrf77UKWwnR6X0/d3UzGH84LTNH5WxZHr9u4BujJIJKG?=
 =?us-ascii?Q?2pjwMO5OE0X59u0cS+Xlrgr6cv5QhKjzcU04ahvpnoUtfQvxBfMT4qkGwb2N?=
 =?us-ascii?Q?73KprfZv+AD6x+5M8vCxO7GkUkmYzRV3uQUl5MUb4fOjOZx5hRjWcaiR+FDJ?=
 =?us-ascii?Q?3BG5qpsV5AsylWx/vNIns9ru?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e553a953-32dc-4d9e-60e5-08d8ecf4a18d
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2021 05:37:50.3905 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l3RcBg0pFVcdEqrSnl0sRrYUIRPE5pYdY7DVruH1e4xyZuu4WCXu13KJFEmQxk/ft8kCrOlcgofwo1kUMe9YBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4654
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
Cc: airlied@linux.ie, s.hauer@pengutronix.de, linux-imx@nxp.com,
 kernel@pengutronix.de, shawnguo@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The ipu_plane_disable_deferred() and ipu_plane_assign_pre() functions have
not been used by any other modules but only imxdrm itself internally since
imxdrm and imx-ipuv3-crtc were merged in one module. So, this patch removes
export symbols for the two functions.

Fixes: 3d1df96ad468 (drm/imx: merge imx-drm-core and ipuv3-crtc in one module)
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
 drivers/gpu/drm/imx/ipuv3-plane.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/imx/ipuv3-plane.c b/drivers/gpu/drm/imx/ipuv3-plane.c
index 0755080..4bd39bb 100644
--- a/drivers/gpu/drm/imx/ipuv3-plane.c
+++ b/drivers/gpu/drm/imx/ipuv3-plane.c
@@ -264,7 +264,6 @@ void ipu_plane_disable_deferred(struct drm_plane *plane)
 		ipu_plane_disable(ipu_plane, false);
 	}
 }
-EXPORT_SYMBOL_GPL(ipu_plane_disable_deferred);
 
 static void ipu_plane_state_reset(struct drm_plane *plane)
 {
@@ -813,7 +812,6 @@ int ipu_planes_assign_pre(struct drm_device *dev,
 
 	return 0;
 }
-EXPORT_SYMBOL_GPL(ipu_planes_assign_pre);
 
 struct ipu_plane *ipu_plane_init(struct drm_device *dev, struct ipu_soc *ipu,
 				 int dma, int dp, unsigned int possible_crtcs,
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
