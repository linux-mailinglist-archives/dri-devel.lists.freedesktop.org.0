Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42F01C7D1AD
	for <lists+dri-devel@lfdr.de>; Sat, 22 Nov 2025 14:37:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 278E410E093;
	Sat, 22 Nov 2025 13:37:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="eqVWyPrd";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hpIWEmUy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0F9B10E093
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Nov 2025 13:37:47 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AMCcmLp2896521
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Nov 2025 13:37:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 vpKlju2borCnF5T0A8CLiJv8yDluVEw4QY6DSS08xXM=; b=eqVWyPrdXhpla72C
 qS95Kdp6woviucvBADPP34opafepdhEddkKNmJc2d0ux66f667lXwuzlWJ+dngqe
 liLCtdnGHLmgTVYLK50AUzkNjQQ3pxGxT3mlLQFGCgkU3huC59hoAsVDJFAwmA2I
 VA4825HrQC4Rbj5nU5OhbxishIzOQL6on9EcspqMAeqFWnBnareB3dEruG0XWmvQ
 0kKF+mPiobsobSayMKYTYvPWTZn6xb8dTT/LT+B2X5NMRyaFzz/sk23pa7vxyhFH
 50rHMSdhOSB+1d3UVAy7SiSU02pgJh9MECVbcrI5mQ1s/hfSQuPWUE58wa5OO0sm
 +1jL2A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ak6ff8q8m-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Nov 2025 13:37:46 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4edaa289e0dso12364981cf.3
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Nov 2025 05:37:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763818666; x=1764423466;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vpKlju2borCnF5T0A8CLiJv8yDluVEw4QY6DSS08xXM=;
 b=hpIWEmUybSuuJzhtIN39U+El6aunXMQRlsuqmYCNPXN4hH6+6skwR2dxAyOot1+6Pz
 1mJdHBNO+6ZX86LAVGmNe5vqmmJOSduJmu5cz+IeNNQDjiOi4/ojrXpfgsG3URqqIbyj
 01GzDZr+EhCuZWHXc4HgMKCMQZ0uc69cpPc2Xa8soP3KgcQCouOWp54lTAu8SGWFKKPf
 fsh4hk2TeNCHLZQKrEcyciJWMZ36GGL1giXaVexgvCTn80/U3C3U2xrhxR+Ba78f8beK
 zUl9MrD7yzscS0h462Xdejw03ghv3i7Jodj7Zt/LDg5MUTtoKdqiVgYw/03z8uqbf5Vr
 oZGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763818666; x=1764423466;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vpKlju2borCnF5T0A8CLiJv8yDluVEw4QY6DSS08xXM=;
 b=hNCNkWSqNj1sXxVE+1EFxSv0CH6yPT8bJPF/KbP8hs35ZSJyV5zbEqx9yBDGUqijNA
 FgU8gscXFRf/6CRUFLwfduQ/YzgcRUmWgNd6n7XrqKtEBv2xzJrd+nXDLLNckGF2wDEF
 IA0ujIjNzEeA0O7zWTnC/PXHa0qmQCF1RBjFA1Il6O5v+DZwAYcvjTNlEay/lmZMqCrU
 W+g6Ly2Sx+dkBxShzmDHNYH1dusXobJ+Rxm/vG6Y9d5vTGtis0Be0yB4IMFYHQCNyCIA
 q9fzvk+btTG8+XMNaC1pabIWqJF808Em1CfUKVqxCB/uOOa0rSSTKaFIXUNIwHY49D/x
 4zIw==
X-Gm-Message-State: AOJu0Ywf0+4JuciazTwA0xp2r4vBoPq7gYVHeD5XMpM4lBItgRjnwRTX
 8jVZIZWnZ/VE3ZIw1O4wWsF/nm9f0a+xgyk1l1SKkEpOfSDTpqSCoBubkJUtcKl8kVIdz7qgbRO
 OgzF5eZf8ndl3bOictJYAPKES6xFm4NDeaNJzcPaMYqnZiGHIddkdsRZpstO7anTVjYjw1Y8=
