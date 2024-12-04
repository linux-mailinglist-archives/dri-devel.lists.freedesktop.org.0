Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91E9B9E31BF
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2024 04:03:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED07510E295;
	Wed,  4 Dec 2024 03:03:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="g7Aq4f11";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61D1510E295
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2024 03:03:46 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-2ffd6882dcbso49250931fa.0
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Dec 2024 19:03:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733281424; x=1733886224; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ikLnrq2neiQXCnlo3R5J5faufHu5wG48WhuaguFzsfQ=;
 b=g7Aq4f11YXnNV0KrougwB5BAeyMQc5/SfTuhyNwNwC8uq/NRayzyn79HeNPMfs0BVS
 li9nSeOn0LSUfQBFSPoK0E9rkxm5G7CWXNxVojmA/gwfUzZyJeqqbUYzKO1C4Ke9S6iu
 iET8QtczE7KT8B14p35lO8ipQ0mQAhN0Hg2NcyThenCAybiKMKXeVwhfUYu1yPPpqMJb
 lpGHFF2fNg5d9mOUBUpZX5gxGAlGdOHdKRRUy8AvISlL64Y0mt4XAnan533Cd95PwjSL
 UYWILf1/lTa+ez/acvcg0aE3J/EN5+mEPKbRyStj5v962siABx2nNBjftTZpt7xvYI+D
 5DbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733281424; x=1733886224;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ikLnrq2neiQXCnlo3R5J5faufHu5wG48WhuaguFzsfQ=;
 b=Z+RL91TPYDg8NDT5IwuAYn2RNMWB1X47ol1NKbxhmRYnhx0yHFtstlU3eDvXP1Gign
 WIOfQ3NV4pblEC3dsgmBBMwZ3MNTl2kv+j3A6Y5E/iPcDSY29AiQo6SXb93fFsiLgR4F
 gIgvvUFzrCWqyf5RupYERdX5K/55BIpgOMThWpSH3d71JIUIP+U0Sbg7fxk0A5Yhpu1O
 m/Rijngrh+ohyrS22s0FH31aYYmh66rqZyTcbdMGNm2gGV5D/2stQkfgvCTX7aSOuso0
 tiRrg5EpxbsI86BIE73v6WSkNXcjcBMtZT642KtR/O6Io5ERaU+9hO0ejGefaseDkRl4
 /brg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV6v+Lvav1dY5XxVYVgE9JCZfJ1nZRvP26tp0nx0nf/yKRIp7FG9mCPTuowZDirNFwl/Zj393fbD0w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxMUk560vKVWn1sd7UOMafnMZF2R6QTrBBQQlGRC0ELphsxY704
 Y0Mh8utyQzHsh1pznMCvOxSxIP67QOAF00+Bh0Umr7EcYdO6jIp0VnociP+4L9s=
X-Gm-Gg: ASbGncv4LozDQDssNAOcBOlMwc2EEPOq0WaTbcA2pqidDUSiq5gIRuO0TxAcrA1DhSE
 7AOw1J0+M2mZnnj7csS8QLFoN5lbEu1PldNg5G1nX7T8TqOZhwdIsu2nGquLa8H9j/dj9VnLsTM
 Mxv/2BfeArAihUuFNNCu+iMN6c+KDifj+pfH97ZAscl8PsAGGOoJzUl9vwmR6oShxQvPkJ4REwC
 E+eLHeUrXTJJ1061qJbS8kmNMpWMB+qev/WGDhasFBhploE0gFfvKzOT5mc6Ox2v1cW0Nj7o/wX
 M70n3ntaOkm4XisLUtr+VeTIM7mnuQ==
X-Google-Smtp-Source: AGHT+IHvj3GK9mvvHsYxtJ/AYW0XXXhWSJ/ZzMycuoNBeFIBdIFiRzpwHVHkl0tRH7tUUn0ZNFCc4A==
X-Received: by 2002:a05:6512:2209:b0:53d:a264:f25a with SMTP id
 2adb3069b0e04-53e1b8c11e5mr907942e87.47.1733281424214; 
 Tue, 03 Dec 2024 19:03:44 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53df646efd9sm2067551e87.143.2024.12.03.19.03.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Dec 2024 19:03:42 -0800 (PST)
Date: Wed, 4 Dec 2024 05:03:40 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>, 
 Doug Anderson <dianders@chromium.org>, Johan Hovold <johan@kernel.org>, 
 Bjorn Andersson <quic_bjorande@quicinc.com>
Subject: Re: [PATCH 1/4] drm/msm/dp: remove redundant checks related to
 ST_DISPLAY_OFF in plug/irq_ipd handlers
