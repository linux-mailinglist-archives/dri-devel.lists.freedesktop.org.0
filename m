Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 86E5C4FD28A
	for <lists+dri-devel@lfdr.de>; Tue, 12 Apr 2022 09:19:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 701FC10FBAE;
	Tue, 12 Apr 2022 07:19:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com
 [209.85.219.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0C8610FBC0
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Apr 2022 07:19:30 +0000 (UTC)
Received: by mail-qv1-f49.google.com with SMTP id kl29so15495195qvb.2
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Apr 2022 00:19:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xyL71GiM2/e/dyyT/yEb4d7+EMuYsObEg/Dyt4eILbY=;
 b=IpcJS98apcH+PY7xeYpAVgV13iZ4+NUE7EZPP9DDDSzT3OnugTtvUhMYqx6cv+Hr1d
 xlUrR2lBL5aKL1U0FXa/OsudJMbuYzlMQRIHJLPvBndacE307fquNbHge3/bxwvxhOBt
 X5/IBBTim2H9fFFa8YEw7iCd18uYOz1SanFvzxDdiZ2+VZ1QJ23QUFXHfIwo6HMMl7gr
 sXBJ5XA12WBxtob1vVUEkZuGrhBmFK0/6++DM7u4MyYGvnupygTnM8MnjLNoG2ROneU5
 1wlsX8Fbjd+qNSJuFFjk7OA3DCPea7Zm1DTmfk9X09p+iixpDUCsF6ysv/4y9+r17qAi
 MQxg==
X-Gm-Message-State: AOAM530VinKqY3oguSsNWcOAVPN8nLSX15PeOFavGRMNkYpSZ1tjFwSx
 rsiUwOepZMx+jotdGfIcac42AkBqaoTYlVdp
X-Google-Smtp-Source: ABdhPJxO398LjHLCPhriN7LzkylOHd+IncPQ1bJW/7FiWfwqci+pM6tu1uVGMF5AiHniPRub7ysp/A==
X-Received: by 2002:a05:6214:1d0e:b0:445:5f77:e292 with SMTP id
 e14-20020a0562141d0e00b004455f77e292mr508279qvd.79.1649747969909; 
 Tue, 12 Apr 2022 00:19:29 -0700 (PDT)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com.
 [209.85.128.172]) by smtp.gmail.com with ESMTPSA id
 n16-20020ac85b50000000b002eded22d625sm4900500qtw.87.2022.04.12.00.19.28
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Apr 2022 00:19:28 -0700 (PDT)
Received: by mail-yw1-f172.google.com with SMTP id
 00721157ae682-2ebf3746f87so96586507b3.6
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Apr 2022 00:19:28 -0700 (PDT)
X-Received: by 2002:a81:c703:0:b0:2d0:cc6b:3092 with SMTP id
 m3-20020a81c703000000b002d0cc6b3092mr28862513ywi.449.1649747968233; Tue, 12
 Apr 2022 00:19:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220411211243.11121-1-javierm@redhat.com>
 <20220411211243.11121-4-javierm@redhat.com>
In-Reply-To: <20220411211243.11121-4-javierm@redhat.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 12 Apr 2022 09:19:16 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWVZ2+YYkLUjCYLjCQx27AvMUPkwrUkTX52w0dyjVjOEg@mail.gmail.com>
Message-ID: <CAMuHMdWVZ2+YYkLUjCYLjCQx27AvMUPkwrUkTX52w0dyjVjOEg@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] drm/solomon: Add ssd130x new compatible strings
 and deprecate old ones.
To: Javier Martinez Canillas <javierm@redhat.com>
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
Cc: Chen-Yu Tsai <wens@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>,
 David Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Mark Brown <broonie@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Javier,

On Mon, Apr 11, 2022 at 11:12 PM Javier Martinez Canillas
<javierm@redhat.com> wrote:
> The current compatible strings for SSD130x I2C controllers contain an "fb"
> and "-i2c" suffixes. These have been deprecated and more correct ones were
> added, that don't encode a subsystem or bus used to interface the devices.
>
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> Acked-by: Mark Brown <broonie@kernel.org>
> ---
>
> (no changes since v1)

That's not really true ;-)

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
