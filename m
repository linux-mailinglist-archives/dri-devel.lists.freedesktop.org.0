Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E98D93A4A5
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2024 19:04:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AFD610E60F;
	Tue, 23 Jul 2024 17:04:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com
 [209.85.210.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9B5E10E60F;
 Tue, 23 Jul 2024 17:04:06 +0000 (UTC)
Received: by mail-ot1-f48.google.com with SMTP id
 46e09a7af769-703775e4d5dso2748066a34.0; 
 Tue, 23 Jul 2024 10:04:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721754246; x=1722359046;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=02xnxBX9SHHmM6dl/yiHqxrkZEzkCA7F2H6qwPrp+Fw=;
 b=WOPiKbOzd84hw+5s36x6tOTjOxq2Gn/UefM5Qvqjxtdmhx7wihJCmJpBdM6aW49hZ+
 dTHkQ2sOrYWa/qLqCkWHgZxEasfm8ImDMWbCfQSZQN+62rW8RUkVjtDwZQmTa/xBY7Dz
 uY/CTstZVMyvkiJsQyhXXVeDmz+iPOMD5b3LaHXlK9w33XM6Kfs6x9elg56DlfzuH1Q1
 sPrrANEslO52yuZ4DoFToWm9mhuZ/VDirIn107VI2Nb9RUKfoFSYx0dKILu5JAqxPCzr
 1SxhFW3Dv2xvuGkbMT6yaIbzbFV0/POf9DkURVJ28fR53j0aSdT2bkvM2gX+1074LDKj
 UAWw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXa3L8Sniq0sueMZHM6dJNqVXthXhIdQnWYXKJ4cLwdcKRPeljgskid0wylZSxm7BKzFgWMBpfRv9Ul/Ci5+N/2vWkaYWT+sJO3zSEjA9iJ
X-Gm-Message-State: AOJu0YxVFDAJXdKlf8wAOweL2i+Q0Xme3hKW1kX7PftRew3tvT8CNJAn
 a91PvjQSjAPGakomnfqQYGDywiwMDeGmCc+Gn4BsMaF9TruUypwR4KUQwQFWX0xBzpRPhshkU0S
 WTgy05ACiqaeQd1O8iYSYCcblmZE=
X-Google-Smtp-Source: AGHT+IHEX97DGXPMq/CzCwVHEuhMRWmstcgLm9QWYKkHmuYX3IYZck/qXxuiBB5Ck1P7O8YAFNAoIm3C8bt8PAfyiV0=
X-Received: by 2002:a05:6830:498d:b0:708:f88a:e3e7 with SMTP id
 46e09a7af769-709009f09f2mr14914971a34.34.1721754245650; Tue, 23 Jul 2024
 10:04:05 -0700 (PDT)
MIME-Version: 1.0
References: <cb21950b-286b-4630-9052-cff9e7e56337@web.de>
 <CAKb7Uvj513trzg9bVGrjcQ8CfO4anCq7e9mgbD0eZKh=zNLy=Q@mail.gmail.com>
 <147bde68-2b66-4e0c-890d-30571a99eee1@wanadoo.fr>
In-Reply-To: <147bde68-2b66-4e0c-890d-30571a99eee1@wanadoo.fr>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Tue, 23 Jul 2024 13:03:54 -0400
Message-ID: <CAKb7UvjE-xLBpV637qQ8DG7odnoLvaPgBK5QRThiGYZF_tgwFg@mail.gmail.com>
Subject: Re: [PATCH] drm/nouveau/debugfs: Simplify character output in
 nouveau_debugfs_vbios_image()
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 kernel-janitors@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>, 
 Danilo Krummrich <dakr@redhat.com>, David Airlie <airlied@gmail.com>,
 Karol Herbst <kherbst@redhat.com>, 
 Lyude Paul <lyude@redhat.com>, LKML <linux-kernel@vger.kernel.org>, 
 Markus Elfring <Markus.Elfring@web.de>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 23, 2024 at 12:58=E2=80=AFPM Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:
>
> Le 15/07/2024 =C3=A0 15:15, Ilia Mirkin a =C3=A9crit :
> > On Mon, Jul 15, 2024 at 7:49=E2=80=AFAM Markus Elfring <Markus.Elfring@=
web.de> wrote:
> >>
> >> From: Markus Elfring <elfring@users.sourceforge.net>
> >> Date: Mon, 15 Jul 2024 13:36:54 +0200
> >>
> >> Single characters should be put into a sequence.
> >> Thus use the corresponding function =E2=80=9Cseq_putc=E2=80=9D for one=
 selected call.
> >>
> >> This issue was transformed by using the Coccinelle software.
> >>
> >> Suggested-by: Christophe Jaillet <christophe.jaillet@wanadoo.fr>
> >> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> >> ---
> >>   drivers/gpu/drm/nouveau/nouveau_debugfs.c | 2 +-
> >>   1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/gpu/drm/nouveau/nouveau_debugfs.c b/drivers/gpu/d=
rm/nouveau/nouveau_debugfs.c
> >> index e83db051e851..931b62097366 100644
> >> --- a/drivers/gpu/drm/nouveau/nouveau_debugfs.c
> >> +++ b/drivers/gpu/drm/nouveau/nouveau_debugfs.c
> >> @@ -42,7 +42,7 @@ nouveau_debugfs_vbios_image(struct seq_file *m, void=
 *data)
> >>          int i;
> >>
> >>          for (i =3D 0; i < drm->vbios.length; i++)
> >> -               seq_printf(m, "%c", drm->vbios.data[i]);
> >> +               seq_putc(m, drm->vbios.data[i]);
> >
> > Is there some reason this whole thing isn't just
> >
> > seq_write(m, drm->vbios.data, drm->vbios.length)
>
> Hi,
>
> I don't know if my answer is relevant or not here but:
>         for () seq_putc();      =3D=3D> will fill 'm' with everything tha=
t fits in
> and
>         seq_write()             =3D=3D> is all or nothing. So if 'm' is t=
oo small, then
> nothing will be appended.
>
> I've not looked at the calling tree, but I would expect 'm' to be able
> to have PAGE_SIZE chars, so most probably 4096.
>
> And having gpu + "vbios.rom", I would expect it to be bigger than 4096.
>
> If I'm correct, then changing for seq_write() would just show... nothing.
>
>
> I don't know if it can happen., but testing should be easy enough to
> figure it out.

The vbios can definitely be much much larger than 4k. But it does
currently work as-is, i.e. you don't just get the first 4k, you get
everything. So I think there's some internal resizing/extension/etc
going on.

But I totally agree -- testing required here. Not sure if the author
has done that.

Cheers,

  -ilia
