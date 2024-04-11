Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66E1F8A1891
	for <lists+dri-devel@lfdr.de>; Thu, 11 Apr 2024 17:25:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76DE910F18A;
	Thu, 11 Apr 2024 15:25:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="xo9altXM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A888510F18F
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Apr 2024 15:25:39 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id
 4fb4d7f45d1cf-56e6acb39d4so5435401a12.1
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Apr 2024 08:25:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712849138; x=1713453938; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=CABfqMACNUngHNLxS+WM0hHJ1yaxWLelGbJxYjHioD0=;
 b=xo9altXMP0tNJ9ScwNa+s0TWBO/V6elCReALXrxHUMmha7/tsBzNVdq2WVLT8MN+8z
 6g63mH27M9VeNyAdzXsUsdTFBd90fSeDcDC/aWwke4B2+INWkxQa3FYcrEacPHWh0cPo
 RGhyrqz2dUPDJjp+2VHtH1gBcCxMEBFx6lea6skYTuxEIqNkOM8PmZ48igCnV9ZVLX7R
 KDDx2ioiezyjbtBBYd3eoaE8O4aMsiXhgA8thaTC0QR9NWnBaPn5WVVzQhG8jbbMapNb
 SCQv2g6ijN4ETQQjpwfq6+IVAMtm2GssoY6TCS6OEqprlLfylpe5rKVj04ikuPi9vLxo
 7eVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712849138; x=1713453938;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CABfqMACNUngHNLxS+WM0hHJ1yaxWLelGbJxYjHioD0=;
 b=pr38SmULVtqapILJ+nemoYnfZOuQfKgQrTy7/NgkuHD+/lqYJkmaHyTCIfURppYrHI
 X4OQROMBjj85H0GIaf/f6hBz0R+L2TUDOVmJx8TCZa56sCjiEDImeSCGDwwGWiAuJk0g
 hjYqBeP7XLA+gzakcFlwT2Q1K2YZH7XDm0B+3lKuD7Jm2XVlzRWHVflpqKeyLaFWuvvy
 4S8sQ2AL4B/dY5qtdc9DMN+kDCEaPTUd1/l073vhDQPMxo2pxCCN3ympoCygmZXkgxet
 Zo9wvOJfWI1jNXKSDc15dvyRcLuWQ8lAYzmxB4tSeKf5eybKQi8s7Ut4/NQ+l12gudJw
 G6RQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUXikDtsUhXGL2fS6on9r3kAcS1uEcfs9a2n8A8gf+BLCMPKWiHRYEAMI0XZWZxdRSiFU1pPYIKomShshRy1uPBidr58hgqBEJjyiJzoEcv
X-Gm-Message-State: AOJu0YyvtYej++drs5D/+4F9Wg0ZsHCZn7K5M4CVTcaMsVwQEVWYZjjo
 Xb80hf8jSbOYq7jnM+TtFf1tckn8VfDxOWj87B2wVCvEWoXOBOHgpxI0NbM3xxM=
X-Google-Smtp-Source: AGHT+IEEewk7llSPmgrxe/7mA2rySV/OUDonUpYE2d0l2M0z39pI2HKiyjdOd8AbAw/PCbmxmW//Bg==
X-Received: by 2002:a17:906:4f06:b0:a52:3d1:6769 with SMTP id
 t6-20020a1709064f0600b00a5203d16769mr44591eju.14.1712849137563; 
 Thu, 11 Apr 2024 08:25:37 -0700 (PDT)
Received: from localhost ([102.222.70.76]) by smtp.gmail.com with ESMTPSA id
 r3-20020a170906350300b00a522c69f28asm225076eja.216.2024.04.11.08.25.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Apr 2024 08:25:36 -0700 (PDT)
Date: Thu, 11 Apr 2024 18:25:32 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Thorsten Blum <thorsten.blum@toblux.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-s390@vger.kernel.org,
 speakup@linux-speakup.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-wireless@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-afs@lists.infradead.org, ecryptfs@vger.kernel.org,
 netfs@lists.linux.dev, linux-fsdevel@vger.kernel.org,
 linux-unionfs@vger.kernel.org, linux-arch@vger.kernel.org,
 io-uring@vger.kernel.org, cocci@inria.fr, linux-perf-users@vger.kernel.org
Subject: Re: [PATCH] treewide: Fix common grammar mistake "the the"
Message-ID: <0bd7ccc2-4d8c-455b-a6c2-972ebe1fcb08@moroto.mountain>
References: <20240411150437.496153-4-thorsten.blum@toblux.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240411150437.496153-4-thorsten.blum@toblux.com>
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

On Thu, Apr 11, 2024 at 05:04:40PM +0200, Thorsten Blum wrote:
> Use `find . -type f -exec sed -i 's/\<the the\>/the/g' {} +` to find all
> occurrences of "the the" and replace them with a single "the".
> 
> Changes only comments and documentation - no code changes.
> 
> Signed-off-by: Thorsten Blum <thorsten.blum@toblux.com>
> ---

It's tricky to know which tree a patch like this would go through.  We
used to have a trivial tree for this stuff but I guess that didn't work.
It's possible that it could go through linux-doc, but probably it has to
go as a set of patches through each of the trees in the CC list.

regards,
dan carpenter

