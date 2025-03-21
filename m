Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46E6EA6BE15
	for <lists+dri-devel@lfdr.de>; Fri, 21 Mar 2025 16:15:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D0D210E7E5;
	Fri, 21 Mar 2025 15:15:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="K9EONBFM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 555F510E7E5
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Mar 2025 15:15:53 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52LATEkY001605
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Mar 2025 15:15:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 kQ0TcVP8/Pvx/bLfKQWmzhGZHLR9S5vQOK8CP9c6HuA=; b=K9EONBFM6YLBtCLg
 VibycnEZcrZRgDsnLCIo6XjbUs3iLp7BoHb4uUIQpDIw1hInMKueRDmO75+Gae1t
 1oD//Y78Z0GOE3stwxgWvLi5Z9ybcBl4MsDH2O3xbkqNuLkp03/jLXMv+wTrgCX5
 qWrNZ6p46DS4/XQ0M40UiCFbdY1nxnkSLmTd+xuyvQXxjJw+C1/6IU4ZcGS0Y2TX
 rn8qRH7Fq6NgbjkmMvZ9yMUjtJtW1JblCuPZwbJ0kvOw56lJn2O89QsgcHjSptT7
 esCvEhthR5OJ8n/y6VGwmYF8Zgb8LhuMHIYUvy8lSW0ln1MtEs3M3mjgUv+CrLCq
 n6tD5w==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45g3sf6cq6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Mar 2025 15:15:52 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-2264e5b2b7cso30103245ad.2
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Mar 2025 08:15:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742570151; x=1743174951;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kQ0TcVP8/Pvx/bLfKQWmzhGZHLR9S5vQOK8CP9c6HuA=;
 b=sZKPMBH4qFviSWMBYXF6+QUn6ZuvlcTRDBQaloAZCl0c82FusNKvj3RCFWE4pCEv0t
 ev/xlf9MYxkQmGiEG134IpiPzzEP9W0LQbjL9qBxrVbrgM8H1URpO0tQ1oA90G3ZE2CX
 nXXGZpR5SiFmZmwC6TVUcSC7Sx3QMuExk4sxs8jkmdr0AitbJ7zTbovSEIDe2jFOhziu
 N3phuFhrJfHd++7vu1OikqkJQj07L2rQ0WK7VHPTuaBogRLrlOysxYfnZZKhcgimqYlx
 2aJGu2CKO59fGa0bmMAwq8FMf0jlqN0X/dLn/pvJtVywDl3oTR1y8cynMnd/FcRV8h5u
 P67w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXv/oxPrthkf+BZ8rM9gWaemxkd7Gt+iUZyCWlvlrqhySj9ebk07MtSLgT3Z8a+4R/HdMn3OcHdqkg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyybIjUmKiQqNwMzmUwj+bvIvtCKsrI55G2vlj7uiMhgB0+uanC
 RjYXl6zAUm95HaOVSRDzVP/EHxXFXqB1sOUxTNLHnx4lthmkWPXYugG8jJYUKrmOqM+9m/7KBHg
 HUk8GiVkTLkH2MC9DHRKS9aTQ7WoQOajgIrIOVH86DdVcE5MhfwJcydZ+9Oithz3fJLg=
X-Gm-Gg: ASbGnctsrmwGAuj3HVBgGDSAnJ6QhAJo9Ev6cEkyw5jizkC1B6M12Wo1a3r3aZz32SS
 M+GE0kZSGT6PA4TTNDtrRgd8B7qmYluoju7k/4eo1Kx2yMqqWpajpb99oFk+yM370eua6c+KAPt
 JfGFmuHSsvFjJ/sT6Alaxuth11xsBjQwMAfBVqp4iTefM07KUFAY/MM9+FjyJPjLe2qqbroIZAk
 SL2uzY4vgrzEluoeBby/5h2asHPnxj45yNBGh8/1RAiw6y3pxzZfjjYtT8WR2KyHMNu+vmCw94m
 CB5jiR2O7OSN4u2bKskXXng1DSrRLDKO/OxSGDriYpw0JOO1GHMxDer41HcxrhoEnA==
