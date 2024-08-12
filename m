Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4111194E73B
	for <lists+dri-devel@lfdr.de>; Mon, 12 Aug 2024 08:54:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DB0710E0E7;
	Mon, 12 Aug 2024 06:54:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="UeRuvqSh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6269610E0E7
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2024 06:54:47 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-a7a8caef11fso442545266b.0
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Aug 2024 23:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1723445686; x=1724050486; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=0fQcBx/yhtEJalnoutc2Qp0GWGGUElulCgKYdofD76A=;
 b=UeRuvqShDOQClZw/st5mxLAE0+qSloZR26P7GWQO2tp//J72ucXqJXKPfTsiRH9AC/
 2Zs8ZqbkHzO2PbK6IPi2q5Pli9yCwoh0yGM+nmTHAHBAVKsI+TRhcM4iluaZjI44RlWK
 DbyLJP08SF9Ror3nemIm2Om7Nq8Ilhsj1lLlIKI1yyJFBvBUj4jISbZ2dcGlI3vfKFQZ
 VCRaJkj05bqFZpEgtmcJuBQz5dCsiKUUFY323FRz3JdR12UX7udQzCiIDI3CG9GLteiB
 DHNMivjTGkxwclhuad3o7I9nggZ+KSowenf26qd6nHxREk7zWigfI39roE3lhHwPh0Mu
 15oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723445686; x=1724050486;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0fQcBx/yhtEJalnoutc2Qp0GWGGUElulCgKYdofD76A=;
 b=Eym1YipWJznSf08vL3lpu2BjpBtJocsJepLtmjfONVzCMmd3S7LNKgbLKiYimYWlfs
 TuYBPRnjF4K9ry2KtRgE1UIP+cS0J11zlns/OrIO5M4vlXmZf618KuQIt4BSAWdjU/ZO
 Tr6E6jI/AcfJhfif/2hhoc4w+9IKpeWo5r389KnaNo1MVDdCQDGfpA4pUzbvjvlF8zII
 Gd1PZonzL9zl/8Xjo3Kf8j21HhGaamsYAyFw+sdcJMwhmC1kyp6A+tCX3GbTkyoqKjRu
 z80GCbkH+6gcyv+fos1AJzdcsg4pQC3nDAUhaJZFxQdTYmwHE2zCEm7r9UMLCviqxEF0
 /VPg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUIScFUwlFkrV4vHtUJ7jFztB3ti6OH/wEF110tujsUJ4c0zDZHAeOqlhzvR+VwlpRRZO8npzQE/FFFAwNy5wn2L7mpqJP0UXPBhiGgjlA4
X-Gm-Message-State: AOJu0Yz6zRitu7R5RG3BSnxPuzecF6mkERF722kHxziXZgyoCVYgkYrF
 i9OVlkLiTQOWHkyiT2cFbB+S46Q8TBAwPu3Xt6qUq5eIA59ZaoUaTDPbZikQs5c=
X-Google-Smtp-Source: AGHT+IHqItAaYkq1CnYLYCG46rQAAVYiJweMtHCZU5ynOtcYUTt5FmVrj2hFnIpnEigVtDeRa1vwUg==
X-Received: by 2002:a17:907:72d0:b0:a7a:9226:6511 with SMTP id
 a640c23a62f3a-a80aa5d9ae5mr688705066b.31.1723445685533; 
 Sun, 11 Aug 2024 23:54:45 -0700 (PDT)
Received: from localhost ([196.207.164.177]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a80bb0904f5sm207822166b.18.2024.08.11.23.54.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Aug 2024 23:54:45 -0700 (PDT)
Date: Mon, 12 Aug 2024 09:54:41 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Dave Airlie <airlied@redhat.com>, Jocelyn Falempe <jfalempe@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org, Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH v2] drm/ast: astdp: fix loop timeout check
Message-ID: <10624c71-d134-441f-a7e6-d757b60f54f8@stanley.mountain>
References: <9dbd4d2c-0757-4d5f-aa11-7d9e665e7633@stanley.mountain>
 <8c1ad0a1-bbc5-4274-bdf5-fcf2e043a869@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8c1ad0a1-bbc5-4274-bdf5-fcf2e043a869@suse.de>
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

On Mon, Aug 12, 2024 at 08:48:16AM +0200, Thomas Zimmermann wrote:
> Hi
> 
> Am 12.08.24 um 08:42 schrieb Dan Carpenter:
> > This code has an issue because it loops until "i" is set to UINT_MAX but
> > the test for failure assumes that "i" is set to zero.  The result is that
> > it will only print an error message if we succeed on the very last try.
> > Reformat the loop to count forwards instead of backwards.
> > 
> > Fixes: 2281475168d2 ("drm/ast: astdp: Perform link training during atomic_enable")
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > ---
> > v2: In version one, I introduced a bug where it would msleep(100) after failure
> >      and that is a pointless thing to do.  Also change the loop to a for loop.
> > ---
> >   drivers/gpu/drm/ast/ast_dp.c | 12 +++++-------
> >   1 file changed, 5 insertions(+), 7 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/ast/ast_dp.c b/drivers/gpu/drm/ast/ast_dp.c
> > index 5d07678b502c..9bc21dd6a54d 100644
> > --- a/drivers/gpu/drm/ast/ast_dp.c
> > +++ b/drivers/gpu/drm/ast/ast_dp.c
> > @@ -146,18 +146,16 @@ void ast_dp_power_on_off(struct drm_device *dev, bool on)
> >   void ast_dp_link_training(struct ast_device *ast)
> >   {
> >   	struct drm_device *dev = &ast->base;
> > -	unsigned int i = 10;
> > +	int i;
> > -	while (i--) {
> > +	for (i = 0; i < 10; i++) {
> >   		u8 vgacrdc = ast_get_index_reg(ast, AST_IO_VGACRI, 0xdc);
> >   		if (vgacrdc & AST_IO_VGACRDC_LINK_SUCCESS)
> > -			break;
> > -		if (i)
> > -			msleep(100);
> > +			return;
> > +		msleep(100);
> 
> But we don't want to wait during the final iteration of this loop. If you
> want to use the for loop, it should be something like
> 
> for (i= 0; i < 10; ++i) {
> 
>     if (i)
>       msleep(100)
> 
>     // now test vgacrdc
> }
> 
> Best regards
> Thomas

I feel like if we really hit this failure path then we won't care about the
tenth msleep().  I can resend if you want, but I'd prefer to just leave it.

regards,
dan carpenter

