Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30C7DAD6C46
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jun 2025 11:33:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BCCF10E44E;
	Thu, 12 Jun 2025 09:33:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="UTFB5yAN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8218110E44E
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jun 2025 09:32:59 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55C8JoAQ029279
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jun 2025 09:32:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 8OFSXBuTsZph9YN+58NxpHuks3+eLbATc8hv+sy8Q10=; b=UTFB5yANkhxQnK/+
 u4XlrbwojEQZGU8O6bL/ADIUk/FfDawPzIH3KzJv9u49STGGvvOhqEs0NV9GOoSX
 1KtDD/EZf3NBXoCHtQF/TbGBr1OatXIW1jJ7cC0M5UZTmb67zfyP1Vm1EmMV9Dil
 LVSzbI+j3rjoMeVuQFFZPxy9qeB343jH9uYL+8Y99Ffh4d3tP68FdfG98js25dhz
 WfYBUbTKBS7e9WXAhiSq3D/Fl8FQPtJUycVHFf5RNXs5rWeNlGnVGAa3SE4nPY9O
 nNwBtX/Er7l53SY97NR+103zO65hfak7orbG3rLS5cyymUyzUIh0GT1Kxi3/fLEz
 V/neLA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474dn6g0ah-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jun 2025 09:32:58 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-235842baba4so6640095ad.3
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jun 2025 02:32:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749720778; x=1750325578;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8OFSXBuTsZph9YN+58NxpHuks3+eLbATc8hv+sy8Q10=;
 b=OhBAJDNCmWtUTGDVo1G0KNktMuyylkP4YOSJZyYYZA8ipxGsEGL2TC5j541c2lSQKF
 i5mNf1t0pDpl+LhHDGFtS94S11HIY5/ZRj9/GpmeCMIxSIHouHmMj6PVnCDQ9xuUXIxg
 FpwuXfjbNNJdFlW2lpOpF/33nN72gTvqdzmDT/nAesxW+JTr924eBQpX2Hqt21wy/8Yh
 qSrddjs06wT24dWCg+MCXQlrLZwE+P6cAjhFtYiCKf/Tf8xJlS1ircKkG23Nbvc/1BAa
 vuZbRcBqPYZL9SAk1gXBrkpV/tO97qPQNyftQi+5UazVd/DuQAX5Yg3GnQsd49BVx8Y4
 mIfw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUrJP3mGgP2NtOi28AHcYdFl0XVvrYH6r0QnykYC9RgBn5juy4aVuTjG9ZeLEjFToOOAdLfRtC4JWE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwWQjh6vJTb0cw6KPyVyY2nwPcoLWsvQvFNIxazVyFxo6aMtf2T
 SErvxo48TXqtk57Gplb6rQgyNOTFzbyITgiK8RvGF2hWHkxsiINMmf/U8seBPc1zksiSKogYmBN
 0CYmryImV2yDLW10YxHrCNccgvLTqfjkbeueN3PHsvclEz6nZI2bbHyLRfCkzzqZOiOr/B/c=
X-Gm-Gg: ASbGnctzIs+sDr9bShseYSF+NAyc0siCgTG1Re1LytXOS9syji8G4EiXDCPaWTTDH+K
 pvyHYICgogYk8pqGP7aOavaMoklr+JfXkrlhiAxNhpMHKaqhgZMPOa2tZZQpj9DTF6rptwq71X7
 mUayiX62dZwstvzTR9abyL1cFpfASz11Jj7PTQPd5VHZbaqkPR0B/RBKWRbobrBj0aXiLCHehxi
 4Uug1krQDRcVIbleWlY5RAZIvsWCAq9uFAFhIYTWY9BUhZW80lzU7FvvLoGXc2Tilo9oJgLWX6/
 uMam3NUsD2ORTe5MebOQrtUeUK90ad3ZiLFUFnBlNgbCAzhX
X-Received: by 2002:a17:902:d50e:b0:235:eb8d:7fff with SMTP id
 d9443c01a7336-23641b1aa64mr108573515ad.28.1749720777919; 
 Thu, 12 Jun 2025 02:32:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE3YB0/88oPhzctSwvZEmnLkEwQuSYwYdDcT17qqG5HyuttcfCBbQFmrpEr+WXA62Dq5W9B9g==
X-Received: by 2002:a17:902:d50e:b0:235:eb8d:7fff with SMTP id
 d9443c01a7336-23641b1aa64mr108573005ad.28.1749720777504; 
 Thu, 12 Jun 2025 02:32:57 -0700 (PDT)
