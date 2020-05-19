Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AB5671DA294
	for <lists+dri-devel@lfdr.de>; Tue, 19 May 2020 22:28:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF0686E398;
	Tue, 19 May 2020 20:28:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x944.google.com (mail-ua1-x944.google.com
 [IPv6:2607:f8b0:4864:20::944])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCF146E398
 for <dri-devel@lists.freedesktop.org>; Tue, 19 May 2020 20:28:46 +0000 (UTC)
Received: by mail-ua1-x944.google.com with SMTP id f9so448897uaq.2
 for <dri-devel@lists.freedesktop.org>; Tue, 19 May 2020 13:28:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8erGAo2k/DP4PJyj195lVIApeWxlW0xv9XQn7IYhn7Q=;
 b=S9TYi9687jx74ZtQK+S7wU+qGtpZK1oeWeAcBPZ9T2dtXToOdwdPLveLlblnQNKiRW
 DlzY9olyrrgAQYtY6jBoypcFWjf1oXvlxHTrH3bEPGURaz+dUOiFSB8XNmOLgEa6sRyN
 hHez9PdteT+m0REz9OuO8JcqwI9E2i99jtgxACrUGI4liuroHszP7s2zIbd6dIYCweCK
 cMLy3NIsouecrNedysfpqnXhPwEU2uClqyX7Vv7E+D7cU17XhIbcJiwy62zSQHMi2M4r
 luRhXBxAyS+VWvOCPfY7iEpfx8i1Q3+cdi3h5phYdp0xvVQBAcPqCg4offP8XyqZxLx1
 bwgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8erGAo2k/DP4PJyj195lVIApeWxlW0xv9XQn7IYhn7Q=;
 b=rsh/xOcxlW7gC6i+i/IQTKAaloTapFIosWPbyDGXLwPyUWPjctvO7VPcfFLQG8U+Fs
 xXgofCqt8RJXEhKfI7SipC3pU+mC9wsQvwEhrQbZZd6R59fJ3Ta3vi7PAXIVynAq2IFg
 nil3Pp+IAa+C0AGJMG6Fp4Nn69qz3EzINkIIhNCAB6YIUPaPBnBJVW48tD4AVZdfxxfg
 kaOVQ4MlR+fsosRoNupVGjKgFF8XAWH9r6XCyaBbWxbsJGBQqUm+OR612yJR7tpe6+pQ
 gww9Cx6omPg0VBC7FAJg6Tqvxcxe3rwvC5AphQFop38RrNJkvoe7ulXf0LTm/FyGKMKh
 57JQ==
X-Gm-Message-State: AOAM530JUUt44XwU8NXpIDCVGQcbUUxJvgcMXobikvCd5kleIVEv6x8E
 MnF7NReGyOLuDJflS545WaO/OXLpgEkf8r14uIo=
X-Google-Smtp-Source: ABdhPJwKc/Gfx94onZNrZV6EzkZV9cvKpGV3/gQpz9Ut4W8mF39DFyq3Y53SUfzXNwggaCKqKwc0lsgppVnmZmZ5hFA=
X-Received: by 2002:ab0:5ca:: with SMTP id e68mr975953uae.19.1589920125911;
 Tue, 19 May 2020 13:28:45 -0700 (PDT)
MIME-Version: 1.0
References: <20200519080423.21695-1-tzimmermann@suse.de>
In-Reply-To: <20200519080423.21695-1-tzimmermann@suse.de>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Tue, 19 May 2020 21:25:52 +0100
Message-ID: <CACvgo52BsyRVfP76hJ9znQu1-zRvqHdWj-RwFu5aBZcBdAVEAw@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] drm/udl: Map pages with SHMEM helpers
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
Cc: Dave Airlie <airlied@linux.ie>, Sam Ravnborg <sam@ravnborg.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 19 May 2020 at 09:04, Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> (was: Default to cachable mappings for GEM SHMEM)
>
> Udl implments cached mappings. Convert it to SHMEM's default helpers.
>
> v2:
>         * keep writecombine mappings as the default
>         * add SHMEM helper for creating BOs with cached mappings
>         * update udl on the new helper
>
> Thomas Zimmermann (2):
>   drm/shmem-helper: Add .gem_create_object helper that sets map_cached
>     flag
>   drm/udl: Use GEM vmap/mmap function from SHMEM helpers
>
For the series:
Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>

>  drivers/gpu/drm/drm_gem_shmem_helper.c |  27 +++++++
>  drivers/gpu/drm/udl/Makefile           |   2 +-
>  drivers/gpu/drm/udl/udl_drv.c          |   4 +-
>  drivers/gpu/drm/udl/udl_drv.h          |   3 -
>  drivers/gpu/drm/udl/udl_gem.c          | 106 -------------------------
>  include/drm/drm_gem_shmem_helper.h     |   4 +
>  6 files changed, 34 insertions(+), 112 deletions(-)
>  delete mode 100644 drivers/gpu/drm/udl/udl_gem.c
>
Please keep going with these nice stats \o/

-Emil
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
