Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C922BDFB81
	for <lists+dri-devel@lfdr.de>; Wed, 15 Oct 2025 18:44:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C218410E883;
	Wed, 15 Oct 2025 16:44:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZU5xCOqI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B92810E883
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 16:44:09 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59FBF9rf017026
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 16:44:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 GzaI9a0N9LFuD1tLyfhK7VAWX8GeUCRnbgirvzK//UE=; b=ZU5xCOqIm7UnWJpH
 A8KkT8ke06AG7uaY7U0tukIFLZfI8e7nn/T6mwcdXIa0vdVQNdN8ejw+stiPE7Ey
 Oy5B/ZINydC+XHLMp/U/UlfAX++dAzfmteyWRPV4RRJwrfpFWaujgJWiTSJqikVD
 XMD+fDMXVfvRZjZqQbw6zkgw2/3J8Z6pEYUbA7fnoPjlkcnmzwOVlVM22emlFAW1
 zBLnEc8VicszwgpdduoUJElbSR3Nv9Ke6A0B0yybHSF/zHlq3h6ltNW1BJ0DJ9BY
 HqiLyfY1n4vgJ6J2yf9nCRQBc7HNr9aEElYbCrc2U/XhrGeZUXPyvXPG936K9ek8
 RilfhQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfdkd7tr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 16:44:08 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id
 41be03b00d2f7-b60968d52a1so18280776a12.0
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 09:44:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760546647; x=1761151447;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GzaI9a0N9LFuD1tLyfhK7VAWX8GeUCRnbgirvzK//UE=;
 b=RP6QHoo3XFNIhZvJ/Bu2HRGiQVSohHoRMmLNpL2YBmxLFSpHGHUZQdO1uwG47bgcIf
 c24lN8Vjp7LzGRVGIPoEa3OE7sAYep/2CS6HqpGdhnGGytBxhlxxRn9sK+eWN1WPrDys
 fFF655fVl1L8MUVA18kddSryzhF3E5PWJJPazZi3ixBeqCz2o5UmeE/p88Va4lOX3Gl0
 89F7uaMC/S/AcLty3iVJbOXBJcLPv9FI4jPR8qP3Ph2XTGKS6GPMKrxjTD6sUXiApv9D
 o+e1eoB8HR/2bp4Bcf3Uu3kJJ6kf+4GI8lT1eAwrJR23pCIkyziWP20CjAOgrxs/mulg
 gIgQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW0hclIgcfMVPolzRfNUSLCzklvC3rMTB5oxJwx3Lmsw9+Wj6heC2PQokv443GjNUCnaZUsQ0CioyQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzkYz/8mpoOewbTV2Q0sIL9KSWxYCQH9y3DYv1FJLKs+o976qP/
 AV2NV4wly3mZeWRC1vsBHe1LPd9VaZ1o4qlWjvVZF/P3/vQ9w+LPb/Bo1mrni2ZZ1AEmlMgSdQJ
 Tsy4YRSZbgN3YzvJnifcTJPzUGmY4cLxlGZCuI2khecu+f9Kv5TrZs7TC0uzX/mjMxupM1Lc=
X-Gm-Gg: ASbGncvYCl8lU7D92wSc1AOM+ngmh35G5v56O8mrYYhHghUx8FMdo3UZJ/tXfNdmzpa
 a550wfQR76NbsR2o9SOPNceGN/Le/cLQQ1n918YERlBYQ0H7q/83gpfJD7WQoRA2zf99rAYQrji
 5J8rzu4HbC75dUnaecst282nfbgcRmNLaffGXqYTl6OHmh81JLtyHyF8tcXpaNoQFsCf2K+nCRS
 +FqfoN+4uJhDktoRMf3ZkWys4sUREOX1cV0ioWdbjggZ4FaShd4AwV3O8RU9jHW8Hi6d5yWHD8H
 RwcH5hsDDBMFBlU/8YAGNW+hg5jPQmFUUBtcFMG2UZuJdowcdDbsKyhWgvqhefwBzfsE01tHkHP
 rHF5BIoqGwLTjYw==
X-Received: by 2002:a05:6a20:7490:b0:2e9:d6ce:e125 with SMTP id
 adf61e73a8af0-32da80ee0aemr38623884637.5.1760546647122; 
 Wed, 15 Oct 2025 09:44:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFToPLdatmPtsmDh1wnrXKMa1X9zL8hl4HwVmt4ke/y+HjLAJlconjC5RaXc/ql0sTr12jbDA==
X-Received: by 2002:a05:6a20:7490:b0:2e9:d6ce:e125 with SMTP id
 adf61e73a8af0-32da80ee0aemr38623847637.5.1760546646673; 
 Wed, 15 Oct 2025 09:44:06 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7992b63e05csm19309506b3a.22.2025.10.15.09.44.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Oct 2025 09:44:06 -0700 (PDT)
Message-ID: <6d77f359-1bfa-400e-8c9b-3413dcdb2e3d@oss.qualcomm.com>
Date: Wed, 15 Oct 2025 10:44:04 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: Fix mismatched types in min()
To: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
 carl.vanderlip@oss.qualcomm.com, troy.hanson@oss.qualcomm.com,
 zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20251015153715.184143-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20251015153715.184143-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: T5qZlph_DYzgcc8Y5e_HnQzGvwu2PRi4
X-Authority-Analysis: v=2.4 cv=MrNfKmae c=1 sm=1 tr=0 ts=68efcf58 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=-G_G9_dvTckeGbZ_RL8A:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: T5qZlph_DYzgcc8Y5e_HnQzGvwu2PRi4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX/XJ6ISuEzXvO
 7JIC5zfj5seyKuVPJ6gGrJNAtB0e967U80vDnxoPPLwDGcbucvHmjPcl1FMDteIms8yyzgnY0zr
 7i8z7H5auT29lD+JKYCNTzSae7m2G+NncA3TRUJ+tD9lNzOAtpLD2YZOs7XKpIQ5eZsF8JFudRP
 Zt2rGoH5diukEA1fCnsMqrFdUvKT/Lq5mUU++c6f4fvfQxpW3dscRB59X32vd6PcnRENEakQvkG
 Its5pn2Lc83K+zo5ZmFlS7LT7r9mpwojIv95uOjsW99mApxH70NU2EZxYVdDpHIk7jYKTU8cZ6m
 wi2NrtZh1+yokEIeUYtHpQdWyu78Y0SiryMK+1grGb8NurgMjd7nXfPPRGNyl3ZdN3/AE06aFR7
 RC7BL1MrfjzyYPJ8D/p/yCvGXbPABA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_06,2025-10-13_01,2025-03-28_01
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

On 10/15/2025 9:37 AM, Youssef Samir wrote:
> From: Zack McKevitt <zmckevit@qti.qualcomm.com>
> 
> Use min_t() instead of min() to resolve compiler warnings for mismatched
> types.
> 
> Signed-off-by: Zack McKevitt <zmckevit@qti.qualcomm.com>
> Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>

Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
