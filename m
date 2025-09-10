Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66678B516B9
	for <lists+dri-devel@lfdr.de>; Wed, 10 Sep 2025 14:21:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 094F510E916;
	Wed, 10 Sep 2025 12:21:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wj/r7+F2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0068F10E916
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 12:21:48 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58AAFNHH003916
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 12:21:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 0vMWTcElNgxy4rtHU4PlXXcjyINdBlSlLR0M7KQ8Dho=; b=Wj/r7+F20oSLhcZm
 gR7IlHEw0gGVfncRIWGRYXpijto16adl9ymBPXPuthfLEojRI5Av1bSHNvA49oIj
 aCUo37w1MOdFQk2HGeF+I4PlPmtIitFaGpFFNZwwkJQ+sYMmaUVYmGwHwgduKqyo
 88dNq3C8/tWeLOKZiMmzocJYh2hsmr24WCHA86087SNLdxn07jII9v5S86iR9b5s
 WTNpjisCL/gnTjGLu6uqZAK4S2AVnURN7MXCr8nJbzcj6xRTrDHQK13KyqOHy0g3
 9WWrWrFoZiHu31WeP+ksnlF1BMVx2VVBarAQln7F8AZZBIiMDx5iQqldQ5r5t+4/
 2YFssw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490db8ku1p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 12:21:48 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-721c6ffab9cso15967666d6.2
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 05:21:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757506907; x=1758111707;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0vMWTcElNgxy4rtHU4PlXXcjyINdBlSlLR0M7KQ8Dho=;
 b=CLrtGtbPJchtAMTXtMUiopL1SjsyUyEglXFLl1zvWEolqKdWggjD9l9vZxj3/AL1d0
 4lTNRmvmf23ByfqKWNCsoZA1DrXdUfLJmpYD4tg+inucU7RvVT8LIIRB0Zw4Hw5OjrHv
 1u8pgPSloS0jjA737+gGK9dXq5EZQvWBX2ALrd6S/7O5hwJiViEykRXHRr1sh4GHRqfg
 WTpK2DHL6v4tG0sU0xBB2CPj0YPU7U2//Ju/Y9ubBnHAi/AdwjR4JgiK9ewKC9IToy2g
 ND7vrYiBeh50RHRB1pNHdByTnRISkiL3CwMBWsn2GLjo40dFUD8myQxAi7tIjbimPIxD
 NG0w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVQv8JXK/fHaKxlRNOo76n8VCEUlF9IkELZyJQmpkumyHI7eHA55zQZFfNy1cGur+tqCbxtD/u6+hY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YziI/Swed57y1HM6xsVymgPC46K/9s2rMK0BynMmZtXacQUVmTE
 FQyqe4+6xKpa/uEuayQH+WRtb5FPRfJ30tTWeBInOfg8hmIRZW/H4U0BjG4Da55unEHvzTxBcdM
 7PeJvAI1ks0XO4wgcjUwWESBwKayoqqlYk+52eV6JJnnlb2qJVS0clQ6k1hRMFm4qu4kfWZw=
X-Gm-Gg: ASbGncsT54efmAXh70LDLeG+m2MigXx1LIblqGuFHRjyimHeMUnIphVvLkGfBeY/nkY
 cBl/9/helBnNOqNqOOorNaux0D3XIOj/SyFHvra/thTTyGD8sBeGQS1QwN0FktT89+KC0JWI29k
 HXK5H2BVMR2hQsfpIuTsMGYr9/XNcGQSShDJF6D7HUiv3vIUslUeJ0VC157/oT/qx/0IMyZM5MM
 zJFXGfbORHoQ+O413Tc4nAIviKNELnY9VNCCrsFdeb1cdyKJe7eQ5vmj7z49gkjCgvfTOs9NAlx
 Bl5PTPwBq1/h3hL1n/wyYPJjingWfgqs8tKN5hgyGRCGn4goqpKZFZLpW0KOj8TmZ0B9k1swRyW
 UqKZKTRyNk53B2oqCgtEVtA==
