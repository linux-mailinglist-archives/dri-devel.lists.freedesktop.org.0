Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D83790A82C
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2024 10:11:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C990010E19C;
	Mon, 17 Jun 2024 08:11:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="q1eJL6Tq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
 [209.85.208.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 265C410E19C
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 08:11:12 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id
 38308e7fff4ca-2e724bc46c4so46168521fa.2
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 01:11:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718611870; x=1719216670; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=K25N/3U/fOedvyckwiUPgO04fDA/X3bUf5ZT5QtlvDQ=;
 b=q1eJL6TqWi+sv5E7Jj528lEGSH3qv4USCy+X713CFTKU+s3R1pSBL/90FDTVXdyDPE
 gRwVghVcN42RrgI34I2BctP1Cq+wPnhSoPCrgpGFBJ7x/bvHn029zq/VifLra8JMTN/8
 GqRLLsexJ2hAyI4ghlsJa2xIABjy+GLGAeaWQSA5RvDr5pmSwsZBv/1z0L4fbPT6znZG
 4q05/CxyvpaHwCF+TFUGpST8RNyLGTQZ34TeXE79458UJQ/N76AGG3Ivs4fHjp9tSKQI
 Sh5dNaOy4oUiaA7n4DLi4U//zb51dneAzJehF8NdPngGJby3wOJbH6dzCN7wFTqWBvzG
 Wi0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718611870; x=1719216670;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=K25N/3U/fOedvyckwiUPgO04fDA/X3bUf5ZT5QtlvDQ=;
 b=aFFolbg2NcJLZcV2aodx2SozExGPYLhGff1OwrQZcsdNIk7HbLb1LGMHtO8m92QtAr
 6Wo7JxYLeEF5HIDP3TaaOCL7EoF8zcM3OSpbCJtxsCJQneJzwu1eYf30gLh9y/mrjh4B
 +3AcIjg2LrDCsdUYytkGrm8F0g46/ywQ6am0zBVDydYBhUKxPjTnEAfNTbeTBR+Uhvgc
 xqzlB7sdDWNoTxx7jR1tXzdqT9C2Bup3svuG4yjl4VjwGkHj0jD6bZ3QqCAwD6acKkPp
 9QR4HnCK2M45UmzB4kPrec9sGGTNhk2YlO9VI0fWT+u8bHLJahohjKVR9B+kWYwKww3Y
 w2Rg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV9YB5g66/YuoyTJvWzFvUICLyWy3oTHi6qoHQ46z1Q3bUSKIt7429z59M2MLJDShfHVJ6/iDYb52L6nv9Yw1Jnh4S0tXSFDTBHJSHU7+Xn
X-Gm-Message-State: AOJu0YwvKW0Ri7UI1QwCosPesORKUVzWMswlEAQqHGRieZOEdXfQutCB
 mfUAFi5gdMFZCyk1aLHC8W4jKKbzmdA2DljVZXZdMxx66M+Dbt1+kopm/NStuDc=
X-Google-Smtp-Source: AGHT+IFCbU4wJgy3KJBNKr1vrp/thHriy4QxTxqnakP6BZLSA1eJsbZCOXQs+4n8+TiuKo2DRzQnXQ==
X-Received: by 2002:a2e:9a99:0:b0:2eb:279c:f87d with SMTP id
 38308e7fff4ca-2ec0e60d841mr56864551fa.48.1718611870063; 
 Mon, 17 Jun 2024 01:11:10 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ec05c783cdsm13348901fa.96.2024.06.17.01.11.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jun 2024 01:11:09 -0700 (PDT)
Date: Mon, 17 Jun 2024 11:11:08 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jan Kiszka <jan.kiszka@siemens.com>
Cc: Marek Vasut <marex@denx.de>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Alexander Stein <alexander.stein@ew.tq-group.com>, 
 Aradhya Bhatia <a-bhatia1@ti.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sam Ravnborg <sam@ravnborg.org>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] drm/bridge: tc358767: Fix
 DRM_BRIDGE_ATTACH_NO_CONNECTOR case
Message-ID: <o4bwopeuyxm6344oqqm3e7p3xcx76aw2trsiuhhfyhel2e7po7@sz2jaj6i7kqd>
References: <20231108-tc358767-v2-0-25c5f70a2159@ideasonboard.com>
 <f6af46e0-aadb-450a-9349-eec1337ea870@ti.com>
 <2f3bb86b-6f8c-4807-985e-344a0c47864c@siemens.com>
 <3277848.aeNJFYEL58@steina-w>
 <b2052bc9-b2da-489b-9e5b-3c9b4f6c1c99@ideasonboard.com>
 <bc96c6b5-a7f8-4ef3-a89b-bf577943f11c@denx.de>
 <36ef53b6-57a3-42e4-95ef-a10eef4ca1c9@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <36ef53b6-57a3-42e4-95ef-a10eef4ca1c9@siemens.com>
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

On Mon, Jun 17, 2024 at 07:40:32AM GMT, Jan Kiszka wrote:
> On 16.02.24 15:57, Marek Vasut wrote:
> > On 2/16/24 10:10, Tomi Valkeinen wrote:
> >> Ok. Does anyone have a worry that these patches make the situation
> >> worse for the DSI case than it was before? Afaics, if the DSI lanes
> >> are not set up early enough by the DSI host, the driver would break
> >> with and without these patches.
> >>
> >> These do fix the driver for DRM_BRIDGE_ATTACH_NO_CONNECTOR and DPI, so
> >> I'd like to merge these unless these cause a regression with the DSI
> >> case.
> > 
> > 1/2 looks good to me, go ahead and apply .
> 
> My local patches still apply on top of 6.10-rc4, so I don't think this
> ever happened. What's still holding up this long-pending fix (at least
> for our devices)?

Neither of the patches contains Fixes tags. If the first patch fixes an
issue in previous kernels, please consider following the stable process.

If we are unsure about the second patch, please send the first patch
separately, adding proper tags.

-- 
With best wishes
Dmitry
