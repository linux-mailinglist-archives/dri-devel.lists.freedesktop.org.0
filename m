Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F347B19CED
	for <lists+dri-devel@lfdr.de>; Mon,  4 Aug 2025 09:49:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5700D10E40F;
	Mon,  4 Aug 2025 07:49:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="nCYLKTvw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9900610E40F
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Aug 2025 07:49:31 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5745b4iC027426
 for <dri-devel@lists.freedesktop.org>; Mon, 4 Aug 2025 07:49:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 STOBvxiI8njI7r5I7q2kaDJJR3rz10/Df51mAVUAL2M=; b=nCYLKTvwlBRCd5Y5
 Huoer+5K+4jcqskDQy9VGJXXSx5AXdIp7RkOC71MHy11ztWmUZsYNKlQskz/k6wW
 W1uuVX3UBnC3srBzrEcchKDgNAXWEcBB5dGm7M7pxwvDMvE0wF3alAOz7BnjD/lJ
 HD+wjas3BDcMIYUt21AIOEOm39EqD/c9YQMCUCINBlw6YDP0y/oeTSrchQZwAK9f
 +TGcA4Y300UYQCCqjvpp6grEyJimOlf1SIPFF5wTZPUzRVYwquXJo5+Ysdc+pID8
 gYdHQOuI+Wc3BhJ1i4NLZinTPRf3DX4QQaR4pld2FyrRkhvU3lL8LgIyPKrG1cQI
 HW5A/Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 489arwkx5p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Aug 2025 07:49:30 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7e69e201c51so234937085a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Aug 2025 00:49:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754293770; x=1754898570;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=STOBvxiI8njI7r5I7q2kaDJJR3rz10/Df51mAVUAL2M=;
 b=T2HZqNUjyU1xcntDFTSD70zMIdHIzEZl53zT5tCBLKXXE+TgJOtBaPSUaYNmIMzDI3
 USZrJy6iYaxc4eEyqZkukES/X8nEHjy8X0wQhAe0o64lR4Hsx65RVnYSR3CxW8CpgIiW
 bg4f99nt7w9BuOj7uKWhyp7d4jBUSsUAKB03U60CykvXa4TttC6IuUttGXua5vL9bkY8
 jlfMkeiZyycZds4xIz96MbNCIikLJwPT6fKRAQv0xqlbgB+XxglJMbo2GZxqIr5rMd9Y
 XTso16DFicyR4M8e1RhXhRI+unSJpbvApEe1bCNm2xc8rfTqZ1haeObSOUguQIpLc1b6
 SEXQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWfsJ7sopBjZc1SFLWFLQQ+3pJ+pkFT0zb18YEC0v9NZ+Iu/Vo/P6zg0jjlWRHX7cAzqu9obh+7BsY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxcV3eZdcT6WAxEqDzhIGDqBoc/Y+fRfBh+P3KaUocHiwLnSPrt
 TWZDCChlsF3BsMhHUmYyYErS2dwKh3li+G7WFxjS1D2D1APTuxYFG70phgYMtcgrgOXD6Gu7pup
 t6JFPGSpb3QBcGB52zgLUM9RGEnDpWBgWExy3dlqri8IR6sMUY6gy6Kzqdm4tiYEeethXl1I=
X-Gm-Gg: ASbGnctIQi4DZASp13LIMI+sPPhVWdzT8Ljog7Ju8SAeDe0bHYc3zVyVxjmVOpGdJew
 80bb6RBuuqyH5IXxaiWHBhn/bbfzCKNfekoBupGHbIW9DsuD+oYiUMGzwJGczEUy+H0zscYnWcM
 7CPnSIt0itGGEUPZviFQNpBUPxi+4Rv1l0H4IUUaJd6YnFy07mKujnxBjq/bxHqvSI57sTJj3Sz
 05j6Bh3HtJ8vIq18ATNv6WwZ/vgPJxhL6jJWbSLSzq2IEPHLPaFpGWRTBxGV7XuwomqMv1yG6IO
 XtGeQdYARI7crPPgq7tvC9Cq/RJohouTG8QhSxL47Bjt6m9Js3i3RV/d2guAX2ykJ35SpIZy4/P
 S3/pQ6mkMgPOXVWbfdRFWdOA0wSWhbONxSFZYtzDisgvRs+wqgsPY
