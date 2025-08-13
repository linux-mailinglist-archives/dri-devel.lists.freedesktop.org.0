Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49854B2575F
	for <lists+dri-devel@lfdr.de>; Thu, 14 Aug 2025 01:19:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9111510E07D;
	Wed, 13 Aug 2025 23:19:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="PvgKzPIT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B5C610E07D
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 23:19:13 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57DN34Hs013514
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 23:19:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 2TfSABE608VzR8Ccb4ovCS90iSRhqxTosRl77AzoBvk=; b=PvgKzPITzN7s/w4F
 CWmDq3EBjBDvcHPTnE5J9fzFRBm5JuwXqpHyOD3UDwfrQm+CPO4qalH5ZusRrI5d
 syOJg9wfB711Q9ABtxbUE1ao4ffUbyTmicIEr2Q0OnL/Ukxm2p7Aat52rlpGqE9O
 OH7sCI1/xbp2CKdOGEQ0zs/t93Ayal4dCj8gPkwnxx62cdwGSwkKVxzcAjonFefc
 3eKld5Q5oOSdp/F74YRx0iyKCZyF4P3gZU+dxXES4M5zgTqoBQO7jMcD1HDhuRdH
 WAowXtuau2w5bYpTZ2zUbyq8qhOpQZUqju2QX72n3dcxOiReCJYZC89+HLB4aWwC
 jpjC/g==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48eqhxbpgm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 23:19:12 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-76e2e60c3e7so665124b3a.0
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 16:19:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755127151; x=1755731951;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2TfSABE608VzR8Ccb4ovCS90iSRhqxTosRl77AzoBvk=;
 b=wvJ2vvaQ0DzvWSgnguatuISZnefftfmpspZmGcM85ZnZG2FvvNHbghOTLCFviWDTfl
 QkgNoo+FEVB8AnQnIdgjtNkDTC60ppIaHJisRGJ8GK4GUJMl7twfcugUF1Z+05Zdtf+8
 TwMbXEOBtvWFJN2/YgtVxANbCRee0cCSjRDRo5feKa9Ng5kgbY3pNzwkAn3o/Sq4N0kp
 Jd7n+fKZq40/fvYzVF28E1XwZGVrqPEL79CNcru5aM6KlmpB3qwJrkqdHlKUG5Hb1PGR
 6HEypdxjZnDJf51bkwPpiMur4kdyjUiqYa82iaHk5bYE7FPubipzpZTrYu/Q+olMPXk5
 02mQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXWWeyrGvOqg/Ug11ypGrlo8uefnh+DsG9COv/RMPifJa+qZo0Ft0AQajzOatWRG+IsOmmSE0DM17k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywve8B9LgvVd2zY7+GZ/ZWiSJZXyV0BY3a33KYSN6S0s2/38Ge5
 ohAarNqnVmlT9LFRZOWccNMqZwocP2zeXUdJiXoX+x5dm50tBMu6CWTtpZKxr4D42bOJnd50v/5
 tO0tLx0TTpFyV16cQpWlQzRW7P/KIb8bTHQgMqRpwBWOtT6O4Qgr3sFN1irwFOIstria6ew==
X-Gm-Gg: ASbGncukTfwge3s+/s/RBRxq9qr9TNxAp1Jb698h6B2PdoByyVFbdLGaNlOVXAq+DDH
 S4oUUaDiKfJ/HJBFpzNubffIX6Z0HKhFoRc7chZg0b+xccqrULRFDP5ZBmWpnjqOT81ZB3yAnbr
 kuV4Xl6wEp+pl1p1dP46LAa+kJARXVYPc+NnwPYa1AeTYWM5lKVhkOxdLrvSlCxGA2l+QYIU4XQ
 tGMPrj5UXVV5rlch4jcqsxLYeLtS57o2FNO27RguxOmJSmGCX4+0j3uoiJSa36nfVbYMPxW9AGS
 zdpill1ydze/aK6FDvDmDRTeIKc+qYTUvbSBsW25PpOWCSObtsHlZq3POMM/CjCiTdY0NJEIeT1
 nU+/A2PQDoOAu9RklaITDlqjhYwENwffdFkExOQ==
X-Received: by 2002:a05:6a00:1489:b0:76b:f13e:f598 with SMTP id
 d2e1a72fcca58-76e2fa5dd6amr1713024b3a.8.1755127150800; 
 Wed, 13 Aug 2025 16:19:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGMWMipas6iUqagDKstR+TGWXPaYzE7u4u1viMcqd2w5yiGt/rETTcoLJmFUWDnm+dT5E5L7Q==
X-Received: by 2002:a05:6a00:1489:b0:76b:f13e:f598 with SMTP id
 d2e1a72fcca58-76e2fa5dd6amr1712998b3a.8.1755127150336; 
 Wed, 13 Aug 2025 16:19:10 -0700 (PDT)
Received: from [192.168.0.74] (n1-41-240-65.bla22.nsw.optusnet.com.au.
 [1.41.240.65]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76bf067e310sm28124852b3a.25.2025.08.13.16.19.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Aug 2025 16:19:09 -0700 (PDT)
Message-ID: <87c884ed-0975-4ac2-a0fa-16e830a57c72@oss.qualcomm.com>
Date: Thu, 14 Aug 2025 09:19:01 +1000
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
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEwMDA1NyBTYWx0ZWRfX7Gv85NxJ1OIh
 in594fUAGRbpmAJ137HsaMZOVQoaYErghta4cgXCE0kSHBIaeQOGynASt8f1VTsAksJ0p6S08jk
 fyDo3b2jfSSzEFINnLCqKD1Cyc16xZg27/BZlIatZyg1WWicT998LzBkeJ98FD2DMV4feNSwRN1
 QCzShH1BSbg5S4Jd4iNn+5YDVPvGlb01lyzjR5GNegP7II7BiuMns9Vw+rTOuk+UlygPd5rN51Z
 nDUCiXb6j4csqHuJBM5nZV5uSinqoxplsDa7J+x7WgD3f3NuK/4vwFbBHPC9H6E6++hDfS3VGOk
 TXvJ6Gec/8RFAVtXDtwW4qHL4GGXBeSkEe64lsEnn1PETEqCjI/sK4KZHrtWPYQQnYQZhW8gPhG
 CyFQCOo/
X-Proofpoint-GUID: k5c-3AoSNrgSCtZQmMBf64j7kzMAEZdN
X-Authority-Analysis: v=2.4 cv=aYNhnQot c=1 sm=1 tr=0 ts=689d1d70 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=hi51d+lTLNy/RbqRqnOomQ==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=AwBIn8DhAZiLWRgty54A:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: k5c-3AoSNrgSCtZQmMBf64j7kzMAEZdN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_02,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508100057
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

Or, you are saying we may have a configuration where host is big-endian
but TZ is little-endian?

Amir

> Konrad

