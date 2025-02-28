Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 654F5A49ACD
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 14:43:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA0BD10ECA7;
	Fri, 28 Feb 2025 13:43:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Jc8yrn4g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B789110ECA4
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 13:43:21 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51SAXGgs010964
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 13:43:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 X8ScGz40JRccpFkf1d+tHM1VpGzuLrp85WFCzzDHaHs=; b=Jc8yrn4g7Mrf1wB6
 ErFhcikirR7ykGAIThDbwgB8j9wqXUUNSukiiucnpQsFWtEguATofNQ490ZWNvak
 w9GpIMhD+dMP2jVXGitR5Ej8uPcOPjZ5kUkcGo46LO0d0Ht5oHSsIEB/3AJDnPER
 CijrCykE0kbtRWWCSysuMMFBgUJGhmT0EvbMXeOlACbh7ElRSiqp5m2uSnKqHVZ6
 eg33pswtF7QyOUVEJUsfVrchYSFT1ve8K8USh+2SuQKWLreD5GG3VpW5IdFWjRn7
 uxzO5wTvPRhZ+a4JgvCny9JcJzSD7JBHp/g+NdRfs2WPA+1SYfW/291OUnFhhmHb
 K6HvbQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 451prk9hkb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 13:43:20 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-6e89b5746d0so3637676d6.1
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 05:43:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740750200; x=1741355000;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=X8ScGz40JRccpFkf1d+tHM1VpGzuLrp85WFCzzDHaHs=;
 b=pYaWTUIYf2WoHGBCNWVAFYgINuH5QBXm5uU30+yhxLuxIAJqxkS6oYUGr7FugvURFE
 rIGsGkwXynsO23DmFTTCd/eVXBdykFSfx23ZjREb9QTtwx1ZVxKvOjpGc9yLWSBn3uJ3
 1B+dBLuJS5C973ldvpmrNiL8GCEYvy2e6VV5ucDCTMZw2eVbvnqSi9mh/mT+AcVC+8B6
 ypTwDGzRKMlCWd3Rp10IHfY9KaC3Ng+3ZUV+lVTZ6AILDF+v6YMSRj5gpR8tD28gl6tk
 JkrbSKEadralvTsPV3UjaTbnY/wZJRFPOHChBLZs1iwk9A+Z//vp1qvWl07RsKRNtO12
 pnYQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWED5dpDSdEgY+AVoxSXWI7BDukaSS4UbJMqFul+3KOp2xO18kYmv9OPzaDuGAAiW4HXWoR6RD6PS8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzIXoQtaleaVplZmYfrVaBT8FMzXXBpTDlsb5vWb2etkVrbg4LR
 bmjliwUO5J2DlLuWr3A92dZfD7I9iK9CciPH2nd1xEQV1RTY5gVULYqG8DcnaxnxcrkJrR8SB0o
 IxCQirFZQz2Z8MK10WouyEWPXfsLunXNtCkyrcs7ahCF3U6nDINYkxpGwRDZHDSUFSEs=
X-Gm-Gg: ASbGncuXuWvVvyyShMIvGu10v5Jiygi5RtkVYaI48YwHlknK/4zj42lijpeCyz1EEVd
 ho5d3i5NjCufRcwoA6Fn8cs1CKW/UHEFgbwbH3SktesIyxfgClDxrELKYGw0WyIl8eqpJ/iKw4E
 voM4mz1SvGBGQpvZaYkq2FmnbyO8s7Yp6W1rnkfcD149CbBDALnDJn5vLLh+nc2zOKvmd5FI4Pj
 N23UOKULnJPrcZcFrtUtXWdsPH5tPR2Uo7sXLZaUqdRNTvC/WCFwCZ3qVPWQ1x3mfRZsi9VN9hq
 ccwnyXC6I0BfR1jaVISDxqKtIFHG1H6PNzE92Mufx383kcqcgEDp08axoMZimAuVLQbwrw==
X-Received: by 2002:ad4:5f87:0:b0:6e4:29f8:1e9e with SMTP id
 6a1803df08f44-6e8a0acb028mr19315476d6.0.1740750200110; 
 Fri, 28 Feb 2025 05:43:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE2BhTFPrGcsBUD3d+js2LSjbjIbSoqrswvT4KyTm/vYvLllJTBt7l/wIo7yhlMbwFAi0+lCQ==
X-Received: by 2002:ad4:5f87:0:b0:6e4:29f8:1e9e with SMTP id
 6a1803df08f44-6e8a0acb028mr19315376d6.0.1740750199768; 
 Fri, 28 Feb 2025 05:43:19 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abf0c0bab1bsm289935166b.28.2025.02.28.05.43.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Feb 2025 05:43:19 -0800 (PST)
Message-ID: <98a9bedb-cdf9-4865-a089-85a2f411bbd9@oss.qualcomm.com>
Date: Fri, 28 Feb 2025 14:43:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] drm/msm/dpu: remove DSC feature bit for PINGPONG on
 MSM8917
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250228-dpu-fix-catalog-v1-0-b05d22fbc2b4@linaro.org>
 <20250228-dpu-fix-catalog-v1-2-b05d22fbc2b4@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250228-dpu-fix-catalog-v1-2-b05d22fbc2b4@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ZRPx23mzqPioDOgJfU6xJoIsjlR3AsYo
X-Proofpoint-ORIG-GUID: ZRPx23mzqPioDOgJfU6xJoIsjlR3AsYo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-28_03,2025-02-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 phishscore=0 spamscore=0 mlxscore=0 mlxlogscore=999 malwarescore=0
 adultscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502280100
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

On 28.02.2025 3:40 AM, Dmitry Baryshkov wrote:
> The MSM8937 platform doesn't have DSC blocks nor does have it DSC
> registers in the PINGPONG block. Drop the DPU_PINGPONG_DSC feature bit
> from the PINGPONG's feature mask and, as it is the only remaining bit,
> drop the .features assignment completely.
> 
> Fixes: 62af6e1cb596 ("drm/msm/dpu: Add support for MSM8917")
> Reported-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

With the commit message fixed:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
