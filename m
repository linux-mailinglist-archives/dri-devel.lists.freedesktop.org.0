Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84124AD8FA3
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jun 2025 16:35:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9AB810E9E9;
	Fri, 13 Jun 2025 14:35:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="TJVZVDy0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE02710E9E9
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jun 2025 14:35:17 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-3a50fc819f2so1843782f8f.2
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jun 2025 07:35:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1749825316; x=1750430116; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=oBo92Aqrei78EThbx4+bzTmqujk9FnHPDCLbgpY3H44=;
 b=TJVZVDy0xpTzRinWrwWKM+X0KTSbzmXFyltBJNFiMY+8r5ZctTZNdHr7SnLKDxKE5j
 lhlQZg0vVq/TLiNpB9sJ3Y8rz5v3UWcGQezHKpJQQKey3J+9ZDTC7s0Xiwaa+KGzx3hm
 5mdP/XvmAhdvmhG+X5kbHyLW7DcBJdc2v4ogE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749825316; x=1750430116;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oBo92Aqrei78EThbx4+bzTmqujk9FnHPDCLbgpY3H44=;
 b=S1CzX8X13tFp4IVqoaVR8HRJCxgHZI0DVZG92R6P9wMiqiV/4Ueg7OO6pFtBFzN314
 oacz48XDnAFZgFs7h/TFTEsCVYz5PLPgL6+zh7ShRgCI+8qXu85XEVGWsnlVilyJo250
 t6CIRf8e/Pnw3b0FkwQPLO2iuc3YxRrALYQNPQwWdEUWV5uCFMYT5Aw25TCDqXGLB1Z1
 jtw1lF+BrWjNIzB4hMSiwnHlj3bUYyWG4FCnmx1npMbqLxqKmKDMm+tGsc934tcyySMf
 vN/9e3HHv7zuHKdWpt/mFaV7VxsStgnfXuW3nMeqr4jsZmi8vGlFYKH+DoT7kOH3grRZ
 Qbrw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVnlhzPz2i+EC4yqbztOF63IC9wfoShyYgYtTVl5hxXpQrnOBflPlLE0HZQO/WV5M8JaAI4Trn2aNs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyWkxDkpeB+zN9AlT5AmLErbWBx9tkrl6CwlXVMlu7p3U+PEchX
 nKOhZD9Kp9opotiGkhvrhsZ1wH2IySkTBNra8Hk0+hrtEnmWZkrkD+R1g2dHQn34TnA=
X-Gm-Gg: ASbGncvQ5SeZpKtZEDSS6tkdKL1tgDtjlOfu4hzdnVfoOqgSi+hYppEWQKyIe/4/Zkk
 WpeAF3FYd7G05nXOiKzUEt/hoMnR1wiWXkiZ2ps48HzXBdu6EHPxnTLxP06o3s+Id+k280mayyq
 oC4shTsLz1N0KN4OozZfOwwjddp26pOhLITTHOL7dbcZ+uype8Fi0IhLDhQCvI3bVn8lCqAguaZ
 p+WFSXlor6dQrVac6AotxopvDhZoBlTGtRyaTMsv8wQ9OEDHwXcOF4DrQ0NpwqwN/VClB92FgFn
 mCz5SZDB3P0LaK0gq3Xi3ewtm/nJuOuMRjO6Hb2Ny3lEGg7NEScAFpUdCCuw57HN+LPC0dRnHy6
 G9ZcJwbZE
X-Google-Smtp-Source: AGHT+IGQGmU7scGz0wcbMunRp5Cac/Rurt7S5WDZxdpU+FAiiHirPT9dNtY3E0wni7dbZUyQSooOAg==
X-Received: by 2002:a05:6000:240c:b0:3a5:2fae:1348 with SMTP id
 ffacd0b85a97d-3a568747db8mr3076957f8f.51.1749825315613; 
 Fri, 13 Jun 2025 07:35:15 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4532e1838e4sm55172075e9.40.2025.06.13.07.35.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jun 2025 07:35:15 -0700 (PDT)
Date: Fri, 13 Jun 2025 16:35:13 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: Simona Vetter <simona.vetter@ffwll.ch>, jani.saarinen@intel.com,
 jani.nikula@linux.intel.com, tursulin@ursulin.net,
 tzimmermann@suse.de, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/prime: fix drm_prime_add_buf_handle
