Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09F19805620
	for <lists+dri-devel@lfdr.de>; Tue,  5 Dec 2023 14:36:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D8E510E535;
	Tue,  5 Dec 2023 13:36:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com
 [209.85.160.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12C6110E535
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Dec 2023 13:36:35 +0000 (UTC)
Received: by mail-oa1-f44.google.com with SMTP id
 586e51a60fabf-1efb9571b13so2637667fac.2
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Dec 2023 05:36:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701783394; x=1702388194;
 h=date:subject:message-id:references:in-reply-to:cc:to:from
 :mime-version:content-transfer-encoding:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=ATJhxmNw/sqJ3amYElSUOa0ZiBdGk96C405IzrIF1IA=;
 b=woy+CNwNeCWMnZ55M/vRDqV8IdZZrvV6UcVzNrtstJFbrZWHKVPskasymunbFzFGs8
 Vv02kugzVpRr57sb7XxCSR3RIk1jzybBoZ9k5QDKup2RovZLGz5WOMocda82KfhQx60l
 b5O0Ev2gRKnIaBdXfM6qCJl+5hbgxSMpveTCmqD/zj98oStTRiVKMl3oW9UqlLWRLrZS
 wHKJL9pm9dr+HiT22CEwQXJU5lHo9pnmp5CToRGyUVcxv/AMVQqnwJBat3ckWojIqtRe
 sC8UYsHLpq91nk54sEmk85xuwJ6SyHOWqMnhX+yhccQIooGHUXO52ew9tNOeCWpBiM+e
 MEKQ==
X-Gm-Message-State: AOJu0YwS+IVd4CLFlnlhn3KCbv1/FTcUWTnAZmbJXqe650bH9seYoWV4
 Ec2pPhubKG8Ui9QUeQQAAg==
X-Google-Smtp-Source: AGHT+IHpax4H+EuTffsdMbFAaxu0ifdWtpe/c2kmwKYnFq10+iJjBG535HfA/1jEH708VOJPGAni2g==
X-Received: by 2002:a05:6871:149:b0:1fb:75a:7799 with SMTP id
 z9-20020a056871014900b001fb075a7799mr5314173oab.74.1701783393692; 
 Tue, 05 Dec 2023 05:36:33 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 qa18-20020a056871e71200b001fb30b8bb40sm1648439oac.41.2023.12.05.05.36.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Dec 2023 05:36:33 -0800 (PST)
Received: (nullmailer pid 2871587 invoked by uid 1000);
 Tue, 05 Dec 2023 13:36:30 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Yoshinori Sato <ysato@users.sourceforge.jp>
In-Reply-To: <f671beae8a8ebfd361f4c903bccce713135a169f.1701768028.git.ysato@users.sourceforge.jp>
References: <cover.1701768028.git.ysato@users.sourceforge.jp>
 <f671beae8a8ebfd361f4c903bccce713135a169f.1701768028.git.ysato@users.sourceforge.jp>
Message-Id: <170178306217.2865593.13906216780533956456.robh@kernel.org>
Subject: Re: [DO NOT MERGE v5 22/37] dt-bindings: display: smi,sm501: SMI
 SM501 binding json-schema
Date: Tue, 05 Dec 2023 07:36:30 -0600
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
Cc: =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
 linux-fbdev@vger.kernel.org, Rich Felker <dalias@libc.org>,
 Herve Codina <herve.codina@bootlin.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-sh@vger.kernel.org,
 linux-pci@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
 Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 Max Filippov <jcmvbkbc@gmail.com>, Guo Ren <guoren@kernel.org>,
 Lee Jones <lee@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Hyeonggon Yoo <42.hyeyoo@gmail.com>, Jiri Slaby <jirislaby@kernel.org>,
 linux-clk@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Baoquan He <bhe@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Helge Deller <deller@gmx.de>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Magnus Damm <magnus.damm@gmail.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-serial@vger.kernel.org,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Guenter Roeck <linux@roeck-us.net>,
 devicetree@vger.kernel.org, Jacky Huang <ychuang3@nuvoton.com>,
 Arnd Bergmann <arnd@arndb.de>, David Rientjes <rientjes@google.com>,
 Bin Meng <bmeng@tinylab.org>, Maxime Ripard <mripard@kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>, Rob Herring <robh+dt@kernel.org>,
 Palmer Dabbelt <palmer@rivosinc.com>, Chris Morgan <macromorgan@hotmail.com>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>,
 Vlastimil Babka <vbabka@suse.cz>, Sergey Shtylyov <s.shtylyov@omp.ru>,
 linux-ide@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, Biju Das <biju.das.jz@bp.renesas.com>,
 linux-kernel@vger.kernel.org, Azeem Shaikh <azeemshaikh38@gmail.com>,
 linux-renesas-soc@vger.kernel.org, Tom Rix <trix@redhat.com>,
 Damien Le Moal <dlemoal@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>,
 Andrew Morton <akpm@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Tue, 05 Dec 2023 18:45:41 +0900, Yoshinori Sato wrote:
> Define SM501 functions and modes.
> 
> Signed-off-by: Yoshinori Sato <ysato@users.sourceforge.jp>
> ---
>  .../bindings/display/smi,sm501.yaml           | 134 ++++++++++++++++++
>  include/dt-bindings/display/sm501.h           |  25 ++++
>  2 files changed, 159 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/smi,sm501.yaml
>  create mode 100644 include/dt-bindings/display/sm501.h
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/smi,sm501.yaml: interrupt-name: missing type definition
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/smi,sm501.yaml: edid: missing type definition
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/smi,sm501.yaml: crt: missing type definition

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/f671beae8a8ebfd361f4c903bccce713135a169f.1701768028.git.ysato@users.sourceforge.jp

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

