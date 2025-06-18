Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D85AEADF31A
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jun 2025 18:54:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C18610E8E0;
	Wed, 18 Jun 2025 16:54:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="i7Hojr88";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com
 [209.85.167.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7384F10E1F0
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jun 2025 16:54:39 +0000 (UTC)
Received: by mail-oi1-f170.google.com with SMTP id
 5614622812f47-40ab5bd9088so15319b6e.0
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jun 2025 09:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1750265678; x=1750870478; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=OJ2gcooOP07f9omnCEawJUw60wsToiKqAdT6b09wVWg=;
 b=i7Hojr88XX8WmVGK/XRWC2o27v2Nfcis8skt3bq6R8Oanr/7mlu1TrGoGi/auTHWv5
 VGmK/h5uFsm/Wo+z4SuPzi6I2GrZXGY4yFijFVrnFZEFtYJHPPx9GyNe90w1YB+2NV0Y
 0VZDrs2cqDs0p/BycI7wnm5H8e2v6KXWwjXaUYu6fZG/CkzFYk7VYiLy7pDiATFSimTq
 ux4ZdCzELewy7qaysxg+z0TGndUtswcT7CCtd68uEF/cCK27s+mI4IgybYAIQVDUD1SJ
 FMZ9CzxzdQdxcYy6v63RfiBUbZES+xm65ei8kAUFKiFMhZ/TwLafnwO8qWC6je/qC8HH
 AMZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750265678; x=1750870478;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OJ2gcooOP07f9omnCEawJUw60wsToiKqAdT6b09wVWg=;
 b=XlVSLUFn1sh9KDToczpnDZRr1lWZMXZgQ69cxbIQOHt1X4NQBXLbXkWOhDI5MlQkdl
 n5K4d1d5BjzgfSZYFv0rHysBpRCih+dJIeN5xw+HUG0ApdvzFj+yn1NHmgxQ/MQfRXDz
 Ka48cOZT5JlzzfG5B186kJXucK2lnYw3GTDAV4WJmEwj4YZeD5NxN+tcTEIx4Bx6j00L
 X7srRVoOBs+oMw2JjzwsTykGpy7UDQhJHSUEDGRUnGcqMFPj53k1cR3D6wy+jXDTJTkn
 eOT1TwOP0z4Jha/ggzgM7K3uZRm8aYsizDGiUOvx93VwOr1UmXYyXIKusDIS8M0+Co8f
 DxgA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUcXxSVSlv9dMNm7rGj+CZkSqriz6qbR9dKTpMH/+W12ZcbiVAT6Uz6PJceBMJXWBnJQYVanX3veYU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxFU1KI+yv/DpzCeVeXjxle1EvZjC/F8m1NejYrsL18VnhnBGyS
 fvva5k3+Ge5LoNUYBxdB8+FrkPTe3K8sRrMkigchJvhBbi/bJd9bphsVDGeb/ORT6ew=
X-Gm-Gg: ASbGncuWmSyc9nfW1GbCrX3RbHla9RffsXHppOJ40KUrBZOM2C4yHY5myJHQk/FlcDI
 TRGitCEaz1Ug6/MjRct/2HPSFeTuG83CztRYBT6hVhPYOsNFjN1LLVPhB3dw/J+qhczO3tzc7aK
 ibkAWGF/P9ztWalH+TnL57XhWe4E//MNWHYQ2qDYYQ6ZMHvdJ4uReyile4lAHMWDlIiBrBUvrm2
 6+jFSVRBFei3ykG65cHPcAMU3om+2yI53sxGGjUsDGl/79XHmNJ1mZZHiRQDIlX6iXtkOlhglqf
 pqLtS98bDyYDtU0G+7RCTWP5GQTWjjiKjz0vz56jw78yF0rU6xSZymt7fuAeLKmsG7hudg==
X-Google-Smtp-Source: AGHT+IGZt/Sr44zCZuiDpdUzJJJDzC8/TeAfQmItZfKDDSRquAFIHhPkjBQpw4diPA+6hMtv0/zkrA==
X-Received: by 2002:a05:6808:3083:b0:40a:54f8:2cac with SMTP id
 5614622812f47-40a7c196bf8mr13387419b6e.37.1750265678596; 
 Wed, 18 Jun 2025 09:54:38 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:1b3b:c162:aefa:da1b])
 by smtp.gmail.com with ESMTPSA id
 5614622812f47-40a740b2808sm2399744b6e.6.2025.06.18.09.54.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Jun 2025 09:54:37 -0700 (PDT)
Date: Wed, 18 Jun 2025 19:54:36 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Chris Wilson <chris@chris-wilson.co.uk>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Frederic Weisbecker <frederic@kernel.org>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] drm/i915/selftests: Fix error pointer vs NULL in
 __mock_request_alloc()
Message-ID: <419d4155-af68-4264-81df-f882c481534f@suswa.mountain>
References: <aEKvMfJ63V7i-6xU@stanley.mountain>
 <aFAxtBT7z4XphADq@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aFAxtBT7z4XphADq@intel.com>
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

On Mon, Jun 16, 2025 at 11:01:08AM -0400, Rodrigo Vivi wrote:
> On Fri, Jun 06, 2025 at 12:04:49PM +0300, Dan Carpenter wrote:
> > --- a/drivers/gpu/drm/i915/selftests/i915_request.c
> > +++ b/drivers/gpu/drm/i915/selftests/i915_request.c
> > @@ -290,7 +290,12 @@ struct smoketest {
> >  static struct i915_request *
> >  __mock_request_alloc(struct intel_context *ce)
> >  {
> > -	return mock_request(ce, 0);
> > +	struct i915_request *rq;
> > +
> > +	rq = mock_request(ce, 0);
> > +	if (!rq)
> > +		return ERR_PTR(-ENOMEM);
> 
> I believe we should fix mock_request and make it to stop replacing the
> error per NULL, and make the callers to check for IS_ERR instead of is not NULL.
> 
> Then don't need to make up an error here.
> 

Sure, can do.

regards,
dan carpenter

