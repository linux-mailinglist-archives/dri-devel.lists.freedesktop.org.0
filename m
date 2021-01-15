Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB8E72F7688
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jan 2021 11:22:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A02686E1ED;
	Fri, 15 Jan 2021 10:22:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 989AC89D53;
 Fri, 15 Jan 2021 10:22:21 +0000 (UTC)
IronPort-SDR: gK3TGOjQRfSCkxYFXNlu4zLHVK4cvpPuh1ezkJ10qN8iix1wNOT5MP8vNHgl3pBUJsfAYdfTUF
 q29xS2odgjkA==
X-IronPort-AV: E=McAfee;i="6000,8403,9864"; a="240074942"
X-IronPort-AV: E=Sophos;i="5.79,349,1602572400"; d="scan'208";a="240074942"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2021 02:22:19 -0800
IronPort-SDR: XkDfk2BU6JIF/TvtvnqeHRuGqQFe9nuWqXrYhYYbPUb2PW7fMRqY+Iz73vtV6jBQI+QJedqTMT
 XVjkz3qdI6rQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,349,1602572400"; d="scan'208";a="349448238"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by orsmga003.jf.intel.com with ESMTP; 15 Jan 2021 02:22:19 -0800
Received: from bgsmsx601.gar.corp.intel.com (10.109.78.80) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 15 Jan 2021 02:22:18 -0800
Received: from bgsmsx604.gar.corp.intel.com (10.67.234.6) by
 BGSMSX601.gar.corp.intel.com (10.109.78.80) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 15 Jan 2021 15:52:16 +0530
Received: from bgsmsx604.gar.corp.intel.com ([10.67.234.6]) by
 BGSMSX604.gar.corp.intel.com ([10.67.234.6]) with mapi id 15.01.1713.004;
 Fri, 15 Jan 2021 15:52:16 +0530
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: Sean Paul <sean@poorly.run>, Daniel Vetter <daniel@ffwll.ch>
Subject: RE: [Intel-gfx] [PATCH] drm/i915/hdcp: Disable the QSES check for
 HDCP 1.4 over MST
Thread-Topic: [Intel-gfx] [PATCH] drm/i915/hdcp: Disable the QSES check for
 HDCP 1.4 over MST
Thread-Index: AQHW5HzMsSBMcezxD0exhULao/U+76olYj0A///bfgCAAA65AIAAQ6GAgALxIVA=
Date: Fri, 15 Jan 2021 10:22:16 +0000
Message-ID: <9d1fcd502e2a49f4a2a91d82a76a9e55@intel.com>
References: <20210106223909.34476-1-sean@poorly.run>
 <20210113101942.GK11717@intel.com>
 <CAMavQKLzGR2j2UJXymNrhy3Yp4ssKC=-J87ak4=8aUKn3vdB2A@mail.gmail.com>
 <CAKMK7uEdLsaNqArT+x4V8YqtoAT0ue7gOf5Lsa6259QEDr0VCw@mail.gmail.com>
 <CAMavQKKHKaWnGOg_dRZ-nYO1GrhEjYT8sxxcFwXpcD0Aym0APQ@mail.gmail.com>
In-Reply-To: <CAMavQKKHKaWnGOg_dRZ-nYO1GrhEjYT8sxxcFwXpcD0Aym0APQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.5.1.3
dlp-reaction: no-action
x-originating-ip: [10.223.10.1]
MIME-Version: 1.0
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
Cc: David Airlie <airlied@linux.ie>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 Sean Paul <seanpaul@chromium.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Sean Paul <sean@poorly.run>
> Sent: Thursday, January 14, 2021 12:04 AM
> To: Daniel Vetter <daniel@ffwll.ch>
> Cc: Gupta, Anshuman <anshuman.gupta@intel.com>; David Airlie
> <airlied@linux.ie>; intel-gfx@lists.freedesktop.org; Sean Paul
> <seanpaul@chromium.org>; dri-devel@lists.freedesktop.org
> Subject: Re: [Intel-gfx] [PATCH] drm/i915/hdcp: Disable the QSES check for
> HDCP 1.4 over MST
> 
> On Wed, Jan 13, 2021 at 9:31 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > On Wed, Jan 13, 2021 at 2:39 PM Sean Paul <sean@poorly.run> wrote:
> > >
> > > On Wed, Jan 13, 2021 at 5:34 AM Anshuman Gupta
> <anshuman.gupta@intel.com> wrote:
> > > >
> > > > On 2021-01-07 at 04:08:58 +0530, Sean Paul wrote:
> > > > > From: Sean Paul <seanpaul@chromium.org>
> > > > >
> > > > > The HDCP 1.4 spec does not require the
> > > > > QUERY_STREAM_ENCRYPTION_STATUS
> > > > IMHO DP 1.4 vesa specs I.3.5 mark QSES as desirale for both HDCP 1.4
> and HDCP 2.2.
> > > > "The MST Source device may use a
> QUERY_STREAM_ENCRYPTION_STATUS
> > > > message transaction to query the downstream status for a particular
> stream."
> > > >
> > > > I feel it useful for scenario in which a non hdcp supported
> > > > monitor is hot plugged to MST branch. Source really doesn't know
> > > > about the hdcp capable device on MST branch, it just know the
> > > > capability of immediate downstream device. QSES can fetch the HDCP
> capability from MST topology.
> > > > We don't require to enable stream encryption for such streams.
> > >
> > > I agree it's useful when it works, but unfortunately it's broken on
> > > at least 2 MST bridge chips I've encountered :/
> > >
> > > Until we can figure out a) how to fix them (ie: firmware updates),
> > > or
> > > b) how to enumerate all of the broken chips to create quirks, we
> > > probably just want to disable QSES for HDCP 1.4.
> >
> > What happens when the user plugs in a non-hdcp screen into a hub which
> > doesn't do QSES? Just black screen?
> >
> 
> Good question, thanks for forcing me to explain myself more thoroughly :)
> 
> This patch doesn't change that behavior, QSES is currently only used as a
> means for verifying the stream continues to be encrypted in steady-state
> (ie: after auth has already completed and the pixels are flowing).
> 
> If one wanted to check HDCP 1.4 capability upfront, QSES wouldn't be the
> way to do it. Instead you would tunnel a remote DPCD to the sink to read
> the BCAPS register (ie: the same way we check non-MST connectors).
AFAIK in case of MST topology source can only  get BCAPS/RXCAPS of the immediate downstream sink 
(in this particular case it will be BCAPS/RXCAPS of MST hub).
Ex. I have a HDCP 2.2 (DP-6 immediate downstream) and HDCP 1.4 (DP-7) connector setup in daisy chain setup, DP-7 just reports the RXCAPS of DP-6.
cat /sys/kernel/debug/dri/0/DP-7/i915_hdcp_sink_capability
DP-7:369 HDCP version: HDCP1.4 HDCP2.2
root@linux-Tiger-Lake-Client-Platform:/home/linux# dmesg
[180919.808209] [drm:drm_dp_dpcd_read] AUX B/DDI B/PHY B: 0x68028 AUX -> (ret=  1) 03
[180919.809089] [drm:drm_dp_dpcd_read] AUX B/DDI B/PHY B: 0x6921d AUX -> (ret=  3) 02 00 03 
I was planning to use QSES to query HDCP  in MST topology but now not sure what to do with not supported MST hubs.

