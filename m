Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 90C6919454B
	for <lists+dri-devel@lfdr.de>; Thu, 26 Mar 2020 18:19:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D82FA6E8F0;
	Thu, 26 Mar 2020 17:19:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66D476E8F0
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Mar 2020 17:19:51 +0000 (UTC)
Received: from [192.168.1.183] ([37.4.249.171]) by mrelayeu.kundenserver.de
 (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1N0o3X-1jThV40qCT-00wjRV; Thu, 26 Mar 2020 18:19:43 +0100
Subject: Re: [PATCH] drm/vc4: Fix HDMI mode validation
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>, Daniel Vetter <daniel.vetter@ffwll.ch>
References: <20200326122001.22215-1-nsaenzjulienne@suse.de>
From: Stefan Wahren <stefan.wahren@i2se.com>
Openpgp: preference=signencrypt
Autocrypt: addr=stefan.wahren@i2se.com; keydata=
 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 AQ==
Message-ID: <c4b3e083-ac6e-b321-f0eb-f20e8ec3b1a6@i2se.com>
Date: Thu, 26 Mar 2020 18:19:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200326122001.22215-1-nsaenzjulienne@suse.de>
Content-Language: en-US
X-Provags-ID: V03:K1:jxnsSan8U4WMipWwpPaGVAHUJ/Z1BIbGoVGlGnqpqaUvFljgSv2
 kGamaUmPk0oVqFBAC5FWBAhgzpBGv3qAS9HFUTDqXsb2YhhQzcucoT7yXG40Fzc7iOK0nnM
 8W3eMtNuFVBMiVXlEfI6uahaZOH3RqNsrorwXTwdSVpXZ7Jow8CDhF1u7Uotr5KpHJabAuL
 2K03A304nne3QpyJfv2TQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:uRiD4JPgA9Y=:R52O4wtjVVuCv5/m/UActh
 k7q2ucmvdo39XzRPK8M+Ua3dLBnpJyy2+iBVnB5xw3/sKS/VYiDQQCMZus2OImTvnV5chgYR9
 SNTPV5vikNWw1Vqc7co2jRfoaFBl+BMQuqj51lHrFUzZCTuOUSOyh9fgHnnSKdjRRw77oPlhQ
 Ljq6Wt9ZZ8ca1XTPoTQq/3Eg3KWtrdW5U8hUaRYmelHj9HVcG2Ug1vOXvkI5aRi484upEny3P
 0iJ6QHZWL5hmPuiCLy6YL0IRay+NEdMSuBDUys+0OKmAm9xyG+U27rhX91zcM7jnqx6RDvR52
 F6cwUO1lKRezhSJ7mc6/Vm3d3qt7S2uzXCqES8q9k+Xrmdn4AHIW5yindbDtL9dfQSZR685wt
 9AnbRcRWw5JHav/YZJOWWEiRWb0MCL4qNg66Fv2TbxtUevLegjn8MSHARX4D0/LGLasXeHC13
 HjEh2n4ClCZ5knu2bGDmwVXw9yfHmnZqCavAXRgIup+G7MePEgqwIEEqPv2MpJk9KjmcW6cfV
 A85VPbgr5F6FBc8RvN9EtBFStQcFbEOnaBCs+rSzv4d+VaqYdrBDwJd6GTuEEtlgY/nbW8PKt
 zE+vLT4YidsGNzjWj9lheX2+DsXqyAp5dZjdQBU+cr/UZOQJdypbgP7Gi6lDYnkprLJwWbwma
 p35fk4SZL9l/altcl9WkMuLAqQ1dH5JOFeq4DEiARHGBdTq7EjGiyqqwXqRIfC3vaVS/O9E7N
 1FCOBViimkUr8OKtS2uMDRlqgQM9iYUJ1BUGvGuW/Ta9YugCaEptqKVgHGnh0yEltXBsD02Li
 VOKw23obX3U7emk+lCLL0SAIiX0lmcqJ78PvvZCXSu6Ex9ywJPcEt/Pq/FObLYpbbbrpI73
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
Cc: f.fainelli@gmail.com, Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, maxime@cerno.tech,
 linux-rpi-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 26.03.20 um 13:20 schrieb Nicolas Saenz Julienne:
> Current mode validation impedes setting up some video modes which should
> be supported otherwise. Namely 1920x1200@60Hz.
>
> Fix this by lowering the minimum HDMI state machine clock to pixel clock
> ratio allowed.
>
> Fixes: 32e823c63e90 ("drm/vc4: Reject HDMI modes with too high of clocks")
> Reported-by: Stefan Wahren <stefan.wahren@i2se.com>
> Suggested-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Signed-off-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
> ---
>  drivers/gpu/drm/vc4/vc4_hdmi.c | 20 ++++++++++++++++----
>  1 file changed, 16 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
> index cea18dc15f77..340719238753 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -681,11 +681,23 @@ static enum drm_mode_status
>  vc4_hdmi_encoder_mode_valid(struct drm_encoder *crtc,
>  			    const struct drm_display_mode *mode)
>  {
> -	/* HSM clock must be 108% of the pixel clock.  Additionally,
> -	 * the AXI clock needs to be at least 25% of pixel clock, but
> -	 * HSM ends up being the limiting factor.
> +	/*
> +	 * As stated in RPi's vc4 firmware "HDMI state machine (HSM) clock must
> +	 * be faster than pixel clock, infinitesimally faster, tested in
> +	 * simulation. Otherwise, exact value is unimportant for HDMI
> +	 * operation." This conflicts with bcm2835's vc4 documentation, which
> +	 * states HSM's clock has to be at least 108% of the pixel clock.
> +	 *
> +	 * Real life tests reveal that vc4's firmware statement holds up, and
> +	 * users are able to use pixel clocks closer to HSM's, namely for
> +	 * 1920x1200@60Hz. So it was decided to have leave a 1% margin between
> +	 * both clocks. Which, for RPi0-3 implies a maximum pixel clock of

s/RPi0-3/bcm2835/ ?

Beside this nit:

Tested-by: Stefan Wahren <stefan.wahre@i2se.com>

Thanks


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
