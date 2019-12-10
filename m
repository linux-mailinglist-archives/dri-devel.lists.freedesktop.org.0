Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EAE61184FE
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2019 11:26:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F1DF6E03D;
	Tue, 10 Dec 2019 10:26:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAB626E03D
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2019 10:26:38 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id b6so19414066wrq.0
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2019 02:26:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=97xF32EIBIFJNHB3mGMcUkFGhGxvatxTdrICNm/qrcc=;
 b=f41oTppPt+Wg3AOVTt+B2xwxkAwtU0Z+3cEx9m09thFrxJTFSHKou4Mh3JfEbLY7ty
 zxWTSZnBiLVa9g6ck5xV0ClbF0FLM57+E9BTltMupGvFAeE3tVK8M61Asm4hSx+BuEyA
 AzI2bZzTZkDyZdPJR2HxPfMJsakbSeRZcXkDg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=97xF32EIBIFJNHB3mGMcUkFGhGxvatxTdrICNm/qrcc=;
 b=UizXLkXQk8RNQdNyUsVOPAegJ0oHD7notfkCxTwdUT4Vtx6Iv8PNJvkHCYsXo0KYqz
 7aPGmMn1JjT2dbQw5NBDtpClONyrE6s6uP3XTFbvjAv8lcp+DcVj5OXkEPBXPD6psI4H
 wcsuP6+RDHTnfseLW2SvehJoDrwblAENmztMMc9i5cwApG8XYQlnrRzpzHSmKi4dQsiW
 buZM47kf2XP6gGs5yvU1zIMANi4ZCCJ+ut511GEJwrjmSWLW5Lz+osDeqB5DD2dpt2f4
 21SShDeiqnVPkdSg0b6GV+XYI6QAQhTfuqOJHV9HDkD5BJFF7l4zGxxFJoQ5sx4rlPsN
 e9kw==
X-Gm-Message-State: APjAAAV2cD/nZ5Umzq6KUtzPICzLWg2md5qrDmUCFeaA9qrNUleBYDvt
 I8YosXm72+picaHmkNyLJEUHIg==
X-Google-Smtp-Source: APXvYqyisjRA8OXYGasr47OpUHsgLNSuGGT4qkK6eh9dxEHb8YE7Cub1BSpya6wB8Hb82X3rE8xaZA==
X-Received: by 2002:adf:e609:: with SMTP id p9mr2220769wrm.397.1575973597557; 
 Tue, 10 Dec 2019 02:26:37 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:564b:0:7567:bb67:3d7f:f863])
 by smtp.gmail.com with ESMTPSA id m3sm2748694wrs.53.2019.12.10.02.26.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Dec 2019 02:26:36 -0800 (PST)
Date: Tue, 10 Dec 2019 11:26:34 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Match on dma_buf|fence|resv anywhere
Message-ID: <20191210102634.GR624164@phenom.ffwll.local>
References: <20191204215105.874074-1-daniel.vetter@ffwll.ch>
 <20191205155111.GA1914185@ulmo>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191205155111.GA1914185@ulmo>
X-Operating-System: Linux phenom 5.3.0-2-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 linaro-mm-sig@lists.linaro.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Daniel Vetter <daniel.vetter@intel.com>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 05, 2019 at 04:51:11PM +0100, Thierry Reding wrote:
> On Wed, Dec 04, 2019 at 10:51:05PM +0100, Daniel Vetter wrote:
> > I've spent a bit too much time reviewing all kinds of users all over
> > the kernel for this buffer sharing infrastructure. And some of it is
> > at least questionable.
> > 
> > Make sure we at least see when this stuff flies by.
> > 
> > Acked-by: Dave Airlie <airlied@gmail.com>
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > Cc: Sumit Semwal <sumit.semwal@linaro.org>
> > Cc: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
> > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Cc: Rob Herring <robh@kernel.org>
> > Cc: linux-media@vger.kernel.org
> > Cc: linaro-mm-sig@lists.linaro.org
> > ---
> >  MAINTAINERS | 1 +
> >  1 file changed, 1 insertion(+)
> 
> Acked-by: Thierry Reding <treding@nvidia.com>

Pushed to drm-misc-fixes.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
