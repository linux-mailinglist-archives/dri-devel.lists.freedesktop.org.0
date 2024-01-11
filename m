Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 793DE82B123
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jan 2024 15:57:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AB2610E920;
	Thu, 11 Jan 2024 14:57:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com
 [IPv6:2607:f8b0:4864:20::1132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DCE310E6CD
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jan 2024 14:57:14 +0000 (UTC)
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-5f2aab1c0c5so49592637b3.0
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jan 2024 06:57:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704985033; x=1705589833; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=y4QJ/Zk/UxhefO+/Ds686chTEmns6pEsPp66wCH/Tr8=;
 b=yHpsTYRJg6cNVFY+DwG82gEbpbLLHrqVxUuQN8NAYFhLonYkytOjNJhp+dNXsxdzp+
 ZETNId+SwE8XEVAfQisKqXzagGZdbibmx8fFHhsa6D6VeHRFyVXkrnz3nYqMtoKOvnoi
 enOvfHmhp370Sqhq1diZ54pZIe4cw3VgwS4//HTcvE2iJEVkpZfG5CGRRkKJtKYhQFvM
 uinHKgnG2eGrSSlNYj2L5o4NB4Lsr1IdCFiAbrGAtO9qwTW2iuJs/vHHgy2NVvOZNnjE
 8Hz7yk9Gw/U+aikt8bi4sChYVHBfr8R23Mf6YYG4fY/akr9MkL9hE5lp89SvPxRunMMO
 iwiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704985033; x=1705589833;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=y4QJ/Zk/UxhefO+/Ds686chTEmns6pEsPp66wCH/Tr8=;
 b=Qs2oeF8OZ3nK00mxq5hWaaeWLe83cvszVfVTrgjI07ZwtlwQ6Gl/JMS+GYQ/snp9Xu
 ANshHHiIBppXxZbGY4x731XAD7vvnV3Xp/pAzOSrxaAURPxeCY2m5CNIiyC3z2uY+Cix
 kXVFx0f9cxgg11ia7+tYu9ut/kYTrGRjBj9DtgQRKAGx9TfUNCQX1I2b4w1zJtZYnWKu
 WxImDb0jv0fSIrBy8eaQBgQ770FYrrsaR4mU9E9sfEqO0SEqiSP+gbLu2tjWEZN1HCWZ
 jEmQg0QjX/hIuFBqrLDypzLl1px1IDGgxhhBsgWx7VurppwMJOG53KgcxflMidOVYd5C
 PCeA==
X-Gm-Message-State: AOJu0YxeuGiiLtk3IQp/C4nhZ3WAyuUTJOSUY8fZVB5jtMlQCK68GOvS
 Qq3O179NHunnF6ihTDeT2xhwfd/3Zruvj05XWghw4IXAMw+HLg==
X-Google-Smtp-Source: AGHT+IGlqFbVsocwq/Ya8t4EI0KodBoh1TFUMaOyVVs9af4K5210a84z1fodh56RrT3NSO1DP38JsInOPARS+62cxkU=
X-Received: by 2002:a81:aa11:0:b0:5e7:9454:6a2a with SMTP id
 i17-20020a81aa11000000b005e794546a2amr407663ywh.42.1704985032557; Thu, 11 Jan
 2024 06:57:12 -0800 (PST)
MIME-Version: 1.0
References: <20240110-fp4-panel-v2-0-8ad11174f65b@fairphone.com>
 <20240110-fp4-panel-v2-2-8ad11174f65b@fairphone.com>
In-Reply-To: <20240110-fp4-panel-v2-2-8ad11174f65b@fairphone.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 11 Jan 2024 15:57:01 +0100
Message-ID: <CACRpkdaWTfPDCin_L6pefHsokjNyO8Mo6hWPdzPLLi1EUkKUuA@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] drm/panel: Add driver for DJN HX83112A LCD panel
To: Luca Weiss <luca.weiss@fairphone.com>
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
 Conor Dooley <conor+dt@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
 Bjorn Andersson <andersson@kernel.org>, Andy Gross <agross@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Jessica Zhang <quic_jesszhan@quicinc.com>, phone-devel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 10, 2024 at 4:14=E2=80=AFPM Luca Weiss <luca.weiss@fairphone.co=
m> wrote:

> Add support for the 2340x1080 LCD DJN panel bundled with a HX83112A
> driver IC, as found on the Fairphone 4 smartphone.
>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>

This makes it sound like the Himax HX83112A is the driver IC.

This does not seem to be the case:
https://github.com/HimaxSoftware/HX83112_Android_Driver

The driver IC seems to be a truly 5p65.

If this is right, could you rename the driver file to truly-5p65.c
and all symbols containing hx83112 to truly_5965 or something
that indicate the driver IC instead of the panel?

My main concern is that the next display using the same IC
need to find the right file to patch.

Yours,
Linus Walleij
