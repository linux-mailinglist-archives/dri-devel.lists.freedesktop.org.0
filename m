Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06592D1EDB3
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jan 2026 13:44:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8F6610E203;
	Wed, 14 Jan 2026 12:44:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
 [209.85.210.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A706210E203
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 12:44:15 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id
 d2e1a72fcca58-81f3fcdb556so2166183b3a.2
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 04:44:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768394655; x=1768999455;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hj+1g0xoern/NZa0KoVGvEg+BidqfC0JY8V0QW/WQj4=;
 b=ZmOZ8fRRq9Wzzt509c/racPj7/004+xrUPEhkiJGeSRVlEOEosPZBRJIH4dyx+2qu6
 j9tUCvUEt8K//RGCnjwqw5h0DwhJyGgAqr8g8LHrG58O3HiKG0u1yH4aiDy5bRCGoJqi
 kNCZxkeTg+15CLQVYa4mWD7EbR2hsYgD9vYOyfcTy7KGguwRw5yu6IYAG87eXIRkS0lR
 0CPZ4zVp35tO665533rjdxFmYBPhoWMm6xViMGcS4Iy8c079inAvUznnPpyIHG79j6Vj
 Gmy9eo5+t1eA9wY9fIqJ6YqwVW9CjB3Zmj0Yhj0Z8FntM/xsOYsjx2rZhA3b6JxKC4xQ
 9Tng==
X-Forwarded-Encrypted: i=1;
 AJvYcCURPuzx61/CQRwFkgzjCyDFblCaI6GjwSXBe5twmtteZudwiJ+W86Rv/F4Lrh+XPNewz/IsDyDx6LM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxueDt03SV7DZTwu6373aL2dK0iiyS6P9dqTDdaE8oZewL+0wTf
 84qPfPWDKswogEgva7Vbx0cmyJHvEjy2ruD34gdZEu3U1QtkD0Rj1KzbmV9cfC4p
X-Gm-Gg: AY/fxX4wU+DuACJLBlqQ55nCd4LxUzlDuFKEi0Pz754v2HeLqhXk/hyKyjpHNxo2Cp+
 XwEL+Kr7a25ykpi2FWoKd862XgddMMybrsP+QgUa7dkpcwMnkbId5oay0jlcQpXSLvZ1dttuVxW
 skOuFjYcEPWgOnKPTEqkYQ/77hd880AGo2OJt5FUZtXvme1QTYQAzciSHklimKpuxJXvfkXvRtk
 2plmz/Bd/acGR8RLvsDZTta9rH8GNUG8GQAmaNLA39EnM+VG2R92x1EIgwJHmlqouN2UiB3JVaG
 r0Dx8RVxLmVfemCwaglpNhjRbgzh+ukbEBudTey0AG6L3jHovfXJbRr1E37n2j0+mRYqq6wM67j
 GMdYrdcU3VmZKIiASqAoc60LMFYrn1q4E97zO1nyTI0W5GUIMlEbGPBOQ+lywkDjZWGhIpTxz7w
 YwcigmeF8Ugmlt5k+0jIpfz+R/GftCvN8D6pTyRW7lVYV0s1s=
X-Received: by 2002:a05:6a20:3d90:b0:35e:7605:56a4 with SMTP id
 adf61e73a8af0-38bed1c471dmr3061246637.51.1768394655064; 
 Wed, 14 Jan 2026 04:44:15 -0800 (PST)
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com.
 [74.125.82.47]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c4cca06b77bsm22804504a12.33.2026.01.14.04.44.14
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Jan 2026 04:44:14 -0800 (PST)
Received: by mail-dl1-f47.google.com with SMTP id
 a92af1059eb24-12336c0a8b6so371801c88.1
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 04:44:14 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUX4CsD4i/bB8KgvJ5TWBdMOicl3gpSP/gVBD80VMpyAVmnVgtizaiH7PyaduxrUGYgHIBKgLtpNlc=@lists.freedesktop.org
X-Received: by 2002:a05:6102:3e0f:b0:5ea:67f4:c1ad with SMTP id
 ada2fe7eead31-5f17f5c4c79mr942660137.21.1768394289171; Wed, 14 Jan 2026
 04:38:09 -0800 (PST)
MIME-Version: 1.0
References: <cover.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
 <fcfc4fc5123c2351d96ac102aa5081bd99c8a40e.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
 <20251203-shrew-of-original-tempering-8a8cfc@quoll>
 <aTA-Hj6DvjN4zeK6@tom-desktop>
In-Reply-To: <aTA-Hj6DvjN4zeK6@tom-desktop>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 14 Jan 2026 13:37:58 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW=UkZxhf-pbtp6OBFd_3jPcjUaKFmH4piuc+P=kgxzGA@mail.gmail.com>
X-Gm-Features: AZwV_Qj82EmcdFo9GBygajeXpLdMczZEl-yzaqrHERtstQ_T42ZqMwts5Zu_4K4
Message-ID: <CAMuHMdW=UkZxhf-pbtp6OBFd_3jPcjUaKFmH4piuc+P=kgxzGA@mail.gmail.com>
Subject: Re: [PATCH 10/22] dt-bindings: display: renesas, rzg2l-du: Add support
 for RZ/G3E SoC
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, tomm.merciai@gmail.com, 
 linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
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

Hi Tommaso,

On Wed, 3 Dec 2025 at 14:42, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> On Wed, Dec 03, 2025 at 09:23:53AM +0100, Krzysztof Kozlowski wrote:
> > On Wed, Nov 26, 2025 at 03:07:22PM +0100, Tommaso Merciai wrote:
> > > The RZ/G3E Soc has 2 LCD controller (LCDC), contain a Frame Compression
> > > Processor (FCPVD), a Video Signal Processor (VSPD), Video Signal
> > > Processor (VSPD), and Display Unit (DU).
> > >
> > >  - LCDC0 supports DSI and LVDS (single or dual-channel) outputs.
> > >  - LCDC1 supports DSI, LVDS (single-channel), and RGB outputs.
> > >
> > > Add then two new SoC-specific compatible strings 'renesas,r9a09g047-du0'
> > > and 'renesas,r9a09g047-du1'.
> >
> > LCDC0/1 but compatibles du0/du1...
> >
> > What are the differences between DU0 and DU1? Just different outputs? Is
> > the programming model the same?
>
> The hardware configurations are different: these are two distinct hardware blocks.
>
> Based on the block diagrams shown in Figures 9.4-2 (LCDC1) and 9.4-1 (LCDC0),
> the only difference concerns the output, but this variation is internal to the
> hardware blocks themselves.
> Therefore, LCDC0 and LCDC1 are not identical blocks, and their programming models
> differ as a result.
>
> In summary, although most of the internal functions are the same, the two blocks
> have output signals connected to different components within the SoC.
> This requires different hardware configurations and inevitably leads to different
> programming models for LCDC0 and LCDC1.

Isn't that merely an SoC integration issue?
Are there any differences in programming LCDC0 or LCDC1 for the
common output types supported by both (single channel LVDS and 4-lane
MIPI-DSI)?

Of there are no such differences, both instances should use the same
compatible value.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
