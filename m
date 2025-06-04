Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B7B2ACE0C6
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jun 2025 16:54:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 868E810E07D;
	Wed,  4 Jun 2025 14:54:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="TvVOBx2N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E4FA10E07D
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Jun 2025 14:54:47 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-442ea341570so49346325e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Jun 2025 07:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1749048886; x=1749653686; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Tdv6Fi59T9iqwRoeTP31kVO0+FdiS7SFPAkxgfgd9hI=;
 b=TvVOBx2NIVbxW6Tnv+orPUOe3a7sbd5oUUi0U+Yx5r0IL4lQa61IvoC8I+H7wToKJZ
 oO0hvsuAYxgk3Tso+IfspUAJjQPah+9dWgmfs2Q85N08N/rjy6mqezanyUJbo6Elg6qW
 mnqyzvlVBcfTYEnYAX/6XtqTOjckmEajWpm3k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749048886; x=1749653686;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Tdv6Fi59T9iqwRoeTP31kVO0+FdiS7SFPAkxgfgd9hI=;
 b=huYMDf6uVuCIwywoCoTPGhOtrZPwjAr50cR3STCFdZlGMu5WOqGJFhCGFDdLc07PQ/
 Il00nWfhvffF9l9wOVuIyGPOvMcKCtvEGiLKcbE2ZjeM7XDE6bksknftYdhB6Moam+wY
 mDMBM6GZFqj0WOEexDRTnqnOFUdOZl21POU15tujduEhi76DRRn2K0XWNDj8Y0MIfYim
 TAllIN6vA2gLZcBon9g+qvG+h2VQD7ceeyNgJNGA2MheKvxZqnsayJvCpp8BqALKYKzv
 5GcRoeirVL378MwC0EgiESQpfKs2vnaN1Mq+t73eQDiGx6mL1h0EqbBzhg78C1mpZWb3
 P3wg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWRaVokk5/c4uZbwkaWX69WkFGIVtCsUhpmglYdMfRq8+4aiAV/NRPLC0VQr5IGhAV9BIHBEzb2/GI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxjlnDLCvYvDaJVEVH5PWUb3CNiMCAPGnBp0hfHhUREuFZmGAFe
 TPco6w163Yf7R7TgOvtZOAWHnqGfzDvAjBm8nCRvlt3RvvBvc6lclERQBUX4dPo7GP0=
X-Gm-Gg: ASbGncsA7S/YJdjqKYWsChxkUY233wgzuH01Vp0dApDsmu7SyWLS/pKm04NALkKvguB
 fW0RPcmOF/Wo+5BLfBfTDzT/qQeYui7JWB3+I1iOToFD62kwRyORljTzi7J+ZKBtfMLf+02/AdL
 KM10bZ085AtfLvBeVr6PQa1ed9D9jckk8hOZXErman3v0mrLzuyCoeMPfQZ18JE7JbbfFVz7wtL
 9/+sO+9QXLpBhs1J+qKcHhNjtLLsk+IBkgoYQTYcZZSeJWsVVs3NOo81xMyn5C0U1VSF62zSJO9
 JAiIy2ZsH1LOjrpKkHc2FG5pu+ofDLo86Fjrsh/dvgYbe2mlMaboQj7MupD/qPA=
X-Google-Smtp-Source: AGHT+IHLaPWNEw+aHsZjBlSgJC+s4+YxFWBu1S0hmI+wTByKY7MvL82hzwIhAvnsOgiOUFtFVeOI6Q==
X-Received: by 2002:a05:600c:3106:b0:441:b3eb:570a with SMTP id
 5b1f17b1804b1-451f0a6a94bmr29895765e9.2.1749048885659; 
 Wed, 04 Jun 2025 07:54:45 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-450d7f90c40sm204727155e9.2.2025.06.04.07.54.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Jun 2025 07:54:45 -0700 (PDT)
Date: Wed, 4 Jun 2025 16:54:43 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Matthew Brost <matthew.brost@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [bug report] drm/xe/svm: Implement prefetch support for SVM ranges
Message-ID: <aEBeM1sWuSNWNij6@phenom.ffwll.local>
References: <aDSDfusiM8QGQwFS@stanley.mountain>
 <0183ca8d-4347-48d9-a783-361c6543db14@intel.com>
 <20250603222952.GD407166@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250603222952.GD407166@ziepe.ca>
X-Operating-System: Linux phenom 6.12.25-amd64 
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

On Tue, Jun 03, 2025 at 07:29:52PM -0300, Jason Gunthorpe wrote:
> On Mon, May 26, 2025 at 10:15:17PM +0530, Ghimiray, Himal Prasad wrote:
> > 
> > 
> > On 26-05-2025 20:36, Dan Carpenter wrote:
> > > Hello Himal Prasad Ghimiray,
> > > 
> > > Commit 09ba0a8f06cd ("drm/xe/svm: Implement prefetch support for SVM
> > > ranges") from May 13, 2025 (linux-next), leads to the following
> > > Smatch static checker warning:
> > > 
> > > 	drivers/gpu/drm/xe/xe_vm.c:2922 prefetch_ranges()
> > > 	warn: passing positive error code 's32min-(-96),(-94)-(-15),(-13)-(-12),(-10)-(-2),1' to 'ERR_PTR'
> > 
> > Hi Dan,
> > 
> > Thanks for pointing this out. I see there's a gap in how hmm_range_fault()
> > adheres to its documented behavior. I believe the function should sanitize
> > positive return values from walk_page_range() to ensure consistency.
> > 
> > Jason can comment further on same.
> 
> Yeah, I don't think it should return positive error code, whatever is
> doing that should be fixed. Can you send a patch?

Not sure that's what's going on, from the comment and reading the code
(albeit non-exhaustively) I think you can only get positive error return
values from walk_page_range if the ops you provide do so. The hmm ones
don't, so I think this should be ok without any code changes?

Maybe a WARN_ON and patching that up for paranoia, but I don't see how
this can happen.

Cheers, Sima
-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
