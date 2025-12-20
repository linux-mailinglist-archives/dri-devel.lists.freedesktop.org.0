Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 442B6CD33D2
	for <lists+dri-devel@lfdr.de>; Sat, 20 Dec 2025 17:43:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BFB910E2CB;
	Sat, 20 Dec 2025 16:43:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="X55yvZpo";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VLelqRbh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3885010E2CB
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Dec 2025 16:43:19 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BKBUBEE3412971
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Dec 2025 16:43:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=ohdhdwiC4FFMEEaMOcvAmr6l
 y1HKYTiQl6IXfBOvxWM=; b=X55yvZpozrjBaV6bBMoYJgTxMDqXI5TP7cSzxD7R
 D6rE4dhUmWkwZtbw34m8FtIIqn7p2175nF/J2Hw8NJHiEsY4eqE/UTn7jyEq5QVE
 Ah0LDQQNxK96f2JFOexYtJ7CCoJgNhVwidavYIW2Uz0LkYvC8bqfQeWBsOnlEBjD
 BdmieJ0UvLp26cs1BfvwTpU9YLqTY+lhmn0NPJm8xUGe3qTOwJH8fFQSDHO5k7IS
 SdDzQUo+Cq5RudouZdKHCVXQ/ZY3o53gIMy5ZQysrxz7jAPI6dYCCZBJ1MCCYj8g
 cQ2khI7Ja2g19bMlliYBwpZ1xVe/KesEaXPIYP+z3LZWkQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b5mtqgykg-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Dec 2025 16:43:18 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4eff973c491so64986271cf.1
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Dec 2025 08:43:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766248998; x=1766853798;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ohdhdwiC4FFMEEaMOcvAmr6ly1HKYTiQl6IXfBOvxWM=;
 b=VLelqRbh2n1MwqvLCsMhyUg0bQRwLifkisJN0nCzwsjcS12ox4g3C4OunvHwR/sFSW
 wxiRsAwMjAqqC8P8/h2PNb9JZ5h9hM3D+TuHG+mHhdVYPTN1QJE8Tqa395mtCovnx9mD
 Trmey/AIH1S7dkRbbMVYYr1++u+iP2mOnLDF31K6ib5a+qjWJkN77WYKhTsMA4BUNmjk
 z18BUjNbkfxSdMAKEsyzgpTCkaAbsTbQN1evsTWYRlm4B4bRTcNTiImG8cFfoxi7qUgX
 QsbZe3MbyuAsR52yynx0gs49TYfjlrDv5nKMoA65pHrtNVFY5Qu0UhCUF2tgZgTuKeEB
 0O7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766248998; x=1766853798;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ohdhdwiC4FFMEEaMOcvAmr6ly1HKYTiQl6IXfBOvxWM=;
 b=AZTsVCgmXM+zFScf7qPptq+2GbFhPer0dLlL4bSfiW59O+re1e8JDK8aVNNIToYOgw
 hDjBUWpwPhVeAmtk7NpSHLOWbBS2ta1qgrRRv1QutT6KX7g0XWVf0druADBg8ivfp28H
 dShCIOfyLwo4hDVSQd7H1tT/BkqwkV9jr9u5k28LIC+Gna4LuMMEq2KrHXDaSTiDlsWh
 ApSXhF7bRo0Fkvp5J57soBNu947Vb5HWXrKK1WG3mxf4wmumm0NLY7f9u5xCICdf8LfP
 EF2zgU5pzJvnOA6KY+Xe7DTPObRXzPjodJMCIluns0Bq7dRpsFIqCwVeKHGXtHnLBoKh
 eAIg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVCIKBxWM/G2CelAbIprpGoAL+W9IppYzRjv1GbjV2r3ooTYHxm7SKSdGYpJV2K3M+USAJTeFHRKBE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy7GvFBOKWwexU9wAuxTtQhf2mNtgP7WgqVwI30TkUvcdDKG7Rd
 Pdwmvho3Z7NYR5XhUNpN/N8N4t7IXn3yNpXb7jIrlPfNsHsIQAotxguNjQw7Jxn+MDO3Qpw12ri
 aOgE9r7OJ6c0zekMd3KFvVOKii9HdJ54oZusuq7MJTLT7wr0Xx3cBo3vPxPtu1tt7IPl3QFs=
