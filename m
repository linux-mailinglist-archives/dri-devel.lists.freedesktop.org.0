Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A19993A8888
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jun 2021 20:24:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3E9A6E439;
	Tue, 15 Jun 2021 18:24:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [IPv6:2607:f8b0:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E8256E439
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jun 2021 18:24:43 +0000 (UTC)
Received: by mail-ot1-x335.google.com with SMTP id
 102-20020a9d0eef0000b02903fccc5b733fso15260730otj.4
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jun 2021 11:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SmjYyAhLsOCNNf1QPEPaZaMSVNZ3lfhuw/i5oexZxcU=;
 b=dM2TUe539mFrAzew8COzamFV8Q9Y4q4yGp+dDiG5pHp2SXWkqawZbq8rUHZSmT3LUL
 fv0bI9ebpZb+W+DpmH+cUmj83FF++uS3QHUu45Hdvdih1t2p/neM0H8F36TYaeYDtyS+
 qfgNuylFHuxfZH6V58Jz2ojKIr/Jjx7dKUxATgoc77WOlndG02SGrXqgKjlJYzoBHC7q
 pJ/hT2IpZbW6mjA9Jc8ETqDxCHYoLRhIGCwteVs4ChtPB6CgroyOcqAGmqbUR+brTd1d
 6VJoS4EQv+PHvlafH9OAClPe1cxK+og/si6pZ6mLrr2V+sGo8amTTNdIeRruLN9DDHHr
 +NIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SmjYyAhLsOCNNf1QPEPaZaMSVNZ3lfhuw/i5oexZxcU=;
 b=q3TchMB2Pv1fTS5YzlOk06GCL2gSPYuteF3S2aeSss8EO/rvMrDr9ose42M5wHLhBd
 A+Pe6CYEUbZCQnfJKmr45kQqJf8fgLscgeN9Ta/fC3lNjjIr84KGh/mAQMCLi5d9RRvv
 VF0/xfDSlVbWrNGTGQuwg7uAHjImRZyO6B8LJ+dGj6eV66vaNAu1xUfKdGe6AERAtP5E
 uqxAXnfZHpAmRx5+onTSKebd9wSoXgL1d01Ibm5u+Pjsu4A1DlNVddrzgMZjTZQ5Qthv
 SmFhEuvMXHu/dwSeQoXrykP95i6Fgj2+dg0z17lt58tFI5q63RrEJbdUheDJszgfKhZi
 yDFQ==
X-Gm-Message-State: AOAM533aXpvRGRYOE9DXTC6uJF8KLiQ3q/n9mhzDl7lvW5c2qTBW8VSJ
 BsEk6SzL/k2Q4+/yrvmGJXwurepsudqQRSot99c=
X-Google-Smtp-Source: ABdhPJzYb5w+/LSSUWqtrMPSGXRXR+94X47NeVDGQ+vA1NyXxOWNeg+ULHbphgFAr8oZz1kfY+/m98owghkltyKBr68=
X-Received: by 2002:a9d:6287:: with SMTP id x7mr513800otk.132.1623781482430;
 Tue, 15 Jun 2021 11:24:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210615182336.995192-1-zackr@vmware.com>
In-Reply-To: <20210615182336.995192-1-zackr@vmware.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 15 Jun 2021 14:24:31 -0400
Message-ID: <CADnq5_Mde1Etqyv34xfVjDFvo3OK3ZX7bYQUdQb7XHVBsTaOcw@mail.gmail.com>
Subject: Re: [PATCH 1/5] MAINTAINERS: update vmwgfx info
To: Zack Rusin <zackr@vmware.com>
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
Cc: krastevm@vmware.com, Roland Scheidegger <sroland@vmware.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 15, 2021 at 2:23 PM Zack Rusin <zackr@vmware.com> wrote:
>
> Roland will be focusing on lavapipe over the next few months and
> won't have time for vmwgfx.
> vmwgfx is now maintained within drm-misc.
>
> Signed-off-by: Zack Rusin <zackr@vmware.com>
> Reviewed-by: Roland Scheidegger <sroland@vmware.com>

Acked-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  MAINTAINERS | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index a4ba46fb803a..cae0c6148590 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -5962,11 +5962,10 @@ F:      drivers/gpu/drm/vboxvideo/
>
>  DRM DRIVER FOR VMWARE VIRTUAL GPU
>  M:     "VMware Graphics" <linux-graphics-maintainer@vmware.com>
> -M:     Roland Scheidegger <sroland@vmware.com>
>  M:     Zack Rusin <zackr@vmware.com>
>  L:     dri-devel@lists.freedesktop.org
>  S:     Supported
> -T:     git git://people.freedesktop.org/~sroland/linux
> +T:     git git://anongit.freedesktop.org/drm/drm-misc
>  F:     drivers/gpu/drm/vmwgfx/
>  F:     include/uapi/drm/vmwgfx_drm.h
>
> --
> 2.30.2
>
