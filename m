Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 290317DF2E6
	for <lists+dri-devel@lfdr.de>; Thu,  2 Nov 2023 13:53:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 484AC10E87C;
	Thu,  2 Nov 2023 12:53:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com
 [IPv6:2607:f8b0:4864:20::112e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C77210E871
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Nov 2023 12:53:13 +0000 (UTC)
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-5a90d6ab962so10904757b3.2
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Nov 2023 05:53:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698929592; x=1699534392; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dFoF+rUCSw1DXnPriHOXt0pQ5UV5P52GBE5q91mWyNs=;
 b=Le+py/Rlk4748kUVJhkkeYFtpWCAAzvJbWLpZfepb9Cm0CHrAERKW5ZlmaT2zfitQ0
 TfEq7EmVasbtCTnYUWkj9KwCEP0KdLEacHi2NwAUg4nayXUdwIZ74Ld+2qeO1pjw0yHa
 LCnc7w9FOYehpWRxt6DJq+tLq9JzyVP5bYkIn05NX5IKpTOthUuzj0pbUfvoSg54fd8C
 DYOGmeEV+VfHDWEeShzc8y+LzxNq6TZJv7I2H8VZQyXc/jFWgfcdoY9PU7Hc0Oow1QC5
 +XeOrICU8cJppu0MttA+xi+9Qs7368atWFWDzuF4eNrQiJ1soqBhbhDqu3rzxj2LAt7X
 JZMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698929592; x=1699534392;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dFoF+rUCSw1DXnPriHOXt0pQ5UV5P52GBE5q91mWyNs=;
 b=TKAk1ahyeuh3hIzHGWeLcSL6gS+RFzXs4Z2+NKt2/x9dx/H7pK7pezPvAV55g2+j6D
 iJcZnSCwRQCvppPYO5EeIJKvu+S5DSxqcKWHcbifIbId/UjxdCsJNwz7ftFBiaqZ2arb
 QtscVjHAebdHx19t7p3Avn95R2ueQoVOLzweHzy4FoiQzhvBOsMxMEPQYXr2mNinWcis
 abqXSozsHwRFN9m/cIds4K/kxMsjt36+qSmcqWUgdZSRNIEoRQ7eXuP7dSJ5k8UtfuRh
 q6UAde3Zqn2AvC5fYtNsBrDY9D/r3a7sY85ORgnCRU7MZOkWJ4/i+atQT0DJ0GPfX/Am
 Pdpw==
X-Gm-Message-State: AOJu0YyQpfODXo/RdK/G9ndezAaZLukVl76/CVASJ/xAVunmsAIocn2m
 PbN8e3hS+sLbjkuAAp5a0vGd9gfr9EZo/TJVT15qX6j0bhauGzWv6c4=
X-Google-Smtp-Source: AGHT+IHZZRwVG5o+29dUJLi0bz6XUWcThV/K14cb1kkY1dBok7Rk7sKIBa545LanZB5QGQUhrYgLko+YGz98LWpPfOE=
X-Received: by 2002:a05:690c:dcb:b0:5a7:ba53:6544 with SMTP id
 db11-20020a05690c0dcb00b005a7ba536544mr28560196ywb.12.1698929592437; Thu, 02
 Nov 2023 05:53:12 -0700 (PDT)
MIME-Version: 1.0
References: <20231030072337.2341539-2-contact@jookia.org>
 <20231030072337.2341539-4-contact@jookia.org>
In-Reply-To: <20231030072337.2341539-4-contact@jookia.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 2 Nov 2023 13:53:00 +0100
Message-ID: <CACRpkdbfox8J=dKbuFf4d_DsmdEZgN3+=z8BYxo4MwW7dGeeYA@mail.gmail.com>
Subject: Re: [RFC PATCH v4 2/7] drm/panel: nv3052c: Add SPI device IDs
To: John Watts <contact@jookia.org>
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
 Conor Dooley <conor+dt@kernel.org>, Chris Morgan <macromorgan@hotmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Jagan Teki <jagan@edgeble.ai>, Paul Cercueil <paul@crapouillou.net>,
 Rob Herring <robh+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Christophe Branchereau <cbranchereau@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Oct 30, 2023 at 8:24=E2=80=AFAM John Watts <contact@jookia.org> wro=
te:

> SPI drivers needs their own list of compatible device IDs in order
> for automatic module loading to work. Add those for this driver.
>
> Signed-off-by: John Watts <contact@jookia.org>
> Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
