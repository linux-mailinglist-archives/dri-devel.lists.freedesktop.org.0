Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87107146527
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jan 2020 10:54:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 719446FB8E;
	Thu, 23 Jan 2020 09:54:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 428 seconds by postgrey-1.36 at gabe;
 Thu, 23 Jan 2020 09:54:34 UTC
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB37C6FB8E
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jan 2020 09:54:34 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00N9qYtZ031103; Thu, 23 Jan 2020 10:54:32 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=BECIotAqTZ4curw6tCZp7XoV78IzRZm8xDxenBuoeYg=;
 b=v5co6l0ZT0ja4V444Q2EDiWN48TF9JtopDiyHfdxtgtrK6wKjZXYZWW/tvL8DC/7528h
 ndu/iObcqI+9foqqxMixF8AQG+qqi5GyMICYMGWfmivAldkqC/RJVvRxQ0CvIOy26Cgt
 qjzQO07ievY49x92P3GjLXgcIGewPdkp+cbB5lmymzLasxuZRMIEO3+AgrsZNUfIhP2Y
 z167R2XX6xpRw3y0HAFBv1cV8bGRCVjborvMAF6HWiEa5QW3itXx7E/P5HUgLKQF3Cgd
 DUGEhBKXb/fayv76FNlFbV9aCy6IZrSybiZZL8rtsFvr1UUlR9kyygeUlRFIUs2LMJ9s kA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2xkrp2hev9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Jan 2020 10:54:32 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E11CD10003D;
 Thu, 23 Jan 2020 10:54:30 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node3.st.com [10.75.127.9])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D4C42220303;
 Thu, 23 Jan 2020 10:54:30 +0100 (CET)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG3NODE3.st.com
 (10.75.127.9) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Thu, 23 Jan
 2020 10:54:30 +0100
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Thu, 23 Jan 2020 10:54:30 +0100
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
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/stm: dsi: stm mipi dsi doesn't print error on probe
 deferral
Thread-Topic: [PATCH] drm/stm: dsi: stm mipi dsi doesn't print error on probe
 deferral
Thread-Index: AQHV0ETplOrB/RayDE+q4WmBGigVhKf39OeA
Date: Thu, 23 Jan 2020 09:54:30 +0000
Message-ID: <1fd9adf5-873b-2b9d-fe22-278f2ea64746@st.com>
References: <1579602245-7577-1-git-send-email-yannick.fertre@st.com>
In-Reply-To: <1579602245-7577-1-git-send-email-yannick.fertre@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.51]
Content-ID: <8B3A3BD23C9EC140904C34361AB91F6F@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-23_01:2020-01-23,
 2020-01-22 signatures=0
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

Dears Yannick & Etienne,
Thank you for your patch,

Reviewed-by: Philippe Cornu <philippe.cornu@st.com>

Philippe :-)

On 1/21/20 11:24 AM, Yannick Fertre wrote:
> From: Etienne Carriere <etienne.carriere@st.com>
> 
> Change DSI driver to not print an error trace when probe
> is deferred for a clock resource.
> 
> Signed-off-by: Etienne Carriere <etienne.carriere@st.com>
> ---
>   drivers/gpu/drm/stm/dw_mipi_dsi-stm.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c b/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c
> index 4b16563..2e1f266 100644
> --- a/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c
> +++ b/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c
> @@ -377,7 +377,9 @@ static int dw_mipi_dsi_stm_probe(struct platform_device *pdev)
>   	dsi->pllref_clk = devm_clk_get(dev, "ref");
>   	if (IS_ERR(dsi->pllref_clk)) {
>   		ret = PTR_ERR(dsi->pllref_clk);
> -		DRM_ERROR("Unable to get pll reference clock: %d\n", ret);
> +		if (ret != -EPROBE_DEFER)
> +			DRM_ERROR("Unable to get pll reference clock: %d\n",
> +				  ret);
>   		goto err_clk_get;
>   	}
>   
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
