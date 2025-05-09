Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DBC2AB1B41
	for <lists+dri-devel@lfdr.de>; Fri,  9 May 2025 19:06:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 345CB10EABF;
	Fri,  9 May 2025 17:05:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="fa8OpSNk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4186C10E2D8
 for <dri-devel@lists.freedesktop.org>; Fri,  9 May 2025 17:05:55 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 549Bfucb031489
 for <dri-devel@lists.freedesktop.org>; Fri, 9 May 2025 17:05:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 bYZFtTpQ2K5+1pV5SB83yilhOw8IrH8U9j0WoHmd6qg=; b=fa8OpSNk2ZXlXsKe
 XASyk+9t77O0nPWWfpPX3oIH7QD4tWzx26SShdjm5jDHdirNDGKgzJqmfEr3Isiy
 Vo87v3AxkR2wmD1BbYTEuiktxnDvYUgWXgBRV1PwvKAQPyxHm4hypCLiVYqkHJb6
 fQnt/jEAwyp4+RFheRMt1ILP/TMGXv3MADpwe+pPYtmMpmBHc0pzNmu4S7FkZeiY
 vv971hbuON/33iCIixZ4nFFrfomtPm8nHtfYdP+hftVFWELlHR4d9H2knvSCF3zb
 akgC3CkRgqn49bAEh2RRmujymXT3k1iHaDrLR6eMyOCBxFCSxL1WaG9JFGMjrXP6
 fy61Mg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnpgn9bf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 09 May 2025 17:05:53 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7c5841ae28eso53914585a.1
 for <dri-devel@lists.freedesktop.org>; Fri, 09 May 2025 10:05:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746810353; x=1747415153;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bYZFtTpQ2K5+1pV5SB83yilhOw8IrH8U9j0WoHmd6qg=;
 b=kqgF/n3X405R91tCq6rpsC2ROB+hlJawa0X49yA5ahWjcMyX28q23cZkt7Va69lyIg
 1vnokyxcZJ8HX7ipL/JqJNhAuDM6Wm724Z58/u1TEgoCY5VjgNIRObhgpLbQtjOSY9r1
 OkLJ1XrTRbtGo04Zqg3K867EnLuOWCY4LHclnYk43s77AFaM3Ac5FLu59e9+VQa0pcYs
 dGguElKO2JwOs/Bm+S+ocgWmRnGVzldEdIkgOX8eyvIWguwpRwvt0Yzk93K9UgiWLwmg
 PlsGmU/PxVEtQREDy6RGH3uLI1YD9/jTeX/hJfNNTPuHi0zWd7IHmCVptecO82Qkswk7
 WeDA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVB5OWtt88jcZRDcGbnM0Wv6xVovmPiw7VjKcPUwIVVj5rsLpct7uhg5Aa/NuwtHEQMI0nyUUDUkzU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyzsovrVjT2wwYeJknN4qQ6hI2Y3XFZ4Z3uzAvC6VULrQAuFEqR
 yAvV80tIadRCeAe2N1ZMROEGCT9uqpsYxt4p5IYThVGVtJw3c5B3YLAwwX/SspnKPAWNh9/wTk7
 4wP06yAfkNwoJUNJGB91KVDAgeN3Rew7BLFIjHZ2/1zMAUwewGGb7+eAKOdEwLp7NKRE=
X-Gm-Gg: ASbGncvapVYsytzKPTZMPiwkeWnfgWhWs9vUA43aXh7YczTj968YEfpUN/ATOjHxfyM
 LlCjFgiKrZzPYOL+dI0Fm1wUcsIMGDD5U6i/CY75r/y31IFiXGlu9Yii22enwVgHd83+/IeCTW4
 0Ef9x/b6+r5NsGryU33dGc8hkIt5D2/j79wToHHfTZzmSPHy3ecq+vdUbJnxklsAqquyGCK2xiP
 8VpqF9+jwHZm2Vghr2lvSJnwgYUkWF0bh5tfFPtzQLayqZ8uH1XW+r1UbI41nJ/bL2IAbBXbymU
 4x3hGFVSaBh0HVkoqU+XUm+2wea1xCqXJ547TszGvELOW6EfGG0vgs6vBtIfRjgvgKs=
