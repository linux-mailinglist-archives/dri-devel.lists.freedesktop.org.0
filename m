Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D588615AF6B
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2020 19:08:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 230126E0CC;
	Wed, 12 Feb 2020 18:08:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22B0B6E0CC
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2020 18:08:46 +0000 (UTC)
Received: by mail-io1-xd41.google.com with SMTP id z8so3332904ioh.0
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2020 10:08:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CWhd4E0ng4TIrXctPssY6oyD+rYoh/12ctx3Po/IH+o=;
 b=MkFAc+TLDyn9zBU2Zm5OUo5cm3qDvxScmA8exJL873CIcAWLY/LXSsJxfVZKYnMasP
 N20LLUS7bGhBFMXOk9ZbMwZW7TG8XB8SUfgpgU1Ona1fGDgufohXWzIqTvKui+u33c75
 X+eXXgMRsSayZjGdK0cJJ86r5ynqSa9+/GWCpDe9baI1gVsFMLqSdMN3ZP0Rs6jryJ0n
 yjFZjuQmKNTu35J61FlFdqet8l7Z7UJA1Y8MrRheN5KuY41+C+41DzPe4MvjiBFhkvt9
 13nbEKzrO0wuhXYLRYadhmX7GUzifxBSC+lTjh0IaL1TGujgTXQFdP0ONpgilU4+QS6g
 tvEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CWhd4E0ng4TIrXctPssY6oyD+rYoh/12ctx3Po/IH+o=;
 b=k3uY3IE13RC3Yf23DCdQG8t8FbiPfl/k0BNCgUIbGsK57Rkw1QxbRxrmTkefyiQYEq
 769vrvmI+TtDVDUh4wRxyDjevCi6ebA7pANycPNl3ZiUS7HwCZiJMprGEMHe7JkWawUN
 j4L2tXZlQWu9jp7QjCXh7y6Sz9poWM8STo4834M5gtVb15cUyReuFt9IB2SGVIZzf0LZ
 hS6db6NKyvQ3gntoSHnDxh8Qeh1jomB34S9PNj1CpL+F1OknmOU5ZYSAdX7Pe9e1rSOS
 BILu+sgOMMk21uArOIi29GK+IEdiy0wy/5utsm6j3YPqolGEhljK1u4oiSOGpOgbOgHr
 pbIg==
X-Gm-Message-State: APjAAAUyzTmSk4rPK8wKxnSxfzvatjqgzUncll5opXPEcvld/uA9wb20
 kt2AEF5CR746Hxxir1/Dw4A4iPX/pQ5oTVwtDCd9EvpQ
X-Google-Smtp-Source: APXvYqwbj4M4HFCX7B3DGeaGPm8F2o3mjUqVWi/f8LS50pwPmz4Qex6nLS1WfVWm4QavWOmtZOxyMeKOlk0M8v2fAn0=
X-Received: by 2002:a02:9f06:: with SMTP id z6mr19233225jal.2.1581530925479;
 Wed, 12 Feb 2020 10:08:45 -0800 (PST)
MIME-Version: 1.0
References: <20200211135047.22261-1-kraxel@redhat.com>
In-Reply-To: <20200211135047.22261-1-kraxel@redhat.com>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Wed, 12 Feb 2020 10:08:34 -0800
Message-ID: <CAPaKu7Q1qYk-8e6420CLLtswiNyF4dUwTy5-68X1SRaSDCVXtw@mail.gmail.com>
Subject: Re: [PATCH 0/2] drm/virtio: locking/reservation fixes
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
Cc: ML dri-devel <dri-devel@lists.freedesktop.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The fixes look reasonable.

Reviewed-by: Chia-I Wu <olvaffe@gmail.com>

On Tue, Feb 11, 2020 at 5:50 AM Gerd Hoffmann <kraxel@redhat.com> wrote:
>
>
>
> Gerd Hoffmann (2):
>   drm/virtio: fix virtio_gpu_execbuffer_ioctl locking
>   drm/virtio: fix virtio_gpu_cursor_plane_update().
>
>  drivers/gpu/drm/virtio/virtgpu_ioctl.c | 20 ++++++++++----------
>  drivers/gpu/drm/virtio/virtgpu_plane.c |  1 +
>  2 files changed, 11 insertions(+), 10 deletions(-)
>
> --
> 2.18.2
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
