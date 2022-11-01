Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D20846147D4
	for <lists+dri-devel@lfdr.de>; Tue,  1 Nov 2022 11:41:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43E5D10E37A;
	Tue,  1 Nov 2022 10:41:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35FC710E37A
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Nov 2022 10:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667299286;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5u9PasPjTt25CsZMfj48skRk6lEO/1rAkid6YQ6vA1c=;
 b=BPogAM6xcbQVZ0BMTp5+G2/VYDbTZ3yTKIvyMkAkBKJf+ZvLc9bfILGKyVVhFcviO420mj
 8XYouv+RDA6O9iAzzCgxNXHU+Hsz+T8XvkgfDAXn/KfW36Z+V4ZY24Re3ZOnFCNIUo5ugi
 jlPBUAMzpkz3RCE7v41CywD9fa3yriw=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-360-0us9x5p5NI-8aaqvfs8RzQ-1; Tue, 01 Nov 2022 06:41:25 -0400
X-MC-Unique: 0us9x5p5NI-8aaqvfs8RzQ-1
Received: by mail-qv1-f70.google.com with SMTP id
 ng1-20020a0562143bc100b004bb706b3a27so7494729qvb.20
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Nov 2022 03:41:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5u9PasPjTt25CsZMfj48skRk6lEO/1rAkid6YQ6vA1c=;
 b=SefUvXTlpgIXJmXxSh9q6VplpbpesSUTZhUV02mP9pBSUNst/2UQ3iKTyq4kqLkF9E
 6SDba6GlSgENgsYvv9/Tlqc8PSMM7AyFMGz21BVkmVJcoZWhmDgDEZacm+2/DBFhbYA1
 abQ5UKrRK0p2ZKe5oJ+Idw8LDR2A5f7pTbI226/9mKns7hGCWcOGNs533DL0gLxQnkV8
 dcIvR53UbB+YMyyPwek0MtqX/VPBwZhG6xixrRDT07mmfQql9CNOaoRh3buWfH1To+hY
 E+uG/2XRPfFNRcrweiCI1SkKtEm43lDLTtssNgI3P4AR2/eoZcFkrI0twVfatwhiogE5
 HWCw==
X-Gm-Message-State: ACrzQf2PHjEk0P5gtdVr5aabZ/g7IgOKxtp1ewmL8gTiSiyvD3G3Os1l
 DUKg244OJtFfI5ewecrR4y745XgfHoCs1OYBCV1HQ5eJQmW9rceuvwKhLcVe9IpmZVJ0IIfwtWq
 xqbABUbYVjd+Mcj5XdPNzLL+FhR5fPoPs6YkC/l2ZU8pF
X-Received: by 2002:a05:622a:178c:b0:39a:90ba:fc53 with SMTP id
 s12-20020a05622a178c00b0039a90bafc53mr14552084qtk.673.1667299285077; 
 Tue, 01 Nov 2022 03:41:25 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM62iAR+fRGZ/RVubHnk2QR9SONHRM8kee9zOi71zcmsh5EAkF8xAyzqTgseid1agxZWpooGIOHc8TBu0ODXOEE=
X-Received: by 2002:a05:622a:178c:b0:39a:90ba:fc53 with SMTP id
 s12-20020a05622a178c00b0039a90bafc53mr14552068qtk.673.1667299284830; Tue, 01
 Nov 2022 03:41:24 -0700 (PDT)
MIME-Version: 1.0
References: <20221029184851.25340-1-antoniospg100@gmail.com>
 <20221031163211.13228-1-antoniospg100@gmail.com>
 <5a61ae6a-8a16-8abb-e718-895c41e2e7a8@gmail.com>
In-Reply-To: <5a61ae6a-8a16-8abb-e718-895c41e2e7a8@gmail.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Tue, 1 Nov 2022 11:41:13 +0100
Message-ID: <CACO55tuXRU1X7tU3AvOLW3WZnGWYWBa7MTszqFPrwjeNS-TYfA@mail.gmail.com>
Subject: Re: [PATCH] drm/nouveau: Add support to control backlight using
 bl_power for nva3.
To: Bagas Sanjaya <bagasdotme@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>, antoniospg <antoniospg100@gmail.com>,
 sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 1, 2022 at 3:12 AM Bagas Sanjaya <bagasdotme@gmail.com> wrote:
>
> On 10/31/22 23:32, antoniospg wrote:
> > Summary:
> >
> > * Add support to turn on/off backlight when changing values in bl_power
> >   file. This is achieved by using function backlight_get_brightness()
> >   in nva3_set_intensity to get current brightness.
> >
>
> This is [PATCH v2], right? If so, next time please pass -v <version
> number> to git-format-patch(1).
>
> Also, just say the prose without using bullet list. "Summary:" line
> is also redundant. And again, please describe why this change be made.
>

it's right there in the title....

> > Test plan:
> >
> > * Turn off:
> > echo 1 > /sys/class/backlight/nv_backlight/bl_power
> >
> > * Turn on:
> > echo 0 > /sys/class/backlight/nv_backlight/bl_power
> >
>
> Shouldn't "test plan" above be documented in Documentation/ instead?
>

Given that's already existing infrastructure and is actually
documented already (the existence of `bl_power` I mean), why would
that be needed? I don't think it's needed to point that out in the
commit log, but if the contributor chooses to document how the patch
was tested, then why not?

> Last but not least, is "antoniospg" your real, legal name?
>

Please leave those discussions to subsystem maintainers.

Saying that, if the contributors prefers to go by this name, this is
good enough for me, but having a more explicit or detailed name (like
fore- and surname) is generally prefered.

> Thanks.
>
> --
> An old man doll... just what I always wanted! - Clara
>

