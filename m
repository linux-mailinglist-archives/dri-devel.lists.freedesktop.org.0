Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0B98D3A5F2
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 11:56:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2733A10E3F3;
	Mon, 19 Jan 2026 10:56:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="V3cgXdv/";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VS8qU83V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A76E410E320
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 10:56:17 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60J9kNiD774174
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 10:56:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 vW6ARu7Rpz28zgYCVRFbLifVastvOSHaCxOQC4p7PM0=; b=V3cgXdv/gjAVePZT
 K3E+NRTpWxfO7L5pR505zdQH3NDbceX9EcIOVF7mfXTSujl3y5pTxW3uclrMsQTc
 +gmcLYH1hVhpqEXHeEoSr/5U9CXhR8AdWfdtdhxejh58A/lq+qY/zUOQaVtL8GBh
 Ky4HULGWThz5dbB5WByAOA5HD1SraoixkCixVXc7yFtcxOxfRNiVwHOmSRJU8FNb
 b7hzfVSChf7etGWSquNtNifOoXhABwpSRmKzChDeZJKgf2XNRMpuVJqRFqwZj2Lw
 oHTgMIgNi9AOOem/hRoJ8Btx4FqckSNAawrdeSoi8okKTxi6n4fGWSBDySRhdUCy
 sx9c0w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bsj9a87mx-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 10:56:17 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8c532029e50so149192685a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 02:56:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768820176; x=1769424976;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vW6ARu7Rpz28zgYCVRFbLifVastvOSHaCxOQC4p7PM0=;
 b=VS8qU83VLzWv3M3x0N5Cm+T90PIJQXzyYZM0wm1qoxrW7MWW2AkfnWgesByPb9GkAw
 vn6D5FZPWcrwILEwPOHxvWeHRmsA4WtDMXgEVAzSgHhHTWPR8RgNjDZGGzGspi9xb4qk
 jCHtW4c5xL/XuFhAV5KnGRhe8FputhmZhbO+c11s1hRMxMhsZ8Evs1/O17FzIrDmljHj
 7xn36VFotqHG8+6LuRF3GYTT2UqZrFzfVsVDz81/GtBWqJseeTQbdEppCtZNO4hk1lpL
 zd0VW6/lv5N46UoYEbGteV0nd+xdJKgTAeLEvOYR2QmGJ4Un9rEDNhh4+zqsaCnI+pNK
 Py8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768820176; x=1769424976;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vW6ARu7Rpz28zgYCVRFbLifVastvOSHaCxOQC4p7PM0=;
 b=MGX2GyIh8hFwrU3FjmwOWQAIZ7VDid3w2lqLbyB9QRYmadqngD9m1xOUeZ4i0fJ2NP
 2d23y+j6QDJjdEHzm+M+Dh8rc8oI+afOxHppHWTFvbYOPwPr0xm+5ighAdEMrgpQymgS
 1puWtKTBW4bly22IizXU2/pbsvyL0GVn8HFIpPdJlrTf5Zwny3N68T6+RCibEpBCoH39
 N6c1qodX3aFP2ND64OkWRNBpzuIFpRVotgzm1NZKMgXLSF8JaBw7rM54uqlifNojos5Y
 hX0uC/BvLzKR6NBVul1PWu+2pIuCZVbTL81r3XgniV3n1aNJXL6AJ3jy4V+JM7PmOULW
 hEaQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUCzyAtHwDM4KifWNe2Sy2zbsieZvrCOOmtJKT0ctoSICXjfFJ+uewVb+i+rsmNAg0rEGiZydMMh2U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxEl584qe4jv5IG/GlryluPC7UBb4/Y+PprNAjcTGLq0wPp2N0x
 KBDGAmd00I/5SMWaCnetf6hQI0wiJUE5xBrMAm/cHjL+UP2wgwiMbgLySgYCA1whDWpTA6RKfhR
 09JxrNxRlciro1Mq6IA07agVhfkMH0/98g9MzlfzOrWveTmq2uO+/cr5JRS/rRB+52xiak7g=
