Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71A6471263E
	for <lists+dri-devel@lfdr.de>; Fri, 26 May 2023 14:05:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C5B310E7F0;
	Fri, 26 May 2023 12:05:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B530810E7F0
 for <dri-devel@lists.freedesktop.org>; Fri, 26 May 2023 12:05:37 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34QAhvxC025540; Fri, 26 May 2023 14:05:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=YAD+QRu+FHSj9Eq1EY9SbCn4rmGwV2pr6NVxlQDczT4=;
 b=wYtieyBeRLzTpSRPI2RhKrx6qYAPDZgi3DIrkVXlJyo+PapREfB8HoriEnHC5su1uWNX
 DDWQPWXM4vi1rEkWIcnff37ctkqyK1B6JMKQ1vVER9tOMJW2Mp8xIoWaRX6wJg3aDTHa
 ASfitvxXOz4zpbJ++Hx9w5/rt1MXMlKN/JB+rUOm2obqn84xgN5M0CL95jLSPcC6OCY8
 +MQ4piAWWWxkUOJdV3MQyjxpVEOCJNZwLhqnN7hRIkh3NG1eXd8TacVDZ2REdShRImvP
 S4CC0/Fo2oJ4/nbmK8SlzriSVSXPVFc7HXTCSFTGhhG5UXTSWqFsgotV2sfSK4mdhfbG hg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3qt4aw0r16-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 May 2023 14:05:24 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5E2FB10002A;
 Fri, 26 May 2023 14:05:23 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 550F122AFEF;
 Fri, 26 May 2023 14:05:23 +0200 (CEST)
Received: from [10.48.0.148] (10.48.0.148) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Fri, 26 May
 2023 14:05:22 +0200
Message-ID: <9faab8c9-a38b-3f06-c2fb-6c7803b22eb1@foss.st.com>
Date: Fri, 26 May 2023 14:05:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 2/2] dt-bindings: backlight: document new property
 default-brightness-level
Content-Language: en-US
To: Alexandru Ardelean <alex@shruggie.ro>, <dri-devel@lists.freedesktop.org>, 
 <linux-leds@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-fbdev@vger.kernel.org>
References: <20230519200520.10657-1-alex@shruggie.ro>
 <20230519200520.10657-2-alex@shruggie.ro>
From: Philippe CORNU <philippe.cornu@foss.st.com>
In-Reply-To: <20230519200520.10657-2-alex@shruggie.ro>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.0.148]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-26_01,2023-05-25_03,2023-05-22_02
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
Cc: daniel.thompson@linaro.org, pavel@ucw.cz, jingoohan1@gmail.com,
 deller@gmx.de, lee@kernel.org, conor+dt@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, Yannick Fertre <yannick.fertre@foss.st.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 5/19/23 22:05, Alexandru Ardelean wrote:
> From: Yannick Fertre <yannick.fertre@foss.st.com>
> 
> Add documentation for new default-brightness-level property.
> 
> Reviewed-by: Philippe CORNU <philippe.cornu@foss.st.com>

Hi Alexandru,
same comments as for the 1/2 patch.
Many thanks
Philippe :-)

> Signed-off-by: Yannick Fertre <yannick.fertre@foss.st.com>
> Signed-off-by: Alexandru Ardelean <alex@shruggie.ro>
> ---
> 
> Link to original patch:
>    https://github.com/STMicroelectronics/linux/commit/c4067d7bd883c6fa14ffd49892c4ce663cdafe98
> 
>   .../bindings/leds/backlight/gpio-backlight.yaml          | 9 +++++++++
>   1 file changed, 9 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/leds/backlight/gpio-backlight.yaml b/Documentation/devicetree/bindings/leds/backlight/gpio-backlight.yaml
> index 584030b6b0b9..b96c08cff0f0 100644
> --- a/Documentation/devicetree/bindings/leds/backlight/gpio-backlight.yaml
> +++ b/Documentation/devicetree/bindings/leds/backlight/gpio-backlight.yaml
> @@ -23,6 +23,15 @@ properties:
>       description: enable the backlight at boot.
>       type: boolean
>   
> +  default-brightness-level:
> +    description:
> +      The default brightness level (index into the array defined by the
> +      "brightness-levels" property).
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +
> +dependencies:
> +  default-brightness-level: [ "brightness-levels" ]
> +
>   required:
>     - compatible
>     - gpios
