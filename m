Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02D42AD673C
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jun 2025 07:20:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D2AA10E77F;
	Thu, 12 Jun 2025 05:20:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="cIsEVmFL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4501F10E3EC
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jun 2025 05:20:18 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55BM9dvs002508
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jun 2025 05:20:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 SgShnvbxYvOe9ejQemiO99fJ84xPVKpU9m8unTXLRdI=; b=cIsEVmFLLuUkqwWQ
 OeN4SVH7c+fBoIaBZ5LnOZcEnpBUNjaASOZCo90WUHqp/E+BoEDTvj9VwPN5Grtr
 KQrsYxeP6qKX0xAlmjwz1DdJ/pkWXd8VuUqphMgXh4Ng800iJFCbl6kn2nknKx+V
 2iXDqqE+1kI/759cc9VDAajfARBlkyT/mVBLK3JGnBhMVrrEmIk7+NpxM1mHEyop
 ZDXOn4OdFPQ/hHPlLwWPNcGTqaMNIoWTMMvaV4OWCxrJxdSpKzaBw4tXDYMEKEtq
 Wm9E01FSnx/5/bTWtt1s6tz5MT6IO0mC1MzRnT2NBJ8JOvzzA0DciiBPATippACp
 /S8LBA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 477jbpgtm5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jun 2025 05:20:17 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-7377139d8b1so566310b3a.0
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jun 2025 22:20:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749705616; x=1750310416;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SgShnvbxYvOe9ejQemiO99fJ84xPVKpU9m8unTXLRdI=;
 b=LTLk7bE4KtNMA4CavlMJBck1RP667R3pK1ImHFyNbjj8VbY+fX41ZD27iH/z0QRTEv
 CIPT4+zCVzp1LIz2e3jGG7h/C7wruNCNL2zCNOoD8qZZpfXnaAgW1Z4ErylRervw9gRK
 iw7TobokLXSLL8o3VM/MHh+5j/DKKgUTudHCRZwZKP2pC88rZhKK36bZ13wIy5/O8Z2C
 r/spoPOjfFV/zMZEO0WvIhFDyle+wnd8VQ9WOpqLaawvbg0q1gp6OAQy8ce8oguW/qAm
 Q5LSDEaW0KWJgU49QMX+E3k4XtdI5AcwKmAoVWStz9gM8RUdLKY2UsV/ulecqeuudWNu
 caeQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWGNMdmLeJSM4cY4WjGTMTCV4lJ8/vkvmpDtWFdOrNqlLwaP/gtDkU9bDyIDI9+34I3tdnifpGaTf8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz7gL1rib3wOIue+A5yqkssIxoh7BiD5QtSNlpJeqqjS+mW2nfS
 B8Glsw5PBLdv/CNDPAw+BMuXA8WdCdS3gZmnUDeKpyi/qhPOvbvhTm1fFvRT8OGDJpQVy5tx6l3
 fnff4WOk/CdeWB9EVAcBexus41bkNTDHDeUcp8DdTotQR1fOubUTVCR5c1MyZKTg+FbW2tY4=
X-Gm-Gg: ASbGnctNTOZ+TsEImvwgPwwN2BuYpyfjCaHDiAQV2E53qsipgwFXOZFdCB6QVYE9WcA
 uK3w8EY1jOIQMUnhosQNMr5Ml9p/8RkHsBVagmktBfvMQSvErcBDHnj30uG8jQzlzJRJrxyXrNc
 dCQjtH6K9LI47LpQZ5y5+LY017AG30fmh+1iQl3+7iP5AVcfY+Sf4aLHLNYo3yGrg+UBP4L7/sn
 vKinkZ4XiNgOoo1C8hZnHlpfWkdQoDiw9zqC6wLPROWrbuWHIoiNDz+AG4Q6e25+MqqTVWrjyQ1
 DQL69dhYDiKpiGXK7k5viVAfO4o8poR8EXiMG7LUFYSuGd70Aw==
X-Received: by 2002:a05:6a00:8ca:b0:740:b5f8:ac15 with SMTP id
 d2e1a72fcca58-7487e0f4523mr2216961b3a.10.1749705615872; 
 Wed, 11 Jun 2025 22:20:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEqs1m+QLoDS+x2lBJsjsDDNIg8J4sHRXwm/0j8jv4uUBZesEksjlKMxB2tDesABKn2IscKXQ==
X-Received: by 2002:a05:6a00:8ca:b0:740:b5f8:ac15 with SMTP id
 d2e1a72fcca58-7487e0f4523mr2216931b3a.10.1749705615442; 
 Wed, 11 Jun 2025 22:20:15 -0700 (PDT)
Received: from [10.206.107.125] ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-748809ebe56sm536054b3a.135.2025.06.11.22.20.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Jun 2025 22:20:14 -0700 (PDT)
Message-ID: <f3d376cc-6e2d-4ac3-88f6-3104eec67acf@oss.qualcomm.com>
Date: Thu, 12 Jun 2025 10:50:10 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 5/5] misc: fastrpc: Add missing unmapping
 user-requested remote heap
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: srinivas.kandagatla@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
 gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
 linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
 dri-devel@lists.freedesktop.org, arnd@arndb.de, stable@kernel.org
