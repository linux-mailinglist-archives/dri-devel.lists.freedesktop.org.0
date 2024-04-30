Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 181DA8B6D7F
	for <lists+dri-devel@lfdr.de>; Tue, 30 Apr 2024 10:55:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B13610F6B4;
	Tue, 30 Apr 2024 08:55:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="PSYD6VrK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83B6110F870
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Apr 2024 08:55:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1714467323;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=B6unb6s6Cmj8rBNMoCe2bes/qPSr8qRmhQ3+wiG2C4o=;
 b=PSYD6VrKBSGe5BJLh0HS+YOBw3BbzEMByf+J2lgblEQhly/iWbEUh4fbtC0sItlDmu5Vyj
 yNA9BktlXFbldMrU8LkY9EGqubmWJwLJScGr7QDi0D6ToYmabSpUesdX1sB8fJcBXMbeIG
 z3dSl1cJXR8UDVxj5zasPn6KMo4/2LU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-223-M5xIP9PpM7WigjKmM7hpTA-1; Tue, 30 Apr 2024 04:55:21 -0400
X-MC-Unique: M5xIP9PpM7WigjKmM7hpTA-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-41be609b854so12988705e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Apr 2024 01:55:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714467320; x=1715072120;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=B6unb6s6Cmj8rBNMoCe2bes/qPSr8qRmhQ3+wiG2C4o=;
 b=kHabey3SvgxzK9YPjcfiwbhrJvgZbPBB5ZGqeRbPsUs7aWutMHakQaYCeDJ5cpF5er
 4rX2QdhK0TtdzZpGYEXHS6GOQTjxljgJjBeQDHnSdFQm+ZgK8Ex7K126/XY33BpwFn3o
 wBrz9zIuR83eLN2ScD1JTC7dUtiChqhPKsf67k6sMH8LIJU8fXSx1+LAr/NArjJv+jAc
 KMgB8c3Peq6N5fPAluC5FeUbHmQNS57ki8YDx8R9sz2WHBQEZ8MyO7j86YdLRgxnRiJt
 cRXEisd5ixW5KkSDlRLQqKSqEaOT5Od7355GHT8nx9RyrF/qQj0q8uLYnGWI+XupQY2Q
 jqfA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWjD+dSQhtJpXduidmXciFKCjUrWPu943z5JuVjqBb+us9V8waBUJXT6Huq7+XGcX//F41grASl14/8mgafkWNNNqkwkxEaM+GOxp0JCGPF
X-Gm-Message-State: AOJu0Yz4rtPwZmf9QbrN6BoSEt8f9Opon/xtrc7a/0L9qC9WnZ5CSiCK
 I945lX/qkYohsqoIkVzaNpd3KMZftO4Jxh77ougU0d7smEPG9HDBQJYj9KjolrPhZbweOHIxwzA
 FxT32kkWKgQHgxWSKL8yl7u+8dJKDhnaR3SOqiV542Ri/Zhap247nQMkzWwnKlXlgKAKYY1X5dw
 ==
X-Received: by 2002:a05:600c:3c93:b0:419:f4d6:463b with SMTP id
 bg19-20020a05600c3c9300b00419f4d6463bmr1757027wmb.14.1714467320177; 
 Tue, 30 Apr 2024 01:55:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEEdE5TEKU0GpJmQYJr3e/q45cglrdwO3iKp6S5W1h1cvmfgN0dBHxnX5cz49Oz4I88Ela3ww==
X-Received: by 2002:a05:600c:3c93:b0:419:f4d6:463b with SMTP id
 bg19-20020a05600c3c9300b00419f4d6463bmr1757003wmb.14.1714467319674; 
 Tue, 30 Apr 2024 01:55:19 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 fl23-20020a05600c0b9700b0041bc41287cesm12970758wmb.16.2024.04.30.01.55.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Apr 2024 01:55:19 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: Re: [PATCH] drm: deprecate driver date
In-Reply-To: <20240429164336.1406480-1-jani.nikula@intel.com>
References: <20240429164336.1406480-1-jani.nikula@intel.com>
Date: Tue, 30 Apr 2024 10:55:17 +0200
Message-ID: <874jbjtekq.fsf@minerva.mail-host-address-is-not-set>
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

Jani Nikula <jani.nikula@intel.com> writes:

> The driver date serves no useful purpose, because it's hardly ever
> updated. The information is misleading at best.
>
> As described in Documentation/gpu/drm-internals.rst:
>
>   The driver date, formatted as YYYYMMDD, is meant to identify the date
>   of the latest modification to the driver. However, as most drivers
>   fail to update it, its value is mostly useless. The DRM core prints it
>   to the kernel log at initialization time and passes it to userspace
>   through the DRM_IOCTL_VERSION ioctl.
>
> Stop printing the driver date at init, and start returning the empty
> string "" as driver date through the DRM_IOCTL_VERSION ioctl.
>
> The driver date initialization in drivers and the struct drm_driver date
> member can be removed in follow-up.
>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>
> ---

I never understood the value of it and so this patch makes sense to me.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

