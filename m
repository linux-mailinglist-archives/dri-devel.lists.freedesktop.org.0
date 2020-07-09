Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D4D57219A47
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jul 2020 09:56:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAC826E9BF;
	Thu,  9 Jul 2020 07:56:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CBDB6E9BF
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jul 2020 07:56:17 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0697mOa6011824; Thu, 9 Jul 2020 09:56:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=PjimJKcwCGdTe67CN4aV9vRO3WO9hHLqREjVFyCK/DM=;
 b=oznUVSq5i3TEu5NSPUpfxlYxeM3m+tx2em+QoRcP296wfE5tgsPOMmO8KEh1f3hXZsh8
 DzgEKerKGYmgHR9yKHNZ8VaPWB5MkmiMsjFhUHzIfxlKG7s/6XsiMtp2fnbRcFadaO1U
 zaIXtMp0S83ZeroEicdiO9TITyZqk9R/Qe7uaOTRWpH4RB05RwgOTPZKQWqbjJ2vbD6h
 z3e9wkMkEttXeAxxS77EraZYnLSOJzXA5vhrtPsKdYzWcadSRi8GtF0KEU9ooYVm7wDW
 VGyRw5eD26N+PzeQZtMyBEzKxIqe8Jvgf9MvZhDGQpw1sMR34sL/tZ/Odjy38cYFybl/ Mw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 325k4036gm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Jul 2020 09:56:14 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C416710002A;
 Thu,  9 Jul 2020 09:56:11 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node3.st.com [10.75.127.9])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A42402A5335;
 Thu,  9 Jul 2020 09:56:11 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG3NODE3.st.com
 (10.75.127.9) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Thu, 9 Jul
 2020 09:56:11 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Thu, 9 Jul 2020 09:56:10 +0200
From: Philippe CORNU <philippe.cornu@st.com>
To: Angelo Ribeiro <Angelo.Ribeiro@synopsys.com>, Yannick FERTRE
 <yannick.fertre@st.com>, Benjamin GAIGNARD <benjamin.gaignard@st.com>,
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
Thread-Index: AQHWDBotInPkNFsaBECN9f5nx+r1ZajoYdsAgBYY4fCAANhUAA==
Date: Thu, 9 Jul 2020 07:56:10 +0000
Message-ID: <8b34476f-61b6-0d28-cf0c-1d6a08df71c8@st.com>
References: <a809feb7d7153a92e323416f744f1565e995da01.1586180592.git.angelo.ribeiro@synopsys.com>
 <d46d3aaf-d3cd-e5e1-81b9-c019537bd09a@st.com>
 <CH2PR12MB37823C45C7CC1A142ACC4BBECB670@CH2PR12MB3782.namprd12.prod.outlook.com>
In-Reply-To: <CH2PR12MB37823C45C7CC1A142ACC4BBECB670@CH2PR12MB3782.namprd12.prod.outlook.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.47]
Content-ID: <36C08152BFA52E42B8BA706BC095EAEC@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-09_04:2020-07-08,
 2020-07-09 signatures=0
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


