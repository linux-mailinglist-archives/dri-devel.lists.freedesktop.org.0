Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC238B1213E
	for <lists+dri-devel@lfdr.de>; Fri, 25 Jul 2025 17:47:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B833210E9E9;
	Fri, 25 Jul 2025 15:47:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="FDuXdink";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE96710E20E
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Jul 2025 15:47:07 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56P9asLK004800
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Jul 2025 15:47:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 xKWzN4RQnwx1/G1Ilo0cVo6obJ0M8bE9e3o300R0dhg=; b=FDuXdinkKfnA5KQv
 iYbkuz/m4hDQp9DeCCYo4lL608fd9nTsGL9Mwi7gohEoT95AVCBP26T7sIskoW15
 Ndt3yINBjGYjMYJXx/9Be4Ff9KGP3eh75IROltmOwC4AyYT+CK84+DI5LC9rN1nc
 Y2kNUiD8hATk7lw1vqT7k2kq53EFX6OWEpAri39a0FEVCtxWu8eA1+xl935PlpNz
 wwdT1dwG6dVd1mYSLxDXQ3spswD1tA1jTZs3sm9GCi8YZkYp/ul/Q2rCNAxoekEA
 oh4WJ0J709UdS33UKzB2yJRgfuWqKe/AMFOVWhQNsz/e7nscsUPq7y/bdZEMoCJW
 PRmuLw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 483w53aj03-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Jul 2025 15:47:06 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-23536f7c2d7so38004975ad.2
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Jul 2025 08:47:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753458425; x=1754063225;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xKWzN4RQnwx1/G1Ilo0cVo6obJ0M8bE9e3o300R0dhg=;
 b=PkzQEqgpJTcmX9Z3rDD41ZI6AZjALwyAT/eZIwWdLUfE2U2swbePbXTeGiTD+A3P26
 jmKbEoKJM6omTIK4E4p+aWV5L+GfaQY8AckdZs/frQsvBes0Q+rt8x11sSuNlykD13iY
 XozGZZYZcXZOF+diQlKKLXMdcXXEIj2+Tzl4P4mtYFKpIlFyrWET+MZf3f7O2Xed5/vi
 HbymG+UVXmWKvTY+PA5yLDSSU86SrXJY/vt3rO7czUlrOBs2S+A8+vOeKFY6ps3Jf7zu
 DAtDXz/cqV1Hrb79jGWgLsVu1WdYmgxyGuGV4e/iZhNtSeqrm/V3m/SQT5goQ9R1TPYH
 OYJg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXoW+CaLAWb8S6Xul1WMIswaIXS+MNDGH17kGf+w4uGWF1+sD5fwBnnpyc+QTWAraU0gV6Dex+dWv4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzuG6AOSrnzUfI//sEg5eKqRLbNVy/qGdfJ7h/qeHhHvy+Qc7Iy
 P77njTWBO6a2u/G0LDQFYmuHSdIRLNR8ZunNA9aUSx/qJehzD93LEHLiPmPtM1CZt1GES/r8D4b
 A9hQ9a2dqWMpixqYbYSP7b6O39bmJI7D4BF+Q2GRnh5IHIwhyJB/Yjo79KjNJjKq8Nait3SI=
X-Gm-Gg: ASbGncs9LHKMUAHk5vhfU7SIYuaia3wsOLwRqDaZhyOOyg+ATp8+NEJxDmtU/r8ZVXf
 jHclz3J2eMxDlLrQvpywXSp+QvAhNSsWFhRqThpmY+6HBFv5LvG3dr5bQ1LwpIO2xNXgKxRkIlI
 S2xX9zU4U2L95YlRWCRnim1VPQ/0ThwioL0BvqowGoSsh635MmgcUMHg1X6DLNWRNOe6qr7xI7b
 JzHHpOqaMM/IYao8E7whbcRFI3H9tJHptIg4hCgQ/6Pxr9vZwZJ/81RcCVjp7TOZbZS6JEB8YgD
 9ToANoRViXmlIwU3MG3T4vUyuBW9iac+y+v/tRDq97Nq1Xlqp0bGfA19kcXM9c4REAzQbRfXo8F
 L/ZtiDMGgjIoYMg==
X-Received: by 2002:a17:902:e5c5:b0:235:f078:473e with SMTP id
 d9443c01a7336-23fb31c5555mr39338985ad.43.1753458425364; 
 Fri, 25 Jul 2025 08:47:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF3u5wS5G/nO4TNexnUpgWTgxPvcTdxwD3jiwmhhsgJT4z3eYr32MID0faDDGi1QAU8EjdrQA==
X-Received: by 2002:a17:902:e5c5:b0:235:f078:473e with SMTP id
 d9443c01a7336-23fb31c5555mr39338605ad.43.1753458424984; 
 Fri, 25 Jul 2025 08:47:04 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23fbe563f1bsm203115ad.184.2025.07.25.08.47.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Jul 2025 08:47:04 -0700 (PDT)
Message-ID: <1a8a43b8-e9b1-40f1-ae16-ec7e0441324c@oss.qualcomm.com>
Date: Fri, 25 Jul 2025 09:47:02 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: Update email address for Carl Vanderlip
To: Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20250721220811.962509-1-carl.vanderlip@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20250721220811.962509-1-carl.vanderlip@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=AfKxH2XG c=1 sm=1 tr=0 ts=6883a6fa cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=XHUaY7U8O4OWe9Nk0CgA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI1MDEzNSBTYWx0ZWRfXxktk0DnbSeQx
 C90GgicZaVPCwkR4ymi5etCNO+eGug1+ughUkrwdmgPHISo24KEulIJaKOAFjy6yyvMBlZmtH7L
 QuBEkhrfjv1mxg8EoYItdH0ng4zcYviSVb96A4BbRYZD31rp6VmB411PURamY4OUO/edzJT0bgz
 4u99G2ncqScZobCc5x889+AyyhUriQ82/QXKpq+KhWZ4fX/+b4daYJYebynUoJk7pzhptT7GP9B
 x7COVf3+anL9ZoOfVOCY2BUluW33mdpn5/vrCR5rJg0PUK5Vy8GIP1+eacjdYOrF3OWGWNqM65T
 apW15zsivG5QE+AAx+K8vzk+Oux6MqDcGJsyho2v1D2GHj2rgkMXPJ6gPLhq0HPfrKxlg0neB/R
 jgC5osr/qbZT29cRz3qwZGT43atpNV21XvYMyHPsKbQHmLPY6Y/IN4cHzaOEdk0f+yuOI3fC
X-Proofpoint-GUID: oOsIxCp89wKfvk2hyiH4M8HmU42zb-Hy
X-Proofpoint-ORIG-GUID: oOsIxCp89wKfvk2hyiH4M8HmU42zb-Hy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-25_04,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 adultscore=0 mlxscore=0 mlxlogscore=629 suspectscore=0 spamscore=0
 impostorscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507250135
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

On 7/21/2025 4:08 PM, Carl Vanderlip wrote:
> Qualcomm is changing open source email address policy.
> LKML and other busy mailing lists use the oss.qualcomm.com domain.
> 
> Signed-off-by: Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>

Applied to drm-misc-next

-Jeff
