Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C909CC791C3
	for <lists+dri-devel@lfdr.de>; Fri, 21 Nov 2025 14:03:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E701A10E04B;
	Fri, 21 Nov 2025 13:03:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="fi6Zdz++";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f49iiKqX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A6D610E04B
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 13:03:25 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AL7cBPl1390827
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 13:03:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=6Ebzqqb2HB25wSY3SHb86DFL
 9SKoXTlvL/xdpHoslPs=; b=fi6Zdz++x5UutEiehiR3xOAXPb7xiJwsgQo+Otgv
 dSqLupmmBqhayW3/WwcbnQ6xcvSWag6ffq3NSo1FpRpcZo+A0qH+Msptq8SmVyhZ
 m6teFL3PizGXnl5IrVhr7cLapRidepbXZcbwF/dhFa/P/aPOEa2tJtCQyRiOuN6d
 /T6LwQ8W20Llbzejd3ES/706XctKo3vn5DHsBOq5r4ERESDXnQW+fgqZdtIuKxI5
 mQtx9GcOjNlJnscUTISgViBMIq8499HM+GyxGR8j75aVgMc+LCkD0v5Rgt4r+RPZ
 aEreuV5fvnfX+yInHfy4LYPUB5VDAZCDlEPaLZ1TW7RwQw==
