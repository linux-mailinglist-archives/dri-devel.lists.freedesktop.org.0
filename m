Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3516B70F5B2
	for <lists+dri-devel@lfdr.de>; Wed, 24 May 2023 13:54:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF91A10E5F5;
	Wed, 24 May 2023 11:54:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com
 [209.85.128.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 273B810E5F5
 for <dri-devel@lists.freedesktop.org>; Wed, 24 May 2023 11:54:20 +0000 (UTC)
Received: by mail-yw1-f181.google.com with SMTP id
 00721157ae682-561e919d355so12117247b3.0
 for <dri-devel@lists.freedesktop.org>; Wed, 24 May 2023 04:54:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684929258; x=1687521258;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mB+yJW9GxDPC7vWCyTgkNtqkSRQGKRDyuctXyoPIN+0=;
 b=EQZh+H37Hc/1uzb0YnWyXd8UwcWDp0wrIRwRXaFhxrXt7a6L9F0YSp3yXp3UyCdaU8
 k/wUCBjKRz1cDwNC1hDBV3wYQloDaVCNd2d6NLnYncpJVQ0vHkDzKU8ZwtV2S4pQmVLO
 H6/g2A0XaP6aHlbYJ03n/LzaqhseSe5l6d0R93x1y5J1553zyn1rQ0wgTHJsNv99piQg
 kWAIzwnG8fg5mjn1duDjzBSU1GfhG201sZKMuDcKDfs4YaLolZ++sBKmauGGl8PL4Hna
 XUpcR22Vy0iZ8/rjX63eVekNi08HAo6NtKtYyScRK+YbHQlqBExmWk1EVufwoO+appGD
 Z6jg==
X-Gm-Message-State: AC+VfDxU/jArtN7NY/ks+TWXsJ7Ne7L9lsaJmWWGFT5su3/EeqMNMlYr
 Duq9MZg3FYaFKokZWgQqfZg+5ugNGIUuGQ==
X-Google-Smtp-Source: ACHHUZ5vb6uwVFI/g/Rr0S3ikyG1iIuq3TNVYsqXh1tx04rtlbiqcM3Kqq4D89ZZsvPbjiSB4V4FTQ==
X-Received: by 2002:a81:4946:0:b0:561:e7bb:1b27 with SMTP id
 w67-20020a814946000000b00561e7bb1b27mr18282438ywa.52.1684929258455; 
 Wed, 24 May 2023 04:54:18 -0700 (PDT)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com.
 [209.85.219.179]) by smtp.gmail.com with ESMTPSA id
 j68-20020a0dc747000000b0055ddea0db57sm3609224ywd.146.2023.05.24.04.54.15
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 May 2023 04:54:16 -0700 (PDT)
Received: by mail-yb1-f179.google.com with SMTP id
 3f1490d57ef6-ba86ec8047bso1293553276.3
 for <dri-devel@lists.freedesktop.org>; Wed, 24 May 2023 04:54:15 -0700 (PDT)
X-Received: by 2002:a25:342:0:b0:ba8:5009:db33 with SMTP id
 63-20020a250342000000b00ba85009db33mr17581461ybd.59.1684929255682; Wed, 24
 May 2023 04:54:15 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1684854992.git.geert+renesas@glider.be>
 <d800a238-83e0-0ec2-cf3a-67d07d749b5b@suse.de>
In-Reply-To: <d800a238-83e0-0ec2-cf3a-67d07d749b5b@suse.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 24 May 2023 13:54:04 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXPJ02UWuH1v_ZaoWmbHALu0Qe2K27nhuvwKBmjno+YMw@mail.gmail.com>
Message-ID: <CAMuHMdXPJ02UWuH1v_ZaoWmbHALu0Qe2K27nhuvwKBmjno+YMw@mail.gmail.com>
Subject: Re: [PATCH v3 0/5] drm: shmobile: Fixes and enhancements
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

On Wed, May 24, 2023 at 1:42=E2=80=AFPM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:
> Am 23.05.23 um 17:31 schrieb Geert Uytterhoeven:
> > Currently, there are two drivers for the LCD controller on Renesas
> > SuperH-based and ARM-based SH-Mobile and R-Mobile SoCs:
> >    1. sh_mobile_lcdcfb, using the fbdev framework,
> >    2. shmob_drm, using the DRM framework.
> > However, only the former driver can be used, as all platform support
> > integrates the former.  None of these drivers support DT-based systems.
> >
> > This patch series is a first step to enable the SH-Mobile DRM driver fo=
r
> > Renesas ARM-based SH-Mobile and R-Mobile SoCs.  The next steps planned =
are
> > to (1) add DT support (works, but needs a hack due to lack of (2)), and=
 (2)
> > convert the driver to atomic modesetting.
> >
> > Changes compared to v2[1]:
> >    - Add Reviewed-by.
> >
> > Changes compared to v1[2]:
> >    - Add Reviewed-by,
> >    - Drop dependency on ARM.
> >
> > This has been tested on the R-Mobile A1-based Atmark Techno
> > Armadillo-800-EVA development board, using a temporary
> > platform-enablement patch[3].
> >
> > Thanks for applying to drm-misc!
>
> It's all been reviewed. Do you want me to merge the patchset?

That would be great! Thanks!

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
