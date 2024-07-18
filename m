Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DACD2934F83
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jul 2024 16:59:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A176910E96F;
	Thu, 18 Jul 2024 14:59:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="M+9ozG4Z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com
 [209.85.128.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2A2510E96F
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2024 14:59:50 +0000 (UTC)
Received: by mail-yw1-f169.google.com with SMTP id
 00721157ae682-65f9708c50dso8430427b3.2
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2024 07:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1721314786; x=1721919586;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=e3SitwwNRxOezNxrVf7ltI49ObqvXDJq0gyT1yrldMw=;
 b=M+9ozG4ZBPl3rhM4MXvDw5/VOvwohhGVCEWW30FYVB5ZKqPQdDAzXZFiCaEgqcr3eH
 Djr3s9K3YSSa4jmG4damslsSGYk+quG6I8/tkOL5TU+E413LDRugm372l36fPutj3rmy
 17UrvR28Sp1LBegufU6mrobjgb+HPHyuxo5+U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721314786; x=1721919586;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=e3SitwwNRxOezNxrVf7ltI49ObqvXDJq0gyT1yrldMw=;
 b=kCm1CK0Au03uTdVyY+nnhE2dDAl+0t7KAkpA4SLsGzWvNe0mHLq++urkdT3VAgHsVV
 hexpQ8hXxBPnp4EoAtpPCBUOQgTZh4LcAwgJmg6cBkKgahofO1uNd7XZYOQaRKx2SDox
 011Gf5gCIxxG2Rhb7Esml0P+zpzmvu+ZtEpi7FREgn/rYJ59PftqwYDu5ty8pnFs4cql
 CKBiYImbvuM6JK8eG2griL7Uq0LAfeVnOE1jkGWkTloV2iY/mx966VIwej/xyKF2JPrw
 VUc/JmrCOrSAwT3hZdyM6uwMGwkvfYhFb/Cw2wVPcT1IHtnjdRUSn8bLGjbvWXrNsDyR
 twrA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUZbwcUVtA7OSOCm6iQrvkR2SCBQZtT6nt8EiAFlRBQqQjug/dhnpvDRrvD8SWhIRJ8LEWmmZepjqAu82vB9GKSW3nY0izfSWyTq+wNcaKl
X-Gm-Message-State: AOJu0YypJL1s6OFrg250VIw783jX6WNyT5l8RcM8d3pjnAvmW/ySPENa
 /duJcNEpwdNwBKkLg5hGDpiPsbPw7GPmnl7v79oNfDpIizgamggkezXQVo9bX91eLqEG07dmRB8
 =
X-Google-Smtp-Source: AGHT+IFl2RlFhcbUTO2Uf6QqV+dVi4AUwUo4hZfCHl+ldlnTYzPS32Nl710bVDXp2kR0zjpTR+AZNw==
X-Received: by 2002:a05:6902:c03:b0:e03:d808:d0c0 with SMTP id
 3f1490d57ef6-e05ed6e45d8mr6467063276.14.1721314785963; 
 Thu, 18 Jul 2024 07:59:45 -0700 (PDT)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com.
 [209.85.160.176]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6b79c675536sm8732506d6.138.2024.07.18.07.59.44
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Jul 2024 07:59:45 -0700 (PDT)
Received: by mail-qt1-f176.google.com with SMTP id
 d75a77b69052e-447df43324fso135371cf.1
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2024 07:59:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWcFcOB7Qrl94KEdKEL1F6mpUJeJrjZZJnlNAoTPwX0+mi19IFRMhuPe71bNHp2t+fBkr6D1Xy02IlDmTFTNfeOFPpo/Xg328XqwqS55Mpf
X-Received: by 2002:a05:622a:1f88:b0:447:e423:a463 with SMTP id
 d75a77b69052e-44f969881c0mr1553511cf.3.1721314784304; Thu, 18 Jul 2024
 07:59:44 -0700 (PDT)
MIME-Version: 1.0
References: <20240715-x1e80100-crd-backlight-v2-0-31b7f2f658a3@linaro.org>
 <20240715-x1e80100-crd-backlight-v2-1-31b7f2f658a3@linaro.org>
 <20240715-scorn-canning-a7f23b9e2039@spud>
 <CAD=FV=U-nOMu-JDQ3T=ZRJ-rZ0BTtyzFVfnzbtCJdbRzAq3YMg@mail.gmail.com>
 <e017259b-bc62-4b57-9276-b834237225e1@kernel.org>
 <CAD=FV=VY5Ug3TfUo1RctiVQrHUjuod15HA8BxAyWdd_0bK8_Dw@mail.gmail.com>
 <20240718-frightful-naturist-a049ea7c0548@spud>
In-Reply-To: <20240718-frightful-naturist-a049ea7c0548@spud>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 18 Jul 2024 07:59:32 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VaGXMf6Srix6v=Me35BUN4B6ZHwebycka4Dbavqa5Vbw@mail.gmail.com>
Message-ID: <CAD=FV=VaGXMf6Srix6v=Me35BUN4B6ZHwebycka4Dbavqa5Vbw@mail.gmail.com>
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

On Thu, Jul 18, 2024 at 7:56=E2=80=AFAM Conor Dooley <conor@kernel.org> wro=
te:
>
> On Thu, Jul 18, 2024 at 07:45:57AM -0700, Doug Anderson wrote:
> > Hi,
> >
> > On Wed, Jul 17, 2024 at 11:19=E2=80=AFPM Krzysztof Kozlowski <krzk@kern=
el.org> wrote:
> > >
> > > On 18/07/2024 02:21, Doug Anderson wrote:
> > > > Conor (and/or) Krzysztof and Rob,
> > > >
> > > > On Mon, Jul 15, 2024 at 8:31=E2=80=AFAM Conor Dooley <conor@kernel.=
org> wrote:
> > > >>
> > > >> On Mon, Jul 15, 2024 at 02:15:37PM +0200, Stephan Gerhold wrote:
> > > >>> The Samsung ATNA45AF01 panel is an AMOLED eDP panel that has back=
light
> > > >>> control over the DP AUX channel. While it works almost correctly =
with the
> > > >>> generic "edp-panel" compatible, the backlight needs special handl=
ing to
> > > >>> work correctly. It is similar to the existing ATNA33XC20 panel, j=
ust with
> > > >>> a larger resolution and size.
> > > >>>
> > > >>> Add a new "samsung,atna45af01" compatible to describe this panel =
in the DT.
> > > >>> Use the existing "samsung,atna33xc20" as fallback compatible sinc=
e existing
> > > >>> drivers should work as-is, given that resolution and size are dis=
coverable
> > > >>> through the eDP link.
> > > >>>
> > > >>> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> > > >>
> > > >> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> > > >
> > > > Can you comment on whether you would consider this bindings a "Fix"
> > > > since it's a dependency for later patches in this series (which are
> > > > "Fix"es) to pass dtbs_check? See:
> > > >
> > > > https://lore.kernel.org/r/4bca316a-2334-425b-87a6-e1bb241d26b5@lina=
ro.org
> > >
> > > The patch itself is not a fix, for sure, but it might be a dependency=
 of
