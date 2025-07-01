Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42B84AEFBDA
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jul 2025 16:16:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0738D10E26C;
	Tue,  1 Jul 2025 14:16:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="zz1GX+V7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com
 [209.85.167.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD59110E26C
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Jul 2025 14:16:10 +0000 (UTC)
Received: by mail-oi1-f172.google.com with SMTP id
 5614622812f47-40669fd81b5so1948055b6e.1
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Jul 2025 07:16:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751379370; x=1751984170; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=utdJ6ug4uyT7Q8sLa8Hgrk9nBo0BM3sC5TV3oXvqsBA=;
 b=zz1GX+V7BCXw7OYIlepCyiDCeF04jcuxg/Ad+LqgZJaTW0NHOpobAZUObRgCpyW3e3
 P5GNwIr3u+NbqICc5OGWLsXuLeUry3XkSa+zRWmErCZv31nJ4Xsh3M2OGV1Mv6oSgoTT
 s9SIfZ/jE2SiLi4JcUhq1FjyrtU1HtlOapHdQz9HAHvr/iUygg/LExmC37PGNSqMw3Ql
 bMwIOTDxxlRDgyu6m9drRyJojAkppBDMLuZ1421QbQLzxBimHBN8C5zMX8QWJdb6If2M
 87XwYU/WHWRii4amw+a8f6s5TSTgoKd0Pa8CB1P7oeBfde4pzjLrYZeMrPIbjfakZU7P
 fCFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751379370; x=1751984170;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=utdJ6ug4uyT7Q8sLa8Hgrk9nBo0BM3sC5TV3oXvqsBA=;
 b=nxsWWojHkqDW7Qhjmeiu0ytx3dLbQLl7MFSXFqLQI4KZbCOdnZNeYrES1NrbW769h0
 D31l+sijdrUA2AKKG7s6Viua5uZyEsPIStfFqJY+IHkiBTgKVYfOZlbS/sEbr0CYLMfK
 QEACqyYu1onDe3xBhes+/EYIk+WLHtLpZH9TxVuYQJtN/2UNrPo0TAubyWnoPkmzcqjH
 xjCIbUGGBO6YWojuKVuAkYRwVA6wLCrcwFc8WG8//CZbMnFB9Gm06O/xfl1nY5Zw7Ajf
 91x9dTEbUnbzaGRk93Ml4qNYb21iXHRNMbSG+WX3U5U3d89xEEEZLl/kZajv3A195FKI
 03Eg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW4eo2vJGiwpKjhjYW92l6gdLdicyUGs0fTmZemv/R1GVvISshJhzccvS+YvEjqOBkCqFXYrcDZhFw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx+aaQm5FbQVm6MI0InaL7L5jcn3dR4NtvnKhIvO2D1yuWlCppB
 0qsqwResrmUwqNQxdsbXozmpcim3w5TOlxbWQVGmiyl2mGQ4V13cpE+g9LOkpWaLQ6s=
X-Gm-Gg: ASbGncvKgtt6aiG21tjfs6wOHzgeu/bMyDGpy7C97xziHse+csX9P9oEvsRjZIp5nNZ
 WbaVCK/Zd9jS3RswoCulG3afkBDEZioPZ/0amAI8l5tFmGryqPKs8Xki0eqTLjKZ6jtiY+4dZYa
 6CDTGszyAR0LnGS1gkGjpiJoEb/k0qDN38OTbkdwPAfcsnDATOaEAeAPHIYtp8vSHiNrpIN8tVO
 Wk9/gxJqVr3VDg0Cel0pXzZ/Js5TWZEILBY28PML/F+/6S/ij/T2Qhyz2M/MV58c/Y2/JVt/lbm
 kmBP+TCj3TBU6HD8HuXoGG80aDBgrBcCdOh+W1L1yvNCNX/7nUY0vC1LRWWuuqf6sbBjFw==
X-Google-Smtp-Source: AGHT+IGZVEVMxiOt6jeqMEAztsF59eLZGnR7BdDjB+ynvv+0phivPuMF2SeTSIpGH0oLVnNt/k+dsQ==
X-Received: by 2002:a05:6808:17a4:b0:406:7186:5100 with SMTP id
 5614622812f47-40b33e18292mr15859525b6e.22.1751379369809; 
 Tue, 01 Jul 2025 07:16:09 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:8ebc:82eb:65f7:565e])
 by smtp.gmail.com with ESMTPSA id
 5614622812f47-40b32420c62sm2182425b6e.39.2025.07.01.07.16.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Jul 2025 07:16:09 -0700 (PDT)
Date: Tue, 1 Jul 2025 17:16:07 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Abdun Nihaal <abdun.nihaal@gmail.com>, andy@kernel.org,
 gregkh@linuxfoundation.org, lorenzo.stoakes@oracle.com,
 tzimmermann@suse.de, riyandhiman14@gmail.com, willy@infradead.org,
 notro@tronnes.org, thomas.petazzoni@free-electrons.com,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/2] Revert "staging: fbtft: fix potential memory leak
 in fbtft_framebuffer_alloc()"
Message-ID: <4c1aa07f-082a-4ba0-ad3e-14eba02423f2@suswa.mountain>
References: <cover.1751361715.git.abdun.nihaal@gmail.com>
 <a689f32d6c56d6c5c6ba8e2faa0305b5e92d9897.1751361715.git.abdun.nihaal@gmail.com>
 <aGPnPVjB6bGKMkwV@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aGPnPVjB6bGKMkwV@smile.fi.intel.com>
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

On Tue, Jul 01, 2025 at 04:48:45PM +0300, Andy Shevchenko wrote:
> On Tue, Jul 01, 2025 at 03:10:22PM +0530, Abdun Nihaal wrote:
> > This reverts commit eb2cb7dab60f ("staging: fbtft: fix potential memory
> > leak in fbtft_framebuffer_alloc()").
> > 
> > An updated patch has been added as commit 505bffe21233 ("staging:
> > fbtft: fix potential memory leak in fbtft_framebuffer_alloc()"),
> > and so reverting the old patch.
> 
> Revert has its automatic line, please do not remove it.

Why?

I hate the revert format.  It is from when git was invented in 2005.
It sets you up for failure.  These days we have so many other things
that we want in patches.

1) The subsystem prefix in the subject
2) The 12 character hashes
3) A proper commit message
4) A Fixes tag

The automated revert commit messages don't have any of that.  It's
always better to hand write them.

regards,
dan carpenter
