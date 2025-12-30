Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FA52CE97D7
	for <lists+dri-devel@lfdr.de>; Tue, 30 Dec 2025 12:02:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 912EE10E1F1;
	Tue, 30 Dec 2025 11:02:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="IY+iyGdF";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DVoqOl+u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23DEB10E1F1
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Dec 2025 11:02:32 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BU545Of3539553
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Dec 2025 11:02:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=d/zHG+LMV2QI0NHjUU6ZVKAy87KQ4v4yG7X
 AbpP40kc=; b=IY+iyGdFEcaSYkCID87NKhFm1kRFQBAVgs8DiMfQ9jKB8Qjqh/x
 BnmAW+hNSo2P8iifFdH+LPYiL436ClwsH8JdWX2C9u5X4h4o6EYzttehZnLVyl+6
 vrDgnipGXKK8A3AAcDYIJIOUjiAMhl0Jx6y5Zw4lOygLhC+ady213T89g5gG7NBq
 7puB69tpyANlLtC1LY7ur8KNaSZ2bMSGSIGuisdh/SWW/n4oTzkRGRwN+Qs2ETQG
 qs89P/6Ag96IEGqslHGiK6plJqm0Y1rC2zRy9CV+8/im5am72dmek/KXHZby3OQI
 W+xnFpWz2aINNUFiDrtHZ9LevsPKxF4f3oQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bc88ygsqq-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Dec 2025 11:02:31 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-34eb6589ed2so8665825a91.2
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Dec 2025 03:02:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767092551; x=1767697351;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=d/zHG+LMV2QI0NHjUU6ZVKAy87KQ4v4yG7XAbpP40kc=;
 b=DVoqOl+u86RHQS0E2GvC8vA1ZiBAHqRjOu1oA1fJmT/Qz9M1WykF+wDXe+0jde08NQ
 T/TjgF3XJEgGYt2Lz4NZTnedovGhJQp9SMdkMhHlBgd5Bkl28FJBFjAXLl/wbMyJZL21
 fsMI4GjhxWsKNMqDAEuwmzW2UWfbzWLNvbVFyIA09F2SEEWIoFEJhXnCk3PUTnBzI8QV
 vDWnhmvbw4AilJZiFVvcPfaKSo6eYhA/YJSvq2+aklhey/ThgAOJhLi8fTG9eWQMLVyl
 pZd29OVjlHjxVi8LuCKcQ1WjvrkNu9rDCR8kza7Ui1CCF7TY/G0d07BGJau7XVQmX/9W
 9eHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767092551; x=1767697351;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=d/zHG+LMV2QI0NHjUU6ZVKAy87KQ4v4yG7XAbpP40kc=;
 b=XOQdO+hytsmp8rE6hmc26yvqdjcWAFmE0CiVte28s74rJNYbhVOIbiqYqx+/LFqpti
 gHRfRXCl/UvanJx/MtDhbO2l8/TXRBY+Ott+s02kudOJ9VvmWWjpuJX9VF2BeCQRb3y7
 6ZA105lQF5tqNW3Rxw7u6J0DBi7/cMerEPaNRPhLCWJIhVU0lmfgjdfxkEr8vfZxn0aM
 wjlT0a0dNiU5OoEdT32tGlM4ZnNiq30PAGBgsDXLMv9f3WJEi6DzDbAzMQGDjX110xSz
 8ZdEKZMQ06hJYDKpDsVN/e1U7YYW1rBVOm3NySe8Big9rSFt8ZoHWKyxWkHpqX8g/Jlk
 82wA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUQkPr8+Ws2nutoNBMgsaYF39vDQmsETCF6ZmReCMadcnvfJ9cLEqukil1jJTzp0sKkQjsYgoHY5to=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwBq3mc23DD8IJVBCDjjwYv6LAe1CYb7byLXhBr8vb/nQ+PDeLO
 biZ20o+XSqNYgmy71DBOwSwM5+Fod3TARKjg7vmKbuabph4mvwz9WQJu31OXvJkQnOvV2hZ5hNe
 T81yFESWMWLqblQMjMlp/MfDyUt1/1vGcMnY6Ti+W3F3NttAQaQ5AotvamtUxlQYWvrQDKxM=
