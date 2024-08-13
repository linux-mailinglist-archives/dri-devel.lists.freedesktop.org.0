Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B81295029D
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2024 12:41:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 832A010E0D9;
	Tue, 13 Aug 2024 10:40:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="VKnxT6ZA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B37C910E0D9
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2024 10:40:57 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-36868fcb919so3144998f8f.2
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2024 03:40:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723545656; x=1724150456; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=21uElUyce8JR249X6uJAS7PnRRTOtflHbVAbFYHYmwk=;
 b=VKnxT6ZAwpBxD4UlEn5n/VajYLy3CpDHbYlwG7N2HTOutdYfd9FzUZBcHlmLcjtY+C
 2zAJB4k/fZa5b2DNFgTIGMRPeqqH9TzxP8NPJA0Rxj7bm+8t+abSYQM7TMqKnXS8QMMs
 cnh7TDlvjfDhKcZ8BFvGWaBMwPAkOGNxr9ZNVDtGaAhgOsMkKJ4C81L2PS02uimc8hV8
 IUZnui8N70hLwXTw3S2K0SSmPVJYwYjcolQTCJhl4dDWLOs6SSS7IU0PhruLkm8j4UVG
 fHQQXsMxLnQKi+GyQsGSWaurLnz4PiGXUzJuYRYXq2UpYO9j0ekKA0QM4fu8G4IfubAy
 Q9hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723545656; x=1724150456;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=21uElUyce8JR249X6uJAS7PnRRTOtflHbVAbFYHYmwk=;
 b=d4XLj2m+4aiHX5+8BMwQZ5OvhewN6aNC2TKoeDGNqyVbPv348h5rrqwFBPd8X3rndM
 H0zoDNuqJr8GtT920e696fhrEvVtMG6py69As2MwYvAUfvL+nrogbkhFXHk0+dIFC0+D
 M9gozED4kEVIYoNAgPnKIE4cTK6cJxR9iZK2qY5965dKh663IzFFOWtxed9kboTXw1/5
 BZbnXWBydEJtP1NrHBDiZecHnvg/d2S8CZ1J7m4qqG4ZdHBFjzR3+FvHSv1bF+MbSfKe
 vD4oCl7NTzahk4O++zFSmvTN6XW85oudE3bauOD7lL9tBnDV8I+xul5K0BmfRR5n//At
 jSPQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW1WXTIl7sBDAVAY1Zdisa7mRh5rPrwEPP78zOi292uMcxK1SiRQOgwlnqiRua3xLIToQr/FrBJ4V4ACExbQSpLtHqNUzGbZ1JEL77tI366
X-Gm-Message-State: AOJu0YySH/KUmw/rvXVfgUeoEx6FDVOShtHYG3zEeO5Oa7hHlA16yYNm
 MRvk1qHBg4D1VBOGL6yZybVSCCBKNVC4am02bvrxuyZhDiG/nWc2
X-Google-Smtp-Source: AGHT+IEOCDk/eufgFxeF7PpSktbwtQYgJNiXJF2+V70NlTfR0jqK/v79u3BSknWzkzE+26GFwngCkw==
X-Received: by 2002:a05:6000:186c:b0:36b:a3c7:b9fd with SMTP id
 ffacd0b85a97d-3716cd3a62fmr2856837f8f.56.1723545655652; 
 Tue, 13 Aug 2024 03:40:55 -0700 (PDT)
