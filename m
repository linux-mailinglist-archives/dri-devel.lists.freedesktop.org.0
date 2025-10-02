Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1D46BB2544
	for <lists+dri-devel@lfdr.de>; Thu, 02 Oct 2025 04:04:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F417010E762;
	Thu,  2 Oct 2025 02:04:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="cmFWv5sR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B860610E761
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Oct 2025 02:04:15 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 591Ibvom032054
 for <dri-devel@lists.freedesktop.org>; Thu, 2 Oct 2025 02:04:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=Fl/AGlCNPzgp60GeVcsnYx9M
 fic5Mf7tmPNGf37B3YU=; b=cmFWv5sRCfA9bu+l1CGegC0oVwCyRF1WSfXTqw7/
 c3ii2lErKalhkzrw+3kpKdGmsDL1zaD+YnGtRpvLDuKVuycB5lU87XdgCpAhqJiE
 +TnIhfq4N0cvS1XL1jIVpPkC3bJXTD8BmRez6WePl7cV7PInxkiwqdSZklVUDkJn
 btYMeJYjYB4NFud6RPq3OY8KGALvEZpojZLaN5ZsCyAJWDGWDRCMk1kGjuqZyAJZ
 7M102ffyh34kwET1EU2NFiHjgzvg4JfSsMNtj1L0tbkIYDg1eQWa9FUxpNQ4RKeG
 PlGv0De0+0Lm76jeFzC9LDflaZ0+oOo+2eT8WtcuG2TRoA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e6x5xhvc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Oct 2025 02:04:14 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4e0e7caf22eso13243041cf.3
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Oct 2025 19:04:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759370654; x=1759975454;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Fl/AGlCNPzgp60GeVcsnYx9Mfic5Mf7tmPNGf37B3YU=;
 b=u/hfjslzCR2lRpS9ysXaebVnwHew/u9ZeBC7tR8ZVTdMbdVdT1isU4QPD0f5sFb0Wz
 EglPyLkBCedz8yMPAhI7zQJYoU+rbeEyVbse8HPt5ME1axsiV6IV7qMz+atd1iv6W5Mt
 aRlYeGUpvz3wa27wpel8didFtXUCi56NBXuhiprTmrYlRWZP0vsk1zn7+fMdoeun2kNI
 lzsUfwO3gm2PG/263MwPcUFcWZy6m480+qd6th2XDBb9FkB+8LdVcbmzunU1Otot2DBg
 vvxtfSVQg1RS24aqNNN0GnJrecLEEC7Q6mk9yFgZPYsaHpu4JFWbCwUL+f9gsxNLBLyy
 /5Eg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUfVn3FdpB2HiRn5bfx0icPXnJNokYmPmn8WVA11UMa4h/9WOFFmUdfXBw/cVl5GvvxC4uKnDTP8+s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzjjpZKV2qFcu+zgq20KY+2VFNhjEiji5CfTwRUJUm/lBgg8XJn
 6bI3ra32eCovIGWqiWNbopJuw6rk7eq8c0qPW84456uT39GHS5Ht/3o1TSoRfYWt5SckxSHFpPA
 WXctXvx3dYPdK9vHIZWcNxNmTqLvNh3bVykLiwJjZkNJD1PsFY07mXcZ6lFqChCu+5KthTV0=
X-Gm-Gg: ASbGncs2TMsmitNdqpGB0+q1+9RvLCSzGbUXUnn6Xq4du7OaTgL3mrL2nplRPou9psK
 OV2Sj0H8O9aih2mhWo3ao8KpRVMK7qr/5jnwUt4azgA1CZgo6nkT5XuP+F6YITNXy7dTh+yQz5Y
 mcv5qi3Hh6l865BjHYsBNRIc22KmLNShfMbleMqA7hR4l6BzV5bDmQs0c6NJG4BwDbNutHL8cgU
 Q5zOYVNd74XpiVo69t+GG3/aDkdJLQAf+jNzjEy5vgmDQZHJgreiEo2sYxIFN0IwRJXME54e9lR
 ua7f8HdqlWih4Ef0gb32jkYJeod6z83XTv1IsmHih6Lut9Mly/4mKbxNQljHvh6Ie0Q3AwouOPg
 KxpgHFkZW7e6agEZdl3ndfV/IMVVy9hPc1BZmyGV4QhJu+pByYwf85eMq6w==
