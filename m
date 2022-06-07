Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C8D9553FB15
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jun 2022 12:23:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91E281120C8;
	Tue,  7 Jun 2022 10:22:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com
 [209.85.222.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3680710F881
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jun 2022 10:22:57 +0000 (UTC)
Received: by mail-qk1-f180.google.com with SMTP id o68so12845204qkf.13
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Jun 2022 03:22:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ogveWgeE/FVBGqs6VUOZoS5JOHdjSLfC5uSmNP3+Doo=;
 b=H7N6lw5sJHpXkV/9w64fA5C4BWh+IieVyGlU2dlzDDk1gB91UCFAzLpXLrZI3mlS+T
 Hvr27nk7ManXMt2urdO7m/M0SDTs+sJGFhc+ssQiYQ7tw1RCkshOnfLcYmzfj0YqxWaP
 DB6T2aptT6K8MLMNxDuErurrwyyhevhjNuof931/DLz4eYFyk3uix3lhkR1bgqJYRy42
 UxtPZ7N342HPERhBealZ6ZnfPIbfzCtBRGItPn3h8S/2tYhIb3YSSDOGmlf54Bmo9Qsi
 lf6ik8+yI9NM46/LXhU/Q0rhILh1KTuTzPUjJf42ZerSJf1jw0fZ7h5OnI7ub8Afqq2y
 kkbQ==
X-Gm-Message-State: AOAM531ISuBE3xupx9dZbegJt6x9+qLB98JPZYqabzHx6EeoKCbPQDpu
 GnTghU/AAR+vtFFWMqtUewEK0NQBFkc27Q==
X-Google-Smtp-Source: ABdhPJx6IvvVH0BIZ7qV7hdqg7mDTm/wNX3kzHdK+zZJPkmg4xQNFJG6KEo/HC1kw1OhK8xHV4ZmYw==
X-Received: by 2002:a05:620a:2910:b0:6a6:baed:e7f0 with SMTP id
 m16-20020a05620a291000b006a6baede7f0mr6445721qkp.368.1654597375963; 
 Tue, 07 Jun 2022 03:22:55 -0700 (PDT)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com.
 [209.85.219.181]) by smtp.gmail.com with ESMTPSA id
 o9-20020ac85a49000000b00304bbcc1b8asm12193807qta.28.2022.06.07.03.22.55
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jun 2022 03:22:55 -0700 (PDT)
Received: by mail-yb1-f181.google.com with SMTP id s39so2794765ybi.0
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Jun 2022 03:22:55 -0700 (PDT)
X-Received: by 2002:a05:6902:120e:b0:634:6f29:6b84 with SMTP id
 s14-20020a056902120e00b006346f296b84mr30096899ybu.604.1654597375274; Tue, 07
 Jun 2022 03:22:55 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9tw62EZfAm0PbiOPmMrpfR98QMFTWGEQcA34G4ap4xxNkA@mail.gmail.com>
In-Reply-To: <CAPM=9tw62EZfAm0PbiOPmMrpfR98QMFTWGEQcA34G4ap4xxNkA@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 7 Jun 2022 12:22:41 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXb5-gOVRsQx6tDqjQMD9cC-p=o56VuF2cBPWyMFRgHMA@mail.gmail.com>
Message-ID: <CAMuHMdXb5-gOVRsQx6tDqjQMD9cC-p=o56VuF2cBPWyMFRgHMA@mail.gmail.com>
Subject: Re: [git pull] drm for 5.19-rc1
To: Dave Airlie <airlied@gmail.com>
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
Cc: Arnd Bergmann <arnd@arndb.de>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave.

On Wed, May 25, 2022 at 4:49 PM Dave Airlie <airlied@gmail.com> wrote:
>       drm/amdgpu: add nbio v7_7_0 ip headers

These header files are heavy users of large constants lacking the "U"
suffix e.g.:

    #define NB_ADAPTER_ID__SUBSYSTEM_ID_MASK 0xFFFF0000L

Assigning this to unsigned long on 32-bit will trigger a signed integer
overflow, which is technically UB, and causes "error: initializer
element is not constant" warnings with gcc-5 and -std-gnu11, cfr. [1]

While gcc-5 is old, the fact that this is UB will probably start to
bite us one day...

[1] https://lore.kernel.org/r/CAK8P3a0QrihBR_2FQ7uZ5w2JmLjv7czfrrarCMmJOhvNdJ3p9g@mail.gmail.com

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
