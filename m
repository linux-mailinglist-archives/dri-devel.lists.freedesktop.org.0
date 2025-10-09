Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3937BC81F9
	for <lists+dri-devel@lfdr.de>; Thu, 09 Oct 2025 10:51:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58FB010E11D;
	Thu,  9 Oct 2025 08:51:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="g6asApzf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F59B10E11D
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Oct 2025 08:51:36 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5996EIx1004929
 for <dri-devel@lists.freedesktop.org>; Thu, 9 Oct 2025 08:51:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 rozNwP9rNVxJdTGVPBs6oK2WCT/2tAO/uW1pQSfTVxU=; b=g6asApzfeKmK3zLb
 wl//PB0rnxxAAX8m5sv+CLKGbSipro+ye5sHZr8Z5NIxdtKNP9/TDb9EFWeAz72m
 ejccBed6/GW/q8T72DY7ps+OE4IT8hICP+uHj3ZlapAZ291LsDX6SZTzXtWHIcWr
 H99zwm/DMUKXiIlE1NHBJMKebjumVwQknEGuup3lqjBaMoWuKt6SZEtqmxr9zJbu
 vyoNeFzLoNVXfXaO2sWYHxkN0s1iGDwgFsHpvZ4b68/iu2BCeGQmnfc6LFSZZpEw
 +6myKfy1NMuu7oGtUTB+icHtMBtOfOoW+ka7MKoGbNLvVbYKzt5dSiujbfwqOm1Q
 k7TlKQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4u248t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Oct 2025 08:51:35 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-87bbee3b92cso333136d6.1
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Oct 2025 01:51:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759999895; x=1760604695;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rozNwP9rNVxJdTGVPBs6oK2WCT/2tAO/uW1pQSfTVxU=;
 b=GfqUZD10vVwlubW9M7Js39hxBXLCIfeZvJmpjlXUPN0ckltrXzKgwavM+UazC+R60T
 oHwPcjyLFA3L8Dq5qaC7cxs0oMSOB9/2LBQ++mRdqGVxSEJG+GK+vHRKtpuxoaljgjFo
 B9ipOqNoM0vfeaFns1Qz6gu6vd+Wh4CjWfMFocFZ6Vu8rCDv02QL6t0yYWYQAzIEcqEj
 griZGTx2FnOYrmk+u5Xx8NUyC/Gug47+xCLs77IrmoqVV5/aGqsgwo2hQLB05r0nJTX/
 LNWgHy2llK+7p/S0CQwUhittx3mxmO1GpO+eDoFM91DEz5CAN5ftA7A0xSaIlcSyTjnS
 umQw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUiUG7lTCgBuMCt4qVx1Oeztl6Detxae+8cxoImQT/+ZbUmtqG/toNI1yXJKbsKsOzt7YVB0/6iyD8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzxmeuxsV3AAFoG/j1N9GemIhMmKEN0Sk/eg9hXEAvze3oVfCOp
 0xDn1SwudP7SoH4Iu54M0IV7ivGyB3BGdZsKG1OdjSs8gG2Fej3d/MD2pLs/FqJJDNDSLSr7225
 Xic3NxzOsEqVZfIW7VA0F2a5RLKkGKQY1zl2HOfjT+KXJRenwPQY9LdbrCjUWFBuuzEbszig=
X-Gm-Gg: ASbGncvyklaSLzxqGYk926eXFYRl/ev/wXoGWgIDSmsgVLKOK12gor4DpJFU0ozpKR9
 uPo6LewiWBQ6Sef7Vr7336IevAy2tEV9vr2Q500r4exyrmNB+QRq5mA5tGSmGf5Tfll2HwE3leg
 2fTEEOJoZlMDUNW5dZideArphOVpTqUP8jna5tt5Lve9L9AYM7ZW1kvc7iAdDu8Ho3MtvudTthb
 KbnZmdR37L3g0DDvng3B3V4C/CS0RMmv3J7b3qfZTzB2KrCKU8lVOqsYzMOgMGHeuVMW+4S8VKw
 fjj3O6XHfW8B68F306yxcoG7y7NI1MyjdihIxI6si+CCvC1IjijDb37B3uvS0fEki4QBmM4bt32
 wiIouLmcfbHobme7wRryryc7yDCs=
