Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DA9CF8055F9
	for <lists+dri-devel@lfdr.de>; Tue,  5 Dec 2023 14:31:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2526E10E52B;
	Tue,  5 Dec 2023 13:31:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com
 [209.85.128.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D144210E52B
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Dec 2023 13:31:37 +0000 (UTC)
Received: by mail-yw1-f173.google.com with SMTP id
 00721157ae682-5d7346442d4so30425507b3.2
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Dec 2023 05:31:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701783097; x=1702387897;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+WLCGfltwE6Kjvks8kpsa3EEhQwG2EjNCMrRG0bAxcU=;
 b=InLqTOBT+/1WdNcQi1kOWzX53UwxZMS45GY3XvQkwq2PVUlPp1dgpPopurIfPRh0Ek
 rW13DBx41f3LEaCP0QjXVi0+d9AOiiquv055v63xzpd+kzgJgm8V4ULhgjLromuO6DAW
 DY20CTWJpOkh871bMdBNIwefALo//sD5Q5/yjYh+Ne8lxEW0E/U9Z8GvnwkHW2VL2ok/
 MxoIw7s9ES22Yt9MpkEls222TORF8vc/GXLN2pSnsGO6mVg54a/hc0wfVfjj0yy/+R1Q
 2L6hSQgZoDfYtlF6nDUPKDkXsJPfzcurlWiGnLpMCF7BJ1VzLPv7yYgY0mcE5VWfNHQE
 zv2w==
X-Gm-Message-State: AOJu0Yyo0BHTwSpc7uDt4NH12UNbRecXBsLu4uh4dZ4Te0qA44LZ/Gsu
 Xb5TCiu/0kyDz8JtE63Z1WOndjObnFG/qw==
X-Google-Smtp-Source: AGHT+IE/X/f0N/GVxRRc6x474tKs8dv47cBhbNGwHxOp7iTGojW2jYqooKuKB5zcFPf7Or5ejzqafQ==
X-Received: by 2002:a81:e404:0:b0:5d1:430e:4b6f with SMTP id
 r4-20020a81e404000000b005d1430e4b6fmr4180339ywl.9.1701783096754; 
 Tue, 05 Dec 2023 05:31:36 -0800 (PST)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com.
 [209.85.219.174]) by smtp.gmail.com with ESMTPSA id
 c126-20020a0dda84000000b005d718fff165sm2790104ywe.78.2023.12.05.05.31.35
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Dec 2023 05:31:36 -0800 (PST)
Received: by mail-yb1-f174.google.com with SMTP id
 3f1490d57ef6-da077db5145so3359753276.0
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Dec 2023 05:31:35 -0800 (PST)
X-Received: by 2002:a25:f205:0:b0:db7:dad0:76d0 with SMTP id
 i5-20020a25f205000000b00db7dad076d0mr3644485ybe.108.1701783095615; Tue, 05
 Dec 2023 05:31:35 -0800 (PST)
MIME-Version: 1.0
References: <0a13f43d1e519b88e0762cce178d7852b7dba2b1.1701775726.git.geert+renesas@glider.be>
 <20231205121617.GF17394@pendragon.ideasonboard.com>
In-Reply-To: <20231205121617.GF17394@pendragon.ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 5 Dec 2023 14:31:24 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWziG0T6XdtcyvLz2si7Ai6sQN0tDU1345nSouz2tUq8A@mail.gmail.com>
Message-ID: <CAMuHMdWziG0T6XdtcyvLz2si7Ai6sQN0tDU1345nSouz2tUq8A@mail.gmail.com>
Subject: Re: [PATCH] drm: renesas: shmobile: Call
 drm_helper_force_disable_all() at shutdown time
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 Douglas Anderson <dianders@chromium.org>, Maxime Ripard <mripard@kernel.org>,
 linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent,

On Tue, Dec 5, 2023 at 1:16=E2=80=AFPM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Tue, Dec 05, 2023 at 12:30:02PM +0100, Geert Uytterhoeven wrote:
> > From: Douglas Anderson <dianders@chromium.org>
> >
> > Based on grepping through the source code, this driver appears to be
> > missing a call to drm_atomic_helper_shutdown() at system shutdown time.
> > This is important because drm_helper_force_disable_all() will cause
> > panels to get disabled cleanly which may be important for their power
> > sequencing.  Future changes will remove any custom powering off in
> > individual panel drivers so the DRM drivers need to start getting this
> > right.
> >
> > The fact that we should call drm_atomic_helper_shutdown() in the case o=
f
> > OS shutdown comes straight out of the kernel doc "driver instance
> > overview" in drm_drv.c.
> >
> > Suggested-by: Maxime Ripard <mripard@kernel.org>
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > Link: https://lore.kernel.org/r/20230901164111.RFT.15.Iaf638a1d4c8b3c30=
7a6192efabb4cbb06b195f15@changeid
> > [geert: s/drm_helper_force_disable_all/drm_atomic_helper_shutdown/]
> > [geert: shmob_drm_remove() already calls drm_atomic_helper_shutdown]
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Thanks!

> > Panel-simple does print two new warnings:
> >
> >     +panel-simple panel: Skipping disable of already disabled panel
> >     +panel-simple panel: Skipping unprepare of already unprepared panel
>
> Have you investigated where this comes from ?

Meh, I knew I forgot something ;-)

The panel is unprepared and disabled a first time from shmob_drm's
.shutdown() callback:

  shmob_drm_shutdown
    drm_atomic_helper_shutdown
      drm_atomic_helper_disable_all
        drm_atomic_commit
          drm_atomic_helper_commit
            commit_tail
              drm_atomic_helper_commit_tail
                drm_atomic_helper_commit_modeset_disables
                  disable_outputs
                    drm_atomic_bridge_chain_disable
                        drm_panel_disable
                    drm_atomic_bridge_chain_post_disable
                        drm_panel_unprepare

And a second time from simple_panel's .shutdown() callback():

  panel_simple_platform_shutdown
    panel_simple_shutdown
      drm_panel_disable
      drm_panel_unprepare

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
