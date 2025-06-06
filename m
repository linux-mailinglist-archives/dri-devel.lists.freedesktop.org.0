Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06272AD069C
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jun 2025 18:25:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99B9A10E374;
	Fri,  6 Jun 2025 16:25:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="S6NAfD7H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E49310E089
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Jun 2025 16:25:50 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 556F9SrT023300
 for <dri-devel@lists.freedesktop.org>; Fri, 6 Jun 2025 16:25:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 zfn1QVQKiLHUIdJ2K7+OnM+Hl764UqzsTlMn1/g/KYQ=; b=S6NAfD7H6C9Upz4z
 RNcyE5eEnPxff/4v2v7cXL5+iiHXDLG5eumGcPeSMpXSJD/KYBm9jeoKzQ4YV5tS
 Qa1raFYpBD7IKF36d5fB1MMeyYZJgzc+UF2d1aILh7bLIXMc06hJj212cgnj4ujC
 53Xq+Ke2VEuaz1HNE4siV3/RTEVzbNBHee9M8/H4gSsCZPAcD3L4QW4VRsRVcBPJ
 tctFiUDTF/UtLxLf1j1ZcUSOJAxvuh14pCFbRqeXpsq0mR5Qb0+Fe746Yhk9Un5z
 qXAqgcremyD+LCUANLA9ND5eTBBMODF45wwCP7Vnzma+vV5EC1QkuAlllEZrw4wo
 zQ3K7g==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 472be88wfh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Jun 2025 16:25:45 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id
 41be03b00d2f7-b0e0c573531so1365766a12.3
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Jun 2025 09:25:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749227145; x=1749831945;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zfn1QVQKiLHUIdJ2K7+OnM+Hl764UqzsTlMn1/g/KYQ=;
 b=Qr3e5xnbOLVGw93m5Uu8ZrTZSem4EfjTsql+/65XtjZFI9WPrXBhST79OkCW/X1I+S
 z59c6eAV/e0/klQw+3ZiVfPm1d0uphbfCbm0OW9ziwM+/FNrRmIpWz/GARwcxe+nC1Jp
 0tla5Xq5BcMLapFUsp6GpGyu+KIVWr4VaeD37sY8e3LZ8TdTC6DGQ+fQp7cgX7sQHFn4
 wqrT25Rg1kwIPFnuZZan033VQMP3iTW9k52p3DxVHYY7JTP2Naa+9ByRpsDQQFsZJHlU
 F0PWe0aY6ltcQQ9dG3FvRd6CoLkKGUsi95CycNR49muMc3Cgu+ujE0K8SH0+IjFIiDu4
 vyAg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXX8iyMiLz7gPQt6TnhbWIUbAOQfmLRw+0GE89dDlTul+RWvLAaK48lxbRnpM5Rfdz2sQg02DweEik=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwaL7zUKGW/n9qBBS5DMTY7OXcFoUIgGfJZ/hYj1DOD1nNtysyi
 RiD1kSwc1QnM/78HQFOSNSep8tquI62iCuq8Y44NKFjVuNdF3z5IbiRT8A6NgUydx0qrca8o/Iz
 FwGKrGz6msc0UvZLHfbP50yy9ZYpFNUR+WR/EyNyWTzx5AISWinE1f5zjiFYYv/ReRT1Tuvk=
X-Gm-Gg: ASbGncvgSvlXuKSiEjo0jMMpi7OhGyUjywVOM5qjRNybNdJ1ymJ7OMVcmqygqgVAaqt
 M0COBnsCICb7gTB1OLGBUGxblSbe6NUHTLGq2yTY5zCNjaydB3bz784bdqDyuF+Bz9E+fe34XGf
 lz9kpqf+Ac8mvuz38AdfdqwOVSloHpAyOWFMwjTAyDcoavzGVC5QjfM+UOALWYFfEuYXMaUzqGa
 gXOuKxopvCp41AHL/BU+5U+mr7+Mr9Ez7TIi5v8MRNZHH5c/rDcCZWMiqm9mv7QCkR+F2d/qoGv
 p6omDSbbp6DNd0+RgdT166Dl1NRhLG5g/cj5vkYAhjO4kBaXoHweqHneb//bJR0ajbbsrLiT
