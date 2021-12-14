Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ED39A473E44
	for <lists+dri-devel@lfdr.de>; Tue, 14 Dec 2021 09:31:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 051DD10EA1B;
	Tue, 14 Dec 2021 08:30:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf2d.google.com (mail-qv1-xf2d.google.com
 [IPv6:2607:f8b0:4864:20::f2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A8D010EA1B
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Dec 2021 08:30:53 +0000 (UTC)
Received: by mail-qv1-xf2d.google.com with SMTP id u16so16709293qvk.4
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Dec 2021 00:30:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dowhile0-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uajsDEex7bsoTTLmmIuCG5itA5xIQYPMZdhRY5ATmI8=;
 b=mf2RHFNUq8ZUdrJ8Aul4LWaMuwvk/wMCayWDi6NRibzflMBB26TwsKDFeFrXzwaQbm
 3RlncRrQIk5ieKZq7okNZYnjmUoR6Sh5VtE5wn2ISElO1YPi+xNMaLqSd0g5ZITse6++
 oKkHpRkd47CnfQ27ld+1hcZnnIbM5agWdg48TZdaelKaaPFpctSRvaNzOgwuFBv2SzjW
 NQvh3fj1HIKiqdSO1iAdFocAiiETkAddgBVJS5BBJ47ICzq7l//V3NdGbdA7ePl3Iupj
 XkPciGV/NnJ5PgEWEFe2iNa+fq/eUtLzco2+CWiKtngMATkzaho0vbhTsVzGCjZh40kX
 8nPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uajsDEex7bsoTTLmmIuCG5itA5xIQYPMZdhRY5ATmI8=;
 b=NCH9OoejqaD/Oimi7l+3ydt97/E/lTCpQdqMcoWfVE5tD34uxMAf9GHfXgxejyo+2k
 ZYwOoEPI9z7z/hGRe7SxHmklPjH+/V9yGUmzxlqW83kLBzoCf9ZLcIZT62644Ka/a4A2
 IbGdJcRcIT80KOqbbSZ6wvqQNB2+9SeHeWk8AQsjDAd5RorhSbg3rIZt/3H8qyhMYY1y
 2Eb+qHtPyYWxCi1D4YuR6liKHRmjf9GV64XerHrJ/zu2SPD9/2Md9tMbFNK6DlQXLEj+
 Jv51+XT1pmF8rWmblJCA6h+5BawiC92J+pAssFMlXp65vhNIJ7KxrAewRvNVusfPkSrc
 YQGg==
X-Gm-Message-State: AOAM533Jm+3lFbhZSGKz76JjwrmekVeGTU7HY8S/1o9kP2iMjnLar3kN
 eLfRgyKJ8N/JXE+P5owxD3tXWA0Bd2/1TJaANU//tw==
X-Google-Smtp-Source: ABdhPJyv2ONMfdlytM9T3YUARkn73BeNNrUW2+f1SBfCkvo+sGCIXZFxwt0r7Bzz1StRpDHHIRWHv0A9Y5seMQu1H3s=
X-Received: by 2002:a05:6214:410e:: with SMTP id
 kc14mr3893644qvb.73.1639470652830; 
 Tue, 14 Dec 2021 00:30:52 -0800 (PST)
MIME-Version: 1.0
References: <20211213162635.252582-1-maxime@cerno.tech>
 <20211213162635.252582-3-maxime@cerno.tech>
In-Reply-To: <20211213162635.252582-3-maxime@cerno.tech>
From: Javier Martinez Canillas <javier@dowhile0.org>
Date: Tue, 14 Dec 2021 09:30:42 +0100
Message-ID: <CABxcv=ka4uc0Mt7Yv2RKnSYG74WRP--U1n4PhOjCentGEGkaMg@mail.gmail.com>
Subject: Re: [PATCH RESEND v4 v4 2/4] drm/vc4: Support nomodeset
To: Maxime Ripard <maxime@cerno.tech>
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
Cc: devicetree@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>,
 Dom Cobley <dom@raspberrypi.com>, Scott Branden <sbranden@broadcom.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@linux.ie>, Ray Jui <rjui@broadcom.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Rob Herring <robh+dt@kernel.org>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>,
 bcm-kernel-feedback-list@broadcom.com, Tim Gover <tim.gover@raspberrypi.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Frank Rowand <frowand.list@gmail.com>,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Maxime

On Mon, Dec 13, 2021 at 5:26 PM Maxime Ripard <maxime@cerno.tech> wrote:
>
> If we have nomodeset on the kernel command line we should have the
> firmware framebuffer driver kept as is and not try to load the
> full-blown KMS driver.
>

Patch looks good to me. I just have a question, but I'm OK with either way.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

> In this case, let's just register the v3d driver.
>

I wonder if the v3d driver should be registered if nomodeset is
present. Most (if not all?) drivers that currently check for this
parameter disable both KMS and DRM. So even when it seems to imply
that's about kernel mode settings, it is also used to disable DRM.

This semantic was never documented and I attempted to do that in
commit b22a15a5aca3 ("Documentation/admin-guide: Document nomodeset
kernel parameter"). After feedback from folks in the list, the text
ended as follows:

```
Disable kernel modesetting. DRM drivers will not perform
display-mode changes or accelerated rendering. Only the
system framebuffer will be available for use if this was
set-up by the firmware or boot loader.

Useful as fallback, or for testing and debugging.
```

So maybe vc4_drm_register() should just return -EINVAL if
(drm_firmware_drivers_only()) like the other drivers do?

Best regards,
Javier
