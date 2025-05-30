Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10C1AAC92E6
	for <lists+dri-devel@lfdr.de>; Fri, 30 May 2025 18:04:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F1C810E14E;
	Fri, 30 May 2025 16:04:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="mh3hQef+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FE9E10E0DF
 for <dri-devel@lists.freedesktop.org>; Fri, 30 May 2025 16:04:44 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54UA67JK015896
 for <dri-devel@lists.freedesktop.org>; Fri, 30 May 2025 16:04:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=95B9xrY7ndP9mcAFKeGu86Ro
 7n0TFK6C/DstmSepAoM=; b=mh3hQef+PhSUjNlSRxktnxtHsGx/83q3POb6z85K
 ejOXiWL5cJktiWlQd1uNspbi/n7CllroniQR8xLGvClIoY1Cw3Ku9mURNTeoclhC
 Hw2lh93ttF4E/7rBUHx3V+8Pj1e3GP7N5JcQ5WG0WbrxiaphSDPpOtFg7svfZlqM
 KsFJfPXPI8jFFY6f8tCDRoYZhMdAeOtH4HvPw0Ef5b9Ejge28POzc9KUVQYCBIF5
 GhidEPHqnyRng5gvjHfmwtNdu5iKWgzLEes+Np5oLz3QrVkRwZP7ON/vU1dnpwyZ
 6GqE/jDt2KIaY8Y7NeQqodR0oS5wxn1HsznsPuHJTjGGJg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46wavm3m9w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 30 May 2025 16:04:43 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-31218e2d5b0so3369078a91.2
 for <dri-devel@lists.freedesktop.org>; Fri, 30 May 2025 09:04:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748621083; x=1749225883;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=95B9xrY7ndP9mcAFKeGu86Ro7n0TFK6C/DstmSepAoM=;
 b=fxUXB7f2+ZJ4ZZX4+0r2l4D7zFy3eFLb+71oD+oy6Di8LADd8HzPuSiMVDjXJsgm/m
 j2Y8eeXUUPEm88vb4hhf7SNnaw3LUbCendO2FVBkMoVpKOdkoLRPsjtQ0Oslvr8hiVK+
 q7XCj8dxhTX5C2LttymwAmWwMQ33BHzBealq1jU9nGS3Diqn0ilbj3COt4wSSMCv4iUT
 HSyK8fHTY9yvHZywXBVGLQZ423j5sqakWzD2M4e2sKqtwOOQzdFHVpl8CWq/XruWFCgK
 KSSyEkEWQVh3LPDoM54nLtQrOyy2I0cpz/n8BKTP7RYDrjV9XJOsLi6WeECRK6p+Qyk7
 +ang==
X-Forwarded-Encrypted: i=1;
 AJvYcCXDxviPl/CHVv9FPYY03/kf5O8z8plXEnVdnziJwdqJzQu96s82Cd3gsQVfanU96BOftiZgMAMAYOQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxy7dnOEBAtDWDcZ1tS7k2+M/SYMIzjKS24ThN/1Z9kjg/UN1gc
 qSGFxC7mJUs8UO7LDWDKTvakTzj4KFLfhhz4yD7wRV/uqfmYUUvrhGMVPb094liMIexSg6re5aZ
 HO3rEXz0uzF2CiXiHK8v6q25qLdttoUsuHuBN/+Djw8BmNA5+cJXG6b+x9vhiPd9B/35QhEDu6o
 DxPSopQMGNIRQr3Zs1PCSzuFzqUybLQ0IWS/zWyJqh0XcWgw==
X-Gm-Gg: ASbGncvZZRPb1i8+zkz4yPhVmyPMe1uNq8nf8TFwe4IB8NdK9yJcWDAGFPtYeURsw48
 C3etjbcbT5IXSa45EhQrHzeBFCBMNrqqzMSAeym+sFEvC9TtkqKDD2qYbMB6YyYee59vlg5jHvb
 PwdL422DbBck+X0AnN1DcvcHxTwJ30d/13Vpf/
X-Received: by 2002:a17:90b:530d:b0:311:f2bd:dc25 with SMTP id
 98e67ed59e1d1-31250405591mr4958655a91.16.1748621082883; 
 Fri, 30 May 2025 09:04:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGUyQsmoqBqgkDzuHgtUnqynFvBr6hCZ5aP8BN5BFbOargbHC51lr746Dzv/Q5J2fr/12YGnYe3WQfgAPBprno=
