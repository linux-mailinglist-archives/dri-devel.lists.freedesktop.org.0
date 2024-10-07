Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E65E992FA0
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2024 16:42:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 363F410E3B8;
	Mon,  7 Oct 2024 14:42:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="LowxAn38";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com
 [209.85.128.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9629310E3B8
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Oct 2024 14:42:33 +0000 (UTC)
Received: by mail-yw1-f170.google.com with SMTP id
 00721157ae682-6e2d2447181so20167737b3.1
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Oct 2024 07:42:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728312152; x=1728916952; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=OQVz0vOtE/vhE4JxfRN39I/kekE4gMvxJaTmqdYN4Hk=;
 b=LowxAn38ipZnQRe6WQNtmo+eYnzt0Tm82lZ9xVaIyqQJrxCzhS4Ol30hjtNS9puaSs
 rBXMvnneintpl7q14XL1UBJ3QozxUo0x+xLC80H26BmrLPzapSNWxQgVo+R451Gl1FzG
 pbR/KgBLqpz1MjBwp51MWsEPdZm61INuGCitLfqVqgObboe9L2Hpuh0q/IUTOwfsbxa/
 gHrI4yPO0OmEKqAjLvduxVbPTew3out8ssOmhuBa14LkhAwYCWPBLezXFSMcxyuQBFgF
 xmh866adAVKoJACMYpjo2tQsENDFm2O/qw4rDI28EeGR9uJVMIdhvryV1+J6stHvYXEY
 OHFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728312152; x=1728916952;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OQVz0vOtE/vhE4JxfRN39I/kekE4gMvxJaTmqdYN4Hk=;
 b=cxlpXXFvcEQdx5arqO0lsLqwzDLY2IbsBAfe9+6cpwReEIHb0bj/yd0Si3cqbASx6j
 OtGjKke+/zfm0woMlgciLh8c8p9e00O/BRoMq65A+EyhTC5Fe2r+e0QLsY9I1RpgLumX
 tTKBKTX7W0+34CUf6gGDoyIpvEaZNEqxvybIz70dGHceh9plOCYfnvc0FA5rdIH9//AL
 Kk+/Jc68LPu2l/oOW+alas3uA0ASdoAdLMKgKBfAVNfPTSpHpAIDxJprjlOv2zmYgK6Z
 JxmgBus7jODlq/FgabbByfyBhZEDoavMhyEbOnsta/lCe3jJb1AFaQ6utfvKkRbN1V9b
 tGdg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWI6i18c8+bd+oKmjfSEqgVS8YT/jqBQ5Ad11C3rYxRf4Hb9c/p+yqfZdvsEZR3kYSlrcUkK71vVMQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwECfZrk2gwXKH4dZrM8pSquOH0H8jii36XlPHuzPeoliB7Mq/b
 pj9wfaOj2XDRU6C2Lx7uzv0Ovj6E+Cc/1PKTxHzkNWHJlqP47OowfxltiDQ5U4fiNXjT4kIMIFX
 weVqsvQ+//4MLsYoM+Xdb3/fygkheVsyltCJCzQ==
X-Google-Smtp-Source: AGHT+IFtLx92+g4Im4BYq0IF/nuPhymbQIsBhoZ0lME72v6xi/Y1yH6ePIkFIQAOuj840/kCSHbxUC0u4ACUasl+Ueg=
X-Received: by 2002:a05:690c:6ac8:b0:6de:a3:a7ca with SMTP id
 00721157ae682-6e2c728a25fmr86622347b3.32.1728312152659; Mon, 07 Oct 2024
 07:42:32 -0700 (PDT)
MIME-Version: 1.0
References: <20240812-tdp158-v5-0-78684a84ec23@freebox.fr>
 <172536721812.2552069.2889737892670833119.b4-ty@kernel.org>
 <40ffacc2-fa04-4e6d-b817-c547aa75a21c@freebox.fr>
In-Reply-To: <40ffacc2-fa04-4e6d-b817-c547aa75a21c@freebox.fr>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 7 Oct 2024 16:42:21 +0200
Message-ID: <CAA8EJpqYp8uBNVdNSAmSbeev=itxNKS_scb2xAwe63aS5bdhkg@mail.gmail.com>
Subject: Re: [PATCH v5 0/2] Basic support for TI TDP158
To: Marc Gonzalez <mgonzalez@freebox.fr>
Cc: Robert Foss <rfoss@kernel.org>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Arnaud Vrac <avrac@freebox.fr>, Pierre-Hugues Husson <phhusson@freebox.fr>, 
 Konrad Dybcio <konradybcio@kernel.org>
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

On Mon, 7 Oct 2024 at 16:33, Marc Gonzalez <mgonzalez@freebox.fr> wrote:
>
> On 03/09/2024 14:40, Robert Foss wrote:
>
> > On Mon, 12 Aug 2024 16:51:00 +0200, Marc Gonzalez wrote:
> >
> >> TDP158 is an AC-coupled DVI / HDMI to TMDS level shifting Redriver.
> >>
> >> Like the TFP410, the TDP158 can be set up in 2 different ways:
> >> 1) hard-coding its configuration settings using pin-strapping resistors
> >> 2) placing it on an I2C bus, and defer set-up until run-time
> >>
> >> The mode is selected by pin 8 = I2C_EN
> >> I2C_EN = 1 ==> I2C Control Mode
> >> I2C_EN = 0 ==> Pin Strap Mode
> >>
> >> [...]
> >
> > Applied, thanks!
> >
> > [1/2] dt-bindings: display: bridge: add TI TDP158
> >       https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/887665792b99
> > [2/2] drm/bridge: add support for TI TDP158
> >       https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/a15710027afb
>
> Hello Robert,
>
> I expected this series to be included in v6.12-rc1, since you applied it
> before the v6.12 merge window opened. Did I misunderstand the process?

drm-misc-next stops propagating new changes to drm-next one or two
weeks before the release.

> If not in v6.12, does that mean it will be in v6.13?

Yes.

-- 
With best wishes
Dmitry
