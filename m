Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F739AC34CC
	for <lists+dri-devel@lfdr.de>; Sun, 25 May 2025 15:12:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E711110E120;
	Sun, 25 May 2025 13:12:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="PlEnM/cs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EDEF10E120
 for <dri-devel@lists.freedesktop.org>; Sun, 25 May 2025 13:11:58 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54ONHZxo016944
 for <dri-devel@lists.freedesktop.org>; Sun, 25 May 2025 13:11:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=U/+38rZUZ+yKKqj93ig1X6te
 i5yn0MPFfB3J8hGcDEQ=; b=PlEnM/csAmb2c58q6E9Vjq1L0mvCQI9fcQHIkIJV
 rq3J6RazmXcVfqQ65vQX5YY3FO5+qwV4uK0Z++JCTiWFiMsNHOmqoJ+PkMJVwP3L
 V6N4mwk2PTD+tIqZQqXDfGE4gbH070575K18FnY7Lwu9AmSK5UpACDclrD40nWRn
 8CIq31JVJL/NsiZjIXcp0ppTn4uD6OGkaX8yz45fBCh1BliUz1AATQMSVXWjk7kM
 xQxA8WDUvh23tEHyuxZOLlFVORI+EmPWqC8lU9tqnVGKB9qPhVEAWyVQyTisOE0E
 +MvZYvb0LM7o6vFu+tp2rOk5tivNDYflEXf04Lvz3w9d2g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u7dc1xaj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 25 May 2025 13:11:57 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7c543ab40d3so202551585a.2
 for <dri-devel@lists.freedesktop.org>; Sun, 25 May 2025 06:11:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748178716; x=1748783516;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=U/+38rZUZ+yKKqj93ig1X6tei5yn0MPFfB3J8hGcDEQ=;
 b=jUYz8rBMn6HvG7LPE/aOHxfoS8fNw8DkwyfWhvpnGg/oVGNmFhIJ0H2pnPOs/mN+tk
 jkNsK/qeQdtPhyrqa8KnnRsRDRDmBBungmryCUkZyX5ieBouvOBzxAlYIMQx485w12Kq
 ioQqnGMNeRqeIFXS5YlSaqc8PAPJAQHoYvbF9b8QogIobf7JWIwOHWbtVvf4/8MOCpsf
 y7b1C11klmgL8jlGTe9H2AbtKqwyli8rdSxBRwQBC6hHZxgzDkhT1Ve8TgPv7skF7Vta
 HqUwgEVKEX6UGptw3BQBq/mJR1J2x1Vqdpdj2AI5csgH/DxRBaNyfpM6aYLu7SESGTZB
 ES4Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXhONzFvCrWVineVxUW4N2TUXFpgUP/fGchVyN+O1k80EPSP8b6jKMyzyXIoeMvapdwB1lrCfoEJLI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz17OEiA7OCroPUm5rDTqs2Ih0c+U6QGId/QIXYTjnl7FBMt4s8
 9Rhr+tp86KqKqTuMKM7r0+YX7N+D8AEyP3aGxmXTkw8kHCEnIdzrcuUYPoG0A1e+XIC5SN0fi58
 JuJCH4llo+KlVwdE1g2jABV4gvSKPgpMElW3q+TVZ0uduWqh/OTZFNqt2qx6ulpX85OkWtWc=
X-Gm-Gg: ASbGncsfxItvNlaNsY88tFD1/U8y5vQAQllWJJhE0539a2uuHpIUkMDRt9ijjqGhM8P
 mLbTtRoMoOUVGu/101aC4z2hfD1FgnkCXv/n5imXal//fjXHxhlvoN+i9MwyZNvcSJyIGqmGrqP
 mecuLCivcb9aWSevmlWi8se0b3oPzIalZR4MTiJXIjc61TasFz9oMIUwBxDtgDDaHu8pjh0FIsw
 /WIe5XHnog4HMgDhgGsXUmJMBaHJhaViS/jSRSNJhHAifVBfKStDfVocNxMLehZu1Uey9+301Av
 zOfg2OcbU32n20HPhpHbGvVsYdfsP81GzJlSJsumovvum/6NUyPAA7sRrQBvzoU2bOb3fjNqyzE
 =
X-Received: by 2002:a05:620a:2548:b0:7ca:ef12:966d with SMTP id
 af79cd13be357-7ceecbf9d19mr1005209685a.56.1748178716546; 
 Sun, 25 May 2025 06:11:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGgyG/K4Z8dfEY4Dwa9kH2DQLEzehDJ1S2mlTmorXKJn9eZezDIbjjrqIpMeBI6J6obY6T2jw==
