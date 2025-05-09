Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4EF8AB1951
	for <lists+dri-devel@lfdr.de>; Fri,  9 May 2025 17:52:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BF0610EAAA;
	Fri,  9 May 2025 15:52:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="RtiMTzwy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AB5F10EA85
 for <dri-devel@lists.freedesktop.org>; Fri,  9 May 2025 15:52:31 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 549CT6vZ002336
 for <dri-devel@lists.freedesktop.org>; Fri, 9 May 2025 15:52:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 OgpdIMOzRk6f6Ol3Oo2lwgI+bdt0V38jDJzDqsqNV2I=; b=RtiMTzwybNjNSW9c
 hufGWZfhosdUtfaaQQpgabcB9SXAXgjLDCwLxsSwvX2vNoWCHBJpoUPQsndrBofM
 Xkgxc3VJEJI2fKbS01gbsjT1nF+vUg8TR66RfujbvDP1cnAQ1E75gAAIF48wfBA2
 yN9KLaOl+SI4YRLqesP07oxJRzYlHmgN+56B38so4tS79n5UF8/OInK0ZttWCnSl
 uk9Fqn8uVbDYwc9a+sRM0qSNyg55INx2dw+ZRirlA/1YlSHsPTcnJNGaRzfcY6d+
 EXqc/NlBWno0PBEQzkMf6Q9oH+VZa0wtxxmyOtaNanf7cJJ7Db/2fro3BmnCAT2h
 qxWTmQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnp5d4ex-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 09 May 2025 15:52:30 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7c54788bdf7so9044485a.2
 for <dri-devel@lists.freedesktop.org>; Fri, 09 May 2025 08:52:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746805950; x=1747410750;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OgpdIMOzRk6f6Ol3Oo2lwgI+bdt0V38jDJzDqsqNV2I=;
 b=I9aNfyg+GgXZphFStbj38qbqHdISDUNxe2vqxbGHJ+jsJQ+bvrdc5Yk737mpG7i4CA
 ChwKV/zBy1N/SOQSUp3xJZ8spgVoxS+w9m595JYe/YKi5t4Ec4nGF9xxxZ93EVjgJoJK
 N7+m7sSD5aiBLK+GcIHkk/7QRENCcTJzph/v4BtlXolJchHGOF+d6XH9ye+Lj3XkoPLc
 EA5rX8O21kk7wYQEe/0HZJBnDdNe/LF797H2MF0G2HEzNSlbdhBs3cqc1rjojxxMgioh
 TSpJVR2fjEyGSo7DAkt6TaMlvRR6f4/MViAIe1qAGv+SQ7388ov2NHqczLeJ+HXbCoYh
 0/XA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW0ci62mwxAvsE43uihFAXyFajYv30JzvHSrznOKwTHqLC3NLFNRWbN+x5rzg8+WbHdwGTkFaoWjtU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy0Y1p8K+PJ9HNqJ9UyWJ4fJgcMz9F+ceQTw2AqlDc9j/+BnNBa
 39phvqSmTTOjHlLISHcrRNwEEJ0KKYQ0dFvwopEFSybTPwKQOgjxx21Zv2zno9giMTt1OZJmTxs
 qiXudDoRBFV9Mgovm4TMIsKk4cu9OCkJhlzqTSuTAjJSyofF2y+htH/GADaMku5kqzr4=
X-Gm-Gg: ASbGncvOJauhFcRBMI/rR3FJAJwXtETExannbjCNVgwNv4ZYuaBgB6ItjS4CmVhigPi
 XRKdTt2e7wb9qcdWtGlHMhmoJu5MlJZwBt1jIh84kEIs/ZWRjzEmjH2u683SFXypSY7tTAuUj3q
 BImjTisebTk5nyY+KlQu8as5Vwy4/M7bXlcASu8C+NPe+P6KNTCnwWo3iWLqRDayfsRbwefd3k1
 6ok7RlEpqsNOAI8aZkfqDNLMGFRLlZUt/pwzU1V0hI+H8uf+MNPCReaYO5vNSsFAm2l3mkWjEZV
 E+K4LTPLwvjI2cFh7lc0AK0NN3DB6+EC4z8+HQPQBz7HHt0nv/Nmg9EjRSg4VdXYH3A=
X-Received: by 2002:a05:620a:290b:b0:7c5:e283:7d0f with SMTP id
 af79cd13be357-7cd01108cb6mr239886685a.8.1746805949848; 
 Fri, 09 May 2025 08:52:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF6vSB51mdOZghOfvmG4yP63LfVUtSo1UHFOlSG6Oe5suFemWAMe5tcTQ95NoXx3vY6htX1hw==
