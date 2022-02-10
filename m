Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 46A984B19C5
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 00:48:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20BBA10E967;
	Thu, 10 Feb 2022 23:48:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64AC610E967;
 Thu, 10 Feb 2022 23:48:34 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id cn6so13683252edb.5;
 Thu, 10 Feb 2022 15:48:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TmmqKhuTPY9owmmJ84jDjFdTO3yDaMpJkjT3FCR6jJc=;
 b=S/fCaC5/Hco3qfX4AibLzDFhvQGruPa7siKDOY9zUU4azDH4nVPNtPj5XkzHsFICPf
 5u6g7TBeOuEoQCy9bW40cY/J/Gb6gyFdUbNHTgtWpwZttn1635B+HQW+5/SRDw1zuPST
 HYqz/QiCKEUVgR7xLpoiuzXAhIY4A5ns0L9do6soZF/g4YPlTNwHvDwPYbmtD+GyUwbz
 9+5nBxWn1Y5zvV2JcbYcZfa0MFmhLD3ZU0oCGmYKD+6tUfxtJHPhZ/SoI9YEgR7lQwx4
 Tp14K/mjeImjt17NwRqszWh98SED/7CSveMxSk1mQDzgHlQajRXHnN7CTSBXLXq+BycF
 2bKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TmmqKhuTPY9owmmJ84jDjFdTO3yDaMpJkjT3FCR6jJc=;
 b=i6mHZDmbzyvV3EmsUf0EyxfrcRRp2l/HjIu8Kft5CRafzqIkhRlU4ce0SbnIo5lnZc
 zhDLrYDxAvLmMwHf6AGYD0RuXjPJ8uyMzJQwzkz/9pI3Sf1P3y7jlYccm0PUfT+PFco3
 HIhcJTA7iZO4Mqxgky3VV9Uc1I7owAvPugOkGWD76BOKjxm6dJuY5bpUDeDKcwJyEaly
 EqOtzlCCZf7X7M+ypojPS5Rq0XbO5Vn6rVexIwo5YWKktxiY81HSGhWrGIFG+ptnqVCw
 yEZBbg62SfDuW4EOrSqfq4fHcT2TJz6pFelpwukEGUrfXNo/VATDcSynAfSDWlh0IWIT
 iHLA==
X-Gm-Message-State: AOAM531UhisCLk7ruFJDE5HQ5r93MnxQ5FF1RFciUMGIu8fU+ahVCfEY
 oexMA+g91D0CLADrc12e9NxRki0vR/KP+aP3My0=
X-Google-Smtp-Source: ABdhPJzW1q6NHxslNvjiNTC3EI3YC5QZDvRheJ2DkNg8wG5kgPXRcPvXyCkHX7QvATaiqShBvyvJUA0GvesxrwIhJFY=
X-Received: by 2002:aa7:d69a:: with SMTP id d26mr10757102edr.50.1644536912787; 
 Thu, 10 Feb 2022 15:48:32 -0800 (PST)
MIME-Version: 1.0
References: <20220209155634.3994-1-tzimmermann@suse.de>
In-Reply-To: <20220209155634.3994-1-tzimmermann@suse.de>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Thu, 10 Feb 2022 15:48:21 -0800
Message-ID: <CAPaKu7T883JC0_KXhJcx7+cZrPdiv4XY=1gskBdQjYggw1c83w@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] drm/gem-shmem: Various improvements
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, emma@anholt.net,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 ML dri-devel <dri-devel@lists.freedesktop.org>, steven.price@arm.com,
 lima@lists.freedesktop.org, yuq825@gmail.com,
 Gurchetan Singh <gurchetansingh@chromium.org>, "open list:VIRTIO CORE,
 NET AND BLOCK DRIVERS" <virtualization@lists.linux-foundation.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 9, 2022 at 7:56 AM Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> Two patches for GEM's SHMEM-backed implementation.
>
> v2:
>         * update drivers after vm_ops change
>
> Thomas Zimmermann (2):
>   drm/gem-shmem: Set vm_ops in static initializer
>   drm/gem-shmem: Don't store mmap'ed buffers in core dumps
>
>  drivers/gpu/drm/drm_gem_shmem_helper.c  | 7 ++++---
>  drivers/gpu/drm/lima/lima_gem.c         | 1 +
>  drivers/gpu/drm/panfrost/panfrost_gem.c | 1 +
>  drivers/gpu/drm/v3d/v3d_bo.c            | 1 +
>  drivers/gpu/drm/virtio/virtgpu_object.c | 1 +
>  include/drm/drm_gem_shmem_helper.h      | 2 ++
>  6 files changed, 10 insertions(+), 3 deletions(-)
Reviewed-by: Chia-I Wu <olvaffe@gmail.com>


>
> --
> 2.34.1
>