X-Received: by 2002:ad4:576d:0:b0:87a:a954:4073 with SMTP id
 6a1803df08f44-87b21027da1mr56827896d6.2.1759999894537; 
 Thu, 09 Oct 2025 01:51:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEdr0m1qJjPCGx95tl5+kQQ8Lc5k1Lvq51C86DjFACuanr/UCQghW1BHHi6401yO2k5MyRZFA==
X-Received: by 2002:ad4:576d:0:b0:87a:a954:4073 with SMTP id
 6a1803df08f44-87b21027da1mr56827646d6.2.1759999894039; 
 Thu, 09 Oct 2025 01:51:34 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-639f40f23f2sm1850757a12.38.2025.10.09.01.51.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Oct 2025 01:51:33 -0700 (PDT)
Message-ID: <74893f76-1b7d-4cfb-ba7a-9fd64427762b@oss.qualcomm.com>
Date: Thu, 9 Oct 2025 10:51:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/7] dt-bindings: panel: Add Samsung S6E3FC2X01 DDIC
 with panel
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, david@ixit.cz
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Thierry Reding
 <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Casey Connolly <casey.connolly@linaro.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 phone-devel@vger.kernel.org
References: <20251008-s6e3fc2x01-v2-0-21eca1d5c289@ixit.cz>
 <20251008-s6e3fc2x01-v2-1-21eca1d5c289@ixit.cz>
 <7askbazrkbny5jlw6cpxcpjyw5nyiozmksoyj5b5momcc7w5hn@r3x6kddatf3u>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <7askbazrkbny5jlw6cpxcpjyw5nyiozmksoyj5b5momcc7w5hn@r3x6kddatf3u>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Vrcuwu2n c=1 sm=1 tr=0 ts=68e77797 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=LME89Ewccn7mWiF1t2gA:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: VhqHNt1jBjjnV4O-jGc7AP049waJ5b-u
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfXy9UrS1yaJhta
 KiyRO801cpDMnewYqCByfH5hWLD6/tnes7uiA4D52kTsGXuhxYNIV+n1L4qtHZBZi7C2KxPZFGn
 MTQWkOiHJfQRMGwyP1aJClt/ZK4cDWjlkwPQ3Y6JH6LN4dQaxaorY4wrc421Cy2IzC3ajReR+Rd
 lg6RmF5KW6/lsR2z9vD0zEopMxeCw+ZXlrwMYGy34drxOd4nUTugEMw6jD4Oq70tjR4NvthcOL9
 R03dVJEWIH9KolTfjXUAdwh18xqg2eZLM2EcaNkS2B5Rah+jghYZaL6lMKKABGUNkXUrTzD5typ
 11UdPZaywJWkS6IL9InjnU2MkB1PP+m4cJv5x0nlDTIQUZkMV33dtNITrmO2ZYSTOkr5SHyHLhR
 a8vaoHS9MhCX3FZ8GEM2zfpOD+C5/w==
X-Proofpoint-ORIG-GUID: VhqHNt1jBjjnV4O-jGc7AP049waJ5b-u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_02,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 impostorscore=0 clxscore=1015 adultscore=0
 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121
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

On 10/8/25 8:57 PM, Dmitry Baryshkov wrote:
> On Wed, Oct 08, 2025 at 04:05:28PM +0200, David Heidelberg via B4 Relay wrote:
>> From: David Heidelberg <david@ixit.cz>
>>
>> Basic description for S6E3FC2X01 DDIC with attached panel AMS641RW.
>>
>> Samsung AMS641RW is 6.41 inch, 1080x2340 pixels, 19.5:9 ratio panel
>>
>> Signed-off-by: David Heidelberg <david@ixit.cz>
>> ---
>>  .../bindings/display/panel/samsung,s6e3fc2x01.yaml | 78 ++++++++++++++++++++++
>>  MAINTAINERS                                        |  5 ++
>>  2 files changed, 83 insertions(+)
>>
> 
> Please also describe, why it's not enough to use defined compatible,
> samsung,s6e3fc2x01. Why do we need a separate schema and can't use the
> panel-simple-dsi.yaml

panel-simple works for 'dumb' (perhaps a harsh word for 'made with
just the in-spec DCS commands in mind') panels, but Samsungs are
widely known to require a ton of vendor magic

Perhaps the original change was made with an "oh it just works
surely there's no drawbacks possible" attitude, as the panel
was left initialized by the bootloader

Konrad
