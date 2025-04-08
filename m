Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A060A7FB95
	for <lists+dri-devel@lfdr.de>; Tue,  8 Apr 2025 12:22:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FEDC10E629;
	Tue,  8 Apr 2025 10:22:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com
 [209.85.222.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA90310E1B6;
 Tue,  8 Apr 2025 10:22:38 +0000 (UTC)
Received: by mail-ua1-f43.google.com with SMTP id
 a1e0cc1a2514c-86fbb48fc7fso2206344241.2; 
 Tue, 08 Apr 2025 03:22:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744107756; x=1744712556;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SsrLZDcWMMgz5qw73ZarBN4RUT9hrtTKFIK6rblk8+Q=;
 b=lm/ZS/sv8arx94+K44Egu34etTi5wQ0btuHzNPVMO+APTX51sXblclE8F2xic+zisl
 SWJprctHnbtCUdjQtEPH666VgH8TG3jXesWnYXpdsX7ZGZ8DCAfPZZmtos3uB8O7jyjE
 3bAEGgHQpn8JK++5IZG6V/VAscHcj0JezoQ5IvP++fseuKxcPNq2T48MVaNR+pjEEGnW
 XVkT0TMSrRrodyVDIfw0dGdUPn1DjGZQ9M0tQ3+s4mEtavwqAtT120bn1EuqVusC0jDt
 9lzra6LYhJ93pDczaOcfr+lG2DTgkKAZ2Ftpfn2+LNGYOmKIgurq7YEhKB5ojl144NEE
 oM5Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCU+qbMCQwocOmbKelBc7R+eOR+tmNILjli9HzUvhMca+rIJJ2FE20iwZ8Q+/b3iMyANqZBB9Fszbd4=@lists.freedesktop.org,
 AJvYcCW+J/zN+T2Y+30xJIxEbyFdv0iCsH7H6tW00HEBq3s8dTp5DK2fTnJWYivOK9ptf5AQRYY/P8BN+Q==@lists.freedesktop.org,
 AJvYcCWIivXAWXmeGzc8fv4Waj3/7/T/dxK6yMnKoGdTCvyVmR8Ui9Iif4Zq2aaR7938PEcDXZIunAl30aET@lists.freedesktop.org,
 AJvYcCXoDrJZpeLE5POeEOKD0NSzA7HwDEdFS6LQ7znUe2bgRUSQUxTiS/f/alV4En4KFVXPetzr3rZ7jqYsocE=@lists.freedesktop.org,
 AJvYcCXp8BqQhp9pEC3H5pIUJ/cYwc8+cpnMWnp08qxwxFAHvPi5txiW7EyvHyd3U0DN/8boSdwAfMQt@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy98Fy37oBzqfiBr4YEBsBFd6Nv59u8j+seKKn3Dc0K8aZoie0w
 Vgpb01qKw1fKsL6QHzzwa9maI3e369DM5jpWkLlIsXt8XgTgOB9o9dO98REP
X-Gm-Gg: ASbGncsSuzikQzihBbDtlAnkSHgrrImMDAu41UxSAP9A6NFTMgMDZ8AgCpw8ffR0D8E
 GOwXFWhLM6vzn2m9jymnO7xtfk055D8/i3qRs5LpPpYQ5EingDyCjbJwSqKhASXCMfsvnl/vXhl
 AHN44ici6i8lFaLbaNUgepVFCu+BGqfAN0Z1aBHFBPSSe0H8YwRVM/EluMdZkb5LqIjCJs18UyP
 dHHxJkG7embJhenBk2+BDXzpHWOqv9w6PFK3JH+PncQ3NJ0Rw9I8KAlseah1Ym64b70pbqBvgUd
 7KyBmvqDf4jQVjroYv+jjWdjqkdg4P/LDxX+eupy1Z8fL+xBXS+awmWTuR7NwltphjffW5Q3lXD
 sMFHm+9qEV+A=
X-Google-Smtp-Source: AGHT+IEu3/WALeb+M1gb4eg0+1+Zi5CNrsqyjVsWR7pnaKjL+f0FR1Q6MkGM5f8ZZooLJYyS9DkQFQ==
X-Received: by 2002:a05:6102:f88:b0:4c3:858:f07c with SMTP id
 ada2fe7eead31-4c856901e0dmr11101080137.14.1744107756292; 
 Tue, 08 Apr 2025 03:22:36 -0700 (PDT)
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com.
 [209.85.221.169]) by smtp.gmail.com with ESMTPSA id
 ada2fe7eead31-4c9b457dee6sm292970137.19.2025.04.08.03.22.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Apr 2025 03:22:35 -0700 (PDT)
