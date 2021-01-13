Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 277872F522E
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jan 2021 19:34:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E39DB6E87B;
	Wed, 13 Jan 2021 18:34:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CCCE6E87B
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 18:34:24 +0000 (UTC)
Received: by mail-io1-xd35.google.com with SMTP id d9so6127050iob.6
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 10:34:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qhXeNXqf2nMW0tbzQsPH52fdTd1onMoGx9oO3h73os4=;
 b=B2wT3tlGRwcelcolq1Q8J06eDkdxigC7WRDZOJmG/xp4r3y1QVhTux4m+iVfzLKpnX
 rFQq1WjtLenDC/NAXYI9ll63bjEQsuflSB5xneaOHeR6SmlnD2YOoRn7ohfYJ+R+Qrr/
 ht6L4Eor9A7M9ULMMQYCPUgkLyQpwQPiBS2rlv+x6ynQJlvnsHkkEI/RJSO0GO4XYeIk
 ufgfaMbNMZ1a7rSfBOGp7AKnOX8ZS0iqeTDLQ9QxmDk5L93whve4ggaooFqI+Bu9QkPa
 lfgVOWyNFGvlzWByQH0B3L4mYu3+XJqO+FJsSdzPICkBCnOD517MI4NXRqDrL2DfVEn2
 d3Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qhXeNXqf2nMW0tbzQsPH52fdTd1onMoGx9oO3h73os4=;
 b=ePSjkWwNTs+RedVaN6R4CS55ZvL5is4w1qjLsHfqB+C6GCOVGFaXPt0r56o9Uy2kJV
 w/4SlsRU/LIuvNX7YMRAX5Kcs2MC0a4UQXgjeC35iBcDHCZBFV0zi31UNyP54xH4tYSx
 DwGRgOlNLnWSIH86Pvt31rKusvJkWspCLDj7wrWrnB7FaskHLV2vndwbc79hp/ML4FAq
 /xfxXs0cGvneRoTpZ4B9QdtlbiI7E8zr+W2rDmLQcOSz87JwCHPzbTLiat6/sHOvm5iF
 Nw1TzzHVH4c8Li3VdH14F3N9GsNBbLbsIJyEG5kfQoeATk+IFuSEN+e88o+TWn50gEyp
 EQsg==
X-Gm-Message-State: AOAM531e2iXpyQdwjjL4swOR0/lV/U9ZoK3t49Xtvdxi+dZVmn9F12Ea
 P/gxFluh4WBLt8jtkf2TEuQoKGQKS1+U5v7oCRdZ3Q==
X-Google-Smtp-Source: ABdhPJy7qyGj/zlNnpZyeNdVFN6leh4pzdesUK2e2gGhsm0EEV0AXidhSEtaHxhj8ZHlnhlhvFWQHV6zBEJDiDXCVDs=
X-Received: by 2002:a92:77c9:: with SMTP id s192mr3420021ilc.75.1610562863782; 
 Wed, 13 Jan 2021 10:34:23 -0800 (PST)
MIME-Version: 1.0
References: <20210106223909.34476-1-sean@poorly.run>
 <20210113101942.GK11717@intel.com>
 <CAMavQKLzGR2j2UJXymNrhy3Yp4ssKC=-J87ak4=8aUKn3vdB2A@mail.gmail.com>
 <CAKMK7uEdLsaNqArT+x4V8YqtoAT0ue7gOf5Lsa6259QEDr0VCw@mail.gmail.com>
In-Reply-To: <CAKMK7uEdLsaNqArT+x4V8YqtoAT0ue7gOf5Lsa6259QEDr0VCw@mail.gmail.com>
From: Sean Paul <sean@poorly.run>
Date: Wed, 13 Jan 2021 13:33:47 -0500
Message-ID: <CAMavQKKHKaWnGOg_dRZ-nYO1GrhEjYT8sxxcFwXpcD0Aym0APQ@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915/hdcp: Disable the QSES check for
 HDCP 1.4 over MST
To: Daniel Vetter <daniel@ffwll.ch>
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
Cc: David Airlie <airlied@linux.ie>, Anshuman Gupta <anshuman.gupta@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 Sean Paul <seanpaul@chromium.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 13, 2021 at 9:31 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Wed, Jan 13, 2021 at 2:39 PM Sean Paul <sean@poorly.run> wrote:
> >
> > On Wed, Jan 13, 2021 at 5:34 AM Anshuman Gupta <anshuman.gupta@intel.com> wrote:
> > >
> > > On 2021-01-07 at 04:08:58 +0530, Sean Paul wrote:
> > > > From: Sean Paul <seanpaul@chromium.org>
> > > >
> > > > The HDCP 1.4 spec does not require the QUERY_STREAM_ENCRYPTION_STATUS
> > > IMHO DP 1.4 vesa specs I.3.5 mark QSES as desirale for both HDCP 1.4 and HDCP 2.2.
> > > "The MST Source device may use a QUERY_STREAM_ENCRYPTION_STATUS message
> > > transaction to query the downstream status for a particular stream."
> > >
> > > I feel it useful for scenario in which a non hdcp supported monitor
> > > is hot plugged to MST branch. Source really doesn't know about the hdcp
> > > capable device on MST branch, it just know the capability of immediate
> > > downstream device. QSES can fetch the HDCP capability from MST topology.
> > > We don't require to enable stream encryption for such streams.
> >
> > I agree it's useful when it works, but unfortunately it's broken on at
> > least 2 MST bridge chips I've encountered :/
> >
> > Until we can figure out a) how to fix them (ie: firmware updates), or
> > b) how to enumerate all of the broken chips to create quirks, we
> > probably just want to disable QSES for HDCP 1.4.
>
> What happens when the user plugs in a non-hdcp screen into a hub which
> doesn't do QSES? Just black screen?
>