X-Received: by 2002:a17:90b:530d:b0:311:f2bd:dc25 with SMTP id
 98e67ed59e1d1-31250405591mr4958595a91.16.1748621082514; Fri, 30 May 2025
 09:04:42 -0700 (PDT)
MIME-Version: 1.0
References: <20250529-hpd_display_off-v1-0-ce33bac2987c@oss.qualcomm.com>
 <20250529-hpd_display_off-v1-2-ce33bac2987c@oss.qualcomm.com>
In-Reply-To: <20250529-hpd_display_off-v1-2-ce33bac2987c@oss.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 30 May 2025 19:04:30 +0300
X-Gm-Features: AX0GCFsBOsnzMy284cQgoFHDp9y_vKzexdGPlGw5XjTR61ThqE8swER7yx57D6k
Message-ID: <CAO9ioeUPJm1MbqAVJfcQSTAmvY3-TmvtZ+=Js1mZ53JFYHoUhw@mail.gmail.com>
Subject: Re: [PATCH 2/4] drm/msm/dp: Return early from atomic_enable() if
 ST_DISCONNECT_PENDING
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
X-Proofpoint-GUID: bU8blCW5GQZhrbogOjKr9A9WoGn8kYBa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMwMDE0MiBTYWx0ZWRfX7Oe5kbvibVX4
 yT2DTdXYKcTNeuMNwm44qNTXzoz2IflWNQ5Uedf00x2xRQkhWJY5VfyOFRP/SHDlKEKhHuqS7xZ
 qIokpuZ3gH4C1AAM2q2lYuaXQNhqjP87RwyVLawtFwxxg5okwqMtJfliEeTOb4c9yTnJUftod8h
 JboVQU1p3YurH4yby2dBTHmqvd73Naxbduqkzf05G9lmeYNKW9sm4dkCdmdxkhAidRnYL6z1WFd
 MGvnjnJTl6qFsWx8WfXGZoH7A99pU5nK13fJtRa6+fdx7ukE5ozjUhXt/wN4TYoIf1KJklPs+5T
 ZgAZhXDY+TA1QMSnrtUMdjBK7ZdOwjBYpYfvP/p/BpIMMZqcorg1cdRJx0heHK8qUXX4GG5ffc0
 YhNXYfHg5QuDVT142EI7PlborBECWFk28EITkike7gA85TWkfcXYkonox194T0uGKuPtj3ER
X-Authority-Analysis: v=2.4 cv=fMk53Yae c=1 sm=1 tr=0 ts=6839d71b cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10
 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=WDWld9wBFKh9IeGoHG4A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: bU8blCW5GQZhrbogOjKr9A9WoGn8kYBa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-30_07,2025-05-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 phishscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015 mlxscore=0
 mlxlogscore=999 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505300142
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
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
>
> The checks in msm_dp_bridge_atomic_enable() for making sure that we are in
> ST_DISPLAY_OFF OR ST_MAINLINK_READY seem redundant.
>
> DRM fwk shall not issue any commits if state is not ST_MAINLINK_READY as
> msm_dp's atomic_check callback returns a failure if state is not
> ST_MAINLINK_READY.

What if the state changes between atomic_check() and atomic_enable()?
There are no locks, cable unplugging is async, so it's perfectly
possible.

>
> For the ST_DISPLAY_OFF check, its mainly to guard against a scenario that
> there is an atomic_enable() without a prior atomic_disable() which once
> again should not really happen.
>
> Since it's still possible for the state machine to transition to
> ST_DISCONNECT_PENDING between atomic_check() and atomic_commit(), change
> this check to return early if hpd_state is ST_DISCONNECT_PENDING.

Can we really, please, drop the state machine? I had other plans for
the next week, but maybe I should just do it, so that by the end of
6.17 cycle we can have a merged, stable and working solution? This
topic has been lingering for months without any actual change.

>
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 1d7cda62d5fb..f2820f06f5dc 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -1512,7 +1512,7 @@ void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
>         }
>
>         hpd_state = msm_dp_display->hpd_state;
> -       if (hpd_state != ST_DISPLAY_OFF && hpd_state != ST_MAINLINK_READY) {
> +       if (hpd_state == ST_DISCONNECT_PENDING) {



>                 mutex_unlock(&msm_dp_display->event_mutex);
>                 return;
>         }
>
> --
> 2.49.0
>


-- 
With best wishes
Dmitry
