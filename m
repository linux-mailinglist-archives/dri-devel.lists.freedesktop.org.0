Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AA1AACE077
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jun 2025 16:37:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A544D10E710;
	Wed,  4 Jun 2025 14:37:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="JWyEeedW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E2AF10E710
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Jun 2025 14:37:31 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-451d6ade159so34643215e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Jun 2025 07:37:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1749047850; x=1749652650; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tZUBKc30vw5SwfnkHXPZNMm/Ylyi+Jo+Sq09IMYtHNI=;
 b=JWyEeedWQAhhjORKmF+T27QsOmlMEOMix4hKzMDkjx/NwJtMzZ2pbsubajwV517LL7
 mSd6oTb3ANiZIK5T1tYz/ByQy7CmlJDF0aQ4X1el6hV2DkaiPv8B2q/IaPo9qFm4qvpU
 P06BUDCI67KBTcU/f8BfLq6NSE8v7zAv4fPCo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749047850; x=1749652650;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tZUBKc30vw5SwfnkHXPZNMm/Ylyi+Jo+Sq09IMYtHNI=;
 b=K2ftEGzUb2DR6b0OsGq+IqZB74ug0pkFUvAAh8yDv9r7YlSaWCgz5WoR86xs1coiRx
 NSwHtD2fR+weKHlJEsgjSPdVKSPnzziAcIIjvToXDfr2l8DXfcacHSm+lNw8UWTClbQv
 gDdqyDE30viVtmmn19+oEAI3i/s3H+B6RL5JQSmaucuxY1PJ0ttVC8qRDrYw9g9+kakZ
 xyDalcU+oSIGjGfsKq5jjI/zl5ev8iAHXRSjzm5RHMLNpMoJYf5KBV0orrz5o7hL3BFv
 HuAdvtx9QY1DM7KbF8mYHnQu1YhkMNi73Xs3y8PJC7YjewdZr042JKUUvutp8+ZlwxZ1
 CZiQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXxySWzWgqxFnHddMRjYpYm8HLEtRLLkYpLSmreBut5JOz5IR0i5Ze5FDo1rupR81camXH0gbMS4bQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzpvUsk73sX/7JQDsyooG72EQ3DCBX9MlSrmbEIVTFGcMTzTRTX
 le+dMyZCS2eJGfNjCQOFQ4d698OVUVmypTptguBp05XajoLR9KSdMKHep+i4eOAWZ5U=
X-Gm-Gg: ASbGncuMBhwn7UaIlxVbbbVWQzuulla9O0yb3362cYwzzOVB65ZFGDstypIl9ip3mEI
 GMnw0gmycIrLXZVYFIDjoSsYjMUw4QQnNvkNqPBkQRTHar/zDapWDdZvOro3L8sMul/GWvrSc8M
 xB7k++cExRgl6v3kqV5l0wzWkS38TidVsqCNeNmlSwJ0AhZq13t62Yyp/0hA76qLoIya0EPvSa/
 jvwAzE20eKkU1KcQvWu9VWNucG65TnUCJQfL+QtuBErgp255pbQAWFWSHPXH4YRk0SQGjLS4iTm
 P+VJ/SW4Dq/wRflww1wvQfi5UFGISaPOJsd6jHDOGcLVmBUKYwXDaQZpsaoQwQKjupLXpt9XQHr
 wvo9TcIdm
X-Google-Smtp-Source: AGHT+IF77XDVBkS67KTLmSK0T5wkUceKrc8aauvlRs0sDvEgKEf7a7UPbdimhlaAcpzc3R8z8tPcyQ==
X-Received: by 2002:a05:600c:1548:b0:43c:f8fc:f697 with SMTP id
 5b1f17b1804b1-451f0a72bf1mr31835005e9.9.1749047849792; 
 Wed, 04 Jun 2025 07:37:29 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-450d7f90c40sm204287965e9.2.2025.06.04.07.37.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Jun 2025 07:37:29 -0700 (PDT)
