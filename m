Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F190AB0DE91
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jul 2025 16:29:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39BE910E02B;
	Tue, 22 Jul 2025 14:29:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="lj7T5EAb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BC8010E02B
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 14:29:45 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56MADarH005659
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 14:29:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 FzPhboyOjslZUt0VHvhF43FfMzKfZPvUsmiSEH6qne4=; b=lj7T5EAbtTYnJ8lY
 OcKfaaqAg1a6mhmvAKblH2UwnOecvy6XcsyK8vx1sJicghiCPEFeka2t6KcMb7zt
 cW0ldg00qmlbhIhnPo0ZPyx0mbCqy2czHksmu73Fxx0EfKOXQaQSA91SQscKhZQL
 qVvAk/bxSc2bSbeZ4lymUddmDZN2N6AcewFEDH5/dlU6ieBtUtNpLJki+TIcJb9P
 iifHurbGqqXf2WjwNXqDQye0Cv6qiTAbC2B5PNTWb3deRrJiELLygWUs2W4n/bus
 q31XA+ml2lWgco7As21db/2SXhBxpWMsEnSNE2/r9ToqDIa32gAlIREzyN3DOzzA
 9vk63w==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48047q9sjp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 14:29:44 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id
 41be03b00d2f7-b3beafa8d60so6976836a12.3
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 07:29:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753194583; x=1753799383;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FzPhboyOjslZUt0VHvhF43FfMzKfZPvUsmiSEH6qne4=;
 b=aLhdZPwa8dUoS3wZFL3CK2LHviumr+a7aEpq9Vgx3fki0Z/1oQ6h3PE0chGPHmksoD
 WMh2Auh+0XaIy4+kEVrqr2zDjdJlbpQqRexXEZ6rxwkTlwe+k4oC/DsjE9UjfAmphLBH
 +Rb/a1kluVCfUCaLYJjihgYVnB6gDRdXOMXBJ8FxRZNmUrBpQCRz8NXABjp0X3cftvg5
 7snSMsQxoPk2EIGnqmowX1OxrqD9tGpzJ7onV3P0a0SFWAtZJj+mkr0+m4zkcFiWMp/l
 Mc2+YHxE6fDURSPLonQr11liI75elMagMHD9NNagnoWBF1uEfw4W1CjKVFht7AVATuDc
 6EDQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUhSyuBU+FLf8vchR7IMAQiFe28pgpN2u9S7LUUL50hRBHgOMnzpHeX25pHFxAXcUi2KAEML68Yoe8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw4aT3V1Q4bt9v7p8vrvqfWGPZTwx2NRsPYToI9QxBRpxdIoFlK
 uSZkXGoNvuik+oOgLnj+ZLw3s/8VC82Eid+k7r5iIP58IoyvQ1Q/Hui+XHuzoQZ9HcjlfkvD+mx
 +S2Jr48qO+7blOtHewXltYPePDI2nIEZu+ARo5+RvTII7XuECMmPl78E7tDamCkjztLLR0Og=
X-Gm-Gg: ASbGncum+WqVMr5nloLi3JgH4U+7PL3QgiRkgnNkUEsGTy66Y1tWy8QC87UQ9YBgtmf
 LOPkX4rOqefqP/hdtrVb88Gxob2J9Ut6rWT0eB837BFjXrjrN4Tlle/qQKmRmCox7JX3wWDtN3I
 VaRyq6SZCFSCDk8W/QC9ZelNde2qVNdCgIIlpsV0ydBxB+oy/QcgAGjnWTGvUgronpbfuNdb/Wh
 aATrsQfA0DcjeV/jeYvzpUy3k2Bejee6nuaXu7z3kddI1PPF5GsCqRTUu+hVZbubt/ZFKkPgbCB
 trXZ2KdYVm1umpbIpFp1wJzGIw8Va+uJrQLPUOjuTc0xsjpuVyeeGumm8wh6eUUCUn7+gj9WKIv
 z0Wjo/DVhWZpShw==
X-Received: by 2002:a17:902:f785:b0:235:a9b:21e0 with SMTP id
 d9443c01a7336-23e255200a6mr393318725ad.0.1753194582950; 
 Tue, 22 Jul 2025 07:29:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG2b7G6eNgC1oxJdeC6LGJ0xVz+a9PdxklFhiJXvaqJNZPCy6ZWWTPLxxcWZx3Opj/2cSX2/g==
X-Received: by 2002:a17:902:f785:b0:235:a9b:21e0 with SMTP id
 d9443c01a7336-23e255200a6mr393318415ad.0.1753194582490; 
 Tue, 22 Jul 2025 07:29:42 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23e3b4adeb8sm78707285ad.0.2025.07.22.07.29.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Jul 2025 07:29:42 -0700 (PDT)
Message-ID: <67824fb5-a7b4-4635-a2f3-43929a35f1c5@oss.qualcomm.com>
Date: Tue, 22 Jul 2025 08:29:41 -0600
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDEyMCBTYWx0ZWRfX52IJqHm2+J8o
 LS4SK48w/rMVwxcgYZZ7VLu7pjZQixJxmH+xmhpGjjydWJjC+PwjlJVsw00CVa3CFc+ZPMVtcAU
 7gSr0bbkVTqPJo6eoVuaXYT4G1jkav20BsKR2/gY4cH5EkT330I9MAax/ina641d1/2u+vkiTuS
 ffDCVbjjZQMwBHXfrvIgpSrfYEYuReePwgRjdPDDjWbvjenC0huKbcHFOuLApcCImLN+dwYdc1K
 arnmh4JchQQMY5F80/LjBv+zWrB3jB8/KEpSW6fYRirqhk4cyGIpoG9RfCueYFZSHCL1myaAzgv
 Xbm1LJaNPcX7O+u7kxQkGLcPvSVo+yyiVugDpT+cz+tx0/JS2pjvMVZcEmScUu8oHNry7lwSbIZ
 q1IokwQosFFu8v61mJ4UCJV6ep2t3X0+67HWogD7FhJaJdp/OG6BpaBIb8J/QeeEHHOimUrM
X-Proofpoint-ORIG-GUID: P3vzh37LQ7t-oJZTxNW64KOkcVQ4sPZ1
X-Proofpoint-GUID: P3vzh37LQ7t-oJZTxNW64KOkcVQ4sPZ1
X-Authority-Analysis: v=2.4 cv=IrMecK/g c=1 sm=1 tr=0 ts=687fa058 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=XHUaY7U8O4OWe9Nk0CgA:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_02,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 mlxscore=0 mlxlogscore=561 phishscore=0
 impostorscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507220120
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

Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