Received: by mail-vk1-f169.google.com with SMTP id
 71dfb90a1353d-525b44ec88aso2690488e0c.3; 
 Tue, 08 Apr 2025 03:22:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCU7gB3d+u825eaDYGNt/t37J+g2zTk8eI37b9l9yMk6o/r04Y1iDz/tXPlBZngpvXH7I3a8BzGZ@lists.freedesktop.org,
 AJvYcCUD6fjvbtVv8JfzSbwIHR079op518vtTPLfx+oWaodSb2/lw2i3qc2zjhUWzoT22ztGuzVWxNZryUs=@lists.freedesktop.org,
 AJvYcCUf121ITyiDFN30KQP+uVehEetmh/zRtdJSpw59nuLZiXB0kvAU0fh10Omtzr0R3C7V4sn/tHNxpg==@lists.freedesktop.org,
 AJvYcCW3GNZGvJ8ukpJGC9Nq6neen01JrRJLEwC31Xn9y+I+WOjYZTfvYGN4weYkH92ei2Z85VrFntrjCc9J@lists.freedesktop.org,
 AJvYcCXOIf2W8gSSjXT6/Ny9gDJG1eboq2ugieMa+ZsmLEfBwhqrLRiHtQwiBaD70Z5hsp2C6u10LNEIIDOtUoo=@lists.freedesktop.org
X-Received: by 2002:a05:6102:2b91:b0:4c4:e415:6737 with SMTP id
 ada2fe7eead31-4c856a8cf46mr12241766137.23.1744107755579; Tue, 08 Apr 2025
 03:22:35 -0700 (PDT)
MIME-Version: 1.0
References: <20250407104025.3421624-1-arnd@kernel.org>
In-Reply-To: <20250407104025.3421624-1-arnd@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 8 Apr 2025 12:22:23 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWN=wurw7qz0t2ovMkUNu0BJRAMv_0U63Lqs2MGxkVnHw@mail.gmail.com>
X-Gm-Features: ATxdqUE9l7FjkqlZMDiGBpUM7CUSkyfcARh2bgkw-zOenNlQ3qLl0OOY1x_PRRI
Message-ID: <CAMuHMdWN=wurw7qz0t2ovMkUNu0BJRAMv_0U63Lqs2MGxkVnHw@mail.gmail.com>
Subject: Re: [RFC] PCI: add CONFIG_MMU dependency
To: Arnd Bergmann <arnd@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Arnd Bergmann <arnd@arndb.de>, 
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>, Carl Vanderlip <quic_carlv@quicinc.com>,
 Oded Gabbay <ogabbay@kernel.org>, Takashi Sakamoto <o-takashi@sakamocchi.jp>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Dave Airlie <airlied@redhat.com>, Jocelyn Falempe <jfalempe@redhat.com>, 
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 Xinliang Liu <xinliang.liu@linaro.org>, 
 Tian Tao <tiantao6@hisilicon.com>, Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, Yongqin Liu <yongqin.liu@linaro.org>, 
 John Stultz <jstultz@google.com>, Sui Jingfeng <suijingfeng@loongson.cn>, 
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Zack Rusin <zack.rusin@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Lucas De Marchi <lucas.demarchi@intel.com>, 
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Saurav Kashyap <skashyap@marvell.com>, Javed Hasan <jhasan@marvell.com>, 
 GR-QLogic-Storage-Upstream@marvell.com, 
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Nilesh Javali <njavali@marvell.com>, 
 Manish Rangankar <mrangankar@marvell.com>,
 Alex Williamson <alex.williamson@redhat.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Javier Martinez Canillas <javierm@redhat.com>, 
 Jani Nikula <jani.nikula@intel.com>,
 Mario Limonciello <mario.limonciello@amd.com>, 
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
 Lijo Lazar <lijo.lazar@amd.com>, Niklas Schnelle <schnelle@linux.ibm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux1394-devel@lists.sourceforge.net, amd-gfx@lists.freedesktop.org, 
 nouveau@lists.freedesktop.org, virtualization@lists.linux.dev, 
 spice-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 netdev@vger.kernel.org, linux-pci@vger.kernel.org, linux-scsi@vger.kernel.org, 
 kvm@vger.kernel.org, Greg Ungerer <gerg@linux-m68k.org>
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

Hi Arnd,

CC Gerg

On Mon, 7 Apr 2025 at 12:40, Arnd Bergmann <arnd@kernel.org> wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>
> It turns out that there are no platforms that have PCI but don't have an MMU,
> so adding a Kconfig dependency on CONFIG_PCI simplifies build testing kernels
> for those platforms a lot, and avoids a lot of inadvertent build regressions.
>
> Add a dependency for CONFIG_PCI and remove all the ones for PCI specific
> device drivers that are currently marked not having it.
>
> Link: https://lore.kernel.org/lkml/a41f1b20-a76c-43d8-8c36-f12744327a54@app.fastmail.com/
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Thanks for your patch!

> --- a/drivers/pci/Kconfig
> +++ b/drivers/pci/Kconfig
> @@ -21,6 +21,7 @@ config GENERIC_PCI_IOMAP
>  menuconfig PCI
>         bool "PCI support"
>         depends on HAVE_PCI
> +       depends on MMU
>         help
>           This option enables support for the PCI local bus, including
>           support for PCI-X and the foundations for PCI Express support.

While having an MMU is a hardware feature, I consider disabling MMU
support software configuration.  So this change prevents people from
disabling MMU support on a system that has both a PCI bus and an MMU.
But other people may not agree, or care?

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
