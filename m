Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A587F3DCB6A
	for <lists+dri-devel@lfdr.de>; Sun,  1 Aug 2021 13:41:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92EDC6E073;
	Sun,  1 Aug 2021 11:41:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 706DE6E073
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Aug 2021 11:41:17 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id
 u9-20020a17090a1f09b029017554809f35so27455271pja.5
 for <dri-devel@lists.freedesktop.org>; Sun, 01 Aug 2021 04:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=V7CbcU24c2EcgEh6gPwl360Lbo6a4Vh6iTk5nFSY/dA=;
 b=qZkxBAhluE0p43cVISH+ol5q1lT+cnqxEql+NIpY08L6/PwowG/tSK7brsoB2dM+g4
 IsHCS42s3dWQ01GIdqQ2VK4IM4bOGJ/yx24/hAOvNqWJwbxbsCpKnF2rkFffMdNgwFrC
 6NjZdCRVEFlKZINxUnEFV2Xkrte76bs6chq7lWN6s9gbkliRtcbETJiv3JjWBY+ROuau
 7QBHcX8eOM8aLEoJRqNtPiQlkpD6wYCOuSCf3CNuwnvCF9AIupQzAS+CZdWu+b/WV2XR
 qiQPlqwMe4USOYxSrqo6WEDk1pAoQV5dne9UdThjajtzvP3R06+MzqdQCnGXvELPeNu9
 9QWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=V7CbcU24c2EcgEh6gPwl360Lbo6a4Vh6iTk5nFSY/dA=;
 b=LOEzQh8KcRvpe1Y4jPblDPk8ccv7QMuNKO7OQRB50mHkCGnNmTBjPwXKpD2yokfbjr
 zGBV25nfSDsBQcPl+tAeeiojI8FNn+ihaqd92WgTSdO9wmnqVCngBmUlp8Q380EwcDhb
 Mgpw0PJ6EquhdmZeNy93XmrEbccOzB7CMpFRS8HBO0zTfMcQJnE2kAKNxaa/M25FuNGA
 izu+LiPmCf6rKellwDGsNN+ggMHOyv8OBN6tJI1Hyn0aC/ku6e5l0DSMwUcXL/gsQB3P
 XUeT9deK0/GXn3KINwNVzbTXTUEdfTLKEcK/LGNmVOybLhfYc1D+0ScOYjIqBjlBBj5m
 CQUQ==
X-Gm-Message-State: AOAM530PM4Xku2S2cnI2vC+ZK1CR+ESt28tJgJjEWgpgx7QZIgwrC3rS
 VfBwXzb7KVHM7xkPMTVqKWz6zeO0ZY0sS3BMeEI=
X-Google-Smtp-Source: ABdhPJydhwxZ12g/won3lYfp7ROJMWycWxQ5X9RiPATUxhjXxXP+UgIyRIZYxpjob21kv49ZmMn2kBq09Ob2FCmxc98=
X-Received: by 2002:a63:1457:: with SMTP id 23mr1761825pgu.203.1627818076930; 
 Sun, 01 Aug 2021 04:41:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210801085155.3170-1-len.baker@gmx.com>
In-Reply-To: <20210801085155.3170-1-len.baker@gmx.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sun, 1 Aug 2021 14:40:40 +0300
Message-ID: <CAHp75VcD_Kqedpkw-Pj+uQbWqdu_9FhXqJS5TuGUPoVv2x45-Q@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] Remove all strcpy() uses
To: Len Baker <len.baker@gmx.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Phil Reid <preid@electromag.com.au>, 
 Geert Uytterhoeven <geert@linux-m68k.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 "open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>,
 linux-staging@lists.linux.dev, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Aug 1, 2021 at 11:53 AM Len Baker <len.baker@gmx.com> wrote:
>
> strcpy() performs no bounds checking on the destination buffer. This
> could result in linear overflows beyond the end of the buffer, leading
> to all kinds of misbehaviors. So, this serie removes all strcpy uses
> from the "staging/fbtft" subsystem.
>
> Also, refactor the code a bit to follow the kernel coding-style and
> avoid unnecessary variable initialization.

I don't see patch 3 (even on lore.kernel.org).

Greg, Geert, does it make sense to move this driver outside of staging?
I would volunteer to maintain it there.

> Changelog v1 -> v2
> - Add two new commits to clean the code.
> - Use the "%*ph" format specifier instead of strscpy() function (Geert
>   Uytterhoeven)
>
> Changelog v2 -> v3
> - Change the initialization of the "j" variable in the "for" loop and
>   update the code accordingly (Andy Shevchenko).
> - Improve the commit message to inform that the "%*ph" replacement
>   won't cut output earlier than requested (Andy Shevchenko).
> - Don't remove the braces in the "if" statement due to the presence of
>   the comment (Geert Uytterhoeven).
>
> Len Baker (3):
>   staging/fbtft: Remove all strcpy() uses
>   staging/fbtft: Remove unnecessary variable initialization
>   staging/fbtft: Fix braces coding style
>
>  drivers/staging/fbtft/fbtft-core.c | 23 ++++++++++-------------
>  1 file changed, 10 insertions(+), 13 deletions(-)
>
> --
> 2.25.1
>


-- 
With Best Regards,
Andy Shevchenko
