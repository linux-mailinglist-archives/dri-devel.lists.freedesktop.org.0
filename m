Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58B05766976
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jul 2023 11:55:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D65910E6CD;
	Fri, 28 Jul 2023 09:55:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com
 [209.85.219.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE63B10E6CD
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jul 2023 09:55:34 +0000 (UTC)
Received: by mail-yb1-f179.google.com with SMTP id
 3f1490d57ef6-c01e1c0402cso1752277276.0
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jul 2023 02:55:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690538134; x=1691142934;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fr+d0SM+t1ll9J/Ut8OphhRP6Lk+iPkNWRIXF2VIFmc=;
 b=TZZ5s3+yiPXqaOTafgZAiXMNpsMgOXnpXt6KzCXv2n3N/GwRiguGAuz5hu7vj+2pYT
 1GExXAov4UFN6sTyLJ/eiLFrx9G98jg5Q4FfP92Glf1/sNFptCI87+RaoRPOD0eaipLL
 cXg2LsdLISyV7MLjAYpLSgwDAmcHXiG+G+TsfpTsgePq6YKx06GyvejfOiSIXlBGFQok
 ixa6h32lZQ4U72RHA5nCmRXW+9zmpr7x4RrSCLMD5kUeuKgD1gihPdGLjk/3//SSv/hj
 1qfw11o/eMXNJHvP135QCRYaSLnW95hH/sCFlVgW7LL1ozDvwqudMYz1imII/PNB983Q
 xi2w==
X-Gm-Message-State: ABy/qLYS6wDmZnssgkIsWfBE74wJHEOx2k4vvIG2To6y+oMmSFM5FFEL
 mI4+7sU4iXGCtx4b11cxLwDFTqW1WrRqzA==
X-Google-Smtp-Source: APBJJlFKmOadlzcPqEHGNA/qP036qmsqmN8PyPQ91W+RvwkETsw/57B5r8YE8ar0w+n+KyuL+Y2Vew==
X-Received: by 2002:a0d:f804:0:b0:57d:24e9:e7f3 with SMTP id
 i4-20020a0df804000000b0057d24e9e7f3mr1233723ywf.38.1690538133856; 
 Fri, 28 Jul 2023 02:55:33 -0700 (PDT)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com.
 [209.85.128.178]) by smtp.gmail.com with ESMTPSA id
 l9-20020a81d549000000b0056d31a089e9sm938764ywj.126.2023.07.28.02.55.32
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Jul 2023 02:55:33 -0700 (PDT)
Received: by mail-yw1-f178.google.com with SMTP id
 00721157ae682-583a8596e2aso20627147b3.1
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jul 2023 02:55:32 -0700 (PDT)
X-Received: by 2002:a81:a143:0:b0:56d:de2:94d1 with SMTP id
 y64-20020a81a143000000b0056d0de294d1mr1328111ywg.24.1690538132157; Fri, 28
 Jul 2023 02:55:32 -0700 (PDT)
MIME-Version: 1.0
References: <b8c9c1a8a05dbf0be8e8be98cfdeafa9cecd8cef.1690535002.git.geert+renesas@glider.be>
 <87pm4ctl9b.fsf@minerva.mail-host-address-is-not-set>
In-Reply-To: <87pm4ctl9b.fsf@minerva.mail-host-address-is-not-set>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 28 Jul 2023 11:55:19 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXs47Jt9Kqf-Gm0eoFP8Wpe38cg4POO14GnPZCfWSs_FA@mail.gmail.com>
Message-ID: <CAMuHMdXs47Jt9Kqf-Gm0eoFP8Wpe38cg4POO14GnPZCfWSs_FA@mail.gmail.com>
Subject: Re: [PATCH v2] drm/atomic-helper: Update reference to
 drm_crtc_force_disable_all()
To: Javier Martinez Canillas <javierm@redhat.com>
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
Cc: Sui Jingfeng <suijingfeng@loongson.cn>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Javier,

On Fri, Jul 28, 2023 at 11:53=E2=80=AFAM Javier Martinez Canillas
<javierm@redhat.com> wrote:
> Geert Uytterhoeven <geert+renesas@glider.be> writes:
> > drm_crtc_force_disable_all() was renamed to
> > drm_helper_force_disable_all(), but one reference was not updated.
> >
> > Fixes: c2d88e06bcb98540 ("drm: Move the legacy kms disable_all helper t=
o crtc helpers")
>
> The dim tool complains that:
>
> -:10: WARNING:BAD_FIXES_TAG: Please use correct Fixes: style 'Fixes: <12 =
chars of sha1> ("<title line>")'
>
> So I've fixed it locally to only use the first 12 chars of the sha1.

Good luck restoring them in the future (you do care about Y2038,
do you? ;-)

> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > Reviewed-by: Sui Jingfeng <suijingfeng@loongson.cn>
> > ---
>
> Pushed to drm-misc (drm-misc-next). Thanks!

Thanks!

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
