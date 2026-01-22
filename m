Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iD9WKEy+cWkmLwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 07:06:04 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14A11622B4
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 07:06:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21ABF10E1A1;
	Thu, 22 Jan 2026 06:06:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="w7+vHo4u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
 [209.85.221.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCCA310E1A1
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jan 2026 06:05:59 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id
 ffacd0b85a97d-432d2670932so500713f8f.2
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jan 2026 22:05:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1769061958; x=1769666758; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=dKKYv/QwjgamZm0Z+gBpDqIRHu4ljUK+NYA0+iwZjfs=;
 b=w7+vHo4uPLhlRiFTzS+Kb58CKNyQ6PZxLlUrn/nvXPvBZ/VSwCJ6qgvJVR7BUhvjIh
 cVEoP8sSNNuMwivaV1cSPPVrt5arjPipgbClCu7Y4N/t4o4LUHlvNk9AE5ylZi8DlpP6
 /v2OY/0I3GQFMjF7pyNvls1d97gL4wSsNwhHWi5TooiZZUurV7GC4JAhETl3/aSwY5pE
 tXvbcsqWGKav8lTTRgQEq5tXoTzYt7T87+fWeCI7IFkjCElJUXLCUBNVFZO+LZyefF/O
 ld7NrPq2Ud5nUvEifdf6N8UipIyVYYnUMpMKqe6aoZxp9pN7zbdJBbi7IexWFzf5Q3lF
 cj6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769061958; x=1769666758;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dKKYv/QwjgamZm0Z+gBpDqIRHu4ljUK+NYA0+iwZjfs=;
 b=TmuTPKk4rkmN9NVUCRMPSmEt4tuW+o3Qu7zhEcZ43mJR0+A5IDIWsZ8KDdHvwbqx79
 1zZQcMlsGoqRauVPGS87SjI1RDiaSXQ5wP17NrEpxkzT0moyUGX2xE0OGIaSaKInCZBP
 d5VTgJXNBxlKa411J9rY9N5hApQjIuDaNxI5tuctI0h1zxV4EVP2HQRGCuIx3RCBeCFc
 oO2uYe3QAXsjaWfDV+OWFW6viNtInIirGdn/RPOjhkDx6IHReboC7Ny60/kSqQcnJu7i
 SVAOZ0Up80Ir538yJYuQWPe25FSOQVwSbMtKGfxToBNA9my9JqduxfMtnw35MNU0zhRq
 Z60A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWFXa1Wbs+yXAgnWFfMmJtW5ZYx8sQVcuH8/XVrNLWApsQcEFbhbzlmpxHye+azJzR8SmJszAkgId0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyZ1YC2EHDTHRodIRjtoBp6duSRLGoZ5/fyf77xYVTHOIZfgODc
 rUjf+o0Dt4CxYUVVIBYZ8jpBRWdzipkyRgKJUwE7v29UenASZrL4C/zgilpC8KwBIsI=
X-Gm-Gg: AZuq6aKFg9y7bsNJpQ8aXQ+wjCPw/8HAHmGjeuJ5ybMKWmnmfSq1zEx7KFenvkIEWU2
 zYakOdq4eWhLMMNseZXg5fbBnfonX6zaNp3oRo5L5xe321qgu2zn/RiJqnHizKXLpe/CP4N7eUp
 8cxytiFy3mOuc0RmABS/IklmPIQ1935F8U4i1yOHNHm+NgZA/J0F/5JLwnAnwtx6rUdGhvJTQ/5
 zyOsnWO8fTq2ItnorJQGiFDMlDCi/x7y/stov6hokueK924xJ3CgQYHvo16qcHcyAHipzcw551v
 LPPjzpwQfiBZ+wiw/Q6Cf5XBMmsiCiRrZykAYJeGFdyVJ0fs/bDUbqpMNWtnOViXSP4sIdEWU2W
 3fk6eopdXDyw1Tsy8fbHcXtuXaVrf9dK/2WNgZGClxvyumfTRD93BgmCqIwAzwP6TiMSCZtBvyz
 GXAtQjUwvKwGOOukm3
X-Received: by 2002:a05:6000:290d:b0:435:ad52:31d4 with SMTP id
 ffacd0b85a97d-435ad5234ccmr515333f8f.26.1769061958037; 
 Wed, 21 Jan 2026 22:05:58 -0800 (PST)
Received: from localhost ([196.207.164.177]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4356997ed8bsm42957976f8f.36.2026.01.21.22.05.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jan 2026 22:05:57 -0800 (PST)
Date: Thu, 22 Jan 2026 09:05:54 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Andy Yan <andyshrk@163.com>
Cc: Andy Yan <andy.yan@rock-chips.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] drm/bridge: synopsys: Fix an error return in
 dw_dp_video_need_vsc_sdp()
Message-ID: <aXG-QjoniNS825an@stanley.mountain>
References: <aLaPyJrFsSFuqC1R@stanley.mountain>
 <5f9e8942.7fec.1990997b4de.Coremail.andyshrk@163.com>
 <aO4GGyJLCZEwFYL4@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aO4GGyJLCZEwFYL4@stanley.mountain>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andyshrk@163.com,m:andy.yan@rock-chips.com,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:dmitry.baryshkov@oss.qualcomm.com,m:linux-kernel@vger.kernel.org,m:kernel-janitors@vger.kernel.org,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[163.com];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[dan.carpenter@linaro.org,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dan.carpenter@linaro.org,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[rock-chips.com,intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch,oss.qualcomm.com,lists.freedesktop.org,vger.kernel.org];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stanley.mountain:mid,linaro.org:email,linaro.org:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 14A11622B4
X-Rspamd-Action: no action

Ping again?

regards,
dan carpenter

On Tue, Oct 14, 2025 at 11:13:15AM +0300, Dan Carpenter wrote:
> On Tue, Sep 02, 2025 at 04:42:41PM +0800, Andy Yan wrote:
> > 
> > Hello Dan,
> > 
> > At 2025-09-02 14:33:44, "Dan Carpenter" <dan.carpenter@linaro.org> wrote:
> > >This dw_dp_video_need_vsc_sdp() function is type bool so returning
> > >-EINVAL means returning true.  Return false instead.
> > >
> > >Fixes: 86eecc3a9c2e ("drm/bridge: synopsys: Add DW DPTX Controller support library")
> > >Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > 
> > 
> > Reviewed-by: Andy Yan <andyshrk@163.com>
> > 
> 
> Ping?
> 
> regards,
> dan carpenter
> 
> > 
> > >---
> > > drivers/gpu/drm/bridge/synopsys/dw-dp.c | 2 +-
> > > 1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > >diff --git a/drivers/gpu/drm/bridge/synopsys/dw-dp.c b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
> > >index 9bbfe8da3de0..33be4eae2b20 100644
> > >--- a/drivers/gpu/drm/bridge/synopsys/dw-dp.c
> > >+++ b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
> > >@@ -1149,7 +1149,7 @@ static bool dw_dp_video_need_vsc_sdp(struct dw_dp *dp)
> > > 
> > > 	state = dw_dp_get_bridge_state(dp);
> > > 	if (!state)
> > >-		return -EINVAL;
> > >+		return false;
> > > 
> > > 	if (!link->vsc_sdp_supported)
> > > 		return false;
> > >-- 
> > >2.47.2
