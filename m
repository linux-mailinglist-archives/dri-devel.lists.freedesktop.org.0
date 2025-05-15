Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DBC6AB8B80
	for <lists+dri-devel@lfdr.de>; Thu, 15 May 2025 17:52:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C27B110E905;
	Thu, 15 May 2025 15:52:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Lrxfj1VC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D9EE10E8FF
 for <dri-devel@lists.freedesktop.org>; Thu, 15 May 2025 15:52:38 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54FEFNYk009289
 for <dri-devel@lists.freedesktop.org>; Thu, 15 May 2025 15:52:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 PWMmFCrAfuYggrwFp3r2207gsXdzwcTP1brIqToPnVo=; b=Lrxfj1VCnnKJH6aB
 LQGvZdV0KHsUgasZWpTn7gqQwlr2iEZ2lQ6Wn3SKdE2Ffmnf0t3voK4DOXDjzbmW
 /G4EcgS6MYXs9xZWLY+Uu+SBzNgolAILHYuO2F9QkH0ZUYxP2PP77ZiLgy6wbrpl
 2DzLo7aWfWIuFnJoD5eUXUQUhTq9x1rN6gmrVBeoovEqLV5elpQmp2PpE20eWru0
 xgE/ItC1QDhn4MvwMlFeMDSMQR/w+4dzXaW7tYT+Kb97dkznYYnnDvgEYsY0YnzQ
 PyFjYiT2SJE/2lbo0HbOUWODfIw3SXofdDDYwRIJ2hgGMKLFefCyvekAIJiQgHHj
 4DEV/A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbex6qd8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 15 May 2025 15:52:37 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7c5530c2e01so19435785a.0
 for <dri-devel@lists.freedesktop.org>; Thu, 15 May 2025 08:52:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747324356; x=1747929156;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PWMmFCrAfuYggrwFp3r2207gsXdzwcTP1brIqToPnVo=;
 b=xTgplIHtoTucRwcxB2yc51ma7D9z70AGr4OhS4/f8GD2LiGT21ddegR2Ist7uMIudt
 aWsSjzPKIhQ405mWZkczUatgmuh7s19y4KJ+aOtWmGjvP3Q8xqToBgUzRya34gUamuTH
 rOSTRHKikA1ypeybV/GZUvhU3E7y/1dpoQTlJpG9Tvl0tsxA8s7/8a0PHzqla9NmE7Qe
 Jh2nnpCXnVY8udKx+8oj3KVNLGWjofhkSRSswjOAbaf3zypWfIfhmlxTEoQvFJpaPPNC
 IW8iv7ZgcUK0u17ojoKKboGqqDu7Nun3+kQKxmcQPsQN680gxkv1VLlmwhBRHSit1mkI
 xL/g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUNrwbGRS6DI8OobZ5o2wmQYHvb8nKp9gd8LzF7md5z/eXvOUY+XMlVo9ddhY466Sdh+jpfxn5x21Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwTD6he56Rq0eyYC+ML875CfRfNkGXgOZEwzcdby08ZQgXDovs/
 foSam8FeViAk2DUV9GyzombZJ0CYt6eYO8/V1rH1V88h3txZIFjM3YVCFPA9hpEsciWveWdGr+5
 d+EayayL9AJwh6Fj78sgUq3gAn8veUOqiqbaC84s7NXElSFFYPfc20PBzGRYj2cDmyaqhWmM=
X-Gm-Gg: ASbGnctFa4Vpbcyp9lAF80hybstO91Is+dtMRr2LEAgKKofNmSJkYbUa1pUqTWbJMBw
 ynK0ZfSLRennDcIR+ZuOTueEmeHopXN2PxnzdtolIcsRwWZpNQCDKEFgQo7FHf5rCgwJwGa/MEx
 DBsYn+LNe4o+IH0jWAzjo2ddsLZtdJp6oQjutGlwW9t3ehPnN1ZK2U1jCS0PJlM787mqBiY6FHd
 /V+TAeBd+7B+Kce7A0T9kpNM+8ylDKk/t7j5BZHiafnjRcu705bUZo/EOyDBWCXJMUMddYmKekj
 hJumNn2a/iqGPRuN9QNnBnGQIC64pRgyXr++ANDxDezxQsbFQS3nwMoVn1Pme2VDaA==
