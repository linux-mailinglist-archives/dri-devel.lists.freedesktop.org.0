Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6D2413783C
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jan 2020 22:02:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA8AC6EAA3;
	Fri, 10 Jan 2020 21:02:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5DDE6EAA3
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2020 21:02:29 +0000 (UTC)
Received: by mail-io1-xd44.google.com with SMTP id n11so3529141iom.9
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2020 13:02:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DscpuWHCpmPvr4rJjWCNU0C+wW4iWR7q6WdgIPGNWp8=;
 b=DZNIJtWDxi/IFi9rezbRRGdt2PNteEKMx12hwXSahx8QOiYfv5QyoZqEUO/h6dY2nG
 HtYbN0XKSDT8rKy8m4E9XUoK3k8d4QEoCk51sSf7ZKTPnsGDS8Mif3kgP9ZNFg1K+qXk
 LcEY3UPe1tYogE1FsCAoO5Iz+UIzPdbrwyXfEXyetei5BsL/kj6kUWYl5fVf78wUEPDh
 4mJsUUuDU2lH5qsgNRd1M2hov480V52g3r3NyOi1eRaf3yeQ6XpzBmDLzBJ7v9pT5Idt
 PxQfxFN8fEkEWRabStaLVCog4wNnxT8rHfjnwqaWisU+oY0x0ulS0d4iVIad737zTc4U
 mMbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DscpuWHCpmPvr4rJjWCNU0C+wW4iWR7q6WdgIPGNWp8=;
 b=Bii37OOqBHhhryJYqBI1izMg2vePk5xrdtQvtx6UDYRu5AENDXv8Y//WkdRsGBYc5E
 mV+Z294lHQXSZ6dmFS4VH0mHySUR0iBGWx+0eZoWCRJh7OYFXmAQz1qHAm+6WhVEhJDw
 RGnb4JeFSg2qDoArag/wBFWqHtAwjz0qoqCg2nin2WPt+9hsQTkAPt6Rmio+hHh1YEsp
 A+nk8hRpV6iP6jg4461jC1C9LlAdiZ0zH7EKqxBAr+KNtJz+PXt2BSZvIjP75Znca5AO
 Z1KUi/zlK4tvTvulZs/3vQkeXqhupMEjY4eo7GAZzv9bzVc4U6c79ytacMA1bykf0mSO
 iEdA==
X-Gm-Message-State: APjAAAXtdq20tRzysTxljmbIj5IwyKGnOCJseNJDk61iaCsj3YNpdASo
 X6rr3bjV5/F+y5vNiuAFXkBZz3kOvpaaEyYS9OU=
X-Google-Smtp-Source: APXvYqwLh4K1IfrVM9/WMlQhAf6HvRXmjNuB6U8BcycbyeLI32u6bBID/d1x4io+NNaZ/oLcomb7JELbKTP/2iO8c2Y=
X-Received: by 2002:a5d:8b96:: with SMTP id p22mr4006771iol.93.1578690149027; 
 Fri, 10 Jan 2020 13:02:29 -0800 (PST)
MIME-Version: 1.0
References: <20200110094535.23472-1-kraxel@redhat.com>
 <CAG48ez0wfLkTqdBtDBV4b1uUQMGeeAr09GPPi9WT++Fn8ph4rA@mail.gmail.com>
In-Reply-To: <CAG48ez0wfLkTqdBtDBV4b1uUQMGeeAr09GPPi9WT++Fn8ph4rA@mail.gmail.com>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Fri, 10 Jan 2020 13:02:17 -0800
Message-ID: <CAPaKu7TQCXOmj1zthBXq4XtNpK8WT4Rv5CwUmLrRBNwm4f0uRw@mail.gmail.com>
Subject: Re: [PATCH] drm/virtio: add missing virtio_gpu_array_lock_resv call
To: Jann Horn <jannh@google.com>
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
 Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 10, 2020 at 6:27 AM Jann Horn <jannh@google.com> wrote:
>
> On Fri, Jan 10, 2020 at 10:45 AM Gerd Hoffmann <kraxel@redhat.com> wrote:
> > When submitting a fenced command we must lock the object reservations
> > because virtio_gpu_queue_fenced_ctrl_buffer() unlocks after adding the
> > fence.
>
> Thanks a lot! With this patch applied, my VM doesn't throw lockdep
> warnings anymore. If you want, you can add:
>
> Tested-by: Jann Horn <jannh@google.com>
>
> > Reported-by: Jann Horn <jannh@google.com>
> > Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Chia-I Wu <olvaffe@gmail.com>
> > ---
> >  drivers/gpu/drm/virtio/virtgpu_plane.c | 1 +
> >  1 file changed, 1 insertion(+)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
