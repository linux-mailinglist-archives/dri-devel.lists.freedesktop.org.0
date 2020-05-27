Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40D601E3D5E
	for <lists+dri-devel@lfdr.de>; Wed, 27 May 2020 11:15:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF8268995F;
	Wed, 27 May 2020 09:15:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 552518995F
 for <dri-devel@lists.freedesktop.org>; Wed, 27 May 2020 09:15:24 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id b27so13640718qka.4
 for <dri-devel@lists.freedesktop.org>; Wed, 27 May 2020 02:15:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=endlessm-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=idtnrQWeAURzpQW+RLs00G+O8A4gS3L+K9UkeXCQe20=;
 b=kaep8FtjTBescBuh/DTMipJrlsUmsVVNCeoJaIoHjvFY3aLX/ypieDP9Eq0bg2Z8Fy
 mfEtfW6eHGq4NWtk78hJA1GrV3b34qvVN1y21NxIWuPsmIIXM3kXfejRW4UodWTNTGQt
 YABx6/a5Ku1L3BTkJ0r9WGY0xs/SJ+8CxmdNMGjb3/7hEkYvKlwFZQmAKkojuQcYbqHm
 wfcdyvs6+MwWQTqgRRzcFX/xcVW3zkg99aMg/449QxobkNDo8rTRYi2IYoVyuomDKqhv
 sBoGhIIszOrZDFM6DGvgkQHYND20PdHpwXfvfZuf9WzJSYFFV0iDQC1JNV1jMqjJ2VlQ
 tvhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=idtnrQWeAURzpQW+RLs00G+O8A4gS3L+K9UkeXCQe20=;
 b=CoM6WEftEYFvdsJRo26N/zHo1wWmttFfQaSWsHB1SB5KVMUe+JTLOHu1DbAUgU8qTk
 lqf62mcxQXtIbXd2J4tv5ON/R/GZodhfnT5wKmeE6hTzJ5ElccJ2jFWM3kjGn6L7zE0g
 l4kmuidXSqas6KVhSqvQF55zTCpJjYx+bM3+UG9xAjIwAkI6KtdY+BNTGWHFG5McM45m
 JF0uYFM2OoUoxSQ0tsAJ1eYuXF3MiJL2nAAvwXqLD2AxuCcc5sGaMk6pfU62Hui/Cvyf
 2eXIwhZm5uFFxtlCaqh3mpd1mUudErgQ9iN5Ix3FOfXZ8iB5hJE9ywW5f9SJ0d+7JVls
 jPKQ==
X-Gm-Message-State: AOAM533b6xhSjyFUuTT5+5Mv8iVvk+s5nnhUG+XPMzOijavCh5tAF6wK
 NHn70VIFuvgza7BRviPGD65m4FL/GVI4Ru5ZAhSgDQ==
X-Google-Smtp-Source: ABdhPJz2rYXRknrAa47G5ZoicHWOBJaEnkLv8Z2pCeyzrLZa3p9k5mhYAvQMKK0N2KMt5GCFK7O6dYRm2sJ476AKlKA=
X-Received: by 2002:a37:6851:: with SMTP id d78mr2994513qkc.86.1590570923313; 
 Wed, 27 May 2020 02:15:23 -0700 (PDT)
MIME-Version: 1.0
References: <cover.d1e741d37e43e1ba2d2ecd93fc81d42a6df99d14.1587742492.git-series.maxime@cerno.tech>
 <20200427072342.5499-1-jian-hong@endlessm.com>
 <20200428162152.ztsqp7nxqbwqrm6r@gilmour.lan>
 <CAPpJ_efvtVzb_hvoVOeaePh7UdE13wOiiGaDBH38cToB-yhkUg@mail.gmail.com>
 <20200507172158.cybtakpo6cxv6wcs@gilmour.lan>
 <CAPpJ_efxenmSXt2OXkhkQ1jDJ59tyWBDUvmpyOB-bfPMDENQZg@mail.gmail.com>
 <CAPpJ_ed9TMJjN8xS1_3saf5obQhULJSLNgQSAFxgiWM2QX9A7Q@mail.gmail.com>
 <20200526102018.kznh6aglpkqlp6en@gilmour.lan>
 <CAD8Lp467DiYWLwH6T1Jeq-uyN4VEuef-gGWw0_bBTtmSPr00Ag@mail.gmail.com>
 <20200527091335.7wc3uy67lbz7j4di@gilmour.lan>
In-Reply-To: <20200527091335.7wc3uy67lbz7j4di@gilmour.lan>
From: Daniel Drake <drake@endlessm.com>
Date: Wed, 27 May 2020 17:15:12 +0800
Message-ID: <CAD8Lp45ucK-yZ5G_DrUVA7rnxo58UF1LPUy65w2PCOcSxKx_Sg@mail.gmail.com>
Subject: Re: [PATCH v2 00/91] drm/vc4: Support BCM2711 Display Pipelin
To: Maxime Ripard <maxime@cerno.tech>
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
Cc: linux-arm-kernel@lists.infradead.org,
 devicetree <devicetree@vger.kernel.org>,
 Linux Kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Jian-Hong Pan <jian-hong@endlessm.com>,
 Linux Upstreaming Team <linux@endlessm.com>, linux-clk@vger.kernel.org,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>, linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 27, 2020 at 5:13 PM Maxime Ripard <maxime@cerno.tech> wrote:
> I'm about to send a v3 today or tomorrow, I can Cc you (and Jian-Hong) if you
> want.

That would be great, although given the potentially inconsistent
results we've been seeing so far it would be great if you could
additionally push a git branch somewhere.
That way we can have higher confidence that we are applying exactly
the same patches to the same base etc.

Thanks
Daniel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
