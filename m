Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5890720C4AB
	for <lists+dri-devel@lfdr.de>; Sun, 28 Jun 2020 00:09:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A5476E145;
	Sat, 27 Jun 2020 22:09:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CFCB6E145
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Jun 2020 22:09:23 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id s1so13963127ljo.0
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Jun 2020 15:09:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9jJ0upPzGdRnfnZ1hTOkaFEGeu73NviogiaIXzHgu1g=;
 b=sE+BQuOOYL3jixtxLIdddAA84C3CVhIi8mfRWmrs1v7kCulgoFOm7hE++fzy47IkXJ
 RjNKfD8JA/byQDHOIiC9qMt9QXnanAyx6uQuPtzkFXX7ljcjfjAa8G9LTyavatszA0sY
 JVxJCcl5X54MEgHAkQ5aLAudn/AklLoSjTMccIQDR/GbtVj7YDzXPmD6zO+hrtBaYfi9
 evomx1mBtloTqDAj2bwjJ0bLMZ0Y0DwkI/viBs1ljBCHLBu10TzYWkUEm02N0X1PgnRT
 O9CiJRA2ufA8uRGgzgqljQ4qlnq6uBzS1oPCArE4SWT7O/v5L1AAZlF1VDg6d4cYBioO
 Wz8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9jJ0upPzGdRnfnZ1hTOkaFEGeu73NviogiaIXzHgu1g=;
 b=lXxkH0nlvT8VPQIlbpUfl8eAIlZUPSCs1UG1jmxK/bPY838XV63H8FTzQ/smSKWkjB
 LyaXYnr719SB5fR7+8xjKOoN5s74TcQWzTDgzYItiHgfu1+HE8BWbMuEH+jGLqmHtxZs
 +zOPfmnOT5WtdP4M9M43flCDXPAoIIZRVMejwb4avdpyF4cS2YDY9X0mSmwiBoYM9WCX
 Ei+x+zptZUKjWfppnfSwKZKavvxfPHfRqh+p0bVK6BcmyPlipwo0yYLPSJJfx0FkSICO
 jETpaelr+X7xcuEV2mXG1AgXaP9fwxld0tt41oWxjSoAom8xWqOt+svkvGT/u0u2M8yU
 C7CA==
X-Gm-Message-State: AOAM532VBXzrGKM0GBEeD0Jvvpnzx9pYLLSu4gBxw7hoNrdNV42V0MwD
 XJrXzEKPtuuV3z1wykO7zCISlNPZYfmMzlJtab3iExNVkZo=
X-Google-Smtp-Source: ABdhPJzTYmzUYevAiWYs3GtOcpcdZIgiXyT8BOQSYaCBJfGVOUu9+AbTZCS84SPOvzEhBpeMTzxqv9QYsUCUhA5uLEU=
X-Received: by 2002:a2e:351a:: with SMTP id z26mr4575579ljz.144.1593295761707; 
 Sat, 27 Jun 2020 15:09:21 -0700 (PDT)
MIME-Version: 1.0
References: <20200626220134.340209-1-linus.walleij@linaro.org>
 <CAMeQTsYEzCTUUAqgfo3xGNYeZg1RM+kXT7CYNDMLwC9gOV1_-w@mail.gmail.com>
In-Reply-To: <CAMeQTsYEzCTUUAqgfo3xGNYeZg1RM+kXT7CYNDMLwC9gOV1_-w@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 28 Jun 2020 00:09:10 +0200
Message-ID: <CACRpkdbFyMkJ7sKM1EL0utAhrsVvn7HjtnTgVBYXwPhB8qAYcA@mail.gmail.com>
Subject: Re: [PATCH] drm: gma500: Drop surplus include
To: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Jun 27, 2020 at 10:07 PM Patrik Jakobsson
<patrik.r.jakobsson@gmail.com> wrote:
> On Sat, Jun 27, 2020 at 12:01 AM Linus Walleij <linus.walleij@linaro.org> wrote:
> >
> > This file includes <linux/gpio.h> but does not use any
> > symbols from it, drop the include.
>
> Hi Linus,
> Seems the include should be moved to mdfld_dsi_output.c instead.

Yeah we are in include file hell :/

I'll figure it out.

Yours,
Linus Walleij
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
