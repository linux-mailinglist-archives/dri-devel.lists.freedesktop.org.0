Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EFBDD49DD1A
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jan 2022 09:58:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEB6210EE2A;
	Thu, 27 Jan 2022 08:58:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com
 [209.85.222.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BC8310EE23
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jan 2022 08:58:08 +0000 (UTC)
Received: by mail-ua1-f52.google.com with SMTP id w21so3445658uan.7
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jan 2022 00:58:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=m0Oa/punTZo54neBO2R7a2vYQkIoxYN32vSsBfoG+aw=;
 b=aZZU2jL64/2iAhNW8yMWwqxfNm+jSooIhyvMCeHE0BMmiFg1jALVkem6eaOBjYIiq6
 hUip2Z+DV2fwcSttb+/m/WjycxI6cNALB8T/tAM8Y+EKJcS7QM+RbAteJ8kxNTIXml1f
 HF+cSYXweOtC3/SvAuYngyq/vYq74sfPHfv7AWShtJn9hZJ560WxTlPrZAMu2nNz291u
 bfnSXM9xNbPQR1wmxFkRjEBlnw21DKKhPayq3aFvq4xrzgZ8oHNkC/y3a8DAtCXBBdxf
 uBjlkZ3X3Y5DyTGLU/Iim4e5Zo3ZiinUiBX3X5MQsiR8I8jnieH0r3JG9+zH89EZHKaq
 ON6Q==
X-Gm-Message-State: AOAM532pPakDOueosO8RW/qs1V7CHNbzd7WRAI8NLgDaMwdifwbdfc2d
 mPU6n+FzfPIUaI/IE5KBfJIziBtNsh3Mp/hi
X-Google-Smtp-Source: ABdhPJxcT6T1amJhwNc565B0PsV7v62yrnTRiglGYUrDwOUrs6WK1pxcyW0/GsvL18SwrSQBkV3SVA==
X-Received: by 2002:ab0:2042:: with SMTP id g2mr1188388ual.77.1643273887033;
 Thu, 27 Jan 2022 00:58:07 -0800 (PST)
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com.
 [209.85.221.177])
 by smtp.gmail.com with ESMTPSA id e17sm444549vsl.21.2022.01.27.00.58.06
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Jan 2022 00:58:06 -0800 (PST)
Received: by mail-vk1-f177.google.com with SMTP id b77so1380864vka.11
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jan 2022 00:58:06 -0800 (PST)
X-Received: by 2002:a1f:2555:: with SMTP id l82mr1183080vkl.7.1643273886146;
 Thu, 27 Jan 2022 00:58:06 -0800 (PST)
MIME-Version: 1.0
References: <20220126202956.18364-1-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20220126202956.18364-1-laurent.pinchart+renesas@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 27 Jan 2022 09:57:54 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWLvpvdfGASq_QbYVBurF=44PLiTQy666HMAYn2RwbfvA@mail.gmail.com>
Message-ID: <CAMuHMdWLvpvdfGASq_QbYVBurF=44PLiTQy666HMAYn2RwbfvA@mail.gmail.com>
Subject: Re: [PATCH] drm: rcar-du: Drop LVDS device tree backward compatibility
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
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
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 DRI Development <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent,

Thanks for your patch!

On Wed, Jan 26, 2022 at 9:30 PM Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
> The rcar-du driver goes to great lengths to preserve device tree
> backward compatibility for the LVDS encoders by patching old device
> trees at runtime.
>
> The last R-Car Gen2 platform was converted to the new bindings commit
> edb0c3affe5214a2 ("ARM: dts: r8a7793: Convert to new LVDS DT bindings"),
> in v4.17, and the last RZ/G1 platform converted in commit
> 6a6a797625b5fe85 ("ARM: dts: r8a7743: Convert to new LVDS DT bindings"),
> in v5.0. Both are older than commit 58256143cff7c2e0 ("clk: renesas:
> Remove R-Car Gen2 legacy DT clock support"), in v5.5, which removes
> support for legacy bindings for clocks. The LBDS compatibility code is

LVDS

> thus not needed anymore. Drop it.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

>  .../drm/rcar-du/rcar_du_of_lvds_r8a7795.dts   |  43 ---
>  .../drm/rcar-du/rcar_du_of_lvds_r8a7796.dts   |  43 ---

I had completely forgotten this was used on R-Car Gen3, too, until
commit 58e8ed2ee9abe718 ("arm64: dts: renesas: Convert to new LVDS
DT bindings") in v4.20.  I guess that's old enough?

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
