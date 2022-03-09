Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 64DE54D2F83
	for <lists+dri-devel@lfdr.de>; Wed,  9 Mar 2022 13:56:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4314310E633;
	Wed,  9 Mar 2022 12:56:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com
 [209.85.222.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D18610E633
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Mar 2022 12:56:17 +0000 (UTC)
Received: by mail-qk1-f181.google.com with SMTP id r127so1568426qke.13
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Mar 2022 04:56:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jFrfJh+TZgGP0j9p3hA56GCX/bbYQBH+vvzpdAJjq0g=;
 b=FkZYf6XahULbnsMJx0VaLJe5bO2dJRUGvRSTEw1amny7rmC/rdMfdZjGIZiZ1AsnuQ
 BJDJlC/E32pqRY9RUTxxkg9aJsK36mAozb87tKX8FmhawQ10tDsNpxe2DzS2Q6MHhyFy
 h6CzArGEvYEF9HPt20BS7WJbq9qfbDlWfOTlLlT1XWB1Tk9HgyadUW/IbqmPA9iL0ZrY
 GYFNzOEMnv0vv7QUn0rMFAw0wYygVdelScbEh0o0vXQTcAKFlwaw/d5K16rqs8+jWLFG
 3hi+om7Kq2o1p9EOraWui8Zy2jxUHqe7lhiyU3sO+F1fdu+JzItEfrq1SFSrtNDQ4N17
 wMWA==
X-Gm-Message-State: AOAM531BrVbga0QRe9YW3N85TdZFlzCIps/0BCge/Xf1rakxoaHVpPeB
 rywJ+k/SAnRRadlVgWKhw5iaTYQ1ITdR/A==
X-Google-Smtp-Source: ABdhPJw/zOU6Pf30xxcOHQIQhsC9cIzbAHEHs5HVUR/vy8k50soOF1bfNCFHWkVI6O9nwVNww0EvhQ==
X-Received: by 2002:a05:620a:1432:b0:67d:36cd:1f16 with SMTP id
 k18-20020a05620a143200b0067d36cd1f16mr1352933qkj.166.1646830575699; 
 Wed, 09 Mar 2022 04:56:15 -0800 (PST)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com.
 [209.85.219.178]) by smtp.gmail.com with ESMTPSA id
 bm1-20020a05620a198100b0047bf910892bsm874967qkb.65.2022.03.09.04.56.14
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Mar 2022 04:56:14 -0800 (PST)
Received: by mail-yb1-f178.google.com with SMTP id u10so4105030ybd.9
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Mar 2022 04:56:14 -0800 (PST)
X-Received: by 2002:a25:dc4:0:b0:629:2337:f9ea with SMTP id
 187-20020a250dc4000000b006292337f9eamr14501488ybn.6.1646830574485; Wed, 09
 Mar 2022 04:56:14 -0800 (PST)
MIME-Version: 1.0
References: <20220308160758.26060-1-wens@kernel.org>
In-Reply-To: <20220308160758.26060-1-wens@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 9 Mar 2022 13:56:02 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWuWFhs5-ezh_UriPzWsZt02A2AJOTJMiszGpu_3hoqfw@mail.gmail.com>
Message-ID: <CAMuHMdWuWFhs5-ezh_UriPzWsZt02A2AJOTJMiszGpu_3hoqfw@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm: ssd130x: Fix COM scan direction register mask
To: Chen-Yu Tsai <wens@kernel.org>
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
Cc: David Airlie <airlied@linux.ie>,
 Javier Martinez Canillas <javierm@redhat.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Chen-Yu Tsai <wens@csie.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 9, 2022 at 2:57 AM Chen-Yu Tsai <wens@kernel.org> wrote:
> From: Chen-Yu Tsai <wens@csie.org>
>
> The SSD130x's command to toggle COM scan direction uses bit 3 and only
> bit 3 to set the direction of the scanout. The driver has an incorrect
> GENMASK(3, 2), causing the setting to be set on bit 2, rendering it
> ineffective.
>
> Fix the mask to only bit 3, so that the requested setting is applied
> correctly.
>
> Fixes: a61732e80867 ("drm: Add driver for Solomon SSD130x OLED displays")
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>

Thanks, this fixes the vertically-mirrored display on my Adafruit
FeatherWing 128x32 OLED.
Tested-by: Geert Uytterhoeven <geert@linux-m68k.org>
Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