However agree with you for this patch, it seems to disable the QSES link check the right thing to do.
It would require to rebase.
Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
  
> 
> So QSES is currently only around in HDCP 1.4 as an extra precaution against
> a bug in the code preventing the MST stream from being encrypted. IMO
> broken HW overrules suspenders when we already have a belt :)
> 
> 
> Sean
> 
> > That would suck a bit, otoh with broken hw I don't see how we could do
> > better :-/ -Daniel
> >
> > > Sean
> > >
> > > > > check, it was always a nice-to-have. After deploying this across
> > > > > various devices, we've determined that some MST bridge chips do
> > > > > not properly support this call for HDCP 1.4 (namely Synaptics and
> Realtek).
> > > > >
> > > > > I had considered creating a quirk for this, but I think it's
> > > > > more prudent to just disable the check entirely since I don't
> > > > > have an idea how widespread support is.
> > > > May be we can remove it from the link check and can retain as utility
> ?
> > > > Thanks,
> > > > Anshuman Gupta.
> > > > >
> > > > > Signed-off-by: Sean Paul <seanpaul@chromium.org>
> > > > > ---
> > > > >  drivers/gpu/drm/i915/display/intel_dp_hdcp.c | 26
> > > > > +-------------------
> > > > >  1 file changed, 1 insertion(+), 25 deletions(-)
> > > > >
> > > > > diff --git a/drivers/gpu/drm/i915/display/intel_dp_hdcp.c
> > > > > b/drivers/gpu/drm/i915/display/intel_dp_hdcp.c
> > > > > index 03424d20e9f7..b6a9606bf09a 100644
> > > > > --- a/drivers/gpu/drm/i915/display/intel_dp_hdcp.c
> > > > > +++ b/drivers/gpu/drm/i915/display/intel_dp_hdcp.c
> > > > > @@ -640,30 +640,6 @@
> intel_dp_mst_hdcp_toggle_signalling(struct intel_digital_port *dig_port,
> > > > >       return ret;
> > > > >  }
> > > > >
> > > > > -static
> > > > > -bool intel_dp_mst_hdcp_check_link(struct intel_digital_port
> *dig_port,
> > > > > -                               struct intel_connector *connector)
> > > > > -{
> > > > > -     struct drm_i915_private *i915 = to_i915(dig_port-
> >base.base.dev);
> > > > > -     struct intel_dp *intel_dp = &dig_port->dp;
> > > > > -     struct drm_dp_query_stream_enc_status_ack_reply reply;
> > > > > -     int ret;
> > > > > -
> > > > > -     if (!intel_dp_hdcp_check_link(dig_port, connector))
> > > > > -             return false;
> > > > > -
> > > > > -     ret = drm_dp_send_query_stream_enc_status(&intel_dp-
> >mst_mgr,
> > > > > -                                               connector->port, &reply);
> > > > > -     if (ret) {
> > > > > -             drm_dbg_kms(&i915->drm,
> > > > > -                         "[CONNECTOR:%d:%s] failed QSES ret=%d\n",
> > > > > -                         connector->base.base.id, connector->base.name,
> ret);
> > > > > -             return false;
> > > > > -     }
> > > > > -
> > > > > -     return reply.auth_completed && reply.encryption_enabled;
> > > > > -}
> > > > > -
> > > > >  static const struct intel_hdcp_shim intel_dp_mst_hdcp_shim = {
> > > > >       .write_an_aksv = intel_dp_hdcp_write_an_aksv,
> > > > >       .read_bksv = intel_dp_hdcp_read_bksv, @@ -674,7 +650,7 @@
> > > > > static const struct intel_hdcp_shim intel_dp_mst_hdcp_shim = {
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
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
