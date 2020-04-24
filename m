Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CA2E81B72C1
	for <lists+dri-devel@lfdr.de>; Fri, 24 Apr 2020 13:11:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACD676E45D;
	Fri, 24 Apr 2020 11:11:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x941.google.com (mail-ua1-x941.google.com
 [IPv6:2607:f8b0:4864:20::941])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7424F6E45D
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Apr 2020 11:11:50 +0000 (UTC)
Received: by mail-ua1-x941.google.com with SMTP id c24so8994452uap.13
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Apr 2020 04:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Qjs5SC/3OnMCT6KC0dOpblQw7o0Gfu6LYx4LNPfqDeQ=;
 b=kk6vKPCT0U+lCJmzvCBuFSTU8m6sx+jEc9evMPuDaxj7y0nPObSBVGcUFmLMLc86xn
 6EQ33RjBypidxKCzZE0LXs0arU94ZJnOxolT0BbAllpl4hezJRoXpnKSKz4+6gvYkNGv
 HtgLhda4a8zpbahAIzMCOmdmRcKMWOfYystxxDNI+3W46hLQlP1NPVwkympKnk6As6tH
 tS0TVyVfGsu+seVGpcc/See+xdqtmBrI/QSULtScBiXbKI572iUPpa/NBRNsbcNC/U1s
 OTxIz+U9oYcrRSUGQDF2hJ9ESO/wByXMDfgR6Hn5yiBpsjlvSxDYTBPXrj5Y7Lg0YeXr
 FrCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Qjs5SC/3OnMCT6KC0dOpblQw7o0Gfu6LYx4LNPfqDeQ=;
 b=AaQ+Glr+3KOalhPNQ7N3rtXaPYtotrE+XE0IoHiEfvCiRlqm/rY2xK6V1EptNeKCQP
 tu+Cz9rF/J+YPeFtASBZ8mfAbGLnTea5Cntz9TjozZByYjpfT8X/b2oXtGaa0NpictjM
 VrukhbNhetnbARaYqvmOwyDPIafKEGy7Nj3W6DNbrQ8260nRwUMXYaYr+vknRlOmonGz
 /kzlKrp9rv8Tov5LDYqc2hechYIigHao1hHN/Ulo9CTok2QP6u0VGquzbajAT0VBy8nZ
 Jx1z8MgS6YMhDy+UblB5QXr9bpMpvrqfOSOLyMPsI5xSw1/oGAtaaEBKV10Om2koZ5F1
 vc4g==
X-Gm-Message-State: AGi0PuZ2qgm8+UsFdVwOyMbwG7Js5wqlw4VamXIU/Zde5KOUhzH8Wtfl
 IqU1RkZgdGR6lvcqYDqK6jNbV1dLnBTNwsd8p2N0w6JU
X-Google-Smtp-Source: APiQypLVxoOL52vQCtNnXTAYp5PBdjYmQHaGv6I3Gr4TcphIqobH5Fkp8cyHImKSYv/zGf7+JpYlM+qePYnWjSNabaY=
X-Received: by 2002:ab0:1ea:: with SMTP id 97mr4866245ual.106.1587726709518;
 Fri, 24 Apr 2020 04:11:49 -0700 (PDT)
MIME-Version: 1.0
References: <20200423223459.200858-1-pcc@google.com>
In-Reply-To: <20200423223459.200858-1-pcc@google.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Fri, 24 Apr 2020 12:09:42 +0100
Message-ID: <CACvgo50xnz9g8PE6+4FxHr=NJ4sWd1no4erFBJ2RY2msE12PYA@mail.gmail.com>
Subject: Re: [PATCH] drm: pl111: enable render node
To: Peter Collingbourne <pcc@google.com>
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
Cc: ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 23 Apr 2020 at 23:51, Peter Collingbourne <pcc@google.com> wrote:
>
> The render node is required by Android which does not support the legacy
> drmAuth authentication process.
>
> Signed-off-by: Peter Collingbourne <pcc@google.com>
> ---
>  drivers/gpu/drm/pl111/pl111_drv.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
The summary talks about drmAuth, yet exposes a render node. Even
through there's no rendering engine in the HW, as mentioned by Eric.

AFAICT the only way drmAuth is relevant with pl111 is when you want to
export/import dma bufs.
Although that is handled in core and the artificial DRM_AUTH
restriction has been lifted with commit [1].

-Emil

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?h=v5.7-rc2&id=30a958526d2cc6df38347336a602479d048d92e7
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
