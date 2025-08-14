Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EF10B260DF
	for <lists+dri-devel@lfdr.de>; Thu, 14 Aug 2025 11:28:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC7F110E29E;
	Thu, 14 Aug 2025 09:28:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="c4iccqO0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CA7810E296
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 09:28:28 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57DN86EW025642
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 09:28:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=O076QscBlfaSz8F8rEYXMUKe
 ydobwM2fUce6AJi5pU0=; b=c4iccqO0EpYkH9FlIOWuAAX4vE+ax/m/JH/fRlbb
 t9eJgwcJ+5InT7JIM2Txed7ag9OTSWtkpyrYw2cv5tr4C/Bj9nMemtKdTxly7w+G
 6xJsDYtZVXn4de0Ch6I6PiCvND/NVK6cVDFb/14nB+Hdijs+xNpcWfBRkTb6xFWy
 DB6Tfjz9+fpsrvF74b9+m+n2saOGXxjoOZI5lXpy5vmAaPAUYirCnvg9IWUZvHT4
 b+VazyBmbJAXOKNh+PwVcEj6816hGiMib3v2UH3n/dk72oVu23tc/sqGvg+JlcXH
 9+5aBS/XHa6jg8uZARpyzPpdOoorP6E953G4MUM4yzL3sA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dy3gf2km-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 09:28:28 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4b109c5ac7aso17556081cf.3
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 02:28:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755163707; x=1755768507;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=O076QscBlfaSz8F8rEYXMUKeydobwM2fUce6AJi5pU0=;
 b=WsyaNCuHMmkJr/XVh0Q/zsWa3u1sDR158AWzZh/dQtnJ1THbAhlnY2YMLqqhrSVD6V
 KD208Leu19L351aiRjiMyCM+EeuxjQ9mFq+50VItK0E41m3pAAEohQJy4DfXdEEIWQDZ
 MV7kotIXXLcleZl88e9Wp0YuNea5Rugh4+M8xFUtzDG4v4I5ZlQEjs0U9eh5PFzOXeUS
 VXCPnu7aCBe4nCt1vvYErWzj0J/mwD0tDKQHbkFgXw7aisOyT11OPVMrbWOkihDK4qY5
 h+Cy2g3yGk2S7LqgZPOfEKDUii+McJQMpVGO0I4g5DvELpd3CA3ueMjoPViypLXOEvjS
 8QXw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUnuuplSZwNuyJt/qs5Beok6UdDZm+7wLui9oo6o/YKisxDlFiV7E8vsLWuD04kfwLu2SdzjSfkDZQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwYCXZhYDdHA7nNsL/H9scw+uYQ/ONaYPxqBLBhi1abK+gz4SiY
 CjiQPRZAHxjJBdcljcda4gmXXZxHvmqnLd5CCn9Xz4Z8nqo1pPN9OBy9wq848AnGhhEzvS7KTAy
 8RhBU9eFew6RMm4a6qZ443vXGEvZ+9BXR02IRjhJYx9mAacoNlx5Ls3DoP9jcHr0KdOqysKg=
X-Gm-Gg: ASbGncvTuOXKUdrYOkUgHQvwUBCJcEgalAojtjvXVO+elcOpHU4zBS5t1UnfEqtYeqA
 OF5nhA4Uwdk/+9AvcWhV9qznrgvN1pubX7vEKCgfwps3PHctyrrCHSGufCnbu4YNJq235LJq+Yz
 NqIUUbPPdhxgFFnU0lqYFRUHo/85QbUmO9S+GCNqBchc+1zz23g23DLseb8ntuZcxhStHGg929R
 DPorZsl46sK+PhnkYcDibYnJNL78gYG69w4aoPyGRDfh9LDTT7xYuYS63f2IaRv/qcnRhXDlxYR
 XdzR1jAz0a1da3Mzj7IZoXgAGyod2gWlS9A77aKEkkw0GC/a26G1wXA2Kxx2dIsgS1Nz6DYf1oV
 gNr6XJstxhwuL7vDiQlRQnS+XFvO91ot0U6VqwTsREwqHDQVQpeV5
