Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72ED3AEFBC0
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jul 2025 16:13:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7049710E5B8;
	Tue,  1 Jul 2025 14:13:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="wCveehkJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com
 [209.85.160.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19D3F10E5B7
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Jul 2025 14:13:04 +0000 (UTC)
Received: by mail-oa1-f49.google.com with SMTP id
 586e51a60fabf-2efbbf5a754so2301172fac.0
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Jul 2025 07:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751379183; x=1751983983; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=DgIRXBrUhqUfMA4ZY1lMetlJzjnZyUiR+RgRBjwesGE=;
 b=wCveehkJwib39f5llcvVr1FQrS4uFctlgeolaHCAFF+ajv3fR3iGtpn60/xfBCwjG9
 13I+TmXLhqm6Unz/yu4X/ash5wwn86h4fglby/pKDOKpA3kVs4G7evxQ7fryvb5PDxTB
 4Nsd/ph735wRwiggvDbt0tMAJMyuSmhwTu1Tx9CC2a7T0AoX3nqsbV96nlOOkyosQnQD
 5EbVandxoBSEu0DoOg2sdz5fMkZreaQDLNzPQ18kfd1hW2k+RyLctYNHWNIfzJvIPVMJ
 5JQ41dFiRycw+0mrebx4KSZQUnXESqfegwgm6QSl3RpdZdiP0JUoVsQK9QbEF+Qopcu4
 jZpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751379183; x=1751983983;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DgIRXBrUhqUfMA4ZY1lMetlJzjnZyUiR+RgRBjwesGE=;
 b=B2g+Z0IJUGFouQCUcBYWLqE3Z80N9AtHEMeOL3mtHCD5dTLowXJmomiNNdDWMcWje5
 DVF+Jrds6rIjXlvNRn1mdZ2tNgm2olpQh0rPALRJyu43t6btxxE9ZkIlBI+sR6sbrNH1
 DkdEnZlsQJlmTiDXZilFH789I+Ftm7ZFu0RvTUsgu2J0ux62FhfmAoWlXZf0q9UgjWsR
 rfhvS6A8xqCiy9LnKMu8IJeP/OUUlNdgPNZq3Ms+/u2dLoi5NHoSUbnRzYbAqpbibj5m
 Qh9jYQ/AyvdcwP8+HgygtGF2zx78c3KGNKou3EXs5IulD3dLrujWwP4kU6lCCLi7yKdm
 +61w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUqIQZpN83bg5hib7LVYpvpCUV32QthbS05wV83Nj82+Vkz4Zgxayghtw1pCOaNkWoM7IlYK0heBlM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz+MJTcgGMI/2US6IGXNsqhN+1Yi+UKSydfX0dEfR/EcgWWg8z6
 lBhEw25gV8zA4ItqQhrPHeKxqkq1nGkDOa0rhcjpjMQytXmb7pAqcHzFe/AAx5SwyOc=
X-Gm-Gg: ASbGncv635LMlLVB0Ys+nBXMxFD7cSMrNNyqxRi7/6P8aTwKNAk90a58z3mdT7p77jv
 4dyg77OxZ/ZI7DIkV17ReVmJ3b4NsIf5cbppJKFMj2BgBBR7cGCM0f9oHod1AfLyq3mkNAtpHTh
 70WJ6lwz64cyDA1ikwSGY1zFyu1wKlpQ3K778Wvbav2F7l+01y9HwtbUxbC72RV6rw3nDKuk3IP
 3/432jhapYdclCBvFZAOOzLxFa+4PPtyOVUm4E+rgvxc51GGWsjL6RF9KoeSXMZdutGQZM4TjXJ
 xkX8aJlC3rYESkyf+wPGMwC50zCr9RvA55haiECcTYi7Y+0GO9a1MVvxyZxr/CvT/n4frw==
X-Google-Smtp-Source: AGHT+IF8222q5H+Su9S8AoNHUZyIRZzavZDR6dz1AwLsejbGTN9lIlZ82z0uy9mz2H1nkV0KHwWknw==
X-Received: by 2002:a05:6870:a99b:b0:2e4:4617:f6e1 with SMTP id
 586e51a60fabf-2efed451a35mr13168004fac.2.1751379183127; 
 Tue, 01 Jul 2025 07:13:03 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:8ebc:82eb:65f7:565e])
 by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-2efd50b1ffdsm3274257fac.26.2025.07.01.07.13.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Jul 2025 07:13:01 -0700 (PDT)
Date: Tue, 1 Jul 2025 17:13:00 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Abdun Nihaal <abdun.nihaal@gmail.com>
Cc: andy@kernel.org, gregkh@linuxfoundation.org, lorenzo.stoakes@oracle.com,
 tzimmermann@suse.de, riyandhiman14@gmail.com, willy@infradead.org,
 notro@tronnes.org, thomas.petazzoni@free-electrons.com,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/2] Revert "staging: fbtft: fix potential memory leak
 in fbtft_framebuffer_alloc()"
Message-ID: <2e1d692c-5f16-4042-9ae9-423e3991834e@suswa.mountain>
References: <cover.1751361715.git.abdun.nihaal@gmail.com>
 <a689f32d6c56d6c5c6ba8e2faa0305b5e92d9897.1751361715.git.abdun.nihaal@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a689f32d6c56d6c5c6ba8e2faa0305b5e92d9897.1751361715.git.abdun.nihaal@gmail.com>
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

On Tue, Jul 01, 2025 at 03:10:22PM +0530, Abdun Nihaal wrote:
> This reverts commit eb2cb7dab60f ("staging: fbtft: fix potential memory
> leak in fbtft_framebuffer_alloc()").
> 
> An updated patch has been added as commit 505bffe21233 ("staging:
> fbtft: fix potential memory leak in fbtft_framebuffer_alloc()"),
> and so reverting the old patch.
> 
> Signed-off-by: Abdun Nihaal <abdun.nihaal@gmail.com>
> ---

This is the wrong approach.  The original patch was fine.  Just
write the next patches on top of that.

regards,
dan carpenter

