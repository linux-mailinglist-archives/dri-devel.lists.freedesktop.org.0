Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2CE9BC2977
	for <lists+dri-devel@lfdr.de>; Tue, 07 Oct 2025 22:07:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 003D610E37E;
	Tue,  7 Oct 2025 20:07:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Tye7mnw5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2193F10E37E
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Oct 2025 20:07:09 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 597ETOPY031900
 for <dri-devel@lists.freedesktop.org>; Tue, 7 Oct 2025 20:07:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 VzeQzWpNOk4pM+Ce37scgMPJfDyv5N9sHsZTpLdwn6Q=; b=Tye7mnw5v9F7khAd
 rz2FHGAsHsw9AEIufsuPeSlduWHo2hBHDh4L42cnQX/5NqJ4Li+2ZAJKsyFaGAT6
 pEfoeXNp8mu3kUUBP4ltD90v6VhNyBbRyGm/U82e+L59V/dc1Fkbmyfv/rxPqEXx
 TSmdfIg1c+gW+ZyOe4OOxPM6SSn7BD90VNRPhtN8SEivzO8nK64Lz63M8tM+8fFz
 CtM6xQG+jXkGq70EkrqNZLrNxGQOG87f+8sJHMcGbqNNv6c3LE7hLllSuEkSvuma
 uRdfjGgCSHE1SWATLhdcVaid+v2P8n64kdF097NvcQtym/Bry7tKGNjphtcgsT4E
 zoQU0w==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jtk70g56-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Oct 2025 20:07:08 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id
 98e67ed59e1d1-3324538ceb0so9263453a91.1
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Oct 2025 13:07:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759867627; x=1760472427;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VzeQzWpNOk4pM+Ce37scgMPJfDyv5N9sHsZTpLdwn6Q=;
 b=TAB3oLhib+6KUdXaLk1kzFnY+bV+joaaq797Vdr0OHm0+87gO+AGXOGI4kwfPyLM0q
 hiO7QnzxIjCaMKspatr9mCJ6oclpspbdobWpro75wC4dUNTAG/AFRm6E8ZvLmBoB4DMz
 +JtMDj0UqK3ywCjump9Q7W2fX1nMsieL9ct6Z2qkTnkI6FpzzPnaIunYR1s7H1mjZa/6
 wEvI2VcrX13OYG/W8RRlPZOLe25S8tTCfydQLy4i2az8afik4UxecBWqD/0+0GL9NpiG
 wRAuB+IDJ9B8JwcWLyrNqx7FkHb3OhrG38GL2vXOg1jNnKyBlTn6P3styPKHMdwW9EzE
 UDmQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX6PsM2Xd+wyWN8jwLVxpTWMfTtGpZ0Sg/5crjL4nOi/Wk3SOZS0rqqUc7snrDs4ODWLimbY8CLUBY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyq6F6jemkD+WIK4XkgScv7uYahq2F3J7Gg5wmzcxSmlrgHMmhe
 YNh43dXzoSPfzLBKEYPV0DQSzGnAYUsNDUI2ZbrQMSD3QDgVv2vBkQOM1nf9E4cSedhWNnEoIug
 a55aZCjD4dcHsN0BokLXGdDkMr/e2bcelezsw1yTXnI6XWMm7d9MDSnxNeN6qk1ZA4vuwK7E=
X-Gm-Gg: ASbGnctTdH6eAqez+HtJjwKWzrQKFN1JRTQnGsNoSLME9WmDgt64e29DRUbUfB8bIdX
 c0y/Jz8VLyDaJLdoxjII39ed89zulAWm46URbfGZRTecAo7N6sYfye0XZ9Tg98agWH06OC9dZPP
 XPlD2yl5+hXziKsiivhun4uaKqm3FOHcROLKBrAtU8sGQVZUaVIYB134aRihFfIFP0QK3vYZpcr
 oclXl/6bp79z4T4uaKsgPhuDXIu4jCDWzLbcbJdMfaPaWiQt27Xtz/xVFm9btbvwKLKXsAceRuv
 OvpzCybaCI84jZ9Ijjh77P9laxWGPgmTQ5x7JTbDfH8Hb20OLbYcPqLJOPe8Biw8r1+iN+EMQiB
 g56GGrHrAEreLJk8AjgU=
X-Received: by 2002:a17:90b:1648:b0:32e:e18a:368c with SMTP id
 98e67ed59e1d1-33b51106a8emr912521a91.7.1759867626737; 
 Tue, 07 Oct 2025 13:07:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEVeLQ0SE3NFV4kCQD8nEMTBG9ZKOa4prTYAa9bdXMfERqj5AfmrviI8Cfqrw0bRV0LIMhUWQ==
X-Received: by 2002:a17:90b:1648:b0:32e:e18a:368c with SMTP id
 98e67ed59e1d1-33b51106a8emr912485a91.7.1759867626228; 
 Tue, 07 Oct 2025 13:07:06 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-33b513ae7d9sm507129a91.24.2025.10.07.13.07.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Oct 2025 13:07:05 -0700 (PDT)
Message-ID: <cc095e89-36b1-4cfc-85bf-c391769ddae4@oss.qualcomm.com>
Date: Tue, 7 Oct 2025 14:07:04 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: Use overflow check function instead of
 division
To: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
 carl.vanderlip@oss.qualcomm.com, troy.hanson@oss.qualcomm.com,
 zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20251007174218.469867-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20251007174218.469867-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAxNyBTYWx0ZWRfX/SPwH7RtFbXE
 nZ/za1x6ozWv4X7cGWEyT8zXiym+6TEJXGb0Q3O35s5cpbYU2pr9+H7IQ9UNv08WowElNWIsPyA
 efN9ksenUsepnmvf/xtz24Fu8xtBRzmYBClwZOrX47HzJBQYEohwcEBej7nGdPYiI1UvbYwMYBN
 H5n6qAiqEeyhlrlLIMQ1za938VFbHsMmY0u+VUYzXy83K/Ww4Pg8x9cM0Z07rl2Nz2w0xe9b0Hj
 05njrMPg0JX+o+nAlpwIBKY3f23YKd17cPzS2pyajfyiMlk/aHG7TGGbFCnzx/yM8tfTtTA+5Pd
 Cb7HL2JIvapCmjWNUYbVONR4Fmp392jHrDLAVoHFHMHXqeq1BnuJOx2t7jyzFoymz5GBwi8SaCi
 y4aX0M8WgkZ/a2M/5INtb+1j7ezQyw==
X-Authority-Analysis: v=2.4 cv=do3Wylg4 c=1 sm=1 tr=0 ts=68e572ec cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=5CQhQK5fGE5c9LPSzNkA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: mAmRZpyYr2gn-RP2hx4kgC9UhJE5Rxbp
X-Proofpoint-ORIG-GUID: mAmRZpyYr2gn-RP2hx4kgC9UhJE5Rxbp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-07_02,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 malwarescore=0 spamscore=0 impostorscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040017
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

On 10/7/2025 11:42 AM, Youssef Samir wrote:
> From: Carl Vanderlip <quic_carlv@quicinc.com>
> 
> Division is an expensive operation. Overflow check functions exist
> already. Use existing overflow check functions rather than dividing to
> check for overflow.
> 
> Signed-off-by: Carl Vanderlip <quic_carlv@quicinc.com>
> Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>

Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
