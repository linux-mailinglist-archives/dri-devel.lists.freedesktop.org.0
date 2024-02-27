Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65ADC869C38
	for <lists+dri-devel@lfdr.de>; Tue, 27 Feb 2024 17:35:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5CD210E934;
	Tue, 27 Feb 2024 16:34:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com
 [209.85.160.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C68F10E2D8
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Feb 2024 16:34:56 +0000 (UTC)
Received: by mail-qt1-f173.google.com with SMTP id
 d75a77b69052e-42a0ba5098bso26913711cf.0
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Feb 2024 08:34:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709051695; x=1709656495;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BFhsBrNB0ZxotPvr7uksusf/c5UzUanJ2CNxp9l9FzM=;
 b=VNo8sfEtajza4i5jhuxMoj4QaqHGpvy7sczgItqEPk3fboaTwQPOfZS+7DwO8hF/Db
 vCVwua7ahAkcWE/jYHWQTQgVZa5Zp19SYZXoWatBgaV65MVgMEdaHC8cu5uXX5i/42RE
 R6QZxPxox80BnxbCucKaQOx8qbhbJ9WRHlt9D9Xzw68VeuCi/fuE/1aH74swdyrvnnky
 thbORO1s80/NZ0hEFXpPZ8SmmVEO2tM4hqilZeLKjIwSx6b80fYKw6EXtbIvJBY0sS4U
 WnBv2o2awQ2iSULPYD1wrFdTG5nu0YqqDlDfpIgZn/JFn5P3oyD/cq45R5xyKQB0yunA
 1o2g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWLgbiwtr5Tb7euIo50hXI10EBxaNW5GZHlU6ViPwhKYwGkYHB68gXYiD1nu4VgGjjGXjeosUIQi3w81rveBDeywitNoqMBZAC2Opn8e6b6
X-Gm-Message-State: AOJu0YyEx1CpJjJB4l//OuItw6kyv8gNpXvfDR6ViyS7nb3HL/Om9+ci
 ECpIFFEss45MFKPg4ViB6y1yeQrjl54gLqGY98n7sdBqhJ8tf02Q3Fe41NVh9xE63g==
X-Google-Smtp-Source: AGHT+IEkfACweyCmuEvOTy1UBjEyvaTVXlh3L8ygJ+x456GcAAGhEreBEeEvQ1UVXrsQFgfNC+f+cw==
X-Received: by 2002:a05:622a:174d:b0:42e:620b:8d7 with SMTP id
 l13-20020a05622a174d00b0042e620b08d7mr9867734qtk.14.1709051694840; 
 Tue, 27 Feb 2024 08:34:54 -0800 (PST)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com.
 [209.85.160.172]) by smtp.gmail.com with ESMTPSA id
 j22-20020a05620a147600b007876a732823sm3743158qkl.25.2024.02.27.08.34.54
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Feb 2024 08:34:54 -0800 (PST)
Received: by mail-qt1-f172.google.com with SMTP id
 d75a77b69052e-42a0ba5098bso26913601cf.0
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Feb 2024 08:34:54 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWN2fPSnivuYnQOAM8BbaovhE6osRFzmuEASUIRzv9ko88EUp5Sw6HV8KaCLLm6/9KhoTqwxq2Y6UT9Q1WFerWDxUabkZJU2drGN08dbH8m
X-Received: by 2002:a25:dc07:0:b0:dcf:9019:a2fe with SMTP id
 y7-20020a25dc07000000b00dcf9019a2femr2483100ybe.64.1709051673849; Tue, 27 Feb
 2024 08:34:33 -0800 (PST)
MIME-Version: 1.0
References: <cover.1704788539.git.ysato@users.sourceforge.jp>
 <28b339d21fa7b74c75f181d3dc710f667da5f228.1704788539.git.ysato@users.sourceforge.jp>
