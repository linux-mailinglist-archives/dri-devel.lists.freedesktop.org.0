Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4157C671959
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 11:42:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0941210E703;
	Wed, 18 Jan 2023 10:42:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com
 [IPv6:2607:f8b0:4864:20::b34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D940B10E60B
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jan 2023 00:10:29 +0000 (UTC)
Received: by mail-yb1-xb34.google.com with SMTP id e202so12844250ybh.11
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jan 2023 16:10:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mqoGaxCv32d9QDH8rbs+wNFx+mRHisbPyzqWglfmzdo=;
 b=X8kEN2RCR0Z7j9dvYBPvrUngCUUeFWtb1S07rcVgUPJfjZWU74psq/1gmCn184hHsa
 uAze+wMWm/HhTilA6p92QH5ri8+IauhT90wWGY1gF+L4D1hxqn6EEUAC2u4NEpV9Nmvn
 x+3uw1f3Kj62qSMscS/TsPlYBzCYZoW6NNjmtZbAPUJ/5TKESadBgRtm8J1MdvDK06vz
 WYfkJ4Sp7G5/xmXAjhT1J6VJC34p+oXr1s/hPXo04xworQlkKedZ7oKdZ+cdRdRuwnLj
 FlNdnb/9pL7BHz0y6pWQYZ0EY4EDj4CwBCe3rsWwDGIkCSO63TNtAcqrhSR1ML+9G3SE
 inSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mqoGaxCv32d9QDH8rbs+wNFx+mRHisbPyzqWglfmzdo=;
 b=RNRXN44Bb45n4soBaOvIz1PxRg0/yGxzFsbga0RnjnETPGk/8ukc2F0LSgl3yw8GuI
 Xe5i+2otsUUqidOOWXI951Slc3BYJV++Ts/LJ90+EES8J0g/gxVHAyeXykfvRfFcTxAh
 CR36xoInEWIJMC8XRLSkTlUxBJ3wr0nAI3AG4M0e8CboSDvTIZLCQF0XBo1MD7g5gjeT
 S1TW28YSCDyk54gL1VD1V5h4w9gDFN+mri3lG5xgepC/vKSFVIcnEB4bSIZJOz6S6wJV
 8ogav2hWXhC315JLiKq3MSPRNf0BwRe3XXuvc/LsOEuBjR2prC8YeN5vRTKkwaIvyTDR
 bZ3w==
X-Gm-Message-State: AFqh2kodhFZmWQaV7wAsmZ8fsF/8PsKnPawHHgqiEpGPWr1OjRASk1Lz
 bdeERC+ANPYJEdWOmqbLXMQ=
X-Google-Smtp-Source: AMrXdXvLckhDa1bG5Pn2IzKkim7J+U5lK7NIKjwNimaDoNI+pnG9GJpZUGRqId1mcbsUGnMptZYX1A==
X-Received: by 2002:a25:4084:0:b0:7d8:aaf9:bdd7 with SMTP id
 n126-20020a254084000000b007d8aaf9bdd7mr4610072yba.3.1674000628976; 
 Tue, 17 Jan 2023 16:10:28 -0800 (PST)
Received: from [192.168.0.14]
 (cpe84948cc906a3-cm84948cc906a0.cpe.net.cable.rogers.com. [99.231.72.42])
 by smtp.gmail.com with ESMTPSA id
 h18-20020a05620a401200b007064fa2c616sm6796318qko.66.2023.01.17.16.10.26
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 17 Jan 2023 16:10:28 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.7\))
Subject: Re: remove arch/sh
From: "D. Jeff Dionne" <djeffdionne@gmail.com>
In-Reply-To: <c9ce648e-e63e-8a47-03c6-7c7e30d8dbc7@roeck-us.net>
Date: Tue, 17 Jan 2023 19:10:25 -0500
Content-Transfer-Encoding: quoted-printable
Message-Id: <9FC76FF3-9DD4-48E2-BC39-479A50B40C1D@gmail.com>
References: <20230113062339.1909087-1-hch@lst.de>
 <11e2e0a8-eabe-2d8c-d612-9cdd4bcc3648@physik.fu-berlin.de>
 <20230116071306.GA15848@lst.de>
 <9325a949-8d19-435a-50bd-9ebe0a432012@landley.net>
 <CAMuHMdUJm5QvzH8hvqwvn9O6qSbzNOapabjw5nh9DJd0F55Zdg@mail.gmail.com>
 <c9ce648e-e63e-8a47-03c6-7c7e30d8dbc7@roeck-us.net>
To: Guenter Roeck <linux@roeck-us.net>
X-Mailer: Apple Mail (2.3608.120.23.2.7)
X-Mailman-Approved-At: Wed, 18 Jan 2023 10:42:12 +0000
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
Cc: linux-fbdev@vger.kernel.org, Rich Felker <dalias@libc.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-sh@vger.kernel.org,
 linux-rtc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mtd@lists.infradead.org, linux-i2c@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>, linux-arch@vger.kernel.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-serial@vger.kernel.org,
 linux-input@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, linux-gpio@vger.kernel.org,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Rob Landley <rob@landley.net>, netdev@vger.kernel.org,
 dmaengine@vger.kernel.org, alsa-devel@alsa-project.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


> Since there are people around with real hardware .... is sh in big =
endian mode
> (sheb) real ? Its qemu support is quite limited; most PCI devices =
don't work
> due to endianness issues. It would be interesting to know if this =
works better
> with real hardware.

Hi Guenter,

SH big endian works very well, and is in use on J-Core J2 SMP (hardware =
w/FPGA, simulation and ASIC this year) as well as some of the Hitachi / =
Renesas IoT chips e.g. SH7619.

It=E2=80=99s the base of the real new line of development (as opposed to =
backward looking support of older SH chips).  New chipsets will be based =
on the same RTL.

But does it actually work?  Yes, we have (new) devices such as a USB =
Wireguard based VPN hardware dongle, that are J2 (SH2 2 core SMP) that =
are in use with Linux sheb, nommu and fdpic.  MMU chips will be little =
endian.

Cheers,
J.

> Thanks,
> Guenter
>=20

