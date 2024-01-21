Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 153F9835622
	for <lists+dri-devel@lfdr.de>; Sun, 21 Jan 2024 15:37:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11E5110E266;
	Sun, 21 Jan 2024 14:37:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com
 [209.85.128.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D04B10E0AC
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Jan 2024 14:36:58 +0000 (UTC)
Received: by mail-yw1-f177.google.com with SMTP id
 00721157ae682-5ffd5620247so2904577b3.0
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Jan 2024 06:36:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705847757; x=1706452557; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=872rfjy39rwVRPIkk3ndSS0WStZElYm0Qg/+47Tr7M4=;
 b=BFe2NuivZBOILPuFY+qaX0Nq+EPkFtEdmnPzbCrRtIRG7tURNdCg1qJR7mX8NlRV9v
 wSsiAqqTTrZwNeiD0wC/BakC9fue2KxX+7uNz3NG4NtZRgg/913/UX9rnHUMvAIBnixM
 dM3B2CWZnClnduB3BAXSHZ1CaGXYRBEjxnB7Ni9iY4mHDP3NdMK4C2Ns4oGklZ8is46b
 Oufl2W4dfzX8Be8jt6kNFV/Oix9UFTiTGchlV3LdE4stZDLCZ6OWs661BF7+B0vgVc/l
 q5n5QJixNLC5mruA7w/KZH6ns64q5UNuc2b2c0DTvTELfUE5bGHyJJXIpda1nOXNI7y1
 J29g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705847757; x=1706452557;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=872rfjy39rwVRPIkk3ndSS0WStZElYm0Qg/+47Tr7M4=;
 b=k6qys7qyz2h8yhPmnm5GiVsZH4Iwar07r5Y8PiE8GpF0ZoW+RFu4mKuU3tNzRn9/ZO
 5PdrXFNNuiqmb06O8juxbDZJushz6Ofi2TvwzfWl27+5Yon7JAPlrDnyGNtFdfTNHy1K
 a+775R675JT1lbgT1/XhVhqpYlocanS/cC5Av1KF56uaNMW8X2fwE4abdQURQ6H2BMVS
 tTNw5x+gkk/g/EF0EWQq0j40VLA6lJ9XcaSY2fqs/n/MvSM01O+ktq7NeyCBQDPbzsqW
 n5AMyEMpWejW2zUDnbJ+OmNUee6wyQHR9LxKJJIJJDhID/9FGaowTFZOkM/oU+33vMzr
 GWRg==
X-Gm-Message-State: AOJu0YzFZ9oJO7VFi153xxx2J5/SgYm9j5nQPAq2hnOn9yIozUTPI4ch
 +5pUqvGfGh346zrNJOl9b9Rxh3RHnWFC+DGVBvSZpGQuFCXsduEqI+qsIIjEytkDbm7NERLnorR
 /pEtv0zepJ4C7E0OvFf1GXKi+Ivub0Hqz4jD5Kg==
X-Google-Smtp-Source: AGHT+IGJ2DYegRgTTs8ZHsk79g8rkAhLXrTgdRS3BTZclQzp+PaNFA6RmnfZAQEkPgtQz0pMrsua29Q2IC4VA5JrGXc=
X-Received: by 2002:a81:9c52:0:b0:5ff:96b8:f0b9 with SMTP id
 n18-20020a819c52000000b005ff96b8f0b9mr2720698ywa.90.1705847757431; Sun, 21
 Jan 2024 06:35:57 -0800 (PST)
MIME-Version: 1.0
References: <20240120-ktd2801-v3-0-fe2cbafffb21@skole.hr>
 <20240120-ktd2801-v3-1-fe2cbafffb21@skole.hr>
In-Reply-To: <20240120-ktd2801-v3-1-fe2cbafffb21@skole.hr>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 21 Jan 2024 15:35:46 +0100
Message-ID: <CACRpkdZJyY9oYMt3TvDEGthN-Wvz3t_40t9P-VsgTKCJQaD=pw@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] leds: ktd2692: move ExpressWire code to library
To: =?UTF-8?Q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
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
Cc: devicetree@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>,
 Pavel Machek <pavel@ucw.cz>, Jingoo Han <jingoohan1@gmail.com>,
 Helge Deller <deller@gmx.de>, Lee Jones <lee@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, ~postmarketos/upstreaming@lists.sr.ht,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 phone-devel@vger.kernel.org, Karel Balej <balejk@matfyz.cz>,
 linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Jan 20, 2024 at 10:27=E2=80=AFPM Duje Mihanovi=C4=87 <duje.mihanovi=
c@skole.hr> wrote:

> The ExpressWire protocol is shared between at least KTD2692 and KTD2801
> with slight differences such as timings and the former not having a
> defined set of pulses for enabling the protocol (possibly because it
> does not support PWM unlike KTD2801). Despite these differences the
> ExpressWire handling code can be shared between the two, so move it into
> a library in preparation for adding KTD2801 support.
>
> Suggested-by: Daniel Thompson <daniel.thompson@linaro.org>
> Signed-off-by: Duje Mihanovi=C4=87 <duje.mihanovic@skole.hr>

This is great stuff.
I looked at my KTD253 driver but AFAICT it uses a different method:
instead of transferring a numeral, it increases/decreases a counter, so
it can't use the library.

> +extern void expresswire_power_off(struct expresswire_common_props *props=
);
> +extern void expresswire_enable(struct expresswire_common_props *props);
> +extern void expresswire_start(struct expresswire_common_props *props);
> +extern void expresswire_end(struct expresswire_common_props *props);
> +extern void expresswire_set_bit(struct expresswire_common_props *props, =
bool bit);

I would skip the keyword "extern" since it is default I think even
checkpatch complains about it these days?

Anyway, no big deal:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
