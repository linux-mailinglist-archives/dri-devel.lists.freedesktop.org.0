Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 788376D6ED1
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 23:20:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACA4210E1EC;
	Tue,  4 Apr 2023 21:20:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89A5B10E1EC;
 Tue,  4 Apr 2023 21:20:32 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id r11so136116230edd.5;
 Tue, 04 Apr 2023 14:20:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112; t=1680643230;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=q5+FAUacxS+s9wS9+WZNPmawepdrV15aiNOEp44JCVM=;
 b=La2q1cdEt1u8ad1MBI9z/YWXhjb1ddmFhaPLuOFZUYuelVrfE8HIhxNPyvFClV0P7g
 svtJ9lEKx+c3VSuhd0Oz8p5I/gXLjPr7+DglxX6aD7V5k0vz++j4xeNMqMgquRg3AEv3
 4y4BFu26N3/RiY4pKwASDwLAlCj7SrYCR+5KaJHbmQQzEQUeT2zoiOUeE0TkZcOSvoLC
 Z38gr3u/CJgZr4/T46A4/jqp+5gxiDeMV+GgKpmdtndU+NCKQVBh1OgsPzu2NOAn8FYW
 Bej2iZ9mMb+l4XonfKUVNMU/JWDiqiU4JrOABkvWWYqw8U+GKBEdUHA0SZjHpeTvE4Kn
 ffXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680643230;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=q5+FAUacxS+s9wS9+WZNPmawepdrV15aiNOEp44JCVM=;
 b=IfHaJ82RM2IwjRIbvz/Q7q2onTVc5FSZhX+/onzQ7oru2trj/86QAIdMkz58AJv8Qd
 2p5XiGQS3ptXhErLGBh2l9SFA+MSmx6lbf5fC9cE/pQQnC1VVNDp35jE3GVVpX9X2K+A
 b3xqtSGtJGwfqI4nQiQ0yuu88qEAqEoHFKAol4iLPHLc/ZMNMBy1iyIZc8Z/hWnuKgo8
 LfMKmJCtjQnXFW/Sy6hxjrFFQHqGpZPPmYg/4oEflOGFSoJfcqbBKGHnrGDjKFdF9t6U
 iDKl+zVX0//Q+8SwPSYGMMGGXEA8nmNee3qFFtNAtWfziX/xUT3IGrFE5xaClOVut5gP
 SoBA==
X-Gm-Message-State: AAQBX9drW1/r5Tg1kFxukwUxuZib/W6DW7c974Uj2MKv7kRWThcFbBSv
 TRbq3pkyB51Tgdc9G63D41ptsI8rzk8u84IxkgUT0xfLIx0=
X-Google-Smtp-Source: AKy350YQ8eox73r1Pc5Z61GA80cewysG9JVXMIiHYkLb+7yCzu/Auu3EHBU62rmW7kSappwZiTuB5zbuMVnl6rg80/s=
X-Received: by 2002:a17:907:c80b:b0:8f5:2e0e:6def with SMTP id
 ub11-20020a170907c80b00b008f52e0e6defmr565741ejc.0.1680643230540; Tue, 04 Apr
 2023 14:20:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230404201842.567344-1-daniel.vetter@ffwll.ch>
 <20230404201842.567344-3-daniel.vetter@ffwll.ch>
In-Reply-To: <20230404201842.567344-3-daniel.vetter@ffwll.ch>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 4 Apr 2023 23:20:19 +0200
Message-ID: <CAFBinCCQ+DRZ-T8rBO=fpP8s47X11iM4oZ5=LEjp_HqjAFSivg@mail.gmail.com>
Subject: Re: [PATCH 3/8] drm/aperture: Remove primary argument
To: Daniel Vetter <daniel.vetter@ffwll.ch>
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
Cc: linux-hyperv@vger.kernel.org, Emma Anholt <emma@anholt.net>,
 linux-fbdev@vger.kernel.org, DRI Development <dri-devel@lists.freedesktop.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Helge Deller <deller@gmx.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Deepak Rawat <drawat.floss@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 4, 2023 at 10:18=E2=80=AFPM Daniel Vetter <daniel.vetter@ffwll.=
ch> wrote:
>
> Only really pci devices have a business setting this - it's for
> figuring out whether the legacy vga stuff should be nuked too. And
> with the preceeding two patches those are all using the pci version of
I think it's spelled "preceding"

[...]
>  drivers/gpu/drm/meson/meson_drv.c           |  2 +-
for the meson driver:
Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>


Thank you and best regards,
Martin
