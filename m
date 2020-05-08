Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D29BC1CA82C
	for <lists+dri-devel@lfdr.de>; Fri,  8 May 2020 12:18:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD2FB6EAD8;
	Fri,  8 May 2020 10:18:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x942.google.com (mail-ua1-x942.google.com
 [IPv6:2607:f8b0:4864:20::942])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9C5F6EADC
 for <dri-devel@lists.freedesktop.org>; Fri,  8 May 2020 10:18:41 +0000 (UTC)
Received: by mail-ua1-x942.google.com with SMTP id g35so449327uad.0
 for <dri-devel@lists.freedesktop.org>; Fri, 08 May 2020 03:18:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Q8u85ZjNJ9Li15/GCH6qGHPOluD2BtOLVur29uHqzSI=;
 b=V1yiD96cItC84sPGa9ioH2NDdclNOgyn35a80W41dFeqSlp0+bgmkl0b/UbbdAGdIP
 gXfxd1QSfSE4RPa7s+PO5eyEvGzIERkm/ohl9M34yeVNUWgwOEd5maSKx5d5J+4/Jj6V
 nUSeEdCejHeCjRHDIS0C3qT4xPixc59xcgHFE3rAzjpfOPzKh9LsGVgvDSbkHIe86hmO
 vhyiiAb+MyCZBSFIK6r15xs1oEirmhUGtG8+NbVoWpmphUYwH0Erlc2JDFuTRD1bVQlC
 fgiEH/3IcBW2MHkyQ/epp9HPRvN9UkBxBRhjG14eoqOwEScd5Po6UQJsX/B741/CRV7f
 IIQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Q8u85ZjNJ9Li15/GCH6qGHPOluD2BtOLVur29uHqzSI=;
 b=MScCbogD1x65y1kcfaZxXFXwRf6nyhHgQucd6SO0Fi0z5ZQXkaXY2ldoPZrWBsTM4r
 4dV5XbxPidjNhmyWZszD7Vp5Edrxquo9OaySEAbM0M6Ok1PP2Gm92eEAN+cXQ+y5GUPA
 hbeRrwWIv6y4lb6b3oVOHTXgpUTLOEsWIUWObDVt/sWa90NmYarcQt0BIPUbUkph77bP
 IyhtGN4KUgwsNwRwlEOjKfncbORgRVQnxcHyIffh6AH3CL4+cKUhzxMENtO7aF4I6iCp
 hTL88Iq9NH4pc7CHrctyz8uj8m4S5yqUYILhEPnlZSUF4bAC290m8BBrw8vmkb6sCUeQ
 c1hg==
X-Gm-Message-State: AGi0PuYE4AgoMcsaSA/UetKxPZjWkycdtlv+w3882eX7UVHUyfal0UFX
 1zRZk7e3SCgD55nIoSWMOY0XcHNsU0nTe/c24EWgow==
X-Google-Smtp-Source: APiQypLVHek62w/oI6pp3RiIDgJ4Yzr5tUm98DaHmYzuqww3TQZ2EfMAJtDEz/vhvt49/Ga29p4+4ogIlt+VoxVwQmo=
X-Received: by 2002:ab0:18d:: with SMTP id 13mr1254305ual.69.1588933121036;
 Fri, 08 May 2020 03:18:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200507150822.114464-1-emil.l.velikov@gmail.com>
 <20200507150822.114464-12-emil.l.velikov@gmail.com> <87wo5n542l.fsf@intel.com>
In-Reply-To: <87wo5n542l.fsf@intel.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Fri, 8 May 2020 11:16:09 +0100
Message-ID: <CACvgo523tCXjGnGCpSWZLjUux7SG7C5VJFWUJK8GxpB0g+H6ow@mail.gmail.com>
Subject: Re: [PATCH 11/36] drm/gem: add drm_object_put helper
To: Jani Nikula <jani.nikula@linux.intel.com>
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
Cc: ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 8 May 2020 at 07:33, Jani Nikula <jani.nikula@linux.intel.com> wrote:
>
> On Thu, 07 May 2020, Emil Velikov <emil.l.velikov@gmail.com> wrote:
> > From: Emil Velikov <emil.velikov@collabora.com>
> >
> > Spelling out _unlocked for each and every driver is a annoying.
> > Especially if we consider how many drivers, do not know (or need to)
> > about the horror stories involving struct_mutex.
> >
> > Add helper, which will allow us to transition the drivers one by one,
> > dropping the suffix.
> >
> > Signed-off-by: Emil Velikov <emil.velikov@collabora.com>
> > ---
> >  include/drm/drm_gem.h | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> >
> > diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
> > index 0f22f3320dcb..70c0059ee72b 100644
> > --- a/include/drm/drm_gem.h
> > +++ b/include/drm/drm_gem.h
> > @@ -364,18 +364,20 @@ static inline void drm_gem_object_get(struct drm_gem_object *obj)
> >  }
> >
> >  /**
> > - * drm_gem_object_put_unlocked - drop a GEM buffer object reference
> > + * drm_gem_object_put- drop a GEM buffer object reference
>                         ^
>
> Missing space.
>
Thanks fixed.

-Emil
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
