Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 042F64615F7
	for <lists+dri-devel@lfdr.de>; Mon, 29 Nov 2021 14:13:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 982546F53A;
	Mon, 29 Nov 2021 13:12:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com
 [IPv6:2607:f8b0:4864:20::b35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 800C06F533
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Nov 2021 13:12:54 +0000 (UTC)
Received: by mail-yb1-xb35.google.com with SMTP id f186so42087050ybg.2
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Nov 2021 05:12:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=kGzjYsHwvkYBRhZGLdyD+bZzZzH8r00UKUI6ADhntRM=;
 b=ASW3Vvl3N3CtNF3PWuf/xWTsKtGVhJ7hcYSjojHej9w4F8j7myTQ4IRNFrNMj8olTC
 wF9etqyXwWNn9M7IHeLQi/qLRVIVWUOMWvSRqjbcZXNwtzK5I9XclssZ0Gd/CSIsgd8U
 OT2df9DrW9Slfzsxpm6tRAR/o+zL6klqXuM3LJNKvu05Ln0XdNSptVqbhh/46Q505REy
 fpkz7/xWh9HvjX5DdnuKf8w6x40eLMg9mwKakCsq2/wiB6qFt/oGjxTrj3DkVQ3uDZbA
 Cw6IGT/3uDH43XQWMtoeEO+kLwAeX3w6bV/ditzTVB501QJYtb1uMvDknsrzkpg5DfAb
 y2Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=kGzjYsHwvkYBRhZGLdyD+bZzZzH8r00UKUI6ADhntRM=;
 b=fQ/31fBl3AyHfm7YGmnFiMiOjxCI0v/vtVUjbnKHR4h9GjB10nF1Rm9unAjM2FaVe+
 vrv9zIw/Lt42twwj8qIqz7A5O3x3UK6K0LBYfh2rcdrDOg2ruXNpQ0xPpo4e0e3luuU0
 H3owXFoT89mm6aNoPQXEANOWm57cDdTsQzIx6h91CL4KwS2Qq/rdKELRWqB/rdidyo4U
 OWRzZjeQFprHuJAagcERYvALVyDghI/qM9AS5zvkkvOEKi/FALT4QPJjZWjHlKoKUbl8
 eqIx67sXaLR3f78yJka0e94ZefMXt5qqKR96MtrBF92IPpZJ0y3ozHx87Av2l6q4tuMO
 IVKg==
X-Gm-Message-State: AOAM530+zt//13Wi8x5yPRt38cG6BqgyypFLghcpEcD3+Ir1WAG07mat
 3UFQphWPqjS2uhN7ySxauD0IrAMGJrh209p2Ozc=
X-Google-Smtp-Source: ABdhPJyBOBN2JDOuL/bcoi3oDbH5oF7E7HGsWwa9ZvZDV3eriHE7FF+wiQaDaZWr+OxBl7LlpcFj6iNQx9hWXejvpZg=
X-Received: by 2002:a25:c552:: with SMTP id v79mr6810141ybe.709.1638191573579; 
 Mon, 29 Nov 2021 05:12:53 -0800 (PST)
MIME-Version: 1.0
References: <20211122194400.30836-1-igormtorrente@gmail.com>
 <20211122194400.30836-2-igormtorrente@gmail.com>
 <20211125043649.io5aavusrfzb2e73@notapiano>
In-Reply-To: <20211125043649.io5aavusrfzb2e73@notapiano>
From: Igor Torrente <igormtorrente@gmail.com>
Date: Mon, 29 Nov 2021 10:12:27 -0300
Message-ID: <CAOA8r4GzsxH2XxfN8+0G7DrctTw28tZmE1Xx7u4JC55Cn_=c2Q@mail.gmail.com>
Subject: Re: [PATCH v3 1/9] drm: vkms: Replace the deprecated
 drm_mode_config_init
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <n@nfraprado.net>
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
Cc: hamohammed.sa@gmail.com, rodrigosiqueiramelo@gmail.com, airlied@linux.ie,
 Leandro Ribeiro <leandro.ribeiro@collabora.com>, melissa.srw@gmail.com,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 ~lkcamp/patches@lists.sr.ht
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi N=C3=ADcolas,

On Thu, Nov 25, 2021 at 1:37 AM N=C3=ADcolas F. R. A. Prado <n@nfraprado.ne=
t> wrote:
>
> Hi Igor,
>
> just some nits on the commit message.
>
> On Mon, Nov 22, 2021 at 04:43:52PM -0300, Igor Torrente wrote:
> > The `drm_mode_config_init` was deprecated since c3b790e commit, and it'=
s
>
> When referring to other commits, it's best to write it as 'commit <12-dig=
it-SHA>
> ("description")' [1]. Also, imperative mood works best, so my suggestion =
would
> be:
>
> `drm_mode_config_init` is deprecated since commit c3b790ea07a1 ("drm: Man=
age
> drm_mode_config_init with drmm_") in favor of `drmm_mode_config_init`. Up=
date
> the former to the latter.

Looks better indeed. I will change it to V4. Thanks!


>
> Thanks,
> N=C3=ADcolas
>
> [1] https://www.kernel.org/doc/html/latest/process/submitting-patches.htm=
l#describe-your-changes
>
> > being replaced by the `drmm_mode_config_init`.
> >
> > Signed-off-by: Igor Torrente <igormtorrente@gmail.com>
> > ---
> > V2: Change the code style(Thomas Zimmermann).
> > ---
> >  drivers/gpu/drm/vkms/vkms_drv.c | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkm=
s_drv.c
> > index 0ffe5f0e33f7..ee4d96dabe19 100644
> > --- a/drivers/gpu/drm/vkms/vkms_drv.c
> > +++ b/drivers/gpu/drm/vkms/vkms_drv.c
> > @@ -140,8 +140,12 @@ static const struct drm_mode_config_helper_funcs v=
kms_mode_config_helpers =3D {
> >  static int vkms_modeset_init(struct vkms_device *vkmsdev)
> >  {
> >       struct drm_device *dev =3D &vkmsdev->drm;
> > +     int ret;
> > +
> > +     ret =3D drmm_mode_config_init(dev);
> > +     if (ret < 0)
> > +             return ret;
> >
> > -     drm_mode_config_init(dev);
> >       dev->mode_config.funcs =3D &vkms_mode_funcs;
> >       dev->mode_config.min_width =3D XRES_MIN;
> >       dev->mode_config.min_height =3D YRES_MIN;
> > --
> > 2.30.2
> >
