Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7418C937B6C
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jul 2024 19:07:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 150AF10EC6A;
	Fri, 19 Jul 2024 17:07:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="IvRfVW5U";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com
 [209.85.160.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEA3E10EC6A
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jul 2024 17:07:46 +0000 (UTC)
Received: by mail-qt1-f177.google.com with SMTP id
 d75a77b69052e-44f5df38e64so9715621cf.3
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jul 2024 10:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1721408864; x=1722013664;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aWJBW7qSepD09tUcrnlrHVc592+V670R8bG1ncdQIrM=;
 b=IvRfVW5U/IaXqyp33eZqJPBZBe7HHfpYqFpTNtZWuOIMShork//6HTyK/4tG4/Vl5h
 0osf/ceawcgNGj812rKnjspQYI7yDP6mUIXnGC7zY79+xtFPNBXsU6hgDzsQBjOpLiy2
 3zBalYkeMLYB4RVM8MKqXREy177V/+KKQGcgY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721408864; x=1722013664;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aWJBW7qSepD09tUcrnlrHVc592+V670R8bG1ncdQIrM=;
 b=HUZRrEAai0Ghs6D/YjKPgkIXqBHcnOQK81HtD44/LR9pwLo+WAh4XwYGluI/0qlPHN
 WC1STlBQ4+XK6ZGMdBX83s6fACNbKq6ujqD5OT5sEx4pW6aWiOrqI41su3NsKvxekvql
 hRsQSW1kbRJkKrZ+8kxdiecRfqmqnq0NLdq6Hg+o3LweYWSy73GR3iOcoPv27Wb6hBRV
 7fxjxS5tXN9xuRu0j8PPj2qJdz3gt0uYZDuQF/5DCbqGxUAGM8UM5q+fXKsLMSnvzkul
 kHca6bTpSlLjqocJ9aDDzOl5Gdr2IFY//qh1hVedLe9TtOrAlLzmaL02v5KWa/eHNRNg
 Juvg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWVzRZJKCtpcQlsaUoe9D1Trgp+rd00oqgTTtnbgSovmFzHPjT5jr7yvHRivX7dCmoYYefi6CydSHrn0pvRbGgwy6fz5/yz8DIOVTFgv7DA
X-Gm-Message-State: AOJu0YweCXR6I0+YcEnbIGnDugu5nOHoKsytbcBfx2rpNp7aAq8gtCzm
 VWY6k2B00A+ZrY3NkwQ3D1MYPveSfsrbyQBlqhyoZ3BXRsiqUVOYDhO84LtT+yrWbQMV4aA6gHQ
 =
X-Google-Smtp-Source: AGHT+IGJBIu0jUVa7r/2jHQj3u+kEFgPLskx0Q96NAoe+CxvJXImHBgyWXKedIdbgQx2TAV/aKr3qg==
X-Received: by 2002:a05:622a:3cd:b0:447:f62f:d146 with SMTP id
 d75a77b69052e-44fa5279038mr5451001cf.20.1721408863823; 
 Fri, 19 Jul 2024 10:07:43 -0700 (PDT)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com.
 [209.85.160.182]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-44f9cda9e9esm9567431cf.59.2024.07.19.10.07.42
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Jul 2024 10:07:42 -0700 (PDT)
Received: by mail-qt1-f182.google.com with SMTP id
 d75a77b69052e-447df43324fso310461cf.1
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jul 2024 10:07:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWoUy3h20D0ZmRvNO6WeS5peB1h3lUN3mU2I01vfoZq6pTaCLGWx373T+6Bf4RRa/MMPLKwD3UXbpVM2DSKijOGYj+iqY5vFdbJeBtfRSDD
X-Received: by 2002:a05:622a:191d:b0:447:e0e1:2a7b with SMTP id
 d75a77b69052e-44f9c83d5d8mr2695131cf.23.1721408861491; Fri, 19 Jul 2024
 10:07:41 -0700 (PDT)
MIME-Version: 1.0
References: <20240715-x1e80100-crd-backlight-v2-0-31b7f2f658a3@linaro.org>
 <20240715-x1e80100-crd-backlight-v2-1-31b7f2f658a3@linaro.org>
 <20240715-scorn-canning-a7f23b9e2039@spud>
 <CAD=FV=U-nOMu-JDQ3T=ZRJ-rZ0BTtyzFVfnzbtCJdbRzAq3YMg@mail.gmail.com>
 <e017259b-bc62-4b57-9276-b834237225e1@kernel.org>
 <CAD=FV=VY5Ug3TfUo1RctiVQrHUjuod15HA8BxAyWdd_0bK8_Dw@mail.gmail.com>
 <20240718-frightful-naturist-a049ea7c0548@spud>
 <CAD=FV=VaGXMf6Srix6v=Me35BUN4B6ZHwebycka4Dbavqa5Vbw@mail.gmail.com>
In-Reply-To: <CAD=FV=VaGXMf6Srix6v=Me35BUN4B6ZHwebycka4Dbavqa5Vbw@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 19 Jul 2024 10:07:29 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WyDF8LkPeHXTgsyDA74n+AjuHPQ1896ECDE17aYB9rtg@mail.gmail.com>
Message-ID: <CAD=FV=WyDF8LkPeHXTgsyDA74n+AjuHPQ1896ECDE17aYB9rtg@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: display: panel: samsung,atna33xc20:
 Document ATNA45AF01
To: Conor Dooley <conor@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
 Stephan Gerhold <stephan.gerhold@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Abel Vesa <abel.vesa@linaro.org>, Johan Hovold <johan@kernel.org>
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

On Thu, Jul 18, 2024 at 7:59=E2=80=AFAM Doug Anderson <dianders@chromium.or=
g> wrote:
>
> Hi,
>
> On Thu, Jul 18, 2024 at 7:56=E2=80=AFAM Conor Dooley <conor@kernel.org> w=
rote:
> >
> > On Thu, Jul 18, 2024 at 07:45:57AM -0700, Doug Anderson wrote:
> > > Hi,
> > >
> > > On Wed, Jul 17, 2024 at 11:19=E2=80=AFPM Krzysztof Kozlowski <krzk@ke=
rnel.org> wrote:
> > > >
> > > > On 18/07/2024 02:21, Doug Anderson wrote:
> > > > > Conor (and/or) Krzysztof and Rob,
> > > > >
> > > > > On Mon, Jul 15, 2024 at 8:31=E2=80=AFAM Conor Dooley <conor@kerne=
l.org> wrote:
> > > > >>
> > > > >> On Mon, Jul 15, 2024 at 02:15:37PM +0200, Stephan Gerhold wrote:
> > > > >>> The Samsung ATNA45AF01 panel is an AMOLED eDP panel that has ba=
cklight
> > > > >>> control over the DP AUX channel. While it works almost correctl=
y with the
> > > > >>> generic "edp-panel" compatible, the backlight needs special han=
dling to
> > > > >>> work correctly. It is similar to the existing ATNA33XC20 panel,=
 just with
> > > > >>> a larger resolution and size.
> > > > >>>
> > > > >>> Add a new "samsung,atna45af01" compatible to describe this pane=
l in the DT.
> > > > >>> Use the existing "samsung,atna33xc20" as fallback compatible si=
nce existing
> > > > >>> drivers should work as-is, given that resolution and size are d=
iscoverable
> > > > >>> through the eDP link.
> > > > >>>
> > > > >>> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> > > > >>
> > > > >> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> > > > >
> > > > > Can you comment on whether you would consider this bindings a "Fi=
x"
> > > > > since it's a dependency for later patches in this series (which a=
re
> > > > > "Fix"es) to pass dtbs_check? See:
> > > > >
> > > > > https://lore.kernel.org/r/4bca316a-2334-425b-87a6-e1bb241d26b5@li=
naro.org
> > > >
> > > > The patch itself is not a fix, for sure, but it might be a dependen=
cy of
> > > > a fix (which you wrote above), thus could be pulled to stable as a
> > > > dependency.
> > > >
> > > > I do not care about dtbs_check warnings in stable kernels, mostly
> > > > because dtbs_check warnings depend heavily on dtschema and dtschema
> > > > follows mainline kernel. Basically if you had warnings-free v6.8 bu=
t try
> > > > to run dtbs_check now with latest dtschema, your results will diffe=
r.
> > > >
> > > > At some point in the future, I could imagine "no new dtbs_check war=
nings
> > > > in stable kernels" requirement or at least preference, but so far I
> > > > don't think there is any benefit.
> > >
> > > In this case it's not about whether it makes it to the stable kernel
> > > but about which main kernel it goes through.
> > >
> > > If we land the bindings in drm-misc-next right now then it'll be a
> > > long time before it makes it into Linus's tree because of the way tha=
t
> > > drm-misc-next merges. It will make it to Linus's tree at 6.12. You ca=
n
> > > see the drm-misc merging strategy at:
> > >
> > > https://drm.pages.freedesktop.org/maintainer-tools/drm-misc.html
> > >
> > > If we land the dts change (a fix) through the Qualcomm tree as a fix
> > > then it should target 6.11.
> > >
> > > This means that the 6.11 tree will have a dtbs_check error because it
> > > has the dts change (a fix) but not the bindings change (not a fix).
> > >
> > > One way to resolve this would be to treat this bindings as a "fix" an=
d
> > > land it through "drm-misc-fixes". That would make the bindings and
> > > device tree change meet up in Linux 6.11.
> > >
> > > Did I get that all correct?
> >
> > Is not not fairly established that a dependency for a fix can go onto a
> > fixes branch even if it is not a fix in and of itself?
>
> That would certainly be my take on it, but DT folks confirmation was
> requested by Neil in:
>
> https://lore.kernel.org/all/4bca316a-2334-425b-87a6-e1bb241d26b5@linaro.o=
rg/

FWIW, I'd rather not let this stagnate too long. I'm fairly confident
in my assertion that this should go into drm-misc-fixes. I'll give it
until Monday and then I'm just going to land this bindings change in
drm-misc-fixes. Shout soon if you feel strongly that I shouldn't do
this. If someone wants to flame me after the fact then so be it.

-Doug
