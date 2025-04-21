Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFBA9A94E13
	for <lists+dri-devel@lfdr.de>; Mon, 21 Apr 2025 10:28:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0187D10E24C;
	Mon, 21 Apr 2025 08:28:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="KYW2bHZA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9A9010E24C
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Apr 2025 08:28:11 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53KNoaYc003639
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Apr 2025 08:28:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=QR5gd+dRR5fQUEaV4R9A66WP
 hoDwvnauhFrM55J7cyE=; b=KYW2bHZAuL7GVmhH0Q+aiwJw2GtmFtRMq6S3KGPo
 ORSQnV2lcFzejDfBGiEnROhzIzuFArvR3lsurROQPWtuSgt9+7WtjtrUPGHbjuWE
 WDrQaJWqtMl4cNTuo0tLUXaJiiTgXMDWLP6cq5nTxF6dNZbyjO+pHnM1Bb9Dk3vC
 oh0ME23hc4Z+MZqSqp6EiUfC96yKL6Xh7OctQuV1i5SOhpbXhy/Tzsqo6xafW1R7
 ASdJrPhY47/dI4F+yDkCUJjSlfD1DPQ3sSGZNcmor8DY7YFfVYVskZJK6uNCbC5Y
 TNyGMTNcDG0c8ZZXXXqUuUEX+YKVKhz+OSok7IPRLMjVkg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4642u9bk80-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Apr 2025 08:28:10 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7c5d608e703so665892885a.3
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Apr 2025 01:28:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745224054; x=1745828854;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QR5gd+dRR5fQUEaV4R9A66WPhoDwvnauhFrM55J7cyE=;
 b=pJbJnRxR1OP/zSmZbldf0Bc3Mkf3gwrFkqHYsZmY5yX4775cQon7pn/ggoqNREC25f
 LdZXs5wmSMRNWidirmMeoARLOGaiVxvVGImznx34XKuAf26n7kVGQAVCgMr+IxyZlNj0
 HjuH24CNt+dppudfqlX4qNZY1vWsAm/l6VPo6aVvxXllSNtAPlBt3gNXZYp584F7TBjd
 oRlZikuYknpM/rGnrUViXujkUSfKdPFMe1VYvjE4gIXjYop9QHvpO/1STX3HHQGe7+dv
 9AFkAU75kjmE8bBjAkUbVBOWOhsvZVscP8THC9Z8xIhyQL0iHepudmmLfMSyBIVB29cP
 6n7g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXL/cxLaaGuFjvfO8uG5kU+/yU1sqgFXE3wijFZdd0Bzp0nN3byVce5ovjxC6o7JD5M8ucTIEMwJxw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzb6nZDsvIOmXkfYtscSXeG2BJxN9NUr6+syX19II2JThFW9l3K
 SfvVP4ejLiWUKl1vXiXq/QTrtOujxRPFvrk2HDUiBNsU47YxZ8i7yPM49L5I76EENA+4MAjV3PX
 MAmDslVD88Gdo7Av9kmNzSkfrkLS0oGYzHebi2iOekbRDBT6huZiStRj3QGnJiNARHAs=
X-Gm-Gg: ASbGncsClbZLtNWvzo6m//Q7u64HwYY8iescdxlpyKlV1aoGJUZbAJONhGg4MX+6wpL
 cOu4vxLHWJdGsnBjLbDjBsVsZaYQuna1/bfGlYo4zd8m7hrD7T8hCg5ksVFxNActpMuTfgr5YIe
 GgQ/JRW0fVwyIEm9ayqTWfDxNldC8yH1FTGKkpRXBK1jj0nv1+HfEEOp3zsD8sQbjy18p6EPBZZ
 fMT2xFYZ1bFeO3DFJFBlqL/0ho93x4CbfLGNbigRxMNZis7lWXDZlo/fEaH5FdHWC3T+uDVfv7g
 j1lJwnew7BFMJtTMT1GeYkAIk8s+Xt0rXT+y99mdt2BUoKBE6AALSiBakUXtIPa1lgRTMPA9ggQ
 =
X-Received: by 2002:a05:620a:258b:b0:7c9:25cd:f8c2 with SMTP id
 af79cd13be357-7c927f9a154mr1745410585a.24.1745224054113; 
 Mon, 21 Apr 2025 01:27:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGedgHyctiheR5eqrlzlMvKmM7DTyttbtDLSE0k3tCBxJ8UaWl/p1CnocaTREfBWeFRrZkBEw==
X-Received: by 2002:a05:620a:258b:b0:7c9:25cd:f8c2 with SMTP id
 af79cd13be357-7c927f9a154mr1745405185a.24.1745224053051; 
 Mon, 21 Apr 2025 01:27:33 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54d6e541d95sm873544e87.96.2025.04.21.01.27.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Apr 2025 01:27:32 -0700 (PDT)
Date: Mon, 21 Apr 2025 11:27:30 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Tejas Vipin <tejasvipin76@gmail.com>
Cc: neil.armstrong@linaro.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, quic_jesszhan@quicinc.com, dianders@chromium.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 asrivats@redhat.com
Subject: Re: [PATCH 1/2] drm/panel: panel-samsung-sofef00: transition to
 mipi_dsi wrapped functions
Message-ID: <juawuyriwzvstzyvtkv5uk5dtlineq36xqougegahcpijqoh4y@ooc3zosckoep>
References: <20250419041210.515517-1-tejasvipin76@gmail.com>
 <20250419041210.515517-2-tejasvipin76@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250419041210.515517-2-tejasvipin76@gmail.com>
X-Authority-Analysis: v=2.4 cv=TYaWtQQh c=1 sm=1 tr=0 ts=6806019a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=XR8D0OoHHMoA:10 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=i7Jg7TBL8QnUCxN52AwA:9
 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: D9JILZULSfTHnwWdnR-5hrvILYwGy6aW
X-Proofpoint-GUID: D9JILZULSfTHnwWdnR-5hrvILYwGy6aW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-21_04,2025-04-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 bulkscore=0 suspectscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 mlxlogscore=931 mlxscore=0 malwarescore=0 spamscore=0 impostorscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504210065
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

On Sat, Apr 19, 2025 at 09:42:09AM +0530, Tejas Vipin wrote:
> Changes the samsung-sofef00 panel to use multi style functions for
> improved error handling.
> 
> Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>
> ---
>  drivers/gpu/drm/panel/panel-samsung-sofef00.c | 70 ++++++-------------
>  1 file changed, 21 insertions(+), 49 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
