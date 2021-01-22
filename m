Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B0A93006E9
	for <lists+dri-devel@lfdr.de>; Fri, 22 Jan 2021 16:15:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1578F6EA0F;
	Fri, 22 Jan 2021 15:15:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1BB86E9FC;
 Fri, 22 Jan 2021 15:15:45 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id q8so7971293lfm.10;
 Fri, 22 Jan 2021 07:15:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qk2RWOZdZhtj3fXlE/8fTA//9oGzUEFnLFIS8IC+Nks=;
 b=LY0VZG5fkIpZsgPN4nBzZX+Iu3+PfeLasyeYvo98La2fLKdJOb3pry5d4LmnIZbxF0
 fM3oQXP12uCzjAZm/jfQJ+nPppG6x0m3ROdU83NxH8aHjaylyJMT+itc0gTZCQQpi4qu
 Cb/4FeahwnpMPqkxhx5dr/ny6McTKX/CSHwtvshFHrA390TP3foOaGsilGlwmL8G7suB
 u12spinE7OKg+Ei4uB0ZBrypC0kTshuDQtyFrRinzEiMpSD1yusmyvQLOvztAJVTRlvx
 90VOIsNDHWuTepcOu+UXd96AF4tSIHRsItGBI8e9nBNm9kodrb6VGXxua7q1u7YLhNSN
 ps9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qk2RWOZdZhtj3fXlE/8fTA//9oGzUEFnLFIS8IC+Nks=;
 b=CD+qDIRX0ttc5Llp9VXyyQjwfaGVQjG/BTIcNC1JWGwydDDh38apJOc3A31Vurg+2Z
 fYroEOfJ5IkQvmS0Rl9k02TLrZbxEtfrqW5KY3V1RY79jiUHA7Kuw3ddw4ctTTS47EjH
 C85XIuBWaA+2JIiy5LLi6uTCxxWOj/1+5zGZ9dCOhHf3J9rSXlEIlvkHAB8nND+WDjKm
 vjgq3MEx8Vr90bArbmUrK4n7F6z3rIM9Cz4xTHnzrQczPjukGdjtNZSDnJpK6Iu3yHke
 KPJ13ImET4dDBXPK9keNDVNLNCrts+uoU/g+X4XRMeYvH3yBTyjAH4m7a8uATrfGGYpl
 Wd4A==
X-Gm-Message-State: AOAM531ObD0DiuROKDj9sWp3B7uITMBuoC7CwpDp936OXdhNbp6DQdpn
 objrjsVhiEdmKnlDj2ht9i+YzHFQAfAyU7SiMQ0=
X-Google-Smtp-Source: ABdhPJyENeh0fc72YdvWpN76cv/im0e5YaX6BMZTg0m9DDCQlLP4SKhAD+6g4WBIh1tPpTw13TxEnIk3EutVO5r8onQ=
X-Received: by 2002:ac2:5142:: with SMTP id q2mr23146lfd.516.1611328544073;
 Fri, 22 Jan 2021 07:15:44 -0800 (PST)
MIME-Version: 1.0
References: <20210122113855.25770-1-andriy.shevchenko@linux.intel.com>
 <CAMeQTsa4byizTHkno_ndGpNskAgrEUU3f43p3qAfnGsXt2OoVQ@mail.gmail.com>
 <YArmxaIZl/NjKkpT@smile.fi.intel.com>
In-Reply-To: <YArmxaIZl/NjKkpT@smile.fi.intel.com>
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date: Fri, 22 Jan 2021 16:15:33 +0100
Message-ID: <CAMeQTsaVCnVNEx-hYnsYsKt+m34jHnRU+fvhQ2AHdTQ5t4cvng@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] drm/gma500: Convert to use new SCU IPC API
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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
Cc: David Airlie <airlied@linux.ie>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 22, 2021 at 3:51 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Fri, Jan 22, 2021 at 03:16:55PM +0100, Patrik Jakobsson wrote:
> > On Fri, Jan 22, 2021 at 12:39 PM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > >
> > > Convert the GMA500 driver to use the new SCU IPC API. This allows us
> > > to get rid of the duplicate PMC IPC implementation which is now covered
> > > in SCU IPC driver.
> > >
> > > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > > Acked-by: Linus Walleij <linus.walleij@linaro.org>
> >
> > Both patches look good. Do you want me to take them through drm-misc? Otherwise:
> > Acked-by: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
>
> I guess it's fine to go via drm-misc, but we might need an immutable branch/tag
> in the future (in case the rest cleanups that are dependent but have not sent
> yet will pending v5.12).

Right, so you need this included before you remove the duplicate PMC
IPC implementation? Then I think it's better you take the patches
through whatever tree the PMC IPC changes go. You have my ack.

-Patrik
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
