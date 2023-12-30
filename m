Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B82E982048E
	for <lists+dri-devel@lfdr.de>; Sat, 30 Dec 2023 12:27:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94EDB10E02E;
	Sat, 30 Dec 2023 11:27:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com
 [IPv6:2607:f8b0:4864:20::1132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 462F910E02E
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Dec 2023 11:27:31 +0000 (UTC)
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-5cece20f006so66560647b3.3
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Dec 2023 03:27:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1703935650; x=1704540450;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BqmTg07L9Xjis/7k4DxCa7tRnJDtPkHV1RraDq6khcg=;
 b=F+lNbR7J+Qe2jjY5nP4TC+UuHmVRK3R+tabI+oIgzodt5kyqGwOUJ+M5NeiTYri7pY
 dOFr2dCGTmpyoLsk95OT/AR+qLW5Z71QZpgbpGOD1L9HVReks3WP4JnPHrXOyXC+RxaV
 TQH3lW3IfOZNR/fjhnftyiDs5ZfIw+mLWDVG0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703935650; x=1704540450;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BqmTg07L9Xjis/7k4DxCa7tRnJDtPkHV1RraDq6khcg=;
 b=SeWjHPyttsSD4iSJGmANpJ7ooUEBENyW4P6eYW6kRYSxU34qyfGKB+tu/ruEm/aoMB
 9iZNW5bj/7Ptqt6+uwq031Of+RyyytCQ1PlnGcil1xwuQ55CNRTvOC86wLgWYMpB949I
 PUFpp/WWgGWAClnLiPwdaMB++SamKFARvWvVySDNECQZflapFJUBHh6d7CnZg4lAzHkW
 cMTPjdSsc0hss/ypPtsYxHKAejgNAwHbaMnpE+sqf2YFwZ12JXVfnp9sdHNMiaTBno3Z
 A7G4R1n8G55hILReIOe3YgxIVfCPA8+Ewb42YGT8Kklm5D3uM0+aGwWDLvpuXnxnF2oa
 d9FQ==
X-Gm-Message-State: AOJu0YxThdp3+IjG88LW2A+MphVuNxY23ZpIIxNo1Z1AA/oevKmMiFfC
 xOC/gmm50+01NKL82e6w7+7iVmBp2ypRbNwYLNcL5X9Cb9uLZw==
X-Google-Smtp-Source: AGHT+IE1r0S0LAjVTcbxxyQYJGt6YexIbq2As4b4Kc1EgXx/p5ebd2qlHzqdVuAFQXXYksM4upWkuU9Jq0EgWSNg4pI=
X-Received: by 2002:a25:ada5:0:b0:dbc:ec6b:3e47 with SMTP id
 z37-20020a25ada5000000b00dbcec6b3e47mr7826906ybi.33.1703935650320; Sat, 30
 Dec 2023 03:27:30 -0800 (PST)
MIME-Version: 1.0
References: <20231229135154.675946-1-dario.binacchi@amarulasolutions.com>
 <20231229135154.675946-6-dario.binacchi@amarulasolutions.com>
 <CACRpkdbBBQ96qfdmNHrbOdV9hhFheyTwTkwATFZRPBRiRcN4tw@mail.gmail.com>
In-Reply-To: <CACRpkdbBBQ96qfdmNHrbOdV9hhFheyTwTkwATFZRPBRiRcN4tw@mail.gmail.com>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Sat, 30 Dec 2023 12:27:19 +0100
Message-ID: <CABGWkvrs+yqCC64Hugmp8jd-+Co7_oakYuMX36zpiFDJ5bvy=Q@mail.gmail.com>
Subject: Re: [PATCH 5/8] dt-bindings: nt35510: add compatible for FRIDA
 FRD400B25025-A-CTK
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, devicetree@vger.kernel.org,
 linux-amarula@amarulasolutions.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Rob Herring <robh+dt@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, David Airlie <airlied@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Linus,

On Fri, Dec 29, 2023 at 6:34=E2=80=AFPM Linus Walleij <linus.walleij@linaro=
.org> wrote:
>
> Hi Dario,
>
> thanks for your patch!
>
> On Fri, Dec 29, 2023 at 2:52=E2=80=AFPM Dario Binacchi
> <dario.binacchi@amarulasolutions.com> wrote:
>
> > The patch adds the FRIDA FRD400B25025-A-CTK panel, which belongs to the
> > Novatek NT35510-based panel family.
> >
> > Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> (...)
>
>
> > +    oneOf:
> > +      items:
> > +        - const: hydis,hva40wv1
> > +        - const: novatek,nt35510
> > +      items:
> > +        - const: frida,frd400b25025
> > +        - const: novatek,nt35510
>
> You need a dash in from of each "items:" for that to work.

Thanks for your help.

Regards
Dario

>
> Yours,
> Linus Walleij



--=20

Dario Binacchi

Senior Embedded Linux Developer

dario.binacchi@amarulasolutions.com

__________________________________


Amarula Solutions SRL

Via Le Canevare 30, 31100 Treviso, Veneto, IT

T. +39 042 243 5310
info@amarulasolutions.com

www.amarulasolutions.com
