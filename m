Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D5B887BAC5
	for <lists+dri-devel@lfdr.de>; Thu, 14 Mar 2024 10:54:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FAC310F47C;
	Thu, 14 Mar 2024 09:53:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="UvlSP4/F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3ED4E10F47C
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Mar 2024 09:53:58 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-33ecb04e018so49697f8f.1
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Mar 2024 02:53:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710410036; x=1711014836; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ro4Imx7CWEZLX3AK8r2FNrfVWmfUpKd6vZ6AbyKyoK8=;
 b=UvlSP4/Fls5ZxmZCRB6a8769Df11v/xAhHFt5ddCNW3me4rDLzpRdeDkJmQuVKpJk1
 XQmHpOvZyjbT7J1YDgqSWxcMulJPrtnq5eSsri3U9qBWXwgC9XqLU4NOgxtBHCOJDQOF
 0ZDr4WtK0rLN9yEjZAtNpIVUI4Monkr6FUzFE8OwLjgJVz2pW4uG9vkKtqhFA9aebfGY
 IeaYZbUNrnv7h1Q7/0SyjfiKjKXpZnSgU8DiQYK1KIurNcVg8/q/kftLU6VLGIjQNNMx
 l5RJJUP4lS5T3+0PHLgBYLrt4kl7+virnIJHmyCbjVek/XN4tsZPXSNcEgWrYg2BS+1x
 XMJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710410036; x=1711014836;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ro4Imx7CWEZLX3AK8r2FNrfVWmfUpKd6vZ6AbyKyoK8=;
 b=NCjsF409Db8NrY4SWMOHyMN+/CyPSHy83qJWd9yfFC3SDQ0nGLjPOr7YOW2zq27kQg
 2VNiqMZ3CE9Fa68dGsT3Io0qPsJQRXLdwUFLnnyHCdoVKPwk2meV9sUIjfv4T+j+juC0
 dK51rPTOwFvMug8c4X+TFdyJuk5Dkje+lvP1V3kaZqpp53hr3/Y6ZPaslnaI9PfCq4NB
 8dmDJ7dbY3VfxNlf95WeNa7CAz/Z7LZLUgLvrn++VPIKlFTIErABZZFMxc4OLczpSza8
 A1xRVRV5Jke08sS2fzWU0ChujiHMD74/owlD9mPcGgSzx4MYO76WJJQEU5/4laSTdQEL
 F4sw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVSsget1VH8NCko79tFsDR3nKEHDhzfy1UwfNXR3KqOZI3bvgxdSiq5b6dypCPMJzIn8Xz1T1+GfSjq5hE46eVSeJMWXifzNmUqZF+Y/sV9
X-Gm-Message-State: AOJu0YzVt4bV8MJpHPSJelnTk5nDsLjdfEJyHnlUEhmM+OsnfEJitQht
 9gHu24Y3LbxocoVSgPiHzaqtAXm6dCLEWFMkaqlq5AyO6n51DYtqbYdNoKyFoC4=
X-Google-Smtp-Source: AGHT+IFfVOj3Qr+ozdglLc5ukbVAJ7wK9H9tgRhtsfi5cNpUPOjNIC73zdH1T1xqVqvsxyWWZ8WGAA==
X-Received: by 2002:a5d:46c3:0:b0:33e:c070:686c with SMTP id
 g3-20020a5d46c3000000b0033ec070686cmr839550wrs.45.1710410036059; 
 Thu, 14 Mar 2024 02:53:56 -0700 (PDT)
Received: from localhost ([102.222.70.76]) by smtp.gmail.com with ESMTPSA id
 x11-20020a5d60cb000000b0033eca2cee1asm349346wrt.92.2024.03.14.02.53.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Mar 2024 02:53:55 -0700 (PDT)
Date: Thu, 14 Mar 2024 12:53:52 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Sam Ravnborg <sam@ravnborg.org>, lee@kernel.org,
 daniel.thompson@linaro.org, jingoohan1@gmail.com, deller@gmx.de,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev
Subject: Re: [PATCH 3/6] backlight/omap1-bl: Replace FB_BLANK_ states with
 simple on/off
Message-ID: <f3e2f6ed-d915-4b32-aba8-9e9cfe9c0b3f@moroto.mountain>
References: <20240313154857.12949-1-tzimmermann@suse.de>
 <20240313154857.12949-4-tzimmermann@suse.de>
 <20240313180027.GB96726@ravnborg.org>
 <bf7b7e88-a7b4-427d-b38c-d3c9cc568aaf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bf7b7e88-a7b4-427d-b38c-d3c9cc568aaf@suse.de>
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

On Thu, Mar 14, 2024 at 09:16:15AM +0100, Thomas Zimmermann wrote:
> Hi
> 
> Am 13.03.24 um 19:00 schrieb Sam Ravnborg:
> > Hi Thomas,
> > 
> > On Wed, Mar 13, 2024 at 04:45:02PM +0100, Thomas Zimmermann wrote:
> > > The backlight is on for fb_blank eq FB_BLANK_UNBLANK, or off for
> > > any other value in fb_blank. But the field fb_blank in struct
> > > backlight_properties is deprecated and should not be used any
> > > longer.
> > > 
> > > Replace the test for fb_blank in omap's backlight code with a
> > > simple boolean parameter and push the test into the update_status
> > > helper. Instead of reading fb_blank directly, decode the backlight
> > > device's status with backlight_is_blank().
> > > 
> > > Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> > My biased opinion is that the approach in this patch is a little bit
> > better:
> > https://lore.kernel.org/lkml/20230107-sam-video-backlight-drop-fb_blank-v1-13-1bd9bafb351f@ravnborg.org/
> > 
> > I never came around resending this series it seems.
> 
> Oh, that series has been around for over a year. I don't care about which
> patches go in as long as they remove the dependency on <linux/fb.h>. I saw
> that Dan has already r-b'ed the current patchset, but if you prefer I'll
> adopt yours.

I hadn't seen Sam's patch.  It's a little bit more daring, but it's
really nice code and I trust him.

regards,
dan carpenter

