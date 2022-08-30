Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 82B305A5F45
	for <lists+dri-devel@lfdr.de>; Tue, 30 Aug 2022 11:23:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D36E10E009;
	Tue, 30 Aug 2022 09:23:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E05410E009
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Aug 2022 09:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661851393; x=1693387393;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=kY0BovhO2LEAm+yy6FwRtQ6kQU+fSVeNyOk6qArzQiQ=;
 b=PEt7fQoJI9C+mZ+2Waf8xIyfZPXH2zZDZ8S/2S9q0GVlSdLg3u0U6Oen
 /YETu5tXixyc96zjDa9pmDwy5UQN2xgofoj5uDF1ttdtrdMe48cUHuPUE
 PDwY4IIgypD5N6QL54+3mlAnqbEO49gH2+4u/xgS/G8nRsOuhDmH2+xUq
 iOA0fnCqxWUgUwROjcM5Iq6tP9Gd1jLiAPTO3s4LzHtJunxoUcCgOkJ+q
 7vWGHlhssaAInJDGm4vGO0sAmk8F09x3cV8tVb3a/KuqiYSnsNWrWPEUH
 +OFeeCpfhlv7PgfA9f7Umb05WjzchGIT3FB5nS+wDl0r6VDDlTDH7RPj+ Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10454"; a="278146203"
X-IronPort-AV: E=Sophos;i="5.93,274,1654585200"; d="scan'208";a="278146203"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2022 02:23:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,274,1654585200"; d="scan'208";a="641299881"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.191])
 by orsmga008.jf.intel.com with SMTP; 30 Aug 2022 02:23:09 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 30 Aug 2022 12:23:09 +0300
Date: Tue, 30 Aug 2022 12:23:09 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Pekka Paalanen <ppaalanen@gmail.com>
Subject: Re: drm: document uAPI page-flip flags
Message-ID: <Yw3W/cH5Jp/EY8JU@intel.com>
References: <20220824174459.441976-1-contact@emersion.fr>
 <20220826115355.668e13ca@eldfell>
 <ASSNOUe9wtsXskZjVlf1X4pl53T7pVE0MfEzkQ_h4cX0tjnF7e3cxpwGpRNPudmIHoRuW4kz_v1AeTpXgouLpTYcI8q-lPTzc1YMLR8JiJM=@emersion.fr>
 <20220830111626.77307042@eldfell> <Yw3NQ2MmhJbsxV3h@intel.com>
 <20220830120050.1699a8da@eldfell>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220830120050.1699a8da@eldfell>
X-Patchwork-Hint: comment
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Aug 30, 2022 at 12:00:50PM +0300, Pekka Paalanen wrote:
> On Tue, 30 Aug 2022 11:41:39 +0300
> Ville Syrjälä <ville.syrjala@linux.intel.com> wrote:
> 
> > On Tue, Aug 30, 2022 at 11:16:26AM +0300, Pekka Paalanen wrote:
> 
> > > Hence, "has been displayed" is not it because the flip-done event is
> > > emitted before the new FB contents have been scanned out. That scanout
> > > cycle is only starting when the flip is done. The flip timestamp should
> > > correspond to the time when the first real pixel of the new FB hits the
> > > monitor cable.
> > > 
> > > A flip is done, when it is guaranteed that the next (or on-going, in
> > > case of tearing) scanout cycle will use the new FB, IOW the hardware
> > > programming has been done I believe.
> > > 
> > > If the flip is sync'd to vblank, the timestamp is as above, but the
> > > actual event might be emitted somewhat before or after the instant of
> > > the timestamp. Some drivers can predict the timestamp so can send the
> > > event early, others don't.
> > > 
> > > If the flip is tearing, then I'm not sure what the timestamp is or when
> > > the event is emitted.  
> > 
> > For i915 we emit the event when the hardware has indicated the
> > flip has completed (ie. it has really started scanout from the
> > new fb). After that you can safely reuse the old fb without
> > accidentally doing frontbuffer rendering. It takes a bit of
> > time (some smallish number of scanlines) for the hardware to
> > flush the FIFOs/TLBs/whatever.
> > 
> > And IIRC we just send the last sampled vblank timestamp for
> > the event. That is, the timestamp should look the same as
> > for a sync flip submitted during the previous frame. I was
> > thinking of making it more or less show the current time
> > of the flip done indication as that's when the scanout
> > from the new fb starts, but pretty much everyone else was
> > of the opinion that there is no point in doing that.
> 
> Ugh. So we have two different meanings for the completion timestamp:
> 
> sync flip: when the first pixel from the new FB is emitted into the
> 	video signal
> 
> async flip: something irrelevant
> 
> *sigh*
> 
> To me it would make sense for both to use the same definition, if
> that's technically possible. The point is to know roughly where the
> tear line is which could then answer the question "did it actually
> tear" which is related to the silent falling back to sync flips.

Yeah, that was pretty much my original thinking as well. Just
no one else was interested in it so I figured it's better to
not deviate from the common behaviour.

At least for i915 it shouldn't be too hard to do it properly.
The biggest complication would be untangling the drm_vblank
midlayer somehow.

-- 
Ville Syrjälä
Intel
