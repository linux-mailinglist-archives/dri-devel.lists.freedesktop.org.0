Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38C6393157E
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jul 2024 15:15:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA36810E3B4;
	Mon, 15 Jul 2024 13:15:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com
 [209.85.210.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C86989DC0;
 Mon, 15 Jul 2024 13:15:22 +0000 (UTC)
Received: by mail-ot1-f43.google.com with SMTP id
 46e09a7af769-7035c367c4cso2601604a34.2; 
 Mon, 15 Jul 2024 06:15:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721049322; x=1721654122;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tNR0w8f7DgNm43Yovgh09Jc86fgc4MgJXWKIFtreEko=;
 b=SiPAyj4IczXvbj3Qxg2yf/8RyBcZMZKHMrcZg7JhumtHDHLJi64zpfheatBaLr/1Rx
 BJ1WEsy/g2tw+GPUn1p4NUHJ6CSm5oLzUnXMrNovJS0pYvd/GvpVW/qeztDQKMUHbcN4
 /KKuIj128zPm87QswAnw05WUbKSKt4Z/sHMpbbwZ/Y7swqgJQZanu9AGMH9MY6722mO3
 4iBLksjpsEu8GTJ/ttJjgNDmBi+BleHXO/YDOj+C+2YkUYIM1A+wU2fDOFKvsp7sbVDM
 qU3Aq2Fyf5yG6W1V6hHqMbpOvmye694xbWdcPQYVaB2gcngQHhBGO5GsrhtY2iG/HrcV
 s/Rw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUu2zTzyh3tpMZMvlZ7oSljbHFZHxbVfsYHx2gfwZaXSx+/s7M3hy2ddhP/u/+aFbdv8v/RwFx4NoNeLhLZDQVbyiZ2BcOHv4Y+XzC7HZRo
X-Gm-Message-State: AOJu0Yz7nLtLxOHgGon1W1b9dwz/WKq87aKArgtsdZSYDfRumzTPCVu5
 vRUjgOYznHKgzjHgJnrX2bD/Pb94KZdYa5oE8o+XTpgFdlIyjfNbjdmRa3aDqeJ8wsG4HY3+SFN
 60nqBA18gJKM9GMhzMeu01Dz/O5E=
X-Google-Smtp-Source: AGHT+IHaZDYvxo07Vr9ALMufUbtJ9JDhOtTtJyaDYEF5Vq40o/q+4REDZmuFRwQEdwuzWOGgEhtlipHg6B79axpNsBo=
X-Received: by 2002:a05:6830:4117:b0:703:6e87:a7d4 with SMTP id
 46e09a7af769-70375a1f418mr26514909a34.19.1721049321887; Mon, 15 Jul 2024
 06:15:21 -0700 (PDT)
MIME-Version: 1.0
References: <cb21950b-286b-4630-9052-cff9e7e56337@web.de>
In-Reply-To: <cb21950b-286b-4630-9052-cff9e7e56337@web.de>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Mon, 15 Jul 2024 09:15:10 -0400
Message-ID: <CAKb7Uvj513trzg9bVGrjcQ8CfO4anCq7e9mgbD0eZKh=zNLy=Q@mail.gmail.com>
Subject: Re: [PATCH] drm/nouveau/debugfs: Simplify character output in
 nouveau_debugfs_vbios_image()
To: Markus Elfring <Markus.Elfring@web.de>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 kernel-janitors@vger.kernel.org, 
 Christophe Jaillet <christophe.jaillet@wanadoo.fr>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Danilo Krummrich <dakr@redhat.com>, David Airlie <airlied@gmail.com>,
 Karol Herbst <kherbst@redhat.com>, 
 Lyude Paul <lyude@redhat.com>, LKML <linux-kernel@vger.kernel.org>
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

On Mon, Jul 15, 2024 at 7:49=E2=80=AFAM Markus Elfring <Markus.Elfring@web.=
de> wrote:
>
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Mon, 15 Jul 2024 13:36:54 +0200
>
> Single characters should be put into a sequence.
> Thus use the corresponding function =E2=80=9Cseq_putc=E2=80=9D for one se=
lected call.
>
> This issue was transformed by using the Coccinelle software.
>
> Suggested-by: Christophe Jaillet <christophe.jaillet@wanadoo.fr>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  drivers/gpu/drm/nouveau/nouveau_debugfs.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_debugfs.c b/drivers/gpu/drm/=
nouveau/nouveau_debugfs.c
> index e83db051e851..931b62097366 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_debugfs.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_debugfs.c
> @@ -42,7 +42,7 @@ nouveau_debugfs_vbios_image(struct seq_file *m, void *d=
ata)
>         int i;
>
>         for (i =3D 0; i < drm->vbios.length; i++)
> -               seq_printf(m, "%c", drm->vbios.data[i]);
> +               seq_putc(m, drm->vbios.data[i]);

Is there some reason this whole thing isn't just

seq_write(m, drm->vbios.data, drm->vbios.length)

>         return 0;
>  }
>
> --
> 2.45.2
>
