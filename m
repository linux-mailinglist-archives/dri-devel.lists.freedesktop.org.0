Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46BC1A64C27
	for <lists+dri-devel@lfdr.de>; Mon, 17 Mar 2025 12:18:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EC1A10E0F2;
	Mon, 17 Mar 2025 11:18:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="hull9x8J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B3D010E0F2
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Mar 2025 11:18:34 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52HAkSmR016308
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Mar 2025 11:18:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=T6QOzefVCB1ALDVD4b+E90Zw
 NlbrEyFAiugsTYpAVrY=; b=hull9x8JoHiFgaS3SlgZechUD/CMNKDXKs3KhU67
 uNYO21JvYUPJ0GabzPXvCGjxWgR1VQ5Uf/WmaswT2MMWaUqFxTXq+dDsGqlPlfOf
 m64LXYj4gMAFGNuN1JoSRg47sPuC26MKAmQ3spbnUk8M5vPIsLTuOk9gzptMg4Ja
 ydzYfTDAb0XFz/98pRFCnrJorI4CQjOYeKwR18Lrr31G4OKyFoYXcw+71OFLvV+3
 eDe/vUWX8+7WMO9sAY4WMhQsx5gthKCVgSGahWtUgUwpo4asWQJp8KlGsxhgf8lu
 d/kiIRy9Fb6bKYnHjN3199AnAQTi6PD0Gnu5BcObSC2MlQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45d1t4mgm9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Mar 2025 11:18:33 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-6e8f99a9524so155924896d6.1
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Mar 2025 04:18:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742210313; x=1742815113;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=T6QOzefVCB1ALDVD4b+E90ZwNlbrEyFAiugsTYpAVrY=;
 b=B1aMDH/6TPTOaWP/5SxFQdCfCIo7ie3f+uBreaYucL1SydEyJA5KByvMCgVtjfiZ0r
 +Yixwc6ZNt2kbatrxsOPjdlQIci29tHYgI0m910DNvRNmWxhgNmoT7S/uwJTJkcnnvq/
 G50rwaQXUEqETFfelA7oYjUQq/XoksXoOJxNqTcESCNViHvvz53DzZRauz5mzk2b/h8G
 kbJVySWeofTdz2dJdqqdyZlk/gc+vfgV034tanu7+nI2L+gzDiSmKFDHcGBWPUVl71uo
 7MNeApkHgGmCCeL59kYWZlUcTrvrKyrTDGGIMbdiLIuK663uP/yZUsb5ovmvz+4m9LKE
 gtWA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV2xJm2nScxQIUKnI9zw3UbjIcfcAObbyFkq+mLphedyY/LDq0DM71rzcFjZpGlnUKkG1k/TXRUVcQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw5CZp4HB4TGTZHWoxqTvBN4pGr7O6lumRY0AKt5nQi59EgVM2n
 5VgyGqa2Yud3o0DjPsddnkZp5H+rFW6Zc+to9HELeJghsbLWsLC8+A0dbXP2PS9NDm8u7VasMdz
 W0a2D6Iajd8BQZ2DKJ6x9bY6impK5kOpVLa0ICDr6xePePA2hgQ+gVcTRI7hlAWQEUcM=
X-Gm-Gg: ASbGnctReFvjCzfNU94jEc/VLmqn36GavWg8pab3oGbacG1stPR6yaVak4A/rQORVse
 Dd8Pm16rNepPL25ST38+oMRjHMD4egG61Qrub4TfNPT8VvWSJe6aPf/Yn/bUsMjhaahSGgdIJ7C
 sgvWrMT8CbACgaqmI8Gu3nwVzgr4Ny4X98WWhhw9HIs8noXHhWn5LmUG+exquZ3EuagYYG2X+kr
 Wen3JGdCNQoC5S9Bxq7xfwnpy1ibPVh0zxioZL5omKWyeW/lqoQdObtZXLH5/rA1X+2i0m9iA6U
 MIK1DKrfo8Kfd+agPhRHb5EIKZUv4NVXbf0qiJ6dwFRDRLjX4JrzwbB3mKeiBjW91wR0Hi5svjz
 zx7Q=
X-Received: by 2002:ad4:5bac:0:b0:6e8:c713:3220 with SMTP id
 6a1803df08f44-6eaeaaeaf05mr223054106d6.36.1742210312797; 
 Mon, 17 Mar 2025 04:18:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHRfErhQONfbnUCDF3/m06A/fCJBaed+xYW/LUK+0W0eB9q/0f4vqTLFVHcA8wc0miWiEPlSQ==
X-Received: by 2002:ad4:5bac:0:b0:6e8:c713:3220 with SMTP id
 6a1803df08f44-6eaeaaeaf05mr223053646d6.36.1742210312455; 
 Mon, 17 Mar 2025 04:18:32 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30c3f0e99e0sm15568441fa.34.2025.03.17.04.18.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Mar 2025 04:18:30 -0700 (PDT)
Date: Mon, 17 Mar 2025 13:18:27 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: zhang.enpei@zte.com.cn
Cc: neil.armstrong@linaro.org, andrzej.hajda@intel.com, rfoss@kernel.org,
 laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/bridge: sil-sii8620: Use dev_err_probe()
Message-ID: <7vxbjx3mjeo2a7km5jo3kwguqfip4rkl35mncdgcvhymhe2w6j@7mwshdqfn4id>
References: <202503171404563447jAdJlVvoFXDvBoj0sAx6@zte.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202503171404563447jAdJlVvoFXDvBoj0sAx6@zte.com.cn>
X-Authority-Analysis: v=2.4 cv=VLPdn8PX c=1 sm=1 tr=0 ts=67d80509 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Vs1iUdzkB0EA:10 a=1RTuLK3dAAAA:8 a=EUspDBNiAAAA:8 a=ib6j6c_6DBfqJxPKIQYA:9
 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=kRpfLKi8w9umh8uBmg1i:22
X-Proofpoint-ORIG-GUID: st7fF3ImB74EyXDwEY-Di9cYDLlgrVdc
X-Proofpoint-GUID: st7fF3ImB74EyXDwEY-Di9cYDLlgrVdc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-17_04,2025-03-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 priorityscore=1501 clxscore=1015 mlxscore=0 lowpriorityscore=0
 phishscore=0 mlxlogscore=920 impostorscore=0 suspectscore=0 malwarescore=0
 bulkscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503170083
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

On Mon, Mar 17, 2025 at 02:04:56PM +0800, zhang.enpei@zte.com.cn wrote:
> From: ZhangEnpei <zhang.enpei@zte.com.cn>
> 
> Replace the open-code with dev_err_probe() to simplify the code.
> 
> Signed-off-by: ZhangEnpei <zhang.enpei@zte.com.cn>
> ---
>  drivers/gpu/drm/bridge/sil-sii8620.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
> 


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
