Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DC4645DE33
	for <lists+dri-devel@lfdr.de>; Thu, 25 Nov 2021 17:01:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE4316E40D;
	Thu, 25 Nov 2021 16:01:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 4124 seconds by postgrey-1.36 at gabe;
 Thu, 25 Nov 2021 16:01:39 UTC
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 184EA6E41D
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Nov 2021 16:01:38 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AP9Eljn002619;
 Thu, 25 Nov 2021 15:52:40 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=Ao37UzQm0lh5oIBM+v3zSsBFE77GsNS8cR3GTxHKQ+4=;
 b=V1aBcs+8MppjS7zmCAZVRa62A0L6t5ns/socJxhRcAN3BJd3be+fE4jCGFduVt6FMDSl
 kBrzx8gTlWEpSeqHlUwBeRhyuWOu550XuR15IC7/iitTJ6V4CGn4IGBjZiG8THXTCldZ
 X70FEAQEYx5EgDpCAJSnrLz6uAqq2SCcsACK8bsXyHJpzji9EMBEIx4NgL5LgDfBh0dQ
 9KQW1aeAGcUvKL/V0HhtrK3Thg2i6gRS4LcHPo204OxHNN3cpDM1b2jt/T8wqz9VePfY
 eHsQiKjCpUIwoOXvnRopebOnhXlZ729xD4xL8Q+SX7ckALi79qa/eXrOtYHpJ4xPGhR/ Ig== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3cj3cykw8d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Nov 2021 15:52:40 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A54BF10002A;
 Thu, 25 Nov 2021 15:52:37 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 75988238D87;
 Thu, 25 Nov 2021 15:52:37 +0100 (CET)
Received: from lmecxl0912.lme.st.com (10.75.127.50) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Thu, 25 Nov
 2021 15:52:36 +0100
Subject: Re: [PATCH v4 2/3] ARM: dts: stm32: fix dtbs_check warning on ili9341
 dts binding
To: <dillon.minfei@gmail.com>, <laurent.pinchart@ideasonboard.com>,
 <thierry.reding@gmail.com>, <sam@ravnborg.org>, <airlied@linux.ie>,
 <daniel@ffwll.ch>, <robh+dt@kernel.org>, <linus.walleij@linaro.org>,
 <mcoquelin.stm32@gmail.com>, <noralf@tronnes.org>
References: <1627098243-2742-1-git-send-email-dillon.minfei@gmail.com>
 <1627098243-2742-3-git-send-email-dillon.minfei@gmail.com>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
Message-ID: <9a17b095-48ca-1507-82f9-131b00562c25@foss.st.com>
Date: Thu, 25 Nov 2021 15:52:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <1627098243-2742-3-git-send-email-dillon.minfei@gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-25_06,2021-11-25_01,2020-04-07_01
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
Cc: devicetree@vger.kernel.org, kbuild-all@lists.01.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dillon

On 7/24/21 5:44 AM, dillon.minfei@gmail.com wrote:
> From: Dillon Min <dillon.minfei@gmail.com>
> 
> Since the compatible string defined from ilitek,ili9341.yaml is
> "st,sf-tc240t-9370-t", "ilitek,ili9341"
> 
> so, append "ilitek,ili9341" to avoid the below dtbs_check warning.
> 
> arch/arm/boot/dts/stm32f429-disco.dt.yaml: display@1: compatible:
> ['st,sf-tc240t-9370-t'] is too short
> 
> Fixes: a726e2f000ec ("ARM: dts: stm32: enable ltdc binding with ili9341, gyro l3gd20 on stm32429-disco board")
> Signed-off-by: Dillon Min <dillon.minfei@gmail.com>
> Reported-by: kernel test robot <lkp@intel.com>
> ---
> v4: no change.
> 
>   arch/arm/boot/dts/stm32f429-disco.dts | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/stm32f429-disco.dts b/arch/arm/boot/dts/stm32f429-disco.dts
> index 075ac57d0bf4..6435e099c632 100644
> --- a/arch/arm/boot/dts/stm32f429-disco.dts
> +++ b/arch/arm/boot/dts/stm32f429-disco.dts
> @@ -192,7 +192,7 @@
>   
>   	display: display@1{
>   		/* Connect panel-ilitek-9341 to ltdc */
> -		compatible = "st,sf-tc240t-9370-t";
> +		compatible = "st,sf-tc240t-9370-t", "ilitek,ili9341";
>   		reg = <1>;
>   		spi-3wire;
>   		spi-max-frequency = <10000000>;
> 

Patch applied on stm32-next. I updated commit title to indicate targeted 
board.

regards
Alex
