Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mEyFE8Erimm6HwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Feb 2026 19:47:29 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A019B113D19
	for <lists+dri-devel@lfdr.de>; Mon, 09 Feb 2026 19:47:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FD0E10E44B;
	Mon,  9 Feb 2026 18:47:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="IHX3ZJSI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA8F410E44B
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Feb 2026 18:47:25 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-481188b7760so34025475e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Feb 2026 10:47:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770662844; x=1771267644; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=0xKKKCaqMMU4yXYq3598GeI46KY8dYOj6nfjjDZFOpc=;
 b=IHX3ZJSI6Dk2eD+3uHqhV0t0WzAJ5DG5JeuJ1M3E64Uqqsd4vN7keaCHnqkUeoe9Il
 tupAh8Io/zZ7neyzNHKXD4pGLKClaDdy8uC7XXgGoJ4Vl82go4FBpZDd3AUGLEiwwcF8
 MM28tWuZcMhlyxIUTmHsUXeK1sg6owqdyUmxxOhOyjk7TxhsTP8YCtL38Hwp4lHjIlH8
 bUPm8N+37E8LMjUv6EOJHaYHc7v7ZntgXY5LbRB89HLUpKYE00sVYW6AwXXeqLWflOqP
 40+lmgv+B8ZHaEKdOEsXulcDEV8jib/cfF8J17gqTe2fa82IFh5+VD0BZemvDsstWWWY
 sDYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770662844; x=1771267644;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0xKKKCaqMMU4yXYq3598GeI46KY8dYOj6nfjjDZFOpc=;
 b=GYUWuP1ZVqNQeWFddcaxOpPwAfpQo8fTom+kjjL1anD0DjeZFahvsJJTvVLsoNbjVR
 ekINrAvLo72UbJOeYq2YH1w7YJkfr8dbUBeu35kZNjuVyUadXuQU4i65W5mqzO7RYUv2
 tEiQxA5ZT96j5M7IpUVL/oqUt7EhwaKPcAh6NYd5W/mIOrzdwe4EzrwcCT3vZLAZE/dF
 m8UjftlY/vb2TQbFhHc6yZZZwn1sNL5yGLVlEtjLTgyMRhaqTFm+3jzNjjK8hvBNUGak
 EDGvyOXr4KGSqX9XQ/uxo9RvXF4rcfCT2ufSLBkd/wnuecMYK1h2PqBpiWtgDdgb4yJ9
 Mpdw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWZ/WTtYlkuWJF252MTUGhVJ7vrOiSJMEzFayu+aEQBE4h9Tqs2VgbGVG6sD8NizCNsfCp/T8YTV2o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx8Zt1ebTEGMXSrG/SrrBxpeAmfaanX45BDzSSVIcMtiD7TyU7y
 oo9sNNZpRovL/e7cREx7qqOZAOmFy6/qWrjsHNABHh+wPaRvcUK8GNnE
X-Gm-Gg: AZuq6aJCRfYg75fHv5YjEcdrRdBVtt1CqMJgvG1woNRcAD9lH4k1jiT/am9N01Si7Fm
 +fFxTuE+rvE+Z9Llmsc30gvKWuyzSGPRMMmJXknqCzWgBvF8Ln/8WYBpiWpc4fCsZMX5v2lxjLH
 2ypF+E7Njc0E5cdEpcKnnirlwF1+dvaIwZoFjFTpmJSWful1ct7U0GPjZ6cxdpWniGh30psC5YI
 OFnOEpT0MSGszNcEXS26F7WfkmfQRgy4KxjPKmm7hy7b0Iwx91wvwNhS/A0iZB18TrmovYVvI+g
 1ZqU5jvabTQcAIkoqtKvTV2DX1tlS0GjiuUzTQmW+p2eZV4ktnqTLpN7tFyT/liFuqfCBkOxnt4
 c6wQGPZSPtNWZKUlEoB1bGK/H73N0SwVsTMydls6Qm6UZnlPNBeHQmA7ylZoyRNws6a4DtRweoW
 16+NhAW84nhi5YG/25Vieip6lLJjJJW6Ksl04Kgf4=