X-Gm-Gg: AY/fxX6P/47gmU7IcdRr4LJcfwAhKaXeQgG0VoTeWhDSv5X5z1J71Z1YOyZsM4k+HzC
 LkTW98z31unmX8G2NlZl8HbXTM7GTEqxUj0U2rvRRrcEWOxTDupm06QJ9gQjaxNgJqZEiDvRUv3
 cMqnSpwfsADLJ4ayzRGxSGJSjqzq0rXU2t9wzTOrkQGwONmCpTe9to9sA9f+sjMclBNbvzff6g+
 pMdzahmqd1n9VL7gZFSTWhfjYQRF2tlMROW7GzznbTWypjF9NHiuX7td8vhTWEhpqQVqrjfWHw2
 IM3UKxVrT1TY/QPNQ2J218ssjco/QrrL2dqr0CRjr3NtOjiK6OKljGNiOp6XOxF3KCpXFbiSqRZ
 YunUwreoSsGy9XQYv+bJoJ1XMRg8a1On46elysRhJ2A==
X-Received: by 2002:a05:6a20:3ca5:b0:35d:b963:f877 with SMTP id
 adf61e73a8af0-376a7cf5060mr32989096637.25.1767092550841; 
 Tue, 30 Dec 2025 03:02:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHFHd0dhFfGTm4/5cfDiP09pgR60Y6aT7n158xtH7J0xViIFk01koV9TQ6iyx4GS7/bXIeRQg==
X-Received: by 2002:a05:6a20:3ca5:b0:35d:b963:f877 with SMTP id
 adf61e73a8af0-376a7cf5060mr32989065637.25.1767092550297; 
 Tue, 30 Dec 2025 03:02:30 -0800 (PST)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c3a4deb6f17sm2556908a12.22.2025.12.30.03.02.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Dec 2025 03:02:29 -0800 (PST)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
To: srini@kernel.org, linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
 linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
 dri-devel@lists.freedesktop.org, arnd@arndb.de,
 dmitry.baryshkov@oss.qualcomm.com
Subject: [PATCH v3 0/3] misc: fastrpc: Refactor and add userspace buffer
 support
Date: Tue, 30 Dec 2025 16:32:22 +0530
Message-Id: <20251230110225.3655707-1-ekansh.gupta@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=POcCOPqC c=1 sm=1 tr=0 ts=6953b147 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=na3UML1GMWht-DHXVPAA:9
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: pvXCIROjyMZCrhAYylKjzBUBlTSxXnTL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMwMDA5OSBTYWx0ZWRfXzEXh94NoN+Ap
 1cX0SMfFXnpvZ30siJXDxX/uIFAK37M+yzglNmOzEsdbwym24sy6rMmswkBo3yU16+hccaIjbqz
 ZhXSUCHpJNZO9nCINu1A6PSsBRQ3oJxdpabulSml/B6hGI8H55CiWi30gqkBvThj7mQ2m+NYTqi
 WLHmYkHfwuFS2y1FdH8PQLiBUKzcG9rz3p9AFedhFu+B2JriX7BkhDqnWs+TFU+g3gYOXDAu8Dj
 IWdRdL5nB1+gvYn+ZtI/mN0giosQFESWjFWva/6ZyA4prhQiyGXJdmNiy+PfSi+ZrHMfA1w7oqS
 iXJF8RrfqjY6VK1+Rh/xjH0qnii5ePax/BuSY4NiwuZNYQ8zqrdTRu3AHiMYjWPgtr8g6AnfkHO
 GPOqvVSiV08T3J/aKtyGfih7CfVO0/bigdRYnC6hBv+zFOjUqVffhGOGs2bRwpyeVhSUr5UNjSR
 jxndu10e2bVyXm+9a0A==
X-Proofpoint-GUID: pvXCIROjyMZCrhAYylKjzBUBlTSxXnTL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-29_07,2025-12-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 bulkscore=0 phishscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512300099
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

This series improves the FastRPC driver by first refactoring mmap and
munmap logic into helper functions, and then adding support for mapping
userspace-allocated buffers to the DSP.

Patch 1 introduces helper functions for DSP-side operations, improving
code readability and preparing for future enhancements. Patch 2 builds
on this by enabling applications to share memory allocated in userspace
(via rpcmem or DMABUF) with the DSP through SMMU, improving flexibility
and performance.

No functional changes are introduced in the first patch; the second
patch adds the new feature.

Patch [v2]: https://lore.kernel.org/all/20251128103428.1119696-1-ekansh.gupta@oss.qualcomm.com/

Changes in v3:
  - Added a fix to sanitize address logging.
  - Fixed type-casting.

Changes in v2:
  - Split change into meaningful patches.
  - Replaced uintptr_t with u64.
  - Fixed commit message.

Ekansh Gupta (3):
  misc: fastrpc: Sanitize address logging and remove tabs
  misc: fastrpc: Refactor mmap and munmap logic into helper functions
  misc: fastrpc: Support mapping userspace-allocated buffers

 drivers/misc/fastrpc.c | 208 +++++++++++++++++++++++++++++++----------
 1 file changed, 161 insertions(+), 47 deletions(-)

-- 
2.34.1

