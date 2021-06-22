Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0840A3B0D90
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jun 2021 21:20:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16E8C6E072;
	Tue, 22 Jun 2021 19:20:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2a.google.com (mail-oo1-xc2a.google.com
 [IPv6:2607:f8b0:4864:20::c2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E29096E156
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jun 2021 19:20:04 +0000 (UTC)
Received: by mail-oo1-xc2a.google.com with SMTP id
 v11-20020a4a8c4b0000b029024be8350c45so115118ooj.12
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jun 2021 12:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=IXTyvMzccD44HreGd+lTW6UPC/c6n0CNj/56dlhspnE=;
 b=jnrGKCc5k+rj2MWFkDqYwdwLo96z0bMl1L8GBzaSBanYW5s9QkrSoWIBy0C8sqBpiE
 sJp0+r8NksBdwWhFF0jipEeTILNVYlU4GGWVUekaNY/wa/lXH+zpc8tYd9r6p58jVT/q
 Y5HpOmjHxg7Zv+LdXx+OztqFobp4mnwzmSb0w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=IXTyvMzccD44HreGd+lTW6UPC/c6n0CNj/56dlhspnE=;
 b=RCIi3DKg7DQiMVovHrIqj/jG61MZYUPJ27R4xje4q7mtZcgSmzMpGbYZxZ2BHfK0aT
 iBn58G+JrnjYz6ouL43VUgIc6T5wVTazeZzO5CaOu/K1/VwTO2+OxSI3Jt28u7A/r0/F
 ZjKFcXwvSiJDdJ1AVMRIFjlLJEU562TNrFjL/Dl347RcW9O/KGepnu6hOU1kMqkGo3GS
 SaZsooMZXxP9dfPfxvKJE2YnFC1IhOgKpZVeppq8nP1tsLLNW+7kzaWe0BeifpXInsj8
 OoegPuc7LSf1OLarA2NAfXlWmdbBhKWArw7xCdgyIvt5ly0+Q9AkWKjcNMfDz6vhMhkj
 6tNg==
X-Gm-Message-State: AOAM530uQc6/GHfsCtLOjxmcDevLbyTI9BkA1T8Z4yXkXynqfzSecDPS
 3NMj+T8OmNbQV0lhiPggPULMZ8cwB5LUmXQa4xyDmCahjc4=
X-Google-Smtp-Source: ABdhPJymCc3vHixvjSqTi5/BbnUPvRWX6NdnjghdlEx76K/WySHKdsKsTkAYb3Xk7+ky8kEKHa35K21lsy/Je7GeXFo=
X-Received: by 2002:a4a:9b99:: with SMTP id x25mr4621885ooj.85.1624389604204; 
 Tue, 22 Jun 2021 12:20:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210622165511.3169559-1-daniel.vetter@ffwll.ch>
 <20210622165511.3169559-2-daniel.vetter@ffwll.ch>
 <YNIw1g5HVCzvmKzP@ravnborg.org>
In-Reply-To: <YNIw1g5HVCzvmKzP@ravnborg.org>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Tue, 22 Jun 2021 21:19:53 +0200
Message-ID: <CAKMK7uE-c7evbXhNs9htsJ2wKWSMVcS=HHauvQ19-+9BT8NwSw@mail.gmail.com>
Subject: Re: [PATCH 01/15] dma-resv: Fix kerneldoc
To: Sam Ravnborg <sam@ravnborg.org>
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 22, 2021 at 8:50 PM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Hi Daniel,
>
> On Tue, Jun 22, 2021 at 06:54:57PM +0200, Daniel Vetter wrote:
> > Oversight from
> >
> > commit 6edbd6abb783d54f6ac4c3ed5cd9e50cff6c15e9
> > Author: Christian K=C3=B6nig <christian.koenig@amd.com>
> > Date:   Mon May 10 16:14:09 2021 +0200
>
> this is what we uses Fixes: ... for.
>
> It looks wrong to hide it in the description.

I've honestly become a bit vary of using Fixes: for docs/comments
because the stable autoselect bots are _really_ keen on picking up
anything with a Fixes: line in it. And that feels a bit like nonsense.
-Daniel

>
>         Sam
>
> >
> >     dma-buf: rename and cleanup dma_resv_get_excl v3
> >
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > Cc: Sumit Semwal <sumit.semwal@linaro.org>
> > Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> > Cc: linux-media@vger.kernel.org
> > Cc: linaro-mm-sig@lists.linaro.org
> > ---
> >  include/linux/dma-resv.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
> > index 562b885cf9c3..e1ca2080a1ff 100644
> > --- a/include/linux/dma-resv.h
> > +++ b/include/linux/dma-resv.h
> > @@ -212,7 +212,7 @@ static inline void dma_resv_unlock(struct dma_resv =
*obj)
> >  }
> >
> >  /**
> > - * dma_resv_exclusive - return the object's exclusive fence
> > + * dma_resv_excl_fence - return the object's exclusive fence
> >   * @obj: the reservation object
> >   *
> >   * Returns the exclusive fence (if any). Caller must either hold the o=
bjects
> > --
> > 2.32.0.rc2



--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
