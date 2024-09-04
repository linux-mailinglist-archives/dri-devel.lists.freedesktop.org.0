Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A75D996BC06
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2024 14:26:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 877B210E793;
	Wed,  4 Sep 2024 12:26:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="OdEF9Q8a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E021E10E793
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2024 12:26:05 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-53346132365so8029680e87.1
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Sep 2024 05:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725452764; x=1726057564; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ShpEItUXTPw0R0PCCwcqcGnCTzyW8rw0q9donzLK+vY=;
 b=OdEF9Q8ad86yoIitE7sRDRNZ8M010pNitX+0ZjVCAEaIf7CK+kg4qw3MsoIMWlZKWz
 Ir0ZnEOlV8EEY38fU4S/DwiBHucZI43R6cLbslLjHfQwkQM+Idzntd//tQYGU9xojXjz
 kVdCjn3JpDyrlyRZZ+g76sQtSW5PgeUbYlUP4tsqou+4s4Ov8UQp7m/WpadngDDQnC4l
 QEtTDumnbfyROLWCA4S4NLzy6kWHhCs0Wd1DDI4IRQp+WrprH62we5r/tNPhENDKJnNI
 hC8NwCpA8t7SPjIC4ky0FX5EAWWEWcFKE2B8qmu+xMS7l39hlqAvwk1XlF1dDyLyoqcu
 fV+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725452764; x=1726057564;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ShpEItUXTPw0R0PCCwcqcGnCTzyW8rw0q9donzLK+vY=;
 b=t2Bzkkj/lkiKlcQBEhnpnjcI5wsqb/KmGQMJNf1Q07yJtG2FP7QIn5HaQgt+BZbffH
 UrXyvgna6vx9BUf6kwGWe9M4FHRAfIchRLawiKTc0AvIG4NkkrGx2c6ma4zaQMgYGDtv
 XyFEX03qcdzcQwgEWAo51nw7AQTzX+h5Cag+346ca9xWxIKWQPsm6AhHUkkH+svSswGz
 H91Vqlz21RWiSz+iMF0wDHUi/pR4JXjdpObVfq9oZmpeoSmiedlWplw+rX2bh3QuX0zO
 CE6crCuQr0Rz9FpdPUyBvbdEoDI8JEuvnQ6MzVNcSIUg+qbvU7Ic6E2urkqlW7dibITH
 6ZiA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUT+Hx2akGwpdPZnQywHACIp91fvckyDTGvIDP63uMTLaarxQfVtjckifptYfXxFOx+esKlx4A9IO8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz/Uu42GupxbnNYxUYAZWCGDNnBKK9dmAKdMNMVj4y2PZf21V8b
 Mrk+YNMeTw26s0H/npamellOLl4fsceFIiHzksQdHWmEIWUqzQPDnpqnipt9e24pxnJEO51gtqS
 ryua+PJt2vuYbL9UXtCOLd8IqaMRFcFrWqqy0aQ==
X-Google-Smtp-Source: AGHT+IHQ/WqpDHeg1ka71f0rdWw4LIiM6w3YCOG+feROT/sho6CUg2/KN5mK4Hkh/sNeYgzOJg8iR0SKY0/FJvcj+W0=
X-Received: by 2002:a05:6512:3f11:b0:52e:fa6b:e54a with SMTP id
 2adb3069b0e04-53546b335a8mr12338692e87.30.1725452762836; Wed, 04 Sep 2024
 05:26:02 -0700 (PDT)
MIME-Version: 1.0
References: <20240904093140.15203-1-tzimmermann@suse.de>
In-Reply-To: <20240904093140.15203-1-tzimmermann@suse.de>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 4 Sep 2024 14:25:51 +0200
Message-ID: <CACRpkdYsZUGeoRHpFNyBX_Xs+ModmOwTP5Xmo3Pn+-PqusgfTg@mail.gmail.com>
Subject: Re: [PATCH] drm/fbdev-dma: Only install deferred I/O if necessary
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: javierm@redhat.com, alexander.stein@ew.tq-group.com, daniel@ffwll.ch, 
 airlied@gmail.com, dri-devel@lists.freedesktop.org, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

quick response as always! :)

On Wed, Sep 4, 2024 at 11:31=E2=80=AFAM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:

> Deferred I/O requires struct page for framebuffer memory, which is
> not guaranteed for all DMA ranges. We thus only install deferred I/O
> if we have a framebuffer that requires it.
>
> A reported bug affected the ipu-v3 and pl111 drivers, which have video
> memory in either Normal or HighMem zones
>
> [    0.000000] Zone ranges:
> [    0.000000]   Normal   [mem 0x0000000010000000-0x000000003fffffff]
> [    0.000000]   HighMem  [mem 0x0000000040000000-0x000000004fffffff]
>
> where deferred I/O only works correctly with HighMem. See the Closes
> tags for bug reports.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: 808a40b69468 ("drm/fbdev-dma: Implement damage handling and deferr=
ed I/O")
> Reported-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> Closes: https://lore.kernel.org/all/23636953.6Emhk5qWAg@steina-w/
> Reported-by: Linus Walleij <linus.walleij@linaro.org>
> Closes: https://lore.kernel.org/dri-devel/CACRpkdb+hb9AGavbWpY-=3DuQQ0apY=
9en_tWJioPKf_fAbXMP4Hg@mail.gmail.com/
> Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Javier Martinez Canillas <javierm@redhat.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>

It works like a charm and LGTM.
Tested-by: Linus Walleij <linus.walleij@linaro.org>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
