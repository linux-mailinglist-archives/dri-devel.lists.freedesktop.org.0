Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BA3921E0CF
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jul 2020 21:33:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6358890B8;
	Mon, 13 Jul 2020 19:33:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93470890B8
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jul 2020 19:33:09 +0000 (UTC)
Received: by mail-ot1-x341.google.com with SMTP id 5so10427097oty.11
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jul 2020 12:33:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DPDVjnZ956PL0g0HLPxcP/9JNQmgQLjxjx/mkWFneA8=;
 b=I3FIyk+ze8k+GcThCPyoJrhjToTGsRuTeklCTOVrV47hGvLmhUeTRTQnMjBmOMegaO
 ckNfoQdWAadrpJOzGWMNHpOfnsxGFI1DE7cbtwIF/CASZ97Bhrn9qYrEPGWz/Lv17QaZ
 1qtrylS0VsYeu/p4E8mFSUd8lrxH+SGjnZdYs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DPDVjnZ956PL0g0HLPxcP/9JNQmgQLjxjx/mkWFneA8=;
 b=R66/Qa10crrMWFJQGCBtVKiO3rfUJiS4TUL+5YzL8Qa5nEzcOUSCNBGrkxcqQ3lrVM
 yI8Qs9F5jyDrc2CCft/wAirtAUOzUzULIG0CrX7DNmLiwWY50nzGMH0x7NSaP1q9HjDn
 vhj0yezlWWz4jdvJiq7TauczmEi+8eDHTb67EiEJ7qZAcon3Ap5B9HeGC4UVIvHuNO6n
 xXf2VzfIUTNDVzcO76nouXWtW+O5i9q6r9Knb3yUrBsGQRy5VA3EeFcRVYcydf6gm7ML
 /RRYdE96AvB/vDTFju2t70u2wKabFwri7vz5Hu3+0S00Ig6GRSOWJDurHbkzuPwsM5eG
 m02w==
X-Gm-Message-State: AOAM532x/G7RYyK/SXCrspq4M7SO0kRTP32TaK8kLf0Wt3hfscj1TcuQ
 ZMn4ewAIAxO8ibbO/7t92+5q+poAAs+IxuAsyFV5xEjb
X-Google-Smtp-Source: ABdhPJzcGPwa+ufeT84/AVAQRz3sAPtSlprKgJIkNlG4ycRV5sUjkkpGy2DpZgn+Er3JGTY4Zxh2g4t8QI0gOT2g9cU=
X-Received: by 2002:a05:6830:1613:: with SMTP id
 g19mr999709otr.303.1594668788887; 
 Mon, 13 Jul 2020 12:33:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200709193016.291267-1-sam@ravnborg.org>
 <14ce41c4-d683-1551-9f21-37b054f5752c@suse.de>
 <20200713162159.GR3278063@phenom.ffwll.local>
 <20200713183909.GA1331493@ravnborg.org>
