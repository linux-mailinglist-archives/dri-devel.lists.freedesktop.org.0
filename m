Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FB8FB25740
	for <lists+dri-devel@lfdr.de>; Thu, 14 Aug 2025 01:08:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6258B10E7DD;
	Wed, 13 Aug 2025 23:08:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="U8zOzJHE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 631FC10E7DD
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 23:08:09 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57DBLcUG031866
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 23:08:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 rcBAK8eEeC3gYozyTRH3zfy0KnL/G+SterUWthRRl60=; b=U8zOzJHEoKmIQoET
 t4wcKyCFI4yA7ChPpRqtIZQQBQYhyHrWSjqOlZWfYSpUyY5Whw7jdUvGQ4uwLXz5
 m6tZJLWSeSkAZNn0z3M6uztHqlpsjd/4NqB8zlSEz65n3qqfkYMPMset8EKCxqOK
 4iOUP5Vu1pT75vbH8gxV1pP4tJhOfyYzY65iJ+XX5JbsXtXIuXwqyAKx77lfnqoN
 6mNNV3auWxk7Qx+aESf/UqpEybNFf83IBGLkWIknnFkCaAK6787ixCAXyPDPfB4l
 QdQZnybKpgRUJUJDa123Glpx5gwFmI/fNh1vPNXdpRBH+Yo3orQ6+VnyQROj/uPX
 ceGGyQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48fem4hg6w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 23:08:08 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id
 98e67ed59e1d1-321cfa79cb3so1122269a91.1
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 16:08:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755126487; x=1755731287;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rcBAK8eEeC3gYozyTRH3zfy0KnL/G+SterUWthRRl60=;
 b=jAQPL7/jvA0sDtZh+1MXLHkpmJ1ArxE6qi3/S/k0CH2Qw80Z0iBBriKkvT/hS6xs6r
 BuaKSW+5OBa5mIuctSkqb2pc6hKYHmZwmRYPdNptNWreCmHIxa6CQRNBw0erpeOvWHyh
 nLiVX5Hbma2wT67gSNOPwGXmBmiElbZxPE4P9/Mf2lAKoW9fgm8p+wyxTCeG4ox8L4Q3
 e4w+jamb0cayjmNE03Yd5yhgvVWkvImcnblpA+sJANRradK1BRos5x3vm0ytEEQ2sSRA
 OD7ymcn+KbYshfo09Xz18Q6YdBGjvBXyMv4GrRqwuulFkX2FRQTjCXRvybQJflLbgCQW
 AwNA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVfz8WkaqzrH+TnaV/k/Ai/KWovtUDsnB85yJh7Ph+pmeBwxGxjrx1H2sqBPB+oeqgPIx5Gdh3T27Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwgJpS6yDAikT8JuV6H6aXWUyfY5lvfg0GlXN7CySj/8QN1BIkM
 7Jb5WcV5/+KW+ziPdodsp57/JoD0fjBeia7m+KNYsaXuAG3q35xESMZsAJG7dyKLUG/DhbRXWVV
 LsiOfMYPehRB4Pr5wHTqO3jDNPOKcz4rjr2YrIGsYs/dvYBjjy4Zwpj0LnHlXmZyR9Z616w==
X-Gm-Gg: ASbGnctR0s10y/Il7nfJo4QgsDkbPD7YmM9/nDYd9GED9uJAWhVD+bx1kJugIwvjGAO
 kikLP7tyu2DXtb/Vz4+lzYAi8GrLSUvCcTd0IIreAVEtkk5wc1MWsyhxONmE00tsZ5ZOQc2rnva
 CV3aenOMQboRjFiOgdsYhdWjEuPxWODivLrUW4mjfga2bU1ilyvJz9lS3E22ipTRdusAfa0b16S
 uFHj+134CShMq2KVSfS8DKZEpj88LqE5tSka7dm8wYLm+zVBGMuieamzWDvjqeFL0FcTCnSsr+l
 uATzWu8x29PdV/6FDjnGa7n6dbBL3PB6Rkkglnjvfqd0Eu+Jo7Pd/U+6YjGYDJNV6abV/91K9l8
 BNERNgOozl4ZPE5P/92LcwrBx3EHWPtdJpiWYKQ==
X-Received: by 2002:a17:90b:580e:b0:313:d361:73d7 with SMTP id
 98e67ed59e1d1-32329ae3857mr664186a91.13.1755126487067; 
 Wed, 13 Aug 2025 16:08:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGAb97Pa0qtCkny2T4Bm3SgwY7hxlZeUaAqrAvqEuROtklAwf8KwhQzp8LvQNNm/xytIym38g==
X-Received: by 2002:a17:90b:580e:b0:313:d361:73d7 with SMTP id
 98e67ed59e1d1-32329ae3857mr664147a91.13.1755126486585; 
 Wed, 13 Aug 2025 16:08:06 -0700 (PDT)
