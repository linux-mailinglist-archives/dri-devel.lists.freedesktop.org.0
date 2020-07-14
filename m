Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 090C021E652
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jul 2020 05:28:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61DDD6E8A0;
	Tue, 14 Jul 2020 03:28:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6975589F03;
 Tue, 14 Jul 2020 03:28:19 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id n2so15631507edr.5;
 Mon, 13 Jul 2020 20:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EU1bv4/4NgTch57Z2kHsXH84weSL+o01h2U1ix1R9/E=;
 b=U2cBTsLpgmqhsvc8wXyUtgkn9u4rJ4fHnJUhC5cWUIc0rDKkBcpMlzEdxUGNJaEBMy
 84i+BwIHDGHQzDKi2wnAXCn77k8ZBGa0xWRHEnUOMVJ2z8LAHBLOSsgpO1r+PWLYu0sg
 tjAA4P4OdN9gVFnwyWwAdR3NuBqDqO5khD+y/4CH8gjAxKaGU3zQcAPeVMRIyqdrkjN+
 pmUKFLZMmnEYek7e0gN8QMnYpjd6PGM7Z+XkEsDVvCovNvXQxoKCLQQs0+16COSBaVLr
 Pfh1LTCk1XpzfpRKSADblhH1bj0ZPXOwUAPOCagVED1Dcxbdis1Ohpy491DPJp5c7a/8
 fCOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EU1bv4/4NgTch57Z2kHsXH84weSL+o01h2U1ix1R9/E=;
 b=RXMGFMb9yqkUx9oJO6SPMmfgAjmF4uz2PMy3aiOu++ZYDRre2cv5aJIlbBNtPhHqke
 3Tt7wRRiEw9Mhuf3qTAxZxnHid7rTk8lXNu+2fOqZ4Mc/degVr47DEBPNDvMO6ogKx0l
 wEP5BmAYbfBNNLGng7QRICepb341r10Gftdtqc560sAmdNrL+rb8m2kgCVVkXV2lBqIl
 Q2OmmaARKgqBqje8XwOzYNLNGOXmG4+osgfzEpE+S4emzQenALqKtYztMt182qUjK8WK
 IWn6v3itdv3KFhJJICV6spHdto6qNxBoDAvIQwjdKMbL4Eh+j2QZcYzBf2NqxIt/AWvV
 wuHA==
X-Gm-Message-State: AOAM533IyN0wLQjggLfX1n5hXqKBX+3g21jiNyuBQePAAqGcFh0zhT+y
 6xe/xwc/YznwLTlx0B+llhCG5ZUQbvxzamHiOr8=
X-Google-Smtp-Source: ABdhPJxQAf/MjJT0YJzqyoBzuPEj7t2xMKUrQTrBXAVfwqLo3VfYe27FZvoskCgt5swB6y+JjtHehI398IGOpkY4akg=
X-Received: by 2002:a05:6402:16c2:: with SMTP id
 r2mr2401249edx.127.1594697297978; 
 Mon, 13 Jul 2020 20:28:17 -0700 (PDT)
MIME-Version: 1.0
References: <20200714031435.13362-1-Felix.Kuehling@amd.com>
 <20200714031435.13362-2-Felix.Kuehling@amd.com>
In-Reply-To: <20200714031435.13362-2-Felix.Kuehling@amd.com>
From: Dave Airlie <airlied@gmail.com>
Date: Tue, 14 Jul 2020 13:28:06 +1000
Message-ID: <CAPM=9tzjQGg2OMrptD6qJv0yEvY+S7mS6oXNxe21UoWk+6-Ung@mail.gmail.com>
Subject: Re: [PATCH 1/1] drm/amdkfd: Add IPC API
To: Felix Kuehling <Felix.Kuehling@amd.com>
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
Cc: "Deucher, Alexander" <alexander.deucher@amd.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 14 Jul 2020 at 13:14, Felix Kuehling <Felix.Kuehling@amd.com> wrote:
>
> This allows exporting and importing buffers. The API generates handles
> that can be used with the HIP IPC API, i.e. big numbers rather than
> file descriptors.

First up why? I get the how.

> + * @share_handle is a 128 bit random number generated with
> + * @get_random_bytes. This number should be very hard to guess.
> + * Knowledge of the @share_handle implies authorization to access
> + * the shared memory. User mode should treat it like a secret key.
> + * It can be used to import this BO in a different process context
> + * for IPC buffer sharing. The handle will be valid as long as the
> + * underlying BO exists. If the same BO is exported multiple times,

Do we have any examples of any APIs in the kernel that operate like
this? That don't at least layer some sort of file permissions  and
access control on top?

The reason fd's are good is that combined with unix sockets, you can't
sniff it, you can't ptrace a process and find it, you can't write it
out in a coredump and have someone access it later.

To me this isn't secure design, it's obscure design, now I get to find
you've likely shipped this in "downstream" ROCm already, and have
customers running it.

Maybe someone who knows security can ack merging this sort of uAPI
design, I'm not confident in what it's doing is in any ways a good
idea. I might have to ask some people to take a closer look.

Dave.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
