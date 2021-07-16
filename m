Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFD8A3CC235
	for <lists+dri-devel@lfdr.de>; Sat, 17 Jul 2021 11:35:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8347D6EA47;
	Sat, 17 Jul 2021 09:35:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 026A86E959
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jul 2021 09:46:23 +0000 (UTC)
Received: by mail-io1-xd33.google.com with SMTP id d9so9875694ioo.2
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jul 2021 02:46:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ILkyD5Kz4eqPzBnsFVUXttHmKX0PHXK5ugnQ4RbD87Y=;
 b=cIjFpGh6IilJElcQ/Z37WfmBtAkxeTi3kHw6q8cvnm7qjQwWuZPXRr+Fxr6vcxG/4l
 SNZrUQfUxFUNbUaAPKDcYjOIcU/WeRSeUWL3k7DGpSZ6O1Kyf0k1dmsZg0K8gEDnLHHT
 NUG19CTWVWoCm60Ff2l5oeEY73hGBZTnAUckdx7x427r+OqVNLlMulwKxDtdGMXnj2cG
 82kYH1PA8uFsiIgmrjPncfJhMF8lOk4icsERLV0DRX8QIhIXQ/shiWP5Z5GJ3rZbJ+Hx
 /CKrTVOSxF3SLqGN3uLqQNa8ggO7hhINZUp9LLGU7lYSGH3Aoe81svipxShZ32pWJJxh
 flLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ILkyD5Kz4eqPzBnsFVUXttHmKX0PHXK5ugnQ4RbD87Y=;
 b=E/Qpp3+ODzpr+j+YZvNaZRfuj9ALbXpQJhK368+klanbr70vUeJ4f0mmZdbPEtiuzT
 GFt47HsXDUw+9UvECH3ydoFGKhj2X8xxh4h+umChPkziD6GpdhV6yNveWp6XO96EgUbP
 bqjp9HvZfIgSy5NrG/L8Qy/c2Hr58LJLmPNoQQnRkH/Ga7DBQ5he1Bnz1j6zwjunVDke
 CbAga9DcifMREDraccK6kU7zAj+5nOO3GQX6iMjOZNo2xNcFcIF7XTJF8Iv32Ji6HH6a
 Gx9sjhR48uDkKAJUPVTREO/ZgMBd+c5DbTsHwXJyopvOv250i994yBcPvIh2dKs83ncD
 ijiw==
X-Gm-Message-State: AOAM531XCj17bLcnOsLGmsPflj+55wpBzXgwx650aujiIp4GcNUjkk8r
 8X9/lATpOfNrT/Trzf5iHTRrmeZYlr9Tp67uyF4=
X-Google-Smtp-Source: ABdhPJznGCQXl89iQZDu1p5fWqrZdgUTOr2A7mUDxvzYMgYYfvNjvRMEi2HA9KI4ydsyXzeGw5Pft9i33wFLtEbNI4k=
X-Received: by 2002:a6b:6217:: with SMTP id f23mr6979858iog.173.1626428783251; 
 Fri, 16 Jul 2021 02:46:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210716015615.9150-1-ainux.wang@gmail.com>
 <aefcd1a7-fa2b-5342-58c0-314876c9bc32@suse.de>
In-Reply-To: <aefcd1a7-fa2b-5342-58c0-314876c9bc32@suse.de>
From: Ainux Wang <ainux.wang@gmail.com>
Date: Fri, 16 Jul 2021 17:45:46 +0800
Message-ID: <CAPWE4_x0r87Or4M+sE9HbFwvUGe=-HwLx05WoqCMVXt-jwn7UQ@mail.gmail.com>
Subject: Re: [PATCH] drm/ast: Zero is missing in detect function
To: Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Sat, 17 Jul 2021 09:35:00 +0000
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
Cc: airlied@linux.ie, teng sterling <sterlingteng@gmail.com>,
 Huacai Chen <chenhuacai@kernel.org>, dri-devel@lists.freedesktop.org,
 airlied@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> =E4=BA=8E2021=E5=B9=B47=E6=9C=8816=
=E6=97=A5=E5=91=A8=E4=BA=94 =E4=B8=8B=E5=8D=882:29=E5=86=99=E9=81=93=EF=BC=
=9A
>
> Hi
>
> Am 16.07.21 um 03:56 schrieb ainux.wang@gmail.com:
> > From: "Ainux.Wang" <ainux.wang@gmail.com>
> >
> > The function ast_get_modes() will also return 0, when it try to get the
> > edid, but it also do not get the edid.
> >
> > Signed-off-by: Ainux.Wang <ainux.wang@gmail.com>
> > ---
> >   drivers/gpu/drm/ast/ast_mode.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_m=
ode.c
> > index e5996ae03c49..b7dcf7821ec6 100644
> > --- a/drivers/gpu/drm/ast/ast_mode.c
> > +++ b/drivers/gpu/drm/ast/ast_mode.c
> > @@ -1299,7 +1299,7 @@ static enum drm_connector_status ast_connector_de=
tect(struct drm_connector
> >       int r;
> >
> >       r =3D ast_get_modes(connector);
> > -     if (r < 0)
> > +     if (r <=3D 0)
> >               return connector_status_disconnected;
>
> Thanks for caring.
>
> I thought about the case of (r =3D=3D 0) when reviewing the patch that ad=
ded
> it, but found it to be correct. If (r < 0) it's clearly an error and we
> should return 'disconnected'. If (r =3D=3D 0), we were able to retrieve t=
he
> EDID, but could not find any meaningful modes. Still, it's 'connected'.
>
Hi=EF=BC=8CThomas
Thanks review.
I see, the drm_add_edid_modes() will retrun0 in ast_get_modes().
Best regards,
Ainux Wang.
> Unless there is a concrete bug where the status is mis-detected, I think
> that the current code is correct.
>
> Best regards
> Thomas
>
> >
> >       return connector_status_connected;
> >
>
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
> (HRB 36809, AG N=C3=BCrnberg)
> Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer
>
