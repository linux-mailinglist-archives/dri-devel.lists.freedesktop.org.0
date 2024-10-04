Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D529898FEB4
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2024 10:13:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D800710E1B4;
	Fri,  4 Oct 2024 08:13:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="LyIdjUEd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E365710E1B4
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Oct 2024 08:13:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1728029613;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NpYh7CaaC2KedHFZZYXaVZ0k0qPF+A1BsqzYj4Bl5RY=;
 b=LyIdjUEdLDqlPQ38J+7aHSqs7/04TfAhCvxYoWCKKvNJZWo2fF/3CZ3+QYFhehMiVmbPI+
 oNWHhFW1t9CZoKSzwGlZg0gEiXQggwmzYRGIoxzaoe9Gd+9bqWEHXUkfUNGW0X5l5iR6Wi
 eUH1v0CB28a+7qDSqX8XKQqkZpEDSOE=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-164-6Pc6Ju_-NUSexYeEneiBtw-1; Fri, 04 Oct 2024 04:13:31 -0400
X-MC-Unique: 6Pc6Ju_-NUSexYeEneiBtw-1
Received: by mail-yb1-f197.google.com with SMTP id
 3f1490d57ef6-e287876794aso2643952276.0
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Oct 2024 01:13:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728029611; x=1728634411;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NpYh7CaaC2KedHFZZYXaVZ0k0qPF+A1BsqzYj4Bl5RY=;
 b=LZ+zK4r3ZFjBCDX1XWM/8hB35j8o3dq3Y+JbRe4ylLwgZIMHonlR84e8biLeX7vd5x
 535XhFlrS/eHCRbfq8l4SvWFwAyv2LHyF9ROqDNUIyqna5bzEvVkAPEPRKJRBMRHoCdz
 OZalgyMOjdRRzFsOX5RR740dcJx2+KQe4u++HmkOGUZfsnUdfSfkheW1PPYUy/Rz9IZj
 7yMLrq7zv5p2+21Tr41OIvl0BJbx0uSLMPoNozQxK9nERUeEFdw3+p8+sKeAZLYL7rgP
 JTLDXTL+xTIIXyqNZNQmnL16B0pzE411OFNVssbP97u6vg9xp8J6RSxe3QdW/u5v1gI5
 6/xw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXM7T65u4reby7nxqmk+igfUO6dCsTNdZd+3NfgKJsfDVSY5c8MDV6DpyFZHFWgDNxJ53fWXgTtIOQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxuoywB8A+UCSwEPMFAvCOSqPyLeJ9pVH1BlaJkYXYsqCEo5/mG
 DZvFSMFiStLQs9PzbK573tg7xpdCgGVB5ph74gZxpIOzTYaJy7lEFkB0U7On4JLWxLmNo0uHdey
 ot6OEGGr0mG2PZyjvBZKWMLzDPliuqvfZP+T7DoZ2JYOmaBvfscThhkoPMXAk7/Mtyw==
X-Received: by 2002:a05:6902:2507:b0:e26:1190:8fe0 with SMTP id
 3f1490d57ef6-e28936d5653mr1267265276.17.1728029611222; 
 Fri, 04 Oct 2024 01:13:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEK5NlqbQGEp0Ckx0DC5l7AAujsY01ZLTLP3SLW77axNkOTOrjPPpu8ShJ+Oi/XIM1S/ke/HA==
X-Received: by 2002:a05:6902:2507:b0:e26:1190:8fe0 with SMTP id
 3f1490d57ef6-e28936d5653mr1267251276.17.1728029610859; 
 Fri, 04 Oct 2024 01:13:30 -0700 (PDT)
Received: from localhost ([195.166.127.210]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7ae6b3dae76sm116919385a.113.2024.10.04.01.13.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Oct 2024 01:13:30 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, kraxel@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch
Cc: virtualization@lists.linux.dev, dri-devel@lists.freedesktop.org, Thomas
 Zimmermann <tzimmermann@suse.de>, Kees Bakker <kees@ijzerbout.nl>
Subject: Re: [PATCH] drm/bochs: Return error from correct pointer
In-Reply-To: <20241004075404.41743-1-tzimmermann@suse.de>
References: <20241004075404.41743-1-tzimmermann@suse.de>
Date: Fri, 04 Oct 2024 10:13:27 +0200
Message-ID: <8734lcnv4o.fsf@minerva.mail-host-address-is-not-set>
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

Hello Thomas,

> In probe, return the error code from the variable bochs, not dev. The
> variable dev has not been initialized at this point. In the case of an
> allocation error, the returned value would have been undefined.
>
> Reported-by: Kees Bakker <kees@ijzerbout.nl>
> Closes: https://lore.kernel.org/dri-devel/8c5bfc12-cbcc-4102-9826-494060df4179@ijzerbout.nl/
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: 04826f588682 ("drm/bochs: Allocate DRM device in struct bochs_device")
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: virtualization@lists.linux.dev
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

