Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B2F4242DFE
	for <lists+dri-devel@lfdr.de>; Wed, 12 Aug 2020 19:22:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D78076E944;
	Wed, 12 Aug 2020 17:22:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E2856E944
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Aug 2020 17:22:29 +0000 (UTC)
Received: by mail-io1-xd44.google.com with SMTP id v6so3622254iow.11
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Aug 2020 10:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mZPjNu9BenQRo9fcnBdbhlzFtj5SUldP3dStFNB84mA=;
 b=CcIe/M1PZ+jTUOoiJWu6bW6DFrJPdoH+JuwCWRoCGPTCNT9uCYyqEVm9Cer5WRVTJM
 zfoJFgjosw+cnk3Z9ww2iLYId1KX6HHnrIaLRV15aawW+aRmHUzzdhwOf1DT38E13UMw
 8yTqMryuSERw9dQfOqBpl3JGaWVwNPwCaCpL/2dB+vDqjxCHP3J4or7gVhHUzqA4W310
 bHE2gSva3R6UsQL3hfgF3F9H05WZwdF513g2BqAlCNUs+mnvchOSlm1IHSSHES2l5BGw
 RA6FTt09jhJoU17YrwaFYQTs9tDB5uBQytCdkg20zeeWfRAe02H7dSAREayZqnDE+jng
 LKPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mZPjNu9BenQRo9fcnBdbhlzFtj5SUldP3dStFNB84mA=;
 b=XV8amP96lYe7yrfyZO0SWlEORXkBlw5DaMLoz+q+nxorp4s+smzyHRfbLs0qvCeYKq
 iniNpscZ75U772B8I9WdoN38uoz12Qy4R49j0aXs5chev2938dH8AlS1YAR2qBsMxGTZ
 SHqDZvszMdedvQZ/3f9e2Iicq/umh+OT8QICNJtEpAOnrZZHfGkQnTxGPEXbkQtkY6Ve
 cUnSrbfAnkabCKlFBz4F082rQVKZmlMjmBKdJLkh/7YYBl8jVrzyFJ1IDLgRbGCItn/W
 Cxb2OYBOMbZK47JmGwdka5BQonAp7nYQoJaMDtqyTQDaPvDVgXH/qf0UgGAy61GqLN+I
 UkEA==
X-Gm-Message-State: AOAM533w5JKkuXuy71OSR4CBegFAoOpzYrly/5v5rqBf+tU3HWIeS4DE
 /POFOQlqEKKVLDBPr1oADT7PyYK+3OCnm7U1npHrow==
X-Google-Smtp-Source: ABdhPJw0/UHV/I2yH7l3I7TO3RHo6D305RKvj7oh8BMOFGuh2GH1WoQ07niOemrv0W3JdIYhv80cxWpiO1vgKAbeU9Q=
X-Received: by 2002:a05:6602:2801:: with SMTP id
 d1mr772410ioe.201.1597252947670; 
 Wed, 12 Aug 2020 10:22:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200623155907.22961-1-sean@poorly.run>
 <20200623155907.22961-18-sean@poorly.run>
 <20200709103712.GD13481@intel.com> <20200709122845.GP15183@intel.com>
 <CAMavQKKFL11e6cCmQaVkyUgRsAst_F5=mwNf3q86qrmXWhvp5Q@mail.gmail.com>
 <20200812070322.GG30770@intel.com>
In-Reply-To: <20200812070322.GG30770@intel.com>
From: Sean Paul <sean@poorly.run>
Date: Wed, 12 Aug 2020 13:21:51 -0400
Message-ID: <CAMavQKKw23K4BgcGPeUj10rHQzHyuxCFK_5XhuEcktqOHSj1KQ@mail.gmail.com>
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

