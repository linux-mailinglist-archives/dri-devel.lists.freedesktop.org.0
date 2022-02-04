Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE4124A9542
	for <lists+dri-devel@lfdr.de>; Fri,  4 Feb 2022 09:37:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EB9610F41D;
	Fri,  4 Feb 2022 08:37:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com
 [209.85.221.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65DFF10F41D
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Feb 2022 08:37:30 +0000 (UTC)
Received: by mail-vk1-f178.google.com with SMTP id o11so2388682vkl.11
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Feb 2022 00:37:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vew3Q/Ah/4OT+X0N/2HgswSOS5AWlJRbsuKjUyZGy9c=;
 b=X9MQ3GufvJ1b/ezJX6i8zNTsrbqj+ggl/kiCa+0avgcY50tnG9ffe0Fz2R+TpaeGlC
 AQEdFNse4N9Q4nKmZeYooBd5NF4qLJE5OYPiXwbY5aFSC435AetxuM+s/6XTMZu16w5Y
 aIkolT9nQi22RFy2AZSdH/8UPUen85yIwcUTo+q/YFuEGKWQUHc3vnW9W+3UnBE8frcB
 aNABkhATTFKQnP3xDhCNOeq/5NyYUW3IS53oEH7wN4JjdFvQz9fSL/uRelfMXr7XOkh1
 zhPoPBJb0aupqfgvBLk8WkaMrbzmL35e5FP85vLA73ZEIEgSs9X2SD7gj/yfUSUn9SOA
 fsyg==
X-Gm-Message-State: AOAM532vXXfwoWv+WCh/phDwgLNT/B0gNIn2mN0KOqklhhOxLtyT5vcX
 D/2fqnZuMTKycMa4Vwj2x58M1MvWNQBOWw==
X-Google-Smtp-Source: ABdhPJzCbgYFFODSglz+SAwdMYppV6syy1+BZ+zr/+VqfqXGcB4cAYXN3cTSfb0C3DCgmWfgwlfpDw==
X-Received: by 2002:a05:6122:585:: with SMTP id i5mr610740vko.27.1643963849374; 
 Fri, 04 Feb 2022 00:37:29 -0800 (PST)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com.
 [209.85.222.42])
 by smtp.gmail.com with ESMTPSA id 4sm325975vkx.4.2022.02.04.00.37.29
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Feb 2022 00:37:29 -0800 (PST)
Received: by mail-ua1-f42.google.com with SMTP id b37so9588022uad.12
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Feb 2022 00:37:29 -0800 (PST)
X-Received: by 2002:a67:a401:: with SMTP id n1mr463972vse.38.1643963848955;
 Fri, 04 Feb 2022 00:37:28 -0800 (PST)
MIME-Version: 1.0
References: <20220202135531.92183-1-deller@gmx.de>
 <20220202135531.92183-4-deller@gmx.de>
In-Reply-To: <20220202135531.92183-4-deller@gmx.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 4 Feb 2022 09:37:18 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWTuFt12faj58sLv3H9rN0xK-+CCTkFeEiKdLSQTU2Lmg@mail.gmail.com>
Message-ID: <CAMuHMdWTuFt12faj58sLv3H9rN0xK-+CCTkFeEiKdLSQTU2Lmg@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] fbcon: Add option to enable legacy hardware
 acceleration
To: Helge Deller <deller@gmx.de>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Helge,

Thanks for your patch!

On Wed, Feb 2, 2022 at 8:05 PM Helge Deller <deller@gmx.de> wrote:
> Add a config option CONFIG_FRAMEBUFFER_CONSOLE_LEGACY_ACCELERATION to
> enable bitblt and fillrect hardware acceleration in the framebuffer
> console. If disabled, such acceleration will not be used, even if it is
> supported by the graphics hardware driver.

Note that this also applies to vertical panning and wrapping.


Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
