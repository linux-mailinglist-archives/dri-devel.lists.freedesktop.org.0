Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 37F011DB0F5
	for <lists+dri-devel@lfdr.de>; Wed, 20 May 2020 13:04:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22E4D6E139;
	Wed, 20 May 2020 11:04:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com
 [IPv6:2607:f8b0:4864:20::e44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 191FE6E139
 for <dri-devel@lists.freedesktop.org>; Wed, 20 May 2020 11:04:46 +0000 (UTC)
Received: by mail-vs1-xe44.google.com with SMTP id w65so1544761vsw.11
 for <dri-devel@lists.freedesktop.org>; Wed, 20 May 2020 04:04:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tBbP8YUr7lz0DfzrBkUhLuJYKJzm6eP47m/XASkMADA=;
 b=L5zPkmH7U3E6ezICqlMMZi1ISnVgNFKlWSqsW+/zJ5kPbkEksNY7eBRW3OooQ4hxHS
 c3H2M+dTWRW4HTw+TIwwZi1LCJLTvCKxyQcYuwhuYoa/n2eqIlpRcOzkAvDYa0REcTJq
 VV/EZJOTN+MJ8QXIzyqt9C9RMMzhsePk3vzUPr3CEGO4fsaLc8ns1ySMjdmlVNy5arJj
 NtSnTSqUmQauw0Nu49ZQQGaa4eMbzVQejDUM8jmPQyRGfT2Yo7dK5Idj1Pkmle9mf5o3
 +q4FcFKQsouGXwXuBfcuS+OYm4K0pG9AKg4wyOVyWAHoO8pWb5jvLj4jVJB0oUplKhWW
 dNAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tBbP8YUr7lz0DfzrBkUhLuJYKJzm6eP47m/XASkMADA=;
 b=Ye5723dUgdY7APXWMsEywRN1m2hhX+8jd84KNpn9F2S7U2pnWjIFu3BYa78XFAgW5U
 YptkQxpxcZACEz4bYX8xb+6mKVrAo6lOztOI3i62XOaamqzA2+6fa/RaP/t6pHjhw+Bz
 g2fIGZ2VN27LG8b2GTVEDEqXi1Kk97Lzzl6M1wbjJ26z8zMTiR/zBIvDlrCUADOTMN7x
 3JCuu+EcKLwbTIFBN3Fc/YAEai6aneaqoqirzbvB+YpowCUoiP4Fvswdfj65KAJxLEtC
 BjI7PTSB84KnpbQj4M0L+kGAYUPOg+DuIzqXrFRLb3EHUJoN6pBGx+/gneMqHmUeZBbF
 TlOw==
X-Gm-Message-State: AOAM532BAb0cFUeIcjeAaveXqhZJpG0mAEa4J/Do2GMWmp0TNPwCAPL3
 E55lMgsBEdbWKIIeGnsDptcnWPW12n6rzY/cZz0=
X-Google-Smtp-Source: ABdhPJyq/ffWXGjhqdyiXYab3YCkhFT8RSfOHU5lo8o0RdgIi7Fkto4wUoS0zwbvDvdscj+nV5fhYh/UdA3pEjcKCTM=
X-Received: by 2002:a67:71c2:: with SMTP id m185mr2810685vsc.186.1589972685199; 
 Wed, 20 May 2020 04:04:45 -0700 (PDT)
MIME-Version: 1.0
References: <20200517190139.740249-1-sam@ravnborg.org>
In-Reply-To: <20200517190139.740249-1-sam@ravnborg.org>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Wed, 20 May 2020 12:01:50 +0100
Message-ID: <CACvgo50OVFL1fNjmaVFRzDQANMipC9q1EiMN4CGoQHvtY3H14w@mail.gmail.com>
Subject: Re: [PATCH v2 0/16] backlight updates
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Thierry Reding <thierry.reding@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>, Jonathan Corbet <corbet@lwn.net>,
 Russell King <linux@armlinux.org.uk>, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Andy Gross <agross@kernel.org>,
 Uwe Kleine-Konig <u.kleine-koenig@pengutronix.de>, linux-pwm@vger.kernel.org,
 Michael Hennerich <michael.hennerich@analog.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jani Nikula <jani.nikula@intel.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Support Opensource <support.opensource@diasemi.com>,
 Jingoo Han <jingoohan1@gmail.com>, Douglas Anderson <dianders@chromium.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, patches@opensource.cirrus.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sam,

It's a little weird to see this series, just after I mentioned that I
had one in the works.
Either way, patches 2 and 16 need some work. Although if you prefer
that can be done as follow-up.

For the rest:
Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>

-Emil
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
