Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BC2014123E
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2020 21:24:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0009E6F90E;
	Fri, 17 Jan 2020 20:24:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1B726F90F
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2020 20:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579292658;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Mf9AA1Vrd3DLvKm6Ua6uODP6RU9/ZU9r8t0dJGIFs0Q=;
 b=ORXZTq86Std8bRTiTw659o0H6naQQGBHNGme3r9AUpE6P+bcfAIt42uHU7jvfiXEy9CMZI
 3h+6IB9ivr/E0aHRN/RuTvuRNWHzzi24YKvTIdoxQBIq9p4oi7WByNzR+lHroBN8RafcwC
 8ILKZphaV5ldg3V0WNuVnQQHSpysaEw=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-309-kUd_M6emOaSs4sIqQxX0mg-1; Fri, 17 Jan 2020 15:24:16 -0500
Received: by mail-qv1-f72.google.com with SMTP id di5so16503931qvb.3
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2020 12:24:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=Mf9AA1Vrd3DLvKm6Ua6uODP6RU9/ZU9r8t0dJGIFs0Q=;
 b=cY5Ez19yv2O4OTcMHp+FbkK4a064RnhAXwq2i0EVbv8GiLztK11n5B8Ya++YPZZHi3
 5CrhM/PfO1wmX46N+m3mV5BZvrQ/m3SP1jYwZIKsEyZ/AOBrXU8grChPUdOzFxPSaBus
 5MAslTOKdtuYa7KI20tvtWL0G9f1F1J8DVLsrDUbBhmP55kFdp323cO8nk8EOOZ6Isi8
 vxiqET8WdPEC7eYMKEKndgpbKKZIxhEXFKKLRyfwKey3yWZ41LZKhWa/Z9An+db6Z7a5
 xNhXuQGK1sbLARR6f7f1pdWR8/kQPk48qLbRSzdVtuVHbVjSmERxbu/3sEQooN+AEW4H
 LWuQ==
X-Gm-Message-State: APjAAAVjGqrKAnA+N3WCqWvvOgEh1LybmlhtMDxCljz8OEROHOngFnVg
 I97HMhQPPrHyM8vUwarsQhSWTDGeRNtFju8H3ADhvlCcbVWq5T6y9cXM1GPqKvc+iE0GG62ZVbs
 4W7dyfjYqVxqzIBROfL9LYUTXSmKY
X-Received: by 2002:a37:4894:: with SMTP id
 v142mr34009524qka.220.1579292655446; 
 Fri, 17 Jan 2020 12:24:15 -0800 (PST)
X-Google-Smtp-Source: APXvYqwlUDiTuA85gc4BfifYDTWJNreGhhsYLQMYYCP9814iR0p9cnrDza9FwVuJ5nHHKd2SwlXFlg==
X-Received: by 2002:a37:4894:: with SMTP id
 v142mr34009504qka.220.1579292655192; 
 Fri, 17 Jan 2020 12:24:15 -0800 (PST)
Received: from dhcp-10-20-1-90.bss.redhat.com ([144.121.20.162])
 by smtp.gmail.com with ESMTPSA id q130sm12169501qka.114.2020.01.17.12.24.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jan 2020 12:24:14 -0800 (PST)
Message-ID: <05569e0b86c62589e67a9355159e9db8e42c0820.camel@redhat.com>
Subject: Re: [PATCH v3 4/5] drm/i915: Don't use VBT for detecting DPCD
 backlight controls
From: Lyude Paul <lyude@redhat.com>
To: Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org
Date: Fri, 17 Jan 2020 15:24:13 -0500
In-Reply-To: <87zhemgvrn.fsf@intel.com>
References: <20200116211623.53799-1-lyude@redhat.com>
 <20200116211623.53799-5-lyude@redhat.com> <87zhemgvrn.fsf@intel.com>
Organization: Red Hat
User-Agent: Evolution 3.34.3 (3.34.3-1.fc31)
MIME-Version: 1.0
X-MC-Unique: kUd_M6emOaSs4sIqQxX0mg-1
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
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, AceLan Kao <acelan.kao@canonical.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Perry Yuan <pyuan@redhat.com>,
 Lee Shawn C <shawn.c.lee@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 2020-01-17 at 13:36 +0200, Jani Nikula wrote:
