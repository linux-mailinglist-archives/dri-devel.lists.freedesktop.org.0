Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F8D828F6DB
	for <lists+dri-devel@lfdr.de>; Thu, 15 Oct 2020 18:33:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B47AA6ED8E;
	Thu, 15 Oct 2020 16:33:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 151996ED8E
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Oct 2020 16:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602779598;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OPCx6ZX+v0aW1qWNyvmKfIJa6GlSsQRVtNwvNS3h79w=;
 b=F+YfMbwhntLFN9yypJ5622j81W4c1ISFSRXVKUeLsDmrFUQ7oSrqt+2rPulenT1hUKJt88
 Kb/JpOsGh47p9j9dd8+jKUOTbRkljOqeNGAC2+sgkKvrmr+a8X8sRJL3CxiYkgrdYT3z2I
 DLPy+zC9AbK3UpOmpJCCl4jytKs80pA=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-313-C1OhxtrqNXa6hvBktmnUTg-1; Thu, 15 Oct 2020 12:33:11 -0400
X-MC-Unique: C1OhxtrqNXa6hvBktmnUTg-1
Received: by mail-qt1-f197.google.com with SMTP id d6so1348854qtp.2
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Oct 2020 09:33:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OPCx6ZX+v0aW1qWNyvmKfIJa6GlSsQRVtNwvNS3h79w=;
 b=gnou9iXqrjgXJtU14dmELtsGpA9HZuuyEuYMBKBNqpf2zpqGtjpB4mgxh/0YNGYfb7
 WrNk8a2gW1BpElPGUq/RtZWdeifNzcki1+xQo0ehibOP8fW7KnCA0aJPXajliTIupPXf
 reLCZNNopm5DsD3luV6UiP9/kvVi1/yt5xP9CyRiJtAl1ut9yP0vYAy0N0oOwMXdx2q+
 /aSrjPOy0TvLLmKzWzinT5JBsR48lcG3xpmPpoET7F3LtzK7UyHCQr6QpI9fEH6mrwti
 6XtTLuxd3lohC5QKuzrVlsxsAi5J3bB2xUa5B4eed2g/k2+qXkQjO7cxnG1Io3gBcz6m
 auQQ==
X-Gm-Message-State: AOAM531K1ktmcEGUknCgjuSQm5prL97tZItRaFT7wVQb7liDvvF0wHkt
 7TaFET/nB1RtBUmvnlMlOMlvKuSCzHIqIQ+XR4sc4PnedrLo/nzqJonmHsRQTfIZR91Yna4nMxV
 bROhWvOOhabaYGukc3a+OLN53fy0vC3bwxHO2GNWT0J12
X-Received: by 2002:a05:620a:1668:: with SMTP id
 d8mr4948592qko.192.1602779590052; 
 Thu, 15 Oct 2020 09:33:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxhPovKkyv2797cvRQtgT8s/gshA8t417emP2EmAJofXJvWtB9m/PLkl5wGjr16oTzG1Y3NTcB1101aJZ9i6ZY=
X-Received: by 2002:a05:620a:1668:: with SMTP id
 d8mr4948568qko.192.1602779589751; 
 Thu, 15 Oct 2020 09:33:09 -0700 (PDT)
MIME-Version: 1.0
References: <20201014075419.19974-1-keitasuzuki.park@sslab.ics.keio.ac.jp>
In-Reply-To: <20201014075419.19974-1-keitasuzuki.park@sslab.ics.keio.ac.jp>
From: Karol Herbst <kherbst@redhat.com>
Date: Thu, 15 Oct 2020 18:32:58 +0200
Message-ID: <CACO55ttZCVZM2v1oWRq7mzZy3DVDe3h1fH80D6RNFM3xR4VjuQ@mail.gmail.com>
Subject: Re: [Nouveau] [PATCH RFC] drm/nouveau: fix memory leak in
 nvkm_iccsense_oneinit
To: Ben Skeggs <bskeggs@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: takafumi@sslab.ics.keio.ac.jp, David Airlie <airlied@linux.ie>,
 nouveau <nouveau@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Keita Suzuki <keitasuzuki.park@sslab.ics.keio.ac.jp>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ben, I think this is like the 5th patch tackling this issue, I think
we should merge one of those.

On Thu, Oct 15, 2020 at 6:23 AM Keita Suzuki
<keitasuzuki.park@sslab.ics.keio.ac.jp> wrote:
>
> struct pw_rail_t is allocated as an array in function nvios_iccsense_parse,
> and stored to a struct member of local variable. However, the array is not
> freed when the local variable becomes invalid, and the reference is not
> passed on, leading to a memory leak.
>
> Fix this by freeing struct pw_rail_t when exiting nvkm_iccsense_oneinit.
>
> Signed-off-by: Keita Suzuki <keitasuzuki.park@sslab.ics.keio.ac.jp>
> ---
>  drivers/gpu/drm/nouveau/nvkm/subdev/iccsense/base.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/iccsense/base.c b/drivers/gpu/drm/nouveau/nvkm/subdev/iccsense/base.c
> index fecfa6afcf54..8ba8d8e3f52a 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/iccsense/base.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/iccsense/base.c
> @@ -280,8 +280,10 @@ nvkm_iccsense_oneinit(struct nvkm_subdev *subdev)
>                         }
>
>                         rail = kmalloc(sizeof(*rail), GFP_KERNEL);
> -                       if (!rail)
> +                       if (!rail) {
> +                               kfree(stbl.rail);
>                                 return -ENOMEM;
> +                       }
>
>                         rail->read = read;
>                         rail->sensor = sensor;
> @@ -291,6 +293,7 @@ nvkm_iccsense_oneinit(struct nvkm_subdev *subdev)
>                         list_add_tail(&rail->head, &iccsense->rails);
>                 }
>         }
> +       kfree(stbl.rail);
>         return 0;
>  }
>
> --
> 2.17.1
>
> _______________________________________________
> Nouveau mailing list
> Nouveau@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau
>

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
