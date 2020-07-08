Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56DD8219184
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jul 2020 22:30:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09BBD6E0F9;
	Wed,  8 Jul 2020 20:29:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B91BC6E0F9
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jul 2020 20:29:56 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id q15so4578179wmj.2
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jul 2020 13:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=bFFXDls7rxsx9mgSBw8JFPExDFAh6mKZQvI3ucZYObE=;
 b=wpfoermkPGCvl5J0FARD4TAPvPDa0E06xA2E/KrD+6Af8bzVfKPCX1hwAt3Ijg1QtG
 m6e5Fh7TC4Jyt2n9TGauN/6FlN7id1IGrFEc8b5kev2FHX4RIv38+BIwAgrBPkYYdgNp
 fJUJNBkhJjwjs4L2HVhZKOEUh/0nPVlGiqAHiBtX+5ZdaqUX5APEIULFmC+DVBHiI7JS
 JZ8VuOcUCRwM73o86DD3sdpVZSwA5S82BUZ0U7HvtiGrlrJT7XUd8qeyr9OD48On5cXS
 1kHusgkWLGlynCr9RhAz56gySshhESQno05VFQuCq6wRY1jOH1U2QwLD4Mhn1dI0wPYF
 I1dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:cc:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding;
 bh=bFFXDls7rxsx9mgSBw8JFPExDFAh6mKZQvI3ucZYObE=;
 b=fNsqnKabRc504hnRK9J0OEOTn5jTJS0ytliyTXqt1fRecnyb0vLScjt7S49loEePg8
 U8GlAYGMft6VfawgZsoAwOsMxr4rEDxLDg+NmguN0dfEUab5QAaHY0LLi1zk//m5orvi
 4lQN6KZTtdx2Mwf5nXw5k9t0SflzqYIw7n/nZMSc1562PS7CkRnIcCzljSnbUZhkug/g
 +m7bPcW2ZfAlJOjv1W0MFJlUxbWqZbTL2+VsduXk4tDsOajUJhL2yYAXB7PFixtVu50I
 wVYK9YEDVwp7nXNtioRL8Ku+xGUpkKdq1FfgIynBJ41EHT4cuqfGbahHOS7UAm8FdjvN
 TtZA==
X-Gm-Message-State: AOAM532ovywWKTA0PAX8pqVy4kS8YdL3QxmMG+Z38YEcHNUZmFRoZOH5
 7EITWGDcdcNiiWZAyLXPDl6gGg==
X-Google-Smtp-Source: ABdhPJxp55oJfL2bLdrtFg2XOfpW5Q8FVMooovyIuRE2OclHpUNlgYZtsX9jgeq+AZzO33ruBdoDZg==
X-Received: by 2002:a1c:98c1:: with SMTP id a184mr9559308wme.116.1594240195367; 
 Wed, 08 Jul 2020 13:29:55 -0700 (PDT)
Received: from Armstrongs-MacBook-Pro.local
 ([2a01:e35:2ec0:82b0:847:4f0c:a891:12f5])
 by smtp.gmail.com with ESMTPSA id m10sm1753945wru.4.2020.07.08.13.29.53
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 08 Jul 2020 13:29:54 -0700 (PDT)
Subject: Re: [PATCH v2] drm/bridge: dw-mipi-dsi.c: Add VPG runtime config
 through debugfs
To: Angelo Ribeiro <Angelo.Ribeiro@synopsys.com>,
 Yannick FERTRE <yannick.fertre@st.com>,
 Philippe CORNU <philippe.cornu@st.com>,
 Benjamin GAIGNARD <benjamin.gaignard@st.com>,
 "airlied@linux.ie" <airlied@linux.ie>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 Alexandre TORGUE <alexandre.torgue@st.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "pop.adrian61@gmail.com" <pop.adrian61@gmail.com>
References: <a809feb7d7153a92e323416f744f1565e995da01.1586180592.git.angelo.ribeiro@synopsys.com>
 <d46d3aaf-d3cd-e5e1-81b9-c019537bd09a@st.com>
 <CH2PR12MB37823C45C7CC1A142ACC4BBECB670@CH2PR12MB3782.namprd12.prod.outlook.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Message-ID: <efdcfed7-dda1-786b-8e59-cf314eb9f995@baylibre.com>
