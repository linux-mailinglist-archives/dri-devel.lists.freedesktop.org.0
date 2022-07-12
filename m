Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 937E4571FE4
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jul 2022 17:48:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E4BB11243E;
	Tue, 12 Jul 2022 15:48:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D02B4947BC
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jul 2022 15:48:20 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 h14-20020a1ccc0e000000b0039eff745c53so5059918wmb.5
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jul 2022 08:48:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=2nlWovdml3x38ikBsijP4iu2GVcLVtEJCFEUL/KVw7o=;
 b=l7epumwrTzHY/T/kgehRLD4WmQF+WOR5a1v/PiZIlCt0xOL8TbVuf2dOsADboZauYg
 yoHGQR9uyhRHNy5Z+nD+Yr/Q4cjuuoa9717gHmCsEmXCZ/rp5QqzsjCTFNVry0nBuUQs
 oNuoDRJgCp4nizfkUcp4m7npXsvxkMY4EcPEbXdtKtMaGrRwD85mdhlPbmIF6zfSi++s
 MNocdcQZIE4dJTnTes/KPHJRgRQ+FMrgxNsAtRDCoZVdJvj0T1yzqWZ/cFRMRp4d3UfS
 mwVBT0upNQxQC+KQnXKvDcnVv44yLYa7rwH++mX8p7TUCXdA7Gowr+9glk8fn+Chx/hG
 Nn9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=2nlWovdml3x38ikBsijP4iu2GVcLVtEJCFEUL/KVw7o=;
 b=ktl3gnx9K4ST4LnCcGWgC7cI3bUYDTskxh8pgTM/oqKEbi+NtUv7kYQg9JwwNk78Ly
 AhoR84pEXbdblsNorN+3/ZIUOnS4/pnDAhHQC+2s2fgRmI60IbyoCE2WSRhOrwyFo0E7
 fwjMf4fKPpJvZBMgRSS2UHVPAfv2MagvdfbZfOawEpOMjd6g3gfRfhu+WjiyIGRa754/
 MDkPr3+Hnd6av/FSGgGj/LTCbHWnSak0YPKzKc2wPaPNiGgdTdUor8FnjWvGSTAlgJFh
 yHU9NEsrOHWeeSudQCvFPF1lyj+HV9nS9ZbKOqQcEChuyacfGxTnck3CrMbEAyUsIiuI
 +oGQ==
X-Gm-Message-State: AJIora+VTTl+kfTWKNRHsYEzFzNoZnoVe9h4Kx9TRihVGplJoLwjwFJc
 9F+Hk2KFT+p8g9L/sPlHgdKXKdoYBMn9pnfnVlTU
X-Google-Smtp-Source: AGRyM1u6t4VbjNJona2UEpNHlKP5wTHkHby6Ya+C9mPUk56Zqy7EeRgKiauK/i7GOVZQ7XHor7ObgQc+c29/qmHZ6+0=
X-Received: by 2002:a7b:cd0c:0:b0:3a2:e864:98b8 with SMTP id
 f12-20020a7bcd0c000000b003a2e86498b8mr4562927wmj.200.1657640899216; Tue, 12
 Jul 2022 08:48:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220712042258.293010-1-jstultz@google.com>
 <13c5ca05-a366-2751-4f26-d978d074f748@amd.com>
In-Reply-To: <13c5ca05-a366-2751-4f26-d978d074f748@amd.com>
From: John Stultz <jstultz@google.com>
Date: Tue, 12 Jul 2022 08:48:07 -0700
Message-ID: <CANDhNCp_d2M+n90T1ziP5rHF85ZsxyN6qg4iE84ucPO-XK_HUg@mail.gmail.com>
Subject: Re: [RFC][PATCH 1/3] drm: drm_syncobj: Add note in DOC about absolute
 timeout values
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Chunming Zhou <david1.zhou@amd.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, LKML <linux-kernel@vger.kernel.org>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 Jason Ekstrand <jason@jlekstrand.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 12, 2022 at 12:40 AM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
> Am 12.07.22 um 06:22 schrieb John Stultz:
> > After having to debug down through the kernel to figure out
> > why my _WAIT calls were always timing out, I realized its
> > an absolute timeout value instead of the more common relative
> > timeouts.
> >
> > This detail should be called out in the documentation, as while
> > the absolute value makes sense here, its not as common for timeout
> > values.
>
> Well absolute timeout values are mandatory for making -ERESTARTSYS work
> without any additional handling.

Yes! I'm not saying it's wrong to use absolute values, just that
relative values are common enough to create some confusion here.

> So using them is recommended for ~20 years now and IIRC even documented
> somewhere.

So in addition to "somewhere", why not in the interface documentation as we=
ll?

> See here as well https://lwn.net/Articles/17744/ how much trouble system
> calls with relative timeouts are.

Yep. Well aware. :)

thanks
-john
