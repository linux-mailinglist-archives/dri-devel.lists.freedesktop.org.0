Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AB7962E813
	for <lists+dri-devel@lfdr.de>; Thu, 17 Nov 2022 23:18:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDCCE10E6A4;
	Thu, 17 Nov 2022 22:18:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [IPv6:2607:f8b0:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 601E210E6A1
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Nov 2022 22:18:19 +0000 (UTC)
Received: by mail-pg1-x535.google.com with SMTP id q1so3333285pgl.11
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Nov 2022 14:18:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-disposition:mime-version:message-id:subject:cc:to:date:from
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JYzob4348nYU+2Eh2QmU2auy9qKtGqawS3+SiTC3pr8=;
 b=mT6f5gl1eMimurIMmfHra1ZzdxxC44UxnmLk9ya83XFZxxCWVmAJlNJsuQm9+hWqo9
 clAArb97Lztgdt9fUawtaUPdSOcO3YtzWHrw3P6moc6Dh0+MA3W56f7CCeSMPYplF2h3
 a7COln0GoeKLRrAgBqCQmkPuOYTL1GDqAZjjA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:date:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JYzob4348nYU+2Eh2QmU2auy9qKtGqawS3+SiTC3pr8=;
 b=tc/IotOB5OPWp67MdLBEOJ4mwwbKAu44KIltRKWpmjNH9XmsauDCqmtezDXwlIFP2h
 HCVX6vz3yNwQ3SIJUnwr4UaDh58M6E45Q9vHSqL4vtEFnRMhrH4ocG1AvEkAPgwbFcBr
 dtvEgO/YycQnNTcsLm9HjMO8c+rZpGse2RFSc1H1U9hpsYPuGOM60hfpkBwa6a6toVF9
 yVkeAA+DYRebYHLTHKyA8N630pARDtxTDjOeUMRuosMRJpSq/kxvc3wQXW2nkV1JpwIS
 5m8wXH+2BZ0lfZrSv5DYHsy+nf8tGiEZQyz8kqDrr0BlEOKgID/70gsB7Rt9uBJWmdT6
 +7iA==
X-Gm-Message-State: ANoB5plnF/aK8nAUq1AYtmlPyjiwLz9oceI9dfG6Msc39m45rjU4GdGs
 6Pr+50h75D+5rzhpIomwY8aQlQ==
X-Google-Smtp-Source: AA0mqf4WXJ8bLo8CDx+tvlgGvCwBPESTcqzdM/ckT0mWIDLw4npKCloTa0mrn276bHYnkJex23nlEg==
X-Received: by 2002:a63:f047:0:b0:476:7742:de19 with SMTP id
 s7-20020a63f047000000b004767742de19mr3827473pgj.343.1668723498884; 
 Thu, 17 Nov 2022 14:18:18 -0800 (PST)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net.
 [198.0.35.241]) by smtp.gmail.com with ESMTPSA id
 n14-20020a170902d2ce00b00188ef3ea2b6sm1901208plc.262.2022.11.17.14.18.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Nov 2022 14:18:18 -0800 (PST)
From: coverity-bot <keescook@chromium.org>
X-Google-Original-From: coverity-bot <keescook+coverity-bot@chromium.org>
Date: Thu, 17 Nov 2022 14:18:18 -0800
To: Maxime Ripard <maxime@cerno.tech>
Subject: Coverity: drm_mode_parse_cmdline_named_mode(): Security best
 practices violations
Message-ID: <202211171417.5A924A838@keescook>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>, linux-kernel@vger.kernel.org,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>, linux-next@vger.kernel.org,
 Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>,
 dri-devel@lists.freedesktop.org, linux-hardening@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello!

This is an experimental semi-automated report about issues detected by
Coverity from a scan of next-20221117 as part of the linux-next scan project:
https://scan.coverity.com/projects/linux-next-weekly-scan

You're getting this email because you were associated with the identified
lines of code (noted below) that were touched by commits:

  Tue Nov 15 10:09:44 2022 +0100
    a7ab155397dd ("drm/modes: Switch to named mode descriptors")

Coverity reported the following:

*** CID 1527354:  Security best practices violations  (STRING_OVERFLOW)
drivers/gpu/drm/drm_modes.c:1812 in drm_mode_parse_cmdline_named_mode()
1806     		int ret;
1807
1808     		ret = str_has_prefix(name, mode->name);
1809     		if (ret != name_end)
1810     			continue;
1811
vvv     CID 1527354:  Security best practices violations  (STRING_OVERFLOW)
vvv     You might overrun the 32-character fixed-size string "cmdline_mode->name" by copying "mode->name" without checking the length.
1812     		strcpy(cmdline_mode->name, mode->name);
1813     		cmdline_mode->pixel_clock = mode->pixel_clock_khz;
1814     		cmdline_mode->xres = mode->xres;
1815     		cmdline_mode->yres = mode->yres;
1816     		cmdline_mode->interlace = !!(mode->flags & DRM_MODE_FLAG_INTERLACE);
1817     		cmdline_mode->specified = true;

If this is a false positive, please let us know so we can mark it as
such, or teach the Coverity rules to be smarter. If not, please make
sure fixes get into linux-next. :) For patches fixing this, please
include these lines (but double-check the "Fixes" first):

Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
Addresses-Coverity-ID: 1527354 ("Security best practices violations")
Fixes: a7ab155397dd ("drm/modes: Switch to named mode descriptors")

Since mode->name is unbounded, this may overrun cmdline_mode->name
without CONFIG_FORTIFY_SOURCE=y. Please use strscpy().

Thanks for your attention!

-- 
Coverity-bot
