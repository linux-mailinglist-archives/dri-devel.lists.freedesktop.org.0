Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A135754070
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jul 2023 19:26:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBE2610E10E;
	Fri, 14 Jul 2023 17:26:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe34.google.com (mail-vs1-xe34.google.com
 [IPv6:2607:f8b0:4864:20::e34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A9D310E10E;
 Fri, 14 Jul 2023 17:26:35 +0000 (UTC)
Received: by mail-vs1-xe34.google.com with SMTP id
 ada2fe7eead31-440b9d60606so847947137.1; 
 Fri, 14 Jul 2023 10:26:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689355594; x=1691947594;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1mAgclljv5o/aMLISpskQlH5O1cIlPLCvHjF6I6Xhl0=;
 b=Sdi50qWxDVmpfpR9yAOwbvMJxkNACxSHIvPlQHn5QW/ydralkVzyW5PFYQc6Cw4/be
 ml9ZdsspIYAzUcQuuvxXXAAXsR9xd+6POVL61o7KP5W2gNnOkGIsR/ZFG3baDTX4itdA
 3bBxUi31Zeja1jKQetbHYEFl82edDdiIuo1+2kgx+6O30sxlQIHgKd2YDXrw5LwER8qD
 4vqerJ5kO/2LEwGbbQyXAfsYFdz5ZKS0J477V5LuUfz+ZrCcNG7Qj9wNYLrf6CG1v4Jl
 nCtCIe2j41HUkrdOciCP/aF1s5ex0Rd8h01ZRMYmohv9cvcwratBam6mijBSs2artuyF
 1HhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689355594; x=1691947594;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1mAgclljv5o/aMLISpskQlH5O1cIlPLCvHjF6I6Xhl0=;
 b=JfLsTByg0MG/q13vPDytDERbGHIOHdbHkgGUFAl5w0C/vki1bXaq5g9B8QXbS0ZmOU
 TB510c2Vy8iMbsx4TGtC1PA+XwQwqcKbwyj8wBC8vWmVYaIO3wck4FXxuhoy0HEH1Bfo
 WTNzfH2GCtSx0tPaSmrGDnAMtmIFidGpt9InHFP9TZ52dMBkdxhGisIkAsJhyNPbh6v3
 lZOr+5yinntE7P/wzzZbymy19V8339gV7yCIq4lG7WYMNotSXf+G1qKIWhu+gHPFowm+
 7kTU8SQqkB/4UeKkUUr6w/kjy0nrPS2ov/Jo44Ux6Ehwk1jc8mM6SyA8q7wjnocaa4Bv
 SPww==
X-Gm-Message-State: ABy/qLZASOQx1tlGYSuWKU8BrIopSEvvWLH54yYoz5OwCzXrUIwwEQCx
 iKgPlSyxY8APrlzrDnZfPmATSJnt8VTBHvGcVGM=
X-Google-Smtp-Source: APBJJlFHbcDnDvP4z879dm67J+CIsQU+E2UFFcItQwOdwy7jRkl60+B8Hlu1ITKA4UEn0reT1KdxVabKqwM1RP7+WBM=
X-Received: by 2002:a67:b901:0:b0:443:8898:2a50 with SMTP id
 q1-20020a67b901000000b0044388982a50mr2784041vsn.35.1689355593821; Fri, 14 Jul
 2023 10:26:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230713163626.31338-1-jim.cromie@gmail.com>
 <20230713163626.31338-21-jim.cromie@gmail.com>
 <07f0c6ac-f195-e598-4649-e88ad5e76005@infradead.org>
In-Reply-To: <07f0c6ac-f195-e598-4649-e88ad5e76005@infradead.org>
From: jim.cromie@gmail.com
Date: Fri, 14 Jul 2023 11:26:07 -0600
Message-ID: <CAJfuBxy7Z+=5b2rP0diRUYT0a8wsZvD9+vUh+cBOX2eeGG04ig@mail.gmail.com>
Subject: Re: [PATCH v4 20/21] config TEST_DYNAMIC_DEBUG default m
To: Randy Dunlap <rdunlap@infradead.org>
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
Cc: jani.nikula@intel.com, daniel.vetter@ffwll.ch,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, jbaron@akamai.com, seanpaul@chromium.org,
 dri-devel@lists.freedesktop.org, gregkh@linuxfoundation.org,
 intel-gvt-dev@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 13, 2023 at 1:04=E2=80=AFPM Randy Dunlap <rdunlap@infradead.org=
> wrote:
>
> Hi Jim,
>
> On 7/13/23 09:36, Jim Cromie wrote:
> > Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
> > ---
> >  lib/Kconfig.debug | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
> > index d4fbbcc395d2..82d11ac63758 100644
> > --- a/lib/Kconfig.debug
> > +++ b/lib/Kconfig.debug
> > @@ -2696,13 +2696,14 @@ config TEST_STATIC_KEYS
> >
> >  config TEST_DYNAMIC_DEBUG
> >       tristate "Build test-dynamic-debug module"
> > +     default m
>
> You need to justify such a change, and since it's not required
> for running the system, I don't think it should be 'm'.
>

meh, now I cant "justify" the bored/curious comment. ;-)
I'll drop this patch.

> >       depends on DYNAMIC_DEBUG || DYNAMIC_DEBUG_CORE
> >       help
> >         This module works/demo's the dyndbg's classmap API, by
> >         creating 2 classes: a DISJOINT classmap (like DRM.debug)
> >         and a LEVELS/VERBOSE classmap (where 2>1).
> >
> > -       If unsure, say N.
> > +       If unsure, say N.  If bored/curious, say M
> >
> >  config TEST_KMOD
> >       tristate "kmod stress tester"
>
> --
> ~Randy
