Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36970AB7670
	for <lists+dri-devel@lfdr.de>; Wed, 14 May 2025 22:09:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E1D810E707;
	Wed, 14 May 2025 20:09:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="pgCga231";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F51510E701
 for <dri-devel@lists.freedesktop.org>; Wed, 14 May 2025 20:09:42 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54EAuulP015913
 for <dri-devel@lists.freedesktop.org>; Wed, 14 May 2025 20:09:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ErHYKqrjqGwFflDIb089xZj5i/12lc/EqxqpZ5nbz/o=; b=pgCga23114O6VmmT
 itotjnT8ZAnXLMXtS6V+JeP1LinD6vPNywmC6dtAODpwHvmfbc92o7bHjC2PtG2H
 FghtV4lUgZfQCgDYfYXFhwo29/S1KoEQC5TI7ULR1vhA4452EGBZhJO3ca1YJvAC
 gLRDgZT0SX6lbShChAd2a6yr125LDFdWX/HC6zlKb5t3qg2ksvP6A/Og5Z7XZu8G
 ykqjCgbVTtioBZloyWbO9XCZ65N7k4nG8r1+Bk4aZYZ3JveBDC/29vt/V2jEg/Ec
 pgAF8QzG+RxhsRSDlb0hh+ogjUwO8m3N7dd5u96qfKh80zA8ozWPgIvzWGLgVlWF
 nSfZqA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcmv1f5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 14 May 2025 20:09:40 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7c5530c2e01so2661685a.0
 for <dri-devel@lists.freedesktop.org>; Wed, 14 May 2025 13:09:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747253379; x=1747858179;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ErHYKqrjqGwFflDIb089xZj5i/12lc/EqxqpZ5nbz/o=;
 b=xVbvmoWo0AHSJ6rjw10pKXutfArIF1xwH1LcZC08ZYKDo5m7Dd5LEgA679Xw6iEUpx
 P7gk4nUh33w28jPLm/BEvDZErKaQwy6J5U9CsCLxUDA3rXzKmINyo05hNMS7wfbPRTxX
 kswnR77JLpA+L0bSQZ/Q8E9gz+zRk7wNEVRqf2Nqn9R7/x2ZiLqvFjLv/B5JqiUwVRVP
 sYrKZ/qTra36wspCl42JL2fJgPGOf7wL3vWicA0FC2wbRvS7ab0yY2Ke3xJu6GUQiPT3
 R0cmoDxky+XkqaaW7Xi3kW2jbakB86r+vmueIWSv/+ExqQ8S2FGdyX6Adokj81FYp2y2
 lGAg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVzbsEzzpQYYZ13Ur1o9KHG6JS8CHeUmdXljFpaAw3CTpUamwbWp7fXTXLDLE0HOLQQyPPhsHp+HYo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwaCFrTAPP3YxwUc5us9rGOFFqnajR9XK2zWsxYudNvd9sDyGuH
 NYA7Hd/D0QKLvSkmP43okx9Rb0QVdZcreExkHK163lNtbb8ABcPWqWWSsM5zF0bWijj44dwFo9u
 DksRfkZXDRJa0z4IrgbSboBcP/gopeeQoVBsUR9GnGBDXT5JH+11wYS4sjvyQKO+heKE=
X-Gm-Gg: ASbGnct3rVsZ/1WIjVI3anauUoQPj5bTeyecDUUkAAFcLn/HtVdN4iQEdCJY2rX1m+c
 ZR6sYh/76gi5IEyycB8yaRNGtvwsHxXmRegLcNVXq3cOF5OjWVS24vKUNoxFTdMuOcrBH0d6PDW
 iE+kNfkGFyys/125sojHp6hDG2o8oSMV80v/IkmBA/VbYnx7uP5QK6CbbZg3s5yVhSIUt82NlYc
 Pmnh1plbZMb11A0OnS5nxSWnzpJDbRJL8FMwVnA91H/yvQCa4JaR2fMeOx5eDsJ8Yyz/qde+/GO
 qli2IQjRcbH6wJChdOkpR6adw/ED2TJjp25p2W15F141hmxz3SLZYIZ/T9bk5NTpXw==
