Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D562B593FD
	for <lists+dri-devel@lfdr.de>; Tue, 16 Sep 2025 12:44:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22D1210E6F0;
	Tue, 16 Sep 2025 10:44:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="G5NIFOps";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEC1E10E6F0
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 10:44:18 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58GAC7Co019627
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 10:44:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=8wYensUaEHI256N+iplvY9UI
 jrhP2hMwlPOJQPQ6HPQ=; b=G5NIFOpshCViWqV8DwHOLnOjfM/8ROWAPMLVLCwo
 iys6HArs7KCkeXHwEvixveko/5pY3Pk/XvyDA9MNCWm5Bmi6AgZKEzgXz6EQ3uu/
 Yn5EXdSk0qIXjNObfM9MOGP2+zGdO5X4ZVm2hgepE4BFE/b/hCyOUjqFgX3W6RDy
 v2EiHb276JiZClNt4j88R0sxNxCIvbK/LBRXTaNzCCX3sMtZUCX4jPgNM7C4kAsq
 +gbu1Vna9XE+sMXpQHkI5j+ctq1mqiQtNux4nmgF2W0TEjcAPfBY+3+ZlCklnxXn
 tgsdVr8EjqAnmZR0l2YqL+XfteFcMZgi/96g6khCDczAUw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 494yma8hvs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 10:44:17 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4b62de0167aso136043161cf.0
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 03:44:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758019457; x=1758624257;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8wYensUaEHI256N+iplvY9UIjrhP2hMwlPOJQPQ6HPQ=;
 b=rkx7ZggnYhYmE/6HfHEcR1UrbYMcu0QVNrJMqg8HJqcwAuAJlZ+SeBMna7OPFhIdk8
 Rf/7AIeOYjHyppIj89NDmk4ZwSl10jiwuLKrMv9DkJ/1RPuEAe6Sv/ULm7e7dXswDdyZ
 qaXjd9DXK7dUop4f6H3lQaEBHKIPQOb5TNig7wiGZG9QjWKSwvxJZATB5bm1skyzf7K2
 CW6Xfzd7wlJA0Ni4gY8AKqUYEEkky8D+j400FUtsDg3BXyATn14OLuFZDVZfCJveJ8AC
 ZbD5pvP+HjSLMRtH7l6HSsG4a4czny0tgoG56t8ZgAj3g7Uwffx07LP1l23wuw5Q4sPC
 pRbA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWd+8uFaqAfMnPKy7SKuRFd8T9DG4kKlzyhKX4AVawwliVTK2akxv5C0K3HPlzQRQh0p2GpIRNiXZg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxD3ueid8tfQ4lqaeZ7DWOsyJnqgeTWcYXB5JEtA7tflqtWVbTD
 0sn3n8Z6nnhUObLJBhm0mOgb7puyl3G0MimDE/mhiI9tsAIYzE0mfUzVnMBkmCyZGiqgNP9n6mi
 hyeZ5lf/0tSAT6rBkUJr7rIjetOmHmmLuteZr0+1ZxjPw6lmxzQ4bSaVtGa+mjokiLAUeD6Y=
X-Gm-Gg: ASbGncsGO1byocTd2EH/85OPglQDt5iP5amZqv2zOzARs6IlzvYvyKwIhYVJdEX9WeU
 wxlaa+j0aF60W7yrOohVgWGo9nb11Ip0v3N/IxVyAgQ3+wWDarzmXt1N1UYtyitp7mxDfNj9GeR
 zOCgXrJQa7lXrkOfIUGNH0wUwz7DNlYQf6LvW+Uzs7Q1zN5Rjjfsnx59UCYvTr1fjQE8MDBw+fD
 meSHCMaeOF/3vUTMwqlB6OG6nrZl+PgeV6QZbME7Das/i1pimPfIa9Ar1AZxh4YhrSEbz73DwHR
 Spux1J7fU1geEdUtHYue/hjlsC2PYoDuvfJ1yCIK7z57k67KUfiwiXENtUKKPM5mUZkk+UCNlrc
 w3ncKIuZkK9tqSicsp+HVZ6VC2LzhmeIlXeRHN/POGuy4EZNhlI8z
