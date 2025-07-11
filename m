Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 386CCB011E5
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jul 2025 06:03:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 207F010E252;
	Fri, 11 Jul 2025 04:03:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="buvUSmpj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazon11010059.outbound.protection.outlook.com [52.101.84.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B79610E252
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 04:03:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xPdGkn0iwi0d2dsBNaV4Se+HVr47tc8s9XI12bGSOa4Js0oh4xnJhB420i+sQuMLj7PGeC8T5qcN3GD/y7GYZjIlQwmK9CqazYSyU2TeacBOU+O3GwiPTinDWwOavduTa3ZmxNZAOZ7cyHoYa2vXU2WFvhUDI/XiX8iBupVifNMwwgNlShYHxwMpNUrg0LHR5gvnvPZCaUNOH9Oa7mZYzlBxGW0BmRAxZxTeY0viiZgfsq8B9EXC+RNeGFMOtFooNCxE+x/9LrHxWc5u8x2DBOtZhobWj2Vhn52+MxCbA5ksMY2hVH7eeC55weaA9XgmhvKtGI4wAE3IaDAZAF997w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6+0rZkrQpOxV7V+r21Nnsh/bW8MW4ZCy8VKc/lQzlTQ=;
 b=D65+uwqVASWdGjMYW8+Pyw0TnSB+G3hwHWCbACFFn2g+JGCvtPJOvHclEPbjE605QzNS1NRLlcI8hX64c8Ikmk1z1pmOi6FcskPM2TC3Jg03OV92YZTOqRB8mXL9VbxMhdDYLID9mrr7f1DA1yobvwGZEYfe2Mt1w18O4DLrTCDAx6MLUG/XXdoHMGFwYhsV0DMY8rdsWCMfThsgn5T+8G30He4ZfxUEwYwHFRdSWMeLMFfRQiwR4SFPLOBaxvnfm9m9EzELQQtfH/Tv0ux8XWYI2nRxHMIwRqQLJCcnDxHgpEAvw871V+YRPRsZvucqpcD6THnbmjQ6BcPDcR6VbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6+0rZkrQpOxV7V+r21Nnsh/bW8MW4ZCy8VKc/lQzlTQ=;
 b=buvUSmpjA5OjSRZdiKVskohw9GmXyPvbyiDk4fh3820iuTk5tNCmtFqSrTURN73+U/7sUd8IvIHTbBqyHT17U+uSUfx4CAaMA1KAw3O6dMUdFcubWwOkPJcTD1OFYfen0S9TPGNkoCvXJXmCHVKAlvA5LGVYuP/6Ocz+825jGkO317zQ/e904DcntRzTXAg/iGwu+LLAK3d0R85MMnOPGGhL30HoN2aPSfOzABkhbmmaXpJvmcS9lst4KGm+VGc8oT5i3hZTuGH9tJz0cGPutFP9SmdgP/tdK94e5KZrKT43GMRQ+QGlhRS+fqQObus+Gu0AplX25kPtOQ6fAcGPIQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AS8PR04MB8245.eurprd04.prod.outlook.com (2603:10a6:20b:3f9::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.25; Fri, 11 Jul
 2025 04:03:29 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8922.023; Fri, 11 Jul 2025
 04:03:28 +0000
Date: Fri, 11 Jul 2025 00:03:22 -0400
From: Frank Li <Frank.li@nxp.com>
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Cc: imx@lists.linux.dev, Abel Vesa <abelvesa@kernel.org>,
 Peng Fan <peng.fan@nxp.com>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, dri-devel@lists.freedesktop.org,
 Abel Vesa <abel.vesa@linaro.org>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/8] clk: imx95-blk-ctl: Cache registers when RPM
 routines are called
Message-ID: <aHCNCokZxIRNPgT6@lizhi-Precision-Tower-5810>
References: <20250709122332.2874632-1-laurentiu.palcu@oss.nxp.com>
 <20250709122332.2874632-2-laurentiu.palcu@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250709122332.2874632-2-laurentiu.palcu@oss.nxp.com>
