Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0AFCBDA3F6
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 17:12:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2316210E07A;
	Tue, 14 Oct 2025 15:12:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="R86WF9W0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C76F610E643
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 15:11:59 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59E87IKB005410
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 15:11:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 GOaw54+GyvB4/lhEX8P2neuiKfXjGA142b/PiS9SSz0=; b=R86WF9W0f5/xtk5D
 XX2lAB6AkykZgkQm85zM3+m9mcFG4FjEeJ//ViUCRNhC2qyEfF8ueeuAxA1V0UZS
 TaickaK1ur5ol2IHuu5D5+q7IvmowU+8WnA6Nq2C6fVu1CfB4qdDGY3XnxHNeFfh
 l04MclUDm/FS+S6M/Tc9F4Q+24l/lkFZAsNsEUXnkfv3tClwIHGrZJzMb1666InS
 xbpCBEX3iHhmDJAABJeZpzmDCr8KQM33HVkL5zSp67pYpFxM9qomdXHtVxZKrJmb
 suEZUc0wYyZva9+TU6PpeZJe6rivpcEc3KC+wlaCR0f0F8cCfKqnPcNDlCVpdJhI
 I3LJ6g==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfbj0yq5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 15:11:58 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-33428befbbaso12330710a91.0
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 08:11:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760454717; x=1761059517;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GOaw54+GyvB4/lhEX8P2neuiKfXjGA142b/PiS9SSz0=;
 b=H1iCwaMDgc9w6i2A2B+VjcaIIi5AQCHJRN2DjCwUrn0Y26IMhgwEyP2uxUjMIwGteN
 0M0duLpt/x0aF4jlorMMiRu1pnWPsMrRF7P7nUk4oj/bhnEWqbxf/kmEnnST1n9HINbj
 cdZXTlCr4BAypkENXfinXNzeTOZtKWwdkggXiIARD4hvjJhpsoKUqeZ6YTNFJYuXPYr8
 MT4LIo4DhlkitHEM7pl9eTwf71AjaL9Ru5AWRE9cb0P/WETgtAK+Y1OjapSCc/Gg/e6x
 ZzAHaoSOVMz0f42gsFiFnlZEemDvgynj/yulTLbFgDMAZTaGHFjfHTfEUSTLsRoanqqS
 M9Mg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW/ZyBOC3jg/RrEqjkVVIL9F5Z9EEM3muh8QR57L8qNvXc7du0M7KWT7QrhpDAzCvdEieCXg1goMOk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxExbbWYpaHp0cpGTrHHl9gjrLneM5STeh5eQsVmxVJr2ttx5pY
 +BWo9jUwXHD+a4UfpPME1pR5LLWTyVbranDLnXuMu2mwaozz+rsGAY9Jius6a9c9Srm0YKLYYnw
 Zk3xQDefGvRW0cTol633NhXHpqQX1z6X2bM9n8UOZn6MPxz/VhckUEkzrdqa7eVpw2VXxh+3ejm
 +Mx7s=
X-Gm-Gg: ASbGncssJ6P8n0IZSU6N1rKVEG5wjgA0rSOeSEbCxXbzfX7vlznbEjWLr8qwuRQVePI
 LEsQs7CuB+LprYnhYHDb/WwzYdcrfY/hCKyf3VYRKqjZF3VUZMFaER5xfXXV5iuw8Pmc6cZgH4B
 WtLdovtUjR0Jt5q9pobgLjHxYktlfONzRl7NXsEnW95ckWlFgmkpL/fvVcMBkFljIPvxGdAjOz6
 WYDVBvuOWuh6YSnP6ePzwIa/SUxsQr1Zhywm51veCj47A6QXaemc2lAU3BE3sYjABO19EMQpeov
 1nuumwBj3g7LJvEdpfkrK+VODT3M4aPbnia/uuG5D3GKs8X2FCyMQVRhknaYyIsVe5QZL6YtG8R
 ZKmp6EAUfNrf/Tw==
X-Received: by 2002:a17:90b:1c0e:b0:335:2823:3686 with SMTP id
 98e67ed59e1d1-33b510ff59bmr30318695a91.2.1760454716873; 
 Tue, 14 Oct 2025 08:11:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFtjZf3YduDUFftq8D9vl54/Qj2lBCEThZgoUnbV7KXOedRjfTSpvK6arvWPi0gwGopNWtriA==
X-Received: by 2002:a17:90b:1c0e:b0:335:2823:3686 with SMTP id
 98e67ed59e1d1-33b510ff59bmr30318661a91.2.1760454716278; 
 Tue, 14 Oct 2025 08:11:56 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-33b61aabbe8sm16268963a91.12.2025.10.14.08.11.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Oct 2025 08:11:55 -0700 (PDT)
Message-ID: <07a43d80-5158-4af8-a475-788e980a32c4@oss.qualcomm.com>
Date: Tue, 14 Oct 2025 09:11:54 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: Remove redundant retry_count = 0 statement
To: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
 carl.vanderlip@oss.qualcomm.com, troy.hanson@oss.qualcomm.com,
 zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20251007161148.422744-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20251007161148.422744-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX/S9tynbdYBx9
 lqwjskMZ+EuRtYQ/g8UxubKQgHi8YS36AX22BSTmieNW9NjxWvQElE016c1WG+Qd32Q5N/mVACk
 8PK4PKPqded3L8JDFbwb565QOMUXjjBV5i3iV33pVjiMoRgOUdXnhESCUE7mI967lmgKoeB5OCx
 XBzvAz8dwE6b3ZiQyVtBcV4B3xM++0TZtQat4jDfsfqkAVHBKNdKTbLRI2JTAwEoP+Ru9kiDQEs
 06udIzgNpinMlwxrj+eyuNtjRk6n1qwtr+vqWDxzcd8t8uks6gdLnImDNFIn2UUKrxcvA8IUdJK
 A85XcBaicerO7Si/JL91AyjyLNQo1+U+ym2ddrSu7fGJd33Yb0zlaJYdkMrNDXQY5XJlaZ62vnp
 NNB5O93CL9Cd69fi9nWvRSEXNPtUgQ==
X-Proofpoint-ORIG-GUID: QtIsll2SejCFBQBZdEIRRUt_napN83C4
X-Authority-Analysis: v=2.4 cv=bodBxUai c=1 sm=1 tr=0 ts=68ee683e cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=mnYluDPEoM_Hn9eIMYsA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: QtIsll2SejCFBQBZdEIRRUt_napN83C4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-14_03,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110018
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

On 10/7/2025 10:11 AM, Youssef Samir wrote:
> From: Youssef Samir <quic_yabdulra@quicinc.com>
> 
> If msg_xfer() is called and the channel ring does not have enough room
> to accommodate the whole message, the function sleeps and tries again.
> It uses retry_count to keep track of the number of retrials done. This
> variable is not used after the space check succeeds. So, remove the
> retry_count = 0 statement used later in the function.
> 
> Signed-off-by: Youssef Samir <quic_yabdulra@quicinc.com>
> Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>

Pushed to drm-misc-next.

-Jeff
