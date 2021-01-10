Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 082692F0A7F
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jan 2021 00:51:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6619589B18;
	Sun, 10 Jan 2021 23:51:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A99AC89B18
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Jan 2021 23:51:07 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id m10so1632207lji.1
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Jan 2021 15:51:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TeXerxLFQDRy1M/7+6jRhfeAjoOXsFHoiOadjCR5Gxo=;
 b=Qt+slJnfi7kKerWix4WQ5h3IJviGUsa6pyl2XSZOa5Jguu/1sbrujcumGoqzIniiru
 QNv6GWf9r3YnXEybcNqWJgIJ1XTxXRieyeSHs9ZIiKMRjBDVi+TJ3rUG4FoIOeN/Sba9
 EKhHiqY4DBXj8uDRXj/mM9GuNN0nehxPDPN7cGJJfd0iXW8q7JW9QpfjO0vnWHjhR4+R
 NFQv2goTLNLfTyqFooMd7Ad79y/ZlR/gx+h+QhPhrLxhM9M2fjqAplekdwBhK31EyqbG
 CBtTuPAG2ILts4fD/jqhIKUVJ5RkCCONSzoku5Z5V0SfuLx7XEwiw2m9bzwYfB038CJT
 EMtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TeXerxLFQDRy1M/7+6jRhfeAjoOXsFHoiOadjCR5Gxo=;
 b=Oyua9ytKEdYcYfYjmFtHbIwaPk5w86t4MUnOABBCBNJ9NoKNwtqNpILL/nhDXX4nC8
 LeB4g9AWcio+tlF+8B7qfwa90OzzYXlTzJKy6SJYGoXTbA7VdVtbaYH6GLLAVJnith4/
 2nwfIXARYWVA7Eh/MIv8yMZQL6ZSVEkv0xP2b3qA38bxHtpKmSfeb0Nwrr7UOJBt2C5Y
 eDy+nfJhGJTXUYyGjhZ/kpeiStdOsp8vHszjADBERB/4XCbECI2Z6NnFeVoje0im/EAE
 SRspJ7fP3nFXo7oFLFp/7/mq3+1WpYnkiIotDC7MmsmTCGahHVHw2vS2DaqXxzMx0XPH
 hstg==
X-Gm-Message-State: AOAM532eGahGFQ7716m9Vf1HUwWL78BUPOF5elBg3AGskhFWk/q5+v9Y
 egMFSTScVu7bZUa2mSw4XFUe0PNHrul+M+WTNJM=
X-Google-Smtp-Source: ABdhPJwqHKxSHgkILumAzY5OKQLD8YP9VBC1kI0H6ZXJ4LVIag60LgqtDk6Pt+7IEB25C6ZhnMGQxCj3WFsKVjDJ03E=
X-Received: by 2002:a2e:bc05:: with SMTP id b5mr6529624ljf.444.1610322666121; 
 Sun, 10 Jan 2021 15:51:06 -0800 (PST)
MIME-Version: 1.0
References: <1608381853-18582-1-git-send-email-oliver.graute@gmail.com>
 <20210108214313.GA7979@ripley>
 <CAOMZO5AXgeGYt4+4NMBRL1Hm-9M4X2DngdEBsJEAHq8+MRhQgQ@mail.gmail.com>
 <20210110153532.GA7264@ripley>
 <CAOMZO5C_hDWeVrCh7k+3OiA0jhQfawhGWE6hxnnFn=wA+dkTGQ@mail.gmail.com>
 <20210110200606.GD7264@ripley>
In-Reply-To: <20210110200606.GD7264@ripley>
From: Fabio Estevam <festevam@gmail.com>
Date: Sun, 10 Jan 2021 20:50:54 -0300
Message-ID: <CAOMZO5DJUm4zutTB1oi5M0zj4_PFZEAbGzX6_LUAkX_dvEz=Qg@mail.gmail.com>
Subject: Re: [PATCH v1] drm/panel: simple: add SGD GKTW70SDAD1SD
To: Oliver Graute <oliver.graute@gmail.com>
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
Cc: David Airlie <airlied@linux.ie>, Marco Felsch <m.felsch@pengutronix.de>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Jan 10, 2021 at 5:09 PM Oliver Graute <oliver.graute@gmail.com> wrote:

> here the schematics and my dts. The board is using a LVDS connector for
> the display.

The schematics shows the GKTW70SDAD1SD panel in the J4 connector, not
the LVDS J7 connector.

> https://www.variscite.de/wp-content/uploads/2017/12/VAR-6ULCustomboard-Schematics.pdf
> https://lore.kernel.org/linux-arm-kernel/1610144511-19018-3-git-send-email-oliver.graute@gmail.com/

As I mentioned earlier you should remove the display timings from the
dts when using the compatible string for the panel.

power-supply = <&reg_touch_3v3> is not correct, as the reg_touch_3v3
does not power the LCD.

Another hint is to use the PLL5_VIDEO as the clock source for the
lcdif controller as done in the imx6ul evk dtsi.

It would also help if you could share the complete boot log.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
