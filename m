Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 131618920A9
	for <lists+dri-devel@lfdr.de>; Fri, 29 Mar 2024 16:41:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33BAE11279C;
	Fri, 29 Mar 2024 15:41:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="P9xVApaU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
 [209.85.210.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A76E611277D
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Mar 2024 15:41:10 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id
 d2e1a72fcca58-6ead4093f85so2010539b3a.3
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Mar 2024 08:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711726808; x=1712331608; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
 :reply-to; bh=iN31wd2vCkiTGMz1OBtEaB4JW8VyiA1XbISlyEebr3E=;
 b=P9xVApaUt4ITpSbD6GUF/hKjNqLLIjHQwv9sPhKvbpcIx/psDElEk5uHMR17uo6wId
 SeypIc9ZmihjHb09IUrfqFni2TX0F7i7Zj7OXi3vR/lVbuh7Yc2VXPw1usYp1eJMZ48F
 SSiLrmXayPSbk0UoAD+gxlHni1ZEK3X/DjYjDmTu3HffZaxTnQ5rvvwxT5KzcljPXfxR
 y9c5THrowy3k3XiB6hNEcOo0VFX5ZIKwSnDpXrvpZTufkAeSZyhhV9/PgSoN4/TzzU2x
 BC7DVDTF7rR4bt6GwXIDqiMfs3bm+i7oV9vLNKT54jsI/tr7EBgAiZIwQ07DzxQQ7Xwz
 gqoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711726808; x=1712331608;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iN31wd2vCkiTGMz1OBtEaB4JW8VyiA1XbISlyEebr3E=;
 b=LMtAPF31E7pToZzxfys6Z/eT+di66l1OID+hz55/GU25ngrCJ9yj5tdYu3h4LSJded
 oMtWab38Im5AN0J+YQFTj3TwXoU1HDPFM70xxT10xUZzvEUo5D5mbjrszKm59nwY7Y63
 JpOSiElRkrMMVIjmpAVWBy/pnuBsQbA4MbRq4VtAapJuFOJ25DiGiyTdyigvYyqqPwaG
 pn/wC0MPqosayFlagp3Qkz9qM4v3Dcjwkr+JJsa0nXpedxnczvdvxMZ+L52pJhumVInz
 c1ZaYUvSOMOjW1MKzo/1J9noiBUycU9ohBxMFgpAluzirER3Ivl0fG875lelSUptFnsm
 XWAw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUsPucA6mv/3OfBqrRHFowAyS9XR3vOl19jZTCwAr2ZEp4z265bEGLqTDO5FpDWbaD38K7p3J1JH+as6OppyH0Op9VeJOC+EPi/sriN/jeU
X-Gm-Message-State: AOJu0Yz5lb8jiRCWRdRFoMMpQGi7UFNDz3lUI6y3kPdMUOsR8QJAFGHn
 hdpuQ5xoNCA/PyWiytHZ6+1gvQnu8qs9ji7CaOLKr2sEGIgiJAmn
X-Google-Smtp-Source: AGHT+IF0O7HII5MYlv2g0E+BHBSm5qRGKAR+0KxI+xwk6+g8c7fXn65jtKX0C7ci+tZdnr/ge20LGw==
X-Received: by 2002:a05:6a20:3c90:b0:1a5:6bfb:76de with SMTP id
 b16-20020a056a203c9000b001a56bfb76demr2694088pzj.2.1711726808383; 
 Fri, 29 Mar 2024 08:40:08 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 m9-20020a170902db0900b001dd578121d4sm3581907plx.204.2024.03.29.08.40.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Mar 2024 08:40:07 -0700 (PDT)
Date: Fri, 29 Mar 2024 08:40:05 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Simon Horman <horms@kernel.org>
Cc: linux-kselftest@vger.kernel.org, David Airlie <airlied@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 Kees Cook <keescook@chromium.org>, Daniel Diaz <daniel.diaz@linaro.org>,
 David Gow <davidgow@google.com>, Arthur Grillo <arthurgrillo@riseup.net>,
 Brendan Higgins <brendan.higgins@linux.dev>,
 Naresh Kamboju <naresh.kamboju@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Maxime Ripard <mripard@kernel.org>,
 Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, kunit-dev@googlegroups.com,
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, loongarch@lists.linux.dev,
 netdev@vger.kernel.org, Linux Kernel Functional Testing <lkft@linaro.org>
Subject: Re: [PATCH v2 12/14] sh: Add support for suppressing warning
 backtraces
Message-ID: <d7663e19-74d5-478d-becc-0a080075e7d6@roeck-us.net>
References: <20240325175248.1499046-1-linux@roeck-us.net>
 <20240325175248.1499046-13-linux@roeck-us.net>
 <20240327144431.GL403975@kernel.org>
 <320aacc6-b7e5-4c3d-948e-d0743ab26c5d@roeck-us.net>
 <20240327193920.GV403975@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240327193920.GV403975@kernel.org>
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

On Wed, Mar 27, 2024 at 07:39:20PM +0000, Simon Horman wrote:
[ ... ]
> > > 
> > > Hi Guenter,
> > > 
> > > a minor nit from my side: this change results in a Kernel doc warning.
> > > 
> > >       .../bug.h:29: warning: expecting prototype for _EMIT_BUG_ENTRY(). Prototype was for HAVE_BUG_FUNCTION() instead
> > > 
> > > Perhaps either the new code should be placed above the Kernel doc,
> > > or scripts/kernel-doc should be enhanced?
> > > 
> > 
> > Thanks a lot for the feedback.
> > 
> > The definition block needs to be inside CONFIG_DEBUG_BUGVERBOSE,
> > so it would be a bit odd to move it above the documentation
> > just to make kerneldoc happy. I am not really sure that to do
> > about it.
> 
> FWIIW, I agree that would be odd.
> But perhaps the #ifdef could also move above the Kernel doc?
> Maybe not a great idea, but the best one I've had so far.
> 

I did that for the next version of the patch series. It is a bit more
clumsy, so I left it as separate patch on top of this patch. I'd
still like to get input from others before making the change final.

Thanks,
Guenter
