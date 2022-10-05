Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A5635F5B44
	for <lists+dri-devel@lfdr.de>; Wed,  5 Oct 2022 22:56:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4369E10E77E;
	Wed,  5 Oct 2022 20:56:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99DCE10E77E
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Oct 2022 20:56:22 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id ot12so378795ejb.1
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Oct 2022 13:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=zfpsNBbNVPzFpz+lF6+ppNQCYSIyAPrPwcUGS4C/qTM=;
 b=Mf5nuCylf6oEdgUt9A74oPuzITr0D9YIrAijaWEUBhdHOQdttCTl3kdPf9/gN34UMB
 f4Jw9sNgDqmkiYuAhKBRAUfRw7ovit1aoS6tSbYi/u3KEansVUfvs4aXg9XfyDiDciY+
 CcUFjq2W3UizHMc58TANb7W4Q0Wb/p7HErqSAACaWlBUQ323wnoYvOybrWNFnYc3CfsR
 SKoIwLYQpn7qVcryF0xDwkM8AEop/LvohQRx3Du26pCKcUWLzjG4dvwxqBOuctYVUKVP
 KdzkDEsE8vBW5zwYaMkxXYlgQ0PPW03+8qad68O2P6wl9o0H6C3Xr/+w834WkeITicHM
 KxUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zfpsNBbNVPzFpz+lF6+ppNQCYSIyAPrPwcUGS4C/qTM=;
 b=y09SDYTv25wmzy3ELNETXdT7UHxU77uE53g6SM0GpHoFJRy2BDCeVOM4csH/mtZzxc
 QY34Nj3XMEK7W5nQFWV3NzwX1LRsSKs+HgJUIs9pOxmOcIoPOYuunCXDGUV/BsrRG4RT
 axdd/8j8uY1kSHQjsXZJHR6SWtkYTNEhDX0gPw7zTv3zSefoF0MUmny8lKcdCRHMPJy2
 yMpRji8kncf1v6+Pb8jsUx+Tfr64/MlyY7FFr8Dlsp9FZyILBd0vSZx639PZ3s2FKExK
 et/m5Egihq4wHAtV7Hrw2XBEsGOaamFbepP1fr+eutZff7GluzZKqzKvxdz6rVKKGbF8
 q4Jg==
X-Gm-Message-State: ACrzQf0tqyWRmN6jwCPEbFgjAqrjMcTlxNtpYGLpp/PymCK/wjwLDwv5
 M1XF/dQYPnyr7z+1KCpe2ok6tdOwctbgV5uych8=
X-Google-Smtp-Source: AMsMyM7arMg3njnjE8r31COnUuj7GFoDNNv8j63P6WC0F1Sdxn2Pw7vfjj13LeCE8eIzls9P4+NNy7g/B19QBlnm4cs=
X-Received: by 2002:a17:906:9756:b0:78b:8c9b:3b1d with SMTP id
 o22-20020a170906975600b0078b8c9b3b1dmr1181520ejy.256.1665003380999; Wed, 05
 Oct 2022 13:56:20 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9tzs4n8dDQ_XVVPS_5jrBgsNkhDQvf-B_XmUg+EG_M2i4Q@mail.gmail.com>
 <CAHk-=wgJmLVs7MYd=uF4+b32Fwmvgc0MLr4TEUSBEPf5U6=W5g@mail.gmail.com>
In-Reply-To: <CAHk-=wgJmLVs7MYd=uF4+b32Fwmvgc0MLr4TEUSBEPf5U6=W5g@mail.gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 6 Oct 2022 06:56:08 +1000
Message-ID: <CAPM=9tx+qa5aucS7Sa4Lg4SAD7PamCYsPwSupgd1xix1Y9HEkg@mail.gmail.com>
Subject: Re: [git pull] drm for 6.1-rc1
To: Linus Torvalds <torvalds@linux-foundation.org>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 6 Oct 2022 at 04:38, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Tue, Oct 4, 2022 at 8:42 PM Dave Airlie <airlied@gmail.com> wrote:
> >
> > This is very conflict heavy, mostly the correct answer is picking
> > the version from drm-next.
>
> Ugh, yes, that was a bit annoying.
>
> I get the same end result as you did, but I do wonder if the drm
> people should try to keep some kind of separate "fixes" branches for
> things that go both into the development tree and then get sent to me
> for fixes pulls?
>
> Hopefully this "lots of pointless noise" was a one-off, but it might
> be due to how you guys work..

In this case I think it was a late set of fixes backported for new AMD
hardware, that had to be redone to fit into the current kernel that
caused most of it. I haven't seen it this bad in a long while. We also
maintain a rerere tree ourselves to avoid continuously seeing it.

The problem is a lot of developers don't have the insight that the
maintainers do into the current state of the tree/pipeline.

Stuff goes into next because that is where the patch it fixes
originally went, and it goes through CI there. Then at some point
someone else realises the change needs to be in fixes and it gets
backported.

The volume of patches and company signoff processes doesn't make it
trivial to upfront decide what needs to go in -next or -fixes
unfortunately.

Dave.
