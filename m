Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CAF845A4361
	for <lists+dri-devel@lfdr.de>; Mon, 29 Aug 2022 08:46:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99AEF10F0D0;
	Mon, 29 Aug 2022 06:46:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com
 [209.85.160.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52A3510F0C8
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Aug 2022 06:46:33 +0000 (UTC)
Received: by mail-qt1-f179.google.com with SMTP id cb8so5511818qtb.0
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Aug 2022 23:46:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=OYzZsqhi6z4Pzefu9edG0BokXpWc1nUYZJu9jp50RSA=;
 b=eRZnoDIWda33b2sx5zKDuJaa4HaUTdN0mSMpwAdXOBjScc/LRrDBqNMZ1HF6H8dtdz
 v5YG47CpfnmuAyjMhsGuqQkLmFO+bm7F+uBljrstj3iPXZRg5EpFTerheDHOkTtvNryb
 r59YNC3lcNSboUYjHfnR1GabhTKqYDy4D6xxhG5Ge0ghOu30drXb55qEZsAq5SHQuol1
 +xiA4VZQ3NU/R88m2LugM2H08CW0nkcwBTTDbnoilAiGT4B6cyF5eyhDVNFY48VWNQjW
 iW75rwEtHZyMNKuKq00lfjqDQVnv2rB1VQwW9nKkym/GYwKOUId2jGZCg93sqB9n9Gr0
 r3kQ==
X-Gm-Message-State: ACgBeo3XF3cXDlWC1n9vsE16xbkTlJsQczaw6kgmqBoNWg71B7jPnnZx
 18Vg9q3lHJmIdhIIF+raay6VolniCUDcWQ==
X-Google-Smtp-Source: AA6agR7raAURTFdt9vLXznmnADoijg9BzahoKh76z9Yo2/bh6bSHrKPCioGnBhm7RVyFWHGjeWz6aA==
X-Received: by 2002:a05:622a:134b:b0:343:7264:34ff with SMTP id
 w11-20020a05622a134b00b00343726434ffmr8833384qtk.109.1661755592214; 
 Sun, 28 Aug 2022 23:46:32 -0700 (PDT)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com.
 [209.85.128.174]) by smtp.gmail.com with ESMTPSA id
 fg15-20020a05622a580f00b0034456277e3asm4664406qtb.89.2022.08.28.23.46.31
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 28 Aug 2022 23:46:31 -0700 (PDT)
Received: by mail-yw1-f174.google.com with SMTP id
 00721157ae682-33da3a391d8so172722237b3.2
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Aug 2022 23:46:31 -0700 (PDT)
X-Received: by 2002:a81:83c8:0:b0:341:4b7b:3d9e with SMTP id
 t191-20020a8183c8000000b003414b7b3d9emr411195ywf.47.1661755591357; Sun, 28
 Aug 2022 23:46:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220827004220.8397-1-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20220827004220.8397-1-laurent.pinchart+renesas@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 29 Aug 2022 08:46:19 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXNx6LGoD062o8LsJruuw_a4Ugb978ZFiwi4Am5W5SfRQ@mail.gmail.com>
Message-ID: <CAMuHMdXNx6LGoD062o8LsJruuw_a4Ugb978ZFiwi4Am5W5SfRQ@mail.gmail.com>
Subject: Re: [PATCH] drm: rcar-du: Drop leftovers variables from Makefile
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
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 DRI Development <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Aug 27, 2022 at 2:50 AM Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
> Commit 841281fe52a7 ("drm: rcar-du: Drop LVDS device tree backward
> compatibility") has removed device tree overlay sources used for
> backward compatibility with old bindings, but forgot to remove related
> variables from the Makefile. Fix it.
>
> Fixes: 841281fe52a7 ("drm: rcar-du: Drop LVDS device tree backward compatibility")
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
