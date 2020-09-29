Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB20027D815
	for <lists+dri-devel@lfdr.de>; Tue, 29 Sep 2020 22:29:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5FFB89BF1;
	Tue, 29 Sep 2020 20:29:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BC7689BF1
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Sep 2020 20:29:35 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id r24so5143351ljm.3
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Sep 2020 13:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Uvp2LKsWFV+HPqYTA/6/y1AQwy9iRQHNO8CgpqyQps0=;
 b=sht/fVKs372hvHFeW6wZN3AhYjl6BI/0lDKKCvVZZNRnH4lmLdBgwHjVDXIOVMN64A
 oZMp88l/7mM9yuB9f6Z8oHDLcxf4yYbCggZgNLPGBokCCr/xEGNLnV96QhEBpvbRqlyc
 +ngYf0iNVuRATx570nTzlGzPzUOKGTn6+tGM8aFORgZSwqVR+fTnrifFoWDQRk3DXFX/
 SIMy7a9d2pjem8+P/fyMR0FNVVdv+pOJM68rY7N/IgnAP3TKLtAwyXve0nd9KgRl76T0
 PdtZlCyAgKmd0eyO8CUkjNFOr/rMtcWsmFhbl069SnjIN9jg46YKj9kb/IbQZ7HqghAN
 T1WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Uvp2LKsWFV+HPqYTA/6/y1AQwy9iRQHNO8CgpqyQps0=;
 b=nBgHa6PvIcNVJuf+izoggcuuiKCuqnw6qhvipve+NDfpY961+22rXrHypbTQFJpXHi
 /qasLtS1zYyuaZIBthX0HG00DCpjUJdIsFMmyy2zpmOkIiLnEywx0z6xq2W81EMNiygZ
 j0yq6WzIgR4dSlc6jKPc+RUpbU+TYGDey+WgLIyIwPVhWxAcAUcpMtISjMDqN9U0LQL2
 N3glyNrTf01nD0SPkU3ks0YveVRVGlgeILQB/SLxZYf35tI23TyzjdubkFrSsJilvpSL
 pho6NTowH7CgqRbJjsBztzD4oqNWPjUL0LjIM8ZrU9BuZGAmBQEy8Wfx4PA+4oDMj5z/
 s/Gg==
X-Gm-Message-State: AOAM532+FBg1xxMK5RlzP7TBPupuuXJIVxFdoYztcG6OBaEB8mcmr7JP
 h2PmmyNp0+Hq7URWKzfdwzxJZLX9etsYSnPJzJyK3dK1Hzqrqw==
X-Google-Smtp-Source: ABdhPJwws7H4KNruNrz6E97+kcRL3M8/X6GOh5v04WYHUc0AjNQO3Z/2ZE9PQBIgoiKIDfWPidJN5lVMnTpURgjYy2g=
X-Received: by 2002:a2e:810e:: with SMTP id d14mr1855297ljg.100.1601411373462; 
 Tue, 29 Sep 2020 13:29:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200928200856.1897023-1-pcc@google.com>
 <0dc9f36b-417d-bfad-9eb7-858c3041ff0c@baylibre.com>
 <20200929093201.GL438822@phenom.ffwll.local>
 <CAMn1gO7w1wUo3e9vUmGeF7fp0K9mq2ydSskX2xD3H=Kndzhc+A@mail.gmail.com>
 <20200929164828.GP438822@phenom.ffwll.local>
 <20200929165206.GQ438822@phenom.ffwll.local>
 <CAMn1gO4csAWAnk5rwfzfW5SVTddj7E84kKG2T-qjGiOmObSXnA@mail.gmail.com>
 <CAKMK7uG5KP15tKVZpwmTnU0rM2VwRpESYk_=B0MuOWt5j3Gp1A@mail.gmail.com>
In-Reply-To: <CAKMK7uG5KP15tKVZpwmTnU0rM2VwRpESYk_=B0MuOWt5j3Gp1A@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 29 Sep 2020 22:29:22 +0200
Message-ID: <CACRpkdYoOVeEkF6RiJSUykJfmJUthXNHMdTUmu+02OXRCgOd0A@mail.gmail.com>
Subject: Re: [PATCH] Revert "video: fbdev: amba-clcd: Retire elder CLCD driver"
To: Daniel Vetter <daniel@ffwll.ch>
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, Sean Paul <sean@poorly.run>,
 Kevin Brodsky <Kevin.Brodsky@arm.com>, Russell King <linux@armlinux.org.uk>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Peter Collingbourne <pcc@google.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 29, 2020 at 8:44 PM Daniel Vetter <daniel@ffwll.ch> wrote:
> On Tue, Sep 29, 2020 at 7:49 PM Peter Collingbourne <pcc@google.com> wrote:

> But aside from all this, why is this blocking the migration from fbdev
> to drm? With fbdev you don't have buffer allocations, nor dma-buf
> support, and somehow android can boot.

I do not know how Android does things these days but back in the
days it would request a virtual framebuffer twice the height of the
physical framebuffer and then pan that up/down between composing
frames, thus achieving a type of double-buffering from userspace.

Given the type of bugs Peter is seeing this seems to still be the
case, Peter can you confirm?

Yours,
Linus Walleij
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
