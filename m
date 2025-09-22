Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC59DB90667
	for <lists+dri-devel@lfdr.de>; Mon, 22 Sep 2025 13:33:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B10610E441;
	Mon, 22 Sep 2025 11:33:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="RFl7+RoV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BC7B10E441
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 11:33:46 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58M8ufNE030265
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 11:33:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 8ny3tRDGyVpQC4SF6j/gk9PZ+S1uMs0oLN9O/oVrvh8=; b=RFl7+RoVThr85vGk
 0pq84J2kUfPoEE3WsNh6VQcoF4kb8m2Z72K5ej3yZCzlaicskMi9BVCeN+AUwxt1
 maMW7IHkViPYAXSrvKlt3G8y8eswCIT5/+Jhvi+08bQoJtAQB3J1K7tsLcBnlO/r
 uO0dEFeC5s05UDFPUQl/QxFe1XN1psGPHiCo0fcYOAOUaItSHLkOoiQoXfJKQ7f/
 0QZGJhEANzPFktT2Ik7fCZUzgYdl+kQHmjf8S86CC08zyN9bfehARY4q/WVGU6Mm
 YAh024zFm/pDMktZtYjzHzxCTDk7uoSkG2NVvroSVEqb1M0ypux5ePtG+JYMyCC2
 dukhcQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499k98ckry-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 11:33:45 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-26b3e727467so9454515ad.0
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 04:33:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758540824; x=1759145624;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=8ny3tRDGyVpQC4SF6j/gk9PZ+S1uMs0oLN9O/oVrvh8=;
 b=fJWfNVOiiI88lPAM8CkFaG8PgqJBMNNDCrAo0ESoyrOJ9WDdT0Olk4LSHZKnlJ3kQX
 a1dNaDJeezAlUJWAUzlv+IUzJ5Uum07cneDzcBm4cnsTBTkw5geB78QOiZVPWkqqTro2
 uh1Pyd6s91a8MvQHibSge5C8KdL2/hVtNGSvUfmyVGSqh5nOkuA7CO9FFvy0zBKWfuYB
 zGs7u8CG6xEfQF+e/AOQA5+yfJerARu+rU4PL0IKNaaMKdtcbkGskp2G5iLIr1+asDNp
 l5btIyrnot3Ofnt/kR6NGocghHqTfdkqXFKqUq0oakhA6HnbhJ7wrrwrXUFaLxBhrOJq
 Q5YA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVuR3IuHUgRbywVg9t9Bp1fVrO7lurVqIGVnsFlGZJ2BDjlHfvcPpYw+ZKX/Yz7AR/CkIHhTYZ5VDA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywi2UiKuEjSVZgf7cJsL9wq8nvRBq1xbDrtuPpJ3BtEA3pk6oF5
 NlG+QdCH/y9qWVpZM9rAVATjiZV9IjzGQ6xENS47GLu0U1LvMs5V8RqE6v2MFdWWM0Mnsz0Oz5w
 EmdBTAogsY1S1PhGPIGnhQa444g/l0M902KU9kH3jgA6X7wS1Xpy4XUZYSKhTmnrG0OEH2Bo=
X-Gm-Gg: ASbGnct1RCO49pPTSt48nyvGBTm8IXloNAp4rGadsqjQeNtppCBNC2/egGeXh44mYip
 a/eWjxytbRPba5qRX+4dGleyTZ00LGWtavmYLnm13LdUofx0dN6uNjbMIMss0YGQEcB3m48ScDd
 r38Tjwr8/tx7fa7aUahI+eWAAFXPPlTSwLysw1/Ug0lWVfMj2IvKhKYwJ6FchQG9AjrpQOPogZ8
 rohQJlt+CXxOOSx8H5KSO0sbj1GoeqtwBXfI63ih/LxDJ69bp0ocsD77FN29EnpgUo3LCMSq6II
 a4g2S9twI8Tp3tq+mcVPSIqqv/2x2VT2xVLLXq/OopcDHijvp/q6fyVnvYCXdZG5c6GMHteVQSA
 zk1tyhAIIeBKo09EXlmd2WII8bvPw0QuCnQs=
