Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DA88733140
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jun 2023 14:31:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F30310E610;
	Fri, 16 Jun 2023 12:31:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B1F310E610
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jun 2023 12:31:38 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id
 98e67ed59e1d1-25bbf87a2a4so466932a91.3
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jun 2023 05:31:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686918696; x=1689510696;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lm26FPRdEuF0YwkxWbrT+z8zY664CKlz4NjHENy56Us=;
 b=a05oQ1ePVVw5aKhJV/qcSzr4QWznhaIZ5pzXjcJZTHAoK67+GdFkyd52kBiq+Xo5wy
 6v1lgAXd26LTOw0MuJGgkxHAsBktMM5/FqTLDTBv8BsDm/4yeY3E4dSsIaQy8HzaRvKu
 T1X3PkRzIOldSrE79Wwb8PrnlmPYoht0PRGJStEaET7Vd8T1ex9uoFBuxawzlipL8ME0
 7KBy8VO24fCQwuwLxSfYZ6WsPFnfj/f/6QdfogmNw1jIU1SGKByaKcLudiMAOe/0TtMA
 AoPb3bdhIorOHE0u1wQ+Lu5gR5mPWGLqvhuqelZZdVlVinrCHh8GRZNsd8PuVJ8u7k/I
 Zt6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686918696; x=1689510696;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lm26FPRdEuF0YwkxWbrT+z8zY664CKlz4NjHENy56Us=;
 b=TbIHRYCodpM2y8Zmm8lNX7wZrOhhchO/Wlq4IX3UFyBF/53hVbKZ999+jXFCmjty4K
 4MWeFECL8fnuG5KDcrtD+8gS4Ufv/ZGxZJ+w+57P90Z5TgvDsY9WSOrreXCD+8Zct76X
 9D7JqVB3yYnbAOaNfek0NmGay517/RBla2t6NPzM/2SEkP7dnRomOt+O6CZyEoG0P+U3
 j82NuGJMGzSAQ87ep+KcIFE+i5m1K+QulUN8LxW7IkPZYBh96T47/t13eV40id1zR/jc
 X9Ls+mhWjhlHII3cSJNtlHe5DSBWnuWKpm/zj3lLZJ8mcvngh5JKMa+QrGW/AhbGN+z3
 SjFg==
X-Gm-Message-State: AC+VfDyc1gxgMBPTIRDTCSHHZgxcz4csPlxY4O0UZk292f3+IfLr0vVi
 FFsSPPmzK9qht8uQbcCCGwGSDsVrRETOdlN7bTc=
X-Google-Smtp-Source: ACHHUZ4v59zC84NLCUrSS490QCKZGfzTuz9JmKYtcJPuSOdbHRtJu6+cZfkZCOvoJv1GUV6IauD+v8rwbtxKcgsidRE=
X-Received: by 2002:a17:90a:656:b0:259:343:86b5 with SMTP id
 q22-20020a17090a065600b00259034386b5mr1338940pje.47.1686918696408; Fri, 16
 Jun 2023 05:31:36 -0700 (PDT)
MIME-Version: 1.0
References: <20230607151127.1542024-1-pavacic.p@gmail.com>
 <20230607151127.1542024-4-pavacic.p@gmail.com>
 <CACRpkdbrEA54qmfTKSsFRG9ZS4u8hM6P5TXtOjRAiW+TD_v-fQ@mail.gmail.com>
 <CAO9szn00vRFm+iM1m7KgkW0WRuKyJEgVU4tVx4f5tF6KPnE=2w@mail.gmail.com>
 <CACRpkdaw8M3dSkmiV5QDOt3BBB7Jo6NxT0Og=zvA4REMA_7y9g@mail.gmail.com>
In-Reply-To: <CACRpkdaw8M3dSkmiV5QDOt3BBB7Jo6NxT0Og=zvA4REMA_7y9g@mail.gmail.com>
From: Paulo Pavacic <pavacic.p@gmail.com>
Date: Fri, 16 Jun 2023 14:31:25 +0200
Message-ID: <CAO9szn29A0qCABG0ACni42UGpsGKLwG7OT1y_ho3DgQ0WLvfmw@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] drm/panel-fannal-c3004: Add fannal c3004 DSI panel
To: Linus Walleij <linus.walleij@linaro.org>
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
Cc: neil.armstrong@linaro.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
 sam@ravnborg.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

pet, 16. lip 2023. u 13:44 Linus Walleij <linus.walleij@linaro.org> napisao=
 je:
>
> On Fri, Jun 16, 2023 at 11:57=E2=80=AFAM Paulo Pavacic <pavacic.p@gmail.c=
om> wrote:
> > =C4=8Det, 15. lip 2023. u 21:55 Linus Walleij <linus.walleij@linaro.org=
> napisao je:
> > >
> > > I doubt that the display controller is actually by Fannal, but I gues=
s
> > > you tried to find out? We usually try to identify the underlying disp=
lay
> > > controller so the driver can be named after it and reused for more
> > > display panels.
> >
> > Yes, of course, the controller is ST7701S.
>
> Hm did you try to just refactor
> drivers/gpu/drm/panel/panel-sitronix-st7701.c
> to support your new panel?
>

Yes I have tried, but there are too many changes needed and I wasn't
sure whether I would be breaking compatibility with st7701 based
panels.

> One major reason would be that that driver knows what
> commands actually mean and have #defines for them.
>
> Yours,
> Linus Walleij

Best regards,
Paulo
