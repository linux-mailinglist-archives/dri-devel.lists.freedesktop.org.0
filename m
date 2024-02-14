Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B7BD85455C
	for <lists+dri-devel@lfdr.de>; Wed, 14 Feb 2024 10:33:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5F2B10E6B2;
	Wed, 14 Feb 2024 09:33:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fairphone.com header.i=@fairphone.com header.b="k0UhwxFL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3089210E6B2
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Feb 2024 09:33:30 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id
 4fb4d7f45d1cf-5600d950442so6140256a12.1
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Feb 2024 01:33:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fairphone.com; s=fair; t=1707903208; x=1708508008; darn=lists.freedesktop.org;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=p1H+RbnkYc3zoaPoYaNe9aVZ44yhL+DMNkqp98qfzc4=;
 b=k0UhwxFLhLeIdGUnaWhJNhIwg8CeIQRtOtQDGFkXG9xiiVxfkfrai6KcY9iA20rNuS
 +K9t4aa1B3q1jBulFfS0bMfxyteb0Fn2ixA4pXk5eaXK/Gmc95OIlblgHxI64ue6XkNr
 ayxiL9b3W/oFBgguAN4PCRBln//wI+5NK+2KZgfvxAadneJchZnN7TGXs9OxPK6yC8B5
 5RTGRV08Da32gEzakIvNo9D9kN13LQht/fUALK6EkffwKL+e91kZ/rHfU2cbUqF807FD
 3rO6T6uFVOKWfnLQrId6JhZDRXIoS/4SqLvrr8fQkt9ZkyvBP3jp4vmj26nOXFG3T1FW
 i+YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707903208; x=1708508008;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=p1H+RbnkYc3zoaPoYaNe9aVZ44yhL+DMNkqp98qfzc4=;
 b=qOlrq6MOkh9aSJX0IW9oq2cbt8H1yvzdGYLBSIiHhaB6wWrbuk1LULIv7m1Q7r4Veg
 QJT3iUINRY8D5xw2gIDuQ+y/5akA1eGE6dV+q89HM6q0VpsTYPNcJ7b6YC4KHhgDA5DO
 BpaUvCxLmINs6Axnb9h64q13QdLRsXL6jla/rdsgvroJU97I+Ggm5hIQoaHCRTH1Xw/t
 Yo2dVtQALIt3PQQpHS24a/uI3o66sx/nf9rbZM7fkbPCcqvA9vwg9tJyHlGMRMMagetc
 rjBGquSjK8DYhUre5T1q5kSR8WMFLQHb8UH7sDWNSmOMo7kI1GNccrMmUj7KtF1OzD64
 NTyw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWYfSHtx7CWUFYyue6//ZMoOiICBp980iiwZtDJ1Ap1MJPRXxXyZfZX0bZo9/OpLOR4QyTvt/UI2PqM3i/TpGrSJyU3do0ySb/vHoBqyejb
X-Gm-Message-State: AOJu0YwkkqlMqCxQ6UKzVa5SnznbamUnDgkovy8ojoX52f+vkBAt6LL3
 uY0VVrwjmMoWoSonCT3TEr750vuoxbPIFL+df7EBwpY4YgleKk4ncLguqz1FZG4=
X-Google-Smtp-Source: AGHT+IE5RliiqJKbx9DWE91a06gP6Z6BpTtnEhp0spNaqevUBISwb6Co5h0JMWGdSNBnVoGj3hQ8Lg==
X-Received: by 2002:a05:6402:2034:b0:560:5e65:c0cc with SMTP id
 ay20-20020a056402203400b005605e65c0ccmr1809735edb.11.1707903208504; 
 Wed, 14 Feb 2024 01:33:28 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWqnResp9fHEq+XlncB3w71pHFrU5kun5X1hoiWzf5VrgsXxTYZhJunSapt4u/QPXHDwWFN14FhD/abHg6kkTvDR78EO8aMghQdqwEHuUSdQ4KcBszD5Pann374nViCOjyfID7BNfC2zQLsZrrgHhduf5HYVMvO4vOQCwDWwHX/hWdWU+A2dYgnGeSIbbp3Tlioz4ZyX8JB7Fy36L9L+cRdsp2CEvoe9v6oafXXc/l1I0gEcQxH7kLYY1fyzi0vdog3GCD8B2grIa7PmYUv75Zl4glfmRrwSVxqmZEv+NiZLeSjZqCLhZ4YR3fw4Uj+NdQY47rEdsDx1PIMtG7C87sosKe83Vb0CfpNegFtsbOiAwDeML5vrn17E9AXMJIytZveh/1KltxRC5FWnAqaxXTzfsb3rkklqr8yf3dej8n6r8o9XHHwc7CzSU0px72WCNJfDPTsYYVhBOhcBuzYOEGCLQHW8XTkdWplxy1SnrXahPbnBb6dN1+IMd7C+1TfFrVfhW3CSydBLZtezYnjPtroHv7dxGfkx36IF4HgNmuVweXZaJ1p7LH8txiwtIfjm1vEy9gayy9KGTKAO8dUVyJUDULpLf+A0W+beNI1cI3WOymFFGfMwXwEZED+OZ7nneg1/VTYqpei06LPNQPIm+60ldBwn5tS//RTG649ObIeeTIPzFTODRjtl1h4rXDyOe4EZ8dk26N3qWRPI5NsMMVeGR51gV/YVUR6ko4QUL/6735o
