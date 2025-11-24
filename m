Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64966C800DE
	for <lists+dri-devel@lfdr.de>; Mon, 24 Nov 2025 12:01:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B313E10E210;
	Mon, 24 Nov 2025 11:01:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="h8hXWE6p";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OZ1OVsvT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66B2F10E210
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Nov 2025 11:01:22 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AO7THjb3112198
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Nov 2025 11:01:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 kmWnFKuFNtcDWt9VYmAJ6yQ/jTKnqbkS2w3UokWd2XA=; b=h8hXWE6p1UNJGR2w
 bJenDEb4N0liD4ovo5hL8e4kHmedUtZrPntvj9Lnp15Y748baQBPo/H/LLT6CCE3
 92+yxV6MA27NodhuYQM3WE/hWJwG+oWl6g+1dEBTJGSoj0sZKQCzILJgzqYyPp/y
 f0zBFNmvJFexj9BHEbi6SA4nuSMfolpuhxaJ05M4llT6ko5aQQAkWmkZHXyPtsq1
 h16o0RvHEwIeiAPLIIqvFtm4iLPMGLx41pDQZZBlNYiSztzQ1zmtGAwGcCDgU4hS
 Vi6zCNlEmDgRqxRp7T/AK1qK/eDFIsl+mFWQbPY3Dj7kllYqWNh8jiEjcJCmMVlr
 oWyMeg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4amk10gmte-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Nov 2025 11:01:21 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4ee409f1880so9414761cf.1
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Nov 2025 03:01:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763982081; x=1764586881;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kmWnFKuFNtcDWt9VYmAJ6yQ/jTKnqbkS2w3UokWd2XA=;
 b=OZ1OVsvT3kJywysOE46g+sRD1il+UjX9K75p+DQLw+K2Lmk+yO4ubNQds+DgdGtegL
 dJkIeReVeJuruQOGS3PHWWi4JcGtLglAauhvUyPrHZuCRPx6X7HyeFnqPWDRHq9eh7im
 rbsFtIgsRVSYz856pqZDU+9ib1TBHT7PpQV+BYjURtcw3kr7Qt+ZeBqwslJlHsbA2SUD
 GYSJrxDEqu6TwMtHFiBHuRKDAbsf6hdyx73WuM1fnE5aatyDUvalOdroMnoI7JyD0vtu
 Xn9Z6C0/arFO46efs5Ytn7FSA4b++jrgdnTo/TJR/O2W3R5Cw95ETpH2UjijzBFX8heU
 OEfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763982081; x=1764586881;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kmWnFKuFNtcDWt9VYmAJ6yQ/jTKnqbkS2w3UokWd2XA=;
 b=cxQK7D8r/LqXsXyiF9J/sFQkAlt2HsgRBVqNY0h8MDQsIhsAe9x6kZJx7QMP8/lMXH
 mlPFk1zhmUkmSbdF0AHv0qb1dzUkCTeI7kgRzK50F9DW8z99giqAiJ/OsWpgrpfwCMlO
 Er1Mf1LtBmzTeMQEw0vkEIfRNGB+xPhckrDyrODr06xE1FtelZEhb84jRaGpA0OkOpd9
 oFi+qHMV6eMS3j0+cxAC0QwDmHLO+gWEEZuUJx5i5p77kEa5AnkAtILEXXzDTvSKd3Y2
 CS57au+OCUBY9gSKiKyjSydi5mKio0lgKmLJSaIYTT2b2LrWBNUdYrF6oAwUvyTCA7Zo
 mJUQ==
X-Gm-Message-State: AOJu0Yw+kKAjF9WR4CvpfH4W6Z4NBjXQneZkHZFY3bkDjBP599YF0CiF
 3fA8717x2PqzEG4PixPnTzR/uUf5nF2X6RFxieoGfUCW4ccgcwCutzbw6BYj/nyE9p3yk0lIuYz
 e0zJXeSRKzPA/XBUDoD/ptIIACg3v4NkHR45KGf9NjKGPpO3yzngXN1vR9CZnivZNAvneggs=
