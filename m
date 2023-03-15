Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B03296BB18A
	for <lists+dri-devel@lfdr.de>; Wed, 15 Mar 2023 13:28:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8A5410E9BF;
	Wed, 15 Mar 2023 12:28:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe2f.google.com (mail-vs1-xe2f.google.com
 [IPv6:2607:f8b0:4864:20::e2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D74B10E9C1
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Mar 2023 12:28:24 +0000 (UTC)
Received: by mail-vs1-xe2f.google.com with SMTP id y3so6839173vsl.11
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Mar 2023 05:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678883303;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KNVHjgACw5m4etYQygiQVMUCwIq83fKlHnf6HwLgnPY=;
 b=ad+ZD6vU572cmzFO31pw7Da/rJHjF2M6YDbB43dD6IKR0DLEwLhhsaL9uRhQUhEdla
 BSNhbkmUJeuz4Ehw4O8A6RSjkdzO4zZLbgxUyr1kF/v2xiKIw7ylA10xKBDHG8voFloC
 gxwIQMCrYQ19lRMAxji4Jf1Msxj92IQYWN2DFJH+niMUknehluMj0kYRDBBjmVgeHB8M
 B6vIOlw2HABR4gbYKqFoa0XffhHvpVI+LA1qd1MAasCDQVEiViF33Gd2NgL6bxMzNu1H
 X/i6jsUcm3Iz9OYEwq1zPnrgaL6PqPHTwoVZaX6+BRQMyJwFrJPpPelOir99vnzrYlFQ
 9+Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678883303;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KNVHjgACw5m4etYQygiQVMUCwIq83fKlHnf6HwLgnPY=;
 b=OUZedBS7BsGpB9UVwcVMD1DLY1ODLQ9KBij8SHJOq9JjG+IfTiV0wqFKpH//9GjfP1
 DcBc15Zbbh7BqEJCyunAMy8mj1DsxKYjOD16jcQqE9MuPDLvFOsXmrkkBkEKtlNhjOcP
 up6Deu1rY9zS8+WSapo68rFuNDfC4qIW6cKvz7MtqK1SNpsMN4WH793D9X08Codi9rOV
 1ozCcccIuJDPhiIeH7isTQ+dp6Ni9RGOmotSMzoFyVOw4+ug1ctlK8VFUoUOEuDNp/xa
 gtw+H3WlOqqQpf18dsLriF/P9XZpQRqUFyjsBVEi54Uw38cFyVVeH9iqeS+06HDnzxTu
 fShw==
X-Gm-Message-State: AO0yUKXVNXT/sSfnEu8NygB3XndsO3+J3wwQGfvB55HUCTTaQ31T4lYM
 R2w9ptOaZ8ckI9hzcppvM7fiUfEIO06cfgOcbvQ=
X-Google-Smtp-Source: AK7set8+bi06WRs0QVtLJ5jyk5rHeeEH3WrPrItgBraivb0Ap0YZTz3fIoZ3F94Lfx9Pie8xlJLbewg5Dto+lIfK40w=
X-Received: by 2002:a67:c990:0:b0:414:4ef3:839 with SMTP id
 y16-20020a67c990000000b004144ef30839mr26101454vsk.7.1678883303182; Wed, 15
 Mar 2023 05:28:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230315092254.1042615-1-harperchen1110@gmail.com>
 <360b814b-40e0-5444-8d6b-1e29719e4414@suse.de>
In-Reply-To: <360b814b-40e0-5444-8d6b-1e29719e4414@suse.de>
From: Wei Chen <harperchen1110@gmail.com>
Date: Wed, 15 Mar 2023 20:27:47 +0800
Message-ID: <CAO4mrfeGWBic546QyDG=CwDuZ-ouCc8UUV_aH7syqO+WhbDBBw@mail.gmail.com>
Subject: Re: [PATCH] fbdev: au1200fb: Fix potential divide by zero
To: Thomas Zimmermann <tzimmermann@suse.de>, deller@gmx.de
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
Cc: linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Dear Thomas,

Thank you for the kind advice.

In fact, I notice there was a discussion regarding whether to put the
check in each individual driver or solve this problem as a whole as
you suggested. The conclusion is that it is better to keep the check per
driver rather than in the caller.

Related discussions are here:
https://lore.kernel.org/all/YXclZQGFTr1NFjbc@ravnborg.org/
https://lore.kernel.org/all/YPgbHMtLQqb1kP0l@ravnborg.org/
https://lore.kernel.org/all/20220404084723.79089-1-zheyuma97@gmail.com/

Thanks,
Wei

------ Original Message ------
From "Thomas Zimmermann" <tzimmermann@suse.de>
To "Wei Chen" <harperchen1110@gmail.com>; deller@gmx.de
Cc linux-fbdev@vger.kernel.org; linux-kernel@vger.kernel.org;
dri-devel@lists.freedesktop.org
Date 2023/3/15 18:25:52
Subject Re: [PATCH] fbdev: au1200fb: Fix potential divide by zero


On Wed, 15 Mar 2023 at 18:25, Thomas Zimmermann <tzimmermann@suse.de> wrote=
:
>
> Hi,
>
> thanks for looking through these drivers.
>
> Am 15.03.23 um 10:22 schrieb Wei Chen:
> > var->pixclock can be assigned to zero by user. Without
> > proper check, divide by zero would occur when invoking
> > macro PICOS2KHZ in au1200fb_fb_check_var.
> >
> > Error out if var->pixclock is zero.
> >
> > Signed-off-by: Wei Chen <harperchen1110@gmail.com>
> > ---
> >   drivers/video/fbdev/au1200fb.c | 3 +++
> >   1 file changed, 3 insertions(+)
> >
> > diff --git a/drivers/video/fbdev/au1200fb.c b/drivers/video/fbdev/au120=
0fb.c
> > index 81c315454428..b6b22fa4a8a0 100644
> > --- a/drivers/video/fbdev/au1200fb.c
> > +++ b/drivers/video/fbdev/au1200fb.c
> > @@ -1040,6 +1040,9 @@ static int au1200fb_fb_check_var(struct fb_var_sc=
reeninfo *var,
> >       u32 pixclock;
> >       int screen_size, plane;
> >
> > +     if (!var->pixclock)
> > +             return -EINVAL;
> > +
>
> Instead of the whale-a-mole approach of fixing individual drivers, could
> this be solved by testing in fb_set_var [1] and fb_try_mode.? [2]
>
> Best regards
> Thomas
>
> [1]
> https://elixir.bootlin.com/linux/latest/source/drivers/video/fbdev/core/f=
bmem.c#L958
> [2]
> https://elixir.bootlin.com/linux/latest/source/drivers/video/fbdev/core/m=
odedb.c#L567
>
> >       plane =3D fbdev->plane;
> >
> >       /* Make sure that the mode respect all LCD controller and
>
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
> (HRB 36809, AG N=C3=BCrnberg)
> Gesch=C3=A4ftsf=C3=BChrer: Ivo Totev
