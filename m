Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D07B58B6C3C
	for <lists+dri-devel@lfdr.de>; Tue, 30 Apr 2024 09:53:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1321910E6E2;
	Tue, 30 Apr 2024 07:53:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=emersion.fr header.i=@emersion.fr header.b="BgaOX3uj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40136.proton.ch (mail-40136.proton.ch [185.70.40.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 108D610E414
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Apr 2024 07:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1714463619; x=1714722819;
 bh=zF25Btczut9IwZTsx8Tfh9J6djKRd4f/w/OcOXXQRck=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=BgaOX3ujuS8mBWmpyBRMjJ7s+I7KFoZzCzds4U0H2M09Nza/qJKAzv+buUPmX3IKm
 Y+RYXLNJzCPiY6O2FLHwO9GSnQ8g3jGCQkaJt24jk8XEgBBq8FmMEyp76lnmyKO5Kv
 Xw3swrVNM9NgpeXoUPI2Cy+dSsOtM8VjhN8Q18oyc/2Ikl2+EqJ1o8AEfWopDVwbod
 2FpVnp8G8CA+/6c9Gjro9D4yUoTE+rLjHKiX91ZCtNdKW5MBBxgtEclyHjQlBrAYTX
 hJRBFX1TpZldZsJpInsQBXz7fZwy4do14CRlMLefGybroCdRlQMVKlnaU6H43WTkmy
 onKBYooHt5oaw==
Date: Tue, 30 Apr 2024 07:53:35 +0000
To: Jani Nikula <jani.nikula@intel.com>
From: Simon Ser <contact@emersion.fr>
Cc: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm: deprecate driver date
Message-ID: <_D910BUYB2AisyF_XxxuoFt4VA001Sls_51rM1qF7q9EFsxTkEEMsqKc86OQ3p3xHu9wsHRws0JG_SkqFtqxu_9_tcp1uwaPjVUAntXoyqg=@emersion.fr>
In-Reply-To: <20240429164336.1406480-1-jani.nikula@intel.com>
References: <20240429164336.1406480-1-jani.nikula@intel.com>
Feedback-ID: 1358184:user:proton
X-Pm-Message-ID: b50cda46a65dd012b76894aee7fc875fcecbdeb7
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

On Monday, April 29th, 2024 at 18:43, Jani Nikula <jani.nikula@intel.com> w=
rote:

> The driver date serves no useful purpose, because it's hardly ever
> updated. The information is misleading at best.
>=20
> As described in Documentation/gpu/drm-internals.rst:
>=20
> The driver date, formatted as YYYYMMDD, is meant to identify the date
> of the latest modification to the driver. However, as most drivers
> fail to update it, its value is mostly useless. The DRM core prints it
> to the kernel log at initialization time and passes it to userspace
> through the DRM_IOCTL_VERSION ioctl.
>=20
> Stop printing the driver date at init, and start returning the empty
> string "" as driver date through the DRM_IOCTL_VERSION ioctl.

Sounds good to me.

Acked-by: Simon Ser <contact@emersion.fr>

BTW, I wonder if the driver version number (major/minor/patch) is useful?
Do drivers update it?
