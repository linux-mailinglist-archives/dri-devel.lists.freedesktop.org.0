Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7357D3E2FA5
	for <lists+dri-devel@lfdr.de>; Fri,  6 Aug 2021 21:04:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BD5B6EC1A;
	Fri,  6 Aug 2021 19:04:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F6D26EC1A
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Aug 2021 19:04:16 +0000 (UTC)
Received: by mail-oi1-x22a.google.com with SMTP id a19so13429761oiw.6
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Aug 2021 12:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZT01TgKF7XEqpoPOtmHqdd4Je83vC9seFylZrpeVCdA=;
 b=FuYNCKMVlDxEyxLAFTn6GTmFGUClvbPOEIqm19dmqWKjyvX23E7TB2UtaN7dunkEy2
 rR0BdBfVPQWaBEn9jOBdSTEigT6DWPwlVfMJyMfK1H/9RzqLdgxNZTU9/E9aBRWHag3D
 xjb1rVQgTKVqCkqhqQwA3A5XlEj209kuKcyhM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZT01TgKF7XEqpoPOtmHqdd4Je83vC9seFylZrpeVCdA=;
 b=Fg+pNwzkb4MSZNVwZuC0yVDNYGPiSwXKhqBKKRHmVMaKZ2yyX/wvPnfB+vHVMbDiJn
 v35wE51JrdAmcrMzUbX2+8rjRCGdh3hwLKB9qRdzU2NGrsxDBpTD73IcjhN8+9N2FB5D
 L7k0e4N6BVL4pIr3HpGjjqRmo4DzdcSa4njacHh7omqbfbefmf1OSfNbjiAZDMcMMfMR
 G5VylxP5bkrXAvBYdiZfAicq6/sTITUY/mhHozvkLllBTgz6G3L7rAoNvoE7kI2r3dRb
 CEbcvnWt79DpgJcC656OKtMbctECykOEN81TZqy/3QKPm9RUXeO/VKRkXuvdRB2T75md
 s1cQ==
X-Gm-Message-State: AOAM531Cyi0xt8jCS2BEk1qHBSFxHbbMf3n4h1bi9U5GFGsfgsuAy1Z3
 i6aEzAFbgESDGsxjWIv4HXAOElthRdf7h1x5dWhu7Q==
X-Google-Smtp-Source: ABdhPJxTe7LFcmOjLVVGjEdWd9gISgLJkJ0MFlfg8DYRX8l5ebEcO6EsoWzJ3WCmYSU6KmFJS0sFVjcQ33W6I8Ibr8Y=
X-Received: by 2002:a05:6808:3b2:: with SMTP id
 n18mr6045462oie.14.1628276655861; 
 Fri, 06 Aug 2021 12:04:15 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9twko1gCNTB3CPf7CAQqWFayMj=1fa3ZoEwwviDFhF48kQ@mail.gmail.com>
 <CAHk-=wgYq=EpNmDPNVxnBX+HpjNcQg50DSjuxZuK0UbZjh-pnQ@mail.gmail.com>
In-Reply-To: <CAHk-=wgYq=EpNmDPNVxnBX+HpjNcQg50DSjuxZuK0UbZjh-pnQ@mail.gmail.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Fri, 6 Aug 2021 21:04:04 +0200
Message-ID: <CAKMK7uEnPn=Tuc7bV-=Nr7gbk+uP9L0xH+HDL2+D4PewMmq6Cg@mail.gmail.com>
Subject: Re: [git pull] drm fixes for 5.14-rc4
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Dave Airlie <airlied@gmail.com>, Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 5, 2021 at 8:14 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> This might possibly have been fixed already by the previous drm pull,
> but I wanted to report it anyway, just in case.
>
> It happened after an uptime of over a week, so it might not be trivial
> to reproduce.
>
> It's a NULL pointer dereference in dc_stream_retain() with the code being
>
>         lock xadd %eax,0x390(%rdi) <-- trapping instruction
>
> and that's just the
>
>         kref_get(&stream->refcount);
>
> with a NULL 'stream' argument.
>
>   Call Trace:
>    dc_resource_state_copy_construct+0x13f/0x190 [amdgpu]
>    amdgpu_dm_atomic_commit_tail+0xd5/0x1540 [amdgpu]
>    commit_tail+0x97/0x180 [drm_kms_helper]
>    process_one_work+0x1df/0x3a0
>
> the oops is followed by a stream of
>
>   [drm:amdgpu_dm_atomic_check [amdgpu]] *ERROR* [CRTC:55:crtc-1]
> hw_done or flip_done timed out
>
> and the machine was not usable afterwards.

Hm that part is a bit disappointing because the atomic modeset commit
helpers are designed to recover from this (assuming we didn't fry the
hw). But amdgpu does these waits in amdgpu_dm_atomic_check() which is
decidedly not great (you're not supposed to block on hw or a previous
in that atomic_check ever, because it can be called by userspace in a
TEST_ONLY mode to figure out whether a desired config would work), and
then returns that error to userspace, which is worse.

I guess that's another area where the integration between what atomic
modeset expects and the DC backend provides is suboptimal. I think the
data structures we managed to fuse together fairly ok, but the
check/commit flow and semantics are a bit a struggle.

Anyway this was just an aside, I guess given the bug the driver
wouldn't have recovered anyway.
-Daniel

> lspci says this is a
>
>  49:00.0 VGA compatible controller [0300]:
>    Advanced Micro Devices, Inc. [AMD/ATI] Ellesmere
>    [Radeon RX 470/480/570/570X/580/580X/590]
>    [1002:67df] (rev e7) (prog-if 00 [VGA controller])
>
> Full oops in the attachment, but I think the above is all the really
> salient details.
>
>                    Linus



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