X-Gm-Gg: ASbGncvTvt2IjSl45CCWuG1iGlI3UZFW4373NGGv7AytLIgXxtccDNkb6qqDeQv3MkK
 0F0zf9hWKhNla046HTQXkf5PBuIPFrhaRvG9L3WBCGC0oZb7S3QOV9ftNnmO5Uw7K0lrrEjh2Q3
 J6kLdOiFbHDXDdmMoAsXImdfhQDeoUTBQhQM8uvIF7FzcxIWFysvZMp9vCuvWb7GXNifFPJLd24
 28SHO1pbfjjM9oKplQYPiiueBqQJ6ngU88pwLJipUuDRDgvKJpV6zVwdSsjUr07W9r/vdVxvhTe
 BuOF0jcS+Cudql85MfLnANii2OVvNl2ZjiCoK/hpAyUjCZVi++jWe9SaK2P6fLxRq/QlxZq41So
 P9KMohIfSbeBhTsBuaa2410FyKg5xVxPHur+WftIbza6rmpVLpkKyjU9bktmA7H/v/qQ=
X-Received: by 2002:a05:622a:c3:b0:4ee:2580:9bc5 with SMTP id
 d75a77b69052e-4ee5883ae04mr61120401cf.2.1763818666105; 
 Sat, 22 Nov 2025 05:37:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGoep6nfGiw+VpxZkfaKHeCgO/XxMbNv1FNgkeFxXOdBWbxoTvU1FtSK/h2lVrS77kwEGBxsA==
X-Received: by 2002:a05:622a:c3:b0:4ee:2580:9bc5 with SMTP id
 d75a77b69052e-4ee5883ae04mr61120141cf.2.1763818665629; 
 Sat, 22 Nov 2025 05:37:45 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b7654cdabd0sm718995766b.12.2025.11.22.05.37.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 22 Nov 2025 05:37:45 -0800 (PST)
Message-ID: <d6018a1f-12a6-431b-9367-65c65e1d920f@oss.qualcomm.com>
Date: Sat, 22 Nov 2025 14:37:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] arm64: dts: qcom: x1e80100-vivobook-s15: add
 charge limit nvmem
To: Maud Spierings <maud_spierings@hotmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20251116-asus_usbc_dp-v2-0-cc8f51136c9f@hotmail.com>
 <20251116-asus_usbc_dp-v2-5-cc8f51136c9f@hotmail.com>
 <378c611b-f8c6-4f89-a3b3-6d8c22445e83@oss.qualcomm.com>
 <PR3P189MB1020E7393F72B285173137A2E3C9A@PR3P189MB1020.EURP189.PROD.OUTLOOK.COM>
 <ff773af3-d843-42ff-b4dc-e5a9d85c2285@oss.qualcomm.com>
 <PR3P189MB102003218DCCE87EEB69A0E4E3C9A@PR3P189MB1020.EURP189.PROD.OUTLOOK.COM>
 <57bab427-d8fd-490d-88f6-358b79367ed1@oss.qualcomm.com>
 <AM7P189MB10093041E89777C2AFAE2CEEE3D2A@AM7P189MB1009.EURP189.PROD.OUTLOOK.COM>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <AM7P189MB10093041E89777C2AFAE2CEEE3D2A@AM7P189MB1009.EURP189.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 69Gf9Xaius21ZYfQMdFS5tA24IlgGYtv