X-Received: by 2002:a05:620a:8c2:b0:7e6:8751:96ae with SMTP id
 af79cd13be357-7e696354949mr971850985a.31.1754293769756; 
 Mon, 04 Aug 2025 00:49:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHsguIUFIUKHYWXeH9zorTXCF1lcfU5CMnhov8eyA4nrE5HjM5lQxXvbmcppBsUJW0Xd8BB2g==
X-Received: by 2002:a05:620a:8c2:b0:7e6:8751:96ae with SMTP id
 af79cd13be357-7e696354949mr971849085a.31.1754293769324; 
 Mon, 04 Aug 2025 00:49:29 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55b88c98c35sm1583782e87.97.2025.08.04.00.49.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Aug 2025 00:49:28 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Andy Yan <andyshrk@163.com>
Cc: simona@ffwll.ch, sfr@canb.auug.org.au, airlied@gmail.com,
 jernej.skrabec@gmail.com, jonas@kwiboo.se,
 Laurent.pinchart@ideasonboard.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, neil.armstrong@linaro.org, rfoss@kernel.org,
 tzimmermann@suse.de, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20250716125602.3166573-1-andyshrk@163.com>
References: <20250716125602.3166573-1-andyshrk@163.com>
Subject: Re: [PATCH] drm/bridge: Describe the newly introduced
 drm_connector parameter for drm_bridge_detect
Message-Id: <175429376814.3371239.2255431284571654871.b4-ty@oss.qualcomm.com>
Date: Mon, 04 Aug 2025 10:49:28 +0300
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA0MDAzOSBTYWx0ZWRfX4KFnR0UWSB07
 QXK9z9/5JspKsW090jWrjYf4crOTsa/pjATZRMZSVpbCgPqKjbAYTiQ0AB0Cj8o7uNBnkjydwpq
 bxLCjbz3U6d016X2fOpp6kHPLinvzwP5kxzG9fTPwa0lofuTnJEhZbJf2txJKxivZ+A0k2u/5ph
 tAspKMWJwV4wpevsEoIQ6bMbe9uBgRi9+9pWKweVH/OB5wOTR6g1zqZ81KAuJ+YaxkDz9OifbBQ
 wMEZ/OIX5W+cM0aY/9qsEbn8Zj3e7xNdJL9dy0wn5ip+As2mPB+9Cl5h2qikSj+KBLAfPaaRcOX
 vrbaPCH0YzV9I0+ghUho7j2F/blFSE1IkhW6JViHgE+VeT8LoXmm03qFOI3Nsp6pLsO+OWtoOXV
 2tR4XTi/X6wmFltalpyNusy0COd0iF7cnxHmcGBL/feur1yYzMxsCMTRMaPhYwOZmqDhufxh
X-Authority-Analysis: v=2.4 cv=We8Ma1hX c=1 sm=1 tr=0 ts=6890660a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=Xx17V1t0QfcI18h7U9IA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: QLnRgbkjymlmokPzdGJUpUsKe7pgYY1L
X-Proofpoint-ORIG-GUID: QLnRgbkjymlmokPzdGJUpUsKe7pgYY1L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-04_03,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 malwarescore=0 lowpriorityscore=0 impostorscore=0
 adultscore=0 clxscore=1015 bulkscore=0 phishscore=0 mlxscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508040039
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

On Wed, 16 Jul 2025 20:55:55 +0800, Andy Yan wrote:
> This fix the make htmldocs warnings:
> drivers/gpu/drm/drm_bridge.c:1242: warning: Function parameter or struct
> member 'connector' not described in 'drm_bridge_detect'
> 
> 

Applied to drm-misc-next-fixes, thanks!

[1/1] drm/bridge: Describe the newly introduced drm_connector parameter for drm_bridge_detect
      commit: 584460393efbcccb6388b1cd5d37284b5326709c

Best regards,
-- 
With best wishes
Dmitry