X-Received: by 2002:a05:620a:800d:b0:7c3:d3a0:578d with SMTP id
 af79cd13be357-7cd28891479mr285547785a.14.1747253379257; 
 Wed, 14 May 2025 13:09:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHwKpgjaIiOI/zTR2/+a7CEi24XetgHuJRRRaRXDCR27dZOWaJhtL6Yv8ouMIjlIoQO3XAK8w==
X-Received: by 2002:a05:620a:800d:b0:7c3:d3a0:578d with SMTP id
 af79cd13be357-7cd28891479mr285546085a.14.1747253378789; 
 Wed, 14 May 2025 13:09:38 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5fdd088798dsm5606403a12.13.2025.05.14.13.09.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 May 2025 13:09:38 -0700 (PDT)
Message-ID: <c8517af1-5fb9-4350-814a-85ce26e5e334@oss.qualcomm.com>
Date: Wed, 14 May 2025 22:09:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT v2 14/15] soc: qcom: ubwc: Add #defines for UBWC
 swizzle bits
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250514-topic-ubwc_central-v2-0-09ecbc0a05ce@oss.qualcomm.com>
 <20250514-topic-ubwc_central-v2-14-09ecbc0a05ce@oss.qualcomm.com>
 <c3txdoumutgk4exshhyi53ef4xziu5bbe3ib67hw4gsvulh4yt@522qphwu3ocx>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <c3txdoumutgk4exshhyi53ef4xziu5bbe3ib67hw4gsvulh4yt@522qphwu3ocx>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: KVKrYOfHsm-tZ5XmUMFBdx6oCwZpz1PZ
X-Authority-Analysis: v=2.4 cv=HZ4UTjE8 c=1 sm=1 tr=0 ts=6824f884 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=HfH8O6Keqri-gfDeQOUA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: KVKrYOfHsm-tZ5XmUMFBdx6oCwZpz1PZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDE4NSBTYWx0ZWRfX02bSPPq/WJDv
 SIf5kh5RmRhn7poJ3Qpm/CjQv0Z2hn5HjYXczC9SlRWcR8DMkb4YVGlneFXesygFiRNyoOAHAKu
 cfydmAjkc4zIN1IWCS1VWvDidsJ8LSmHHxQQW/EPsfiiYlPzcqmEWJe/Db/bb7JN9MSOJOF2vr4
 Moo2WoHtqFO2+6hXyTlSNnT9JkJW7FuM3SW+2FiIvoky9V3Ol35LREgITdLaV3Q/VYJm0uzu+qe
 7hiZNNSqVMsYVSchdN1EHH4ggc5LR4ZEX6x67I+wFvsZMwFuzx5vDFIE0ErRo7GtCe+GomZX4l6
 geb5lg1SYs+ffruVP44AiVWeVTfpJbipET1b/DigUzqDiu8Sh1u6zIEMgoy1EgISgb2JBbaN21X
 l+EYb4ng0PnqV6KiZzBGGtcXrAszfGA3oNMZbVIbE2/sn9ZNs4AcnCRrjqIC58JNFnQ38QgP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_04,2025-05-14_03,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 mlxscore=0 mlxlogscore=893 lowpriorityscore=0 malwarescore=0
 bulkscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505140185
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

On 5/14/25 9:24 PM, Dmitry Baryshkov wrote:
> On Wed, May 14, 2025 at 05:10:34PM +0200, Konrad Dybcio wrote:
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> Make the values a bit more meaningful.
> 
> Not sure if it's more meaningful or not. In the end, we all can read hex
> masks.

0x1d7efc35

magic constants are no bueno

Konrad
