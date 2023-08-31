Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB70578F55F
	for <lists+dri-devel@lfdr.de>; Fri,  1 Sep 2023 00:26:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48DA510E00B;
	Thu, 31 Aug 2023 22:26:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf2d.google.com (mail-qv1-xf2d.google.com
 [IPv6:2607:f8b0:4864:20::f2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21BC110E00B
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Aug 2023 22:26:50 +0000 (UTC)
Received: by mail-qv1-xf2d.google.com with SMTP id
 6a1803df08f44-64f383be0d4so7675036d6.3
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Aug 2023 15:26:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1693520809; x=1694125609;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WKlkGKYCgrWeKXNqJyo7pWKtqd+Hx7OjZxfb5gEIfrY=;
 b=oG5A4iAu0fXqvs0Gd9VxxhXipuFSmjIAOECQrZZMr3zybrc8iyachINitAERRzjg0M
 GUw8rxjseo3C/ne525I3GyF8fYo/1GmsXOvO+O2BvXEcI44A1UIzidt32miwFGH5+/a8
 Z+VP9qKT4tv2+QNTQT0TCKGCoCCCoPy3+CPD4kBdYWnHPRXFX7f2EwdUvx3RxSSxFc57
 6gnINLGOn2XhpVAfEV3rj7fzqYYv4zZXfDvXqZd/pDfpPaLNd1Hj9ITVb2N/2ff1VnVH
 6+WNlKAKkmQpl0VI7xFow7YsjtH7C2GVK7Av5eKD6jGA4DzewdvxaSF6UTI6JjdhjX15
 g6lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693520809; x=1694125609;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WKlkGKYCgrWeKXNqJyo7pWKtqd+Hx7OjZxfb5gEIfrY=;
 b=Ma4PD13BsOCfCD9GHUnOW37T8eAtXhb+dK1MFZrCVc0XhKrdSfP1/ErFRovquYmsve
 NayQG4suow2mlVyM/Y7fCSnzp/euKjpQU8xog9amClVRvJ6mBs6moUXv7rWNKFX4dLWL
 uxkYa8tX1zSLDq26Os7fbmMOCXZiDkvdttZGJjwatVbRhmotlOrNBLYqGTnDVik8dS0S
 y+Hw409UVQXjgi0ZbCOhOikde+pu4S4PutJlqmM6eCzQFkDpbJZhp+FyUiwQ4Wu9QgiX
 MNOT42TBDn1pfVBVJ8H8HUUO1zFnUcfnCIFAO4yhQCplttYvYMLiT2Amva9QqaGmUXTT
 w+vQ==
X-Gm-Message-State: AOJu0YyvhrbYIYpL/XKto4q3l42t6etoUzQLRUK5CoWfP9QMNFLQ07bs
 P7F+zqTnr0qZpTaiADe2gksq/L3kNf/WZSf7vntMvIEOhT7mE1D/AJw=
X-Google-Smtp-Source: AGHT+IHqutLf/Ndx2phVAuqZjb5qjCQ920NGHqHCD34nUPgPY+PJcMk8FLCrkS7O1NZpBb1oQRUn/bM3dMgktFBGgQY=
X-Received: by 2002:ad4:45aa:0:b0:64c:e8a3:fb68 with SMTP id
 y10-20020ad445aa000000b0064ce8a3fb68mr646024qvu.3.1693520809085; Thu, 31 Aug
 2023 15:26:49 -0700 (PDT)
MIME-Version: 1.0
References: <CAKwvOdn0xoVWjQ6ufM_rojtKb0f1i1hW-J_xYGfKDNFdHwaeHQ@mail.gmail.com>
 <9d2bb495-0c1d-0d1b-96ea-4b1110d45b79@gmx.de> <ZPEEzkQcQOP9yVFF@ls3530>
 <CAKwvOdkXmEe46cG9Hn837215ghWA7UNKtg7ZQM8CpQcEQnoWfg@mail.gmail.com>
 <ZPERGqgkUwcWvr+4@ls3530>
In-Reply-To: <ZPERGqgkUwcWvr+4@ls3530>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 31 Aug 2023 15:26:35 -0700
Message-ID: <CAKwvOdkqZwF_HqyPhm3hxOVpsWqhN4X=bwUw66=ZkPSpwGpLAA@mail.gmail.com>
Subject: Re: truncation in drivers/video/fbdev/neofb.c
To: Helge Deller <deller@gmx.de>
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
Cc: linux-fbdev@vger.kernel.org, Kees Cook <keescook@chromium.org>,
 clang-built-linux <llvm@lists.linux.dev>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Nathan Chancellor <nathan@kernel.org>, Justin Stitt <justinstitt@google.com>,
 Andrew Morton <akpm@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 31, 2023 at 3:16=E2=80=AFPM Helge Deller <deller@gmx.de> wrote:
>
> * Nick Desaulniers <ndesaulniers@google.com>:
> > On Thu, Aug 31, 2023 at 2:23=E2=80=AFPM Helge Deller <deller@gmx.de> wr=
ote:
> > >
> > > * Helge Deller <deller@gmx.de>:
> > > > On 8/29/23 18:45, Nick Desaulniers wrote:
> > > > > A recent change in clang made it better about spotting snprintf t=
hat
> > > > > will result in truncation.  Nathan reported the following instanc=
es:
> > > > >
> > > > > drivers/video/fbdev/neofb.c:1959:3: warning: 'snprintf' will alwa=
ys be
> > > > > truncated; specified size is 16, but format string expands to at =
least
> > > > > 17 [-Wfortify-source]
> > >
> > > FYI, I've added the patch below to the fbdev for-next git tree.
> > > [...]
> >
> > This indeed makes the warning go away, but that's more so due to the
> > use of strscpy now rather than snprintf.  That alone is a good change
> > but we still have definite truncation.  See below:
> > [...]
>
> Nick, thanks for your review and findings!
> Now every string should be max. 15 chars (which fits with the trailing
> NUL into the char[16] array).
>
> Helge
>
>
> Subject: [PATCH] fbdev: neofb: Shorten Neomagic product name in info stru=
ct
>
> Avoid those compiler warnings:
> neofb.c:1959:3: warning: 'snprintf' will always be truncated;
>    specified size is 16, but format string expands to at least 17 [-Wfort=
ify-source]
>
> Signed-off-by: Helge Deller <deller@gmx.de>
> Reported-by: Nathan Chancellor <nathan@kernel.org>
> Reported-by: Nick Desaulniers <ndesaulniers@google.com>
> Link: https://lore.kernel.org/all/CAKwvOdn0xoVWjQ6ufM_rojtKb0f1i1hW-J_xYG=
fKDNFdHwaeHQ@mail.gmail.com/
> Link: https://github.com/ClangBuiltLinux/linux/issues/1923

ah yeah LGTM

Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

>
> diff --git a/drivers/video/fbdev/neofb.c b/drivers/video/fbdev/neofb.c
> index d2f622b4c372..b58b11015c0c 100644
> --- a/drivers/video/fbdev/neofb.c
> +++ b/drivers/video/fbdev/neofb.c
> @@ -1948,49 +1948,40 @@ static struct fb_info *neo_alloc_fb_info(struct p=
ci_dev *dev,
>
>         switch (info->fix.accel) {
>         case FB_ACCEL_NEOMAGIC_NM2070:
> -               snprintf(info->fix.id, sizeof(info->fix.id),
> -                               "MagicGraph 128");
> +               strscpy(info->fix.id, "MagicGraph128", sizeof(info->fix.i=
d));
>                 break;
>         case FB_ACCEL_NEOMAGIC_NM2090:
> -               snprintf(info->fix.id, sizeof(info->fix.id),
> -                               "MagicGraph 128V");
> +               strscpy(info->fix.id, "MagicGraph128V", sizeof(info->fix.=
id));
>                 break;
>         case FB_ACCEL_NEOMAGIC_NM2093:
> -               snprintf(info->fix.id, sizeof(info->fix.id),
> -                               "MagicGraph 128ZV");
> +               strscpy(info->fix.id, "MagicGraph128ZV", sizeof(info->fix=
.id));
>                 break;
>         case FB_ACCEL_NEOMAGIC_NM2097:
> -               snprintf(info->fix.id, sizeof(info->fix.id),
> -                               "MagicGraph 128ZV+");
> +               strscpy(info->fix.id, "Mag.Graph128ZV+", sizeof(info->fix=
.id));
>                 break;
>         case FB_ACCEL_NEOMAGIC_NM2160:
> -               snprintf(info->fix.id, sizeof(info->fix.id),
> -                               "MagicGraph 128XD");
> +               strscpy(info->fix.id, "MagicGraph128XD", sizeof(info->fix=
.id));
>                 break;
>         case FB_ACCEL_NEOMAGIC_NM2200:
> -               snprintf(info->fix.id, sizeof(info->fix.id),
> -                               "MagicGraph 256AV");
> +               strscpy(info->fix.id, "MagicGraph256AV", sizeof(info->fix=
.id));
>                 info->flags |=3D FBINFO_HWACCEL_IMAGEBLIT |
>                                FBINFO_HWACCEL_COPYAREA |
>                                FBINFO_HWACCEL_FILLRECT;
>                 break;
>         case FB_ACCEL_NEOMAGIC_NM2230:
> -               snprintf(info->fix.id, sizeof(info->fix.id),
> -                               "MagicGraph 256AV+");
> +               strscpy(info->fix.id, "Mag.Graph256AV+", sizeof(info->fix=
.id));
>                 info->flags |=3D FBINFO_HWACCEL_IMAGEBLIT |
>                                FBINFO_HWACCEL_COPYAREA |
>                                FBINFO_HWACCEL_FILLRECT;
>                 break;
>         case FB_ACCEL_NEOMAGIC_NM2360:
> -               snprintf(info->fix.id, sizeof(info->fix.id),
> -                               "MagicGraph 256ZX");
> +               strscpy(info->fix.id, "MagicGraph256ZX", sizeof(info->fix=
.id));
>                 info->flags |=3D FBINFO_HWACCEL_IMAGEBLIT |
>                                FBINFO_HWACCEL_COPYAREA |
>                                FBINFO_HWACCEL_FILLRECT;
>                 break;
>         case FB_ACCEL_NEOMAGIC_NM2380:
> -               snprintf(info->fix.id, sizeof(info->fix.id),
> -                               "MagicGraph 256XL+");
> +               strscpy(info->fix.id, "Mag.Graph256XL+", sizeof(info->fix=
.id));
>                 info->flags |=3D FBINFO_HWACCEL_IMAGEBLIT |
>                                FBINFO_HWACCEL_COPYAREA |
>                                FBINFO_HWACCEL_FILLRECT;
>


--=20
Thanks,
~Nick Desaulniers
