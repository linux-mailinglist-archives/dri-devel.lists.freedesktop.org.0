Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1201A1D9A2
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jan 2025 16:34:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D812510E309;
	Mon, 27 Jan 2025 15:34:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="NIbsa9rD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 854A410E309
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jan 2025 15:34:38 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-53e384e3481so4403689e87.2
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jan 2025 07:34:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737992077; x=1738596877; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=VuArV47OakPm5tI3u4UevLvvxevY1PGx5jGLqv+/LEY=;
 b=NIbsa9rD9kOHHVm82TVlJd58rxzByD7rh8SwVQ6SjjEgeuFPPoG4JHVHG6vZfTT3mb
 BaMC0mwsgXyNMNfBkbAz2w3rZfBhYNXpAS0YIx1mv6MvBQAfUSBC0a7d0w9eKyurQnVs
 KyGUZwH9SDaacpDQrXE3XAOJQ9aLj6mkoJUVfAwRnr2g56SvY/KAXzeBX4qRZFZyNBfx
 MV26/VvlmNFhJkv+Aa6szcHjuuKSd6UF1DnYmdL3J9CqgqS8iXTHk10hYXJ2vRl0+5PD
 SiX6zVv3HJTqsV0xlZKxdkth07LYuOoc3DyvyrC92DH2hEOLTVb4VD1K2XOi5aWdee6b
 6vpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737992077; x=1738596877;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VuArV47OakPm5tI3u4UevLvvxevY1PGx5jGLqv+/LEY=;
 b=a7wp1ExeiJqW8lWpNY1AlJx6h7tnFS6hQjrx1MyH4na4zw04XXzEw101kcjfbXlLxZ
 ZR7oXCh5FPCOpMJS3npJIojJJFDx4n74TaDTof6YrcxPaCJa2m5BZWxdf2TkjvXN00GB
 pnbk/Eta+/sTk3FyJdxAkoZvcv/Hygxb4rkdATqQO4WZKi369DV1SK7f7ncW1bTKw1XU
 o4TVA83tCBAZT3Ypx+95fIA1pzxq41jtXwqQQ5Fc/tERjIYfJaAE8iI4FGy4QTwd7bbw
 Hgsw5DOtgmiBFoSRnL9/KCZMkh7T2kHUieHStcca++I+kOklm5QHg8j3SfEOHelWITGE
 591w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWRsixxhke2UF79TtD1vdlDF8/LzFvDvfJLOpUlZxyiT7tAmlXKXJ3L751OtxP2Mn3eSdVxdQSaEsM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyYxse7/chreRDe5KZlF2uMDaHShuuVDpvlPFg4ZsSLRz2HYwjS
 Ylqd3hSCdEEzOI5NpMq1r4ri8WpNxSGuZ6xeUAyRQAKBtfmW3B1IQCejB/KwPKc=
X-Gm-Gg: ASbGncu10iKMYrv9MZaqAp1x/R8eqMTD0wkLH3WuJsmUaA8IrPHqRtnezTouKSC85wd
 6kL4Ab1MPs/xabUXyROHtsp9DyvI12/6t9y2qjmx4WYQzPQ5iSKtd4d3ciR6lO6Q3zqmmhxuNsF
 cMVEZ/WWn8q6KCNSVmFbxbawRNLiGQkz8cvpxOKqYRJu4orllRZ84VA78ZkIaoLrra3VgdHInCm
 g0TKrkNMqGY8LuQb+0eG7yeirXy4wHrqMUs+4GbM2pwIAzm0sg4rP4CysCzvU7v+0XAbiQUvFfw
 Tv3vtdnSO5ww+7C4D6Ifx3HWbnZy9V0MZgKr0KpF3jFMuGX1zDLEvnvEhKj8
X-Google-Smtp-Source: AGHT+IFBViOX5IoiLaMV4O3CShQ434LyDf8prPm5SaqVCZbNaTgxql6FUxNa13zXchLB5Cm/PRrD+A==
X-Received: by 2002:ac2:43a2:0:b0:542:6105:bb72 with SMTP id
 2adb3069b0e04-5439c224a57mr11688307e87.19.1737992076690; 
 Mon, 27 Jan 2025 07:34:36 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-543c83798cbsm1346139e87.167.2025.01.27.07.34.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jan 2025 07:34:36 -0800 (PST)
Date: Mon, 27 Jan 2025 17:34:34 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 linux-renesas-soc@vger.kernel.org, Andrzej Hajda <andrzej.hajda@intel.com>, 
 David Airlie <airlied@gmail.com>, Douglas Anderson <dianders@chromium.org>, 
 dri-devel@lists.freedesktop.org, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH RFT 0/2] drm/bridge: Use per-client debugfs entry
Message-ID: <hywmnv4jf6ix2ziabdftd5zcjqnkfq6pmqxqzw6spc76camrxz@jn5vr4mgj37v>
References: <20250125125320.37285-4-wsa+renesas@sang-engineering.com>
 <a3hrta4eiiknuf4sukk27xewhhirzf43u2eeefnpjny27m4x5s@aifvnevj7cb6>
 <Z5c7vk_oa8HGt7sS@ninjato>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z5c7vk_oa8HGt7sS@ninjato>
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

On Mon, Jan 27, 2025 at 08:54:38AM +0100, Wolfram Sang wrote:
> Hi Dmitry,
> 
> thanks for the review!
> 
> > > The I2C core now offers a debugfs-directory per client. Use it and
> > > remove the custom handling in drm bridge drivers. I don't have the
> > > hardware, so I hope I can find people willing to test here. Build bots
> > > are happy. And for it6505, it even fixes a problem. See the patch
> > > description there.
> >
> > I'd say, it should be done in a slightly different way: bridges have the
> > debugfs_init() callback, which is used by drm_bridge_connector (and can
> > be used by other bridge-created connetors) in order to create per-bridge
> > debugfs data. Please consider using it to create per-bridge debugfs data.
> 
> ACK.
> 
> > Note, that callbacks gets connector's dentry as an argument, so bridges
> > still should probably create a subdir for their own stuff.
> 
> I wonder if this is necessary (I just looked at the code and have no
> hardware to test this, sadly). It looks to me as:
> 
> - DRM has already debugfs infrastructure, yet those drivers don't use it
> - but they should
> - the new I2C client debugfs infrastructure is, thus, not needed here
> - DRM provides a dentry to the callbacks which drivers can "just use"
> - all drivers I looked at just put files there and never clean up
>   (because the subsystem does it)
> 
> So, from that, I should switch to the debugfs_init() callback and just
> use the dentry provided?

Yes, please. Create a per-bridge subdir under that dentry, but I think
that was the case anyway.

> Or am I missing something?
> 
> Happy hacking,
> 
>    Wolfram
> 



-- 
With best wishes
Dmitry
