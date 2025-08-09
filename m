Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7875CB1F1E9
	for <lists+dri-devel@lfdr.de>; Sat,  9 Aug 2025 04:15:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E60810E0E3;
	Sat,  9 Aug 2025 02:14:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="IQtr0TCA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B78E410E052
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Aug 2025 02:14:56 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 578FGGHH008113
 for <dri-devel@lists.freedesktop.org>; Sat, 9 Aug 2025 02:14:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=d8V82vBwUz1mJ+IWuJuo2vsL
 /UFk1BqGFbx/Lzd+kf8=; b=IQtr0TCA51V0mY2vJcxwuMa31dpLyn09YQndPGAQ
 A3OZw2KyvMcC3QdCOOdDXibEQxO/wXrJJj8VRgTI5TWUWVdYXemWlaTHCzX2mKg6
 /ZjWguNe9BwlAE1Px+zzEFmMqGkR1XNgIW21jEzqW9djN8Ql3kSYOcwutgptrdj7
 H70st6UGLQtW6HLcv/59csvO5g6Oc04FoSNDjT8QYi9JCqerP7a6Mf8h29z3CyLD
 VxR0BihDXoNfq97n6fbtlupB6eiqIXajqC9wctCo7rjXN9v5k5B75Avnb9/NMAlT
 g09B6ofPria46uQ0aR+OScIKET3vdp2HhF1NRy3Qg8OXQg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48c8u28q3r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 09 Aug 2025 02:14:56 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4b08898f776so64298701cf.1
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Aug 2025 19:14:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754705695; x=1755310495;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=d8V82vBwUz1mJ+IWuJuo2vsL/UFk1BqGFbx/Lzd+kf8=;
 b=k/RaVsIXRrYSDV0hgkZnjWhj16eVW3/XT0HZrz2Ap8lCsdk0/Shkev2bJHKZYseClq
 rEW+Oha97SIqzF/XSWL8MzHOL2LNuYml/stNwlxvVpkK0C7HJ9YQJ3dG5H26CCtQjBz7
 lLw6tvgZ4MNAKnJS7rItwHljRR0hm4hUcCBV2CODiH+m4IBgeE21GGP73b+FRS0nEWhx
 pKdlkMrwicVTlp/kNxfROsLDnSQtWI/iFhJyEUD4kUksPWOaoqSIyNQFHxdUnwO8EvlD
 Cb7ccHDy7BIu6xa7mCmWMijl4Hi/LyNPc3Yp1gveLb+3/YJAzqcokIMHSasigdACahWS
 jBdg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU4Qerq/c/fS3Mg5d9TlwE8F8NuGYhGnf3Q2sXyp1FWCdU58LYy7/B8V0aM87mm+WvYSYq81QwMiDo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxU3Tp9CQudnz+DVt0Y6l0DlU5PhRo3SjpuMBtwwR5iULeqXwxu
 txjrSC6gcrzpye4tjrNU6jFNe0C+d+UP40Mkdnwt0LiZdCjgKXoOXBotvfQKkRxI4GE7RoamIfW
 oIi5gcFpPCxwJZXlk8SdJ9TL6ypQkHRA/Rw0hSCvByXTVRaGEVmuAv35zcv8qBouO9YWy8sg=
X-Gm-Gg: ASbGncvWb8lxvoY3uuax6Ggvz5ijzmST0S6TkkfESNg7aceZECCHkac1ovevRqMk43c
 cJbD45D94+N0puFEoJRb7Driare1OWY866DjQcOZ1mxlKAoZSRULzoD631dU4mKxrcVU6aSfGqP
 0vutQl3GbSh0qwVdnifyGtECHymYoilN7rCOmGjCDkBaqK60vxxgJEeZzbuxVN9kzqZCvz6tPkv
 vKbZwYmKBEZM4shPuQm7yoHXViw6ekxvhBe5rCOx0pwKrQEL7JyTte1zpONoc85EIgSdnU7JcEn
 ymF8LV/c2riF6ALAyszyPgc8DpTRxzE4mXvKt0c79SPgCbEHujFrndIidCs0Ej15lvkteifYG8D
 6xTm+T8i4+7PB7PJxEC1r2bQU7lE0Pm2QqJxr65A7Wk1pjNy24nLL