X-Gm-Gg: ASbGncvce+QQp/Q9bKl23wxBUbB5aYJPPha1/rTcB+hqhkfzoBPnYYXYxty4FTjGJ3f
 K2YBeHA1Wn6kkTTayiC+sx3eEtzEeoWmHw43QDV+ADZ6fjORro+Vb+jB8MfvdDTdxlRlnMSSmYe
 70/gidfW8xVDUAWf0oHv2FHMVSf6uqISGYB+azLSvaZBVZsxN9+HQhcpiN/KAQEIP8HLL7XMBfI
 p1s1xby4GO1y7RUce0MJOBnUfhLgcGhOd3e9ZY0XWLL2VaTMagbSgasjN7NSG3r3P7QeVJ/KDkd
 JF3O/5QDEfPJEtI4JOY8e5d6e1lTK4xzdXyEIEY1BZSp0Zvl07t76j2TmKoFYIi2BCx8i9Y3sqp
 Zsxpt0BsVlS888JipNvpSDbpu+Y7bPTHNSZGzLFWeYjZMpN0w7T2MAQxdbL2zSv+H3Tk=
X-Received: by 2002:a05:622a:151:b0:4ee:1924:c6fc with SMTP id
 d75a77b69052e-4ee5883a43cmr108927931cf.1.1763982080612; 
 Mon, 24 Nov 2025 03:01:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGL5sXsmRBw0D0XCsDUFrVI+NEx70UqgwcK6a92gGa0RVxZdcHmClSbnmd1vrTkeOCIyt+AMw==
X-Received: by 2002:a05:622a:151:b0:4ee:1924:c6fc with SMTP id
 d75a77b69052e-4ee5883a43cmr108927301cf.1.1763982080014; 
 Mon, 24 Nov 2025 03:01:20 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b7654d502fasm1245441466b.17.2025.11.24.03.01.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Nov 2025 03:01:19 -0800 (PST)
Message-ID: <4ec493de-10d9-4a0d-b00c-d6e0f3d92b34@oss.qualcomm.com>
Date: Mon, 24 Nov 2025 12:01:15 +0100
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
 <d6018a1f-12a6-431b-9367-65c65e1d920f@oss.qualcomm.com>
 <AM7P189MB10097E44F277EEC068E4B847E3D3A@AM7P189MB1009.EURP189.PROD.OUTLOOK.COM>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <AM7P189MB10097E44F277EEC068E4B847E3D3A@AM7P189MB1009.EURP189.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 733nTB_8ZlAF4dmVR0nJ1oJpafd_MoC7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI0MDA5NyBTYWx0ZWRfX61rSeRW+cV1B
 6D4SVNsrZS1PyNmAo3408isutiKsPfQhCXEcA5h0lP0jQ6edMT4AssumFVczrOd9O62NyBgcjLn
 d7L+9KIzrjy19gReedP2x9Zbkv9Ku50+0J19v/qHUylDbC9/htTclfh7nhaTAm0Fasotm6QTfEy
 gHc0WusSaTM2UAqp25B8t4xpVO4I2QcFi6mjQmc/QBzgvAh7PFH2IdU14lOzwwQJ7N0HWdgadSl
 NIb9qtl0Wo0LjMwOLIZPQXybMmeMrdhhU4vDWKSH5kb78Jz7CFnFlbpjckGWsI2b6dUFyFOtNoP
 kWulGqmDz+ONHhHMIcLsZeJ3xmRgbiGj3gO/5Vd5SAkMDSD65voN5bG+KDT7QRxro1yR1+emDHF
 HPrloPYGsSsXLniKOzhVIU6yKzVomw==
X-Proofpoint-ORIG-GUID: 733nTB_8ZlAF4dmVR0nJ1oJpafd_MoC7
X-Authority-Analysis: v=2.4 cv=SP9PlevH c=1 sm=1 tr=0 ts=69243b01 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=69EAbJreAAAA:8 a=EUspDBNiAAAA:8
 a=b1RjkcaNCWOaYSfdytUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-24_04,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 bulkscore=0 adultscore=0 suspectscore=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511240097
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

