Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47943D3C56F
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 11:35:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAB9F10E5AD;
	Tue, 20 Jan 2026 10:35:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=fooishbar.org header.i=@fooishbar.org header.b="M8ulvAN+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com
 [209.85.160.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF5F810E5AD
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jan 2026 10:35:50 +0000 (UTC)
Received: by mail-qt1-f169.google.com with SMTP id
 d75a77b69052e-50146fcf927so53807151cf.0
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jan 2026 02:35:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768905350; cv=none;
 d=google.com; s=arc-20240605;
 b=EzYa0qQvkcadwWlGACJ31w826wlN/LZ1J8Z1rAKwaN0Y0279wh6BuQ8Td6ofDZHZk1
 S6/2P8i265N3CwRIzF0gGP9AwOBmbCFaZNpGvP38sqNdJsj/8tTjAa6BYdSdzu5hYVmM
 91LdDFg43ncelv9oojSxZduG267HK0KWHy8ShTKGaCeuGnYcm/8rTPesE9BBcRTx68P9
 o8Okjm7rNF1Jgy5jY3yuiK+oZbXVrxH2ZyDg+w5ZdSIXEEPdRdliNvaqt3FWfLCb8b+U
 Y2Rc2VlQQPf/bsa8ounkxBtbn6NIe5mzbfwdb+oYrU9pLhu265C9BUaegi5UTBFmvDnj
 nuBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=EngcF0AuMSe4GxCLzFlk3vYwqxnh61muSwDFDmoTUcU=;
 fh=LLU1dpcnb34Io/2AcHsTvqkKcUg+t4BLxtHWAA9P160=;
 b=BA+bDX9l9qD/8XqHHLmifU8DVsIZy/EiIGNxLaQOvan4uFbJridqAE+YqsrH9LisSA
 rUUAY5se0sVVtREFtkXMHIEyHPs340B/0/dLV3EctpgE4bW8U58bYQrlAQn8SUG1e6/O
 ncF/G02UHrSfyURbdWX6q+uitBan1iPX5qYLLLioDd21NcCSIcl+RE1lD4H0a7GnTA8I
 N4OhbLNWpaUshM4vfcTiQqtuIT341LdAsUe+wzaldOLqXqBs2aPNEovtTYKilRdmXBba
 IO3l40WF6pudJ1BOWg6KTD+RMGK98L3+ud2wdHEwDrcUv0TOiXVfmCvfuakRkLKG+i5g
 sYrg==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar.org; s=google; t=1768905350; x=1769510150;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=EngcF0AuMSe4GxCLzFlk3vYwqxnh61muSwDFDmoTUcU=;
 b=M8ulvAN+sP7mxJgOZ/cOb9ewPGrA0eLKltsZpzjDayZitFvdvKOaC+YIhqJPUU92P7
 SJruON9Rw/njAvrIsxZTNewHiifyyY5fu94hTXwXjjV/z5kYG48cw8kns3BG110LtVsz
 SM0QQJO9ILsZp5dtYJoevGRBYdZoSb8JG1mF0oyacx4KaUWu4IGQZsWmTsDVrgMFBHH0
 5DRVgAiHsfX2VXl50bQz4IoOe8/GQcWK+0QSkOxtoiM1ZadHyvw5lJOaJJYNdP2juaeD
 tjmZdRrOQ9tCF7O4d0BoawonXhtdTQkRx/wuSXqeh/k6PEASOnneuJZkWKhAVE52i6hU
 vpIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768905350; x=1769510150;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EngcF0AuMSe4GxCLzFlk3vYwqxnh61muSwDFDmoTUcU=;
 b=SswoDArgTdangVrbSvmJt75cMqbO0S1YOMyAQrdLoiEYqlRzbo9KahRUjN0HctkP97
 w+cPWaLxDmswjtoQr4Pfm0RCsEHTT65aZQrfy4ZPu97yZp5uCvHFE/H3Fh6VhutxaG6f
 qeqk460/6ApSH3yTj8rXmyPZhMYU4bHGaW4Qaoz7oAD+5ZKKK27l5nchiWRdXTChi+aw
 8Y5egTVnGHTiIhH8dUDCDK8S8yMnGvIggKVf73OQ8rIoq0YinQhC7XkgBoSEVPXmKDR1
 VvIWR+4fipbciuqHzR5EAIGTJ+zj3S1pb4J4MsW4JMB9ltAX0Um9AUn1ZUC9oS3jWh3x
 3chw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXKRyrnsBfyEMHtz9kR8/kS6HIyFjVBuYSNFeaCanYRmscPqMdSWgU5UYRMTannR+AT3iGL6uNYMtk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz3gyCEd0CW/m8EHzNk/poPUYk4+HfN5cpapo/40cqJTtOOTn6h
 j7q5FXUNj60rBxgHTjowgNL/6bG3Ua73dzutBdweeoS/ojHnydm2onTXHGqbjKIDWb0aLHss6ty
 lHnp/gt+z8yEsu+LGjay3LaVr9+Gdp/mx8V3/RsJN4w==
X-Gm-Gg: AY/fxX7A4Tp4856llUVpUxax1Rx4yOLuNE/JR7nFqtxh5NQBLQ67EPkHYS9tasslw6j
 du3zvhr5aauWFYLp0omP9PEEenPropqLAv2Xt4Oq+meieJpDKCsKb+0QXPKF5AazFIc66O7jOEk
 tYMaZFM+YgZh72VcONVPzfL0HrmvLyNVQYEIW3dxFAlVdchLvAHzqoFm+JHYpqNFjVZ+P9zbn7Q
 9Bax3fD6Qrjrikj6fYS9EuOWxNfICIcv8zcUCMMIk0h0BpOhBRQ6Xkwa1sfAWPgHrBs9Ffz1S0c
 0jA=
X-Received: by 2002:a05:622a:1211:b0:4ef:bed6:5347 with SMTP id
 d75a77b69052e-5019f8faa18mr267369681cf.30.1768905349558; Tue, 20 Jan 2026
 02:35:49 -0800 (PST)
MIME-Version: 1.0
References: <20251206-vop2-atomic-fixups-v2-0-7fb45bbfbebd@collabora.com>
 <f9f7b446-8575-4f16-aa96-5197b22846e3@rock-chips.com>
 <4696988.LvFx2qVVIh@workhorse> <8655687.NyiUUSuA9g@workhorse>
In-Reply-To: <8655687.NyiUUSuA9g@workhorse>
From: Daniel Stone <daniel@fooishbar.org>
Date: Tue, 20 Jan 2026 10:35:38 +0000
X-Gm-Features: AZwV_QhRkXnTevqN1bZxbydehXRez199_FOqVjVHDQ7c6Ms6YsAuPA9K_r8GGT8
Message-ID: <CAPj87rN19nQcFT_u8WyNO6a+2AbAp2hBG7ARbWoJ8-jwO3yGfA@mail.gmail.com>
Subject: Re: [PATCH v2 5/8] drm/rockchip: vop2: Enforce AFBC source alignment
 in plane_check
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Chaoyi Chen <chaoyi.chen@rock-chips.com>, kernel@collabora.com, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Daniel Stone <daniels@collabora.com>
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

Hi all,

On Tue, 9 Dec 2025 at 10:58, Nicolas Frattaroli
<nicolas.frattaroli@collabora.com> wrote:
> In either case, I think adhering to the atomic API to ensure
> artifact-free presentation is more important here than enabling
> a fast-path on RK3568. I do think in most real-world use case
> scenarios, the fallback won't degrade user experience, because
> almost everything performance intensive I can think of (video
> playback, games) will likely already use a plane geometry
> where the width is divisible by 4. 800, 1024, 1280, 1600, 1920,
> 2560, 3840 are all divisible by 4, so a window or full-screen
> playback of common content won't need to fall back to GPU
> compositing.

That's exactly it. Changing userspace's request may result in
unpleasant visual artifacts and other unwanted effects. If userspace
wants to always hit a fast path, then it will need some kind of
hardware awareness to do something different here. The patch series
pointed out gives userspace a good way to figure this out.

With my Weston maintainer hat on, I'd take a patch to
weston-simple-egl to allow it to use a different size with
command-line arguments if you'd like that for easier testing. (Fun
fact: it was specifically made 250x250 to discover issues such as
this, which wouldn't be uncovered by something that's aligned to a
generous power of two.)

Cheers,
Daniel
