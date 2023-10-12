Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D50C7C6969
	for <lists+dri-devel@lfdr.de>; Thu, 12 Oct 2023 11:23:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B691510E061;
	Thu, 12 Oct 2023 09:23:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com
 [209.85.128.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64FB510E061
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Oct 2023 09:23:23 +0000 (UTC)
Received: by mail-yw1-f169.google.com with SMTP id
 00721157ae682-5a7c7262d5eso9575617b3.1
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Oct 2023 02:23:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697102602; x=1697707402;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PLqNDcxJiv20ehs9D0nU/cOeQ3thP02EgHIdRx1B5Sw=;
 b=GfL/f0FkL3RNkxV4dE4+Ybd8kSv6Ae99YDo6bhsy/38+aGoyJcYWVzE1eh1vPJum9W
 cgGWJWdsCZdoB3vikGmKwU34AaZfN7xZy6zPCdIYKmK51YgB4lFrPGRG2koWLRSf4Hvl
 HKApvB1HuClt+IjRraapI14wsvQks7CK1apSkliMnKpYQvzUKUiRBA8kAp7/0Ieh7bJW
 1N8061TnWoFj9V5PouZf1mMbP8nnSNTfyZFagVaqXNIm06gldFiII7w/euaiALQgQCr4
 +r3gVf7FKTcmqgBOJz32us81OD/ZO7cugMevsXlwDKVmqjw3XAFKOoNNuioXraTsh9a3
 Aw6A==
X-Gm-Message-State: AOJu0YxeBDZAPCLp5Y9FQWv59iZGN0mpfc06gw1GEGi1SpJwfEQGshwO
 BpVsJOCKPIGeKkEXRdLr8LQaJdKXrftmQg==
X-Google-Smtp-Source: AGHT+IEukpAysVuCVAHMojLGof3OQULKVz7s1Oaf6atnj+z16IYf/dsVNFCpTm1HPjnNe7NN2NnlEQ==
X-Received: by 2002:a05:690c:f01:b0:5a7:fbd5:8b3 with SMTP id
 dc1-20020a05690c0f0100b005a7fbd508b3mr1781553ywb.10.1697102602312; 
 Thu, 12 Oct 2023 02:23:22 -0700 (PDT)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com.
 [209.85.128.177]) by smtp.gmail.com with ESMTPSA id
 w19-20020a814913000000b005a7bb193b37sm1957668ywa.27.2023.10.12.02.23.19
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Oct 2023 02:23:19 -0700 (PDT)
Received: by mail-yw1-f177.google.com with SMTP id
 00721157ae682-5a7be88e9ccso9483077b3.2
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Oct 2023 02:23:19 -0700 (PDT)
X-Received: by 2002:a0d:ea4a:0:b0:5a7:bff3:6fe4 with SMTP id
 t71-20020a0dea4a000000b005a7bff36fe4mr7804990ywe.9.1697102599538; Thu, 12 Oct
 2023 02:23:19 -0700 (PDT)
MIME-Version: 1.0
References: <20231002122740.220177-1-biju.das.jz@bp.renesas.com>
 <20231002122740.220177-4-biju.das.jz@bp.renesas.com>
In-Reply-To: <20231002122740.220177-4-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 12 Oct 2023 11:23:07 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWC5Nd3nezR1K_XD5CJTM76XUbv3=Pf9fHvYK43n4iqmQ@mail.gmail.com>
Message-ID: <CAMuHMdWC5Nd3nezR1K_XD5CJTM76XUbv3=Pf9fHvYK43n4iqmQ@mail.gmail.com>
Subject: Re: [PATCH v11 3/4] drm: renesas: Add RZ/G2L DU Support
To: Biju Das <biju.das.jz@bp.renesas.com>
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
Cc: Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Biju,

On Mon, Oct 2, 2023 at 2:28=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.com=
> wrote:
> The LCD controller is composed of Frame Compression Processor (FCPVD),
> Video Signal Processor (VSPD), and Display Unit (DU).
>
> It has DPI/DSI interfaces and supports a maximum resolution of 1080p
> along with 2 RPFs to support the blending of two picture layers and
> raster operations (ROPs).
>
> The DU module is connected to VSPD. Add RZ/G2L DU support for RZ/G2L
> alike SoCs.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> v9->v10:

>  * Added rzg2l_du_write() wrapper function.

> --- /dev/null
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c

> +static inline void rzg2l_du_write(struct rzg2l_du_device *rcdu, u32 reg,=
 u32 data)
> +{
> +       writel(data, rcdu->mmio + reg);
> +}

What is the added value of this wrapper?
The order of the reg/data parameters is the inverse of the
standard writel() operation...

> +       rzg2l_du_write(rcdu, DU_DITR0, ditr0);

... and using it actually needs one more keystroke than open-coding it:

-       writel(ditr0, rcdu->mmio + DU_DITR0);

Sorry for missing this before.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
