Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71789BDA04E
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 16:33:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A10AB10E625;
	Tue, 14 Oct 2025 14:33:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="PWTeXclo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08A7710E620
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 14:33:40 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59E87Fe0008750
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 14:33:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 qAzKzbxqDfzAkYWr9ZLxclptMlt9B8P0XjiWP/VJuk0=; b=PWTeXcloVkNryC4/
 S48HGe3TUdIIpgcTqaE/X3Md0nS0AKuwX6YfbRo597/BHaXaxBlKJMcUzfoj0I4O
 Sa0ZoN/VDMHmt+HQr3zHJgP/9YfDzViZ0uPcJDC6kwKwMJNV1H3kuZo82BUlC4vX
 rY1YMBhVATQHtVeXgdPR3bIvx911WRMSMEH/iYSmU/Cf7A6gMV1ynUkldXCqLbzB
 J3tqZE4yKWFN89GtP/o1ETW/QtaimVLfLprMbZzeVwwhtQVHOvuDWPilicuDcrjo
 dW6d7Z+VQ3j/IRk8uuaK8D2bz9Ai0rZNPEiviAVmdxINflRca8Gq2MGUJGhlVxWp
 UoHp4Q==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfm5guuq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 14:33:39 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-3307af9b55eso8692027a91.2
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 07:33:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760452419; x=1761057219;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qAzKzbxqDfzAkYWr9ZLxclptMlt9B8P0XjiWP/VJuk0=;
 b=t/oNH1TkiyTTKjU/2QuqBKSib8xbBbC/LNM2gK76wbyuP8zs34sx4IgSjGyP7EKSeB
 e7xyWYmeePJ9cppwb0dtjwhE1ZScvrrc1lJTjtF00J/MKstfVyVclgvphqB7GhGZqTJG
 JeUOTLSSypWJqhoVDEjkvo+LiX5Jdyxca0Jimzmj2oYdJEwyXBM07H9p977ZI32PaHXf
 GdFUl3ueAGZFYRda2DEJUPXjLWM7fF0hOfyD+/+39L79d7b97RR6JHg+bOld0s+0jXJp
 gt5tecyRvo19j7ph5jirE6zHShFgwGpkB3DjVZ47k4UVg8RPChD/cYgfJgBBvnIPE73Z
 jrng==
X-Forwarded-Encrypted: i=1;
 AJvYcCUo1ApJEHS0NX0IgAVEC7hdDeL9FjJwgSS4ysG9yXbsSs1ND7MlN0MZPM+C/FcYKzrLUqmq+MiNhdE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwfJpbpzCsB5hikPZdQjVgqtiX+HC4iLEfJvzIm/pZjr5d/6YbV
 ZVh0IvgDU3sp4XRmZ+cMabBRX4R0YpQnrgK73Yk3xDgQuHNCSxRYRTDmOAHyxTja/i8TJeJehIG
 jeduD79odgX8kpF7sU0X+6q7YPLttq6BOtxpnrXOswlMTTDtTNoKdXhHCvKx/yKiyxpZ9ArI=
X-Gm-Gg: ASbGncvEAb2luwZ2baVts6kRhhSxVeK18IVp/R4VSakUdruCnJq9D/Y15YL6hNa7gpy
 q13JnTdzeiYI8f9lZrLU96XejojpN8GkTYQ0aW/A7buxAp+mYOlkhqJfvw+b4uACeqUVC64ffdV
 QHCvL78jNMmF272h0giG9cCAVzUzrclDlaHjHng+q4tRBTx0Go1fu3sj5SrHKnLtcGoaQf7t9WB
 rPK/H4dfI3LQS2A0hlx/f87n6+brFnaz9bhNlqsO4suqOkc//vQK5emnKcuXrLI+5ISLlCH0d0d
 pMr3+gHlrH7wl9OrT/zt6axvo4xvqFXo9BAlo6P2EphbG6+z+WdYYbBry5EB4DB+Bx6Je0UZmxG
 ye5sclwGnoErwXg==
X-Received: by 2002:a17:90b:1d87:b0:32e:a54a:be53 with SMTP id
 98e67ed59e1d1-33b51119064mr35989581a91.16.1760452418521; 
 Tue, 14 Oct 2025 07:33:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGMR1cZWKq3oXTUBikthfy+B64hVWltts966nj25RJLPKLNaduOsMk1kbBMWbVIZSLsww3vdw==
X-Received: by 2002:a17:90b:1d87:b0:32e:a54a:be53 with SMTP id
 98e67ed59e1d1-33b51119064mr35989530a91.16.1760452417956; 
 Tue, 14 Oct 2025 07:33:37 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-33b61a1d3cfsm16181220a91.2.2025.10.14.07.33.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Oct 2025 07:33:37 -0700 (PDT)
Message-ID: <a351fffd-997d-4ec8-b4bc-9279b79a489a@oss.qualcomm.com>
Date: Tue, 14 Oct 2025 08:33:36 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: Fix bootlog initialization ordering
To: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
 carl.vanderlip@oss.qualcomm.com, troy.hanson@oss.qualcomm.com,
 zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20251007115750.332169-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20251007115750.332169-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: AfXKevvqNZNRXW7NOZTuDrCJ7SpTZ0kf
X-Proofpoint-ORIG-GUID: AfXKevvqNZNRXW7NOZTuDrCJ7SpTZ0kf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyMCBTYWx0ZWRfX0CSGikf4u4ey
 RT/nfI2BmGn1+J4YMQ6r1ZJ2p6Tne1u+puPapvldA2niARF/ufdxQGt3YcuFw11QzfFPZ7w7SKf
 Vb3sAPrJPNHrHxBop4ZSikCZtMexiXIZaTUSvvh907ecUnIw72vHY+1kHr1AKL9w5RpCK+vRvII
 zVl6ikqtFw98ebKJmKTBchcwbaGZ26ESQyRzzM9Q+wDS/n9rdl4T28uk9Pm2NCj2vs28bI021xC
 2YjWLatztKtPjBgGjlofmNtcFXSi7org1ty5SD1NtJVfgMpIopkpyyLMoY0I+dyyvoqKqiyQIcX
 GvYkn9FbNT1NTkUkv1gw4/SGY2vbJqmnzyjjTvY5LYXI+LyYQJ8b/Xzb90nwUzq6xveRmCYGzb5
 sMcFYzi8QPA4ajkPH2q+1/7L8eUUIg==
X-Authority-Analysis: v=2.4 cv=V71wEOni c=1 sm=1 tr=0 ts=68ee5f43 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=haWFd_X1g-iGgqmt7XIA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-14_03,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 adultscore=0 suspectscore=0
 impostorscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110020
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

On 10/7/2025 5:57 AM, Youssef Samir wrote:
> From: Jeffrey Hugo <quic_jhugo@quicinc.com>
> 
> As soon as we queue MHI buffers to receive the bootlog from the device,
> we could be receiving data. Therefore all the resources needed to
> process that data need to be setup prior to queuing the buffers.
> 
> We currently initialize some of the resources after queuing the buffers
> which creates a race between the probe() and any data that comes back
> from the device. If the uninitialized resources are accessed, we could
> see page faults.
> 
> Fix the init ordering to close the race.
> 
> Fixes: 5f8df5c6def6 ("accel/qaic: Add bootlog debugfs")
> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>

Applied to drm-misc-fixes.

-Jeff
