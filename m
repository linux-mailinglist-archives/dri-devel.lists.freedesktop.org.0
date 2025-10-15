Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2709EBDF83E
	for <lists+dri-devel@lfdr.de>; Wed, 15 Oct 2025 18:01:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E5CD10E87E;
	Wed, 15 Oct 2025 16:01:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="CLHUAy0G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6215610E86F
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 16:01:29 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59FAoGlP003541
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 16:01:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 URFMyo+gK+X8VHsVcQTZUs/+BVSRA2Xa8NmiWKLmu2g=; b=CLHUAy0GwdVuJLTP
 LdAjlini2/t8LFCztKj+mcV0d7PCN9+ESDx08iLoTEIf6fofqwAniBTfLlWuXFhq
 ywgXzLlN0CrGLXFkM8DooI0OcXKgBxI1JcpypyLIIvrnXyXkIE5adBIXMXXLQIAW
 sw3iFiIsBXgyB3kxoTnVk7FO6Kbo/ZgghRt1psplGQG4+ZYwhmN9MvVNsF3L4fEd
 qzjv/Ewn02qcsw1Gczl16aLS3wIa08H7gZ8TZJzU474/a47t6mjBbQbEseC81ueS
 /i2Kbc/MuQrPJZh7+5lNqrtbOHUUNLNmZ7d7zAkiZXpnj0uLniDgBNiFezvLNDZn
 L8K+cA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49sua8kmd5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 16:01:27 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-26e4fcc744dso69608315ad.3
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 09:01:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760544086; x=1761148886;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=URFMyo+gK+X8VHsVcQTZUs/+BVSRA2Xa8NmiWKLmu2g=;
 b=NeYP2e5EJ+vEasQFUnQQxsUqlin7hL5k5DskCSJ6iXHmQ3iTtPMRAt3ADh3D4l7WZ2
 U6ddii1Q5BYvK4UDIuPspxfrFB6DOqK7OvI8ODj9XyKy7ivD0O59ekCFUFwXGDo0Do6i
 j6smOcfjFLCx6MvjYbeweHjacMsDd/npMrTQYtPP+5qhFSIR2LcdLBpl5esC/VTEcHm+
 f5/jcLFekzVJr+UgUIbyevYPUIe8bbN7Zwmt0gOZxHhTqSwxc16NxFNVJIt77I4MuYaB
 5b6SnwflKgcS4dvA1/+YhpqxamINU5crN2uOjwpH8wz4vgAIas1klke5KYYf6nRDmpFv
 QUgw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUll+uOo6ANYsLbvTi2WTuYDB5+fYeNKJSUgB59Xy10mxcR0DZDFLTlG7/FYKG9gpbfPRhX15HIxYo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwZDxu5kEp2FZgNwwWPmg+pEXRlPTp6zzTlG+rqlMCdoThGrVxt
 CkNRSUuSIAvOBfQJcQgOmWBrtq+HD7HtWBFz/i7nfCCwsI8aDq0190TDll6NmjyvDP++g5OY2TB
 PGZ2Qnrt1PDU126s6Rk1Bi5bUogW84ODrY0YTKQhO1qd4AoylVnQmzQR1HEQTlBIWwEIrBHM=
X-Gm-Gg: ASbGncuIzhQ6NrvMcRkzS209J3yIa3qESKiI86+Ou9cJ/pLJTn2zBAc/oWhWf3N3ybK
 03bxVXrfmKh+yEKV0RXJG1mlSdhNs6AvAqxZg5wHhCCuMaPKDMVDl1baknY+PU2CMX+DFiHIipw
 gRs/KaGhjZ6J5EaZYm9RJIzsSRQB/OyFzjrjn+Qj4llELqIn/ehDefku3S+1UJ7QsSsEEJUfqOq
 GrItXj2JRfgHq3NDpU6S2LrRWB8D1GtRnPZdgiZ/qhAHc//pxkxT/U1l2JSE6QKD0qoI1gHG2OU
 wk1xJlUnrLrXMRAE605STDrFhcahzzEUkk1SWzFv+VvL/Xt16iDs84EhTq9CoYMzFMJXZxda8mf
 FPUzJrkaIV7maFpMr9y3h7hIbv18=
X-Received: by 2002:a17:903:1b30:b0:27e:ef27:1e47 with SMTP id
 d9443c01a7336-290272b553fmr368698445ad.31.1760544085351; 
 Wed, 15 Oct 2025 09:01:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGqg9V3bgqm5bkdUZbBqA2G/W6EemvIf7hEz9spja1qyJKq7AUxiDDC4CEG+PIrKINJNcW16A==
X-Received: by 2002:a17:903:1b30:b0:27e:ef27:1e47 with SMTP id
 d9443c01a7336-290272b553fmr368697605ad.31.1760544084435; 
 Wed, 15 Oct 2025 09:01:24 -0700 (PDT)
Received: from [192.168.0.43] (ip68-107-70-201.sd.sd.cox.net. [68.107.70.201])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2909930a756sm499945ad.14.2025.10.15.09.01.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Oct 2025 09:01:24 -0700 (PDT)
Message-ID: <32669cb2-35bd-4755-8f37-cd315593b383@oss.qualcomm.com>
Date: Wed, 15 Oct 2025 09:01:22 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: Replace user defined overflow check
To: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
 jeff.hugo@oss.qualcomm.com, troy.hanson@oss.qualcomm.com,
 zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20251015152239.167226-1-youssef.abdulrahman@oss.qualcomm.com>
From: Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20251015152239.167226-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: RiJKuGys6o3VpMpdX5006XHFK6S2OB8_
X-Authority-Analysis: v=2.4 cv=e5MLiKp/ c=1 sm=1 tr=0 ts=68efc557 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=5tLIbcgRqjftBxpLK6l6Jw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=qO_EqxUCtCfgeaWaPGsA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE0MDEzNCBTYWx0ZWRfX6kWh5HgxA0HH
 Z+zdzC8XOT4XXqkTGj/P1ZpzYg1jpO8fwtdYwUJHYx4HKattYDUL2xAkVQMoKkSLKWsmzbMlqvP
 Plmjy8d+BhHmXlOWQwXCHyIrCtsw0Rgk/HH+NO1wavIDEuVeDsVF40TzgVgfSsWv8elzJZi4slv
 tZ2pvT3d8lGb744sx51rxCeU0msSikIDoAtwsCyLfavKXuWNlhTqBoVNDdb41MGm7AE0Ip3cJAP
 fqFdnFHI98i0W/OE26UyE1LhD0mcwsy/ncR7iqpB9Ap+AuvSGEZD4hUrkuWLXmCLS4embfW77Nr
 La2ou0MG0CH3Xw5s1Mhi7cH5ht66SbvuJiaN5RbR5n8mz4VzMIZRtlp0/aum8sIaDeMRR6JKGub
 1i4p7JD6mIutEGMBCUC3aP/q9e3vZw==
X-Proofpoint-ORIG-GUID: RiJKuGys6o3VpMpdX5006XHFK6S2OB8_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_05,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510140134
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

On 10/15/2025 8:22 AM, Youssef Samir wrote:
> From: Sourab Bera <quic_sourbera@quicinc.com>
> 
> Replace the current logic to check overflow, with the kernel-provided
> macro `check_mul_overflow` in the function __qaic_execute_bo_ioctl().
> 
> Signed-off-by: Sourab Bera <quic_sourbera@quicinc.com>
> Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
> ---

Reviewed-by: Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>
