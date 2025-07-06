Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0356CAFA4BE
	for <lists+dri-devel@lfdr.de>; Sun,  6 Jul 2025 13:14:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A0E210E130;
	Sun,  6 Jul 2025 11:14:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="NjnccWlv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4086010E130
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Jul 2025 11:14:18 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 566B0eJa019265
 for <dri-devel@lists.freedesktop.org>; Sun, 6 Jul 2025 11:14:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=lrSM8BW2HndVBSoj7s7FhZs7
 d3IX6Be7fW3wKRsVstY=; b=NjnccWlvZ8Zf9Dbyco2U/mrZHDEEAioTaJOyCe3D
 u+V3eyM4TkHJebOvk7//wbMExSPq16IDbMcpFwK17Y9j48KQfU5dZbyNFl17rDxy
 zjQ/bZet1awHs5MMnEhOQpJw84S4MKYCqq2a0TgjHGZC3CmBhRBfSq1n+UnycpaC
 RxPIgJzNaVVCj+9sid3S9LAyKk5oZnJh7oJVNH4nmDXUHdNsn3rOqSn8tZc71f7W
 /qGxh9HNDGHK0xzs/5v/xT2whOLN5bxwcv070+z5VdJh7Zw1gA5axVq6HYRM8Gf4
 x79XOADbOYH995mU/SIq56xWoCr+m9FmG3eUN7REBHXt6w==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pwbd3g7n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 06 Jul 2025 11:14:17 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-6fac45de153so31108046d6.2
 for <dri-devel@lists.freedesktop.org>; Sun, 06 Jul 2025 04:14:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751800456; x=1752405256;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lrSM8BW2HndVBSoj7s7FhZs7d3IX6Be7fW3wKRsVstY=;
 b=RjNjsS+ZWlFU2Gun7WW+1W/KLiOpG0E+sCLYk+SLEEboXH7c/pPTgu0zao74YgsNUx
 AfRCe8Mjjhl/3H1f4178ANQpz2AJV6yy9POpZ/Y203vS/n/mWVhbjiPpQF5oIVLXp33l
 DbB45ZXCNZXRRzZkm9RqzGIIYLpUiSyo7ExfL+FJj2eEDsR/PR2CBgzKfjfI8022IIvj
 en/U57jdUamh9SZV0JtmbmWQh9e3QFuzQ0HbNFtYNDdLFh3vnszl8wV8yQtlG+xh1Wdf
 W6Uwf4WYLOMFk6UqUz/jE639cpsAALt3laHKJhvbPYiGBaI4L0FmOsf0iJx+IaYwsIHC
 W4lw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXon61DfVQFFECPAuXsAGZ8g6OEfzXkm4AnDnaZi/zNY+wNUH7fcrtE0THCURVk5GqnkETsErFxkk8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw6bO0sHamQCYYGJq5RlpRTh9hfsyhJAV67W77hFBfa1NwX5Uof
 onE4u64r6JHxGUoyEyn6OaND+T4QhJXuA/N8YHSI8yYs/ft/3cfurXOBwojjple6muOJc23b9ls
 Ach99mzAv9swLNyWfQqS6VnB9DLQZC52+9H3OO+WfaqQiVRz0tg9RupdKKx4XU4WiEsR1cLzWQV
 B/ofvsIg==
X-Gm-Gg: ASbGncsuuVT6LECzm2F405+LxPRgQV8JGIrR1oC/+Lncnn/6spwwbj2QgWkCEkaiRpF
 LZMKmwy+kQRtMHEbYi1qV5/eaWEcUQWzIJc0CbiTHGnajHCASVNQiEw6bWOh//bmnATF7PaEhNN
 nBJnBgF1A1Av17H+PJIE4mc7VD2xn6Xsvc4bRuYzRPwtc190kyitqekfJfL6842o82X15osTn81
 5UZ7eYqVxGB7J/4M2/nldtkB0o2sOg8E5qSgGlJ76of7rO5adqRMikxeAqHOd2gAHtQB8o8sxMj
 K/EPrUydVLR2RrABWAydflpRTyC8SOFjW7y1VD+JpS9p5hsQTh4QhkDvntyHPyPz+eCcd2jYvRg
 huj2Pq8jF7xYD5qw688tldS8FCz/2Ee3xGwE=
