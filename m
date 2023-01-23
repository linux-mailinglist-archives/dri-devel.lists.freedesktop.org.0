Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 17416677ECB
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jan 2023 16:10:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2BBC10E4B1;
	Mon, 23 Jan 2023 15:10:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com
 [209.85.128.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0495E10E4B7
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 15:10:47 +0000 (UTC)
Received: by mail-yw1-f170.google.com with SMTP id
 00721157ae682-4a2f8ad29d5so175569977b3.8
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 07:10:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=h/bqJof5MO3pbg3UYX8cTuwpn5Rti6iDINf4SN3BEsI=;
 b=SngPweQ5ohr7KUO3PEZTKSKCBVWKtnMXBaXg21ydfOdNK9MkRDbGXHh0oqX+LD3Dw8
 PCtphsju/+p6emEA4PLV/UnaIXTCan9vNSdF+vLFF7odAv51+35bCS8GYjYLGBaXjtq9
 krSmgD1DB1VM5l13Ujk4ZyHd1PJ1kp3+SkHf4jRQ4SW3lbrkY8leVMzbiaT3Qvokp8b1
 PKKcVF0PRSjHdGlCELG7T7EDOBHteBRo6yM2r+L22dbFMF46Dh8pdf0YNQuSCcQ3v7PA
 zDJjl63Aa+FHSRZan9m+BvRwP/xzxgPv5+itLmJl1QxX8JNDe9aSYuzt0cm0smJQSY+c
 bxYg==
X-Gm-Message-State: AFqh2kppezyAazHI7hruNyEwCfS1zkZQhWZNVLxPcxdAO5DqWPzM0nG3
 do2QnqfVK0Vau89Ut2YRg8yndjPO4if2KA==
X-Google-Smtp-Source: AMrXdXtLTbT12r242AoStJ7CR24fIjCvB7lBAC4M93dXvps3OoCvAdZPXGb/ZqGb195bjTs2GXfzhQ==
X-Received: by 2002:a0d:e747:0:b0:4e0:196:7713 with SMTP id
 q68-20020a0de747000000b004e001967713mr25298831ywe.5.1674486646855; 
 Mon, 23 Jan 2023 07:10:46 -0800 (PST)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com.
 [209.85.128.182]) by smtp.gmail.com with ESMTPSA id
 bq35-20020a05620a46a300b0070209239b87sm12199478qkb.41.2023.01.23.07.10.46
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Jan 2023 07:10:46 -0800 (PST)
Received: by mail-yw1-f182.google.com with SMTP id
 00721157ae682-4ff1fa82bbbso129424187b3.10
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 07:10:46 -0800 (PST)
X-Received: by 2002:a0d:e657:0:b0:4d9:3858:392 with SMTP id
 p84-20020a0de657000000b004d938580392mr2080328ywe.502.1674486646123; Mon, 23
 Jan 2023 07:10:46 -0800 (PST)
MIME-Version: 1.0
References: <cover.1669406380.git.geert@linux-m68k.org>
 <a9883a81-d909-09c5-708b-d598e030380e@physik.fu-berlin.de>
In-Reply-To: <a9883a81-d909-09c5-708b-d598e030380e@physik.fu-berlin.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 23 Jan 2023 16:10:33 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWHUnWBN7ddBow+fqmt8W--9wFe5x_YMeRg7GQ=BNAL2Q@mail.gmail.com>
Message-ID: <CAMuHMdWHUnWBN7ddBow+fqmt8W--9wFe5x_YMeRg7GQ=BNAL2Q@mail.gmail.com>
Subject: Re: [PATCH/RFC 0/3] Atari DRM driver
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
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
Cc: Michael Schmitz <schmitzmic@gmail.com>, linux-fbdev@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Helge Deller <deller@gmx.de>,
 linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Adrian,

On Mon, Jan 23, 2023 at 4:09 PM John Paul Adrian Glaubitz
<glaubitz@physik.fu-berlin.de> wrote:
> On 11/25/22 21:31, Geert Uytterhoeven wrote:
> > This RFC patch series adds a DRM driver for the good old Atari
> > ST/TT/Falcon hardware.  It was developed and tested (only) on the ARAnyM
> > emulator.
>
> I just remembered this WIP driver. Has there been any progress?

So far no further progress.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