References: <20250513042825.2147985-1-ekansh.gupta@oss.qualcomm.com>
 <20250513042825.2147985-6-ekansh.gupta@oss.qualcomm.com>
 <22uccyp5m2szry7bpitqcav5nlvwch5eqh4mdacfedidgrnyhx@vsjobngwdkmb>
 <dc67df54-2a19-4318-acd4-b96b8549b64d@oss.qualcomm.com>
 <7ogkoxsowpd2x5qmjog4qx5eu4eiinvtnyjz5hfufgna2hz7na@oxzmowlnelxb>
 <61dd2c3f-20ac-484e-8a45-f42fd5f42b86@oss.qualcomm.com>
 <CAO9ioeX1uE3ty5oSezYOLJKqf8G5dLYAS5nRiNvryWTk0RPdEQ@mail.gmail.com>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <CAO9ioeX1uE3ty5oSezYOLJKqf8G5dLYAS5nRiNvryWTk0RPdEQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: SVJmSKLTkpSI6XRpLtWad_ZH7pPp_8N2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEyMDAzOCBTYWx0ZWRfX4ryrsc0SlMWD
 p2Chr9H8EW0gfscC/6Jg/lv78m7OKpc6wBRA274/FTCwW+cuA86P/w+aYiqEx0V9i/pdLR7prJW
 2kbFZBcnMA1YUNZYJKduePdK4HEAtCeuqGw5bkOQtP/7aE4JlYmnELBXFb+6oBbg3SIa3q8PmvM
 lSDZhzvqVYkr2wTZxvdxr1fSA/rgPA8Orn7libboGlp5vkgeyLb2ojzP53eh7wbqgTsKTCH9hjj
 JyPuJflFT6UXkdZmceE3knNhkPftYYLqMnAsyUfPD2wopMjYZY4lUG2Zy/GPx1fSQP1rW/2a0dg
 raB+d4KdMM7i6D4S1Wvh74HNJw2/fk4+5iUSAS9qOQqfiYp9iegqaOcwV7aIMCZLnjnvqhP5uCA
 LADsq1HjFM85zaYD2jD1qK3/r6UGHeUdALTyVjd0bqpyKCXK36YBiCR34HJyEalEROnh8Ifs
X-Proofpoint-ORIG-GUID: SVJmSKLTkpSI6XRpLtWad_ZH7pPp_8N2
X-Authority-Analysis: v=2.4 cv=OLgn3TaB c=1 sm=1 tr=0 ts=684a6391 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=ZxPKgs51gy0u-eq_dnEA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-12_03,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 impostorscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 mlxlogscore=999 suspectscore=0 adultscore=0
 malwarescore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506120038
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



On 5/22/2025 5:43 PM, Dmitry Baryshkov wrote:
> On Thu, 22 May 2025 at 08:01, Ekansh Gupta
> <ekansh.gupta@oss.qualcomm.com> wrote:
>>
>>
>> On 5/19/2025 7:04 PM, Dmitry Baryshkov wrote:
>>> On Mon, May 19, 2025 at 04:28:34PM +0530, Ekansh Gupta wrote:
>>>> On 5/19/2025 4:22 PM, Dmitry Baryshkov wrote:
>>>>> On Tue, May 13, 2025 at 09:58:25AM +0530, Ekansh Gupta wrote:
>>>>>> User request for remote heap allocation is supported using ioctl
>>>>>> interface but support for unmap is missing. This could result in
>>>>>> memory leak issues. Add unmap user request support for remote heap.
>>>>> Can this memory be in use by the remote proc?
>>>> Remote heap allocation request is only intended for audioPD. Other PDs
>>>> running on DSP are not intended to use this request.
>>> 'Intended'. That's fine. I asked a different question: _can_ it be in
>>> use? What happens if userspace by mistake tries to unmap memory too
>>> early? Or if it happens intentionally, at some specific time during
>>> work.
>> If the unmap is restricted to audio daemon, then the unmap will only
>> happen if the remoteproc is no longer using this memory.
>>
>> But without this restriction, yes it possible that some userspace process
>> calls unmap which tries to move the ownership back to HLOS which the
>> remoteproc is still using the memory. This might lead to memory access
>> problems.
> This needs to be fixed in the driver. We need to track which memory is
> being used by the remoteproc and unmap it once remoteproc stops using
> it, without additional userspace intervention.
If it's the audio daemon which is requesting for unmap then it basically means that
the remoteproc is no longer using the memory. Audio PD can request for both grow
and shrink operations for it's dedicated heap. The case of grow is already supported
from fastrpc_req_mmap but the case of shrink(when remoteproc is no longer using the
memory) is not yet available. This memory is more specific to audio PD rather than
complete remoteproc.

If we have to control this completely from driver then I see a problem in freeing/unmapping
the memory when the PD is no longer using the memory.
>

