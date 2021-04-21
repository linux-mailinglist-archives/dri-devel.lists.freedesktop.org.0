Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB2083669BD
	for <lists+dri-devel@lfdr.de>; Wed, 21 Apr 2021 13:15:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD53D6E98B;
	Wed, 21 Apr 2021 11:15:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60089.outbound.protection.outlook.com [40.107.6.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BA356E98A
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Apr 2021 11:15:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SHPfMGADo4JaWIkJYEgS64DyZEHXhmMtOLo54U5GzSvsdmQRxvY0IRMjLKWPSHCmrO1qF0LPVfRZdrixV9mcdkyR0trdvT1CRZYDd6vMh2pJ8bfCRJUuTnhpqkCDYQd0QBVS1uP1ee9DTHIozedy68/WSBXeb4b1YyixD8x808vo8NNTKg2joUnnnwS7u5KbyJfTxc+wnAAyIrvSlxEOjOUx3i8qYbexCq/f7JaDy2SboVR13Dn1b+M/BRHoylEQJk725a03VUwPZHJebmArgYMD5tqTe9WeYM+N8w2CT5WbxpTAeO3RopPEekhxvJGxtyJoLShmwEFRrl/uiq/OaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mYDAgyWLJ4ywJRMrm4tO4Q0iQnS7LU+R4IkvWB+qb7I=;
 b=RyVe1Wc/mlbRnBHnoPqZ5k4/oQcZYqBVDGaSum3Ph5IjglTqQAjwRZDzfZKyubb+TLe7SdNgHFGSM/WPH1Qv2Tejif8wkrkkgJtV7mregMmDFGLe21fxQy9W008yVFPNgifn4D+Nuy1xZegodHgrJF9c2LjSy1qbGSABR0ly0iFBmQ747I8sfcN83HitgPp6H0s0sYuKciM/hjnxgjluMyWVZ9FTlWobRvWrS2gA82gxlkAEKbEwkn3PC8TCYM9tT/OJYfIgXTABiuMqiMif01EFgz2yDfOIXbjxpYqs24Z4YGjf3XQRuB7JR+kqw5VG0x7psE0fw5piDiDnoFqm3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mYDAgyWLJ4ywJRMrm4tO4Q0iQnS7LU+R4IkvWB+qb7I=;
 b=QKZTg92QuoOxEUrLZHdOpJ6xXSHMrlj2UpBs5mPoyK1OyUJnjn2/jQZK8DJaGKgIop6Ae95j8GT1QqgxrjhhYL0YyW8nCJiVkBrRUnOieKoJFC3Bx4SI7U1p6TE7DQfZEPtAOPg7npNBw+h/5GZh+dpUkKPXOxO/pFPR74LK39o=
Authentication-Results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR0402MB3902.eurprd04.prod.outlook.com
 (2603:10a6:803:22::27) by VE1PR04MB7357.eurprd04.prod.outlook.com
 (2603:10a6:800:1ae::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21; Wed, 21 Apr
 2021 11:15:29 +0000
Received: from VI1PR0402MB3902.eurprd04.prod.outlook.com
 ([fe80::ad83:b72d:23db:7034]) by VI1PR0402MB3902.eurprd04.prod.outlook.com
 ([fe80::ad83:b72d:23db:7034%6]) with mapi id 15.20.4042.024; Wed, 21 Apr 2021
 11:15:29 +0000
Date: Wed, 21 Apr 2021 14:15:24 +0300
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: Liu Ying <victor.liu@nxp.com>
Subject: Re: [PATCH v9 6/6] MAINTAINERS: add maintainer for i.MX8qxp DPU DRM
 driver
Message-ID: <20210421111524.74ylexgsgkojfwwf@fsr-ub1864-141>
References: <1616997446-8783-1-git-send-email-victor.liu@nxp.com>
 <1616997446-8783-7-git-send-email-victor.liu@nxp.com>
Content-Disposition: inline
In-Reply-To: <1616997446-8783-7-git-send-email-victor.liu@nxp.com>
User-Agent: NeoMutt/20171215
X-Originating-IP: [83.217.231.2]
X-ClientProxiedBy: AM7PR04CA0001.eurprd04.prod.outlook.com
 (2603:10a6:20b:110::11) To VI1PR0402MB3902.eurprd04.prod.outlook.com
 (2603:10a6:803:22::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fsr-ub1864-141 (83.217.231.2) by
 AM7PR04CA0001.eurprd04.prod.outlook.com (2603:10a6:20b:110::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.20 via Frontend
 Transport; Wed, 21 Apr 2021 11:15:27 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4d9b9272-b5f6-42c5-e9fa-08d904b6c50a
X-MS-TrafficTypeDiagnostic: VE1PR04MB7357:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VE1PR04MB73571A7A8BA1B2F7F4D16895BE479@VE1PR04MB7357.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2201;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zX/Qi+LFf3l6y+NIopRjemN7XVWZg3TehDZ6goiCma9pd8KfBNL6lqWWBQuXNyFGi9VnHjqHppzY8T6g1mor7AFckrCFYtWdYk2ig5aTMQ2yLE6E0A43qH7oY8FZNvlo7CfCISj0IjTm+qD14mIEPoBYf6lM/HA5VDtJe0BSsoczJHRNVIyLlhjS029uxX3k/SPET4Yycgvf797r4+vqQIlpJDM8fFx6VvHjMaqZ0e/CZfOG6RWFWr4s4YfPDd/PGRub5k2kySwtsHxxrtp0J7xmLxPAAY+Engc8vknnKx3VFKUcsztW6LoXKhaDqqCvxui/ZwyRr5H3c/u2tQQlnhYG0qWLUH1zmmlcKk9CvUTgeKh5QnWrvur0JNdCe8ZUpkTekKNQjq9qEW4gHhi0HFTH0nx7v2A2mbFFvyxo68zWkG0RUGy/N1T7K+D3z40R3Ry3uo3uXH7KXE9QcQ9ZDO7lgjQWQihEm+zHp/Y9z10Lzs09rQs9T0Q8IAPtZLrytGNl6JCVATvP5fHTS1hyesROky62UhPozot4lH9i4BqeUoItraeyv5iGo2KKn+ahvoiS1lK4dzJieampL6OREP3wKmcQIThqRcRjc9YNIaJPSF1GPYuHbGSb1iFgdx7aqsgwk+l8/5kv1qerV0/PT2WitvbukcjwmiHJojrD/x8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0402MB3902.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39860400002)(366004)(136003)(396003)(376002)(8676002)(7416002)(8936002)(2906002)(66476007)(66556008)(38350700002)(38100700002)(44832011)(478600001)(956004)(16526019)(26005)(6496006)(186003)(316002)(66946007)(52116002)(9686003)(33716001)(55016002)(6862004)(5660300002)(4326008)(6666004)(86362001)(1076003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?1sApQMnG2QxbuoRmyZ/Zlwxl20Qr5Vt+2oy2y5Q6vO5XhIVVzbw1bhtmGGDH?=
 =?us-ascii?Q?jVgGzE7bgJC4AE5IVYBvX+5F3vZr5dATmra0fgeTL39mOpBpx6eqnrxiMLEy?=
 =?us-ascii?Q?5+YGqUfYHegBnqEtbalGXKRWeFVpg6g1TkJClNt/zoa4oqoL8Nyl5D93HFOL?=
 =?us-ascii?Q?kYDp4BICg1Q93JTksbi4Tus/6vA9z0ik/FMCTnTLaaOwqH5t85GeEdQnoKnc?=
 =?us-ascii?Q?Zqov+LgO9bI3/SQHVMRag9aLhVa8zRVL6cRWG0pp3v0SYMhzLsCJnrtVEACh?=
 =?us-ascii?Q?taeYwdFlx3TQWkPJCLdrDxz3GZxHr8kdNkSr0W0aE6NZ4t7eH5iwKGYm8nJY?=
 =?us-ascii?Q?zkP55Cc43KytoXR0mCHhRTtnACbxD3C7L+XvvqpjMWWvacnf9FAYrSNpK979?=
 =?us-ascii?Q?bkcKSEk2SdYKgRct5fkor2jmp1k+eoTrTPrFyOTgUvm/xyAzSWla050x77TR?=
 =?us-ascii?Q?7slaEVrQHQ7y+PMnaALjL22XwDZIjDWfqxCqdb9ruE7n7kwWI+8jMK348Q+w?=
 =?us-ascii?Q?6I1JVQqZuTGS4peC0S7+kZki/UX0sN3ZImHkvAgS1P4BqKcyZXlqwcySbi2Y?=
 =?us-ascii?Q?YQod5+oTOb6yXouAYhpRffaWBCE+d3UJqQf/+hwGjHMs2v+EkmKqo9YaXGsl?=
 =?us-ascii?Q?Yh8w3IWsQYRey9OSsc5tV6v+ru1DPw8qtFzhoNnSpnGAlyp8Tbuo5Bb/4d9s?=
 =?us-ascii?Q?H3zRzukkpcn1umqQuTFBsUOYdXk6r3Z2R+OTyYPMboe2pxdiVdIr5NN/bSr/?=
 =?us-ascii?Q?ubbr18vTGCGXdIw6Iw7+w72Q+K71oeV3g3PLOhm+qXNzs90zXDzDVuAw5yFI?=
 =?us-ascii?Q?aAe9DvwEnYVm7ll/IJR2cK56zKS2VBA8shJv5nOWkbi/r1xHOPge7hrUUqWB?=
 =?us-ascii?Q?RJD/6PPZprXWCu+PJVXAQsCIQGyxnlPAHkKNIcEwyAqvPu4oxb59dSyvOPgw?=
 =?us-ascii?Q?nVtjZP4ccBg6me4cDfZMu/dVcn0wUxE+qpPAx2cy+vNGz38uzRMgVTIKk46z?=
 =?us-ascii?Q?HAWSYODV7NLXw2DXyOLRmIp8WGoflY0Q/kVZD25l0biQ2Z0A/b1nzyFGxAbd?=
 =?us-ascii?Q?Ui5MCBD2tsSWdGq5+5e9YNdiH7dKT/SP2O4OBujKcdYtLF92BJ/9b8grZWG4?=
 =?us-ascii?Q?qSNSjB0tLXG9YIIJjEoHqsnwVg384MmYttHwhbUNvXU+BNbZXIcNFvLezZC8?=
 =?us-ascii?Q?/b7wtaisI0t3UMdQ5CZdyAm0QActL5sl3AX6W7jiWhxqJMHePWNaSI4ETQ8I?=
 =?us-ascii?Q?IfDopM+dBc5w9ozalGrGKE61HfBOr+c2WJ9Os/JonpslFUeqXy+8I506Khvy?=
 =?us-ascii?Q?xfEYDG+5C7FOD48EjOF6pjf3?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d9b9272-b5f6-42c5-e9fa-08d904b6c50a
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3902.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2021 11:15:28.8460 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0xR8pyO8rF2uOzorcZt5RM3ch+hyJK4yrSU7/Mw3l84yzpgIRoRaVz1WqI0S0Ar0S5BnkO94Tlz8AA49+dtzNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7357
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
Cc: devicetree@vger.kernel.org, tzimmermann@suse.de, airlied@linux.ie,
 s.hauer@pengutronix.de, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, marcel.ziswiler@toradex.com,
 robh+dt@kernel.org, linux-imx@nxp.com, guido.gunther@puri.sm,
 shawnguo@kernel.org, kernel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, Mar 29, 2021 at 01:57:26PM +0800, Liu Ying wrote:
> Add myself as the maintainer of the i.MX8qxp DPU DRM driver.
> 
> Signed-off-by: Liu Ying <victor.liu@nxp.com>

Acked-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>

Thanks,
laurentiu

> ---
> v8->v9:
> * No change.
> 
> v7->v8:
> * No change.
> 
> v6->v7:
> * No change.
> 
> v5->v6:
> * No change.
> 
> v4->v5:
> * No change.
> 
> v3->v4:
> * No change.
> 
> v2->v3:
> * No change.
> 
> v1->v2:
> * No change.
> 
>  MAINTAINERS | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index a247285..ec82d42 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -5946,6 +5946,15 @@ F:	Documentation/devicetree/bindings/display/imx/
>  F:	drivers/gpu/drm/imx/
>  F:	drivers/gpu/ipu-v3/
>  
> +DRM DRIVERS FOR FREESCALE i.MX8QXP
> +M:	Liu Ying <victor.liu@nxp.com>
> +L:	dri-devel@lists.freedesktop.org
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dprc.yaml
> +F:	Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dpu.yaml
> +F:	Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-prg.yaml
> +F:	drivers/gpu/drm/imx/dpu/
> +
>  DRM DRIVERS FOR GMA500 (Poulsbo, Moorestown and derivative chipsets)
>  M:	Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
>  L:	dri-devel@lists.freedesktop.org
> -- 
> 2.7.4
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
