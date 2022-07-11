Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A6F05701D7
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 14:17:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B58FD8DDAF;
	Mon, 11 Jul 2022 12:17:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CE068DDF5
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 12:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657541829; x=1689077829;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=hTwQ2kEiEBkpmIviXOx3loso29xfUewVvEqCVD4Dtd4=;
 b=a6cKw/siz2zwjCaixHaJc83+I9OLCf30ckZnezecC+egOXBHUQLHLMGc
 rGTSe+oPiqh5S5khyjsr0+Sk8tzFzFS1MC/L2uLFmjhIo1U5gg/e1ch2U
 9rekbl2t+U2z9/RLL+DMvugvfcDm0YihRSpNNlGD0mqwwfTIzd5wrr+z5
 eWaZcyyKvJA2xRzouVlmmQmafSP/Gdvgrl1xCmWdJvaLx0X30MvMji90q
 ZEamD/eh/nTVAc82vIelHmPeCu1miV0i0LG6uOpJMN5SA/XzTUfY6wZ+L
 F3/pqGwiK9Xt4bgDYg3aCBJEmDKLxf3z7NHa/eQkW+6MYNtl2xQTToa2H A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10404"; a="346329966"
X-IronPort-AV: E=Sophos;i="5.92,262,1650956400"; d="scan'208";a="346329966"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2022 05:17:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,262,1650956400"; d="scan'208";a="652434605"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.161])
 by fmsmga008.fm.intel.com with SMTP; 11 Jul 2022 05:17:06 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 11 Jul 2022 15:17:05 +0300
Date: Mon, 11 Jul 2022 15:17:05 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH libdrm v2 04/10] util: Add missing big-endian RGB16 frame
 buffer formats
Message-ID: <YswUwWO8GZfBZhsj@intel.com>
References: <cover.1657302103.git.geert@linux-m68k.org>
 <a89f148bf61bc20a7bb9c0e8ba030b0b770f9fe2.1657302103.git.geert@linux-m68k.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a89f148bf61bc20a7bb9c0e8ba030b0b770f9fe2.1657302103.git.geert@linux-m68k.org>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 08, 2022 at 08:21:43PM +0200, Geert Uytterhoeven wrote:
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
> Any better suggestion than appending "be"?
> 
> v2:
>   - New.
> ---
>  tests/util/format.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/tests/util/format.c b/tests/util/format.c
> index a5464de6fc1ac70f..42a652c9a402a654 100644
> --- a/tests/util/format.c
> +++ b/tests/util/format.c
> @@ -76,6 +76,9 @@ static const struct util_format_info format_info[] = {
>  	{ DRM_FORMAT_BGRX5551, "BX15", MAKE_RGB_INFO(5, 1, 5, 6, 5, 11, 0, 0) },
>  	{ DRM_FORMAT_RGB565, "RG16", MAKE_RGB_INFO(5, 11, 6, 5, 5, 0, 0, 0) },
>  	{ DRM_FORMAT_BGR565, "BG16", MAKE_RGB_INFO(5, 0, 6, 5, 5, 11, 0, 0) },
> +	/* Big-endian RGB16 */
> +	{ DRM_FORMAT_XRGB1555 | DRM_FORMAT_BIG_ENDIAN, "XR15be", MAKE_RGB_INFO(5, 10, 5, 5, 5, 0, 0, 0) },
> +	{ DRM_FORMAT_RGB565 | DRM_FORMAT_BIG_ENDIAN, "RG16be", MAKE_RGB_INFO(5, 11, 6, 5, 5, 0, 0, 0) },

How about just stripping the BE bit in util_format_info_find()
so we don't have to duplicate the entries in the table?

I guess util_format_fourcc() would end up being more a bit
complicated since you'd have to massage the string.

But I'm not sure why we even store the fourcc as a string in
the table anyway. Could just add some kind of string_to_fourcc()
thingy instead AFAICS.

>  	/* RGB24 */
>  	{ DRM_FORMAT_BGR888, "BG24", MAKE_RGB_INFO(8, 0, 8, 8, 8, 16, 0, 0) },
>  	{ DRM_FORMAT_RGB888, "RG24", MAKE_RGB_INFO(8, 16, 8, 8, 8, 0, 0, 0) },
> -- 
> 2.25.1

-- 
Ville Syrjälä
Intel