X-Received: by 2002:a05:620a:26a9:b0:7c0:bb63:5375 with SMTP id
 af79cd13be357-7cd4673b3f0mr1353785a.4.1747324356124; 
 Thu, 15 May 2025 08:52:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHrFV/2EQXmPxJircJAV7XiXDHBdvEj6UPYt6UTWF/ixiBBQlETA2RLAhwfWdEO68zo3VBYbQ==
X-Received: by 2002:a05:620a:26a9:b0:7c0:bb63:5375 with SMTP id
 af79cd13be357-7cd4673b3f0mr1351285a.4.1747324355750; 
 Thu, 15 May 2025 08:52:35 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6005a6e637dsm27454a12.43.2025.05.15.08.52.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 May 2025 08:52:35 -0700 (PDT)
Message-ID: <a068ae00-fca0-4c53-9b59-a855caca12a9@oss.qualcomm.com>
Date: Thu, 15 May 2025 17:52:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT v2 12/15] drm/msm/a6xx: Drop cfg->ubwc_swizzle override
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
 <20250514-topic-ubwc_central-v2-12-09ecbc0a05ce@oss.qualcomm.com>
 <3uflij5hthurgt67rdnfhqtcoconybsnykirrwnk7idtz6672n@26qdq2e2ehtz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <3uflij5hthurgt67rdnfhqtcoconybsnykirrwnk7idtz6672n@26qdq2e2ehtz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE1MDE1OCBTYWx0ZWRfX7x8WlBR7kAxZ
 hHn9hoDMNH3+drQaTgDoFlvGgFU5IhCeqbBd3zw9CjmwF3VM2Z7fbBwKvg9S0XUJkjV7Yl60DXq
 m0bIjhtD7qrUK9/D5vFoJoxjnms8vOAGuNJUPwIiPHNX/0l1n9NntlwqY7JybpkrP0UHf1/tfFt
 dWh/VLKv6viDsDND+ly8yvTdEBgLitcEFg5MP/XAy9PZLvDXMPM94nrFv/wPhlQRgVadeJT2hqw
 7Xhy5IFhtuArHNdgNQlnR4pE+wBBjKTQ9ksmughuJ0ntMu5CcRvCh2HzBXePBRnVQY+L7gFP0dq
 0MR31XuxjEwChsu/a8YpxnqQXUPSdhczNGRnMqrKO1ErJMeLSVaVEBWBK7eUJbPcyNb/ZP0t/mO
 GwfarcotW/r6ouUZcPpUlB7k+0bVBzS2sdTQXeCXFz0yCiAM0clRgjThrJqzpWhjmgqJFPPZ
X-Proofpoint-ORIG-GUID: pxQSUsj_Ig4NXwrozNiAP2eGloHk1a1o
X-Proofpoint-GUID: pxQSUsj_Ig4NXwrozNiAP2eGloHk1a1o
X-Authority-Analysis: v=2.4 cv=IcuHWXqa c=1 sm=1 tr=0 ts=68260dc5 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=jslb4AC7pnrZMK7c9NUA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-15_07,2025-05-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxscore=0 adultscore=0 mlxlogscore=810 bulkscore=0
 clxscore=1015 spamscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505150158
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

On 5/14/25 10:32 PM, Dmitry Baryshkov wrote:
> On Wed, May 14, 2025 at 05:10:32PM +0200, Konrad Dybcio wrote:
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> On A663 (SA8775P) the value matches exactly.
>>
>> On A610, the value matches on SM6115, but is different on SM6125. That
>> turns out not to be a problem, as the bits that differ aren't even
>> interpreted.
> 
> We also don't set swizzle for a lot of UBWC 1.0 targets (as MDSS wasn't
> programming those). Should we fix all of them to use 6 by default? Or 7?

I don't think any default value is a good idea - this is the sort of
programming error you track down 4 years after you go bald looking
for it

Konrad
