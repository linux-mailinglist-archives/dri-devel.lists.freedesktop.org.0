Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6546DCD3413
	for <lists+dri-devel@lfdr.de>; Sat, 20 Dec 2025 18:00:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55B8F10E2C2;
	Sat, 20 Dec 2025 17:00:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="gZL67eux";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EEyn8iTG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05A1A10E241
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Dec 2025 17:00:48 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BKBOpd94135894
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Dec 2025 17:00:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 NapELLA/aJAMQ4YKfSgfCm9uwItNmLMxtUebqHXFDvk=; b=gZL67euxLkLf7yVn
 Y8SzoZu7zgXWzsSvjU3t6h/+JoNR+2h4qiFT5F608EmXhYcTtH4yp7NzdtHUyn2y
 EceYYmg9Q7dDTIif/BqZhIkOcoafK+Pyqm7mm+06QNgFWD7bgSURmyWocbBiiPZl
 obbKZBYi7lWkwHy3R4W3KEIzvJDKLrtDlYll2n1E8yy4RaUenfCH41IxneuRyG56
 n8zMG+Lbn0mPF1l7JMHo1nYIQx30ZQmFblMSidPBla27fhET2W/Fa2koc4ie2qPP
 iDwdh3C1T1wavaTnmea7/WEalAgCth2ONxMywoNg7ESJbohc1Bv4zLWq4uDub/YV
 1yA18g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b5mvfgyyb-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Dec 2025 17:00:47 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4ee1b7293e7so91868661cf.0
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Dec 2025 09:00:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766250047; x=1766854847;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=NapELLA/aJAMQ4YKfSgfCm9uwItNmLMxtUebqHXFDvk=;
 b=EEyn8iTG5qyIEd0lgELmWcKLXleE2jDeD3l5Pt1QVzgzxZ6UpAa4PjaTDEo6Q3Qv3o
 1UoDPZDGRafWLHHYoujVYgC0rQxa60YLVEfzP1wDf7VJchaEJT/iIRIeToHsJx1v49Ru
 DvK+EZ97HzVv/5y56rKOboaZIAkfjwX+uFGRK/V3aGeg5Sc0vVAbXc2YJH9Cp+Hf6NV0
 ZqEwFQ+DGrf9sgEfxJOvkRvyq6w9nS/wc/iy1M2LOFns3Y8/Zw5XKsbnCcJ9xnoe8fUN
 3lZkfjkBErllcaWvuJptn64OgZmAiXiUYqqBiX6weZRsSyDl6qJGggwGIYKjuKLZLXTP
 yBAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766250047; x=1766854847;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NapELLA/aJAMQ4YKfSgfCm9uwItNmLMxtUebqHXFDvk=;
 b=YeeY+IOGKyOKVtS/uXt5ryPYFOjMDuKNqhoSYcZ4I5iMH/eHwnbY1yZ2+EPDxS3hKN
 oAHQqEqGUAJ9xALJDXEizyHBkRBTnOGYsalwd62zL+iQi4wL2uysPuAiTwnFh9kuWq8k
 D8UU0aIeow/VjwLY4xvGbGy/iLTRbWsD41+UHjKY5ieQ1Dkr11hdEftWI2iuHf80o0Mt
 iEsBq+kxmweo8NdqKEkNNW+MqmgUeaFa7D0jbS46kY3RE3ENiWxJatlaI/frrkNSBmoj
 W1k9XjM+ZoGZH5P7mp0ZyFK8Gn4kXD8RxuZU+2f8DSGo2l04CTMHp3pvygzdwemCMW4a
 dSIw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXIia5bkuDiwg/iJNqVKGHioo4DYL6UJxFjQA2k3A6qSNCHYmBc+dVd46Tf+QOdOAebkJ26+2m78ss=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwKy41RN/t27Mc6EEGfgk7heyN7waeuMgQOTFlyK/igxGOhxBCR
 z8Mu8oObsCXWYJ0eVoa6K79VtcoM5r7MwTcjgmi5dhIOX+bU1JcfIMQSRDU/xgHJlwwnJkO5Z+r
 dzr2fTo3MOOeM7fpM2wL84qvIOOlxXqZ9l3g2eKVVTzuKe/R4NNaP6aKX3XYdbCNbPHyxuFE=
