Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B0FE41B8EE
	for <lists+dri-devel@lfdr.de>; Tue, 28 Sep 2021 23:04:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43DF06E99C;
	Tue, 28 Sep 2021 21:04:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A79346E99C
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Sep 2021 21:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632863061;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wr4pGocdlgbpHNQZjncQtWMxPCsDg6ua30ksGUh8IrE=;
 b=YoIcbNUFKt7hqD86li3yoFkS/h3Jer6a2VneQfUN0kYM8wqrpBLQFwGaMz5BGBus15Px1u
 Xx6l4nSkRm5fudABJh+nNgmsEA6MXNRMosWGhrf1QTAKgWYHt1gHQcgvtoCpoVZQXf2dGc
 P9adw9BoxtBq3CTeCglM+edeukkbpTw=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-364-DPCXODn3O6yIcYE20b4vtw-1; Tue, 28 Sep 2021 17:04:19 -0400
X-MC-Unique: DPCXODn3O6yIcYE20b4vtw-1
Received: by mail-qv1-f70.google.com with SMTP id
 dl13-20020ad44e0d000000b0038263927ea7so383415qvb.9
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Sep 2021 14:04:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=wr4pGocdlgbpHNQZjncQtWMxPCsDg6ua30ksGUh8IrE=;
 b=Pl0jMwwtQplkxGv1vzb8SkKQXqvu+qNkX05IXXKhDsGLYedz3lPmzaPw+DVM1s8TS8
 SJDhUZKxGaHr0UGbuWOiTzH8FHbAPjL2OzQkD/KxNYDuB9S8YJFyPfRYnSSowhtHv0w6
 cZZPBNnjKB3kK/S0JOohOtIjJjGv84H91f1KVjWLEe5sQcbQJNqEzFmyVKGEtgLD0yfL
 sUMeFd9gT+jaEeCWY5XQz99tsw8h03R2cuhQK5Cfu4sfcakiMaX9czXFlGCDRSjKUPxf
 S3icBxsDmPpKHXvgXCk6Yj4MvjdXC3VeTNoY3sjSsvDb2bTq80uNTECp2CTXj2Tw1BhA
 7tcg==
X-Gm-Message-State: AOAM532NmFBXpG7hDn2VTHH+sHCDCTHo23Iuva+RtD1ib5VmG+SNJ8Hs
 V5MFNCpsEEhQ/mh53i+2oDdrWs5hynCJs0Nx/hmuMXxqP3+Brj8J6R5mjI7Bn8iJjiYXhS1OiSl
 4a0RPe9oi9pPr6sE9K5N4CpS/yCLm
X-Received: by 2002:a05:622a:164b:: with SMTP id
 y11mr8017229qtj.310.1632863058915; 
 Tue, 28 Sep 2021 14:04:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxMqugv0AWsDrgkfAZii9ACpGK/1bgFIpz4wc6OcxKr+tsd/H/yJ7Xr/NdDBAdDi11PjOcp9w==
X-Received: by 2002:a05:622a:164b:: with SMTP id
 y11mr8017205qtj.310.1632863058670; 
 Tue, 28 Sep 2021 14:04:18 -0700 (PDT)
Received: from [192.168.8.206] (pool-96-230-249-157.bstnma.fios.verizon.net.
 [96.230.249.157])
 by smtp.gmail.com with ESMTPSA id d24sm223902qka.7.2021.09.28.14.04.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Sep 2021 14:04:18 -0700 (PDT)
Message-ID: <dd2578c87323918e316cd7429b36b329542fd13f.camel@redhat.com>
Subject: Re: [PATCH 2/3] drm/dp, drm/i915: Add support for VESA backlights
 using PWM for brightness control
From: Lyude Paul <lyude@redhat.com>
To: Doug Anderson <dianders@chromium.org>
Cc: Intel Graphics <intel-gfx@lists.freedesktop.org>, dri-devel
 <dri-devel@lists.freedesktop.org>, Rajeev Nandan <rajeevny@codeaurora.org>,
 Satadru Pramanik <satadru@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>,  Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>, 
 Daniel Vetter <daniel@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>,  Ben Skeggs <bskeggs@redhat.com>, Ville
 =?ISO-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,  Sean Paul
 <seanpaul@chromium.org>, open list <linux-kernel@vger.kernel.org>, "open
 list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <nouveau@lists.freedesktop.org>
Date: Tue, 28 Sep 2021 17:04:16 -0400
In-Reply-To: <CAD=FV=V00-z=zvh6oZVYt7Hw00o07zEYxCa4zMrCmgNKEzcBCw@mail.gmail.com>
References: <20210927201206.682788-1-lyude@redhat.com>
 <20210927201206.682788-3-lyude@redhat.com>
 <CAD=FV=V00-z=zvh6oZVYt7Hw00o07zEYxCa4zMrCmgNKEzcBCw@mail.gmail.com>
