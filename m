Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF96720778C
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jun 2020 17:35:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3150B6EB9A;
	Wed, 24 Jun 2020 15:35:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 888416EB9A
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jun 2020 15:35:08 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05OFJYoi024017; Wed, 24 Jun 2020 17:35:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=b+udD3OXhTb7dseIg7ZIscRe7YziBcqF8XPAUo/vPPs=;
 b=pl9JPAtPrhWMl+xBkAeN6miQKnlay1SPmoUhuBmZNqzXzw9qqgB5Ke3fBSkn9LQXkbAq
 0mrAbItaXum+GYqRLVQScSdEG43BOxXlbnexcjC4lBCSZJB+iZKSaizDLWiotpPRJcoX
 s7uWNtX/WUdfqnv6Z2N4tHbuWkQk4hybCdBT6GoDrRJw5nRCY2simVpVqe1aM78qPXfz
 zsjpZlaLDdNYxO8vL1VCQldkjnvTWVrCao+1pMTzwWtrn/8cSe7czcxSm0AHc2k9TjfZ
 +a6HmA1HnLfS93fzwDsHhIyMhrCDeKPQp6MPpAQ0Ra2OrPE8TgAQQwLUrOndRvCy/iMm 8w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31uuumcwdq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 Jun 2020 17:35:05 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4A996100034;
 Wed, 24 Jun 2020 17:35:04 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 823A62C5BAE;
 Wed, 24 Jun 2020 17:35:04 +0200 (CEST)
Received: from SFHDAG6NODE1.st.com (10.75.127.16) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Wed, 24 Jun
 2020 17:35:04 +0200
Received: from SFHDAG6NODE1.st.com ([fe80::8d96:4406:44e3:eb27]) by
 SFHDAG6NODE1.st.com ([fe80::8d96:4406:44e3:eb27%20]) with mapi id
 15.00.1473.003; Wed, 24 Jun 2020 17:35:04 +0200
From: Yannick FERTRE <yannick.fertre@st.com>
To: Angelo Ribeiro <Angelo.Ribeiro@synopsys.com>, Philippe CORNU
 <philippe.cornu@st.com>, Benjamin GAIGNARD <benjamin.gaignard@st.com>,
 "airlied@linux.ie" <airlied@linux.ie>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>, Alexandre TORGUE
 <alexandre.torgue@st.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "pop.adrian61@gmail.com"
 <pop.adrian61@gmail.com>
Subject: Re: [PATCH v2] drm/bridge: dw-mipi-dsi.c: Add VPG runtime config
 through debugfs
Thread-Topic: [PATCH v2] drm/bridge: dw-mipi-dsi.c: Add VPG runtime config
 through debugfs
Thread-Index: AQHWDBotLzsm/jdHJ0Ge7FgHm5JcQqjoQFOA
Date: Wed, 24 Jun 2020 15:35:04 +0000
Message-ID: <d46d3aaf-d3cd-e5e1-81b9-c019537bd09a@st.com>
References: <a809feb7d7153a92e323416f744f1565e995da01.1586180592.git.angelo.ribeiro@synopsys.com>
In-Reply-To: <a809feb7d7153a92e323416f744f1565e995da01.1586180592.git.angelo.ribeiro@synopsys.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.47]
Content-ID: <71B9D6134796BA45821981F3137C9CC2@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-24_08:2020-06-24,
 2020-06-24 signatures=0
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
Cc: Jose Abreu <Jose.Abreu@synopsys.com>,
 Gustavo Pimentel <Gustavo.Pimentel@synopsys.com>,
 Joao Pinto <Joao.Pinto@synopsys.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Angelo,
thanks for the patch.
Tested-by: Yannick Fertre <yannick.fertre@st.com>
Tested OK on STM32MP1-DISCO, DSI v1.31

Best regards


