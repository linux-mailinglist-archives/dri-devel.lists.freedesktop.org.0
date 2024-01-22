Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E72F1836185
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jan 2024 12:29:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8590B10EDBD;
	Mon, 22 Jan 2024 11:28:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 815EB10EDBD
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jan 2024 11:28:40 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id
 a640c23a62f3a-a2f0cb62068so305250766b.2
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jan 2024 03:28:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fairphone.com; s=fair; t=1705922859; x=1706527659; darn=lists.freedesktop.org;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WIgV/QMkOZJ0bf7IGnZFc3jEnAkXvM5i+7Bl0Lz57H0=;
 b=UeAcewznsmVWHLjte4JctbHdW8V1EcY1SgWPHGpAW5hOyur6PqvNgmi+1lHuCNmdOX
 hR8sxo341WpfpwAEPPquOL1NrHVh9eCfS0IpXprm7ensYY3XJRwy/OpodY2++B6DGkaA
 +TfgLQt9I9mcHzIcMyDvZHO4vFy6deZ+xbItryZuMUzaK+Idci5JQR9NeqS3cTDp0Wg5
 MjJMOofiLH82BhNShpXo9ug2Nx6AvGHS7uMfxLqgXhachv1J3DWmU47R7io4KqOzmMuE
 bFmKcA9MkG22ApxsbOVXnbH/XdVSVNgn2o4SHESL/A0vMzZ91o3sy/YJaI/S2OQilYhQ
 44TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705922859; x=1706527659;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=WIgV/QMkOZJ0bf7IGnZFc3jEnAkXvM5i+7Bl0Lz57H0=;
 b=ICWOi15URXANPl61gmC+kMYOuOn5nk6AHvOcTmZJgJ/E36t+/U//TdrGP1BYh6LyGy
 sHFxQvWwdrQrbxM5D6MMeN+OThyfAbvW2r5+mfcCPcRlqIQE36AkSlUpReFiHcgVfxV8
 uKtt4qzjihfjE0XapBnOnqw9h3yoGxC/h9j9STtsKFfu8nr5ral2STORVMRJOmR2wJ5/
 76oOnQoF/s1CscMntB428OfnS5b7fqtKKidxI7LeOW3TKLFNmt+tg/GVEEU5M4bhFD3R
 GcqB3dbadNiQNmuAMlaqx5OsPnjXmC8eVij3p7Tsh5HcuqOPEakqZ8woH+7wWpMfOdQY
 Chlw==
X-Gm-Message-State: AOJu0Yw5EVg2MRSC+MuGdxhIMAn35FA/ObTKjQTabMwswmFbLqTHJgqF
 rsLb1xujVlXdoakbSx71iic3y4VAtr18ryGB9b/I9ouoJfBmWcuqo1+EGN73lTw=
X-Google-Smtp-Source: AGHT+IFNlq6X29oAt8M85jJiLwH2VUAOWjj165S6OihyHQSXyUfaN5CoDfj1ih9bZ1mSWEGWyb48sg==
X-Received: by 2002:a17:906:6c85:b0:a2a:35fd:d48b with SMTP id
 s5-20020a1709066c8500b00a2a35fdd48bmr1037397ejr.266.1705922859113; 
 Mon, 22 Jan 2024 03:27:39 -0800 (PST)
Received: from localhost (144-178-202-138.static.ef-service.nl.
 [144.178.202.138]) by smtp.gmail.com with ESMTPSA id
 d14-20020a170906c20e00b00a298e2f6b3csm13247972ejz.213.2024.01.22.03.27.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Jan 2024 03:27:38 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 22 Jan 2024 12:27:38 +0100
Message-Id: <CYL76M5KT424.G3BC6JX74XVN@fairphone.com>
Subject: Re: [PATCH v2 2/4] drm/panel: Add driver for DJN HX83112A LCD panel
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: <neil.armstrong@linaro.org>, "Linus Walleij" <linus.walleij@linaro.org>
X-Mailer: aerc 0.15.2
References: <20240110-fp4-panel-v2-0-8ad11174f65b@fairphone.com>
 <20240110-fp4-panel-v2-2-8ad11174f65b@fairphone.com>
 <CACRpkdaWTfPDCin_L6pefHsokjNyO8Mo6hWPdzPLLi1EUkKUuA@mail.gmail.com>
 <CYBZEZ4IM6IL.VR04W7933VI@fairphone.com>
 <CACRpkdZQbVXfBa70nhDOqfWPbsh-6DgX-uvZOxr19pzMmF2giQ@mail.gmail.com>
 <CYCLSCKPPBOC.1B1MP3VOOC0Q8@fairphone.com>
 <cdc18e2a-b7eb-4b54-a513-481148fb3b0d@linaro.org>
 <CYCMVXHYVDCI.HVH1TR8MWEUK@fairphone.com>
 <CACRpkdacS9ojXUuogygkz6xxCf3mMq6GG_75sze8ukUu=rxVyw@mail.gmail.com>
 <f99d363c-d4a6-44b3-8057-3925f8dac1d5@linaro.org>
In-Reply-To: <f99d363c-d4a6-44b3-8057-3925f8dac1d5@linaro.org>
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Sam Ravnborg <sam@ravnborg.org>,
 Bjorn Andersson <andersson@kernel.org>, Andy Gross <agross@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, linux-kernel@vger.kernel.org, Konrad
 Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, Jessica Zhang <quic_jesszhan@quicinc.com>,
 phone-devel@vger.kernel.org, David Airlie <airlied@gmail.com>,
 ~postmarketos/upstreaming@lists.sr.ht
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri Jan 12, 2024 at 11:26 AM CET,  wrote:
> On 12/01/2024 11:23, Linus Walleij wrote:
> > On Fri, Jan 12, 2024 at 10:52=E2=80=AFAM Luca Weiss <luca.weiss@fairpho=
ne.com> wrote:
> >=20
> >> Since there's zero indication Truly is involved in this panel in my
> >> documentation - much less the number 5P65 - I'm not going to add that.
>
> Ack
>
> >=20
> > OK then, I fold, thanks for looking into it.
> > Keep the Himax hx83112a file name and symbols.
> >=20
> >> So in short this panel is the model 9A-3R063-1102B from DJN, which use=
s
> >> a Himax HX83112A driver IC.
> >=20
> > So compatible =3D "djn,9a-3r063-1102b" since the setup sequences for
> > hx83112a are clearly for this one display?
>
> Yep let's settle on that!

It's clear to me to use "djn,9a-3r063-1102b" in the driver now but what
about dts?

Currently here in v2 we have this:
compatible =3D "fairphone,fp4-hx83112a-djn", "himax,hx83112a";

Should this just become this?
compatible =3D "djn,9a-3r063-1102b";

Or e.g. this?
compatible =3D "djn,9a-3r063-1102b", "himax,hx83112a";

Or something else completely? Do we have some documentation / best
practises around this maybe?

Regards
Luca

>
> Thanks,
> Neil
>
> >=20
> > Yours,
> > Linus Walleij

