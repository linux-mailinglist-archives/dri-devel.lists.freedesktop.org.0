Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A742330BAD
	for <lists+dri-devel@lfdr.de>; Mon,  8 Mar 2021 11:50:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 238EA89E39;
	Mon,  8 Mar 2021 10:50:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1B6A89E39
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Mar 2021 10:50:15 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 128Amc5l017317; Mon, 8 Mar 2021 11:50:07 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=selector1;
 bh=6IkLW7/YmYJLfYy5HwoII8USGsyEf1K59+GMOAU6BL8=;
 b=DQ4e/fJ/t+/zpmyEZCtsW6OWCOPgWjGbLnrB4+d5CeaugIGJ4B0OH3g6qCuI+kmjjBr8
 8QWZn2KbvdzYfv0Myab8OL60hRqG6hjrGjqwL8DT86OsAqGOQ3p2xh54FN2ATG7+4k9u
 Z6ytjia29x9bImHusl9Bkyxr1Kxh2cTfHQ5+ZI6eXwT1wVl7NBN90e+c/WXVKnwSfMqB
 rYBaV41tCDG2dx5yD5hMpDNueqC8adzS55bQKN7lMc297wAz1EcTbN0BVL49xb+xoEqP
 sjOQE3Z4yJKOu48S4JC4MtMtk9688F7C7GrxrAfEcAgb1m1KksUGVts+IlU2hRy4x59S SQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 374036jcfg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Mar 2021 11:50:07 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0E8D310002A;
 Mon,  8 Mar 2021 11:50:06 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C379F2547CE;
 Mon,  8 Mar 2021 11:50:06 +0100 (CET)
Received: from SFHDAG2NODE3.st.com (10.75.127.6) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 8 Mar
 2021 11:50:06 +0100
Received: from SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c]) by
 SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c%20]) with mapi id
 15.00.1473.003; Mon, 8 Mar 2021 11:50:06 +0100
From: Philippe CORNU - foss <philippe.cornu@foss.st.com>
To: Yannick FERTRE - foss <yannick.fertre@foss.st.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Jagan Teki <jagan@amarulasolutions.com>, "Yannick
 FERTRE" <yannick.fertre@st.com>, Philippe CORNU <philippe.cornu@st.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>, Vincent ABRIOU
 <vincent.abriou@st.com>
Subject: RE: [Linux-stm32] [PATCH] drm/stm: ltdc: Use simple encoder
Thread-Topic: [Linux-stm32] [PATCH] drm/stm: ltdc: Use simple encoder
Thread-Index: AQHXD42Bu6QwdpjwfE2bZcobc4w1VKpzbsWAgAAIDoCABntyNg==
Date: Mon, 8 Mar 2021 10:50:06 +0000
Message-ID: <1615200602091.7557@foss.st.com>
References: <20210302175700.28640-1-jagan@amarulasolutions.com>
 <791a6f75-3603-9b84-c267-76c24fb77ee2@suse.de>,
 <1d6ff4e2-9213-6e13-214d-b1705199610e@foss.st.com>
In-Reply-To: <1d6ff4e2-9213-6e13-214d-b1705199610e@foss.st.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.44]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-08_04:2021-03-08,
 2021-03-08 signatures=0
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
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-amarula@amarulasolutions.com" <linux-amarula@amarulasolutions.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied on drm-misc-next.
Many thanks Jagan for your patch and many thanks Thomas & Yannick for your =
reviews & tests.
Philippe :-)

________________________________________
De : Linux-stm32 <linux-stm32-bounces@st-md-mailman.stormreply.com> de la p=
art de Yannick FERTRE - foss
Envoy=E9 : jeudi 4 mars 2021 09:49
=C0 : Thomas Zimmermann; Jagan Teki; Yannick FERTRE; Philippe CORNU; Benjam=
in Gaignard; Vincent ABRIOU
Cc : dri-devel@lists.freedesktop.org; linux-amarula@amarulasolutions.com; l=
inux-kernel@vger.kernel.org; linux-arm-kernel@lists.infradead.org; linux-st=
m32@st-md-mailman.stormreply.com
Objet : Re: [Linux-stm32] [PATCH] drm/stm: ltdc: Use simple encoder

Hi Thomas,
I wait a few days before merging it.
Thank you for your help.

Best regards

Yannick


On 3/4/21 9:21 AM, Thomas Zimmermann wrote:
> Hi,
>
> shall I merge this patch?
>
> Am 02.03.21 um 18:57 schrieb Jagan Teki:
>> STM ltdc driver uses an empty implementation for its encoder.
>> Replace the code with the generic simple encoder.
>>
>> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
>> ---
>>   drivers/gpu/drm/stm/ltdc.c | 12 ++----------
>>   1 file changed, 2 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/stm/ltdc.c b/drivers/gpu/drm/stm/ltdc.c
>> index 7812094f93d6..aeeb43524ca0 100644
>> --- a/drivers/gpu/drm/stm/ltdc.c
>> +++ b/drivers/gpu/drm/stm/ltdc.c
>> @@ -31,6 +31,7 @@
>>   #include <drm/drm_of.h>
>>   #include <drm/drm_plane_helper.h>
>>   #include <drm/drm_probe_helper.h>
>> +#include <drm/drm_simple_kms_helper.h>
>>   #include <drm/drm_vblank.h>
>>   #include <video/videomode.h>
>> @@ -1020,14 +1021,6 @@ static int ltdc_crtc_init(struct drm_device
>> *ddev, struct drm_crtc *crtc)
>>       return ret;
>>   }
>> -/*
>> - * DRM_ENCODER
>> - */
>> -
>> -static const struct drm_encoder_funcs ltdc_encoder_funcs =3D {
>> -    .destroy =3D drm_encoder_cleanup,
>> -};
>> -
>>   static void ltdc_encoder_disable(struct drm_encoder *encoder)
>>   {
>>       struct drm_device *ddev =3D encoder->dev;
>> @@ -1088,8 +1081,7 @@ static int ltdc_encoder_init(struct drm_device
>> *ddev, struct drm_bridge *bridge)
>>       encoder->possible_crtcs =3D CRTC_MASK;
>>       encoder->possible_clones =3D 0;    /* No cloning support */
>> -    drm_encoder_init(ddev, encoder, &ltdc_encoder_funcs,
>> -             DRM_MODE_ENCODER_DPI, NULL);
>> +    drm_simple_encoder_init(ddev, encoder, DRM_MODE_ENCODER_DPI);
>>       drm_encoder_helper_add(encoder, &ltdc_encoder_helper_funcs);
>>
>
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
