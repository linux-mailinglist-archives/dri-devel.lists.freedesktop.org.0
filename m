Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15503241F37
	for <lists+dri-devel@lfdr.de>; Tue, 11 Aug 2020 19:29:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D06696E59B;
	Tue, 11 Aug 2020 17:29:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x144.google.com (mail-il1-x144.google.com
 [IPv6:2607:f8b0:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C5A16E5C6
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Aug 2020 17:29:23 +0000 (UTC)
Received: by mail-il1-x144.google.com with SMTP id x1so11395977ilp.7
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Aug 2020 10:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jEWTqD7NMeg1lIMQkCX7JW5h25xhpQXkCLD4dpk70x4=;
 b=Hm4yuC1XnCbaTg6zCif50fDI17Pes/AkEfL1oUKZ5MOzhlhTLJ4FQSjhrAJb4uHMyh
 9kj6hncmmXW3rZ5p23wnPa8B8kzWItGReY4sy4PLN8PyfO7seMKAeBolY6B15U3pu+BV
 PovcADs2gOZWvKG8SG2o+V8JxeNiG25o0KwKm1vQx6hpCzphDd67R1YEnILjttU1QnVK
 rc8M7mNaTEbRckxXwdP9bWDoX1s8klU73/KfNavcTQleR0uwM/D7Oo5tBnX6oxIOVFFU
 UYy+iFmo3nnPd8EuZAxeOGPnZR/fNWJZoPCANWmBR5910suggW1gDf4zYjbBSYulm5yZ
 PwWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jEWTqD7NMeg1lIMQkCX7JW5h25xhpQXkCLD4dpk70x4=;
 b=Np6VnzhpQtgHI9cmPS0NRFIeEaavWE/z+0n19AHasOgndY4OnU+jpaEw1QLMStOuHw
 XHGatwOpFkEPu1DkCvVwfM1B2oP5NSoRmNSeCoCL4qBmdPCuXGYYDcKw0RF/QvV9jzgV
 6rzForIey47cre+8nIvWR4uQ8gHW8AEkgIqgMt3iLm3KmpgPatjmrQfjkJyRVSbS9YQF
 WMyxXT3xYMQxsXoCeQT9wQlSu8yvyE9k7+KrBbZXNmbKoSdHdhdX/gN7LwdGumAk/xwr
 rCRPx9R8Ei7OodcyG/evCUmEKEyK1u3LLzPFNsFMZ/k1yl+ME+jJH+tDjc3m5vcdxgMe
 4fuA==
X-Gm-Message-State: AOAM531H0C6ZXsb3K8r3ukR/rFZc0D+gO0pngKishuvhK65oZ6IRWDBx
 N7EurghmSvdDVJNO6i//M8HSK/PORRF3pbuyZoGd9w==
X-Google-Smtp-Source: ABdhPJxKC7Y2Rdma8Ns4EL+ec/9V3jM09Tvt30OldN0iGOCet7zfZABSCqdbku92zZUu2UQEURLZrKLjtYX+NXKF29o=
X-Received: by 2002:a92:c74b:: with SMTP id y11mr10857060ilp.264.1597166962662; 
 Tue, 11 Aug 2020 10:29:22 -0700 (PDT)
MIME-Version: 1.0
References: <20200623155907.22961-1-sean@poorly.run>
 <20200623155907.22961-18-sean@poorly.run>
 <20200709103712.GD13481@intel.com> <20200709122845.GP15183@intel.com>
In-Reply-To: <20200709122845.GP15183@intel.com>
From: Sean Paul <sean@poorly.run>
Date: Tue, 11 Aug 2020 13:28:46 -0400
Message-ID: <CAMavQKKFL11e6cCmQaVkyUgRsAst_F5=mwNf3q86qrmXWhvp5Q@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH v7 17/17] drm/i915: Add HDCP 1.4 support for
 MST connectors
To: Anshuman Gupta <anshuman.gupta@intel.com>
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 Sean Paul <seanpaul@chromium.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "daniel.vetter@ffwll.ch" <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 9, 2020 at 8:40 AM Anshuman Gupta <anshuman.gupta@intel.com> wrote:
>

\snip

> > > +static int
> > > +intel_dp_mst_hdcp_toggle_signalling(struct intel_digital_port *intel_dig_port,
> > > +                               enum transcoder cpu_transcoder,
> > > +                               bool enable)
> > > +{
> > > +   struct drm_i915_private *i915 = to_i915(intel_dig_port->base.base.dev);
> > > +   int ret;
> > > +
> > > +   if (!enable)
> > > +           usleep_range(6, 60); /* Bspec says >= 6us */
> > > +
> > > +   ret = intel_ddi_toggle_hdcp_signalling(&intel_dig_port->base,
> > > +                                          cpu_transcoder, enable);
> > Sean,
> >
> > This function toggles the TRANS_DDI_HDCP_SIGNALLING (9th)bit of TRANS_DDI_FUNC_CTL(tran)
> > But in the hw specification this bit is mentioned to be ignored for non
> > HDMI/DVI modes of the TRANS DDI.
> >
> > Any reason why we need this? Did you try with out this function?
> >

Under "Authentication Part 1 for Multi-stream DisplayPort", bspec says:
2. Select HDCP for the desired stream using the Pipe DDI Function
Control register.

> > Apart from that Patch looks good to me.
> IMHO it seems we are still missing to enable the Multistream HDCP Select
> bit (5) in TRANS_DDI_FUNC_CTL register which is required to enable the
> stream encryption.
>

Could you send me some docs on this? I don't see have info on this bit.

Sean

> Thanks,
> Anshuman Gupta.
> >
> > -Ram
> >
> > > +   if (ret)
> > > +           drm_dbg_kms(&i915->drm, "%s HDCP signalling failed (%d)\n",
> > > +                         enable ? "Enable" : "Disable", ret);
> > > +   return ret;
> > > +}
> > > +
> > > +static
> > > +bool intel_dp_mst_hdcp_check_link(struct intel_digital_port *intel_dig_port,
> > > +                             struct intel_connector *connector)
> > > +{
> > > +   struct drm_i915_private *i915 = to_i915(intel_dig_port->base.base.dev);
> > > +   struct intel_dp *intel_dp = &intel_dig_port->dp;
> > > +   struct drm_dp_query_stream_enc_status_ack_reply reply;
> > > +   int ret;
> > > +
> > > +   if (!intel_dp_hdcp_check_link(intel_dig_port, connector))
> > > +           return false;
> > > +
> > > +   ret = drm_dp_send_query_stream_enc_status(&intel_dp->mst_mgr,
> > > +                                             connector->port, &reply);
> > > +   if (ret) {
> > > +           drm_dbg_kms(&i915->drm,
> > > +                       "[CONNECTOR:%d:%s] failed QSES ret=%d\n",
> > > +                       connector->base.base.id, connector->base.name, ret);
> > > +           return false;
> > > +   }
> > > +
> > > +   return reply.auth_completed && reply.encryption_enabled;
> > > +}
> > > +
> > > +static const struct intel_hdcp_shim intel_dp_mst_hdcp_shim = {
> > > +   .write_an_aksv = intel_dp_hdcp_write_an_aksv,
> > > +   .read_bksv = intel_dp_hdcp_read_bksv,
> > > +   .read_bstatus = intel_dp_hdcp_read_bstatus,
> > > +   .repeater_present = intel_dp_hdcp_repeater_present,
> > > +   .read_ri_prime = intel_dp_hdcp_read_ri_prime,
> > > +   .read_ksv_ready = intel_dp_hdcp_read_ksv_ready,
> > > +   .read_ksv_fifo = intel_dp_hdcp_read_ksv_fifo,
> > > +   .read_v_prime_part = intel_dp_hdcp_read_v_prime_part,
> > > +   .toggle_signalling = intel_dp_mst_hdcp_toggle_signalling,
> > > +   .check_link = intel_dp_mst_hdcp_check_link,
> > > +   .hdcp_capable = intel_dp_hdcp_capable,
> > > +
> > > +   .protocol = HDCP_PROTOCOL_DP,
> > > +};
> > > +
> > >  int intel_dp_init_hdcp(struct intel_digital_port *intel_dig_port,
> > >                    struct intel_connector *intel_connector)
> > >  {
> > > @@ -630,7 +691,10 @@ int intel_dp_init_hdcp(struct intel_digital_port *intel_dig_port,
> > >     if (!is_hdcp_supported(dev_priv, port))
> > >             return 0;
> > >
> > > -   if (!intel_dp_is_edp(intel_dp))
> > > +   if (intel_connector->mst_port)
> > > +           return intel_hdcp_init(intel_connector, port,
> > > +                                  &intel_dp_mst_hdcp_shim);
> > > +   else if (!intel_dp_is_edp(intel_dp))
> > >             return intel_hdcp_init(intel_connector, port,
> > >                                    &intel_dp_hdcp_shim);
> > >
> > > diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> > > index 0675825dcc20..abaaeeb963d2 100644
> > > --- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> > > +++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> > > @@ -37,6 +37,7 @@
> > >  #include "intel_dp.h"
> > >  #include "intel_dp_mst.h"
> > >  #include "intel_dpio_phy.h"
> > > +#include "intel_hdcp.h"
> > >
> > >  static int intel_dp_mst_compute_link_config(struct intel_encoder *encoder,
> > >                                         struct intel_crtc_state *crtc_state,
> > > @@ -352,6 +353,8 @@ static void intel_mst_disable_dp(struct intel_atomic_state *state,
> > >     drm_dbg_kms(&i915->drm, "active links %d\n",
> > >                 intel_dp->active_mst_links);
> > >
> > > +   intel_hdcp_disable(intel_mst->connector);
> > > +
> > >     drm_dp_mst_reset_vcpi_slots(&intel_dp->mst_mgr, connector->port);
> > >
> > >     ret = drm_dp_update_payload_part1(&intel_dp->mst_mgr);
> > > @@ -548,6 +551,13 @@ static void intel_mst_enable_dp(struct intel_atomic_state *state,
> > >
> > >     if (pipe_config->has_audio)
> > >             intel_audio_codec_enable(encoder, pipe_config, conn_state);
> > > +
> > > +   /* Enable hdcp if it's desired */
> > > +   if (conn_state->content_protection ==
> > > +       DRM_MODE_CONTENT_PROTECTION_DESIRED)
> > > +           intel_hdcp_enable(to_intel_connector(conn_state->connector),
> > > +                             pipe_config->cpu_transcoder,
> > > +                             (u8)conn_state->hdcp_content_type);
> > >  }
> > >
> > >  static bool intel_dp_mst_enc_get_hw_state(struct intel_encoder *encoder,
> > > @@ -770,6 +780,14 @@ static struct drm_connector *intel_dp_add_mst_connector(struct drm_dp_mst_topolo
> > >     intel_attach_force_audio_property(connector);
> > >     intel_attach_broadcast_rgb_property(connector);
> > >
> > > +
> > > +   /* TODO: Figure out how to make HDCP work on GEN12+ */
> > > +   if (INTEL_GEN(dev_priv) < 12) {
> > > +           ret = intel_dp_init_hdcp(intel_dig_port, intel_connector);
> > > +           if (ret)
> > > +                   DRM_DEBUG_KMS("HDCP init failed, skipping.\n");
> > > +   }
> > > +
> > >     /*
> > >      * Reuse the prop from the SST connector because we're
> > >      * not allowed to create new props after device registration.
> > > diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c b/drivers/gpu/drm/i915/display/intel_hdcp.c
> > > index 6bd0e4616ee1..ddc9db8de2bc 100644
> > > --- a/drivers/gpu/drm/i915/display/intel_hdcp.c
> > > +++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
> > > @@ -2060,7 +2060,7 @@ int intel_hdcp_init(struct intel_connector *connector,
> > >     if (!shim)
> > >             return -EINVAL;
> > >
> > > -   if (is_hdcp2_supported(dev_priv))
> > > +   if (is_hdcp2_supported(dev_priv) && !connector->mst_port)
> > >             intel_hdcp2_init(connector, port, shim);
> > >
> > >     ret =
> > > --
> > > Sean Paul, Software Engineer, Google / Chromium OS
> > >
> > _______________________________________________
> > Intel-gfx mailing list
> > Intel-gfx@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/intel-gfx
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