Date: Wed, 4 Jun 2025 16:37:27 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Abdulrasaq Lawani <abdulrasaqolawani@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Corbet <corbet@lwn.net>, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] drm: add overview diagram for drm stack
Message-ID: <aEBaJ5zMHfzhpdlz@phenom.ffwll.local>
Mail-Followup-To: Bagas Sanjaya <bagasdotme@gmail.com>,
 Abdulrasaq Lawani <abdulrasaqolawani@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Corbet <corbet@lwn.net>, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250601-drm-doc-updates-v4-1-e7c46821e009@gmail.com>
 <aDz-Pq4eMAYmzqsJ@archie.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aDz-Pq4eMAYmzqsJ@archie.me>
X-Operating-System: Linux phenom 6.12.25-amd64 
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

On Mon, Jun 02, 2025 at 08:28:30AM +0700, Bagas Sanjaya wrote:
> On Sun, Jun 01, 2025 at 06:18:47PM -0400, Abdulrasaq Lawani wrote:
> > Add an overview diagram of Linux DRM architecture for
> > graphics and compute to introduction.rst
> > 
> > Signed-off-by: Abdulrasaq Lawani <abdulrasaqolawani@gmail.com>
> > ---
> > <snipped>...
> > diff --git a/Documentation/gpu/introduction.rst b/Documentation/gpu/introduction.rst
> > index 3cd0c8860b949408ed570d3f9384edd5f03df002..a8d3f953a470180b395ec52a45d0f3f4561424e0 100644
> > --- a/Documentation/gpu/introduction.rst
> > +++ b/Documentation/gpu/introduction.rst
> > @@ -14,7 +14,45 @@ including the TTM memory manager, output configuration and mode setting,
> >  and the new vblank internals, in addition to all the regular features
> >  found in current kernels.
> >  
> > -[Insert diagram of typical DRM stack here]
> > +Overview of the Linux DRM Architecture
> > +--------------------------------------
> > +::
> > +
> > +        +-----------------------------+
> > +        |     User-space Apps         |
> > +        | (Games, Browsers, ML, etc.) |
> > +        +-----------------------------+
> > +                      |
> > +                      v
> > +        +---------------------------------------+
> > +        |    Graphics APIs   |   Compute APIs   |
> > +        |  (OpenGL, Vulkan)  |  (OpenCL, CUDA)  |
> > +        +---------------------------------------+
> > +                |                   |
> > +                v                   v
> > +        +---------------------+  +-----------------------+
> > +        |  User-space Driver  |  |    Compute Runtime    |
> > +        |  (Mesa, AMD/NVIDIA) |  |  (OpenCL, CUDA, ROCm) |
> > +        +---------------------+  +-----------------------+
> > +                |                   |
> > +                +--------+----------+
> > +                         |
> > +                         v
> > +                +-----------------------+
> > +                |   libdrm (DRM API)    |
> > +                +-----------------------+
> > +                          |
> > +                          v
> > +        +-------------------------------------------+
> > +        |     Kernel DRM/KMS Driver (i915, amdgpu,  |
> > +        |     nouveau, etc.)                        |
> > +        +-------------------------------------------+
> > +                |                       |
> > +                v                       v
> > +        +----------------+     +-------------------+
> > +        | GPU Display HW |     | GPU Compute Units |
> > +        +----------------+     +-------------------+
> > +

I'm a bit late to the party, apologies. I'm not sure how much use there is
in an extremely simplified diagram like this, least because it's really
incomplete and leaves out the entire display and compositor side.

My idea was that we'd instead link to the large pile of introductory and
overview talks further down in this file, if people want to get an
overview over what drm does.

If you want I guess you could add some links to the relevant wikipedia
pages, I think they also do a fairly decent job of explaining the big
picture.

Thanks, Sima


> >  
> >  Style Guidelines
> >  ================
> > 
> 
> The patch LGTM, thanks!
> 
> Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>
> 
> -- 
> An old man doll... just what I always wanted! - Clara



-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
