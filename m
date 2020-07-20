Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01214225BBD
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jul 2020 11:36:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B6F36E29E;
	Mon, 20 Jul 2020 09:36:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [IPv6:2607:f8b0:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 376046E29E
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jul 2020 09:36:01 +0000 (UTC)
Received: by mail-oi1-x230.google.com with SMTP id e4so13928505oib.1
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jul 2020 02:36:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ZNxm2z54xhtj6yCPRO7kYC1arlUA7YqvRKAbrJcyWVo=;
 b=KiGF/HsWcmzhjD7saOtN9N9aH75StsVlQ/1S2IA09fhK1R/SZTJmj7RM+DWKlLxYqv
 2/gLh+uyQEIB83t6faaB5dc4ARdpa0P0dUsrPviFw5+kNMvNiQEyT5S1ncWlKBiWHeBy
 ccvgEH+vUe2joF4Nr+HmHmLmuU4jhUIXFwtPlKc0r/Z5ItmKo/W91elVSOoG6CwhxTXV
 nTZuvb7J7zSIYDk7+VybcSsPbLwnkXMq80wExFt671KwzDj3TURBvPxkShK17Nzapygy
 VbArsmLzRZRGDVpszWZn5wqElPngJwW19YwjZ+HHIIAohpUScewhGJPhnG2mEAOsU7vZ
 XDGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ZNxm2z54xhtj6yCPRO7kYC1arlUA7YqvRKAbrJcyWVo=;
 b=W+BrDadg30xacxiR4ik+/BVA7fsod/XuT+T6ydIqZWE4lBQAEI4LmjXNlMJjg5LLFE
 DEo7q4HivLfe5x+dXJTB8yoCBhwwJhPuaU5kQanxQRi/p6b44f03isum4W3zmRK1O5Zd
 Odcte+ugG/O106G/BOKANDZEDkiV+KkbfI15w2GnZkp+KSOKNwy/yRq8HhmTy16my/wt
 e+6SX/utQ/NmHtQdX1c/OMzyJ0sgKiXUQkFgzyB8SLjXM+ropL9qXKKl0ip1HJ0t8Z/0
 VJxxXXqY48L4TB5VppyEP66uNzSNAmfNu4LmA/bED6wkue8mIasUtMd4e/jat5hegNnj
 1mIw==
X-Gm-Message-State: AOAM532QQz6EVn10NmuqauxJxhkiZWt5nVXspzRsrdJc60y2FzM2MxOK
 v/gq9vQYUS2KMo0Nti/oPS0oIL6AkbXli7LN4Dg=
X-Google-Smtp-Source: ABdhPJwYawHU9BgFp4Os8MlY50BY20HmfIBRmAYllJxQPF5ceGK/3AOWwRSuWsoqzXUefbv4w7dWQRqrnAh5aUgShSU=
X-Received: by 2002:a54:4e1d:: with SMTP id a29mr15004596oiy.139.1595237760397; 
 Mon, 20 Jul 2020 02:36:00 -0700 (PDT)
MIME-Version: 1.0
References: <36f3542011c34c4a9509f00c666a514a@kontron.com>
In-Reply-To: <36f3542011c34c4a9509f00c666a514a@kontron.com>
From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Date: Mon, 20 Jul 2020 10:35:24 +0100
Message-ID: <CADVatmOmhA5E6Qi23YtdZjtoS=dKKCk1bujw9dEY-sKrGAt30A@mail.gmail.com>
Subject: Re: SM750 : from which driver should I start to add a new transmitter
 ?
To: Gilles Buloz <Gilles.Buloz@kontron.com>
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
Cc: "greg@kroah.com" <greg@kroah.com>, LFBDEV <linux-fbdev@vger.kernel.org>,
 "teddy.wang@siliconmotion.com" <teddy.wang@siliconmotion.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

HI Gilles, (Added fbdev and dri list)

On Mon, Jul 20, 2020 at 10:18 AM Gilles Buloz <Gilles.Buloz@kontron.com> wrote:
>
> Dear developers,
>
>
> My company is manufacturing M2 graphics modules based on SM750. and I need to add support for an ANX9404 transmitter (for DP). I'm wondering which driver you would recommend to start my development :
>
> - your SM750 framebuffer driver is available in the kernel under drivers/staging/sm750fb/. It is clean and maintained.

Yes, and I know many companies who are using SM750 uses this driver,
but the fact remains that it can be removed from staging any time as
it can never migrate out of staging,

>
> - I'm currently using another driver from SiliconMotion I got through Innodisk (another modules manufacturer) supporting SM750/SM768 and labelled "SiliconMotion GPU DRM Driver". But the code is not very clean and produces lots of warning when building, and seems no more maintained. I even don't have the name nor the email of the developer. However it already works fine with our current HDMI transmitter.
>
>
> Having a look to the sm750fb kernel driver, the TODO file says : "must be ported to the atomic kms framework in the drm subsystem (which will give you a basic fbdev driver for free)".

Yes.

>
> It seems my current driver is already of this kind (DRM driver using modesetting Xorg module). I can send you the source code of this driver as it is open source If you want to see which driver I mean.

Is it the same as the one I have at gitlab
(https://gitlab.com/sudipm/sm750/tree/sm750) ? If it is same then it
will not be accepted in drm subsystem as it needs to be cleaned and I
will need to add "atomic" to it. Well, atomic was the main blocker.
But, if the driver that you have has been already converted to be an
atomic driver then please send it to me and I can clean it up and
submit.



--
Regards
Sudip
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
