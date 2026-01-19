Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CA09D3A605
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 11:57:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3FCE10E3F5;
	Mon, 19 Jan 2026 10:57:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ocbvuMh8";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UI+oKton";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49E7310E3F7
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 10:57:47 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60J9kcjx774877
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 10:57:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Iv3wCPCz7Y6lP/++ZHQPzus2wUGQzWlRuMJIcNIAEfA=; b=ocbvuMh89UuSLKWV
 3fKD4orKNFo2fAlosJkH6YQOzLzidy2Ii9h0wFG5HT/sva+fsDNJ9hdZhyXlxbsu
 sYtfgmTT0npk/GREExUf6nsbM9/LzGFP+YVW8+Q+1XFYau2oRjbrgG8wkDIpuYW7
 5eQJ9c3n7hEFaHRDtPddoAXjLBAK8IwSpnbkn3vQxh2VJ/Z2MRVSwEHu9R6o5Rb6
 mHWsEvoUCtp7JtlEZ5ibqqb1qM8EJ2rh9ZROJthZqt+uuGekiJOGQGuN8MgbA80B
 qpg/fqJlZ3bhygUzz5T+zOn7POqc6HSka0qkx1/v+3MdfWERlxvp7nhYij39CMjT
 gAs77A==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bsj9a87u0-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 10:57:46 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-88fd7ddba3fso18907026d6.1
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 02:57:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768820266; x=1769425066;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Iv3wCPCz7Y6lP/++ZHQPzus2wUGQzWlRuMJIcNIAEfA=;
 b=UI+oKtoniHR6VtKqOGPfH9TdbA2PtrfVMslSaoon7bhmG10AUExx7jgISw24eHTwQj
 i9wvVPIIMFnyb5PExa8BbHXcDe5J6jDgU+3XLePpNbrsnWT5jIS9X02GHQF+gOSq9t5b
 YBFh25UvbdAkRoCgETOjJbr8vcaLxUcRMBVFiu4Swe16tvkZ4jheR8UeKR9SzaND9bgJ
 E+JFoTJX6FrK3qmlVVyGeShppTwL3C9wDpIm1o5tcoZhrbNT62wWjmluwtxlxd3pXTaH
 B4KTHxZd2xj4Ygj0Lv/ngKz6uicN5JB732ouxgt56WwZalqm2hC1bFPchWK3Z9Jl5/gH
 d9Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768820266; x=1769425066;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Iv3wCPCz7Y6lP/++ZHQPzus2wUGQzWlRuMJIcNIAEfA=;
 b=AxziNHw2WEw16n9zwF1gkhRGc948BbEnYA7ThD/mHanotYakzOsCGQakDp2sZeMZjG
 ELeM8R1n/rtPTBJFKnKpihh3X3I/M2lgrRUy65GUThQtZroKE3lVhsw64DHhhQnisy68
 qKfTY6N7Yg55FUSF5a+0NcIAJfEyGhRhB+TBMOpqTejZxOn8VPGGibRbMVV3X7xaEGTx
 HyUv4tbhbel+sc/jCWMJzKs/NwKuz5ZQ8BSWl+atijGEwYgcvr/DZp9PMKLE4IFgh2JM
 dDfVIpBmUbyjfbka1OzIIG505IUHHQXa9YeNO+y6G5TCHU4HktQWLGfp1sdujPGAC3Nh
 h0/w==
X-Forwarded-Encrypted: i=1;
 AJvYcCX+/zhUQd+7AwREY6Z1Mr4lPMjvGtIthHL4KWNrzUcZ80Rj72hrV4qysVB1hDhoCa2cuZACfqdbqBA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyPCA9tt0SF4b1ME8Y0ObvwGplTLp9Q2TdGDpbpcXq3IqHitvwt
 J5vcUp6Bzm0j/KFeMwJsDPLt7ZsRlP4mWabJ/uPEIGG490j26CdN2Gkf4Z9EdnfL/f6U8aF4PP6
 oNItrOVfN85x5aap7XvlYoZ2en43s04nXENxGWu6jJ5wkec86Qdv8YqXPzUbwP1KRBxRJiSk=
