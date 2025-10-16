Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF7C6BE3CC0
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 15:49:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5E3C10E03B;
	Thu, 16 Oct 2025 13:49:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com
 [209.85.222.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7682310E03B
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 13:48:59 +0000 (UTC)
Received: by mail-ua1-f41.google.com with SMTP id
 a1e0cc1a2514c-8e3d93c0626so520290241.0
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 06:48:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760622538; x=1761227338;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tIs3qdLP3F/YAW7YsgnmPdGp6LZDuxUynC8+HjYB7O8=;
 b=lUHvMjnrQ8otDh6yDmknssNfwMhHoeh3EvxwZc+AbCYJjwlUq0fdiqr3aeymmOcATx
 zCvcm9khhLTJVsFMR6C923gzsKl9s04t6z96aKAg7AB7fLHyi5DsgLtPKO48syWwQGJs
 zoc8KSHeZBX9kHMWgCWSbEpL5VO2XNbfSHhTOCl0SGHYQ0Dp5s8EyASY7OvvYVuQzJXZ
 /Ngbae85FIXRKERjlVmvUB8kkVmiC6FDa45FHiNa2mAQ89CiahI4XyxySnpBe2U2wfH6
 h3v8CrZAhl8IhdAtMwygPPA+ogqcoGowDBGK1wWheyGGCshcCUG/gDHHo+myF/xIVv6K
 YVcg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW2m58FeS3XYFOBlDXQP8eQnh7I6eYZoDr2eaw2zA4JWxqnGUEcpI0O/qKYKExxaBhJjw9vQ97X0fY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwKG0TGxK6blQQUp2etSV+v/cwFt23IF33MdTquIatbz0qfKZEI
 +zNbkYd4I/2lyWo5v6wJzOFR0YhCYXFxnlOIdFu6qB5HrDi2DQiVhrxfjeJIsliM
X-Gm-Gg: ASbGncsidpxCuQ6lLjuQ9ybberuozbPk070GgZLxKlhz7r2IOdrGHW003BbEMdbgM85
 o1JGTMj6AoLje3/sqRXmX9Suswnkncaf3MYmpkbJ6mUCCSlXVvRPxt6RAb0vys5rwzB5r4C8Lqt
 DtfDnN3yFlKIqA90a+b4Pk5qwpdJ9Vcw3M97XmvBUjbOVrspnA1Z6xfZvT9INSUPcAw3DyhnG0P
 ZaBeKitgpxado9m2afYmKK9kZSUvZwNE+3e508tCB//ALRyruY0DHDt4ynTuERkMA39uhYr5j9L
 /qmHfXiCNZdnr1dvdQkz6vSjOulGCzTXOKNwvtDv/Li7SgPKSMADdw6xIGFwkAtG1MhK1Qobmxw
 xjNRcoeO/EAr637UUZV2qjIofbEdye1Qrpj55IwunBcCDG5vBq2b26XkQMIbhJjFtOyMc+HpFYT
 W/AoAvHfUgKePONp0EHihQSldabux6qQpuTkd90SWbCA==
X-Google-Smtp-Source: AGHT+IGsu7q0cWJzOv+Ya/oI52QCOsuL/AkypAgEz80PPlIlVN+R4/PHSrNZe5STwH+jhuyCyyxxwA==
X-Received: by 2002:a05:6102:2587:10b0:5cd:e513:384d with SMTP id
 ada2fe7eead31-5d7ce0e57bemr1369466137.0.1760622538079; 
 Thu, 16 Oct 2025 06:48:58 -0700 (PDT)
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com.
 [209.85.221.169]) by smtp.gmail.com with ESMTPSA id
 a1e0cc1a2514c-93106c9d280sm524120241.17.2025.10.16.06.48.57
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Oct 2025 06:48:57 -0700 (PDT)
Received: by mail-vk1-f169.google.com with SMTP id
 71dfb90a1353d-5563c36f6d4so536223e0c.1
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 06:48:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUGQlIWATD1InqemgyBWCXpkU5RJx1nVcGbY52jzrQHf0AvHgmLLGV/PxNZnBuQYsFUgUCtnvMV+Mk=@lists.freedesktop.org
X-Received: by 2002:a05:6102:5088:b0:5d5:f6ae:3905 with SMTP id
 ada2fe7eead31-5d7ce7f9f8cmr1588639137.22.1760622126274; Thu, 16 Oct 2025
 06:42:06 -0700 (PDT)
MIME-Version: 1.0
References: <20250912142056.2123725-1-chris.brandt@renesas.com>
 <20250912142056.2123725-2-chris.brandt@renesas.com>
In-Reply-To: <20250912142056.2123725-2-chris.brandt@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 16 Oct 2025 15:41:55 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWEjUzpu_-pukUxHBFDqw_+xjE9gy4MTKz-39bwDGCuTg@mail.gmail.com>
X-Gm-Features: AS18NWDpgOC-c34fem89ycndlFrZkPR3jTMZt246SCjZMhsihbRFxV1WKYaC9YE
Message-ID: <CAMuHMdWEjUzpu_-pukUxHBFDqw_+xjE9gy4MTKz-39bwDGCuTg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] clk: renesas: rzg2l: Remove DSI clock rate
 restrictions
To: Chris Brandt <chris.brandt@renesas.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Hien Huynh <hien.huynh.px@renesas.com>, Nghia Vo <nghia.vo.zn@renesas.com>, 
 Hugo Villeneuve <hugo@hugovil.com>, linux-renesas-soc@vger.kernel.org, 
 linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org
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

Hi Chris,

On Fri, 12 Sept 2025 at 16:22, Chris Brandt <chris.brandt@renesas.com> wrote:
> Convert the limited MIPI clock calculations to a full range of settings
> based on math including H/W limitation validation.
> Since the required DSI division setting must be specified from external
> sources before calculations, expose a new API to set it.
>
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> Signed-off-by: hienhuynh <hien.huynh.px@renesas.com>
> Signed-off-by: Nghia Vo <nghia.vo.zn@renesas.com>

Thanks for your patch!

> --- a/include/linux/clk/renesas.h
> +++ b/include/linux/clk/renesas.h
> @@ -33,3 +33,7 @@ void cpg_mssr_detach_dev(struct generic_pm_domain *unused, struct device *dev);
>  #define cpg_mssr_detach_dev    NULL
>  #endif
>  #endif
> +
> +#ifdef CONFIG_CLK_RZG2L
> +void rzg2l_cpg_dsi_div_set_divider(int divider, int target);
> +#endif

This needs a dummy for compile-testing the CONFIG_CLK_RZG2L=n case.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
