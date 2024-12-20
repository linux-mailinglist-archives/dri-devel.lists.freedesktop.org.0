Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AE2719F955B
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2024 16:24:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDCBE10EFF6;
	Fri, 20 Dec 2024 15:24:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="a9UT4Y0Q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84BE410E395
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2024 15:24:46 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-43621d27adeso14187035e9.2
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2024 07:24:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1734708285; x=1735313085; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=wkAvDgDciEvC+xZ+jSk8aQQ0//liLUg2T4crIemtaeQ=;
 b=a9UT4Y0QmusKEJnoU+IizoJ3kjTipNHk8S/UDUhWi88StsFyvJNgS3RisszMyJtGy6
 P+jxDAa/0FRXDAdwfYq1JH0OpJb1Q3urRqZ95hEbIDtXgrpv2OPwLXV+CFOav2gO9v8K
 tdbFXkWRRjA32JTPlcaAhFWaIh5CvWDt+MUK4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734708285; x=1735313085;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wkAvDgDciEvC+xZ+jSk8aQQ0//liLUg2T4crIemtaeQ=;
 b=YMUvJ8iRJYZzA1mtNqjLhjNFDKLkO+uePFFz3SZcnFZJclauBUKWNhQraJBVeSclLN
 PYvOCog07WYmrve50q9x+bKgmndEGdOa+okGp7pj4/Z00p4rheRkXFDnKLIhOyE+XFqH
 JJjusqZMpvDI9hxLoIKjNwmErdE+CQ9z8TfEa0MS87Q8XC/WVjInlYGo4poUqtIM1pTL
 kKsxNpDzacA3OumwJRfZKC7i+aM/TPLprR103jFQEJEztIl+x6n3+YTWm+KeGnsDqw3q
 VieuyAH8I7oQCQZSkFkQNrNGhgDpx8Pd89+LuF04dVENYQ7jSV5mXANJMXSq8qNwhRWE
 rDEA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV6Ub6xRy22mccppmxawjZhWrZXYoFLjrg6fponN8il4EwMqim3zT3XI+2tRYzhXLeLCEWmQmlIRvM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy0BZMp9OpBKHy0QYLwUq1ccs4Oy7HrJzaZ0aAzk8UKQIf3XrGG
 rP9PXaUn13KvKMwPU29KOx+hcT3SvNASXt4zuEaj2PYJCGxO8IjV/CKPoiucqMg=
X-Gm-Gg: ASbGncsVv78g2jqCMFT5Gnxtq45o0m5+9TvQXJCJZgbl0x0xK9Bmy1k5QGZz9Z/OSKB
 ttl40At69w/MzXvk0BG0j2H5gxMnlsT7jUsiZzd6djD8bmHdZmIZei/RmI7SPKK13dd/zxgrv5B
 grGQRZtmKFDL3P8WUZnXN//9hPNW6J2PEaEw9q1ToaXmvn5VoeGfcqwqDBju3mMU2TiZxiG4BeP
 1TvhiiU/ABUENSPw7APtdu8fUAJ9c/GY4fUApQLZWyz7OU09lsrQNmx1O90ZEDsLwkW
X-Google-Smtp-Source: AGHT+IEGfHgFo11olpo8hGr1wp+wToYVIUekn8l0A7B0qIcvxSYXFPdt7rKBuVQqrXYMcGOcT66poQ==
X-Received: by 2002:a05:6000:4029:b0:386:41bd:53a3 with SMTP id
 ffacd0b85a97d-38a224083afmr3120496f8f.50.1734708284754; 
 Fri, 20 Dec 2024 07:24:44 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a1c8474b6sm4292325f8f.51.2024.12.20.07.24.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Dec 2024 07:24:44 -0800 (PST)
Date: Fri, 20 Dec 2024 16:24:42 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Michel =?iso-8859-1?Q?D=E4nzer?= <michel.daenzer@mailbox.org>
Cc: Daniel Stone <daniel@fooishbar.org>, Brian Starkey <brian.starkey@arm.com>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 Marek =?utf-8?B?T2zFocOhaw==?= <maraeo@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 ML Mesa-dev <mesa-dev@lists.freedesktop.org>, nd@arm.com
Subject: Re: [PATCH] drm/fourcc: add LINEAR modifiers with an exact pitch
 alignment