X-Gm-Gg: AY/fxX4foEPIQPh9PyphOlDnret0TjrvwIfwB1HKloq7rPasA6t84jmlIlPXNI28fMw
 FSnpX6vMDTaZLCfRfv8SsNilJcBXC7hvVnwEUg1JE54li5rmC4NA9zHCiMiyLoMSpGNLozDXobD
 bYg+CcQgVZLJJASJkV6PPlhO8iOP/XGa5kJcmINWGT6UKEd+MphUVJ3hSnPZWiQjA261N0twsFg
 00ySBThC5F5A3UD0qTnN0/2XkGIGomVLFlYrXzz1+zIKjk7SaGNCpU7o4j2Znvn2zlzVY76IuLG
 dWOR3Dm62uwn7ZZIxl5INCUL2iOgnmPOlfmFk9K/YZ0R944/+o5vk3B48hAPHq7yj6t9Um/bMfy
 P1M7oQrWsTH+1Xwp6s+qt9qZmCtJii/2hYfp90D9R3qIohOGVdBtupo1zGe+wmtNzQ+o=
X-Received: by 2002:a05:620a:288c:b0:8c5:3892:a554 with SMTP id
 af79cd13be357-8c6a6705accmr1215768785a.3.1768820265753; 
 Mon, 19 Jan 2026 02:57:45 -0800 (PST)
X-Received: by 2002:a05:620a:288c:b0:8c5:3892:a554 with SMTP id
 af79cd13be357-8c6a6705accmr1215765885a.3.1768820265337; 
 Mon, 19 Jan 2026 02:57:45 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b879513e8d1sm1102898466b.2.2026.01.19.02.57.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Jan 2026 02:57:44 -0800 (PST)
Message-ID: <16e02476-0c26-4ca4-8080-c494a89e58a1@oss.qualcomm.com>
Date: Mon, 19 Jan 2026 11:57:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] drm/msm/dpu: program correct register for UBWC
 config on DPU 8.x+
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Konrad Dybcio <konradybcio@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Val Packett <val@packett.cool>
References: <20260119-msm-ubwc-fixes-v3-0-34aaa672c829@oss.qualcomm.com>
 <20260119-msm-ubwc-fixes-v3-3-34aaa672c829@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260119-msm-ubwc-fixes-v3-3-34aaa672c829@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: hZ2Y1pmLXBXboZ9xE0vhm-zPf-vtRfvO
X-Authority-Analysis: v=2.4 cv=N40k1m9B c=1 sm=1 tr=0 ts=696e0e2a cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=X1d9jF6ZyTQ8TVP8WxQA:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDA5MCBTYWx0ZWRfX9adl/mOGQD5o
 TrXAqbdWrSG3BsJ1Ku4Mmm34iv9XydBCcGwAeozQivXNHjDN2Ce70eksyYPaXIkDMwFBmn5oB43
 iJOGpvsyt+oD1vfnQrbGh3Loev8gwl6Ma1WTuIaC/h1uDoPDGvEZlqcfnnlhWYiQJhgPTGt2tmZ
 3dgPlofPc0NuTh83CwGszwbSbSTaKOjxk+4lUjZb9QYvQcCxFkwe/VG+CjrYXNvna4MkJwkfmWk
 wPErOewNzqigT+FxjQwcTbHcNHZptfnFPeiatMntgOHr9KIF/87DHlkX7tefOv3PJd3qI0bwsWq
 ZfkP5hvUjfsgZ4FL1xo2B09fKlbl+WH8iqwbinme+7WcPeMIlB+rpfFW4eZHZa9hMTIix7koE4M
 TKcxWme26MeI2KrSAAfI1W9OpIJ71YGuK8r6V/OvDcVR3eSY2iV4rGwxHjR2vrNULDUtu/dnfE4
 dg4uPjLZO2UiRYA9RZw==
X-Proofpoint-GUID: hZ2Y1pmLXBXboZ9xE0vhm-zPf-vtRfvO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_02,2026-01-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601190090
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

On 1/19/26 9:17 AM, Dmitry Baryshkov wrote:
> Since DPU 8.0 there is a separate register for the second rectangle,
> which needs to be programmed with the UBWC config if multirect is being
> used. Write pipe's UBWC configuration to the correct register.
> 
> Fixes: 100d7ef6995d ("drm/msm/dpu: add support for SM8450")
> Tested-by: Val Packett <val@packett.cool> # x1e80100-dell-latitude-7455
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

