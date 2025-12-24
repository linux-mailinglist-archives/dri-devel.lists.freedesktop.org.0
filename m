Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AED83CDB7A3
	for <lists+dri-devel@lfdr.de>; Wed, 24 Dec 2025 07:25:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1C3010E0CC;
	Wed, 24 Dec 2025 06:25:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="CjBmBae5";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Rpo2WKy9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1553B10E08D
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 06:25:37 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BO17Sog1597720
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 06:25:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=ghYWCMfG/KWuBI2qNzjPlg1Z
 H5W1IZNuiMXZFg9Qm+Q=; b=CjBmBae5lDlFOeW4pSL2jmo8awamypI097MJI59s
 MWsJTMdmqzxuLuX0WvQ4muNPZBXqaTk8sM8odkwHRYQiYWBrBVFuQ9ciYUBfePhv
 a66Y1at4nXJwG/N6YvhkRG0F6qxUEg2pKHvPlEBxJ97PFzNEjUYmtLT2V7Y+BlKg
 SptNI6XF4WIXTYp0E9kRgeP0UDdAH3L8/qRxHgWRTi7Ov3NLUzd2qtrkYk1T8v5I
 u9pu/yTO/2avcuBC9+OJPh5mWIjMNW/rzp9cZ1vq5Zxa2PoGnqg4Xg8M5Fr1PkPu
 mzAA81dKL/Qcunu8XXjudyT+dZ7cGhWOOZn/hemIsqu2Og==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b8683gpt2-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 06:25:37 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4f1d26abbd8so153952281cf.1
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Dec 2025 22:25:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766557536; x=1767162336;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ghYWCMfG/KWuBI2qNzjPlg1ZH5W1IZNuiMXZFg9Qm+Q=;
 b=Rpo2WKy97smsj11zgfNxS0KskAAoPs4dpjqQG0MKrVZi7CRKaIlqOTts8Byx+DoUTS
 Cm67dA3EKRQ/DALYfDccogw9I0DX2AkiIR/fI2Ac80gs5g437nRq4Oh2lqSPJJyPp0Nk
 Td6fmEdCVqZcYMbG708bL/UXON23YeBwMcc3ULEJW7x5hqu3eC2xlwOZZMfB0du36ejU
 U0mRybpTpr6ixAwh3aVYevPDx8LqCKiWymBJzZKTS74m1LHDG1hZlnpPMFmm1AG6O7+B
 IsSrc653AfKQr2+q8qzS903uoylE/dTG+lCIYbfCcW0Auwapmp/5pAUNW00uEE078VB/
 9AWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766557536; x=1767162336;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ghYWCMfG/KWuBI2qNzjPlg1ZH5W1IZNuiMXZFg9Qm+Q=;
 b=dCQdAhrmZtUtxyUE+wEOhB+GOmjiW7y3f59XgJI1KGDjj6LbUhR2CxM6UOGpDoIWR2
 NGOfsm3Qp7D48ncDkczuU5D8ZR6PNDx2dHsKSuz4oRZAKddpr03/V7VEfoeAjR4NnZeV
 YPZ16f74X1svzwsg4Hj3vD3V8nN6rw9yGZ0JDzau7+F9JkIAesIeFoF0KVmM1Smxq8QU
 slBpt6YktWg/ucMFA/dELGxKanhcK4dDxeqvd+jkUNHxuNPdmFV4XtDPEYSe34gUnps5
 FxS/Yz6di+Doq5t7STKoB+IPyDJ2fp34fz3NZv9ZJdaHEdSmtIiWYn3Tmkm5GB6Yi9W+
 Og1Q==
X-Gm-Message-State: AOJu0YwQ9Un1YoMVqzlpOCAVwOKqzDLpJJO9ufxdrkb9CE1+RgKqPV36
 nCSBO9xy8zSs5skwfEwIrtjEfk1VmFy70CH1sZ/K3asJoAeGbkP7fWVCo7qjfEoVdaH8MPyRe5X
 /QdJaq5J0DqWS4h7rG6+DKGhupZu5CCbGJpLGdDyrQygxtTS8EYxUof4m7e7p1JycPsTMics=
X-Gm-Gg: AY/fxX5P41wz96FscR2jys6WNwROd7QQOKkOSGpZ1eEu/GFXxrbjRPsKUyfjvw8V80t
 IQ0McAGWRK0yc+PQES5DyE0ap53f84jJvWil+YElbnnm0iNg20CrRUCkewb78OWCxRPLjnoCrEr
 8ejw7IyX5Uk7NNAa6J1MJDf66OSpm1TMJri47wkAuTaaWg+s6HnUbdO1j7STDHEH0JucxpknoLn
 ojcZoA+OzVR6ithL/es+lAwdwxu0iYMGf0wOg8e3rC6LP3bqL0Wd0KVPigzOQe6OL3GTcpjc4MJ
 DK2s3OIV6d39HALtq7ojhA3YNpfPwz/OwrasNUi3YUazvU2vkzSfwWNCyEhDsKDcEE3TU5F0CO/
 v6CjWvOeoJY4myNYTpIk+gUwvovxJZMWN+Ma+ot/icRLu8u6fXpM3Ymslcb/7rN5wegZEL9/0AO
 FzDJ8JVnMaaSpp2R+4iG24zjY=
