Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 617B09FEA1F
	for <lists+dri-devel@lfdr.de>; Mon, 30 Dec 2024 19:49:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CF2710E2CA;
	Mon, 30 Dec 2024 18:49:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="JECHWmjT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC70010E2CA
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Dec 2024 18:49:35 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-30039432861so108184561fa.2
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Dec 2024 10:49:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1735584514; x=1736189314; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=BhbqRopSzlDwH+iL1PGsgSOq/BjIOG9t0VRaB5toV3Q=;
 b=JECHWmjTDXzFJ1e0rFh1CMqeHcAExjfSdu+BV8nmKmi6famWt/r+2N+iTWKeY7nqZn
 s1jb5M6CENCr+HAcItrUxdostWf+fCVYkK/sMlCdlxOSYHVJKgRSiOwZAoQuPX8W6mnD
 D6wXmygPu60nZVt+Wp+iYsaK5lcT3ZILW415Gef6yyyEjtAnEi49I58LFuE1O8ajNuYw
 iDroSnj8LgkjCNUr0V3ikbuE6UR2h4f639eMocfqmbhoGwJ9d8HeAu4bnMKXGG9Zg/UV
 1xCFynYMejwuIAN1eagP21se/8RKjIczi1rtDzokdEsxbdjh5aHapEBiEz5eL7bImnFB
 CYhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735584514; x=1736189314;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BhbqRopSzlDwH+iL1PGsgSOq/BjIOG9t0VRaB5toV3Q=;
 b=B8kWfnH4YODfiFeyb8dwPpj8U0Edq1TMWV7XY2m1rMGEGIW1zCyOL+CaQyIMMRF1W6
 +L9e2G7Hww13iO6i2j0cULpC6f0K5mmIWO3kadcVzXQq30Yu3eSFXGTnk4EKEMcMAH1z
 H/8CcKgvzRSitGiASBBomzYWINCabRjv54KJxMmO+35uzjB0/npi70/8XD50p0AiwJH6
 p7UtNN63W6ueHtSWO6s/4NZCuocczf5/KIZIzRJI+9rV2sexU8fnRwnA8yOj5NiKls29
 62eEwPu6DonzO09VGNSInR9S06nK3ik15N8+pTrtr4QZW/TYBj0RoSjs43CG8EG8/Spn
 hFMA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVmHKOuj4fjyA1h/EricwusxHfVj7t9lbjd2/73rWB2bgkZQhM9dT16vihbBza01sxW01He7ANhiGc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxe59bhg16gB5/He0kk8BBDSRU0eOjxexoADqSV8uX78hUhPS2m
 4m5tPI/KI7JBZA/v+SCKSOk5I5iTQBuojsFDGgzXUk7bj04xXCU4r8EA2+SZW8Q2zcB7wPKuFWE
 L
X-Gm-Gg: ASbGncuLDNnXB/GVADxIbdldbOlIDerf7E1Ee7x3OjQtNHKte1MospTsCBOUh1OMDAG
 TJgLtMo2Fr2rOs+Pz03W1UB25OM2SPkBGNCy0bDxvE5KvOJdUg6TrMCaHrZv6paDcmR3lwyy7MS
 Lw3YATf9/54TWM2h3j1u6cX82+wnLZ6aG651QWYnKxmdk3o/4ImN/8PzJeeBC83dpUzovgUaalI
 FeFBhbIpZ07llE0tt1THHwGBnd31cke1uTevq9zMYdRq4QY/ds5j8MgTwAnIU3ddO4KA/zIiHlU
 Gdd0b/q71x9M3CjFWxP0rT5IMn4v7SMMQKCr
X-Google-Smtp-Source: AGHT+IHyWvMQAs3uBoIHUhsEdikXQ5g6dGtenLTfp6pefm6tfJnRqs6c5XtyvdM1cYBHK16UCEygyg==
X-Received: by 2002:a2e:b8c5:0:b0:300:2731:4120 with SMTP id
 38308e7fff4ca-30468535fefmr89410381fa.15.1735582970396; 
 Mon, 30 Dec 2024 10:22:50 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3045b083aedsm35944581fa.102.2024.12.30.10.22.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Dec 2024 10:22:49 -0800 (PST)
Date: Mon, 30 Dec 2024 20:22:46 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, 
 Ekansh Gupta <quic_ekangupt@quicinc.com>, gregkh@linuxfoundation.org,
 quic_bkumar@quicinc.com, 
 linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
 dri-devel@lists.freedesktop.org, arnd@arndb.de
Subject: Re: [PATCH v1 0/2] Add missing fixes in fastrpc_get_args
Message-ID: <qd32erndjbtspx4im5u2ge2vgdc4qwwvxhkoaefxwzkue5x7kc@ghk5fdkma6vm>
References: <20241218102429.2026460-1-quic_ekangupt@quicinc.com>
 <173557534277.273714.16861047953843054499.b4-ty@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <173557534277.273714.16861047953843054499.b4-ty@linaro.org>
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

On Mon, Dec 30, 2024 at 04:15:42PM +0000, Srinivas Kandagatla wrote:
> 
> On Wed, 18 Dec 2024 15:54:27 +0530, Ekansh Gupta wrote:
> > This patch series adds the listed bug fixes that have been missing
> > in upstream fastRPC driver:
> > - Page address for registered buffer(with fd) is not calculated
> >   properly.
> > - Page size calculation for non-registered buffer(copy buffer) is
> >   incorrect.
> > 
> > [...]
> 
> Applied, thanks!

May I ask, why they are being accepted with the obvious checkpatch
warnings?

What kind of process is being followed, as those patches had review
comments to be implemented in the next iteration.

> 
> [1/2] misc: fastrpc: Fix registered buffer page address
>       commit: fa22a9743aece593fe9f1e0a0d6189a777d67e38
> [2/2] misc: fastrpc: Fix copy buffer page size
>       commit: 58570026c7ac249bfbd90f9fcb7d2e0a74a106a1
> 
> Best regards,
> -- 
> Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> 

-- 
With best wishes
Dmitry