X-Received: by 2002:a05:620a:2548:b0:7ca:ef12:966d with SMTP id
 af79cd13be357-7ceecbf9d19mr1005206385a.56.1748178716191; 
 Sun, 25 May 2025 06:11:56 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-550e6f2f55esm4676674e87.53.2025.05.25.06.11.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 May 2025 06:11:55 -0700 (PDT)
Date: Sun, 25 May 2025 16:11:53 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Val Packett <val@packett.cool>
Cc: Douglas Anderson <dianders@chromium.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] drm/panel-edp: Add BOE NE14QDM panel for Dell
 Latitude 7455
Message-ID: <5mrwrceolmwfrkdwjpixmruygr5iqob2aclqm4wrptw6ljtqdk@wb3p7pbbku6h>
References: <20250525095341.12462-2-val@packett.cool>
 <20250525095341.12462-6-val@packett.cool>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250525095341.12462-6-val@packett.cool>
X-Proofpoint-GUID: eprgzaogEryI6R4ofdMsM4d2zPgsW9UH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI1MDEyMiBTYWx0ZWRfXz4aFBs6Za0D4
 ANWNFgmrfRGYRe2NVF1q99zCnOac3CtG8n/pQqyRUJpSPBQUUS5krRuPiiOmjoFhNnkAI65U9Gr
 s7opn3RSLowrpSAv8kFTcXDlF4g7Q6+La9tKB2XGkSiYzyYCy3r6U83QGq8gdwcRvgvBdX8dEB8
 T+Nz0EYl5PCyvRw6X6hKYjGmygyH0KxLwaWuN0x/3bNc0LyYemRNbSrrhMn//bEyImDyULwFObz
 PBQr2o1chUirgzORLL5RLXPcOsGZAuA73RGSW48bY7WuvPKeAciCIqUJ5eZ4/l7DTbupXk4/x9R
 a6Qqld224vY/V3nv3VmuwNBAuL0xj0FX7qAqLEXqCHfO0P8NFj/VVLrpizq8V8+6jumMRYZFmQm
 PwnnphYyxGdSVOoCIwv9EhprNAPsEvBXn7Xjv3zlT9OiEe5exhsfA/UdUy1bKUZkqgYHGl5X
X-Proofpoint-ORIG-GUID: eprgzaogEryI6R4ofdMsM4d2zPgsW9UH
X-Authority-Analysis: v=2.4 cv=Mq5S63ae c=1 sm=1 tr=0 ts=6833171d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=GzcS8-jb-_Z-RagwDU4A:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-25_05,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 mlxscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 adultscore=0 mlxlogscore=999
 bulkscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505250122
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

On Sun, May 25, 2025 at 06:53:36AM -0300, Val Packett wrote:
> Cannot confirm which variant exactly it is, as the EDID alphanumeric data
> contains '0RGNR' <0x80> 'NE14QDM' and ends there; but it's 60 Hz and with
> touch.
> 
> I do not have access to datasheets for these panels, so the timing is
> a guess that was tested to work fine on this laptop.
> 
> Signed-off-by: Val Packett <val@packett.cool>
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 1 +
>  1 file changed, 1 insertion(+)

Could you please included a dumped EDID in the commit message? See git
log for existing examples.

> 
> diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
> index 90e8c154a978..ec7c1e21f2d2 100644
> --- a/drivers/gpu/drm/panel/panel-edp.c
> +++ b/drivers/gpu/drm/panel/panel-edp.c
> @@ -1937,6 +1937,7 @@ static const struct edp_panel_entry edp_panels[] = {
>  	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0ac5, &delay_200_500_e50, "NV116WHM-N4C"),
>  	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0ae8, &delay_200_500_e50_p2e80, "NV140WUM-N41"),
>  	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0b09, &delay_200_500_e50_po2e200, "NV140FHM-NZ"),
> +	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0b1e, &delay_200_500_e80, "NE140QDM-N6A"),
>  	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0b34, &delay_200_500_e80, "NV122WUM-N41"),
>  	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0b43, &delay_200_500_e200, "NV140FHM-T09"),
>  	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0b56, &delay_200_500_e80, "NT140FHM-N47"),
> -- 
> 2.49.0
> 

-- 
With best wishes
Dmitry