X-Received: by 2002:ac8:5dcf:0:b0:4b6:2efe:2f7d with SMTP id
 d75a77b69052e-4b77d013581mr209416101cf.7.1758019457053; 
 Tue, 16 Sep 2025 03:44:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH04kzVjqBUejzNfxC95RPp6/N2Ck+VgtP766oUDXmmp5pGA1xivEPfnAa+GkL6F/7JU5Q7VQ==
X-Received: by 2002:ac8:5dcf:0:b0:4b6:2efe:2f7d with SMTP id
 d75a77b69052e-4b77d013581mr209415821cf.7.1758019456554; 
 Tue, 16 Sep 2025 03:44:16 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-571a6d0e20csm3122441e87.38.2025.09.16.03.44.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Sep 2025 03:44:15 -0700 (PDT)
Date: Tue, 16 Sep 2025 13:44:14 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Hermes.wu@ite.com.tw
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Pet.Weng@ite.com.tw, Kenneth.Hung@ite.com.tw, treapking@chromium.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND v3 4/5] drm/bridge: it6505: modify DP link
 training work
Message-ID: <qh4owmpgeo2fyow7zlysef6wvunzr7n2rzudomf6iuujwgb6ew@i5dj3raq72zg>
References: <20250916-fix-link-training-v3-0-0f55bfdb272a@ite.com.tw>
 <20250916-fix-link-training-v3-4-0f55bfdb272a@ite.com.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250916-fix-link-training-v3-4-0f55bfdb272a@ite.com.tw>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAxOSBTYWx0ZWRfX0xd06SGMs33b
 NTuZNQFSV86tsY7GcW9Za3px7usLlz8JEmiVUpClET7G83nMTFec8YbEmvCHbfuWskyiVrsH2Vv
 cz9mIWQiHqqbSn0q5JoZuFxkQi0/b8rEiBSmRKoDKc4hOuSTtxED16RYPFml4vyIRB7H7bmORK9
 dtWm69AV+vlB+51HUOCb3DJow4haU8U6dEh9OrAT1TlmjbuLxIg251HVeQc8pT2ymqfo6pZacCQ
 aOkJJ2V8tExAOwO/L9FoicmgQOt5i2RcQq09g0Ha3dQhMbagAIcXNaeHXdOvVaDjbXMteB84jOM
 7GrEdFJFnQbiT1KWypkNwk60zhuiDCJNkduX7wmy7hi0uadmabSQiqz1oYePdfwEX+Ms4/q+FPR
 l7ytmx+7
X-Authority-Analysis: v=2.4 cv=cdTSrmDM c=1 sm=1 tr=0 ts=68c93f82 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=Ns9eNvu6AAAA:8 a=EUspDBNiAAAA:8 a=lEZlqnAI4VSGq44jjTwA:9
 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22 a=LZLx1i01EnjtqRv10NxV:22
X-Proofpoint-ORIG-GUID: On8IMrIM63xSA9mgQOMO8F6bvgbQLSPL
X-Proofpoint-GUID: On8IMrIM63xSA9mgQOMO8F6bvgbQLSPL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_02,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 adultscore=0 suspectscore=0
 bulkscore=0 impostorscore=0 spamscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509130019
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

On Tue, Sep 16, 2025 at 12:47:44PM +0800, Hermes Wu via B4 Relay wrote:
> From: Hermes Wu <Hermes.wu@ite.com.tw>
> 
> The DP link training work include auto training and after
> auto training failed "AUTO_TRAIN_RETRY" times, it switch to
> step training mode.
> 
> It will more efficiency that finish link auto training,
> include retry, and step training in a work, rather than
> re-schedule train work when each training fail.
> 
> Drop auto_train_retry from it6505 structure,
> and it6505_dump() is remove from link trainig work,
> it takes too much time to read all register area,
> and is not necessary.

Nit: please fix your editor to wrap commit messages on a more typical
boundary (72-75-77 chars).

Otherwise:


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



> 
> Signed-off-by: Hermes Wu <Hermes.wu@ite.com.tw>
> ---
>  drivers/gpu/drm/bridge/ite-it6505.c | 40 ++++++++++++++-----------------------
>  1 file changed, 15 insertions(+), 25 deletions(-)
> 

-- 
With best wishes
Dmitry
