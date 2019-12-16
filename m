Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 751B4120289
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2019 11:30:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C599C6E497;
	Mon, 16 Dec 2019 10:30:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F7146E497
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2019 10:30:07 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id m30so3810920lfp.8
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2019 02:30:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zAZ66aTL4botjOAzyywFJUSCyL81NlmcXv7uzteZ4R8=;
 b=MNDQAaFQhnjUWeVovtaucXzv5IniCaNpgTqcGXFx4jLe9x12jIYadC1PDnKMkPQDMK
 l2ehosXgsMnxhudijyOvnJ+2vzbUWEIeHPFUriZ0paYwJfnoOn54P2B+sQklEVWVQcw4
 1T13ARTxSHB4SWDKf+zLThCGQ1iXcfpXnb6ACQsNk7u2HJXgpABr6a2qReZ5vfuS007z
 NjpK9Bhvzu5DQHSzVNXdv0/U8izrlloNKK1hMI5lpzL6sQzLwNTL1SIjwhP6Zna7Ivxv
 ewXg9sokgFFnzWqgeMrYd7orbCOiTcx9is4y2ZlEFFndxObGz4NfhSy7ItC3L8XppQCW
 Mw0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zAZ66aTL4botjOAzyywFJUSCyL81NlmcXv7uzteZ4R8=;
 b=t3unfeW0rA+HvxYvckoBU6MM9yZxGmdDR0jZ6pkChAa07Dd/yopBVQIFqJwSuqZ3Md
 SzwrAsz1PPq18+Ffcx+1zD+MLFGC6upsBwQ2cUqA5FAgPlYH8YFTHRANZjfOWipK8FEJ
 fC/UgQ8yRvS7l9gMH0Ah73uNS41MlVEgN98f8gHIcBP1YLbJzgh/DFErCrlPlJKyFcDU
 nQb6EoCMQKqpM3oRHfcUw6a7704NKkICmvgwdz99UKoodtkm0p+Ln8iWAHNhcqG6YvvU
 zfyp+XMNDwFH1ms4rPZwMWyUHo+aEcK51xEiYv6lFWLohw9rD9CXo1MZ/tsmrWKo2TIQ
 ch0A==
X-Gm-Message-State: APjAAAXvs1FbKlxw3CawuRyGMHPNSAinbBO0x6jExqAq//pahNW6UPou
 Mp1Hh/J8sAvi1XN+zUpBtLv/UE+1enuuAJ4w5alrDw==
X-Google-Smtp-Source: APXvYqxlD1vfPmZyf5Z5diCSQWuPAUZ5VXeaBxCzjkY1MrbIYOP/373nkrVwCGdhAD+O1kDqu2EG46B1jbTPzJyZdoo=
X-Received: by 2002:ac2:4945:: with SMTP id o5mr15738312lfi.93.1576492205964; 
 Mon, 16 Dec 2019 02:30:05 -0800 (PST)
MIME-Version: 1.0
References: <20191215163810.52356-1-hdegoede@redhat.com>
 <20191215163810.52356-6-hdegoede@redhat.com>
In-Reply-To: <20191215163810.52356-6-hdegoede@redhat.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 16 Dec 2019 11:29:54 +0100
Message-ID: <CACRpkdZCehawbGz+dELgjte6pTz0oEFQ3mo-2FuM4CQwm58tHQ@mail.gmail.com>
Subject: Re: [PATCH 5/5] drm/i915/dsi: Control panel and backlight enable
 GPIOs on BYT
To: Hans de Goede <hdegoede@redhat.com>
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Dec 15, 2019 at 5:38 PM Hans de Goede <hdegoede@redhat.com> wrote:

> On Bay Trail devices the MIPI power on/off sequences for DSI LCD panels
> do not control the LCD panel- and backlight-enable GPIOs. So far, when
> the VBT indicates we should use the SoC for backlight control, we have
> been relying on these GPIOs being configured as output and driven high by
> the Video BIOS (GOP) when it initializes the panel.
>
> This does not work when the device is booted with a HDMI monitor connected
> as then the GOP will initialize the HDMI instead of the panel, leaving the
> panel black, even though the i915 driver tries to output an image to it.
>
> Likewise on some device-models when the GOP does not initialize the DSI
> panel it also leaves the mux of the PWM0 pin in generic GPIO mode instead
> of muxing it to the PWM controller.
>
> This commit makes the DSI code control the SoC GPIOs for panel- and
> backlight-enable on BYT, when the VBT indicates the SoC should be used
>
> for backlight control. It also ensures that the PWM0 pin is muxed to the
> PWM controller in this case.
>
> This fixes the LCD panel not lighting up on various devices when booted
> with a HDMI monitor connected. This has been tested to fix this on the
> following devices:
>
> Peaq C1010
> Point of View MOBII TAB-P800W
> Point of View MOBII TAB-P1005W
> Terra Pad 1061
> Yours Y8W81
>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Looks good to me:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
