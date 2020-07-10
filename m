Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 405B321B2E6
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jul 2020 12:01:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 646446E062;
	Fri, 10 Jul 2020 10:01:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B92446E062
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jul 2020 10:01:28 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06A8hvsN023297; Fri, 10 Jul 2020 10:47:16 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=PrN5kBt2TadyKgoLOcW355tH8MFDlyPGhVCqGnwYIbg=;
 b=AahgDr6fLSVPD+7/zRFJ8QQLDZR7z0NW7fZM9JnEqlBUB7gyBtdN0pGO4jucEMCDrx2x
 4Vnus3hjNObAWTrO2BONsmcw0AcGXZGauvAoix0ns47r0oKRd4ybLrY3xSTPTaelkd3k
 xLWyDgjQaA/dHqOxmKGwoDbVKhYShJveMlgZkaaKWByuk+XAX5A39pghRfoySOqPxdIa
 NvuKWv8Km57ROUT+dzicTN74USqKUe/EO1u4KqhqS0UwUEDBwnkR3JIqZw3DrYYGsEFN
 jTyLFDyRj6j98feg6edaZHugHZeYlmc5XX4vnTZmcO1odjW4FUpxeNerIdM8Gz/bDGSR gg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 325k3w23uw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Jul 2020 10:47:16 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BC776100038;
 Fri, 10 Jul 2020 10:47:15 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 93B8B2AD2C5;
 Fri, 10 Jul 2020 10:47:15 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 10 Jul
 2020 10:47:15 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Fri, 10 Jul 2020 10:47:15 +0200
From: Philippe CORNU <philippe.cornu@st.com>
To: Yannick FERTRE <yannick.fertre@st.com>, Benjamin GAIGNARD
 <benjamin.gaignard@st.com>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, "Alexandre
 TORGUE" <alexandre.torgue@st.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, Antonio BORNEO <antonio.borneo@st.com>
Subject: Re: [PATCH] drm/bridge/synopsys: dsi: allow sending longer LP commands
Thread-Topic: [PATCH] drm/bridge/synopsys: dsi: allow sending longer LP
 commands
Thread-Index: AQHWT7RR56+kk8DFkkudT5fcfOVJRKkAbGUA
Date: Fri, 10 Jul 2020 08:47:14 +0000
Message-ID: <4947d7a1-5816-5789-dfcd-e802a9463ffa@st.com>
References: <20200701143131.841-1-yannick.fertre@st.com>
In-Reply-To: <20200701143131.841-1-yannick.fertre@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.50]
Content-ID: <03D6A15FFFB854438405B991F3EA5C68@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-10_02:2020-07-10,
 2020-07-10 signatures=0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 7/1/20 4:31 PM, Yannick Fertre wrote:
> From: Antonio Borneo <antonio.borneo@st.com>
> 
> Current code does not properly computes the max length of LP
> commands that can be send during H or V sync, and rely on static
> values.
> Limiting the max LP length to 4 byte during the V-sync is overly
> conservative.
> 
> Relax the limit and allows longer LP commands (16 bytes) to be
> sent during V-sync.
> 
> Signed-off-by: Antonio Borneo <antonio.borneo@st.com>
> ---
>   drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c | 17 +++++++++--------
>   1 file changed, 9 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> index d580b2aa4ce9..1a24ea648ef8 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> @@ -360,6 +360,15 @@ static void dw_mipi_message_config(struct dw_mipi_dsi *dsi,
>   	bool lpm = msg->flags & MIPI_DSI_MSG_USE_LPM;
>   	u32 val = 0;
>   
> +	/*
> +	 * TODO dw drv improvements
> +	 * largest packet sizes during hfp or during vsa/vpb/vfp
> +	 * should be computed according to byte lane, lane number and only
> +	 * if sending lp cmds in high speed is enable (PHY_TXREQUESTCLKHS)
> +	 */
> +	dsi_write(dsi, DSI_DPI_LP_CMD_TIM, OUTVACT_LPCMD_TIME(16)
> +		  | INVACT_LPCMD_TIME(4));
> +
>   	if (msg->flags & MIPI_DSI_MSG_REQ_ACK)
>   		val |= ACK_RQST_EN;
>   	if (lpm)
> @@ -611,14 +620,6 @@ static void dw_mipi_dsi_dpi_config(struct dw_mipi_dsi *dsi,
>   	dsi_write(dsi, DSI_DPI_VCID, DPI_VCID(dsi->channel));
>   	dsi_write(dsi, DSI_DPI_COLOR_CODING, color);
>   	dsi_write(dsi, DSI_DPI_CFG_POL, val);
> -	/*
> -	 * TODO dw drv improvements
> -	 * largest packet sizes during hfp or during vsa/vpb/vfp
> -	 * should be computed according to byte lane, lane number and only
> -	 * if sending lp cmds in high speed is enable (PHY_TXREQUESTCLKHS)
> -	 */
> -	dsi_write(dsi, DSI_DPI_LP_CMD_TIM, OUTVACT_LPCMD_TIME(4)
> -		  | INVACT_LPCMD_TIME(4));
>   }
>   
>   static void dw_mipi_dsi_packet_handler_config(struct dw_mipi_dsi *dsi)
> 

(+ Antonio)

Hi Yannick & Antonio,

Reviewed-by: Philippe Cornu <philippe.cornu@st.com>
Tested-by: Philippe Cornu <philippe.cornu@st.com>

(Tested with the 3 patches named
drm/bridge/synopsys: dsi: allow LP commands in video mode
drm/bridge/synopsys: dsi: allow sending longer LP commands
drm/bridge/synopsys: dsi: add support for non-continuous HS clock
on various dsi bridges + stm32mp157 disco board)

Many thanks
Philippe :-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