On Wed, Aug 12, 2020 at 3:15 AM Anshuman Gupta <anshuman.gupta@intel.com> wrote:
>
> On 2020-08-11 at 13:28:46 -0400, Sean Paul wrote:
> > On Thu, Jul 9, 2020 at 8:40 AM Anshuman Gupta <anshuman.gupta@intel.com> wrote:
> > >
> >
> > \snip
> >
> > > > > +static int
> > > > > +intel_dp_mst_hdcp_toggle_signalling(struct intel_digital_port *intel_dig_port,
> > > > > +                               enum transcoder cpu_transcoder,
> > > > > +                               bool enable)
> > > > > +{
> > > > > +   struct drm_i915_private *i915 = to_i915(intel_dig_port->base.base.dev);
> > > > > +   int ret;
> > > > > +
> > > > > +   if (!enable)
> > > > > +           usleep_range(6, 60); /* Bspec says >= 6us */
> > > > > +
> > > > > +   ret = intel_ddi_toggle_hdcp_signalling(&intel_dig_port->base,
> > > > > +                                          cpu_transcoder, enable);
> > > > Sean,
> > > >
> > > > This function toggles the TRANS_DDI_HDCP_SIGNALLING (9th)bit of TRANS_DDI_FUNC_CTL(tran)
> > > > But in the hw specification this bit is mentioned to be ignored for non
> > > > HDMI/DVI modes of the TRANS DDI.
> > > >
> > > > Any reason why we need this? Did you try with out this function?
> > > >
> >
> > Under "Authentication Part 1 for Multi-stream DisplayPort", bspec says:
> > 2. Select HDCP for the desired stream using the Pipe DDI Function
> > Control register.
> This is the 5th bit (Multistream HDCP Select) of Pipe DDI Function Control register i.e
> TRANS_DDI_FUNC_CTL register. This bit ensures HDCP encryption to this transcoder stream when used in
> multistream DisplayPort mode.
> Unfortunately public specs of Gen11 has discrepency and doesn't describe this bit.
> https://01.org/sites/default/files/documentation/intel-gfx-prm-osrc-icllp-vol02c-commandreference-registers-part2_0.pdf
> Page No.1026 TRANS_DDI_FUNC_CTL
> >
> > > > Apart from that Patch looks good to me.
> > > IMHO it seems we are still missing to enable the Multistream HDCP Select
> > > bit (5) in TRANS_DDI_FUNC_CTL register which is required to enable the
> > > stream encryption.
> > >
> >
> > Could you send me some docs on this? I don't see have info on this bit.
> This bit is not described in above mentioned public spec, but neither bit TRANS_DDI_HDCP_SIGNALLING bit (9th)
> which used in this patch, what is the source of public B.spec you are following?

I think it's been removed from public now, but there was a public doc
on Intel's site when I originally wrote these which described the
TRANS_DDI_FUNC_CTL register.

So do I just need to set bit 5 at the same time as the HDCP SIGNALLING bit?

Sean

> Thanks,
> Anshuman Gupta.
> >
> > Sean
> >
> > > Thanks,
> > > Anshuman Gupta.
> > > >
> > > > -Ram
> > > >
> > > > > +   if (ret)
> > > > > +           drm_dbg_kms(&i915->drm, "%s HDCP signalling failed (%d)\n",
> > > > > +                         enable ? "Enable" : "Disable", ret);
> > > > > +   return ret;
> > > > > +}
> > > > > +
> > > > > +static
> > > > > +bool intel_dp_mst_hdcp_check_link(struct intel_digital_port *intel_dig_port,
> > > > > +                             struct intel_connector *connector)
> > > > > +{
> > > > > +   struct drm_i915_private *i915 = to_i915(intel_dig_port->base.base.dev);
> > > > > +   struct intel_dp *intel_dp = &intel_dig_port->dp;
> > > > > +   struct drm_dp_query_stream_enc_status_ack_reply reply;
> > > > > +   int ret;
> > > > > +
> > > > > +   if (!intel_dp_hdcp_check_link(intel_dig_port, connector))
> > > > > +           return false;
> > > > > +
> > > > > +   ret = drm_dp_send_query_stream_enc_status(&intel_dp->mst_mgr,
> > > > > +                                             connector->port, &reply);
> > > > > +   if (ret) {
> > > > > +           drm_dbg_kms(&i915->drm,
> > > > > +                       "[CONNECTOR:%d:%s] failed QSES ret=%d\n",
> > > > > +                       connector->base.base.id, connector->base.name, ret);
> > > > > +           return false;
> > > > > +   }
> > > > > +
> > > > > +   return reply.auth_completed && reply.encryption_enabled;
> > > > > +}
> > > > > +
> > > > > +static const struct intel_hdcp_shim intel_dp_mst_hdcp_shim = {
> > > > > +   .write_an_aksv = intel_dp_hdcp_write_an_aksv,
> > > > > +   .read_bksv = intel_dp_hdcp_read_bksv,
> > > > > +   .read_bstatus = intel_dp_hdcp_read_bstatus,
> > > > > +   .repeater_present = intel_dp_hdcp_repeater_present,
> > > > > +   .read_ri_prime = intel_dp_hdcp_read_ri_prime,
> > > > > +   .read_ksv_ready = intel_dp_hdcp_read_ksv_ready,
> > > > > +   .read_ksv_fifo = intel_dp_hdcp_read_ksv_fifo,
> > > > > +   .read_v_prime_part = intel_dp_hdcp_read_v_prime_part,
> > > > > +   .toggle_signalling = intel_dp_mst_hdcp_toggle_signalling,
> > > > > +   .check_link = intel_dp_mst_hdcp_check_link,
> > > > > +   .hdcp_capable = intel_dp_hdcp_capable,
> > > > > +
> > > > > +   .protocol = HDCP_PROTOCOL_DP,
> > > > > +};
> > > > > +
> > > > >  int intel_dp_init_hdcp(struct intel_digital_port *intel_dig_port,
> > > > >                    struct intel_connector *intel_connector)
> > > > >  {
> > > > > @@ -630,7 +691,10 @@ int intel_dp_init_hdcp(struct intel_digital_port *intel_dig_port,
> > > > >     if (!is_hdcp_supported(dev_priv, port))
> > > > >             return 0;
> > > > >
> > > > > -   if (!intel_dp_is_edp(intel_dp))
> > > > > +   if (intel_connector->mst_port)
> > > > > +           return intel_hdcp_init(intel_connector, port,
> > > > > +                                  &intel_dp_mst_hdcp_shim);
> > > > > +   else if (!intel_dp_is_edp(intel_dp))
> > > > >             return intel_hdcp_init(intel_connector, port,
> > > > >                                    &intel_dp_hdcp_shim);
> > > > >
> > > > > diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> > > > > index 0675825dcc20..abaaeeb963d2 100644
> > > > > --- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> > > > > +++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> > > > > @@ -37,6 +37,7 @@
> > > > >  #include "intel_dp.h"
> > > > >  #include "intel_dp_mst.h"
> > > > >  #include "intel_dpio_phy.h"
> > > > > +#include "intel_hdcp.h"
> > > > >
> > > > >  static int intel_dp_mst_compute_link_config(struct intel_encoder *encoder,
> > > > >                                         struct intel_crtc_state *crtc_state,
> > > > > @@ -352,6 +353,8 @@ static void intel_mst_disable_dp(struct intel_atomic_state *state,
> > > > >     drm_dbg_kms(&i915->drm, "active links %d\n",
> > > > >                 intel_dp->active_mst_links);
> > > > >
> > > > > +   intel_hdcp_disable(intel_mst->connector);
> > > > > +
> > > > >     drm_dp_mst_reset_vcpi_slots(&intel_dp->mst_mgr, connector->port);
> > > > >
> > > > >     ret = drm_dp_update_payload_part1(&intel_dp->mst_mgr);
> > > > > @@ -548,6 +551,13 @@ static void intel_mst_enable_dp(struct intel_atomic_state *state,
> > > > >
> > > > >     if (pipe_config->has_audio)
> > > > >             intel_audio_codec_enable(encoder, pipe_config, conn_state);
> > > > > +
> > > > > +   /* Enable hdcp if it's desired */
> > > > > +   if (conn_state->content_protection ==
> > > > > +       DRM_MODE_CONTENT_PROTECTION_DESIRED)
> > > > > +           intel_hdcp_enable(to_intel_connector(conn_state->connector),
> > > > > +                             pipe_config->cpu_transcoder,
> > > > > +                             (u8)conn_state->hdcp_content_type);
> > > > >  }
> > > > >
> > > > >  static bool intel_dp_mst_enc_get_hw_state(struct intel_encoder *encoder,
> > > > > @@ -770,6 +780,14 @@ static struct drm_connector *intel_dp_add_mst_connector(struct drm_dp_mst_topolo
> > > > >     intel_attach_force_audio_property(connector);
> > > > >     intel_attach_broadcast_rgb_property(connector);
> > > > >
> > > > > +
> > > > > +   /* TODO: Figure out how to make HDCP work on GEN12+ */
> > > > > +   if (INTEL_GEN(dev_priv) < 12) {
> > > > > +           ret = intel_dp_init_hdcp(intel_dig_port, intel_connector);
> > > > > +           if (ret)
> > > > > +                   DRM_DEBUG_KMS("HDCP init failed, skipping.\n");
> > > > > +   }
> > > > > +
> > > > >     /*
> > > > >      * Reuse the prop from the SST connector because we're
> > > > >      * not allowed to create new props after device registration.
> > > > > diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c b/drivers/gpu/drm/i915/display/intel_hdcp.c
> > > > > index 6bd0e4616ee1..ddc9db8de2bc 100644
> > > > > --- a/drivers/gpu/drm/i915/display/intel_hdcp.c
> > > > > +++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
> > > > > @@ -2060,7 +2060,7 @@ int intel_hdcp_init(struct intel_connector *connector,
> > > > >     if (!shim)
> > > > >             return -EINVAL;
> > > > >
> > > > > -   if (is_hdcp2_supported(dev_priv))
> > > > > +   if (is_hdcp2_supported(dev_priv) && !connector->mst_port)
> > > > >             intel_hdcp2_init(connector, port, shim);
> > > > >
> > > > >     ret =
> > > > > --
> > > > > Sean Paul, Software Engineer, Google / Chromium OS
> > > > >
> > > > _______________________________________________
> > > > Intel-gfx mailing list
> > > > Intel-gfx@lists.freedesktop.org
> > > > https://lists.freedesktop.org/mailman/listinfo/intel-gfx
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
