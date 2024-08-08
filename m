Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54E1894C422
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2024 20:14:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 122FA10E04F;
	Thu,  8 Aug 2024 18:14:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="r3Kp+QKc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F372B10E04F
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Aug 2024 18:14:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9DC9F61569
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Aug 2024 18:14:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45DFDC4AF0E
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Aug 2024 18:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1723140884;
 bh=ibFfVd+cZefkmTwM6d8twhJsesdnyTlqQkfxlzP3LP4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=r3Kp+QKc7YjOUcWlUM3Eji75cTqOSlqwxIl4/6eSAQq/tdrNgbJciLBOreTXacKk5
 b5pFz71IbIK2ER6XsLox74hC88aJqd92nhu0MvQtVmB9cKM138e4BpK404i5NmHb2G
 Md8SMHYEK1iqLo6Eujx8OS3w4UXD2iqU8DR2D/tU6d81crRInDi2eZTo4Xj16MyNzN
 O7/4t+WQSTI+uzRYBAN9Mh6qFWdYtD6gN/moyYttCw6ThIgS7aNzWR0ilXPl4n2aHl
 +qudIImKGyjVbKUg0cOAOpiz4lm94wGG59glLGyMKJ/auTFwlVnv3AQJ9LZRjlXRo4
 Gx8/OaA1t0xjg==
Received: by mail-yb1-f176.google.com with SMTP id
 3f1490d57ef6-e0bf677e0feso1239313276.1
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Aug 2024 11:14:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCX1u7Oaai/HYo+5tMCUJONF6mQedk+465pIL9aQytkKYYb/qcV9/UQgWpOzPJ6iC+joqCH6Ef+vNPmYkLhm7xvhRdwxKVGmE2r3RAIung8q
X-Gm-Message-State: AOJu0YyOwGIdidPXrwSvw1hnAz1ah4OTlXXv5VzlnQqwms2PJB982YzB
 NI7+eQ0QyyJFskeAti76Jv0D1Sw03XKct0+IIuHK4+QHklY6mCTkY+UAjKWx3p6BdTIiqxEoc4g
 MksQnPTWqdBcKIc5nY4pnAgyrqQ==
X-Google-Smtp-Source: AGHT+IEHW63m/reJ+5nk0ZLtwsUSOqEHxAlcDSSSrv0YDnAxKdzHmdeUKgZ63tGttz01GnWGZofD6wAr6VBKgFt26e0=
X-Received: by 2002:a05:6902:2190:b0:e0b:bf20:4fed with SMTP id
 3f1490d57ef6-e0e9dab0676mr2973207276.24.1723140883504; Thu, 08 Aug 2024
 11:14:43 -0700 (PDT)
MIME-Version: 1.0
References: <20240729205726.7923-1-robdclark@gmail.com>
 <CAD=FV=Wo2nVzn6qvwSAFAnrFX4wtv6_ZCVZaL1K_DBBFg9DJ=w@mail.gmail.com>
 <CAD=FV=XMJ7b=2tt6_2oTGFXuL8XcmBxuDtQBoWdf_65YyS49XA@mail.gmail.com>
In-Reply-To: <CAD=FV=XMJ7b=2tt6_2oTGFXuL8XcmBxuDtQBoWdf_65YyS49XA@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Thu, 8 Aug 2024 12:14:30 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLRTgQRPcfXy4G9hLoHMd-Uax4_C90BV_OZn4mK+-82kw@mail.gmail.com>
Message-ID: <CAL_JsqLRTgQRPcfXy4G9hLoHMd-Uax4_C90BV_OZn4mK+-82kw@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: display: panel: samsung,atna45dc02:
 Document ATNA45DC02
To: Doug Anderson <dianders@chromium.org>, Rob Clark <robdclark@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, 
 Stephan Gerhold <stephan.gerhold@linaro.org>, Abel Vesa <abel.vesa@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Rob Clark <robdclark@chromium.org>, 
 Conor Dooley <conor.dooley@microchip.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
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

On Tue, Aug 6, 2024 at 11:52=E2=80=AFAM Doug Anderson <dianders@chromium.or=
g> wrote:
>
> Hi,
>
> On Wed, Jul 31, 2024 at 4:39=E2=80=AFPM Doug Anderson <dianders@chromium.=
org> wrote:
> >
> > Hi,
> >
> > On Mon, Jul 29, 2024 at 1:57=E2=80=AFPM Rob Clark <robdclark@gmail.com>=
 wrote:
> > >
> > > From: Rob Clark <robdclark@chromium.org>
> > >
> > > The Samsung ATNA45DC02 panel is an AMOLED eDP panel, similar to the
> > > existing ATNA45AF01 and ATNA33XC20 panel but with a higher resolution=
.
> > >
> > > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> > > ---
> > >  .../bindings/display/panel/samsung,atna33xc20.yaml       | 9 ++++++-=
--
> > >  1 file changed, 6 insertions(+), 3 deletions(-)
> >
> > Reviewed-by: Douglas Anderson <dianders@chromium.org>
> >
> > I'll plan to land this in drm-misc-fixes next week unless someone
> > objects. "fixes" instead of "next" for the same reasons discussed
> > previously [1] that the dts patch should probably be considered a fix
> > and there's a chance that the dts patch could land in an earlier
> > version of mainline than the bindings unless we consider the bindings
> > a fix.
> >
> > [1] https://patchwork.freedesktop.org/patch/msgid/20240715-x1e80100-crd=
-backlight-v2-1-31b7f2f658a3@linaro.org
>
> Landed in drm-misc-fixes.
>
> [1/2] dt-bindings: display: panel: samsung,atna45dc02: Document ATNA45DC0=
2
>       commit: 1c4a057d01f4432704c4dc8842b6e888a91d95df

And now warning in linux-next:

./Documentation/devicetree/bindings/display/panel/samsung,atna33xc20.yaml:2=
1:9:
[warning] wrong indentation: expected 10 but found 8 (indentation)
./Documentation/devicetree/bindings/display/panel/samsung,atna33xc20.yaml:2=
3:11:
[warning] wrong indentation: expected 12 but found 10 (indentation)

Please send a fix.


Rob