Message-ID: <Z2WMOmPCYajdtAeN@phenom.ffwll.local>
References: <CAAxE2A5BkF13bFt8_UnuiqPM8W-ZESgmKEjqqGfv=DGzSfJ7aQ@mail.gmail.com>
 <uffsfaps6a75zmkyshkwfxgybcslqrnfqqtjzekegdptvwpugc@2ndpcuxyfp3f>
 <c64cb9d8-5ea7-4644-93c8-04a97b758fa0@mailbox.org>
 <h26quuebhpxwkc3fl4vtfteoqyvingnddgxbnzptfnxfg6xgkd@kkkmeqwplomv>
 <8dae97c9-9286-451a-8122-b309eb21b2f4@mailbox.org>
 <Z2Ki-lQH4Fbch6RO@phenom.ffwll.local>
 <q45c43j5kwwvemec7mcs4kqzt54pa3nz3jlhkcky2v63s2vfie@him4q253uw4p>
 <CAPj87rMFJ0JRvsKqZUsw_EGrFWr1VLO4Ne2w_bZ5cH+gs_d=og@mail.gmail.com>
 <688f69c5-a7b7-46eb-89ef-379c3f5c7632@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <688f69c5-a7b7-46eb-89ef-379c3f5c7632@mailbox.org>
X-Operating-System: Linux phenom 6.12.3-amd64 
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

On Thu, Dec 19, 2024 at 05:09:33PM +0100, Michel Dänzer wrote:
> On 2024-12-19 10:02, Daniel Stone wrote:
> > 
> > How this would be used in practice is also way too underdocumented. We
> > need to document that exact-round-up 64b is more restrictive than
> > any-multiple-of 64b is more restrictive than 'classic' linear. We need
> > to document what people should advertise - if we were starting from
> > scratch, the clear answer would be that anything which doesn't care
> > should advertise all three, anything advertising any-multiple-of
> > should also advertise exact-round-up, etc.
> > 
> > But we're not starting from scratch, and since linear is 'special',
> > userspace already has explicit knowledge of it. So AMD is going to
> > have to advertise LINEAR forever, because media frameworks know about
> > DRM_FORMAT_MOD_LINEAR and pass that around explicitly when they know
> > that the buffer is linear. That and not breaking older userspace
> > running in containers or as part of a bisect or whatever.
> > 
> > There's also the question of what e.g. gbm_bo_get_modifier() should
> > return. Again, if we were starting from scratch, most restrictive
> > would make sense. But we're not, so I think it has to return LINEAR
> > for maximum compatibility (because modifiers can't be morphed into
> > other ones for fun), which further cements that we're not removing
> > LINEAR.
> > 
> > And how should allocators determine what to go for? Given that, I
> > think the only sensible semantics are, when only LINEAR has been
> > passed, to pick the most restrictive set possible; when LINEAR
> > variants have been passed as well as LINEAR, to act as if LINEAR were
> > not passed at all.
> 
> These are all very good points, which call for stricter-than-usual
> application of the "new UAPI requires corresponding user-space patches"
> rule:
> 
> * Patches adding support for the new modifiers in Mesa (and kernel)
> drivers for at least two separate vendors

I think this is too strict? At least I could come up with other scenarios
where we'd need a new linear variant:
- one driver, but two different devices that happen to have incompatible
  linear requirements which break and get fixed with the new linear mode.
- one driver, one device, but non-driver userspace allocates the linear
  buffer somewhere else (e.g. from dma-buf heaps) and gets pitch
  constraints wrong

> * Patches adding support in at least one non-Mesa user-space component,
> e.g. a Wayland compositor which has code using the existing linear
> modifier (e.g. mutter)

This also feels a bit too strict, since I think what Daniel proposed is
that drivers do the special LINEAR handling when there are variants
present in the list of compatible modifiers for an alloation. Hence I
don't think compositor patches are necessarily required, but we definitely
need to test to make sure it actually works and there's not surprises.

The exception is of course when non-mesa userspace allocates/sizes the
buffer itself (maybe for an soc where the display is separate and the gpu
has stricter stride constraints than the display).

> Ideally also describe a specific multi-vendor scenario which can't work
> with the existing linear modifier, and validate that it works with the
> new ones.

I think that's really the crucial part, because adding modifiers without
an actual use-case that they fix is just asking for more future trouble I
think.
-Sima

> 
> 
> -- 
> Earthling Michel Dänzer       \        GNOME / Xwayland / Mesa developer
> https://redhat.com             \               Libre software enthusiast

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