> On Thu, 16 Jan 2020, Lyude Paul <lyude@redhat.com> wrote:
> > Despite the fact that the VBT appears to have a field for specifying
> > that a system is equipped with a panel that supports standard VESA
> > backlight controls over the DP AUX channel, so far every system we've
> > spotted DPCD backlight control support on doesn't actually set this
> > field correctly and all have it set to INTEL_BACKLIGHT_DISPLAY_DDI.
> > 
> > While we don't know the exact reason for this VBT misuse, talking with
> > some vendors indicated that there's a good number of laptop panels out
> > there that supposedly support both PWM backlight controls and DPCD
> > backlight controls as a workaround until Intel supports DPCD backlight
> > controls across platforms universally. This being said, the X1 Extreme
> > 2nd Gen that I have here (note that Lenovo is not the hardware vendor
> > that informed us of this) PWM backlight controls are advertised, but
> > only DPCD controls actually function. I'm going to make an educated
> > guess here and say that on systems like this one, it's likely that PWM
> > backlight controls might have been intended to work but were never
> > really tested by QA.
> > 
> > Since we really need backlights to work without any extra module
> > parameters, let's take the risk here and rely on the standard DPCD caps
> > to tell us whether AUX backlight controls are supported or not. We still
> > check the VBT, but only to make sure that we don't enable DPCD backlight
> > controls on a panel that uses something other then the standard VESA
> > interfaces over AUX. Since panels using such non-standard interfaces
> > should probably have support added to i915, we'll print a warning when
> > seeing this in the VBT. We can remove this warning later if we end up
> > adding support for any custom backlight interfaces.
> > 
> > Signed-off-by: Lyude Paul <lyude@redhat.com>
> > Bugzilla: https://bugs.freedesktop.org/show_bug.cgi?id=112376
> > Cc: Jani Nikula <jani.nikula@intel.com>
> > Cc: Perry Yuan <pyuan@redhat.com>
> > Cc: AceLan Kao <acelan.kao@canonical.com>
> > ---
> >  .../drm/i915/display/intel_dp_aux_backlight.c    | 16 ++++++++++------
> >  1 file changed, 10 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> > b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> > index 77a759361c5c..3002b600635f 100644
> > --- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> > +++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> > @@ -330,13 +330,17 @@ int intel_dp_aux_init_backlight_funcs(struct
> > intel_connector *intel_connector)
> >  	struct intel_panel *panel = &intel_connector->panel;
> >  	struct drm_i915_private *dev_priv = to_i915(intel_connector-
> > >base.dev);
> >  
> > -	if (i915_modparams.enable_dpcd_backlight == 0 ||
> > -	    (i915_modparams.enable_dpcd_backlight == -1 &&
> > -	    dev_priv->vbt.backlight.type !=
> > INTEL_BACKLIGHT_VESA_EDP_AUX_INTERFACE))
> > -		return -ENODEV;
> > -
> > -	if (!intel_dp_aux_display_control_capable(intel_connector))
> > +	if (i915_modparams.enable_dpcd_backlight == 0)
> >  		return -ENODEV;
> > +	if (i915_modparams.enable_dpcd_backlight == -1) {
> > +		if (dev_priv->vbt.backlight.type
> > +		    == INTEL_BACKLIGHT_PANEL_DRIVER_INTERFACE) {
> > +			DRM_WARN("VBT says panel uses custom panel driver
> > interface, not using DPCD backlight controls\n");
> > +			return -ENODEV;
> > +		}
> > +		if (!intel_dp_aux_display_control_capable(intel_connector))
> > +			return -ENODEV;
> 
> Functionally, I'm fine with trying this. But perhaps we should check aux
> and early return first, and then check what vbt says, to reduce the
> dmesg noise.
> 
> I'll probably want to see a debug message if we're enabling aux
> backlight even if dev_priv->vbt.backlight.type !=
> INTEL_BACKLIGHT_VESA_EDP_AUX_INTERFACE. It's the kind of debug trace
> you'll really want to get first.

Good point, I'll send a respin of this patch with those changes
> 
> BR,
> Jani.
> 
> 
> 
> > +	}
> >  
> >  	panel->backlight.setup = intel_dp_aux_setup_backlight;
> >  	panel->backlight.enable = intel_dp_aux_enable_backlight;
-- 
Cheers,
	Lyude Paul

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
