Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D06B04C50B2
	for <lists+dri-devel@lfdr.de>; Fri, 25 Feb 2022 22:24:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71E8E10E9DE;
	Fri, 25 Feb 2022 21:24:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C595610E9CF;
 Fri, 25 Feb 2022 21:24:51 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id d28so6307628wra.4;
 Fri, 25 Feb 2022 13:24:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=9VVf1+C+ic0+UHKTIlPAU7kab9O4mDJTEXrG1CAIyA0=;
 b=Q7rUxqz/UgVude0iW3thhOW3RovvXofgrYhvLEAuApKO362jsR9iSOM+0gSLUxpagb
 vbOJOqqV0AgmO6twpSGsLhSjfG0uP25I041TafaBudI0rEjZfjQ5DsCDFwpPQxG3x+8S
 w7FAiX9G8jKynyY2u4wnmYXXe7QTPAY6yw4a0x3rE/V2ZJQ/OEi9b1gRCHL90iH/P6HU
 r7DG2S9+HoKPJX2rqTpJuHJV9tNz33TBOUmc2np/3q3PI6BHy/sXyt4HmuP+YREJMqHF
 fboAGnf7LpATIJcdhwWzD95a0ZSdhTwq4O3R5YOmYbJyOzSD5ZJ/W6i74/W9TSlkRm/b
 QofQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=9VVf1+C+ic0+UHKTIlPAU7kab9O4mDJTEXrG1CAIyA0=;
 b=BU4+aqtZBkQNXBqFjtNhzeG1iEnYmcLEbM75geHinGK/711eVPsxMAeB3Qg0n346vo
 yeIZMbwkVjcp8EJB7FvRLUD4t5m4qC8qBBEP/nnsA6wZL5EFmFNwEVTqvO+jX7njz31q
 /YtRJsQRzmghy9FtWxKW2ztF8OQQbyu+oB/KY5SAP8WyhmWV5f9tvp1RrN8+/nX0Fpns
 Uo8sJCWV6Zrb6C4Iiu3bzCDL76qRsJTpIJ33sjNMBlUCoaYejwnvnVkfdVF0hMlCmjtJ
 AMJYiimGjnq7om5Lye6BVpCmjUHMJl0VyojZ74Wwqdd50MBpWqy2A7dKcthtvdpiRgdg
 sXUA==
X-Gm-Message-State: AOAM531r6pG9n2UZVdYHAKVf4zmtMyihATZYbBDObgKwYvaawF04TYq8
 v5EBoyDRkAxvy830OpPViCsxEPrq3RAeGGcqRmA=
X-Google-Smtp-Source: ABdhPJwVxOz7t8StaeYFX+WO6Gwh388/MH+up7+Bj4Znq3AUAgahurecB1E8GtgKjT4L3zzVjg5hX7Q4tcZENicFIIQ=
X-Received: by 2002:a05:6000:46:b0:1ed:c11e:6add with SMTP id
 k6-20020a056000004600b001edc11e6addmr7541874wrx.328.1645824290162; Fri, 25
 Feb 2022 13:24:50 -0800 (PST)
MIME-Version: 1.0
References: <20220225202614.225197-1-robdclark@gmail.com>
 <Yhk92RwhBqAAHcuT@intel.com>
In-Reply-To: <Yhk92RwhBqAAHcuT@intel.com>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 25 Feb 2022 13:24:37 -0800
Message-ID: <CAF6AEGtiGA3TOtAvud66TOz_=ODHACS5jfsYPVQFvex-+1xBBA@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH 1/3] drm: Extend DEFINE_DRM_GEM_FOPS() for
 optional fops
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 25, 2022 at 12:36 PM Ville Syrj=C3=A4l=C3=A4
<ville.syrjala@linux.intel.com> wrote:
>
> On Fri, Feb 25, 2022 at 12:26:12PM -0800, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > Extend the helper macro so we don't have to throw it away if driver add=
s
> > support for optional fops, like show_fdinfo().
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> >  include/drm/drm_gem.h | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
> > index 35e7f44c2a75..987e78b18244 100644
> > --- a/include/drm/drm_gem.h
> > +++ b/include/drm/drm_gem.h
> > @@ -327,7 +327,7 @@ struct drm_gem_object {
> >   * non-static version of this you're probably doing it wrong and will =
break the
> >   * THIS_MODULE reference by accident.
> >   */
> > -#define DEFINE_DRM_GEM_FOPS(name) \
> > +#define DEFINE_DRM_GEM_FOPS(name, ...) \
> >       static const struct file_operations name =3D {\
> >               .owner          =3D THIS_MODULE,\
> >               .open           =3D drm_open,\
> > @@ -338,6 +338,7 @@ struct drm_gem_object {
> >               .read           =3D drm_read,\
> >               .llseek         =3D noop_llseek,\
> >               .mmap           =3D drm_gem_mmap,\
> > +             ##__VA_ARGS__\
> >       }
>
> Would it not be less convoluted to make the macro only provide
> the initializers? So you'd get something like:
>
> static const struct file_operations foo =3D {
>         DRM_GEM_FOPS,
>         .my_stuff =3D whatever,
> };
>

Hmm, I like my color of the bikeshed, but I guess it is a matter of opinion=
 ;-)

BR,
-R
