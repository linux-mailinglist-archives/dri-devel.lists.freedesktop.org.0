Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E801C733036
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jun 2023 13:44:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2397510E0D0;
	Fri, 16 Jun 2023 11:44:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe36.google.com (mail-vs1-xe36.google.com
 [IPv6:2607:f8b0:4864:20::e36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2F0C10E0D0
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jun 2023 11:44:05 +0000 (UTC)
Received: by mail-vs1-xe36.google.com with SMTP id
 ada2fe7eead31-43c380dd87eso205245137.2
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jun 2023 04:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686915844; x=1689507844;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oB5XD+iAFsa6BpjNlxD9JxMbG+RhSE7xi6kN/8wWgEI=;
 b=xfxUs3Oozpk0bv89JYbgckRsUv2DfT+oPr0M+haaeuC/ZWFXOvQ4d+Mx/zkf68RwuF
 +oeAdSvtHV0aciPK8Yz/6hbskIryWreY3paf4TTjjvFjyfqRvRG30LD+dsBKGFHwIe7v
 Pqp6w9cNz0hFQFqLCiSbPUQAD0/Ve32QFhervrAlAQ+CLbRLtovAqXXGMUkTNAve0zUT
 urglOfPjVN2B1Wf1GR9IcuhtDFVwlIJhHUSKAuwjZObLdijtvAhFE38OBg1qECWfGhku
 g5Bc5nLQpJtLMFBY2nCkI17YuSWo1pslnpkQGWOQtL0gFMy917hPjl7Q+gV8N0nBpkFR
 Xxwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686915844; x=1689507844;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oB5XD+iAFsa6BpjNlxD9JxMbG+RhSE7xi6kN/8wWgEI=;
 b=fnqw0CuZCwpg/vv8/m6fA2yfBW4hw6LIbJGdR7dFbzmqjJPL9XHdz8mAV8sHcfWHS2
 cPcKDzdXtRS1yHZN4EdIkLULmeE/es08AMUsIw9CA+u2Rx6DMUUbZ60WQ5LfgSDUgx/4
 tODU2kBzdWBfMoTbiDGFzoBbL1Xib7qL943WFZmvJ6ftYRVcmsUMsiasZLk8PsR4CaVh
 ELcuFG4obu7nE40eTbvhVcU1gsyHRRsAYKSk6Qqt4ZTFDwXDAUVoeiL+73IG+OHCTBVB
 ZwKSDtcm8Os8YKBLtifXZnnxgn/hb4/zos+K3PrRKHdla1FWspylG+2kVUpVNozZ1kAY
 PSYw==
X-Gm-Message-State: AC+VfDwGXyi54zlL489Asyj8mk+SA+HKr08mD5WaSaRUOlrHN+IM6XKp
 tsImrmqg8GCPKEcUmT9jbHKR/pERIdtsWL6d8j84rA==
X-Google-Smtp-Source: ACHHUZ4jLlWRn5phN+P6OMzwDhUjx4u50eUQ4fFLvwxzFDmB9IsvALU9pV2SQC00cwc3EVvQQFQSug79d9kT2vdw3+w=
X-Received: by 2002:a05:6102:482:b0:434:8401:beae with SMTP id
 n2-20020a056102048200b004348401beaemr1412583vsa.34.1686915844223; Fri, 16 Jun
 2023 04:44:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230607151127.1542024-1-pavacic.p@gmail.com>
 <20230607151127.1542024-4-pavacic.p@gmail.com>
 <CACRpkdbrEA54qmfTKSsFRG9ZS4u8hM6P5TXtOjRAiW+TD_v-fQ@mail.gmail.com>
 <CAO9szn00vRFm+iM1m7KgkW0WRuKyJEgVU4tVx4f5tF6KPnE=2w@mail.gmail.com>
In-Reply-To: <CAO9szn00vRFm+iM1m7KgkW0WRuKyJEgVU4tVx4f5tF6KPnE=2w@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 16 Jun 2023 13:43:52 +0200
Message-ID: <CACRpkdaw8M3dSkmiV5QDOt3BBB7Jo6NxT0Og=zvA4REMA_7y9g@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] drm/panel-fannal-c3004: Add fannal c3004 DSI panel
To: Paulo Pavacic <pavacic.p@gmail.com>
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
Cc: neil.armstrong@linaro.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
 sam@ravnborg.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 16, 2023 at 11:57=E2=80=AFAM Paulo Pavacic <pavacic.p@gmail.com=
> wrote:
> =C4=8Det, 15. lip 2023. u 21:55 Linus Walleij <linus.walleij@linaro.org> =
napisao je:
> >
> > I doubt that the display controller is actually by Fannal, but I guess
> > you tried to find out? We usually try to identify the underlying displa=
y
> > controller so the driver can be named after it and reused for more
> > display panels.
>
> Yes, of course, the controller is ST7701S.

Hm did you try to just refactor
drivers/gpu/drm/panel/panel-sitronix-st7701.c
to support your new panel?

One major reason would be that that driver knows what
commands actually mean and have #defines for them.

Yours,
Linus Walleij
