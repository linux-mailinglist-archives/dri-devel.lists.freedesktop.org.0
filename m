Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72077A861F9
	for <lists+dri-devel@lfdr.de>; Fri, 11 Apr 2025 17:36:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3767C10E098;
	Fri, 11 Apr 2025 15:36:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="dw2jU6Iw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4133E10E098
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Apr 2025 15:36:12 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53BFFk8j008193
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Apr 2025 15:36:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 I/f0AoIahJfkhGbYsJHUxeRCAL+AbEIMXiMqEigSljY=; b=dw2jU6IwBw8HcsWv
 V6X+RuHQho7kEjqtB9U/r2IyX0wyBhfGTQIcM1ncALCQT1bgGqfhxssnFFUe5qkz
 +A3YxWeX5CZ3lg++aZ/2PtiLD24yg/13X6AFFgseDfXIfLJWN1ccbO0VsTYyy3hu
 MRNqBhO1xT3PHWads/ezeOFE7Hcc/zIHZI3D1sNKZhcF0zWw9/drsjDKFGicrkMB
 Mw03lj5S3rH5aQqebQWSHpIYOTFfZbB+p2FUcimPjruHt8G/Oo4bH9iWO7qmfg6P
 fn9P4mVhUA0Cb3X6zRb/JLJAxWFFrzmOmG951o05WQoKGNJQBBlw805qt1eA5IUI
 6ucU2w==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twd0b02u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Apr 2025 15:36:11 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id
 41be03b00d2f7-b00ce246e38so2381535a12.2
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Apr 2025 08:36:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744385770; x=1744990570;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=I/f0AoIahJfkhGbYsJHUxeRCAL+AbEIMXiMqEigSljY=;
 b=XvKv9JyCl5EGmbl27/imonf8B0tPffd1/wxT81Kxx/UCaFqLuxyrqPhyaokXPBiiwl
 x/Hho6kuWGVftZs603iUhfws+fPjOEnVKoZNLjCHD6mv0G5bXJ+Z73sUbMuwTjr4vhxJ
 iiu3Zc1CBKOl7Y7FbIP2HWXKNf/JauLTCmdeHKo/xaJOe/p3cThIEUKo2cpbivROp+D0
 n6KdPcpmcHxnqCCFhVe8NpI95ivZDtShZBGOqLDtjVxk6rnfBrmqTcdwVXW7DGqMLzXa
 C9suhfDN6owUVpM6c+T551HJt4fkK+mnNR8mP0f75N+XWVDIiezIpLRTMyrsMICNIJEe
 hFPg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXbmtWBoqoRmdILrPIxL7USoF6kQJXusbJKViTKSICD6lt+b4/UHB0fadjoEH+mb4D5FBLaTxLlco4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxbmUxQdhKgSt5qvHY9LyEGqETTmi1rSgNIITBqCC58zJbVWydz
 eGlh7lke3x7eEZk3h81X4Zi6C67YBuLqz9wicYC6nTMtQVT+/YTO4i5gGcDSzmhHwIWVvhnakVy
 PWRIhFsLp/3Ni3EYXmpCBcU3EQ+xHb/IGPrZTw2bjjpcRjoZ9wWHVm8IinMZZ7h9FTTc=
X-Gm-Gg: ASbGncsP5IW0yBAltYD7tWZnSZt6qu3gMBStrdEdPUeV3Qd/gzxOCXYi0iuesbfNU1D
 R0iaupdBR+XUlhFK5BgEgi2tG+mo31OhqmBF+HIf3+HD2JaIoZ21+Fd9ajMT/6niBXpndm7onZf
 F90TRDqCPQ8K2lH+KmhlvzJkajSiD0KGzMR2z98G/M5uhGNbrttTw0YI4MWpoA98MG87kwpg5yS
 k5UzfBvNWlT8W625kS+8UprWo2gXEaNrfp8NMiAQbIDVD+Z4N3D0rtJT351oK21kAp5b5X/OJTH
 KcQNRMoLp102fcUrGLi2O8NYNgxToruYqx1YFTIimZ+4WcfOth8Ny6xnfDyj3A==
X-Received: by 2002:a17:90b:1f8c:b0:2ee:df70:1ff3 with SMTP id
 98e67ed59e1d1-308235930d1mr6367270a91.0.1744385769797; 
 Fri, 11 Apr 2025 08:36:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH7jVoTk0bgA2blmCpqsRfRAq5Raa4igq+CHmM0l5hT9aUMWE7n0pyovhqVx2qrtaLDVK0K4w==
X-Received: by 2002:a17:90b:1f8c:b0:2ee:df70:1ff3 with SMTP id
 98e67ed59e1d1-308235930d1mr6367230a91.0.1744385769368; 
 Fri, 11 Apr 2025 08:36:09 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-306df07fd69sm5745231a91.17.2025.04.11.08.36.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Apr 2025 08:36:09 -0700 (PDT)
Message-ID: <16a967fd-a787-40a5-a680-da6cf2c2def4@oss.qualcomm.com>
Date: Fri, 11 Apr 2025 09:36:07 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: Test for imported buffers with
 drm_gem_is_imported()
To: Thomas Zimmermann <tzimmermann@suse.de>, quic_carlv@quicinc.com,
 ogabbay@kernel.org
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20250408115237.428985-1-tzimmermann@suse.de>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20250408115237.428985-1-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: t2yMPL--ynQclS0FtAQ6RQCYTpeSU1Z4
X-Authority-Analysis: v=2.4 cv=Q4vS452a c=1 sm=1 tr=0 ts=67f936eb cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=HMLxokm-dE5sQ3OGyH8A:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: t2yMPL--ynQclS0FtAQ6RQCYTpeSU1Z4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_05,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 phishscore=0
 bulkscore=0 adultscore=0 malwarescore=0 mlxscore=0 suspectscore=0
 mlxlogscore=824 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504110099
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

On 4/8/2025 5:52 AM, Thomas Zimmermann wrote:
> Instead of testing import_attach for imported GEM buffers, invoke
> drm_gem_is_imported() to do the test. The helper tests the dma_buf
> itself while import_attach is just an artifact of the import. Prepares
> to make import_attach optional.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
