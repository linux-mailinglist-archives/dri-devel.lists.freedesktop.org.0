Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7908BC7502D
	for <lists+dri-devel@lfdr.de>; Thu, 20 Nov 2025 16:36:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 194B010E776;
	Thu, 20 Nov 2025 15:36:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="fSk1CVqv";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b2S9nx2A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45A2D10E776
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Nov 2025 15:36:50 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AKCF1KH3759155
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Nov 2025 15:36:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 e5mg+zvyUutw7UK0He3cdlBatNPtFBXUZumgkMxwM08=; b=fSk1CVqv037tFUj/
 VFpZc0eF4j5CV9ylPDSR7tB9pi6ooYmcO+kByxxi8lrx+PUC1TWCcysMc99qEKgP
 kG3QP8gUoGZLS4MfCcoyzCvh/86JC/HxEtL9dUkxP7X7pOsRLVFqo0jpOnLtQ58J
 KVMYXdEr2oc/2x/7PAqFcO9mRZMqC8UjjgibvPe+jWJ6O3ZpIMpt1cSznZFcXEoN
 IzjHMwaJ2qU9yByCCFpxv7fy8Z3D3Bj9YRb4cEJUaXsAZypBf7UzOvjjREU5hTFH
 G8DGzVWENfXM5SM7UIaTs8KrTXBUwsjrxlPClvaSBhITeFTAW9iz0YdXDkqQ/ie3
 cUSKuw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ahs2e2fu8-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Nov 2025 15:36:49 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4ed83a05863so3569881cf.2
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Nov 2025 07:36:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763653009; x=1764257809;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=e5mg+zvyUutw7UK0He3cdlBatNPtFBXUZumgkMxwM08=;
 b=b2S9nx2AF2yEIoVp3HpE2fwVz+K1CNCb0F7JUS/nQgqV8MtMvJHFXme7PHG7yPm6MJ
 60yXkpcYrevI2y+h6o+iQj+dNER41Y2StZr3ii4SrOYbHWfZoteqIVWEuWQaQbrH+mFH
 ThqgHK9MM4ixVKTKzyjOgYH6FbpeXyPLR0cAsKxasUGI2KWbtRyAMI7LEKWYuajq1wmv
 xDXgA7wn2jhR00gHISWeqRUXwqO0QZBJNidBzGr168VdgVHdNZ+a1zXiV5jdSlbh4j3F
 5UzR/XHcoMco2dwyCI7tEFgUYIw97DQ5zg6DhP90AdBACDkLv7s7e9eavtZ/HJLBpp6N
 nqTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763653009; x=1764257809;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=e5mg+zvyUutw7UK0He3cdlBatNPtFBXUZumgkMxwM08=;
 b=huegmqrl+sKR26Wtjb8towG46z6xg3W9zVlrpdzOiNA9ikfoZ/YzzS2s3TuXP/0rR7
 kKpNNkDt6b75HObp/UNBH3yNIcsIp+/90obgX8Qtr0DrOgiz2AcyFyiWz5BuSdSxibwF
 F0ax3XQIkVYKBQp5NvawZnVMxFS8KFQdH5LlOH0OatcysaHLqXfVn2jJ24KyEW7sasyp
 49/TZeMV8zwtSM/yI0Fj2LUykZx/YZLGoux1NSJd+loqLvlbFNRNt0xdY/iiW9z224Ag
 cS4ZvzE23OOVjAlAyV5ZStOIEJgyqaAPJTNZBVvYVvhNdvihemO1lb69scv3Tj7Srb1q
 yrqQ==
X-Gm-Message-State: AOJu0YwnD8z2LXhfCsZDt3NWzI9MNezwB5KR63lXou6h0JXqQRcM9x7h
 i4Y2UmkA9wG9ktUUXi9qOy4J1ffd7i2EjiuQxATeeVBnmz2rFf+e1s322IvbKcQYKLCkCJ3T21Y
 vYay43GeSZAeFzWJPjgJAj2ArIXUPAwsqtGArL6FPra5qTyXt/WKNXcKXkza02J0Ucbg8jMk=
X-Gm-Gg: ASbGncsJhbxyzD+XsTDhRFK+pRVzZ/yOgJbfsm7YWbpPZGTYbCizq3lpWXzvXuxTVnx
 vqezzS8Ac0ChwPev09od4IgDx7QM2sCl8bQiSkOVEf3T6i3xoK+N/D1HADOksLNQmnACv3gogWp
 csoU4D9RBBNzY+qZma0oDJUQaoEnAcQsMIiFQMwD57qZKPhAlmprqtCLLe7FGZVkqQZbgeZYA34
 B2efbwIFjCyOSOz/QH7TPWDnY6NITM+Ue96pXBmTaX2wQ4+QlO45+m7geI7c8LX+KKXLg1BBPxo
 T8+d9ET8v9nkxwwx/Ugj4n9lp00Yo/NcMtdxjNDeHl+r6ZJ1LVJXFXjEwaxve2zziEA3Z1jMN1S
 I00O71Ia1OD15B4+1DlDsI96ff5tXZ55xX6GY+1jn9gqMsqW+9v+O18oWgg/NBErLgwA=
