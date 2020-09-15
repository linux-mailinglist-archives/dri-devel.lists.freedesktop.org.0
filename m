Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F60626ADF3
	for <lists+dri-devel@lfdr.de>; Tue, 15 Sep 2020 21:47:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBA1D6E8FC;
	Tue, 15 Sep 2020 19:47:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4A1F6E8FB
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Sep 2020 19:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600199229;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ur1rWbZNT5UsC7ZqJ5DKcCpE8+s/eiYwscnRZFIyoQs=;
 b=EuSih+q8ZCUOgC8b+bQ70tbqPnRENBsmQBWQ7m1QYYnd2+D6gp5EMZu1J9RdafdZr9+9tz
 LIRlrmn3km+2ZVh4S+vM6Re1rYHgJcBJIL14sP/PYAzys/l6SPkWCY4yDvBnC0aSmaqw8L
 YEUrALZxGEQfFr2kj9lDO1P0ba84P2A=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-329-D8m7qmgiOC-MGM63EU_v_g-1; Tue, 15 Sep 2020 15:47:04 -0400
X-MC-Unique: D8m7qmgiOC-MGM63EU_v_g-1
Received: by mail-qk1-f197.google.com with SMTP id w64so3853309qkc.14
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Sep 2020 12:47:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:reply-to:to:cc:date
 :in-reply-to:references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=Ur1rWbZNT5UsC7ZqJ5DKcCpE8+s/eiYwscnRZFIyoQs=;
 b=MrZ5KoeKud+9oZxTvmKA4zj4zQejkQcYA3SpiDXSJSTmLFtgw5Ug//J/Wc6kFtuWOs
 ZoaK+ra2zqvROVmyiColQy4KQR9uqHC1jYrseF6Lk2zh8cogNJiXINq/9paTBiVeD2kg
 BpD9Sjum5cAgmzVqzF5lIHmmS01upTP69sFDz5pzj7Mdc+fQ2n+7HMRRLx7eVABl95NB
 N5QF+89bfqzwQtdIxHlKbt7Rup+4rnyYU0LojCLSegOyzRe7/g/l/J5cEbYZTZOLTSPj
 FXznjN1IHbBvGAeROVRWkjdne0Fs/n9KQn32Bd/0ZilPaoZP1Pf06IN/+I8qHb17RqEd
 SPeQ==
X-Gm-Message-State: AOAM533qJLFMXLuPvcig1gWJRTiyzpUgW27oE+bzkCFl8wexOsj8t2JT
 ZQU2p5ZHbq5WFu1xN9M2yGOKkiaRMu2l4mrlRmmehssRrDWbFsJtJLTi0BrERAXlFq96+CC46aH
 y49K2v6whKgjEGId3I+dIj6uUw8Zn
X-Received: by 2002:a05:620a:546:: with SMTP id
 o6mr20184479qko.296.1600199223682; 
 Tue, 15 Sep 2020 12:47:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzl+UYJSBul/q+CmYfqBZANubEc6SGBWhb3uWTdUm1eqMbnBd9q1e9hw6A3qtxfsEH1x2NVqA==
X-Received: by 2002:a05:620a:546:: with SMTP id
 o6mr20184447qko.296.1600199223404; 
 Tue, 15 Sep 2020 12:47:03 -0700 (PDT)