> > > a fix (which you wrote above), thus could be pulled to stable as a
> > > dependency.
> > >
> > > I do not care about dtbs_check warnings in stable kernels, mostly
> > > because dtbs_check warnings depend heavily on dtschema and dtschema
> > > follows mainline kernel. Basically if you had warnings-free v6.8 but =
try
> > > to run dtbs_check now with latest dtschema, your results will differ.
> > >
> > > At some point in the future, I could imagine "no new dtbs_check warni=
ngs
> > > in stable kernels" requirement or at least preference, but so far I
> > > don't think there is any benefit.
> >
> > In this case it's not about whether it makes it to the stable kernel
> > but about which main kernel it goes through.
> >
> > If we land the bindings in drm-misc-next right now then it'll be a
> > long time before it makes it into Linus's tree because of the way that
> > drm-misc-next merges. It will make it to Linus's tree at 6.12. You can
> > see the drm-misc merging strategy at:
> >
> > https://drm.pages.freedesktop.org/maintainer-tools/drm-misc.html
> >
> > If we land the dts change (a fix) through the Qualcomm tree as a fix
> > then it should target 6.11.
> >
> > This means that the 6.11 tree will have a dtbs_check error because it
> > has the dts change (a fix) but not the bindings change (not a fix).
> >
> > One way to resolve this would be to treat this bindings as a "fix" and
> > land it through "drm-misc-fixes". That would make the bindings and
> > device tree change meet up in Linux 6.11.
> >
> > Did I get that all correct?
>
> Is not not fairly established that a dependency for a fix can go onto a
> fixes branch even if it is not a fix in and of itself?

That would certainly be my take on it, but DT folks confirmation was
requested by Neil in:

https://lore.kernel.org/all/4bca316a-2334-425b-87a6-e1bb241d26b5@linaro.org=
/

-Doug