X-ClientProxiedBy: AM0PR08CA0001.eurprd08.prod.outlook.com
 (2603:10a6:208:d2::14) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AS8PR04MB8245:EE_
X-MS-Office365-Filtering-Correlation-Id: 1377af6e-ff13-4130-7fe1-08ddc02fe48b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|19092799006|1800799024|52116014|7416014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?c7n4L8jXFME5f/oJvXOUtiy1fxaB1zPHLeJmC9fYrKE+uOxahP3h6J8LFC03?=
 =?us-ascii?Q?ICX/5WplC8V7Wvvke1VfMJ2MRsPa62RGybzTbb0BCHJZb9C4i+UzKpwFWouF?=
 =?us-ascii?Q?AIwVsCljv8gpvHwWg20IgnMd3n0FkpQed2jcQ5GxmfzDJRBM4KF3KJOAzJJP?=
 =?us-ascii?Q?EuN2HLoRmNz1q4cb9zbpMZqVTyzccyBomGJKOBrMAjHznm6sgoWSWfUrQErr?=
 =?us-ascii?Q?a5CdcwlzotrXrLC/Rhr93zFYLTtcvDJpcJ1QBFoBLcr++j5QgA+xVbXFWeUn?=
 =?us-ascii?Q?ue6gkLeEqRCb+JKQ8B854YavOMsO31AbobSAF9qvh24n5O9vzCvWT1dkMC9C?=
 =?us-ascii?Q?CYt+/a/LkNSLhdvKwiHdEwmXg3hQNxt1GtlgnFujz9797NKPYu3EeEY+71oY?=
 =?us-ascii?Q?bdOTKfna5nfwaaXEvL1fyVJY6rYMvShdFgCGYbPIrTeVfxnvx3YXamvBzXSl?=
 =?us-ascii?Q?NNcLAK2NcVdTCsZ8AwkKYZVjpi+clTYJpFlVffiMlvpKwmXBBx9Z4hMohUlL?=
 =?us-ascii?Q?pWPZ/Knt4AFmDKtAvAkuxwbRh25+ejScZ3dQu3gt96aOuC479AHoF5oseUTD?=
 =?us-ascii?Q?MP6f2NPMvFXatYA91drmGWQEQ6YWPQIcwjexEb+G9ffIFgYwpbb6F/oIRQzm?=
 =?us-ascii?Q?dUmEdo8K36MgAQiEHLhur6BRmCl2eJ1GJqDXhevhU/NUOSV3Lq6nSRFYvGgx?=
 =?us-ascii?Q?WvNYhd8+k4c2VKoZzBUFWTxKOPW4zb8AIDDK+jjt3CGFZZCvhzsH5CL/gADG?=
 =?us-ascii?Q?dHpZvIFOT0jR5EBbOyqpueUpN+UQ57kr4vU1MxQB4iJjgwZyechE3GZc+4QU?=
 =?us-ascii?Q?ygl8o4AqIY6sLV1iGK87PaMLYl14kB9++MAgmXApxyKzQJWcjW0RpN+ZArEc?=
 =?us-ascii?Q?TEoG0zVaUt/If4GnjsuaNRXtWHS5K1XrYeNSbj1Zw4KmDfZO1ETH8JhtuKsB?=
 =?us-ascii?Q?3GzApXX07oYIE2T6KfvtnVN7O36NF51ApL03x4VJyHleG9L6KnWcN7hCfUcb?=
 =?us-ascii?Q?xvVElLgwJhl98ZVFAMNCWnICNFbN+LaNOt+fWNqMZnQ1dcHVW/z5gn2pjLDZ?=
 =?us-ascii?Q?uLv0YypOumqXHPQYj02MHmXkC+SftL8JBq7ffPqzRmfpWamjD0ARwH8egrCH?=
 =?us-ascii?Q?5VFLbQaPYoNJxASUJqHYt9DR2eStMwdTMe/pAuE/ehtC9bZwFNCw092kJRt2?=
 =?us-ascii?Q?lmUevQQVamyOxKYNCjO3wJ+/UQs9lmMP1Fqp40e/EJrmQqFOGvKUBseh9kO2?=
 =?us-ascii?Q?0j//m54i3duKpAeU29UttUwge0gp0Fv+B/T4SpY0vTY8Fyhup7CVvVmKUmVh?=
 =?us-ascii?Q?CGEpkXK6If1Q29TYq7L01US0ddRxaUTMhq6kePJXNBb4nhmRsEIWhtMNi1jv?=
 =?us-ascii?Q?zAlQZ0/cAz+4FgyaFWPUIe6NlP//6VEGu5ne5pIDMqDaW0Z3TQXy6utypFDg?=
 =?us-ascii?Q?g8wFqsVo3Ebqf4htIzwi7hDfGfSiMDDvf24y8Uuksm5x0YdC0G7iyd4anyUK?=
 =?us-ascii?Q?70M2G/NqHRM+/Ws=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9642.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(19092799006)(1800799024)(52116014)(7416014)(376014)(366016)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KC1lwv5xDqhTHj8jqSyLw3bPiR2VDnIV6MlO1yPWNic+QkMyAOdTcQNaRZmI?=
 =?us-ascii?Q?yqXoWlNksSTSU3d7bLrWberjcM7SZ1RMUPWuFInexSsrmM8covVpe9S265S4?=
 =?us-ascii?Q?cXwDc6XQhskmf8c6SSpKaNLCkFpQl//IaoFVOSfFbhLhbLDa/knm+5tCXAfh?=
 =?us-ascii?Q?wZWK3T8F/SLb4afWY8E/MNQ5HITjawJZ3fxbIQBXhvyD2Rurum/n6YZxs0WK?=
 =?us-ascii?Q?RgtLWHlqEHwFrU80hg8ZSenHhtagUMyNQ0h+IvyoVwXYmM21kCqGqObjKgcM?=
 =?us-ascii?Q?afLvykWvoXjh2ExFnbt34UmX9haLeqj1z0qHwYjCgKgNby9KgeSliEDqC+Su?=
 =?us-ascii?Q?BCCMFgyy4udVHMu6l8tyYR9ECuBR6p/x5URonLKT3UEWf0VGVrRck0C0FalZ?=
 =?us-ascii?Q?9dEbldK6F9BM6kkyXDoEgf0nRKqoZFoxIiVTXGUf2TxS74CShm5U7Pds+qnx?=
 =?us-ascii?Q?1N/58KH4YLMEoj1JZ6MFCsqZva1pbjrnxuOkiyE8SfEWAO8Qn8AKmH2YQ+cw?=
 =?us-ascii?Q?tJbyyVeYGLkCr5F7zcjs0pHeXGh4WrYLcFGLc+bjwI/QwsFyCGOSb3yhBLVI?=
 =?us-ascii?Q?SZPxVDFO4Q2MvXZpGbI0wUQt/pGs5igHupCS9SZ0vqNwWz+0VWMl396SpHki?=
 =?us-ascii?Q?eQkNKiMOvXKo6+D5u8O/qiweCnixxlG9Tp5Kdyouty2fVj6xX6NAt6Z2UDYW?=
 =?us-ascii?Q?8eE7F8IbLKMl4YJYMzH/txUFR9UcwXPopThrTM3Ja87cgQnYHNP2Kbh+1MaB?=
 =?us-ascii?Q?TUbV7uv610H5SS0Ls+Uc1ihVrJ9RMRvTDP3UtXetnwDCZsIUf28pNbTsyDds?=
 =?us-ascii?Q?Ml6woTc1bmtKHicIuSjyP+t/fXoJYbkWeDmT+/3vg0SxAMy4foipZWQNuVqx?=
 =?us-ascii?Q?HrSLrUgOsCHPu0YD9YpbGAbnUi+2cn3gJbLDZVKZ1UnFyuj7teyFOPq9Nzlv?=
 =?us-ascii?Q?LkTfiifi/slnfKjWjMl49YTOYZeHsZVr/ydJ60SWIZV8+sjL3Chq4SXxPNPf?=
 =?us-ascii?Q?bN0HLmt6vcK9trTHO0ELuzyFczOPTJ8LH03JLIkpoIlDUpsJ4TCbHqTU7WdP?=
 =?us-ascii?Q?ikWe5NivtV0onX+hj7xbdmX/PhTSj7PaYz25RgNUUxYLvrVER6x3rep2ZTaX?=
 =?us-ascii?Q?bsBabFhs6gPcrZXXPoKaBTG9uHQ2CfHKRXuAvXLOfe7c7y2MzGu5YvrFI42g?=
 =?us-ascii?Q?IPtAoQEvpOZ2OELicEJYtOJIQEX2gtAjDiwIyfaJvui+tRj2MaTxcMXOqXtV?=
 =?us-ascii?Q?d/Clxe9WhH/5oKv08+skOcqzoOlEpKQl2NBmyGa+SKNZ/hAWaeXTdrvrm9Pp?=
 =?us-ascii?Q?KSgiZ06/GOgsmclN1BAfhJ5vZGJaCXAumh7h0PJoNXsd8vnkdzHXqzqk0s+5?=
 =?us-ascii?Q?0R+EhfLRu7gYeDg++rbT7RpowQwA1iuA68trWjq4qxyVf6oVbYZ4+uYDPuxK?=
 =?us-ascii?Q?YLPh0dXrCIL1ZyUVdL52Rn0gHJM+A/mteFeOKA3uMA3Bhx9ddQYejNPxVEBW?=
 =?us-ascii?Q?VIB0/WuM25lJN4xwpvJ+AkIt38VyXpGLF6o/5jvJ4pKBsScYknIL/p1iFAmD?=
 =?us-ascii?Q?ZMlEeztGo92JMKoqn30dp0lvYaREqgVNEmu8YIHf?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1377af6e-ff13-4130-7fe1-08ddc02fe48b
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2025 04:03:28.8657 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BFbkk66Gellz2ENpPSYARcAzmPQKpHypC4o44UJ2prZy5VZbpoIfzxtioYsSjbO2EzM+V8akfDFUJmGAuCF1kQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8245
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

