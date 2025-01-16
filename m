Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33794A13C78
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2025 15:40:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A09C410E994;
	Thu, 16 Jan 2025 14:39:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="dRssPFuk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com
 [209.85.219.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 980DA10E999
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2025 14:39:45 +0000 (UTC)
Received: by mail-yb1-f180.google.com with SMTP id
 3f1490d57ef6-e53a5ff2233so1847359276.3
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2025 06:39:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737038325; x=1737643125; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4sUIcPz38QbpKX9h6m3eh8VNlVAfuLU05xadyi36SFA=;
 b=dRssPFukx2bgsP5DGYqBUsSQIqHi6tSubfJBsQbvL8zRDeZHngRzXmUC9sXJijhcdT
 PDr9EkgqJA6hEBgvhYWGMzN3xUL2uD+SVW5VftQciJleRfbXgLkHvWTMGLvn7GVs1M/2
 JCORos0m/7gtAghqx1XxRgZho4HX0TD1LYn5yQW1FmLv/yYUzjDP8ZmveiHDfvTWXj5x
 G8nkztZd88F4wvcTGPw0BwadcSvcgiIpB1k4YBEH41DrYL742S+leR27aquvf2pvjxmz
 hEiHXfpW7QP8VmX/mP7a69mlfjI+oAWU6ApKZzh/ZqW0SWBCSaX5gVVeReLV+KyCFz1z
 smUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737038325; x=1737643125;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4sUIcPz38QbpKX9h6m3eh8VNlVAfuLU05xadyi36SFA=;
 b=ii/QSIg1Nyi7nfQx7akhi24sAJQ+gllTzzcHrVom6DafjptHhJFOvqMHhqT9zqsmAa
 E21cBc5Kz1xXnRXOx6uZUZS/mNJCHW85IUmBhQKj23LUk/pkim68jg0MqVENRwcygOGa
 DtG42X99ag5HQxKrcqbzfAmZyOA6CGiOrM3MekSLip7r3lA0k3QoXblQkUWez7TNkBQ3
 S4kWcmSx0l/6OyPZ7a9NYDoifE4iHaLCbNREKUB8XvyZjWFjwXcCrSS/7LykypGMsX0a
 ZFq5T+kHiCntXQIvgoiFIJQKCXORy9rWCSlwWeovwF2ynx3fFr1o2kZt4d+o2R9B4AlO
 uURg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUGjIcpaPezHHUkU2q1ra72/hFDX0L8BDlsr2a36vhkBnqwiuKeKspTvi9oyG+5QseUayJ1FObxHVQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxGtQm7dgO86B22KhHfE+QtxKUxPlwx1KjeVNcqBjVV7GpkWaRE
 MAvv31SRvqOV2GPBxCLoXAoKKVWzZ8j2vP5lxmZZD/AXMqWe5JiqQEE/Z4fs9qZVcRFhbmFUMH0
 NWAGYCbrR3pmmMMkK2J69q+Zguc3fQzB7NvaU8A==
X-Gm-Gg: ASbGncvmAlxeAioJT0XH7i/7eTBJE5TzyYD1SnbLsz7ITKGvio+vHo6xbA/MpScosXO
 fRP106Ev63XR0FlwsquKCVrhVsy/i+ihmMWuF0A==
X-Google-Smtp-Source: AGHT+IHOmbG1mD6fGJJB2xukA+ZpXzy/YryWJ0zz+QlXQESUVO+WN4GQocRWOc+o1TUVXuEW9Tg1LF6+dlVSmsfz8Qg=
X-Received: by 2002:a05:6902:13c1:b0:e57:935d:380 with SMTP id
 3f1490d57ef6-e57935d04c2mr4699707276.47.1737038324734; Thu, 16 Jan 2025
 06:38:44 -0800 (PST)
MIME-Version: 1.0
References: <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-0-74749c6eba33@linaro.org>
 <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-1-74749c6eba33@linaro.org>
 <ra4uugpcufctn2j2sosrwxewlwpivsmc6tidadf4kuostv4cq6@ev4di2547lla>
In-Reply-To: <ra4uugpcufctn2j2sosrwxewlwpivsmc6tidadf4kuostv4cq6@ev4di2547lla>
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 16 Jan 2025 22:38:33 +0800
X-Gm-Features: AbW1kvYbGirLS3atLWsRwGLM7BY20-3qOo7Ga2zt7Vg794uzAKzvm9X0mlofT5c
Message-ID: <CABymUCPc5z+9SLeKy04Rg79B9sZUPUf9osJ6UJMKiv2cTXynxA@mail.gmail.com>
Subject: Re: [PATCH v4 01/16] drm/msm/dpu: check every pipe per capability
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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

Dmitry Baryshkov <dmitry.baryshkov@linaro.org> =E4=BA=8E2025=E5=B9=B41=E6=
=9C=8816=E6=97=A5=E5=91=A8=E5=9B=9B 15:44=E5=86=99=E9=81=93=EF=BC=9A

>
> On Thu, Jan 16, 2025 at 03:25:50PM +0800, Jun Nie wrote:
> > Move requreiment check to routine of every pipe check. As sblk
> > and pipe_hw_caps of r_pipe are not checked in current implementation.
>
How about this version?
    The capability stored in sblk and pipe_hw_caps is checked only for
    SSPP of the first pipe in the pair with current implementation. That
    of the 2nd pipe, r_pipe, is not checked and may violate hardware
    capability. Move requirement check to dpu_plane_atomic_check_pipe()
    for the check of every pipe.


Jun