X-Received: by 2002:a05:622a:750b:b0:4f4:de1a:7a83 with SMTP id
 d75a77b69052e-4f4e8b40837mr5949011cf.1.1766557536358; 
 Tue, 23 Dec 2025 22:25:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGJqPf9GXMiANMcZKwm3J3PuX8Z30M1wdRc5+g6FOwva+Dn9Ih43nX9+5ZNHvKmSLwW0/PPNg==
X-Received: by 2002:a05:622a:750b:b0:4f4:de1a:7a83 with SMTP id
 d75a77b69052e-4f4e8b40837mr5948821cf.1.1766557535919; 
 Tue, 23 Dec 2025 22:25:35 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59a1861f2e6sm4717823e87.69.2025.12.23.22.25.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Dec 2025 22:25:33 -0800 (PST)
Date: Wed, 24 Dec 2025 08:25:32 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: dri-devel@lists.freedesktop.org, Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 00/19] drm/msm: correct/add a load of kernel-doc comments
Message-ID: <vl22otxr5ks3lvqvmpfrsdfnv2wigzdguvf7qshjwgyimtlfxs@nbmrsqxpuiz6>
References: <20251219184638.1813181-1-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251219184638.1813181-1-rdunlap@infradead.org>
X-Proofpoint-GUID: 8QiyYwYGQ12LIRy7HDYlZi78Of1seJgk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDA1MyBTYWx0ZWRfX8vi37U0BJ+4g
 4TuFKuuda4DLde1mKAMQNBghqDSh01edwNs5/Vao74wJxMaJVXmkLprGvGfBC1ZjGilCkAzynZq
 fAmJBpHLzRs510M19Q1AqVOQrNPBkjC9rT9m5tAfqEw0EDlkBpXzYGz4yZzNNbB5i8OEwd0+F47
 VPvkA7ocqha2Gs8lYEFJhB2tYhrsNdpg7VgO5xZrZtW9Fsl32igjkaq8FNLZvJC6WWayIJMedLq
 VKrj6ig7ecoqABYYf2YWC0AyLPWyL+KNBTIF5E12t5KOt6yh5Iikg4UYz0RSoZgxlug9D6brEmW
 jYzbWQykHbcK3c3ZoKrjCoi9Eb+ylKzB2oZ2S/D9HVl6f2+gK8uEGyTkvhSNHAwoWIlmrGyLRHi
 kdktkliJy9Lf/pXqWce+KTKBjuFCJ6l62Vf22X47zZ+ldVxxfcWJPeEBxTosvZSDz//mjT0EtS1
 3GvGLflT2Ol+O1Kbb1Q==
X-Authority-Analysis: v=2.4 cv=HqV72kTS c=1 sm=1 tr=0 ts=694b8761 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=8MGaVJJo3f9ymaU01ooA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: 8QiyYwYGQ12LIRy7HDYlZi78Of1seJgk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512240053
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

On Fri, Dec 19, 2025 at 10:46:19AM -0800, Randy Dunlap wrote:
> Correct a bunch of kernel-doc comments in drm/msm/.
> 
> [PATCH 01/19] drm/msm/disp: mdp_format: fix all kernel-doc warnings
> [PATCH 02/19] drm/msm/dp: fix all kernel-doc warnings
> [PATCH 03/19] drm/msm/dpu: dpu_hw_cdm.h: fix all kernel-doc warnings
> [PATCH 04/19] drm/msm/dpu: dpu_hw_ctl.h: fix all kernel-doc warnings
> [PATCH 05/19] drm/msm/dpu: dpu_hw_cwb.h: fix all kernel-doc warnings
> [PATCH 06/19] drm/msm/dpu: dpu_hw_dsc.h: fix all kernel-doc warnings
> [PATCH 07/19] drm/msm/dpu: dpu_hw_dspp.h: fix all kernel-doc warnings
> [PATCH 08/19] drm/msm/dpu: dpu_hw_intf.h: fix all kernel-doc warnings
> [PATCH 09/19] drm/msm/dpu: dpu_hw_lm.h: fix all kernel-doc warnings
> [PATCH 10/19] drm/msm/dpu: dpu_hw_merge3d.h: fix all kernel-doc warnings
> [PATCH 11/19] drm/msm/dpu: dpu_hw_pingpong.h: fix all kernel-doc warnings
> [PATCH 12/19] drm/msm/dpu: dpu_hw_sspp.h: fix all kernel-doc warnings
> [PATCH 13/19] drm/msm/dpu: dpu_hw_top.h: fix all kernel-doc warnings
> [PATCH 14/19] drm/msm/dpu: dpu_hw_vbif.h: fix all kernel-doc warnings
> [PATCH 15/19] drm/msm/dpu: dpu_hw_wb.h: fix all kernel-doc warnings
> [PATCH 16/19] drm/msm: msm_fence.h: fix all kernel-doc warnings
> [PATCH 17/19] drm/msm: msm_gem_vma.c: fix all kernel-doc warnings
> [PATCH 18/19] drm/msm: msm_gpu.h: fix all kernel-doc warnings
> [PATCH 19/19] drm/msm: msm_iommu.c: fix all kernel-doc warnings
> 
> 

For the series:
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
