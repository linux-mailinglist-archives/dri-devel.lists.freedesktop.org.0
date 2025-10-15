Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7E73BDFB6C
	for <lists+dri-devel@lfdr.de>; Wed, 15 Oct 2025 18:42:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B70710E882;
	Wed, 15 Oct 2025 16:42:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="IIim8Kdm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 960C510E882
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 16:42:53 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59FAXBM2005092
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 16:42:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 LEzxdlAxS/RwITda/z0WVM8kwSrYjWY6px5BqYgNLK0=; b=IIim8KdmETni9OAa
 cjwYEatr+vLcJZfGxQIHEP2CaNzzmsPsjn77Iczx+dUbLqi1Hj3QX21+ftJD77S9
 h83KFb/xE/NqyY9rU5olkJrlshhoubVBeH5FRvAlNqWTTRkc/jmq4b7FGjTIawIR
 9y6Lf62DEYddEZoXRBPRFyrCB1oxHeP7gHDJQ+8J35eIFqhDmwjg6KfYGfiHc9dU
 L/W+cW4/d5vvTvsKlhA5NpLPmUFaFPlaRJPcyzjZGniVwnrHO+coMH2zUzrDZncy
 69H4rf8u5QvVjOtiv/0Jco3MZkkVpC5FGWQ6YTrEw6FyVWQCkbgb9VnD8WCpAJbj
 LWuDqQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qgdg53jc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 16:42:53 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-28e538b5f23so116117435ad.3
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 09:42:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760546572; x=1761151372;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LEzxdlAxS/RwITda/z0WVM8kwSrYjWY6px5BqYgNLK0=;
 b=WbO7oYG0Ooe8G5XDZBAlEgXspmFcxkqDEi+JkbjcRfJb1ye0tJ2NBEG09rFep7/SrB
 x14y+uxOa3pumWq5DUmUKxdr3jLMtRqY9LI0FQU82PlScWgBD0VV1jlX8MufmNmZEa9R
 kCA33gX+EJpDbw9W1D9lHlYekekltH5YTlial5rHHrrZRRg/9v6yOyf1Hs8XVTHCy5OL
 ozSY9JHxRfqQ6Rrlv4T9Y17FGiTzeGnDNcVMql9+jZ4UafHbRhRHwG2g5dpWMO8KronS
 /CEOmJsG7moWBxt7EwuzGfrS94oWTX3oKFztkWEHSklzwFm5+I5WOmrCW/jBM8FjpKqK
 zwUA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWDYzCh2wNKEHklC8/7yVn697iiq6Q57nlhk2O2poKicV4rxCys2iAXoIInHReocE5jqs4BjemLV0Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxEWIYH6JMEmiiakH2u+PWh1IPZV7mHOQzrp3Q63F8e7tFSuTH5
 9CVN7fFOKV59qTmbsq5JYeUe4h2exNIqhSiZKwhu+TNi8R+NJvZa00DVAA+sDkA4kSOwy05S0So
 4CvM7dzCQFM2DB/WgT+yBTKrWla17hcaKd99rMjWf6EqcAI9GiNoViJcJeEMlyVMwrJsfPCM=
X-Gm-Gg: ASbGnctAplrUwHOLNZgao8gsk/yxAoVfJTnbiSyyeyN+8jbTUOB/uF8eVm/3QRFZ2Jy
 ujwZSN5QrP5gGrdOYYud+kAvnu49QPMjMCy0BQGE61NGvoMB+eIGA0/MGNT169GRNZqD/NPLx7S
 XCBxCZJjGJg3khPeckri/HS9TmtKTfxhguLNB1AZzVFwY5YMyCD08fkaMabQt96yr++C9HwwvvM
 okDbTEtlad+ULq0vwn0pL6mNL2js+UYJvVc5ClAHeTSISSqJkedvodd7Y/VyELP2bx1R/bB1u1U
 ymOWrU7cWUHx9FqektMHO1125yXvbJ3me36oufNR9kjTE/R/6gdu0QSYBO8w7ynAQxfPgUNCSiB
 +TBFlSn/X5FKZaw==
X-Received: by 2002:a17:903:252:b0:267:a231:34d0 with SMTP id
 d9443c01a7336-290272e3d1fmr332402435ad.42.1760546572106; 
 Wed, 15 Oct 2025 09:42:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGMxN/y9i71nWa9T8ob8P8XCIIJVDSqIHn+u82dVZURm7SQWjwoePzRekvvE3a4My3/jsLogw==
X-Received: by 2002:a17:903:252:b0:267:a231:34d0 with SMTP id
 d9443c01a7336-290272e3d1fmr332402195ad.42.1760546571621; 
 Wed, 15 Oct 2025 09:42:51 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-290993526dbsm1359975ad.40.2025.10.15.09.42.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Oct 2025 09:42:51 -0700 (PDT)
Message-ID: <caecdae6-8845-4292-b83f-7d98b17eb43f@oss.qualcomm.com>
Date: Wed, 15 Oct 2025 10:42:49 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: Replace user defined overflow check
To: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
 carl.vanderlip@oss.qualcomm.com, troy.hanson@oss.qualcomm.com,
 zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20251015152239.167226-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20251015152239.167226-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyNSBTYWx0ZWRfX11GIP6VHDTXR
 TVDobQpDbeqPdsxtXtcGTP+WvL+pqyovluwtFKoL2Ue7owPWu5Wu2RzLMlvoyEQlpmk38m3RhIj
 xpUnkPvsWMyHlwd30pFdnWj4LffWOOtJzyCLqBkqJe7oCprRK8pjKZ0wzTDcvFpq+DKsZG8+1tw
 GN1XETrVJ+ISYp9ZCmI1kwn4IxUVVYPP0iJo+UeDps3gjH6omM+2/WUfu7TI1PEi9r59O9uzdIF
 YCGw/ASLTdXdy/GeLxnulA1MBT3n+NnAgRZe5YkjEZWNjIkCqJ5qj2aG50urRhMLObsWiEO91oM
 2DgK5AP/JiZTpAZtka5JKq1TXg45tGOFWUW6ElzOE77b7npYt9DLfPfgv2vitVw8NFUlLqDWDDa
 csLctsE3oLHlFSe90ST2UAXiQEuH0Q==
X-Proofpoint-GUID: sNwKt5d00A-J32nX1KW6UNIThGuKtgbh
X-Proofpoint-ORIG-GUID: sNwKt5d00A-J32nX1KW6UNIThGuKtgbh
X-Authority-Analysis: v=2.4 cv=J4ynLQnS c=1 sm=1 tr=0 ts=68efcf0d cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=mm7m7b9bRd1GpXE27EgA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_06,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 bulkscore=0 suspectscore=0 clxscore=1015 phishscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110025
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

On 10/15/2025 9:22 AM, Youssef Samir wrote:
> From: Sourab Bera <quic_sourbera@quicinc.com>
> 
> Replace the current logic to check overflow, with the kernel-provided
> macro `check_mul_overflow` in the function __qaic_execute_bo_ioctl().
> 
> Signed-off-by: Sourab Bera <quic_sourbera@quicinc.com>
> Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>

Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
