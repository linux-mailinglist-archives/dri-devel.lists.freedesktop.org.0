Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EE152B3AA3
	for <lists+dri-devel@lfdr.de>; Mon, 16 Nov 2020 00:51:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F4C989D57;
	Sun, 15 Nov 2020 23:51:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 281CB89D57
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Nov 2020 23:51:33 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id u19so16487339lfr.7
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Nov 2020 15:51:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=n/cV+cEJ8l00ZJJ9mEKZC5yxfJCUtxIEy2e62owSctQ=;
 b=eVqqu8D1GAatlTZ85VbB/IvzTEaQOAeE7uRt57J7LtrWM80LUAlxRKZ9Z6XVwMfSUy
 oH9M2HYXDJsuBTpJx95b2L5MQ7x3U2A+8B0pSCWi15ncA+C+MFE6vFZ8j9cnZ/36SRYH
 Q0XsmIMGe0zhfuvvPyncgl0drOlB815ogoNW0b5syY32NnjuqFODjl3A4WHQYSzWDdmO
 zmMY7h5Qzu7H42wbkw+kOga86kJ41+oDHx27a2JFRUYCPxn71TcabTD9pSgcyCRfKXeB
 aqp5d6UIrEdRu7GIIZVgSYmA2rsL08NUDrWdjlolWbcrqA3EHkkfStyaroW9pmedsTMV
 q8oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=n/cV+cEJ8l00ZJJ9mEKZC5yxfJCUtxIEy2e62owSctQ=;
 b=QuxSmL+pE2HRS5zOiJ02SPnuJQ0aMMrdrIqfugcz9FN/7mhq/5yccrfLQxsTmyKGhl
 oBRrMW1zjmSN93Z4R5NoVHf2rPHI3tOsRxJ4J8EYQ7aWcRUkrhbxqj1Upkjvdp8M3Uyi
 mSzm5Nm03/6Dk/JYnjvbuo4kchTbdzrw05FBk/BVTBT7gE2zn/fpYSqcyJFIFabV1k4u
 9uwCYoo4Gce2SmrYjYhdqViLN2GFOfTbs297EAABZEuNgosRGn6Xbkb+mk80//xiTek6
 CCDly8Yykz5ysrafhi876VI6w1hp7ewpdvRIK81WrniTSxkhwoop/0ZK0PJjkg/a0k5o
 rXIg==
X-Gm-Message-State: AOAM530P/VrPz96bAKXzoVas2ueaMaYECwKHVl1liBSSd1tcHJRJs2QW
 eXz9WcDqBQNMyLCrPu/cVskX0EfRaklz6v2imlyKSbheGZY=
X-Google-Smtp-Source: ABdhPJyuXsKiYPWRAyrfArMvqnQErib5H/695UiAF0Im1L4DVMvL2y7Wq8zaJTtPIHkuOotcZDxxiJop7Zkm3YeX5b8=
X-Received: by 2002:a19:ca05:: with SMTP id a5mr4156774lfg.571.1605484291595; 
 Sun, 15 Nov 2020 15:51:31 -0800 (PST)
MIME-Version: 1.0
References: <20201110234653.2248594-1-linus.walleij@linaro.org>
 <20201115225556.GA12643@ravnborg.org>
In-Reply-To: <20201115225556.GA12643@ravnborg.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 16 Nov 2020 00:51:20 +0100
Message-ID: <CACRpkdZxy7+Z_Wy06ZpzyGd48q76PyGhQUBS02vRYNQFQDCjww@mail.gmail.com>
Subject: Re: [PATCH 0/5] Samsung s6e63m0 improvements
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
Cc: Thierry Reding <thierry.reding@gmail.com>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Stephan Gerhold <stephan@gerhold.net>,
 =?UTF-8?Q?Pawe=C5=82_Chmiel?= <pawel.mikolaj.chmiel@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Nov 15, 2020 at 11:55 PM Sam Ravnborg <sam@ravnborg.org> wrote:

> I have looked through the series - and all looks good.
> Acked-by: Sam Ravnborg <sam@ravnborg.org>
>
> Please commit patches yourself.

Thanks a lot Sam, I pushed the patches.

Yours,
Linus Walleij
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
