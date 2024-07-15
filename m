Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9B5E931618
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jul 2024 15:51:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8629F10E002;
	Mon, 15 Jul 2024 13:51:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="KAj1yOGJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com
 [209.85.219.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5081710E002
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2024 13:51:44 +0000 (UTC)
Received: by mail-yb1-f181.google.com with SMTP id
 3f1490d57ef6-e03d49ff259so3627887276.2
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2024 06:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1721051498; x=1721656298;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SxXwbEHWXO/2KvCuP3hi693DOR1kiAPLV7jI7n5DAfw=;
 b=KAj1yOGJr2ZgEhx2wwRrWc+kFuOCZromDz7vO7gHBPy5xSfudQNvIB52p9yqj9Vv4k
 J21DdG4rXJnkVacNb4E9I9WQy2ZAy0T+XokWmt+fzFDJskL2bK6r01BO2ZV6WfOCAHg3
 pqzIszn+xK2dz6AUO2IHXYnEqVBh1tg+AU7Mk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721051498; x=1721656298;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SxXwbEHWXO/2KvCuP3hi693DOR1kiAPLV7jI7n5DAfw=;
 b=CQKk3HRxO+00XDViwbOr9Z3KCZSg4z1egIWfsk7oPs4I50TDgMZewVtvT8fozt34SV
 l9GbDGcHq66PEco11Hgf7Ij+Qn6zDgZ1KAmwGXF6Pi7hS/u22MO3YSlJ/5ZXluCBzumO
 5ZMnUtyVqnEx7PKKfapYTqLFQFlE4vcedGDIIGW1gazquraNAmbDgBN94aSyRwGWmU4J
 Fgzuzcjw7xp2gRDfamAAzj/nvZqmhRah91DyCZudSkbmQxyHbGLJK/VPuxXcJy7lu/1i
 F+n8Zrakz00qertk0RuPgsOkn4NwR4MNdzKOnydqJJ6zcy7CAY5mGD77ps+oVps84+EC
 4nIg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVMxASq7zGyM00zGx1dvC8TdTlej7A3bfNcwAQyeSSFR2dGiiUnVbercknpj/li+ydzgaqAeJgcUkfYIIdylUssHcniIVH8DTVhv3vxnITZ
X-Gm-Message-State: AOJu0YwsMN8VM3LlvBdd5z7iSZTDi4j+yJmjFsIEFh9jkjVqdO/bJmhl
 1mFYUL1SeN3gwwYzisj4RRU4o5HEL5OOSZIfA9m2kuU9AN0UMrzY623j4Iqs0rgQzRStQu3Ssok
 =
X-Google-Smtp-Source: AGHT+IGkd8aUH+AzOX8lFdEY+2uBSIhY3KBAxB8DYcQDA1Z8LXlNxYbZagGN99x5HE+8U33FhvB2ag==
X-Received: by 2002:a25:ac43:0:b0:dfa:b64b:48bd with SMTP id
 3f1490d57ef6-e041b042d6fmr18971878276.1.1721051498179; 
 Mon, 15 Jul 2024 06:51:38 -0700 (PDT)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com.
 [209.85.160.173]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6b761a0fd68sm21438146d6.75.2024.07.15.06.51.35
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Jul 2024 06:51:37 -0700 (PDT)
Received: by mail-qt1-f173.google.com with SMTP id
 d75a77b69052e-447df43324fso493251cf.1
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2024 06:51:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWhdvp2E5+jUb8NQQ1QxMhYXJmeyYcSXuok2BaKPt0o9jGyiB7daRkp4TVN+SRuhMXQzWy6k6KhQYSJSrctHszvrp6u0T6TGR/RC9RZmvco
X-Received: by 2002:a05:622a:124b:b0:447:e728:d9b with SMTP id
 d75a77b69052e-44f5a31e028mr6194241cf.26.1721051494780; Mon, 15 Jul 2024
 06:51:34 -0700 (PDT)
MIME-Version: 1.0
References: <20240715-x1e80100-crd-backlight-v2-0-31b7f2f658a3@linaro.org>
 <20240715-x1e80100-crd-backlight-v2-2-31b7f2f658a3@linaro.org>
 <7daa3c0d-cecf-4f50-be32-ae116b920db0@linaro.org>
 <ZpUcI3KkIa58zC55@linaro.org>
 <d1603248-afe8-4594-9e2e-81ba208dff00@linaro.org>
In-Reply-To: <d1603248-afe8-4594-9e2e-81ba208dff00@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 15 Jul 2024 06:51:18 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WimxYmDrkfn0+E3MbXp8kS9TicN2kT3AM4eM+SAwYsOg@mail.gmail.com>
Message-ID: <CAD=FV=WimxYmDrkfn0+E3MbXp8kS9TicN2kT3AM4eM+SAwYsOg@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] Revert "drm/panel-edp: Add SDC ATNA45AF01"
To: neil.armstrong@linaro.org
Cc: Stephan Gerhold <stephan.gerhold@linaro.org>,
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

