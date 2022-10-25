Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 040D060CCBF
	for <lists+dri-devel@lfdr.de>; Tue, 25 Oct 2022 14:56:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65A5110E358;
	Tue, 25 Oct 2022 12:55:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3545310E358
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Oct 2022 12:55:53 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B0594B81A9C
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Oct 2022 12:55:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 168ADC433C1
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Oct 2022 12:55:50 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="TLDAXUj0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1666702548;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QGSEJHQ6O6h56v9HDr0qaun/dwKwWOG4TfufXFT9A7g=;
 b=TLDAXUj0dhqKSXKimkr9oIlh3k/6nMfUB9a8GjP+AlVoxSX0A5UQ6R6kYiZ9Jik4dkSDEM
 y9T9IimtGqYHqDbp4PYeU//M7RjFTubI2K6fWVwt9+GtwjIvleAmsbbdeLAdMYdic1pyFR
 bwXl+pUkkVyG7EZCgVEMlP8byRu3IXE=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id a2dd6ac9
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <dri-devel@lists.freedesktop.org>;
 Tue, 25 Oct 2022 12:55:48 +0000 (UTC)
Received: by mail-vs1-f50.google.com with SMTP id n63so10830680vsc.8
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Oct 2022 05:55:48 -0700 (PDT)
X-Gm-Message-State: ACrzQf36YepHck+2rf13Q9rsOpUmm8rm6Lzla1fgEU85xeheplnaI0dD
 nL34CTn/LqN7UMSYe8NNPAU1Z8rQfQduI65LpLQ=
X-Google-Smtp-Source: AMsMyM4JokenVVEnbZ82CCTmDYmaTcsx2t4i/rPNK/XWJbxN4bY61RcFoPAXn4TA3gx2R7Mvql4drbYRB8ft7pY2F+0=
X-Received: by 2002:a05:6102:f9a:b0:3aa:1a11:2702 with SMTP id
 e26-20020a0561020f9a00b003aa1a112702mr5874116vsv.73.1666702547125; Tue, 25
 Oct 2022 05:55:47 -0700 (PDT)
MIME-Version: 1.0
References: <20221024162901.535972-1-Jason@zx2c4.com>
 <ec8edb92-a21b-6291-4275-d7cba97d7ad7@gmx.de>
In-Reply-To: <ec8edb92-a21b-6291-4275-d7cba97d7ad7@gmx.de>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 25 Oct 2022 14:55:36 +0200
X-Gmail-Original-Message-ID: <CAHmME9r=E=sUEU0_thtrj6agd_8YbTVUm2fEsErGKM-ff6y03w@mail.gmail.com>
Message-ID: <CAHmME9r=E=sUEU0_thtrj6agd_8YbTVUm2fEsErGKM-ff6y03w@mail.gmail.com>
Subject: Re: [PATCH] video: fbdev: sis: use explicitly signed char
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
Cc: linux-fbdev@vger.kernel.org, linux-usb@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thomas Winischhofer <thomas@winischhofer.net>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Oct 24, 2022 at 8:29 PM Helge Deller <deller@gmx.de> wrote:
>
> On 10/24/22 18:29, Jason A. Donenfeld wrote:
> > With char becoming unsigned by default, and with `char` alone being
> > ambiguous and based on architecture, signed chars need to be marked
> > explicitly as such. This fixes warnings like:
> >
> > drivers/video/fbdev/sis/init301.c:3549 SiS_GetCRT2Data301() warn: 'SiS_Pr->SiS_EModeIDTable[ModeIdIndex]->ROMMODEIDX661' is unsigned
> >
> > Cc: Thomas Winischhofer <thomas@winischhofer.net>
> > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Cc: Helge Deller <deller@gmx.de>
> > Cc: linux-usb@vger.kernel.org
> > Cc: linux-fbdev@vger.kernel.org
> > Cc: dri-devel@lists.freedesktop.org
> > Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
>
> Applied to linux-fbdev git tree.

For 6.1 as a fix, right? Since this is already broken on, e.g., ARM.

Jason
