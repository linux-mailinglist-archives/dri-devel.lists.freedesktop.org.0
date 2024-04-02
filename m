Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4B428959C7
	for <lists+dri-devel@lfdr.de>; Tue,  2 Apr 2024 18:33:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45DEF10FE63;
	Tue,  2 Apr 2024 16:33:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="WvikbeTH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1401110FE63
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Apr 2024 16:33:31 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-513e6777af4so8891513e87.2
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Apr 2024 09:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712075609; x=1712680409; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=8eBAi60q8FF9/ONXl+YI1oi2f67+yFwmO1MPFJZV80Q=;
 b=WvikbeTHTvLlNKYL0Vst1zBYMn5in0/KPyXWJZ7v6gr6+xLgm8tw4Syi4xjPc112W9
 2rV6UefT1Yt+hM7jY2xKiXr8jQ5pmi5XUndPFjBZRg8IytObPlemgSt6z54fqituuUFe
 +JbDMdKH1ynUxs9BDt8tag+sAvaWvG55hzWlJR8PEDROmaNnP2le1SqGodBil5kzCO4K
 YB68KtLdVGKXeL02/QXzoP/1HnycQnRgmsn2terPhx6fv1wpnHx0HI4RQr85KYQnIp66
 iJeMaVNt5Vfey0adDC2vjmGQ21+IE3OlLfFoz4u5Uc6WMjz+fMcWuZZZsoWiWqY3g41Z
 MbJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712075609; x=1712680409;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8eBAi60q8FF9/ONXl+YI1oi2f67+yFwmO1MPFJZV80Q=;
 b=ZrExmMa0oS8C0/OVpdw0X4kZCFyMwZFBc8cnxuTVlP1yTg1hHjDN+ahIHFY5pCYqQH
 fx4xOWnRpKxS80t8k7V2l4dSMAK01vSo9aeeVsDegO3kyr49DzjPlWNgakRmlaudZKdb
 NCvAoSMQj1BOEA7O10Pv010y5+wbIrCW7QMpwIMLqp7PoKDYZyR6VdkreexpKTExESfG
 9Mcqpl122e63dkoieqV8G6+e4USlRHPrTiF/OaHVrZ9JrkU+UDWUPm+sF3gYbaqxHI+s
 HIemIie9USx7WrVJ5yHLs7mSXnusmV0XVxHmtxJPWFJJ/f52PFJ9fwfablrTk3M5xkNz
 eZLA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUoCitMpIbzKAP2veQCAp3UWf2iOW6ZNzp1Iqfe3pFSdH1X3hIBcfi1y46SUfGd9gjN9mnHzMBwp/1Rswit8QmF8U3g9CW01ZVR/GV0rq5R
X-Gm-Message-State: AOJu0YwoO7K4s3TJvTMvMpw9PCpY4nV7tfzrowO3WwgSSvHOpYZGNtZR
 oTaKzgNGhOMdVPPrSxpH80s+hIIJASmG+pyE1TM+EuuSpPElg9AuzqzQSsVF59Y=
X-Google-Smtp-Source: AGHT+IHIX7s2OjCovkzetlaRfayUzrdv/CIw0hPqydZjXFMP92Xd72ZPjcSjswpyJLynuJFUczcOOg==
X-Received: by 2002:a05:6512:3f28:b0:515:a9d5:aab6 with SMTP id
 y40-20020a0565123f2800b00515a9d5aab6mr2176422lfa.18.1712075608669; 
 Tue, 02 Apr 2024 09:33:28 -0700 (PDT)
Received: from localhost ([102.222.70.76]) by smtp.gmail.com with ESMTPSA id
 o16-20020a1709061d5000b00a4e8cf42527sm846771ejh.121.2024.04.02.09.33.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Apr 2024 09:33:28 -0700 (PDT)
Date: Tue, 2 Apr 2024 19:33:24 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Heiko Stuebner <heiko@sntech.de>, Grant Likely <grant.likely@linaro.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org, error27@gmail.com
Subject: Re: [PATCH v3] drm/panthor: Fix couple of NULL vs IS_ERR() bugs
Message-ID: <a7d59aee-f8db-411f-9bad-729baff35c88@moroto.mountain>
References: <20240402141412.1707949-1-harshit.m.mogalapalli@oracle.com>
 <20240402163838.34003a10@collabora.com>
 <91e25b42-c3fa-4b69-ab8c-5d79610e757b@moroto.mountain>
 <20240402171925.41dce3a5@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240402171925.41dce3a5@collabora.com>
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

On Tue, Apr 02, 2024 at 05:19:25PM +0200, Boris Brezillon wrote:
> On Tue, 2 Apr 2024 17:44:18 +0300
> Dan Carpenter <dan.carpenter@linaro.org> wrote:
> 
> > On Tue, Apr 02, 2024 at 04:38:38PM +0200, Boris Brezillon wrote:
> > > On Tue,  2 Apr 2024 07:14:11 -0700
> > > Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com> wrote:
> > >   
> > > > Currently panthor_vm_get_heap_pool() returns both ERR_PTR() and
> > > > NULL(when create is false and if there is no poool attached to the  
> > > 
> > >                                                ^ pool
> > >   
> > > > VM)
> > > > 	- Change the function to return error pointers, when pool is
> > > > 	  NULL return -ENOENT
> > > > 	- Also handle the callers to check for IS_ERR() on failure.
> > > > 
> > > > Fixes: 4bdca1150792 ("drm/panthor: Add the driver frontend block")  
> > > 
> > > I would explain that the code was correct, but the documentation didn't
> > > match the function behavior, otherwise it feels a bit weird to have a
> > > Fixes tag here.  
> > 
> > The code wasn't correct, it returned a mix of error pointers and NULL.
> 
> AFAICT, this is allowed, otherwise why would we have IS_ERR_OR_NULL().

Yep.  I have written a blog about this:
https://staticthinking.wordpress.com/2022/08/01/mixing-error-pointers-and-null/

> The fact smatch can't see through panthor_vm_get_heap_pool() and detect
> that the return value is different for create=false/true doesn't mean
> the code was wrong. I'm certainly not saying this is a good thing to
> have a function that encodes the error case with two different kind of
> return value, but I wouldn't qualify it as a bug either. What's
> incorrect though, is the fact the documentation doesn't match the code.
> 
> > So it needs a Fixes tag.
> 
> I didn't say we should drop the Fixes tag, but the bug being fixed here
> is a mismatch between the doc and the implementation, the code itself
> was correct, and the behavior is actually unchanged with this patch
> applied, it's just done in a less confusing way.

Oh.  Sorry, I haven't been following this thread closely and I misread
the code as well.  You're right that the code works.  In this case, I
would say actually that it does not need a Fixes tag because it's not
a bug.  It's just a cleanup.

Sorry for the noise.

regards,
dan carpenter