X-Received: by 2002:a05:620a:290b:b0:7c5:e283:7d0f with SMTP id
 af79cd13be357-7cd01108cb6mr239885385a.8.1746805949419; 
 Fri, 09 May 2025 08:52:29 -0700 (PDT)
Received: from [192.168.65.105] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad2197bd37dsm166816666b.124.2025.05.09.08.52.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 May 2025 08:52:28 -0700 (PDT)
Message-ID: <9010219f-a3f1-4869-84b3-b4f6c5e9f05f@oss.qualcomm.com>
Date: Fri, 9 May 2025 17:52:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT 13/14] drm/msm/a6xx: Drop cfg->ubwc_swizzle override
To: Connor Abbott <cwabbott0@gmail.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
References: <20250508-topic-ubwc_central-v1-0-035c4c5cbe50@oss.qualcomm.com>
 <20250508-topic-ubwc_central-v1-13-035c4c5cbe50@oss.qualcomm.com>
 <CACu1E7E9yU-cygZxBqVypP7aFkXJCNTfXA2uqdvU84mi9T51Xg@mail.gmail.com>
 <5f5e512c-ae0e-43aa-856f-06820ac4b147@oss.qualcomm.com>
 <dedbfb2f-012a-404f-87d1-2f3cd04b0e74@oss.qualcomm.com>
 <CACu1E7EfgPFcSgGA5TkAVqpO=K2G1AjNVbRij60TknCx5PcoqA@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CACu1E7EfgPFcSgGA5TkAVqpO=K2G1AjNVbRij60TknCx5PcoqA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=XL0wSRhE c=1 sm=1 tr=0 ts=681e24be cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=0-j0KOu8P3_yQaFSRvsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: qm9uvGDt_e1sajqsWZEHf7UbHDuqQ_cz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA5MDE1NiBTYWx0ZWRfX6iZLS2bNYmIj
 L6k48jDx9kBVN9yGY334sfmEclWZjoOC6mlpLCHOg5P8pcbFKxdSVCgl2YwPAhlUBFfX+FnrVc8
 ox0gYmpckASG/0AaJ9HxBAGq5b6orcyWskVmIBg6jjPdLy5yMc3ldEF72/5+/fg4gsiBNPFVQMX
 1W8UQk8srGW7ZUgW8Pax1hhM+NDb1XH1ndCrANLP+olmqJWNP7lcMuqk68xRUrTFiM1okOo8niV
 quFMHhux718TGIUWoF+GYILWKVIv70oH1l0up9HGyzKQ7AzdHc6G2ye4II7yE17i6pF726XCNzg
 m4eK4fXUAaoZ+FTha+V1GJSg4iaLJ1Nzs4F0G/pv55cOukAGcN8l8tiTUjuIhmPh8LPjWkKGy98
 Mc/y7qPQdndoT7ug+aqPFruhvuUpQ2Bf8+1oJfXPKyKzq75OcwzVWRrtFBGHw9oKKt4XMwAr
X-Proofpoint-ORIG-GUID: qm9uvGDt_e1sajqsWZEHf7UbHDuqQ_cz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-09_06,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0
 mlxlogscore=999 malwarescore=0 adultscore=0 priorityscore=1501 bulkscore=0
 spamscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505090156
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

On 5/9/25 4:48 PM, Connor Abbott wrote:
> On Fri, May 9, 2025 at 9:37 AM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>>
>> On 5/9/25 3:17 PM, Konrad Dybcio wrote:
>>> On 5/8/25 9:26 PM, Connor Abbott wrote:
>>>> On Thu, May 8, 2025 at 2:14 PM Konrad Dybcio <konradybcio@kernel.org> wrote:
>>>>>
>>>>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>>>
>>>>> On A663 (SA8775P) the value matches exactly.
>>>>>
>>>>> On A610, the value matches on SM6115, but is different on SM6125. That
>>>>> turns out not to be a problem, as the bits that differ aren't even
>>>>> interpreted.
>>>>
>>>> This is definitely going to break userspace, because the kernel
>>>> doesn't expose the UBWC version, instead exposing just the swizzle and
>>>> userspace expects that it sets the right value for older UBWC versions
>>>> before it became configurable (0x7 for UBWC 1.0 and 0x6 for 2.0-3.0).
>>>> It looks like the data for SM6125 is just wrong.
>>>
>>> Oh that's sad.. I'll drop this commit
>>
>> Wait uh, we have this data in the common config.. why would it break
>> userspace?
>>
>> Konrad
> 
> As you said in the commit message SM6125 has ubwc_swizzle = 1 which
> seems wrong to me (it should be 7), it just didn't matter before that
> it was wrong. You should probably just fix that.

Oh so you meant that the 6125's value would break userspace - gotcha

Konrad