Received: from localhost (144-178-202-138.static.ef-service.nl.
 [144.178.202.138]) by smtp.gmail.com with ESMTPSA id
 fe9-20020a056402390900b00561ffe7adb2sm1155036edb.1.2024.02.14.01.33.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Feb 2024 01:33:27 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 14 Feb 2024 10:33:27 +0100
Message-Id: <CZ4P5PWJTODV.3UJ89H6M8W07H@fairphone.com>
Cc: "Jessica Zhang" <quic_jesszhan@quicinc.com>, "Sam Ravnborg"
 <sam@ravnborg.org>, "David Airlie" <airlied@gmail.com>, "Daniel Vetter"
 <daniel@ffwll.ch>, "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>,
 "Maxime Ripard" <mripard@kernel.org>, "Thomas Zimmermann"
 <tzimmermann@suse.de>, "Rob Herring" <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Bjorn Andersson" <andersson@kernel.org>, "Konrad
 Dybcio" <konrad.dybcio@linaro.org>, "Andy Gross" <agross@kernel.org>,
 <devicetree@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>
Subject: Re: [PATCH v2 2/4] drm/panel: Add driver for DJN HX83112A LCD panel
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Luca Weiss" <luca.weiss@fairphone.com>, <neil.armstrong@linaro.org>,
 "Linus Walleij" <linus.walleij@linaro.org>
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
 <CYL76M5KT424.G3BC6JX74XVN@fairphone.com>
In-Reply-To: <CYL76M5KT424.G3BC6JX74XVN@fairphone.com>
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

On Mon Jan 22, 2024 at 12:27 PM CET, Luca Weiss wrote:
> On Fri Jan 12, 2024 at 11:26 AM CET,  wrote:
> > On 12/01/2024 11:23, Linus Walleij wrote:
> > > On Fri, Jan 12, 2024 at 10:52=E2=80=AFAM Luca Weiss <luca.weiss@fairp=
hone.com> wrote:
> > >=20
> > >> Since there's zero indication Truly is involved in this panel in my
> > >> documentation - much less the number 5P65 - I'm not going to add tha=
t.
> >
> > Ack
> >
> > >=20
> > > OK then, I fold, thanks for looking into it.
> > > Keep the Himax hx83112a file name and symbols.
> > >=20
> > >> So in short this panel is the model 9A-3R063-1102B from DJN, which u=
ses
> > >> a Himax HX83112A driver IC.
> > >=20
> > > So compatible =3D "djn,9a-3r063-1102b" since the setup sequences for
> > > hx83112a are clearly for this one display?
> >
> > Yep let's settle on that!
>

Hi Neil and Linus,

Any feedback about the below question?

Regards
Luca

> It's clear to me to use "djn,9a-3r063-1102b" in the driver now but what
> about dts?
>
> Currently here in v2 we have this:
> compatible =3D "fairphone,fp4-hx83112a-djn", "himax,hx83112a";
>
> Should this just become this?
> compatible =3D "djn,9a-3r063-1102b";
>
> Or e.g. this?
> compatible =3D "djn,9a-3r063-1102b", "himax,hx83112a";
>
> Or something else completely? Do we have some documentation / best
> practises around this maybe?
>
> Regards
> Luca
>
> >
> > Thanks,
> > Neil
> >
> > >=20
> > > Yours,
> > > Linus Walleij

