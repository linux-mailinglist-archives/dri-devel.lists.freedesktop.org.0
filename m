Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC2A73A349D
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jun 2021 22:11:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86EA46ED13;
	Thu, 10 Jun 2021 20:11:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 584516ED13;
 Thu, 10 Jun 2021 20:11:08 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id he7so998057ejc.13;
 Thu, 10 Jun 2021 13:11:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gYA8DsEgfLzh7lOuB/mK7pQb2kPC8aGN946Y6drkZ+M=;
 b=LObwsnJC/YnZ5KLAxzBOsDSkjrOW0UFTfmwRHMmU58huqsZpjTjqviYicUmGN1KQvn
 7MRzuBzfH0SWU2uh0JDdRsLHH725sSu0RYHeyH5nOCzSeJKLbLdm/1FOubNf+GaEp9a0
 BJzQZqRuGZFPdaCu0k6EWT8zqkimyVdCVnH/7eNZ6Fan6Z57fT227KzNk7GyBvE43riO
 lGM/RmsVE/f4/Own80Na0gCNkBEozPHoB7Ep2eOxJpwKvndgpoWCsM+zARlLCfy4MB0S
 2g53GkFvq3Sl71Tyj0zsp/DrPP+eFyKHBdi6BrbINgFCV6Z93Aw1I/o5YcR9dNee8imU
 sZoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gYA8DsEgfLzh7lOuB/mK7pQb2kPC8aGN946Y6drkZ+M=;
 b=XHyDp6+xIygPDMdcACZcUFCvNo01gsZh4SKkJeeHxXn5vuOKPFIO7/moFPKtvlsA4O
 /5ypaJR7NjjiSa1ad8bGPr/xnRfHCw1ysLCD2SxAKn4bM2KcRovz128cn9Lu9e+ok/n4
 SVwdhhUk3jzFhZE5YZ8BHexss7n6qiYCTzCmwjyVqaqgh98Yzxdpc7r07VEAzOJ/l32a
 vm6efZT9y2ZQxeUHlEYPBaH09K9C4NXD5w2OkShX+0his2sApqM49f+kLrpr0r38opQ5
 en+v63+qv8GduTPqJtjCnOM3ORy/fBXvcIyE3FWYLN7awcBeFZHXyjJesJ8nYFjYO3gM
 Uzog==
X-Gm-Message-State: AOAM530SxHtGQ6bLV7Vx76Klz9bQTzFxOhB9OK2EynNZoiskh1/lJPGi
 QZ1NxVWqOuv6PSS40LrimHg2GTjroxy69Llz7Qw=
X-Google-Smtp-Source: ABdhPJxWDBaQPjU6z4Cl+nkxDC9Ae3jK6/kYcDKhaVBkBMVhPd32ELCKrXGLQJ2x4Z52ocblc5JF4zT+HnPHOujg7KQ=
X-Received: by 2002:a17:906:3a09:: with SMTP id
 z9mr304692eje.450.1623355866909; 
 Thu, 10 Jun 2021 13:11:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210525211753.1086069-1-jason@jlekstrand.net>
In-Reply-To: <20210525211753.1086069-1-jason@jlekstrand.net>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Thu, 10 Jun 2021 13:10:56 -0700
Message-ID: <CAPaKu7Ssizz2_A8cy12G544_uCGxWuMw8v54vSusF77SwD_yiw@mail.gmail.com>
Subject: Re: [PATCH 0/7] dma-buf: Add an API for exporting sync files (v11)
To: Jason Ekstrand <jason@jlekstrand.net>
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
Cc: Daniel Stone <daniels@collabora.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 wayland <wayland-devel@lists.freedesktop.org>,
 Dave Airlie <airlied@redhat.com>, mesa-dev <mesa-dev@lists.freedesktop.org>,
 intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 25, 2021 at 2:18 PM Jason Ekstrand <jason@jlekstrand.net> wrote:
> Modern userspace APIs like Vulkan are built on an explicit
> synchronization model.  This doesn't always play nicely with the
> implicit synchronization used in the kernel and assumed by X11 and
> Wayland.  The client -> compositor half of the synchronization isn't too
> bad, at least on intel, because we can control whether or not i915
> synchronizes on the buffer and whether or not it's considered written.
We might have an important use case for this half, for virtio-gpu and Chrome OS.

When the guest compositor acts as a proxy to connect guest apps to the
host compositor, implicit fencing requires the guest compositor to do
a wait before forwarding the buffer to the host compositor.  With this
patch, the guest compositor can extract the dma-fence from the buffer,
and if the fence is a virtio-gpu fence, forward both the fence and the
buffer to the host compositor.  It will allow us to convert a
guest-side wait into a host-side wait.
