Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22BE54DCFAF
	for <lists+dri-devel@lfdr.de>; Thu, 17 Mar 2022 21:55:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B4E010E0D7;
	Thu, 17 Mar 2022 20:55:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8826710E0D7
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Mar 2022 20:55:23 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6294761998
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Mar 2022 20:55:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14E2BC340FC
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Mar 2022 20:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647550516;
 bh=pze1z1BdbXGkFdCxOha8uoXDciJVurg0YhEMJq3runk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Ktz2HPv5Pvoq5YlkjrG5Lt14WuOZ1WqdctrngtoEUA0ULYWXkp85ADx8csL0NspFW
 qWT9JuRKq+q7fVk55t731YG5jhwGDnVVB5RRkAj0iOa/aeoBE2L+0tNJSBhDc0AhaV
 S7DAyRb7NHc/vaG1O9OHjH3iDYwi4ma07WIYMFWJrJ8wsngV72DRHo+wMP2gG4H6eo
 W78OeQWk+aFMciXG4f0HrQ/HM5/FeVpHHdQICSksdbDQ/S/Dts7T06WvmODpVNSht9
 fFFwsc13ghT+2dKVV2Wjt3E6HSxjchuy5ExbeczRSSwoxMuWnzMAKV42AEO0Qzn789
 RimGbzj7YTOtg==
Received: by mail-wm1-f54.google.com with SMTP id
 m42-20020a05600c3b2a00b00382ab337e14so5607478wms.3
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Mar 2022 13:55:15 -0700 (PDT)
X-Gm-Message-State: AOAM530c683iJyl0XSPi0jFzHJLhzaBPnMWq1gV/4moBg4aeDqnXVNnb
 9broTVxX9NGdKw8G6lSGU734k5rGzih/QLhr9Og=
X-Google-Smtp-Source: ABdhPJyZSHw1ltlznEHKpdgeeoKyl8jbWM+Dk2G5VG9wHw91b7cvT5lTxqYcy7l9pCd4B5lxaWL6odka8LdVjGdJIyo=
X-Received: by 2002:a7b:cd13:0:b0:38b:f39c:1181 with SMTP id
 f19-20020a7bcd13000000b0038bf39c1181mr5645518wmj.20.1647550514226; Thu, 17
 Mar 2022 13:55:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220316183708.1505846-1-arnd@kernel.org>
 <aaf204b2-e876-d271-3d4e-51cbcc70d690@suse.de>
 <1f6c4559-ee48-ca67-8ff1-f7f9d330bc12@suse.de>
 <CAK8P3a3ogV8sJshQJrzHe7hc2k1Opq-2hvXf6DU+HfhREk-DhQ@mail.gmail.com>
 <7082c67a-a336-54fc-dd32-81b9b8c0a64b@suse.de>
In-Reply-To: <7082c67a-a336-54fc-dd32-81b9b8c0a64b@suse.de>
From: Arnd Bergmann <arnd@kernel.org>
Date: Thu, 17 Mar 2022 21:54:58 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0Tfnza=OSR=-A_2u5QYNx8ZPm+FrFUtncVZMQYVNsATQ@mail.gmail.com>
Message-ID: <CAK8P3a0Tfnza=OSR=-A_2u5QYNx8ZPm+FrFUtncVZMQYVNsATQ@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: add CONFIG_DRM_KMS_HELPER dependencies
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>,
 Deepak Rawat <drawat.floss@gmail.com>, David Airlie <airlied@linux.ie>,
 Dillon Min <dillon.minfei@gmail.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Douglas Anderson <dianders@chromium.org>, Jani Nikula <jani.nikula@intel.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 17, 2022 at 8:15 PM Thomas Zimmermann <tzimmermann@suse.de> wrote:
> Am 16.03.22 um 21:59 schrieb Arnd Bergmann:
> > On Wed, Mar 16, 2022 at 8:31 PM Thomas Zimmermann <tzimmermann@suse.de> wrote:
> >
> > I was going for 'depends on' in the panel drivers because I saw the same being
> > done for other panel drivers, and mixing the two methods causes dependency
> > loops. I looked again now, and find that 'select DRM_KMS_HELPER' is more
> > common for other drivers, and makes sense here because it is generally
> > not user-selectable.
> >
> > The easiest replacement for my patch would then be to just use 'select
> > DRM_KMS_HELPER' from CONFIG_DRM_MIPI_DBI, which makes it
> > safer and more consistent with your change. If you like, I'll send an updated
> > version.
>
> MIPI DBI is another helper and select is not transitive IIRC. So drivers
> would still have to select KMS helpers as well. (?)

Not sure what you mean here: if a driver selects DRM_MIPI_DBI,
and DRM_MIPI_DBI selects DRM_KMS_HELPER, the leaf driver
does not need to select DRM_KMS_HELPER because it is already
selected. This is one of the major problems of overusing 'select' because
you end up unable to turn things off.

Maybe you are thinking of the case where DRM_MIPI_DBI depends
on DRM_KMS_HELPER, and something selects DRM_MIPI_DBI.
In this case, the dependency does /not/ get inherited by the leaf
driver, it needs a copy of the dependency or it triggers a warning,
which is what my patch intended.

> More generally, I think you're right about making DRM helper libraries
> using 'depends on' to link to other libraries. Drivers would at least
> know which config symbols to select. A number of config rules would have
> to be adapted to make that happen, I guess.

Generally speaking, a problem with DRM is that it uses way too
much 'select' to enforce other subsystems to be enabled, this is
what causes DRM to have more problems with incorrect or circular
dependencies, and the only way to avoid that is to be consistent
about the dependencies: each symbol should only be referenced
with either 'select' or 'depends on' but not both, and 'select' should
ideally only be used on hidden symbols.

> > One thing I'm not sure about is whether there is still use for ever having
> > CONFIG_DRM without CONFIG_DRM_KMS_HELPER if it gets selected
> > by almost every driver anyway. Is this actually a configuration that
> > users rely on, or should we just remove the symbol completely and
> > build the KMS helpers unconditionally?
>
> Best leave it as it is. i915 doesn't use it. And since it's a helper, it
> should not be lumped together with core DRM code simply for reasons of
> design.

Ok

> For DRM_KMS_HELPER itself, the mid-term plan is to move some of the code
> into other modules. KMS helpers used to contain all kind of helpers, but
> recently there's interest in reducing the minimum size of a built-in DRM
> with minimal driver support. So the non-essential stuff needs to go into
> modules for the more-sophisticated DRM drivers.

Right, that makes sense.

       Arnd