Received: from mail-yx1-f72.google.com (mail-yx1-f72.google.com
 [74.125.224.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ajb532hxq-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 13:03:25 +0000 (GMT)
Received: by mail-yx1-f72.google.com with SMTP id
 956f58d0204a3-63e1e96b6d3so2343412d50.3
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 05:03:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763730204; x=1764335004;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=6Ebzqqb2HB25wSY3SHb86DFL9SKoXTlvL/xdpHoslPs=;
 b=f49iiKqXisGRgllvu1jAjravQQ4zI8NvOejtD+I696YIp43JKaJCl9Tfdlq3RUc2ve
 vMGctNnnA6O2zZ9eDN9FfT5cHqSwoccLn07IPz/hlzkB3tMOadc+0PT1PXxEtrp9VRXS
 6C93xHneU82lRg8DFhAfox+gp/MtLVudXBjEkCRntxT5cVFb4iuD6FBz+Mexvs3QEMYM
 ra4izusw4792CxwQu/PfshCmjWmcspNQVRlMCoygBf6VYKjH56HcD/6j14INraJ7i+Mm
 /J6iIO9/Bn35KZ9q81ywYvOZemKLjyncwga27zpyXZosqTEI8o4aBoqZCpgePvo+Elaj
 HiYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763730204; x=1764335004;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6Ebzqqb2HB25wSY3SHb86DFL9SKoXTlvL/xdpHoslPs=;
 b=DbYcdcpAWpupTu5/uVARzFxOp/yULcTWVWQ3bNL+5u17ndcPLkucbM6AWTsZr/apLg
 JwCRCFIqZ/PsMZe+aCp9OIj1xQbAOJRVvy0Ts5a8rD1i3BcQifW+iyUWH7yxCFUDeoYj
 9anb62e+QKwExys5uPoga0JGZNBDQuz+wm+kOoxzkjMk+5WH2xPpK0K6puuU2eeNyLNp
 YlGYvzeqk9Ot170qnvP27i8pIjFXV+aVec+REbRs+S4MApCCi1phh5X8m86EQgWkJ+IT
 p5LJr98tr1XAfKFJb4lQeRLHNJn8z/RSz25en1ja6IdsEPlI9IV2DQeDp4GVJsnAyTHn
 mI2g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWl7Ctl8iaaQcmgHAs6wfF1QOuZWEzdRCVGXs9VlLJJxycaB2FXjT7eVG0WhNgRa5i08tZBSm3K+Gc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzDiSboCoeXfmsZSZkYQV+ID0OSsWkxlqfVBuT6MvbUOLEMjYxB
 bSb5TeYtfKwEEeCo6VZU4C7MpuhXXjYAJjMryZUFam7+BIU7SWHbjta2NTmTJBIvbLWW7ZGgDK1
 39rEi8nxcLk7WkO/U3gSEOozOUn653mKR0yf+suRwIkkLqoUv8iak1dnYgcJlE6ZnvD7/koQ=
X-Gm-Gg: ASbGncs5fF0wDV/Y+k+GMX6KFMmmlRGy0SDZbn1O2yuAdqv2ZHtxvPBQfio83pUaf5m
 NeN7RmaRxC2hwju0zkTsyrxJ2HZncdtZwO+4zhMui/egXO9AgTRlBsxZkiMjIjRmElCJQJ+8WLt
 PrMiZdQ6H0N7a6LRjM0Ys6RewXjkDHGBdEqBCBiAK/Ozqx1o0gexhJRKfnscxhPJYmkjwJys15k
 QBPHdarqXZTIBB+SifO0xrW9DgHi4CmbyQFc6gT8TAkm3rDhdtw2G9bU4Yw+aQ/0tQD4TTh49Mr
 GShNS+/s5Da6ieZfvLDOdf/8g4/ihJCkfAIvcU/JbnQNOnAoPyMO4jkesda2NdfWpe+qE4BFFrD
 WteXWOyc+0UHo36XQ3EfiembGnWZiOEPVZ3PLyBu5in6Jqd67sgmZ225o6wnZoFx9V6eW/go28B
 tT6/adn7Ujr+f/WdWREHxrQ6Y=
X-Received: by 2002:a53:cd8c:0:b0:63e:1943:ce49 with SMTP id
 956f58d0204a3-64302abb486mr1012779d50.39.1763730204064; 
 Fri, 21 Nov 2025 05:03:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEi7GrdMAr6GhOFsCRThFLBFakA5j7YJp94i9Kss9c/Elt0tOH0sM/CQSpFGWLHLjb3njADQw==
X-Received: by 2002:a53:cd8c:0:b0:63e:1943:ce49 with SMTP id
 956f58d0204a3-64302abb486mr1012697d50.39.1763730203300; 
 Fri, 21 Nov 2025 05:03:23 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-596a0d1493bsm1148420e87.73.2025.11.21.05.03.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Nov 2025 05:03:22 -0800 (PST)
Date: Fri, 21 Nov 2025 15:03:20 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Nilesh Laad <nilesh.laad@oss.qualcomm.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Marek Vasut <marex@denx.de>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, venkata.valluru@oss.qualcomm.com,
 jessica.zhang@oss.qualcomm.com, Yi Zhang <zhanyi@qti.qualcomm.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: bridge: lt9211c: Add bindings
Message-ID: <vtk3okmi7t2bxx5zynwwr7wqyaj5rol5o4lwxi42h4i3fstbmw@i5hkr6g7kgtj>
References: <20251107-add-lt9211c-bridge-v2-0-b0616e23407c@oss.qualcomm.com>
 <20251107-add-lt9211c-bridge-v2-1-b0616e23407c@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251107-add-lt9211c-bridge-v2-1-b0616e23407c@oss.qualcomm.com>
X-Proofpoint-GUID: Xy1XmkZ7nckocHFH_di_zcUjg8vz0AsP
X-Proofpoint-ORIG-GUID: Xy1XmkZ7nckocHFH_di_zcUjg8vz0AsP
X-Authority-Analysis: v=2.4 cv=Wugm8Nfv c=1 sm=1 tr=0 ts=6920631d cx=c_pps
 a=VEzVgl358Dq0xwHDEbsOzA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=wANug47Xg7UbwDa8xMoA:9 a=CjuIK1q_8ugA:10
 a=uujmmnXaIg8lM0-o0HFK:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIxMDA5NiBTYWx0ZWRfX0gjajJYeU/Gz
 94r4HY9H/u7KiWJc/2RpE4Jyz/3V2iOQ95E4kmHwIvdkdupkbzfPofudvFOOL6BvFZYfCZTd7HH
 Mp4/2WrV5uC5Uobqyp1uCH6uZ+KikXYt/JlqDUwlRSm0nBfiTm+w1g6iKqgS28mGmIud2YoYgwD
 acirI3Tr2e/QGsqtQDDUuCo70vg2VyYNDcV6AiMQ08BRUd2YjKk7HTYy25h6KYZqQMAras5p8H5
 CvL92eqiufOhdFIQnWjFt2+L0hQaY4YAW5INJSGnMizdgRBkkzio413EBQD9wpD1qIahm6HXvle
 2AqFs+WwyBMLv8j3Ct/Ck0A06ftQnCV1JyHR6ABiJvAprUlEThkeUXcZoJkCeBDqTF6VxHDIVk9
 Wrr7LkyMDKSjQEGaGK7EhyzcSMt2aw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_03,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 phishscore=0 bulkscore=0 adultscore=0
 suspectscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511210096
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

On Fri, Nov 07, 2025 at 06:32:58PM +0530, Nilesh Laad wrote:
> From: Yi Zhang <zhanyi@qti.qualcomm.com>
> 
> Add bindings for lt9211c.
> 
> Signed-off-by: Yi Zhang <zhanyi@qti.qualcomm.com>
> Signed-off-by: Nilesh Laad <nilesh.laad@oss.qualcomm.com>
> ---
>  .../bindings/display/bridge/lontium,lt9211c.yaml   | 113 +++++++++++++++++++++
>  1 file changed, 113 insertions(+)

Can't we reuse lt9211.yaml bindings for this chip version?

-- 
With best wishes
Dmitry