Message-ID: <aEw3IRn565keDO6B@phenom.ffwll.local>
References: <20250613131201.2141-1-christian.koenig@amd.com>
 <20250613131201.2141-2-christian.koenig@amd.com>
 <aEwv_sV3V6p8dmkP@phenom.ffwll.local>
 <238ce166-2dd5-4599-865b-1c263f01a465@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <238ce166-2dd5-4599-865b-1c263f01a465@amd.com>
X-Operating-System: Linux phenom 6.12.30-amd64 
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

On Fri, Jun 13, 2025 at 04:12:47PM +0200, Christian König wrote:
> On 6/13/25 16:04, Simona Vetter wrote:
> > On Fri, Jun 13, 2025 at 03:12:01PM +0200, Christian König wrote:
> >> It is possible through flink or IOCTLs like MODE_GETFB2 to create
> >> multiple handles for the same underlying GEM object.
> >>
> >> But in prime we explicitely don't want to have multiple handles for the
> >> same DMA-buf. So just ignore it if a DMA-buf is exported with another
> >> handle.
> >>
> >> This was made obvious by removing the extra check in
> >> drm_gem_prime_handle_to_dmabuf() to not add the handle if we could already
> >> find it in the housekeeping structures.
> >>
> >> Signed-off-by: Christian König <christian.koenig@amd.com>
> >> ---
> >>  drivers/gpu/drm/drm_prime.c | 11 +++++++++++
> >>  1 file changed, 11 insertions(+)
> >>
> >> diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
> >> index 1d93b44c00c4..f5f30d947b61 100644
> >> --- a/drivers/gpu/drm/drm_prime.c
> >> +++ b/drivers/gpu/drm/drm_prime.c
> >> @@ -113,6 +113,17 @@ static int drm_prime_add_buf_handle(struct drm_prime_file_private *prime_fpriv,
> >>  
> >>  		rb = *p;
> >>  		pos = rb_entry(rb, struct drm_prime_member, dmabuf_rb);
> >> +
> >> +		/*
> >> +		 * Just ignore the new handle if we already have an handle for
> >> +		 * this DMA-buf.
> >> +		 */
> >> +		if (dma_buf == pos->dma_buf) {
> >> +			dma_buf_put(dma_buf);
> >> +			kfree(member);
> >> +			return 0;
> > 
> > This feels a bit brittle, because this case should only be possible when
> > called from drm_gem_prime_handle_to_dmabuf and not from
> > drm_gem_prime_fd_to_handle() (where it would indicate a real race and
> > hence bug in our code).
> > 
> > I think  drm_gem_prime_fd_to_handle() should WARN_ON if it hits this case. 
> > 
> > Otherwise yes this is the functional change that I've missed :-/ Note that
> > there's no race in the original code, because it's all protected by the
> > file_priv->prime.lock. Which means I think you're claim that you've only
> > widened the race with your patch is wrong.
> 
> Yeah, agree. I'm always confused that there are two locks to protect the data structures.
> 
> But there is indeed a problem in the existing code. What happens if a
> GEM handle duplicate is exported with drm_prime_add_buf_handle()? E.g.
> something created by GETFB2? 

The uniqueness guarantee only extends to FB2HANDLE, because that's the
case userspace cannot figure out any other way. For flink import you can
compare the flink name (those are global), and for other ioctl like
GETFB(2) you just always get a new name that you need to close() yourself.

I guess if you want a unique name for these others you could do a
rount-trip through a dma-buf :-P

But the reaons dma-buf import was special was that before we had a real
inode or the KMP syscall there was just no way to compare dma-buf for
identity, and so we needed a special guarantee. Probably the funniest
piece of uapi we have :-/

> IIRC AMD once had a test case which exercised exactly that. I'm not 100%
> sure what would happen here, but it looks not correct to me.

Yeah I think the real-world GETFB are only for when you know it's not one
of your own buffers, so all fine. Or we haven't tested this stuff enough
yet ... Either way, userpace can fix it with a round-trip through
FD2HANDLE.

Cheers, Sima

> 
> Regards,
> Christian.
> 
> > 
> > Cheers, Sima
> > 
> >> +
> >> +		}
> >>  		if (dma_buf > pos->dma_buf)
> >>  			p = &rb->rb_right;
> >>  		else
> >> -- 
> >> 2.34.1
> >>
> > 
> 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