Received: from Whitewolf.lyude.net
 (pool-108-49-102-102.bstnma.fios.verizon.net. [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id 8sm17307041qkd.47.2020.09.15.12.47.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Sep 2020 12:47:02 -0700 (PDT)
Message-ID: <b1b77b7022f9e388808bc3835f8fc88cda0718bc.camel@redhat.com>
Subject: Re: [RFC 1/5] drm/i915/dp: Program source OUI on eDP panels
From: Lyude Paul <lyude@redhat.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Date: Tue, 15 Sep 2020 15:47:01 -0400
In-Reply-To: <20200915190639.GC503362@intel.com>
References: <20200915172939.2810538-1-lyude@redhat.com>
 <20200915172939.2810538-2-lyude@redhat.com>
 <20200915190639.GC503362@intel.com>
Organization: Red Hat
User-Agent: Evolution 3.36.5 (3.36.5-1.fc32)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0.002
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
Cc: thaytan@noraisin.net, David Airlie <airlied@linux.ie>,
 intel-gfx@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
 Vasily Khoruzhick <anarsoul@gmail.com>, Uma Shankar <uma.shankar@intel.com>,
 Sean Paul <seanpaul@chromium.org>,
 =?ISO-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>,
 Manasi Navare <manasi.d.navare@intel.com>,
 Wambui Karuga <wambui.karugax@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 2020-09-15 at 15:06 -0400, Rodrigo Vivi wrote:
> On Tue, Sep 15, 2020 at 01:29:35PM -0400, Lyude Paul wrote:
> > Since we're about to start adding support for Intel's magic HDR
> > backlight interface over DPCD, we need to ensure we're properly
> > programming this field so that Intel specific sink services are exposed.
> > Otherwise, 0x300-0x3ff will just read zeroes.
> > 
> > We also take care not to reprogram the source OUI if it already matches
> > what we expect. This is just to be careful so that we don't accidentally
> > take the panel out of any backlight control modes we found it in.
> > 
> > Signed-off-by: Lyude Paul <lyude@redhat.com>
> > Cc: thaytan@noraisin.net
> > Cc: Vasily Khoruzhick <anarsoul@gmail.com>
> > ---
> >  drivers/gpu/drm/i915/display/intel_dp.c | 32 +++++++++++++++++++++++++
> >  1 file changed, 32 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/i915/display/intel_dp.c
> > b/drivers/gpu/drm/i915/display/intel_dp.c
> > index 4bd10456ad188..b591672ec4eab 100644
> > --- a/drivers/gpu/drm/i915/display/intel_dp.c
> > +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> > @@ -3428,6 +3428,7 @@ void intel_dp_sink_set_decompression_state(struct
> > intel_dp *intel_dp,
> >  void intel_dp_sink_dpms(struct intel_dp *intel_dp, int mode)
> >  {
> >  	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
> > +	u8 edp_oui[] = { 0x00, 0xaa, 0x01 };
> 
> what are these values?

I wish I knew, my assumption is this is the OUI that Intel's GPU driver uses on
other platforms, but I don't have any documentation mentioning this (in fact,
the few documents I do have on this backlight interface don't seem to make any
mention of it). I only managed to find this when looking through the last
attempt someone did at adding support for this backlight interface:

https://patchwork.freedesktop.org/patch/334989/

I think it should be fairly safe to write, as I know nouveau always programs a
source OUI (we don't do it from our driver, but nvidia hardware seems to do it
automatically) and I don't believe I've seen it ever change any behavior besides
making things appear in the 0x300-0x3ff register range.

AFAICT though, the backlight interface won't advertise itself without this being
set early on. If you could find anyone from Intel who knows more about it though
I'd definitely appreciate it (and just in general for the rest of the patch
series as well)

> 
> >  	int ret, i;
> >  
> >  	/* Should have a valid DPCD by this point */
> > @@ -3443,6 +3444,14 @@ void intel_dp_sink_dpms(struct intel_dp *intel_dp,
> > int mode)
> >  	} else {
> >  		struct intel_lspcon *lspcon = dp_to_lspcon(intel_dp);
> >  
> > +		/* Write the source OUI as early as possible */
> > +		if (intel_dp_is_edp(intel_dp)) {
> > +			ret = drm_dp_dpcd_write(&intel_dp->aux, DP_SOURCE_OUI,
> > edp_oui,
> > +						sizeof(edp_oui));
> > +			if (ret < 0)
> > +				drm_err(&i915->drm, "Failed to write eDP source
> > OUI\n");
> > +		}
> > +
> >  		/*
> >  		 * When turning on, we need to retry for 1ms to give the sink
> >  		 * time to wake up.
> > @@ -4530,6 +4539,23 @@ static void intel_dp_get_dsc_sink_cap(struct intel_dp
> > *intel_dp)
> >  	}
> >  }
> >  
> > +static void
> > +intel_edp_init_source_oui(struct intel_dp *intel_dp)
> > +{
> > +	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
> > +	u8 oui[] = { 0x00, 0xaa, 0x01 };
> > +	u8 buf[3] = { 0 };
> > +
> > +	if (drm_dp_dpcd_read(&intel_dp->aux, DP_SOURCE_OUI, buf, sizeof(buf)) <
> > 0)
> > +		drm_err(&i915->drm, "Failed to read source OUI\n");
> > +
> > +	if (memcmp(oui, buf, sizeof(oui)) == 0)
> > +		return;
> > +
> > +	if (drm_dp_dpcd_write(&intel_dp->aux, DP_SOURCE_OUI, oui, sizeof(oui)) <
> > 0)
> > +		drm_err(&i915->drm, "Failed to write source OUI\n");
> > +}
> > +
> >  static bool
> >  intel_edp_init_dpcd(struct intel_dp *intel_dp)
> >  {
> > @@ -4607,6 +4633,12 @@ intel_edp_init_dpcd(struct intel_dp *intel_dp)
> >  	if (INTEL_GEN(dev_priv) >= 10 || IS_GEMINILAKE(dev_priv))
> >  		intel_dp_get_dsc_sink_cap(intel_dp);
> >  
> > +	/*
> > +	 * Program our source OUI so we can make various Intel-specific AUX
> > +	 * services available (such as HDR backlight controls)
> > +	 */
> > +	intel_edp_init_source_oui(intel_dp);
> 
> I believe we should restrict this to the supported platforms: cfl, whl, cml,
> icl, tgl
> no?
> 
> > +
> >  	return true;
> >  }
> >  
> > -- 
> > 2.26.2
> > 
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
-- 
Sincerely,
      Lyude Paul (she/her)
      Software Engineer at Red Hat

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
