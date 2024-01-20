Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED28783326F
	for <lists+dri-devel@lfdr.de>; Sat, 20 Jan 2024 03:33:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DB3810EAE8;
	Sat, 20 Jan 2024 02:33:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com
 [209.85.167.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3377610EAE8
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Jan 2024 02:32:56 +0000 (UTC)
Received: by mail-oi1-f176.google.com with SMTP id
 5614622812f47-3bbbc6bcc78so1182013b6e.1
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jan 2024 18:32:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705717916; x=1706322716; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=nyeMNz1BdLz2Zw+KyXoni/RwA4cvZUvIGymiJ063oGg=;
 b=r+exA50JMnrJoOwTZvGaJwcf8oqlk1UAoUhbcnuvUpFrTPNug5HFGL0dKQmBzxro6v
 0xoHJMoQHUq5VTq/13BQ6TRgNHjqthlgQJGJTCyEzN+x9XH+zh7bqLneeGGdTffMFFaR
 0jbUuvAvy88c2b6ZHmqVHvPVpt+9n4bD/Ktf2RtmVnY2X0rvk/Pt0MuQlwf3S0zJOKUl
 mGibSPytZw8cPj8LFTDsAURINQ28cxlXfOMjuAlbD7xmcWy5pDi+dwhKVHQZzqcTnZCe
 FldccOvr4p11nNHFAcWrNxexbl9ZXGz74FVjh6au1lDF8uEdLgD+HF1G2w033/BgJ5T7
 Z+iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705717916; x=1706322716;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nyeMNz1BdLz2Zw+KyXoni/RwA4cvZUvIGymiJ063oGg=;
 b=Vx65mjIKsYSRmYs42k0iQnchGkLGmhnEXOkKXzY5csEJxJCSHWKk0aJFRD6j/wWEU5
 Tsk+kv8VK7PqFgL1bSwrI5N32tnRjhVyxQkHug/kNMRQn3o9J4JAdG0vQSMMeoNtVIGI
 Nk2Y4gJb1jNoIlFqM4RaSg9E2DHZNvEhsliFR31WmJYaC0izWSe8RUrDLjGZwMa+mAUN
 CW+T5X1zBXQFZLNIUmnawG8vqg5uYrUVtasWU/S6ZpeiwNBlqVr3SobbCnjQY1UDOWnf
 d5L2cho0ilCTN8X4teqHdwxKRmhoP3FW9JaCDOlq15wNqOD5Sj49c1x6AOo/ESRTeWAa
 iITw==
X-Gm-Message-State: AOJu0YxfaChyLJ9Vv0lNjXUTtWESxeYR80GPn3si5DyBHb7SnHw5R51l
 5Cf1+NJYYMaLyR0sEe/EybSmv0KdmEQcSWfxWPU61PbE9zt4QAk4Aljc0FMCtdKthlrlmmx0kAQ
 v1fwe79bNE1rYQgxf9HRPgRkNkkSf83WAObvVpw==
X-Google-Smtp-Source: AGHT+IFOygdynqBpB7ozJkCg4VxzW6Dv2HATIwmVGSa+o7iXXznDuFaSsdJ1/FwKhms3ctO2S0y/hmwnqSi00tKbTuI=
X-Received: by 2002:a05:6808:1595:b0:3bc:15eb:b9bc with SMTP id
 t21-20020a056808159500b003bc15ebb9bcmr900500oiw.73.1705717916033; Fri, 19 Jan
 2024 18:31:56 -0800 (PST)
MIME-Version: 1.0
References: <20231229225650.912751-1-dmitry.baryshkov@linaro.org>
 <20231229225650.912751-14-dmitry.baryshkov@linaro.org>
 <b5f571c6-dcf6-c416-ca86-fdbd0514676b@quicinc.com>
In-Reply-To: <b5f571c6-dcf6-c416-ca86-fdbd0514676b@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 20 Jan 2024 04:31:45 +0200
Message-ID: <CAA8EJpqvyOsPErUE08mcCAcG41zRJS+Q6qQi83-ZNCBcwv3kCw@mail.gmail.com>
Subject: Re: [PATCH 13/14] drm/msm/dp: move next_bridge handling to dp_display
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: freedreno@lists.freedesktop.org,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 David Airlie <airlied@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 19 Jan 2024 at 23:14, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
> Dmitry,
>
> I am testing this patch serial with msm-next branch.
>
> This patch cause system crash during booting up for me.
>
> Is this patch work for you?

Yes, tested on top of linux-next. However I only tested it with
DP-over-USBC. What is your testcase? Could you please share the crash
log?

> On 12/29/2023 2:56 PM, Dmitry Baryshkov wrote:
> > Remove two levels of indirection and fetch next bridge directly in
> > dp_display_probe_tail().
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/dp/dp_display.c | 42 +++++++++--------------------
> >   drivers/gpu/drm/msm/dp/dp_parser.c  | 14 ----------
> >   drivers/gpu/drm/msm/dp/dp_parser.h  | 14 ----------
> >   3 files changed, 13 insertions(+), 57 deletions(-)

-- 
With best wishes
Dmitry
