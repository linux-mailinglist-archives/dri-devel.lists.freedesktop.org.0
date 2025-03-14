Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F297A6165A
	for <lists+dri-devel@lfdr.de>; Fri, 14 Mar 2025 17:36:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F094210EA10;
	Fri, 14 Mar 2025 16:35:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="n5v7137f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CC0610EA10
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Mar 2025 16:35:58 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52EC7mfm031607
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Mar 2025 16:35:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 66loOkDic1IZ2k77pHK2vLxKaOEydAAzgkXK/7t4FW0=; b=n5v7137f3IHVIGGp
 yiC4rhZu7wcsxwksSSRL5t7jBcnMe6f9pac4lUOQAI/NRvA6oCEfkgz4Z//+4U3T
 t+zxYjDbEYPY99Glo4wEl6HJNIDRex4FYGS4IYf12raoAOgx28Ho9YeauArMv5+U
 VFmueiXFrOYW2dfwAxsAUaKuEuTLeuT0mMEf8NBIUm55pmlVjKVxA0Ht8mq6Zqn9
 1wdn591QH0ChxQ21wpomFADt+I8eK2+KU18DdN1BolnBNQIOKh2BiXj1BX2Mki/Y
 Z0hFSwAGxsXYHmi0DtkKeXHwRmtbmArVDmna7LITNnGXlp+8BhoYoTf9DbgUIBj5
 swboDw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45bx1jm8x5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Mar 2025 16:35:57 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-224364f2492so36389535ad.3
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Mar 2025 09:35:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741970157; x=1742574957;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=66loOkDic1IZ2k77pHK2vLxKaOEydAAzgkXK/7t4FW0=;
 b=Rm68p9letN40s2kzJEoVxTEEciGT0fhWh+zUfm2os1prvTzo11k5JYDrZaQRLQKc9C
 Rj2Y9vjLVyE66WLT8VdDQrD+AmxW3awS4Mfsqp7JZRvNaZre5alVXV9mrEjqvXl15Jlz
 RbmT3DT2OMOjoTE6r0q7LIPFs9KZ3oaI1ManlIN/j753fZAMXFrlYnpWcc28OBIH7DT1
 JaJoXu2X0Cz3pKwd+LDPegLNcZftfqwABmgCaqG2MYDNyuYo/0tMvFAK0FC0PdUik+uz
 b7MmVWqBgiOXr3uJIfORSzL4GMo1mTklPOcKRwVq07oPLWacXOT7Bq0VRDoWh7psy9ds
 6efw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXVEuOJqa588MhNL+tcw4YJXHXN8GvdPIelju06Apdl4iJ2DejetaV8c8llsjjPSuYvVtwMWyF8JPo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzfW7ECLJEm/kPGIeTp9OGvFfycV48R5XIIjcdMf1s0I+FvE3m7
 rNZwWwpxqYyWSWZ1VGkPJoPZ+US6s869ZWGPwHp2IUgCofpy7u9HPb0tYK6PJrulEXQihE5aNie
 uny4Ad/t77bWpCu7BdH6WUsx+/PCS/80suHq3LnnIDwry9vXgyNwBuW/MZkwDuUMyCBA=
X-Gm-Gg: ASbGncuZMlPBpf6FoL6co6o5D2nQKDSCIKAOVzMsZVhkTkNbCQLakNQtBhjzlSdLXg0
 TghUIjVGGH6YNDIQaOkGXllz35j3xB2Bz0DOrWfuaJxu3UVHeQ6Oki9+Q5kyll7yR/eRSoLB95f
 tBG+iRjAddRPV6jT9lyUSrVoyxbreS8pdaMrulUf+hSYEM+dhqUoJVqhqPJRG5f49uh26OT7tnk
 DGafhlXJlTyIw5i2ENvQyeYhDEqKjqHBdhP4sMbyluKYT1dIDVKmsk833qTIOr8tSJauuxSdPzI
 xfC9SMRDKJBqzD7b0TXcXjdts2abro5LO0pV5+6AsdKGWGmgN3bYRDn9JKu3NqY23g==
X-Received: by 2002:a05:6a00:3cd6:b0:736:b402:533a with SMTP id
 d2e1a72fcca58-7372236e186mr3540559b3a.1.1741970157001; 
 Fri, 14 Mar 2025 09:35:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEM0l+UMyivRuTO7apt/Js32jvVewReToEC4sv6nQd34HYx9P8BQzmnqHeE+/2ENj30ipXECg==
X-Received: by 2002:a05:6a00:3cd6:b0:736:b402:533a with SMTP id
 d2e1a72fcca58-7372236e186mr3540538b3a.1.1741970156607; 
 Fri, 14 Mar 2025 09:35:56 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7371167d931sm3172137b3a.99.2025.03.14.09.35.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Mar 2025 09:35:56 -0700 (PDT)
Message-ID: <64b20037-d067-4c0c-adaf-454a68c46d1d@oss.qualcomm.com>
Date: Fri, 14 Mar 2025 10:35:54 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: Fix possible data corruption in BOs > 2G
To: quic_carlv@quicinc.com, quic_thanson@quicinc.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, jacek.lawrynowicz@linux.intel.com, 
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Jeffrey Hugo <quic_jhugo@quicinc.com>
References: <20250306171959.853466-1-jeff.hugo@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20250306171959.853466-1-jeff.hugo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=CNQqXQrD c=1 sm=1 tr=0 ts=67d45aed cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=jm2NUAHTRls9H0omj-oA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: G8OdBoN63IUBfaSijeI_DbH3mek-HaV3
X-Proofpoint-GUID: G8OdBoN63IUBfaSijeI_DbH3mek-HaV3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-14_06,2025-03-14_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 mlxlogscore=999 impostorscore=0 mlxscore=0 priorityscore=1501
 suspectscore=0 phishscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 adultscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503140130
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

On 3/6/2025 10:19 AM, Jeff Hugo wrote:
> From: Jeffrey Hugo <quic_jhugo@quicinc.com>
> 
> When slicing a BO, we need to iterate through the BO's sgt to find the
> right pieces to construct the slice. Some of the data types chosen for
> this process are incorrectly too small, and can overflow. This can
> result in the incorrect slice construction, which can lead to data
> corruption in workload execution.
> 
> The device can only handle 32-bit sized transfers, and the scatterlist
> struct only supports 32-bit buffer sizes, so our upper limit for an
> individual transfer is an unsigned int. Using an int is incorrect due to
> the reservation of the sign bit. Upgrade the length of a scatterlist
> entry and the offsets into a scatterlist entry to unsigned int for a
> correct representation.
> 
> While each transfer may be limited to 32-bits, the overall BO may exceed
> that size. For counting the total length of the BO, we need a type that
> can represent the largest allocation possible on the system. That is the
> definition of size_t, so use it.
> 
> Fixes: ff13be830333 ("accel/qaic: Add datapath")
> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> Signed-off-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>

Pushed to drm-misc-fixes

-Jeff
