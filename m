Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C19518CA92A
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2024 09:42:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E06110E1DF;
	Tue, 21 May 2024 07:42:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com
 [209.85.210.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D13E10E1DF
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2024 07:41:55 +0000 (UTC)
Received: by mail-ot1-f51.google.com with SMTP id
 46e09a7af769-6f1242f1dcdso2060813a34.3
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2024 00:41:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716277311; x=1716882111;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WETFSWDeBrd8hie/jL0FRiOzrF4PlBR3z9DNDu6qHzE=;
 b=EYYIKOMZ0IAKKO4TXWPZy1vjkg0PuIB5MR2nh50m4tz7ZDhBejgZ+PfhObFhNCJ3xE
 jncJnqTyzDczF5XBMdRwUNQnTAmnjqeXADWAGD4gmHem5/yac0HAQ/INOjvqHZirh4Ng
 Oe9iJjziWifg/Fvol4myzzjhTc8nZQI2WbkpGDxLMdznOY5fBB2fAmnlDzBUP5s5+E3X
 beLQbYDqE/Uk0rl9snFpQab/boVQUJWmtJixjz0P49pWKdkHEtnhOesn7VN/wRzblLis
 MXM/bti4y7xzmuRQqbMP0R04zhKshsNirUNFprYUAIr0S8H/aREVsDrQVjTkry5XcoWo
 8NfA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVCIytYRkED95X/KYveD7t3E3cr49kg4s8zsrn/KqrwCetcD2K1dv2MwLkB6JzcnTYlbr6YaCHA0JJJETEfUhDtxLu//XGYxIU4RbtdR29y
X-Gm-Message-State: AOJu0YxMVvtoqT+2YO35zCXBS3lZvgzrBDa+hVxNpDMTh23exnlXNJHW
 Hi9MOJj+aZSFZ1+mLnYLgDM3rlWf32kULX+qH9rN4Jn4z4pZsU1u/uO724i4
X-Google-Smtp-Source: AGHT+IFe8V8ADkTqtL5O6SIODe/TsV2DxVIdODtHyBuEZ5e8LHP+zqr3OelUHhML6BfkVDePRNzdnw==
X-Received: by 2002:a9d:5d19:0:b0:6f0:e5d4:ccf3 with SMTP id
 46e09a7af769-6f0e91336afmr32003841a34.15.1716277311230; 
 Tue, 21 May 2024 00:41:51 -0700 (PDT)
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com.
 [209.85.161.42]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-6f1032e1a4asm3358366a34.72.2024.05.21.00.41.49
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 May 2024 00:41:50 -0700 (PDT)
Received: by mail-oo1-f42.google.com with SMTP id
 006d021491bc7-5b2761611e8so2527000eaf.2
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2024 00:41:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUym6RTGJZLcV4BPHrj/k+SCk9r9zyYsJbMHFRfVff+dGfxasCs/nQGhN3IVKW5Jqj2CZm8mSp0OEvhrZI+7XSTKNQ+/45D8MLsVcSUP4Ue
X-Received: by 2002:a05:6902:220c:b0:de8:a770:4812 with SMTP id
 3f1490d57ef6-df4a41d6187mr6078081276.40.1716277288715; Tue, 21 May 2024
 00:41:28 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1712207606.git.ysato@users.sourceforge.jp>
 <0a30dbe6d096c38d612279349293162a2ccca149.1712207606.git.ysato@users.sourceforge.jp>
In-Reply-To: <0a30dbe6d096c38d612279349293162a2ccca149.1712207606.git.ysato@users.sourceforge.jp>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 21 May 2024 09:41:17 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUQ4u2yiDbEobVqD5y_MtU+XU19cx_kWT66yv1jGZMk6Q@mail.gmail.com>
Message-ID: <CAMuHMdUQ4u2yiDbEobVqD5y_MtU+XU19cx_kWT66yv1jGZMk6Q@mail.gmail.com>
Subject: Re: [RESEND v7 15/37] clk: renesas: Add SH7750/7751 CPG Driver
To: Yoshinori Sato <ysato@users.sourceforge.jp>
Cc: linux-sh@vger.kernel.org, Damien Le Moal <dlemoal@kernel.org>, 
 Niklas Cassel <cassel@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Thomas Gleixner <tglx@linutronix.de>, 
 Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, 
 Magnus Damm <magnus.damm@gmail.com>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Rich Felker <dalias@libc.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
 Lee Jones <lee@kernel.org>, Helge Deller <deller@gmx.de>, 
 Heiko Stuebner <heiko.stuebner@cherry.de>, Shawn Guo <shawnguo@kernel.org>, 
 Sebastian Reichel <sre@kernel.org>, Chris Morgan <macromorgan@hotmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
 David Rientjes <rientjes@google.com>, Hyeonggon Yoo <42.hyeyoo@gmail.com>, 
 Vlastimil Babka <vbabka@suse.cz>, Baoquan He <bhe@redhat.com>, 
 Andrew Morton <akpm@linux-foundation.org>, Guenter Roeck <linux@roeck-us.net>, 
 Kefeng Wang <wangkefeng.wang@huawei.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>, 
 Javier Martinez Canillas <javierm@redhat.com>, Guo Ren <guoren@kernel.org>, 
 Azeem Shaikh <azeemshaikh38@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>, 
 Jonathan Corbet <corbet@lwn.net>, Jacky Huang <ychuang3@nuvoton.com>, 
 Herve Codina <herve.codina@bootlin.com>, 
 Manikanta Guntupalli <manikanta.guntupalli@amd.com>,
 Anup Patel <apatel@ventanamicro.com>, 
 Biju Das <biju.das.jz@bp.renesas.com>, 
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Sam Ravnborg <sam@ravnborg.org>, Sergey Shtylyov <s.shtylyov@omp.ru>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 linux-ide@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-pci@vger.kernel.org, 
 linux-serial@vger.kernel.org, linux-fbdev@vger.kernel.org
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

Hi Sato-san,

On Thu, Apr 4, 2024 at 7:15=E2=80=AFAM Yoshinori Sato
<ysato@users.sourceforge.jp> wrote:
> Renesas SH7750 and SH7751 series CPG driver.
> This driver supported frequency control and clock gating.
>
> Signed-off-by: Yoshinori Sato <ysato@users.sourceforge.jp>

Thanks for the update!

As you plan to send a v8 soon, I'm sending you a comment from the
(incomplete) review I started a while ago...

> --- /dev/null
> +++ b/drivers/clk/renesas/clk-sh7750.c

> +static int register_pll(struct device_node *node, struct cpg_priv *cpg)
> +{
> +       const char *clk_name =3D node->name;
> +       const char *parent_name;
> +       struct clk_init_data init =3D {
> +               .name =3D PLLOUT,
> +               .ops =3D &pll_ops,
> +               .flags =3D 0,
> +               .num_parents =3D 1,
> +       };
> +       int ret;
> +
> +       parent_name =3D of_clk_get_parent_name(node, 0);
> +       init.parent_names =3D &parent_name;
> +       cpg->hw.init =3D &init;
> +
> +       ret =3D of_clk_hw_register(node, &cpg->hw);
> +       if (ret < 0)
> +               pr_err("%pOF: failed to add provider %s (%d)\n",

I think you retained the wrong error message?
"%s: failed to register %s pll clock (%d)\n" sounds more suitable to me.

> +                      node, clk_name, ret);
> +       return ret;
> +}

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
