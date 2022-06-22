Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2616155537A
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 20:47:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAE0410EB88;
	Wed, 22 Jun 2022 18:47:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9160D10E9AA;
 Wed, 22 Jun 2022 18:47:25 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id lw20so13821869ejb.4;
 Wed, 22 Jun 2022 11:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=G+CACZy3Mxqt2TdD/PGEXumJzA2wixKKRDT9daZiP3c=;
 b=o6jn9j2lXpVzeSsFW8lIMJD2FICQqWpBbxlCNOxwbXeMpjJTeD58bupZS2q24Cmlfk
 SPxeRixrduH/9d5it/xQvKGeUzVawm3ooAubTb1JgYmD5O6GlzDxZcKN60JQ4A+B6jPn
 Ri1abaj9MmmCcWw/fKs6ISKZTO/CN39vc1d91NHjLXeNEGYSGYsCXnJXnaWUi4/zLj5C
 YPCllGolqmZA7mBCALskOYOlfoxoneJ8ToXJ9D30ndSVIGSg9btK5c6VpRFvnWmiZzDd
 9ngDr++brL0QJ5OIzADsAUd8QWrBItO+sPzHIMtW+RM5Crg+vgye0fHRV38DQID8EEuM
 Vhvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=G+CACZy3Mxqt2TdD/PGEXumJzA2wixKKRDT9daZiP3c=;
 b=AFnQrwvS6vi8x6WfBEohIHKv1XqkujLUIxaF7X6YLQjkdsXu0POENiX4OCR6+6xmEO
 ZI6IODFXIs8uNVaHZpFX7seVscqOcvHRbqx9N2665jLYqHrDjWDSWH0fCxk/HjN99kch
 moKxo8o2nK/I3QTrrebhOhtEA3TtMPBmY4wNhhsUbuJcA9QaMiq6Bewox1wVScV4OzIG
 gKEwCmHuSfCUlZfhuIcapoI42EQvtBnMYxZneBF/ynKThYEqChzwbG92emWN/LFUW7gA
 pYloCw5WTNA4JbWnG+zvZZRTrSSMYphofs+64NOqmgt1HLhrhpEzDgLxQ5GQWy9WhzyS
 DXjQ==
X-Gm-Message-State: AJIora+w7C7hjDFn5pWF681ASgKXZZKqOFSTxFH7we/koSJ1YINf9EZx
 62o9QtBUellFaDsqaNv5k3mL6LXyNFXHI6LVLH0=
X-Google-Smtp-Source: AGRyM1uvOjttkKJarHebvSGxiaguvPTg97iaFQSlND6h0S/OvEothPCoC+FRjaPv1QR0gPFXvDB3yBSKili0mzPRkhE=
X-Received: by 2002:a17:906:74c2:b0:722:e1e2:edea with SMTP id
 z2-20020a17090674c200b00722e1e2edeamr4536987ejl.658.1655923643901; Wed, 22
 Jun 2022 11:47:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220621203921.3594920-1-cmllamas@google.com>
 <uvR86emMYmXwy4OxDiY5OlpRs9UIoEce59p_VukwHwNa368FpqXYVtN7tqccW6WzG5Vz08ycVdxXonbMczsohHw8O8Dx7WdJv8pnrYb9V34=@emersion.fr>
In-Reply-To: <uvR86emMYmXwy4OxDiY5OlpRs9UIoEce59p_VukwHwNa368FpqXYVtN7tqccW6WzG5Vz08ycVdxXonbMczsohHw8O8Dx7WdJv8pnrYb9V34=@emersion.fr>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 22 Jun 2022 14:47:12 -0400
Message-ID: <CADnq5_MLUi5LL0cXFU=1m3r_TEWw=rTSXHm3V+6NYT_LfdmK+A@mail.gmail.com>
Subject: Re: [PATCH] drm/fourcc: fix integer type usage in uapi header
To: Simon Ser <contact@emersion.fr>
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
Cc: David Airlie <airlied@linux.ie>, Masahiro Yamada <masahiroy@kernel.org>,
 Carlos Llamas <cmllamas@google.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Wed, Jun 22, 2022 at 3:02 AM Simon Ser <contact@emersion.fr> wrote:
>
> On Tuesday, June 21st, 2022 at 22:39, Carlos Llamas <cmllamas@google.com>=
 wrote:
>
> > Kernel uapi headers are supposed to use __[us]{8,16,32,64} types define=
d
> > by <linux/types.h> as opposed to 'uint32_t' and similar. See [1] for th=
e
> > relevant discussion about this topic. In this particular case, the usag=
e
> > of 'uint64_t' escaped headers_check as these macros are not being calle=
d
> > here. However, the following program triggers a compilation error:
> >
> >   #include <drm/drm_fourcc.h>
> >
> >   int main()
> >   {
> >       unsigned long x =3D AMD_FMT_MOD_CLEAR(RB);
> >       return 0;
> >   }
> >
> > gcc error:
> >   drm.c:5:27: error: =E2=80=98uint64_t=E2=80=99 undeclared (first use i=
n this function)
> >       5 |         unsigned long x =3D AMD_FMT_MOD_CLEAR(RB);
> >         |                           ^~~~~~~~~~~~~~~~~
> >
> > This patch changes AMD_FMT_MOD_{SET,CLEAR} macros to use the correct
> > integer types, which fixes the above issue.
> >
> >   [1] https://lkml.org/lkml/2019/6/5/18
> >
> > Fixes: 8ba16d599374 ("drm/fourcc: Add AMD DRM modifiers.")
> > Signed-off-by: Carlos Llamas <cmllamas@google.com>
>
> Reviewed-by: Simon Ser <contact@emersion.fr>
>
> Cc'ing Bas as well
>
> > ---
> >  include/uapi/drm/drm_fourcc.h | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourc=
c.h
> > index f1972154a594..0980678d502d 100644
> > --- a/include/uapi/drm/drm_fourcc.h
> > +++ b/include/uapi/drm/drm_fourcc.h
> > @@ -1444,11 +1444,11 @@ drm_fourcc_canonicalize_nvidia_format_mod(__u64=
 modifier)
> >  #define AMD_FMT_MOD_PIPE_MASK 0x7
> >
> >  #define AMD_FMT_MOD_SET(field, value) \
> > -     ((uint64_t)(value) << AMD_FMT_MOD_##field##_SHIFT)
> > +     ((__u64)(value) << AMD_FMT_MOD_##field##_SHIFT)
> >  #define AMD_FMT_MOD_GET(field, value) \
> >       (((value) >> AMD_FMT_MOD_##field##_SHIFT) & AMD_FMT_MOD_##field##=
_MASK)
> >  #define AMD_FMT_MOD_CLEAR(field) \
> > -     (~((uint64_t)AMD_FMT_MOD_##field##_MASK << AMD_FMT_MOD_##field##_=
SHIFT))
> > +     (~((__u64)AMD_FMT_MOD_##field##_MASK << AMD_FMT_MOD_##field##_SHI=
FT))
> >
> >  #if defined(__cplusplus)
> >  }
> > --
> > 2.37.0.rc0.104.g0611611a94-goog
