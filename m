Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F1BC5480E8
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jun 2022 09:54:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AE9410E1AD;
	Mon, 13 Jun 2022 07:54:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A257910E1AD
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 07:54:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655106844; x=1686642844;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=O8tMnzfOI/GijOMMiN7vNOf1uJlj0uc0jxlTVKkoOEo=;
 b=BgVOFrku0CbxypsjQ66+j8rC3ScvFPLnbvn3mhkpYorZiEN6cQngZiaV
 n8BK32e50aZjIxGWdfMRDcyJ+1zSmHU1ItJK5FfJvRhXO0C4jGxxG5dSh
 xFxzJW2BJ+65h3HtpO2bpxQmzowmribH7QIb8HGvbr4Zw91HBgm/MMAS/
 GMlRFDlUcGICVKQ3+7Fvju55wNlxFVyCNx0WN+3zfe4CXKFajNUttc+C0
 Td7ECtTwDX/jUGFyEs0TmQa/dQud0UA0BKlDOncyx40YAyAsuHE0+q7HB
 laTRnCDg054XAY+G9u4ia3IgcTKvmN9qV9p2P3qTMhYZDftwJADjGWEKA Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10376"; a="258643080"
X-IronPort-AV: E=Sophos;i="5.91,296,1647327600"; d="scan'208";a="258643080"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2022 00:54:04 -0700
X-IronPort-AV: E=Sophos;i="5.91,296,1647327600"; d="scan'208";a="639594390"
Received: from njascanu-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.47.149])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2022 00:54:01 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: =?utf-8?Q?Jos=C3=A9_Exp=C3=B3sito?= <jose.exposito89@gmail.com>,
 javierm@redhat.com
Subject: Re: [PATCH v2 1/3] drm/rect: Add DRM_RECT_INIT() macro
In-Reply-To: <20220612161248.271590-2-jose.exposito89@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220612161248.271590-1-jose.exposito89@gmail.com>
 <20220612161248.271590-2-jose.exposito89@gmail.com>
Date: Mon, 13 Jun 2022 10:53:57 +0300
Message-ID: <87pmjdyp62.fsf@intel.com>
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
 =?utf-8?Q?Jos=C3=A9_Exp=C3=B3sito?= <jose.exposito89@gmail.com>,
 kunit-dev@googlegroups.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 12 Jun 2022, Jos=C3=A9 Exp=C3=B3sito <jose.exposito89@gmail.com> wr=
ote:
> Add a helper macro to initialize a rectangle from x, y, width and
> height information.
>
> Signed-off-by: Jos=C3=A9 Exp=C3=B3sito <jose.exposito89@gmail.com>
> ---
>  include/drm/drm_rect.h | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/include/drm/drm_rect.h b/include/drm/drm_rect.h
> index 6f6e19bd4dac..945696323c69 100644
> --- a/include/drm/drm_rect.h
> +++ b/include/drm/drm_rect.h
> @@ -47,6 +47,18 @@ struct drm_rect {
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
> +#define DRM_RECT_INIT(x, y, w, h) { (x), (y), (x) + (w), (y) + (h) }

Please use designated initializers.

It might help type safety if it also contained a (struct drm_rect) cast.

BR,
Jani.


> +
>  /**
>   * DRM_RECT_FMT - printf string for &struct drm_rect
>   */

--=20
Jani Nikula, Intel Open Source Graphics Center
