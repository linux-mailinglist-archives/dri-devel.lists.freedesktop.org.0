Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GDZsHeSJi2nYVgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 20:41:24 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D4D11EB4B
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 20:41:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41DC610E231;
	Tue, 10 Feb 2026 19:41:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Wq4W3NI/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B55C210E231
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Feb 2026 19:41:18 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-435f177a8f7so4405865f8f.1
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Feb 2026 11:41:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770752477; x=1771357277; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
 :to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=DdY8AetqrIsyAlDkJr11JNPqou7S77GqtWDjoK4rLMM=;
 b=Wq4W3NI/PlhwdvYsPsjFLY12sFe1FLzOMWzXvZ75HAG+VJHCdBjkTNAtXFd9SBsw5A
 7ckUX3sY/TRYdiZB3DIOcBVMA5wqQt6v+fcpGXZLDFku3gl4aXpyDqvPfTbt0TEqyRKd
 KXnX9HyMwqfTihVrayPaE2RhFndVwmIo1Wmk/Z9tbVASQk6UAPLjt97d03cMufheh27g
 Eyuf4hR4Oz2BgGgsmM7Pz/kFAiHd6H24HBGun0AZ4DtdkGB/Zhsya9sFIb4qwBUfHO+U
 BbM68JeHtj8pD5MtYLXwyL9FciWs+D1mdK23z59u7fq7jGGXAnPyJQjkexiVGTfQSs3H
 Undg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770752477; x=1771357277;
 h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
 :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DdY8AetqrIsyAlDkJr11JNPqou7S77GqtWDjoK4rLMM=;
 b=t+lnQHbuBiCpt10dS9DPVZZL9xTNVepumM5H/toR7QGo0JcNB4Gcm5aKuVaS7RVTA/
 fJobiCnUTL628ybkekEYd3ddxockGApOSzbuMb+IEtYxepcyK78AowcxfGdDvFRlWMfP
 dm/T8y/hlpPoXByoKiRg/w9cXJS713dPtEVBXXfu/ctIGRSkX/mpfwzbxlm7ABK1gER+
 XDRBrryx84yOtt+cSkzpsjLTAbpFYkzyvNtJh1LP49CP6VScrJL1dCX5juSV/Bus+DSP
 j0GAn2XNlN0p68Msf987O9f7AAO+ZvczSjDQxs+/55M5E8npirWRdOXYZxgeCYEQj1t7
 GISA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV2GA2U/jN93OtjtFpDzWpo5L646IOF3BB89Q57xdhe4sjj1VtSh7GLaI5Cz5h16VuXBTxqH16xMI0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxCS4hPniW1OqRH+7suLxPkCFfgKQiw51WtM45Su41plHP6x/as
 +hloVn4XrGG7W0r8MSzh+3dVlcZH3IQP8mLyjvOJ32jYH+sbAWYZwuak
X-Gm-Gg: AZuq6aIfr8RWuEofEi2QxRhRjPBESNY0CLTEDcgN9NXdVnOsNtmKr03e7IdLkTg7f/y
 zZoSzjtEQcrcc7wwi3G5CkmdxRKXcoGtP2zXAqf4rgUmaiKtqIYh7NXxgyVovEpDuQnFWK8VHzT
 bLfTOzSEIhSaQoRbI4smh6We6QpFRl/xhbeUjd9zQmPR0dxBhs7FMpxLJAze3nosFnJjaCRi313
 ZlNmx4IJtif9quQOMla+e6h2bFqpB/AbxBkRgFglIYyUapBp55AOlmLFyVmrz6wBI0H4YmPr1/G
 uWSD320cvczb8TUpX6jNxzePdnLabxNjXYCOwGln2mNIGutYhV6FRiqFELM1X/Idh2krbdxzuYI
 ZLnPwiwcuHB8tVFwGzrfd3Bf2UolsTu86WZwR0iKcGaoub5b924i/tVFt7yHKUiyQXOVmSo/S91
 dDUplqyUmDnBWbst+LL2nvW2TlM4rEYuRlvLK8DGQlKGiUhUf1pIyA
X-Received: by 2002:a5d:649f:0:b0:435:db95:c2d3 with SMTP id
 ffacd0b85a97d-43782c9bc34mr235780f8f.36.1770752477131; 
 Tue, 10 Feb 2026 11:41:17 -0800 (PST)
Received: from osama ([41.44.59.149]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43629756bc3sm33615905f8f.39.2026.02.10.11.41.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Feb 2026 11:41:16 -0800 (PST)
Date: Tue, 10 Feb 2026 20:41:10 +0100
From: Osama Abdelkader <osama.abdelkader@gmail.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] drm/bridge: samsung-dsim: use
 drm_bridge_clear_and_put() to put the next bridge
Message-ID: <aYuJ1g5htsuMno__@osama>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260206-drm-bridge-atomic-vs-remove-clear_and_put-v1-0-6f1a7d03c45f@bootlin.com>
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
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:luca.ceresoli@bootlin.com,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:inki.dae@samsung.com,m:jagan@amarulasolutions.com,m:m.szyprowski@samsung.com,m:Hui.Pu@gehealthcare.com,m:ian.ray@gehealthcare.com,m:thomas.petazzoni@bootlin.com,m:linux-kernel@vger.kernel.org,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_TO(0.00)[bootlin.com,intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch,samsung.com,amarulasolutions.com];
	FORGED_SENDER(0.00)[osamaabdelkader@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[osamaabdelkader@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	TAGGED_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: C1D4D11EB4B
X-Rspamd-Action: no action

Hi Luca,

I just reviewed this patch and it looks good to me.
I'm not sure if I'm allowed to add review tag:

Reviewed-by: Osama Abdelkader <osama.abdelkader@gmail.com>

Best regards,
Osama