In-Reply-To: <28b339d21fa7b74c75f181d3dc710f667da5f228.1704788539.git.ysato@users.sourceforge.jp>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 27 Feb 2024 17:34:21 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVPSDdjGa=AF_9g_RMSv2iv862WVcrmAgvPay+ceNrzgQ@mail.gmail.com>
Message-ID: <CAMuHMdVPSDdjGa=AF_9g_RMSv2iv862WVcrmAgvPay+ceNrzgQ@mail.gmail.com>
Subject: Re: [DO NOT MERGE v6 15/37] clk: renesas: Add SH7750/7751 CPG Driver
To: Yoshinori Sato <ysato@users.sourceforge.jp>
Cc: linux-sh@vger.kernel.org, Damien Le Moal <dlemoal@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Thomas Gleixner <tglx@linutronix.de>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Bjorn Helgaas <bhelgaas@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, Rich Felker <dalias@libc.org>, 
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Lee Jones <lee@kernel.org>, 
 Helge Deller <deller@gmx.de>, Heiko Stuebner <heiko@sntech.de>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Chris Morgan <macromorgan@hotmail.com>, 
 Yang Xiwen <forbidden405@foxmail.com>, Sebastian Reichel <sre@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, Randy Dunlap <rdunlap@infradead.org>,
 Arnd Bergmann <arnd@arndb.de>, Vlastimil Babka <vbabka@suse.cz>,
 Hyeonggon Yoo <42.hyeyoo@gmail.com>, 
 David Rientjes <rientjes@google.com>, Baoquan He <bhe@redhat.com>, 
 Andrew Morton <akpm@linux-foundation.org>, Guenter Roeck <linux@roeck-us.net>, 
 Stephen Rothwell <sfr@canb.auug.org.au>, Azeem Shaikh <azeemshaikh38@gmail.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Max Filippov <jcmvbkbc@gmail.com>, 
 Palmer Dabbelt <palmer@rivosinc.com>, Bin Meng <bmeng@tinylab.org>, 
 Jonathan Corbet <corbet@lwn.net>, Jacky Huang <ychuang3@nuvoton.com>, 
 Lukas Bulwahn <lukas.bulwahn@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Sam Ravnborg <sam@ravnborg.org>, Sergey Shtylyov <s.shtylyov@omp.ru>, 
 Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>, 
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

On Tue, Jan 9, 2024 at 9:24=E2=80=AFAM Yoshinori Sato
<ysato@users.sourceforge.jp> wrote:
> Renesas SH7750 and SH7751 series CPG driver.
> This driver supported frequency control and clock gating.
>
> Signed-off-by: Yoshinori Sato <ysato@users.sourceforge.jp>

Thanks for your patch!

> --- a/drivers/clk/renesas/Kconfig
> +++ b/drivers/clk/renesas/Kconfig
> @@ -193,6 +196,10 @@ config CLK_SH73A0
>         select CLK_RENESAS_CPG_MSTP
>         select CLK_RENESAS_DIV6
>
> +config CLK_SH7750
> +       bool "SH7750/7751 family clock support" if COMPILE_TEST
> +       help
> +         This is a driver for SH7750 / SH7751 CPG.

This is a duplicate of the below. Please drop it.

>
>  # Family
>  config CLK_RCAR_CPG_LIB
> @@ -223,6 +230,11 @@ config CLK_RZG2L
>         bool "Renesas RZ/{G2L,G2UL,G3S,V2L} family clock support" if COMP=
ILE_TEST
>         select RESET_CONTROLLER
>
> +config CLK_SH7750
> +       bool "Renesas SH7750/7751 family clock support" if COMPILE_TEST
> +       help
> +         This is a driver for SH7750 / SH7751 CPG.
> +
>  # Generic
>  config CLK_RENESAS_CPG_MSSR
>         bool "CPG/MSSR clock support" if COMPILE_TEST

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
> +       if (ret < 0) {
> +               pr_err("%s: failed to register %s pll clock (%d)\n",
> +                      __func__, clk_name, ret);
> +               return ret;
> +       }
> +       if (ret < 0)
> +               pr_err("%s: failed to add provider %s (%d)\n",
> +                      __func__, clk_name, ret);

