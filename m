Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C5E06D69BF
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 19:04:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B974F10E723;
	Tue,  4 Apr 2023 17:04:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com
 [209.85.219.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9E3C10E723
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Apr 2023 17:04:52 +0000 (UTC)
Received: by mail-yb1-f173.google.com with SMTP id r187so39519624ybr.6
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Apr 2023 10:04:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680627891;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DN8+oIYkNGb8Y5r2uRgiwjJT4v6XcCTZNjemsUmI+JY=;
 b=w6oUUFpyv7oCwRekdLN59OQGxKc2vjIuwt4U9MVNZAHF1I0ve+tr50mWTcMvP/kM7k
 g7DKtNw4ncmqmII4CvmaPuxL5XafKbvxS/WdyaGzJnROPf2BAHhd/VbNStFPcYNf4CKz
 jkvyx7XrbXxUhzHNDokO/4ADZqTL4SbUqujY/jEcGwXR+7q0FFMTbNj1HmiWWNW4fKlT
 jZ32VFCTlM1hP6gg+BW1DTAOOVyzvM9/xprFs4akMXU8iPSPcHcKTHWdJlXR05dHXuxO
 F2UU35qRFVKgzHJyqmwnnsXc9B+vHASPg876UqpI6VoJWYftwmsTW4X204gJEyk++XGd
 wKOA==
X-Gm-Message-State: AAQBX9cmsmQO/InsMjkiJ0w5MArGosX1TIDsMdKTjw35Fq9MxkxvW0q9
 UqD7k9QArzPjI7wWD4TNj1zGDW8jJiAWdln4
X-Google-Smtp-Source: AKy350YWlfV/LjcMcVuj3sIeIQ2R8pZnnlGXNpjzitjCcl8wICVJHCAHR8WlJ4wItS6NZ6iMSYQiog==
X-Received: by 2002:a25:aac3:0:b0:b66:2851:7685 with SMTP id
 t61-20020a25aac3000000b00b6628517685mr152556ybi.8.1680627891651; 
 Tue, 04 Apr 2023 10:04:51 -0700 (PDT)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com.
 [209.85.219.182]) by smtp.gmail.com with ESMTPSA id
 s7-20020a25b947000000b00b7767ca747csm3432329ybm.25.2023.04.04.10.04.51
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Apr 2023 10:04:51 -0700 (PDT)
Received: by mail-yb1-f182.google.com with SMTP id m16so19193443ybk.0
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Apr 2023 10:04:51 -0700 (PDT)
X-Received: by 2002:a25:ca4b:0:b0:b77:d2db:5f8f with SMTP id
 a72-20020a25ca4b000000b00b77d2db5f8fmr2271273ybg.12.1680627890888; Tue, 04
 Apr 2023 10:04:50 -0700 (PDT)
MIME-Version: 1.0
References: <20230404123624.360384-1-daniel.vetter@ffwll.ch>
 <CAMuHMdUR=rx2QPvpzsSCwXTSTsPQOudNMzyL3dtZGQdQfrQGDA@mail.gmail.com>
 <ZCwtMJEAJiId/TJe@phenom.ffwll.local> <ZCwx+2hAmyDqOfWu@phenom.ffwll.local>
 <CAMuHMdVt+fsHhk73hPe=bN5e_vTjKEM014Q1AJ9tnankvsXcHg@mail.gmail.com>
 <CAKMK7uFEmt1=4jDi1xDbnTVH6M2iEZSjcY-UN93do0NiH=GogA@mail.gmail.com>
In-Reply-To: <CAKMK7uFEmt1=4jDi1xDbnTVH6M2iEZSjcY-UN93do0NiH=GogA@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 4 Apr 2023 19:04:39 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUpyxuAZVxZmVCzspbzCBPFdnhbrYOJPMjFnqwtwNCAsw@mail.gmail.com>
Message-ID: <CAMuHMdUpyxuAZVxZmVCzspbzCBPFdnhbrYOJPMjFnqwtwNCAsw@mail.gmail.com>
Subject: Re: [PATCH] fbdev: Don't spam dmesg on bad userspace ioctl input
To: Daniel Vetter <daniel@ffwll.ch>
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

