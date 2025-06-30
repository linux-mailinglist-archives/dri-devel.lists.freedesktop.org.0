Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BA49AEE457
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jun 2025 18:24:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D019C89B57;
	Mon, 30 Jun 2025 16:23:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="lQdAEaWX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com
 [209.85.210.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0F5789B57
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jun 2025 16:23:58 +0000 (UTC)
Received: by mail-ot1-f49.google.com with SMTP id
 46e09a7af769-7382a999970so2450112a34.3
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jun 2025 09:23:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751300638; x=1751905438; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=fA2hiy3pBisBqFxIA1WfhCNpsJVYMFCT5jmkfAR5MRI=;
 b=lQdAEaWXXx2c+T5VLjj272MY7zCMgyJQNGGpbvu99G9tZwr9dzPJKCllFtkeDTnyvI
 z+gArEkXaIclXPCKp+EJMpa/BVzsCKnL8NekguiPHQH2L63VuSS1RArxVergyo9qnwzU
 ChJ4RVVB/Z+H4Rri393+9a5gtrFMClgqRnt03sC2YTE3dANo2FsAvpluwh1EjS9SmYbn
 rvXqDNqw1xZXwwzKiRMg3YfHQLYIeHuULgJSwrFTLwt2p33yGfgbhO+EyawBpiYtE1gl
 bEbTMCpPKLN1+2/kf1TwGZK69G1xzUTUuBfElH1NAZ/3Emcq88M2gupIZ5wNo1uez8LQ
 w60Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751300638; x=1751905438;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fA2hiy3pBisBqFxIA1WfhCNpsJVYMFCT5jmkfAR5MRI=;
 b=PgOpgD5xTtSPq25fqF6p7ZinQNkPJtj8CJrHqsv9m3tSGs5tUtedDxd8/24mz92LDb
 cvxzKfDh5SGNC8JBML0hh2Y2PZUuVIsKX/eu4VxY51IjlfG8RcVNl2olwXOfde9+s8e1
 J0jPTmL2qjZgxhl6Z23tyigTa8Niihj56XY1rPPJH5DK5OvYrzsCrffn07jRSBkkbmK2
 HgwgkxNlEHo0fK273Uqt2hhY0lvuL+u+sBHtASNyLpD3u+bcZYzdTEMwCCYL/i8/ifFp
 60pyIAP67zX4Bi5dvpMYvY9mil7NkEfK/q/JVz4LotF21dzqivLAYefe84uoNcu4EUV5
 Uv/g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXCekZezW4Ax9Us1ty1oTqSMKbXZzFFQ4b85YvAREbAkC5I8T3KMgAEM5zbO1y2l5fXzctkguh59is=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx1VSFSk9rMepCIbBqFP0FmAEwF7ocuoHybVbqUfI0/95Oh4D9+
 UZnD6toxu4sGlOHK3b4QtpTygphARJCffLpgs9c2z17hgfvhuY6x7x8ySFDWd4V6yAo=
X-Gm-Gg: ASbGncvyNZAeRd9LfBGjyAX3z3NM9F6LhpbtRK8TAxBHhYNwq8gFxLwUuuMZ3CfeGwZ
 G7PM8b0W+ViDNWUAqFCDbEjA7SNHSDUOrwnvqVEJiUSOzOOmgakmvuwxDEmaGY1JhuG8qh22Sk+
 QZjFv4utRNXMADCIx+kLFuCoZrt3s9Tx+h79L/Sv3JljYOmLR7CB502xCMiHz8RceDC2xS4FKgp
 o9LDA/Y4v2wvP3Z6Jjd3SU/fUgMrV1M8PGlHNu27S6kDc2GnoiuBMhx+79twR0Tz8N6BQqOs4uu
 UadEVLgy6JOoT/t/oEEQ9JrWyu+7m0XvjHsvvJY7Eo1KFPowGxUktNXghO2P97RiNk+a
X-Google-Smtp-Source: AGHT+IHI8m9128kRd2fU4qN7fgHZ/eU48Raar7DmwpFo5FAW57ejeRpFPJvZQgadqdVBw4gRttl5dA==
X-Received: by 2002:a05:6830:61c2:b0:73a:8705:e9e6 with SMTP id
 46e09a7af769-73afc43ba8amr8817314a34.4.1751300637997; 
 Mon, 30 Jun 2025 09:23:57 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:fb67:363d:328:e253])
 by smtp.gmail.com with ESMTPSA id
 46e09a7af769-73b2459ee91sm644765a34.51.2025.06.30.09.23.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jun 2025 09:23:57 -0700 (PDT)
Date: Mon, 30 Jun 2025 19:23:54 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Abdun Nihaal <abdun.nihaal@gmail.com>
Cc: andy@kernel.org, gregkh@linuxfoundation.org, lorenzo.stoakes@oracle.com,
 tzimmermann@suse.de, riyandhiman14@gmail.com, willy@infradead.org,
 notro@tronnes.org, thomas.petazzoni@free-electrons.com,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/2] staging: fbtft: cleanup fbtft_framebuffer_alloc()
Message-ID: <e15bb200-f59a-45bb-8349-72816629abb9@suswa.mountain>
References: <cover.1751207100.git.abdun.nihaal@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1751207100.git.abdun.nihaal@gmail.com>
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

On Sun, Jun 29, 2025 at 08:10:09PM +0530, Abdun Nihaal wrote:
> Fix a potential memory leak and cleanup error handling in
> fbtft_framebuffer_alloc().
> 

Thanks!

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter

