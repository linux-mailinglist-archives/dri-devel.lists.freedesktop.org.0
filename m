Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A8AFA36A0B
	for <lists+dri-devel@lfdr.de>; Sat, 15 Feb 2025 01:43:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C8F510E107;
	Sat, 15 Feb 2025 00:42:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="LplQ07Ac";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E96CC10ED44
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Feb 2025 00:42:35 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-30920855d5bso12312501fa.0
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 16:42:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1739580153; x=1740184953;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=knE8v9zYVGyQDQfSdvTMBCc1TTHDqVX+HxXJrV1G9rs=;
 b=LplQ07Ac5B/B3BpQPSdSItQGp3fTXmV9rAisWG4D16cLaYD0aT+trN6IUnS50l6JpU
 GdgNIWr8zPc2OEvg2NK23DrW7Du1+zKz1lna2K3kAIXOixBelKcNC8DrQRRpGzdxepMT
 eOPSychbPIewLxWev4fI3ybwva/x/mbq9Z3Hw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739580153; x=1740184953;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=knE8v9zYVGyQDQfSdvTMBCc1TTHDqVX+HxXJrV1G9rs=;
 b=g2G3aqNQcaHn6c0RazymPy/U++b+PH+ge04xQA4W/sqG0BtnBbJ3g+JCJqXt8VdSzU
 IQFiuv1VWMjB0OuTot7opD74b+bZxoGWm8aHAB6+hQ8ns6QVAOCKk52/TnfsjX6iEOi8
 gBUdLq75y3HnHDFAAldaZ8ofmgAy56E6GMyiFm1cLYj5rcU8cz83X4eLyhHzBQhe39TM
 R7pbw+sXFKkIN5SquNMHftLpqsr4Xd+Y40D0z/12ws4LipCY2qN6p1wcfVveMaDWf86c
 su6Wv6wVuVrr7rOiCo+gkbGCh5Ihz1jA0MHT7dXTEPQ7MnUp74HH/MvkyCeYvWSNv/n1
 iluw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXO3DIjgorsM/oKYHFShHOwUhhgiiMsPZXJVF9a16LPU62BzPyfU53OfUOIDNadxPxEk0kCgwBEdmE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy8pfv50/i/WQ2Og0xf3XX/4J8N/8R2Cdf5zaEfTG/eBzPjr1zT
 4SPrpmhE95gwYkh6hs75qGoepORLBmBFETJn67loBsFloENEWONp05pbr+jmkwS9YmxjH/aYdhi
 UUTO9
X-Gm-Gg: ASbGncuhlccjjpkGO+RYurlGDBZCcF8Z78H9H++K9B+K2xKXehNAzc23XXS7qv1rK14
 SFXCm+4DGRo+jyPMc/O2+q0Y4ra1TYFM+bAfDNShnOW44KU0+T2J0AIxyp560av4BKLdw73ShQJ
 9sqZfLGwKQPaHxC8KbqPEmRHtLDRJUJvmRMWltNG0ehxY8s6P80mgkM0+SGhk8KCcqhYxTlSun8
 Dv2Vv9rFXHypJNA/C096JNhJLJ+9WnIQzOUhfP5pMZkhoQYqjtoStNgrv42nrvMPP5Z5I1esuIc
 AzUmAxhBVS4PnhMniXf+eMri3/rLlQSjvyW7MI4q5VCJ7T0G29tVIhuIuh4=
X-Google-Smtp-Source: AGHT+IHx1HRH3cXkCWuRPa4IHsHiXwR4YbpyuL+C7UrHMc+hmVGR17ZOebgHflO3Ht/zTGnyaabU4A==
X-Received: by 2002:a2e:9bd4:0:b0:2ff:b8f5:5a17 with SMTP id
 38308e7fff4ca-309288c09e5mr2930201fa.5.1739580152907; 
 Fri, 14 Feb 2025 16:42:32 -0800 (PST)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com.
 [209.85.208.182]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-309100c536bsm7506891fa.21.2025.02.14.16.42.30
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Feb 2025 16:42:30 -0800 (PST)
Received: by mail-lj1-f182.google.com with SMTP id
 38308e7fff4ca-30920855d5bso12312211fa.0
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 16:42:30 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCX6Cz4Dv6ATzCMoI7etxgcNe4jpg1u6wGsxpPrfqyHDvuUwcF8P0XZp68P1ltHXZlj1qcnuA1nG4Ug=@lists.freedesktop.org
X-Received: by 2002:a2e:910e:0:b0:309:28c9:54c3 with SMTP id
 38308e7fff4ca-30928c955aamr2870491fa.12.1739580150226; Fri, 14 Feb 2025
 16:42:30 -0800 (PST)
MIME-Version: 1.0
References: <20250214172958.81258-1-tejasvipin76@gmail.com>
 <20250214172958.81258-3-tejasvipin76@gmail.com>
In-Reply-To: <20250214172958.81258-3-tejasvipin76@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 14 Feb 2025 16:42:18 -0800
X-Gmail-Original-Message-ID: <CAD=FV=U22kToVeyCBy_TV5hNKuMZv-QBUg0WTyXsMSu=bHLd3g@mail.gmail.com>
X-Gm-Features: AWEUYZl9RMNhOlvjGnk24tr1lRpcTUKmNyE4ytjlZLYxfkgep28FyUJ3Tv8BSeI
Message-ID: <CAD=FV=U22kToVeyCBy_TV5hNKuMZv-QBUg0WTyXsMSu=bHLd3g@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/panel: sony-td4353-jdi: transition to mipi_dsi
 wrapped functions
To: Tejas Vipin <tejasvipin76@gmail.com>
Cc: neil.armstrong@linaro.org, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
 quic_jesszhan@quicinc.com, dri-devel@lists.freedesktop.org, 
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

Hi,

On Fri, Feb 14, 2025 at 9:30=E2=80=AFAM Tejas Vipin <tejasvipin76@gmail.com=
> wrote:
>
> Change the sony-td4353-jdi panel to use multi style functions for
> improved error handling.
>
> Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>
> ---
>  drivers/gpu/drm/panel/panel-sony-td4353-jdi.c | 107 ++++--------------
>  1 file changed, 23 insertions(+), 84 deletions(-)

Nice diffstat and so much boilerplate error code removed. :-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

Note that I'm on vacation next week and it might take me a while to
dig out of email when I get back. More than happy if someone else
wants to land if the bisectability problems I talk about in patch #1
are resolved. Otherwise I'll get back to this eventually.


-Doug
