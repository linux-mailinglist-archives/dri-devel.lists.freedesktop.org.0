Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74A5F76F3FF
	for <lists+dri-devel@lfdr.de>; Thu,  3 Aug 2023 22:21:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D07110E21A;
	Thu,  3 Aug 2023 20:21:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa35.google.com (mail-vk1-xa35.google.com
 [IPv6:2607:f8b0:4864:20::a35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C68610E1F5;
 Thu,  3 Aug 2023 20:21:40 +0000 (UTC)
Received: by mail-vk1-xa35.google.com with SMTP id
 71dfb90a1353d-4865d994991so557239e0c.0; 
 Thu, 03 Aug 2023 13:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691094099; x=1691698899;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SSaRAjLMTa67lFk5QZwB/CpwmOcN1LDlBkoWiiPNHX0=;
 b=S2LXdDKSgccv1prhAF8Z0oKo1xmicxyewP0ylBhuICK2rO/fsSjef3jFU/28NJ3Vh1
 WyXNOi2jAPT0ODKE80piyhpf+XC+KO14qoq4Zoq9pxkFvuS+D2a8yfb562h8HIX6AEVF
 ch5p1S7/7QdkjxqxTnXku3kQTsVPaQDaUh5EfbRUaCprqY2YJTNY+lFJ8hQOdhtnnyJ8
 QqTaODyCa/GBNPH6fxj5g2iNTLieOqvxoez8ocqemnPGBtsl+ns4zbS4tkGe113R9mG/
 EmWP7hTP8mPWwhpZzOshyk7rlRKtsUMGcRFGAd1dhHj6GV5xqfNRF4asRtTybLNxarB7
 Y1MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691094099; x=1691698899;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SSaRAjLMTa67lFk5QZwB/CpwmOcN1LDlBkoWiiPNHX0=;
 b=Jwk+z+IS5JxL9H/cXTD3Jf3xFMlF9xGwDE7i7oO5cfmSm7gmVMf8Hf18axZR5/VmZ+
 QK9HYMCDcbMhJ/H0I32sNM6i8qnPoX49MAbcxi0EpZBogyMP8S7wxVa3XVPB9Ht2wILQ
 Eb7+DLMZSHH44KO1VjUxnUH856tTY19nW7nnILZSl+JDxE1cUEvw0KHNV4T2vjwxYdhI
 nC7MoQD7wJ3Hd/wr98vdnAqGCzctIN7yPemtxS+ryPfxetrSF9izlfV3oK8fqDt6zX1B
 Z8FIZxNGZ7RwSoNYj4QLYZ2BZH/pyP3//mVk9io6tLBFUgThnCrxVGIiaGquV/ZXwkRe
 DTww==
X-Gm-Message-State: ABy/qLZtECSPLyOGMuGf4aCtWx7p2MnBjb/RD3pYDfQxA7GvRd6H88uz
 Jz8p1ErucE4Z/iS2l1WBPB90guuc2bKXjGPypx8=
X-Google-Smtp-Source: APBJJlG1CySCstG+XEKldbhygdyS13vjgjak8avQeTacOxbhbG8cLi/Juych8hTizx9FjNhgErCFMh1d0Escb3V3rHQ=
X-Received: by 2002:a67:bb04:0:b0:443:895d:1b53 with SMTP id
 m4-20020a67bb04000000b00443895d1b53mr8351230vsn.10.1691094099065; Thu, 03 Aug
 2023 13:21:39 -0700 (PDT)
MIME-Version: 1.0
References: <20230801170255.163237-21-jim.cromie@gmail.com>
 <202308031432.fcb4197-oliver.sang@intel.com>
In-Reply-To: <202308031432.fcb4197-oliver.sang@intel.com>
From: jim.cromie@gmail.com
Date: Thu, 3 Aug 2023 14:21:13 -0600
Message-ID: <CAJfuBxzq_5skGRkcdK9kJBE_qL8X_waq88XsUO-FHyVQkQUb4w@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH v5 19/22] drm: restore
 CONFIG_DRM_USE_DYNAMIC_DEBUG un-BROKEN
To: kernel test robot <oliver.sang@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: lkp@intel.com, jani.nikula@intel.com, daniel.vetter@ffwll.ch,
 intel-gfx@lists.freedesktop.org, linux@rasmusvillemoes.dk,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, joe@perches.com,
 jbaron@akamai.com, seanpaul@chromium.org, amd-gfx@lists.freedesktop.org,
 gregkh@linuxfoundation.org, oe-lkp@lists.linux.dev,
 intel-gvt-dev@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 3, 2023 at 1:14=E2=80=AFAM kernel test robot <oliver.sang@intel=
.com> wrote:
>
>
> hi, Jim Cromie,
>
> we send this report to you to consult that if there is any limitation to =
use
> this CONFIG_DRM_USE_DYNAMIC_DEBUG?
> attached config is a randconfig which has CONFIG_DRM_USE_DYNAMIC_DEBUG, t=
he
> kernel built with it failed to boot in our tests, but we also tested with=
 some
> other config then the issue cannot reproduce.
>

Theres no limitation I know of - particularly not CONFIG related

on an earlier version, I saw some odd transient / red-herring
linker-errors (collisions on __UNIQUE_ID constructs)
on s390, mips, older gcc (iirc - I could go find it in lkp-reports if
its meaningful)
that had me hacking at the fallback which uses __LINE__
But this seems different.
