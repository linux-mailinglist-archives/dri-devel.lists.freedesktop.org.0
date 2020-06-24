Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A4582076AC
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jun 2020 17:08:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B33956E0D2;
	Wed, 24 Jun 2020 15:08:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41AF36E0D2
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jun 2020 15:08:28 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05OEt93L010328; Wed, 24 Jun 2020 17:08:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=Cu4nJcdjPPiXb+n9YzK3G3D0pd94rG3fyGCZHC0HXdU=;
 b=aSZwJ24DpUjFZhrkHkWOa1/MEMhBLZcaESz0n0A0LYGLkrYGTtSp9nsVZO2Zq5S6PIAl
 tqyrFHJLTI36HFsQznZsq+/mZJsV9vm1dEAXPnj+DAfSGOgGLVV2i/YHxDziQS3ue1tE
 2/tBAfSPPmTt8M9h+ZooVyP2dMpLGA77//FaQUcCfbrScsb8Gfl5UqARSf53mcOOBnTc
 4fpceT1xIVdROqbFzg8+I/ARBnBjO/URtsh+eWKHnA2+lH9FAGlTDy8xc5rlURMYtRvl
 +QV8ngb4Q1NIk8Ggm769qCmWH/CzS5oAukuCKd3EZN/WS1D+tSnOH72+DR8Z0c8cBsjo LQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31uuuccr50-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 Jun 2020 17:08:24 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7F47710002A;
 Wed, 24 Jun 2020 17:08:22 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node3.st.com [10.75.127.9])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id AF46520D8D2;
 Wed, 24 Jun 2020 17:08:22 +0200 (CEST)
Received: from SFHDAG6NODE1.st.com (10.75.127.16) by SFHDAG3NODE3.st.com
 (10.75.127.9) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Wed, 24 Jun
 2020 17:08:22 +0200
Received: from SFHDAG6NODE1.st.com ([fe80::8d96:4406:44e3:eb27]) by
 SFHDAG6NODE1.st.com ([fe80::8d96:4406:44e3:eb27%20]) with mapi id
 15.00.1473.003; Wed, 24 Jun 2020 17:08:22 +0200
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
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/bridge: dw-mipi-dsi.c: remove unused header file
Thread-Topic: [PATCH] drm/bridge: dw-mipi-dsi.c: remove unused header file
Thread-Index: AQHWCbwe7FvpTwh4cUii/3igo3RUm6joPZmA
Date: Wed, 24 Jun 2020 15:08:22 +0000
Message-ID: <669d5484-b1e5-dd5c-b4e5-f3b5a8b436b4@st.com>
References: <171ff1fb3918664a570dc8f2f34b446612505f76.1585832665.git.angelo.ribeiro@synopsys.com>
In-Reply-To: <171ff1fb3918664a570dc8f2f34b446612505f76.1585832665.git.angelo.ribeiro@synopsys.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.50]
Content-ID: <4F4842D5A8AC36458A785A495C391551@st.com>
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
thank for patch.

Reviewed-by: Yannick Fertre <yannick.fertre@st.com>



On 4/3/20 3:30 PM, Angelo Ribeiro wrote:
> dw-mipi-dsi does not use any definition from drm_probe_helper.
> 
> Coverity output:
> Event unnecessary_header:
> Including .../include/drm/drm_probe_helper.h does not provide any
> needed symbols.
> 
> Cc: Gustavo Pimentel <gustavo.pimentel@synopsys.com>
> Cc: Joao Pinto <jpinto@synopsys.com>
> Cc: Jose Abreu <jose.abreu@synopsys.com>
> Signed-off-by: Angelo Ribeiro <angelo.ribeiro@synopsys.com>
> ---
>   drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> index 024acad..582635d 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> @@ -27,7 +27,6 @@
>   #include <drm/drm_modes.h>
>   #include <drm/drm_of.h>
>   #include <drm/drm_print.h>
> -#include <drm/drm_probe_helper.h>
>   
>   #define HWVER_131			0x31333100	/* IP version 1.31 */
>   
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
