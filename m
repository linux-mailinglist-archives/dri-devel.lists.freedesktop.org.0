Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52348C412D2
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 18:57:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE1AD10E1CB;
	Fri,  7 Nov 2025 17:57:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="JEpjZa/O";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EmkGdR+n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BB5310E1CB
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Nov 2025 17:57:18 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5A7AWpQK1864653
 for <dri-devel@lists.freedesktop.org>; Fri, 7 Nov 2025 17:57:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 JNZGC633VqLDVToRc2+58VD4YsWuRK9aRk0gQMx3vZo=; b=JEpjZa/OAYhG9wh0
 2eqk4Rm5NHCiGFZAxtPjfV+xiwGJyJ9BDORg/8VW2TRq0z/BTqkVvje2+s4MbJMw
 zgA39XmmEI9DgrWyiK7TdH4F/GJR72QU6fMLS9AOehpeUV02Mk3OZh1Y0ATeTtVX
 BlcY9Z46VC1hz7ck3utgMQ+LIbOcDLz3+s58vvB+2aKOg4koSHEmWhvl9LXIESXH
 zI+8mheVsB9B8ingi7ow0sohbeA27TRlHcmb4CJUc8vAXUYUh7H5QEaWyHX9ux9v
 0vth1N1hGlNvvxhMOjxbuoTNvY6pJc2EPT+QV6atdT2TCiMOwHReR0rYnpfz755T
 GYQySQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a98ta2csw-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Nov 2025 17:57:17 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-297e1cf9aedso1806485ad.2
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Nov 2025 09:57:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1762538237; x=1763143037;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JNZGC633VqLDVToRc2+58VD4YsWuRK9aRk0gQMx3vZo=;
 b=EmkGdR+nja7Gixpa3t+3KrDqgzSJp7AZBSKqN0XotdAiO3RVwB/ajOIgjc4kIgog9z
 UOrs2I3AxDszeSuWwP/1UYeHnxfBEb4LHgxQcbmoC2kj+vVUVnZ/1m2OIdgF3bQ8JjjF
 FDQYn9cYWPlG/pQqhQzG4dnygOyvBKC3LUGZM/SWzXkrc+AWOKW3b6dfehT8+sZmsByF
 SKKKqs2Ru0+vwEfhXudAb0i2yY3G/bH/oMsojwzxuNRkGHKlMbDDmXpd+X4VNg6asgDP
 PlwjRjhqDTiIYRlmnDLOAYUpnzpSp3EYbq9pBybvChDmqVqpT6WzCs5GhDwMkj7+yNh9
 +cdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762538237; x=1763143037;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JNZGC633VqLDVToRc2+58VD4YsWuRK9aRk0gQMx3vZo=;
 b=JvygAHtG07TcabAc0S1bhyExaT+ELL4tu99d67+3LjpxRRp8LlMVSrlFy26GzP0+3S
 dyyvzMfZPXsUUMzLUDlJtsARjUxH0zZLk0h0E19aWPqBAw4n9HLUan284AEe85//MXj5
 XwtS9fq5MkfiJiUvP9fU9VZzsWKtORMVF9NPp2ODRdfaitqUGcDZ6/MBx0TSNlAEtchy
 +LyfFj2DneIuluZGlOCpf0jaNeIzQrXn5uLVCEk/EYspnmdbD+kX9umOpiQX0BeSHl1Q
 CJ28dyBu653w0i5qcGYzq3ENZTBV3DVcq/PkOp6gxrOax8F46x2NLHDdA+8qf2FVjczO
 hsIw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW7Pcv8vgb8XG4Ywo8ZsaYhsJzxMZ04osKVkSFqF/5duv9G2oFjA1Mnj8ePzhlgt0h2n2UyB8zE0f8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzMM02uuZuiZCIvl1UaRQTGnbHpoDg4v9BAYFi7MlwgV1iRWPGr
 qArM84MleUsm+oAWq+42EV0PZWE7fdmu78qiuYUU9aJSnePd9EAVp5jxbz0bQBnV5e+ZUU0P8nh
 zShrkI0j6edyq75P6W2PYVodw1VPmqxKj1mPJYpKDEZtdAxeNOz0gkKBbhaZWMTvFWAGrmqQ=
X-Gm-Gg: ASbGncscQ08POlJE3eqFQIvThY+Axwa9+GFsHkJE4wgKk0edUXREDjnm08dudTEu0YZ
 QVllo1mJdhlEOW8hX2TDYnnEP1sA78K/BSQS9mrC4TSHmy96G2mYFW0NQUVkyWfXFw16Ny0JE6U
 tzmXtokxL9hVVbwyQnlnKb8+gxCZYF/4/r2uEQRLZcIJ960asE9JJdK9CuoYDrrliq6sPLQ+grl
 AFTTHOXgb/cMnMcn5+XbQaArc+9qW3hZHxbcVS0hsFRzL3SVU/Ck0+gmG8jldlwmQ/KTKHjixAi
 iBFOeqG/A4JeTfLWHKu509V1nobQw9S0XFUWGNcLTg0bGyEd0/W15bqHwZc35ohhlvSGT9skLXu
 u0uDVSTNG6PKP3RoRZlKwrpE0ENaTNR3BBzxOYq4NdBOS20egfB/A
