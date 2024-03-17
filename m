Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B543587DF99
	for <lists+dri-devel@lfdr.de>; Sun, 17 Mar 2024 20:19:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6350B10E69A;
	Sun, 17 Mar 2024 19:19:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="QNIHUP4r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F9DF10E69A
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Mar 2024 19:19:01 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-2d204e102a9so44021071fa.0
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Mar 2024 12:19:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710703139; x=1711307939; darn=lists.freedesktop.org;
 h=mime-version:message-id:date:user-agent:references:in-reply-to
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Qfst673t7C8jXg66iNdTygTbdYEEGywEvce8gfb8oBM=;
 b=QNIHUP4r8QWz/pwIF2RNxDOQmZ4NmlfO7T6Qq9kT0cAddCf6wB0HvWKWWq9A0MQwP1
 9mug5M37nKmEkArEUlBLyiA8JbntGAeHYC+HPXMwXE5mWtm1YbhkU+f3uDBtrc6k0z3p
 iC3R9mf09OGYDOr6o3CcWrmuFR2eahwb//6/HetqFEv0gf+o5JLF2FuDVjtqRkEgwq5f
 jcj2LUft/dp7xCvmLm6Q8rIUA/0Bm3Y7O9gyIz9+Deszk7my9vwlVhcKWmu43aMxTMKj
 Eq/cu8blpgEVufVPnbUTK0KExfipVd5wqhhEpA6R6EWMb4lQzk64pI4RSUhSrCnfBUna
 MaFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710703139; x=1711307939;
 h=mime-version:message-id:date:user-agent:references:in-reply-to
 :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Qfst673t7C8jXg66iNdTygTbdYEEGywEvce8gfb8oBM=;
 b=ujSTvZSZJUCTHiBdWHLySW/E2YIiYuo96MBTlcW7tQ3z6tZMNQNOLnLAxRrRkUxrHU
 6fMUWv+rxP9OTY8oHb3o0Bk/nhis4MTOGf2XPpi74uN8dyHkUsNLp98J8hurTZjzc3q/
 2q6eW9RomU0dA7zpyOz+c8qycexDFYjR4KsZyxvBIbVc14ECwnLYSYsI3yIYEZjvg7d8
 IBp2ZmySDC1GyWNGmcBCvMxi9x+yqngpsemYfMWi6RVADO2HPEVTpWFsIzbu7GgoJADA
 eEtDAEOlQ8nyl7xSuUw3Z+N0lIlxktkuTCvHfMirfFyDJb68aEfucT3rVuZ9WKIxkD+L
 J3mw==
X-Gm-Message-State: AOJu0YyLTOR5wXl8uzAahvoR2/YiV3HH2RkCF+2BJRh7hYlRgS5UWu9T
 0n9kG64nMtSokT+CAtwopCNEt9KzgWRDvhoGDUunswC3mCr6XW9S
X-Google-Smtp-Source: AGHT+IF90IVvI0Ut4QFZTaXM+AVlBrBtbktFiXN815gXm1IZi+DmsOxC6n6I2KBamUNHG/Qv5hnXdw==
X-Received: by 2002:a2e:a0c8:0:b0:2d2:4fa4:f4b2 with SMTP id
 f8-20020a2ea0c8000000b002d24fa4f4b2mr6722521ljm.28.1710703138673; 
 Sun, 17 Mar 2024 12:18:58 -0700 (PDT)
Received: from betty.fdsoft.se (213-67-237-183-no99.tbcn.telia.com.
 [213.67.237.183]) by smtp.gmail.com with ESMTPSA id
 x26-20020a2e7c1a000000b002d401463895sm1187247ljc.69.2024.03.17.12.18.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Mar 2024 12:18:58 -0700 (PDT)
Received: from ester.fdsoft.se ([192.168.1.2] helo=ester)
 by betty.fdsoft.se with esmtp (Exim 4.97.1)
 (envelope-from <frej.drejhammar@gmail.com>)
 id 1rlw25-000000007hk-2zrp; Sun, 17 Mar 2024 20:18:57 +0100
From: Frej Drejhammar <frej.drejhammar@gmail.com>
To: Kevin Hao <haokexin@gmail.com>
Cc: dri-devel@lists.freedesktop.org,  Jyri Sarha <jyri.sarha@iki.fi>,  Tomi
 Valkeinen <tomi.valkeinen@ideasonboard.com>,  Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>,  Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,  David Airlie
 <airlied@gmail.com>,  Daniel Vetter <daniel@ffwll.ch>,  =?utf-8?Q?Ma?=
 =?utf-8?Q?=C3=ADra?= Canal <mcanal@igalia.com>
Subject: Re: [PATCH] drm/tilcdc: Set preferred depth
In-Reply-To: <20240317033918.535716-1-haokexin@gmail.com> (Kevin Hao's message
 of "Sun, 17 Mar 2024 11:39:18 +0800")
References: <20240317033918.535716-1-haokexin@gmail.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
Date: Sun, 17 Mar 2024 20:18:57 +0100
Message-ID: <kh6h4bra6.fsf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
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

Hi Kevin,

Kevin Hao <haokexin@gmail.com> writes:

> But after kernel commit c91acda3a380, the FB will not be created
> successfully due to the check of the valid pixel format. Then the bpp
> is set to 24, but the 'depth = 16' and 'bpp = 24' combo is not a valid
> pixel format.
>
> Fix this issue by explicitly setting the preferred_depth in this driver.
> With this change, the modesetting driver would choose the correct
> depth/bpp combo based on our setting in xorg.conf.

Check the fix in [1], with it not only does the X-server work with a
color depth of 16 bits, it also enables the use of a 24 bit color depth.

As I'm the author of the solution in [1] I'm partial to it as it is a
more general solution to the regression. I have no standing in this
community as [1] is my first contribution to the DRM system, but if I
had, I would NAK this patch as it only fixes the regression for one
driver and does not enable the use of a 24 bit color depth which is
something the hardware is capable of.

Best regards,

--Frej

[1] https://lore.kernel.org/all/e7ef6d422365986f49746b596735f7a0b939574d.1710698387.git.frej.drejhammar@gmail.com/
