Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6278B7A294D
	for <lists+dri-devel@lfdr.de>; Fri, 15 Sep 2023 23:24:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6B9E10E68A;
	Fri, 15 Sep 2023 21:24:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 808FC10E68A
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Sep 2023 21:24:13 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 38FJt3GG008372; Fri, 15 Sep 2023 21:23:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=j2srMlgd+gSkKgJyE08vvd3NQ0c7NlhfaDS/LP6uMFM=;
 b=ff6ue9Q3as93DGU1bIye5qHvjAZIRmy8gZQHRlUetZcNyffjtzHjrs0DZf6QkyeFrSgq
 JuUE//udbgfarjf35n/6PdCJRBOcY63CoymEoeBOG6Zdu0Ekag1dDdj/wzUTWks/qHTQ
 GfSJLKVF4P0vmpuQRPFP1AwZJO6gv5Ms59eYO//0bGqkV6ZCtBVYDf8VMnd2/6NNBWgY
 9zkwStdlT00YRxlCVBTKuuIMq8Ia0kJHSX4Y7CnRr7OHjGFAp3Fo7TpqwoY190VsgY+k
 VoY4qSs/xhiqyW83crwNm2YOC3X4g/cXkMXIol4MU43sRoGL+ZLGW1+11JcOo54Iuake uA== 
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t4g86t5pe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 15 Sep 2023 21:23:56 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38FLNtRj020242
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 15 Sep 2023 21:23:55 GMT
Received: from [10.71.110.254] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Fri, 15 Sep
 2023 14:23:55 -0700
Message-ID: <66dacc5c-fa00-1903-43d9-53094c516ebb@quicinc.com>
Date: Fri, 15 Sep 2023 14:23:54 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 5/8] drm/panel: nv3052c: Allow specifying registers
 per panel
Content-Language: en-US
To: John Watts <contact@jookia.org>, <dri-devel@lists.freedesktop.org>
References: <20230911090206.3121440-1-contact@jookia.org>
 <20230911090206.3121440-6-contact@jookia.org>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20230911090206.3121440-6-contact@jookia.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: KEpVqJR02qWL-WP30iz1EDOS-YkFArgK
X-Proofpoint-ORIG-GUID: KEpVqJR02qWL-WP30iz1EDOS-YkFArgK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-15_17,2023-09-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015
 bulkscore=0 impostorscore=0 adultscore=0 suspectscore=0 malwarescore=0
 spamscore=0 mlxscore=0 priorityscore=1501 mlxlogscore=999
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309150191
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
 Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>,
 linux-kernel@vger.kernel.org, Jagan Teki <jagan@edgeble.ai>,
 Rob Herring <robh+dt@kernel.org>, Chris Morgan <macromorgan@hotmail.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 9/11/2023 2:02 AM, John Watts wrote:
> Panel initialization registers are per-display and not tied to the
> controller itself. Different panels will specify their own registers.
> Attach the sequences to the panel info struct so future panels
> can specify their own sequences.
> 
> Signed-off-by: John Watts <contact@jookia.org>
> ---
>   .../gpu/drm/panel/panel-newvision-nv3052c.c   | 25 ++++++++++++-------
>   1 file changed, 16 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-newvision-nv3052c.c b/drivers/gpu/drm/panel/panel-newvision-nv3052c.c
> index 307335d0f1fc..b2ad9b3a5eb7 100644
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
> +	int panel_regs_len;
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
> @@ -244,6 +246,7 @@ static inline struct nv3052c *to_nv3052c(struct drm_panel *panel)
>   static int nv3052c_prepare(struct drm_panel *panel)
>   {
>   	struct nv3052c *priv = to_nv3052c(panel);
> +	const struct nv3052c_reg *panel_regs = priv->panel_info->panel_regs;
>   	struct mipi_dbi *dbi = &priv->dbi;
>   	unsigned int i;
>   	int err;
> @@ -260,9 +263,11 @@ static int nv3052c_prepare(struct drm_panel *panel)
>   	gpiod_set_value_cansleep(priv->reset_gpio, 0);
>   	msleep(150);
>   
> -	for (i = 0; i < ARRAY_SIZE(nv3052c_panel_regs); i++) {
> -		err = mipi_dbi_command(dbi, nv3052c_panel_regs[i].cmd,
> -				       nv3052c_panel_regs[i].val);
> +	int panel_regs_len = priv->panel_info->panel_regs_len;

Hi John,

Sorry for not catching this earlier -- can you move the declaration of 
panel_regs_len to the top of the function? Otherwise this throws a 
compiler warning.

With that change,

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>

Thanks,

Jessica Zhang

> +
> +	for (i = 0; i < panel_regs_len; i++) {
> +		err = mipi_dbi_command(dbi, panel_regs[i].cmd,
> +				       panel_regs[i].val);
>   
>   		if (err) {
>   			dev_err(priv->dev, "Unable to set register: %d\n", err);
> @@ -466,6 +471,8 @@ static const struct nv3052c_panel_info ltk035c5444t_panel_info = {
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
