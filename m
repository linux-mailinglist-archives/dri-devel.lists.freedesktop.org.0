Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AF9F74AEC8
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jul 2023 12:36:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D717C10E035;
	Fri,  7 Jul 2023 10:36:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02FB410E035
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jul 2023 10:36:28 +0000 (UTC)
Received: from pendragon.ideasonboard.com (85-76-32-136-nat.elisa-mobile.fi
 [85.76.32.136])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id C31F1558;
 Fri,  7 Jul 2023 12:35:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1688726140;
 bh=XrAelEmKYU1LywRgRBFa+g4zvjeXC8hhsR0Jo5yRvQY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Lld2azexr204bn9dbMtJoDCaBnhME8UDSf+ZOGNzsE3aIXmjuEoC6c5GIo4EDoGDb
 94kip/UlIwRNVMBmeyClrA3+EUY7h48b3x4HHHsWUpJaI0S1Xysvmg0VHCjpfEV43h
 eH0GsK6aeZhOlN4iGveAoKramBXhTFEPpa6lucv0=
Date: Fri, 7 Jul 2023 13:36:21 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH libdrm 1/3] util: Add NV24 and NV42 frame buffer formats
Message-ID: <20230707103621.GA15801@pendragon.ideasonboard.com>
References: <cover.1688570702.git.geert+renesas@glider.be>
 <6cbabaedec836a3a1da332644d4129343fca44b0.1688570702.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <6cbabaedec836a3a1da332644d4129343fca44b0.1688570702.git.geert+renesas@glider.be>
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
Cc: linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Geert,

Thank you for the patch.

On Wed, Jul 05, 2023 at 05:26:15PM +0200, Geert Uytterhoeven wrote:
> Add the missing entries for semi-planar YUV formats with
> non-subsampled chroma planes.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  tests/util/format.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/tests/util/format.c b/tests/util/format.c
> index 1ca1b82ce947b2f4..f825027227ddba24 100644
> --- a/tests/util/format.c
> +++ b/tests/util/format.c
> @@ -51,6 +51,8 @@ static const struct util_format_info format_info[] = {
>  	{ DRM_FORMAT_NV21, "NV21", MAKE_YUV_INFO(YUV_YCrCb, 2, 2, 2) },
>  	{ DRM_FORMAT_NV16, "NV16", MAKE_YUV_INFO(YUV_YCbCr, 2, 1, 2) },
>  	{ DRM_FORMAT_NV61, "NV61", MAKE_YUV_INFO(YUV_YCrCb, 2, 1, 2) },
> +	{ DRM_FORMAT_NV24, "NV24", MAKE_YUV_INFO(YUV_YCbCr, 1, 1, 2) },
> +	{ DRM_FORMAT_NV42, "NV42", MAKE_YUV_INFO(YUV_YCrCb, 1, 1, 2) },
>  	/* YUV planar */
>  	{ DRM_FORMAT_YUV420, "YU12", MAKE_YUV_INFO(YUV_YCbCr, 2, 2, 1) },
>  	{ DRM_FORMAT_YVU420, "YV12", MAKE_YUV_INFO(YUV_YCrCb, 2, 2, 1) },

-- 
Regards,

Laurent Pinchart