X-Received: by 2002:a05:6214:21eb:b0:6fd:7298:a36f with SMTP id
 6a1803df08f44-702d171dc05mr80227606d6.21.1751800456058; 
 Sun, 06 Jul 2025 04:14:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG3tVpmWS6ULWjjoEzDvnHa4iP9ltUJU6hMVJCwNkucLTWgzKEQo0EkOAPEAKMG3p6BoF+iLA==
X-Received: by 2002:a05:6214:21eb:b0:6fd:7298:a36f with SMTP id
 6a1803df08f44-702d171dc05mr80227316d6.21.1751800455658; 
 Sun, 06 Jul 2025 04:14:15 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-32e1aff4e38sm8826461fa.50.2025.07.06.04.14.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Jul 2025 04:14:14 -0700 (PDT)
Date: Sun, 6 Jul 2025 14:14:12 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Helge Deller <deller@gmx.de>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/5] drm/sysfb: simpledrm: Add support for
 interconnect paths
Message-ID: <ypjcqiyfzjobg4zsm5sowjtu6ctvzgd4bvt3wpbqbb7o7f3rcm@q454aob3wwth>
References: <20250623-simple-drm-fb-icc-v2-0-f69b86cd3d7d@fairphone.com>
 <20250623-simple-drm-fb-icc-v2-3-f69b86cd3d7d@fairphone.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250623-simple-drm-fb-icc-v2-3-f69b86cd3d7d@fairphone.com>
X-Proofpoint-GUID: uZn6CvAeUTm2BBQmkU-BOnHF3sMcXI9o
X-Proofpoint-ORIG-GUID: uZn6CvAeUTm2BBQmkU-BOnHF3sMcXI9o
X-Authority-Analysis: v=2.4 cv=e/kGSbp/ c=1 sm=1 tr=0 ts=686a5a89 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=6H0WHjuAAAAA:8 a=EMKPgfd9biIQv-X5rfEA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA2MDA3MCBTYWx0ZWRfX+IUfD9ySzrNW
 y3JCJ5Nn/zm6UhC6iOiBEbAtAOHR/3sl8f0KGl7s7qiBNTo8zOvBaTo8vuCdzJG8UAuSAXedWT0
 qxQZFmDIAKfM3v/czp5oZt6BCSsD3WNJphRYe6WN8WjYkH3gXJf2xmln2kkXbyws7sPQUn0CODn
 zBKcDd3OZL0hlrV6l/t+9mlz0NtHPMWRRFkNi2t7AEWFLpZIn/jADgCwwy5cU4w7OAcCsL6h7sh
 edSsfCDm4fPGuVOSezkDJgdmWxjchYX8B4LKOHdJFjgIcuL4ZArmN9T1gXqXTfQ5RcejXICaC0x
 jr2vpWSxXTKaf1ohWUnVJtVQeAXubEbHIAXdSbMDEROvS0I9oMvoePOjkNYwBkf/WqRQZ9zKHMa
 LMyAzQmrJ2ALHOT7HQXaSsCcLUtWMycYKFB7BJTxlJbUK6MQVZ7fWtbNYISAXm9AOWr/vwJN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 impostorscore=0 adultscore=0 mlxlogscore=999
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 mlxscore=0 phishscore=0
 bulkscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507060070
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

On Mon, Jun 23, 2025 at 08:44:47AM +0200, Luca Weiss wrote:
> Some devices might require keeping an interconnect path alive so that
> the framebuffer continues working. Add support for that by setting the
> bandwidth requirements appropriately for all provided interconnect
> paths.
> 
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  drivers/gpu/drm/sysfb/simpledrm.c | 83 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 83 insertions(+)

If simpledrm is being replaced by a proper DRM driver (thus removing
those extra votes), will it prevent ICC device from reaching the sync
state?

-- 
With best wishes
Dmitry
