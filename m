Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8422085947E
	for <lists+dri-devel@lfdr.de>; Sun, 18 Feb 2024 05:13:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CF0210E09C;
	Sun, 18 Feb 2024 04:13:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="VP7CSjYX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com
 [209.85.219.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DFF010E098
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Feb 2024 04:13:51 +0000 (UTC)
Received: by mail-yb1-f181.google.com with SMTP id
 3f1490d57ef6-dcd94fb9e4dso3397248276.2
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Feb 2024 20:13:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708229630; x=1708834430; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=F3T5HFHmi3CM0xKiFsfU8xvakCYZHbxMf+HiMKicUfQ=;
 b=VP7CSjYXe8c3Z3qBD1cjJ6HLc8aLtgX+7St7juTATppG4jAq9aRN0QvMrY3QF5zCQu
 KQ4cozCZwYeStcmHX37gNcger9ottekEXuC/EX/mC80eVyxP377Zgw90j0/RIOS0+ZF0
 IqpLFnsK+VyWtXdTLHDwfMYUNDAwnfScXJdrp0ikTUp3fZ7JM6KS6TpsAHdxbmxANVgP
 Umk+W11tQ/+3nYPKNBqBWnLfqK4DATarZZTwggZTAP4Qcv77KDnGfHn2dx3n4fdccetp
 cJkIWSCufjm9hbyWWmKFMS7uD/C6M7bJ/Yd/93u9b27dND44Hsvt9nuB3mZhGc80EWQW
 nryQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708229630; x=1708834430;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=F3T5HFHmi3CM0xKiFsfU8xvakCYZHbxMf+HiMKicUfQ=;
 b=mlPwMhJSDzDou0KmVpnlUXRfU9WKRELJftf07nqw8/vYot2BB1DPw56YfJh83vgh/Z
 kpiTsvjfpJw9eTTwe8B0D2g9EzWgHPM4n9Z+FjHYKr5YQxoT0gSWV7sq2kK4dzXEXdar
 x+QZl02YUgpU6hchKx9lwShiH0og2il4cg6KbQX+IvLgz5YmlvMTd9jrm7u2Wa34xCgJ
 hu7PbTQeBPU6jGXOWr9rSlNGQKzkcYPTmZzJKFsnTY+yKnX1h/Q44r0rcviTYW0LpRG7
 XqfoLXhlTkHnCzmHUcdzUtM2bX9ayO5sdupUROHWrJGTuXI7egVnN1QujFde4No7cxCi
 p0zQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWkPl5dhckLmjvaEpq3xSF5Gs5hG0ry1Fa6zxWRaleclfEZS4VRTQR+PHKvc2tHV42MTQlotTUkYP3mbILjXg961PC/Ih6sQw53B8q8l0ce
X-Gm-Message-State: AOJu0YzCB6BtAIXBwZq7aCON+i/xRoSP6GaBgI8C540xznrx10F6f/M7
 o2kCYmuRwkgEifzvn7RfhUXb2BbQdA0Lm3WE9JBwnqQMHTWLjPB2RDCuVEBeNbJ7BIKEwbMDJ9z
 aUML5gvsg+sWio9iiDaVQ6hgl8t2LXlK8cQbQIw==
X-Google-Smtp-Source: AGHT+IGNdSCdpONwmK45JNto+Twc09//VCm5Uc1QpJQkACoXcDwACt6GCtz1nfem5gmgMEOmkzcqy2WxKLXHoj8/i60=
X-Received: by 2002:a25:d689:0:b0:dc6:bbeb:d889 with SMTP id
 n131-20020a25d689000000b00dc6bbebd889mr8114737ybg.52.1708229630382; Sat, 17
 Feb 2024 20:13:50 -0800 (PST)
MIME-Version: 1.0
References: <20240218041204.2522828-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20240218041204.2522828-1-dmitry.baryshkov@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 18 Feb 2024 06:13:39 +0200
Message-ID: <CAA8EJpoXN_paysLhg=T8wRAiQWBHq-LLVrig_OYwRTbosn5WQQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] drm/ci: update IGT test names
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Helen Koike <helen.koike@collabora.com>
Cc: Stephen Boyd <swboyd@chromium.org>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Bjorn Andersson <andersson@kernel.org>,
 linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 18 Feb 2024 at 06:12, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> Since the addition of testlist.txt the IGT has changed some of test
> names. Some test names were changed to use '-' instead of '_'. In other
> cases tests were just renamed. Follow those changes.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/ci/testlist.txt | 1888 ++++++++++++++-----------------
>  1 file changed, 844 insertions(+), 1044 deletions(-)

Forgot to add:

Reported-by: Rob Clark <robdclark@chromium.org>

-- 
With best wishes
Dmitry
