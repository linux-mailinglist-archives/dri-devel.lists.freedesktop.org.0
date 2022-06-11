Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 170E35476BD
	for <lists+dri-devel@lfdr.de>; Sat, 11 Jun 2022 19:12:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03D0A1120EE;
	Sat, 11 Jun 2022 17:12:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay2-1.pub.mailoutpod1-cph3.one.com
 (mailrelay2-1.pub.mailoutpod1-cph3.one.com [46.30.210.183])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 089431120D0
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Jun 2022 17:12:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=8VcGizsapvboVcP1zo3t8VxEp/sSKU/KGufu1khKH6o=;
 b=A2wRRGJm1Dvqzp3wRD+S/rNCRrsrErVX0FjAVx1b5Ac3qvP9aFddXJjAUWE3Fnxz+PfHJ/yqPcorr
 kxK9ae79ZmxqRar/4qo13DZpgM4yIJaPwRdqpwc8lUBkgIfUXXkoFRqRQmTVyHdC7csX/DePHyFSHW
 66aUAeyCW4+Dl7S8MPlvoOpRcnUxrr5FUS7QStJSrjDsvgjMmDsprXQTphGT+PHSWVgb4LK/WhkbCf
 n06mxYRgZAiR+MNZROUeofaPHSbmfOAydPTbpd/TpQYgawN/UVqKXaoM5nabiFx0k7aA3tBAq/V1v5
 17iBZgSgYqmDPeNRYIWLEywb1y+eCrQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=8VcGizsapvboVcP1zo3t8VxEp/sSKU/KGufu1khKH6o=;
 b=5IAb1CIcBziY4xbn1yKwpAEQP590Fwx9G74QT+/t4VuSVJBiFkamznak0BvExsLjxPd37010eTkxY
 QvULcsDBQ==
X-HalOne-Cookie: e063aac0e33e47e8e18a15f833bc9b5f259a959b
X-HalOne-ID: a9d70d84-e9a9-11ec-a912-d0431ea8a290
Received: from mailproxy2.cst.dirpod4-cph3.one.com
 (80-162-45-141-cable.dk.customer.tdc.net [80.162.45.141])
 by mailrelay2.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id a9d70d84-e9a9-11ec-a912-d0431ea8a290;
 Sat, 11 Jun 2022 17:12:25 +0000 (UTC)
Date: Sat, 11 Jun 2022 19:12:23 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH] drm: Fix htmldocs indentation warning w/ DP AUX power
 requirements
Message-ID: <YqTM946ghjz+8CzJ@ravnborg.org>
References: <20220611095445.1.I534072d346b1ebbf0db565b714de9b65cbb24651@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220611095445.1.I534072d346b1ebbf0db565b714de9b65cbb24651@changeid>
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Kees Cook <keescook@chromium.org>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jani Nikula <jani.nikula@intel.com>,
 Maxime Ripard <maxime@cerno.tech>, Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Jun 11, 2022 at 09:55:04AM -0700, Douglas Anderson wrote:
> Two blank lines are needed to make the rst valid.
> 
> Fixes: 69ef4a192bba ("drm: Document the power requirements for DP AUX transfers")
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
> ---
> 
>  include/drm/display/drm_dp_helper.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
> index dc3c02225fcf..c5f8f45511ed 100644
> --- a/include/drm/display/drm_dp_helper.h
> +++ b/include/drm/display/drm_dp_helper.h
> @@ -372,8 +372,10 @@ struct drm_dp_aux {
>  	 * Also note that this callback can be called no matter the
>  	 * state @dev is in and also no matter what state the panel is
>  	 * in. It's expected:
> +	 *
>  	 * - If the @dev providing the AUX bus is currently unpowered then
>  	 *   it will power itself up for the transfer.
> +	 *
>  	 * - If we're on eDP (using a drm_panel) and the panel is not in a
>  	 *   state where it can respond (it's not powered or it's in a
>  	 *   low power state) then this function may return an error, but
> -- 
> 2.36.1.476.g0c4daa206d-goog
