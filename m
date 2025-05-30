Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42D90AC92F6
	for <lists+dri-devel@lfdr.de>; Fri, 30 May 2025 18:06:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BC9010E157;
	Fri, 30 May 2025 16:06:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="MmOUYNTC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4860710E157
 for <dri-devel@lists.freedesktop.org>; Fri, 30 May 2025 16:06:12 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54UBKd7o003633
 for <dri-devel@lists.freedesktop.org>; Fri, 30 May 2025 16:06:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=vyhfcYM3BM8AastlNTmqLFAI
 L5ZyT7xVQ/AliYgV9Ag=; b=MmOUYNTCJOYPwWx3XRLWoM7fXalT2FpW3Qc+Y9nX
 Uq2nD8WWOEql39GzE+gn4o02/qIkoK1KTalNhszHBY5ZcRIbRSIJvdF2y9SRErnj
 nxAUNrmQA/UAxFO/Dy4R4BSWUYgM5H9lz61Uayf0rmRmk0yWkRh+Aja95aTvrEw0
 XpkDQ1PszgUCkcqTotXSXEO+MST0Q08D8ESCDlzhagGAHqI2P+tyNsMOyCVaTGYM
 ktos41Yz0KV83Za99mfqiHUfIMpYtJp8UeKUIwEcFKhh9tkx945W51TMQ3IH4mNe
 9IseNwhQ6pD21p9Uu+FAvYIWjuWxIlRNe6Zw4kS7TNmHDA==
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u549sjad-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 30 May 2025 16:06:06 +0000 (GMT)
Received: by mail-yb1-f199.google.com with SMTP id
 3f1490d57ef6-e7dcd60bfe0so2936722276.1
 for <dri-devel@lists.freedesktop.org>; Fri, 30 May 2025 09:06:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748621166; x=1749225966;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vyhfcYM3BM8AastlNTmqLFAIL5ZyT7xVQ/AliYgV9Ag=;
 b=OwN5a31FJShlYkX2taXHYCV7bhwJQHiT517839oloAzLf3oJOUf0mPgIoOH3urVlRW
 4ejONLSXZSKu9OX+TlgmN/YLYGJMKwLWFk2nHuVKss87Zg2wRtsjsmVa3pN1zjvapiZZ
 RUgbsoK+CH0l3XsPaEwHx7Orh0nUsPwyvYdUZ+9odfvCrvgmtatyYbXzS4adSGdedxUV
 lBmuHMT3wb8zvctOYjXZEWMSHqru/xBtDId84N10X9GvpdLYrsY5tDGh6HzKwXi6Pr1K
 e4hi8nYUOoQPQXP9FKsA7oO/eVEmqCeyR/bWGoKANkDbR/AljR12/E3T0eJAQ7q8i+wd
 XIyQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWAHs2zhxzNrelQ6zao31jDzYqj7vn7AtwkLUwdEOJ7o51Qe9uOK3Ix5WLv1hFak4mFCPlYZSgMxgo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyg/Dgk9WcYqC3qxdjdZPMVS2QexNVCp5ERjIfVxkANcF/3Tkba
 QL95Lw22VWbzhbbdGsaqxxv9HmcL0UfDsz0MU41g0Mxq87D79i1pOJW79goXCXrMB4bqH9KQw+d
 jTpxSt9mSmHxYZldk3tr4tDIcPrHx6lphcqFaWt2k82UVwwMAluu0X5U6xia0O8IJgGbEoM4uBr
 Udpbeu3L9uMEMWF1qLeSJjSZT5rUVzuaxCoMtj+JR9sF+AtKisMvg8FQ==
X-Gm-Gg: ASbGncvTeiCICGrSYhFIdvNsDVInXb0gX+Qum+0NDb1hcdYY6avzLGFpfyhCgCAh4WJ
 X5mtgwaepmGOt9JztHeW1gW9T5xEsYPjHARzfl1LraQh7+kkyy6o3t1NLv79B4CaW6zqGxhPmHF
 pXQ8WlHwATM3e6vYlxiwvKCl9kxw==
X-Received: by 2002:a05:6a00:b8c:b0:736:3ea8:4813 with SMTP id
 d2e1a72fcca58-747bdcee18cmr5085880b3a.2.1748621155850; 
 Fri, 30 May 2025 09:05:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGkV+wYfOcdBbbGjqmaahLgRt731ef7AwmWEuaLDL/DIg0abAlw/5A3m2MgJme4BEGi3KUVodwjTjbUCkAjd/Y=
X-Received: by 2002:a17:90b:4c8c:b0:30e:6a9d:d78b with SMTP id
 98e67ed59e1d1-312464539fbmr5323780a91.12.1748621144113; Fri, 30 May 2025
 09:05:44 -0700 (PDT)
