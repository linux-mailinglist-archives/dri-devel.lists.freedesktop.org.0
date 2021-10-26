Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 975BB43A94A
	for <lists+dri-devel@lfdr.de>; Tue, 26 Oct 2021 02:35:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EF206E0E1;
	Tue, 26 Oct 2021 00:35:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 623AF6E0E1;
 Tue, 26 Oct 2021 00:35:05 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id r12so6661894edt.6;
 Mon, 25 Oct 2021 17:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=umu61gmSni9VMLgA3ejYnqkYm9CijWS54dhpUy2cKRw=;
 b=fXoJCwhlB4R5TRwyMvqzsXWKn0q2v3a4Pq6ObSOJ5GmuAzBM+j2BEDC61uXJnVukKs
 929J5zeRK0wV9YQj3Oh3JU0kVY8+idFsGWQbXG/2gZIq346sC0yZIaDM9qWvee+Fh4kK
 t/wpLgxgUlLD40+JWAdB03yAKJ7stdXW/m9aF1Cu9NLjT+o2A61ChbxWsi4i6DoApRJi
 fK9uMNHQZn5VHkKMOtJ2oDWIZqsjBjBPAy8oP61bIvUbr/uPdx0om7psRQukg92SNFkN
 s12E8UQcaFhDaavJK2MGMvoCNg1ADDPTmk3BbSLEnc593HJFf4ZbAvZJQGTEq5j//TmC
 Y3QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=umu61gmSni9VMLgA3ejYnqkYm9CijWS54dhpUy2cKRw=;
 b=ATHEMqNyVYl7UESVNNDYdlKmgI5tPw11bKCBBxfGGfa87ecP3bf5wCoqQ7xk0Fto/X
 BBjMbP47UAfcbqhrWhTqpVDCL6RSO7alyxyGAqRwEHaSMOX2yuUKfektIM5LEiMxYkiP
 dSioSga28JcpjQMAhxKfSPAqFcl6aibx1VaNLbEExwjOgrqEoLgpAswRPQPlBk2SyPEl
 exagNJ66Te55L5wRDQmKrIj89SYxmvWDnz5+6KvphtAptthC1XT/h5uwgWLzZQGZrIWs
 0e1+s+ic5ucaTVZa1gP1ven6jbhqZLDbSrTDqlD4tGn6o0KA5M6BXhuPbKUva4ooT9UL
 8zrQ==
X-Gm-Message-State: AOAM533fobdR6M/PL8z+lDMrX+jlkK7Htti3RLjOIvdPoQ8xybNtrvbS
 RiqmXNai4e3W8SNWhgKVoWXIFzDmhQQUnFJVKPEtGCyI
X-Google-Smtp-Source: ABdhPJyNekrqQTiXKcMzWHkAoMZtS5ePqhzP1TJfY+FxgdNvMq6YDh3hlYfiEGIqKtof7M3eXgF3z9l+UKYh8BPAe6w=
X-Received: by 2002:a05:6402:51cf:: with SMTP id
 r15mr31815215edd.60.1635208503953; 
 Mon, 25 Oct 2021 17:35:03 -0700 (PDT)
MIME-Version: 1.0
References: <20211025134907.20078-1-joonas.lahtinen@linux.intel.com>
 <CAKMK7uHTdVY2VOGb89aKE1z_mwjMk5pmBmidNmVMX4xuLNqDxw@mail.gmail.com>
In-Reply-To: <CAKMK7uHTdVY2VOGb89aKE1z_mwjMk5pmBmidNmVMX4xuLNqDxw@mail.gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Tue, 26 Oct 2021 10:34:52 +1000
Message-ID: <CAPM=9tzVb=LAjK1-dii-Dq0xmSZjkVFeuu6L74jx1Ltf+o3OyQ@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Add Tvrtko as drm/i915 co-maintainer
To: Daniel Vetter <daniel@ffwll.ch>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 "Intel graphics driver community testing & development"
 <intel-gfx@lists.freedesktop.org>, David Airlie <airlied@linux.ie>, 
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Sean Paul <sean@poorly.run>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 dri-devel <dri-devel@lists.freedesktop.org>
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

On Mon, 25 Oct 2021 at 23:51, Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Mon, Oct 25, 2021 at 3:49 PM Joonas Lahtinen
> <joonas.lahtinen@linux.intel.com> wrote:
> >
> > Add Tvrtko Ursulin as a co-maintainer for drm/i915 driver.
> > Tvrtko will bring added bandwidth and focus to the GT/GEM domain
> > (drm-intel-gt-next).
> >
> > This will help with the increased driver maintenance efforts, allows
> > alternating the drm-intel-gt-next pull requests and also should increase
> > the coverage for the maintenance in general.
> >
> > Signed-off-by: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> > Cc: David Airlie <airlied@linux.ie>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Acked-by: Jani Nikula <jani.nikula@linux.intel.com>
> > Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > Acked-by: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> > Cc: Sean Paul <sean@poorly.run>
> > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > Cc: Maxime Ripard <mripard@kernel.org>
> > Cc: dri-devel@lists.freedesktop.org
>
> Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Acked-by: Dave Airlie <airlied@redhat.com>