Date: Wed, 8 Jul 2020 22:29:54 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:45.0)
 Gecko/20100101 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <CH2PR12MB37823C45C7CC1A142ACC4BBECB670@CH2PR12MB3782.namprd12.prod.outlook.com>
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
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Le 08/07/2020 =E0 19:08, Angelo Ribeiro a =E9crit :
> Hi,
> =

> Is this patch good to go? =

> @daniel@ffwll.ch, @Philippe CORNU
> =

> Was already tested by @Yannick FERTRE =

> and @Adrian Pop
> on https://lkml.org/lkml/2020/4/6/691 .

It would be great to have a review or an ack before applying.

Neil

> =

> Thanks,
> Angelo
> =

> From: Yannick =

> FERTRE <yannick.fertre@st.com>
> Date: Wed, Jun 24, 2020 at 16:35:04
> =

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
>>>    - Added VID_MODE_VPG_MODE
>>>    - Solved incompatible return type on __get and __set
>>>
>>> Reported-by: kbuild test robot <lkp@intel.com>
>>> Reported-by: Adrian Pop <pop.adrian61@gmail.com>
>>> Cc: Gustavo Pimentel <gustavo.pimentel@synopsys.com>
>>> Cc: Joao Pinto <jpinto@synopsys.com>
>>> Cc: Jose Abreu <jose.abreu@synopsys.com>
>>> Signed-off-by: Angelo Ribeiro <angelo.ribeiro@synopsys.com>
>>> ---
>>>   drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c | 98 ++++++++++++++++++=
++++++---
>>>   1 file changed, 90 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c b/drivers/gp=
u/drm/bridge/synopsys/dw-mipi-dsi.c
>>> index b18351b..9de3645 100644
>>> --- a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
>>> +++ b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
>>> @@ -91,6 +91,7 @@
>>>   #define VID_MODE_TYPE_BURST			0x2
>>>   #define VID_MODE_TYPE_MASK			0x3
>>>   #define VID_MODE_VPG_ENABLE		BIT(16)
>>> +#define VID_MODE_VPG_MODE		BIT(20)
>>>   #define VID_MODE_VPG_HORIZONTAL		BIT(24)
>>>   =

