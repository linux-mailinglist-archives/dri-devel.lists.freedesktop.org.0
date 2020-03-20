Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E9C5018D266
	for <lists+dri-devel@lfdr.de>; Fri, 20 Mar 2020 16:09:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 183796E14A;
	Fri, 20 Mar 2020 15:09:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 007226E14A
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Mar 2020 15:09:39 +0000 (UTC)
IronPort-SDR: /8ZKhpwMp4IkAzQa2qngcNcYiJrWJj3xuJNlSyisdZSfRctQmKr6ZIatwPnFTdBG9LMPWV+/0X
 Y31ZEGlSypEA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2020 08:09:39 -0700
IronPort-SDR: AFkBwF5WP4WysFrNZm4zA8IBQflVD1OzTdUEPsvTGlxHXrP6iOww7F+msDj/FYXc2cMAVwk0hr
 /bws+txLF6Yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,284,1580803200"; d="scan'208";a="445000342"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.27.64])
 by fmsmga005.fm.intel.com with ESMTP; 20 Mar 2020 08:09:38 -0700
Date: Fri, 20 Mar 2020 08:09:38 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Emmanuel Vadot <manu@freebsd.org>
Subject: Re: [PATCH 1/2] drm/client: Dual licence the header in GPL-2 and MIT
Message-ID: <20200320150938.GA2520475@mdroper-desk1.amr.corp.intel.com>
References: <20200320022114.2234-1-manu@FreeBSD.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200320022114.2234-1-manu@FreeBSD.org>
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
Cc: tzimmermann@suse.de, airlied@linux.ie, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kraxel@redhat.com, tglx@linutronix.de
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 20, 2020 at 03:21:13AM +0100, Emmanuel Vadot wrote:
> Source file was dual licenced but the header was omitted, fix that.
> Contributors for this file are:
> Daniel Vetter <daniel.vetter@ffwll.ch>
> Matt Roper <matthew.d.roper@intel.com>
> Maxime Ripard <mripard@kernel.org>
> Noralf Tr=F8nnes <noralf@tronnes.org>
> Thomas Zimmermann <tzimmermann@suse.de>

Acked-by: Matt Roper <matthew.d.roper@intel.com>

> =

> Signed-off-by: Emmanuel Vadot <manu@FreeBSD.org>
> ---
>  include/drm/drm_client.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> =

> diff --git a/include/drm/drm_client.h b/include/drm/drm_client.h
> index 3ed5dee899fd..94c9c72c206d 100644
> --- a/include/drm/drm_client.h
> +++ b/include/drm/drm_client.h
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> +/* SPDX-License-Identifier: GPL-2.0 or MIT */
>  =

>  #ifndef _DRM_CLIENT_H_
>  #define _DRM_CLIENT_H_
> -- =

> 2.25.1
> =


-- =

Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation
(916) 356-2795
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
