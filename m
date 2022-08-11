Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9023B58FEA1
	for <lists+dri-devel@lfdr.de>; Thu, 11 Aug 2022 16:54:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2377BB3389;
	Thu, 11 Aug 2022 14:54:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com
 [209.85.222.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0425EB3360
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Aug 2022 14:54:29 +0000 (UTC)
Received: by mail-qk1-f176.google.com with SMTP id b2so912145qkh.12
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Aug 2022 07:54:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=9BmF3Ji5gJTAQfOQyztWwt7GQUoCWmH9+aqwzCjq0dQ=;
 b=e6oaH9PI7VZVoEX1SPMidpkRyZk/5SITeeg379c2b78G2E0Yfc+MVAlYeyupufeVs0
 K3kSbYWRoRlFbOEBdtx6d6brmMqg8FCKLt58PqYYlBPFh0yxc0moXeHZgxPBz9nwckYt
 BYH7M4ZPm7LQOwe27JH1kJWqOCAkQAK92w15rMj2XJKhLwbflcX55vOni2bw6rJxIdHp
 A+EaPqy9eYbaMiqZyfY6Og0UK7DuCq/hkziURrYLQjswN1dpqMQj/Xk8zt88wnc2crIM
 /LN5F41QapTV7BKLK/0ZhJcCBzcv34MUIb8mXbBTKD8GacNv+1n777FemXjdSmxUJWaJ
 BYDA==
X-Gm-Message-State: ACgBeo0+qbeZoNENlGJuPQd3fOPWKsRsXsvB5cOx12SLiIJaV/lB+Sq9
 2AkNyqlTe3EOzVOojm8ZjjLgNLI+PM4+qxqo
X-Google-Smtp-Source: AA6agR44jzBUrQwocFZZhitJKpkgMGMKkoosk2Pvb7lW71IfQx/QDcLWRQatx2ub4Ekzhe86IYVqaw==
X-Received: by 2002:a05:620a:c55:b0:6a7:9e01:95c9 with SMTP id
 u21-20020a05620a0c5500b006a79e0195c9mr24642385qki.63.1660229668537; 
 Thu, 11 Aug 2022 07:54:28 -0700 (PDT)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com.
 [209.85.128.169]) by smtp.gmail.com with ESMTPSA id
 h3-20020a05620a400300b006b93fcc9604sm2196611qko.108.2022.08.11.07.54.27
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Aug 2022 07:54:28 -0700 (PDT)
Received: by mail-yw1-f169.google.com with SMTP id
 00721157ae682-31f41584236so175368357b3.5
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Aug 2022 07:54:27 -0700 (PDT)
X-Received: by 2002:a81:b049:0:b0:324:7408:94b with SMTP id
 x9-20020a81b049000000b003247408094bmr32604328ywk.283.1660229667766; Thu, 11
 Aug 2022 07:54:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220811144850.215377-1-strochuk@ispras.ru>
In-Reply-To: <20220811144850.215377-1-strochuk@ispras.ru>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 11 Aug 2022 16:54:16 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXSnHJpy=27pkAfQC0v+tkpx7Q4Ze1=nvTmy+aMBeVPFg@mail.gmail.com>
Message-ID: <CAMuHMdXSnHJpy=27pkAfQC0v+tkpx7Q4Ze1=nvTmy+aMBeVPFg@mail.gmail.com>
Subject: Re: [PATCH v2] drm/fb-helper: add virtual screen size check to
 drm_fb_helper_check_var()
To: Andrey Strachuk <strochuk@ispras.ru>
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
Cc: ldv-project@linuxtesting.org, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, Helge Deller <deller@gmx.de>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Andrey,

On Thu, Aug 11, 2022 at 4:49 PM Andrey Strachuk <strochuk@ispras.ru> wrote:
> Add virtual screen size check to drm_fb_helper_check_var() in
> order to validate userspace input.
>
> Found by Linux Verification Center (linuxtesting.org) with syzkaller.
>
> Signed-off-by: Andrey Strachuk <strochuk@ispras.ru>

Thanks for the update!

> Fixes: 785b93ef8c30 ("drm/kms: move driver specific fb common code to helper functions (v2)")

I'd drop the Fixes tag completely, as the bug was present in the
intel and radeon drivers before. But probably it doesn't matter, as no one
is gonna backport this to v2.6.31 and earlier ;-)

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
