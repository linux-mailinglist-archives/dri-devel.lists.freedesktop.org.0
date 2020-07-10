Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FCB421B205
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jul 2020 11:09:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D17BB6EBA8;
	Fri, 10 Jul 2020 09:09:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1515 seconds by postgrey-1.36 at gabe;
 Fri, 10 Jul 2020 09:09:15 UTC
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EAA56EBA8
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jul 2020 09:09:14 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06A8gvMY019342; Fri, 10 Jul 2020 10:47:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=hW99NkJO01Cohy8Gf4OtWTFT16GdgjphlWc9M91Ndb0=;
 b=ALie7Y91hIP0v34yBtcNOs7wvwnOIT/72QqC4tHooxspJoBoVHqjFYstbZlmAYuQST+H
 v0iur6QqLKBBOluT/GlS1SIu8Qp2+BNLAtE3tFptVf6/oNP9YI+okSrm2hcZna5vftud
 uoqLyCQNKdkQD6eDSBu90RrnEbcvIARBaBAJZjs8C62sMOSvPBZdyRIsTwb4eCYgsfZ6
 7oTBtyJ6Qclp/6e3mq3T5N6I3kU7Mj2KcohgKvHm9MulOwvby3Sy2fcoFaBh9zVldmLW
 iiiDJQCEXA+2SBJAMNJ9c6zUVcF0XxEKohucHxQCp8EoMHuhhdrbqtOUTvOR7Zmrc0// BQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 325k4d241m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Jul 2020 10:47:24 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E4B7B10002A;
 Fri, 10 Jul 2020 10:47:23 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D9CF72A5AD2;
 Fri, 10 Jul 2020 10:47:23 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Fri, 10 Jul
 2020 10:47:23 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Fri, 10 Jul 2020 10:47:23 +0200
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
Subject: Re: [PATCH] drm/bridge/synopsys: dsi: add support for non-continuous
 HS clock
Thread-Topic: [PATCH] drm/bridge/synopsys: dsi: add support for non-continuous
 HS clock
Thread-Index: AQHWT9/Fw6NgLa8gK02Mjd/7Q+XhP6kAbC6A
Date: Fri, 10 Jul 2020 08:47:23 +0000
Message-ID: <8036e047-15c6-d259-66c2-c7f625faf759@st.com>
References: <20200701194234.18123-1-yannick.fertre@st.com>
In-Reply-To: <20200701194234.18123-1-yannick.fertre@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.49]
Content-ID: <EC00A6D55CBAED45991E6F0B1D92078E@st.com>
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



On 7/1/20 9:42 PM, Yannick Fertre wrote:
> From: Antonio Borneo <antonio.borneo@st.com>
> 
> Current code enables the HS clock when video mode is started or to
> send out a HS command, and disables the HS clock to send out a LP
> command. This is not what DSI spec specify.
> 
> Enable HS clock either in command and in video mode.
> Set automatic HS clock management for panels and devices that
> support non-continuous HS clock.
> 
> Signed-off-by: Antonio Borneo <antonio.borneo@st.com>
> ---
>   drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c | 9 +++++++--
>   1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> index d580b2aa4ce9..979acaa90d00 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> @@ -365,7 +365,6 @@ static void dw_mipi_message_config(struct dw_mipi_dsi *dsi,
>   	if (lpm)
>   		val |= CMD_MODE_ALL_LP;
>   
> -	dsi_write(dsi, DSI_LPCLK_CTRL, lpm ? 0 : PHY_TXREQUESTCLKHS);
>   	dsi_write(dsi, DSI_CMD_MODE_CFG, val);
>   }
>   
> @@ -541,16 +540,22 @@ static void dw_mipi_dsi_video_mode_config(struct dw_mipi_dsi *dsi)
>   static void dw_mipi_dsi_set_mode(struct dw_mipi_dsi *dsi,
>   				 unsigned long mode_flags)
>   {
> +	u32 val;
> +
>   	dsi_write(dsi, DSI_PWR_UP, RESET);
>   
>   	if (mode_flags & MIPI_DSI_MODE_VIDEO) {
>   		dsi_write(dsi, DSI_MODE_CFG, ENABLE_VIDEO_MODE);
>   		dw_mipi_dsi_video_mode_config(dsi);
> -		dsi_write(dsi, DSI_LPCLK_CTRL, PHY_TXREQUESTCLKHS);
>   	} else {
>   		dsi_write(dsi, DSI_MODE_CFG, ENABLE_CMD_MODE);
>   	}
>   
> +	val = PHY_TXREQUESTCLKHS;
> +	if (dsi->mode_flags & MIPI_DSI_CLOCK_NON_CONTINUOUS)
> +		val |= AUTO_CLKLANE_CTRL;
> +	dsi_write(dsi, DSI_LPCLK_CTRL, val);
> +
>   	dsi_write(dsi, DSI_PWR_UP, POWERUP);
>   }
>   
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
