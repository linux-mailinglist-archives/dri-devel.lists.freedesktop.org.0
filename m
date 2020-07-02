Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91AC9212314
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jul 2020 14:18:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBAAB6E227;
	Thu,  2 Jul 2020 12:18:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE5786E227
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jul 2020 12:18:50 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 062CF0Xf002765; Thu, 2 Jul 2020 14:18:48 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=ApHQVP3ut9KFHFGKREMuERST8R+KVi3zooiVAiRvOS0=;
 b=PDOJ8M5cQFdcAqiECihaBjSye2+EZjphHUCP0BlFaPeZ79vxyTgV+abZvJumZ6Ez0S29
 miHh8S7TlWYhJJFhg+1Ob5Bi9he3ok/FnBrQsIygzAVYGVvmbZw5ThypbCfXotwsjC7s
 t6t8zrYg/TmcbPWXx588S3zCMKJc+Y2TI3wWg79XtEgMH71nSYXdEULTubjWfu7lcW0T
 PMGqOX8STyZ46REko1j934IT/mP0aCBbCfAT5Zhp5PK6Pmupgl/1Ipy9EAJY1czYRT17
 Jy5XsCdK7DSVpgII860QFLo66glLk+1ifaX1+n7LhFzNW1kL1kZBcrG+yLibl72tKk/H yw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31ww0gg08e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Jul 2020 14:18:48 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B71A310002A;
 Thu,  2 Jul 2020 14:18:47 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node3.st.com [10.75.127.9])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 994A82B1888;
 Thu,  2 Jul 2020 14:18:47 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG3NODE3.st.com
 (10.75.127.9) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Thu, 2 Jul
 2020 14:18:47 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Thu, 2 Jul 2020 14:18:46 +0200
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
Subject: Re: [PATCH] drm/stm: ltdc: remove call of pm-runtime functions
Thread-Topic: [PATCH] drm/stm: ltdc: remove call of pm-runtime functions
Thread-Index: AQHWT5+4ILeimEtCa0WCtAriQBB35Kj0FRcA
Date: Thu, 2 Jul 2020 12:18:46 +0000
Message-ID: <3b6e02b8-0f54-4eb0-9728-b304a1aa85d5@st.com>
References: <20200701120402.6444-1-yannick.fertre@st.com>
In-Reply-To: <20200701120402.6444-1-yannick.fertre@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.44]
Content-ID: <511E233C1CF6BF4C9507F21CE354F452@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-02_05:2020-07-02,
 2020-07-02 signatures=0
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



On 7/1/20 2:04 PM, Yannick Fertre wrote:
> It is not necessary to suspend or stop the ltdc clocks
> to modify the pixel clock.
> 
> Signed-off-by: Yannick Fertre <yannick.fertre@st.com>
> ---
>   drivers/gpu/drm/stm/ltdc.c | 16 ----------------
>   1 file changed, 16 deletions(-)
> 
> diff --git a/drivers/gpu/drm/stm/ltdc.c b/drivers/gpu/drm/stm/ltdc.c
> index 3f590d916e91..6e28f707092f 100644
> --- a/drivers/gpu/drm/stm/ltdc.c
> +++ b/drivers/gpu/drm/stm/ltdc.c
> @@ -506,15 +506,7 @@ static bool ltdc_crtc_mode_fixup(struct drm_crtc *crtc,
>   				 struct drm_display_mode *adjusted_mode)
>   {
>   	struct ltdc_device *ldev = crtc_to_ltdc(crtc);
> -	struct drm_device *ddev = crtc->dev;
>   	int rate = mode->clock * 1000;
> -	bool runtime_active;
> -	int ret;
> -
> -	runtime_active = pm_runtime_active(ddev->dev);
> -
> -	if (runtime_active)
> -		pm_runtime_put_sync(ddev->dev);
>   
>   	if (clk_set_rate(ldev->pixel_clk, rate) < 0) {
>   		DRM_ERROR("Cannot set rate (%dHz) for pixel clk\n", rate);
> @@ -523,14 +515,6 @@ static bool ltdc_crtc_mode_fixup(struct drm_crtc *crtc,
>   
>   	adjusted_mode->clock = clk_get_rate(ldev->pixel_clk) / 1000;
>   
> -	if (runtime_active) {
> -		ret = pm_runtime_get_sync(ddev->dev);
> -		if (ret) {
> -			DRM_ERROR("Failed to fixup mode, cannot get sync\n");
> -			return false;
> -		}
> -	}
> -
>   	DRM_DEBUG_DRIVER("requested clock %dkHz, adjusted clock %dkHz\n",
>   			 mode->clock, adjusted_mode->clock);
>   
> 
Hi Yannick,
Many thanks for your patch,
Acked-by: Philippe Cornu <philippe.cornu@st.com>
Philippe :-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
