Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3487843FA16
	for <lists+dri-devel@lfdr.de>; Fri, 29 Oct 2021 11:40:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2193C6EA2C;
	Fri, 29 Oct 2021 09:40:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com
 [209.85.222.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57C136EA2C
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Oct 2021 09:40:39 +0000 (UTC)
Received: by mail-ua1-f47.google.com with SMTP id i6so2845719uae.6
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Oct 2021 02:40:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kxaElWGr4Lmnn2exo86aWmthYySNpu5Jzk9GyO0DlvQ=;
 b=6i8L91efkiVDjwQ8/8+f3FCzh9bOd7KTrbjiNMNZudKXlxaixzEgexvZJBoM9Emydo
 Bf4RB35MdghkSAflGbAFiLAG7j48dqeywiLF0N5/JAAVv/esHPCedj2ElHRx8KvxJYoz
 dPh2tG3V+EStg7X4aP7zPtFB2mcly3yp1NBCK86U9x+xVLz8smnfo18lxK+KmtgMg+Tt
 oN3VtCBqRwqHrh3ymzcED/WRy5DB8i+5xn2/R2pQ3q0RdXeFevj5oqIoBZ661+4w4WJA
 t+/sUeFMzQSYoChTQBNjoVwIyV2KAJozLagTixv/kC1Lho8Z9Chb+Rkw7D6gZ5Uc8fn+
 ZA6g==
X-Gm-Message-State: AOAM530tOEub7N8R+W2PHzksGgL78vnZ0b0k2e1ItiFIKZ2oW3NzRnAK
 v9mUnYphZTF0l7Nixsm9IbBf+ASyGAGrJg==
X-Google-Smtp-Source: ABdhPJxDnPCKH+vw00hTxR8WWJ4eWWlB0JRvPC7i6ZwvMbQ5t2+DK4TVqIuypbKJTi3fnGUSonaJIw==
X-Received: by 2002:ab0:458e:: with SMTP id u14mr10487784uau.104.1635500438063; 
 Fri, 29 Oct 2021 02:40:38 -0700 (PDT)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com.
 [209.85.222.49])
 by smtp.gmail.com with ESMTPSA id u14sm888021vsi.2.2021.10.29.02.40.37
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Oct 2021 02:40:37 -0700 (PDT)
Received: by mail-ua1-f49.google.com with SMTP id b17so6946093uas.0
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Oct 2021 02:40:37 -0700 (PDT)
X-Received: by 2002:a05:6102:3a0e:: with SMTP id
 b14mr10173444vsu.41.1635500437263; 
 Fri, 29 Oct 2021 02:40:37 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1634822085.git.geert+renesas@glider.be>
 <1f6bf58d76efc2e869b800534b818d1451ef98a2.1634822085.git.geert+renesas@glider.be>
 <YXtIsCnJ+L5zqCVk@robh.at.kernel.org> <YXusEUpTBUdvS7LY@shell.armlinux.org.uk>
 <CAMuHMdX+Ke54zyi2Z2ROk-2xpbcXU6+FFH71gEz0vEBXCAgVXw@mail.gmail.com>
 <YXu/zwjYqoqYgfLx@shell.armlinux.org.uk>
In-Reply-To: <YXu/zwjYqoqYgfLx@shell.armlinux.org.uk>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 29 Oct 2021 11:40:26 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUFp_GN-GLtrXVDQP5A8iM-jLWTQbM0p4g1bdVokxhOaw@mail.gmail.com>
Message-ID: <CAMuHMdUFp_GN-GLtrXVDQP5A8iM-jLWTQbM0p4g1bdVokxhOaw@mail.gmail.com>
Subject: Re: [PATCH 3/3] [RFC] dt-bindings: display: bridge: nxp,tda998x:
 Convert to json-schema
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Rob Herring <robh@kernel.org>,
 =?UTF-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>, 
 Tony Lindgren <tony@atomide.com>, Magnus Damm <magnus.damm@gmail.com>, 
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, 
 DRI Development <dri-devel@lists.freedesktop.org>, 
 "open list:TI ETHERNET SWITCH DRIVER (CPSW)" <linux-omap@vger.kernel.org>, 
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>
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

Hi Russell,

On Fri, Oct 29, 2021 at 11:33 AM Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
> On Fri, Oct 29, 2021 at 10:28:22AM +0200, Geert Uytterhoeven wrote:
> > No, you can still use port:
> >
> > +oneOf:
> > +  - required:
> > +      - port
> > +  - required:
> > +      - ports
> >
> > When using ports, no further requirements are set, but perhaps port@0
> > should be made required in that case?
>
> Maybe I don't understand the binding description then, but to me it
> looks like you require both port@0 and port@1.

"make dtbs_check" disagrees.

> The reality of the driver is that it makes almost no use of the graph
> itself, except via drm_of_find_possible_crtcs() to find the connected
> CRTCs. If it is connected to an I2S source, then it probably needs a
> port specification for that. If someone wants to describe the HDMI
> connector (which I don't see any point in) then they likely need a

I can't comment on the point of describing the HDMI connector.

> port specification for that too. However, the driver itself doesn't
> care about any of those.

DT describes hardware, not software limitations.

> So, describing the port nodes makes no sense.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