On 11/23/25 12:03 PM, Maud Spierings wrote:
> On 11/22/25 14:37, Konrad Dybcio wrote:
>> On 11/22/25 12:07 PM, Maud Spierings wrote:
>>> On 11/20/25 16:36, Konrad Dybcio wrote:
>>>> On 11/17/25 4:44 PM, Maud Spierings wrote:
>>>>> On 11/17/25 16:35, Konrad Dybcio wrote:
>>>>>> On 11/17/25 3:13 PM, Maud Spierings wrote:
>>>>>>> Hi Konrad,
>>>>>>>
>>>>>>> On 11/17/25 13:59, Konrad Dybcio wrote:
>>>>>>>> On 11/16/25 11:52 AM, Maud Spierings via B4 Relay wrote:
>>>>>>>>> From: Maud Spierings <maud_spierings@hotmail.com>
>>>>>>>>>
>>>>>>>>> Add nvmem cells for getting charge control thresholds if they have
>>>>>>>>> been set previously.
>>>>>>>>>
>>>>>>>>> Signed-off-by: Maud Spierings <maud_spierings@hotmail.com>
>>>>>>>>> ---
>>>>>>>> Have you verified that e.g.
>>>>>>>>
>>>>>>>> connecting the charger
>>>>>>>> setting the charge threshold
>>>>>>>> rebooting to windows
>>>>>>>> rebooting to windows once more for good measure
>>>>>>>> rebooting to linux
>>>>>>>>
>>>>>>>> still has the settings persist?
>>>>>>> Hmm I have tried several things but I can't seem to get the values to stick. I the spmi-sdam driver is compiled in, I am not quite sure if I might be missing something.
>>>>>> Hm, I wonder if Windows/UEFI overwrites these values or whether they're
>>>>>> used by something else..
>>>>>>
>>>>>> Can you set a threshold in windows and see if Linux can read back that
>>>>>> data?
>>>>> the values in /sys/class/power_supply/jada-jada/ are zero when rebooting from Windows into Linux after enabling charge limitting in the Asus application.
>>>>>
>>>>> I remember my old vivobook (x86) also forgot its settings each boot, but given the nvmem cells that should not be happing here I guess. It is odd that there seems to be no collision between Windows and Linux. Maybe the Windows mechanism is doing the old trick of writing it in there every boot?
>>>> Odd indeed.. Does it work if you reboot from Linux to Linux?
>>> It seems not, I seem to remember testing it quite some time ago, but I cannot get it to remember any way, at least it is not popping up in sysfs, always back to 0
>> It seems like the driver currently only populates the sysfs start/stop
>> values if the "enable" bit is set
>>
>> Could you check this (hacky and wrong) diff and give it another try?
>>
>> diff --git a/drivers/power/supply/qcom_battmgr.c b/drivers/power/supply/qcom_battmgr.c
>> index c8028606bba0..9ebd8adfb8eb 100644
>> --- a/drivers/power/supply/qcom_battmgr.c
>> +++ b/drivers/power/supply/qcom_battmgr.c
>> @@ -733,7 +733,7 @@ static int qcom_battmgr_charge_control_thresholds_init(struct qcom_battmgr *batt
>>          u8 en, end_soc, start_soc, delta_soc;
>>            ret = nvmem_cell_read_u8(battmgr->dev->parent, "charge_limit_en", &en);
>> -       if (!ret && en != 0) {
>> +       if (!ret) {
>>                  ret = nvmem_cell_read_u8(battmgr->dev->parent, "charge_limit_end", &end_soc);
>>                  if (ret < 0)
>>                          return ret;
>>
>>
> Nope still nothing, there is one err about "failed to send synthetic uevent: -11" during startup, but I don't know how relevant that is.

Hm, I'm a little puzzled.. It may be that ASUS customized the charge control
functionality, but I doubt that

In any case, this patch should let you limit the charging bounds within a
single boot on Linux, so that's already useful..

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