X-Received: by 2002:ac8:5749:0:b0:4af:1f61:7d39 with SMTP id
 d75a77b69052e-4b0aed21313mr106146061cf.29.1754705694685; 
 Fri, 08 Aug 2025 19:14:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG5aRbQ/NlwN7L7iMrcnkgPVM/w6fIHpvroCwE+0c/uE92MdaewoP1y/ibErVYY6x3kEp26cA==
X-Received: by 2002:ac8:5749:0:b0:4af:1f61:7d39 with SMTP id
 d75a77b69052e-4b0aed21313mr106145681cf.29.1754705694224; 
 Fri, 08 Aug 2025 19:14:54 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55b8899f897sm3194466e87.49.2025.08.08.19.14.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Aug 2025 19:14:52 -0700 (PDT)
Date: Sat, 9 Aug 2025 05:14:48 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Yongxing Mou <quic_yongmou@quicinc.com>
Subject: Re: [PATCH v2 05/12] drm/msm/dp: Drop EV_USER_NOTIFICATION
Message-ID: <ykbudesvb2ya2gbtgbyrcn5niesul2bnpfsrl2hourpw56zwdn@y7kmcd2ejwxz>
References: <20250808-hpd-refactor-v2-0-7f4e1e741aa3@oss.qualcomm.com>
 <20250808-hpd-refactor-v2-5-7f4e1e741aa3@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250808-hpd-refactor-v2-5-7f4e1e741aa3@oss.qualcomm.com>
X-Proofpoint-GUID: cg3-VBDofgOgGiUb6fRulMBMZHTsEeyb
X-Authority-Analysis: v=2.4 cv=Q/TS452a c=1 sm=1 tr=0 ts=6896af20 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=93MD9rSA5G_0oRVq-qYA:9 a=CjuIK1q_8ugA:10
 a=zZCYzV9kfG8A:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: cg3-VBDofgOgGiUb6fRulMBMZHTsEeyb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDA5MCBTYWx0ZWRfX5HyX7miSmYcd
 JRGi6mMTAKjo8IMZDVqsSnO5y7nqIE/iVdToXTIVGARX2kJFl5FwmjVQEBzcJI/qvrqqI3zCruF
 c4WUZKfLwYhjLGq3BR2gxvAF8BCraAp0qUqIXUvDPnFyvjAtlsIA+9LjTMG0dSkXzwa36K40Eki
 Pi70lPnXJQP1kCWE47we1HMuDSSI5hSDBAaGn8q5c60o59R4uEluHHFZN7IUcfVszERTfBM++nL
 xC9gsBP2zXMRhtn1MsxMtZ48HLuYuEHsYGKDhD3Lgf/t45LG0sW/yL3E2Zxhf569q/uT/DncN7T
 l+omn2/x464YvSB2uoL2g5uCB0kPkWHCTHGHgHBhtTKAPp1HW4MIKmn7tesHKY4wEqY98gy+vOh
 3uh2BdQu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-09_01,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508060090
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

On Fri, Aug 08, 2025 at 05:35:17PM -0700, Jessica Zhang wrote:
> Currently, we queue an event for signalling HPD connect/disconnect. This
> can mean a delay in plug/unplug handling and notifying DRM core when a
> hotplug happens.
> 
> Drop EV_USER_NOTIFICATION and signal the IRQ event as part of hotplug
> handling.
> 
> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 11 +++--------
>  1 file changed, 3 insertions(+), 8 deletions(-)
> 

This removes serialisation around
msm_dp_display_send_hpd_notification(). This means that it can be called
this function can be called in parallel, so we need to add locking
around .link_ready access.

-- 
With best wishes
Dmitry