X-Received: by 2002:a17:903:110c:b0:266:914a:2e7a with SMTP id
 d9443c01a7336-269ba50450bmr97853045ad.6.1758540824173; 
 Mon, 22 Sep 2025 04:33:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFDHH9Jnyu/wz0+fPUoAUMxFXs1lC0P7l4A/wqHWPTtDgp9+q8Jyik+xPio2B0P/RaEWdFbmg==
X-Received: by 2002:a17:903:110c:b0:266:914a:2e7a with SMTP id
 d9443c01a7336-269ba50450bmr97852675ad.6.1758540823742; 
 Mon, 22 Sep 2025 04:33:43 -0700 (PDT)
Received: from [10.133.33.111] (tpe-colo-wan-fw-bordernet.qualcomm.com.
 [103.229.16.4]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-33060828031sm13050240a91.26.2025.09.22.04.33.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Sep 2025 04:33:43 -0700 (PDT)
Message-ID: <f53fd974-f3a9-4efa-8cca-ff639d75196f@oss.qualcomm.com>
Date: Mon, 22 Sep 2025 19:33:36 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 07/14] phy: qcom: qmp-usbc: Move USB-only init to
 usb_power_on
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
 li.liu@oss.qualcomm.com, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
References: <20250919-add-displayport-support-for-qcs615-platform-v5-0-eae6681f4002@oss.qualcomm.com>
 <20250919-add-displayport-support-for-qcs615-platform-v5-7-eae6681f4002@oss.qualcomm.com>
 <zjegjucwluzzh2x56mn7dpk4ocmbdrhyvubkxprpiuko5cifvv@ygvbal3vpssv>
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
In-Reply-To: <zjegjucwluzzh2x56mn7dpk4ocmbdrhyvubkxprpiuko5cifvv@ygvbal3vpssv>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: mF39ZxwNJepOWrzhTXYixwQvOSegDtWC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAxOCBTYWx0ZWRfX25sFXmR/mTy/
 N9x2ksC08SBuJ7aF47K2C6/Kal5e7TiGYEL9OcKR/T5/UIkvpRc8UGMkvVa7LINs0jwY80KM+tH
 O0085wto4Itw84JhEJvQ4y7Y1gbgyY2+vm9Fl/UBhGFr/3u3eHLpQSLFdkWd1EUi3Q53IezNHPS
 b7M+S54SQp/8NXL4rJtZIWUIZOlZy1QUrgL8nce8lyp2QcSaPr56gosMXGdHaOknmUsCGNn1p5g
 Os5mPDqG8DCmNAGXTeHLwJvhqoKIYfirgjy+HM3pgS521FHfhlvAf4C1eAxvjRsyMmiVYN90uTk
 iW4vxPgw19oKqE6SWwZbnBCpgxB+xWbygBxx81+mCZ9jc33QHXxvy54z1/K803bWf/fIjhRsykS
 NYluOnZo
X-Proofpoint-ORIG-GUID: mF39ZxwNJepOWrzhTXYixwQvOSegDtWC
X-Authority-Analysis: v=2.4 cv=Dp1W+H/+ c=1 sm=1 tr=0 ts=68d13419 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=MW-FMpQjATtQXXRqn1QA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-22_01,2025-09-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 bulkscore=0 impostorscore=0
 phishscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200018
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


On 9/20/2025 2:48 AM, Dmitry Baryshkov wrote:
> On Fri, Sep 19, 2025 at 10:24:24PM +0800, Xiangxu Yin wrote:
>> Move USB-only register setup from com_init to qmp_usbc_usb_power_on,
>> so it runs only for USB mode.
>
> Please rewrite the commit message to start from the problem description.
>
> With that fixed:
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>

Ack.


>> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
>> ---
>>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 22 ++++++++++------------
>>  1 file changed, 10 insertions(+), 12 deletions(-)
>>