X-Received: by 2002:a17:902:e94c:b0:223:66a1:4503 with SMTP id
 d9443c01a7336-22780da8511mr60045685ad.30.1742570150718; 
 Fri, 21 Mar 2025 08:15:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEQ3exmAKYG/ayUd4BAH+7pjK9h3LAPlqbGIhGayFPW8YGaUKUf/BB+sXOizwBX45jlhFHzeQ==
X-Received: by 2002:a17:902:e94c:b0:223:66a1:4503 with SMTP id
 d9443c01a7336-22780da8511mr60045145ad.30.1742570150112; 
 Fri, 21 Mar 2025 08:15:50 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-227811f0cb2sm17901445ad.212.2025.03.21.08.15.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Mar 2025 08:15:49 -0700 (PDT)
Message-ID: <d2d6b84b-7463-483a-a634-396b5099ef56@oss.qualcomm.com>
Date: Fri, 21 Mar 2025 09:15:48 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1] accel/amdxdna: Add BO import and export
To: Lizhi Hou <lizhi.hou@amd.com>, ogabbay@kernel.org,
 jacek.lawrynowicz@linux.intel.com, mario.limonciello@amd.com,
 dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, min.ma@amd.com, max.zhen@amd.com,
 sonal.santan@amd.com, king.tam@amd.com
References: <20250306180334.3843850-1-lizhi.hou@amd.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20250306180334.3843850-1-lizhi.hou@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: BxgOBSDlBRWOLrqi7cHWa9jXaVujfWtp
X-Proofpoint-ORIG-GUID: BxgOBSDlBRWOLrqi7cHWa9jXaVujfWtp
X-Authority-Analysis: v=2.4 cv=R9IDGcRX c=1 sm=1 tr=0 ts=67dd82a8 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=uUkMEdlAwGOmqt_sgdUA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-21_05,2025-03-21_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 phishscore=0 adultscore=0
 suspectscore=0 clxscore=1015 mlxscore=0 priorityscore=1501 malwarescore=0
 mlxlogscore=916 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503210112
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

On 3/6/2025 11:03 AM, Lizhi Hou wrote:
> +struct drm_gem_object *
> +amdxdna_gem_prime_import(struct drm_device *dev, struct dma_buf *dma_buf)
> +{
> +	struct dma_buf_attachment *attach;
> +	struct drm_gem_object *gobj;
> +	struct sg_table *sgt;
> +	int ret;
> +
> +	attach = dma_buf_attach(dma_buf, dev->dev);
> +	if (IS_ERR(attach))
> +		return ERR_CAST(attach);
> +
> +	get_dma_buf(dma_buf);
> +
> +	sgt = dma_buf_map_attachment_unlocked(attach, DMA_BIDIRECTIONAL);
> +	if (IS_ERR(sgt)) {
> +		ret = PTR_ERR(sgt);
> +		goto fail_detach;
> +	}
> +
> +	gobj = drm_gem_shmem_prime_import_sg_table(dev, attach, sgt);
> +	if (IS_ERR(gobj)) {
> +		ret = PTR_ERR(gobj);
> +		goto fail_unmap;
> +	}
> +
> +	gobj->import_attach = attach;
> +	gobj->resv = dma_buf->resv;
> +
> +	return gobj;
> +
> +fail_unmap:
> +	dma_buf_unmap_attachment_unlocked(attach, sgt, DMA_BIDIRECTIONAL);
> +fail_detach:
> +	dma_buf_detach(dma_buf, attach);
> +	dma_buf_put(dma_buf);

You attach() and then get(), so normal "reverse order" cleanup would be 
put(), then detach(). That is not what you do here. Should this be 
reordered, or should you get() then attach() first?