Message-ID: <evnnydsvr5ur7sl2lnahqo7ni6y5bwbdfkajhrmbues5uyeb2c@zym27uj553yy>
References: <20241202-hpd_display_off-v1-0-8d0551847753@quicinc.com>
 <20241202-hpd_display_off-v1-1-8d0551847753@quicinc.com>
 <pa3jwxpnipj7lcusioqnjesz4cpgc2oyqgspqqvk2i5kb6ud4k@fi4grx6w5k7d>
 <41725f98-5c23-47d2-966b-ebd5f4e1c532@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <41725f98-5c23-47d2-966b-ebd5f4e1c532@quicinc.com>
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

On Tue, Dec 03, 2024 at 06:36:45PM -0800, Abhinav Kumar wrote:
> 
> 
> On 12/3/2024 5:50 AM, Dmitry Baryshkov wrote:
> > On Mon, Dec 02, 2024 at 04:39:00PM -0800, Abhinav Kumar wrote:
> > > In commit 8ede2ecc3e5ee ("drm/msm/dp: Add DP compliance tests on Snapdragon Chipsets"),
> > > checks were introduced to avoid handling any plug or irq hpd events in
> > > ST_DISPLAY_OFF state.
> > > 
> > > Even if we do get hpd events, after the bridge was disabled,
> > > it should get handled. Moreover, its unclear under what circumstances
> > > these events will fire because ST_DISPLAY_OFF means that the link was
> > > still connected but only the bridge was disabled. If the link was untouched,
> > > then interrupts shouldn't fire.
> > 
> > What about the link being untouched, but the monitor being toggled
> > somehow, which might generate HPD / attention events?
> > 
> 
> To confirm my understanding of this, I tested this case again with and
> without a dongle on sc7180.
> 
> Without a dongle - When the monitor is powered off and powered on, without
> physically disturbing the cable, it still generates a hotplug disconnect
> event when powered off and hotplug connect event when its powered on again.
> 
> It gets handled the same way as a user would hotplug it using the cable.
> 
> With a dongle - When the monitor is powered off , nothing happens and it
> stays in connected state. When the monitor is powered back on, it generates
> a hotplug disable followed by hotplug enable event. This behavior is
> consistent with or without this series with this dongle.
> 
> So from the DP driver point of view, for both these cases, its just another
> hotlplug disconnect/connect.
> 
> Both these cases still work fine with these changes.

Thanks for the confirmation!


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


> 
> > > 
> > > Even in the case of the DP compliance equipment, it should be raising these
> > > interrupts during the start of the test which is usually accompanied with either
> > > a HPD pulse or a IRQ HPD but after the bridge is disabled it should be fine
> > > to handle these anyway. In the absence of a better reason to keep these checks,
> > > drop these and if any other issues do arise, it should be handled in a different
> > > way.
> > > 
> > > Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > > ---
> > >   drivers/gpu/drm/msm/dp/dp_display.c | 10 ----------
> > >   1 file changed, 10 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> > > index aba925aab7ad..992184cc17e4 100644
> > > --- a/drivers/gpu/drm/msm/dp/dp_display.c
> > > +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> > > @@ -562,11 +562,6 @@ static int msm_dp_hpd_plug_handle(struct msm_dp_display_private *dp, u32 data)
> > >   	drm_dbg_dp(dp->drm_dev, "Before, type=%d hpd_state=%d\n",
> > >   			dp->msm_dp_display.connector_type, state);
> > > -	if (state == ST_DISPLAY_OFF) {
> > > -		mutex_unlock(&dp->event_mutex);
> > > -		return 0;
> > > -	}
> > > -
> > >   	if (state == ST_MAINLINK_READY || state == ST_CONNECTED) {
> > >   		mutex_unlock(&dp->event_mutex);
> > >   		return 0;
> > > @@ -689,11 +684,6 @@ static int msm_dp_irq_hpd_handle(struct msm_dp_display_private *dp, u32 data)
> > >   	drm_dbg_dp(dp->drm_dev, "Before, type=%d hpd_state=%d\n",
> > >   			dp->msm_dp_display.connector_type, state);
> > > -	if (state == ST_DISPLAY_OFF) {
> > > -		mutex_unlock(&dp->event_mutex);
> > > -		return 0;
> > > -	}
> > > -
> > >   	if (state == ST_MAINLINK_READY || state == ST_DISCONNECT_PENDING) {
> > >   		/* wait until ST_CONNECTED */
> > >   		msm_dp_add_event(dp, EV_IRQ_HPD_INT, 0, 1); /* delay = 1 */
> > > 
> > > -- 
> > > 2.34.1
> > > 
> > 

-- 
With best wishes
Dmitry
