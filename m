Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AC62B1B242
	for <lists+dri-devel@lfdr.de>; Tue,  5 Aug 2025 12:49:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7341B10E64B;
	Tue,  5 Aug 2025 10:49:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="cuUOtBWU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8D7B10E64B
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Aug 2025 10:49:41 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 575AcwF8019487
 for <dri-devel@lists.freedesktop.org>; Tue, 5 Aug 2025 10:49:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=LILgYy0C41MzDzL71EJVum+V
 SwDZcGW+zNtWfWKsOEc=; b=cuUOtBWUez5snHeq8nRz24hT8XyGV5OZZBObwBMH
 YoGuujpfcMHI5bZRrwoCdxTMjETOffNhzK5iNAkdG9gNTgh9Qobi8JI0hJNmBG6Z
 Gza9X6gaTX4oHUCVrO6XNh6lZtZwyMmbrIiGYc4wSYlzd5mInAr7s8aAanrW8OMK
 QTxr8PhogdnGo6uzvOYl5Xqp8WGyfsFQVnaTLX3DG9sx5d3QXrIi3Io3IMOrfegJ
 Pgk8eAnlY6WjShD1lx/26PE3kOMAJnwuQoJdP/uXSos29DSY5iM1NIEE4NzYa7Mc
 6nYiJdqXKxPxBxGBHigu1hTJdhcdpcf28dFiCBoLf/or4w==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ak5a4x0a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Aug 2025 10:49:40 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-70739ef4ab4so87993116d6.0
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Aug 2025 03:49:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754390980; x=1754995780;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LILgYy0C41MzDzL71EJVum+VSwDZcGW+zNtWfWKsOEc=;
 b=f+p+5YtIGaDYI31dl7q19qodDa2F4NR5jVSlRvToFkWD1+7xBWCAsPSm7AhhRdAk4N
 eUxgAaZMMDKyFOHWqpg5ruMGFzwv+GB6+IjBJouroZuOYp0gudVvlKhmdOSlK7GRsHW0
 mcFv/Hmqjuy94F9K5U9h55jvsy5ZVVIuYYN7vN9eXU2PVRX4/n0Hq/uXb4qc0N/JMvCj
 9UZiAY/OtpYHmeBSnkRDBP+0TyVtqbHa4b4FGckVFAKOQZwUXL4n0tVyiBWkKitEHjdx
 z8r+DR6CzqgmIjwpqPK5ap/u9KJQWMJF9BPbF2VNHOe8b24GaktzYs05JIQaVUAminWX
 Ss8A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXmjKiGlKxBzJX41qg1P1lBYEdHvv4JTf4PMbEbp+KKfuYDxl1oP5RTcANgVGXK+a7kDSBUDsqqJ4U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzBiItOo+XLnUDYY6AT6lIiN7+HLbfKCgRlYFUwkspxdr+gL4rB
 bSk2yTkgtpenvzu3QR7+GBilz+w7U/w3BmwI+GKOqN6rGvhs67IHLK/G/dCh864RrXzEbY8kuuZ
 P7cUB6sjsHNSNSRS9j/UTAiZQJby4+J3JMNxJbt5XKDFZQK4QhC7W8U9byTbM7RJ7T0SP6DY=
X-Gm-Gg: ASbGncu4dcyIGTxA2wONXhudaay2ylLKC9k0+I6MzRrlms2lAYoj/ACzZ2OqahO+86C
 495wqg1CHLPLH3/r8P1WHEEfN8EMTamKEjA8GicY8yc+lAomlG2a4NLyZYFipZnfxPpx0euW6U2
 DKNTnlLYsZysANV/8M4HIthctNTJaVb88UHhLSPT+li1RBf1R2XbaeQrherwBPS1VybGJkhWS2s
 ulREL0WoClTEFKf8Cd2c/wLR06fKEH5bn7fItxL94bWnpbCefyRMwOACbbNljBoeHtOUh0Z5DVB
 KBF2y58nAFtyhU7bTQBWtdn3zHo5WuVsC0wPaZ7mjpeDnNnzBsPQ+JHyXaCGVf5qbmBjc9iNttw
 bbFht7gsKQ/U+9HLlX0sEPYXdLkUHilP7VUi+i11BLyczry4gjCd6