Bogus check and error message.

> +       return ret;
> +}

> +static int register_div(struct device_node *node, struct cpg_priv *cpg)
> +{
> +       static const char * const divout[] =3D {
> +               "fck", "bck", "ick",
> +       };
> +       static const char * const stbcrout[] =3D {
> +               "sci_clk", "rtc_clk", "tmu012_clk",     /* STBCR */
> +               "scif_clk", "dmac_clk",                 /* STBCR */
> +               "ubc_clk", "sq_clk",                    /* STBCR2 */
> +       };
> +       static const char * const clkstpout[] =3D {
> +               "intc_clk", "tmu34_clk", "pcic_clk",    /* CLKSTP00 */
> +       };
> +
> +       unsigned int i;
> +       int ret;
> +       struct clk_hw_onecell_data *data;
> +       struct clk_hw *reg_hw;
> +       int num_clk =3D ARRAY_SIZE(divout) + ARRAY_SIZE(stbcrout) + ARRAY=
_SIZE(clkstpout);
> +
> +       data =3D kzalloc(struct_size(data, hws, num_clk + 1), GFP_KERNEL)=
;
> +       if (!data)
> +               return -ENOMEM;
> +
> +       num_clk =3D 0;
> +       for (i =3D 0; i < ARRAY_SIZE(divout); i++) {
> +               reg_hw =3D __clk_hw_register_divider(NULL, node, divout[i=
],
> +                                                  PLLOUT, NULL, NULL,
> +                                                  0, cpg->frqcr, i * 3, =
3,
> +                                                  CLK_DIVIDER_REG_16BIT,
> +                                                  (i =3D=3D 0) ? pdiv_ta=
ble : div_table,
> +                                                  &cpg->clklock);
> +               if (IS_ERR(reg_hw)) {
> +                       ret =3D PTR_ERR(reg_hw);
> +                       goto error;
> +               }
> +               data->hws[num_clk++] =3D reg_hw;
> +       }
> +       for (i =3D 0; i < ARRAY_SIZE(stbcrout); i++) {
> +               u32 off =3D  (i < 5) ? STBCR : STBCR2;
> +
> +               if (i >=3D 5 && !(cpg->feat & MSTP_CR2))
> +                       break;

Alternatively, you could set the maximum loop counter upfront

    n =3D cpg->feat & MSTP_CR2 ? ARRAY_SIZE(stbcrout) : 5;
    for (i =3D 0; i < n; i++) ...

> +               reg_hw =3D __clk_hw_register_gate(NULL, node, stbcrout[i]=
,
> +                                               divout[0], NULL, NULL,
> +                                               0, cpg->frqcr + off, i % =
5,
> +                                               CLK_GATE_REG_8BIT | CLK_G=
ATE_SET_TO_DISABLE,
> +                                               &cpg->clklock);
> +               if (IS_ERR(reg_hw)) {
> +                       ret =3D PTR_ERR(reg_hw);
> +                       goto error;
> +               }
> +               data->hws[num_clk++] =3D reg_hw;
> +       }
> +       if (cpg->feat & MSTP_CLKSTP) {
> +               for (i =3D 0; i < ARRAY_SIZE(clkstpout); i++) {
> +                       if (i =3D=3D 2 && !(cpg->feat & MSTP_CSTP2))
> +                               continue;

Set maximum loop counter upfront?

> +                       reg_hw =3D clk_hw_register_clkstp(node, clkstpout=
[i],
> +                                                       divout[0], cpg->c=
lkstp00,
> +                                                       i, &cpg->clklock)=
;
> +                       if (IS_ERR(reg_hw)) {
> +                               ret =3D PTR_ERR(reg_hw);
> +                               goto error;
> +                       }
> +                       data->hws[num_clk++] =3D reg_hw;
> +               }
> +       }
> +       data->num =3D num_clk;
> +       ret =3D of_clk_add_hw_provider(node, of_clk_hw_onecell_get, data)=
;
> +       if (ret < 0)
> +               goto error;
> +       return 0;
> +
> +error:
> +       pr_err("%pOF: failed to register clock (%d)\n",
> +                      node, ret);
> +       for (num_clk--; num_clk >=3D 0; num_clk--)
> +               kfree(data->hws[num_clk]);
> +       kfree(data);
> +       return ret;
> +}
> +
> +static struct cpg_priv *sh7750_cpg_setup(struct device_node *node, u32 f=
eat)
> +{
> +       unsigned int num_parents;
> +       u32 mode;
> +       struct cpg_priv *cpg;
> +       int ret =3D 0;
> +
> +       num_parents =3D of_clk_get_parent_count(node);
> +       if (num_parents < 1) {
> +               pr_err("%s: no parent found", node->name);
> +               return ERR_PTR(-ENODEV);
> +       }

Do you need num_parents?

> +
> +       of_property_read_u32_index(node, "renesas,mode", 0, &mode);

mode may be used uninitialized, if "renesas,mode" is missing.

> +       if (mode >=3D 7) {
> +               pr_err("%s: Invalid clock mode setting (%u)\n",
> +                      node->name, mode);
> +               return ERR_PTR(-EINVAL);
> +       }
> +
> +       cpg =3D kzalloc(sizeof(struct cpg_priv), GFP_KERNEL);
> +       if (!cpg)
> +               return ERR_PTR(-ENOMEM);
> +
> +       cpg->frqcr =3D of_iomap(node, 0);
> +       if (cpg->frqcr =3D=3D NULL) {
> +               pr_err("%pOF: failed to map divide register", node);
> +               ret =3D -ENODEV;
> +               goto cpg_free;
> +       }
> +
> +       if (feat & MSTP_CLKSTP) {
> +               cpg->clkstp00 =3D of_iomap(node, 1);
> +               if (cpg->clkstp00 =3D=3D NULL) {
> +                       pr_err("%pOF: failed to map clkstp00 register", n=
ode);
> +                       ret =3D -ENODEV;
> +                       goto unmap_frqcr;
> +               }
> +       }
> +       cpg->feat =3D feat;
> +       cpg->mode =3D mode;
> +
> +       ret =3D register_pll(node, cpg);
> +       if (ret < 0)
> +               goto unmap_clkstp00;
> +
> +       ret =3D register_div(node, cpg);
> +       if (ret < 0)
> +               goto unmap_clkstp00;
> +

Perhaps "cpg_data =3D cpg;" here, and return an error code instead? ...

> +       return cpg;
> +
> +unmap_clkstp00:
> +       iounmap(cpg->clkstp00);
> +unmap_frqcr:
> +       iounmap(cpg->frqcr);
> +cpg_free:
> +       kfree(cpg);
> +       return ERR_PTR(ret);
> +}
> +
> +static void __init sh7750_cpg_init(struct device_node *node)
> +{
> +       cpg_data =3D sh7750_cpg_setup(node, cpg_feature[CPG_SH7750]);
> +       if (IS_ERR(cpg_data))
> +               cpg_data =3D NULL;

... then all cpg_data handling can be removed here...

> +}

> +static int sh7750_cpg_probe(struct platform_device *pdev)
> +{
> +       u32 feature;
> +
> +       if (cpg_data)
> +               return 0;
> +       feature =3D *(u32 *)of_device_get_match_data(&pdev->dev);
> +       cpg_data =3D sh7750_cpg_setup(pdev->dev.of_node, feature);
> +       if (IS_ERR(cpg_data))
> +               return PTR_ERR(cpg_data);
> +       return 0;

... and this can be simplified to

    return sh7750_cpg_setup(...);

> +}

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
