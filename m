Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A70E387EE56
	for <lists+dri-devel@lfdr.de>; Mon, 18 Mar 2024 18:04:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2AB410ED94;
	Mon, 18 Mar 2024 17:04:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="A9YYFH75";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0600710FB6B
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Mar 2024 17:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1710781476;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2Ft26s8DeLb5OoGn9UtyEk5lh1rI2qsUcl1cS7Zp6Cc=;
 b=A9YYFH75B21JMoJUcLvoFDEq9hC1q5+YfdmIoFpdTWJDh+Vw34b26HSV9TABchwZMDnXkP
 u9+VPaVURVRgiyewmJRpPpFcaYkqimn8+VwHtQhxKlqitl/1C9f+9eZoEOZKCM+UWVvHbQ
 LfWyt1tNOd18ZziAjDXW8ydzbFZ9qlc=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-693-ctLG68BaODOK7hvWpA1h4g-1; Mon, 18 Mar 2024 13:04:34 -0400
X-MC-Unique: ctLG68BaODOK7hvWpA1h4g-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-40e53200380so21750855e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Mar 2024 10:04:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710781473; x=1711386273;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2Ft26s8DeLb5OoGn9UtyEk5lh1rI2qsUcl1cS7Zp6Cc=;
 b=HeqsL8MZd6zJfH+x7K/9TePh+q7dPYt6Gfe18vAS59hQprZzwMxlCKSkZI+yFsdDgk
 3Xc6JN/hA2d2N03CS9WZaKww35hIFA91sABD/TFuq3dlaVMOb41jt0Ly+FaqUtKs8jCw
 iZXsJG6CQQQAE2pjW+GSW7YPENxtUJjJB+TAR+G53jrKKUgr4eGQnSgQFux+KgTWcUdV
 Q2yemxYxaTJyM1HdKrjeSKJbb2sCtahgXP6XV5kzFFzVLU+HpVz+gBRkgEIx5tlZgqWm
 XEC2Cw55pfoQnOFFAtwKW2cSb+FT/bN9PvVswTcsnS/ERwvC0XjIjw9+xhbyRnN7W/gn
 Vihg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVpUXmIZGGCuNFjeqmI6IZA73Br9xcVT3NS72mUv7OmEqQinIpXGF0lG3W2mSDmcN+4A9u5kniTJXcozcrM5rGmKloTOr5ct+lMlDqDAS+J
X-Gm-Message-State: AOJu0YxjlgtgzBDJ7YNxby5dpK0gOmtzwvtRvyblDY05dOrMOVj7MHUf
 uyVOvSJnzhumwsOH9TYE6gjwviLik6FRofRNyU+iU36guKijhFChhdDeA3Ay6nx1rMWNWIYfpwg
 9/KXfoiF38C+niFlkSxBN6ug/vaol/Gv/CzCAcDH+VPNVm8e8eobnEYkjTXca7pz1Hg==
X-Received: by 2002:a05:600c:4594:b0:413:fc09:7b19 with SMTP id
 r20-20020a05600c459400b00413fc097b19mr7956414wmo.40.1710781472897; 
 Mon, 18 Mar 2024 10:04:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFFpz8rw3Vm3P8fHHmgq5SqnYJ0Z8VtX3WpKFJXPoxMtawtCQx73DL9mwoNSNZZJc5Jb5NMjQ==
X-Received: by 2002:a05:600c:4594:b0:413:fc09:7b19 with SMTP id
 r20-20020a05600c459400b00413fc097b19mr7956392wmo.40.1710781472466; 
 Mon, 18 Mar 2024 10:04:32 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 u10-20020a05600c00ca00b0041404efa323sm3379084wmm.0.2024.03.18.10.04.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Mar 2024 10:04:32 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, deller@gmx.de
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, Thomas
 Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 06/43] fbdev/deferred-io: Always call get_page() for
 framebuffer pages
In-Reply-To: <20240312154834.26178-7-tzimmermann@suse.de>
References: <20240312154834.26178-1-tzimmermann@suse.de>
 <20240312154834.26178-7-tzimmermann@suse.de>
Date: Mon, 18 Mar 2024 18:04:31 +0100
Message-ID: <87msqvfp40.fsf@minerva.mail-host-address-is-not-set>
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

> Unconditionally call get_page() after looking up a page from the
> framebuffer memory. Guarantees that we always hold a reference.
>
> This change also refactors the code such that it can support a
> driver-supplied get_page helper. This will be useful for DRM's
> fbdev emulation.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