X-Received: by 2002:a05:620a:318e:b0:7c0:9dc9:754b with SMTP id
 af79cd13be357-7cd01138c43mr237840485a.0.1746810352557; 
 Fri, 09 May 2025 10:05:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFbRp4cqQeIx22c94yzN7HcBSLTFgM40PIl1UVIm+gxSUeSDFOZOAzyxFmgxbh2fxCrwm5SDQ==
X-Received: by 2002:a05:620a:318e:b0:7c0:9dc9:754b with SMTP id
 af79cd13be357-7cd01138c43mr237836785a.0.1746810351945; 
 Fri, 09 May 2025 10:05:51 -0700 (PDT)
Received: from [192.168.65.105] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad2192c8ac2sm176736566b.27.2025.05.09.10.05.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 May 2025 10:05:50 -0700 (PDT)
Message-ID: <249fa3ea-4b0d-475d-8851-5a31795f3b11@oss.qualcomm.com>
Date: Fri, 9 May 2025 19:05:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/7] drm/msm/a6xx: Increase HFI response timeout
To: Akhil P Oommen <quic_akhilpo@quicinc.com>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Maya Matuszczyk <maccraft123mc@gmail.com>,
 Anthony Ruhier <aruhier@mailbox.org>, Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org
References: <20250503-gpu-acd-v6-0-ab1b52866c64@quicinc.com>
 <20250503-gpu-acd-v6-2-ab1b52866c64@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250503-gpu-acd-v6-2-ab1b52866c64@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Ao/u3P9P c=1 sm=1 tr=0 ts=681e35f1 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=pGLkceISAAAA:8 a=b3CbU_ItAAAA:8
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=qaMJGrL2tkxVvb42h3kA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=Rv2g8BkzVjQTVhhssdqe:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA5MDE2OSBTYWx0ZWRfX9L7suGogkUCw
 RZk3Twxy/2AqR6isvqIy8YM/NzUUNvg8FrbJ1s2abND8gpdI40XB1OBPq4w6l1TV6+W9l4vKAE+
 hsLNlYkH0soqKpHkvPpbHSIoPt/eaBaf4UvV0u/p7xKh4PKSYGm+dWAQMCD6C6LoTe1a+C4xdyt
 IhAkACYadr2GZFDYFQaE5ns0gWQFsZtaXMVtcR/IuLSXVSYvpWW4i4jX/vAM3G8F5cIUZz44WgE
 fCrCjl+GR8TnYRxe5rLBJ6jN4w7x6ipYUJ8IVegX+HUnnGhlvNw5nIi7j1XNsCiUgTtZaEpJERW
 AdPXkKdxgvR5QEb07D0B28UPhbfku4KxniXzcGOD6F0fr7ogVsBOdEfeSLro8rnwIaE7KbXpF8j
 qj+g7AtJaS5Kb9dcAB6+GtYg12eJOo3Rh5PGHQ2xoaFZcU6ft6pU2+RumUVXevmMMODM6zhi
X-Proofpoint-GUID: xgBWLCNNarmxA3veWisXuEliqtxdUbHm
X-Proofpoint-ORIG-GUID: xgBWLCNNarmxA3veWisXuEliqtxdUbHm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-09_06,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 mlxscore=0 mlxlogscore=999 bulkscore=0 priorityscore=1501
 spamscore=0 impostorscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 clxscore=1015 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505090169
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

On 5/3/25 9:03 AM, Akhil P Oommen wrote:
> When ACD feature is enabled, it triggers some internal calibrations
> which result in a pretty long delay during the first HFI perf vote.
> So, increase the HFI response timeout to match the downstream driver.
> 
> Tested-by: Maya Matuszczyk <maccraft123mc@gmail.com>
> Tested-by: Anthony Ruhier <aruhier@mailbox.org>
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