Received: from fedora ([213.94.26.172]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36e4c36bcc5sm9843187f8f.24.2024.08.13.03.40.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Aug 2024 03:40:55 -0700 (PDT)
Date: Tue, 13 Aug 2024 12:40:53 +0200
From: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: Marius Vlad <marius.vlad@collabora.com>,
 Jim Shargo <jshargo@google.com>, daniel@ffwll.ch,
 brpol@chromium.org, corbet@lwn.net, dri-devel@lists.freedesktop.org,
 hamohammed.sa@gmail.com, hirono@chromium.org, jshargo@chromium.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 mairacanal@riseup.net, mduggan@chromium.org, melissa.srw@gmail.com,
 mripard@kernel.org, rodrigosiqueiramelo@gmail.com,
 tzimmermann@suse.de, maarten.lankhorst@linux.intel.com
Subject: Re: [RFC] Adds support for ConfigFS to VKMS!
Message-ID: <Zrs4NY5FkMEomaog@fedora>
References: <ZrZZFQW5RiG12ApN@louis-chauvet-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZrZZFQW5RiG12ApN@louis-chauvet-laptop>
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

Hi Louis,

On Fri, Aug 09, 2024 at 07:59:49PM +0200, Louis Chauvet wrote:
> Hi everyone,
> 
> I'm excited to share some good news! I've recently completed the addition 
> of a ConfigFS interface to VKMS, which allows to configure VKMS from 
> user-space, at runtime. You should be able to:
> - Create new devices
> - Create planes/crtc/encoders
> - Configure rotation, color range, color encoding
> - Link planes, crtc and encoders.

Nice! Thanks for the hard work.

During the last 2 or 3 weeks I worked on ConfigFS support as well and
I have an RFC series ready to be sent to the mailing list.
My version is a bit simpler than yours because it doesn't implement extra
features (color formats, etc) and it can be applied on drm-misc-next.
I'll send the RFC as soon as I finish typing this email :)

I don't have any preference about which ConfigFS series we end up
using as long as we get the feature implemented.
Instead, I think that having 2 different implementations is a great
opportunity for better reviews because we have a good idea about how
the implementation might look like and it'll make easier to find bugs.

> The entire series can be found on my GitHub repository:
> https://github.com/Fomys/linux/tree/b4/new-configfs
> 
> This series is big, consisting of over 40 commits. Although it's not 
> completely cleaned up, all commits compile successfully and (almost) pass 
> checkpatch.
> 
> I plan to split this series into several smaller ones:
> 
>  - Adding support for additional color formats
> 	4a4f75873cca..d74006d7f9c4
>  - Reintroducing the writeback algorithm
> 	9e74d259e1be..f839dcf6a7d8
>  - Clarifying documentation
> 	b3bfd0ba2283..93945f0fbfc7
>  - Properly splitting headers
> 	c70018038572..67258bd8a180
>  - Switching to drmm_ helpers
> 	844e701e1d6d..f3050d125f64
>  - Using a proper platform device driver
> 	4658f99dfe3e..a3258e4d7550
>  - Introducing a vkms_config structure
> 	95ad6da46638..5b2d080b4626
>  - Adding ConfigFS support
> 	866ad75102ae..f900ad18ab8c
> 
> What's currently missing:
> 
>  - A deep cleanup to ensure checkpatch compliance and proper
>    functionality for every commit
>  - Updating documentation
>  - Reviews 
> 
> The primary area where I need assistance is reviews and testers. I'm aware 
> that Maìra is very busy and can't review quickly, but any other 
> individuals who can test and/or review this series would be greatly 
> appreciated.
> 
> My next step is to add connector support, but as I will use this work and 
> my previous series [1], I would like to see it merged first.
> 
> If any of the original authors would like to be credited for 
> their contributions, please let me know. I rewrote most of the code, but 
> the general idea was originally from them.
> 
> José, I am sorry, I think I missed your mail where you told me you already 
> reviewed some commits: 
> 
> > I reviewed the first 9 patches and added a few comments on your
> > GitHub fork.
> 
> I am not able to find any comments, can you send me the link to the page 
> with them? I would like to read/apply them before submitting the first 
> part of the series.

My comments were in the GitHub commits, but I think they were lost after
rebasing/force pushing.

Hopefully, I saved a copy of your patches with my suggestions applied and
commit messages where missing:
https://github.com/JoseExposito/linux/commits/patch-vkms-header-refactor/

I think you should be able to extract the diff easily.

It might be a better idea to share the patches in the mailing list for
broader discussion and to avoid loosing review comments.

Thanks a lot for your work Louis!
José Expósito

> Thanks for your time,
> Louis Chauvet
> 
> [1]: https://lore.kernel.org/all/20240809-yuv-v10-0-1a7c764166f7@bootlin.com/
> 
> -- 
> Louis Chauvet, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
