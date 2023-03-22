Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3719B6C4D9B
	for <lists+dri-devel@lfdr.de>; Wed, 22 Mar 2023 15:27:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01AD810E38A;
	Wed, 22 Mar 2023 14:27:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DC0210E38A
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Mar 2023 14:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679495235; x=1711031235;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=NuhzRiGGH6UKuBz0ns09hmTJOfbL7JGzcelZ3ZHySok=;
 b=bmcDHvLPBCjRgSvnYv3XmUFsik4EH+nivzT0K5Ia/Dlkrw9/DAFp0Wv0
 SeommuerYkTFxnxs39vr92iz0CrpN2lC6rtTNYhwidGR+sxRerM7vw1/P
 3eypNCFm/GNnUcj7begPxae6mipp0kxtGNIwSFrBp0FbjtCIt6Lm1cTjj
 fX2GZeCUNv3pFfVFHyfGfWh+xDR4d8ZjD2kACibkMTPeWoQt5Drqmk0v0
 wJy4EXapz7315QfVzmDxZrvcQtPbSTLfarSf12Vc7D2gPJ9EIEsJY45Fp
 umWJi0jYcROhP9IqBQsuM4fpsQMkNwvwWxft8t37iG5PlJsqSjNZ6xC13 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="337947702"
X-IronPort-AV: E=Sophos;i="5.98,282,1673942400"; d="scan'208";a="337947702"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 07:26:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="684328733"
X-IronPort-AV: E=Sophos;i="5.98,282,1673942400"; d="scan'208";a="684328733"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.70])
 by fmsmga007.fm.intel.com with SMTP; 22 Mar 2023 07:26:53 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 22 Mar 2023 16:26:52 +0200
Date: Wed, 22 Mar 2023 16:26:52 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Arthur Grillo <arthurgrillo@riseup.net>
Subject: Re: [PATCH 1/5] drm/tests: Test drm_rect_intersect()
Message-ID: <ZBsQLEdrJYnNUDPo@intel.com>
References: <20230322140701.69852-1-arthurgrillo@riseup.net>
 <20230322140701.69852-2-arthurgrillo@riseup.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230322140701.69852-2-arthurgrillo@riseup.net>
X-Patchwork-Hint: comment
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
Cc: carlos.craveiro@usp.br, tales.aparecida@gmail.com, dlatypov@google.com,
 javierm@redhat.com, dri-devel@lists.freedesktop.org, mairacanal@riseup.net,
 maxime@cerno.tech, andrealmeid@riseup.net, airled@gmail.com,
 matheus.vieira.g@usp.br
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 22, 2023 at 11:06:57AM -0300, Arthur Grillo wrote:
> Insert test for the drm_rect_intersect() function, it also create a
> helper for comparing drm_rects more easily.
> 
> Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
> ---
>  drivers/gpu/drm/tests/drm_rect_test.c | 30 +++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
> 
> diff --git a/drivers/gpu/drm/tests/drm_rect_test.c b/drivers/gpu/drm/tests/drm_rect_test.c
> index e9809ea32696..f700984f70a8 100644
> --- a/drivers/gpu/drm/tests/drm_rect_test.c
> +++ b/drivers/gpu/drm/tests/drm_rect_test.c
> @@ -9,6 +9,15 @@
>  
>  #include <drm/drm_rect.h>
>  
> +static void drm_rect_compare(struct kunit *test, const struct drm_rect *r,
> +			     const struct drm_rect *expected)
> +{
> +	KUNIT_EXPECT_EQ(test, r->x1, expected->x1);
> +	KUNIT_EXPECT_EQ(test, r->y1, expected->y1);
> +	KUNIT_EXPECT_EQ(test, drm_rect_width(r), drm_rect_width(expected));
> +	KUNIT_EXPECT_EQ(test, drm_rect_height(r), drm_rect_height(expected));
> +}

We already have a drm_rect_equals().

> +
>  static void drm_test_rect_clip_scaled_div_by_zero(struct kunit *test)
>  {
>  	struct drm_rect src, dst, clip;
> @@ -196,11 +205,32 @@ static void drm_test_rect_clip_scaled_signed_vs_unsigned(struct kunit *test)
>  	KUNIT_EXPECT_FALSE_MSG(test, drm_rect_visible(&src), "Source should not be visible\n");
>  }
>  
> +static void drm_test_rect_intersect(struct kunit *test)
> +{
> +	struct drm_rect r1, r2;
> +	bool visible;
> +
> +	drm_rect_init(&r1, 0, 0, 2, 2);
> +	drm_rect_init(&r2, 1, 1, 2, 2);
> +
> +	visible = drm_rect_intersect(&r1, &r2);
> +
> +	KUNIT_EXPECT_TRUE_MSG(test, visible, "Interserction should be a visible rect");
> +	drm_rect_compare(test, &r1, &DRM_RECT_INIT(1, 1, 1, 1));
> +
> +	drm_rect_init(&r1, 0, 0, 1, 1);
> +

I would re-init r2 here too to make it easier to see what we're
actually testing.

I would probably test a few more variations of the overlap between
the rectangles, eg: equal rectangles, one smaller one fully inside
the bigger one, overlaps across different edges/corners.

> +	visible = drm_rect_intersect(&r1, &r2);
> +
> +	KUNIT_EXPECT_FALSE_MSG(test, visible, "Interserction should not be a visible rect");
> +}
> +
>  static struct kunit_case drm_rect_tests[] = {
>  	KUNIT_CASE(drm_test_rect_clip_scaled_div_by_zero),
>  	KUNIT_CASE(drm_test_rect_clip_scaled_not_clipped),
>  	KUNIT_CASE(drm_test_rect_clip_scaled_clipped),
>  	KUNIT_CASE(drm_test_rect_clip_scaled_signed_vs_unsigned),
> +	KUNIT_CASE(drm_test_rect_intersect),
>  	{ }
>  };
>  
> -- 
> 2.39.2

-- 
Ville Syrjälä
Intel
