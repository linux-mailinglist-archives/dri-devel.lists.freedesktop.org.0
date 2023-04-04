Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D29626D69FA
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 19:14:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 887AD10E3CC;
	Tue,  4 Apr 2023 17:14:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com
 [IPv6:2607:f8b0:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B57C10E3CC
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Apr 2023 17:14:18 +0000 (UTC)
Received: by mail-ot1-x32d.google.com with SMTP id
 q23-20020a05683031b700b006a1370e214aso14825830ots.11
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Apr 2023 10:14:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1680628457;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+rctyGFwUhLz0v8rBkOornKtYQMB5BPJug/RzBuS/2M=;
 b=VmRmfUZJUhyGOczWKMV+00PPnBHHsUoFeSbH0NGIe8Pd07ZW3TAuh1YijivL9qwChI
 h7bi++UVLPLXD8FqO6JdWSOR2/A2A35sAcOUU+OVZ3FHQ++SuIZjes+JUL5nzx+nHCz5
 yUpA65U8rH4S0U9vn0CAIA5igm+IkFgm69g+o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680628457;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+rctyGFwUhLz0v8rBkOornKtYQMB5BPJug/RzBuS/2M=;
 b=l5z5ZcJOS1oXMQ5nZL//4DmoY3U1e9nICrYK9PZZNICwYWJuaxN5OXAas6BV3MR1qF
 608AVv6pFvrGlo+P6LXbcR2+eVCODkNdtz2x29+JPT6gy+BNGfNV+ldomXz5/Nsr5LZT
 ut5qIsxrKh/WJ64nD8djKKDIr2sLpghp4t1q8PZAV5YKczNZs9KPg5Ds8OZvGthiwrvo
 POxqiY6ruFxM/FGU3Icg1LLIWWrgUi4aLB6H6ZddYFVW91rZi6Ujg7MFexVFAuUzRibp
 qhlKLfuYxSea2UKZLuxzMKDss6jOTxWi7WtxqKWsui6DGmeIL3Ck5OLwaLZFRdRJ/oLP
 hjwg==
X-Gm-Message-State: AAQBX9ccdZ2aGrmMaDQgiOGDAvDYeQSWblEo6zPFeXBEChagbqsQF3qK
 cmOsTpuz4QJewqNnLA+yOyBo9rmLReoyu042GfEjcg==
X-Google-Smtp-Source: AKy350YHyFY/sr2g+RppxfbAVFUR9kDehSje5aPccXvHQ9pwWgn46QEOz0mPW9kfcDo5DAf2YO8EtU9WiCaFTdWS/hQ=
X-Received: by 2002:a9d:74cf:0:b0:6a3:8428:fd4e with SMTP id
 a15-20020a9d74cf000000b006a38428fd4emr1053522otl.6.1680628457599; Tue, 04 Apr
 2023 10:14:17 -0700 (PDT)
MIME-Version: 1.0
References: <20230404123624.360384-1-daniel.vetter@ffwll.ch>
 <CAMuHMdUR=rx2QPvpzsSCwXTSTsPQOudNMzyL3dtZGQdQfrQGDA@mail.gmail.com>
 <ZCwtMJEAJiId/TJe@phenom.ffwll.local> <ZCwx+2hAmyDqOfWu@phenom.ffwll.local>
 <CAMuHMdVt+fsHhk73hPe=bN5e_vTjKEM014Q1AJ9tnankvsXcHg@mail.gmail.com>
 <CAKMK7uFEmt1=4jDi1xDbnTVH6M2iEZSjcY-UN93do0NiH=GogA@mail.gmail.com>
 <CAMuHMdUpyxuAZVxZmVCzspbzCBPFdnhbrYOJPMjFnqwtwNCAsw@mail.gmail.com>
In-Reply-To: <CAMuHMdUpyxuAZVxZmVCzspbzCBPFdnhbrYOJPMjFnqwtwNCAsw@mail.gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 4 Apr 2023 19:14:06 +0200
Message-ID: <CAKMK7uFtL=ON_PiwcSKpwkiaHt3wqShN=UwxeKTZN4heK5K0UA@mail.gmail.com>
Subject: Re: [PATCH] fbdev: Don't spam dmesg on bad userspace ioctl input
To: Geert Uytterhoeven <geert@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Helge Deller <deller@gmx.de>,
 syzbot+20dcf81733d43ddff661@syzkaller.appspotmail.com,
 Javier Martinez Canillas <javierm@redhat.com>, stable@vger.kernel.org,
 Melissa Wen <melissa.srw@gmail.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 4 Apr 2023 at 19:04, Geert Uytterhoeven <geert@linux-m68k.org> wrot=
e:
>
> Hi Daniel,
>
> On Tue, Apr 4, 2023 at 5:55=E2=80=AFPM Daniel Vetter <daniel@ffwll.ch> wr=
ote:
> > On Tue, 4 Apr 2023 at 16:51, Geert Uytterhoeven <geert@linux-m68k.org> =
wrote:
> > > On Tue, Apr 4, 2023 at 4:19=E2=80=AFPM Daniel Vetter <daniel@ffwll.ch=
> wrote:
> > > > On Tue, Apr 04, 2023 at 03:59:12PM +0200, Daniel Vetter wrote:
> > > > > On Tue, Apr 04, 2023 at 03:53:09PM +0200, Geert Uytterhoeven wrot=
e:
> > > > > > On Tue, Apr 4, 2023 at 2:36=E2=80=AFPM Daniel Vetter <daniel.ve=
tter@ffwll.ch> wrote:
> > > > > > > There's a few reasons the kernel should not spam dmesg on bad
> > > > > > > userspace ioctl input:
> > > > > > > - at warning level it results in CI false positives
> > > > > > > - it allows userspace to drown dmesg output, potentially hidi=
ng real
> > > > > > >   issues.
> > > > > > >
> > > > > > > None of the other generic EINVAL checks report in the
> > > > > > > FBIOPUT_VSCREENINFO ioctl do this, so it's also inconsistent.
> > > > > > >
> > > > > > > I guess the intent of the patch which introduced this warning=
 was that
> > > > > > > the drivers ->fb_check_var routine should fail in that case. =
Reality
> > > > > > > is that there's too many fbdev drivers and not enough people
> > > > > > > maintaining them by far, and so over the past few years we've=
 simply
> > > > > > > handled all these validation gaps by tighning the checks in t=
he core,
> > > > > > > because that's realistically really all that will ever happen=
.
> > > > > > >
> > > > > > > Reported-by: syzbot+20dcf81733d43ddff661@syzkaller.appspotmai=
l.com
> > > > > > > Link: https://syzkaller.appspot.com/bug?id=3Dc5faf983bfa4a607=
de530cd3bb008888bf06cefc
> > > > > >
> > > > > >     WARNING: fbcon: Driver 'vkmsdrmfb' missed to adjust virtual=
 screen
> > > > > > size (0x0 vs. 64x768)
> > > > > >
> > > > > > This is a bug in the vkmsdrmfb driver and/or DRM helpers.
> > > > > >
> > > > > > The message was added to make sure the individual drivers are f=
ixed.
> > > > > > Perhaps it should be changed to BUG() instead, so dmesg output
> > > > > > cannot be drown?
> > > > >
> > > > > So you're solution is to essentially force us to replicate this c=
heck over
> > > > > all the drivers which cannot change the virtual size?
> > > > >
> > > > > Are you volunteering to field that audit and type all the patches=
?
> > > >
> > > > Note that at least efifb, vesafb and offb seem to get this wrong. I=
 didn't
> > > > bother checking any of the non-fw drivers. Iow there is a _lot_ of =
work in
> > > > your nack.
> > >
> > > Please don't spread FUD: efifb, vesafb and offb do not implement
> > > fb_ops.fb_check_var(), so they are not affected.
> >
> > Hm I missed that early out. I'll do a patch to fix the drm fb helpers,
> > as mentioned in the other thread I don't think we can actually just
> > delete that because it would short-circuit out the fb_set_par call
> > too.
>
> As I said to the other thread earlier today[1], I think we can keep
> the .fb_set_par() implementation.
> There's just no point in providing a .fb_check_var() callback if
> you don't support changing the video mode.

If you don't have check_var then set_par just isn't called. Or am
blind once more, not the first time today.

And see the big comment in the drm set_par implementation, we can't
ditch that because uabi fun in how the fbdev vs kms interactions are
handled.
-Daniel

> [1] https://lore.kernel.org/all/CAMuHMdUaHd1jgrsCSxCqF-HP2rAo2ODM_ZOjhk7Q=
4vjuqvt36w@mail.gmail.com
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m6=
8k.org
>
> In personal conversations with technical people, I call myself a hacker. =
But
> when I'm talking to journalists I just say "programmer" or something like=
 that.
>                                 -- Linus Torvalds



--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