X-Proofpoint-ORIG-GUID: 69Gf9Xaius21ZYfQMdFS5tA24IlgGYtv
X-Authority-Analysis: v=2.4 cv=OsxCCi/t c=1 sm=1 tr=0 ts=6921bcaa cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=69EAbJreAAAA:8 a=Ufo_hXmgmYuxYTG_NCgA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIyMDExMSBTYWx0ZWRfX8hvXdxZKvpQ5
 juT/hltIOWtdH6neo8CJrSADaVJwsW+0CcH9kfnB8evpbeW3D333n6Vy6KfA+kn6f97524S72Dv
 hN+eajtytaH8kpw77OStqMiRozMBiP2WPm6CTx67kmRRVpnxatKm12fNif4fib4v3kPR4oEsGih
 Qs+kge9A2Je88Lu4SoZR8EFJ/lY09ch9kR6FJEVOPnRI2Ty5dDNg0uf7K9FSTWljuNraHJ5K6VJ
 uMOQrtORb1VHM+al+vODZMjVUoGDzawLaz2teE7fXRExJPdQKjIu6knuSEVn0xSyDAX0jzgPuyC
 JzYXGMuzHn8v1TBYdGBau9hZcMxYpPsWBKp+9rEZJAFatIBmI9c0AtLsYVomIVqFT9LwFQA7NpX
 y9xzG8Gq0zl3GvMJtFU/5r1P+QceNw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-22_05,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 adultscore=0 bulkscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511220111
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

On 11/22/25 12:07 PM, Maud Spierings wrote:
> On 11/20/25 16:36, Konrad Dybcio wrote:
>> On 11/17/25 4:44 PM, Maud Spierings wrote:
>>> On 11/17/25 16:35, Konrad Dybcio wrote:
>>>> On 11/17/25 3:13 PM, Maud Spierings wrote:
>>>>> Hi Konrad,
>>>>>
>>>>> On 11/17/25 13:59, Konrad Dybcio wrote:
>>>>>> On 11/16/25 11:52 AM, Maud Spierings via B4 Relay wrote:
>>>>>>> From: Maud Spierings <maud_spierings@hotmail.com>
>>>>>>>
>>>>>>> Add nvmem cells for getting charge control thresholds if they have
>>>>>>> been set previously.
>>>>>>>
>>>>>>> Signed-off-by: Maud Spierings <maud_spierings@hotmail.com>
>>>>>>> ---
>>>>>> Have you verified that e.g.
>>>>>>
>>>>>> connecting the charger
>>>>>> setting the charge threshold
>>>>>> rebooting to windows
>>>>>> rebooting to windows once more for good measure
>>>>>> rebooting to linux
>>>>>>
>>>>>> still has the settings persist?
>>>>> Hmm I have tried several things but I can't seem to get the values to stick. I the spmi-sdam driver is compiled in, I am not quite sure if I might be missing something.
>>>> Hm, I wonder if Windows/UEFI overwrites these values or whether they're
>>>> used by something else..
>>>>
>>>> Can you set a threshold in windows and see if Linux can read back that
>>>> data?
>>> the values in /sys/class/power_supply/jada-jada/ are zero when rebooting from Windows into Linux after enabling charge limitting in the Asus application.
>>>
>>> I remember my old vivobook (x86) also forgot its settings each boot, but given the nvmem cells that should not be happing here I guess. It is odd that there seems to be no collision between Windows and Linux. Maybe the Windows mechanism is doing the old trick of writing it in there every boot?
>> Odd indeed.. Does it work if you reboot from Linux to Linux?
> It seems not, I seem to remember testing it quite some time ago, but I cannot get it to remember any way, at least it is not popping up in sysfs, always back to 0

It seems like the driver currently only populates the sysfs start/stop
values if the "enable" bit is set

Could you check this (hacky and wrong) diff and give it another try?

diff --git a/drivers/power/supply/qcom_battmgr.c b/drivers/power/supply/qcom_battmgr.c
index c8028606bba0..9ebd8adfb8eb 100644
--- a/drivers/power/supply/qcom_battmgr.c
+++ b/drivers/power/supply/qcom_battmgr.c
@@ -733,7 +733,7 @@ static int qcom_battmgr_charge_control_thresholds_init(struct qcom_battmgr *batt
        u8 en, end_soc, start_soc, delta_soc;
 
        ret = nvmem_cell_read_u8(battmgr->dev->parent, "charge_limit_en", &en);
-       if (!ret && en != 0) {
+       if (!ret) {
                ret = nvmem_cell_read_u8(battmgr->dev->parent, "charge_limit_end", &end_soc);
                if (ret < 0)
                        return ret;


Konrad
