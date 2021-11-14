Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C578444FBC6
	for <lists+dri-devel@lfdr.de>; Sun, 14 Nov 2021 22:19:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EDAC89FE6;
	Sun, 14 Nov 2021 21:19:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7C2089FE6
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Nov 2021 21:19:42 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id x15so62820182edv.1
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Nov 2021 13:19:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kLOzaJoltjKDQvEecFuRyMKdXpesuCtjS9ImEoetX68=;
 b=A6imnwSJ5wijhFoiuKjwmqxVd2U5hUIwuDALT577iJiJfKzSv3cYYkDsVT0CmJpHjf
 5Fku9qXEQDUbAYgg+dxRr5Iab7Cnp7PIDhz1EmhL9SVS6htM66mxHHcZasRZYpGwAAYD
 gQ4EfHLNgnsPG4SxZkDwu/bu2O3ew33sMOq1s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kLOzaJoltjKDQvEecFuRyMKdXpesuCtjS9ImEoetX68=;
 b=DOj/NTP1ZijJTLmrwPpiNviY4K/+h7MEoDkPpIiS/Do/DDjhGmIjAmPOacc2TA+e3L
 Q+Z2oK26WQ25/0i0Htmf/jwe+VtMCQ2t2V+9XsH0HY/QbV3s8Yg89dycuF3oPg2yts6p
 aglGnhEgIZwOcyy5GZg9asSMV+9CZlx0v7e1L86mHoInScXrmIwUk7FI3ENPLuU436Gq
 eTW8fdJO78Tz0iSYV/geFZz2OgJ3HE48dSqv4UsEdMzWk3BTXZeDuV0CHl9Z/Aee7LnB
 Bkpvuy/y/Gb5DKY4bKn5oPgcvhyzVUVuCXG9l6clkqwB0ZpqUbnZncLiHGnMp2RFLeZ3
 iF7Q==
X-Gm-Message-State: AOAM53294cfHAQr+hEnHeGvn+xF9+h7E4Uwy2O1sbrLuwT6KESdPl6q4
 8sFVcZQEXiS9Fvu2hryammNY9TE5di9x7oJy
X-Google-Smtp-Source: ABdhPJz/WjhVvjhC4NJLf0knzKOUI+LdUrxT+Wu4mVWio+XqpZ2z/Aed6wdm7cme0bfGtXG8d6l7tw==
X-Received: by 2002:a17:907:72cf:: with SMTP id
 du15mr42686639ejc.167.1636924780565; 
 Sun, 14 Nov 2021 13:19:40 -0800 (PST)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com.
 [209.85.128.51])
 by smtp.gmail.com with ESMTPSA id z25sm5299766ejd.80.2021.11.14.13.19.39
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 14 Nov 2021 13:19:40 -0800 (PST)
Received: by mail-wm1-f51.google.com with SMTP id o29so12227961wms.2
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Nov 2021 13:19:39 -0800 (PST)
X-Received: by 2002:a7b:c005:: with SMTP id c5mr55506005wmb.155.1636924779662; 
 Sun, 14 Nov 2021 13:19:39 -0800 (PST)
MIME-Version: 1.0
References: <CAPM=9txVydO1fy8sEwVXRZF0zPfWwLYrk-UnGeKhRCEvrW4B7Q@mail.gmail.com>
 <CAHk-=wiZdONN=1Er5eN1bYurrWqhXF7LxQszpPia8hvYUOiZWQ@mail.gmail.com>
 <CAPM=9tw=NTZ-1NbGupgg42gOA1aFKZ2C6wt++q5BxaocaUbmFA@mail.gmail.com>
In-Reply-To: <CAPM=9tw=NTZ-1NbGupgg42gOA1aFKZ2C6wt++q5BxaocaUbmFA@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 14 Nov 2021 13:19:23 -0800
X-Gmail-Original-Message-ID: <CAHk-=wjpPWyH5ff0LE8Mmt6OEiYbD3LwpvpD==FFZfTMTzL2FQ@mail.gmail.com>
Message-ID: <CAHk-=wjpPWyH5ff0LE8Mmt6OEiYbD3LwpvpD==FFZfTMTzL2FQ@mail.gmail.com>
Subject: Re: [git pull] drm fixes + one missed next for 5.16-rc1
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
Cc: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Nov 14, 2021 at 1:00 PM Dave Airlie <airlied@gmail.com> wrote:
>
> i915 will no longer be x86-64 only in theory, since Intel now produces
> PCIe graphics cards using the same hw designs.

Well, at least in my tree, it still has the "depends on X86", along
with several other x86-only things (like "select INTEL_GTT", which is
also x86-only)

So by the time that non-x86 theory becomes reality, hopefully the i915
people will also have figured out how to do the cache flushing
properly.

And hopefully that "do it properly" ends up being simply that the
particular configuration that ends up being portable simply doesn't
need to do it at all and can statically just not build it,
sidestepping the issue entirely.

Fingers crossed.

.. of course, I'm also sure some clueless hardware engineer is still
convinced that non-coherent IO is the way to go for graphics, and that
doing cross-CPU IPIs to write back all caches is somehow still a valid
model. Because some people were still convinced about that not _that_
long ago. Hopefully reality (perhaps in the form of Apple) has caused
people to finally reconsider.

                 Linus
