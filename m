Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0FEE6B797D
	for <lists+dri-devel@lfdr.de>; Mon, 13 Mar 2023 14:53:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5460610E528;
	Mon, 13 Mar 2023 13:52:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F34910E527
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Mar 2023 13:52:57 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A1326B81123
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Mar 2023 13:52:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A7B3C4339E
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Mar 2023 13:52:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1678715574;
 bh=QddGMGZH2uSDy7WMNvyVz5nSsecFIKvQwNk9EnMKP2g=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=BqzyS6VOKP+xZ2fxlujS0qxf3ZgEtv3ygBBe4HPYiXeXcuSc7Y4Zx044iCAIUMjS7
 uuicPk0C5sriXR9Vv+ue9NG3eEm3n0U5Uh62yaBJdKjyCLyc5H2TbhfEjk0tLMi7Ib
 R9q7+TFoFsEMHVdANrJt9BkXx6zcjxyOsWrJOmiPc8ol1eL45pNJ/scAzz5qmTB3xV
 RbSIqoztPRLozjvOb57QBjE2xda13ZdYsiLHiTbeKSe5mcyK956Blq70Q29F81nlLC
 W9O+9A40ehWMCKORthy19HzaYVru+jmnUlA0ReJGuMQdw7YASytluZ9tOxSPi1lxxf
 n9qfRSmc94/NA==
Received: by mail-pl1-f182.google.com with SMTP id a9so12982093plh.11
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Mar 2023 06:52:54 -0700 (PDT)
X-Gm-Message-State: AO0yUKW4bkRzYRNB1zMBvsJSEMKSV2QdKioljY8bj+oyXUyIzyLbg552
 j3GpK7Wirv3T7EPlYYLwo6zBZG4HEDvBXS2z/5IugQ==
X-Google-Smtp-Source: AK7set9XTcMOOJTIbvE3tTd6nShWwc1eAL3DYYDeE2y70F/yyyAjGP3BlGqmKzBHcvMqwete4V5CiRXVrwWvmRHA10c=
X-Received: by 2002:a17:90a:f10b:b0:23a:6ed6:7817 with SMTP id
 cc11-20020a17090af10b00b0023a6ed67817mr12471901pjb.5.1678715573999; Mon, 13
 Mar 2023 06:52:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230313055951.2997299-1-victor.liu@nxp.com>
 <292f25d7-2b2b-ba2a-36c3-c207960141f9@linaro.org>
In-Reply-To: <292f25d7-2b2b-ba2a-36c3-c207960141f9@linaro.org>
From: Robert Foss <rfoss@kernel.org>
Date: Mon, 13 Mar 2023 14:52:42 +0100
X-Gmail-Original-Message-ID: <CAN6tsi7yz+DvAsV2F9x08Nz3TO-HTCazc11996Y9khVm7SPncw@mail.gmail.com>
Message-ID: <CAN6tsi7yz+DvAsV2F9x08Nz3TO-HTCazc11996Y9khVm7SPncw@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Add include/drm/drm_bridge.h to DRM DRIVERS
 FOR BRIDGE CHIPS
To: neil.armstrong@linaro.org
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
Cc: andrzej.hajda@intel.com, jonas@kwiboo.se, Liu Ying <victor.liu@nxp.com>,
 linux-kernel@vger.kernel.org, jernej.skrabec@gmail.com,
 dri-devel@lists.freedesktop.org, tzimmermann@suse.de,
 Laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 13, 2023 at 10:36=E2=80=AFAM <neil.armstrong@linaro.org> wrote:
>
> On 13/03/2023 06:59, Liu Ying wrote:
> > Appropriate maintainers should be suggested for changes to the
> > include/drm/drm_bridge.h header file, so add the header file to the
> > 'DRM DRIVERS FOR BRIDGE CHIPS' section.
> >
> > Signed-off-by: Liu Ying <victor.liu@nxp.com>
> > ---
> >   MAINTAINERS | 1 +
> >   1 file changed, 1 insertion(+)
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 3d409875740d..b6e7ac70b8a8 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -6824,6 +6824,7 @@ S:      Maintained
> >   T:  git git://anongit.freedesktop.org/drm/drm-misc
> >   F:  Documentation/devicetree/bindings/display/bridge/
> >   F:  drivers/gpu/drm/bridge/
> > +F:   include/drm/drm_bridge.h
> >
> >   DRM DRIVERS FOR EXYNOS
> >   M:  Inki Dae <inki.dae@samsung.com>
>
>
> Acked-by: Neil Armstrong <neil.armstrong@linaro.org>

Acked-by: Robert Foss <robert.foss@linaro.org>