X-Gm-Gg: AY/fxX6qxfQ6DePxXAwoLJnCBtECJtSk705mg3KUeXUP2WGDrU7t6c7q5eNjyp+HheW
 P2ElDzv7lWkIImcbaqghS5OpYEFhz5bdF5CdbIdsHxO66oEBuYN9OUJviS701KU9pPV8SmkDfpR
 5HTNcMtUov6zVpYm8URjY3irXNdEz/++QLIASNmS/ZPBoi6iESy4n78YoJ2nFcrjjF7UcUbupd3
 gGSA82HibkOQ0M5P/+Pvp+gXPFV1d+3OZ1kkR/k86KtgxKsLuC2nZqD+jeGcoJ59IutP6votDib
 hwz7pa4Mx1sibAU5ZZo2m5IVW0rQcQKF0gw7e07UcA7SZnf4IbrZkAneDmsoenmNjwDP8lCjjb8
 TxnmMNy+ZYeVd6HCC41X7/BPlpxDAqWGstnnJGI7E1R3MCc3eDXevH3CTyYZjuTK8IaU=
X-Received: by 2002:a05:620a:4084:b0:8b2:e704:55fe with SMTP id
 af79cd13be357-8c6a67c6110mr1142865585a.10.1768820176141; 
 Mon, 19 Jan 2026 02:56:16 -0800 (PST)
X-Received: by 2002:a05:620a:4084:b0:8b2:e704:55fe with SMTP id
 af79cd13be357-8c6a67c6110mr1142863185a.10.1768820175610; 
 Mon, 19 Jan 2026 02:56:15 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8795a18c3fsm1061152466b.58.2026.01.19.02.56.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Jan 2026 02:56:15 -0800 (PST)
Message-ID: <999ad755-91fd-4ba8-a3f8-1cb1673e714e@oss.qualcomm.com>
Date: Mon, 19 Jan 2026 11:56:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] drm/msm/dpu: offset HBB values written to DPU by
 -13
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
 <20260119-msm-ubwc-fixes-v3-2-34aaa672c829@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260119-msm-ubwc-fixes-v3-2-34aaa672c829@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: XiPawCs6-1rwdo8pt29GHn7UQCD9DVu5
X-Authority-Analysis: v=2.4 cv=N40k1m9B c=1 sm=1 tr=0 ts=696e0dd1 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=FnLLt5dnLMIZ3HHg8ZoA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDA5MCBTYWx0ZWRfX0wS6naoywm4i
 2hyj14dtoBsIdWiKARMahDARROnUcOUxmaGQ3BsWW2hHUTJnVvpESkJjXtl2B44A+2HwQpz14ef
 5pKlY85AoeWYuD7jmsb6xIQK8i9eLOf1mspy/7jkPc5CyQ2my8pTwLao6tUGRpG2DTnfojCfMLN
 tFTLuvSG1upmmSfcMGoSzG35CUKQI70ZVqdwP7pOagAwJqyu1d8Z3HQ1jzCCgKY9Dyas4dVCW29
 NG+5Yd6ly9f++rB9BJEP3j1Qv8qX3TluKpbbo7mqDIrn2jMbD4IVhuZr9Kt9p0psvLm9uS16ocj
 oLiDT+L3mzmuP91KGX96/0F8NS31IBYFWMwT69LEkAau6nbfsBF4yi+MFmf+VHJbqrTRWDMD7Jl
 R7B9hhQXL1dAicCFasbH/3oqN70teetj5U8MnZvRPjg8lRNtQ2ZiIwGV4lKtAxo6Jsfay8LeqWd
 CCa0wIUNNBiM9rBQ+tA==
X-Proofpoint-GUID: XiPawCs6-1rwdo8pt29GHn7UQCD9DVu5
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
> As in all other places, the Highest Bank Bit value should be programmed
> into the hardware with the offset of -13.  Correct the value written
> into the register to prevent unpredictable results.
> 
> Fixes: 227d4ce0b09e ("drm/msm: Offset MDSS HBB value by 13")
> Tested-by: Val Packett <val@packett.cool> # x1e80100-dell-latitude-7455
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

