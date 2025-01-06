Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 387B7A023D5
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jan 2025 12:05:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C921810E62A;
	Mon,  6 Jan 2025 11:05:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=foss.st.com header.i=@foss.st.com header.b="YgNUVIaz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFBF010E628
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jan 2025 11:05:02 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 506B06Oa004709;
 Mon, 6 Jan 2025 12:04:54 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 AFUAKGbkjzpol5FudiEAelKXEGfl5qCcVmUlRgdMuW0=; b=YgNUVIazqpMyFm+L
 +nO+YwEc/nZoNFH1JPK48GIix9bL2emzDXVmFdTvb6tSIMpYmWFubHhgB4aPmnla
 yHuXiaqZkJ5bOqyvzGe7eo0GNNDvbrh8M46g1wutH0LgaI2ulgJX4gnGajY5yByQ
 omFMegDlWc9mNwMd+zUxeJef+lQbTCg5d9kSCPbD6BoTpCYzgmLm+V8WvjSB1qSb
 8Gj5R/vrMkQZO6j4ICK996qCwDlJ7Js2cMrNnIXS6dp6BI4ARhmsfnYOmuqQtEXu
 ODLjBcu81pO9uhiWCzxb2jArXICljLFvnM+VpUa614SHEFrZpg2T4e671EpguHrC
 A5tN8w==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4407n9hd53-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Jan 2025 12:04:54 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 2C8FB40056;
 Mon,  6 Jan 2025 12:03:31 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9C95725D411;
 Mon,  6 Jan 2025 12:01:36 +0100 (CET)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Mon, 6 Jan
 2025 12:01:35 +0100
Message-ID: <a03d16e5-18e5-4627-8209-9559cdc8bc36@foss.st.com>
Date: Mon, 6 Jan 2025 12:01:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] ARM: dts: st: enable the MALI gpu on the
 stih410-b2260
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
To: Alain Volmat <avolmat@me.com>, David Airlie <airlied@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
CC: <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
References: <20241006-sti-gpu-v2-0-c6bb408d6903@me.com>
 <20241006-sti-gpu-v2-3-c6bb408d6903@me.com>
 <9c6a316b-10bd-4ed0-b925-babf84b125e5@foss.st.com>
Content-Language: en-US
In-Reply-To: <9c6a316b-10bd-4ed0-b925-babf84b125e5@foss.st.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 1/6/25 11:39, Patrice CHOTARD wrote:
> 
> 
> On 10/6/24 22:42, Alain Volmat wrote:
>> Enable the GPU on the stih410-b2260 board.
>>
>> Signed-off-by: Alain Volmat <avolmat@me.com>
>> ---
>>  arch/arm/boot/dts/st/stih410-b2260.dts | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/st/stih410-b2260.dts b/arch/arm/boot/dts/st/stih410-b2260.dts
>> index 240b62040000b8c0357d39504d3475186958bf31..736b1e059b0a8f122d1b824e1f4e5db0a668ec2c 100644
>> --- a/arch/arm/boot/dts/st/stih410-b2260.dts
>> +++ b/arch/arm/boot/dts/st/stih410-b2260.dts
>> @@ -206,5 +206,9 @@ hdmiddc: i2c@9541000 {
>>  		sata1: sata@9b28000 {
>>  			status = "okay";
>>  		};
>> +
>> +		gpu: gpu@9f00000 {
>> +			status = "okay";
>> +		};
>>  	};
>>  };
>>
> 
> Hi Alain
> 
> Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
> 
> Thanks
Applied on sti-next
