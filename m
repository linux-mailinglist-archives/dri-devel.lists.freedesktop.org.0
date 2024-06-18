Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2813E90C419
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2024 09:01:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E578D10E4BB;
	Tue, 18 Jun 2024 07:01:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="BSl46v6h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 463D310E0F1
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 07:01:00 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-3609565a1bdso1526959f8f.1
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 00:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718694058; x=1719298858; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=v0a5p1bD0AyssKGKB5WnIImRaJI9ITejqF9cQEG0YuY=;
 b=BSl46v6hsjf/Jghv+J++XW1llXyYOZDuEltsC41x37OVRu87HBSwctBicYndLf9r2/
 E/T3sNB4ZhctZSKyDSoP0+fl9Aycn00SY8PSSVRQwMywol5LoZZb5qrUVpPF+69TIF0h
 jlaNJ7p1+1chMj0maZjCLWHxWjJ7EdZw33IW4qe0SJnhkcwz0t8lVVIp1DUbZrAeNVK+
 RbAtuy4rVjorS1et3jDrSsXsSuWhG7vuCrxv9dPnbppUoWVOodZz0JW0jEnDHViFbLQQ
 xWsKAzIIkjDGRcvyLHFJxJ3s5zm2XwDNiH17Y288g0X7JzwKLlrae9eADhGJqe3Itq3n
 hgyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718694058; x=1719298858;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=v0a5p1bD0AyssKGKB5WnIImRaJI9ITejqF9cQEG0YuY=;
 b=KIg4D9dJIVuYtXOOaV1n4p6/c/QHOj9y96F4Vv36mBEkyE5RZOCwcr+Xiq5GVzOsB8
 UjzPvkemRQihAkU8dMcT7W7gXRtbONVPje4W/hhZNvJ8NE8gkcJVyIewmyPRSbVpbeuU
 BTQs0zL9draacW0wpAFVR1e+wNqedg8pKgNCj6JvICFByBxoqybi8YBqE7QIxlmp48Cq
 vR0Bi1rjG/xxvRbYzk+mWMq6VWWr6QmOIb+iyMe/mxZg5aNYVrO50kiUkpKKXrNrlN7H
 f0I0alhKo4wh/xxKPjNFscE8v4BjJ0QcZRJm+8oeULJKHPXth6eY/9LEsV9lbDwF6Fwx
 T3WQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXZZhKJD6eTDE5+nzi8R7xZyz+KR5LeK0STt+FqVw+90Q5AfxodtpzpWGiRzzXTaOWotD9Q8Z/SUGsoQpb0PgUQ9UYnkevq3lrRpF7TNCb8
X-Gm-Message-State: AOJu0YwkB/5z7eUZGfJKikQa8O1uucEFpGUmAA4j04jCHzqnG2+LGSLW
 fVHIOp8IHZWnzF4Kqz18mEIdQsUDTGk5yGGtw+yRh0xWJfE+rrP3rJyMQ/eggZQ=
X-Google-Smtp-Source: AGHT+IENTRuaf3ngXVONzPwSYh1oRVgwzc4UC8HbyWW/rviR2sWOLdMBJeB9XSWba9XZVCRXPH2cZQ==
X-Received: by 2002:a05:6000:87:b0:361:bd3f:f89b with SMTP id
 ffacd0b85a97d-361bd3ff946mr527425f8f.50.1718694028568; 
 Tue, 18 Jun 2024 00:00:28 -0700 (PDT)
Received: from localhost ([102.222.70.76]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36077536f78sm13307498f8f.7.2024.06.18.00.00.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jun 2024 00:00:27 -0700 (PDT)
Date: Tue, 18 Jun 2024 10:00:23 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Danilo Krummrich <dakr@redhat.com>
Cc: Lyude Paul <lyude@redhat.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org, Karol Herbst <kherbst@redhat.com>
Subject: Re: [PATCH] drm/nouveau: Use kmemdup_array() instead of kmemdup()
Message-ID: <ba70e0f2-c957-4235-aa51-b1a8c86034b6@moroto.mountain>
References: <a3e8cecc-77dd-4a4a-bb12-c1d6759d3efb@moroto.mountain>
 <a61d9781-7c6e-46b8-ab1b-cf4fc1c76ba3@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a61d9781-7c6e-46b8-ab1b-cf4fc1c76ba3@redhat.com>
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

On Mon, Jun 17, 2024 at 05:55:33PM +0200, Danilo Krummrich wrote:
> On 6/17/24 11:33, Dan Carpenter wrote:
> > Use kmemdup_array() because we're allocating an array.
> > 
> > The main difference between kmemdup() and kmemdup_array() is that the
> > kmemdup_array() function has integer overflow checking built it.  The
> > "args->in_sync.count" variable is a u32 so integer overflows would only
> > be a concern on 32bit systems.  Fortunately, however, the u_memcpya()
> > function has integer overflow checking which means that it is not an
> > issue.
> > 
> > Still using kmemdup_array() is more appropriate and makes auditing the
> > code easier.
> 
> Indeed, we shouldn't rely on the previous check here, good catch.
> 
> > 
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > ---
> >   drivers/gpu/drm/nouveau/nouveau_sched.c | 16 ++++++++--------
> >   1 file changed, 8 insertions(+), 8 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.c b/drivers/gpu/drm/nouveau/nouveau_sched.c
> > index 32fa2e273965..53d8b0584a56 100644
> > --- a/drivers/gpu/drm/nouveau/nouveau_sched.c
> > +++ b/drivers/gpu/drm/nouveau/nouveau_sched.c
> > @@ -45,10 +45,10 @@ nouveau_job_init(struct nouveau_job *job,
> >   		if (job->sync)
> >   			return -EINVAL;
> > -		job->in_sync.data = kmemdup(args->in_sync.s,
> > -					 sizeof(*args->in_sync.s) *
> > -					 args->in_sync.count,
> > -					 GFP_KERNEL);
> > +		job->in_sync.data = kmemdup_array(args->in_sync.s,
> > +					args->in_sync.count,
> > +					sizeof(*args->in_sync.s),
> > +					GFP_KERNEL);
> >   		if (!job->in_sync.data)
> >   			return -ENOMEM;
> 
> Not sure if this is what we want for kmemdup_array(). It just saturates the
> size. This doesn't prevent accessing the array out of bounds later on. I mean,
> it's rather unlikely to get such a huge amount of physically contiguous memory
> anyways, but wouldn't it be cleaner to let kmemdup_array() return
> ERR_PTR(-EOVERFLOW) on overflow, just like memdup_array_user()[1]?
> 
> AFAICS, there's just two users of kmemdup_array(), hence it should be an easy
> change. :-)
> 
> [1] https://elixir.bootlin.com/linux/latest/source/include/linux/string.h#L30
> 

We can't change the return values.

kmemdup_array() has to match kmemdup().  <-- returns NULL
memdup_array_user() has to match memdup_user().  <-- returns error pointer

regards,
dan carpenter

