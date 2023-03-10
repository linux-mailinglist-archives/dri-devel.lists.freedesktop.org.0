Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCF2D6B54C6
	for <lists+dri-devel@lfdr.de>; Fri, 10 Mar 2023 23:51:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4D5410E013;
	Fri, 10 Mar 2023 22:51:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com
 [IPv6:2607:f8b0:4864:20::1134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8842310E013
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Mar 2023 22:51:09 +0000 (UTC)
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-536bf92b55cso125762717b3.12
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Mar 2023 14:51:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678488668;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5LQ2HzZ5/bi/kOKo7NEBlYoMYy0KUYQz8z6lYvJaO88=;
 b=CsRc5Yj4v6oMwTHZDXSBIJu1WUd+WKnNbbnBRzECCKZQKqAeYyk3g2skIyqllyml9N
 YkuB1zIVR4Gz09ofgcAlgItEpzD2ZN3zrZZc7yQDar9fCWLsETqJzHdA++8HZbrRUGIB
 a8WLKRX6xoN+4ZGFFJKJYeERlLfRbze0ycq2elEM1zAfUoNmLjjMQf2hxremPynCPFxg
 hoIlggBNAGgThOr1cX9poKYS0U9KhEqkA54OWmkqxtTU031rj5Q2CNrhAmArdrUbC7Ze
 5B90KoNaRJHfbtbuEAW+CvZriQxfb/bCQYgh72mBblBbL39CthVhQBJKMdIBJj8aurqr
 IFpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678488668;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5LQ2HzZ5/bi/kOKo7NEBlYoMYy0KUYQz8z6lYvJaO88=;
 b=qvD0dmUXxxvqaxKMsSQ6pAmB7stAoIm62tOxmyHYlV5jXtPDSXC8Dr1DhLIn5NSdaW
 FA8npvpe3VjCcyWSPV6bCpNax3VUuK/jnsibyTBbcQ8ktH4N5LeuM5/VZiJZ8SVkWqti
 1hdetcn9W66G8JmG4y5njPvTTJeMfjjsUbCP9ywWFxLTUDJ+AyoyktCASUwaftN7SZzb
 ek4gxrXsXHoYq7YgOzOhioe1pZeMSqeqxMwaTHVGeBfomYRYh//Qi5ahWRLqC8AylXiN
 8h+frMl+v5vwRTGjYYR95GyFmmnJoYpllbHMWrUWkQrja82dfmtWiFXmE9Cz7aIOuQGY
 H3uw==
X-Gm-Message-State: AO0yUKXAYCyqgV/32e8tERwQ/QwEYQVJ5NliclxWzcRFOaway//mlXRw
 vU/idzNfOgV8i3hSrCsmgZNs2u+bzig2htxmKI9u3Q==
X-Google-Smtp-Source: AK7set9Vgsn5Grv4otQPAm23jXoXW/OhNMlrjQMLAs7IGnb7QimXeWnLl/d1v7+vmSUynvjW6CwEXRyAR13UOuRdqy0=
X-Received: by 2002:a81:ad1e:0:b0:540:7a8d:2ae8 with SMTP id
 l30-20020a81ad1e000000b005407a8d2ae8mr944258ywh.10.1678488668485; Fri, 10 Mar
 2023 14:51:08 -0800 (PST)
MIME-Version: 1.0
References: <20230310132144.2241-1-lujianhua000@gmail.com>
 <20230310132144.2241-2-lujianhua000@gmail.com>
 <6539f132-c740-b9b6-8810-0affd6ab91ba@linaro.org> <ZAt4fTNEnyLteaas@Gentoo>
In-Reply-To: <ZAt4fTNEnyLteaas@Gentoo>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 10 Mar 2023 23:50:57 +0100
Message-ID: <CACRpkdavjBPaNq1sRfi-FYiT7T3W19fU-mjha0pAtooUyf-8XQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] drm/panel: Add driver for Novatek NT36523
To: Jianhua Lu <lujianhua000@gmail.com>
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
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 10, 2023 at 7:35=E2=80=AFPM Jianhua Lu <lujianhua000@gmail.com>=
 wrote:
> On Fri, Mar 10, 2023 at 07:10:21PM +0100, Konrad Dybcio wrote:
> >
> > > +#define mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, cmd, seq...)        =
\
> > > +           do {                                                 \
> > > +                   mipi_dsi_dcs_write_seq(dsi0, cmd, seq);      \
> > > +                   mipi_dsi_dcs_write_seq(dsi1, cmd, seq);      \
> > > +           } while (0)
> > This should be in the same file as mipi_dsi_dcs_write_seq, imo
> I have sent a patch to do it, upstream don't think this wrapper is a prop=
er
> approach to deal with dual dsi and wrap all of mipi_dsi_* function is
> useless.
> https://lore.kernel.org/lkml/20230310110542.6649-1-lujianhua000@gmail.com=
/

We can keep it locally if the fight isn't worthwhile, but I will try to ent=
er
the discussion.

Yours,
Linus Walleij
