Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9496428EB54
	for <lists+dri-devel@lfdr.de>; Thu, 15 Oct 2020 04:58:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7B7D6EC15;
	Thu, 15 Oct 2020 02:58:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com
 [IPv6:2a00:1450:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BC456EC15
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Oct 2020 02:58:39 +0000 (UTC)
Received: by mail-ej1-x643.google.com with SMTP id md26so1394035ejb.10
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Oct 2020 19:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zL6HuqJW06phVnw3mPFDKmfWuZ0ko+HQIaeKJ1vcwYc=;
 b=BYEBqyoLH1GANcqjolripzDT1wKh68zJ/cc8tX1NQbosRFYNrg6A+uIe8U+q6owKIc
 X+Mx7D3y6mqp46DhWyW9UPln0mLOY0AtRfSjS2fk0d/dklnxzmz+yB6ZCj8Svo6g853p
 UEwtZeaYbviZ9JJcVvRBdY5YF5fww5meEc9vuXyh5lGtyWOWITJhXazW4TlOvTHm7j8t
 k3kQNfw8Ni9cZ1EYunLTCI/fBt1nPoSMm7M4S23aafoioSpLIRnKoz5f36uHYMxIzolF
 3T/PN5FDVWGJnDW0rtSvoVDCaWuLJACqEB3usZgb8LM+VSOE1pI1+H3d0Alj+lyIKoW3
 7YzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zL6HuqJW06phVnw3mPFDKmfWuZ0ko+HQIaeKJ1vcwYc=;
 b=E3kQoVaxnu9UR8HvXKe8UwMPyeqxDMX12jIQVcmX6ZxpeIVROASbD24UlS/QUz1j5F
 YB67DDx3J+F9GpnIdKCjkWux+00E3bYnKO29vheU1lelYQkrPDuCSQVTFUOOhlZA+Xml
 tRYTm32zNHw22ufhhNRJOaKFeG7eR13dsC5Nyec9LaJxnbLxV1bN0pKR8ncLZvF4y8Fz
 xd+JOd/q1EnO29E925oG79P2fimkplA0sCvE5GzVfaM4kZffFmZ909SIp4gxfioTHU/9
 uQU1DcTnUd2uQUSki7KBU2PgQGp5K128nLrs1YKlqRu4tnT2jCiPH1oeAXZfFjvyLgEk
 N4xg==
X-Gm-Message-State: AOAM5332bQVFxLEbLvp9O8zEXXny4AEhXFX4xTqbd8epj9vWYDVTmzcH
 +CB0ztgalQT8MiXO49nZUzaAjq8+9Y1c477fXjc=
X-Google-Smtp-Source: ABdhPJx9bDtPAnw1NcNpEmtyrGVXwwQvIXyQ9tlgU5BeYUKeXJZVCkFDXbqwqmWmdWV8X2Grt0sYVWeidfXyia2dWiA=
X-Received: by 2002:a17:906:3650:: with SMTP id
 r16mr2158378ejb.419.1602730717888; 
 Wed, 14 Oct 2020 19:58:37 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9txyMmW1DWhS--SuYQu4qDK1GPzgHJwxbAfhHT=hUsPODA@mail.gmail.com>
In-Reply-To: <CAPM=9txyMmW1DWhS--SuYQu4qDK1GPzgHJwxbAfhHT=hUsPODA@mail.gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 15 Oct 2020 12:58:26 +1000
Message-ID: <CAPM=9tzyZ3sxM4K40+dpm-eL=+QyN6RTj3HaJgD=HU5MCiKqjg@mail.gmail.com>
Subject: Re: [git pull] drm next pull for 5.10-rc1
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
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
Cc: LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 15 Oct 2020 at 11:33, Dave Airlie <airlied@gmail.com> wrote:
>
> Hi Linus,
>
> This is the main drm pull request for 5.10.
>
> Not a major amount of change, the i915 trees got split into display
> and gt trees to better facilitate higher level review, and there's a
> major refactoring of i915 GEM locking to use more core kernel concepts
> (like ww-mutexes). msm gets per-process pagetables, older AMD SI cards
> get DC support, nouveau got a bump in displayport support with common
> code extraction from i915.
>
> There are a bunch of conflicts but none of them seemed overly scary,
> and sfr has provided resolutions for them all. I've put a tree up with
> my merge results, so you can tell me I did it wrong here:
> https://cgit.freedesktop.org/~airlied/linux/log/?h=drm-next-5.10-merged

Apparently I lied, and I only built my merged tree on x86

https://lore.kernel.org/dri-devel/20201015134357.0a4e61b3@canb.auug.org.au/T/#t

Please apply the patch from this thread once you merge my tree.

Dave.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
