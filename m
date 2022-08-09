Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 69CEF58DBDB
	for <lists+dri-devel@lfdr.de>; Tue,  9 Aug 2022 18:24:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C223C4AB4;
	Tue,  9 Aug 2022 16:24:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com
 [IPv6:2607:f8b0:4864:20::f36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5469DC42E3
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Aug 2022 16:24:11 +0000 (UTC)
Received: by mail-qv1-xf36.google.com with SMTP id y11so8928075qvn.3
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Aug 2022 09:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc; bh=PnlJ5NiaSc+cIXTMjZyfUKXz4UA4ctUq3V6varML3sM=;
 b=pTfwQWHWEbyrv+ZvQ3fPLiztrEKbcEdpdCcsX+HvB93YuZqAHLppeMsdirCybW96Ze
 z76HcSqsSvh/1pOUzQF4qz5FAJmHY/m7rUFeCKPpPKcnwR3DOMucxbxCGSNjuRJVvfml
 xsfPKa/vQRn0ACHWsMeE/fklGssgbDy+jCvpfhhBMEo4Zjtrlo7jXYqPzskhHyOoRmQ2
 pYIIiACXwUpxdRY1Ot3MzrpoeshYKxd4aFSwGQ6h8owrBlMw+juDo45T9/5SsbwCQF+e
 92t6WfPW1X7kNKCLAzZnsFbCje4Zs6VL4klqjd1LUTvCLJ9SCMvqqNrCJiRXhYQbO+sx
 Q2mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc;
 bh=PnlJ5NiaSc+cIXTMjZyfUKXz4UA4ctUq3V6varML3sM=;
 b=TN+InnoWpVM/dnis9q12rbh0ire+hq0JNOCHpiBZjdtu4VOx5qx9gYsCjO9xvXlexe
 l0zpGTFVgRbFJwbBC1M9mk0UuGb0c2ED35ROAnmEyjynWIQYap/JgRCSZX+gi2tTj7dE
 NMzJll8h0FTWC2CpQNI6KgnmbiYzIzwMlXl/SyvmSzOdA7vPWvsiBucBs9y9PnXogT+M
 XvUVkX/rkQIYAYwZ1/gcgeD7HWPlCv5DxNPyLs405GGc2AWKf8v9RD8PDOI9IgUo4V4f
 jY15iqlQoHpUJG21W4hFExslZhhdyG/iWvz5PRb8IYs4UGYRfHaFe1Fug/ZVMPSPsKCF
 2Hpw==
X-Gm-Message-State: ACgBeo1XUTifRDt6G9AnkF9eat7lzh8YmfoFO+HIm97IcPtIzkzvPs/X
 SWVhbwmWctPxOGZJxzXyCe+o2QDCJM5bAFTfUSQ=
X-Google-Smtp-Source: AA6agR6yinHJs+aB8rxeh91Mw6RAl8VH/OIg1rtvyisjZw0c2IeCZ6k9DZ3ncNu9QnM+/DVlIet3CCP1JdS1uMchV/s=
X-Received: by 2002:a05:6214:5290:b0:479:5df:e654 with SMTP id
 kj16-20020a056214529000b0047905dfe654mr18497897qvb.97.1660062250141; Tue, 09
 Aug 2022 09:24:10 -0700 (PDT)
MIME-Version: 1.0
References: <CAPEqGQr5iPZizmcR8GndjO4VpJNxW461uoxTZvGwDVvEoepFMQ@mail.gmail.com>
In-Reply-To: <CAPEqGQr5iPZizmcR8GndjO4VpJNxW461uoxTZvGwDVvEoepFMQ@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 9 Aug 2022 18:23:32 +0200
Message-ID: <CAHp75VdjOfBD2tJfydX7GTuAZ9gyzSr5vBnGA8qy5LT8AJhypA@mail.gmail.com>
Subject: Re: tiny drm driver for NOKIA-5110 LCD
To: Aliliche Larbi <alilichelarbi@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
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

On Tue, Aug 9, 2022 at 6:14 PM Aliliche Larbi <alilichelarbi@gmail.com> wrote:
>
> Good morning sir,
>
> I am developing a linux driver for the nokia 5110 lcd(monochrome),
> I would like to know if I can use the drm API or tiny drm for this lcd.
> I'm writing to you because I saw your commit in /staging/fbtft/TODO
> where you talk about converting all fbtft drivers to drm_simple_display_pipe.
>
> Is this possible for simple monochrome lcds like the 5110 one?

You may convert _existing_ driver [1] to real DRM, like it's done for
SSD130x [2].

[1]: https://elixir.bootlin.com/linux/latest/source/drivers/staging/fbtft/fb_pcd8544.c
[2]: https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/solomon

-- 
With Best Regards,
Andy Shevchenko
