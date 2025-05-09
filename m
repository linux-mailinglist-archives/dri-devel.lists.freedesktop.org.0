Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33346AB1394
	for <lists+dri-devel@lfdr.de>; Fri,  9 May 2025 14:38:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A48310EA36;
	Fri,  9 May 2025 12:37:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="YhRNtL3o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABD8910EA36
 for <dri-devel@lists.freedesktop.org>; Fri,  9 May 2025 12:37:57 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5498mVCg012159
 for <dri-devel@lists.freedesktop.org>; Fri, 9 May 2025 12:37:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 YwvPt4t2OCvE2vssyY5oxLacKQywQ7VxFJ+NInkStNc=; b=YhRNtL3oZAzp5W3F
 V3D+oiMMj8Pde3XmMUhdSm/s7MFF6zNsmrAc53Zik9Z0M+8bUI1X/6vu6juDC42r
 9sQI6Nfv/zrFzaT+iNcTWkHBEJSO1S5wTtqE/5IViUs4f2uCFGFO+tDje756za/g
 p9XWTPwwvAhsgIDVvMIa2rhJyv+qjUzHUgaHjjiEwAi4UBscS2TEZ7LTGOEn9Rvq
 MPX4pJBFQ24Jm1pL5VAqc3HScS6xUEYwUeIJ1bzTa/gYJ/YkrANbx3EIFu6AWQA0
 33QAMN12pTWmXhk+dLiEoEMfC8O5YJ0/yHjCK/+eEuoVHOBLwXgTDuYB3GjdXWBG
 NAIuig==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gt52uv0n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 09 May 2025 12:37:52 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4766654b0c3so6268341cf.0
 for <dri-devel@lists.freedesktop.org>; Fri, 09 May 2025 05:37:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746794271; x=1747399071;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YwvPt4t2OCvE2vssyY5oxLacKQywQ7VxFJ+NInkStNc=;
 b=iG4PmDAw3QQtQXx3IeMwt6z+01Dn5wZWUgMd3+7/5aNlVEvkPfcxNasO7R4sFIQzgC
 NjIIi/HERJLvFXyAK2aQZiz84ruBjrryCm57tWrKviwMX+mtbny+/ZKx07DfnoJvFVo3
 bn0pBrPCTNlitP+6HOUCSHkxmTtosE3lbT4Dbu0O2k7dyHCNDY37IH4E4zd4xG7+dHoZ
 0QpOYdz5HFxS9iaj7bMvZ/I6xqBiBOExcjNQXyPAzlJLNW2VxIGyxT4/iXrfYfj7Wtxy
 8LyJ5AKyFTNpjbV22po3ixgd2aDqW5YIk8yisjBjWDbEhvNzKJibfF1iTXhk74k9XdLb
 l8kw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXnBrj2xVzx3B0ahoRTwrRESsehpgQfj0fYpERMnvkJv2CL/Si8wn5AKL8uorUynDCdeTxB24to6kc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YySWpm9whx7ymix7AvWGKflv77sgaEOGd5I0OPqiSLmJIVK1+Ed
 97phV0AMcKeh7EkLpVPk7AMs3l8oiCprmCa/eQAajOc/Jceupq6NkNARh0HS8os6oCTBH2N4jQT
 8NKSoSzuVbYUaQFFqiUmu0UQvY7ZnfMA3/Yufh4Cl/4HSP9tG+uC00Qu84qB2+RBOQYrSxCNvfI
 o=
X-Gm-Gg: ASbGncuIz1NjDtAZNrp+CmQKXsXfHi2Eoay8efwDYKUb2HkslG7CNuG8dEHXg/evrb+
 gBw7pVd7KCLbKFz3qEmqJ4X3oHeQcGyp9by8B1f0/R+EtndrrjpkkYLqHH5kRc9GosGMFPOrZmC
 9pQw1+OGbwBZLyp2S0UyliyGx0ViaXi/kbH//+JOAs0L5sa4aDDjatUs0yqTKZ0HoQJ/AWxBuqT
 jxm8Xg9VBNLPc3jnwQAwsM0ljRnqAU/k0xVhYZQT9RAhi3UJhpdUj1MC6hvsvbAttWcOqWxaBUh
 7d5VZMRPMPOVSjcSGnR2I1Bb9ZfJIIG4QdQG3aGuTUmx2LtqcQF+im4YN/S4ylOLOL4=