X-Received: by 2002:a05:600c:8116:b0:47e:e9c9:23bc with SMTP id
 5b1f17b1804b1-483209b06d8mr157421415e9.30.1770662844121; 
 Mon, 09 Feb 2026 10:47:24 -0800 (PST)
Received: from osama ([41.43.103.6]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4832040e91fsm99151335e9.6.2026.02.09.10.47.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Feb 2026 10:47:23 -0800 (PST)
Date: Mon, 9 Feb 2026 19:47:19 +0100
From: Osama Abdelkader <osama.abdelkader@gmail.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/bridge: samsung-dsim: Fix memory leak in error path
Message-ID: <aYortxEG3yKPQ8fn@osama>
References: <20260207183721.43087-1-osama.abdelkader@gmail.com>
 <DGAFT3L8L5DO.FU8O3M5KTJ40@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DGAFT3L8L5DO.FU8O3M5KTJ40@bootlin.com>
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
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:luca.ceresoli@bootlin.com,m:inki.dae@samsung.com,m:jagan@amarulasolutions.com,m:m.szyprowski@samsung.com,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-kernel@vger.kernel.org,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[osamaabdelkader@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[osamaabdelkader@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[samsung.com,amarulasolutions.com,intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch,lists.freedesktop.org,vger.kernel.org];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: A019B113D19
X-Rspamd-Action: no action

On Mon, Feb 09, 2026 at 01:41:21PM +0100, Luca Ceresoli wrote:
> Hello Osama,
> 
> On Sat Feb 7, 2026 at 7:37 PM CET, Osama Abdelkader wrote:
> > In samsung_dsim_host_attach(), drm_bridge_add() is called to add the
> > bridge. However, if samsung_dsim_register_te_irq() or
> > pdata->host_ops->attach() fails afterwards, the function returns
> > without removing the bridge, causing a memory leak.
> >
> > Fix this by adding proper error handling with goto labels to ensure
> > drm_bridge_remove() is called in all error paths. Also ensure that
> > samsung_dsim_unregister_te_irq() is called if the attach operation
> > fails after the TE IRQ has been registered.
> >
> > Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>
> 
> Good catch!
> 
> However being a fix you need a 'Fixes:' line pointing to the first commit
> where hte bug exists. At a quick search it looks like f9bfd326f57e, but
> please double check that. And with a Fixes tag you need Cc: stable, see the
> docs [0].
> 
> > --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> > +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> > @@ -1881,6 +1881,8 @@ static int samsung_dsim_register_te_irq(struct samsung_dsim *dsi, struct device
> >  	return 0;
> >  }
> >
> > +static void samsung_dsim_unregister_te_irq(struct samsung_dsim *dsi);
> 
> Please don't add a forward declaration. Just move
> samsung_dsim_unregister_te_irq() function earlier, perhaps right here. Also
> mention in the commit message that you have just moved it without changes,
> to help reviewers: unfortunately code being moved it not very well
> visualized in a diff.
> 
> Otherwise looks good!
> 
> It would be great if you please add me in Cc for future patches to this
> driver. I'm using and touching it [1][2] so I'd like to review patches
> touching it. Thanks!

Sure, I will.
Thanks for letting me know.

> 
> [0] https://docs.kernel.org/process/stable-kernel-rules.html
> [1] https://lore.kernel.org/lkml/20260109-drm-bridge-alloc-getput-drm_of_find_bridge-2-v2-0-8bad3ef90b9f@bootlin.com/
> [2] https://lore.kernel.org/lkml/20260206-drm-bridge-atomic-vs-remove-clear_and_put-v1-2-6f1a7d03c45f@bootlin.com/
> 
> Luca
> 
> --
> Luca Ceresoli, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

Hello Luca,

Thank you for the review, I just did that in v2.

Thanks,
Osama
