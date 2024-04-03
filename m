Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D55C8964E3
	for <lists+dri-devel@lfdr.de>; Wed,  3 Apr 2024 08:50:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91DA911253D;
	Wed,  3 Apr 2024 06:50:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=tq-group.com header.i=@tq-group.com header.b="XEJcXPAk";
	dkim=fail reason="key not found in DNS" (0-bit key; unprotected) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="mQyyLpb5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 940B311253D
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Apr 2024 06:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1712127038; x=1743663038;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MTaS3hFwOpMoYV03CzWD6hjCL5vdTlN5hMq8VLn5SXE=;
 b=XEJcXPAkDRxdS6agzTaiHcCkzMV/zsTJYyLTAUopZsln2qbq/w5Er/zH
 d6HF5K7YZwjwRiBY2qYr+k/78Nm5gEvlr2UKazjYpfNIXND7UKsGht8Q7
 WyYG2rapO1dCasPTCl9drnDd1i/NG/A1WF0YOQ+fS1v7q4dAtfGKjfdEP
 JHM1NGhfqCuPpaLuApZa7/msjjAgoXrm1Y5y6ljLx5V9vCPCoBnzH8ZT7
 kEojpGaN4Rgj9engIAW1ETfIV9RRUUiVaOBfeGEFAqtxET5FO4cVGs+dV
 sQIp85G8tt9L3pYfFoqoQGTLloe0xYzvIBBAkO17NKJG/sgHKm5UWUzCe A==;
X-IronPort-AV: E=Sophos;i="6.07,176,1708383600"; d="scan'208";a="36216913"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
 by mx1.tq-group.com with ESMTP; 03 Apr 2024 08:50:36 +0200
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 20965171F9B; Wed,  3 Apr 2024 08:50:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
 s=dkim; t=1712127032;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=MTaS3hFwOpMoYV03CzWD6hjCL5vdTlN5hMq8VLn5SXE=;
 b=mQyyLpb5qapduptVVc5SVM+am8EHR4TwEqV2NdY3IAK/SpfR95CFfMtTHe6c/tWbhdQri2
 VGRcekZr6QGThphLBqrO9sS5WwIPIV3NrOILm3hT+i1HIep+2djb8YEeL4f0KKYqUdLoZI
 kNIIOQh+AKO5dvt6Oii6sWVrutWPBU9M3yg2+jONR1L2nwmT04Xn3Q5fiS/ZvElFjuo0H6
 jMdBfUuMUqSJf3Yz17J5ZJXQnaZvmZ7WO1k7A9+2XdV5y5XOKMHSlj95K6x8XWQOk3fqT8
 u7UIgp0IPpLYdPPiKQwKTBVsuOVmYYTPmIAcmhb8V97C4VmMVfXCV+gpP/x4VA==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>,
 dri-devel@lists.freedesktop.org, kernel test robot <lkp@intel.com>,
 Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v3 07/13] drm: Make drivers depends on DRM_DW_HDMI
Date: Wed, 03 Apr 2024 08:50:37 +0200
Message-ID: <12410588.O9o76ZdvQC@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <2c78772a-1d3f-47dd-9c3f-a3011703e1ab@sirena.org.uk>
References: <20240327-kms-kconfig-helpers-v3-0-eafee11b84b3@kernel.org>
 <20240327-kms-kconfig-helpers-v3-7-eafee11b84b3@kernel.org>
 <2c78772a-1d3f-47dd-9c3f-a3011703e1ab@sirena.org.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3
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

Hi,

Am Dienstag, 2. April 2024, 17:43:41 CEST schrieb Mark Brown:
> On Wed, Mar 27, 2024 at 11:57:02AM +0100, Maxime Ripard wrote:
>=20
> > DRM_DW_HDMI has a number of dependencies that might not be enabled.
> > However, drivers were used to selecting it while not enforcing the
> > DRM_DW_HDMI dependencies.
> >=20
> > This could result in Kconfig warnings (and further build breakages) such
> > as:
> >=20
> >   Kconfig warnings: (for reference only)
> >      WARNING: unmet direct dependencies detected for DRM_DW_HDMI
> >      Depends on [n]: HAS_IOMEM [=3Dy] && DRM [=3Dm] && DRM_BRIDGE [=3Dy=
] && DRM_DISPLAY_HELPER [=3Dn]
> >      Selected by [m]:
> >      - DRM_SUN8I_DW_HDMI [=3Dm] && HAS_IOMEM [=3Dy] && DRM_SUN4I [=3Dm]
>=20
> This has landed in -next and appears to be causing breakage for several
> platforms using these devices.  For example I'm seeing the HDMI fail to
> probe on sun50i-a64-pin64-plus with arm64 defconfig, the DT kselftest
> result isn't terribly informative but it can be seen here:
> [snip]
>=20
> The change introduces a new dependency on DRM_DW_HDMI to the various
> drivers but I'm not seeing any defconfig updates which turn that option
> anywhere so it's not clear how this is expected to avoid regressing the
> defconfig behaviours unless I'm missing something?

I noticed the same. From what I can tell, several drivers (e.g. imx8mp and
imx6q) now depend on DRM_DW_HDMI without anybody actually selecting it.
This results in a dependency which can not be enabled manually.
Reverting restores a working driver.

Best regards,
Alexander
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


