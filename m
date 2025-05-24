Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8966AC2CC1
	for <lists+dri-devel@lfdr.de>; Sat, 24 May 2025 02:35:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41CB510E21D;
	Sat, 24 May 2025 00:35:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="nOhaWDG6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0450310E210
 for <dri-devel@lists.freedesktop.org>; Sat, 24 May 2025 00:35:15 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54NB5e7Y006603
 for <dri-devel@lists.freedesktop.org>; Sat, 24 May 2025 00:35:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=gadVBmxWXzJeviMc28DkwJ/O
 zCQZn3T7DpzyRFQeYas=; b=nOhaWDG6LteGVoqRxOPOJ+UN0Dc93Aj8LrVZW1tR
 UumXYNg4GeVKBP8HnODeTbww1WUQ4GZgPoCRDr+zG58ZyIcte6+I+mSdv8VP0u/k
 B7KqLStXDg5BDOMOjYR6f6buv+RqpgbFQcr1gS9wKe8ACXfynukuKMTynT51fVAd
 vgdsyVuZWsEfwFGCZ4lZDAjBSpcDVjffp5Z7S1Z2FzPMhOG4N8ciYKL5I8PxdWHP
 swdX3OJRWQ20P+7rO5ZNjepm/9n5tjY77hdaNZ9n9JC2OPHXWDheiPdsNS2ICeq1
 5/Qs1+KHtKa2faHPu+fJ7CmsG11nJ8ArgrjrpO931JQe5w==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf0ummf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 24 May 2025 00:35:14 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-6f8d3f48f35so7886066d6.0
 for <dri-devel@lists.freedesktop.org>; Fri, 23 May 2025 17:35:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748046913; x=1748651713;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gadVBmxWXzJeviMc28DkwJ/OzCQZn3T7DpzyRFQeYas=;
 b=u7aNn9mySNgFfO4YN+0nCfmUnk2BVvupaOnt6yaiV3gdS0v32AoGpleK8+nnDC1WFE
 xFDumdb5slWldHMDX8XG58e4ZGtzKIRNB7UpgDVaJC382nR3H05t8saxcpQd5zz/I2cK
 iwSDieefE/v1pAxijpTpByB9GPdbQJdBdXarU+216wNeo49JJfCmGLoRW5r57TOKOW1F
 ECi4lj6J+J5CqUAKf2VygTKEVeu1V2WP2NBYttctbDCcbIlOx4Q+i1f+/vy99xsw1CR7
 CO3E9/5r2ClfVCLLgH9oRGOKv9WsTyb1iH/MO0gSmlVvOeza5aSbbd4E5wxwD3xHgSzL
 3dMQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVJdfJ/inA0I5T3piYxOFMp/1t1NnRPU9cj2vbM4b6BeRNx0N4rhYV8K6HaBv1EcK/y4n/qQWrqQ0k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwKsUkEncXZhEopbyczfdcbL/98LQ1wOV7IDXy0MjU6dwzzrNs2
 HOV7li2EGkAZWd+HD7THZ+tstvJBudMkP7XFZC/aisTRya7XkIqVFJlEdH8H2Y25lCkAoBoKOfa
 lXR6m1OOuTbI21JX+MUSDPbxa7AeeNphVzGE0VJnHn4IAXsmMd0duX90D6VyYRddew9SeSmE+Px
 IM2loDIpOK
X-Gm-Gg: ASbGncstj1yqwoDF4/m2k/Ef6y9wa5s+oBpfdgL1XAtD6RioihleeQGvgK6IDc3JnJe
 4lYcHxCC9axewkI94A/bh47emtZri+CKn7lsAWMVtzTKcia7X0TvO0o1CzitXTSwsSadK4RdRpH
 tsNpK8jKOKWr1Wox4IqxZ03pCs12ZrBYJ9VJECj9LOVTbXq2hjQgGDrXbJ5si4bRkS5RAvyMiAb
 735yvDCHKHGcL2Wz3iOg+sSO+4mbuHsh28rjV5DFNwJhFcW2Cb3vHpL5OJrOD8YHhzGtCjpmGrT
 mjo4BjQUxZhFzJsx0upqwrYuceks097ZJaHrjGHrNEmO94Lbf8AGwl4Wa5iD7+CRORxG8SXPJik
 =
X-Received: by 2002:a05:6214:c27:b0:6f4:b6e9:82cc with SMTP id
 6a1803df08f44-6fa9d1433cfmr27117156d6.22.1748046912883; 
 Fri, 23 May 2025 17:35:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFOZUOTXyqmBHBgRFqzKnLGB4b7GmThjnoaYLFwDqlij3O8JtyGhyovmb5uoWeD4XViw1lAsg==
X-Received: by 2002:a05:6214:c27:b0:6f4:b6e9:82cc with SMTP id
 6a1803df08f44-6fa9d1433cfmr27117026d6.22.1748046912545; 
 Fri, 23 May 2025 17:35:12 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-550e702c191sm4059818e87.179.2025.05.23.17.35.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 May 2025 17:35:10 -0700 (PDT)
Date: Sat, 24 May 2025 03:35:07 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: hongao <hongao@uniontech.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm: sysfs: Replace magic number with
 DRM_FORCE_UNSPECIFIED macro
Message-ID: <bvb2md4367ckhyeeve25uafppiv2egigiqyt4admqzcmcyc33j@qhqjwauryl55>
References: <20250516081813.3241129-1-hongao@uniontech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250516081813.3241129-1-hongao@uniontech.com>
X-Proofpoint-GUID: Gmd0H081jZ3M2F7xe5jbcEeoSHp-QiMF
X-Authority-Analysis: v=2.4 cv=J/Sq7BnS c=1 sm=1 tr=0 ts=68311442 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=iHwBjlyiAAAA:8 a=EUspDBNiAAAA:8 a=LBJxUm3s-jpqg1vTE9gA:9
 a=CjuIK1q_8ugA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=uNSKXYNwxGiU6LD0JREI:22
X-Proofpoint-ORIG-GUID: Gmd0H081jZ3M2F7xe5jbcEeoSHp-QiMF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI0MDAwNCBTYWx0ZWRfX8EZU1VDvbPI/
 YaMcZwWG4YX1wuR5Dppi6WpfftmgiTLqEChQ6zJ9wGY1WNts2w+DO2p1ihIGVmfMLQ1Lhuuz20i
 8Qa0NMqm6GpgFVCnexM+754TEnPNaO8+cFOYCyh8tU0bABRV3Vr18lkOulRO2PtMCt5dy8wcx6u
 DHLknpBteROrsMiF3Z1OFMzzieNguELLN1NnWANMfCdXfh0/j7WBvdYNx0edh0GeyZlKnpS6I3Z
 yx5Ky0jR2Z115AYzMUuHQ/QrVJ4pc+FvN9mCbRQCxRUlyb8xDGqJ+a9skU7knHOLwTBqMdw/Wmc
 6UGvIRfT+pwCnso34T4do+WjiTp7sNBXGIyMPSq9sXApgj6ppQW6sb7fewJcluQ++kyuLR4IA1W
 TIIKwBZ7PREjZnkQOH8D+uKHtSabiQ2V7qgaomnkcn5HoLfvpZtXMi3WFkxoccZwEDWoIIXc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-23_07,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 mlxlogscore=721 suspectscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505240004
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

On Fri, May 16, 2025 at 04:18:13PM +0800, hongao wrote:
> Replace the direct use of magic number '0' with the DRM_FORCE_UNSPECIFIED
> macro to improve code readability.
> 
> Signed-off-by: hongao <hongao@uniontech.com>
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
