Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BB811C2C8D
	for <lists+dri-devel@lfdr.de>; Sun,  3 May 2020 14:54:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EFF16E188;
	Sun,  3 May 2020 12:54:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 405AC6E044
 for <dri-devel@lists.freedesktop.org>; Sat,  2 May 2020 20:12:40 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id j20so10093359edj.0
 for <dri-devel@lists.freedesktop.org>; Sat, 02 May 2020 13:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/LOaseKaG6V+rtNH18IaezwNbYZkddvKgyfOMm5QWjI=;
 b=TEVaPpy1e7qttjqHb7EHvlJ0Ss4UlvzqXCkMyp2wsJLM8xz3r1B7OQ5fsX18h/A3oZ
 ss1Udz2SOx1vCLY3Kk1weN5gx1NnYxPBXNm/kicNSHd1CSy+E1SRrDz2keHAxd6kxIYN
 0Bf3Wnu7dLQr+XYikSzg7E7Efewa7h42Fa46VZH8OnPiRhVDh4IywVyg39HS6WOSDXIc
 cYsnZmqfCyduA27QMlZUy/mfS82PCAcVd6TSzui7ADkTjzZED5I+iX3yQyhOXaDKZskw
 mx35fFNHFqjtBBMweGf/XvSOjVmQ9lkuzInD7dhJbacKIlBVS7J4IGcwN01c4B6D6PoW
 rjGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/LOaseKaG6V+rtNH18IaezwNbYZkddvKgyfOMm5QWjI=;
 b=VUxmUpcnW4kBKCJ43dqTij2PzGL5dAvoDD6mfHlgvTl7HuDxqP3qqG/8PjdqYC0L1H
 bHNZZ252jYnvey7BCXz+pFPcjfeM+MSRrMfaoSlXbbPj5MFdFAHgOuwsenH9ov8WtzPe
 URyfaciCPFSFWtDWu0mXrdkZt6m6oQQ7WbE+9X7P/NEJG4wHaHaSvRERfXgS+DTWkARY
 8++D8uIP0zoLtQF7siuD6vADmZbLCtduMCxM/6WT8SUFeHJy1FCJjZ+4ma9Rr98qoVa8
 81GFBfj6iG+zpPxPvepI+ntE092OcGZjjKjgZllRqZtJWZIdHvJ6DoQyqOaguH4AKQfO
 z4xQ==
X-Gm-Message-State: AGi0PuZnaWDjGBp5W/k2lz3yTUeQChJBlrp/roTBz85wtI4MFcTuryH/
 XJMbAog4SUsIJnXJtHEt0lngir4qqIX7GdkWceE=
X-Google-Smtp-Source: APiQypLoKRoFB4j0P4SGI0u4W4wuHNiG2SBz6fnVNr0YCZ0RdM/Wen8nUr0q9Je35JiOhoMGcTXTHKtOfibtJ9m9X0w=
X-Received: by 2002:a50:f61c:: with SMTP id c28mr8272542edn.365.1588450358825; 
 Sat, 02 May 2020 13:12:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200425203941.3188000-1-martin.blumenstingl@googlemail.com>
 <bf7e6eb5-4655-e958-819b-9d14effe745e@baylibre.com>
In-Reply-To: <bf7e6eb5-4655-e958-819b-9d14effe745e@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 2 May 2020 22:12:28 +0200
Message-ID: <CAFBinCB7=Mo2hxiNxjq=eWZXBp+yqMEPrDvw-tcUsm3PhEcobA@mail.gmail.com>
Subject: Re: [PATCH] drm/meson: viu: fix setting the OSD burst length in
 VIU_OSD1_FIFO_CTRL_STAT
To: Neil Armstrong <narmstrong@baylibre.com>
X-Mailman-Approved-At: Sun, 03 May 2020 12:54:36 +0000
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
Cc: jmasson@baylibre.com, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Neil,

On Tue, Apr 28, 2020 at 10:38 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
[...]
> > @@ -444,9 +437,9 @@ void meson_viu_init(struct meson_drm *priv)
> >               VIU_OSD_FIFO_LIMITS(2);      /* fifo_lim: 2*16=32 */
> >
> >       if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_G12A))
> > -             reg |= meson_viu_osd_burst_length_reg(32);
> > +             reg |= VIU_OSD_BURST_LENGTH_32;
> >       else
> > -             reg |= meson_viu_osd_burst_length_reg(64);
> > +             reg |= VIU_OSD_BURST_LENGTH_64;
> >
> >       writel_relaxed(reg, priv->io_base + _REG(VIU_OSD1_FIFO_CTRL_STAT));
> >       writel_relaxed(reg, priv->io_base + _REG(VIU_OSD2_FIFO_CTRL_STAT));
> >
>
> Thanks,
> Will run some tests !
Does this fix/improve anything for you?
On the 32-bit SoCs kmscube is not smooth (neither on the CVBS nor on
the HDMI output) with a burst length of 24 (which was the old
"accidentally used" value).


Martin
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