Organization: Red Hat
User-Agent: Evolution 3.40.4 (3.40.4-1.fc34)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 2021-09-28 at 13:00 -0700, Doug Anderson wrote:
> Hi,
> 
> 
> I'm not sure I understand the comment above. You say "enabled/disabled
> via PWM" and that doesn't make sense w/ my mental model. Normally I
> think of a PWM allowing you to adjust the brightness and there being a
> separate GPIO that's in charge of enable/disable. To some extent you

Oops - you're completely right, it is a GPIO pin and I got myself
confused since in i915 I'm the chipset-specific callbacks for turning
the panel on are intertwined with the PWM callbacks.

> could think of a PWM as being "disabled" when its duty cycle is 0%,
> but usually there's separate "enable" logic that really has nothing to
> do with the PWM itself.
> 
> In general, it seems like the options are:
> 
> 1. DPCD controls PWM and the "enable" logic.
> 
> 2. DPCD controls PWM but requires an external "enable" GPIO.
> 
> 3. We require an external PWM but DPCD controls the "enable" logic.
> 
> Maybe you need a second "capability" to describe whether the client of
> your code knows how to control an enable GPIO? ...or perhaps better
> you don't need a capability and you can just assume that if the client
> needs to set an "enable" GPIO that it will do so. That would match how
> things work today. AKA:
> 
> a) Client calls the AUX backlight code to "enable"
> 
> b) AUX backlight code will set the "enable" bit if supported.
> 
> c) Client will set the "enable" GPIO if it knows about one.
> 
> Presumably only one of b) or c) will actually do something. If neither
> does something then this panel simply isn't compatible with this
> board.

I will definitely take note from this explanation and rewrite some of
the helper docs I'm updating to reflect this, thank you!

Being that I think panel drivers are basically the only other user of
this driver, if you think this is the way to go I'm OK with this. My
original reasoning for having a cap for this was worrying about the ARM
drivers handling this, along with potentially changing backlight
behavior in nouveau. I'm realizing now though that those are probably
problems for nouveau and not the helper, and I could probably avoid
hitting any issues by just adding some additional DPCD checks for GPIO
enabling/PWM passthrough in nouveau itself.

So I'll drop the cap in the next respin of this
> 
> 
> > +/**
> > + * drm_edp_backlight_supported() - Check an eDP DPCD for VESA backlight
> > support
> > + * @aux: The AUX channel, only used for debug logging
> > + * @edp_dpcd: The DPCD to check
> > + * @caps: The backlight capabilities this driver supports
> > + *
> > + * Returns: %True if @edp_dpcd indicates that VESA backlight controls are
> > supported, %false
> > + * otherwise
> > + */
> > +bool drm_edp_backlight_supported(struct drm_dp_aux *aux,
> > +                                const u8
> > edp_dpcd[EDP_DISPLAY_CTL_CAP_SIZE],
> > +                                enum drm_edp_backlight_driver_caps caps)
> > +{
> > +       if (!(edp_dpcd[1] & DP_EDP_TCON_BACKLIGHT_ADJUSTMENT_CAP))
> > +               return false;
> > +
> > +       if (!(caps & DRM_EDP_BACKLIGHT_DRIVER_CAP_PWM) &&
> > +           (!(edp_dpcd[2] & DP_EDP_BACKLIGHT_BRIGHTNESS_AUX_SET_CAP) ||
> > +            !(edp_dpcd[2] & DP_EDP_BACKLIGHT_AUX_ENABLE_CAP))) {
> 
> Elsewhere you match DP_EDP_BACKLIGHT_AUX_ENABLE_CAP against
> edp_dpcd[1]. Here you match against [2]. Are you sure that's correct?

absolutely not! thank you for catching this

> 
> 
> >  /*
> >   * DisplayPort AUX channel
> >   */
> > @@ -2200,7 +2182,11 @@ drm_dp_has_quirk(const struct drm_dp_desc *desc,
> > enum drm_dp_quirk quirk)
> >   * @pwm_freq_pre_divider: The PWM frequency pre-divider value being used
> > for this backlight, if any
> >   * @max: The maximum backlight level that may be set
> >   * @lsb_reg_used: Do we also write values to the
> > DP_EDP_BACKLIGHT_BRIGHTNESS_LSB register?
> > - * @aux_enable: Does the panel support the AUX enable cap?
> > + * @aux_enable: Does the panel support the AUX enable cap? Always %false
> > when the driver doesn't
> > + * support %DRM_EDP_BACKLIGHT_DRIVER_CAP_PWM
> 
> Why is aux_enable always false if it doesn't support
> DRM_EDP_BACKLIGHT_DRIVER_CAP_PWM? It doesn't seem like the code
> enforces this and I'm not sure why it would. Am I confused?

This was mainly just to keep the behavior identical for drivers that
didn't support controlling backlights like this, but re: the response I
wrote up above I think we can just totally drop the caps.

> 

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

