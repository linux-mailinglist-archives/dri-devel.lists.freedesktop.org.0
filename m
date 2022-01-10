Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FCB14895BF
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jan 2022 10:55:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DA2E113B29;
	Mon, 10 Jan 2022 09:55:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com
 [209.85.222.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5412C11A41A
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jan 2022 09:55:29 +0000 (UTC)
Received: by mail-ua1-f46.google.com with SMTP id y4so22406457uad.1
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jan 2022 01:55:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BP0jTeln64BsVxh0F56vcuTVCny3JMxOIhYQM1VFh20=;
 b=UkXPiAkrwq/JwOeFeQAU+7m1kP0FEL3uFeAAEu/TMhkUGC5eELa6ORhN9Rd/Ty7sjH
 vUbGKCJlhwqJrpEIm42zdTExJuFe27XqS7jQ7uuZfHp0XBqE5ZEH5kwt9u1Ee5iY1U0K
 TWj1gKN+MMJ/aTEPw3VBGBNH16A2HswWpjtItlY0pV5gs32GBxbSqSn/6sz3xx7RE2S8
 zwjH0vKjbY/ZdW4ZQPM2LkI1g7OOyCFEPdi1/UrXpMG4bgbJQ5Ut56MzLLgyUIf7/XLh
 chYO/FPTPwBaxzN6sP4L4UuqKwIqqP4aiWpFQqP/vLVJTZZi/CdOrbyO078TDvfjPydd
 g0oQ==
X-Gm-Message-State: AOAM530IHFKjZUnmkTWRC1Rc885+hKpZOYM8p/VvX6NYrXxhFylulsV5
 BPjdABVnDfE5OoOaSa/RHINVHXQtd2e+UQ==
X-Google-Smtp-Source: ABdhPJwbxRu4CPjLnpg7UsuUplFLR2p0l7cGtgdNPnORkai7XHt6NYuaMcU8SCI0qxOEUko76WnHVA==
X-Received: by 2002:a05:6102:2221:: with SMTP id
 d1mr13148185vsb.27.1641808528395; 
 Mon, 10 Jan 2022 01:55:28 -0800 (PST)
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com.
 [209.85.221.172])
 by smtp.gmail.com with ESMTPSA id v141sm1182328vke.2.2022.01.10.01.55.27
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Jan 2022 01:55:27 -0800 (PST)
Received: by mail-vk1-f172.google.com with SMTP id 78so7732675vkz.7
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jan 2022 01:55:27 -0800 (PST)
X-Received: by 2002:a1f:2344:: with SMTP id j65mr1408688vkj.7.1641808527113;
 Mon, 10 Jan 2022 01:55:27 -0800 (PST)
MIME-Version: 1.0
References: <20211224052309.1997096-1-nikita.yoush@cogentembedded.com>
 <20211224052309.1997096-3-nikita.yoush@cogentembedded.com>
 <CAMuHMdVHMzZipXaUE_SrkHtj6edZATefC908P1ngLrnOry8KCA@mail.gmail.com>
 <fbabf712-ea2a-5bd4-56d4-70cf4d7f72f6@cogentembedded.com>
In-Reply-To: <fbabf712-ea2a-5bd4-56d4-70cf4d7f72f6@cogentembedded.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 10 Jan 2022 10:55:15 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW9hgzRJn7xL=PWC66UpJ4nB2krZY6VkL9dN7nT2fY_uw@mail.gmail.com>
Message-ID: <CAMuHMdW9hgzRJn7xL=PWC66UpJ4nB2krZY6VkL9dN7nT2fY_uw@mail.gmail.com>
Subject: Re: [PATCH 2/3] arm64: dts: renesas: r8a77961: Add lvds0 device node
To: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Magnus Damm <magnus.damm@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Nikita,

On Mon, Jan 10, 2022 at 10:51 AM Nikita Yushchenko
<nikita.yoush@cogentembedded.com> wrote:
> > i.e. will queue in renesas-devel for v5.18.
>
> that is, for current + 2 ?

That is correct, as the merge window for v5.17 has already opened.
The deadline for new features to be accepted for v5.17 in the soc
tree was around v5.16-rc6.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
