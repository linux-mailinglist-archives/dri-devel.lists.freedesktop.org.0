Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 481C2417D5D
	for <lists+dri-devel@lfdr.de>; Fri, 24 Sep 2021 23:59:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E56436EE8A;
	Fri, 24 Sep 2021 21:59:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com
 [IPv6:2607:f8b0:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F10026EE96
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Sep 2021 21:59:29 +0000 (UTC)
Received: by mail-il1-x133.google.com with SMTP id b12so194139ilf.11
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Sep 2021 14:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2sQbzmqOLaa21D/rAV+moo+kYzU+T5wGBoSvZFQoujo=;
 b=k8yvuVRCC6FqRS0v1P7blOuRsgBy/yhKtUdUiAyralseuHTygqFpQOclrMrBx950dS
 cyoM2vDSrBMyBhKnByXnYt/lccbFvLZY3dxRImMEKXVnIKGMGelfV86vJzL1OrlnkQdv
 aLiPXYuPZgWgI4nQUU1FgEwVIpGgnsyvcBZF0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2sQbzmqOLaa21D/rAV+moo+kYzU+T5wGBoSvZFQoujo=;
 b=Er05BxQzLJixphyPTU+hwztqpzn8vf1sat4R1Ly3z/SXO3tjFuwuO58sVOOPqz3g5U
 hzBjr9sjSEDKckA4zsp7u/7vgUNQ6HHrRahNQIQ9jtWzpMUVvMx43KRyFyNzau6Q3+Iu
 e/pmKjNSJvljlPHnhW6IqFS3BucTjFuiAWjwRD7ZAjpNrpekReF/uUuYoMUS+yXpc4xL
 WwR4yoMKKr/mg8eqBXcOvNvl0VZ31UEDvGOMhBnHNyU+3wGm29xZFeW2nCi+p2ghk0v9
 tArTtCvo+KkAJTjxngzxHjx8u1qeTf8/iWhoUxqJ8USC1u33ReleQ4XzSB4B408TpBxB
 po0w==
X-Gm-Message-State: AOAM530M9qdS4n8v3VyWgl/coPqVo//L6+nA9Q6Z66mCIEGwLfK/sUR0
 jMDQppwOf6PQK3aZGv5jts/g1J8vcVV/DQ==
X-Google-Smtp-Source: ABdhPJxIk4rPiWWYb7uisL2DJzx92ggDzy+k7nX7fWo/Uhx6UAKzS41stq29jFR2PAjun2qGqcRJWg==
X-Received: by 2002:a05:6e02:1c41:: with SMTP id
 d1mr10089526ilg.31.1632520769163; 
 Fri, 24 Sep 2021 14:59:29 -0700 (PDT)
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com.
 [209.85.166.172])
 by smtp.gmail.com with ESMTPSA id a16sm4777230ili.64.2021.09.24.14.59.28
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Sep 2021 14:59:28 -0700 (PDT)
Received: by mail-il1-f172.google.com with SMTP id h20so11946320ilj.13
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Sep 2021 14:59:28 -0700 (PDT)
X-Received: by 2002:a05:6e02:1b0c:: with SMTP id
 i12mr10210513ilv.27.1632520767633; 
 Fri, 24 Sep 2021 14:59:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210921082757.RFC.1.Ibd82d98145615fa55f604947dc6a696cc82e8e43@changeid>
In-Reply-To: <20210921082757.RFC.1.Ibd82d98145615fa55f604947dc6a696cc82e8e43@changeid>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 24 Sep 2021 14:59:15 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UMkkSrCQHfsUwkc_W8BmG-doH8jmNC1ckrh4w1rYbcxA@mail.gmail.com>
Message-ID: <CAD=FV=UMkkSrCQHfsUwkc_W8BmG-doH8jmNC1ckrh4w1rYbcxA@mail.gmail.com>
Subject: Re: [RFC PATCH] drm/print: Add deprecation notes to DRM_...()
 functions
To: dri-devel <dri-devel@lists.freedesktop.org>
Cc: Sam Ravnborg <sam@ravnborg.org>, Daniel Vetter <daniel.vetter@ffwll.ch>, 
 Lyude Paul <lyude@redhat.com>, Jani Nikula <jani.nikula@intel.com>, 
 Stephen Boyd <swboyd@chromium.org>, David Airlie <airlied@redhat.com>, 
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, LKML <linux-kernel@vger.kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, Sep 21, 2021 at 8:28 AM Douglas Anderson <dianders@chromium.org> wrote:
>
> It's hard for someone (like me) who's not following closely to know
> what the suggested best practices are for error printing in DRM
> drivers. Add some hints to the header file.
>
> In general, my understanding is that:
> * When possible we should be using a `struct drm_device` for logging
>   and recent patches have tried to make it more possible to access a
>   relevant `struct drm_device` in more places.
> * For most cases when we don't have a `struct drm_device`, we no
>   longer bother with DRM-specific wrappers on the dev_...() functions
>   or pr_...() functions and just encourage drivers to use the normal
>   functions.
> * For debug-level functions where we might want filtering based on a
>   category we'll still have DRM-specific wrappers, but we'll only
>   support passing a `struct drm_device`, not a `struct
>   device`. Presumably most of the cases where we want the filtering
>   are messages that happen while the system is in a normal running
>   state (AKA not during probe time) and we should have a `struct
>   drm_device` then. If we absolutely can't get a `struct drm_device`
>   then these functions begrudgingly accept NULL for the `struct
>   drm_device` and hopefully the awkwardness of having to manually pass
>   NULL will keep people from doing this unless absolutely necessary.
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>
>  include/drm/drm_print.h | 30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)

Landed in drm-misc-next:

306589856399 drm/print: Add deprecation notes to DRM_...() functions
