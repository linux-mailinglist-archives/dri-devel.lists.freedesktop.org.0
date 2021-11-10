Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1323C44C514
	for <lists+dri-devel@lfdr.de>; Wed, 10 Nov 2021 17:34:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA04D6E2D5;
	Wed, 10 Nov 2021 16:34:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E95526E2D5
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Nov 2021 16:34:47 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id f4so12800716edx.12
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Nov 2021 08:34:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+7ZipcyAMf+xy36NA8v+/8GugYRNsmRJnapkEJJAuo8=;
 b=AN7ihFhjpK99DwvsrHZTWnVZFdr0KauEAy4C642JZMx6uWHHaTpAnWvASF2sWaL+LZ
 j1X+B2UIM2KAcBTsufog1zwVYcsaa+A9+q37yuSGu4rq5L7cKdE+ob6GQ1j2mO9D6A32
 eh6FwiG2BMPQNPu35fyKS3uzX4J86FTN8fXGxtLg+YmcFrQlT/waHDfkc9lg68UNWXh8
 rALqoQfebjEjWhRnnNQN9Cwg+f9R0I0F9dm0B058Yb3PMBJYpJx78Kq+2sZfd2I/fT7F
 WiwuK+Ctp5LTvJtor0aeVrank2VNyEwYT0Ed3LDRKOZ9z9UyQIIgsWeWRp1oFnQa2xF3
 FfVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+7ZipcyAMf+xy36NA8v+/8GugYRNsmRJnapkEJJAuo8=;
 b=w9YG5DG6OWpcWNYNqY+JipoCcvhRLLX85RmkPU7cFud1UuyzAEdbnInVwaPE32MjlR
 QIW3SKvhVcnMrc+d69RcNDo/c1bNFhQkhIM/zhA5mA1ieJ5Wc3RtmU9AlkmrCRlRyY/K
 lWWgdVLo3U45Xta0rw2v6aQwql0msmYzAseOgf7fN8oukLoDCz/6n0Ebe0A9ksUnApI3
 9VQyFiO0uzOwNZBTAsSUUxn4YeGlBYwj6kUAY5ehtTsjEt0S53CtDWlV4KEu3zkPUxKX
 PIJszTMioxzWiSc3+lNQ6s9HCwP0I9iecHxFv7Hg/1Y1+n9ENs0zOzCVz7cpc9YKGJRO
 ufwA==
X-Gm-Message-State: AOAM532sLUcqt6uCGq8AwmfLViA4C18b2yVUKOoItwHGivVqZV1eIuOv
 J3iOIjmZe+eWPP6iIhjnHp/Q9ZQcXQKZFyhDr2w=
X-Google-Smtp-Source: ABdhPJzOHrBedyTIQreQOvJURrRSadZrgp6g9ZNWyLgzfFiP7g+ZM7OmyCuFRXfjmY15E/YjBMXy0o8IAWhUa8SQ8rY=
X-Received: by 2002:a50:9ee3:: with SMTP id a90mr331711edf.224.1636562086367; 
 Wed, 10 Nov 2021 08:34:46 -0800 (PST)
MIME-Version: 1.0
References: <20211110102423.54282-1-andriy.shevchenko@linux.intel.com>
 <887a15cb-3a3b-4ba2-aa0f-a241e70a19fa@suse.de>
In-Reply-To: <887a15cb-3a3b-4ba2-aa0f-a241e70a19fa@suse.de>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 10 Nov 2021 18:34:01 +0200
Message-ID: <CAHp75VdY57xQBLN8vT3RdagQx=4kLx69qAyuzLwqTvNGC2xUbQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] drm: Replace kernel.h with the necessary inclusions
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: David Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 10, 2021 at 3:55 PM Thomas Zimmermann <tzimmermann@suse.de> wrote:
> Am 10.11.21 um 11:24 schrieb Andy Shevchenko:
> > When kernel.h is used in the headers it adds a lot into dependency hell,
> > especially when there are circular dependencies are involved.
> >
> > Replace kernel.h inclusion with the list of what is really being used.

...

> > +#include <linux/container_of.h>
>
> I built this patch on a recent drm-misc-next, but there's no
> linux/container_of.h

Thank you for trying. It's in the upstream, whenever drm-misc-next
switches to newer/newest upstream it will be there. I assume it will
happen after v5.16-rc1?

-- 
With Best Regards,
Andy Shevchenko
