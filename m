Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FD2FB4424C
	for <lists+dri-devel@lfdr.de>; Thu,  4 Sep 2025 18:10:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 776A510E060;
	Thu,  4 Sep 2025 16:10:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Vq0QuU6+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com
 [209.85.128.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A15A10E071
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Sep 2025 16:10:05 +0000 (UTC)
Received: by mail-yw1-f176.google.com with SMTP id
 00721157ae682-723ae0bb4e4so14246607b3.1
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Sep 2025 09:10:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1757002204; x=1757607004; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=R0WjAIlRtq73jqXFwWJ/YWFSrK/kill+F6JVs0WrJkQ=;
 b=Vq0QuU6+mmuEVfHJjJHsD8hxHOQGXqdxFGymh7Gcy577Ly5T8YqYneje/BTW4Y5q1Z
 BaNru56ejlhZl2VuXqGoNCTYJ9uGQPVphxWUMinqjtOM4fwFm7+wuR1I5RfP0l7k4yzh
 D7tIwB/v62ymOxcJu2SQ7XHvBp0waIJ0Cs1ERbxeDpvXf25bYv9DzuY0YHjgzFCZZ36Q
 h+XRyFYqErXP/UT/Adj0Ks2VCx7vqiDPcb1vFNQxu6jFTfIgMxgGs+DUHCDSe/e6bgAk
 B3bZ9ehbPoIwiZLsTGuMNfEoYxVewPM3iyT4WPwfp/3FNVAQWvB/4RWVvjvxHpxaR2a/
 8mSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757002204; x=1757607004;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=R0WjAIlRtq73jqXFwWJ/YWFSrK/kill+F6JVs0WrJkQ=;
 b=qxaviponKZCveVFjHiyrLIKRmhrzuOBut2NqHZ8VW5Skv+2KO0fCs7tV9D3PN9U4th
 CTs18H+2Ew+MvPMKmvsWwUsF1bgfUcDHBjTCzXPXpDvuP9U8EBkoINxyfPV5b8XWOdHJ
 10J8a1wOav1nEhmIHL8RzeP+STUqtChH+BeMuH2xVeE77PuqJ3ged4bj7vpWk7J/fLeC
 pa/FjrEe0im8cf4O2mGOHK/RsvrgCpnDoYvUlPxFt9W08ACk+LS76PLT0l//+zh04nq6
 296ZmzInK+bqZAJr6fU+pcGNY8bN4csShgLsnLhtR09WCnit0osy+EJ5BdVW+58gRzrl
 AB/g==
X-Forwarded-Encrypted: i=1;
 AJvYcCV+HSsqupnYFJNah6Tb1mxv7sN49zoyOLmtv5z84scV720K1cQkntYAgVkS0fC/nyMowlJP4s5OgBs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz0ZpIRxhgRICoXdk0ZhtNhgM8iP3T/a6jXwuErRZhJgzIzOZId
 UaVKUyMVH4XclJPHns4q9KkJevYVJVE0Fy53KQRxdvr7UITKNvZhTw9yTVl36cTPsZPtt9eKnlN
 A5EoPrvt2REIf0U0w+l9sYMFTQZblt6QJBcjuUNVV6g==
X-Gm-Gg: ASbGncu3TaK7rpYStGmvdZRHODyHuhtiNtWvka/kjSgD1okwYSJK7pnv83qJW1amLyp
 H7AichFWVnvIHSbZw/MjGlRmDk/FZ42caIxX4vC/lMBix2Hit0vETB2nwyiJ0b4405dw/STT73A
 LYtZzI4/y9jOlLeNTwvB+XAy+YOEYjDKSIvkwctqR6Su3d0gkXkEDvUbdy6Le9qB+QPt2dW2A8d
 SR4dNcDsRhzNO+BWlmn+f8rnIREdQ==
X-Google-Smtp-Source: AGHT+IEkDrp/iAHP7LO1Blxb93ohjQvbbpujHX05sJO9KR7HZ0IPMJaCz6DrlDT+Kc+vE46+lITVA2uee5pwGcRyfs0=
X-Received: by 2002:a05:690c:7446:b0:723:b0e1:af82 with SMTP id
 00721157ae682-723b0e1b035mr107641407b3.30.1757002203809; Thu, 04 Sep 2025
 09:10:03 -0700 (PDT)
MIME-Version: 1.0
References: <20250819-v6-16-rc2-quad-pipe-upstream-v15-0-2c7a85089db8@linaro.org>
 <20250819-v6-16-rc2-quad-pipe-upstream-v15-12-2c7a85089db8@linaro.org>
 <xcq25wmw7roelcmoljypn3ozt7kqvylgibz2cloxghaeurcwvs@jjay7hton6md>
In-Reply-To: <xcq25wmw7roelcmoljypn3ozt7kqvylgibz2cloxghaeurcwvs@jjay7hton6md>
From: Jun Nie <jun.nie@linaro.org>
Date: Fri, 5 Sep 2025 00:09:52 +0800
X-Gm-Features: Ac12FXxuR9VMKn0d2kpIG3AfgErZjwj23I8v-YMzsr0ZIo5YsvdKfiRaZSKyFmA
Message-ID: <CABymUCNXVfZyhCbkiqzJ-K2zGe=bofD82OD20d-CG+a-KkgN5Q@mail.gmail.com>
Subject: Re: [PATCH v15 12/13] drm/msm/dpu: support plane splitting in
 quad-pipe case
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> =E4=BA=8E2025=E5=B9=B4=
9=E6=9C=883=E6=97=A5=E5=91=A8=E4=B8=89 17:39=E5=86=99=E9=81=93=EF=BC=9A
>
> On Tue, Aug 19, 2025 at 09:31:06AM +0800, Jun Nie wrote:
> > The content of every half of screen is sent out via one interface in
> > dual-DSI case. The content for every interface is blended by a LM
> > pair in quad-pipe case, thus a LM pair should not blend any content
> > that cross the half of screen in this case. Clip plane into pipes per
> > left and right half screen ROI if topology is quad pipe case.
> >
> > The clipped rectangle on every half of screen is futher handled by two
> > pipes if its width exceeds a limit for a single pipe.
> >
> > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>
> I've run several CI workloads. This is the first commit which breaks IGT
> tests. See https://gitlab.freedesktop.org/drm/msm/-/pipelines/1503075

Thanks for the work! I did test locally with all my patch set on sm8650 and
did not reproduce the issue. The baseline is not aligned with msm-next-luma=
g
yet because I need to port my platform patches to it. I will do it tomorrow=
.
 Do you think this issue is related to difference of sm8650 and sm8350?
Regarding all failure cases are write back related.

- Jun

>
> > ---
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  |  11 +++
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h  |   2 +
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 137 +++++++++++++++++++++-=
--------
> >  3 files changed, 110 insertions(+), 40 deletions(-)
>
> --
> With best wishes
> Dmitry
