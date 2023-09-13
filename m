Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BABA79F124
	for <lists+dri-devel@lfdr.de>; Wed, 13 Sep 2023 20:32:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E339610E4DC;
	Wed, 13 Sep 2023 18:32:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9E6A10E4DC
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Sep 2023 18:32:10 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-50079d148aeso134079e87.3
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Sep 2023 11:32:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1694629927; x=1695234727;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=z+kAAaz8DPw8hDMu58WJTq8XnZOBUPzC1oE9LVRkCzk=;
 b=bL0mcUUudG9CfDTOPYefbM15fqKSheickmEoNQYAhOeP7iEBjQOhyqAqYGIx6Xcdcu
 rZ71rVzl9URGX4jYz5o/mhZhVECQtA6AWDahMxK4yBiR7Y7p99NkNpAoUGhTu9U15GF3
 RajWLkZEn0koJ6g6/ngfgc1jsF3hsepYUvFKI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694629927; x=1695234727;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=z+kAAaz8DPw8hDMu58WJTq8XnZOBUPzC1oE9LVRkCzk=;
 b=dq7uPmsbdDc+9G7wnwAmkaYLuhJI06+a0DbJ5F+P2iTsuwjOs/1OLSskd2kkfFAjbd
 +JJtZeiNxKOobX/kGfRA7cDWfO75RfETzFY4S9oNgX/srxohANMge1QIU9Hdy36edSbf
 UGqFAB6JIlegt4jIPLAO0RtoKDe8VVVOvZ8sRNUv1GforcrTplQYJwmEVA6m8SvhIbBo
 Vc6QOyH0XsTZBXzBnF014l6mUh8Bn64L0f/nDufw15fy6iRWvKvbJyXOhQzi6FX3t54z
 Jjekn79e1Mwvf8biaWBbjE0qpmGVMAycKk5CgF2kQQXIaIyhia+TfoyUjboEYIJPC1CW
 BI3A==
X-Gm-Message-State: AOJu0YwaTGhq3yaEPPxVgudqgAxFZb4i/Mbo9bn+5HUf0DJzs/xOSY4r
 mqVE7lnH0m8aG7g7mBA9jYs4Jd+ub0mZ788ZjNcCE0Tx
X-Google-Smtp-Source: AGHT+IF9QSlvGVXNt15WH+7kM9hd/YADvZW0p0tJohp4V8EK6ylB8bYK1Ik1IBLAO/N87ExIx8p8dQ==
X-Received: by 2002:a19:f607:0:b0:502:afea:dfc9 with SMTP id
 x7-20020a19f607000000b00502afeadfc9mr2398674lfe.48.1694629927028; 
 Wed, 13 Sep 2023 11:32:07 -0700 (PDT)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com.
 [209.85.128.51]) by smtp.gmail.com with ESMTPSA id
 mc14-20020a170906eb4e00b009888aa1da11sm8747069ejb.188.2023.09.13.11.32.06
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Sep 2023 11:32:06 -0700 (PDT)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-4009fdc224dso11415e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Sep 2023 11:32:06 -0700 (PDT)
X-Received: by 2002:a05:600c:1c24:b0:401:a494:2bbb with SMTP id
 j36-20020a05600c1c2400b00401a4942bbbmr161937wms.5.1694629925852; Wed, 13 Sep
 2023 11:32:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230901234015.566018-1-dianders@chromium.org>
In-Reply-To: <20230901234015.566018-1-dianders@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 13 Sep 2023 11:31:53 -0700
X-Gmail-Original-Message-ID: <CAD=FV=US2G_s8_UtaRMBDLgOJqJzDzxMpg0C0wJ3TabUsuZsGg@mail.gmail.com>
Message-ID: <CAD=FV=US2G_s8_UtaRMBDLgOJqJzDzxMpg0C0wJ3TabUsuZsGg@mail.gmail.com>
Subject: Re: [RFT PATCH 0/6] drm: drm-misc drivers call
 drm_atomic_helper_shutdown() at the right times