Hi Daniel,

On Tue, Apr 4, 2023 at 5:55=E2=80=AFPM Daniel Vetter <daniel@ffwll.ch> wrot=
e:
> On Tue, 4 Apr 2023 at 16:51, Geert Uytterhoeven <geert@linux-m68k.org> wr=
ote:
> > On Tue, Apr 4, 2023 at 4:19=E2=80=AFPM Daniel Vetter <daniel@ffwll.ch> =
wrote:
> > > On Tue, Apr 04, 2023 at 03:59:12PM +0200, Daniel Vetter wrote:
> > > > On Tue, Apr 04, 2023 at 03:53:09PM +0200, Geert Uytterhoeven wrote:
> > > > > On Tue, Apr 4, 2023 at 2:36=E2=80=AFPM Daniel Vetter <daniel.vett=
er@ffwll.ch> wrote:
> > > > > > There's a few reasons the kernel should not spam dmesg on bad
> > > > > > userspace ioctl input:
> > > > > > - at warning level it results in CI false positives
> > > > > > - it allows userspace to drown dmesg output, potentially hiding=
 real
> > > > > >   issues.
> > > > > >
> > > > > > None of the other generic EINVAL checks report in the
> > > > > > FBIOPUT_VSCREENINFO ioctl do this, so it's also inconsistent.
> > > > > >
> > > > > > I guess the intent of the patch which introduced this warning w=
as that
> > > > > > the drivers ->fb_check_var routine should fail in that case. Re=
ality
> > > > > > is that there's too many fbdev drivers and not enough people
> > > > > > maintaining them by far, and so over the past few years we've s=
imply
> > > > > > handled all these validation gaps by tighning the checks in the=
 core,
> > > > > > because that's realistically really all that will ever happen.
> > > > > >
> > > > > > Reported-by: syzbot+20dcf81733d43ddff661@syzkaller.appspotmail.=
com
> > > > > > Link: https://syzkaller.appspot.com/bug?id=3Dc5faf983bfa4a607de=
530cd3bb008888bf06cefc
> > > > >
> > > > >     WARNING: fbcon: Driver 'vkmsdrmfb' missed to adjust virtual s=
creen
> > > > > size (0x0 vs. 64x768)
> > > > >
> > > > > This is a bug in the vkmsdrmfb driver and/or DRM helpers.
> > > > >
> > > > > The message was added to make sure the individual drivers are fix=
ed.
> > > > > Perhaps it should be changed to BUG() instead, so dmesg output
> > > > > cannot be drown?
> > > >
> > > > So you're solution is to essentially force us to replicate this che=
ck over
> > > > all the drivers which cannot change the virtual size?
> > > >
> > > > Are you volunteering to field that audit and type all the patches?
> > >
> > > Note that at least efifb, vesafb and offb seem to get this wrong. I d=
idn't
> > > bother checking any of the non-fw drivers. Iow there is a _lot_ of wo=
rk in
> > > your nack.
> >
> > Please don't spread FUD: efifb, vesafb and offb do not implement
> > fb_ops.fb_check_var(), so they are not affected.
>
> Hm I missed that early out. I'll do a patch to fix the drm fb helpers,
> as mentioned in the other thread I don't think we can actually just
> delete that because it would short-circuit out the fb_set_par call
> too.

As I said to the other thread earlier today[1], I think we can keep
the .fb_set_par() implementation.
There's just no point in providing a .fb_check_var() callback if
you don't support changing the video mode.

[1] https://lore.kernel.org/all/CAMuHMdUaHd1jgrsCSxCqF-HP2rAo2ODM_ZOjhk7Q4v=
juqvt36w@mail.gmail.com
Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