X-Gm-Gg: AY/fxX7IBwGZelZTlhS6Bi8o25kKk13ujqfXu4FT5VkEBQRIpPVRk+W4mPEHklLY9v1
 YTxd99FI385mRMaICEpBXDKMWAtQettg/Ry+UCZWPkZuDEOxuQ5eFc1fUxzbCAiAsKAEm3WKgJq
 HmoTILB8/Bhma6nUJoOpQRQvituqwRGGBq5WIP6kYNn+jlTJff4oo2e6Of0k+48MyfrjAYYAYDx
 JM6DEOwg0fRQCj3uTvim7QFHrduiZp+zlapn45Yt04IegjBQCtMizOrz3R809W8bG8/voPCpX4R
 ytHv4iv/qVmJdLlp7MWEevZhfaU5NmCmUvZ98m7LeEgEj/KeQfnp5LJQ7rXYJdVVysbRq0B0I3Z
 dvv8/GWSDA+QAr+kGQ5YDheeWv40tVyN2XBjBt3YzOFaumkLHoha4fNNSexx0YYVxc1rf1PCBRS
 0OefsyQPYVndZT5tkpKIwZS9BVstuU1Y1oPx7U3MvM6xCA0STNrm7iwyTFyDkwwyWqSxngajA7X
 7mR
X-Received: by 2002:ac8:6f0c:0:b0:4d2:4df8:4cb5 with SMTP id
 d75a77b69052e-4f4abcb8cf5mr96974151cf.4.1766250047299; 
 Sat, 20 Dec 2025 09:00:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFNuDxCMFK72nA9PIBaD28zVuttvilRmdMeWEt0IbmK4XbKyWNUciEGBiL8B95mLPvUJ8KUyA==
