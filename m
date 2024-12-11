Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4DA19EC9C5
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2024 10:56:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FD6B10EAE1;
	Wed, 11 Dec 2024 09:56:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="uX+Uiavo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3AB110EAE5
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2024 09:56:00 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-54024ecc33dso2013294e87.0
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2024 01:56:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733910959; x=1734515759; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=5o6spnVR6ajql5nXA/7yn9qe6fHy4wd5WT4oqg7Hxjg=;
 b=uX+UiavoJnIJpbc4RZVahVPLdUAHhP2N3jeuj2S9scuX9pU2VH0QNlQhTuzzoTLHmL
 PlRmZkXED1Ly7RXAo1r6F8ncXSYTsoD5bdAdowQm+kdl6E0+E+6tjCEhms3H3yKhm6j0
 gCCJBLCNSZXUApwhkncT9XHtlCn0iH8hOo1mFjJEw3xrEYjlyvTqmfR8EnKf+FmxoPp0
 JKFXTk5bWWSyPobGSwTvQyr9lizn1FvnM1LOR9WHmImaiKn2+krEwJhDWQ5GJVAOaXM2
 F7EG4u2LOHXoecCl2vbZYUPNVtGUgpUxL/1kP9/HiETCChYZgbhSy4m1VtOhdA7f5/Wc
 3YVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733910959; x=1734515759;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5o6spnVR6ajql5nXA/7yn9qe6fHy4wd5WT4oqg7Hxjg=;
 b=XKYSNJIeTMBrhXm65SfUTOhgdKHjg5TNDbUs8S2bpDaKYm/DuQ1yMQ6aFL4oh0mA8I
 WR4N5X6v85k61vE/k0joljv5/d9H9h4Yh5t8+z1gfEYkJ5HpCV1/omf61GO5tuy3mAWY
 f8cxYlA/iE5XYsW/24q3THBydKgz01V5ksHP0DX864LKBN5NdgKEIKSCQv3j6bELkgCZ
 4lkPPStFjg9PgLG6EXj1TVsiKvOMm/pnKFxXDWkApZr/y4y+4rTTaXuuhQZIUjJUd/XG
 o7gbVA5UzIfhgLwTpEy0SMlSrphEsMPw+kkgZGx4LEeTeCoDpMTAt6iGzRLhtdjxaCQN
 vL1g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUFLsMdoPdyHAZbvGf3eLXXF2LYNKrk2KHwV4B8iK6H5xZt95dadulvgQEBwtalZrrE8EMXHPOzr+k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyZqyXUpSlKkec3IXEY4Tsi4GuzG25/ETsaa8yn/yOAim9+2pfK
 hXfw/njz9CRwhs0+67t7rRfBcfQcN1fOZfFGpiP47RLQXyGrdz3s2VTLNC+cnZ4=
X-Gm-Gg: ASbGncsx9uIrHx2qfO9F7fiS90ZhUATyP20tfP4/VH6w/+BFq1tBB95+fpJHGoXrwQi
 0hquZxFyc1D6T42pUJW7g3A9AqnLSLj5vdv73xFx7fZQHe71btLT86FPMELaN61ziQANfpEI1Og
 W1vJ39jT6MikrladxG+m38j0wW4cyHRUvD+JWqV0wsZPiIFoQe4RvaKsVEfi9YwnMatR2+PMwja
 OeazUjE/xuzpn9GcijG8jgdRC+lyYGTZA9UhMOri+YBrEZPvn+2iRyvHlNYq98mhnntvaOkbOEV
 p/KYUBmzGfSShCDXqHb9AbxUhDWl+2PA1g==
X-Google-Smtp-Source: AGHT+IFChwIInqKh4toLH7hhsT9qt9s90iu0Z0ak8AysLNTaQPEcT5Yq2WRNWpMzPvyheGTGJPWcWQ==
X-Received: by 2002:a05:6512:158b:b0:540:1fcd:1d9b with SMTP id
 2adb3069b0e04-5402a609b3fmr630278e87.54.1733910958544; 
 Wed, 11 Dec 2024 01:55:58 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53e372946dcsm1563735e87.163.2024.12.11.01.55.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Dec 2024 01:55:57 -0800 (PST)
Date: Wed, 11 Dec 2024 11:55:54 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>, 
 Danilo Krummrich <dakr@redhat.com>, Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Johan Hovold <johan@kernel.org>,
 dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org
Subject: Re: [PATCH RFC 4/4] drm/msm/dp: Add support for LTTPR handling
Message-ID: <iqt3i5mha44wksx7zqjjccz3od5tavyxygyda2dn2fz2w77n36@gyo3dh6a6j72>
References: <20241031-drm-dp-msm-add-lttpr-transparent-mode-set-v1-0-cafbb9855f40@linaro.org>
 <20241031-drm-dp-msm-add-lttpr-transparent-mode-set-v1-4-cafbb9855f40@linaro.org>
 <6lpeexb5menpwrzcnmr367x4lmhvzyovhdybn54mnwk55ieehy@mos4oso67boo>
 <Z1lWgDk6vzbx4ew7@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z1lWgDk6vzbx4ew7@linaro.org>
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

