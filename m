Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3138AA3F0E5
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2025 10:49:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F98910E048;
	Fri, 21 Feb 2025 09:49:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="c9gh28lr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E096110E048
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2025 09:49:53 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-4397e5d5d99so11693285e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2025 01:49:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1740131392; x=1740736192; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=a+bqdYT2vB++aLYRe6uuUn4Zzo34myKw/ce5O2MaFJ8=;
 b=c9gh28lrZAgFWlPt/aHEbhNISPHWCn2jyoNwZQUDRzHzWVKYKOsVOiZatsm/O2azFi
 uOyIetr7Gtt8CQgn9+VvjOe22/5A3h1onG8OKMQpqJ6yJ8iN/apx1Q96oCDjs6OPSQOj
 hPBpoOvHiZKrJfVVAtf60jT2w+Vfd143Qv+1Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740131392; x=1740736192;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=a+bqdYT2vB++aLYRe6uuUn4Zzo34myKw/ce5O2MaFJ8=;
 b=eua7Gz7wE+jDMEMbBAmpOw1O9+3UI6Xmj2hdE1Wn4gEoQJCYKhDUV9GHh2JycYf8y0
 kI3AUnblIH75EAHsrSIORmmLOX0ZaNUJ/J/qc6oT9PciZcnAyZqaB8OrbFBB7dSNRCm5
 p4yq5xS52nSkV69wI86C6LT1h3SxMW0SsU0WKONuyuzT4t+5VhH01tqSmbQMvQ4xfXAM
 7VM3jndU++QhCn1UFBAOQHDIAJ6nYmc17U6ixKQLUZ9Nt1XFklX6KnsbfQpYDfNcAYlp
 596Fkoop1Opafu8cM5Fryjyk0a6ULEsp7npYgsPvGUG2XXNG2jPJZdQqgmmZYu75dCFf
 sB4Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWgxy4HcG/6imEwTczHIeNGJTgi1v9fVXYfUhsXFIvSCvSPRTyymxRNv5Fc63XtoRjqz62Gm+Viid0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyKV/XeTYwbRr52bofU8uuxEP/f4RHQYEu/xrgf36AVeyx1Cr+M
 ghCposneOgjuHai9U918MqSK8Wh1vFinM611QLWLa9+Fvz0tAPVZoGwwZG3GF8w=
X-Gm-Gg: ASbGncsZMdjKBsUv/KQr3UGz575fQG+BHHC2fbkPxyZE9mq0xilyLyQdUVMlpwQSPFj
 QyyrLv1rv33A1lGv/6gKSYRiL06ogRREPzPG+ARKvyFY2tyk2F1GoRFRHFDV8cjTINofYEWd/TH
 +r/yoPbNXJSw6vsxlaLWTEtq5nJbRxqImhaCKUgXIJlFfAPoXVZ6w0y5/FC8GOn5hoi4MjSxLIb
 N4RTV8Z47mrPClVzNf7+5o9ao8GAnXLDBvTcVuFrUEwiRr+K7GdsKrSmrreIZKp5lFDlfarvmjc
 pSBBVXd2xR4PmMnnNBVXv0QmUcHm7kIa9HbVCQ==
X-Google-Smtp-Source: AGHT+IEmJ5MipungHbiWmtpuUqPEucmYmkgvTIqBEX4X1VrM8Q8aJe0Kqf+wyOXqX27kcNvBWgGf0Q==
X-Received: by 2002:a5d:598c:0:b0:38f:48ee:ddb1 with SMTP id
 ffacd0b85a97d-38f6e95d5e2mr2850300f8f.18.1740131391626; 
 Fri, 21 Feb 2025 01:49:51 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f259d5eeesm23289252f8f.63.2025.02.21.01.49.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2025 01:49:50 -0800 (PST)
Date: Fri, 21 Feb 2025 10:49:48 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Raag Jadav <raag.jadav@intel.com>, arnd@arndb.de,
 andriy.shevchenko@linux.intel.com, airlied@gmail.com,
 simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] drm/draw: include bug.h
Message-ID: <Z7hMPIxFyd6cqbC0@phenom.ffwll.local>
Mail-Followup-To: Greg KH <gregkh@linuxfoundation.org>,
 Raag Jadav <raag.jadav@intel.com>, arnd@arndb.de,
 andriy.shevchenko@linux.intel.com, airlied@gmail.com,
 simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250221050804.2764553-1-raag.jadav@intel.com>
 <20250221050804.2764553-3-raag.jadav@intel.com>
 <2025022135-aviation-evident-2518@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025022135-aviation-evident-2518@gregkh>
X-Operating-System: Linux phenom 6.12.11-amd64 
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

On Fri, Feb 21, 2025 at 07:05:12AM +0100, Greg KH wrote:
> On Fri, Feb 21, 2025 at 10:38:04AM +0530, Raag Jadav wrote:
> > Directly include bug.h for WARN() helpers instead of relying on
> > intermediate headers.
> > 
> > Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> > ---
> >  drivers/gpu/drm/drm_draw.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/gpu/drm/drm_draw.c b/drivers/gpu/drm/drm_draw.c
> > index cb2ad12bce57..0a0e1eebf481 100644
> > --- a/drivers/gpu/drm/drm_draw.c
> > +++ b/drivers/gpu/drm/drm_draw.c
> > @@ -5,6 +5,7 @@
> >   */
> >  
> >  #include <linux/bits.h>
> > +#include <linux/bug.h>
> >  #include <linux/iosys-map.h>
> >  #include <linux/types.h>
> >  
> > -- 
> > 2.34.1
> > 
> 
> Does patch 1 break this file without this patch so this series is not in
> order?
> 
> I'll be glad to take patch 1 in my tree, but I don't want to break
> anything else.

Yeah looks inverted. In case this is all there is I'm happy to land this
patch through your tree, that seems like the simplest approach.

Acked-by: Simona Vetter <simona.vetter@ffwll.ch>

Cheers, Sima
-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
