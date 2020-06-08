Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 80F331F34F5
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jun 2020 09:35:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D9746E283;
	Tue,  9 Jun 2020 07:35:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C13FC89DB7;
 Mon,  8 Jun 2020 19:39:01 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id 9so12376555ljv.5;
 Mon, 08 Jun 2020 12:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TVOtxpmeYOWD7rcQA6p6PVJsdwW/9XtVAfJ00067Jwk=;
 b=Uw7ae4K+D9tmeKHdEU38WOe4FsdhXp1ZnKr7YKUGixiQ9oWe2zUkZdxYWRFL5TGsGn
 +V9y94pvG0g5IXdQ2s4+PKu/NvK9GfJ5zCE2bQeGG95W+5y0fJ2+gTsk4k83rf03ItCJ
 kLC6qXpWbigmmVckNhVl6m270lucklRJQLrGoqZmdnWFsJKpGVxCkW4TqmwNSvOiG1BH
 d7soMSphupowplBAdx0AqVYwm0rmW0kE6W5xrmEBYPj5QQ0rsZtXxPEdj4xYSsQtECzW
 Nrs4lqroRuljEnV+wdWyUPdWz7xp5vspC1+LTQ3C15/rCfKQ54OQWj3k6b8s7vujTbBm
 A2bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TVOtxpmeYOWD7rcQA6p6PVJsdwW/9XtVAfJ00067Jwk=;
 b=aocZlLd7JIFUqc9CQ/JYS9ysr/yWA6oVbxTquwZf7pe1sMuRj41tZRBPd9v00ojMW1
 KZyve7PI4ifEjb7MUqpgfN8hySjKiRvKBz+e/oNVIZWeOBYnOniIfomocMVxY9HyH+fG
 i9CsrfN0scgq7zTjdU/7QjVJcqq/EvK7iJy6DvZnq2dyirj7EZs/xTC0Jwi7C+pwIrBm
 Nuwo9AGUgqVMEd6QjA8e2v8yj9T8h4+oeuNODbC05DKlU4LzZN+fceMwON78N9qp+0P2
 ApdZzxmMghh8pcAmnK9FIflRE8VuesDaLEhuXDN85acscG7iQ2unfunqCc0WpUGsjOk4
 ImLA==
X-Gm-Message-State: AOAM531jwh0xZeTDhfQ/Pa1dFX4iVzQj8ME1Yw3gPsd3VvB8DMaGtebP
 vXxQz+k/LW8IbzGkA07RE6n9onIwCFR97WZql4c=
X-Google-Smtp-Source: ABdhPJzj7F/aaSi7HE9SPJMq1V4yr6hfoXBgPhFqPh91CbbkatR/Ryqmnw/QWzidGESYaRxTEW2Cmw1bqOyx6OoorZ0=
X-Received: by 2002:a2e:9147:: with SMTP id q7mr12642562ljg.430.1591645140048; 
 Mon, 08 Jun 2020 12:39:00 -0700 (PDT)
MIME-Version: 1.0
References: <1590526802-3008-1-git-send-email-jrdr.linux@gmail.com>
 <69a033cf-63b2-7da6-6a5e-a5bbc94b8afb@nvidia.com>
 <20200527084852.GN206103@phenom.ffwll.local>
 <20200527085117.GO206103@phenom.ffwll.local>
 <aaf62285-981e-3753-5501-07bbba98fc36@nvidia.com>
 <CAFqt6zZVAQ3LKwud85LgHe9300xVjyGYXjvdWKTdezZA1uRewg@mail.gmail.com>
 <011353ca-39d5-a41d-477a-f67a47ebb47b@nvidia.com>
In-Reply-To: <011353ca-39d5-a41d-477a-f67a47ebb47b@nvidia.com>
From: Souptick Joarder <jrdr.linux@gmail.com>
Date: Tue, 9 Jun 2020 01:08:48 +0530
Message-ID: <CAFqt6zZPh6RazWcwmfz1oXMbHaxMOtQtVU=Cgs79M9JG+PDrSg@mail.gmail.com>
Subject: Re: [PATCH] drm/radeon: Convert get_user_pages() --> pin_user_pages()
To: John Hubbard <jhubbard@nvidia.com>
X-Mailman-Approved-At: Tue, 09 Jun 2020 07:35:06 +0000
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
Cc: linux-kernel@vger.kernel.org, dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx@lists.freedesktop.org, "Deucher,
 Alexander" <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 29, 2020 at 12:58 PM John Hubbard <jhubbard@nvidia.com> wrote:
>
> On 2020-05-28 23:49, Souptick Joarder wrote:
> ...
> >> This is what case 3 was *intended* to cover, but it looks like case 3 needs to
> >> be written a little better. I'll attempt that, and Cc you on the actual patch
> >> to -mm. (I think we also need a case 5 for an unrelated scenario, too, so
> >> it's time.)
> >
> > There were no *case 5* in the other patch posted in -mm. Do we need to add it ?
> >
>
> Working on figuring that out [1], but it's not directly relevant to this thread.
> Maybe I shouldn't have brought it up here. :)
>
>
> [1] https://lore.kernel.org/r/20200529070343.GL14550@quack2.suse.cz
>
> thanks,
> John Hubbard
> NVIDIA
>
>
>

As this conversion is not relevant ( mentioned above), I have dropped
this patch.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
