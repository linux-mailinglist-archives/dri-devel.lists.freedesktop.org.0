Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B501C287A16
	for <lists+dri-devel@lfdr.de>; Thu,  8 Oct 2020 18:39:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BFFD6EA80;
	Thu,  8 Oct 2020 16:39:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25C0F6EA80
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Oct 2020 16:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602175178;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gHKD0aQI/7JBaioK/QfMPV93J3kvny7ubmqoofn11rg=;
 b=VSo8Aa8PnX+E/palAA5ZOlWIehAf3TY1FQDtMYWxOY1Kw7f/IwZFrB3GGPEODZva/pLrnT
 IPr8u85dfE2m56p4RBha7UuoWPv5BJD6vM+10BPJUd0dUbGMBB45r9zHe7wpXQywhXwxrA
 7jTvhZiJr7pukTq0ek5xLeT2bPnUQU8=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-239-lWGfEBSgOBKuNqSRHOqcNg-1; Thu, 08 Oct 2020 12:39:34 -0400
X-MC-Unique: lWGfEBSgOBKuNqSRHOqcNg-1
Received: by mail-qt1-f200.google.com with SMTP id l12so4158507qtu.22
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Oct 2020 09:39:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:reply-to:to:cc:date
 :in-reply-to:references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=gHKD0aQI/7JBaioK/QfMPV93J3kvny7ubmqoofn11rg=;
 b=hBoKcfanKMGeEXJlPF547UiELN3Zu5YimZ5yq9N7gmwynrRpU1BYHkVEIySEvHBnbb
 ghoLQd83/z/K4S418Vsp+Hz5jCa6vkHrTIVL4bqgQwuLVygAvC6MXvwP5QlGdsxbDKID
 259JwZaONO8S0GEGTIitSGe13F0WwD766InGqzCy6kNTviPAnZctHnpjrqXWLSkYZrAn
 /GVwetXzPgu8JJWeVkSLsBop0HLa6nUI4m6Ya6EPPDRfLOQM+ObMxryMVzv+zaxy3oh5
 h4GTUrPBlmfX6aoqhqNtctBs31TrwX8ImA3lJRmnAwcfYRAabons+OkT6ISFhIMvkId6
 Tseg==
X-Gm-Message-State: AOAM531RH+tCpRdGVQwCYIrZLBKUWQjHIWVYCbsTYydJuxie/t9ZyED4
 4AykNbl+MKHcZvIyru9kVn0UQV9FV8kA4DOLDb2eTgetg/2RnE81dVaGrFtmKWdPitV5kOGDGPS
 n1eRpUEpD1Zeg9Chbc5H4LFzV27Cg
X-Received: by 2002:a05:6214:a03:: with SMTP id
 dw3mr8534281qvb.44.1602175172884; 
 Thu, 08 Oct 2020 09:39:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzzD/BIqM2qDW5EZsbmKgRQ4QnPZvC3mJ/hmWWb2lDFMa2/m4vcbfXCB2+gIzlq1RNY0B0gDA==
X-Received: by 2002:a05:6214:a03:: with SMTP id
 dw3mr8534258qvb.44.1602175172573; 
 Thu, 08 Oct 2020 09:39:32 -0700 (PDT)
