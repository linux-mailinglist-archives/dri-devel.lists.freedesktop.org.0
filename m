Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 170F5549B8E
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jun 2022 20:31:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F9BB10F5A7;
	Mon, 13 Jun 2022 18:31:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7742510F5A7
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 18:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655145097; x=1686681097;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=PA+RJfWey2I595Esrv3rrJOEx2AlZ/fX4Ur/wV2CUNU=;
 b=iwS3J0765wo2nL28grr2ej1rNcWgv9UjavaN6cfMHOpeEwuW0AKIu8TE
 CcgaT59Q0KGhvLQgKRHWDgJFk9pEXT/soMP5ny4p6+7ndapVnaS2dBAi+
 oZgQEikLEcu602TB0d8H3Q3ru+bdB3CC20Orz2iE45PN4isUgGys9hwwt
 vHCo/7UEV+YoWcD0+v+F8nureOU5ZTGufTdpJXa5iwfj4BgDMm52Gs4ro
 IyEFBGLizzVVFtd9WNls4uhnGqL88qAy9HcBFqtTrArogn76prKuW3Kjc
 JKiEGpCMhjck6Em3WQje6Rl/yq/3FB5X6W2AhL8aDahTlsPnZ7fvusyth Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10377"; a="258817101"
X-IronPort-AV: E=Sophos;i="5.91,297,1647327600"; d="scan'208";a="258817101"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2022 11:31:31 -0700
X-IronPort-AV: E=Sophos;i="5.91,297,1647327600"; d="scan'208";a="639878137"
Received: from njascanu-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.47.149])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2022 11:31:26 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: =?utf-8?Q?Jos=C3=A9_Exp=C3=B3sito?= <jose.exposito89@gmail.com>,
 javierm@redhat.com
Subject: Re: [PATCH v3 1/3] drm/rect: Add DRM_RECT_INIT() macro
In-Reply-To: <20220613171738.111013-2-jose.exposito89@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220613171738.111013-1-jose.exposito89@gmail.com>
 <20220613171738.111013-2-jose.exposito89@gmail.com>
Date: Mon, 13 Jun 2022 21:31:24 +0300
Message-ID: <87bkuwza83.fsf@intel.com>
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
Cc: davidgow@google.com, airlied@linux.ie, dlatypov@google.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de,
 =?utf-8?Q?Jos?= =?utf-8?Q?=C3=A9_Exp=C3=B3sito?= <jose.exposito89@gmail.com>,
 kunit-dev@googlegroups.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 13 Jun 2022, Jos=C3=A9 Exp=C3=B3sito <jose.exposito89@gmail.com> wr=
ote:
> Add a helper macro to initialize a rectangle from x, y, width and
> height information.
>
> Signed-off-by: Jos=C3=A9 Exp=C3=B3sito <jose.exposito89@gmail.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  include/drm/drm_rect.h | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>
> diff --git a/include/drm/drm_rect.h b/include/drm/drm_rect.h
> index 6f6e19bd4dac..e8d94fca2703 100644
> --- a/include/drm/drm_rect.h
> +++ b/include/drm/drm_rect.h
> @@ -47,6 +47,22 @@ struct drm_rect {
>  	int x1, y1, x2, y2;
>  };
>=20=20
> +/**
> + * DRM_RECT_INIT - initialize a rectangle from x/y/w/h
> + * @x: x coordinate
> + * @y: y coordinate
> + * @w: width
> + * @h: height
> + *
> + * RETURNS:
> + * A new rectangle of the specified size.
> + */
> +#define DRM_RECT_INIT(x, y, w, h) ((struct drm_rect){ \
> +		.x1 =3D (x), \
> +		.y1 =3D (y), \
> +		.x2 =3D (x) + (w), \
> +		.y2 =3D (y) + (h) })
> +
>  /**
>   * DRM_RECT_FMT - printf string for &struct drm_rect
>   */

--=20
Jani Nikula, Intel Open Source Graphics Center
