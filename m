Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12B1544C5FF
	for <lists+dri-devel@lfdr.de>; Wed, 10 Nov 2021 18:32:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65D556EA4C;
	Wed, 10 Nov 2021 17:32:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com
 [IPv6:2607:f8b0:4864:20::b31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3ACB6EA4C
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Nov 2021 17:32:53 +0000 (UTC)
Received: by mail-yb1-xb31.google.com with SMTP id y68so3088522ybe.1
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Nov 2021 09:32:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2Ki3P9X5iAUdYZKy//3Ks2lLDQcL+FOfzU1hc4CtIPQ=;
 b=p6kP+jQuzJEniUc/rvb8Zjvwzk8ENdCndpvr4O0SK7KvT4MOSwLm1rMIRj3xUNlMgC
 UfEfM8XtAZ7aRmNnJedpOjlf0o0YgLjCQfNgNC1kgQfpdBcE9GnC8YrplxCDwpBriea6
 CfWEPg3xsB+7ZSoFaamwWeWQu6ZaOEknBY+wEi4qkZyJIq72Ke/+VkSRjZYAIVz5VkbC
 6+2cYGQ/YwIADG8TLmswYkjLdkOJlTHbAitiOdzey+EykaQjmbgIbkY2A0ophR9pEK/C
 ov08lX2LW2F6L1ZjWUMoeXaUtqE6UW4G0HZSVOhcSL2CKj+HCfRGJxXW6wxGmVjOZMo3
 Bovw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2Ki3P9X5iAUdYZKy//3Ks2lLDQcL+FOfzU1hc4CtIPQ=;
 b=wbr8HQqfH/+5wBHYLs8CrsFkehP+GX7ZoMsj3bN34PfHpnljSJ2T3FGMSYzXc2Gy3Q
 pkANMrVZVep7tJYzshKCO86eJwikHmkxJ6We+mjhF6g1RZCsqwuO4HkNTVUCOb0IrPg/
 QTWMUxI23nzYmWwY3NIm6JBSF6yPBeYqstDHd28R01hGrVDWfF9JyZflAWsH242VvDAE
 1rmxK0DknG7kgD21rM9DPWpLPJ7KSokbmyBrpXPzW6qzyRvhRAxjN7zdmfNB5ZodhsCZ
 m/AaJ9skJgY+q2+jBviHk9jwCuptKS2YKaZq3G+zqVba7/rQtZrbPYlrOwtZcIi8OUH9
 HOdg==
X-Gm-Message-State: AOAM532k7XeoH8vDNZ2IHiLmVv1FlpW5A0mmHzt7kr1q9L5G9dq6HdIU
 G45VD55lmbbT7EIlMX9+xhwNVKJ1+XzdK5IRGoQ=
X-Google-Smtp-Source: ABdhPJzMyYTcUsbIv2/QVdrC8iidtoFqD9R+aZdZhI8ER4M8Gf+tMHcLWc0CvTlr+OyMXEgTCM9BSk4uFGi3uSB5fY4=
X-Received: by 2002:a25:bc44:: with SMTP id d4mr937697ybk.263.1636565573162;
 Wed, 10 Nov 2021 09:32:53 -0800 (PST)
MIME-Version: 1.0
References: <20211026113409.7242-1-igormtorrente@gmail.com>
 <20211109113253.480ee93b@eldfell>
In-Reply-To: <20211109113253.480ee93b@eldfell>
From: Igor Torrente <igormtorrente@gmail.com>
Date: Wed, 10 Nov 2021 14:32:26 -0300
Message-ID: <CAOA8r4G50U0fxSfU0HZtZoZCK6fngPmxL3cM4LVpLQn=HfZG_Q@mail.gmail.com>
Subject: Re: [PATCH v2 0/8] Add new formats support to vkms
To: Pekka Paalanen <ppaalanen@gmail.com>
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
Cc: hamohammed.sa@gmail.com, Thomas Zimmermann <tzimmermann@suse.de>,
 rodrigosiqueiramelo@gmail.com, airlied@linux.ie,
 Leandro Ribeiro <leandro.ribeiro@collabora.com>, melissa.srw@gmail.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Pekka,

On Tue, Nov 9, 2021 at 6:32 AM Pekka Paalanen <ppaalanen@gmail.com> wrote:
>
> On Tue, 26 Oct 2021 08:34:00 -0300
> Igor Torrente <igormtorrente@gmail.com> wrote:
>
> > Summary
> > =======
> > This series of patches refactor some vkms components in order to introduce
> > new formats to the planes and writeback connector.
> >
> > Now in the blend function, the plane's pixels are converted to ARGB16161616
> > and then blended together.
> >
> > The CRC is calculated based on the ARGB1616161616 buffer. And if required,
> > this buffer is copied/converted to the writeback buffer format.
> >
> > And to handle the pixel conversion, new functions were added to convert
> > from a specific format to ARGB16161616 (the reciprocal is also true).
> >
> > Tests
> > =====
> > This patch series was tested using the following igt tests:
> > -t ".*kms_plane.*"
> > -t ".*kms_writeback.*"
> > -t ".*kms_cursor_crc*"
> > -t ".*kms_flip.*"
> >
> > New tests passing
> > -------------------
> > - pipe-A-cursor-size-change
> > - pipe-A-cursor-alpha-transparent
> >
> > Performance
> > -----------
> > Following some optimization proposed by Pekka Paalanen, now the code
> > runs way faster than V1 and slightly faster than the current implementation.
> >
> > |                          Frametime                          |
> > |:---------------:|:---------:|:--------------:|:------------:|
> > |  implmentation  |  Current  |  Per-pixel(V1) | Per-line(V2) |
> > | frametime range |  8~22 ms  |    32~56 ms    |    6~19 ms   |
> > |     Average     |  10.0 ms  |     35.8 ms    |    8.6 ms    |
>
> Wow, that's much better than I expected.
>
> What is your benchmark? That is, what program do you use and what
> operations does it trigger to produce these measurements? What are the
> sizes of all the planes/buffers involved? What kind of CPU was this ran
> on?

1 and 2) I just measured the frametime of the IGT test ".*kms_cursor_crc*"
using jiffies. I Collected all the frametimes, put all of them into a
spreadsheet, calculated some values and drew some histograms.

