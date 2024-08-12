Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5306594EB23
	for <lists+dri-devel@lfdr.de>; Mon, 12 Aug 2024 12:32:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A966210E047;
	Mon, 12 Aug 2024 10:32:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="aJyl8aLD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A407510E047
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2024 10:32:44 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id
 4fb4d7f45d1cf-5bd13ea7604so2252366a12.1
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2024 03:32:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1723458763; x=1724063563; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=MuMB18ettI0lvCVPN8Uzf34Q8sUnJqKE6aKvTS+gZPo=;
 b=aJyl8aLDtypIfTYr+iE00pTqQWp5eee+mym/Ra087vdyiYfR+wnoCOnAvYsVwFvDvX
 /0Ox5qAOPD2Bm0HZcylq4ql6PCdut9rkKxZpPgoY8GIZR1Zov30nLlJPdYVanB5sWhKY
 B94pMcYYWZA7i3Gb61RUKjexwa3vttYs+fLrkDiLKGaKFesDBET4h4keDtYkphpD4kbR
 LelHARPHBCDKKY/5xHLHdQCx7jqQq4MbzIWbvl3e3Ttxf/dL3jDybtiHs8o5ap1pgqCl
 076WuEH40BsKAwHaJZaL69UjiM145cywp88A6Q+NYtBpb2ZuD5v/+0iqDG2hZestT777
 QSAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723458763; x=1724063563;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MuMB18ettI0lvCVPN8Uzf34Q8sUnJqKE6aKvTS+gZPo=;
 b=dnYs0Qt1k6BwOkoHKspniGURF5QL0EshAO69aRMx0BGHeSgnPNzv2XWjZ3LtQJLUcH
 Ggg5cq+kneqC3eSnTlxvbp72DfECiAzA7MGq5u/JuSclLfHdfLTnbFjSTYvrY/Xd4gf2
 9WODOV0fTkypwLlP3bU6W/s7+hn0ynDae2DNDvLv2eZU3zMVueTlmybBt0fm4lN+nuz/
 9dqWHeSUzN5/V11Z3oH1VZ4aW5dCxPXVSgZ5xGY9NkAyOSmlyfiipqtpuEO7PUA6Hpx+
 REx+1ZBUNAZ+A9YNjQ3QnGjeoirZ7vkyO6VvgbDlgWmPgTxZMP+SnzQBrpILTqJK5M4P
 vSIA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW5TuLpCl/cl9VnlkuztovOd5bE/wezkty7f75psSxTXEjk1Wmxk59CuJeBtK/RInpPVh7cC4zfEJWnJHyIPe03uxT4nLtcojLDhALLVbLm
X-Gm-Message-State: AOJu0YxZ68ZZpzsmrIkNWXn00nG7k0tAlrTuq7DPPshPx2OM2i/6GBVn
 8HAoPj0YNwStojJbHUk4NMNY5yaCGrCA5BCk9rQHzfvXtzjQTiQWJim5LTxisEg=
X-Google-Smtp-Source: AGHT+IGTb0RPGjV/HCXKGAbFBigJr9D3mcpwdhEQ4rq2EtnP9756Nqrz7UcEH7QHfheStLdcF/BGHQ==
X-Received: by 2002:a17:907:97c3:b0:a7a:abd8:77a5 with SMTP id
 a640c23a62f3a-a80aa654862mr717740566b.43.1723458762661; 
 Mon, 12 Aug 2024 03:32:42 -0700 (PDT)
Received: from localhost ([196.207.164.177]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a80bb11a5c3sm218864266b.92.2024.08.12.03.32.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Aug 2024 03:32:42 -0700 (PDT)
Date: Mon, 12 Aug 2024 11:24:40 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Dave Airlie <airlied@redhat.com>, Jocelyn Falempe <jfalempe@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org, Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH v2] drm/ast: astdp: fix loop timeout check
Message-ID: <4b5923f3-27c2-4f7f-b3b0-542a62032b64@stanley.mountain>
References: <9dbd4d2c-0757-4d5f-aa11-7d9e665e7633@stanley.mountain>
 <8c1ad0a1-bbc5-4274-bdf5-fcf2e043a869@suse.de>
 <10624c71-d134-441f-a7e6-d757b60f54f8@stanley.mountain>
 <2af277bf-f07d-421b-8ffd-25c9761e3eed@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2af277bf-f07d-421b-8ffd-25c9761e3eed@suse.de>
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

On Mon, Aug 12, 2024 at 09:30:00AM +0200, Thomas Zimmermann wrote:
> > I feel like if we really hit this failure path then we won't care about the
> > tenth msleep().  I can resend if you want, but I'd prefer to just leave it.
> 
> Please resend. Even if the link training ultimately fails, the rest of DRM
> keeps running. 100 msec is not so short to shrug it off IMHO.
> 

Sure.  No problem.

regards,
dan carpenter