On Wed, Dec 11, 2024 at 11:08:16AM +0200, Abel Vesa wrote:
> On 24-10-31 18:54:25, Dmitry Baryshkov wrote:
> > On Thu, Oct 31, 2024 at 05:12:48PM +0200, Abel Vesa wrote:
> > > Link Training Tunable PHY Repeaters (LTTPRs) are defined in DisplayPort
> > > 1.4a specification. As the name suggests, these PHY repeaters are
> > > capable of adjusting their output for link training purposes.
> > > 
> > > The msm DP driver is currently lacking any handling of LTTPRs.
> > > This means that if at least one LTTPR is found between DPTX and DPRX,
> > > the link training would fail if that LTTPR was not already configured
> > > in transparent mode.
> > 
> > It might be nice to mention what is the transparent mode, especially for
> > those who do not have the standard at hand.
> 
> Sorry for the late reply.
> 
> Will do in the next version.
> 
> > 
> > > The section 3.6.6.1 from the DisplayPort v2.0 specification mandates
> > > that before link training with the LTTPR is started, the DPTX may place
> > > the LTTPR in non-transparent mode by first switching to transparent mode
> > > and then to non-transparent mode. This operation seems to be needed only
> > > on first link training and doesn't need to be done again until device is
> > > unplugged.
> > > 
> > > It has been observed on a few X Elite-based platforms which have
> > > such LTTPRs in their board design that the DPTX needs to follow the
> > > procedure described above in order for the link training to be successful.
> > > 
> > > So add support for reading the LTTPR DPCD caps to figure out the number
> > > of such LTTPRs first. Then, for platforms (or Type-C dongles) that have
> > > at least one such an LTTPR, set its operation mode to transparent mode
> > > first and then to non-transparent, just like the mentioned section of
> > > the specification mandates.
> > > 
> > > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > > ---
> > >  drivers/gpu/drm/msm/dp/dp_display.c | 25 +++++++++++++++++++++++++
> > >  1 file changed, 25 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> > > index f01980b0888a40b719d3958cb96c6341feada077..5d3d318d7b87ce3bf567d8b7435931d8e087f713 100644
> > > --- a/drivers/gpu/drm/msm/dp/dp_display.c
> > > +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> > > @@ -107,6 +107,8 @@ struct dp_display_private {
> > >  	struct dp_event event_list[DP_EVENT_Q_MAX];
> > >  	spinlock_t event_lock;
> > >  
> > > +	u8 lttpr_caps[DP_LTTPR_COMMON_CAP_SIZE];
> > > +
> > >  	bool wide_bus_supported;
> > >  
> > >  	struct dp_audio *audio;
> > > @@ -367,12 +369,35 @@ static int dp_display_send_hpd_notification(struct dp_display_private *dp,
> > >  	return 0;
> > >  }
> > >  
> > > +static void dp_display_lttpr_init(struct dp_display_private *dp)
> > > +{
> > > +	int lttpr_count;
> > > +
> > > +	if (drm_dp_read_lttpr_common_caps(dp->aux, dp->panel->dpcd,
> > > +					  dp->lttpr_caps))
> > > +		return;
> > > +
> > > +	lttpr_count = drm_dp_lttpr_count(dp->lttpr_caps);
> > > +
> > > +	if (lttpr_count) {
> > > +		drm_dp_lttpr_set_transparent_mode(dp->aux, true);
> > > +
> > > +		if (lttpr_count > 0) {
> > > +			if (drm_dp_lttpr_set_transparent_mode(dp->aux, false) != 1)
> > > +				drm_dp_lttpr_set_transparent_mode(dp->aux, true);
> > > +		}
> > > +	}
> > > +}
> > > +
> > >  static int dp_display_process_hpd_high(struct dp_display_private *dp)
> > >  {
> > >  	struct drm_connector *connector = dp->dp_display.connector;
> > >  	const struct drm_display_info *info = &connector->display_info;
> > >  	int rc = 0;
> > >  
> > > +	if (!dp->dp_display.is_edp)
> > > +		dp_display_lttpr_init(dp);
> > 
> > Why is it limited to non-eDP cases only.
> 
> In case of eDP, I don't think that there will ever by a case that will
> need an LTTPR in between the eDP PHY and the actual panel. It just
> doesn't make sense.
> 
> IIUC, the LTTPRs, since are Training Tunnable capable, they help when
> the physical link between the PHY and the sink can differ based on
> different dongles and cables. This is obviously not applicable to eDP.

I think I just have a different paradigm: if the driver explicitly skips
calling a function in some codepath, I assume that the usecase it broken
or expected not to work (e.g. I read your patch like: LTTPR is expected
not to work in eDP). If you would prefer to keep two separate code
paths, please add a comment like 'we don't expect LTTPRs in eDP
usecase`.

> > > +
> > >  	rc = dp_panel_read_sink_caps(dp->panel, connector);
> > >  	if (rc)
> > >  		goto end;
> > > 
> > > -- 
> > > 2.34.1
> > > 
> > 
> > -- 
> > With best wishes
> > Dmitry

-- 
With best wishes
Dmitry
