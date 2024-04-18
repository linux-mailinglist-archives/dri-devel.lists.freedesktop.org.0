Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D92578A9C06
	for <lists+dri-devel@lfdr.de>; Thu, 18 Apr 2024 16:00:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 191FC113CB3;
	Thu, 18 Apr 2024 14:00:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="mHy5s0OS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com
 [209.85.219.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6086E113CB3
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Apr 2024 14:00:38 +0000 (UTC)
Received: by mail-yb1-f169.google.com with SMTP id
 3f1490d57ef6-de462979e00so1144507276.3
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Apr 2024 07:00:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713448837; x=1714053637; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LfdRxoYWFZnh1Pzjp/pkGuOdpYAMzwLC3mfVu9MRkXs=;
 b=mHy5s0OSaaA6mO8HSV+cGR8w8tGdrH0Kg19NKEf6CC8qwTRDoOiUzmgU7NFXDy0aRz
 Pr+dwUqIR7nhctMo3VAMmbZWNXkST1rV8PpvfHxr6h1iQDCpoeodz+sCbgp0y726gcZ3
 Cq22M0QhYBI494aiUv5ZDPJmQ7jlTvKi9HDHqjFv9jkz4n48Xltmwac233KAItNyNiT3
 VOiM8fq9HXeH/C2XUqEn3VO+NTHDTkCr3Swck1/06h/jalTBmh5bbSwz9ae3GIadh6oS
 apXqgjcTO4E6cEHMwaUeIMb4xfWVmX39mOKIoGn3RecUGWbbs5a2iPquDg08Wl30DrcW
 93NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713448837; x=1714053637;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LfdRxoYWFZnh1Pzjp/pkGuOdpYAMzwLC3mfVu9MRkXs=;
 b=ifx6NBQKm8LLY6quLkkHLbshkEE8n8mOyRknxHww/+nZXSgkaxL+GegQSTPVCrSu4X
 ch8i46QIXNR8cSgAyA0SveHljMzvaLR5yZOIBG/fe/tuhzXijV1VRpbn4L4BZxcFykfs
 dzEHBB0dbhr823PxiU8fW0iJa4AdrVttmT5YVwkNgza17qkMM9tZLT3UnWzCt84bUC3V
 nQhHMwGjO/GbNfzOdm+TTlXGGMX6PTrXQRitp04tWEktpdJL0btDxbJn7INUNP5xCpEY
 Q0FPl9lcR3KdP3fJ1uZ7fwf8EifXmVJZGR3FTpGIh7X3ymsdQLVzAiX8VlwIYpOOw0PI
 Mh5w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVXtGOJScGqlkSBgKJR8Zxq+AijCQJFAOZvpyPBYW86xApMRjRZe7b9Rk3P3Gw9LDxZzMdi4geJWMMbKOWawTk6N3Dryc1S5C/+CEiPd+L6
X-Gm-Message-State: AOJu0YyVIOM134NeXW/wy19l8v1Qi1sasVW81ywXXzipFRc3hg+IU+Kx
 5kkdnfIxUYSSXCXE2XfJYCib3GzXdbafSbtdd7H5wZGL5ATy6yVJCHCTwah4KntoZ2jeGawC3nq
 7AvSkF/JEFaRDARrJAb6C3HL7cYQMgnb8qtBIww==
X-Google-Smtp-Source: AGHT+IG6AB7cK4gQyrTBcYydPTwRbBVUhUDB6blxZ1fiVtij9UP56RzjDgGZ+5mPHYa0AbKtxwlXvMzWeyimBXDNk1Y=
X-Received: by 2002:a25:ef05:0:b0:dcc:96db:fc0d with SMTP id
 g5-20020a25ef05000000b00dcc96dbfc0dmr2573050ybd.25.1713448836586; Thu, 18 Apr
 2024 07:00:36 -0700 (PDT)
MIME-Version: 1.0
References: <20240410071439.2152588-1-yangcong5@huaqin.corp-partner.google.com>
 <20240410071439.2152588-3-yangcong5@huaqin.corp-partner.google.com>
 <CAD=FV=V2J=Tth2zhpo-kPo4uvESt70mFneO2V6TV-haac0VZuQ@mail.gmail.com>
 <CACRpkdYtM=5jdQddCqRFgBRXvcJEjk1ULJNKKFz7jhhkGxV59Q@mail.gmail.com>
 <CAHwB_NLfaQWhFSbZ2ASmYgXJaVOTrjac3F0hyCJdwTTo-zHJrQ@mail.gmail.com>
In-Reply-To: <CAHwB_NLfaQWhFSbZ2ASmYgXJaVOTrjac3F0hyCJdwTTo-zHJrQ@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 18 Apr 2024 16:00:24 +0200
Message-ID: <CACRpkdYoM40RZyjTxLwDNta2+uV31_zzoj7XrXqhyyqrDtd5zQ@mail.gmail.com>
Subject: Re: [PATCH v1 2/4] drm/panel: boe-tv101wum-nl6: Support for BOE
 nv110wum-l60 MIPI-DSI panel
To: cong yang <yangcong5@huaqin.corp-partner.google.com>
Cc: Doug Anderson <dianders@chromium.org>, sam@ravnborg.org,
 neil.armstrong@linaro.org, 
 daniel@ffwll.ch, airlied@gmail.com, robh+dt@kernel.org, 
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
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

On Thu, Apr 18, 2024 at 2:42=E2=80=AFPM cong yang
<yangcong5@huaqin.corp-partner.google.com> wrote:

> I learned from himax that even if the same controller is used with
> different glasses, the corresponding parameters are not fixed.
>
> For example: _INIT_DCS_CMD(0xB9, 0x83, 0x10, 0x21, 0x55, 0x00),
>
> even in the group initial code, the same register will be loaded with
> parameters twice.
(...)
> So assuming that the registers of the two screens is the same now,
> it cannot be set as a common parameter.
> Otherwise, it may be a bit troublesome for the maintainers.
>
> If necessary, I can break out starry_himax83102_j02, boe_nv110wum and
> ivo_t109nw41
> as separate driver. Then add some define to these registers.

Why would you do a separate driver per panel despite they have
the same display controller? I don't get it.

Use one driver, use different compatible strings for the different
panels and use the corresponding sequence for each panel
selected by compatible string.

For example, see drivers/gpu/drm/panel/panel-novatek-nt35510.c:

static const struct of_device_id nt35510_of_match[] =3D {
        {
                .compatible =3D "frida,frd400b25025",
                .data =3D &nt35510_frida_frd400b25025,
        },
        {
                .compatible =3D "hydis,hva40wv1",
                .data =3D &nt35510_hydis_hva40wv1,
        },
        { }
};


Take some inspiration from this driver and how we parameterize
the different data depending on compatible string.

Yours,
Linus Walleij