Received: from [10.204.65.175] ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-313c1bdc89esm1132256a91.19.2025.06.12.02.32.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Jun 2025 02:32:57 -0700 (PDT)
Message-ID: <7505f0e8-222d-4052-8614-c12109d14bce@oss.qualcomm.com>
Date: Thu, 12 Jun 2025 15:02:52 +0530
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
 <f3d376cc-6e2d-4ac3-88f6-3104eec67acf@oss.qualcomm.com>
 <qw64xqfnyy76f6oawtaecvraejcwyml5k7oxdy67adj2rh46lq@nupxbuy3vwu4>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <qw64xqfnyy76f6oawtaecvraejcwyml5k7oxdy67adj2rh46lq@nupxbuy3vwu4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEyMDA3MyBTYWx0ZWRfXx4w+ZCMply1f
 7/6PkB3RQQjfAJX1RLLcrVJPfndPAI9IwrOURmyX09RqB+JNkxzn/cuibg8q7gzb9Gf90wPXG/o
 ciLGpiEuh4vRdn7CDoh4+t286KFdZWb79IolAMbswmsB6R2+n1JeXJ5jT/KJcNZJuvz+v582kfb
 KeSkFBWzCB0v7EP/G+LXXhcgnH0Ib+tOdkMH2adCv9IVQGOK0jIsylCWT0+yFrzUOcqQoBTSooY
 VxbYiQSat6/Z4ZpH9NbK3gNxJOEyT1lmOzzo8mCoTGmXO1saLpr0OnZzG360vE9aQggI7mclzsz
 Xtt+GtRdfg2Xpr5m5okIYeYJ5ENlaj+ga7yToxwRQ7fFqxkPVhElIhD5vWqrkt/wixJQ27iMzZC
 eAng0FY+E9SL7yuFPCi2zoLgUPYDoyt/autNmRMHNGEdzzz0BXMoH0mPUN6X/5i7qS2B7Qgq
X-Proofpoint-GUID: XizDH-7-GgD4bau7RFYXiMHEIGPWaJ6j
X-Authority-Analysis: v=2.4 cv=FaQ3xI+6 c=1 sm=1 tr=0 ts=684a9eca cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8
 a=QnOT__A0hv9WPcCiwtcA:9 a=7Od4JLvlTNRbCQXB:21 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: XizDH-7-GgD4bau7RFYXiMHEIGPWaJ6j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-12_07,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 adultscore=0
 mlxlogscore=999 mlxscore=0 spamscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 clxscore=1015 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506120073
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



On 6/12/2025 1:35 PM, Dmitry Baryshkov wrote:
> On Thu, Jun 12, 2025 at 10:50:10AM +0530, Ekansh Gupta wrote:
>>
>> On 5/22/2025 5:43 PM, Dmitry Baryshkov wrote:
>>> On Thu, 22 May 2025 at 08:01, Ekansh Gupta
>>> <ekansh.gupta@oss.qualcomm.com> wrote:
>>>>
>>>> On 5/19/2025 7:04 PM, Dmitry Baryshkov wrote:
>>>>> On Mon, May 19, 2025 at 04:28:34PM +0530, Ekansh Gupta wrote:
>>>>>> On 5/19/2025 4:22 PM, Dmitry Baryshkov wrote:
>>>>>>> On Tue, May 13, 2025 at 09:58:25AM +0530, Ekansh Gupta wrote:
>>>>>>>> User request for remote heap allocation is supported using ioctl
>>>>>>>> interface but support for unmap is missing. This could result in
>>>>>>>> memory leak issues. Add unmap user request support for remote heap.
>>>>>>> Can this memory be in use by the remote proc?
>>>>>> Remote heap allocation request is only intended for audioPD. Other PDs
>>>>>> running on DSP are not intended to use this request.
>>>>> 'Intended'. That's fine. I asked a different question: _can_ it be in
>>>>> use? What happens if userspace by mistake tries to unmap memory too
>>>>> early? Or if it happens intentionally, at some specific time during
>>>>> work.
>>>> If the unmap is restricted to audio daemon, then the unmap will only
>>>> happen if the remoteproc is no longer using this memory.
>>>>
>>>> But without this restriction, yes it possible that some userspace process
>>>> calls unmap which tries to move the ownership back to HLOS which the
>>>> remoteproc is still using the memory. This might lead to memory access
>>>> problems.
>>> This needs to be fixed in the driver. We need to track which memory is
>>> being used by the remoteproc and unmap it once remoteproc stops using
>>> it, without additional userspace intervention.
>> If it's the audio daemon which is requesting for unmap then it basically means that
>> the remoteproc is no longer using the memory. Audio PD can request for both grow
>> and shrink operations for it's dedicated heap. The case of grow is already supported
>> from fastrpc_req_mmap but the case of shrink(when remoteproc is no longer using the
>> memory) is not yet available. This memory is more specific to audio PD rather than
>> complete remoteproc.
>>
>> If we have to control this completely from driver then I see a problem in freeing/unmapping
>> the memory when the PD is no longer using the memory.
> What happens if userspace requests to free the memory that is still in
> use by the PD
I understand your point, for this I was thinking to limit the unmap functionality to the process
that is already attached to audio PD on DSP, no other process will be able to map/unmap this
memory from userspace.

>
> How does PD signal the memory is no longer in use?
PD makes a reverse fastrpc request[1] to unmap the memory when it is no longer used.

[1] https://github.com/quic/fastrpc/blob/development/src/apps_mem_imp.c#L231
>

