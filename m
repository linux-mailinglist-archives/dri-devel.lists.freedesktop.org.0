Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE2FBBD6AC6
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 00:55:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87A6510E0E2;
	Mon, 13 Oct 2025 22:55:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Btl/Vg5J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96A0910E0E2
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 22:55:15 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59DILmQ6022743
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 22:55:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 AJvaade5wiIi5+Aot5Dny1x8sOrKeQ8XqfU1xAZhvl8=; b=Btl/Vg5JO9RpIJiq
 fzCvAB1PwteV5BRO9QSfwCtCwQuZ68ubc1BlAa2jLoLxUaqmGs5WOtmDonzFwUHb
 QjI1YD0xi6G0qIPddtyZHPgyM58Gy3hfM22uzoD+C9/2xzGEPxdegfgENzG5ragg
 o+aL/JlOxZOF7wAzqAsUxPuryjaSFkRGcWPtUCEplj8TPMjFL98YPxx95CtrLEpx
 iitlChrnzjUfUA/K9aNlG2DTnrNdxGbG++LuDfUOFZn8UKdcCk9OCyMzv4poUDI4
 ml01XaNKiyE2bU7QXgdK6m13NJut26fXHVYLpQ670gx6wpHdc1nKyGxW1hFGOIfY
 dpPKXw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49s6mwgpnk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 22:55:15 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-32edda89a37so8513252a91.1
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 15:55:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760396114; x=1761000914;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AJvaade5wiIi5+Aot5Dny1x8sOrKeQ8XqfU1xAZhvl8=;
 b=kunygu9mzvNoW0DuWXQ+mCG1L0Ta/OXgicsVDwpuGGl86COQbWHRUgsacHm64SinGn
 6skEFAkc5y29q517BvyuI8Bvh20rdpt5j2VVdM05GJ0tib7aStm8CINVDDvxGLFQZ38b
 06u2oT7j0MH2oZX5hwMcuJIDBVTjTNBxsmyC4/RfkO/TQCT7VXbQEsWPXdPon3/B0upV
 BlKmuTAmVBF2wY1aLWMG24cXJzCwveJotvCqWmFb9JqR7wYo8LGjALv6m2++Ie0UJeM4
 wtCEaqrT8gVCIqTq8IcibMDYg0gvNp6YavY8WOlLgDHaII2O5Rk6/14YGrvGxmsmtzkM
 A0pw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVScJCD8AEUdVbJshijT0SCaHk6gjB9UpXgaSXxaxQvYKrhCEF52qBQ4sVLellTtZZJLIjfdwZW5Oc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxV/XPaPQERqwWq90kRa7zdk0mwepPFt+6Bd+QNtd4m1TrcGALT
 LeU17/emYjEIvYxOjPrqs5CQlJsGCtlxMbgKDrWgjkNm+WBiPIifcrkv+7ECctAHJTy+JSxaB+0
 JbQjFmP7i9WLG8YVK+y0vRw4FsBkj7om5Dl2ZNDAfjVIAF+weQGuBr53vWLBFwuu0e0/KbAo=
X-Gm-Gg: ASbGncuC0Kve8FBKAhasyaEyFWthMsibaAJI3kmhQ/nWyyxV1Ydk/kJ44CIMvR3DYyf
 o+zCH2f5rVUvb+50cFf7unbviSWDF1f51tjF+HTrCepIGCf4avu1CJO9fEOZnuDEiPkRyXM2KRv
 GS/PF0rM+JxRFAh9aCbs0218nHU2oj+aetGg/vmPLyfJsx2aAQ2kj7ck2RkOMpskBZdeVGwuqtc
 0UbClQGVTzv5QP46nIydE462zax3MjO+FtmBaiqC3mum1z+gI2mjk/9DC9X2an868RkSp8AP4Kk
 KeHprZnCC2Hv8aZkcIliab+DRTQPx0+hU/1CVkXSj2mxjZVbFo8o05ovuTHBT/FWACLIwMBBUXT
 ddfNR2/htl95C7rMPgTyiKXRD5yQ=
X-Received: by 2002:a17:90b:38ce:b0:32e:5646:d448 with SMTP id
 98e67ed59e1d1-33b513b2ab9mr28484274a91.21.1760396114237; 
 Mon, 13 Oct 2025 15:55:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IERGLVRtfkJwQalTVYqe79Nz0FCXxHSw6T/F4eCyJ5am6YbdkaqPeme9FWs8U7Aug9T/L6ing==
X-Received: by 2002:a17:90b:38ce:b0:32e:5646:d448 with SMTP id
 98e67ed59e1d1-33b513b2ab9mr28484250a91.21.1760396113806; 
 Mon, 13 Oct 2025 15:55:13 -0700 (PDT)
Received: from [192.168.0.43] (ip68-107-70-201.sd.sd.cox.net. [68.107.70.201])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-33b5288043fsm10230270a91.0.2025.10.13.15.55.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Oct 2025 15:55:13 -0700 (PDT)
Message-ID: <1479e11d-3628-4a8d-b2ba-35ec45cdd3dc@oss.qualcomm.com>
Date: Mon, 13 Oct 2025 15:55:12 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: Synchronize access to DBC request queue head
 & tail pointer
To: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
 jeff.hugo@oss.qualcomm.com, troy.hanson@oss.qualcomm.com,
 zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, quic_pkanojiy@quicinc.com
References: <20251007061837.206132-1-youssef.abdulrahman@oss.qualcomm.com>
From: Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20251007061837.206132-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEzMDA4MyBTYWx0ZWRfX4ldK7UB9UmGF
 1G6+Qtz/+mOsI1tVi7Cr2u7vold6uTcTtHzCcsiiUJaokpdl1RA1WO1zB3xVUjvem8Kl29QmtGG
 PWi29kS26erQb9HQWIlKt+2iaeBufZaIm4/sIrJyYj82X2VgZKI9IaQExYh3sDAzUGfllia4i4t
 cx47ylXdzxcg2/QsW7tVIfBOFZSsIGt82Zw7GDwdDwPqgR00+79zYT/U1wxNicbKAdS+4yj7fF+
 Hnv//PQTOkEI8C+pnxujX2r0zyRPisIEa4qEBq+8Wb76YMy/MbiqYNURlz5/yztNYbaRYc0Y+fb
 Z0/oAWv4Ku4R0kIh5TkfB7hldhgmKwFqflPAERmViejNQJL0A9pYLt/8otdeRW6ONV3WWf/jx+L
 DUlyGMFj7s2fbXHGASZagaEThtAseQ==
X-Authority-Analysis: v=2.4 cv=Fr4IPmrq c=1 sm=1 tr=0 ts=68ed8353 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=5tLIbcgRqjftBxpLK6l6Jw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=Oh1Qi44SMlBjVNmzfBIA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: kfLrhnYJmnzo38kV2k9TBGCL0tcqx3TN
X-Proofpoint-ORIG-GUID: kfLrhnYJmnzo38kV2k9TBGCL0tcqx3TN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_08,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 spamscore=0 phishscore=0 malwarescore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510130083
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

On 10/6/2025 11:18 PM, Youssef Samir wrote:
> From: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
> 
> Two threads of the same process can potential read and write parallelly to
> head and tail pointers of the same DBC request queue. This could lead to a
> race condition and corrupt the DBC request queue.
> 
> Signed-off-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
> Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>

Given change mentioned by Jeff...

Reviewed-by: Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>