X-Received: by 2002:a05:622a:1f85:b0:4e5:6eef:cf5d with SMTP id
 d75a77b69052e-4e56eefd0e5mr3437631cf.82.1759370653949; 
 Wed, 01 Oct 2025 19:04:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEMNoV8VxZzwB9ISG0Qcqu86I8IUKjtKfBRp5TKNTJODnfTge4BFASA8/Hk84j8esTc0pEIqQ==
X-Received: by 2002:a05:622a:1f85:b0:4e5:6eef:cf5d with SMTP id
 d75a77b69052e-4e56eefd0e5mr3437251cf.82.1759370653504; 
 Wed, 01 Oct 2025 19:04:13 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-58b0109afbdsm390835e87.0.2025.10.01.19.04.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Oct 2025 19:04:09 -0700 (PDT)
Date: Thu, 2 Oct 2025 05:03:59 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Junjie Cao <caojunjie650@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Antonino Maniscalco <antomani103@gmail.com>,
 Jonathan Marek <jonathan@marek.ca>, Eugene Lepshy <fekz115@gmail.com>,
 Jun Nie <jun.nie@linaro.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH 2/3] drm/msm/dsi: support DSC configurations with
 slice_per_pkt > 1
Message-ID: <cwgn24f6tnmytd4omr2tul4e5jjin3ijji3ff3qkumqm2xe3t3@ntayu3m5kai3>
References: <20251001135914.13754-1-caojunjie650@gmail.com>
 <20251001135914.13754-3-caojunjie650@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251001135914.13754-3-caojunjie650@gmail.com>
X-Proofpoint-GUID: fm4cgHjs1eR3ZJbf17m0ezud-w3fDLa3
X-Proofpoint-ORIG-GUID: fm4cgHjs1eR3ZJbf17m0ezud-w3fDLa3
X-Authority-Analysis: v=2.4 cv=ZtPg6t7G c=1 sm=1 tr=0 ts=68dddd9e cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=KKAkSRfTAAAA:8 a=RAbU-raeAAAA:8 a=pGLkceISAAAA:8
 a=chGVdZ9yfDdcOS25WoAA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=cvBusfyB2V15izCimMoJ:22 a=JiizpSU_mAIq9zsZDqn2:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAxOCBTYWx0ZWRfXyKpGAXyuNC66
 4ZUawX7NqwXS2G1deC+KNgOsGA5yGbKxp2HNE50RyEq36XmnU95yTn9fB7mLlgPa+VBRT0v6xSP
 AIbX4j/KExGPBugYbiSBOBdlLRF3ILNfoNM6OIorKa5YSaBf7LumqxAh8zIJ7FYSxqEsazVxi39
 XSM5++MlOGyi1AYnmZ/i3zVjI+jXzYORm3DLg6RtDRO1LmoSe+tJKtNdpkeymBaPLlz3YeOdvQV
 NtxhCIeBMwHkMVezbuqh1wIbPspjFH1ymiXLEDvjtwSEjwyJN370XReYlZKEL1+fdorkPx7ynpb
 THF6QGSxJOyIPIBmWR2Of03F4b1DWJ8iBqqm5ljyikNaVnPIfCyH6lsTBlD8ubHKgvJ1AfVSyC3
 wOyulzK1rHt7vsrwYTGG8Ytag89XKw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-02_01,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270018
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

On Wed, Oct 01, 2025 at 09:59:13PM +0800, Junjie Cao wrote:
> From: Jun Nie <jun.nie@linaro.org>
> 
> Some panels support multiple slice to be sent in a single DSC packet. And
> this feature is a must for specific panels, such as JDI LPM026M648C. Add a
> dsc_slice_per_pkt member into struct mipi_dsi_device and support the
> feature in msm mdss driver.
> 
> Co-developed-by: Jonathan Marek <jonathan@marek.ca>
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> Signed-off-by: Junjie Cao <caojunjie650@gmail.com>
> ---
>  drivers/gpu/drm/msm/dsi/dsi_host.c | 25 ++++++++++---------------
>  include/drm/drm_mipi_dsi.h         |  2 ++
>  2 files changed, 12 insertions(+), 15 deletions(-)

Please extract the generic part, so that it can be merged through a
generic tree.

-- 
With best wishes
Dmitry