I mean, it is not the best benchmark, but at least give an idea of what
is happening.

3) The primary plane was 1024x768, but the cursor plane
varies between the tests. All XRGB_8888, if I'm not mistaken.

4) I tested it on a Qemu VM running on the Intel core i5 4440. ~3.3GHz

>
>
> Thanks,
> pq
>
> >
> > Writeback test
> > --------------
> > During the development of this patch series, I discovered that the
> > writeback-check-output test wasn't filling the plane correctly.
> >
> > So, currently, this patch series is failing in this test. But I sent a
> > patch to igt to fix it[1].
> >
> > XRGB to ARGB behavior
> > =====================
> > During the development, I decided to always fill the alpha channel of
> > the output pixel whenever the conversion from a format without an alpha
> > channel to ARGB16161616 is necessary. Therefore, I ignore the value
> > received from the XRGB and overwrite the value with 0xFFFF.
> >
> > ---
> > Igor Torrente (8):
> >   drm: vkms: Replace the deprecated drm_mode_config_init
> >   drm: vkms: Alloc the compose frame using vzalloc
> >   drm: vkms: Replace hardcoded value of `vkms_composer.map` to
> >     DRM_FORMAT_MAX_PLANES
> >   drm: vkms: Add fb information to `vkms_writeback_job`
> >   drm: drm_atomic_helper: Add a new helper to deal with the writeback
> >     connector validation
> >   drm: vkms: Refactor the plane composer to accept new formats
> >   drm: vkms: Exposes ARGB_1616161616 and adds XRGB_16161616 formats
> >   drm: vkms: Add support to the RGB565 format
> >
> >  drivers/gpu/drm/drm_atomic_helper.c   |  47 ++++
> >  drivers/gpu/drm/vkms/vkms_composer.c  | 329 +++++++++++++++-----------
> >  drivers/gpu/drm/vkms/vkms_drv.c       |   6 +-
> >  drivers/gpu/drm/vkms/vkms_drv.h       |  14 +-
> >  drivers/gpu/drm/vkms/vkms_formats.h   | 252 ++++++++++++++++++++
> >  drivers/gpu/drm/vkms/vkms_plane.c     |  17 +-
> >  drivers/gpu/drm/vkms/vkms_writeback.c |  33 ++-
> >  include/drm/drm_atomic_helper.h       |   3 +
> >  8 files changed, 545 insertions(+), 156 deletions(-)
> >  create mode 100644 drivers/gpu/drm/vkms/vkms_formats.h
> >
>