MIME-Version: 1.0
References: <20250529-hpd_display_off-v1-0-ce33bac2987c@oss.qualcomm.com>
In-Reply-To: <20250529-hpd_display_off-v1-0-ce33bac2987c@oss.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 30 May 2025 19:05:32 +0300
X-Gm-Features: AX0GCFv90vzmgIOYELPB5bdyh5tcPCamKQylpnA6_OeHU5ehZhBHvtxjwgstaSo
Message-ID: <CAO9ioeUi59PNmRSYzyVbxcifhPKxYbtW9EuouOVXkT84SPOuwQ@mail.gmail.com>
Subject: Re: [PATCH 0/4] drm/msm/dp: ST_DISPLAY_OFF hpd cleanup
To: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>,
 Doug Anderson <dianders@chromium.org>, Johan Hovold <johan@kernel.org>,
 Bjorn Andersson <quic_bjorande@quicinc.com>,
 Abhinav Kumar <abhinav.kumar@oss.qualcomm.com>,
 linux-kernel@vger.kernel.org, Yongxing Mou <quic_yongmou@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-GUID: 2zsbjyP4t2QF6c5IEADpktt5dnKH6Zfx
X-Authority-Analysis: v=2.4 cv=E9nNpbdl c=1 sm=1 tr=0 ts=6839d76e cx=c_pps
 a=bcYUF9iMMBfaiOy0M+g+3g==:117 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10
 a=EUspDBNiAAAA:8 a=EXqCMmvbh7VItr34RoAA:9 a=QEXdDO2ut3YA:10
 a=4AvBJ3eyfGLrynxe6Eyb:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMwMDE0MSBTYWx0ZWRfX2JXg/HjQSXBH
 83ZNZEcJo2jcjwQf0Li6L7rpvKdNaE58qOOgakJOLLBRugcB0isytCoOUDJxMHXlvjZNyBgJh0B
 8Y/9fzmjeZQeQ6OMR9z14WvFlhgrH+HykGlXM4AzAHzGzw7tPPB/zclaEyaImysgR9vYTffku2/
 nSZY/cSZsMAwbHDvbZAtuHq1KQ+WJtmT8JCvMYD5fbbNYPydl7l1tfaV/vJwSlUdhTqYfiNdoR7
 A028zUWpGtg7Y7ZOAgtmAZvRnuF7qnNYE4iOUYpbbphBihlGnbMRL5vDpbCfCY+GyPcYlUt6j32
 vTroNvpt4oYJuP6qeW7hSpLFh8CyJQKaTmnqcza402Uj+DUZnuLXodda08NZR9mI/H5nnspOKx8
 ObXZx7BleZQT6nmpHfPjj564g3FCmmz4CzJCArk0TwD6CawBWT+2QpRgr7N2vH6HK3nfEEwW
X-Proofpoint-ORIG-GUID: 2zsbjyP4t2QF6c5IEADpktt5dnKH6Zfx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-30_07,2025-05-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=999 spamscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505300141
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

On Fri, 30 May 2025 at 02:15, Jessica Zhang
<jessica.zhang@oss.qualcomm.com> wrote:
>
> HPD state machine in msm dp display driver manages the state transitions
> between various HPD events and the expected state of driver to make sure
> both match up.
>
> Although originally done with the intent of managing userspace interactions
> and interactions with compliance equipment, over period of time,
> changes to this piece of code has become quite difficult to manage.
>
> Although, unwinding this logic will take some time and will be spread over
> various changes, to start things, this series tries to get rid of the
> ST_DISPLAY_OFF state as firstly, its really not an hpd state but a state
> of the display overall. Coupled with this, there are quite a few checks
> in the current code, the origins of which need to be re-visited OR are unclear
> which seem unlikely or redundant. With DP controller on newer chipsets supporting
> multiple streams, this has become increasingly difficult to work with.
>
> This series removes the redundant state checks and simplifies the logic as an
> attempt to get rid of this ST_DISPLAY_OFF state.
>
> Note: This series has been tested with sa8775p and sc7180 devices with multiple
> monitors and also multiple dongles with no noticeable regressions.
> Both of these devices use native DP PHY though. Hence, if this series can
> be verified on some devices with USBC-DP combo PHY with the help of the other
> developers, that will be great.
>
> ---
> Changes in v2:

The series is not marked as v2 though.

> - Rebased on top of next-20250523
> - Change atomic_enable() to return early if ST_DISCONENCT_PENDING
>   instead of completely dropping the
>   if (state != ST_DISPLAY_OFF && state != ST_MAINLINK_READY) check (Dmitry)
>
> ---
> Abhinav Kumar (4):
>       drm/msm/dp: remove redundant checks related to ST_DISPLAY_OFF in plug/irq_ipd handlers
>       drm/msm/dp: Return early from atomic_enable() if ST_DISCONNECT_PENDING
>       drm/msm/dp: replace ST_DISPLAY_OFF with power_on in msm_dp_hpd_unplug_handle()
>       drm/msm/dp: remove ST_DISPLAY_OFF as a hpd_state
>
>  drivers/gpu/drm/msm/dp/dp_display.c | 19 +++----------------
>  1 file changed, 3 insertions(+), 16 deletions(-)
> ---
> base-commit: daf70030586cf0279a57b58a94c32cfe901df23d
> change-id: 20241202-hpd_display_off-6051aa510f23
>
> Best regards,
> --
> Jessica Zhang <jessica.zhang@oss.qualcomm.com>
>


--
With best wishes

Dmitry
