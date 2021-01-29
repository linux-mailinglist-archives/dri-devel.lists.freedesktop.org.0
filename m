Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9468308999
	for <lists+dri-devel@lfdr.de>; Fri, 29 Jan 2021 15:49:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC5576EB39;
	Fri, 29 Jan 2021 14:49:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C77BA6EB39
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Jan 2021 14:49:45 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id u25so12824690lfc.2
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Jan 2021 06:49:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=e2eiAhiRPcn2mLR2Gduv03h2Y9+s1CAyYJA8iuAVHXk=;
 b=gW6AXvd8sDI2BRgkYeulvkMAZYg/SUP+xu5ZJwKIB5fh7p1tHPmgOLQ5fdTJgDpN8g
 VI0gELRNtI3JFo3phIMpStqhSlfh9wJ6rgkEBH0FwyXu1lmFKnSk3GF8+MO8P/IDZnwy
 5YNB8T7Ehgns6KoniiSYAC/LvvwHNdYbFwx6vbKwU4N2VG+e1YSWq5LDOByBe/cvRGIV
 v5D1QhTFN2yTBi5p8qVvaUWShxbtoNxr0+BueDI9twspNNEEThGSX8ZqEVVujoxe+vhb
 UTS3osAnzIfiYpPC5aiSEiG/LkTSj52b1rEXXl79DC9P5YiLCsmFe9mK+oGGYCKJp4De
 MIqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=e2eiAhiRPcn2mLR2Gduv03h2Y9+s1CAyYJA8iuAVHXk=;
 b=PpSFgcSsgnpRfvgLcfdfvWs5qUqr64a229lgkcU2KoJlDqbrdwG9fHTvOXM+SKf2U4
 tJETPVKwy5tuiyF6O5htUNOT8kSFYqHtDZF0Lo6kwDVnE22j9xYNWQcDs76FqcPpkyPZ
 irKW55kWCkkeXkb6osVfEk7jS0xLYskbnf8bE9/klqfFJPtg1MN4XOYnSi0wE1A++4PC
 thVKYIZZZd5zV4E0zBTGEEzwV9AVcaN4A59lMnym+Vg8ZbX4wrOyuPjtQcxKXuo253pX
 H/ep41o2TwYVzpcoRh8xXGUgnUxusWD7O2A46dAeSeJh8y/gCeJnOmWXwsgKYoq0CMRE
 ofgg==
X-Gm-Message-State: AOAM533rNhae8fQCYkNKG0xGimyM88CEQv/EbdXCTkxYhSIxhmuNxFKC
 7Yf67vr5I7btOvAktWJqQGPlhDjTixl0JHG+N0jYO6SV
X-Google-Smtp-Source: ABdhPJx9muIkVigqIOkH9CuSHLwpH/kopo4eun/OyoWwtlVCvCt5G4FaGTB2971MkQ5GnJkpQ9a5eef3kLq9+OLY4k4=
X-Received: by 2002:ac2:515b:: with SMTP id q27mr2355949lfd.516.1611931784241; 
 Fri, 29 Jan 2021 06:49:44 -0800 (PST)
MIME-Version: 1.0
References: <20210129095604.32423-1-tzimmermann@suse.de>
 <20210129095604.32423-5-tzimmermann@suse.de>
In-Reply-To: <20210129095604.32423-5-tzimmermann@suse.de>
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date: Fri, 29 Jan 2021 15:49:33 +0100
Message-ID: <CAMeQTsb+EsbEr0s5CNzzxtWvOrOo=NnceHEaieh1f0E+rnw8iA@mail.gmail.com>
Subject: Re: [PATCH 4/5] drm/gma500: Remove CONFIG_X86 conditionals from
 source files
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 29, 2021 at 10:56 AM Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> Remove the CONFIG_X86 conditionals from the source code. The driver
> already depends on X86 in the Kconfig file. Also, no one has been
> trying to build it on a non-x86 platform recently, or they would have
> noticed that drm_ttm_cache_flush() doesn't exist.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Thanks!

Signed-off-by: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
