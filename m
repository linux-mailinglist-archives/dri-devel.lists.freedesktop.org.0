Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ABFDA570843
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 18:26:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C0AC8FABF;
	Mon, 11 Jul 2022 16:26:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 231578FABF
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 16:26:18 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1E18F326;
 Mon, 11 Jul 2022 18:26:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1657556776;
 bh=D3kmscjTIkvXywdLFMnAZQcphbK2f0MibLPs2j1qR5k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PY4S4fZwWeDTvTyXLNC3rgXsdFjHdZ9gRlPS59xV+ZQsEJ9HdkxjJeqBVL1+FAnCd
 ZBP43ydfixE9tVoKbdh3yM3RwU5HyMAJvwCn8jdlpYn+Menw0M7zA7W26gkValdFvt
 VJ+PzHk98rVicMMgTPDr7kVzZFfwZgJDj6A925ZI=
Date: Mon, 11 Jul 2022 19:25:49 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH libdrm] util: Fix grey in YUV SMPTE patterns
Message-ID: <YsxPDViZB2OMJ/9w@pendragon.ideasonboard.com>
References: <d6baedf436195f6cfd6d3e81ddea5219e09d861d.1657554831.git.geert@linux-m68k.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <d6baedf436195f6cfd6d3e81ddea5219e09d861d.1657554831.git.geert@linux-m68k.org>
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

Hi Geert,

Thank you for the patch.

On Mon, Jul 11, 2022 at 05:54:46PM +0200, Geert Uytterhoeven wrote:
> The YUV SMPTE patterns use RGB 191/192/192 instead of 192/192/192 for
> the grey color in the top color bar.
> 
> Change it to 192/192/192, to match the RGB SMPTE patterns.
> 
> Fixes: a94ee624292bff96 ("modetest: Add SMPTE test pattern")
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  tests/util/pattern.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/util/pattern.c b/tests/util/pattern.c
> index 158c0b160a2ee870..f28fad311ec3de11 100644
> --- a/tests/util/pattern.c
> +++ b/tests/util/pattern.c
> @@ -162,7 +162,7 @@ static void fill_smpte_yuv_planar(const struct util_yuv_info *yuv,
>  				  unsigned int height, unsigned int stride)
>  {
>  	const struct color_yuv colors_top[] = {
> -		MAKE_YUV_601(191, 192, 192),	/* grey */
> +		MAKE_YUV_601(192, 192, 192),	/* grey */
>  		MAKE_YUV_601(192, 192, 0),	/* yellow */
>  		MAKE_YUV_601(0, 192, 192),	/* cyan */
>  		MAKE_YUV_601(0, 192, 0),	/* green */
> @@ -265,7 +265,7 @@ static void fill_smpte_yuv_packed(const struct util_yuv_info *yuv, void *mem,
>  				  unsigned int stride)
>  {
>  	const struct color_yuv colors_top[] = {
> -		MAKE_YUV_601(191, 192, 192),	/* grey */
> +		MAKE_YUV_601(192, 192, 192),	/* grey */
>  		MAKE_YUV_601(192, 192, 0),	/* yellow */
>  		MAKE_YUV_601(0, 192, 192),	/* cyan */
>  		MAKE_YUV_601(0, 192, 0),	/* green */

-- 
Regards,

Laurent Pinchart
