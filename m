Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 29D98154B55
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2020 19:41:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EF5E6FB08;
	Thu,  6 Feb 2020 18:41:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x142.google.com (mail-il1-x142.google.com
 [IPv6:2607:f8b0:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 424876FB08
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Feb 2020 18:41:51 +0000 (UTC)
Received: by mail-il1-x142.google.com with SMTP id s85so6034285ill.11
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Feb 2020 10:41:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rvfv9s/3mm0fiIdqT4gq2TIV6qswfw3gcSHxln5Qesg=;
 b=EvstfC2C+SB/UiURgygiLq5HrwrbptH4mgesLSEhapDxG97zndtPhgViZiqgl4Glmp
 sGqdACNG2iQfQgQz6LVZdzHl/uPm3O6aRtkKfZngKCMJKvttmKl3/csBAjlcy97CCS5U
 0W8n6coud4RguAe6BS9SOmXB2QRPd0cvK9qNM1uSouk7DX5yDlOK6HHuTs4Sk7rCCfmw
 Lr9vfKxVcDSLGXyGeyHF1oemrcenaY7RNXhhute37l/qxRI5mPORFGiUnUE/5//QI1A1
 dBcRyC/KgLgBtg7iPUKkY7Q7OAcBTtTKy05hxRB44vBxv5m5pUZzdVW/1n/upw3isDoc
 9vGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rvfv9s/3mm0fiIdqT4gq2TIV6qswfw3gcSHxln5Qesg=;
 b=Q+wPZO7G7+ZMcwogyag4d8SFX+SueZuUOLK3bLweu9lX2HAxMTsr6QnP/gSLDiwmUZ
 wE2l3W2wjm7qz977bTw67gWMHplKR5kn3MxfKxjva1lh4IKb/FCxLahXp9TkIzi6e11x
 a2RrwbeOpn490Xo9nHQEm7dKetvrue9AU1Ut3YAn5kQmFT6PMY6ojwHysIg6uSAr8ATw
 k+j0YpmYOymLan43azq69Rt/5jLgcLJkPqcl0QOCOBgfPO3ZIC5qcjX6JI/RKwXqc8VL
 SMCPuFzlbZm4eN1fBbILTSKMxSqP83m3uNuR3+t859mXaY+/haU+9Ss+v9Gyhv/xUVfs
 lklQ==
X-Gm-Message-State: APjAAAXxXsR7efrOWwfYpF7MpPznLjef+Ip36EbI0Yd3qAKazgC5FyMa
 XREAG0ntG+3nONn0cAKWrMfaIgXlVGd5INRivIM=
X-Google-Smtp-Source: APXvYqw/HdiF1QLiDq8FBR9ivWT4hH47VQKvqmRG8CV2Fh4h6/Y5ruVY2lyZwJyJBSbPZCdA81XhI1OmVffIWLIcKNI=
X-Received: by 2002:a92:84ce:: with SMTP id y75mr5203539ilk.93.1581014510574; 
 Thu, 06 Feb 2020 10:41:50 -0800 (PST)
MIME-Version: 1.0
References: <20200205105955.28143-1-kraxel@redhat.com>
 <20200205105955.28143-5-kraxel@redhat.com>
 <CAPaKu7RxijC_oS4GPukS9wEe9gn8DPQgaGZKwG6g8M8xwTnsig@mail.gmail.com>
 <20200206085540.pa6py4ieoi242gma@sirius.home.kraxel.org>
In-Reply-To: <20200206085540.pa6py4ieoi242gma@sirius.home.kraxel.org>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Thu, 6 Feb 2020 10:41:39 -0800
Message-ID: <CAPaKu7RDZYnpjFB-Vou0RwiDGCxrD4ak2vLEf89UupdYm59ZYw@mail.gmail.com>
Subject: Re: [PATCH 4/4] drm/virtio: move virtio_gpu_mem_entry initialization
 to new function
To: Gerd Hoffmann <kraxel@redhat.com>
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
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 6, 2020 at 12:55 AM Gerd Hoffmann <kraxel@redhat.com> wrote:
>
>   Hi,
>
> > >         virtio_gpu_cmd_resource_attach_backing(vgdev, obj->hw_res_handle,
> > > -                                              ents, nents,
> > > +                                              obj->ents, obj->nents,
> > >                                                fence);
> > > +       obj->ents = NULL;
> > > +       obj->nents = 0;
> > Hm, if the entries are temporary, can we allocate and initialize them
> > in this function?
>
> Well, the plan for CREATE_RESOURCE_BLOB is to use obj->ents too ...
Is obj->ents needed after CREATE_RESOURCE_BLOB?  If not, having yet
another helper

  ents = virtio_gpu_object_alloc_mem_entries(..., &count);

seems cleaner.  We would also be able to get rid of virtio_gpu_object_attach.

>
> cheers,
>   Gerd
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
