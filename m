Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C2CC7DC198
	for <lists+dri-devel@lfdr.de>; Mon, 30 Oct 2023 22:09:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FB7710E377;
	Mon, 30 Oct 2023 21:09:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B48710E370
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Oct 2023 21:08:59 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 39UGIwNd029123; Mon, 30 Oct 2023 21:08:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=GP9aRLJILVCR/05omHf+lNv8GV5ZrnfLJluxx1WLTo4=;
 b=BJH4dCu1RIjDX7UyLA1mbZH+6edRGDRL5H5VyzbvG2qFo49GGRLyzEciVTa+B8IZ/Q7D
 z92HXJNK0QodsJZEeGWu7F8FQFMmGIEBfK2+VNZYIoecysEfB7cNSxCs1yJi08k5b9VY
 g9bHgYOC1HR68dpbjyDLb3Q7YYIn9xNOyPZ6spEsOy4YV6OQ01+Mq5KHiaeVP8rjQFe4
 Og6m34tb3Kv/NajPOA35uJ/dMZsbe7RM5DnaBqRsPNrcDQ8/pNhE/KbfiiLve5mGrhqn
 S5pdkZlHzepMGUgItF7Uo/VVjD2Kp9Jwo+z9SeejMaZ4JKnjVOl6OG4cbJx3J/BUasnN 7A== 
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3u2b2qsdss-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 Oct 2023 21:08:35 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 39UL8YYx000670
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 Oct 2023 21:08:34 GMT
Received: from [10.134.69.165] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Mon, 30 Oct
 2023 14:08:34 -0700
Message-ID: <8c81718f-19ff-45ff-be91-ae2d69188c90@quicinc.com>
Date: Mon, 30 Oct 2023 14:08:33 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v4 3/7] drm/panel: nv3052c: Allow specifying registers
 per panel
Content-Language: en-US
To: John Watts <contact@jookia.org>, <dri-devel@lists.freedesktop.org>
References: <20231030072337.2341539-2-contact@jookia.org>
 <20231030072337.2341539-5-contact@jookia.org>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20231030072337.2341539-5-contact@jookia.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: BZaA2GbXrlDYhfPX5mtoo6e5viTnK9fV
X-Proofpoint-ORIG-GUID: BZaA2GbXrlDYhfPX5mtoo6e5viTnK9fV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-30_13,2023-10-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0
 spamscore=0 clxscore=1011 phishscore=0 priorityscore=1501 mlxlogscore=999
 suspectscore=0 impostorscore=0 lowpriorityscore=0 mlxscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2310240000
 definitions=main-2310300166
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Chris Morgan <macromorgan@hotmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, Jagan Teki <jagan@edgeble.ai>,
 Paul Cercueil <paul@crapouillou.net>, Rob Herring <robh+dt@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Christophe Branchereau <cbranchereau@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 10/30/2023 12:23 AM, John Watts wrote:
> Panel initialization registers are per-display and not tied to the
> controller itself. Different panels will specify their own registers.
> Attach the sequences to the panel info struct so future panels
> can specify their own sequences.

Hi John,

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>

Thanks,

Jessica Zhang

> 
> Signed-off-by: John Watts <contact@jookia.org>
> ---
>   .../gpu/drm/panel/panel-newvision-nv3052c.c   | 24 ++++++++++++-------
>   1 file changed, 15 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-newvision-nv3052c.c b/drivers/gpu/drm/panel/panel-newvision-nv3052c.c
> index 90dea21f9856..b0114b5e8554 100644
> --- a/drivers/gpu/drm/panel/panel-newvision-nv3052c.c
> +++ b/drivers/gpu/drm/panel/panel-newvision-nv3052c.c
> @@ -20,11 +20,18 @@
>   #include <drm/drm_modes.h>
>   #include <drm/drm_panel.h>
>   
> +struct nv3052c_reg {
> +	u8 cmd;
> +	u8 val;
> +};
> +
>   struct nv3052c_panel_info {
>   	const struct drm_display_mode *display_modes;
>   	unsigned int num_modes;
>   	u16 width_mm, height_mm;
>   	u32 bus_format, bus_flags;
> +	const struct nv3052c_reg *panel_regs;
> +	unsigned int panel_regs_len;
>   };
>   
>   struct nv3052c {
> @@ -36,12 +43,7 @@ struct nv3052c {
>   	struct gpio_desc *reset_gpio;
>   };
>   
> -struct nv3052c_reg {
> -	u8 cmd;
> -	u8 val;
> -};
> -
> -static const struct nv3052c_reg nv3052c_panel_regs[] = {
> +static const struct nv3052c_reg ltk035c5444t_panel_regs[] = {
>   	// EXTC Command set enable, select page 1
>   	{ 0xff, 0x30 }, { 0xff, 0x52 }, { 0xff, 0x01 },
>   	// Mostly unknown registers
> @@ -244,6 +246,8 @@ static inline struct nv3052c *to_nv3052c(struct drm_panel *panel)
>   static int nv3052c_prepare(struct drm_panel *panel)
>   {
>   	struct nv3052c *priv = to_nv3052c(panel);
> +	const struct nv3052c_reg *panel_regs = priv->panel_info->panel_regs;
> +	unsigned int panel_regs_len = priv->panel_info->panel_regs_len;
>   	struct mipi_dbi *dbi = &priv->dbi;
>   	unsigned int i;
>   	int err;
> @@ -260,9 +264,9 @@ static int nv3052c_prepare(struct drm_panel *panel)
>   	gpiod_set_value_cansleep(priv->reset_gpio, 0);
>   	usleep_range(5000, 20000);
>   
> -	for (i = 0; i < ARRAY_SIZE(nv3052c_panel_regs); i++) {
> -		err = mipi_dbi_command(dbi, nv3052c_panel_regs[i].cmd,
> -				       nv3052c_panel_regs[i].val);
> +	for (i = 0; i < panel_regs_len; i++) {
> +		err = mipi_dbi_command(dbi, panel_regs[i].cmd,
> +				       panel_regs[i].val);
>   
>   		if (err) {
>   			dev_err(priv->dev, "Unable to set register: %d\n", err);
> @@ -463,6 +467,8 @@ static const struct nv3052c_panel_info ltk035c5444t_panel_info = {
>   	.height_mm = 64,
>   	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
>   	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE,
> +	.panel_regs = ltk035c5444t_panel_regs,
> +	.panel_regs_len = ARRAY_SIZE(ltk035c5444t_panel_regs),
>   };
>   
>   static const struct spi_device_id nv3052c_ids[] = {
> -- 
> 2.42.0
> 
