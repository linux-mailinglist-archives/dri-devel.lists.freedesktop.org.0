Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6BE4933AEF
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jul 2024 12:08:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C56D10EA54;
	Wed, 17 Jul 2024 10:08:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="h3G7xFXx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D22C10EA54
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jul 2024 10:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1721210915;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xjkUyUot20NGrY9ZFrQg4iD0i6JztFTd/ok1J4HNwDY=;
 b=h3G7xFXxMUxdBYH4Y/R4wTSicsuwvUANbuSEN+yrHg4l9IrBoJCsqw53wcR5KZ0F4RlHLs
 0hKvcL/eCJS02hQtlTqTLcuBziRYNyW0NWZtQtm10fmkRkZRFrOPQK8Am02h4BwBgFDlWx
 Miq1pa0JDP4Ayv/DaYbWp26TZdjbDd8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-70-KtXBADJLNbaIVym4nF03kg-1; Wed, 17 Jul 2024 06:08:32 -0400
X-MC-Unique: KtXBADJLNbaIVym4nF03kg-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-42725ec6e0aso49723595e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jul 2024 03:08:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721210911; x=1721815711;
 h=mime-version:message-id:date:references:in-reply-to:subject:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xjkUyUot20NGrY9ZFrQg4iD0i6JztFTd/ok1J4HNwDY=;
 b=nhbpyTux0tK0gaPawRnek1Lxxpv3wK1wUt7pNaZy88rwlh1oXslCBYo9sU2YyFwKpu
 fJF9Y149+ba0QRuUtG72pf3Kmf/ClSvzpdq/FY6UOXcDfAdFeDsBuppQHFkU2ujZv0wP
 Zu7GnQrgjVkHac23KedXXd3BX2ISq/HP1AYFtppPsTkH1JmyaHgpXK9G+YWhokhSo7Un
 IPvWumMSfuXhxBp4RCVNlhbXEzW8DJqCYhxizSh7B67xDsfrXqRz5DSJ8xtATe8FD3Ot
 Ys0RsMIQFuITk5xFWUFjwuq0H6nfl2Gvq6imYFgahaDyaK9JEArZI52rwNIhy/7S/V0y
 Xgyw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXAytVJTKUcmveOAldJT2o2/T1JDoZEy4X/mIGvThYT4+0Oi3XNq/QRR9x4fGlQ8mkCFo1P+ToScBvAjEFXu5EcnvGdAOCgy0EuNo3/LeX9
X-Gm-Message-State: AOJu0Yw2sh8lhuChSTlSiLG9HIVjsSXymiCM5IOxAyeU2aEXSoyYbgBn
 MCUw8LMNXRxi7SB/CKZBeeacUTuOAf9aLTNxB2JYR553NQi16o0jZ6jqyWbf2JIorJNE3557OZG
 vmYdjQAghag8bTqiB/AUwuA0L+Tyjy8gumYp0JYwBUhIeb4nCT7yrKM76Wt5ljpDZtA==
X-Received: by 2002:a05:600c:1c21:b0:426:4f47:6037 with SMTP id
 5b1f17b1804b1-427c2cc2f5bmr8604515e9.19.1721210910880; 
 Wed, 17 Jul 2024 03:08:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHkUSxu2VeixFnYHEIPInPCJHTDc3WCGL4pCgRh1eLivnZ8ZCPxQEJHjlvcn3WW+HuqhF4hlA==
X-Received: by 2002:a05:600c:1c21:b0:426:4f47:6037 with SMTP id
 5b1f17b1804b1-427c2cc2f5bmr8604225e9.19.1721210910486; 
 Wed, 17 Jul 2024 03:08:30 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3680db038dbsm11135956f8f.95.2024.07.17.03.08.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jul 2024 03:08:30 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Jocelyn Falempe <jfalempe@redhat.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Helge Deller <deller@gmx.de>, "Jiri Slaby
 (SUSE)" <jirislaby@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH 2/3] fbcon: Add an option to disable fbcon in panic.
In-Reply-To: <20240717090102.968152-3-jfalempe@redhat.com>
References: <20240717090102.968152-1-jfalempe@redhat.com>
 <20240717090102.968152-3-jfalempe@redhat.com>
Date: Wed, 17 Jul 2024 12:08:28 +0200
Message-ID: <87zfqg49gj.fsf@minerva.mail-host-address-is-not-set>
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

Jocelyn Falempe <jfalempe@redhat.com> writes:

> This is required to avoid conflict between DRM_PANIC, and fbcon. If
> a drm device already handle panic with drm_panic, it should set
> the skip_panic field in fb_info, so that fbcon will stay quiet, and
> not overwrite the panic_screen.
>
> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
> ---

This makes sense to me as well.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

