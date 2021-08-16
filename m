Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FB383EDD5C
	for <lists+dri-devel@lfdr.de>; Mon, 16 Aug 2021 20:54:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0E8C89911;
	Mon, 16 Aug 2021 18:54:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [IPv6:2607:f8b0:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A773F89911;
 Mon, 16 Aug 2021 18:54:05 +0000 (UTC)
Received: by mail-oi1-x235.google.com with SMTP id bf25so19342228oib.10;
 Mon, 16 Aug 2021 11:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=YoY9bHgtBFBdh+LL5q9r5ScpCfKdiLG+MRqaif3YEI8=;
 b=naoSBJkgtcuj5qgJOEZkSZimaplLVdgNyuZkSUQOT4oTguOAkX6UV9uhieY+czuvyC
 yKl+WA0CV9mqasUFr9PIYgiR087D0pB2DSlo7BJlIJOIeH8jZe90iieO/YLidSIvyGcF
 y120bsGWC2BVTQ4HihQP1T9IDivfmdAump1sI1BksIJxwB5U864hAmI+CYPqoUxVmf9b
 rtYUU/gjJHllsB4yhuL/fsFmr4fSG2UYhzvG3SxadqL7yAr1+lzHaT65vfY+b4nAv6pE
 riWxWjM/lMBOuoaoLzdmW2IFQuhDZ6aS10JodX0K8HOixim9MKDvwfe3gqNhyZrNomrY
 F2nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=YoY9bHgtBFBdh+LL5q9r5ScpCfKdiLG+MRqaif3YEI8=;
 b=XoVeumcZyTUrEs0P+8AGzRi9/eLUMHBQ0jpKoynTIyllI4sbyUnz2+5l7FgiiatKe2
 EjiJ/+M+1MJV8dRBJU6s8TASZGPVB4tc+APLKYCbBpfdO1NAwCFeLmYf/90SBAKiNQMH
 RNgcIV6w19trjuKuNmF8ih+BjC2TazJs7lwJzC9GmckdQORt+b7l8hgHdTGfmxEbtPvR
 pyRKhfBywagb/lkpgla3Eg57dM1PS0FW6WoG/zTkchezXvY2aCRhr9qa3QjA5LMeq2bR
 HLqqie2lYRNeMxeTILTLt4JNMos68F/LXmMofNul9vpqV1EmZdJsjLoWQRJAnkVLQvVI
 f7Dg==
X-Gm-Message-State: AOAM533TmNGFGrN4bvPY0ttH2p2PWiqoHp1OfjN8qInm6j+uH9OoTqU9
 GLohyCwd9fN79OTnb8Tfnb4e+RhxeR2rmCQyxwA=
X-Google-Smtp-Source: ABdhPJyjsT23z+JKUtzE0jLgdLWJv7SfrxzzaZKXzkFJJLzPFGv15wqNC71FHrLBwBKGtq3duPeYyc8o86vTH0Psaxc=
X-Received: by 2002:a05:6808:1390:: with SMTP id
 c16mr128831oiw.123.1629140045025; 
 Mon, 16 Aug 2021 11:54:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210815192959.90142-1-nathan@kernel.org>
 <d2e9b2a0-49b9-42fe-47fc-66a44bef3b01@amd.com>
In-Reply-To: <d2e9b2a0-49b9-42fe-47fc-66a44bef3b01@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 16 Aug 2021 14:53:53 -0400
Message-ID: <CADnq5_N0o_6vCqE0tYq=yqtPWvOzZikLoVF1f4U9DJcb2bCgCA@mail.gmail.com>
Subject: Re: [PATCH] drm/radeon: Add break to switch statement in
 radeonfb_create_pinned_object()
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Nathan Chancellor <nathan@kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>, 
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, Nick Desaulniers <ndesaulniers@google.com>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Kees Cook <keescook@chromium.org>, 
 amd-gfx list <amd-gfx@lists.freedesktop.org>, 
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, 
 clang-built-linux <clang-built-linux@googlegroups.com>
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

Applied.  Thanks!

Alex

On Mon, Aug 16, 2021 at 3:23 AM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 15.08.21 um 21:29 schrieb Nathan Chancellor:
> > Clang + -Wimplicit-fallthrough warns:
> >
> > drivers/gpu/drm/radeon/radeon_fb.c:170:2: warning: unannotated
> > fall-through between switch labels [-Wimplicit-fallthrough]
> >          default:
> >          ^
> > drivers/gpu/drm/radeon/radeon_fb.c:170:2: note: insert 'break;' to avoi=
d
> > fall-through
> >          default:
> >          ^
> >          break;
> > 1 warning generated.
> >
> > Clang's version of this warning is a little bit more pedantic than
> > GCC's. Add the missing break to satisfy it to match what has been done
> > all over the kernel tree.
> >
> > Signed-off-by: Nathan Chancellor <nathan@kernel.org>
>
> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
>
> > ---
> >   drivers/gpu/drm/radeon/radeon_fb.c | 1 +
> >   1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/gpu/drm/radeon/radeon_fb.c b/drivers/gpu/drm/radeo=
n/radeon_fb.c
> > index 0b206b052972..c8b545181497 100644
> > --- a/drivers/gpu/drm/radeon/radeon_fb.c
> > +++ b/drivers/gpu/drm/radeon/radeon_fb.c
> > @@ -167,6 +167,7 @@ static int radeonfb_create_pinned_object(struct rad=
eon_fbdev *rfbdev,
> >               break;
> >       case 2:
> >               tiling_flags |=3D RADEON_TILING_SWAP_16BIT;
> > +             break;
> >       default:
> >               break;
> >       }
> >
> > base-commit: ba31f97d43be41ca99ab72a6131d7c226306865f
>
