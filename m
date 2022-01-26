Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6649D49C70C
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jan 2022 11:05:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 836A810E35E;
	Wed, 26 Jan 2022 10:05:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87DBA897BC
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jan 2022 10:05:26 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id a8so37690671ejc.8
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jan 2022 02:05:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZIBPG5KdggrxdxTcsYEqUFW4Fhlz+KszjlvwSs+5dP8=;
 b=GM+KII2Zv2mUcviteB7pgK0Y9FBFJP2nO//R8vEVHLFufcw/LNeiZV4JarZZlqsYkZ
 typFLgdqp25CkKGspN+0DHGeN5GNkW+3DjPd4XTCHNHBY/e/I6gkmEN3GhUWqlSyGSGj
 Z8B5WazAgU42xBefblCAiNrg3WVNpF3jLD+DvUzBktRcVvkcg6eC9RdHkCs5+8edRKum
 Zrw2I70CN9r2Xef0xxX81h5fp4hrMHnprwD6oxttKhgbvmAZP3/2lGv1TWeIGgPTqozd
 pUsR807hVsRKG2taCPOQU2lv7WJ33Gld6uqElywbeadjRO+VmwV+MOYBV3CETS9ESn/r
 oLaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZIBPG5KdggrxdxTcsYEqUFW4Fhlz+KszjlvwSs+5dP8=;
 b=i2V95kL2wdvLSdr5RgdO7S4NgeB68Kq9e+T/QwIQeBQ9Z89USrq5HJ6Gyo6SsJaPN+
 qmsO0cHmWniZJ1F1aFp221SxAo1D7DXrBvtHUCnsESZYuQ4CoJQ+PF7IC9S5pi1Hkll5
 D+nPdgfI43U8Ci+Eac0jplRS4tZjVZ36qaNeNsd04VXjX3N76/i7fVqXarxmlsDl0Yf+
 6WnN9t3gSmnMuYyoYagmXM6PvU2/UPyAggIq5Bullf/FlzdmcWIfvpXlyCjqxkMr/APC
 n78gAA4C1Vi7Pk2mWRTa8vRE7Q43iYUjInLYJLCEfU/3C5XX7mhi1eowIiad1UWv7N8r
 CrZw==
X-Gm-Message-State: AOAM533onmXyXNHhhprV9K/9W652pca39T4XwAqJ6VdJkA9MXHD0znlK
 DowYdjIcKkmYDGtcmKrUGWSlJieyzmAShifHx7g=
X-Google-Smtp-Source: ABdhPJxLTWUKmHtcOeib3twEwVqJGJ4TxCtjycPib6a85lcs7VMVl7shvXiH79nfAsy8Iir3ilNC+ATyz+6Lrri68Ok=
X-Received: by 2002:a17:907:60d6:: with SMTP id
 hv22mr3480319ejc.132.1643191525022; 
 Wed, 26 Jan 2022 02:05:25 -0800 (PST)
MIME-Version: 1.0
References: <20220125202118.63362-1-andriy.shevchenko@linux.intel.com>
 <991e988b-7225-881b-a59a-33c3eae044be@suse.de>
 <CAHp75Vc2cjHkJwNSiJ-HSWBG=DYy68uvD7QQzNdRp3mQxoY1nw@mail.gmail.com>
In-Reply-To: <CAHp75Vc2cjHkJwNSiJ-HSWBG=DYy68uvD7QQzNdRp3mQxoY1nw@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 26 Jan 2022 12:04:26 +0200
Message-ID: <CAHp75Vd7oaYPKx6bxjCqNnm6fieeQFrtq5K4YYrxYbXoXFy=+Q@mail.gmail.com>
Subject: Re: [PATCH v1 0/4] fbtft: Unorphan the driver for maintenance
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: Andy Shevchenko <andy@kernel.org>,
 "open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>,
 Michael Hennerich <michael.hennerich@analog.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>,
 linux-staging@lists.linux.dev,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Phillip Potter <phil@philpotter.co.uk>, Carlis <zhangxuezhi1@yulong.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Lee Jones <lee.jones@linaro.org>, Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 26, 2022 at 12:02 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Wed, Jan 26, 2022 at 10:52 AM Thomas Zimmermann <tzimmermann@suse.de> wrote:
> > Am 25.01.22 um 21:21 schrieb Andy Shevchenko:

...

> > But why? We already have DRM drivers for some of these devices.
>
> No, we do not (only a few are available).

Sorry, I missed your word 'some'. Some == almost none from the list (I
don't remember exact numbers but something like 2 out of 10 are
supported by tiny DRM and see about interfaces).

-- 
With Best Regards,
Andy Shevchenko