In-Reply-To: <20200713183909.GA1331493@ravnborg.org>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Mon, 13 Jul 2020 21:32:57 +0200
Message-ID: <CAKMK7uF-5pWCk8pSObikd41PZJk+qZmM0znFqxFk9nhzeqZoyg@mail.gmail.com>
Subject: Re: [PATCH] drm/drm_fb_helper: fix fbdev with sparc64
To: Sam Ravnborg <sam@ravnborg.org>
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 dri-devel <dri-devel@lists.freedesktop.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, sparclinux@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jul 13, 2020 at 8:39 PM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> On Mon, Jul 13, 2020 at 06:21:59PM +0200, Daniel Vetter wrote:
> > On Fri, Jul 10, 2020 at 08:28:16AM +0200, Thomas Zimmermann wrote:
> > > Hi
> > >
> > > Am 09.07.20 um 21:30 schrieb Sam Ravnborg:
> > > > Mark reported that sparc64 would panic while booting using qemu.
> > > > Mark bisected this to a patch that introduced generic fbdev emulation to
> > > > the bochs DRM driver.
> > > > Mark pointed out that a similar bug was fixed before where
> > > > the sys helpers was replaced by cfb helpers.
> > > >
> > > > The culprint here is that the framebuffer reside in IO memory which
> > > > requires SPARC ASI_PHYS (physical) loads and stores.
> > > >
> > > > The current bohcs DRM driver uses a shadow buffer.
> > > > So all copying to the framebuffer happens in
> > > > drm_fb_helper_dirty_blit_real().
> > > >
> > > > The fix is to replace the memcpy with memcpy_toio() from io.h.
> > > >
> > > > memcpy_toio() uses writeb() where the original fbdev code
> > > > used sbus_memcpy_toio(). The latter uses sbus_writeb().
> > > >
> > > > The difference between writeb() and sbus_memcpy_toio() is
> > > > that writeb() writes bytes in little-endian, where sbus_writeb() writes
> > > > bytes in big-endian. As endian does not matter for byte writes they are
> > > > the same. So we can safely use memcpy_toio() here.
> > > >
> > > > For many architectures memcpy_toio() is a simple memcpy().
> > > > One sideeffect that is unknow is if this has any impact on other
> > > > architectures.
> > > > So far the analysis tells that this change is OK for other arch's.
> > > > but testing would be good.
> > > >
> > > > Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> > > > Reported-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> > > > Tested-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> > > > Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> > > > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > > > Cc: Gerd Hoffmann <kraxel@redhat.com>
> > > > Cc: "David S. Miller" <davem@davemloft.net>
> > > > Cc: sparclinux@vger.kernel.org
> > >
> > > So this actually is a problem in practice. Do you know how userspace
> > > handles this?
> > >
> > > For this patch
> > >
> > > Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
> > >
> > > but I'd like to have someone with more architecture expertise ack this
> > > as well.
> > >
> > > Best regards
> > > Thomas
> > >
> > > > ---
> > > >  drivers/gpu/drm/drm_fb_helper.c | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
> > > > index 5609e164805f..4d05b0ab1592 100644
> > > > --- a/drivers/gpu/drm/drm_fb_helper.c
> > > > +++ b/drivers/gpu/drm/drm_fb_helper.c
> > > > @@ -399,7 +399,7 @@ static void drm_fb_helper_dirty_blit_real(struct drm_fb_helper *fb_helper,
> > > >   unsigned int y;
> > > >
> > > >   for (y = clip->y1; y < clip->y2; y++) {
> > > > -         memcpy(dst, src, len);
> > > > +         memcpy_toio(dst, src, len);
> >
> > I don't think we can do this unconditionally, there's fbdev-helper drivers
> > using shmem helpers, and for shmem memcpy_toio is wrong. We need a switch
> > to fix this properly I think.
> >
> > What Dave Airlie mentioned is just about memcpy_toio vs the sparc bus
> > version, for which we don't have any drivers really. But I do think we
> > need to differentiate between memcpy and memcpy_tio. That's what this
> > entire annoying _cfb_ vs _sys_ business is all about, and also what gem
> > vram helpers have to deal with.
>
> I did some more digging - taking notes see where this gets us.
>
> fbdev have a fb_memcpy_tofb macro used in fb_write() that is architecture dependent:
> __aarch64__             memcpy_toio
> __alpha__               memcpy_toio
> __arm__                 memcpy_toio
> __hppa__                memcpy_toio
> __i386__                memcpy_toio
> __powerpc__             memcpy_toio
> __sh__                  memcpy_toio
> __sparc__               sbus_memcpy_toio
> __x86_64__              memcpy_toio
>
> Others                  memcpy
>
> If we then take a closer look at memcpy_toio it is defined like this:
> alpha                   __raw (optimized based on size / alignment)
> arm                     optimised memcpy - same as memcpy
> arm64                   __raw (optimized based on size / alignment)
> hexagon                 memcpy
> ia64                    writeb which is little endian so the same as memcpy
> m68k                    memcpy
> mips                    memcpy
> parisc                  __raw (optimized based on size/alignment)
> s390                    s390 copy operations
> sh                      direct copies (looks like __raw copies)
> sparc                   writeb
> sparc64                 sparc64 copies
> x86_64                  x86_64 optimies copies (movs assembler)
>
> Others                  memcpy

Aside from the sbus_memcpy_toio I don't think any of this matters.
fbdev is simply older than memcpy_toio I think, on modern
architectures you should always use memcpy_toio if it's an __mmio
pointer, and normal memcpy for normal kernel pointers. Same holds for
simple stores vs write* and friends.

> As already analyzed sbus_memcpy_toio and memcpy_toio for sparc64 is the
> same. So from the above we can see that fbdev code always uses
> memcpy_toio or something equivalent when copying to framebuffer.
>
> The conclusions so far:
> - Copying to a framebuffer is correct to use memcpy_toio
> - fbdev could have the macro fb_memcpy_tofb replaced by a direct call to
>   memcpy_toio - I think the fb_memcpy_tofb macro predates the common
>   memcpy_toio macro which explains why this was not used
>
> This does not touch the whole _cfb_ vs _sys_ business.

It's all about the _cfb_ vs _sys_ business, since this is driver
specific. Either you need the __mmio functions, or the normal system
memory functions.

> In video/fbdev/ this is driver specific.
> So we could add a fbdev_use_iomem as you suggested on irc som days ago.
> This is not strictly necessary for the sparc64 fix but let me try to
> come up with a patch anyway.

We need it, to avoid upsetting all the other drivers. I guess once we
have this flag we could make special versions for fb-helpers which
call the _cfb_ vs _sys_ functions correctly, as an added bonus. But
for the sparc regression fix we need it already, so that we can call
memcpy on drm_framebuffer residing in system memory, and memcpy_toio
for those in vram or what looks like vram at least.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
