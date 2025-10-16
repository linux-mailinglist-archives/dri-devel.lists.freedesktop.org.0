Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97CB9BE555D
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 22:13:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB85E10E34C;
	Thu, 16 Oct 2025 20:13:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="IJbWk0VY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F214C10E34C
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 20:13:04 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59GF8CIL004682
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 20:13:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=EZQrGx2m2xHUIxdtUEMN1cB9
 SbmMCf28CGDq/t4r4js=; b=IJbWk0VYTEllwTRWe8pLZBWqeFQZD5Hgo8gLf494
 nwsIHDZIG7vexKXz9+8KCJ6jGY8LvUXuvBt0nlFwE8q4nvDEOLS9DArAQ7K6Mkwc
 bbJ2t9ZpTQ5PHfLBNfn5sqOAig2K7T3+oADnIBkO8m3zdc5QHwurMMXd5Jucg8Wn
 vUlfiv9TXv46n9nI5G+nSO2SW6S8UDGgPT6MomcSMrFKVVDFs1KL0qKsVzbb7ibl
 ahlhTkSME3vKK5kZTuIW74+ZRXUOrOCChggm4z7bNbKR3w0cmUHqdtqhFmIWEEK3
 79sN/Z/55ePVXP+i9BkSj32yAiBKxIjK/ouIJJkYexJuyg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49s6mwuymk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 20:13:04 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-87c0f8cbe6fso44131626d6.0
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 13:13:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760645583; x=1761250383;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EZQrGx2m2xHUIxdtUEMN1cB9SbmMCf28CGDq/t4r4js=;
 b=wmfstcpei3UGIHiY9IE4rq7cOcSc0iz5Wpss33HpecRG21P0ZKdABqnaC+xVvw8OzM
 q07Fzksg2jqGNw0rvy2jTjGrw9X+Omhud4I8stKlBfQj+3NFK49gN9wVm6iPDv1UTyU9
 kQsSW7KXtgm9UPw6oGL8vMo+7/7wWN+SuENO3S6i5FUQY24mY/lASCsPg5VXxUqwRVca
 TT6v5MHRmaOyeLYjtWWfMxx69mE4HmtA+F+hDVtJk2tyuMapsxCCM8RNUPMqDC44sXcC
 6sh/6HufVbXWrkezbYLnKC31gwWiMWXtpG4JsxufXhwqU9J2vKB3LLQsx7Z4bfVokuFs
 slrw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU0pj+UbgU7W7+Irl0Kgf7XP6CVZLP8KE2H0+XajBk+BLUXVrwG0O2am9XRk+JHOggWCNsKTFZqoas=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy8OwIjwM4cYThoJyTdnCI5UEU82w8EXDxNXN0STFEiZfYd4NPt
 6Lapz4MkOBA95CPDHoaV0hm4yKXgM4oSpNC9/XlmgvlaDymTyLed8IKsd9tqtlBIr1n0kk0EoAt
 LSXnck751+H5B5GrUZLAsUL/6OTSZWlenogZf9DSOtZWxGolqDocJooRdAk7/U/swiqwBbpA=
X-Gm-Gg: ASbGncutZjRQx56M8luq3NSuI+qApZF7IxM5qDJuZY8BHLryVZSA3YkDa3hOlHlVqZv
 MlRmDKC1nVrLOWSh29OrjoEYZs8NF3MZWftPYLjWegCph4zOzXQpVYJtreuNfOUsg5RxoN2SEPw
 IMeWnif52EmsnpmsFTw4gignUvZV1a+Sxhcm619NykfT1SbjK73vi3MxT2MZuf2QVS52/kW/Mb1
 LMwCKVx4v69Ea6A5twMhttxeFMVgS9ZBSWt7DuLM4b6xmIfX2UmcIaFJOCrxQGHyAFR1/9UWPdf
 IHRfRdERIvhtO02xJ9mIkqHEndmF1Q0Pir7rBQdJ1xPayjoLhDCUwphCFvi2yAl4Vc3Zu4iY4TZ
 P663fJKEPZLNNISJXhCU4wo4YedGm2MBp8vv+lpBw0eDd3XGVL5uBwCBZb6Vn8vZevi5e0UM9yE
 5PTupExDZ/zYw=
X-Received: by 2002:a05:622a:198e:b0:4c7:e39a:388b with SMTP id
 d75a77b69052e-4e89d357b64mr20224851cf.47.1760645583021; 
 Thu, 16 Oct 2025 13:13:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFNe0OiqXmb/bPK0O4iLCJSWLwLXN9liqFFAIqNAzYgpnDAi5RXwm5Sf4ucmJvR7g081xSpLQ==
X-Received: by 2002:a05:622a:198e:b0:4c7:e39a:388b with SMTP id
 d75a77b69052e-4e89d357b64mr20224331cf.47.1760645582578; 
 Thu, 16 Oct 2025 13:13:02 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5908856381dsm7280357e87.80.2025.10.16.13.13.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Oct 2025 13:13:00 -0700 (PDT)
Date: Thu, 16 Oct 2025 23:12:59 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: david@ixit.cz
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Casey Connolly <casey.connolly@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 phone-devel@vger.kernel.org
Subject: Re: [PATCH v3 5/8] arm64: dts: qcom: sdm845-oneplus: Group panel
 pinctrl
Message-ID: <bspiap2gflponimgt64ulkuyp6sfpzab22bx2v27tdg7m6dynl@c7p7eay3h6r6>
References: <20251016-s6e3fc2x01-v3-0-ce0f3566b903@ixit.cz>
 <20251016-s6e3fc2x01-v3-5-ce0f3566b903@ixit.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251016-s6e3fc2x01-v3-5-ce0f3566b903@ixit.cz>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEzMDA4MyBTYWx0ZWRfX54sxQ3Ij0v9D
 Ai2EMdzvwwt0v8dvDGD+xsX1n8WrhhqQtktacAor3cG/kzChvAT51zNVPeBqdZc7aJuwft5UlqH
 zieFnyATZSnPryxomZ3Rk10VUpgT7epUvoIpUQT2YYpVJC63BSyJRjVgnv3mpQie+XAeApcxNvq
 k0FkFo0jdICfVT/tqOMH1G1x0XoPrRUK50DhJ6ALzEPbbqWCR6XpbSGSkih63kznV7EOUBXKeIP
 j9raYk5+1F6/zVBVo/kUVY01aCF3t8QtuFD1BbqSCnFlDaABCNsJLjjpLlc0spmImEGKXeCgqnA
 su182Nzh80i82LN0Sej6FkhaH1VrCB0EdTPX7JHM04I4/0SS0/qADjbqkLl3SkNFyg1ohfLcUR2
 WR56rxoIMD57yX10JkKFtYTPGj5lfg==
X-Authority-Analysis: v=2.4 cv=Fr4IPmrq c=1 sm=1 tr=0 ts=68f151d0 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=zJdh1BpShusDlwL3NFkA:9 a=CjuIK1q_8ugA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: 1TONj2obVF6mMo6EP-8t22A9vvqXuico
X-Proofpoint-ORIG-GUID: 1TONj2obVF6mMo6EP-8t22A9vvqXuico
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-16_04,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 spamscore=0 phishscore=0 malwarescore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510130083
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

On Thu, Oct 16, 2025 at 06:17:00PM +0200, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> As these pins won't be used outside the group, let's group them.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  .../arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi | 46 +++++++++++-----------
>  1 file changed, 24 insertions(+), 22 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
