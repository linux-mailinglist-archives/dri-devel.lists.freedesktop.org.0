Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57088BD6B87
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 01:21:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05E3810E0C5;
	Mon, 13 Oct 2025 23:21:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="G0c4OAVE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E504310E0C5
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 23:21:16 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59DHD9wl002433
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 23:21:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 qmKLeUx0dbcpirSMp8qcmyut11hmnChmSeuR8bgJNwk=; b=G0c4OAVErL1ng/qd
 hywyUaSGpLnFmq/+OMZ1IqwxFvBwRAti7dXk9bJRGy1iiLT5hSfFnlRRiPq5Tlun
 gMIJjbrJYg1ZpPWyaKNJ++n9zH0CE/enJcCdbzhzuheKW4Xes1x3G5xCmpWd1tbD
 5T/ahxFRnmmtDHjNBfK70D3UCNakM3GX1RcHnpxpvsypiOJ/qMhoO0OgYH+NRxvK
 hsUKXz21jHCOj4SHzPNQHWd0SeySof3dQVJScmR/EX58ikTGWAjj+bfQ7h5M2oip
 Y4pmyInVj2fCA8KzBiDyNoe14dl3wZZsL5oygWQ36qW/GTq3uXjS+WQcF7aGB91B
 /mZnTg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfdk6fk6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 23:21:15 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-2697c4e7354so89808175ad.0
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 16:21:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760397674; x=1761002474;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qmKLeUx0dbcpirSMp8qcmyut11hmnChmSeuR8bgJNwk=;
 b=S5gLV+vAE51aYzMHtbAO/Nlz9MSkRX0pbxN1LZSFuxevrCsuG8vIQ8fI8GwL8gHzav
 ijS6Gk4eMSJUy+VYxyXXk/Y9jE0AagOimBsbMJ9pgYaJPlGJdaDxDBxsB+W5VUTA2WRL
 hmwYQcwmcwGKI4tU5iDNMe64wAFaBfzfP2CcSfn554Ab5tyf4Ai+6FnjU94j0FEoojbS
 El7AxTMzCzhB2hqP/APOm9JhEZT+ORh2t0DkDU/Oh48GAThEKzmxtOKRNrje8tS3N3Lb
 b6AigrfEjdlT0YAU52xZKH/0EGCWGC/5uqXkB8Cgq+2vrfAxxkkaRtdDC61laZBVcbGV
 ZsVg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXm+qeJJVg50/lLkG+7+0i0KXWX1Sr6MnCDaUifTIWLVOPZBrBc9auASvbSxM7SLukv1TnvnZCx0uk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwG+58PxyZZ6Z8nGWl/dUQ/voYInuiCSyB3h0+ioZt3tW1jEYSx
 qoJuV6H/i3s4JZrvOK+MeFmc+NDojMKihT8wWR/B36h9jrgReskaJPIXbsLnVGw2ZigiCtYAKJW
 dbJAoKNU4EjjXA0V9CgTXFPxnHdVt5VUCBpQNgaV4034H6gvm42fK7YHS5JqZ3rol6VUF0lg=
X-Gm-Gg: ASbGncuJM+8XzuSKX3UOfTn4WZCh+2m02e/T+4jC0WYNEEt8Yy5kdv3vOz4Eu0xk1sU
 8xhv8268TUWCbE/YPnGb4iNxXa1WQwepzAkIr+LmWO0MDxQmeNW4ZL4ugVrQKr4xRCpmydQC/5z
 MKyOhhTM8JWvN8EdRMf7WcBoRd3tqDrwikouMMB4qrWkzMM3sCGV5GrSMKFum369L2DY248ldU/
 /ezdJPsHZs9s+CFq7Uevzq0730fahTrJWNEqlpb9jCrp98r7cDFIaMCeiVGULgjhvd9wBYLTSNS
 hyk8oXZOM0XMerR4f6Gy9ZSY0PQfO5BE+kzbbbKlB8t2uB6Xp6Atuc6dg/wHURGACaXeTGuAAuF
 +jTnY6e7BrlNlIOUv2fb5K5RCVKQ=
X-Received: by 2002:a17:903:1aef:b0:27d:6cb6:f7c2 with SMTP id
 d9443c01a7336-29027f0cec2mr290328875ad.17.1760397674538; 
 Mon, 13 Oct 2025 16:21:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGmJBscMHpLri8cVRKGo5hQcJ3KsF8SxJdCPTxP2I7QdeYrnjerUSKrFyOzoGOk8Uuzwvd9cQ==
X-Received: by 2002:a17:903:1aef:b0:27d:6cb6:f7c2 with SMTP id
 d9443c01a7336-29027f0cec2mr290328565ad.17.1760397674105; 
 Mon, 13 Oct 2025 16:21:14 -0700 (PDT)
Received: from [192.168.0.43] (ip68-107-70-201.sd.sd.cox.net. [68.107.70.201])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29034de7871sm144545395ad.16.2025.10.13.16.21.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Oct 2025 16:21:13 -0700 (PDT)
Message-ID: <8314b8d2-6b5c-47a7-8d15-79ec40244d3c@oss.qualcomm.com>
Date: Mon, 13 Oct 2025 16:21:12 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: Fix incorrect error return path
To: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
 jeff.hugo@oss.qualcomm.com, troy.hanson@oss.qualcomm.com,
 zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20251007170130.445878-1-youssef.abdulrahman@oss.qualcomm.com>
From: Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20251007170130.445878-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: JSwJIoQkZl62sGy8lwR4EyssVB_qOoST
X-Authority-Analysis: v=2.4 cv=MrNfKmae c=1 sm=1 tr=0 ts=68ed896b cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=5tLIbcgRqjftBxpLK6l6Jw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=owB73EMJWWjvXzXBjV0A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: JSwJIoQkZl62sGy8lwR4EyssVB_qOoST
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX+SESFy1Kd3RE
 hhpzbyGqtHurrucbGIeB8Bf5UWjN5WKxMkdU66HOwQxiMx+6Q8wrAzcLxyAyex1r4RKSFje+fsS
 qijvgeDKpiN8dJhWGiDqLi1Altp140MqleVfId3geUx3eCaHkF8SbzhJok0SKPVXOI4p01gX2cW
 ZSaaw9gfBB4LJOjDQVM1GuqWred/AH9fZ9eqKa61UklwXCNW3OkM2+amUU7FOsEDFNkkN3CtC4Z
 JTVLRvAZLrO1Cg+vXAGEJDGrbnZcvHXzmeRGAz61k9PxqIrKSwXQT3Fv09poCe4ruvc6wG3yrNB
 4ENvDfTkILLTeeQl57TZV5TZzv8g/nt6YyP+erV7WPbX+m2MDtg+rKq1BuggPhFKdf2CPsfKbqj
 3ASJuC05cSylPuYTg8dIlOgIilGZ9Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_08,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110018
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

On 10/7/2025 10:01 AM, Youssef Samir wrote:
> From: Aswin Venkatesan <aswivenk@qti.qualcomm.com>
> 
> Found via code inspection that when encode_message() fails in the middle
> of processing, instead of returning the actual error code, it always
> returns -EINVAL. This is because the entire message length has not been
> processed, and the error code is set to -EINVAL.
> Instead, take the 'out' path on failure to return the actual error code.
> 
> Signed-off-by: Aswin Venkatesan <aswivenk@qti.qualcomm.com>
> Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
> ---
Reviewed-by: Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>
