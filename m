Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEBC7A94F61
	for <lists+dri-devel@lfdr.de>; Mon, 21 Apr 2025 12:28:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 808AF10E365;
	Mon, 21 Apr 2025 10:28:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="GuoMcr+g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AAF510E365
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Apr 2025 10:28:38 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53L9jMMO015515
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Apr 2025 10:28:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=gQ3EnfKvB1bXOmMl+IM4Gmig
 QacysHvzHf3MwtWQ87Y=; b=GuoMcr+g8SJaaTxcZ26/MMvhQnz83kZSAs0ZOJSq
 GTLw4s/VABwEttPJhM4BEV04euW2wD3oabKsrDunol2oQtOwiQvVcEk9KpvWId1/
 xZbNG+i24rOQkCntzKiK0I39zwivewb4Y+DLwjgtoo8MmLOvRYh40qFeUdPTOR3R
 DpUGhumGhHqlHslb+vh9zBdkE16S1zIjF8Oz6FTqxHTgmRT60OEwLJUKP6frn3YZ
 Fz1NHIvnLZuDlCYJF2OFo3zcUpIX0TYqoDgvChWQhL2Mlo8FByWrjH8GTz/mE1gI
 Qfza2jxqDN7OAS4w97CXCakOAQxZ909h/W2LY9lRL0UjPQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46416qv34b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Apr 2025 10:28:35 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-6ed16cc6e39so82519846d6.1
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Apr 2025 03:28:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745231314; x=1745836114;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gQ3EnfKvB1bXOmMl+IM4GmigQacysHvzHf3MwtWQ87Y=;
 b=hhSKzA/DHGDjpBygCpNJdzjFtVDk4SiGT/MgS5itAMoQlXSOgEL5vbHADW8vXoFCjO
 9n8btJcQ4S8YM4VBrziGxnly1Ikz1sm1DNB/AV0nEcTzTKyxzJgrA1KLq5Kh8gb4TcDL
 HPuj2lSVgHlvvkEBWN1xNxzlPXSnfwLRptdioXiY5xcjRG8DF+sTLDqMK7s98QMvSAO9
 qq0vV63c8r40Y7VjtJZ86qMJR4dm5OsStW4I0WLmyWHd2KKzaKJRjWXkzgoC8lng6A2b
 tkAlyULxbKCNmau1yEN57chDJZzHwjl0h58AI9FXOSbDOz9u3pgDkM9XnT/Z+LQaDS0r
 F5Dg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWN70bo7hH6Nsqno3a6jyYVHJFks5fHWHkKeNl1DzflrzCHHyeGWk6O1TRWUPL2T1NOYwKQg3kkT24=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzddHcflii3lsK46gqJy/VM5P1SRi+EuZBvJ1vxOYZvc8mN4AAi
 88PsOhl1503HEeydKT8Urci5MYDUBiBsSl2LHPXQ6/qPFYNFpWex97gtTWQ1u/2mE3syi4OITOP
 Nuy33Xx3dXNCUCtUNqu5tvoaHKDudGGmx/j97D0mtqD10geAROOlDnbCDc5RYsghVBOc=
X-Gm-Gg: ASbGnct3AU54D5J3WJJ5NjVw87nGfIS3UZ89XsDvgwNCZSPdTK8wIY+Qve0tYmXuTEC
 q4veRalbXfYz1fqJeJ7vO2GU4ZqpW7BOqtfTomq2XfsFokFOw0W+Cc+m20HzRVecn7SReDLANuq
 FUp6EWB4iaoIYfyQhjej3HRO3MOam3Ng0Cszt7Xqm7ao31Ou7BQQmxhptxzQ28lCh4HTiU5PAbo
 h4KOyIYCZxhjl9QGxUNULW68FUwbCUlk/7cvQbg7p+cHtJr7ulEGoG78CUWWKfwt9kwvG6coCXe
 R4D5+Ug+p4/bOGtD9n/lES2jzCGxNBHYMDDiIla1YF3C2rBRHTGuUgjKJ25ilO6fYrH8dilAk1Y
 =
X-Received: by 2002:ad4:5dcb:0:b0:6e6:5efa:4e01 with SMTP id
 6a1803df08f44-6f2c4576630mr189519206d6.20.1745231314625; 
 Mon, 21 Apr 2025 03:28:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE7WvYG+3gGlebDeY/PXmCn+u+i/rphjghjKBf1LwPFqI0CDk0+ZqK4KIlCkaCs5hgBC9FOqQ==
X-Received: by 2002:ad4:5dcb:0:b0:6e6:5efa:4e01 with SMTP id
 6a1803df08f44-6f2c4576630mr189518906d6.20.1745231314170; 
 Mon, 21 Apr 2025 03:28:34 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-310907a77c1sm11039341fa.57.2025.04.21.03.28.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Apr 2025 03:28:33 -0700 (PDT)
Date: Mon, 21 Apr 2025 13:28:31 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
Cc: dianders@chromium.org, neil.armstrong@linaro.org,
 quic_jesszhan@quicinc.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/panel-edp: Add support for several panels
Message-ID: <fpk5nwwqfxinmzb6itjvh4ueao3pukga7dandvyfks365zjcip@mbbl3ekw6xei>
References: <20250421094438.4199-1-xiazhengqiao@huaqin.corp-partner.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250421094438.4199-1-xiazhengqiao@huaqin.corp-partner.google.com>
X-Authority-Analysis: v=2.4 cv=N7UpF39B c=1 sm=1 tr=0 ts=68061dd3 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=XR8D0OoHHMoA:10 a=1XWaLZrsAAAA:8 a=D33p2VstQxahVk34y60A:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: 3mHyfayT87Cca3_GSTTquTAVWBjRjnFh
X-Proofpoint-ORIG-GUID: 3mHyfayT87Cca3_GSTTquTAVWBjRjnFh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-21_04,2025-04-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0
 mlxscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 mlxlogscore=999 impostorscore=0 bulkscore=0 spamscore=0 malwarescore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504210081
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

On Mon, Apr 21, 2025 at 05:44:38PM +0800, Zhengqiao Xia wrote:
> AUO B140QAN08.H
> BOE NE140WUM-N6S
> CSW MNE007QS3-8

Please add EDID dumps for these panels. See git log for the file.
You might want to split the commit to add one panel per commit for
simplicity.

> 
> Signed-off-by: Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 

-- 
With best wishes
Dmitry
