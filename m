Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF07FB335F1
	for <lists+dri-devel@lfdr.de>; Mon, 25 Aug 2025 07:50:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 916E810E013;
	Mon, 25 Aug 2025 05:50:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="HBQoyKTJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A17910E013
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 05:50:51 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-45b629c8035so828705e9.3
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Aug 2025 22:50:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756101050; x=1756705850; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=XxtmnzOlVO6p+V95rUDP1WiZ+MmPfDK3rKZ1gsByIZs=;
 b=HBQoyKTJJxzMZ83rIUP5yZGkRgT+2OGfan3XCEJGZKd7TdwWWobyNTltC/237UsQBU
 jGm6EmGqRgfq+GLDU2bFTLBDUoQApW1v23IHUjzByvznDMl+h2smVUuaGw4cP0F55CSj
 bihtLgWn93WrmnSr+l5vlC478pvh2l6dQZcpEkfUO6JnFY7x0/env9KUZXFJuHAdeqMU
 AIVpMbxuCp/KDyWzViPV+KFyEd7jeAqL5V5Q3bRxXbTtxZXJ1EQGkQ+fdq7dpwYR5HiX
 +fKz9lyOie6bU2vnLR79mNoRT29tEfmnCRmE3vRqXMvhTp3zJ86pYeSauszXVSkDBpvH
 k3MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756101050; x=1756705850;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XxtmnzOlVO6p+V95rUDP1WiZ+MmPfDK3rKZ1gsByIZs=;
 b=o1S7d3Ntr/NcvzbfRFd8310fR0QsPLrbm+ISG8Zz+01qMN4/U22yxkKQk+PWlMrnbb
 zwNy1U7BaojqhA3pZIXvuFKy0yuE5WN/SfePFUo9H26wWFH4OS/3Cc/19Ywt9Twyg9zx
 ROrC+ni7oNe4QP2tqajIWXNE/IGfeEkqnDUA/prWuFKLbH+n2Dav/SKbjx6a9c0pMdO3
 CLBPDnhbD4t+vAjcJzQDxW1yL5q4xQm6+trsrtqBLezFmxSSUNadd+msZCZCLxiG7v+E
 l/IYuC1rS3NQl6EhlQYSFVHTq/RPdeX47kt4echZtDDwcF0M9SrtON1jUgTllp5kG2sn
 PnAA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWYu9XxL4xImngrr1G50X84pbdr/sinZ0aMC5QOY7+9/QWCgRDIXM4rzyyJqCNnZTHnfVZPYJZ7NxU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzXARSLfDxBWO0/cB7j/pWjM4BlA6GC867ebOhhvRg4wfSywrMc
 1CM0YdtV7zcoh/rboqMABBe6xk75ChHQ+CELCQsHDtrTCL6rBtYK+SJo5dISalrdPBA=
X-Gm-Gg: ASbGnctYK7bMV4lI+3MUITCSG/34q6tjfOBNFhkpSdeL2rADL1k0C3ix0otw8jcAKBT
 +W9UYEuqgaMzNQ2s7QJp05f3OCcHHNGql46eB6rWRD9WMXr8c3KmDl1Fp1hAePU3nz+Us8y+Ypg
 HoTvnQaDoy9NmVPBXv8p0e/C3LVcUZofKPrRU0p8n07eVd8PeRsJgRZ6khhYYF5IPVXH9saHok6
 McRqt3xMulcw40nImX9zv96GfNGl1pAJM/vtH038UWmI5cYxkhLyC2jBc5x6qPA7HlBpuwSm+KE
 nNcRVeB4U42PN6fsNaUJxptjVAe80DYMwLvGWpy57tEau3kaWymKlPM+pqyWLJ+JmBbCakK+5sc
 AGcvq5hxGG4eMgjsoieprD4BVmXo=
X-Google-Smtp-Source: AGHT+IGz2aNXINA9AVw27//eFJnmfZs0Q3t84LgC59OwvDU14iWZUpLl1zIrpYWB+eSKSTk8r90CxA==
X-Received: by 2002:a05:600c:154d:b0:459:d780:3602 with SMTP id
 5b1f17b1804b1-45b517d4185mr86200605e9.23.1756101050486; 
 Sun, 24 Aug 2025 22:50:50 -0700 (PDT)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-45b575929a0sm93063515e9.25.2025.08.24.22.50.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Aug 2025 22:50:50 -0700 (PDT)
Date: Mon, 25 Aug 2025 08:50:46 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Brigham Campbell <me@brighamcampbell.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Douglas Anderson <dianders@chromium.org>,
 Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org,
 dri-devel <dri-devel-bounces@lists.freedesktop.org>
Subject: Re: [PATCH next] drm/panel: jdi-lpm102a188a: Fix error code in
 jdi_panel_prepare()
Message-ID: <aKv5tkJghj6DZQIB@stanley.mountain>
References: <aKcRfq8xBrFmhqmO@stanley.mountain>
 <DCAVWVJ990VS.255346CDNF1GK@brighamcampbell.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DCAVWVJ990VS.255346CDNF1GK@brighamcampbell.com>
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

On Sun, Aug 24, 2025 at 12:54:41PM -0600, Brigham Campbell wrote:
> On Thu Aug 21, 2025 at 6:30 AM MDT, Dan Carpenter wrote:
> > If the mipi_dsi_dual() macro fails, the error code is stored in
> > dsi_ctx.accum_err.  Propagate that error back to the caller instead
> > of returning success as the current code does.
> >
> > Fixes: a6adf47d30cc ("drm/panel: jdi-lpm102a188a: Fix bug and clean up driver")
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > ---
> >  drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> Good catch, Dan! Thank you for the patch. I'll try to be mindful of this
> kind of logic error in the future. Please let me know if you have other
> suggestions.
> 

Heh.  This is just static checker stuff.  https://github.com/error27/smatch
Humans are expected to have mechanical attention to detail at the
same level as a computer.  I just try to write the commit message out to
prove that I've looked at the code as well.

regards,
dan carpenter

