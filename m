Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 436CA43AB8E
	for <lists+dri-devel@lfdr.de>; Tue, 26 Oct 2021 07:11:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 801DD6E23F;
	Tue, 26 Oct 2021 05:11:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2c.google.com (mail-oo1-xc2c.google.com
 [IPv6:2607:f8b0:4864:20::c2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A3776E23F
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Oct 2021 05:11:24 +0000 (UTC)
Received: by mail-oo1-xc2c.google.com with SMTP id
 s80-20020a4a3b53000000b002b7ad17e169so4441128oos.8
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Oct 2021 22:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ptxG7Ts2equcctA0Gu07FBp2rMcZn1E07pSXmECm+fI=;
 b=MwmFAD33KTivw0LAXtIQmKMyONYI45+d4xvwJ0jE5y0Pk0RidqBsYB5wt4os8qFgSV
 n+hCTVrBg9UNHdPMCyk0Ly4i5lieNekxdQT913zt3CgYNPCsJu47xO56rYDqa6w+Y1Gy
 GFYrYpYAHdLrWhdj/bt13bpdBsp/pZUYsO/8FCC/cWITIQlzKHxuLYizLMcztekGKjBl
 PG/KARjbf8KamdG+CkPTkDFlAb6/8JYSmQlsuPEkpl1iSkJQd9kBA0UluF132IPwn3nq
 +HOV9ZW4WW6xC2SLwswrlNAzFSgSje/ZW/h1HG38zVglG3F+bK8tnYxEJ3WpDQi+mekx
 qL1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ptxG7Ts2equcctA0Gu07FBp2rMcZn1E07pSXmECm+fI=;
 b=Qk+1FzBE+7YAhVuBX8ivXYTTGBbqh+/vvOYRDjg4iF2g/FtbYgmSpl56ZNJMz7EJD4
 mIyHhFj38dvN8JOKejznbLn6zvXKZ8/2dKFdusvjvqAC710dU/dQIWPzJBWdq0VkallF
 PghIZZKjRbdI8teBR5fzRyfwAOyajnXdhzpnsL4LhbgoCEAsjboMXGTa2NpwEFLFNdyL
 6B+lzdwn8zD8fAoNHIkBDy42wO6evyeHv1XeWVv7PSuoMEsJ/19uaVekqyPxXXtbl/lS
 1LEIMdWt1G0geHloXO40trn+kdthyo8etnOHcuVzaUvhjax1huQc0dJNAniUlFQk3qtV
 FujQ==
X-Gm-Message-State: AOAM5314wouAeeBVGFurJA0wn+eurcgi/UsTpD/Nj8cGQlKiKiuavbwN
 BmuxYumm83/E700g0UUJBzbwMyIoLIbdqkC78g==
X-Google-Smtp-Source: ABdhPJxXJcroNv+L97rGjvhkCQV/2igOuhG0ywUAoFK7b8t94RjFoL9eVqZKAHVTMjwSVhG0gL92u8v+zODnSqXfyrk=
X-Received: by 2002:a4a:c015:: with SMTP id v21mr15551980oop.17.1635225083437; 
 Mon, 25 Oct 2021 22:11:23 -0700 (PDT)
MIME-Version: 1.0
References: <1635188490-15082-1-git-send-email-george.kennedy@oracle.com>
 <YXcAbXJfg/jKCo5h@kroah.com> <0ddb1c19-64b0-4117-7a92-c3d2fcddfdcf@oracle.com>
 <YXclZQGFTr1NFjbc@ravnborg.org>
In-Reply-To: <YXclZQGFTr1NFjbc@ravnborg.org>
From: Zheyu Ma <zheyuma97@gmail.com>
Date: Tue, 26 Oct 2021 13:11:12 +0800
Message-ID: <CAMhUBjkcb5VMPuJkonVaxeZ6CaW48fcYmdPDz2L9a4Mg1vWqOw@mail.gmail.com>
Subject: Re: [PATCH] video: fbdev: cirrusfb: check pixclock to avoid divide by
 zero
To: Sam Ravnborg <sam@ravnborg.org>
Cc: George Kennedy <george.kennedy@oracle.com>,
 Greg KH <gregkh@linuxfoundation.org>, 
 tzimmermann@suse.de, dri-devel@lists.freedesktop.org, 
 linux-fbdev@vger.kernel.org, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: multipart/alternative; boundary="00000000000039e5b805cf3a8204"
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

--00000000000039e5b805cf3a8204
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 26, 2021 at 5:45 AM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Hi George,
>
> On Mon, Oct 25, 2021 at 03:33:43PM -0400, George Kennedy wrote:
> >
> >
> > On 10/25/2021 3:07 PM, Greg KH wrote:
> > > On Mon, Oct 25, 2021 at 02:01:30PM -0500, George Kennedy wrote:
> > > > Do a sanity check on pixclock value before using it as a divisor.
> > > >
> > > > Syzkaller reported a divide error in cirrusfb_check_pixclock.
> > > >
> > > > divide error: 0000 [#1] SMP KASAN PTI
> > > > CPU: 0 PID: 14938 Comm: cirrusfb_test Not tainted 5.15.0-rc6 #1
> > > > Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.11.0-2
> > > > RIP: 0010:cirrusfb_check_var+0x6f1/0x1260
> > > >
> > > > Call Trace:
> > > >   fb_set_var+0x398/0xf90
> > > >   do_fb_ioctl+0x4b8/0x6f0
> > > >   fb_ioctl+0xeb/0x130
> > > >   __x64_sys_ioctl+0x19d/0x220
> > > >   do_syscall_64+0x3a/0x80
> > > >   entry_SYSCALL_64_after_hwframe+0x44/0xae
> > > >
> > > > Signed-off-by: George Kennedy <george.kennedy@oracle.com>
> > > > ---
> > > >   drivers/video/fbdev/cirrusfb.c | 3 +++
> > > >   1 file changed, 3 insertions(+)
> > > >
> > > > diff --git a/drivers/video/fbdev/cirrusfb.c
b/drivers/video/fbdev/cirrusfb.c
> > > > index 93802ab..099ddcb 100644
> > > > --- a/drivers/video/fbdev/cirrusfb.c
> > > > +++ b/drivers/video/fbdev/cirrusfb.c
> > > > @@ -477,6 +477,9 @@ static int cirrusfb_check_pixclock(const struct
fb_var_screeninfo *var,
> > > >           struct cirrusfb_info *cinfo = info->par;
> > > >           unsigned maxclockidx = var->bits_per_pixel >> 3;
> > > > + if (!var->pixclock)
> > > > +         return -EINVAL;
> > > Shouldn't you be checking further up the call chain where this got set
> > > to 0?
> >
> I recall we had a similar discussion when Zheyu Ma <zheyuma97@gmail.com>
> added the same checks to at least 3 fbdev drivers.
> The conclusion was that the check belongs in the individual check
> functions - IIRC.
>
> Maybe Zheyu or google can help find the original thread.

Related discussions are here:
https://lore.kernel.org/all/1627179054-29903-1-git-send-email-zheyuma97@gmail.com/
<https://lore.kernel.org/all/1627179054-29903-1-git-send-email-zheyuma97@gmail.com/#t>
https://lore.kernel.org/all/1626871424-27708-1-git-send-email-zheyuma97@gmail.com/
https://lore.kernel.org/all/1627293835-17441-1-git-send-email-zheyuma97@gmail.com/

Regards,
Zheyu Ma

--00000000000039e5b805cf3a8204
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On Tue, Oct 26, 2021 at 5:45 AM Sam Ravnborg &lt;<a href=
=3D"mailto:sam@ravnborg.org">sam@ravnborg.org</a>&gt; wrote:<br>&gt;<br>&gt=
; Hi George,<br>&gt;<br>&gt; On Mon, Oct 25, 2021 at 03:33:43PM -0400, Geor=
ge Kennedy wrote:<br>&gt; &gt;<br>&gt; &gt;<br>&gt; &gt; On 10/25/2021 3:07=
 PM, Greg KH wrote:<br>&gt; &gt; &gt; On Mon, Oct 25, 2021 at 02:01:30PM -0=
500, George Kennedy wrote:<br>&gt; &gt; &gt; &gt; Do a sanity check on pixc=
lock value before using it as a divisor.<br>&gt; &gt; &gt; &gt;<br>&gt; &gt=
; &gt; &gt; Syzkaller reported a divide error in cirrusfb_check_pixclock.<b=
r>&gt; &gt; &gt; &gt;<br>&gt; &gt; &gt; &gt; divide error: 0000 [#1] SMP KA=
SAN PTI<br>&gt; &gt; &gt; &gt; CPU: 0 PID: 14938 Comm: cirrusfb_test Not ta=
inted 5.15.0-rc6 #1<br>&gt; &gt; &gt; &gt; Hardware name: QEMU Standard PC =
(i440FX + PIIX, 1996), BIOS 1.11.0-2<br>&gt; &gt; &gt; &gt; RIP: 0010:cirru=
sfb_check_var+0x6f1/0x1260<br>&gt; &gt; &gt; &gt;<br>&gt; &gt; &gt; &gt; Ca=
ll Trace:<br>&gt; &gt; &gt; &gt; =C2=A0 fb_set_var+0x398/0xf90<br>&gt; &gt;=
 &gt; &gt; =C2=A0 do_fb_ioctl+0x4b8/0x6f0<br>&gt; &gt; &gt; &gt; =C2=A0 fb_=
ioctl+0xeb/0x130<br>&gt; &gt; &gt; &gt; =C2=A0 __x64_sys_ioctl+0x19d/0x220<=
br>&gt; &gt; &gt; &gt; =C2=A0 do_syscall_64+0x3a/0x80<br>&gt; &gt; &gt; &gt=
; =C2=A0 entry_SYSCALL_64_after_hwframe+0x44/0xae<br>&gt; &gt; &gt; &gt;<br=
>&gt; &gt; &gt; &gt; Signed-off-by: George Kennedy &lt;<a href=3D"mailto:ge=
orge.kennedy@oracle.com">george.kennedy@oracle.com</a>&gt;<br>&gt; &gt; &gt=
; &gt; ---<br>&gt; &gt; &gt; &gt; =C2=A0 drivers/video/fbdev/cirrusfb.c | 3=
 +++<br>&gt; &gt; &gt; &gt; =C2=A0 1 file changed, 3 insertions(+)<br>&gt; =
&gt; &gt; &gt;<br>&gt; &gt; &gt; &gt; diff --git a/drivers/video/fbdev/cirr=
usfb.c b/drivers/video/fbdev/cirrusfb.c<br>&gt; &gt; &gt; &gt; index 93802a=
b..099ddcb 100644<br>&gt; &gt; &gt; &gt; --- a/drivers/video/fbdev/cirrusfb=
.c<br>&gt; &gt; &gt; &gt; +++ b/drivers/video/fbdev/cirrusfb.c<br>&gt; &gt;=
 &gt; &gt; @@ -477,6 +477,9 @@ static int cirrusfb_check_pixclock(const str=
uct fb_var_screeninfo *var,<br>&gt; &gt; &gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 struct cirrusfb_info *cinfo =3D info-&gt;par;<br>&gt; &gt; &gt; =
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned maxclockidx =3D var-&gt;bi=
ts_per_pixel &gt;&gt; 3;<br>&gt; &gt; &gt; &gt; + if (!var-&gt;pixclock)<br=
>&gt; &gt; &gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EINVAL;<br>&gt; =
&gt; &gt; Shouldn&#39;t you be checking further up the call chain where thi=
s got set<br>&gt; &gt; &gt; to 0?<br>&gt; &gt;<br>&gt; I recall we had a si=
milar discussion when Zheyu Ma &lt;<a href=3D"mailto:zheyuma97@gmail.com">z=
heyuma97@gmail.com</a>&gt;<br>&gt; added the same checks to at least 3 fbde=
v drivers.<br>&gt; The conclusion was that the check belongs in the individ=
ual check<br>&gt; functions - IIRC.<br>&gt;<br>&gt; Maybe Zheyu or google c=
an help find the original thread.<br><br>Related discussions are here:<br><=
a href=3D"https://lore.kernel.org/all/1627179054-29903-1-git-send-email-zhe=
yuma97@gmail.com/#t">https://lore.kernel.org/all/1627179054-29903-1-git-sen=
d-email-zheyuma97@gmail.com/</a><div><a href=3D"https://lore.kernel.org/all=
/1626871424-27708-1-git-send-email-zheyuma97@gmail.com/">https://lore.kerne=
l.org/all/1626871424-27708-1-git-send-email-zheyuma97@gmail.com/</a><br></d=
iv><div><a href=3D"https://lore.kernel.org/all/1627293835-17441-1-git-send-=
email-zheyuma97@gmail.com/">https://lore.kernel.org/all/1627293835-17441-1-=
git-send-email-zheyuma97@gmail.com/</a><br></div><div><br></div><div>Regard=
s,</div><div>Zheyu Ma</div><div><br></div></div>

--00000000000039e5b805cf3a8204--
