Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ADFE28BBEC
	for <lists+dri-devel@lfdr.de>; Mon, 12 Oct 2020 17:31:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8B4C6E4EA;
	Mon, 12 Oct 2020 15:31:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 246886E4EA
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Oct 2020 15:31:36 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09CFRx2K009325; Mon, 12 Oct 2020 17:31:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=N542qLINbv1anFY9bS8CNSsvQ1Mj8Jp+GnbcDJCIDbI=;
 b=yU7Fk4vHgMdVOCof3aFBut/LtAMM901J/RvZxy32Ku5Dnx4qUhdyzsMPhomEYZ7YMPed
 X71IHo7vNGDlixUPzwIPQnGxJkj99McRmV4JIuo9KpqWU2oVGuKstpEfWIdOTJjn7vs8
 EXyDk02BZAmxDo8OOVBdDQo0mUvNPKuknC3hqvya1H1jGlNxwbADhXhBOMjBUUc5/4Cw
 cBn+bphbd811atmWfb57HfZcbfsyPg3fAmMPnw/1nBzib1WY77jiiREYoRD2QeFV2emR
 lUAJZhckT5eoBa1Ij6D34V3UVduYNkGyGFhdAVGenEGQdaSfv8Ki5V4x6MNB6FXW0FWC Cw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34353w1wd5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Oct 2020 17:31:34 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B97FB10002A;
 Mon, 12 Oct 2020 17:31:32 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag1node1.st.com [10.75.127.1])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 97FFE2A9F57;
 Mon, 12 Oct 2020 17:31:32 +0200 (CEST)
Received: from SFHDAG2NODE3.st.com (10.75.127.6) by SFHDAG1NODE1.st.com
 (10.75.127.1) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 12 Oct
 2020 17:31:32 +0200
Received: from SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c]) by
 SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c%20]) with mapi id
 15.00.1473.003; Mon, 12 Oct 2020 17:31:32 +0200
From: Philippe CORNU <philippe.cornu@st.com>
To: Yannick FERTRE <yannick.fertre@st.com>, Antonio BORNEO
 <antonio.borneo@st.com>, Thierry Reding <thierry.reding@gmail.com>, "Sam
 Ravnborg" <sam@ravnborg.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/panel: rm68200: fix mode to 50fps
Thread-Topic: [PATCH] drm/panel: rm68200: fix mode to 50fps
Thread-Index: AQHWk0ZzzcM7a4UXCEW70da9oB7h6KmUEW0A
Date: Mon, 12 Oct 2020 15:31:32 +0000
Message-ID: <b8b082c2-4543-4080-cf6e-d14fed712669@st.com>
References: <20200925141618.12097-1-yannick.fertre@st.com>
In-Reply-To: <20200925141618.12097-1-yannick.fertre@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.50]
Content-ID: <68D722A0FC36A64FB7104D71B442DF99@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-12_12:2020-10-12,
 2020-10-12 signatures=0
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



On 9/25/20 4:16 PM, Yannick Fertre wrote:
> Compute new timings to get a framerate of 50fps with a pixel clock
> @54Mhz.
> 
> Signed-off-by: Yannick Fertre <yannick.fertre@st.com>
> ---
>   drivers/gpu/drm/panel/panel-raydium-rm68200.c | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-raydium-rm68200.c b/drivers/gpu/drm/panel/panel-raydium-rm68200.c
> index 2b9e48b0a491..412c0dbcb2b6 100644
> --- a/drivers/gpu/drm/panel/panel-raydium-rm68200.c
> +++ b/drivers/gpu/drm/panel/panel-raydium-rm68200.c
> @@ -82,15 +82,15 @@ struct rm68200 {
>   };
>   
>   static const struct drm_display_mode default_mode = {
> -	.clock = 52582,
> +	.clock = 54000,
>   	.hdisplay = 720,
> -	.hsync_start = 720 + 38,
> -	.hsync_end = 720 + 38 + 8,
> -	.htotal = 720 + 38 + 8 + 38,
> +	.hsync_start = 720 + 48,
> +	.hsync_end = 720 + 48 + 9,
> +	.htotal = 720 + 48 + 9 + 48,
>   	.vdisplay = 1280,
>   	.vsync_start = 1280 + 12,
> -	.vsync_end = 1280 + 12 + 4,
> -	.vtotal = 1280 + 12 + 4 + 12,
> +	.vsync_end = 1280 + 12 + 5,
> +	.vtotal = 1280 + 12 + 5 + 12,
>   	.flags = 0,
>   	.width_mm = 68,
>   	.height_mm = 122,
> 

Hi Yannick,
Tested-by: Philippe Cornu <philippe.cornu@st.com>
Thank you,
Philippe
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
