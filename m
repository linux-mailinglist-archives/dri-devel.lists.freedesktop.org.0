Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83AE088D38F
	for <lists+dri-devel@lfdr.de>; Wed, 27 Mar 2024 01:59:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9637F10F5BD;
	Wed, 27 Mar 2024 00:59:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Oj+o/evb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2422910F111
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Mar 2024 17:01:04 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-2d6ee6c9945so5423901fa.3
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Mar 2024 10:01:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711472462; x=1712077262; darn=lists.freedesktop.org;
 h=mime-version:user-agent:references:message-id:date:in-reply-to
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=gzfexKZPZkf85+a0gllV0ajlzNUH9m6yIuTzuBccjB8=;
 b=Oj+o/evb11IleRPLMJP/TrAvCjnMafnUwFzzVNxJwEz2+3kQM3OQ1nh/AMU7v3Scz5
 f6TcmoCWwZmK1LYyIyEwYuV2LBPwD3v+XIMhWXXe2GxGN4LxAhEiYJO2F4eLXVmmKhk4
 wOAMjS2vPPUyVdxmA94ylCMl8JGxm6BiLE12IrLBR2BMljFILviWm1KZQ/UdxEFzYJ/v
 1AGf1HE2GxtqarhER52Ae87PduZY1QbAymUSGXR1aGJwG91rpqwfiaWxZ7Q8o+0jKXTS
 p8aeosuDVTQoVbV6+SyjdEZmou34Jzy44ruWugZfvDiWRq1bOdeNZ7F0iT5eMt+Ksn+R
 aadQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711472462; x=1712077262;
 h=mime-version:user-agent:references:message-id:date:in-reply-to
 :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gzfexKZPZkf85+a0gllV0ajlzNUH9m6yIuTzuBccjB8=;
 b=D1hpYzeoIzDf5VMy3mUhiZ9GxcxNdbDyBoePOZ7c8zwO0iwn4RZ6SW8LVsY+4xfWhm
 knvjuTTe4jOUaPnHt0kP1spGT+zZqmWLz4j74D4uV4Fi2pD7H1mmn3/78qkpi4VXcPQe
 UWTOF4is9Nz8n1j6UarpRPsEQC06HouY/0iT3odPr4pxDF5q0poeTxTqd5J4Ki+NQAQg
 0vbzSIi5GGRYGygtuDHVUthZfM0B16n+WInG9V963GKbBabV5LILeaZbvv/Vtjr6wbHJ
 BcPbNKxATXCkENsTB4/IR1f1TOufRTAaZXdlZypU+gxN0bE03dPY0GdZ95qLHR/vE/WL
 ngOw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXNWCizaQa+JBkedjCt4JHdxdpHgVjGmL/R4OxZMNk853la2B10fSIj53Wg3P1i/cykuEtOXfJa3swfx8iXAtcEn9Kll5b3ytPVG5G5FUnd
X-Gm-Message-State: AOJu0YzscJQeX7+MO/va4qgG/oyX6zcOcaCQPJ43JbgLEC+5LLHsNOi/
 4DgnH4z19Yo950hHfyh37nN16H0lGZbOIUJZl0pAMNB8Ypve+gpoyOIWyAqAk8A=
X-Google-Smtp-Source: AGHT+IH8ru9poxTyHOPjWkzoiAaXgaGlMH2HCJf8Y/pvDqqw8XN1YAg1gTzHA8UnbhEqJC3qSt7zJw==
X-Received: by 2002:a2e:9b01:0:b0:2d6:c535:bf3e with SMTP id
 u1-20020a2e9b01000000b002d6c535bf3emr1250510lji.14.1711472461652; 
 Tue, 26 Mar 2024 10:01:01 -0700 (PDT)
Received: from imac ([2a02:8010:60a0:0:e486:aac9:8397:25ce])
 by smtp.gmail.com with ESMTPSA id
 o33-20020a05600c512100b004131310a29fsm12116647wms.15.2024.03.26.10.01.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Mar 2024 10:01:01 -0700 (PDT)
From: Donald Hunter <donald.hunter@gmail.com>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: amogh.linux.kernel.dev@gmail.com,  airlied@gmail.com,  corbet@lwn.net,
 daniel@ffwll.ch,  dri-devel@lists.freedesktop.org,
 javier.carrasco.cruz@gmail.com,  linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org,  maarten.lankhorst@linux.intel.com,
 mripard@kernel.org,  skhan@linuxfoundation.org,  tzimmermann@suse.de,
 willy@infradead.org,  Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v2] Fix duplicate C declaration warnings
In-Reply-To: <f735ce0b-db1e-49bc-86ac-b5ab8e4aec31@gmail.com> (Akira
 Yokosawa's message of "Tue, 26 Mar 2024 13:05:39 +0900")
Date: Tue, 26 Mar 2024 16:01:50 +0000
Message-ID: <m2bk710yoh.fsf@gmail.com>
References: <287eb3f74e4c31adb065668ff49c8e1577388227.camel@gmail.com>
 <f735ce0b-db1e-49bc-86ac-b5ab8e4aec31@gmail.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain
X-Mailman-Approved-At: Wed, 27 Mar 2024 00:59:10 +0000
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

Akira Yokosawa <akiyks@gmail.com> writes:
>
> That message of mine just pointed out that the Sphinx bug of false
> duplicate C declaration warning first reported by Mauro (+CC'd) at:
> https://github.com/sphinx-doc/sphinx/issues/8241 --
> "C domain issues when building the Linux Kernel documentation".
> It had not been resolved despite Mauro's recognition of the issue at the
> time.
>
> It was closed without fixing the bug but delegate the issue to an earlier
> one of the same nature at: https://github.com/sphinx-doc/sphinx/issues/7819 --
> "C, distinguish between ordinary identifiers and tag names", which was
> opened on Jun 12, 2020 and has not been resolved.  (almost 4 years ago!)
>
> There is two pull requests attempting to resolve the issue at:
> https://github.com/sphinx-doc/sphinx/pull/8313 --
> "C, distinguish between tag names and ordinary names" and
> https://github.com/sphinx-doc/sphinx/pull/8929 --
> "Intersphinx delegation to domains".
> PR #8313 needs #8929 as its prerequisite.
>
> Unfortunately, both PRs are still open as well as the issue #7819.
> Honestly speaking, I don't have any idea what prevents those pulls,
> give or take the need of rebasing with conflict resolution.
>
>>                                                  So by changing the
>> function name to something like "query_drm_format_info(u32 format)" is
>> a possible fix. Question is what should I rename this function to, that
>> aligns with the coding standards? Also suggest a new function name for
>> "drm_modeset_lock" that causes the second warning.
>
> So, I would rather not rename valid identifiers for the sake of working
> around a bug of Sphinx.  Rather, I'd appreciate if you'd send a message
> encouraging Sphinx devs to resolve the issue sooner rather than later.
>
>         Thanks, Akira

Agreed, we should try and get the bug resolved in Sphinx. This same
issue came up in relation to this PR that I am working on so hopefully
we can work together to get fixes merged upstream:

https://github.com/sphinx-doc/sphinx/pull/12162

Thanks,
Donald.
