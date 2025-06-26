Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D57B8AEA805
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jun 2025 22:11:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15F8110E2EA;
	Thu, 26 Jun 2025 20:11:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="f69IWaWH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com
 [209.85.160.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C24310E91E
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jun 2025 20:11:43 +0000 (UTC)
Received: by mail-oa1-f43.google.com with SMTP id
 586e51a60fabf-2d09d495c6cso396477fac.3
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jun 2025 13:11:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1750968702; x=1751573502; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=DdbUq5FWdJghT4h/JjubAGfMLvpsjI7mA2zXcnSbP4g=;
 b=f69IWaWH8t0V6Ohwa9XIeYv54tuiMy27J03vUMQTo5dyoWa0YYRs+yRpL/SYaets3t
 HBPhPqu95v1hrk39q3/u645JyFrMBPajBPxfKVuva5W4pJ+2Vu9hEmR7lN7VgyU4MGHk
 KPrAO9QD70akhWBeh5XNJAICFzAvCBrX3Mz7YHarSHVbYe4TpFNusez5xlBxF55qyy/t
 mizgb+vLf+kxiJr0FQoBFOo0BTYTrtK3o4I/fk6hAyslnZeNkxLCqHrD1+ldOPGwJShz
 fnVX1/ogP1L9H7LBOgc8q6fqLVT8fPhm6SEiy6PVTR6pSoekXh4cTSOOmLwleqo/qYvb
 Rwig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750968702; x=1751573502;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DdbUq5FWdJghT4h/JjubAGfMLvpsjI7mA2zXcnSbP4g=;
 b=tanqlkehpDOExJg/3rc+mBFlAevFK00WtaGo3QnPE8eO6BrHtc2wq/5GVLWrLeVWp1
 rdbgpt5E64TtViS7x2O6/p0GKaZ5gDF/FYNlq6BZeNempesgWsOTTsT/l+2kFKTLESoi
 Dd6VHV1oKYs8LJ1yEwxaOHIRpfo6pLmDYyFOLIGbJIeG19/uXNcXiB9w5Ugw6TiLlAwJ
 VlgsIMxCya1LfMpKNcFgxxHcUsy4/fjJzNKAbjJYlOdPe/Lylq4Se/wcECtJpky9/0/y
 qJyqoJaa0fEP5MMTNkbgK8NJL1WtthZMCTFvpRBq7dDlch9nNveOO3I3q5e85s9QmK2r
 SNFA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXU70sMQmg0Se+vQK71zWs3cDaO9TWhFt9Cpn+ADnc6ajlXAOYfPU07Ys0jfpBb3SY8xnQVndcjzq0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwTl5SFLhA850jAYPP8gXAhRLhTQVk+5RZGccsotz8uHfWGqO/W
 ebmO5rBjZt7uGh1oIvjLQ6Yyuetth9e3VfwAg3z0uKUi949WlIwpAkV6mGK0TEHoqpk=
X-Gm-Gg: ASbGnctmEJEhz//BTLL3f4W5bQYmRt/PPnZSl6CbHTagbNeGGb4y5A9U8L4HY0UASF2
 /LHGfGCimFGPDNdVslk55ObF28h1uBdVsSbZYZsoWzk8isFFLEYTrkqbCvnqQdI2803Wg6/YuzN
 s7Agyc+8qUMo3c8tsErYTHKyiNM45gppx2tkJbWeZx4CE8IhHIoB8EN40546WB1mXkcD/aMcJk7
 4I8yyYjhL/H3JPiqtyfbidyzvIJ9i4taqt7KgK1xZOgdSRfv/SXhPpn+dLj9IUI+MhzFcdOLXcJ
 SRfEb28AgG2mY38UsfYBg/Il8taQDnxoc8R7idnGIFOqFE2rlg5QdCxYi90jYeCXKXNa
X-Google-Smtp-Source: AGHT+IFg2nQff2Lhmdlw/pyysFVbUjX9x2OsHwDegwLfzTwSuU9M/XoGhqdFda6acuF09hZL3XGMBg==
X-Received: by 2002:a05:6870:6193:b0:2d4:c4d8:a4d0 with SMTP id
 586e51a60fabf-2efed79348fmr230128fac.33.1750968702141; 
 Thu, 26 Jun 2025 13:11:42 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:154:5a01:d5a1:16d6])
 by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-2efd50fa38asm513196fac.40.2025.06.26.13.11.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jun 2025 13:11:41 -0700 (PDT)
Date: Thu, 26 Jun 2025 23:11:39 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Abdun Nihaal <abdun.nihaal@gmail.com>, andy@kernel.org,
 gregkh@linuxfoundation.org, lorenzo.stoakes@oracle.com,
 tzimmermann@suse.de, riyandhiman14@gmail.com, willy@infradead.org,
 notro@tronnes.org, thomas.petazzoni@free-electrons.com,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: fbtft: fix potential memory leak in
 fbtft_framebuffer_alloc()
Message-ID: <0327da98-8a7c-4db8-8bcd-4179b87a9486@suswa.mountain>
References: <20250626172412.18355-1-abdun.nihaal@gmail.com>
 <aF2Ic8BP0zWS6R19@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aF2Ic8BP0zWS6R19@smile.fi.intel.com>
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