X-Received: by 2002:a17:90b:380b:b0:311:ffe8:20ee with SMTP id
 98e67ed59e1d1-31346b29b0emr5977874a91.11.1749227145022; 
 Fri, 06 Jun 2025 09:25:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHp5/TnYlvyb4M14Pmzr8iKZ1ci5qsNHCWuKvIK0rgVK6v7M1LCvE2hfrlqwqQfHjtlm+gAmw==
X-Received: by 2002:a17:90b:380b:b0:311:ffe8:20ee with SMTP id
 98e67ed59e1d1-31346b29b0emr5977844a91.11.1749227144596; 
 Fri, 06 Jun 2025 09:25:44 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23603504efasm14229585ad.221.2025.06.06.09.25.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Jun 2025 09:25:44 -0700 (PDT)
Message-ID: <577fc3b0-6e0e-48df-8f4c-7ac2e160080a@oss.qualcomm.com>
Date: Fri, 6 Jun 2025 10:25:43 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/8] accel/qaic: delete qaic_bo.handle
To: Simona Vetter <simona.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
Cc: intel-xe@lists.freedesktop.org, Carl Vanderlip <quic_carlv@quicinc.com>,
 linux-arm-msm@vger.kernel.org, Simona Vetter <simona.vetter@intel.com>
References: <20250528091307.1894940-1-simona.vetter@ffwll.ch>
 <20250528091307.1894940-5-simona.vetter@ffwll.ch>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20250528091307.1894940-5-simona.vetter@ffwll.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=bNYWIO+Z c=1 sm=1 tr=0 ts=68431689 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=-sWgwtkE3efGhls0agMA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 0-lUo2RZRZxSOOk-hUxNgM-ixJwYMi62
X-Proofpoint-ORIG-GUID: 0-lUo2RZRZxSOOk-hUxNgM-ixJwYMi62
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA2MDE0MyBTYWx0ZWRfX8u+iGj3K0CnQ
 jdPLd/wbxddq4Vy5qK8g+//iJlPaLrx5vgLgWVzvJII3q3KJ0bK9oGiYm8ZONoUxP3o37Hj+LXT
 Z8SUXzH1yIUfsltgrLMYT9dLBLfIVMN+Fylg4mg1Tq7YQIRlIkG4CGvkiPmWtdhDB6qPPA6TWnL
 HNBBuCA7pk9j/+wfTtCbfyDs3jrKYmSNfrGvBLnNNBtelAj0SrJfz72m+DZV5KZgXCUCTuV3SAn
 6hYIKtv7jCEnNOoag+118r5MVAAhBcX6+jYGnUEBRwDogUWAiBcdD/nRTR051nuCbbavJcDdWES
 +8nacbQN7g9OBrYjFNknbkm7bR4d2lUT6Ikf24BjzmGspYHdR89zgYWSzK5tyPWl8+H4xG585wj
 6pbJ60NzGbfanxecAqJTLoN+nldSefSHxE1hkVTguSKt5HTrQESifebp6kvenfx2kW9ydEO3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-06_06,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 suspectscore=0 mlxscore=0 impostorscore=0 spamscore=0 clxscore=1015
 mlxlogscore=999 adultscore=0 bulkscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506060143
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

On 5/28/2025 3:13 AM, Simona Vetter wrote:
> Handles are per-file, not global, so this makes no sense. Plus it's
> set only after calling drm_gem_handle_create(), and drivers are not
> allowed to further intialize a bo after that function has published it
> already.
> 
> It is also entirely unused, which helps enormously with removing it
> :-)
> 
> Since we're still holding a reference to the bo nothing bad can
> happen, hence not cc: stable material.
> 
> Cc: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
> Cc: Carl Vanderlip <quic_carlv@quicinc.com>
> Cc: linux-arm-msm@vger.kernel.org
> Signed-off-by: Simona Vetter <simona.vetter@ffwll.ch>
> Signed-off-by: Simona Vetter <simona.vetter@intel.com>

Pushed to drm-misc-next

-Jeff
