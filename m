Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C509B5A26FC
	for <lists+dri-devel@lfdr.de>; Fri, 26 Aug 2022 13:42:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF5D310E13A;
	Fri, 26 Aug 2022 11:42:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 567A810E0AC
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Aug 2022 11:42:43 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id r4so1754328edi.8
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Aug 2022 04:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc;
 bh=zrOUwjMiJLEQnorFwBXUXwNV/zm3wEQOoRsBf8uog7Q=;
 b=U4rUv4EoAmPfiCoSUnphA6oOwJ4BIldC5W7psWAbxmS9oPKkwzKYseYdRVD8E6ceVu
 prVJAzz31O0Z5bI1YbQkz9SwwxG3pRT5YNdHG6oMp1M1CYdMLkN88b8dcxqtdytJeCue
 iCD1p9Yj2M7si13UrRlq80NqMDRx/0e0aS7azGxXY1Xmb0AcsXK0m1+yXx2lo9yyP1he
 mstz/rJ5RF4kWk6ERLEHG+N/vF7SnP+oXR3MTiaJFaWjp7RBofwrpydMYkREi2tQ1Ibx
 nQxEXbqeiWv7OA4qS3udBUzz2DzeBa0zfjlLs8VLw+OUpFqYlPKkY8Tg7uLBllUBbXae
 jzrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
 bh=zrOUwjMiJLEQnorFwBXUXwNV/zm3wEQOoRsBf8uog7Q=;
 b=j3x3Kxh3NO2USrZKgsi1i6Kp0MkQ/5Mf62e8wi5OzPi3yyXGS0VQkUVc5IY+5TciBq
 z49yUd1xjVyjU2WnZ05047UTuBK2FFysmxtYMG+fl+lk8WRrQIB2sYxbjb16PdYSXQ6B
 eoNY39dYRYeB8/wVzvksD7336QZ6FVIJfwNcVSDMpuEZpZ34mcFt+xW2g134WQ1qC5QJ
 k/MW2KPnN2Ftzdz38ArG/3zbyKykmVy4TAS7+MVKeOGD0JVjSABUfUY4b+/zJ5N32Zxg
 2SR6NJdwga1//IDDUxle0VLRonifq546Xn8KisH6mpMWjXQmzgK6xgaJJBc2nRFm3Of9
 EvvA==
X-Gm-Message-State: ACgBeo0pD1ZuaChF5oYExY/FtyDwzmwGz/wFgg6qm9/QO5uSxOwrv1AE
 nztABn6lmG57HYRf7C0Q4YuuM01ejmuFSYROCZp5Fw==
X-Google-Smtp-Source: AA6agR4qgeBuy8ICwhXd8sQJYQGeXtvsZdgXOMuTzqsLARLDSJmZWXMNu6KxWCfFajUhlPbY0jiQTw0Z6OanDBXf5Ng=
X-Received: by 2002:a05:6402:1f8c:b0:43e:8fab:76c with SMTP id
 c12-20020a0564021f8c00b0043e8fab076cmr6453960edc.126.1661514161435; Fri, 26
 Aug 2022 04:42:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220823004243.11596-1-rdunlap@infradead.org>
In-Reply-To: <20220823004243.11596-1-rdunlap@infradead.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 26 Aug 2022 13:42:30 +0200
Message-ID: <CACRpkdZyk0OT2LuvHJRQgv+UjUgSzvyu1RECUEPu2T+8bcBziA@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm: fix drm_mipi_dbi build errors
To: Randy Dunlap <rdunlap@infradead.org>
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
Cc: kernel test robot <lkp@intel.com>, David Airlie <airlied@linux.ie>,
 Dillon Min <dillon.minfei@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Aug 23, 2022 at 2:42 AM Randy Dunlap <rdunlap@infradead.org> wrote:

> drm_mipi_dbi needs lots of DRM_KMS_HELPER support, so select
> that Kconfig symbol like it is done is most other uses, and
> the way that it was before MIPS_DBI was moved from tinydrm
> to its core location.
>
> Fixes these build errors:
>
> ld: drivers/gpu/drm/drm_mipi_dbi.o: in function `mipi_dbi_buf_copy':
> drivers/gpu/drm/drm_mipi_dbi.c:205: undefined reference to `drm_gem_fb_ge=
t_obj'
> ld: drivers/gpu/drm/drm_mipi_dbi.c:211: undefined reference to `drm_gem_f=
b_begin_cpu_access'
> ld: drivers/gpu/drm/drm_mipi_dbi.c:215: undefined reference to `drm_gem_f=
b_vmap'
> ld: drivers/gpu/drm/drm_mipi_dbi.c:222: undefined reference to `drm_fb_sw=
ab'
> ld: drivers/gpu/drm/drm_mipi_dbi.c:224: undefined reference to `drm_fb_me=
mcpy'
> ld: drivers/gpu/drm/drm_mipi_dbi.c:227: undefined reference to `drm_fb_xr=
gb8888_to_rgb565'
> ld: drivers/gpu/drm/drm_mipi_dbi.c:235: undefined reference to `drm_gem_f=
b_vunmap'
> ld: drivers/gpu/drm/drm_mipi_dbi.c:237: undefined reference to `drm_gem_f=
b_end_cpu_access'
> ld: drivers/gpu/drm/drm_mipi_dbi.o: in function `mipi_dbi_dev_init_with_f=
ormats':
> ld: drivers/gpu/drm/drm_mipi_dbi.o:/X64/../drivers/gpu/drm/drm_mipi_dbi.c=
:469: undefined reference to `drm_gem_fb_create_with_dirty'
>
> Fixes: 174102f4de23 ("drm/tinydrm: Move mipi-dbi")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Reported-by: kernel test robot <lkp@intel.com>
> Cc: Dillon Min <dillon.minfei@gmail.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Noralf Tr=C3=B8nnes <noralf@tronnes.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>

Patch applied to drm-misc-next

Yours,
Linus Walleij
