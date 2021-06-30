Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2B483B8680
	for <lists+dri-devel@lfdr.de>; Wed, 30 Jun 2021 17:49:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48C086EA28;
	Wed, 30 Jun 2021 15:49:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F28A6EA28
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jun 2021 15:49:19 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id a11so5919522lfg.11
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jun 2021 08:49:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=CBLEdCNsKL/DEmzbZarmUYfKxCM0YWrJ43uCB3rc4OQ=;
 b=AUuZnHOjslNRB3LgR9mL5FD3aj4xdBmXgqnleB5Xt+zw9w8KmhzeCOoyBKSLTk0QY7
 P4LPhv2mDvFL84eEAG45TVUozAs9N5WRFVqrBRt6uMZXHP5+sUUHEuOoAAcEY+C06LWc
 RXnzLXO72vOzWFAa2S02rZ/pIKtjgK0ri0KAbBbfTyrNi44wTHPgOa5e6rkF/HRDRw6y
 5qEOypbbciof/93fQGnZBisXbVpGyDaSocws3DAKhTdFHh13bK59F27Z/TlKiy7Ujvd6
 DqWKs5twR2k4LTM7hIBLDqkkd7WCvMT3Il+2vXzDX9zh3/bYMfsyFffM/1W4PLdFEaVy
 LKbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=CBLEdCNsKL/DEmzbZarmUYfKxCM0YWrJ43uCB3rc4OQ=;
 b=Lkav+h7a/yD/5jeNQYiFh0QuBDk0g2ILCNgauw+0OUdWdAecb70oN2GtM81WXmpVNZ
 FMpcs5QemAguqddZeQfXd5WFpytzKB3Pct3Jex2FHZIn68VqSb55rLV8VUqeZUF4z8fc
 lRIUjLEO82yr9dQR1rXRWQo5OAxDfUJ3RO+ANmBMPosQS/OTLoeYLpu1x8av3M4KNfbk
 rOOjeO/XT/1ZLfJsf/J2YkwTNelp0q2voa7dMMkclfsT4OPstVvpHrcmaHbSdOKnUkY9
 FCVV1CiB00p9CZIG5ru25cDoAJeG1wLxGR3nElLAVGDWhu5byFIgSo+oOvKCb/s6N7N2
 DtHw==
X-Gm-Message-State: AOAM533LFVb22yTBT+xgIQd/FVZrLmOJkv1AUmxGUv3oq3tEnXw5i8U4
 ry84q+ruRN8KaTINdSm+45zMcwMcHrWxsI1T93ywdw==
X-Google-Smtp-Source: ABdhPJwgNjE9V41fvcIyXXDd3XXUbOL1DY0RiunHeYzLZIF3cHjFud3J1eazy5yDAgcRfIbo+2+RjXzgJG/Kl69HiSM=
X-Received: by 2002:a19:c141:: with SMTP id r62mr2148574lff.157.1625068157573; 
 Wed, 30 Jun 2021 08:49:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210624224458.2486701-1-linus.walleij@linaro.org>
 <d7dc8987-60ab-41c2-0200-a7f6a8ae837c@tronnes.org>
In-Reply-To: <d7dc8987-60ab-41c2-0200-a7f6a8ae837c@tronnes.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 30 Jun 2021 17:49:06 +0200
Message-ID: <CACRpkda-si+D=Q7=nuy+NjrQEixVQRhHt=o615N4xY7f03DkwQ@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: ws2401: Add driver for WideChips WS2401
To: =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Douglas Anderson <dianders@chromium.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 phone-devel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 28, 2021 at 11:30 AM Noralf Tr=C3=B8nnes <noralf@tronnes.org> w=
rote:

> > +     dev_info(ws->dev, "MTP ID: %02x %02x %02x\n", id1, id2, id3);
> > +}
>
> Why do you read these id's on every power on, it doesn't look like you
> use them?
>
> If they're just informational, they should be available through debugfs,
> see mipi_dbi_debugfs_init().

I moved them to probe. I actually really want to print this into
dmesg so we learn to understand these MTP values better,
if for nothing else so for the fact that they will turn up in google
searches.

The actual display controller vendor comes out in the first
MTP byte, and by collecting this data we can figure out to
some extent what kind of hardware is actually inside some
of these displays. In this case 0xDA is 0x40 so that is
widechips manufacturer ID.

I fixed the rest of the comments!

Yours,
Linus Walleij
