Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A755BB39FE
	for <lists+dri-devel@lfdr.de>; Thu, 02 Oct 2025 12:20:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4612610E371;
	Thu,  2 Oct 2025 10:20:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="fX5oX2Mo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6DBE10E371
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Oct 2025 10:20:54 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id B476BC011EF;
 Thu,  2 Oct 2025 10:20:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 9AD736062C;
 Thu,  2 Oct 2025 10:20:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 1FCA6102F1BC9; 
 Thu,  2 Oct 2025 12:20:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1759400451; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=uAA/uXnOcv4MfSqZ0e/gJwFBUMeRZs+rL70NE0BRk30=;
 b=fX5oX2Mo+fGknxJzSqCDenWT4Q4l88JtNhTUpuCtsL/E84Pxmxd2eo6HJTUmqzPz3wRnL4
 oLBNNtM0MkJkS8qxUSG+DwtX34rEN4jjpCfHNnVpc0dQJ06UeOt9YouKQywq4NrjwER8/S
 znbbU7XlbSBtJNokklAzhcfwVUnZCapWsi6V12yhhxl8aEkegr7g2LZuFj9C7He6U2Ggmx
 5q7yy3oY2yJLZRhB4tZLdFIiw/HrC5g4d29iu2zf65bQG8mAx54Ia71AaZt2HyIGb5MzPV
 b/NkAkeAo4r61gtyjXk5GXS0QIjmmbAQJ3+pvnI80nqGCJzCySXyNhQTzSgr3g==
Date: Thu, 2 Oct 2025 12:20:41 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>
Cc: louis.chauvet@bootlin.com, hamohammed.sa@gmail.com, simona@ffwll.ch,
 melissa.srw@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 sebastian.wick@redhat.com, xaver.hugl@kde.org, victoria@system76.com,
 a.hindborg@kernel.org, leitao@debian.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 00/16] drm/vkms: Add configfs support
Message-ID: <20251002122041.7248d8ff@booty>
In-Reply-To: <20250901122541.9983-1-jose.exposito89@gmail.com>
References: <20250901122541.9983-1-jose.exposito89@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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

Hello Jos=C3=A9,

On Mon,  1 Sep 2025 14:25:25 +0200
Jos=C3=A9 Exp=C3=B3sito <jose.exposito89@gmail.com> wrote:

> Hi everyone,
>=20
> This series allow to configure one or more VKMS instances without having
> to reload the driver using configfs.
>=20
> The process of configuring a VKMS device is documented in "vkms.rst".
>=20
> In addition, I created a CLI tool to easily control VKMS instances from t=
he
> command line: vkmsctl [1].
>=20
> The series is structured in 3 blocks:
>=20
>   - Patches 1..11: Basic device configuration. For simplicity, I kept the
>     available options as minimal as possible.
>=20
>   - Patches 12 and 13: New option to skip the default device creation and=
 to-do
>     cleanup.
>=20
>   - Patches 14, 15 and 16: Allow to hot-plug and unplug connectors. This =
is not
>     part of the minimal set of options, but I included in this series so =
it can
>     be used as a template/example of how new configurations can be added.
>=20
> Finally, the code is thoroughly tested by a collection of IGT tests [2]. =
The IGT
> series is almost fully reviewed (1 patch is missing) and it is waiting on=
 this
> series to be merged.
>=20
> I don't know what is preventing this series to be ACK by a DRM maintainer=
, but
> please, if there is something missing or that needs to be fixed let me kn=
ow.
>=20
> I CCed the configfs maintainers in case they can give feedback about the =
design
> of the configfs API or the configfs related code, just in case that is on=
e of
> the complicated points to review by DRM maintainers.
>=20
> Best wishes,
> Jos=C3=A9 Exp=C3=B3sito

I reviewed the whole series and it looks really good. The step-by-step
approach of patches 1.11 especially made it very easy to follow.

With the doc fixes suggested by Harry you can add my:
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Luca

--=20
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