X-Received: by 2002:a17:902:f549:b0:297:e1f5:191a with SMTP id
 d9443c01a7336-297e1f52541mr3192825ad.17.1762538236775; 
 Fri, 07 Nov 2025 09:57:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHMbJ7e8pj3Lmk4ZZUYgAKIsiMJG48xVqamaloif0B9S3Yu+inP3lg2TrU5g3wDUVRpcjzq+w==
X-Received: by 2002:a17:902:f549:b0:297:e1f5:191a with SMTP id
 d9443c01a7336-297e1f52541mr3192485ad.17.1762538236262; 
 Fri, 07 Nov 2025 09:57:16 -0800 (PST)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-baa3c2d92a9sm5063602a12.20.2025.11.07.09.57.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Nov 2025 09:57:15 -0800 (PST)
Message-ID: <c29c9c3e-cbc7-4103-b95c-945a29ca2880@oss.qualcomm.com>
Date: Fri, 7 Nov 2025 10:57:13 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] accel/qaic: Implement basic SSR handling
To: Zack McKevitt <zachary.mckevitt@oss.qualcomm.com>,
 carl.vanderlip@oss.qualcomm.com, troy.hanson@oss.qualcomm.com,
 youssef.abdulrahman@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 andersson@kernel.org, Jeffrey Hugo <jhugo@codeaurora.org>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>,
 Troy Hanson <quic_thanson@quicinc.com>,
 Aswin Venkatesan <aswivenk@qti.qualcomm.com>
References: <20251031174059.2814445-1-zachary.mckevitt@oss.qualcomm.com>
 <20251031174059.2814445-3-zachary.mckevitt@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20251031174059.2814445-3-zachary.mckevitt@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA3MDE0OSBTYWx0ZWRfXz/yf2eA6Jniv
 gHiJT85Jcyh67+kbiAF3uKwoV5e2ImWjui+QmCcC93fZ/CgPfXQDVAE2j6ndc0MEZt85GPGrwIf
 Wbl4KLdxeKYmatzzK2nk2b6QwCfsLkR4uQU03DUgJLvaq0PALUtfyq6x7WjI9OIaBmscazC11sL
 wvk1Q/92Q7J78hEq23CzrpHMxob8x5e6Xci0xYLbC4yU0KTH9OIxroJ97vrgzwvOs3La3VvfYwO
 fkxqf+iJJ+8beICTEmdsynqwhDYNtOHraY8Imcaq6AgJQ+H8fQDYIfCddb7OuMZaD7lkywNb3PP
 sEGUMCXUzddh+J1aqZseF0FprQ6a1FsECMqtzWAdrjR6BCzIx9tBELx1eJ7t7Siw6748lYMWL6U
 A4VPMO34jCg4BJNhSoS4JGDcUzG4IQ==
X-Proofpoint-ORIG-GUID: AU2hPSU0m9MGnfsbHL8RyDQnBWoWxQrI
X-Proofpoint-GUID: AU2hPSU0m9MGnfsbHL8RyDQnBWoWxQrI
X-Authority-Analysis: v=2.4 cv=G9IR0tk5 c=1 sm=1 tr=0 ts=690e32fd cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=LpQP-O61AAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=iv-_qsQ2nCPXPxgN_3cA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
 a=pioyyrs4ZptJ924tMmac:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-07_05,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 lowpriorityscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 clxscore=1015 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511070149
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

On 10/31/2025 11:41 AM, Zack McKevitt wrote:
> From: Jeffrey Hugo <jhugo@codeaurora.org>
> 
> Subsystem restart (SSR) for a qaic device means that a NSP has crashed,
> and will be restarted.  However the restart process will lose any state
> associated with activation, so the user will need to do some recovery.
> 
> While SSR has the provision to collect a crash dump, this patch does not
> implement support for it.
> 
> Co-developed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> Co-developed-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
> Signed-off-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
> Co-developed-by: Troy Hanson <quic_thanson@quicinc.com>
> Signed-off-by: Troy Hanson <quic_thanson@quicinc.com>
> Co-developed-by: Aswin Venkatesan <aswivenk@qti.qualcomm.com>
> Signed-off-by: Aswin Venkatesan <aswivenk@qti.qualcomm.com>
> Signed-off-by: Jeffrey Hugo <jhugo@codeaurora.org>
> Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
> Signed-off-by: Zack McKevitt <zachary.mckevitt@oss.qualcomm.com>

Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
