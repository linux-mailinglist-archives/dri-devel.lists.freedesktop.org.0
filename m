Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 13D1B286A87
	for <lists+dri-devel@lfdr.de>; Wed,  7 Oct 2020 23:53:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E8256E9C0;
	Wed,  7 Oct 2020 21:53:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 704346E9C0
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Oct 2020 21:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602107609;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BXDLJy3cpaM5bBZA0XOwM+ZPJVSdq/P/kp7oZvNnPnY=;
 b=AQJrKoAvvCTltMyZNdy5I3OcL+yXm9H+dCcLPHjmqYi7nWn87SAK4ZSsPgZAWw5uWhzAf+
 zVRZG7l66tQU70tR0gd7ou3ejcbnEuUY8J8RdjzsgwbLNeCxcmd38zb94gLGW+JjlPK3wI
 R6NwkDLd8cRLHpQVgHGusK9/WWFwJVU=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-473-V9YBlsxpP-GdL2g8QG6Afw-1; Wed, 07 Oct 2020 17:53:23 -0400
X-MC-Unique: V9YBlsxpP-GdL2g8QG6Afw-1
Received: by mail-qk1-f199.google.com with SMTP id k124so2339041qkc.13
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Oct 2020 14:53:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:reply-to:to:date
 :in-reply-to:references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=BXDLJy3cpaM5bBZA0XOwM+ZPJVSdq/P/kp7oZvNnPnY=;
 b=Atf8gILQ5HN8UzPPLyrZJJP6mRCbewe2LYU0yHDDaDtdUg3YOZ0QcHUCIOvOaId+JU
 NGAbRbywBoSfA3KwCIGnT5ALzlEp8CGi5p5ElxKxwXbehiAsIyhyfySeh7dDJmMrc4bR
 bpQzL1G1S6b3demQnMieoFNNYbA7XK3XUv+6W/1YtKOVlhVSazhTWJ5gRy8dVy4gH0mn
 exY5+pNRsM7dyd2ZKCrGxeKgF1CI2ytjGoctLhpu99iwTcsAfvVr4hBiy9nvj4mtaxtE
 0UuQslMAHpIAdOFFPR5BX1cW0/E/y7tDsEK6iG2Sn3265uYcw+tlTKaQrK0Po2f6OMGD
 raXw==
X-Gm-Message-State: AOAM530HAdm5DOrEprSbBPAKjNkWI2gxqosNgHH0dL/2sxkaRrTWpiyx
 u5bROD6WaQgIsBdGiGPrLssmQx9HE6WTOq2EIsexQC8meovQGlkZHAEkegSABbtEi9ldsX2Lqrk
 9ZrHgLj3rKepjc/+13BL87Q4pE+CN
X-Received: by 2002:ac8:2f4f:: with SMTP id k15mr5437824qta.178.1602107603052; 
 Wed, 07 Oct 2020 14:53:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJztgHq1DT8+0EZ0EAp6o4jDXABu9jdnfkiN69e3Dl5kWLMjxM+WdfGkPc8Onrw+Fq1DP+x8Zg==
X-Received: by 2002:ac8:2f4f:: with SMTP id k15mr5437813qta.178.1602107602829; 
 Wed, 07 Oct 2020 14:53:22 -0700 (PDT)
Received: from Whitewolf.lyude.net
 (pool-108-49-102-102.bstnma.fios.verizon.net. [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id g1sm2485892qtp.74.2020.10.07.14.53.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Oct 2020 14:53:22 -0700 (PDT)
Message-ID: <268f495fbb7e3042eb613398a8513a83d28d3fd9.camel@redhat.com>
Subject: Re: [PATCH 1/2] drm/i915/dpcd_bl: Skip testing control capability
 with force DPCD quirk
From: Lyude Paul <lyude@redhat.com>
To: Satadru Pramanik <satadru@gmail.com>, Kai-Heng Feng
 <kai.heng.feng@canonical.com>, Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, Ville =?ISO-8859-1?Q?Syrj=E4l=E4?=
 <ville.syrjala@linux.intel.com>, Juha-Pekka Heikkila
 <juhapekka.heikkila@gmail.com>, intel-gfx@lists.freedesktop.org, "open
 list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>, open list
 <linux-kernel@vger.kernel.org>
Date: Wed, 07 Oct 2020 17:53:21 -0400
In-Reply-To: <20201007065915.13883-1-kai.heng.feng@canonical.com>
References: <20201007065915.13883-1-kai.heng.feng@canonical.com>
Organization: Red Hat
User-Agent: Evolution 3.36.5 (3.36.5-1.fc32)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Reply-To: lyude@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi! I thought this patch rang a bell, we actually already had some discussion
about this since there's a couple of other systems this was causing issues for.
Unfortunately it never seems like that patch got sent out. Satadru?

(if I don't hear back from them soon, I'll just send out a patch for this
myself)

JFYI - the proper fix here is to just drop the
DP_EDP_BACKLIGHT_BRIGHTNESS_PWM_PIN_CAP check from the code entirely. As long as
the backlight supports AUX_SET_CAP, that should be enough for us to control it.


On Wed, 2020-10-07 at 14:58 +0800, Kai-Heng Feng wrote:
> HP DreamColor panel needs to be controlled via AUX interface. However,
> it has both DP_EDP_BACKLIGHT_BRIGHTNESS_AUX_SET_CAP and
> DP_EDP_BACKLIGHT_BRIGHTNESS_PWM_PIN_CAP set, so it fails to pass
> intel_dp_aux_display_control_capable() test.
> 
> Skip the test if the panel has force DPCD quirk.
> 
> Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> index acbd7eb66cbe..acf2e1c65290 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> @@ -347,9 +347,13 @@ int intel_dp_aux_init_backlight_funcs(struct
> intel_connector *intel_connector)
>  	struct intel_panel *panel = &intel_connector->panel;
>  	struct intel_dp *intel_dp = enc_to_intel_dp(intel_connector->encoder);
>  	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
> +	bool force_dpcd;
> +
> +	force_dpcd = drm_dp_has_quirk(&intel_dp->desc, intel_dp->edid_quirks,
> +				      DP_QUIRK_FORCE_DPCD_BACKLIGHT);
>  
>  	if (i915->params.enable_dpcd_backlight == 0 ||
> -	    !intel_dp_aux_display_control_capable(intel_connector))
> +	    (!force_dpcd &&
> !intel_dp_aux_display_control_capable(intel_connector)))
>  		return -ENODEV;
>  
>  	/*
> @@ -358,9 +362,7 @@ int intel_dp_aux_init_backlight_funcs(struct
> intel_connector *intel_connector)
>  	 */
>  	if (i915->vbt.backlight.type !=
>  	    INTEL_BACKLIGHT_VESA_EDP_AUX_INTERFACE &&
> -	    i915->params.enable_dpcd_backlight != 1 &&
> -	    !drm_dp_has_quirk(&intel_dp->desc, intel_dp->edid_quirks,
> -			      DP_QUIRK_FORCE_DPCD_BACKLIGHT)) {
> +	    i915->params.enable_dpcd_backlight != 1 && !force_dpcd) {
>  		drm_info(&i915->drm,
>  			 "Panel advertises DPCD backlight support, but "
>  			 "VBT disagrees. If your backlight controls "
-- 
Sincerely,
      Lyude Paul (she/her)
      Software Engineer at Red Hat

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