On 7/8/20 7:08 PM, Angelo Ribeiro wrote:
> Hi,
> 
> Is this patch good to go?
> @daniel@ffwll.ch, @Philippe CORNU
> 
> Was already tested by @Yannick FERTRE
> and @Adrian Pop
> on https://lkml.org/lkml/2020/4/6/691 .
> 
> Thanks,
> Angelo
> 
> From: Yannick
> FERTRE <yannick.fertre@st.com>
> Date: Wed, Jun 24, 2020 at 16:35:04
> 
>> Hello Angelo,
>> thanks for the patch.
>> Tested-by: Yannick Fertre <yannick.fertre@st.com>
>> Tested OK on STM32MP1-DISCO, DSI v1.31
>>
>> Best regards
>>
>>
>> On 4/6/20 3:49 PM, Angelo Ribeiro wrote:
>>> Add support for the video pattern generator (VPG) BER pattern mode and
>>> configuration in runtime.
>>>
>>> This enables using the debugfs interface to manipulate the VPG after
>>> the pipeline is set.
>>> Also, enables the usage of the VPG BER pattern.
>>>
>>> Changes in v2:
>>>     - Added VID_MODE_VPG_MODE
>>>     - Solved incompatible return type on __get and __set
>>>
>>> Reported-by: kbuild test robot <lkp@intel.com>
>>> Reported-by: Adrian Pop <pop.adrian61@gmail.com>
>>> Cc: Gustavo Pimentel <gustavo.pimentel@synopsys.com>
>>> Cc: Joao Pinto <jpinto@synopsys.com>
>>> Cc: Jose Abreu <jose.abreu@synopsys.com>
>>> Signed-off-by: Angelo Ribeiro <angelo.ribeiro@synopsys.com>
>>> ---
>>>    drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c | 98 ++++++++++++++++++++++++---
>>>    1 file changed, 90 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
>>> index b18351b..9de3645 100644
>>> --- a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
>>> +++ b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
>>> @@ -91,6 +91,7 @@
>>>    #define VID_MODE_TYPE_BURST			0x2
>>>    #define VID_MODE_TYPE_MASK			0x3
>>>    #define VID_MODE_VPG_ENABLE		BIT(16)
>>> +#define VID_MODE_VPG_MODE		BIT(20)
>>>    #define VID_MODE_VPG_HORIZONTAL		BIT(24)
>>>    
>>>    #define DSI_VID_PKT_SIZE		0x3c
>>> @@ -221,6 +222,21 @@
>>>    #define PHY_STATUS_TIMEOUT_US		10000
>>>    #define CMD_PKT_STATUS_TIMEOUT_US	20000
>>>    
>>> +#ifdef CONFIG_DEBUG_FS
>>> +#define VPG_DEFS(name, dsi) \
>>> +	((void __force *)&((*dsi).vpg_defs.name))
>>> +
>>> +#define REGISTER(name, mask, dsi) \
>>> +	{ #name, VPG_DEFS(name, dsi), mask, dsi }
>>> +
>>> +struct debugfs_entries {
>>> +	const char				*name;
>>> +	bool					*reg;
>>> +	u32					mask;
>>> +	struct dw_mipi_dsi			*dsi;
>>> +};
>>> +#endif /* CONFIG_DEBUG_FS */
>>> +
>>>    struct dw_mipi_dsi {
>>>    	struct drm_bridge bridge;
>>>    	struct mipi_dsi_host dsi_host;
>>> @@ -238,9 +254,12 @@ struct dw_mipi_dsi {
>>>    
>>>    #ifdef CONFIG_DEBUG_FS
>>>    	struct dentry *debugfs;
>>> -
>>> -	bool vpg;
>>> -	bool vpg_horizontal;
>>> +	struct debugfs_entries *debugfs_vpg;
>>> +	struct {
>>> +		bool vpg;
>>> +		bool vpg_horizontal;
>>> +		bool vpg_ber_pattern;
>>> +	} vpg_defs;
>>>    #endif /* CONFIG_DEBUG_FS */
>>>    
>>>    	struct dw_mipi_dsi *master; /* dual-dsi master ptr */
>>> @@ -530,9 +549,11 @@ static void dw_mipi_dsi_video_mode_config(struct dw_mipi_dsi *dsi)
>>>    		val |= VID_MODE_TYPE_NON_BURST_SYNC_EVENTS;
>>>    
>>>    #ifdef CONFIG_DEBUG_FS
>>> -	if (dsi->vpg) {
>>> +	if (dsi->vpg_defs.vpg) {
>>>    		val |= VID_MODE_VPG_ENABLE;
>>> -		val |= dsi->vpg_horizontal ? VID_MODE_VPG_HORIZONTAL : 0;
>>> +		val |= dsi->vpg_defs.vpg_horizontal ?
>>> +		       VID_MODE_VPG_HORIZONTAL : 0;
>>> +		val |= dsi->vpg_defs.vpg_ber_pattern ? VID_MODE_VPG_MODE : 0;
>>>    	}
>>>    #endif /* CONFIG_DEBUG_FS */
>>>    
>>> @@ -961,6 +982,68 @@ static const struct drm_bridge_funcs dw_mipi_dsi_bridge_funcs = {
>>>    
>>>    #ifdef CONFIG_DEBUG_FS
>>>    
>>> +int dw_mipi_dsi_debugfs_write(void *data, u64 val)
>>> +{
>>> +	struct debugfs_entries *vpg = data;
>>> +	struct dw_mipi_dsi *dsi;
>>> +	u32 mode_cfg;
>>> +
>>> +	if (!vpg)
>>> +		return -ENODEV;
>>> +
>>> +	dsi = vpg->dsi;
>>> +
>>> +	*vpg->reg = (bool)val;
>>> +
>>> +	mode_cfg = dsi_read(dsi, DSI_VID_MODE_CFG);
>>> +
>>> +	if (*vpg->reg)
>>> +		mode_cfg |= vpg->mask;
>>> +	else
>>> +		mode_cfg &= ~vpg->mask;
>>> +
>>> +	dsi_write(dsi, DSI_VID_MODE_CFG, mode_cfg);
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +int dw_mipi_dsi_debugfs_show(void *data, u64 *val)
>>> +{
>>> +	struct debugfs_entries *vpg = data;
>>> +
>>> +	if (!vpg)
>>> +		return -ENODEV;
>>> +
>>> +	*val = *vpg->reg;
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +DEFINE_DEBUGFS_ATTRIBUTE(fops_x32, dw_mipi_dsi_debugfs_show,
>>> +			 dw_mipi_dsi_debugfs_write, "%llu\n");
>>> +
>>> +static void debugfs_create_files(void *data)
>>> +{
>>> +	struct dw_mipi_dsi *dsi = data;
>>> +	struct debugfs_entries debugfs[] = {
>>> +		REGISTER(vpg, VID_MODE_VPG_ENABLE, dsi),
>>> +		REGISTER(vpg_horizontal, VID_MODE_VPG_HORIZONTAL, dsi),
>>> +		REGISTER(vpg_ber_pattern, VID_MODE_VPG_MODE, dsi),
>>> +	};
>>> +	int i;
>>> +
>>> +	dsi->debugfs_vpg = kmalloc(sizeof(debugfs), GFP_KERNEL);
>>> +	if (!dsi->debugfs_vpg)
>>> +		return;
>>> +
>>> +	memcpy(dsi->debugfs_vpg, debugfs, sizeof(debugfs));
>>> +
>>> +	for (i = 0; i < ARRAY_SIZE(debugfs); i++)
>>> +		debugfs_create_file(dsi->debugfs_vpg[i].name, 0644,
>>> +				    dsi->debugfs, &dsi->debugfs_vpg[i],
>>> +				    &fops_x32);
>>> +}
>>> +
>>>    static void dw_mipi_dsi_debugfs_init(struct dw_mipi_dsi *dsi)
>>>    {
>>>    	dsi->debugfs = debugfs_create_dir(dev_name(dsi->dev), NULL);
>>> @@ -969,14 +1052,13 @@ static void dw_mipi_dsi_debugfs_init(struct dw_mipi_dsi *dsi)
>>>    		return;
>>>    	}
>>>    
>>> -	debugfs_create_bool("vpg", 0660, dsi->debugfs, &dsi->vpg);
>>> -	debugfs_create_bool("vpg_horizontal", 0660, dsi->debugfs,
>>> -			    &dsi->vpg_horizontal);
>>> +	debugfs_create_files(dsi);

Hi Angelo,
And thank you for your patch.
Could you please explain why you have "so many lines" for adding the ber 
pattern, instead of these 4 lines :

+#define VID_MODE_VPG_MODE		BIT(20)
+bool vpg_ber_pattern;
+val |= dsi->vpg_ber_pattern ? VID_MODE_VPG_MODE : 0;
+debugfs_create_bool("vpg_ber_pattern", 0660, dsi->debugfs, 
&dsi->vpg_ber_pattern);

Many thanks
Philippe :-)

>>>    }
>>>    
>>>    static void dw_mipi_dsi_debugfs_remove(struct dw_mipi_dsi *dsi)
>>>    {
>>>    	debugfs_remove_recursive(dsi->debugfs);
>>> +	kfree(dsi->debugfs_vpg);
>>>    }
>>>    
>>>    #else
>>>
>> _______________________________________________
>> dri-devel mailing list
>> dri-devel@lists.freedesktop.org
>> https://urldefense.com/v3/__https://lists.freedesktop.org/mailman/listinfo/dri-devel__;!!A4F2R9G_pg!PaD758-TpCHJcJG4biB5oM3WJXd1mTbLitD8K1qzSVQ4Z06nc__06MR_sz-ITMIl$
> 
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
