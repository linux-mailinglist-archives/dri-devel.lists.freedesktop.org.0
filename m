Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D2C4AB6FC7
	for <lists+dri-devel@lfdr.de>; Wed, 14 May 2025 17:29:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 179D710E2E3;
	Wed, 14 May 2025 15:29:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="cObmxX+q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 308CB10E675
 for <dri-devel@lists.freedesktop.org>; Wed, 14 May 2025 15:29:22 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54EAug8n020133
 for <dri-devel@lists.freedesktop.org>; Wed, 14 May 2025 15:29:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 nNhh7tTrtVppZOM44aoAsiuIMid4rGaB2UXO4+XqS44=; b=cObmxX+qdKmoqnIf
 /P5Fz2EOvQc307k51BOfKNbJqQRFr8In46r+li2xDOwM++FM8ldWhn2gttYUzXbG
 Ao4tS3BT1G5hW8Xze9wQT0L2k7vxCCeEB/45IdwlWeGRUJCGa0c+OrXtsVAy8QtI
 H+f72fFpWjjqUxhdRIQMQoD/pUD9GczksELu7ZiObXJCHUybDon8DQhi/Pt88KCN
 bM7jwDQp7EqJV7hVFJtLgs5TXgjbVoF07ZsffoX8+/4RbMLkPGz+HuDy/b5K+656
 09vG6Ul71ENjWpFrqWdUnb2KaSzWaOusrzhiGzElUCCrrMeH0QpO8H4Kn7a6qRvf
 erzDSg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcnk5v1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 14 May 2025 15:29:18 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7c5ad42d6bcso189619285a.2
 for <dri-devel@lists.freedesktop.org>; Wed, 14 May 2025 08:29:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747236558; x=1747841358;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nNhh7tTrtVppZOM44aoAsiuIMid4rGaB2UXO4+XqS44=;
 b=qtFnH01pOJBtiYs8fgE+gW9C34jdccXsOCOiPA2G4b8Smi/s1YLtTNA2IcUr14TyVk
 ZukxfBmixMkqTauLJ+R0WPk86usHjjsGOvD6vW/ahK2ulFumv2+TsVXzCsSobesFbYML
 +lRtcGB+IIK1iJywrKkkzD64TC6MdPFlcL/DmJaqlZ7tUS7JbHyDlAqzc7adjA0fdj5/
 nu5QlP3XnPyUWRwtJHhT/wKF+lHZjl3R4U+sR7Rmv8HI16+qcaXuuKrud03eH0dEmqHw
 d2IX/SCiey/+cbvsMtE+2ItS6Bwt4AqYwQNOVquDOP26hsLHJkfVwXhH3i9GAixLai3Z
 R2dw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW/Icpea4aF8WmjVC/RUKLzLhjTIpiE+XQLBNKtfST6g4InZnxDGbv3mFAbn+A3gvG3u/QQU/mV9Wg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzrL7Q+6WbuFwp8bw8WG+2HJE/mkz41f0OvePlGofe8qFUUFgBi
 WMJSOeBiczwfxgW2oIqfe39otN2OXp6bEwCSl7k383HqCvU9MKoLmDn7cFdKPYRJCEpIZ0HMrEa
 FtDqzYEZBmrNLZzNiwxgbS1zApVNEmy3HnzjgY7BjLjx2qaC9OrRsjmvVoc6Uuao08uY=
X-Gm-Gg: ASbGncsu5XUIK+yiMS2BDHi+x4dFX53exy3QAIxlT/vL4zoXxS2Z3FjyEOPpzFZhyaP
 mWz3hlCf1xXqww/X43sdIzwq8YwVjxeE6VyFjaJU62GEoCh9yAQDp5RFjQCNT825LFruxURkVFs
 1pduL+HBL624x0HNls1SYH62LquHRHfUsTzNLsJA5JSqHL4KJOfgi76fs+RTjUXK9YRkJORyWk3
 tbRTB8Vwc1zUkjAHKkdgT3Crel5foxyzMPSRabcZP7mgyy8uKzUUIyO3CdOvFhjdMNpY9M1RMzQ
 3ZPaexoSRzZjM6wU+eac1x1EHsElTNQ8r3sBYmdAaujfiOwAMpSPBNxtv3ySTiv1dw==
X-Received: by 2002:a05:620a:8391:b0:7c5:75ad:5c3a with SMTP id
 af79cd13be357-7cd287fddf3mr234613185a.8.1747236557702; 
 Wed, 14 May 2025 08:29:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IESSnbZfR1OlTiIaVYJwWyGGbrD8XQ6bq4lkNbvhbCIEFOfDySQCqDpAoZMS7HgH50fPKy8fQ==
X-Received: by 2002:a05:620a:8391:b0:7c5:75ad:5c3a with SMTP id
 af79cd13be357-7cd287fddf3mr234610685a.8.1747236557345; 
 Wed, 14 May 2025 08:29:17 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad505564d46sm72730266b.121.2025.05.14.08.29.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 May 2025 08:29:16 -0700 (PDT)
Message-ID: <0e1e112e-e9ff-4d02-9779-6e1bfaea6195@oss.qualcomm.com>
Date: Wed, 14 May 2025 17:29:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT v2 01/15] soc: qcom: Add UBWC config provider
To: Konrad Dybcio <konradybcio@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250514-topic-ubwc_central-v2-0-09ecbc0a05ce@oss.qualcomm.com>
 <20250514-topic-ubwc_central-v2-1-09ecbc0a05ce@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250514-topic-ubwc_central-v2-1-09ecbc0a05ce@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Xyl4_yCuvVtcWvkZgwjhlCXZHcNSxQuv
X-Authority-Analysis: v=2.4 cv=aIbwqa9m c=1 sm=1 tr=0 ts=6824b6ce cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=TDUkdBfym2ZfKPuXuAoA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: Xyl4_yCuvVtcWvkZgwjhlCXZHcNSxQuv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDEzOCBTYWx0ZWRfX6ixnLpvk5tsK
 JIx1qd6WdT3z1qovzN0+inzhLU87wFmVgW0/YBjRuOeEf0vNSRgbZ/Qb+n5L52tVxzTkJL/LivG
 dvO0aZ9GIY9u/ZG86Oyg5hWucb4bBFh7U8JhZzlWWR5TMqL+FPk+ONzGxEvJ3jXis+GZDf2cYW6
 FWg87tZfHvHKiO2nGUDo7u0dQXOQr/D6naGKYICReg8DxfNCWPFz8Y2xO11wG9u9bzwQF++1x7Q
 7eATFXZc+/XakpeRre09yRwZYB4K/o9SEgJm4avRRbGFMC7XhTX6tGdmH0cSULdMcIBQL+KcYa/
 v2IEq+xJQS+wK/H9wmvuMeIIOpL2/oMmis3kLo7zqu4haj9n8G7rp9V8WjEC0s0qbMU7nuAbB2m
 vGYMuE2kVz5CT9LJK4NHG8vs63zTnA3DEbnWNmAC1ATBo6npcr+PleXHmQxjZoXxoA7mT+Qu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_04,2025-05-14_03,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=999 malwarescore=0 bulkscore=0 impostorscore=0
 clxscore=1015 phishscore=0 suspectscore=0 mlxscore=0 spamscore=0
 lowpriorityscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505140138
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

On 5/14/25 5:10 PM, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Add a file that will serve as a single source of truth for UBWC
> configuration data for various multimedia blocks.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---

> +static const struct qcom_ubwc_cfg_data sar2130p_data = {

So I failed to add a user for this below.. 

---
{ .compatible = "qcom,sar2130p", .data = &sar2130p_data },
---

Konrad