To: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>
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
Cc: sumit.semwal@linaro.org, alexandre.belloni@bootlin.com, emma@anholt.net,
 xinliang.liu@linaro.org, tomi.valkeinen@ideasonboard.com, liviu.dudau@arm.com,
 alexandre.torgue@foss.st.com, nicolas.ferre@microchip.com, wens@csie.org,
 jstultz@google.com, kraxel@redhat.com,
 linux-stm32@st-md-mailman.stormreply.com, yongqin.liu@linaro.org,
 linux-aspeed@lists.ozlabs.org, samuel@sholland.org, sam@ravnborg.org,
 javierm@redhat.com, jernej.skrabec@gmail.com, steven.price@arm.com,
 drawat.floss@gmail.com, kong.kongxinwei@hisilicon.com, joel@jms.id.au,
 u.kleine-koenig@pengutronix.de, alain.volmat@foss.st.com,
 linux-sunxi@lists.linux.dev, suijingfeng@loongson.cn,
 mcoquelin.stm32@gmail.com, linux-hyperv@vger.kernel.org,
 raphael.gallais-pou@foss.st.com, alison.wang@nxp.com,
 spice-devel@lists.freedesktop.org, hdegoede@redhat.com, airlied@redhat.com,
 virtualization@lists.linux-foundation.org,
 linux-arm-kernel@lists.infradead.org, jfalempe@redhat.com,
 bbrezillon@kernel.org, andrew@aj.id.au, tzimmermann@suse.de,
 yannick.fertre@foss.st.com, linux-kernel@vger.kernel.org,
 christian.koenig@amd.com, paul.kocialkowski@bootlin.com,
 philippe.cornu@foss.st.com, alexander.deucher@amd.com, tiantao6@hisilicon.com,
 jyri.sarha@iki.fi, claudiu.beznea@microchip.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Fri, Sep 1, 2023 at 4:40=E2=80=AFPM Douglas Anderson <dianders@chromium.=
