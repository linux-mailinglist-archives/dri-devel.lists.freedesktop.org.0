Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76F702F5441
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jan 2021 21:45:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 295448937C;
	Wed, 13 Jan 2021 20:45:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com
 [IPv6:2607:f8b0:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4CEE8969E
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 20:45:16 +0000 (UTC)
Received: by mail-ot1-x32d.google.com with SMTP id x13so3189111oto.8
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 12:45:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Gvszt2TWPNaxvu6gsAnMPJ6ZlJGfT4pNVauZ0SgNiIQ=;
 b=a8jPzXXDQc0VZF0QP17rW+NxKbU7uYNaX7JJvgGdDnrxNDu78gUQ9v5U6buCTwPbPc
 A75z6BX4xEQZiuV1SOE35Xqsz1mPYmVv8UEfuk/HW9pCfyem+uIB59iSbdKSolUZuFl8
 BfNU1zMsvU1aC9saE3w/iMx7klkA/d29nCECk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Gvszt2TWPNaxvu6gsAnMPJ6ZlJGfT4pNVauZ0SgNiIQ=;
 b=AMsQMUP+AWrgMRNHhXjikonlDx4rvchdLAL17n2o7HdgHSIenvx7myC+1crLr5LMZe
 Kyn8HWXojUepQ2F/5y43xxLqpuWntf7h8rr9ixWmbePDUjSIkuRAxwpSBuyj76fAzy/I
 WGUlwHCIfG6XM0ougG66V3/zpZ6VyunQ+oK9Sc8waMy8SpP4TkgOtD9HxKN14DO83u28
 4tStwcO0eZAPLkkS5OXJ6PTY+7rcjHW6H3GdRI9YPVoBNUi0OR8a7ZyT82TCHRYzIn5a
 NUnk4hoUqKzDVHGSl363Xe5NkLBhxaUGPSVSHHh0ZYxArgCszm4q2gWS1qTmUr6exfBn
 XIEg==
X-Gm-Message-State: AOAM5306p467uC3orJG3JYdba7sNgEpT1vhOmzH3SB9GYc9tBP3zKKb4
 ZRKO3hlCkjgZqLg/rtTOYz/WbqiPXVZ3aKYnhWQnww==
X-Google-Smtp-Source: ABdhPJxaVGHSU0unZLHaHc449PmO5Zck/f4cDbJYR+LVUaglMzsKaoqXdxCmon/6WtI8nSV7Ad3T7tsDJkAkM6GggZ0=
X-Received: by 2002:a9d:ea6:: with SMTP id 35mr2422936otj.188.1610570715994;
 Wed, 13 Jan 2021 12:45:15 -0800 (PST)
MIME-Version: 1.0
References: <20210106223909.34476-1-sean@poorly.run>
 <20210113101942.GK11717@intel.com>
 <CAMavQKLzGR2j2UJXymNrhy3Yp4ssKC=-J87ak4=8aUKn3vdB2A@mail.gmail.com>
 <CAKMK7uEdLsaNqArT+x4V8YqtoAT0ue7gOf5Lsa6259QEDr0VCw@mail.gmail.com>
 <CAMavQKKHKaWnGOg_dRZ-nYO1GrhEjYT8sxxcFwXpcD0Aym0APQ@mail.gmail.com>
In-Reply-To: <CAMavQKKHKaWnGOg_dRZ-nYO1GrhEjYT8sxxcFwXpcD0Aym0APQ@mail.gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 13 Jan 2021 21:45:05 +0100
Message-ID: <CAKMK7uH6_krnCkx=Qn1aR3vrr-EC-1ZZVX9USt5uiSpbc_UW-A@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915/hdcp: Disable the QSES check for
 HDCP 1.4 over MST
To: Sean Paul <sean@poorly.run>
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

On Wed, Jan 13, 2021 at 7:34 PM Sean Paul <sean@poorly.run> wrote:
>
> On Wed, Jan 13, 2021 at 9:31 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > On Wed, Jan 13, 2021 at 2:39 PM Sean Paul <sean@poorly.run> wrote:
> > >
> > > On Wed, Jan 13, 2021 at 5:34 AM Anshuman Gupta <anshuman.gupta@intel.com> wrote:
> > > >
> > > > On 2021-01-07 at 04:08:58 +0530, Sean Paul wrote:
> > > > > From: Sean Paul <seanpaul@chromium.org>
> > > > >
> > > > > The HDCP 1.4 spec does not require the QUERY_STREAM_ENCRYPTION_STATUS
> > > > IMHO DP 1.4 vesa specs I.3.5 mark QSES as desirale for both HDCP 1.4 and HDCP 2.2.
> > > > "The MST Source device may use a QUERY_STREAM_ENCRYPTION_STATUS message
> > > > transaction to query the downstream status for a particular stream."
> > > >
> > > > I feel it useful for scenario in which a non hdcp supported monitor
> > > > is hot plugged to MST branch. Source really doesn't know about the hdcp
> > > > capable device on MST branch, it just know the capability of immediate
> > > > downstream device. QSES can fetch the HDCP capability from MST topology.
> > > > We don't require to enable stream encryption for such streams.
> > >
> > > I agree it's useful when it works, but unfortunately it's broken on at
> > > least 2 MST bridge chips I've encountered :/
> > >
> > > Until we can figure out a) how to fix them (ie: firmware updates), or
> > > b) how to enumerate all of the broken chips to create quirks, we
> > > probably just want to disable QSES for HDCP 1.4.
> >
> > What happens when the user plugs in a non-hdcp screen into a hub which
> > doesn't do QSES? Just black screen?
> >
>
> Good question, thanks for forcing me to explain myself more thoroughly :)
>
> This patch doesn't change that behavior, QSES is currently only used
> as a means for verifying the stream continues to be encrypted in
> steady-state (ie: after auth has already completed and the pixels are
> flowing).
>
> If one wanted to check HDCP 1.4 capability upfront, QSES wouldn't be
> the way to do it. Instead you would tunnel a remote DPCD to the sink
> to read the BCAPS register (ie: the same way we check non-MST
> connectors).
>
> So QSES is currently only around in HDCP 1.4 as an extra precaution
> against a bug in the code preventing the MST stream from being
> encrypted. IMO broken HW overrules suspenders when we already have a
> belt :)

