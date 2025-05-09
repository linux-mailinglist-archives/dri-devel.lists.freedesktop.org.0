Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41C12AB139D
	for <lists+dri-devel@lfdr.de>; Fri,  9 May 2025 14:39:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DAD810E971;
	Fri,  9 May 2025 12:39:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="KnLUUF76";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17EC810E971
 for <dri-devel@lists.freedesktop.org>; Fri,  9 May 2025 12:39:48 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 549Aq2FM025122
 for <dri-devel@lists.freedesktop.org>; Fri, 9 May 2025 12:39:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 4G1RV5OSQbBgLbkxXdEz6RKY+uaAPac1V0RoEspl1mc=; b=KnLUUF76t2PuxaRe
 ypLdVnGyaLLu66zSCesTwxcmWkL0OyupdYnP85RjBJqaRGr3Y9mUdsW+WGmBbHZm
 wws1I6B3PDr+y9fMgwCJb5FCfEkN8nQux7Ehj8rJ3IQjl32nEaRzJ1u3BprW+mOo
 V2LS3XUHbvTAglhtFTLVcH+eM19dSORNU1foWMKmfzu+zdhQZ4lLFfcgZg04W8An
 VlF+ir97v0BI3kxI6xJzWKEvOcamssCsPKrjRjcsQhRPtUyjQ/6hIz+c2c1GtnjE
 KTum0rXo7u6+h16SjVjI6XOvOhY5pcWGcl6CeIK9gs7SVOyS9JrWusCcMu2UMqgw
 /aeATA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnp14r3u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 09 May 2025 12:39:47 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7c54734292aso56715485a.2
 for <dri-devel@lists.freedesktop.org>; Fri, 09 May 2025 05:39:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746794386; x=1747399186;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4G1RV5OSQbBgLbkxXdEz6RKY+uaAPac1V0RoEspl1mc=;
 b=hpJLTBbnliUp1d4+mXa36C2IX7uOKjane+93SiXxayDfl7UyVdEKKtHDFkLUxWGhNq
 lUeR+HeECW4asPp4jb3WYh/t0dLEyupTOHuVI23yaWreCAo76AlWO1IkH6gIAyUZM7YI
 YOPtDlrbnQf/Cl04Gn6Oiuk71rWVB3yRXLuejoVvqKPJI+Qxghj2jY3Dp+EnYswKn7E5
 5qKh0wyrbmThJs6bws2o3iVnVKW3uB81ucZ75PdP22s0MfHo95iI5MfzP1ytjGO8plg7
 A20S3Iy2BRkS1PqwWHUQnwmSDLMjffFcpylyRiRIglayAYa0T7QgDPWP8Lmw1dwrhmQY
 08Jg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW3PkjTC92ct2XzjXMv/XUpVtNV21NEFPRLwTZ3WCQkQPvAbtVPRLcWrvpp/D9G5tBi1doTGVnPCz4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyDRpHEFr4hiL73Oqo92RoqVWtaXZeAKs9xFPQ6lZ+sgAfkySsg
 RWRN1AasjpX2Le8dBWQfRm4FUl7BwbdiqFVfTJqzDcIrWaVoTaX2G1A5eBj4F0eUslIlYIk8YYT
 QEQc6k2yh9yWfMXSanpWzfoQ/Ac/u+i6jpfVcQOnsBz0f8nUUzghlbq7I/Aj2VjjSwbc=
X-Gm-Gg: ASbGnctjv3KLZVIk9HujgOvI8SkjUFVECzMOtkQFHTS3DN3DCULbMaU/wKW4pZnGnrI
 Az1ffpTS4aWt7np6te9McfVCaL0F6bNk/cLeQbsabuw+JoU86ct7djyr6N9eQUwZawA/iCInI6W
 j3tAvql/84QTXoJcug61H5zraW3HIjDTENPEk2A2aAZ25kEpHxsE+s9tbGzQDotA75I15nP9YkE
 muHex7S+i1vl4TFmXt+Q+6N1g4AIPQMibkz9Rdu4x1e749uhJz5jj7Teg2Rvmew5GmbEyIKMMOC
 BXbx7YJzQOW8opzJqFGQ1tw687M8Z3PxYKY4VgTafuJrj81/X3ksewrzQihMOqLo1v4=
