Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4594011EE89
	for <lists+dri-devel@lfdr.de>; Sat, 14 Dec 2019 00:31:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33EE26E043;
	Fri, 13 Dec 2019 23:31:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B3A56E043
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2019 23:31:16 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id r14so480280lfm.5
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2019 15:31:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UYB1xRgKosy6jfSGB7BE9SX+cfHWNMutSJcZ7f7EJmk=;
 b=OhSaij6MbhBbT8BBEWl6AiLb17aiPM6aeW2vJrFDCJMU5/+R1bdFWrZ8rs2ky9KnTD
 LJxnJmMNZasFyc/BVCC16vVo9cjushwmw2n0o65zr2Xdju3HZTBVrh1z69gI4178ynnG
 xfOAogfqWlQ5hi88OwmCe7Xt3TQgZkuMKOgmezdRxcv7jIf4GZX9yCs3N2OeQUDrB1xf
 GEuDOfQylB1JoSMxRIHYIc/QtvVpbDpjJFqEj8UCm5og8xBjeG7IE8q4bZRiuNXh96/6
 1atEeaXFG6WRTrxzvCzBE7CbxChsJuR5RJF8X3MAXxFvWiKtHtAg2SmH1uCJhU/3q2oA
 p1xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UYB1xRgKosy6jfSGB7BE9SX+cfHWNMutSJcZ7f7EJmk=;
 b=YaBLpMM/L0O6LYdl50SiXYYY6Qy6aG9PepzBgbiV+YF9AJB4plOTUOLuGzNlEOn/aH
 IE/p8h5Rw+oKaHFN06fcPy0hYXDidtAUZL4qzXEE4HVmw04dIWBxS801mZvFAWef5KO0
 L0YGgZremY5XNlUuKvKhD601w6iuEEJbwFsevTI9i1SMHUTW/2Hkp1n4qPT79xLugwMr
 O2/gKABU6/Cl0wtgxbWQT4k6QpkXDp4nA9T1lGfIo1XuEtRtDcrN4rZIpVlXtobrVNU+
 Z4/f3Fyx61D32DJPiEXg0SHopU80mCd8A8ZATPsMc4mJWi0ebxjRQdveOgicsywETp+o
 WxRw==
X-Gm-Message-State: APjAAAUdm3PE6+GuxfWqvsZa/yGDtleghEOi2EG3b8qgqm70icmbSA4s
 DwB0koLjnbgJsXtAYtwK7ccvNRtKovYufF1rhcYT2A==
X-Google-Smtp-Source: APXvYqzqccxo0XRZZSDEaS63orz0snyBz0NtEY/CocbBhD+cdUyq3IegjWldrMgLnoaVvROFwgZD1ngkhWvShUDYbVU=
X-Received: by 2002:ac2:4945:: with SMTP id o5mr10104458lfi.93.1576279874570; 
 Fri, 13 Dec 2019 15:31:14 -0800 (PST)
MIME-Version: 1.0
References: <20191203123143.118487-1-linus.walleij@linaro.org>
 <87sgluy43j.fsf@belgarion.home>
 <CACRpkdZS0umWreCuXXkdmwLoSVyAtwMrN21EMyqnn4LR8zkFkw@mail.gmail.com>
 <87mubwxhnc.fsf@belgarion.home>
In-Reply-To: <87mubwxhnc.fsf@belgarion.home>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 14 Dec 2019 00:31:03 +0100
Message-ID: <CACRpkdYJT+givuOP8SA9nuyDWr7yRW+X13okTVjVNP81Kdb__g@mail.gmail.com>
Subject: Re: [PATCH] backlight: corgi: Convert to use GPIO descriptors
To: Robert Jarzmik <robert.jarzmik@free.fr>
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
Cc: Andrea Adami <andrea.adami@gmail.com>, Jingoo Han <jingoohan1@gmail.com>,
 Daniel Thompson <daniel.thompson@linaro.org>, Lee Jones <lee.jones@linaro.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 13, 2019 at 6:24 PM Robert Jarzmik <robert.jarzmik@free.fr> wrote:
> Linus Walleij <linus.walleij@linaro.org> writes:
> > On Sun, Dec 8, 2019 at 9:06 PM Robert Jarzmik <robert.jarzmik@free.fr> wrote:
> >> Linus Walleij <linus.walleij@linaro.org> writes:

> > So it will theoretically "spi0.1"
> >
> > Beware about bugs in the above interpreter because it is
> > just my brain.
>
> Well, if nobody complains because of testing, why not, your explanation seems as
> good as it could be.

:D

> If you would be so kind as to carry these changes through your tree instead of
> the PXA one, please have my :
> Acked-by: Robert Jarzmik <robert.jarzmik@free.fr>

I was hoping the backlight people would pick it up to the backlight tree.

Yours,
Linus Walleij
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