Good question, thanks for forcing me to explain myself more thoroughly :)

This patch doesn't change that behavior, QSES is currently only used
as a means for verifying the stream continues to be encrypted in
steady-state (ie: after auth has already completed and the pixels are
flowing).

If one wanted to check HDCP 1.4 capability upfront, QSES wouldn't be
the way to do it. Instead you would tunnel a remote DPCD to the sink
to read the BCAPS register (ie: the same way we check non-MST
connectors).

So QSES is currently only around in HDCP 1.4 as an extra precaution
against a bug in the code preventing the MST stream from being
encrypted. IMO broken HW overrules suspenders when we already have a
belt :)


Sean

> That would suck a bit, otoh with broken hw I don't see how we could do
> better :-/
> -Daniel
>
> > Sean
> >
> > > > check, it was always a nice-to-have. After deploying this across various
> > > > devices, we've determined that some MST bridge chips do not properly
> > > > support this call for HDCP 1.4 (namely Synaptics and Realtek).
> > > >
> > > > I had considered creating a quirk for this, but I think it's more
> > > > prudent to just disable the check entirely since I don't have an idea
> > > > how widespread support is.
> > > May be we can remove it from the link check and can retain as utility ?
> > > Thanks,
> > > Anshuman Gupta.
> > > >
> > > > Signed-off-by: Sean Paul <seanpaul@chromium.org>
> > > > ---
> > > >  drivers/gpu/drm/i915/display/intel_dp_hdcp.c | 26 +-------------------
> > > >  1 file changed, 1 insertion(+), 25 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/i915/display/intel_dp_hdcp.c b/drivers/gpu/drm/i915/display/intel_dp_hdcp.c
> > > > index 03424d20e9f7..b6a9606bf09a 100644
> > > > --- a/drivers/gpu/drm/i915/display/intel_dp_hdcp.c
> > > > +++ b/drivers/gpu/drm/i915/display/intel_dp_hdcp.c
> > > > @@ -640,30 +640,6 @@ intel_dp_mst_hdcp_toggle_signalling(struct intel_digital_port *dig_port,
> > > >       return ret;
> > > >  }
> > > >
> > > > -static
> > > > -bool intel_dp_mst_hdcp_check_link(struct intel_digital_port *dig_port,
> > > > -                               struct intel_connector *connector)
> > > > -{
> > > > -     struct drm_i915_private *i915 = to_i915(dig_port->base.base.dev);
> > > > -     struct intel_dp *intel_dp = &dig_port->dp;
> > > > -     struct drm_dp_query_stream_enc_status_ack_reply reply;
> > > > -     int ret;
> > > > -
> > > > -     if (!intel_dp_hdcp_check_link(dig_port, connector))
> > > > -             return false;
> > > > -
> > > > -     ret = drm_dp_send_query_stream_enc_status(&intel_dp->mst_mgr,
> > > > -                                               connector->port, &reply);
> > > > -     if (ret) {
> > > > -             drm_dbg_kms(&i915->drm,
> > > > -                         "[CONNECTOR:%d:%s] failed QSES ret=%d\n",
> > > > -                         connector->base.base.id, connector->base.name, ret);
> > > > -             return false;
> > > > -     }
> > > > -
> > > > -     return reply.auth_completed && reply.encryption_enabled;
> > > > -}
> > > > -
> > > >  static const struct intel_hdcp_shim intel_dp_mst_hdcp_shim = {
> > > >       .write_an_aksv = intel_dp_hdcp_write_an_aksv,
> > > >       .read_bksv = intel_dp_hdcp_read_bksv,
> > > > @@ -674,7 +650,7 @@ static const struct intel_hdcp_shim intel_dp_mst_hdcp_shim = {
> > > >       .read_ksv_fifo = intel_dp_hdcp_read_ksv_fifo,
> > > >       .read_v_prime_part = intel_dp_hdcp_read_v_prime_part,
> > > >       .toggle_signalling = intel_dp_mst_hdcp_toggle_signalling,
> > > > -     .check_link = intel_dp_mst_hdcp_check_link,
> > > > +     .check_link = intel_dp_hdcp_check_link,
> > > >       .hdcp_capable = intel_dp_hdcp_capable,
> > > >
> > > >       .protocol = HDCP_PROTOCOL_DP,
> > > > --
> > > > Sean Paul, Software Engineer, Google / Chromium OS
> > > >
> > > > _______________________________________________
> > > > Intel-gfx mailing list
> > > > Intel-gfx@lists.freedesktop.org
> > > > https://lists.freedesktop.org/mailman/listinfo/intel-gfx
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
>
>
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
