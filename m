Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7E82799F62
	for <lists+dri-devel@lfdr.de>; Sun, 10 Sep 2023 21:05:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A46AF89336;
	Sun, 10 Sep 2023 19:05:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DD5B89336
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Sep 2023 19:05:07 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2bceca8a41aso59373091fa.0
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Sep 2023 12:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1694372705; x=1694977505;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=oqvxcwzpC3/aD7COrxRo/r5ZoCc7FtwXVuKZgiIZ2z8=;
 b=bd1mgIWm/22r2/181giaOdOnZckX2UA4jhQr5GSeCxWIh1ASDLNMbynKXKnGRW0zwx
 1spt/D3DxBvF+CIBpx3GUSSiQsSvj5Pc3qYTD2A80cKavW9P1bxl1u5rwQp5MFqOrhji
 XX2yQIkg5lTkEstawAx2SC7oEApzNHpSUgZ+E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694372705; x=1694977505;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oqvxcwzpC3/aD7COrxRo/r5ZoCc7FtwXVuKZgiIZ2z8=;
 b=U69qN/G2Aw0hONr1xds/al91g3uIRhafs2xRErtRuJG2T0IwFW5f5vuSUWWToiHPO1
 3XFn35wjLKfgE7CJwG9iYcFZBObo0Y/byycrzcstaP3V7xSZU1OMq/yYGYQdFd7lX98k
 Oe2lsDoOl97VJia9Knp8SMqqOUCXySJHV8omFU27H6ZxSaDJi8Bnw3TcRLqM0Q0JY90f
 XYXNqYLMq/X0EMNCwZdyXoR5DmztoXZs/TcCx2tQKAeEcr4+7DxrDfULnfo/NEwZQ1fy
 uz6C4/cpfvTnu0kGoASZytcG+HcYgty3+sQRs+9Zic5zxwKF8jnJPBWK+IXZTZvbYdpl
 PlGA==
X-Gm-Message-State: AOJu0YwIbuaGpvLXNCkw1+9u81WIvqSz6ysM9jCE6TIf3IlrxZUiSJ/O
 3uTYpVNUU7DTwKTutVfjZYcNilAxvs1hqTlGC3GFX16s
X-Google-Smtp-Source: AGHT+IG4IUoFESW9sPubLEU5EJmgNnRf35Is9586E+jW83SbFlO07+YFWKc+mDVrJT05NMUhhiiHvQ==
X-Received: by 2002:a2e:8784:0:b0:2bc:fdec:a3f6 with SMTP id
 n4-20020a2e8784000000b002bcfdeca3f6mr6316463lji.48.1694372704929; 
 Sun, 10 Sep 2023 12:05:04 -0700 (PDT)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com.
 [209.85.208.45]) by smtp.gmail.com with ESMTPSA id
 ce7-20020a170906b24700b0098f99048053sm4207062ejb.148.2023.09.10.12.05.04
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 10 Sep 2023 12:05:04 -0700 (PDT)
Received: by mail-ed1-f45.google.com with SMTP id
 4fb4d7f45d1cf-52f33659d09so1327031a12.1
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Sep 2023 12:05:04 -0700 (PDT)
X-Received: by 2002:a17:906:3098:b0:9a1:d077:b74f with SMTP id
 24-20020a170906309800b009a1d077b74fmr6557487ejv.49.1694372703888; Sun, 10 Sep
 2023 12:05:03 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9tz=gx2_zrQ2XD8JNwW1dg6b+Byr5FgYAAq+2f29rydcgg@mail.gmail.com>
In-Reply-To: <CAPM=9tz=gx2_zrQ2XD8JNwW1dg6b+Byr5FgYAAq+2f29rydcgg@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 10 Sep 2023 12:04:46 -0700
X-Gmail-Original-Message-ID: <CAHk-=wg7zcmwWwYO=vEVJrTn7fuhpFNmv-6k-MptFYYqFofp4w@mail.gmail.com>
Message-ID: <CAHk-=wg7zcmwWwYO=vEVJrTn7fuhpFNmv-6k-MptFYYqFofp4w@mail.gmail.com>
Subject: Re: [git pull] drm CI integration
To: Dave Airlie <airlied@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 30 Aug 2023 at 18:00, Dave Airlie <airlied@gmail.com> wrote:
>
> This is a PR to add drm-ci support files to the upstream tree.

So I finally had no other pull requests pending, and spent some time
looking at this, and I see nothing offensive.

I did wonder how this then expands to having more than one subsystem
using this (and mixing them possibly on the same CI system), but
that's more about my ignorance about how the gitlab CI works than
anything else, so that's certainly not a real concern.

The other side of that "I do wonder" coin is for when others want to
use the same tests but using some other CI infrastructure, whether
it's some AWS or google cloud thing, or github or whatever.

Anyway, considering that both of my idle curiosity reactions were
about "if this is successful", I think me having those questions only
means that I should pull this, rather than questioning the pull
itself.

If it works out so well that others want to actually do this and
integrate our other selftests in similar manners, I think that would
be lovely.

And if - as you say - this is a failure and the whole thing gets
deleted a year from now as "this didn't go anywhere", it doesn't look
like it should cause a ton of problems either.

Anyway, it's in my tree now, let's see where it goes.

                   Linus
