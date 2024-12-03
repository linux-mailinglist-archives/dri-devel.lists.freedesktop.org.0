Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A2CA9E15FA
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2024 09:39:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A31110E241;
	Tue,  3 Dec 2024 08:39:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com
 [209.85.222.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30B4A10E241
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2024 08:39:00 +0000 (UTC)
Received: by mail-ua1-f44.google.com with SMTP id
 a1e0cc1a2514c-85b988ec4f0so511269241.1
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Dec 2024 00:39:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733215138; x=1733819938;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OywAl/2Im4NnR7aC+FvycngflhlDkW9ZjU4GtxVKkHI=;
 b=L3j26HywXoQZ0aAj5rqL9l/01quqYusYUV+syDfY2UhA/WW4xx6phgJMs9x5WSkius
 F4UNoL29mG0qFpnhOJXELwkV8SJTIfG1ENqifh6qihnjAmijpMkTBlwTxMnwEXYjy2/o
 bVVn/4NQAZmy4OpwY0RNGXdw9M8AB5aWv8gHTUbSEtMNCx0mxAaMIDu/0zKebqPxY8ai
 BP0Yd+xlmvOoFk2jYWjeJSRuGiAPZ1+p5QVee0iBnS8b9QAb3szZnOEp1QZhR+hz+xSk
 qKVHS/4aH2Vf/WtkY32tsFU7zVjddIY+32TvVgTlVzY4boIVkENMRnr6fZoDFiCGhPOz
 xltw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWhfEs3dAoFakyJ+n0NaIGcLS3ajQnJo4lqSX8x3K8g7zkl3dvktN938UegQVhRntqMkQrobvPCaXk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxTfXMAXRfvSaDtzEOSCUEYMg3ghPapZ7FQDjccMe5g1TGz3Lg4
 ztr9psL0dyFAq1vHtVDPY1II4/U9jrqRToR37uB5j8whUtD+sCjZ9HMngbpu
X-Gm-Gg: ASbGncsO0zCSIQskRhTDHwlj/TFF/TZLQzNEd4pavaIvtkKHFGmGGEcHUHcdZJNDCXy
 /yxEpjaE/5DoAbStEnk5hVkkaUZpEpKNd6gVH7ginUqPZuDxWcCDrhjJC0TDu+9Vn5mCkrNmSQ7
 h5RLBPRntPNVAHb/0S+Ksdu71Do2E0DuQ3cumnPNy+/mZMaZx5hTKZb16SbHfSNTW2FraMQKOXY
 k471/ih3iSyuM9pAcPngBKrKA4cbcNuxdz+rwGl5MyXvSfaQT+9TRI0x2EnoxcKLUsdcJC9MW/S
 FW589+wrkV3t
X-Google-Smtp-Source: AGHT+IEvBbA781RSwVe4ePIHOKR0lt27pa5+qpEG9FaBRXlSS7ShLgGB0Y/rQaX5XHO4hiUiEM9WlA==
X-Received: by 2002:a05:6102:5fc:b0:4af:9cfb:8354 with SMTP id
 ada2fe7eead31-4af9cfb914fmr365741137.11.1733215138170; 
 Tue, 03 Dec 2024 00:38:58 -0800 (PST)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com.
 [209.85.217.45]) by smtp.gmail.com with ESMTPSA id
 a1e0cc1a2514c-85b82a0d359sm2002758241.2.2024.12.03.00.38.57
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Dec 2024 00:38:57 -0800 (PST)
Received: by mail-vs1-f45.google.com with SMTP id
 ada2fe7eead31-4ae82bad101so1178904137.0
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Dec 2024 00:38:57 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVcN4XsoB+nVNh4BRws49aKFDxV9PgE6LMI416J3yatfNof+/7geBVBw7NnLsapdE6ojgy1TfU5VnI=@lists.freedesktop.org
X-Received: by 2002:a05:6102:3587:b0:4af:3cb5:e3b4 with SMTP id
 ada2fe7eead31-4af97273dd1mr2273980137.16.1733215136897; Tue, 03 Dec 2024
 00:38:56 -0800 (PST)
MIME-Version: 1.0
References: <20241203-rcar-gh-dsi-v1-0-738ae1a95d2a@ideasonboard.com>
 <20241203-rcar-gh-dsi-v1-2-738ae1a95d2a@ideasonboard.com>
 <20241203081935.GE10736@pendragon.ideasonboard.com>
In-Reply-To: <20241203081935.GE10736@pendragon.ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 3 Dec 2024 09:38:44 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVZui9c4X0FQ3Xke4gzxa9gvs6Nsp0eh5avzr_G3wd=ig@mail.gmail.com>
Message-ID: <CAMuHMdVZui9c4X0FQ3Xke4gzxa9gvs6Nsp0eh5avzr_G3wd=ig@mail.gmail.com>
Subject: Re: [PATCH 2/9] dt-bindings: display: renesas,du: Add r8a779h0
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, 
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 LUU HOAI <hoai.luu.ub@renesas.com>, Jagan Teki <jagan@amarulasolutions.com>, 
 Sam Ravnborg <sam@ravnborg.org>, Biju Das <biju.das.jz@bp.renesas.com>, 
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
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

Hi Laurent,

On Tue, Dec 3, 2024 at 9:19=E2=80=AFAM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Tue, Dec 03, 2024 at 10:01:36AM +0200, Tomi Valkeinen wrote:
> > From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> >
> > Extend the Renesas DU display bindings to support the r8a779h0 V4M.
> >
> > Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> > ---
> >  Documentation/devicetree/bindings/display/renesas,du.yaml | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/Documentation/devicetree/bindings/display/renesas,du.yaml =
b/Documentation/devicetree/bindings/display/renesas,du.yaml
> > index c5b9e6812bce..d369953f16f7 100644
> > --- a/Documentation/devicetree/bindings/display/renesas,du.yaml
> > +++ b/Documentation/devicetree/bindings/display/renesas,du.yaml
> > @@ -41,6 +41,7 @@ properties:
> >        - renesas,du-r8a77995 # for R-Car D3 compatible DU
> >        - renesas,du-r8a779a0 # for R-Car V3U compatible DU
> >        - renesas,du-r8a779g0 # for R-Car V4H compatible DU
> > +      - renesas,du-r8a779h0 # for R-Car V4M compatible DU
> >
> >    reg:
> >      maxItems: 1
>
> You also need to add h0 to the g0 block in the conditional properties
> below. With that,

Which is not sufficient, as the DU on R-Car V4M has only a single channel,
unlike on R-Car V3U and V4H.

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