Received: from [192.168.0.74] (n1-41-240-65.bla22.nsw.optusnet.com.au.
 [1.41.240.65]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b422babfbbdsm28366124a12.35.2025.08.13.16.07.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Aug 2025 16:08:06 -0700 (PDT)
Message-ID: <7aa7035f-d2c4-4c00-bc46-2e98d4c2641f@oss.qualcomm.com>
Date: Thu, 14 Aug 2025 09:07:58 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 10/11] qcomtee: enable TEE_IOC_SHM_ALLOC ioctl
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Jens Wiklander <jens.wiklander@linaro.org>,
 Sumit Garg <sumit.garg@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Apurupa Pattapu <quic_apurupa@quicinc.com>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Harshal Dev <quic_hdev@quicinc.com>, linux-arm-msm@vger.kernel.org,
 op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-doc@vger.kernel.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Sumit Garg <sumit.garg@oss.qualcomm.com>
References: <20250812-qcom-tee-using-tee-ss-without-mem-obj-v7-0-ce7a1a774803@oss.qualcomm.com>
 <20250812-qcom-tee-using-tee-ss-without-mem-obj-v7-10-ce7a1a774803@oss.qualcomm.com>
 <3ec0a8d0-7900-45bd-b0d3-90ee8ca7730c@oss.qualcomm.com>
 <d81abdef-18fa-496d-8493-e8f336c43800@oss.qualcomm.com>
 <d74404ec-44ad-412f-98ef-eed288ecf1bf@oss.qualcomm.com>
Content-Language: en-US
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
In-Reply-To: <d74404ec-44ad-412f-98ef-eed288ecf1bf@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: jL4M1lBxSGBB7GlGw8v-0dogjW4tuRpW
X-Proofpoint-ORIG-GUID: jL4M1lBxSGBB7GlGw8v-0dogjW4tuRpW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA2OCBTYWx0ZWRfX6PBTGY1qVJuO
 ZRCU3hXDrwdAW8YePDAkDB0TVx7C3DB+SH8F+1uP4oZdk9EZ3u1F/7yQ9TfpaJABkIm4lLYQdeB
 slZ0DhCnMOrdfTgweXGAfr9M4+8psw/LIRpfK8AoaLfPqCVy0tDHN8mIF5ENjVGcgY4JqwM/90M
 ytzpcq7FlqKu7n8CsbdC22pIcSd8B3NGNKmjdA/xOBBgOY0Nh6tpjfLxe5j+PfXeSzLnGihD4d9
 Mn/li9b2Wz2hM+XMZW8iEeXQS34A5jJByt8FZDTUuVonmgkWkynoO8MOOICPw3606cv0yjq0z1I
 70jlD43Zb4zjTC++0V9wZ3VanrOKUYIbfFRJ8/r5mVWFOkmU9BalddBLsvqViItgKPz+qY4BIrm
 TEwgx2q9
X-Authority-Analysis: v=2.4 cv=YMafyQGx c=1 sm=1 tr=0 ts=689d1ad8 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=hi51d+lTLNy/RbqRqnOomQ==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=AwBIn8DhAZiLWRgty54A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_02,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0
 adultscore=0 impostorscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508110068
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



On 8/14/2025 8:49 AM, Konrad Dybcio wrote:
> On 8/14/25 12:24 AM, Amirreza Zarrabi wrote:
>>
>>
>> On 8/13/2025 8:00 PM, Konrad Dybcio wrote:
>>> On 8/13/25 2:35 AM, Amirreza Zarrabi wrote:
>>>> Enable userspace to allocate shared memory with QTEE. Since
>>>> QTEE handles shared memory as object, a wrapper is implemented
>>>> to represent tee_shm as an object. The shared memory identifier,
>>>> obtained through TEE_IOC_SHM_ALLOC, is transferred to the driver using
>>>> TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_INPUT/OUTPUT.
>>>>
>>>> Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
>>>> Acked-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
>>>> Tested-by: Harshal Dev <quic_hdev@quicinc.com>
>>>> Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
>>>> ---
>>>
>>> [...]
>>>
>>>> +/* Mapping information format as expected by QTEE. */
>>>> +struct qcomtee_mapping_info {
>>>> +	u64 paddr;
>>>> +	u64 len;
>>>> +	u32 perms;
>>>> +} __packed;
>>>
>>> Please use types with explicit endianness, e.g. __le32. I'm assuming
>>> TZ will always be little-endian, regardless of the host OS
>>>
>>
>> I'm not entirely sure how this point is relevant. As I understand it,
>> the core that populates this struct is the same one that accesses it in TZ.
>> Your argument would absolutely make sense if the host and TZ were operating
>> on different cores with distinct architectures -- such as one being
>> little-endian and the other big-endian, which is not the case.
> 
> CONFIG_CPU_BIG_ENDIAN=y exists on arm64
> 
> Konrad

That’s not what I meant. I understand we have this config value,
but the argument is whether, in an SMP system, we expect one core to
operate in little-endian mode while another operates in big-endian mode.
I do not believe that is the case. Then it becomes irrelevant.

Amir