X-Received: by 2002:a05:622a:1787:b0:4b3:4590:ab6d with SMTP id
 d75a77b69052e-4b5f848d05bmr107672711cf.7.1757506906952; 
 Wed, 10 Sep 2025 05:21:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGQM2ETnZwgBv+qedS1fE1v5n9TD61CTWqUhCz41J601U3LDyveBpzWSkY3wpyOOnfMzFjhOw==
X-Received: by 2002:a05:622a:1787:b0:4b3:4590:ab6d with SMTP id
 d75a77b69052e-4b5f848d05bmr107672451cf.7.1757506906461; 
 Wed, 10 Sep 2025 05:21:46 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b078334e86fsm158892366b.56.2025.09.10.05.21.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Sep 2025 05:21:45 -0700 (PDT)
Message-ID: <1f979b86-b45a-46dc-b926-64f5b1b84f7b@oss.qualcomm.com>
Date: Wed, 10 Sep 2025 14:21:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/4] arm64: dts: qcom: sc8280xp-x13s: enable camera
 privacy indicator
To: Aleksandrs Vinarskis <alex@vinarskis.com>,
 Hans de Goede <hansg@kernel.org>, Lee Jones <lee@kernel.org>,
 Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Jean-Jacques Hiblot <jjhiblot@traphandler.com>,
 Jacopo Mondi <jacopo@jmondi.org>, Sakari Ailus
 <sakari.ailus@linux.intel.com>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Daniel Thompson <danielt@kernel.org>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 threeway@gmail.com, Andy Shevchenko <andy.shevchenko@gmail.com>
References: <20250910-leds-v5-0-bb90a0f897d5@vinarskis.com>
 <20250910-leds-v5-4-bb90a0f897d5@vinarskis.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250910-leds-v5-4-bb90a0f897d5@vinarskis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzMSBTYWx0ZWRfXw9wjW1WsNygI
 dmAHxkGzhft+dXKdGa7243m2QbxRrd/PKoxcXFlbr8CUFlViRAtIB3hEnO70uW4WYKs0DJQIKIa
 PewqYQHjc+HJ5Y0WwjRv8t3wxyBwhmZmiOqJk6JV1suco2t5CDj6eimRNX0aOVKe4MxYm2DVatE
 UBQoIt07tPII/H2AGhoH6gbDCHGMZ6IBRkTktXwgejlrIe9anTxQZ848yx/XAhWjs8Z/JeQG4Co
 RfnEwacN8pns3MGMgn+bUU+/+YgWBclY4We0moo7dwv+6OdlsNIOzBVvADAKvGNZ63SNvxK9vwJ
 RHobJYgcafAluwLP64RA1lmpfU7oVfl+gX83BDK+052rpKUhUksiRLJmEZaTAuTvNy9afMaHkXD
 M8GciAxE
X-Proofpoint-ORIG-GUID: i3FWNh17eTzCRMyGusfoJGRrf8q-JD8h
X-Proofpoint-GUID: i3FWNh17eTzCRMyGusfoJGRrf8q-JD8h
X-Authority-Analysis: v=2.4 cv=VIDdn8PX c=1 sm=1 tr=0 ts=68c16d5c cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=I76Qk8w-AAAA:8 a=EUspDBNiAAAA:8
 a=q3hGUckLsqYRD40seJgA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
 a=vUPM0Wvl0xcrLs4nqPIT:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_01,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0
 phishscore=0 adultscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060031
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

On 9/10/25 2:01 PM, Aleksandrs Vinarskis wrote:
> Leverage newly introduced 'leds' and 'led-names' properties to pass
> indicator's phandle and function to v4l2 subnode. The latter supports
> privacy led since couple of years ago under 'privacy-led' designation.
> Unlike initially proposed trigger-source based approach, this solution
> cannot be easily bypassed from userspace, thus reducing privacy
> concerns.
> 
> Signed-off-by: Aleksandrs Vinarskis <alex@vinarskis.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