X-Received: by 2002:a05:622a:11d3:b0:471:fef5:ee85 with SMTP id
 d75a77b69052e-4945280295cmr14540181cf.15.1746794270869; 
 Fri, 09 May 2025 05:37:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IERHUVO6nQzP3GMy6DlR9CXLC5BNc67GbK1LwQUmC7YI0zwpgmz8DNyH5I+IjBhgY5B1ZLVmg==
X-Received: by 2002:a05:622a:11d3:b0:471:fef5:ee85 with SMTP id
 d75a77b69052e-4945280295cmr14540001cf.15.1746794270552; 
 Fri, 09 May 2025 05:37:50 -0700 (PDT)
Received: from [192.168.65.105] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad2198532d7sm143701966b.170.2025.05.09.05.37.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 May 2025 05:37:49 -0700 (PDT)
Message-ID: <1f6fcbed-c7c4-42c2-814b-3834b08c5977@oss.qualcomm.com>
Date: Fri, 9 May 2025 14:37:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT 07/14] drm/msm/a6xx: Resolve the meaning of UBWC_MODE
To: Connor Abbott <cwabbott0@gmail.com>, Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
References: <20250508-topic-ubwc_central-v1-0-035c4c5cbe50@oss.qualcomm.com>
 <20250508-topic-ubwc_central-v1-7-035c4c5cbe50@oss.qualcomm.com>
 <CACu1E7H9_EkGFkjL1MRU9M-_YFHnPb5v9SxDg6fXm0m-imzC2Q@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CACu1E7H9_EkGFkjL1MRU9M-_YFHnPb5v9SxDg6fXm0m-imzC2Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA5MDEyMyBTYWx0ZWRfX/pFzmSOBDsza
 /GpiCWk80BfmQHE3hnQjCddRJM+qNsU4u/fI4xBtwIfOXzfzey65LlPEBaewut+850oBn7VOH01
 v5uDd/HGeU4Brx4HZuTQsremvDcMLtdaoaX3LRYTd/yNoGSSE49Nt7DLL9335ornFVuGX1PKcDB
 BQi9RgF+Gpdgzwq4uC8dYupmDiEuMWiUh9KBcjVJbOdxFr9RVP9Pg2oTLrp6Smnn4JU/S/4PhPJ
 H1b3aAAv35BaWDWKC7QjpragOQncHM0MuP3tv6AIbfQbLgYFXeuaJHxKBcZXwTTOatwrtl/GzFt
 fVwtOfuNmtslW5DAlBrNmiAPMMOTjk7/NDfzLBuKrJgMSImMO3WclzkIk9n5IyCIfVGUjwaVmob
 l6P5DiJSl1Nq27WpZtFPwaUBLKjXUe3P+TD0T8qrnrLFHBW9s8zTiIj+ux1LlXvAk/J/3jt/
X-Authority-Analysis: v=2.4 cv=LKFmQIW9 c=1 sm=1 tr=0 ts=681df720 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=hjmfpjirZ_eXqKrHEEEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: CkT6aalFDYt2_UBwkfRwZAGOCPNSRpy3
X-Proofpoint-GUID: CkT6aalFDYt2_UBwkfRwZAGOCPNSRpy3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-09_05,2025-05-08_04,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=974 clxscore=1015 lowpriorityscore=0 suspectscore=0
 malwarescore=0 mlxscore=0 bulkscore=0 spamscore=0 phishscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505090123
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

On 5/8/25 8:25 PM, Connor Abbott wrote:
> On Thu, May 8, 2025 at 2:14 PM Konrad Dybcio <konradybcio@kernel.org> wrote:
>>
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> This bit is set iff the UBWC version is 1.0. That notably does not
>> include QCM2290's "no UBWC".
> 
> While this is technically true, AFAIK the only difference between UBWC
> 1.0 and 2.0 is that newer UBWC disables level 1 bank swizzling, which
> is why I originally wrote it this way. There's a bit of redundancy
> between the UBWC version and ubwc_swizzle bit 0.

It turns out to be a hardware matter

Konrad
