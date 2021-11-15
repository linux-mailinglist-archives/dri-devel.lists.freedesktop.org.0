Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E29724507D5
	for <lists+dri-devel@lfdr.de>; Mon, 15 Nov 2021 16:05:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 673CA6E0BA;
	Mon, 15 Nov 2021 15:05:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [IPv6:2607:f8b0:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A9836E0BA
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Nov 2021 15:05:15 +0000 (UTC)
Received: by mail-ot1-x331.google.com with SMTP id
 a23-20020a9d4717000000b0056c15d6d0caso20830385otf.12
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Nov 2021 07:05:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=g8XUlT/sjToyO36RfCyVLzSUgv0FHQAyblcXttcs+n4=;
 b=WpMbJgAtDXH9gPSsO1CzmHusZKZhAzbOA8voYT1smgwzFkyxQvLvqCNw8UtyOzkyV7
 38maPtO4O10Rkn9wA778Vh440ly2uFiLaqbbvnzFg7C5IlMQ6Ud4ww4kimZ0iiwZgMlI
 Masy6Ol4IOGgB64yZ9Im6XWxE1qGT9LkwEAfc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=g8XUlT/sjToyO36RfCyVLzSUgv0FHQAyblcXttcs+n4=;
 b=dB92SuLNXC8EeId4R6sRpa6ytgqKHsZmF8ViLtiyK/sBiv2lVciEua2aHpt6HNZDjz
 +/7muv2QqryfAhwBXLgP2BDwmU88w/1iYS5ObGa0u4E2FrO1nFCdiHhhoZrk3cb8S5Mu
 lZzS+KJqWn3KdyEZzUVsHVcUDy0YmAKcWtgfIaWyQBONdnpR42TGo3bNYVwqW54nYcpH
 07QjdEiRkO4f47ZzOi2H+TkAjAs/OXmwA4wUV0gLRF5VFkPdOGuc2Lq9yLGEIWQSlnMj
 LW7MnCyEKWvrE9CbONn9sEcdrm8DuiePVBgPPP8cFCzuWiIKD+oXFY0EFV1sptypiCRC
 eAkg==
X-Gm-Message-State: AOAM531KM4QxHx+HGe/fuIPmNYwFCTXe+0ivr02yqRjCLaoJK0yYgBCV
 jj1ecDDRTG3d8qOw6aRCkCN9/pVxy+Gk7mPhj7c2Gef09y6SLA==
X-Google-Smtp-Source: ABdhPJznxsrUlJ5ak10pCAG8+n0lE72nEyPeQgjo4HrfauQVxnvooXwmE+FA7iMP+pPKb4R9a0Okae54HS8XGnmVT7s=
X-Received: by 2002:a9d:bef:: with SMTP id 102mr31493371oth.239.1636988713982; 
 Mon, 15 Nov 2021 07:05:13 -0800 (PST)
MIME-Version: 1.0
References: <20211114234045.cc5tearljna2ywij@core>
 <CAPj87rPxtQVQnrs0BiXy0H1viF-oMNeCCP_Aptsxt_sgeK+CpA@mail.gmail.com>
In-Reply-To: <CAPj87rPxtQVQnrs0BiXy0H1viF-oMNeCCP_Aptsxt_sgeK+CpA@mail.gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Mon, 15 Nov 2021 16:05:02 +0100
Message-ID: <CAKMK7uGd+W3yOr2wGRREW08pcX=g1UPvkX4n13dVo7YdQ4dpxg@mail.gmail.com>
Subject: Re: Panic with linus/master and panfrost
To: Daniel Stone <daniel@fooishbar.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 =?UTF-8?Q?Ond=C5=99ej_Jirman?= <megi@xff.cz>, dri-devel@lists.freedesktop.org,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

You need

commit 13e9e30cafea10dff6bc8d63a38a61249e83fd65
Author: Christian K=C3=B6nig <christian.koenig@amd.com>
Date:   Mon Oct 18 21:27:55 2021 +0200

   drm/scheduler: fix drm_sched_job_add_implicit_dependencies

which Christian pushed to drm-misc-next instead of drm-misc-fixes. I
already asked Christian in some other thread to cherry-pick it over.
-Daniel

On Mon, Nov 15, 2021 at 3:56 PM Daniel Stone <daniel@fooishbar.org> wrote:
> Hi Ondrej,
>
> On Mon, 15 Nov 2021 at 07:35, Ond=C5=99ej Jirman <megi@xff.cz> wrote:
> > I'm getting some fence refcounting related panics with the current
> > Linus's master branch:
> >
> > It happens immediately whenever I start Xorg or sway.
> >
> > Anyone has any ideas where to start looking? It works fine with v5.15.
> >
> > (sorry for the interleaved log, it's coming from multiple CPUs at once
> > I guess)
>
> Thanks a lot for the report - are you able to bisect this please?
>
> Cheers,
> Daniel



--
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