X-Received: by 2002:a05:6214:2a46:b0:707:76ad:ca75 with SMTP id
 6a1803df08f44-70966a41ed7mr33963756d6.14.1754390979947; 
 Tue, 05 Aug 2025 03:49:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGqYQkkoM4YKECcXArJk/1KXL78jF6AOwH67QNzaCG0gVxBltojkCrIgodg8FFNgsd6Tp9IUw==
X-Received: by 2002:a05:6214:2a46:b0:707:76ad:ca75 with SMTP id
 6a1803df08f44-70966a41ed7mr33963506d6.14.1754390979514; 
 Tue, 05 Aug 2025 03:49:39 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55b88db3b70sm1902054e87.182.2025.08.05.03.49.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Aug 2025 03:49:38 -0700 (PDT)
Date: Tue, 5 Aug 2025 13:49:36 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Javier Garcia <rampxxxx@gmail.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm: Add directive to format code in comment
Message-ID: <qf6xwtxh57jg6ico7n53ft7bepogeal5wfhthodsnf55eabgum@de2ah47jovbg>
References: <20250804212902.22554-1-rampxxxx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250804212902.22554-1-rampxxxx@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA1MDA3OCBTYWx0ZWRfXzC5klR9D4y+U
 HHV9x9kjXhq2+5x/uO7wWe/KGaJQZ4iV1BR8bfkr03Tp6mUt3u61MLl6k4fJajwL8vqJRshcC7P
 QPclx6JKotjpCIRG5Jp/cQ3M99gE+457Cf8nd0Cy5RQfneNT/lnJD6zBWrRFG1bvbzgoc+Pv8cP
 rIfBKNQptnLhqhoTw0XHIXckVKh8mWSkKBIcgKEt8zhCUNsK3TCgGzGhmpjmYz0g2PHt+zYQMYt
 0Ocgb7Dm1+gs3up7l+93NjB5OOw6FwHhTYbWhtBZ6ypdmrjhxvKEK++4+3CSQmc8nSzyLX2siGe
 mMBkH/+09zUAEBZ4RUDR5rhuiiUOsP6nfdLBdsJmNsAf5RsORyf8UeaD1ribz15IxO7C+vRwED5
 TILo7czbWp88J21sG//Fh7NfHXOhSQcBr6nOW3vW+9qSmT1oDwQJ5PhHaFyyX36NKaf0usHZ
X-Proofpoint-GUID: zfUG6coo_bAYpeUGPJLWKAODoZOOIX6-
X-Authority-Analysis: v=2.4 cv=LP1mQIW9 c=1 sm=1 tr=0 ts=6891e1c4 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=opqW8GeGsme4dWKjAOUA:9
 a=CjuIK1q_8ugA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: zfUG6coo_bAYpeUGPJLWKAODoZOOIX6-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-05_03,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxlogscore=878 suspectscore=0 spamscore=0 impostorscore=0
 phishscore=0 adultscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 lowpriorityscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508050078
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

On Mon, Aug 04, 2025 at 11:29:02PM +0200, Javier Garcia wrote:
> Fixes the warnings:
> 
>   Warning: ./drivers/gpu/drm/drm_gpuvm.c:2444: Unexpected indentation.
>   Warning: ./drivers/gpu/drm/drm_gpuvm.c:2446: Block quote ends without a blank line; unexpected unindent.
>   Warning: ./drivers/gpu/drm/drm_gpuvm.c:2450: Definition list ends without a blank line; unexpected unindent.
>   Warning: ./drivers/gpu/drm/drm_gpuvm.c:2451: Definition list ends without a blank line; unexpected unindent.
>   Warning: ./drivers/gpu/drm/drm_gpuvm.c:2455: Unexpected indentation.
>   Warning: ./drivers/gpu/drm/drm_gpuvm.c:2456: Definition list ends without a blank line; unexpected unindent.
>   Warning: ./drivers/gpu/drm/drm_gpuvm.c:2457: Definition list ends without a blank line; unexpected unindent.
>   Warning: ./drivers/gpu/drm/drm_gpuvm.c:2458: Definition list ends without a blank line; unexpected unindent.
> 
> Signed-off-by: Javier Garcia <rampxxxx@gmail.com>
> ---
>  drivers/gpu/drm/drm_gpuvm.c | 2 ++
>  1 file changed, 2 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Fixes tag?

-- 
With best wishes
Dmitry
