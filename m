Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84BCF5485B0
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jun 2022 16:31:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 781A310E7F1;
	Mon, 13 Jun 2022 14:30:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com
 [IPv6:2607:f8b0:4864:20::b2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4511310E7EF
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 14:30:55 +0000 (UTC)
Received: by mail-yb1-xb2d.google.com with SMTP id r3so10164897ybr.6
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 07:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LtBQupy2GQnMLL7swZmZzIqcNe++ymEU9o4RkgMv0ok=;
 b=AaSNivWx7thm1YddSGexeMcFHhOvApaSrf9hTAO82FUvMLjmC+OYxKcOLPyAaD+MdN
 MdX60bJjDjeqxGZUqr3kI4l0/W/epJ/ORFueaMGBlJq36dH0NSHJC76Z487w+R9c4Eyq
 3+nj5y3v1INLhYem+RtooQplkk5xH/vT5J1k0hH0VJ+ilnhhiWGUP7rbTOVnSbSEXBmZ
 ZXrbQDjR0sbIZA0vv364vojxBhXv5EvNk11fxKbWBXCbNtQ/p/umJhB8SOUV0D2MaMiW
 5XGG0EWz7Z2xS8sL2dcgvjh5OZbXyQQ9Be4l1hkxrgknlyB0XXhDxCZa76baS+s/qAe6
 E7jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LtBQupy2GQnMLL7swZmZzIqcNe++ymEU9o4RkgMv0ok=;
 b=bV7ixfjqMyIsZGOdlxfMNaOTLUn97XqqUZPI3NJ5dSUNdvBEr21GtfN3SAS1eR+JEd
 7YQvOrVyZ1Z/gdQ+uSmqWgE6LvXEHNpDFp1dVKZYB1wRboUgAj5hduN+8zBcPgmwk727
 EUHa7c7N5kFUowuT+b+Pcgh9C10j0W6Ojohzz83wLxWflBSjuDM1eIqzBsfQMsUiemvO
 ED8usbHubuBa6xHnuD8rRsaKKIZWAw9rGj7ICzCURBiYFoXbMhpSCk14kTMD21Dakfcs
 tr3m5vwGZXzU24YvVbrjbp/11cLtlYa+UanasSlG5DmfDbcVKdC+PUeKoQtIda9UNdbx
 uLRQ==
X-Gm-Message-State: AOAM531huYlYwLSem7UV1jsV7Sfg2CAgbgG9PedQYFjynjyrgjQ8HthO
 ygnBML5qzgH66pukEIugl2SslFMsjtcG+KoSH6tqQw==
X-Google-Smtp-Source: ABdhPJzfzmCDwqbAjr/9ZHRxtTNYShMOMGjj1hoHMEBV9P0hWh5ArfA7RltlgJKbWViHS112Z8GXZ7da7vFkUjUgpvo=
X-Received: by 2002:a25:ad85:0:b0:664:9682:3ce4 with SMTP id
 z5-20020a25ad85000000b0066496823ce4mr10726392ybi.280.1655130654099; Mon, 13
 Jun 2022 07:30:54 -0700 (PDT)
MIME-Version: 1.0
References: <304E860A-A638-45D1-9AF3-F121A31CF7B0@apple.com>
 <Yqa6aWa70/GqhAHO@quokka>
 <CAPj87rPHKmFq2-VTWEJH_iVe2R7xvmb44v_ZWcQ9VakhF+5ArA@mail.gmail.com>
In-Reply-To: <CAPj87rPHKmFq2-VTWEJH_iVe2R7xvmb44v_ZWcQ9VakhF+5ArA@mail.gmail.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Mon, 13 Jun 2022 15:30:35 +0100
Message-ID: <CAPj87rPvEFCWeeohiczUCXGEdrwqwJza+CcrOy1E3d9UBHSnBA@mail.gmail.com>
Subject: Re: 504 to gitlab.freedesktop.org
To: Peter Hutterer <peter.hutterer@who-t.net>
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
Cc: xorg-devel@lists.freedesktop.org, Jeremy Sequoia <jeremyhu@apple.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 wayland <wayland-devel@lists.freedesktop.org>,
 sitewranglers@lists.freedesktop.org, freedesktop@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, 13 Jun 2022 at 08:39, Daniel Stone <daniel@fooishbar.org> wrote:
> Yes, that's what's happening. Our (multi-host-replicated etc) Ceph
> storage setup has entered a degraded mode due to the loss of a couple
> of disks - no data has been lost but the cluster is currently unhappy.
> We're walking through fixing this, but have bumped into some other
> issues since, including a newly-flaky network setup, and changes since
> we last provisioned a new storage host.
>
> We're working through them one by one and will have the service back
> up with all our data intact - hopefully in a matter of hours but we
> have no firm ETA right now.

Thanks mainly to Ben, everything is back up and running now.

Cheers,
Daniel
