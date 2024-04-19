Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2630D8AA65A
	for <lists+dri-devel@lfdr.de>; Fri, 19 Apr 2024 02:48:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C923110F81B;
	Fri, 19 Apr 2024 00:48:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="4c5jPEAZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
 [209.85.215.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4893F10F81B
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Apr 2024 00:48:54 +0000 (UTC)
Received: by mail-pg1-f173.google.com with SMTP id
 41be03b00d2f7-5e152c757a5so865839a12.2
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Apr 2024 17:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1713487733; x=1714092533;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+i6MbUVulprM4w6RPq5RF1Rimz1Zb3d0BGvo/86t4ac=;
 b=4c5jPEAZDBkVho00/JNZhgbuW6oL3edvQtNljiJ6a8V4nhYOHIo97OBYr40+oTfA/k
 DNgXuqhS0DV/vyqKgJjlqxmTxnpwU6Iaqi16jXkl0lOOzPIQPaxT5lMut/VkLyTJRBM3
 3uzUpRe52kcXjhX2sB7fmL8z+lEhKOcjItf6wTTNb+T1cKhYOvrJ2Kc7+jEOtt+RZ0+a
 Hh/vJj24jJlOX09jklkxrckc4x1VEyBMwNn5lRJsr5sMwq9eqcYfNAAVPKZXrTcEfcSM
 QZ96FRhhV8mwSfGg/RdGYmvy0W7Kofluhrzs7OsbKCKn906zoI/1lm36PEQI7XjT80+J
 2C7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713487733; x=1714092533;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+i6MbUVulprM4w6RPq5RF1Rimz1Zb3d0BGvo/86t4ac=;
 b=PpYiXzmhuUTL0YvcufRYcQnGpU4/Sk0kM8zVXOEQSVe9yhHRr3fXLGu5WmrrPKOE/9
 OPNcw5oM7G/TTItZev8Zg4rc0ydvawktSfNUfYRkrZSdxU3p8W7A1HE4HjijiLYsdLb2
 uj7PWbb7yGFkX00YYvkbKp/O3CnFuKpHsFE+DZFLTiudvUUI60/e0oAx+ZeIpaTL5tag
 EihJKNBq40gDY0X+pUJn1BlmEZcluR5h3cFeP7wpBSnnAshCejE4p9Y4/kFV9y7II1hf
 k4CiC+HurSqDojPZQ3JwSUmEZiXoGYsuoApiWaspOakL5wToMoGgRB4qZdpBodpkQk+r
 DyUA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX5WJqOX4P7JkxxarP2jfQV+d1zl+gQLtiWeu8yM7i5EJWhrKbQ5cHC+lvPBAfCFz3jRPUU2k9DtaKCMxufzgx2125yXt/tk/k4s24yYxO1
X-Gm-Message-State: AOJu0YyBpYU8kCtpgKGuYVF9KAg3gg0hmwKBcwyzsuLoiGPRZmLqGqP5
 Cbvsv5QkbKY/nVb3jkSfeWLJui7DF8uVYUPVc32LrC78lkfRieWKBoDTBFIG2BeGAejb81UooSN
 aOt6m4svk5LTXY97fQ6aks8TslAXdoMsXHCP60Q==
X-Google-Smtp-Source: AGHT+IHvhJAZ8u8NbdyyMWW9Qdo19ozFbcLnpn2nmLxzT6yaxoL9DdwJWbhTCPyHaoQcP7I5NTV0L5vVt0pITogV8iU=
X-Received: by 2002:a17:90a:c907:b0:2ab:9f04:703a with SMTP id
 v7-20020a17090ac90700b002ab9f04703amr782215pjt.41.1713487733583; Thu, 18 Apr
 2024 17:48:53 -0700 (PDT)
MIME-Version: 1.0
References: <20240410071439.2152588-1-yangcong5@huaqin.corp-partner.google.com>
 <20240410071439.2152588-3-yangcong5@huaqin.corp-partner.google.com>
 <CAD=FV=V2J=Tth2zhpo-kPo4uvESt70mFneO2V6TV-haac0VZuQ@mail.gmail.com>
 <CACRpkdYtM=5jdQddCqRFgBRXvcJEjk1ULJNKKFz7jhhkGxV59Q@mail.gmail.com>
 <CAHwB_NLfaQWhFSbZ2ASmYgXJaVOTrjac3F0hyCJdwTTo-zHJrQ@mail.gmail.com>
 <CACRpkdYoM40RZyjTxLwDNta2+uV31_zzoj7XrXqhyyqrDtd5zQ@mail.gmail.com>
In-Reply-To: <CACRpkdYoM40RZyjTxLwDNta2+uV31_zzoj7XrXqhyyqrDtd5zQ@mail.gmail.com>
From: cong yang <yangcong5@huaqin.corp-partner.google.com>
Date: Fri, 19 Apr 2024 08:48:42 +0800
Message-ID: <CAHwB_N+39-kTcNX91JvNGM4HEJ_ZArKt2Vs61g-OR-Mz6akocw@mail.gmail.com>
Subject: Re: [PATCH v1 2/4] drm/panel: boe-tv101wum-nl6: Support for BOE
 nv110wum-l60 MIPI-DSI panel
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Doug Anderson <dianders@chromium.org>, sam@ravnborg.org,
 neil.armstrong@linaro.org, 
 daniel@ffwll.ch, airlied@gmail.com, robh+dt@kernel.org, 
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
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

Hi,

Linus Walleij <linus.walleij@linaro.org> =E4=BA=8E2024=E5=B9=B44=E6=9C=8818=
=E6=97=A5=E5=91=A8=E5=9B=9B 22:00=E5=86=99=E9=81=93=EF=BC=9A
>
> On Thu, Apr 18, 2024 at 2:42=E2=80=AFPM cong yang
> <yangcong5@huaqin.corp-partner.google.com> wrote:
>
> > I learned from himax that even if the same controller is used with
> > different glasses, the corresponding parameters are not fixed.
> >
> > For example: _INIT_DCS_CMD(0xB9, 0x83, 0x10, 0x21, 0x55, 0x00),
> >
> > even in the group initial code, the same register will be loaded with
> > parameters twice.
> (...)
> > So assuming that the registers of the two screens is the same now,
> > it cannot be set as a common parameter.
> > Otherwise, it may be a bit troublesome for the maintainers.
> >
> > If necessary, I can break out starry_himax83102_j02, boe_nv110wum and
> > ivo_t109nw41
> > as separate driver. Then add some define to these registers.
>
> Why would you do a separate driver per panel despite they have
> the same display controller? I don't get it.
>
> Use one driver, use different compatible strings for the different
> panels and use the corresponding sequence for each panel
> selected by compatible string.

I mean add starry_himax83102_j02, boe_nv110wum and ivo_t109nw41
together to make a separate driver and break out boe-tv101wum-nl6 ,
because they belong to the same controller.

As Doug said =EF=BC=9A
=E2=80=9CI'm just guessing, but if those are the same controller as
the two new ones you're adding in this series, maybe all
3 of them should be in their own driver? Maybe we can do something to
make more sense of some of these commands too? =E2=80=9D


Thanks.
>
> For example, see drivers/gpu/drm/panel/panel-novatek-nt35510.c:
>
> static const struct of_device_id nt35510_of_match[] =3D {
>         {
>                 .compatible =3D "frida,frd400b25025",
>                 .data =3D &nt35510_frida_frd400b25025,
>         },
>         {
>                 .compatible =3D "hydis,hva40wv1",
>                 .data =3D &nt35510_hydis_hva40wv1,
>         },
>         { }
> };
>
>
> Take some inspiration from this driver and how we parameterize
> the different data depending on compatible string.
>
> Yours,
> Linus Walleij