X-Gm-Gg: AY/fxX7b2q73+WaIQuHVeAcjDjVhH3HliQE3LPto1CkOaU/oGx/RZHsHkno5YIOEyAC
 7XTKeUsxqYDwQmmLODFEhPfXFqJpKB6M6TCsfcCA/rM3YH3L7hnhe6kk8EYP9ljRMRr+9vBBNF7
 7C5JYp4is3saVdoGP3wHvhx5kjyCB36EkZZj0IkMEV4NRltG0OaN/qJbSXuFKQu9g6DM0AxUREG
 Q8nfNcpiehqnBD8NBB8UMenyWKbC21h5D4Nb4WWr+PUpf+wR4Hf8tDSLi5wjJ0A86Xbhr3rQuct
 tANPYWnDUJvwL6BLZCO7LHuAgM6LBv9OlAWgZS1pZao1o473C1vTK2eJrJzgpTDJZEbYBQ828nl
 PWemoxjksBsWNxyeMaLdclDP58V7y9xFRZWT7Vzz4C/90YxpLBNUGDZ64PvIunF1OKg3LvbmSMe
 nq00R5b0Wtqu3p53y8ffpJTAs=
X-Received: by 2002:a05:622a:480c:b0:4ef:c5cf:ec0e with SMTP id
 d75a77b69052e-4f4abdb2eafmr104522481cf.55.1766248997740; 
 Sat, 20 Dec 2025 08:43:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHEeDG8QliabZqhFL6L/XSpUcLdYtvjSEWOrUClzCVnxv/MT1Uc5hNOfXtSD9CVyj8/GL/WqQ==
X-Received: by 2002:a05:622a:480c:b0:4ef:c5cf:ec0e with SMTP id
 d75a77b69052e-4f4abdb2eafmr104522171cf.55.1766248997321; 
 Sat, 20 Dec 2025 08:43:17 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-38122501032sm12106451fa.14.2025.12.20.08.43.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Dec 2025 08:43:16 -0800 (PST)
Date: Sat, 20 Dec 2025 18:43:14 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH RFC 1/6] soc: qcom: ubwc: Add config for Milos
Message-ID: <i2nbit2dqu4ajefx44ky5aijqhieflocnkilbvo46vdq3ywd22@kpyomui5i3mx>
References: <20251219-milos-mdss-v1-0-4537a916bdf9@fairphone.com>
 <20251219-milos-mdss-v1-1-4537a916bdf9@fairphone.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251219-milos-mdss-v1-1-4537a916bdf9@fairphone.com>
X-Proofpoint-GUID: RyX35Bj1HDVJnRy6I1B14VLxdpOyhNK-
X-Authority-Analysis: v=2.4 cv=dPWrWeZb c=1 sm=1 tr=0 ts=6946d226 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=KB0s8L93-oSB63ZrkccA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: RyX35Bj1HDVJnRy6I1B14VLxdpOyhNK-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIwMDE0NSBTYWx0ZWRfX1I4BEwMtnkFk
 fLJ+7k5FP+iP1KEaUoX14aRPnH/WKejoUY06NNSql5yJ8KcC60dDXl7YUuV8euDKg+trwN+yj/C
 ZF2ZxaGyjepSnBtXzP42CDymK7ufoNNAP88vn1vKFHXL8eKEt+boLxaHrosODGnJYw3LadyhVwZ
 wmdYhpWgIj5Xp/BO4BBSb+oNMD1Oqwr4PZfzU7JdfS/73CaDd5xq7oVWGCGJY/nwK/VH1AZMUzU
 vx5Hj4G1SDzuTAR6Z31M0GzLyDYDYyddcbLorUfutpxrDAUlNaVcut7TBAAXH2Ckzs6MlAhxMwc
 PFqmcwQnrvRE2ZgFmxg0DnNBD7OOW9WZjcRLgN/aZi7RV6t8DLN+O7+upGWRu91Gsug4cWfCWPh
 BGY+Wp8cHcxsZaDIgQLbp0PmlogeXpgRTVtAbctBnQFCp8hOruNTs1NikqWSt0tN5fcUzw7ZTqU
 p6rkPtYFTL5x5TKo1iQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-20_03,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512200145
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

On Fri, Dec 19, 2025 at 05:41:07PM +0100, Luca Weiss wrote:
> Describe the Universal Bandwidth Compression (UBWC) configuration
> for the Milos SoC.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  drivers/soc/qcom/ubwc_config.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