X-Received: by 2002:ac8:6f0c:0:b0:4d2:4df8:4cb5 with SMTP id
 d75a77b69052e-4f4abcb8cf5mr96973331cf.4.1766250046718; 
 Sat, 20 Dec 2025 09:00:46 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec?
 (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-64b910601c7sm5178501a12.14.2025.12.20.09.00.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 20 Dec 2025 09:00:44 -0800 (PST)
Message-ID: <47037a52-6778-42fe-b2d0-711245c0acb6@oss.qualcomm.com>
Date: Sat, 20 Dec 2025 18:00:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
Subject: Re: [PATCH] gpu/drm: panel-edp: add BOE NV140WUM-T08 panel
To: Doug Anderson <dianders@chromium.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
References: <20251219085838.98152-1-johannes.goede@oss.qualcomm.com>
 <CAD=FV=VKe6=v0xSgxcAXctAnwqCyhici+vc1dfWYW=Eaky+AwQ@mail.gmail.com>
Content-Language: en-US, nl
In-Reply-To: <CAD=FV=VKe6=v0xSgxcAXctAnwqCyhici+vc1dfWYW=Eaky+AwQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=H8rWAuYi c=1 sm=1 tr=0 ts=6946d640 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=WSdhpPxjYtUciDDMFqEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: XzWWEIQ60HE3MP4mF3q-VtA4O6QE8paT
X-Proofpoint-GUID: XzWWEIQ60HE3MP4mF3q-VtA4O6QE8paT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIwMDE0OSBTYWx0ZWRfX3RC/8yGIsbU1
 WUpITv8xMMmN3oRyjhCOvucffFNnnvpZ2vxJnCBHVR/ywfrlsDhimIOiftMtoS5mWqxH+2Oov5C
 54hy9u8MWOqrqT3c2doEipJRN51P15uZJO/W1qyuZDykkJAviJb6pqYFgBR4EJSQJ/DvjFeOyLC
 B53s9JbgwBetvVcNtTL63DRetrgMS/66n4bOIqBFFHAy/1195jK0IpHM75emjms6PhgVR6z9F33
 15t3fkrtGXHRXcU5MVmU4hjZINYY9E0pkGVjlX4G073D8wFQjd97bJLMtTNSP7XnQBFNomAqw7y
 CYOQFyl8kq+VbmD9e5Kr73OjrgyjYV8xeo6eJTYiSEu0ddkft5fYJxgk+jzYJnxFcY2UNkCIkrM
 cEzK3ZVsPXlfaDwiXY0w/RnpDdQPSCnhsVpUaZrJQQGKOJXyesgLntz7sDZp6a0luUjrvG4qapy
 IjPTrxw9WvJShD+qidw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-20_03,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0 adultscore=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512200149
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

Hi Doug,

Thank you for the review.

On 20-Dec-25 01:23, Doug Anderson wrote:
> Hi,
> 
> On Fri, Dec 19, 2025 at 12:58 AM Hans de Goede
> <johannes.goede@oss.qualcomm.com> wrote:
>>
>> Add powerseq timing info for the BOE NV140WUM-T08 panel used on Lenovo
>> Thinkpad T14s gen 6 (Snapdragon X1 Elite) laptops.
>>
>> edid-decode (hex):
>>
>> 00 ff ff ff ff ff ff 00 09 e5 26 0c 00 00 00 00
>> 0a 21 01 04 a5 1e 13 78 03 d6 62 99 5e 5a 8e 27
>> 25 53 58 00 00 00 01 01 01 01 01 01 01 01 01 01
>> 01 01 01 01 01 01 33 3f 80 dc 70 b0 3c 40 30 20
>> 36 00 2e bc 10 00 00 1a 00 00 00 fd 00 28 3c 4c
>> 4c 10 01 0a 20 20 20 20 20 20 00 00 00 fe 00 42
>> 4f 45 20 43 51 0a 20 20 20 20 20 20 00 00 00 fe
>> 00 4e 56 31 34 30 57 55 4d 2d 54 30 38 0a 00 fa
>>
>> Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
>> ---
>>  drivers/gpu/drm/panel/panel-edp.c | 7 +++++++
>>  1 file changed, 7 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
>> index 415b894890ad..7b8e5cd41594 100644
>> --- a/drivers/gpu/drm/panel/panel-edp.c
>> +++ b/drivers/gpu/drm/panel/panel-edp.c
>> @@ -1730,6 +1730,12 @@ static const struct panel_delay delay_200_500_p2e100 = {
>>         .prepare_to_enable = 100,
>>  };
>>
>> +static const struct panel_delay delay_200_500_p2e200 = {
>> +       .hpd_absent = 200,
>> +       .unprepare = 500,
>> +       .prepare_to_enable = 200,
>> +};
>> +
>>  static const struct panel_delay delay_200_500_e50 = {
>>         .hpd_absent = 200,
>>         .unprepare = 500,
>> @@ -1975,6 +1981,7 @@ static const struct edp_panel_entry edp_panels[] = {
>>         EDP_PANEL_ENTRY('B', 'O', 'E', 0x0b56, &delay_200_500_e80, "NT140FHM-N47"),
>>         EDP_PANEL_ENTRY('B', 'O', 'E', 0x0b66, &delay_200_500_e80, "NE140WUM-N6G"),
>>         EDP_PANEL_ENTRY('B', 'O', 'E', 0x0c20, &delay_200_500_e80, "NT140FHM-N47"),
>> +       EDP_PANEL_ENTRY('B', 'O', 'E', 0x0c26, &delay_200_500_p2e200, "NV140WUM-T08"),
> 
> This looks OK, but I'd like to make sure that you really need
> `prepare_to_enable` as 200 and it's not supposed to be
> `powered_on_to_enable`.
> 
> prepare_to_enable is usually usually (T4+T5+T6+T8)-min

The datasheet gives (T4+T5+T6+T8) > 200ms

The documentation in struct panel_delay for powered_on_to_enable says:

        /**
         * @powered_on_to_enable: Time between panel powered on and enable.
         * ...
         * This doesn't normally need to be set if timings are already met by
         * prepare_to_enable or enable.
         */

and looking at the code it also seems better to use prepare_to_enable where
we can, to have the shortest possible delay for panels which have HPD
properly connected.

> I notice that some other BOE panels have "delay_200_500_e50_po2e200".

That e50 there is .enable = 50:

        /**
         * @enable: Time for the panel to display a valid frame.
         *
         * The time (in milliseconds) that it takes for the panel to
         * display the first valid frame after starting to receive
         * video data.
         *
         * This is (T6-min + max(T7-max, T8-min)) on eDP timing diagrams or
         * the delay after link training finishes until we can turn the
         * backlight on and see valid data.
         */

The datasheet does not specify T4 / T5 / T6, so the enable time is unknown,
so delay_200_500_e50_po2e200 seems wrong for this panel.

> powered_on_to_enable is usually (T3+T4+T5+T6+T8)-min

That would be .hpd_absent + .prepare_to_enable aka 400 ms which
is the worst case scenario if HPD is not connected. If we get a HPD
response from the panel within the 200ms hpd_absent then specifying
separate .hpd_absent and .prepare_to_enable times will result in
a lower total power-on-delay for the panel.

> If you're sure you need `prepare_to_enable` then that's fine--just
> thought I'd check. :-P

Ack, see above.

Regards,

Hans