X-Received: by 2002:a05:620a:270a:b0:7c0:b106:94ba with SMTP id
 af79cd13be357-7cd011186f3mr194765085a.7.1746794386269; 
 Fri, 09 May 2025 05:39:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHhQplMN/T2Kquk8OAgFmlti7cmfd722WmVfsRvtwRfluidvoeB7ua1lUBaXYSIjte577KX6w==
X-Received: by 2002:a05:620a:270a:b0:7c0:b106:94ba with SMTP id
 af79cd13be357-7cd011186f3mr194762585a.7.1746794385893; 
 Fri, 09 May 2025 05:39:45 -0700 (PDT)
Received: from [192.168.65.105] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad219746506sm143082866b.88.2025.05.09.05.39.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 May 2025 05:39:45 -0700 (PDT)
Message-ID: <b374b468-819b-4f5a-9ecc-0926c3696db3@oss.qualcomm.com>
Date: Fri, 9 May 2025 14:39:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT 07/14] drm/msm/a6xx: Resolve the meaning of UBWC_MODE
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Connor Abbott <cwabbott0@gmail.com>, Konrad Dybcio <konradybcio@kernel.org>
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
 <1f6fcbed-c7c4-42c2-814b-3834b08c5977@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <1f6fcbed-c7c4-42c2-814b-3834b08c5977@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA5MDEyMyBTYWx0ZWRfX+CBj4sUDBU5p
 s579bfdhkbejetB4wAcrzSU+/GOTkyeg4M8SqByb1NYLT6gE8JL+nXHDXVbf8IydMJ4QVbc8MZO
 wywldB0Ma9UEc11NpPmzSUK+lXcG1xkzoN2Jy0Q7AtEHVQj0gswhftSuptjO78qxZAfhi1qsSPV
 T78JpW+iUAEpFjQuyFinjCeFQi7O2WuHRzvBEQrSsmTeSKMLoeXEtxx8DZXe/3gm44sAienJ6Wd
 xeWbN94iULcXPvecr3ZpwEEhLPIkQGkj9F7rJGm6jfU/52zOFhTqlO+aoBvGpM6R1Tu/AvMKLnx
 lcQoj/DN/BvvUSnIkoJkxPc3KUsGLtOfxHobtUhcssqOB2WwseWZ6fEVmyAcQgzWJ2ZalORsk0n
 ErAywbsnuDnXFC7TqWZbcZ+KLOqR87R0lQdeX3sERPEm5xm0ReFzc5TzUHfa/YfftQOXLRL9
X-Proofpoint-GUID: pfRls7qbtqqRFx2r3T_G7ZqsREr7cohi
X-Proofpoint-ORIG-GUID: pfRls7qbtqqRFx2r3T_G7ZqsREr7cohi
X-Authority-Analysis: v=2.4 cv=W4o4VQWk c=1 sm=1 tr=0 ts=681df793 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=sEJkFV_Ntms1zBwlKkIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-09_05,2025-05-08_04,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=956 suspectscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 mlxscore=0 adultscore=0
 clxscore=1015 malwarescore=0 impostorscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
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

On 5/9/25 2:37 PM, Konrad Dybcio wrote:
> On 5/8/25 8:25 PM, Connor Abbott wrote:
>> On Thu, May 8, 2025 at 2:14 PM Konrad Dybcio <konradybcio@kernel.org> wrote:
>>>
>>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>
>>> This bit is set iff the UBWC version is 1.0. That notably does not
>>> include QCM2290's "no UBWC".
>>
>> While this is technically true, AFAIK the only difference between UBWC
>> 1.0 and 2.0 is that newer UBWC disables level 1 bank swizzling, which
>> is why I originally wrote it this way. There's a bit of redundancy
>> between the UBWC version and ubwc_swizzle bit 0.
> 
> It turns out to be a hardware matter

Well you just said that.. in any case, i can do either (or both with a
sanity check)

Konrad