org> wrote:
>
>
> NOTE: in order to avoid email sending limits on the cover letter, I've
> split this patch series in two. Patches that target drm-misc and ones
> that don't. The cover letter of the two is identical other than this note=
.
>
> This patch series came about after a _long_ discussion between me and
> Maxime Ripard in response to a different patch I sent out [1]. As part
> of that discussion, we realized that it would be good if DRM drivers
> consistently called drm_atomic_helper_shutdown() properly at shutdown
> and driver remove time as it's documented that they should do. The
> eventual goal of this would be to enable removing some hacky code from
> panel drivers where they had to hook into shutdown themselves because
> the DRM driver wasn't calling them.
>
> It turns out that quite a lot of drivers seemed to be missing
> drm_atomic_helper_shutdown() in one or both places that it was
> supposed to be. This patch series attempts to fix all the drivers that
> I was able to identify.
>
> NOTE: fixing this wasn't exactly cookie cutter. Each driver has its
> own unique way of setting itself up and tearing itself down. Some
> drivers also use the component model, which adds extra fun. I've made
> my best guess at solving this and I've run a bunch of compile tests
> (specifically, allmodconfig for amd64, arm64, and powerpc). That being
> said, these code changes are not totally trivial and I've done zero
> real testing on them. Making these patches was also a little mind
> numbing and I'm certain my eyes glazed over at several points when
> writing them. What I'm trying to say is to please double-check that I
> didn't do anything too silly, like cast your driver's drvdata to the
> wrong type. Even better, test these patches!
>
> I've organized this series like this:
> 1. One patch for all simple cases of just needing a call at shutdown
>    time for drivers that go through drm-misc.
> 2. A separate patch for "drm/vc4", even though it goes through
>    drm-misc, since I wanted to leave an extra note for that one.
> 3. Patches for drivers that just needed a call at shutdown time for
>    drivers that _don't_ go through drm-misc.
> 4. Patches for the few drivers that had the call at shutdown time but
>    lacked it at remove time.
> 5. One patch for all simple cases of needing a call at shutdown and
>    remove (or unbind) time for drivers that go through drm-misc.
> 6. A separate patch for "drm/hisilicon/kirin", even though it goes
>    through drm-misc, since I wanted to leave an extra note for that
>    one.
> 7. Patches for drivers that needed a call at shutdown and remove (or
>    unbind) time for drivers that _don't_ go through drm-misc.
>
> I've labeled this patch series as RFT (request for testing) to help
> call attention to the fact that I didn't personally test any of these
> patches.
>
> If you're a maintainer of one of these drivers and you think that the
> patch for your driver looks fabulous, you've tested it, and you'd like
> to land it right away then please do. For non-drm-misc drivers there
> are no dependencies here. Some of the drm-misc drivers depend on the
> first patch, AKA ("drm/atomic-helper: drm_atomic_helper_shutdown(NULL)
> should be a noop"). I've tried to call this out but it also should be
> obvious once you know to look for it.
>
> I'd like to call out a few drivers that I _didn't_ fix in this series
> and why. If any of these drivers should be fixed then please yell.
> - DRM driers backed by usb_driver (like gud, gm12u320, udl): I didn't
> add the call to drm_atomic_helper_shutdown() at shutdown time
> because there's no ".shutdown" callback for them USB drivers. Given
> that USB is hotpluggable, I'm assuming that they are robust against
> this and the special shutdown callback isn't needed.
> - ofdrm and simpledrm: These didn't have drm_atomic_helper_shutdown()
> in either shutdown or remove, but I didn't add it. I think that's OK
> since they're sorta special and not really directly controlling
> hardware power sequencing.
> - virtio, vkms, vmwgfx, xen: I believe these are all virtual (thus
> they wouldn't directly drive a panel) and adding the shutdown
> didn't look straightforward, so I skipped them.
>
> I've let each patch in the series get CCed straight from
> get_maintainer. That means not everyone will have received every patch
> but everyone should be on the cover letter. I know some people dislike
> this but when touching this many drivers there's not much
> choice. dri-devel and lkml have been CCed and lore/lei exist, so
> hopefully that's enough for folks. I'm happy to add people to the
> whole series for future posts.
>
> [1] https://lore.kernel.org/lkml/20230804140605.RFC.4.I930069a32baab6faf4=
6d6b234f89613b5cec0f14@changeid
>
>
> Douglas Anderson (6):
>   drm/atomic-helper: drm_atomic_helper_shutdown(NULL) should be a noop
>   drm: Call drm_atomic_helper_shutdown() at shutdown time for misc
>     drivers
>   drm/vc4: Call drm_atomic_helper_shutdown() at shutdown time
>   drm/ssd130x: Call drm_atomic_helper_shutdown() at remove time
>   drm: Call drm_atomic_helper_shutdown() at shutdown/remove time for
>     misc drivers
>   drm/hisilicon/kirin: Call drm_atomic_helper_shutdown() at
>     shutdown/unbind time
>
>  .../gpu/drm/arm/display/komeda/komeda_drv.c   |  9 +++++
>  .../gpu/drm/arm/display/komeda/komeda_kms.c   |  7 ++++
>  .../gpu/drm/arm/display/komeda/komeda_kms.h   |  1 +
>  drivers/gpu/drm/arm/hdlcd_drv.c               |  6 ++++
>  drivers/gpu/drm/arm/malidp_drv.c              |  6 ++++
>  drivers/gpu/drm/aspeed/aspeed_gfx_drv.c       |  7 ++++
>  drivers/gpu/drm/ast/ast_drv.c                 |  6 ++++
>  drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c  |  6 ++++
>  drivers/gpu/drm/drm_atomic_helper.c           |  3 ++
>  drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c     |  8 +++++
>  .../gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c   |  6 ++++
>  .../gpu/drm/hisilicon/kirin/kirin_drm_drv.c   |  9 +++++
>  drivers/gpu/drm/hyperv/hyperv_drm_drv.c       |  6 ++++
>  drivers/gpu/drm/logicvc/logicvc_drm.c         |  9 +++++
>  drivers/gpu/drm/loongson/lsdc_drv.c           |  6 ++++
>  drivers/gpu/drm/mcde/mcde_drv.c               |  9 +++++
>  drivers/gpu/drm/mgag200/mgag200_drv.c         |  8 +++++
>  drivers/gpu/drm/omapdrm/omap_drv.c            |  8 +++++
>  drivers/gpu/drm/pl111/pl111_drv.c             |  7 ++++
>  drivers/gpu/drm/qxl/qxl_drv.c                 |  7 ++++
>  drivers/gpu/drm/solomon/ssd130x.c             |  1 +
>  drivers/gpu/drm/sti/sti_drv.c                 |  7 ++++
>  drivers/gpu/drm/stm/drv.c                     |  7 ++++
>  drivers/gpu/drm/sun4i/sun4i_drv.c             |  6 ++++
>  drivers/gpu/drm/tilcdc/tilcdc_drv.c           | 11 +++++-
>  drivers/gpu/drm/tiny/bochs.c                  |  6 ++++
>  drivers/gpu/drm/tiny/cirrus.c                 |  6 ++++
>  drivers/gpu/drm/tve200/tve200_drv.c           |  7 ++++
>  drivers/gpu/drm/vboxvideo/vbox_drv.c          | 10 ++++++
>  drivers/gpu/drm/vc4/vc4_drv.c                 | 36 ++++++++++++-------
>  30 files changed, 217 insertions(+), 14 deletions(-)

Just a heads up to keep folks in the loop: I've landed the first patch
in the drm-misc series, AKA ("drm/atomic-helper:
drm_atomic_helper_shutdown(NULL) should be a noop"), but I haven't
landed any of the others yet. I'm going to give them another ~week
just to be sure there are no objections.

-Doug
