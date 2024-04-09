Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A06689CF9C
	for <lists+dri-devel@lfdr.de>; Tue,  9 Apr 2024 03:08:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A978112865;
	Tue,  9 Apr 2024 01:08:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="omSlIeCJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF8CA10E260
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Apr 2024 01:08:35 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-2d4a8bddc21so71436361fa.0
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Apr 2024 18:08:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712624914; x=1713229714; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=y702sD6lZazSpofQh99p5zeY7MVLXMvfgYYg7IYQZsQ=;
 b=omSlIeCJ0ne6T7uPe5M/dSVio5ow0RVpca4iMaoDoK4Ou+OAOnOB96umhcgZCMpbMa
 4txoTfhm0lIGuBxhYniPXMSuiHJVPNG757FI4pbOWUQ5q5XSDnpkSgSY3FC5pwWHvHee
 550qZVYKoZ3UBZ9HW0TaABouj5HyRLLT+06dBv0Q34DXTLO1/oGfqYKbKKgfMiAR2chT
 JnMXdMJ4b46GNFkAozz5uqMIkHwsdHneFWWKd8I0GYDCnh0Dzl1R1/gsL7DNHruiibk8
 a+2bUYn0rtikCVb1UDNnlST/4lOwp+MYyb805+iNjRMxpmAN0InRczEykfiyiETMsZwY
 Jujg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712624914; x=1713229714;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=y702sD6lZazSpofQh99p5zeY7MVLXMvfgYYg7IYQZsQ=;
 b=qofqJwuHV1vDiIMlvnDdoPxQr16t5k8uOJyVQeIN2QAd+FUtkKbEOSJHd7fIu0L8zn
 3179tvDCGV/omMp3SiRjYNemdqTT3x3SxcTtdbionv6usG4QfJdad5oqePBOUSbPZiyh
 0kj7ywbXaOvuNg2U1JIcFbmcPN7k753Di4Fj9ejdmFlY3j96Xi8/2RuA6TEjqliolwt6
 GgNj+gorztFGMxgIQ/HkBcINN7XHNfQAKtbZwQmFDjeSGBxjtiVw/P83LdyoGwmDnfx6
 Nom8+3PPcsOt2Nw7ZVIfLrNFzIXsrfValVZLjgA/zpcmwsXOEEkFmvJuu3gzuNJAMjE1
 5+jA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVfac+qtkuBAuX+MMIKeCwerpIMGm09N6Zp6sFlowgNLu08Br3s++zR+nuKzDtI0e/2FeHPzEncRc3VqckYE2meI7zDzV0EdhXk8ZbXJWlT
X-Gm-Message-State: AOJu0Yy5/PNuR4vPcv3+sL2vOgxdoSACYUWAxEAqOTfMw3OqpvPJPGPx
 7PL6dTUFswkCWwm7FO+Cnbu8fVDGM8udC2IGdLXtlEV55enabHp6p+ySY2g54tpLNWhUwvPAi7m
 4rLH2se74mTJW3ACf0+ayKODncappUxAISPgBbw==
X-Google-Smtp-Source: AGHT+IHiy9qBSXkFrD9zOe8AVd14AwotGKD6BHTslXygXNglhd/58kA0ThQYKsDSq4+gjwlvtr0FPC+LDTBg0n+dnPM=
X-Received: by 2002:a2e:8913:0:b0:2d4:5c0c:77db with SMTP id
 d19-20020a2e8913000000b002d45c0c77dbmr7214260lji.3.1712624913705; Mon, 08 Apr
 2024 18:08:33 -0700 (PDT)
MIME-Version: 1.0
References: <20240403-msm-drm-dsc-dsi-video-upstream-v1-0-db5036443545@linaro.org>
 <20240403-msm-drm-dsc-dsi-video-upstream-v1-3-db5036443545@linaro.org>
 <qlabqrtsnw4mu23li6r6liujch5mf7n2bdbuuqrsukwfw24bmn@nyw5sandj2cu>
In-Reply-To: <qlabqrtsnw4mu23li6r6liujch5mf7n2bdbuuqrsukwfw24bmn@nyw5sandj2cu>
From: Jun Nie <jun.nie@linaro.org>
Date: Tue, 9 Apr 2024 09:08:36 +0800
Message-ID: <CABymUCORNVKOnNnZEhzLC9XjPuDOiVGuJ-NCh-r3VCXT_8o1fA@mail.gmail.com>
Subject: Re: [PATCH v3 3/6] drm/msm/dsi: set VIDEO_COMPRESSION_MODE_CTRL_WC
 (fix video mode DSC)
To: Marijn Suijten <marijn.suijten@somainline.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Vinod Koul <vkoul@kernel.org>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jonathan Marek <jonathan@marek.ca>
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

Marijn Suijten <marijn.suijten@somainline.org> =E4=BA=8E2024=E5=B9=B44=E6=
=9C=889=E6=97=A5=E5=91=A8=E4=BA=8C 00:45=E5=86=99=E9=81=93=EF=BC=9A
>
> Can we drop (fix video mode DSC) from this patch title?  It looks like mo=
re
> patches are required to get this done, such a mention is more something f=
or the
> cover letter.
>
> We could also clarify further to "set Word Count for video-mode DSC".
>
Accepted. video-mode DSC is achieved with the patch set, not this
specific patch.