On Mon, Jul 15, 2024 at 6:02=E2=80=AFAM Neil Armstrong
<neil.armstrong@linaro.org> wrote:
>
> On 15/07/2024 14:54, Stephan Gerhold wrote:
> > On Mon, Jul 15, 2024 at 02:42:12PM +0200, Neil Armstrong wrote:
> >> On 15/07/2024 14:15, Stephan Gerhold wrote:
> >>> This reverts commit 8ebb1fc2e69ab8b89a425e402c7bd85e053b7b01.
> >>>
> >>> The panel should be handled through the samsung-atna33xc20 driver for
> >>> correct power up timings. Otherwise the backlight does not work corre=
ctly.
> >>>
> >>> We have existing users of this panel through the generic "edp-panel"
> >>> compatible (e.g. the Qualcomm X1E80100 CRD), but the screen works onl=
y
> >>> partially in that configuration: It works after boot but once the scr=
een
> >>> gets disabled it does not turn on again until after reboot. It behave=
s the
> >>> same way with the default "conservative" timings, so we might as well=
 drop
> >>> the configuration from the panel-edp driver. That way, users with old=
 DTBs
> >>> will get a warning and can move to the new driver.
> >>>
> >>> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> >>> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> >>> ---
> >>>    drivers/gpu/drm/panel/panel-edp.c | 2 --
> >>>    1 file changed, 2 deletions(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/pane=
l/panel-edp.c
> >>> index 3a574a9b46e7..d2d682385e89 100644
> >>> --- a/drivers/gpu/drm/panel/panel-edp.c
> >>> +++ b/drivers/gpu/drm/panel/panel-edp.c
> >>> @@ -1960,8 +1960,6 @@ static const struct edp_panel_entry edp_panels[=
] =3D {
> >>>     EDP_PANEL_ENTRY('L', 'G', 'D', 0x05af, &delay_200_500_e200_d200, =
"Unknown"),
> >>>     EDP_PANEL_ENTRY('L', 'G', 'D', 0x05f1, &delay_200_500_e200_d200, =
"Unknown"),
> >>> -   EDP_PANEL_ENTRY('S', 'D', 'C', 0x416d, &delay_100_500_e200, "ATNA=
45AF01"),
> >>> -
> >>>     EDP_PANEL_ENTRY('S', 'H', 'P', 0x1511, &delay_200_500_e50, "LQ140=
M1JW48"),
> >>>     EDP_PANEL_ENTRY('S', 'H', 'P', 0x1523, &delay_80_500_e50, "LQ140M=
1JW46"),
> >>>     EDP_PANEL_ENTRY('S', 'H', 'P', 0x153a, &delay_200_500_e50, "LQ140=
T1JH01"),
> >>>
> >>
> >> How will we handle current/old crd DT with new kernels ?
> >>
> >
> > I think this is answered in the commit message:
> >
> >>> We have existing users of this panel through the generic "edp-panel"
> >>> compatible (e.g. the Qualcomm X1E80100 CRD), but the screen works onl=
y
> >>> partially in that configuration: It works after boot but once the scr=
een
> >>> gets disabled it does not turn on again until after reboot. It behave=
s the
> >>> same way with the default "conservative" timings, so we might as well=
 drop
> >>> the configuration from the panel-edp driver. That way, users with old=
 DTBs
> >>> will get a warning and can move to the new driver.
> >
> > Basically with the entry removed, the panel-edp driver will fallback to
> > default "conservative" timings when using old DTBs. There will be a
> > warning in dmesg, but otherwise the panel will somewhat work just as
> > before. I think this is a good way to remind users to upgrade.
>
> I consider this as a regression
>
> >
> >> Same question for patch 3, thie serie introduces a bindings that won't=
 be valid
> >> if we backport patch 3. I don't think patch should be backported, and =
this patch
> >> should be dropped.
> >
> > There would be a dtbs_check warning, yeah. Functionally, it would work
> > just fine. Is that reason enough to keep display partially broken for
> > 6.11? We could also apply the minor binding change for 6.11 if needed.
>
> I don't know how to answer this, I'll let the DT maintainer comment this.
>
> The problem is I do not think we can pass the whole patchset as fixes
> for v6.11, patches 2 & 3 could, patches 1 & 4 definitely can't.
>
> Neil

IMO: patch #3 (dts) and #4 (CONFIG) go through the Qualcomm tree
whenever those folks agree to it. If we're worried about the
dtbs_check breakage I personally wouldn't mind "Ack"ing patch #1 to go
through the Qualcomm tree as long as it made it into 6.11-rc1. I have
a hunch that there are going to be more Samsung OLED panels in the
future that will need to touch the same file, but if the change is in
-rc1 it should make it back into drm-misc quickly, right?

Personally I think patch #2 could go in anytime since, as people have
said, things are pretty broken today and the worst that happens is
that someone gets an extra warning. That would be my preference. That
being said, we could also snooze that patch for a month or two and
land it later. There's no real hurry.

-Doug