X-Received: by 2002:ac8:588d:0:b0:4b0:7989:13db with SMTP id
 d75a77b69052e-4b10c5ed878mr20121301cf.58.1755163706750; 
 Thu, 14 Aug 2025 02:28:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG3MUHvm6rtSa8l/GeGn7RYGTzj4ND9ReLlHxxvcNHQJymdlM1Mf9CYxBThDHTsoL8aM4maXg==
X-Received: by 2002:ac8:588d:0:b0:4b0:7989:13db with SMTP id
 d75a77b69052e-4b10c5ed878mr20121041cf.58.1755163706254; 
 Thu, 14 Aug 2025 02:28:26 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55b889ad021sm5649676e87.74.2025.08.14.02.28.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Aug 2025 02:28:25 -0700 (PDT)
Date: Thu, 14 Aug 2025 12:28:23 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <quic_yongmou@quicinc.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH v2 32/38] drm/msm: add support for non-blocking commits
Message-ID: <vns2bbpekccowbu3ahg4cnvhrbfk3yc2tvu7o4n45gpn2tpybp@w6gmsve76erp>
References: <20250609-msm-dp-mst-v2-0-a54d8902a23d@quicinc.com>
 <20250609-msm-dp-mst-v2-32-a54d8902a23d@quicinc.com>
 <rznsg4feyxanhvggxtebilg3ukbcrv3xgi4f2ijadjqaeqfelo@ogib4gythj7d>
 <a8458790-b4d8-4165-bd6f-00497a9d0457@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a8458790-b4d8-4165-bd6f-00497a9d0457@quicinc.com>
X-Authority-Analysis: v=2.4 cv=X4lSKHTe c=1 sm=1 tr=0 ts=689dac3c cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=Z7gkRSVo2wHhsan7cAUA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAzMSBTYWx0ZWRfXxD6q9kgN7wjd
 JVS1sUExWZv6Iyc8B2SKbUXRThtAeoNsH0lPFlD5i6JNSRofoZSFq8KO/gmOuG1o2wlhbeJCpQR
 nvjZI0ilqUUFYDAVe0D54ai4C/fvIZ0SUHxw5D8+K/dDU0WC4RqCmzYuGsCg4aW+PF1vZxn72/s
 C2SBuIMdycVVOCv/UYRwvs7dckL89XyyT10DJYAOrBuNXfzd26i64li+l4slm31fKjah3gKo61W
 QdQQHPrP6j+C9ls4vMAeXIjBKl9w65V2z5RRYKv/b9XwW4SJnTy+3Pvgi1Gj7vApoLPXzxy7Evk
 vFyIxFugUxaRAmR4scerN6/hXRhexRTw6ROEWI6CLEHvLSfnu2p+ElvIOjgFxIeN7uwzWzJp0O3
 Vp9FrObH
X-Proofpoint-GUID: Yt5NAovVtytDDsKXStHSODql-Ri9XSJu
X-Proofpoint-ORIG-GUID: Yt5NAovVtytDDsKXStHSODql-Ri9XSJu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_02,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 adultscore=0
 spamscore=0 bulkscore=0 suspectscore=0 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090031
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

On Thu, Aug 14, 2025 at 04:54:16PM +0800, Yongxing Mou wrote:
> 
> 
> On 2025/6/9 22:50, Dmitry Baryshkov wrote:
> > On Mon, Jun 09, 2025 at 08:21:51PM +0800, Yongxing Mou wrote:
> > > From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > > 
> > > Hook up the mst framework APIs with atomic_commit_setup() and
> > > atomic_commit_tail() APIs to handle non-blocking commits.
> > 
> > Were non-blocking commits not supported before this patch?
> > 
> This patch only work for MST case. and for SST case, i'm not sure.  I see
> commit_tail() called drm_atomic_helper_wait_for_dependencies() in DRM
> codes.. Hopefully this can answer your question.

This should be a part of the commit message.

> > > 
> > > Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > > ---
> > >   drivers/gpu/drm/msm/msm_atomic.c | 3 +++
> > >   drivers/gpu/drm/msm/msm_kms.c    | 2 ++
> > >   2 files changed, 5 insertions(+)
> > > 
> > 
> 

-- 
With best wishes
Dmitry
