Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC5101CF285
	for <lists+dri-devel@lfdr.de>; Tue, 12 May 2020 12:33:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A60946E897;
	Tue, 12 May 2020 10:33:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe42.google.com (mail-vs1-xe42.google.com
 [IPv6:2607:f8b0:4864:20::e42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E2B66E897
 for <dri-devel@lists.freedesktop.org>; Tue, 12 May 2020 10:33:20 +0000 (UTC)
Received: by mail-vs1-xe42.google.com with SMTP id a5so7525427vsm.7
 for <dri-devel@lists.freedesktop.org>; Tue, 12 May 2020 03:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tUlWQGWHJ+63U8ogE+txYPGgS/ppSz8pxJUGE/zc/f8=;
 b=Eh/FVVc9TZFg77xrLgCov2gSBuA+1bibEAlOMScM9jx8ZCnd5uHohpIL4lxBwOQPiS
 4r9LeV155vrbFWFHXHLE44fAK2RJUG9aMKkaXnmebkGH+kfrI3AfIq328+0BaW8KpIEP
 oOEeyIw4v9O35Qt9svVXOf/dLU8VicnLA9fS7ENiGDgZVd93js+/XSLu6zfrKk/DfERe
 ATQugNkRHyTKUtQAj46HDabNqqpupg7ePBAK/hKqEE2q+FAG2mmDyBR5LHxqv0cXzP03
 j3peHIPttmbybzUMysN2UqiEEPd8p5P3j5mhoKdk5UgRi69G5R438pAb00xru8a2jSbG
 Hh9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tUlWQGWHJ+63U8ogE+txYPGgS/ppSz8pxJUGE/zc/f8=;
 b=dpDqPj556UzSQ2oNLcFp0KUlWQ+LdzCFSiNAm1rS72z7LAJCd8P5rSJhV/wmafLfUC
 J1l+rqvqQHe5cQe29qtsHATDax5jd5Lg8EAOjCwX2HZ4KGMvX5qCUaefCQR7ECVDm8OY
 SeckgRs5NKru5EnJD8P8FAlnRM//PLrhYPooJGaGn0lH2UXIGITTtgPoHtEKmesGTEN4
 mpRfxOVKbxXayt4E9yZX21wwEmYBpJnb0F3aek1PjyOjcArH2wBpeBg1y7tQRTja9XC0
 dv/tkJutdKirCGm/9yoRk1hwxoOYj/wrO17vg4nstac6O7KeEDn4oR0Q9L2pcyu8Ia5C
 sPhg==
X-Gm-Message-State: AGi0PuYz7VXCjt8H0HeiYraPukDiqDdooJy5sDpXwgRU+0tIahmhirDp
 2EqKSWx7lEAIlKrvwCFQi/IFPVm4dnu5ZvQjmhw=
X-Google-Smtp-Source: APiQypIifXjXp/xQQ6PlB/MkawHXUyc2nuVqY9oPSJNRHB/AXUAHeb2KttZdjwRAu6WBYn4Weho8vK5jJ6mnJgbV11g=
X-Received: by 2002:a67:b91a:: with SMTP id q26mr15612382vsn.118.1589279599693; 
 Tue, 12 May 2020 03:33:19 -0700 (PDT)
MIME-Version: 1.0
References: <20200512084258.12673-1-tzimmermann@suse.de>
 <20200512084258.12673-16-tzimmermann@suse.de>
In-Reply-To: <20200512084258.12673-16-tzimmermann@suse.de>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Tue, 12 May 2020 11:30:41 +0100
Message-ID: <CACvgo50wj8WGC2H4bb1mMsUDMS2MFXvS23FSvSba-swB5SHyXA@mail.gmail.com>
Subject: Re: [PATCH v2 15/15] drm/mgag200: Replace VRAM helpers with SHMEM
 helpers
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
Cc: john.p.donnelly@oracle.com, ML dri-devel <dri-devel@lists.freedesktop.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Dave Airlie <airlied@redhat.com>,
 Sam Ravnborg <sam@ravnborg.org>, Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 12 May 2020 at 09:43, Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> The VRAM helpers managed the framebuffer memory for mgag200. This came
> with several problems, as some MGA device require the scanout address
> to be located at VRAM offset 0. It's incompatible with the page-flip
> semantics of DRM's atomic modesettting. With atomic modesetting, old and
> new framebuffers have to be located in VRAM at the same time. So at least
> one of them has to reside at a non-0 offset.
>
> This patch replaces VRAM helpers with SHMEM helpers. GEM SHMEM buffers
> reside in system memory, and are shadow-copied into VRAM during page
> flips. The shadow copy always starts at VRAM offset 0.
>
I suspect MGAG200_FLAG_HW_BUG_NO_STARTADD is left around for
documentation purposes?

I've made a few small comments, but regardless the series is:
Acked-by: Emil Velikov <emil.velikov@collabora.com>

-Emil
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