Received: from Whitewolf.lyude.net
 (pool-108-49-102-102.bstnma.fios.verizon.net. [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id c1sm4534743qta.86.2020.10.08.09.39.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Oct 2020 09:39:31 -0700 (PDT)
Message-ID: <c06193df9273fb396bdb40e73aed64197ba3b01d.camel@redhat.com>
Subject: Re: [PATCH 1/2] drm/i915/dpcd_bl: Skip testing control capability
 with force DPCD quirk
From: Lyude Paul <lyude@redhat.com>
To: Kai-Heng Feng <kai.heng.feng@canonical.com>
Date: Thu, 08 Oct 2020 12:39:30 -0400
In-Reply-To: <D18BA369-25A0-4D5E-A171-9EACF7DC950B@canonical.com>
References: <20201007065915.13883-1-kai.heng.feng@canonical.com>
 <268f495fbb7e3042eb613398a8513a83d28d3fd9.camel@redhat.com>
 <D18BA369-25A0-4D5E-A171-9EACF7DC950B@canonical.com>
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
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Satadru Pramanik <satadru@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 2020-10-08 at 10:32 +0800, Kai-Heng Feng wrote:
> Hi Lyude,
> 
> > On Oct 8, 2020, at 05:53, Lyude Paul <lyude@redhat.com> wrote:
> > 
> > Hi! I thought this patch rang a bell, we actually already had some
> > discussion
> > about this since there's a couple of other systems this was causing issues
> > for.
> > Unfortunately it never seems like that patch got sent out. Satadru?
> > 
> > (if I don't hear back from them soon, I'll just send out a patch for this
> > myself)
> > 
> > JFYI - the proper fix here is to just drop the
> > DP_EDP_BACKLIGHT_BRIGHTNESS_PWM_PIN_CAP check from the code entirely. As
> > long as
> > the backlight supports AUX_SET_CAP, that should be enough for us to control
> > it.
> 
> Does the proper fix include dropping DP_QUIRK_FORCE_DPCD_BACKLIGHT entirely?\

Not yet - we need someone to help with reviewing my Intel HDR backlight
interface patches before we can drop that. I was just talking about dropping the
check where we don't enable the DPCD backlight if it claims to support
DP_EDP_BACKLIGHT_BRIGHTNESS_PWM_PIN_CAP

> 
> Kai-Heng
> 
> > 
> > On Wed, 2020-10-07 at 14:58 +0800, Kai-Heng Feng wrote:
> > > HP DreamColor panel needs to be controlled via AUX interface. However,
> > > it has both DP_EDP_BACKLIGHT_BRIGHTNESS_AUX_SET_CAP and
> > > DP_EDP_BACKLIGHT_BRIGHTNESS_PWM_PIN_CAP set, so it fails to pass
> > > intel_dp_aux_display_control_capable() test.
> > > 
> > > Skip the test if the panel has force DPCD quirk.
> > > 
> > > Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
> > > ---
> > > drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c | 10 ++++++----
> > > 1 file changed, 6 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> > > b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> > > index acbd7eb66cbe..acf2e1c65290 100644
> > > --- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> > > +++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> > > @@ -347,9 +347,13 @@ int intel_dp_aux_init_backlight_funcs(struct
> > > intel_connector *intel_connector)
> > > 	struct intel_panel *panel = &intel_connector->panel;
> > > 	struct intel_dp *intel_dp = enc_to_intel_dp(intel_connector->encoder);
> > > 	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
> > > +	bool force_dpcd;
> > > +
> > > +	force_dpcd = drm_dp_has_quirk(&intel_dp->desc, intel_dp->edid_quirks,
> > > +				      DP_QUIRK_FORCE_DPCD_BACKLIGHT);
> > > 
> > > 	if (i915->params.enable_dpcd_backlight == 0 ||
> > > -	    !intel_dp_aux_display_control_capable(intel_connector))
> > > +	    (!force_dpcd &&
> > > !intel_dp_aux_display_control_capable(intel_connector)))
> > > 		return -ENODEV;
> > > 
> > > 	/*
> > > @@ -358,9 +362,7 @@ int intel_dp_aux_init_backlight_funcs(struct
> > > intel_connector *intel_connector)
> > > 	 */
> > > 	if (i915->vbt.backlight.type !=
> > > 	    INTEL_BACKLIGHT_VESA_EDP_AUX_INTERFACE &&
> > > -	    i915->params.enable_dpcd_backlight != 1 &&
> > > -	    !drm_dp_has_quirk(&intel_dp->desc, intel_dp->edid_quirks,
> > > -			      DP_QUIRK_FORCE_DPCD_BACKLIGHT)) {
> > > +	    i915->params.enable_dpcd_backlight != 1 && !force_dpcd) {
> > > 		drm_info(&i915->drm,
> > > 			 "Panel advertises DPCD backlight support, but "
> > > 			 "VBT disagrees. If your backlight controls "
> > -- 
> > Sincerely,
> >      Lyude Paul (she/her)
> >      Software Engineer at Red Hat
-- 
Sincerely,
      Lyude Paul (she/her)
      Software Engineer at Red Hat

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