On 4/6/20 3:49 PM, Angelo Ribeiro wrote:
> Add support for the video pattern generator (VPG) BER pattern mode and
> configuration in runtime.
> 
> This enables using the debugfs interface to manipulate the VPG after
> the pipeline is set.
> Also, enables the usage of the VPG BER pattern.
> 
> Changes in v2:
>    - Added VID_MODE_VPG_MODE
>    - Solved incompatible return type on __get and __set
> 
> Reported-by: kbuild test robot <lkp@intel.com>
> Reported-by: Adrian Pop <pop.adrian61@gmail.com>
> Cc: Gustavo Pimentel <gustavo.pimentel@synopsys.com>
> Cc: Joao Pinto <jpinto@synopsys.com>
> Cc: Jose Abreu <jose.abreu@synopsys.com>
> Signed-off-by: Angelo Ribeiro <angelo.ribeiro@synopsys.com>
> ---
>   drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c | 98 ++++++++++++++++++++++++---
>   1 file changed, 90 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> index b18351b..9de3645 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> @@ -91,6 +91,7 @@
>   #define VID_MODE_TYPE_BURST			0x2
>   #define VID_MODE_TYPE_MASK			0x3
>   #define VID_MODE_VPG_ENABLE		BIT(16)
> +#define VID_MODE_VPG_MODE		BIT(20)
>   #define VID_MODE_VPG_HORIZONTAL		BIT(24)
>   
>   #define DSI_VID_PKT_SIZE		0x3c
> @@ -221,6 +222,21 @@
>   #define PHY_STATUS_TIMEOUT_US		10000
>   #define CMD_PKT_STATUS_TIMEOUT_US	20000
>   
> +#ifdef CONFIG_DEBUG_FS
> +#define VPG_DEFS(name, dsi) \
> +	((void __force *)&((*dsi).vpg_defs.name))
> +
> +#define REGISTER(name, mask, dsi) \
> +	{ #name, VPG_DEFS(name, dsi), mask, dsi }
> +
> +struct debugfs_entries {
> +	const char				*name;
> +	bool					*reg;
> +	u32					mask;
> +	struct dw_mipi_dsi			*dsi;
> +};
> +#endif /* CONFIG_DEBUG_FS */
> +
>   struct dw_mipi_dsi {
>   	struct drm_bridge bridge;
>   	struct mipi_dsi_host dsi_host;
> @@ -238,9 +254,12 @@ struct dw_mipi_dsi {
>   
>   #ifdef CONFIG_DEBUG_FS
>   	struct dentry *debugfs;
> -
> -	bool vpg;
> -	bool vpg_horizontal;
> +	struct debugfs_entries *debugfs_vpg;
> +	struct {
> +		bool vpg;
> +		bool vpg_horizontal;
> +		bool vpg_ber_pattern;
> +	} vpg_defs;
>   #endif /* CONFIG_DEBUG_FS */
>   
>   	struct dw_mipi_dsi *master; /* dual-dsi master ptr */
> @@ -530,9 +549,11 @@ static void dw_mipi_dsi_video_mode_config(struct dw_mipi_dsi *dsi)
>   		val |= VID_MODE_TYPE_NON_BURST_SYNC_EVENTS;
>   
>   #ifdef CONFIG_DEBUG_FS
> -	if (dsi->vpg) {
> +	if (dsi->vpg_defs.vpg) {
>   		val |= VID_MODE_VPG_ENABLE;
> -		val |= dsi->vpg_horizontal ? VID_MODE_VPG_HORIZONTAL : 0;
> +		val |= dsi->vpg_defs.vpg_horizontal ?
> +		       VID_MODE_VPG_HORIZONTAL : 0;
> +		val |= dsi->vpg_defs.vpg_ber_pattern ? VID_MODE_VPG_MODE : 0;
>   	}
>   #endif /* CONFIG_DEBUG_FS */
>   
> @@ -961,6 +982,68 @@ static const struct drm_bridge_funcs dw_mipi_dsi_bridge_funcs = {
>   
>   #ifdef CONFIG_DEBUG_FS
>   
> +int dw_mipi_dsi_debugfs_write(void *data, u64 val)
> +{
> +	struct debugfs_entries *vpg = data;
> +	struct dw_mipi_dsi *dsi;
> +	u32 mode_cfg;
> +
> +	if (!vpg)
> +		return -ENODEV;
> +
> +	dsi = vpg->dsi;
> +
> +	*vpg->reg = (bool)val;
> +
> +	mode_cfg = dsi_read(dsi, DSI_VID_MODE_CFG);
> +
> +	if (*vpg->reg)
> +		mode_cfg |= vpg->mask;
> +	else
> +		mode_cfg &= ~vpg->mask;
> +
> +	dsi_write(dsi, DSI_VID_MODE_CFG, mode_cfg);
> +
> +	return 0;
> +}
> +
> +int dw_mipi_dsi_debugfs_show(void *data, u64 *val)
> +{
> +	struct debugfs_entries *vpg = data;
> +
> +	if (!vpg)
> +		return -ENODEV;
> +
> +	*val = *vpg->reg;
> +
> +	return 0;
> +}
> +
> +DEFINE_DEBUGFS_ATTRIBUTE(fops_x32, dw_mipi_dsi_debugfs_show,
> +			 dw_mipi_dsi_debugfs_write, "%llu\n");
> +
> +static void debugfs_create_files(void *data)
> +{
> +	struct dw_mipi_dsi *dsi = data;
> +	struct debugfs_entries debugfs[] = {
> +		REGISTER(vpg, VID_MODE_VPG_ENABLE, dsi),
> +		REGISTER(vpg_horizontal, VID_MODE_VPG_HORIZONTAL, dsi),
> +		REGISTER(vpg_ber_pattern, VID_MODE_VPG_MODE, dsi),
> +	};
> +	int i;
> +
> +	dsi->debugfs_vpg = kmalloc(sizeof(debugfs), GFP_KERNEL);
> +	if (!dsi->debugfs_vpg)
> +		return;
> +
> +	memcpy(dsi->debugfs_vpg, debugfs, sizeof(debugfs));
> +
> +	for (i = 0; i < ARRAY_SIZE(debugfs); i++)
> +		debugfs_create_file(dsi->debugfs_vpg[i].name, 0644,
> +				    dsi->debugfs, &dsi->debugfs_vpg[i],
> +				    &fops_x32);
> +}
> +
>   static void dw_mipi_dsi_debugfs_init(struct dw_mipi_dsi *dsi)
>   {
>   	dsi->debugfs = debugfs_create_dir(dev_name(dsi->dev), NULL);
> @@ -969,14 +1052,13 @@ static void dw_mipi_dsi_debugfs_init(struct dw_mipi_dsi *dsi)
>   		return;
>   	}
>   
> -	debugfs_create_bool("vpg", 0660, dsi->debugfs, &dsi->vpg);
> -	debugfs_create_bool("vpg_horizontal", 0660, dsi->debugfs,
> -			    &dsi->vpg_horizontal);
> +	debugfs_create_files(dsi);
>   }
>   
>   static void dw_mipi_dsi_debugfs_remove(struct dw_mipi_dsi *dsi)
>   {
>   	debugfs_remove_recursive(dsi->debugfs);
> +	kfree(dsi->debugfs_vpg);
>   }
>   
>   #else
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
