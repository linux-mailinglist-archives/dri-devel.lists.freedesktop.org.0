Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F06D2AEBD31
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jun 2025 18:26:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DC3F10E33A;
	Fri, 27 Jun 2025 16:26:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WJtltBrn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com
 [209.85.215.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6C3510E33A
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jun 2025 16:26:13 +0000 (UTC)
Received: by mail-pg1-f176.google.com with SMTP id
 41be03b00d2f7-b31f0ef5f7aso7727a12.3
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jun 2025 09:26:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1751041572; x=1751646372; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=iymRxdZHCbk6hr0LCFlebLISEqnGtGso2ocica07eUc=;
 b=WJtltBrnTZa3eqBFzT9aZd5C3SH6MgdJp6GgtFscpVrvQ8xIe3c3k3kndIDtjH1k0o
 41t6TL20Xqb7YMSsdxpr6L+5MSiRISfXpAQOIJRR2VPk8HyYP+LVwz7i8Y0eEL8BxS7y
 nfpm9dhpkFgcQfnmlTTd68auwXyzcCsyg5dE3m344Yctiavp/BFe4EhUrgYRq6iJHpXH
 oUiyfi6EJ4tjVwmm0PsYvwUy4IFCDb75fxvsQpqTZhiMx2Ab2bW147uTkjhClYUOV2TU
 L0DVP++bfNnl5ERvr8azuoej9IsrG4CLATUSBlX3cvZ6xYIyRJME4t9p/zc+Ol99kZwz
 hvTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751041572; x=1751646372;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iymRxdZHCbk6hr0LCFlebLISEqnGtGso2ocica07eUc=;
 b=AAzPJIhQivPhSr1mXH6BfDLlst1qF6+179Rk9+4IqJXNcSKSbDUFzqQe5XVC3dR5OT
 lbUuX9G3JleQ3cf84fOReQEPriBMmyozNxYuKV77mg9pv1UmDtMtea6VslEaurnU+r7K
 iWJzuP5rqVdnyxro2iGlzf5CvT8DYekmYOI/zdw4/AfCPN6MjG9UV4M5V880iEX/zvNo
 Iadwmc6oDN9uRbmL4pSt+hqZygogCOUTp7y3OQoH47YkcnG//5gkQ+22yOoDEznWt1oe
 LXCamrhBXNj0yZMsnyFFgdmcjHtlvuWYpYs6SoU3UlTGLGk4TxQ2tHvS9NVm1Jn+H03/
 lVdg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWJsC6Yr+poNSKNCnw8EimmJJq7gakS62jJVtxzLjVVLzuOg6T0NsoDgRiX1c+Xy2zGc36oRtQ2eDM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwLS0iIBEbdq9p/CbfHZENtZaLnWT7VaNzjXu7IfoShSninj3II
 su89yZ8Ph9F2lAvA4fzSN9EoYYhPyMS0Fi7cIs25HPhKaP32VimHMcwV
X-Gm-Gg: ASbGnct+S2b7vRtYPVFAMXj0g4hdNqabsPPUxqFTRPAmUD7hf6iDkm3g4rf2yU3ze6o
 3Sm7B3plAv8ZsKll31odweFazLu5XcxmqigZn7M3UGF5k/7DjweP2c5xNEIQzYqmF0p9gGz3ze5
 8D4MBjBXJpHLpsJwfsfBg/AFATMzUFWURBzFow0jhGz8/VYublgCOklD37YT1j5snsVlL2zmRga
 7PQ1Fv+XgwacYzWxn5P8X57LzNoRiywEN38BNIWSsqaxpOV1gUN4fpkbnanvLFrxKlKnEZySbVX
 XKD4MfgAPBUX9NhgMECYLUTKO96RH6x3MzHeUZ76m4+I2FsN+lKAHdA=
X-Google-Smtp-Source: AGHT+IFV96Rf4LjT7OKaIYJfb5G8fLhC9of+ZZxWEW59VC9buNUWyd7wTakUgyC5gxDtG2Rwj+b4Cw==
X-Received: by 2002:a17:90b:3c4a:b0:311:c1ec:7d11 with SMTP id
 98e67ed59e1d1-318c92a2e8emr6033508a91.18.1751041572454; 
 Fri, 27 Jun 2025 09:26:12 -0700 (PDT)
Received: from essd ([49.37.221.186]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-315f51d7913sm6875386a91.0.2025.06.27.09.26.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jun 2025 09:26:12 -0700 (PDT)
Date: Fri, 27 Jun 2025 21:56:03 +0530
From: Abdun Nihaal <abdun.nihaal@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, 
 Dan Carpenter <dan.carpenter@linaro.org>, andy@kernel.org,
 gregkh@linuxfoundation.org, 
 lorenzo.stoakes@oracle.com, tzimmermann@suse.de, riyandhiman14@gmail.com, 
 willy@infradead.org, notro@tronnes.org, thomas.petazzoni@free-electrons.com, 
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: fbtft: fix potential memory leak in
 fbtft_framebuffer_alloc()
Message-ID: <gptas52msk2feixcrned7anmsozs5iyyku3h3am7fmv4jz46ty@lckiii7qhkq5>
References: <20250626172412.18355-1-abdun.nihaal@gmail.com>
 <aF2Ic8BP0zWS6R19@smile.fi.intel.com>
 <0327da98-8a7c-4db8-8bcd-4179b87a9486@suswa.mountain>
 <aF3CwnHyW5HHzDSG@surfacebook.localdomain>
 <aF57eMeNafg1w9Qw@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aF57eMeNafg1w9Qw@smile.fi.intel.com>
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

Thanks Andy and Dan for your detailed comments. I'll send a V2 with an
another clean up patch that fixes the order and removes devm for txbuf.

Regards,
Nihaal
