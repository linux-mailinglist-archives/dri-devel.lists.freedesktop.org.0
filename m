Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 906E03C9F05
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jul 2021 15:00:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D1A36E84C;
	Thu, 15 Jul 2021 13:00:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com
 [IPv6:2607:f8b0:4864:20::72a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B17F66E854;
 Thu, 15 Jul 2021 13:00:13 +0000 (UTC)
Received: by mail-qk1-x72a.google.com with SMTP id 23so5072403qke.0;
 Thu, 15 Jul 2021 06:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=P9NP2ZXCtnUixASNcl6G9GBrniLmGpcnxXddxH11xYE=;
 b=DpNyUJdmjjeTxYHJSTQu5bApOZCfBYI9TiT53q77VDCcKkG0crGcJI4dKKDAJbVsXh
 ttbUHGXNl1D04/lrS2i0y49P83+W9tuDMsCHwwp+FquoPR3PDRgAaNkLYXQQPwTLEXTC
 eDh+lZwf7mfqgDp6Vr6tTnJJkYtV0C4Li+bii2KOL5uDMN0veOUCVuxO9T/iM+FL7Mvy
 7L+o059XVb3VdNyMb17OIRb0XKoSEwchn61l2M2zS/PHqmbWMqfqjvONVry7uPHjcAnm
 FYKWCKcHchOe11MIWaEAreNBtJE4bgkIoW7WBCq30VgcxCdcLqvFJ20pQ9wkPuj/Yovx
 qOjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=P9NP2ZXCtnUixASNcl6G9GBrniLmGpcnxXddxH11xYE=;
 b=JEIbGTaof3SOjnGRMW9QHQj9y70RarXOUEKgU534tMh2It6IWkQYS4N0Hx3kqbpGta
 4ZdPvmT9QwXHH/9rsXAspN8JvZmV3lUUV3ctTRKiIwCpZzlPMlWCykJ6Q8R4Ke0RocML
 p/vVx7r7ePZtNLBqiwG23a8TMooMyqfxcMP1wrxHB/L8SdTiO3cSn414VfbI0KWyClHl
 fVqtWHwXIefVcc2nBDjdET/i5wkGRk+3r4DwebtlbkxMBeWnzI9crRlZ5yryhCHqlsvn
 /3Jy7vCjNTjP0JJ6gW26WDuhZtkJVM0VnW2BURZEYXhVvG1DkaQJ6fYZmLgsuqyX2hga
 iGFw==
X-Gm-Message-State: AOAM531n3uEKMBjakRFW7lZnye01u9/xGEFqRrNIlbmMQGExOGh3KCFN
 uef7406RQ3cr5Q3WNKVRgG1OmlcRGNWOKLsPTZo36TBg82I=
X-Google-Smtp-Source: ABdhPJwf9lGcmHmZ47eylIAmZLK2Kf7ice6qZu1iIEVx7DjWUzTHc02P4/xcZB1UD+z3uv3LEQ9DRnP+gy4RBQpeAdI=
X-Received: by 2002:a05:620a:a19:: with SMTP id
 i25mr3906149qka.426.1626354012928; 
 Thu, 15 Jul 2021 06:00:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210714204452.1481805-1-jason@jlekstrand.net>
In-Reply-To: <20210714204452.1481805-1-jason@jlekstrand.net>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Thu, 15 Jul 2021 13:59:44 +0100
Message-ID: <CAM0jSHMm2Y6vtzHK8eLc2ZmhaTRWntbbcO5qM1iL53sc=dxS=Q@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Check object_can_migrate from
 object_migrate
To: Jason Ekstrand <jason@jlekstrand.net>
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Matthew Auld <matthew.auld@intel.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 14 Jul 2021 at 21:45, Jason Ekstrand <jason@jlekstrand.net> wrote:
>
> We don't roll them together entirely because there are still a couple
> cases where we want a separate can_migrate check.  For instance, the
> display code checks that you can migrate a buffer to LMEM before it
> accepts it in fb_create.  The dma-buf import code also uses it to do an
> early check and return a different error code if someone tries to attach
> a LMEM-only dma-buf to another driver.
>
> However, no one actually wants to call object_migrate when can_migrate
> has failed.  The stated intention is for self-tests but none of those
> actually take advantage of this unsafe migration.
>
> Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Matthew Auld <matthew.auld@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