X-Received: by 2002:ac8:598d:0:b0:4ee:87e:dedf with SMTP id
 d75a77b69052e-4ee4972fffamr31809911cf.8.1763653008700; 
 Thu, 20 Nov 2025 07:36:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGnOTH8PO0trW0TWGHubhIETfCFdojXrEbc5Euw4j3mVrbNZgE0HWns168CycpWGBdRJs3oIw==
X-Received: by 2002:ac8:598d:0:b0:4ee:87e:dedf with SMTP id
 d75a77b69052e-4ee4972fffamr31809301cf.8.1763653008144; 
 Thu, 20 Nov 2025 07:36:48 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6453642d267sm2272412a12.22.2025.11.20.07.36.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Nov 2025 07:36:47 -0800 (PST)
Message-ID: <57bab427-d8fd-490d-88f6-358b79367ed1@oss.qualcomm.com>
Date: Thu, 20 Nov 2025 16:36:44 +0100
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
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <PR3P189MB102003218DCCE87EEB69A0E4E3C9A@PR3P189MB1020.EURP189.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIwMDEwMyBTYWx0ZWRfXxGpsF5c/h0PO
 JRw+50SrtRgW93k468OIqilybLfy4AFTuCxsvk6lB9hyAPSSVz2SNz3G08klhUzvyU2P5utZD/4
 X0k0voZYEJXpFfFPJZRhJyz3zGSGov/NyAtL/nwGXAUkrsIKRqepB0rmAqRxmVQm2ifpI8RrYOB
 Cz8syoBgjHmimIHgVy1iJcXEjNw1/dgphRVUlD6k/jbSnCZLpWH50jW4xRyjaEORNwA9CvnoFhF
 tYhuo/d3r6QnKorYU2YXclxnZwvA9FP29rEtTJRh0ZjDGzVKi4oW6zZq3xAtJglYm0uslGVxqXp
 groyh8twj9oBsOmOZ9JAxc9I9dDk5eYnuww7ARcmSsuhuqiv9eLr1325x9Gr+NZIwZuWLaglZaX
 8W2x0VS9Kfg4yLkqIZgsZFPxuOlCCA==
X-Proofpoint-GUID: Wfy5daV075SuyP9i-mtjGP7C3Yp5FYUB
X-Proofpoint-ORIG-GUID: Wfy5daV075SuyP9i-mtjGP7C3Yp5FYUB
X-Authority-Analysis: v=2.4 cv=AujjHe9P c=1 sm=1 tr=0 ts=691f3591 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=69EAbJreAAAA:8 a=jBJ5OEMDLcug7rvSSDIA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-20_05,2025-11-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 suspectscore=0 phishscore=0 spamscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511200103
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

On 11/17/25 4:44 PM, Maud Spierings wrote:
> On 11/17/25 16:35, Konrad Dybcio wrote:
>> On 11/17/25 3:13 PM, Maud Spierings wrote:
>>> Hi Konrad,
>>>
>>> On 11/17/25 13:59, Konrad Dybcio wrote:
>>>> On 11/16/25 11:52 AM, Maud Spierings via B4 Relay wrote:
>>>>> From: Maud Spierings <maud_spierings@hotmail.com>
>>>>>
>>>>> Add nvmem cells for getting charge control thresholds if they have
>>>>> been set previously.
>>>>>
>>>>> Signed-off-by: Maud Spierings <maud_spierings@hotmail.com>
>>>>> ---
>>>>
>>>> Have you verified that e.g.
>>>>
>>>> connecting the charger
>>>> setting the charge threshold
>>>> rebooting to windows
>>>> rebooting to windows once more for good measure
>>>> rebooting to linux
>>>>
>>>> still has the settings persist?
>>>
>>> Hmm I have tried several things but I can't seem to get the values to stick. I the spmi-sdam driver is compiled in, I am not quite sure if I might be missing something.
>>
>> Hm, I wonder if Windows/UEFI overwrites these values or whether they're
>> used by something else..
>>
>> Can you set a threshold in windows and see if Linux can read back that
>> data?
> 
> the values in /sys/class/power_supply/jada-jada/ are zero when rebooting from Windows into Linux after enabling charge limitting in the Asus application.
> 
> I remember my old vivobook (x86) also forgot its settings each boot, but given the nvmem cells that should not be happing here I guess. It is odd that there seems to be no collision between Windows and Linux. Maybe the Windows mechanism is doing the old trick of writing it in there every boot?

Odd indeed.. Does it work if you reboot from Linux to Linux?

Konrad
