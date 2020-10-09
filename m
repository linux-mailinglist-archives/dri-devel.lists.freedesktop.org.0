Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A351D288FF2
	for <lists+dri-devel@lfdr.de>; Fri,  9 Oct 2020 19:26:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D7216ED67;
	Fri,  9 Oct 2020 17:26:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EED676ED67
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Oct 2020 17:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602264396;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y6ikGGK6aHMQWPhD82bP38Tw8B11lHIqI5A5jkizye8=;
 b=WbKhokfAWKxXkxe/qHPxYKjx96AmNppOtVG5Cgd6Gk889+R0xY1V+vrDpQFKnn84s7jG+A
 VwRfDzM1qffD0uiNxJhlqcUeCdaJDozS1Bfm7rmomaGXkFOn7Qw1eKZHeF4SAv30LyL6yI
 YYoe+H/5I9R0LD6CIytEwb8vBGJnwis=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-304-6klCyx1QOiang-gIjDDO3Q-1; Fri, 09 Oct 2020 13:26:33 -0400
X-MC-Unique: 6klCyx1QOiang-gIjDDO3Q-1
Received: by mail-qk1-f198.google.com with SMTP id u2so7332995qka.2
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Oct 2020 10:26:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:reply-to:to:cc:date
 :in-reply-to:references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=Y6ikGGK6aHMQWPhD82bP38Tw8B11lHIqI5A5jkizye8=;
 b=UmEPAY56wIe3Q6wnRtxkcXFQsqq10nfV4inQkrLfNNCmFrNtdkUDXvDyjBc+izcRsq
 mwyPnRSoSsfPN2pT7wvPitPm0XqQg//MIITohTJaJMUZusbXpL7lRO9f7OS0omrdkyqq
 RqEVqvk6UYtmXZi7tMncvDCHsAd4u0f1xEwfrJC6Q3mugQKQVFANAoHxYTYpaIqjPB2+
 qdwPGlneOzhFP5kzD55mbwtc5ZdaEzfNaBn0NR0+LqbGK+HtXCmJi1Av6JEAW+6F4elL
 glDSAwpMwUlvjaekFaAXpDmNMFGBK8BEhRBI6iWZ7782IdyXNCZVYuJ4kJxaM/9MI+rY
 zG8A==
X-Gm-Message-State: AOAM530m8fIUXTnjCi1sn4xKqYg/ajYOD+FRG1nIPMqjEuPwb8qpU9GX
 jS497oMs5mqiFpTUbeaXlPTJ9XLLqs8a9v4dv4rBfbwwX6zTaLsU4OliKs9sVzGM0eqdn7uDXY/
 E1bNpuJnal0i5dWbgnJ0a5lvNaZVY
X-Received: by 2002:a05:620a:1185:: with SMTP id
 b5mr14323726qkk.386.1602264393212; 
 Fri, 09 Oct 2020 10:26:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzp/SIm+I2tHWObGoz+HG1lGQmMTfmJLrFa/PeGFE7GwdStIYKbBNERYwy5v5frpjQ2xEoNwQ==
X-Received: by 2002:a05:620a:1185:: with SMTP id
 b5mr14323708qkk.386.1602264392973; 
 Fri, 09 Oct 2020 10:26:32 -0700 (PDT)
Received: from Whitewolf.lyude.net
 (pool-108-49-102-102.bstnma.fios.verizon.net. [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id m18sm6767237qkg.77.2020.10.09.10.26.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Oct 2020 10:26:32 -0700 (PDT)
Message-ID: <983f12944c0f14a7eee7d77bac98203a5c18981c.camel@redhat.com>
Subject: (Cc: drm-misc/intel maintainers) Re: [PATCH 1/2] drm/i915/dpcd_bl:
 uncheck PWM_PIN_CAP when detect eDP backlight capabilities
From: Lyude Paul <lyude@redhat.com>
To: Aaron Ma <aaron.ma@canonical.com>, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 mapengyu@gmail.com, daniel@ffwll.ch, airlied@linux.ie, tzimmermann@suse.de,
 mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 rodrigo.vivi@intel.com,  joonas.lahtinen@linux.intel.com,
 jani.nikula@linux.intel.com,  ville.syrjala@linux.intel.com
Date: Fri, 09 Oct 2020 13:26:31 -0400
In-Reply-To: <20201009085750.88490-1-aaron.ma@canonical.com>
References: <20201009085750.88490-1-aaron.ma@canonical.com>
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

For the whole series:

For the whole series:

Reviewed-by: Lyude Paul <lyude@redhat.com>

I'm going to add a Cc for stable so that it can be backported, and I'll push it
to drm-intel-next-queued once I get the OK from drm-misc/i915 folks

On Fri, 2020-10-09 at 16:57 +0800, Aaron Ma wrote:
> BOE panel with ID 2270 claims both PWM_PIN_CAP and AUX_SET_CAP backlight
> control bits, but default chip backlight failed to control brightness.
> 
> Check AUX_SET_CAP and proceed to check quirks or VBT backlight type.
> DPCD can control the brightness of this pannel.
> 
> Signed-off-by: Aaron Ma <aaron.ma@canonical.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> index acbd7eb66cbe..308b14159b7c 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> @@ -334,8 +334,7 @@ intel_dp_aux_display_control_capable(struct
> intel_connector *connector)
>  	 * the panel can support backlight control over the aux channel
>  	 */
>  	if (intel_dp->edp_dpcd[1] & DP_EDP_TCON_BACKLIGHT_ADJUSTMENT_CAP &&
> -	    (intel_dp->edp_dpcd[2] & DP_EDP_BACKLIGHT_BRIGHTNESS_AUX_SET_CAP) &&
> -	    !(intel_dp->edp_dpcd[2] & DP_EDP_BACKLIGHT_BRIGHTNESS_PWM_PIN_CAP))
> {
> +	    (intel_dp->edp_dpcd[2] & DP_EDP_BACKLIGHT_BRIGHTNESS_AUX_SET_CAP)) {
>  		drm_dbg_kms(&i915->drm, "AUX Backlight Control Supported!\n");
>  		return true;
>  	}
-- 
Sincerely,
      Lyude Paul (she/her)
      Software Engineer at Red Hat

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
