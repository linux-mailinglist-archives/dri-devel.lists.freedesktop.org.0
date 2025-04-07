Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D85EA7D8AF
	for <lists+dri-devel@lfdr.de>; Mon,  7 Apr 2025 10:56:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D094910E3CB;
	Mon,  7 Apr 2025 08:56:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="xx1aTsq2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0031C10E3CB
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Apr 2025 08:56:18 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-43cf3192f3bso40761675e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Apr 2025 01:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1744016177; x=1744620977; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=4lZ26/MzKr4Ipcy6k7wbvxY0bsuMHsFajLH+7Kr41sA=;
 b=xx1aTsq2xjq9cjAG0YvdIOMF97YphTY2Dc5qm6zqKI0h8zvasxMD6TYt4Oq3hO39jw
 TaIHNNanDBEmtzg3UVloUkj70G9KA0Lrnqm23FcpqXiU5Ug3Myo657sgdeO30tvIW6WW
 Y4PXs5kMRk76ymSWpPs1C2vP4Y//sunZx0nOQZw4BQOG5Z7Q1AFY9e/ogGn9IO2dY1Ae
 0X7ZqJrsBNUGmAAHeCk3PLxybHI1DcbIGlP/wzyONqdpxq1Y0JwX4id3DvZXWR8KbpNM
 bIq2Anzlw9zozq6LYnctVSvZO+LTrL/5LHpzh98ZMf/1lquxL35gIzIBSPE0HjN52fLs
 lxIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744016177; x=1744620977;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4lZ26/MzKr4Ipcy6k7wbvxY0bsuMHsFajLH+7Kr41sA=;
 b=RnyzWZtfYEUDxYb6Dqqzh20xUjz5u+04k85lRxuhJD7VLIJX/Pc0NfvaMNx6XxsGqd
 hhhWaQr5muE2lZL1LaPXx9SAA5e15r4kYxzVHDxq8PWj/sN3T0P7c/l61kOgBAsn34Hz
 JnHxNuOlO+bbhOq/NR25kczmgAM6JP1Bp886cWu+YUiIbsViSWcFUR7YWhKRumzB7Aci
 G2eitxPTEeobkI1W2v+gBDdDDQKSSz0H3EnEJGofvKTF+8A6MD1y2YzGiqrm4Q9j//0+
 v4T3tz/IIpanN+/15gkFFA6APinxjheeDnxQZJaxPIlrDvWQ37LtbAnbIAAYl3i/TDD1
 NgaA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX75tObqC5/fjnIi5YIdTjBH1+T8lkaFCWuEceiC+3ANsyTojO0Ey8+lul1KLk+HeZ83F11XBjQjLY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyGOiiB97cxjsl7fm37lYxd8BtWRAeLTCYEIby5cNO2qQcowRHd
 SpZu0rmteN8W3DlB6EjHsrJ6A0KLnMGrhZk2EwFrB2l13mjya4OcWFVq9SBrQaE=
X-Gm-Gg: ASbGncvZf0dXO9j8C1eX77VXnBc9OoarGTor+mdT9jgXX56yvjbIbMaR1qcVWduJfdJ
 KOmVWamK7j1ZD0Yp1tgRyiYWgt7e28fjGQpH9v8LJvO8Zy4X3QZFaSjjr9mGB/88Y6zHHTR/pAX
 GGAszeU42/7xhReLfg9Y4Sri6s+Xm4ibABld3wu/OGZhg4GHgMRo2krg3AlY0rrzTZug8EyomBg
 xHtwyyU/LXfXm2XtXhRh2aJzeqggfDhyu02pPaxX0LD9IKz2hrvGtgMxNDJMHNmU4BL19o9o7jF
 vWkzJ/J+0855+cOsXfT3l4F+xEtCHHtO+wj4FmxZxxT5CzQsHPRcqvLZKrPa
X-Google-Smtp-Source: AGHT+IFX/DkqBzJz9j5+HAQzhFFiQfm7Y5i8Q/6EzrAHz716OWaZOhpPQhlCWHCWVl6h0q1QhF4T0A==
X-Received: by 2002:a05:600c:3b14:b0:43c:ec97:75db with SMTP id
 5b1f17b1804b1-43ed0bf6aeemr106771475e9.11.1744016177517; 
 Mon, 07 Apr 2025 01:56:17 -0700 (PDT)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-43ec3428298sm124599685e9.8.2025.04.07.01.56.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Apr 2025 01:56:17 -0700 (PDT)
Date: Mon, 7 Apr 2025 11:56:13 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: sunliming@linux.dev, dave.stevenson@raspberrypi.com, mcanal@igalia.com,
 kernel-list@raspberrypi.com, maarten.lankhorst@linux.intel.com,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 sunliming <sunliming@kylinos.cn>, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] drm/vc4: fix uninitialized smatch warnings
Message-ID: <e5e557bf-53b9-49ca-9bd7-3dfe85ccbbb8@stanley.mountain>
References: <20250405024503.694981-1-sunliming@linux.dev>
 <20250407-colorful-important-saluki-5e4ac5@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407-colorful-important-saluki-5e4ac5@houat>
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

On Mon, Apr 07, 2025 at 09:13:59AM +0200, Maxime Ripard wrote:
> On Sat, Apr 05, 2025 at 10:45:03AM +0800, sunliming@linux.dev wrote:
> > From: sunliming <sunliming@kylinos.cn>
> > 
> > Fix below smatch warnings:
> > drivers/gpu/drm/vc4/vc4_gem.c:604 vc4_lock_bo_reservations() error: uninitialized symbol 'ret'.
> > 
> > Reported-by: kernel test robot <lkp@intel.com>
> > Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> > Closes: https://lore.kernel.org/r/202504021500.3AM1hKKS-lkp@intel.com/
> > Signed-off-by: sunliming <sunliming@kylinos.cn>
> > ---
> >  drivers/gpu/drm/vc4/vc4_gem.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/vc4/vc4_gem.c b/drivers/gpu/drm/vc4/vc4_gem.c
> > index 8125f87edc60..04ea1696fc5d 100644
> > --- a/drivers/gpu/drm/vc4/vc4_gem.c
> > +++ b/drivers/gpu/drm/vc4/vc4_gem.c
> > @@ -582,7 +582,7 @@ static int
> >  vc4_lock_bo_reservations(struct vc4_exec_info *exec,
> >  			 struct drm_exec *exec_ctx)
> >  {
> > -	int ret;
> > +	int ret = 0;
> >  
> >  	/* Reserve space for our shared (read-only) fence references,
> >  	 * before we commit the CL to the hardware.
> 
> I don't see a code path where ret is used without being initialized. Can
> you clarify that in the commit log?

Apparently the drm_exec_until_all_locked() loop always iterates at least
once.  If you have the cross function database then this is parsed
automatically, but I've also hard coded it as a loop at least once macro
just a 1 minute ago to silence this false positive.s

regards,
dan carpenter


