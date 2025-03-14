Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20846A616AE
	for <lists+dri-devel@lfdr.de>; Fri, 14 Mar 2025 17:46:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD43610EA1A;
	Fri, 14 Mar 2025 16:46:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="MkPq5kWO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2369310EA1A
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Mar 2025 16:46:29 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52E8M5wo022555
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Mar 2025 16:46:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 V7iC8xf8rHfTJsz/B/gMbvSBnsp1N8NKxvrp+AGSFII=; b=MkPq5kWOire3LWlq
 RT44WTSZDdVihrF+mPzUf5Z9m1Thxg2Id2PcfOWB+zZmDKtDdZNO8+A/z78HV+Fz
 m1tKZVwv1OSj7RS2PW9FdJQ2LREfLbuICM6x2rNdwf8ZWqVxGH4PnLxscDCKonad
 s64MQG8ZyPKCjBciqhhawp5zOth5s6/THmBMi0govnfu203H/5txQjCO780GA5SF
 PG6sm2ZTxgy6TAtZnIF5gyt3A6qfXQwiYWfoiWFYY1Rg6LsLrcXw2eXIRj2GUuPx
 Oom3n8+6N0i06YZxNf9Eg+SKWFsvjxlS/ua9L11Y76NtR8VGaot8UaJa/06T/HZ0
 UbIK3w==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45bu07mtvy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Mar 2025 16:46:21 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-225107fbdc7so38748875ad.0
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Mar 2025 09:46:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741970780; x=1742575580;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=V7iC8xf8rHfTJsz/B/gMbvSBnsp1N8NKxvrp+AGSFII=;
 b=UeVN1tlJwwJdqeoGnCJTe44cJ1n2yPZljl8Y/AnZY1u2eReIkBhkwNVYUK2DdEI+x6
 pwcgYJ9lKmUzjjdd8SdVuNH02HLFcFd1I1zcJ+V992F1yYaQKSYC0zyaXTb5BWiSEkQ6
 O8U7fxqyLAKC9R/wATn8Vb29lo29doDwfM5CWLb4WT3icjQ3L2IC65aWyWpubYnshFTm
 oMeOluWn0ZXCMyPLjAC9mB/50nbS1FRMVQbINADGtJzcvHZbEmrWE1CgjBG1vUU7wzpZ
 GxbGW4Ua29smZemROoSeayfqKE2Q+Cs9whxTxCaGEFgYu2RKKucYmvzQMz1i7z3ue9g6
 1KiQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVQP8guJQTQ/5apnmDrkp4abzTjTkgZdOxQwvo9GVgaJ+e3WsuaGAtwKa8yU/X2EeX7xqbiG+Gob5k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy8ZMY0hLxbbgodfGKEnC3srf6nWNRf+jIKC1j+fAQaXcU0seXl
 0HqLUcrJ0oWdOYsvWz7dM7OB/2/5yYeR2e5YsRduLii867WkJDujzwF8oToulqhEs8rjxf2K/1r
 3Fu38WxRKsh+g2mzWBM+pO4OJk/FhqJgKjaA0565j1s1a2hnVGEb2E/Ej3OyEyT6qffs=
X-Gm-Gg: ASbGncvw9JvLfTKIIn+OvvyjmAfguEIlUvfXj2Z7dBlogVMA/KxddAGNh6DXQsRugxD
 8+R2tbNV7/CqpD1pXhin2EnDL4XOAStKP5weQn8fu7tokbQgnfqOdmc5urcC5/AfEDE1S5HMtbN
 OYQlMgrY/5zpOZhoAN4FLQuGTelcsKv2VmrVYzGp9owo/RRbdcFAi4vKN5yD2k3Vx2zUOlrQYDI
 rnimKh6KJRdTWB5lWhnfTp32jjDZKFNymTSy9352ggy1YHZT5qkwqRQ00tVt5NuKyxcCiDSpYNZ
 NOo9tLu+UFwzqzvrlSsVLsIu6VU6K1O8I3+eQkK6RLjvvP+NPmakZQ4HYXFAXVV0EA==
X-Received: by 2002:aa7:88ca:0:b0:736:6279:ca25 with SMTP id
 d2e1a72fcca58-737223fd657mr4639690b3a.24.1741970780276; 
 Fri, 14 Mar 2025 09:46:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF5Z0N372C40vTLg+lf6IIyxYpGOfRFioICowlAofkGkUXQTNrit8/4263LMemsQpFAjwboYw==
X-Received: by 2002:aa7:88ca:0:b0:736:6279:ca25 with SMTP id
 d2e1a72fcca58-737223fd657mr4639655b3a.24.1741970779865; 
 Fri, 14 Mar 2025 09:46:19 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7371167d89asm3178677b3a.94.2025.03.14.09.46.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Mar 2025 09:46:19 -0700 (PDT)
Message-ID: <6f53e1f6-3ac8-4828-9ef5-dbeb76ab1459@oss.qualcomm.com>
Date: Fri, 14 Mar 2025 10:46:18 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] accel/qaic: Fix integer overflow in qaic_validate_req()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Carl Vanderlip <quic_carlv@quicinc.com>, Oded Gabbay <ogabbay@kernel.org>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <176388fa-40fe-4cb4-9aeb-2c91c22130bd@stanley.mountain>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <176388fa-40fe-4cb4-9aeb-2c91c22130bd@stanley.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: yyRcXFrcyrHJ3fyiTDushphmQwthmRim
X-Authority-Analysis: v=2.4 cv=V+F90fni c=1 sm=1 tr=0 ts=67d45d5d cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=LlO3PXAvtcZV46L7pkYA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: yyRcXFrcyrHJ3fyiTDushphmQwthmRim
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-14_06,2025-03-14_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=920
 impostorscore=0 spamscore=0 priorityscore=1501 phishscore=0 mlxscore=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 adultscore=0 bulkscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503140131
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

On 3/7/2025 1:41 AM, Dan Carpenter wrote:
> These are u64 variables that come from the user via
> qaic_attach_slice_bo_ioctl().  Use check_add_overflow() to ensure that
> the math doesn't have an integer wrapping bug.
> 
> Cc: stable@vger.kernel.org
> Fixes: ff13be830333 ("accel/qaic: Add datapath")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Thanks!

Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
