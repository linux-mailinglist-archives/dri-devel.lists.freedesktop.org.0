Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D4AB9E394A
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2024 12:53:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7E5210E353;
	Wed,  4 Dec 2024 11:53:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="gJUx3Q9v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72FC610E353
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2024 11:53:49 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-53df63230d0so8048697e87.3
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Dec 2024 03:53:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733313227; x=1733918027; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=eZi0lek4MKOQiatQagp7Ze6cVrkfo3z9JDWmy9BvIl4=;
 b=gJUx3Q9vATaC1LCwMWCTFIrO+U1ZBN/DsX0iKs3d7lOIcmMwZtxq2mVsq8ij/RPEJV
 gmWJDcbZssvDiLIdNmi9zsk5eWF80TFDFn0IvcsAkNLhJ3PiCAeFjMLDKGw27U7RnfYp
 OmTH4+Dn0NGpan20rEp3Z7GLjN0ZBsCmEZy3uyL77O7gDp9dIJV5i7FNwHFPn6MHhWgZ
 oGWszH55Ar7JEqCq3/oN/ih0yZQsOTFyNVQh5iirAzCg3tGCpwTi7DJ/ffFUqsPL8D4z
 78T82Pz1XC6UDoiwBwk/skUekA6zkbsGxJT2qJAPncccpj8nFT6OuGiKRnMgGM7reEVH
 MlnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733313227; x=1733918027;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eZi0lek4MKOQiatQagp7Ze6cVrkfo3z9JDWmy9BvIl4=;
 b=gMm06VHc1HyINxmALPcyBT3AT2s81Yh1x448/0V9R5yBtWhncrEVhox2f7WtUS7HQr
 6DmwDMpe1i5dqqUpFTRZjMN4uubvlb+3qfWXrU+euhMbf0HKAavN6sYFQuJXH4ijP0ll
 0Fr/z40w3Q9HClBrep8IuCWjYlwSx5jZBHKFpxsIt5YEngkUoJU0H6vcRP7w4h272Qzi
 qBCPhz9jatCgtKPugM8la1hrAVSXAgXBZEEqntlse5fsqg2QsqqpIdsZfE66uAhGgAgV
 lw2e36xC3UKrLiV4eCZE7Xk6nFUTS4A/dK2diP0Jl3haRDq0U0ENtnGLBIy+VrRqqm7H
 +crg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUTLFmbE32LNiNJ0UV4tuNDSJmJuC/mcqiHkeGQyTBBvtp0tfxMckJyRref/UPxuq917WMq7n7N3X0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz4eM+6ahCzACanYrvwFjX0qtO1ZVbCzfRuHVyZCh91yDPfTb8A
 Rth0JCAW1J7gH66JzFqFbP6q2SgxUo4Y3bcjI32WxSqGtlrE7b0s/ikxHBx4TYI=
X-Gm-Gg: ASbGncuCoEVxoVuB2Bvnxko5zsl6RI8ejkCdazctHJ0V3qWNe7Wj+/wYs808W2xYWii
 YDG2jfmGxDWFMKRIEqlqEc/iR1eKEWTAhPZI/GAbDLYDFV9EeiIOX9mAgW5Sv3kzI0/w2oDazd0
 v/pkretMWtku4RiMyDuDjdaYeRxuNAjvUqumiel2EtbeUeMU9Ua9Oy1KgcBm1QEXIg9f3TjueN8
 vSlZdSTvUQjHdDA3G5J29xaE3YcyLFFzw1rv8kAAyxnRX6VXSI7iutjPogi+e8whKAs1n4oO+5t
 h/k627q99yVdk04mYHIrvxCjwMWlNQ==
X-Google-Smtp-Source: AGHT+IFnxylvsEOR+9iXG9XQGFOsLGLuTUnH2Iuu/xJxK8JDRP9Lh4DwH23FiU4cCFdLCw17KMc73g==
X-Received: by 2002:a05:6512:b85:b0:53d:ee75:1581 with SMTP id
 2adb3069b0e04-53e12a35260mr2697093e87.50.1733313227235; 
 Wed, 04 Dec 2024 03:53:47 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53e1356906esm554232e87.15.2024.12.04.03.53.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Dec 2024 03:53:46 -0800 (PST)
Date: Wed, 4 Dec 2024 13:53:44 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Tommaso Merciai <tomm.merciai@gmail.com>
Cc: Liu Ying <victor.liu@nxp.com>, linux-renesas-soc@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, biju.das.jz@bp.renesas.com, 
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/bridge: ite-it6263: Support VESA input format
Message-ID: <cnauwpk7myky6zbfcqg5335dqif4vmggzxlq554ye2bykb5iwh@ng4oxd2c5md3>
References: <20241203172129.778123-1-tommaso.merciai.xr@bp.renesas.com>
 <834a2690-ca06-4a8b-9a81-c4981074f95c@nxp.com>
 <Z1Aw0WafGmYDrr8K@tom-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z1Aw0WafGmYDrr8K@tom-desktop>
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

On Wed, Dec 04, 2024 at 11:37:05AM +0100, Tommaso Merciai wrote:
> Hi Liu Ying,
> Thanks for your review.
> 
> On Wed, Dec 04, 2024 at 11:34:23AM +0800, Liu Ying wrote:
> > On 12/04/2024, tomm.merciai@gmail.com wrote:
> > > From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> > > 
> > > Introduce it6263_is_input_bus_fmt_valid() and refactor the
> > > it6263_bridge_atomic_get_input_bus_fmts() function to support VESA
> > > format by selecting the LVDS input format based on the LVDS data mapping
> > > and thereby support both JEIDA and VESA input formats.
> > 
> > ite,it6263.yaml says IT6263 supports vesa-24 and vesa-30, while
> > this patch actually only adds vesa-24 support.  So, to be more
> > specific, the patch subject and commit message should reflect
> > this rather than claim "Support VESA input format".
> 
> Fully agree, thanks.
> I will fix that in v2 specifying vesa-24 like you suggest.
> 
> > 
> > > 
> > > Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> > 
> > Can you please send this patch with your Renesas email address
> > instead of Gmail email address?
> > Otherwise, add a Signed-off-by tag with your Gmail email address.
> 
> Thanks, for the point.
> What about adding Acked-by: from my renesas email address?

Acked-by has a different meaning. I'd say that generally it's okay to
have this light mismatch, see [1] or any of the emails that B4 generates
for web-based submission.

[1] https://lore.kernel.org/dri-devel/20241121164858.457921-1-robdclark@gmail.com/

> 

-- 
With best wishes
Dmitry
