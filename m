Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 100871362C7
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2020 22:43:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3F486E96F;
	Thu,  9 Jan 2020 21:43:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E53766E96F
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jan 2020 21:43:04 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id m26so8795335ljc.13
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Jan 2020 13:43:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cpWbw5rIdEtlhtkKWBS+fTNGmC8hPWtf++mCB+t1qNM=;
 b=adnBh7KwrC6IPF6FmiXMY5VH2IlpE7vAUo6PFIWXtpgwAspkbGvjB3LoaViPSbHECT
 N53LqAUKi8annsf9916I8YiqgVzsfzO1PFJ/8UW+guSDxIl2UXI/++OlaY4Y2Ps1yaCG
 WpsjFqLJpiZAS4K4n9+HB8ExAI87O4MptUfbiozEYBR/d+/x9DTS/r8KtcBAw9hQD2rY
 NcjIE1Ln7PRDKGV8WpLB7gcl+cs8QAeFig/WXEtM2YFwqL1LATwjBgUYD/s7QEofv5np
 0jKFh56YuTf1lSOdHFjY1m2k1kM2XGT9JLLQiZ+PTLFhHBudyV7iBJ6sYoVxqLfri92f
 s2uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cpWbw5rIdEtlhtkKWBS+fTNGmC8hPWtf++mCB+t1qNM=;
 b=S5K/sfJDjEJ021ldvViWpIjBwP4P0KinWcvdWg3oQDggbwRnWecghL1VoIWSbUThuK
 BV3/TsZCqyIaSwxCqFAqIsqkSLsOF7zyEaetULw/VVcjYWPfWbu1XOarP2ST8K39OfE4
 4BxSCz9szwFvtNx3NdD0d9Mz1kxnxYsY2xegBycvFrujsYOx6Dwfabiz9jQJuUvSb9mc
 EcSOxdzPVBUyEPAFWmKfeovntl+3qelxiUVuq15h6Cb6DLEBuMTlHUmfdC49F7lUT2RL
 N8IrZ2Tb/GNQGBcS1KbbZ/CnTxj2UtIz3OHg7TVF1kFfYla1gc93TQwu5IgwVvt4l10Q
 JG9w==
X-Gm-Message-State: APjAAAUPocbALBsiQRyPnouBXYjod+w46D0KrvpEpqviVfkvcmsUOxFE
 vwqNw2CC0sxUeRv7EKtOlI0usgZUI2sJ5fHGEUPi5w==
X-Google-Smtp-Source: APXvYqw5ocqM21H/39cJycruU8k5AHPl3P1QJlcMrD6byvK8CupamkSBbJdIYJH5oB3jhTqirmZRs1wyxA/0wgYJtj8=
X-Received: by 2002:a2e:86d6:: with SMTP id n22mr89706ljj.77.1578606183350;
 Thu, 09 Jan 2020 13:43:03 -0800 (PST)
MIME-Version: 1.0
References: <20200109072815.334867-1-linus.walleij@linaro.org>
 <20200109141748.GB12940@ravnborg.org>
In-Reply-To: <20200109141748.GB12940@ravnborg.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 9 Jan 2020 22:42:52 +0100
Message-ID: <CACRpkdbBpYTazK3W_tgbnZLWQ5GcwRY4EKZRVJGMjH28f2ZvEA@mail.gmail.com>
Subject: Re: [PATCH v8] drm/panel: Add driver for Sony ACX424AKP panel
To: Sam Ravnborg <sam@ravnborg.org>
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
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Stephan Gerhold <stephan@gerhold.net>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 9, 2020 at 3:17 PM Sam Ravnborg <sam@ravnborg.org> wrote:

> Applied to drm-misc-next.

Thanks! Much appreciated.

Yours,
Linus Walleij
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
