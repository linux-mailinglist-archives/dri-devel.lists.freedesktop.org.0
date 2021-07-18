Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5021E3CCA7F
	for <lists+dri-devel@lfdr.de>; Sun, 18 Jul 2021 21:43:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C3CD89D99;
	Sun, 18 Jul 2021 19:43:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E882A89D99
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Jul 2021 19:43:18 +0000 (UTC)
Received: by mail-pl1-x62b.google.com with SMTP id e14so5635225plh.8
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Jul 2021 12:43:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7exFBskhTjXcI0G1jQYaweC6zi6nB0YxhW9GhW8QVJk=;
 b=hTAqgsHvvgfNcEagZtVOoEg9FPZ1K7swFoeQE74LVxhVPjWe4cMJ36z1icfI5N90l0
 Q5NEeHaePN4cZlD/CHtW4Q3HajTJXac5NUjQ3Tfn2qYdk7cJOxD93QiuahCUEOdvoYan
 yWAQXjAMKElZboyb3fVwi3x1JZL/sJ6Kaf4cbOmJ4HWzjIM7H5CRcv+C/ovoiTK5KLZO
 MewH468+Xkk/Jq2ehDT+j7bKEfHjqYerJXYXfL+fUWicAa9dKBPN3mXL6A41iuyJcvu0
 q699wJgigkj4sMp84K14HXfLRz4drOEqjzlqLQhWSBDA6e5vjBNH9oe/EgXH+w0RCd+7
 LXXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7exFBskhTjXcI0G1jQYaweC6zi6nB0YxhW9GhW8QVJk=;
 b=EZGCxtB4e9248CZtOyilBUw4VMhOU1aejWx84+M24Y1FqBFbC0wTdSd73kqrLYaHnF
 F+i4cd9rlr35D8l6vNQpiHbSB4aCdDPVpXXQWgtftDLK2Pc25v7QfiKlIzL6FwmSu2PB
 HaR7knFkF9D9lrbkE6azaN8yZBS9O+Hv2j14B8JlWOmGNh8uuuzQrUPJIVmLKsiwUS+e
 BRfs5/ZdDIrcqdlxZ0CEPZriXiGalrZwAS6J9LVWYnEHsAilBXVv3iveefJ2FTEOZ0N1
 lLvruDaDzDKf6zw3Hg61QQiu/CJFX+FM9SyJJuCKO3fdBL/aZjgGUA58kajOHAVWm/qa
 MjWA==
X-Gm-Message-State: AOAM532me6t9Rqg0KRM3gqpeXClSAVbI2UI599R5OPQjK8VNT8tM/xna
 rjvLO3CrhG0sDqoDdF/QrPBTsnatjLxiCkRvXlQ=
X-Google-Smtp-Source: ABdhPJxzjFnbQny4tL/Gtmd96c7VmxuNdY93ug+tJ2p9Dj5gOXvWXiaA+eeh1wWvAvNR+4wesFTmw2sp9FFlCmRM9oI=
X-Received: by 2002:a17:902:b198:b029:11b:2246:e374 with SMTP id
 s24-20020a170902b198b029011b2246e374mr16552094plr.17.1626637398478; Sun, 18
 Jul 2021 12:43:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210718133920.15825-1-len.baker@gmx.com>
In-Reply-To: <20210718133920.15825-1-len.baker@gmx.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sun, 18 Jul 2021 22:42:42 +0300
Message-ID: <CAHp75VeEA0=KFsfdjCnBm-b9+F+NnFWJ38nkh+qtb85XdXVWog@mail.gmail.com>
Subject: Re: [PATCH] staging/fbtft: Remove all strcpy() uses
To: Len Baker <len.baker@gmx.com>
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
Cc: "open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>,
 Phil Reid <preid@electromag.com.au>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Jul 18, 2021 at 4:43 PM Len Baker <len.baker@gmx.com> wrote:
>
> strcpy() performs no bounds checking on the destination buffer. This
> could result in linear overflows beyond the end of the buffer, leading
> to all kinds of misbehaviors. The safe replacement is strscpy() but in
> this case it is simpler to add NULL to the first position since we want
> to empty the string.

> This is a previous step in the path to remove the strcpy() function.

Any document behind this (something to read on the site(s) more or
less affiliated with what is going to happen in the kernel) to read
background?

...

>                 case -1:
>                         i++;
>                         /* make debug message */
> -                       strcpy(msg, "");
> +                       msg[0] = 0;

Strictly speaking it should be '\0'.

>                         j = i + 1;
>                         while (par->init_sequence[j] >= 0) {
>                                 sprintf(str, "0x%02X ", par->init_sequence[j]);


-- 
With Best Regards,
Andy Shevchenko
