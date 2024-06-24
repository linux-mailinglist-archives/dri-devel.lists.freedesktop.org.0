Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 992C59148D5
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2024 13:34:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D40CB10E3EF;
	Mon, 24 Jun 2024 11:34:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="dfWv6Ro9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com
 [209.85.128.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6656A10E3F7
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 11:34:07 +0000 (UTC)
Received: by mail-yw1-f171.google.com with SMTP id
 00721157ae682-6325b04c275so41484427b3.3
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 04:34:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719228846; x=1719833646; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=upAAWkKErsbFK09qz0Z6svT+EppDhxsUTeUV4G/KK1k=;
 b=dfWv6Ro9mZRNMKfw3D2BJRSoIc21gufdsDr8fSlIivF+yebUzmSKRNXxq7WfTcjbC2
 jYQwVNXy87Crs1ombJX92rGaTUG6htks0Lu/9KCA8JLGmyOisI7iAlJce6IVKnW/4nfj
 YOhK4HkROgahqWH/uhXHeFMir/9+awE5HQCnK5Wt7dTfIFGfrcDXUpIsrESZ5aL7ESrc
 fAh/O4TuTmpLBzJ00xFyoR4ccFqHki9gtNACTbO0DzKd6XOeWTrBNLuK1/GK2uKoriya
 pX1QgJj20P5wWdA7p2MR3/XOaB/AD/o6/Ls1ix7Ds2u8/tUv8jum9MrzKpoL0wkOGrja
 N9zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719228846; x=1719833646;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=upAAWkKErsbFK09qz0Z6svT+EppDhxsUTeUV4G/KK1k=;
 b=iqw5bw1V7jpID1GQOw0sFS6/9Hx2BXV16FfSQM2j+4phJ65HkhJi8AYesFbOTYZ+h3
 jEgo7QQNVF/QAP0JAjKawdWXuuy/Y3JjsQVNg7t/Ig2E+htoLTgwVGwB4sbwoz7kXLed
 ZLrsl8JzIUXU3yChwuKYTWJR2JxCWEn9lU9/EuPPr4q0nEuZojDs466nbVciJLbTYGmE
 IqgthxvsiE+KmzSClgZ0hzSTlQAh3TEvRxK6Lzj7+Z3E0hqoxLL+AerAI6/MAdfsM5yh
 0/s1W8xpqfiHdkiQ8GABTzWsqq36pG5MTB2Y4FMUpfihJzHAUFVcKAN/MRnuyHm+IZzS
 4/JQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXLoud/QVy0O0yrmfllNf63xbicB40jJD+xAzLv9gGyRdpxyrEJV9S2rozwvn+VM6F30/++k0W8sNGnS5V9RTaxxD2/pS2DnTFGsaEfYpzI
X-Gm-Message-State: AOJu0YxBApmvm+9E/7xRQqM30UoU7GwJy9oZbiOJn771TBRvRsJBF9JN
 jTNCUJJFv6dTrP3BJ3SgPnrKQDWcFwa1cffpPT8fvy5a9qMynurfcNzwOZmpuSDsTCEGGShEOnG
 es7CqTWWCHMDMI+y9pnD+8dXrT0c9XQOvnMIKEA==
X-Google-Smtp-Source: AGHT+IH5Z8/tuCn40/rJtcdV8GxLSpREk/lqsQMXN8cW6J/sXP4inSC19be2plWZfK17N4VZno+uTzXn3dQ/uoLjDag=
X-Received: by 2002:a81:8387:0:b0:61a:d4ea:b856 with SMTP id
 00721157ae682-643ac323d0dmr37721917b3.40.1719228846022; Mon, 24 Jun 2024
 04:34:06 -0700 (PDT)
MIME-Version: 1.0
References: <20240624-oneplus8-v1-0-388eecf2dff7@postmarketos.org>
 <ufc7sq5s5nymjncp5w2446dq5xcmmqbmsuubhpo2fxtsz5dpgg@xtqtmmsio6sr>
 <722dab04-03f9-49ce-9c7c-4a3a9f898fc9@postmarketos.org>
In-Reply-To: <722dab04-03f9-49ce-9c7c-4a3a9f898fc9@postmarketos.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 24 Jun 2024 14:33:54 +0300
Message-ID: <CAA8EJpqVjkRKWoDfJ=Ga19=gn7i9N-bym+O-TadE819ziJXhoA@mail.gmail.com>
Subject: Re: [PATCH 0/7] qcom: initial support for the OnePlus 8T
To: Caleb Connolly <caleb@postmarketos.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Henrik Rydberg <rydberg@bitmath.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 Frieder Hannenheim <frieder.hannenheim@proton.me>
Content-Type: text/plain; charset="UTF-8"
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

On Mon, 24 Jun 2024 at 14:33, Caleb Connolly <caleb@postmarketos.org> wrote:
>
>
>
> On 24/06/2024 07:18, Dmitry Baryshkov wrote:
> > On Mon, Jun 24, 2024 at 03:30:24AM GMT, Caleb Connolly wrote:
> >> Add bindings for the SM8250 OnePlus devices, a common devicetree,
> >> touchscreen and display drivers, and a dts for the OnePlus 8T (kebab).
> >>
> >> The OnePlus 8 series is made up of 3 flagship smartphones from 2019,
> >> featuring the Qualcomm X55 5G PCIe modem.
> >>
> >> This series introduces initial support for the 8T, adding drivers for
> >> the 1080x2400 120Hz DSC panel and the Synaptics TCM Oncell touchscreen.
> >>
> >> The panel driver suffers from similar limitations to the LG SW43408
> >> panel found on the Pixel 3, namely that after toggling the reset GPIO it
> >> is not possible to get the panel into a working state.
> >
> > Just to point it out: this is no longer true for SW43408. The panel
> > wakes up and works after toggling the reset. It seems, there is an issue
> > with one of the regulators, but not with the reset and/or panel startup.
>
> Hmm ok, I've heard mixed reports then, I should try it out myself again.

During MAD24 we have seen an issue with the regulators, when the panel
doesn't wake up. But resetting the panel works.

>
> I'll update the cover letter to reflect this. Thanks.
> >
> >> Given the apparent prevelance of this issue, particularly with DSC
> >> panels, I believe this is a bug in the core DSI code, and not a device
> >> or panel specific issue. I think it is still useful to accept these
> >> panel drivers into upstream since, from a users perspective, the panel
> >> is fully functional just by leaving the reset GPIO alone and keeping the
> >> regulator on. The only (theoretical) downside is worse battery life,
> >> which is a small price to pay for a working display.
> >>
> >



-- 
With best wishes
Dmitry
