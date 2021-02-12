Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DB28319F47
	for <lists+dri-devel@lfdr.de>; Fri, 12 Feb 2021 13:58:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99C786E0E3;
	Fri, 12 Feb 2021 12:58:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe35.google.com (mail-vs1-xe35.google.com
 [IPv6:2607:f8b0:4864:20::e35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62B016E0E3;
 Fri, 12 Feb 2021 12:58:11 +0000 (UTC)
Received: by mail-vs1-xe35.google.com with SMTP id 68so3237310vsk.11;
 Fri, 12 Feb 2021 04:58:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=z12PhhCoyKbGlotTE60lQTToSx/Gs5QgkUPZavQ8JyM=;
 b=WakuNUrLlqX3/pBx8Z5QWInFd2yPiItuIQv0HfK2RuT6FZ9GV1Q9EesYKehz/9zq1u
 0i0yYGb1RCCwH546iOAiodn/t4q/0NkGapIQt7gnyZh02Ne55TgDkxsWlqq8CTP7s3wH
 Y1jKc3TFbigc+4YZ9EuPwZDO+NA9XsJ7bGDB+lz/vBkm0pXIPcY5J7i4FOEyC/4aSRmX
 tYDbM+tQZ42kmiykaxMwTzg/KXgn7XJJ/gCtC/pIJNDopm9nxhKRUNxIdar8a595ou4B
 MCpj3dHuI7QKp0t2WwOnEJOhQQKGIatIobHB8tUp4ZBC2f4x43D+9V/LSZOVcB1b51Qn
 Y6Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=z12PhhCoyKbGlotTE60lQTToSx/Gs5QgkUPZavQ8JyM=;
 b=UNuWl3Frb1H1mA3J9Ldq3u1ljhlQbzdvOR2S+ciyP6/40w38ILMl0IHRIdZn+2hPXz
 TyiFTpBNctylTN59ygdYP1Uo16nKJwB08O1TWIJXdo9wrpFbJJfDKu63KsiZZhr7V7lX
 np9tBy+sPXiL/NXBKltafpnEQKX56MBbhepffYARmfGQsQH6ZMvdBBZyAipoA3JrjkMo
 vouHC3AeUk0XN2m5CeSgt4UfJY7I9Msu08/OqYwzpC1R9Jl2y6bRqiXFGWSKYjlKmvtn
 f0GiVzACyOD5iFHnlLSbhe2TNv6qbvd0dWA1gE808NsliFkSbyFiDmqRvEUSHnBzhPw4
 gZAg==
X-Gm-Message-State: AOAM532S4IM+LPWXqysXCg7MBigjZNqTZUUMLjjpWUKXhKtbMsToMTFj
 Eb9PADIFcAozG8GvTGiiNOastq1tyv3txPsZsMM=
X-Google-Smtp-Source: ABdhPJz3FJd2niEkts/x/fUwfjf6jSSgG5LfMcil8AoCJ8Ae9QFcx8LfcFbVGYiker6htZZ0mPPuDZXC92wGm/H7das=
X-Received: by 2002:a67:882:: with SMTP id 124mr998667vsi.33.1613134690545;
 Fri, 12 Feb 2021 04:58:10 -0800 (PST)
MIME-Version: 1.0
References: <20210205163752.11932-1-chris@chris-wilson.co.uk>
 <20210205220012.1983-1-chris@chris-wilson.co.uk>
In-Reply-To: <20210205220012.1983-1-chris@chris-wilson.co.uk>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Fri, 12 Feb 2021 12:57:59 +0000
Message-ID: <CACvgo52u1ASWXOuWuDwoXvbZhoq+RHn_GTxD5y9k+kO_dzmT7w@mail.gmail.com>
Subject: Re: [PATCH v3] kcmp: Support selection of SYS_kcmp without
 CHECKPOINT_RESTORE
To: Chris Wilson <chris@chris-wilson.co.uk>
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
Cc: Will Drewry <wad@chromium.org>, Kees Cook <keescook@chromium.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Andy Lutomirski <luto@amacapital.net>, Cyrill Gorcunov <gorcunov@gmail.com>,
 "# 3.13+" <stable@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 5 Feb 2021 at 22:01, Chris Wilson <chris@chris-wilson.co.uk> wrote:
>
> Userspace has discovered the functionality offered by SYS_kcmp and has
> started to depend upon it. In particular, Mesa uses SYS_kcmp for
> os_same_file_description() in order to identify when two fd (e.g. device
> or dmabuf)

As you rightfully point out, SYS_kcmp is a bit of a two edged sword.
While you mention the CONFIG issue, there is also a portability aspect
(mesa runs on more than just linux) and as well as sandbox filtering
of the extra syscall.

Last time I looked, the latter was still an issue and mesa was using
SYS_kcmp to compare device node fds.
A far shorter and more portable solution is possible, so let me
prepare a Mesa patch.

-Emil
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
