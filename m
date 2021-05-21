Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7152938CFF3
	for <lists+dri-devel@lfdr.de>; Fri, 21 May 2021 23:33:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 883696E8A2;
	Fri, 21 May 2021 21:33:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63F9B6E8A2
 for <dri-devel@lists.freedesktop.org>; Fri, 21 May 2021 21:33:01 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id lg14so32426192ejb.9
 for <dri-devel@lists.freedesktop.org>; Fri, 21 May 2021 14:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Rn5PBrryu+hqGXYlohYFarM36W5tx6PR9NoWMaXv3P4=;
 b=w+Q4oGVqPT35ka9NMighwKLXIDWOyFqqIEfJOJ8a7INndByZ/ZeVg/qnPQNN7ig49R
 fc/I4LEEi2OBA92/zqXAWtwg0uTSYE7QFf+eleRW17kX81BnnKGMN9+w6l0/6aP4NySj
 YFRJ1Fun3NP/5SaWYIRTusIOGx95TeTMJKSx3paJLIjulNZXesJhy8g8eLfYwRIZmhXt
 ghX5j7rDNARtrjzT/QF6LLvaNJ96aknj4e65lnsYud/IH9majPhwke+1ukemTAjt1usL
 eey+tuBrdERUsoA4p10TYGL0dE8ELX1h0pCH86rpndXjVcc/GN4a/pubf3gw7KjZoPRG
 pBjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Rn5PBrryu+hqGXYlohYFarM36W5tx6PR9NoWMaXv3P4=;
 b=oDFo0qEkOQZtbDO/kyvzA8M4YBWlm2EOKLlnR/y266odIWUT+wDUqEaD5QbAstpEgH
 im+FkYkq2z9hN/raVePFaJsdgp38tyE3EiEIL5K5OSi+q1OrxCa8tFSbmf4AG6wei2ki
 PWxHb5mm17zMOQlOSxWNOB6HqEsvyMvg2VTHOZWfn0TW2TmEwjG9ILkk1fracaKAmJz8
 /QqV3vFIz+0fEhbykXVYjy/5WTUZZmuJlgAdZQbck2xQBY8ovlryDZ1cGl44pgP7bats
 Tpqf+Tu+w//4I3MRKnERY7l6ze+jWmtj6eHv3BpfVeqZHZHItRvOjf9a4eYHJGMo0pTt
 SE0A==
X-Gm-Message-State: AOAM530x+0zGOCKSFAyqQScu9lwTofaGOZb2Iu+rcd2uVJ/JiXH/QyGR
 gOzvAUgUu7nkoQLj3c2m5u40ODFed8Vff2p6yxVcL8zZ1fuoBQ==
X-Google-Smtp-Source: ABdhPJxcLcEZklWR6s+uaAeuxMea3p4kdKHn9jMwnALBY2YIQJJFkoY5YjODmu/6yeMVGj0RLtJxiPohkWe5juib+Ag=
X-Received: by 2002:a17:907:781a:: with SMTP id
 la26mr11986054ejc.435.1621632779605; 
 Fri, 21 May 2021 14:32:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210520190007.534046-1-jason@jlekstrand.net>
In-Reply-To: <20210520190007.534046-1-jason@jlekstrand.net>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Fri, 21 May 2021 16:32:48 -0500
Message-ID: <CAOFGe96mRr7Xua19XS4pnaMR3yzTT5sYu5LbCDP=fO_Hw8hdGA@mail.gmail.com>
Subject: Re: [PATCH 0/4] dma-buf: Add an API for exporting sync files (v8)
To: Maling list - DRI developers <dri-devel@lists.freedesktop.org>
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
Cc: Dave Airlie <airlied@redhat.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Daniel Stone <daniels@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

IGT: https://patchwork.freedesktop.org/series/90433/
Mesa (Vulkan WSI):
https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/4037

Ideally, it'd be nice to see a RADV MR and maybe even radeonsi before
we really land on it.  However, I think it's proved out well enough in
ANV to at least land the first three.

--Jason

On Thu, May 20, 2021 at 2:00 PM Jason Ekstrand <jason@jlekstrand.net> wrote=
:
>
> This is mostly a re-send of v8 only with a fourth patch which contains th=
e
> sync file import ioctl that I had in the original series.  I've not updat=
ed
> the IGT tests yet for sync file import.  This resend is mostly intended t=
o
> aid in discussions around implicit sync in general.  I'll write up some I=
GT
> tests if there is serious interest in patch 4.  I can also update the Mes=
a
> MR to use it for Vulkan.
>
> -------------------------------------------
>
> Modern userspace APIs like Vulkan are built on an explicit
> synchronization model.  This doesn't always play nicely with the
> implicit synchronization used in the kernel and assumed by X11 and
> Wayland.  The client -> compositor half of the synchronization isn't too
> bad, at least on intel, because we can control whether or not i915
> synchronizes on the buffer and whether or not it's considered written.
>
> The harder part is the compositor -> client synchronization when we get
> the buffer back from the compositor.  We're required to be able to
> provide the client with a VkSemaphore and VkFence representing the point
> in time where the window system (compositor and/or display) finished
> using the buffer.  With current APIs, it's very hard to do this in such
> a way that we don't get confused by the Vulkan driver's access of the
> buffer.  In particular, once we tell the kernel that we're rendering to
> the buffer again, any CPU waits on the buffer or GPU dependencies will
> wait on some of the client rendering and not just the compositor.
>
> This new IOCTL solves this problem by allowing us to get a snapshot of
> the implicit synchronization state of a given dma-buf in the form of a
> sync file.  It's effectively the same as a poll() or I915_GEM_WAIT only,
> instead of CPU waiting directly, it encapsulates the wait operation, at
> the current moment in time, in a sync_file so we can check/wait on it
> later.  As long as the Vulkan driver does the sync_file export from the
> dma-buf before we re-introduce it for rendering, it will only contain
> fences from the compositor or display.  This allows to accurately turn
> it into a VkFence or VkSemaphore without any over- synchronization.
>
> Mesa MR: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/4037
> IGT tests: https://lists.freedesktop.org/archives/igt-dev/2021-March/0298=
25.html
>
> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> Cc: Michel D=C3=A4nzer <michel@daenzer.net>
> Cc: Dave Airlie <airlied@redhat.com>
> Cc: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
> Cc: Daniel Stone <daniels@collabora.com>
>
> Christian K=C3=B6nig (1):
>   dma-buf: add dma_fence_array_for_each (v2)
>
> Jason Ekstrand (3):
>   dma-buf: add dma_resv_get_singleton_rcu (v4)
>   dma-buf: Add an API for exporting sync files (v9)
>   RFC: dma-buf: Add an API for importing sync files (v6)
>
>  drivers/dma-buf/dma-buf.c         |  94 +++++++++++++++++++++++
>  drivers/dma-buf/dma-fence-array.c |  27 +++++++
>  drivers/dma-buf/dma-resv.c        | 122 ++++++++++++++++++++++++++++++
>  include/linux/dma-fence-array.h   |  17 +++++
>  include/linux/dma-resv.h          |   3 +
>  include/uapi/linux/dma-buf.h      |  25 ++++++
>  6 files changed, 288 insertions(+)
>
> --
> 2.31.1
>