Subject:
save and store registers at suspend()/resume() function

On Wed, Jul 09, 2025 at 03:23:20PM +0300, Laurentiu Palcu wrote:
> If runtime PM is used for the clock providers and they're part of a
> power domain, then the power domain supply will be cut off when runtime
> suspended. That means all BLK CTL registers belonging to that power
> domain will be reset. Hence, the clock settings will revert to default
> values messing up the consumer clock settings.

Needn't "hence ..."

Save/restore register value at suspend/resume functions to fix this problem.

>
> Also, fix the suspend/resume routines as well, as the clock was left ON
> when going to suspend.

Do you means fix the problem clock left ON after suspend?

Pomain cut off, why clock can left on?

>
> Fixes: 5224b189462f ("clk: imx: add i.MX95 BLK CTL clk driver")
> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> ---
>  drivers/clk/imx/clk-imx95-blk-ctl.c | 55 ++++++++++++++++++-----------
>  1 file changed, 34 insertions(+), 21 deletions(-)
>
> diff --git a/drivers/clk/imx/clk-imx95-blk-ctl.c b/drivers/clk/imx/clk-imx95-blk-ctl.c
> index 7e88877a62451..7f9bbca517284 100644
> --- a/drivers/clk/imx/clk-imx95-blk-ctl.c
> +++ b/drivers/clk/imx/clk-imx95-blk-ctl.c
> @@ -448,12 +448,36 @@ static int imx95_bc_probe(struct platform_device *pdev)
>  	return ret;
>  }
>
> +static void __maybe_unused imx95_bc_save_reg(struct imx95_blk_ctl *bc)
> +{
> +	const struct imx95_blk_ctl_dev_data *bc_data;
> +
> +	bc_data = of_device_get_match_data(bc->dev);
> +	if (!bc_data)
> +		return;
> +
> +	bc->clk_reg_restore = readl(bc->base + bc_data->clk_reg_offset);
> +}
> +
> +static void __maybe_unused imx95_bc_restore_reg(struct imx95_blk_ctl *bc)
> +{
> +	const struct imx95_blk_ctl_dev_data *bc_data;
> +
> +	bc_data = of_device_get_match_data(bc->dev);

Generally, bc_data should in imx95_blk_ctl_dev_data and set once at probe.

So imx95_bc_save_reg() and imx95_bc_restore_reg() will be simpfied.

> +	if (!bc_data)
> +		return;
> +
> +	writel(bc->clk_reg_restore, bc->base + bc_data->clk_reg_offset);
> +}
> +
>  #ifdef CONFIG_PM
>  static int imx95_bc_runtime_suspend(struct device *dev)
>  {
>  	struct imx95_blk_ctl *bc = dev_get_drvdata(dev);
>
> +	imx95_bc_save_reg(bc);

this help function just one line. direct use

writel(bc->clk_reg_restore, bc->base + bc->bc_data->clk_reg_offset);

>  	clk_disable_unprepare(bc->clk_apb);
> +
>  	return 0;
>  }
>
> @@ -461,7 +485,10 @@ static int imx95_bc_runtime_resume(struct device *dev)
>  {
>  	struct imx95_blk_ctl *bc = dev_get_drvdata(dev);
>
> -	return clk_prepare_enable(bc->clk_apb);
> +	clk_prepare_enable(bc->clk_apb);

Need check ret value;

> +	imx95_bc_restore_reg(bc);
> +
> +	return 0;
>  }
>  #endif
>
> @@ -469,22 +496,12 @@ static int imx95_bc_runtime_resume(struct device *dev)
>  static int imx95_bc_suspend(struct device *dev)
>  {
>  	struct imx95_blk_ctl *bc = dev_get_drvdata(dev);
> -	const struct imx95_blk_ctl_dev_data *bc_data;
> -	int ret;
>
> -	bc_data = of_device_get_match_data(dev);
> -	if (!bc_data)
> +	if (pm_runtime_suspended(dev))
>  		return 0;
>
> -	if (bc_data->rpm_enabled) {
> -		ret = pm_runtime_get_sync(bc->dev);
> -		if (ret < 0) {
> -			pm_runtime_put_noidle(bc->dev);
> -			return ret;
> -		}
> -	}
> -
> -	bc->clk_reg_restore = readl(bc->base + bc_data->clk_reg_offset);
> +	imx95_bc_save_reg(bc);
> +	clk_disable_unprepare(bc->clk_apb);
>
>  	return 0;
>  }
> @@ -492,16 +509,12 @@ static int imx95_bc_suspend(struct device *dev)
>  static int imx95_bc_resume(struct device *dev)
>  {
>  	struct imx95_blk_ctl *bc = dev_get_drvdata(dev);
> -	const struct imx95_blk_ctl_dev_data *bc_data;
>
> -	bc_data = of_device_get_match_data(dev);
> -	if (!bc_data)
> +	if (pm_runtime_suspended(dev))
>  		return 0;
>
> -	writel(bc->clk_reg_restore, bc->base + bc_data->clk_reg_offset);
> -
> -	if (bc_data->rpm_enabled)
> -		pm_runtime_put(bc->dev);
> +	clk_prepare_enable(bc->clk_apb);
> +	imx95_bc_restore_reg(bc);
>
>  	return 0;
>  }

look like imx95_bc_suspend(resume) is simple enough

Can you use DEFINE_RUNTIME_DEV_PM_OPS?

Frank

> --
> 2.46.1
>
