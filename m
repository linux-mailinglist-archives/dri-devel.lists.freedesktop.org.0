Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 39A009EE1EB
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2024 09:53:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 919B710ECFF;
	Thu, 12 Dec 2024 08:53:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="mu5VQ/ii";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E84A10ECFF
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2024 08:53:28 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-385e1fcb0e1so146737f8f.2
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2024 00:53:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733993607; x=1734598407; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=kcLl7kFykk32AO5ovfG3u6worF3QF2ZUK1MMUkz/PPs=;
 b=mu5VQ/ii82Bhz1lJ/3bZbDROqcTPPjbzSKfIs//HjPV8B4OTT3IyLx52tpbXE7aLuZ
 Mr8GnBtFQPFc4+TAKWcPSElMGqaC/Exiw2cIf2cqnst+QYiiMaAx7N2LwHg1o/rogZQG
 pVufXjeAuUjmr/vXM7Zt+762eoK+33Il6BGyVW4MeAfQPJD2Bl4t/AjsD3jjYAJXnUCh
 CLL8u1lYzEDlKT1ojOGpdA9+6IBcrOWUigxf+22xtGHySLTn0vIO3mm3h2RjzMEZIhq/
 FvuUhrYVsmkbwvbxeyv4U4sqkFnkcQQ33QkY67TTLkmPZ+5Jq2WVhlI7HMEJT6EBie6y
 LnIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733993607; x=1734598407;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kcLl7kFykk32AO5ovfG3u6worF3QF2ZUK1MMUkz/PPs=;
 b=xGQomu0TRs5Ru+XkjJ8znAx9J6bCwknFR+QMl4Y7kcNZdw+2x7ask7gpXTdYriVeJG
 UIuzgRiJ+KpHkGb68RbyYcciOMq4DRMHbaNBPtJMx+N+nXVEnyQA7u/HEITlGy1NF9YN
 loheRB/+6jwchNtxgXVUl4NeQh5F479eBeB/pTDyxSklKBpCT4bwuUVLuK4S8vGegQ0G
 cublUBZpzp5tR+Ri57sfC0mJH9hAXmh8jA+Y4m7m99m+8HH+D6oCu+1RE1WXbyjW/0f7
 rAQ+hQh4MH+y4gl8IA97cSyKe8KAFl62P3jdMYTw1LVDRcuVUcXiQYVEvr1LyxYea5zm
 KirQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUrxszJJMeBpTy4owXWr9I+zW1GqczJQ44vTWwo6vjdK1NkDw0boifD2xbbs+nA3jhVMRODj4syVhI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxpxtrXd/jPhsVr2gGgUSxEGoWAvW7ESqQaScFEJ5VnUsON0In9
 PBfajs1b1cJwcKnRU+Xy0GcddLLq46/iez+tXPnagA2AzzkMLWFmP0ff/HTZatE=
X-Gm-Gg: ASbGncvn+mpoalDRaZvyacHRrEZpDLqmJgsHdX3Q3e0WDZAQX6VsZHyKJkdgEV53eVe
 ROL6D6y0tlhgQDIcKCtj1nUgzdGWkytFTexPawRBxxvH4nvJ76QGRyCEbqB0uRno/L5WeUWBLei
 k1yXjE/sOp54axllcCNYECMJxZrUpFjlxpIGaB9iMN7ryrO44e6fFR/TnksKu6Gz6CVAf8V4i5X
 Der2YU0qcDSX7N5dctIwR8oG1FpbRuS9/zWlrq3vcj+/ailU6eqVt1gTwQAZQ==
X-Google-Smtp-Source: AGHT+IH0Mqy7glyRVhSSY/dK6s7PFVlMFUlCIyaLwLxpZzvDpBjrdEeUt+8GQ5R535mo+HypPJLM0A==
X-Received: by 2002:a5d:5887:0:b0:382:5010:c8de with SMTP id
 ffacd0b85a97d-3864cec5ba6mr3695151f8f.46.1733993606736; 
 Thu, 12 Dec 2024 00:53:26 -0800 (PST)
Received: from localhost ([196.207.164.177]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3878248e633sm3492675f8f.4.2024.12.12.00.53.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Dec 2024 00:53:26 -0800 (PST)
Date: Thu, 12 Dec 2024 11:53:22 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jocelyn Falempe <jfalempe@redhat.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 John Ogness <john.ogness@linutronix.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 "Guilherme G . Piccoli" <gpiccoli@igalia.com>,
 bluescreen_avenger@verizon.net, Caleb Connolly <caleb.connolly@linaro.org>,
 Petr Mladek <pmladek@suse.com>, Jani Nikula <jani.nikula@linux.intel.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 2/6] drm/log: Introduce a new boot logger to draw the
 kmsg on the screen
Message-ID: <9fef340b-e6a5-42fc-90a3-3323d2b8175d@stanley.mountain>
References: <20241204160014.1171469-1-jfalempe@redhat.com>
 <20241204160014.1171469-3-jfalempe@redhat.com>
 <816f862e-762d-4880-9285-5a803e657e66@stanley.mountain>
 <88abb273-13e3-4969-96c3-c7d677a082d4@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <88abb273-13e3-4969-96c3-c7d677a082d4@redhat.com>
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

On Thu, Dec 12, 2024 at 09:49:19AM +0100, Jocelyn Falempe wrote:
> On 12/12/2024 08:41, Dan Carpenter wrote:
> > This patch breaks "make oldconfig" for me.  It just gets into an endless
> > loop of:
> > 
> >    Default DRM Client
> >    choice[1-0?]: 0
> >    Default DRM Client
> >    choice[1-0?]: 0
> >    Default DRM Client
> >    choice[1-0?]: 0
> >    Default DRM Client
> >    choice[1-0?]: 0
> >    ...
> > 
> > I don't have to type anything, it just spams that forever.  It's weird
> > that it's 1-0 instead of 0-1.  Does that means something?  I don't know
> > much about Kconfig.
> 
> I can reproduce it with your provided config.
> 
> It looks like it happens if DRM_CLIENT_SELECTION is enabled, but none of the
> client is.
> The attached patch should fix it, can you try it ?
> 

Thanks!

Tested-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter

