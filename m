Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 147A562F8A5
	for <lists+dri-devel@lfdr.de>; Fri, 18 Nov 2022 16:01:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 817BA10E762;
	Fri, 18 Nov 2022 15:01:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7460410E769
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Nov 2022 15:01:10 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id j15so8978928wrq.3
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Nov 2022 07:01:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=aW7crbEbz284h73QkI0OBQRIGwa5lP2BQG4aFKW2hnI=;
 b=pcc6tk+f0fwfWJ7okzVw52gcRxUsw1/nvR5Rb4qgVqk2U78VdaNE1V9jlIodWMaUSt
 48u5VG25RqkZW8A90vJfPsHKTgvfiBBnlMkSoidAOjBdKR7mqb0MlzoTRld6U05+kn78
 33BiZ+xlNbW8M5pFpqFHeDgpeZBrYZeRnoUfw3GqFAsl8ewhLeUFI7kL4rl4HUsHsRPf
 WYTrAxCr+/O+caFcogDQLM3qO00vCMsuTEUQHjdzJOHXqpJhd9Qgs5mkmZWan7zDRWNk
 FM2G8riNWjePmwV1qpYRxWCvTZHYGTvgOwxu/la/NrX+ucNInGGUpR5DrYlctbczCuyX
 Q8Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aW7crbEbz284h73QkI0OBQRIGwa5lP2BQG4aFKW2hnI=;
 b=VHVe85gqdR+gUxLucNV5LZZjRtkudb3bDE4ZpCfqEQqoB4gnxBnAcEnnZrgw7/q5rr
 V8SgMVcJ26ly/T2BYx7RjW7/cMvev6YjZIfMBKnkwegK57f1r9UcQmm7AfTjWu5ZUxtH
 FjzSyRSadJjgo+YJjSsq+Psf4WQm5jstx1l3sfiI6KararzEF5pTzJf5Xg5JoXW4ORY+
 fvZWzGq1/VdlTskdT0O5I92ymUW+sJTAIk7uk5R0+WoKTFXieFsOw98IJTh+ZAh3MKVl
 0UFrHd7ooDGDNmBc5oXUznBg8j53pb/CsmhQ/ZBDv2Hy3p97HaKpMNfyYI5ii1PrVave
 YQCQ==
X-Gm-Message-State: ANoB5pnqcUnVfYxJZEbthpRSHzgKTJh9j0Kx2MpXjWgA/+H0t9R2LSDL
 nLAaHLnrqnftp8pZq7QCj6I=
X-Google-Smtp-Source: AA0mqf4RCGVTJXtBV1U+MLwZRP8wDXP/fcyRno+YLZZulJvHKEGHUQKaYwEne9UdiqEf4yg5LmwgVA==
X-Received: by 2002:adf:fb01:0:b0:22e:6556:da75 with SMTP id
 c1-20020adffb01000000b0022e6556da75mr4687787wrr.653.1668783668925; 
 Fri, 18 Nov 2022 07:01:08 -0800 (PST)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 x2-20020a1c7c02000000b003b4935f04a4sm5590190wmc.5.2022.11.18.07.01.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Nov 2022 07:01:08 -0800 (PST)
Date: Fri, 18 Nov 2022 18:01:04 +0300
From: Dan Carpenter <error27@gmail.com>
To: biju.das.jz@bp.renesas.com
Subject: [bug report] drm: rcar-du: Add RZ/G2L DSI driver
Message-ID: <Y3eeMGDxaLcRxu69@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Biju Das,

The patch 7a043f978ed1: "drm: rcar-du: Add RZ/G2L DSI driver" from
Sep 20, 2022, leads to the following Smatch static checker warning:

	drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c:372 rzg2l_mipi_dsi_set_display_timing()
	warn: uninitialized special assign 'vich1ppsetr |= (1 << 15)'

drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c
    347 static void rzg2l_mipi_dsi_set_display_timing(struct rzg2l_mipi_dsi *dsi,
    348                                               const struct drm_display_mode *mode)
    349 {
    350         u32 vich1ppsetr;
    351         u32 vich1vssetr;
    352         u32 vich1vpsetr;
    353         u32 vich1hssetr;
    354         u32 vich1hpsetr;
    355         int dsi_format;
    356         u32 delay[2];
    357         u8 index;
    358 
    359         /* Configuration for Pixel Packet */
    360         dsi_format = mipi_dsi_pixel_format_to_bpp(dsi->format);
    361         switch (dsi_format) {
    362         case 24:
    363                 vich1ppsetr = VICH1PPSETR_DT_RGB24;
    364                 break;
    365         case 18:
    366                 vich1ppsetr = VICH1PPSETR_DT_RGB18;
    367                 break;

What if mipi_dsi_pixel_format_to_bpp() returns 16?

    368         }
    369 
    370         if ((dsi->mode_flags & MIPI_DSI_MODE_VIDEO_SYNC_PULSE) &&
    371             !(dsi->mode_flags & MIPI_DSI_MODE_VIDEO_BURST))
--> 372                 vich1ppsetr |= VICH1PPSETR_TXESYNC_PULSE;
                        ^^^^^^^^^^^
Uninitialized.

    373 
    374         rzg2l_mipi_dsi_link_write(dsi, VICH1PPSETR, vich1ppsetr);

regards,
dan carpenter