>>>   #define DSI_VID_PKT_SIZE		0x3c
>>> @@ -221,6 +222,21 @@
>>>   #define PHY_STATUS_TIMEOUT_US		10000
>>>   #define CMD_PKT_STATUS_TIMEOUT_US	20000
>>>   =

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
>>>   struct dw_mipi_dsi {
>>>   	struct drm_bridge bridge;
>>>   	struct mipi_dsi_host dsi_host;
>>> @@ -238,9 +254,12 @@ struct dw_mipi_dsi {
>>>   =

>>>   #ifdef CONFIG_DEBUG_FS
>>>   	struct dentry *debugfs;
>>> -
>>> -	bool vpg;
>>> -	bool vpg_horizontal;
>>> +	struct debugfs_entries *debugfs_vpg;
>>> +	struct {
>>> +		bool vpg;
>>> +		bool vpg_horizontal;
>>> +		bool vpg_ber_pattern;
>>> +	} vpg_defs;
>>>   #endif /* CONFIG_DEBUG_FS */
>>>   =

>>>   	struct dw_mipi_dsi *master; /* dual-dsi master ptr */
>>> @@ -530,9 +549,11 @@ static void dw_mipi_dsi_video_mode_config(struct d=
w_mipi_dsi *dsi)
>>>   		val |=3D VID_MODE_TYPE_NON_BURST_SYNC_EVENTS;
>>>   =

>>>   #ifdef CONFIG_DEBUG_FS
>>> -	if (dsi->vpg) {
>>> +	if (dsi->vpg_defs.vpg) {
>>>   		val |=3D VID_MODE_VPG_ENABLE;
>>> -		val |=3D dsi->vpg_horizontal ? VID_MODE_VPG_HORIZONTAL : 0;
>>> +		val |=3D dsi->vpg_defs.vpg_horizontal ?
>>> +		       VID_MODE_VPG_HORIZONTAL : 0;
>>> +		val |=3D dsi->vpg_defs.vpg_ber_pattern ? VID_MODE_VPG_MODE : 0;
>>>   	}
>>>   #endif /* CONFIG_DEBUG_FS */
>>>   =

>>> @@ -961,6 +982,68 @@ static const struct drm_bridge_funcs dw_mipi_dsi_b=
ridge_funcs =3D {
>>>   =

>>>   #ifdef CONFIG_DEBUG_FS
>>>   =

>>> +int dw_mipi_dsi_debugfs_write(void *data, u64 val)
>>> +{
>>> +	struct debugfs_entries *vpg =3D data;
>>> +	struct dw_mipi_dsi *dsi;
>>> +	u32 mode_cfg;
>>> +
>>> +	if (!vpg)
>>> +		return -ENODEV;
>>> +
>>> +	dsi =3D vpg->dsi;
>>> +
>>> +	*vpg->reg =3D (bool)val;
>>> +
>>> +	mode_cfg =3D dsi_read(dsi, DSI_VID_MODE_CFG);
>>> +
>>> +	if (*vpg->reg)
>>> +		mode_cfg |=3D vpg->mask;
>>> +	else
>>> +		mode_cfg &=3D ~vpg->mask;
>>> +
>>> +	dsi_write(dsi, DSI_VID_MODE_CFG, mode_cfg);
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +int dw_mipi_dsi_debugfs_show(void *data, u64 *val)
>>> +{
>>> +	struct debugfs_entries *vpg =3D data;
>>> +
>>> +	if (!vpg)
>>> +		return -ENODEV;
>>> +
>>> +	*val =3D *vpg->reg;
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +DEFINE_DEBUGFS_ATTRIBUTE(fops_x32, dw_mipi_dsi_debugfs_show,
>>> +			 dw_mipi_dsi_debugfs_write, "%llu\n");
>>> +
>>> +static void debugfs_create_files(void *data)
>>> +{
>>> +	struct dw_mipi_dsi *dsi =3D data;
>>> +	struct debugfs_entries debugfs[] =3D {
>>> +		REGISTER(vpg, VID_MODE_VPG_ENABLE, dsi),
>>> +		REGISTER(vpg_horizontal, VID_MODE_VPG_HORIZONTAL, dsi),
>>> +		REGISTER(vpg_ber_pattern, VID_MODE_VPG_MODE, dsi),
>>> +	};
>>> +	int i;
>>> +
>>> +	dsi->debugfs_vpg =3D kmalloc(sizeof(debugfs), GFP_KERNEL);
>>> +	if (!dsi->debugfs_vpg)
>>> +		return;
>>> +
>>> +	memcpy(dsi->debugfs_vpg, debugfs, sizeof(debugfs));
>>> +
>>> +	for (i =3D 0; i < ARRAY_SIZE(debugfs); i++)
>>> +		debugfs_create_file(dsi->debugfs_vpg[i].name, 0644,
>>> +				    dsi->debugfs, &dsi->debugfs_vpg[i],
>>> +				    &fops_x32);
>>> +}
>>> +
>>>   static void dw_mipi_dsi_debugfs_init(struct dw_mipi_dsi *dsi)
>>>   {
>>>   	dsi->debugfs =3D debugfs_create_dir(dev_name(dsi->dev), NULL);
>>> @@ -969,14 +1052,13 @@ static void dw_mipi_dsi_debugfs_init(struct dw_m=
ipi_dsi *dsi)
>>>   		return;
>>>   	}
>>>   =

>>> -	debugfs_create_bool("vpg", 0660, dsi->debugfs, &dsi->vpg);
>>> -	debugfs_create_bool("vpg_horizontal", 0660, dsi->debugfs,
>>> -			    &dsi->vpg_horizontal);
>>> +	debugfs_create_files(dsi);
>>>   }
>>>   =

>>>   static void dw_mipi_dsi_debugfs_remove(struct dw_mipi_dsi *dsi)
>>>   {
>>>   	debugfs_remove_recursive(dsi->debugfs);
>>> +	kfree(dsi->debugfs_vpg);
>>>   }
>>>   =

>>>   #else
>>>
>> _______________________________________________
>> dri-devel mailing list
>> dri-devel@lists.freedesktop.org
>> https://urldefense.com/v3/__https://lists.freedesktop.org/mailman/listin=
fo/dri-devel__;!!A4F2R9G_pg!PaD758-TpCHJcJG4biB5oM3WJXd1mTbLitD8K1qzSVQ4Z06=
nc__06MR_sz-ITMIl$ =

> =

> =

> =

> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> =

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