On Thu, Jun 26, 2025 at 08:50:43PM +0300, Andy Shevchenko wrote:
> On Thu, Jun 26, 2025 at 10:54:10PM +0530, Abdun Nihaal wrote:
> > In the error paths after fb_info structure is successfully allocated,
> > the memory allocated in fb_deferred_io_init() for info->pagerefs is not
> > freed. Fix that by adding the cleanup function on the error path.
> 
> Thanks for the report and the fix! My comments below.
> 
> ...
> 
> >  release_framebuf:
> > +	fb_deferred_io_cleanup(info);
> >  	framebuffer_release(info);
> 
> While the fix sounds good, there are still problems in the driver in this area:
> 
> 1) managed resources allocation is mixed up with plain allocations
> (as you discovery hints);
> 
> 2) the order in fbtft_framebuffer_release() is asymmetrical to what
> we have in fbtft_framebuffer_alloc().
> 
> I would recommend to study this code a bit more and provide the following
> patches as a result:
> 
> 1) fixing the order in fbtft_framebuffer_release();
> 
> 2) moving vmem allocation closer to when it's needed, i.e. just after
> successful allocation of the info; at the same time move txbuf allocation
> from managed to unmanaged (drop devm, add respective kfree() calls where
> it's required);
> 


Symetrical in this sense means that the cleanup in
fbtft_framebuffer_release() and in fbtft_framebuffer_alloc() are
similar:

	fb_deferred_io_cleanup();
	vfree();
 	framebuffer_release();

I feel like number 1 and 2 are sort of opposite approaches to making the
order symmetrical.  #1 is changing fbtft_framebuffer_release() and #2 is
changing fbtft_framebuffer_alloc().  #2 is the less awkward approach.

> 3) this patch.
> 
> All three should have the respective Fixes tags and hence may be backported.

Changing the order isn't a bug fix so it wouldn't get a Fixes tag.
I agree with Andy that the code isn't beautiful.  But I think it's
easier to just fix the bug, and do the cleanup later as an optional
patch 2/2.  I would also have been fine with a larger patch that does
the cleanup and the bug fix in one patch but I think other people
won't like that.

Diff below.  Except, oops, this doesn't compile.  Change the other
goto alloc_fail places to "return NULL;"  I guess that means you
get authorship credit if you fix that.

So if you want you could resend your patch and you could send these
changes I've suggested as a patch 2/2 and then I think everyone will
be happy.

regards,
dan carpenter

diff --git a/drivers/staging/fbtft/fbtft-core.c b/drivers/staging/fbtft/fbtft-core.c
index da9c64152a60..abfd7b1157df 100644
--- a/drivers/staging/fbtft/fbtft-core.c
+++ b/drivers/staging/fbtft/fbtft-core.c
@@ -568,11 +568,6 @@ struct fb_info *fbtft_framebuffer_alloc(struct fbtft_display *display,
 		height = display->height;
 	}
 
-	vmem_size = display->width * display->height * bpp / 8;
-	vmem = vzalloc(vmem_size);
-	if (!vmem)
-		goto alloc_fail;
-
 	fbdefio = devm_kzalloc(dev, sizeof(struct fb_deferred_io), GFP_KERNEL);
 	if (!fbdefio)
 		goto alloc_fail;
@@ -595,6 +590,11 @@ struct fb_info *fbtft_framebuffer_alloc(struct fbtft_display *display,
 	if (!info)
 		goto alloc_fail;
 
+	vmem_size = display->width * display->height * bpp / 8;
+	vmem = vzalloc(vmem_size);
+	if (!vmem)
+		goto release_framebuf;
+
 	info->screen_buffer = vmem;
 	info->fbops = &fbtft_ops;
 	info->fbdefio = fbdefio;
@@ -652,7 +652,7 @@ struct fb_info *fbtft_framebuffer_alloc(struct fbtft_display *display,
 	if (par->gamma.curves && gamma) {
 		if (fbtft_gamma_parse_str(par, par->gamma.curves, gamma,
 					  strlen(gamma)))
-			goto release_framebuf;
+			goto cleanup_deferred;
 	}
 
 	/* Transmit buffer */
@@ -669,7 +669,7 @@ struct fb_info *fbtft_framebuffer_alloc(struct fbtft_display *display,
 	if (txbuflen > 0) {
 		txbuf = devm_kzalloc(par->info->device, txbuflen, GFP_KERNEL);
 		if (!txbuf)
-			goto release_framebuf;
+			goto cleanup_deferred;
 		par->txbuf.buf = txbuf;
 		par->txbuf.len = txbuflen;
 	}
@@ -691,12 +691,12 @@ struct fb_info *fbtft_framebuffer_alloc(struct fbtft_display *display,
 
 	return info;
 
+cleanup_deferred:
+	fb_deferred_io_cleanup(info);
+	vfree(info->screen_buffer);
 release_framebuf:
 	framebuffer_release(info);
 
-alloc_fail:
-	vfree(vmem);
-
 	return NULL;
 }
 EXPORT_SYMBOL(fbtft_framebuffer_alloc);

