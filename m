Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6384087DD46
	for <lists+dri-devel@lfdr.de>; Sun, 17 Mar 2024 14:20:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBEDC10EB86;
	Sun, 17 Mar 2024 13:20:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="O3NgMFpj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4653510EB86
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Mar 2024 13:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1710681650;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QwO1WNpY4kgJDb0WwGY+sqWsYzQhy8OfNcg3mH4HAjg=;
 b=O3NgMFpj21RyYgcbEbSKylVBtnHecuJDqGhO7DdevnUtF4yavZGT7NFl3Ypvqc0Y8Q8/cG
 9Z1tfJbBX4F73tBUkR/E8vM10VTZcknqFRSYxvomF2iD3Yd/ThOrEzJw3apBP4PeUq3tvT
 Tgh9bvt6BFqRS7Rhbp0wfF4+btaJz10=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-414-AVYqJpYKMnW2h5fzUu4neQ-1; Sun, 17 Mar 2024 09:20:48 -0400
X-MC-Unique: AVYqJpYKMnW2h5fzUu4neQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-4140d2917e6so2109165e9.0
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Mar 2024 06:20:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710681647; x=1711286447;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QwO1WNpY4kgJDb0WwGY+sqWsYzQhy8OfNcg3mH4HAjg=;
 b=AGae62b82PdBQPerv82R+32UXRuPBb50ipNWrEWc496PUaEFHlRZ/+ionbRLK+S8zw
 nI/7843dDVG4ocLvM+OFXPgzT+GNODvVBChOudyCOdPIovHOpZUmRpzkkDD5lnBm0jNW
 l9Nyd3JO7aCghYV+CHMTK4tNk3CImSdC3gDg6tQluBCCtqg17eGzs37uGxS0wayfMwEX
 56Xbw3Pt//aIeRPDUmjPE3uPaO9vOhJuuUByFi3oxZ0oEivqiFa/z/oLiI0xOW/8OmMH
 iWOgE+YDx2CU04oz7pWSrLiE3ta/mMGzZ0q3cx0w2Fe5BgFd6R6OGLXhRmgm4xwL26et
 mzkA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVqVUJzLRmVdjaKKSFYPAt1v8cBmw36RgEC3ffQCTRu87PySCFgcrgy+u7C6up+N4KxZhpUZPiLiUmSCFaugRGOa+ALyIqIZ5aSYSJPt+jO
X-Gm-Message-State: AOJu0Yxd+o9CRPy4dLOjr4UNM+YR5e1fz0Glwq84B5aG0gvVfcCK7cRl
 +ROCCFT4wMkjkrznXnwzbbToipdxZ8h93Afzm51paasqzuKWuhbuuoqT4SLpIIhDpcKzK53/CS+
 mI7j8OoM1tpZ8Et+cvfNhFDvXxtWql6KtGO1YbJ84GM16gTPPAzz+dm8vaevoR42bTkHbKaYQCA
 ==
X-Received: by 2002:a05:600c:a4c:b0:414:8d7:682f with SMTP id
 c12-20020a05600c0a4c00b0041408d7682fmr2341747wmq.10.1710681646726; 
 Sun, 17 Mar 2024 06:20:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGp+q9l+i4tLdNP8KFivFrjXsPOLlFMcc5f5w5rWdLw81lrvt1KyPuMqCnXrg2wRf0UqNhVWA==
X-Received: by 2002:a05:600c:a4c:b0:414:8d7:682f with SMTP id
 c12-20020a05600c0a4c00b0041408d7682fmr2341736wmq.10.1710681646306; 
 Sun, 17 Mar 2024 06:20:46 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 t15-20020a05600c198f00b0041312c4865asm14913638wmq.2.2024.03.17.06.20.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Mar 2024 06:20:46 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, deller@gmx.de
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, Thomas
 Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 04/43] fbdev/deferred-io: Test screen_buffer for
 vmalloc'ed memory
In-Reply-To: <20240312154834.26178-5-tzimmermann@suse.de>
References: <20240312154834.26178-1-tzimmermann@suse.de>
 <20240312154834.26178-5-tzimmermann@suse.de>
Date: Sun, 17 Mar 2024 14:20:45 +0100
Message-ID: <871q89gfki.fsf@minerva.mail-host-address-is-not-set>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Framebuffers in virtual memory are available via screen_buffer. Use
> it instead of screen_base and avoid the type casting.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

