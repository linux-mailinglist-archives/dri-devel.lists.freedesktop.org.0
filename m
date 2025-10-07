Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1E4ABC2950
	for <lists+dri-devel@lfdr.de>; Tue, 07 Oct 2025 22:04:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF55B10E36C;
	Tue,  7 Oct 2025 20:04:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="MKLFS8nv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4021F10E36C
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Oct 2025 20:04:43 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 597ETRDV023325
 for <dri-devel@lists.freedesktop.org>; Tue, 7 Oct 2025 20:04:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Abil9l8066GokHuKaozU7cavk7jEryoaV8J4jfhSxoE=; b=MKLFS8nvsvfEhmJa
 A0PvcZNIc1kCIQvFUr9S/SU8SbVXvClU+xB19S2aPd6wE7CPmqUMp9GJ2zGyilMk
 w+6GvA0m9Nkto4LyYgMC03jrgTh2GEvHVxa6T1YTWvcb75E62G3zLLOJyif9e5iE
 e/eSJ40hg8xoCTd6JyskxnvDm+VCiIlKsUC27m7eFMfDo+0ZEsY0fcPguuNXm9pw
 h/g7Q+V/qCo81Ze4/xwDiPnMQTTw8+h3o5WRMijnh6BjO+A6qj9R+aXmMA/1Eg39
 EgNQqNmvWrsYIAREarlPfBIB2j0KOozRUYA7oRMTWHzer1LYZDogCu+HCtg6fd3v
 ab93Bg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49junu8ekm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Oct 2025 20:04:42 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id
 d2e1a72fcca58-792722e4ebeso1381634b3a.3
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Oct 2025 13:04:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759867481; x=1760472281;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Abil9l8066GokHuKaozU7cavk7jEryoaV8J4jfhSxoE=;
 b=X8/RPf4l28HBlhktv/Fh+JxoudhCXDWPU/TDo3KqjIkK+7cXKDGfawC38ornm+SnWU
 PoAwhQno7qH20D0lZEvgRDeLsBR+wFneFubOKHC82LJuRme6nDQKQixj3m8cXA8AZW/d
 at4ePFf2j711rjc3Vh7bkFuVx3/dtsgknchVAhkqNSsMcKzQyD10Pkm49j+rMlf5XW1G
 2swfXqihm0sLW9qOqHIzYkF7mMob1jAAJRHTPhR834rx68V8Gu3OU3t507nTYj81I7mW
 DraF6BiEC0zErhibmQTJ6+tuQPM+OfHZu3JDK3I52QKpKu9rBrP4tOnQlmEk02ew/Iii
 sBTw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUYHal4hqmTANtxCYq4KEBWWwrlcN7znzomxQaM7RPaf5dBU0801/PQjkk4fhJ77NTMBdk0SrtJiPA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzBWnc83ywYpFQ2geZ6byy+8O6k73P7o8so/5OJYJZpR+/HD0Zb
 YO7BRBTP9aGoyvvhW8iWjf3w8tk+TAZkcG7NY6gL4AEHsMOkCZFYFuNUZKWBmjTBStmzf1SIInK
 1LT/j2pwXyCg4cwpNwa7mzOcI7vlyvBlXrMxU6p71atSnOF6YFMhDsAoNks85RW5kHhXOZs8=
X-Gm-Gg: ASbGncu7wq0Oia0BstXuBl99OAUi4gl8UK7k73uaPMBOov0KwngMxVLVDeA4taZ8ZQ/
 7+4EOfLqwkbCltwFjobKxgVMwSjDBo2zn5XSYVCmEgi6TWV65c37NjVq38B1M34Rmf47TUzFUXV
 kKNYS4U3EmHStHdt/AP1WUVf6QC6Gwka+45qqNsp2SErgQNS6rQ/u0GkAnoC8u7y+ep+6uzAFd4
 VJGLnqj8bG+YqqWdSRwKHx88hrdpqc5uwXGndEteEVt4959V/5+tXqVUzqLTfZiYDWp2k0JYx7W
 qT4xMcpivclFfzMnCWcELW5REaue7vvlzuY2wNIjq69imygM/0sQH5F0Izv4Do1Z/DNIyCf2zgC
 v0t3EwOO6sLaV9Btpctg=
X-Received: by 2002:a05:6a20:258b:b0:319:c639:8855 with SMTP id
 adf61e73a8af0-32da80bc6f7mr783661637.9.1759867481200; 
 Tue, 07 Oct 2025 13:04:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFb5aCauV3NchB/JImGIr3TASAhAneGzvWzLKzB2WODW9O16LNteFKnwm1qlXMXDPLuE2tSIg==
X-Received: by 2002:a05:6a20:258b:b0:319:c639:8855 with SMTP id
 adf61e73a8af0-32da80bc6f7mr783628637.9.1759867480701; 
 Tue, 07 Oct 2025 13:04:40 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-78b0206ea2fsm16261097b3a.66.2025.10.07.13.04.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Oct 2025 13:04:40 -0700 (PDT)
Message-ID: <d2efc416-5d51-4dd7-8441-49e40bd1dc47@oss.qualcomm.com>
Date: Tue, 7 Oct 2025 14:04:38 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: Add tz_qti_config.mbn entry for AIC200
To: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
 carl.vanderlip@oss.qualcomm.com, troy.hanson@oss.qualcomm.com,
 zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20251007161929.426336-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20251007161929.426336-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: sndlOsMTXJMbUlXZXDLu8WeGGr90mGLq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAyMyBTYWx0ZWRfX2ix5q5HAfdTc
 kEiViQdeJV75peQExLyndCdixFwUutV2eh9CWvmE+m9ahim3iZoiMFfQVN6fW1IIzR2D3SVGeq2
 aUSrdAXukN2o+76gGm8tFkEht8XjzzTF5UCy7wtKnMZlT2OIeWdj1FgzcfWrVjYmeuNoKgLxFUt
 vN3DG+84XlgmwKMf1ojAGrbiOmkckuPiQiquPIq8IY/ETMN/r6R8uaeGBCAtPd87W8jvupCRloA
 D3Sqexs4BSGotTr5lirYVQeI8xTtikfqiCJINUFniHIUk8iI2TCjgyp/FgVcnFXjcM1ZwYIJohI
 9RdRc2mSfRja7MIr2ws8wwcZkbs0fu1G8aS9vEcgDDfE97cBj7o48WfD+A5rMFTTVyxO5qQpCxX
 BAL+qapKgjX3mMpb25N48VusCPfuqg==
X-Authority-Analysis: v=2.4 cv=CbIFJbrl c=1 sm=1 tr=0 ts=68e5725a cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=1Z0hDCcGVLcS_5OZC2MA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: sndlOsMTXJMbUlXZXDLu8WeGGr90mGLq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-07_02,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 adultscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 phishscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040023
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

On 10/7/2025 10:19 AM, Youssef Samir wrote:
> From: Youssef Samir <quic_yabdulra@quicinc.com>
> 
> Update the Sahara image table for the AIC200 to add an entry for
> tz_qti_config.mbn at id 76.
> 
> Signed-off-by: Youssef Samir <quic_yabdulra@quicinc.com>
> Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>

Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