I think with the above explanation added to the commit message this
makes sense to merge. Fwiw, i.e. not much: Acked-by: Daniel Vetter
<daniel.vetter@ffwll.ch>

Cheers, Daniel

>
>
> Sean
>
> > That would suck a bit, otoh with broken hw I don't see how we could do
> > better :-/
> > -Daniel
> >
> > > Sean
> > >
> > > > > check, it was always a nice-to-have. After deploying this across various
> > > > > devices, we've determined that some MST bridge chips do not properly
> > > > > support this call for HDCP 1.4 (namely Synaptics and Realtek).
> > > > >
> > > > > I had considered creating a quirk for this, but I think it's more
> > > > > prudent to just disable the check entirely since I don't have an idea
> > > > > how widespread support is.
> > > > May be we can remove it from the link check and can retain as utility ?
> > > > Thanks,
> > > > Anshuman Gupta.
> > > > >
> > > > > Signed-off-by: Sean Paul <seanpaul@chromium.org>
> > > > > ---
> > > > >  drivers/gpu/drm/i915/display/intel_dp_hdcp.c | 26 +-------------------
> > > > >  1 file changed, 1 insertion(+), 25 deletions(-)
> > > > >
> > > > > diff --git a/drivers/gpu/drm/i915/display/intel_dp_hdcp.c b/drivers/gpu/drm/i915/display/intel_dp_hdcp.c
> > > > > index 03424d20e9f7..b6a9606bf09a 100644
> > > > > --- a/drivers/gpu/drm/i915/display/intel_dp_hdcp.c
> > > > > +++ b/drivers/gpu/drm/i915/display/intel_dp_hdcp.c
> > > > > @@ -640,30 +640,6 @@ intel_dp_mst_hdcp_toggle_signalling(struct intel_digital_port *dig_port,
> > > > >       return ret;
> > > > >  }
> > > > >
> > > > > -static
> > > > > -bool intel_dp_mst_hdcp_check_link(struct intel_digital_port *dig_port,
> > > > > -                               struct intel_connector *connector)
> > > > > -{
> > > > > -     struct drm_i915_private *i915 = to_i915(dig_port->base.base.dev);
> > > > > -     struct intel_dp *intel_dp = &dig_port->dp;
> > > > > -     struct drm_dp_query_stream_enc_status_ack_reply reply;
> > > > > -     int ret;
> > > > > -
> > > > > -     if (!intel_dp_hdcp_check_link(dig_port, connector))
> > > > > -             return false;
> > > > > -
> > > > > -     ret = drm_dp_send_query_stream_enc_status(&intel_dp->mst_mgr,
> > > > > -                                               connector->port, &reply);
> > > > > -     if (ret) {
> > > > > -             drm_dbg_kms(&i915->drm,
> > > > > -                         "[CONNECTOR:%d:%s] failed QSES ret=%d\n",
> > > > > -                         connector->base.base.id, connector->base.name, ret);
> > > > > -             return false;
> > > > > -     }
> > > > > -
> > > > > -     return reply.auth_completed && reply.encryption_enabled;
> > > > > -}
> > > > > -
> > > > >  static const struct intel_hdcp_shim intel_dp_mst_hdcp_shim = {
> > > > >       .write_an_aksv = intel_dp_hdcp_write_an_aksv,
> > > > >       .read_bksv = intel_dp_hdcp_read_bksv,
> > > > > @@ -674,7 +650,7 @@ static const struct intel_hdcp_shim intel_dp_mst_hdcp_shim = {
> > > > >       .read_ksv_fifo = intel_dp_hdcp_read_ksv_fifo,
> > > > >       .read_v_prime_part = intel_dp_hdcp_read_v_prime_part,
> > > > >       .toggle_signalling = intel_dp_mst_hdcp_toggle_signalling,
> > > > > -     .check_link = intel_dp_mst_hdcp_check_link,
> > > > > +     .check_link = intel_dp_hdcp_check_link,
> > > > >       .hdcp_capable = intel_dp_hdcp_capable,
> > > > >
> > > > >       .protocol = HDCP_PROTOCOL_DP,
> > > > > --
> > > > > Sean Paul, Software Engineer, Google / Chromium OS
> > > > >
> > > > > _______________________________________________
> > > > > Intel-gfx mailing list
> > > > > Intel-gfx@lists.freedesktop.org
> > > > > https://lists.freedesktop.org/mailman/listinfo/intel-gfx
> > > _______________________________________________
> > > dri-devel mailing list
> > > dri-devel@lists.freedesktop.org
> > > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> >
> >
> >
> > --
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
