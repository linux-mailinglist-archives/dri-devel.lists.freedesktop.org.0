Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62882A152E8
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2025 16:32:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C002010EB1C;
	Fri, 17 Jan 2025 15:32:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="CyMtEvRb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82B5810EB1C
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2025 15:32:33 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4364a37a1d7so21467475e9.3
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2025 07:32:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1737127952; x=1737732752; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CLtid1KPVrGYwJ7kfvjV+78wV9BUg8gs9TwIXAHLQc8=;
 b=CyMtEvRbs5FZ6omuFcxxwv+ZwhAUC5AQUqI2y/vy29KjdMHElFM42UkgZ24dm1/uyi
 BOKupJj85AF7FlB0zVCQemuhh4S2xLHb5udJ4a+VgYSonDZGITOuUJL74dFvL0J4HCNJ
 Mg3KCYeiptRHk30H1UoAb+f/ZBqTakCEG5tLQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737127952; x=1737732752;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CLtid1KPVrGYwJ7kfvjV+78wV9BUg8gs9TwIXAHLQc8=;
 b=oIsB4eHjOmlP+1K3K0SY//30mEQyOA7N2KKvFKsyG2lpquJliQQK1sl9khgSUhg19E
 d59GHNvxhZPp2iZ8ukLMjkj6KLdjyjRsvIArtNw53sG5unHap0f/Crpv/qweXkNTAhRq
 Xqfv2leCMfpMLD62Ab4n7HerfZ/9ZQ2XPQTqkBI4KbrVm9pCpeyOC4bQPCZn4hJq1QYc
 oSQ3PLh2RUBRFVk1Yohcc5wgAVK3ONiYLQErO+d+5+ZqOqAWKxVDpCtbbrB2e7Vd5fBd
 xqEPQUxDuCiZBYsj8e9A+DTSuKqd8jl8E165V8b9yHX7tCVGtiL9jaIqN4iief5T7SfA
 X1Mw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWHBpq6WEyka8GiubosRVMz++PhpRBdQMsT2Khc7Nf/yQ9x/Fq26j4TeRGqmc8j/lAXoS6i7x+Dc+A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxm39ehk8yJcaCiBaCkhRyrbv9LBXadTR3Pl3F/3pymTC1SisQH
 ordR2wkUtkBzSs9iWNIGHN2nae/+KysDAMnpSl4o9AYXJ9kWMzQvax+zHJm7vMQ=
X-Gm-Gg: ASbGncugFEUWp+4kczJVbFFJz2lx2WZzucVerjYwKFZuTH12ZBRZBh1jgejukVGuRwv
 9FftmFrXUSN9t73BlmzRr9lypoCfGOX6+yLK/RorfMfSgVe9ikq4ON/5em3gKAOCBuMaMkbHR8n
 IiXZS7Vt6/w4EyLLL3hs47kMsUlzmAzBV3HesjzqO8axkjs5DaH0vvJmVHAez/UbhrfgfQXzSAG
 Nr55Z9g+CMhxIknTPvSIYR4Q0nu/MD5FUNI14bjTp7CFlD2wju4uHRDEcQDpphyqlyc
X-Google-Smtp-Source: AGHT+IFFCya1TW4qLTsQ1TT0n6Roc+hx7woOI2zQH26F+AVFUypMOSS9PWHiwyzXMtCfuJfVXwTDEg==
X-Received: by 2002:a05:600c:c84:b0:434:a684:9b1 with SMTP id
 5b1f17b1804b1-438913c0207mr32798295e9.4.1737127952009; 
 Fri, 17 Jan 2025 07:32:32 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38bf327ded8sm2731464f8f.89.2025.01.17.07.32.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jan 2025 07:32:31 -0800 (PST)
Date: Fri, 17 Jan 2025 16:32:29 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Douglas Anderson <dianders@chromium.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 22/29] drm/bridge: Rename atomic hooks parameters to drop
 old prefix
Message-ID: <Z4p4DYBtC0_f6n0a@phenom.ffwll.local>
Mail-Followup-To: Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Douglas Anderson <dianders@chromium.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250115-bridge-connector-v1-0-9a2fecd886a6@kernel.org>
 <20250115-bridge-connector-v1-22-9a2fecd886a6@kernel.org>
 <Z4jutByAKEF0cPs3@phenom.ffwll.local>
 <20250117-magpie-of-unreal-pride-efb244@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250117-magpie-of-unreal-pride-efb244@houat>
X-Operating-System: Linux phenom 6.12.3-amd64 
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

On Fri, Jan 17, 2025 at 03:50:09PM +0100, Maxime Ripard wrote:
> On Thu, Jan 16, 2025 at 12:34:12PM +0100, Simona Vetter wrote:
> > On Wed, Jan 15, 2025 at 10:05:29PM +0100, Maxime Ripard wrote:
> > > All the bridge atomic hooks were using the old_bridge_state name for
> > > their drm_bridge_state parameter. However, this state is the current
> > > state being committed for all of them, which ends up being confusing.
> > > 
> > > Let's rename it to bridge_state for all of them.
> > > 
> > > Signed-off-by: Maxime Ripard <mripard@kernel.org>
> > > ---
> > >  include/drm/drm_bridge.h | 8 ++++----
> > >  1 file changed, 4 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
> > > index 4b84faf14e368310dd20aa964e8178ec80aa6fa7..8e18130be8bb85fc2463917dde9bf1d281934184 100644
> > > --- a/include/drm/drm_bridge.h
> > > +++ b/include/drm/drm_bridge.h
> > > @@ -303,11 +303,11 @@ struct drm_bridge_funcs {
> > >  	 * there is one) when this callback is called.
> > >  	 *
> > >  	 * The @atomic_pre_enable callback is optional.
> > >  	 */
> > >  	void (*atomic_pre_enable)(struct drm_bridge *bridge,
> > > -				  struct drm_bridge_state *old_bridge_state);
> > > +				  struct drm_bridge_state *bridge_state);
> > >  
> > >  	/**
> > >  	 * @atomic_enable:
> > >  	 *
> > >  	 * This callback should enable the bridge. It is called right after
> > > @@ -323,11 +323,11 @@ struct drm_bridge_funcs {
> > >  	 * chain if there is one.
> > >  	 *
> > >  	 * The @atomic_enable callback is optional.
> > >  	 */
> > >  	void (*atomic_enable)(struct drm_bridge *bridge,
> > > -			      struct drm_bridge_state *old_bridge_state);
> > > +			      struct drm_bridge_state *bridge_state);
> > 
> > Checked this one, and it very clearly passes the old state.
> 
> Urgh, you're right
> 
> > Because the new state you can get by looking at bridge->state.
> 
> Bridge->state doesn't exist though.

Yeah it's defacto your helper to go find the private object, deref the
->state pointer in there and then cast to the right type. But that again
has a bit the locking issue since sometimes you must hold the modeset
lock, sometimes not.

If we instead always go through the drm_atomic_state lookup then we can
require the modeset lock in the other helper for the bridge ->
bridge_state lookup, and things become much harder for drivers to get
wrong.

> > So this looks very wrong.
> > 
> > If you want to fully update the pattern, pass the drm_atomic_state
> > instead, and let callbacks lookup any additional states they use as
> > needed.
> 
> Yeah, that's probably the best option. I think I still have the
> coccinelle scripts I used for the others somewhere.

Yeah cocci would help here.
-Sima
-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
