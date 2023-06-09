Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A608729814
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jun 2023 13:22:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F4B610E12D;
	Fri,  9 Jun 2023 11:22:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com
 [209.85.160.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02D1A10E12D
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jun 2023 11:22:41 +0000 (UTC)
Received: by mail-oa1-f49.google.com with SMTP id
 586e51a60fabf-1a5229df1f2so290216fac.3
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Jun 2023 04:22:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686309760; x=1688901760;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xadRBA7ym6NtI+c99cDpm8sxh6Is5YguQpKNeHDLZ5g=;
 b=LijhiXlOGt5HY4erbtejU5I1C3EO2Xpv/6RmdK5svgt3qRcQO5J1bFt9JEH9p8P5rP
 shJ5Fb4+x61XhcSztwDk9qWZWDfYl/18+Yah/Y8DZLcUzWAAaeXt2LS2yPt/TCZAAO/V
 dOdNmlWrWTxCU3S+qCw4cAjbcvXmU5jt2/NxyRB6Z5G3PiUzteV3RN1ANJt2GGNRrpQo
 hVhkzrm9Twq5WBbuNU9CCxpDa0/EnrAki0bUKCaQ2dkzXUeH5a7n0ZE2PdQGNxjJUbvy
 mnn1M8Ao7SHMddT2ahJw5CzZkzhZkvB5QQ9ZUH+NAaaRC6+TfnOOJc0fhpWAOd8JRbco
 mgOA==
X-Gm-Message-State: AC+VfDxsMHI9r0p9nc5qle3teRUdShSzBPouSXExKpF9Usg9oXf09d6F
 DdJGrMgez06cyq1mjaENPje7XHQu7NAyeA==
X-Google-Smtp-Source: ACHHUZ7ITLbOrrFqwvF5L+jNuWSfslJDwSOm+MAEEFLQuT8qPdk7vmSzQapMCPhhkY5t/awV5BlYSQ==
X-Received: by 2002:a05:6870:6295:b0:1a0:2fd5:150e with SMTP id
 s21-20020a056870629500b001a02fd5150emr992801oan.48.1686309760470; 
 Fri, 09 Jun 2023 04:22:40 -0700 (PDT)
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com.
 [209.85.160.50]) by smtp.gmail.com with ESMTPSA id
 o8-20020a056870524800b0019fa8728b05sm1981861oai.39.2023.06.09.04.22.38
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Jun 2023 04:22:38 -0700 (PDT)
Received: by mail-oa1-f50.google.com with SMTP id
 586e51a60fabf-19f8af9aa34so585085fac.1
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Jun 2023 04:22:38 -0700 (PDT)
X-Received: by 2002:a05:6870:d450:b0:1a2:7f63:9920 with SMTP id
 j16-20020a056870d45000b001a27f639920mr911793oag.26.1686309758094; Fri, 09 Jun
 2023 04:22:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230605144812.15241-1-tzimmermann@suse.de>
 <20230605144812.15241-31-tzimmermann@suse.de>
 <CAMuHMdVP2hrgXaZvASnHJ4M+VXaTCtfbeVXrq2dsEJqcs3G6ZA@mail.gmail.com>
 <e5d88ca8-66fe-b5ee-cb6b-2dc8f3a3fb26@suse.de>
 <CAMuHMdWBUKTgfCD9VLDFh_Tm1J-NJQHpxODs-TuYM7V-dtmGjA@mail.gmail.com>
 <873532eurg.fsf@minerva.mail-host-address-is-not-set>
 <77252bc9-e08e-fcee-d140-2b78ab768b42@suse.de>
 <CAMuHMdWUkZDcYfndf1A+cgcN5Fz1hmst4LrpA7iYCFqWSRTNDA@mail.gmail.com>
 <4df23439-462f-47da-890d-2dd2092eea35@suse.de>
 <CAMuHMdWrTairp5h-fmkG9+xwzna+T4QmPuMeshd0UB8ZhQF8Sg@mail.gmail.com>
 <66548126-e39f-72a6-60bc-ed6d0cc82ae7@suse.de>
In-Reply-To: <66548126-e39f-72a6-60bc-ed6d0cc82ae7@suse.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 9 Jun 2023 13:22:26 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWP7BBPZuJDzRs9Fvhqq7eO30poZoJRgLCPyoamUkfANg@mail.gmail.com>
Message-ID: <CAMuHMdWP7BBPZuJDzRs9Fvhqq7eO30poZoJRgLCPyoamUkfANg@mail.gmail.com>
Subject: Re: [PATCH 30/30] fbdev: Make support for userspace interfaces
 configurable
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
Cc: daniel.thompson@linaro.org, linux-staging@lists.linux.dev,
 linux-sh@vger.kernel.org, jingoohan1@gmail.com, deller@gmx.de, lee@kernel.org,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-omap@vger.kernel.org, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

On Fri, Jun 9, 2023 at 1:04=E2=80=AFPM Thomas Zimmermann <tzimmermann@suse.=
de> wrote:
> Am 09.06.23 um 11:14 schrieb Geert Uytterhoeven:
> [...]
> >
> >>> What do you think low-end embedded devices with an out-of-tree[*]
> >>> fbdev driver are using?
> >>
> >> And those do not count either. IIRC Android used to be built on top of
> >> fbdev devices. I'm not sure if they have moved to DRM by now. But
> >> embedded uses dedicated kernels and kernel configs.  It's easy for the=
m
> >> to set FB_DEVICE=3Dy.  We're not going to take away the fbdev device e=
ntirely.
> >
> > The point is that we do not suddenly disable functionality that users
> > may depend on. While "make oldconfig" will show users the new
> > FB_DEVICE question, (and hopefully they'll notice), "make olddefconfig"
> > and "make <foo>_defconfig" won't, possibly causing regressions.
> > Without a suitable default, you should IMHO at least update all
> > defconfigs that enable any fbdev drivers.
>
> Didn't I already say that we should make it "default y" if that's
> preferable in practice?

OK, sorry, I seem to have missed that part.

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
