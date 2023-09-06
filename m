Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39FBA79393F
	for <lists+dri-devel@lfdr.de>; Wed,  6 Sep 2023 11:59:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E58010E5E4;
	Wed,  6 Sep 2023 09:59:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A36510E5E4
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Sep 2023 09:59:41 +0000 (UTC)
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-466-DavX2fnwPJ-aNQGSQzR18A-1; Wed, 06 Sep 2023 05:59:40 -0400
X-MC-Unique: DavX2fnwPJ-aNQGSQzR18A-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-3fe1dadb5d2so22341285e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Sep 2023 02:59:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693994379; x=1694599179;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NmAkZbkLbqrhYKWGilvLnXtd6fKYLLSrfrWjxYIXvzE=;
 b=L6TV2DTXKLE3HC2QEEAfy3Ph7zLO3wULPD6YD/HB1ThbbLFv1rO7N1qI7vHL7F9UE7
 Zh5FbYxLyFOmg6xP8epkkgKMZ8a0vuHZOMZw50ZnZijg4iX//rIwzuDtg2Vju1rFqoWU
 OSXAONTQepRT66B4J0rEC32DKL9g600IU6Qnp2Xl1y8ZEH23vRQtycbFtPZUcY5bb3Ki
 ZP3tkMsQoz7zprfPVURhBQ84bSN9ShqVACoCgnJoTveuYRJtg9nRQJWQhtlouuFmyeuD
 T2cQ/xLrvh6pv2L9kaf9VXKHiro2gLrrRWQcN2WSYw4LeddnWdKps3FxAOXur6DaVFx2
 FtjQ==
X-Gm-Message-State: AOJu0YyQKKX1U1/CQW+FVe2WAr2SRjOdmtrfprMJfMhi3Yl4dpVpLZ/q
 I8XYjZH3BZDAqA3VL0UWRZwBXT8m+DD+DDJk6HHfi+6ffWN3AqsVvAsBYkUwhx3yE/kILRy+zjQ
 ZIcFMw/oCMVc/Zy5kJ4+U9kT/RyUh
X-Received: by 2002:a05:600c:128f:b0:3fe:25b3:951d with SMTP id
 t15-20020a05600c128f00b003fe25b3951dmr1928466wmd.5.1693994378901; 
 Wed, 06 Sep 2023 02:59:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE5+OhfOUQuGHMsv/QI74pAE53OdzJ3LqKgxFhHFhepwapLYpSxbrf63ipC3UeI9PeqR2f8jA==
X-Received: by 2002:a05:600c:128f:b0:3fe:25b3:951d with SMTP id
 t15-20020a05600c128f00b003fe25b3951dmr1928450wmd.5.1693994378520; 
 Wed, 06 Sep 2023 02:59:38 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 15-20020a05600c22cf00b003fe2de3f94fsm19249458wmg.12.2023.09.06.02.59.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Sep 2023 02:59:38 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, deller@gmx.de, daniel@ffwll.ch,
 sam@ravnborg.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 3/7] fbdev/core: Fix style of code for boot-up logo
In-Reply-To: <20230829142109.4521-4-tzimmermann@suse.de>
References: <20230829142109.4521-1-tzimmermann@suse.de>
 <20230829142109.4521-4-tzimmermann@suse.de>
Date: Wed, 06 Sep 2023 11:59:37 +0200
Message-ID: <87il8n4o6u.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
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
Cc: linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Fix a number of warnings from checkpatch.pl in this code before
> moving it into a separate file. This includes
>
>  * Prefer 'unsigned int' to bare use of 'unsigned'
>  * space required after that ',' (ctx:VxV)
>  * space prohibited after that open parenthesis '('
>  * suspect code indent for conditional statements (16, 32)
>  * braces {} are not necessary for single statement blocks
>
> No functional changes.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

[...]

> -	static const unsigned char mask[] = { 0,0x80,0xc0,0xe0,0xf0,0xf8,0xfc,0xfe,0xff };
> +	static const unsigned char mask[] = {
> +		0, 0x80, 0xc0, 0xe0, 0xf0, 0xf8, 0xfc, 0xfe, 0xff
> +	};

I didn't know that checkpatch.pl complained about this.

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

