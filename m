Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KB5uFJh4gGne8gIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 11:12:40 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2E41CAA4D
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 11:12:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39B5D10E411;
	Mon,  2 Feb 2026 10:12:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="BVRKcqQa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5472310E415
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Feb 2026 10:12:36 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-47ee07570deso35363715e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Feb 2026 02:12:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1770027155; x=1770631955; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=u5iMSISoPXHP8cm/BuB1aiphidaUfX1u3Xy0JvO160Q=;
 b=BVRKcqQa6r9B2qCRhZCy9xQaPhWsWWoCd00fVo7wC+0W9mD5eQ0qSarobJoHUC/eZ7
 tJhSSDPuMMYo619Tf1PewTf8SNFCTktcjmM33ltP0n/J2CDaHZLSOJO1hf1BJUOk3zMX
 QIQZJq11UO64T7p6s4c9/oW521ZQydixgOPcL2QoOdruVhp7mBnvzpTGgxyF1HlbaUAL
 /SfHo3A7PikeHEmR+8fPshXSJ2b6yURRYaMawA/qQ1AIRK5KuMLbW2C0ncCCQE/ICv4k
 SYJjbC5Z3s/KrsHCAjALfNEDJEJd108kyXNYx3pLhbno2AOy7vEa0Veqdc7uGRfM/z2A
 PvNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770027155; x=1770631955;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=u5iMSISoPXHP8cm/BuB1aiphidaUfX1u3Xy0JvO160Q=;
 b=J9icl835w5rYqJvycqPNUR6velIn8jqmlF1vPdb1gtQ/EVmbVaU9873zIxqhNwCFNP
 0OyK2cdPB1gxUsZSc7jdvBGpvephMXEwRZE6bObdfHZ+j3tSflhVck0z0wGgSbChPwbe
 mLGhUD89J9CH2obnHgK/X+DikN+bzCA7L+u5OXCiNRKHj2KhSxKMPI2esTwQA0Mi4N33
 94YTU/i7w2VEWXRE+ersXY2406DTCe4cayalkCmRel6yMsZj7jVuZZ/EXNm59PkM0Rma
 aCgSi23RMB+YNXjzv7XUntBkohabbhOo19MhsDr1Irmp+hi70LcybkOJera3/UfY8sSZ
 pL3g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXAXWqvv/aZmfL+YF1m19U4z1xGwJhdQGFPCB4gB8Tzafyyxx5iceuo3jznAgXAJ9QDc0301CHXXgg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxDFD1aKc5YFjpoo6ycrQTRJawpcVPSZXATZlqffo9fU9/vQV5v
 2zIkHtnkQlPpzYy9JwM/vKzkvlQWGOY2q1pM4Nj5viAJ+Zoxr0SOqvlbrtIsaedqH1Q=
X-Gm-Gg: AZuq6aLa1ggxn2vhqA7df/1OCY/eDAb4cmESiwOmgyWjCHa5QgkUSNWjWRVnD0Ik0/M
 Ru11wEwNs/YjCNKxiFE4kWqqX9HrhX863WgD9NdKlkaR09Xo5nmNi4lSv1fIT67HCxCXXnijnAn
 TcSVdWx+73tIO2s1l/I5oWc9Wa0YD9OhwSvO+9NIuvYDx+q5XHFbBLcd0emIQZKB2PEz2ucd4Cx
 XWneoto9hq1vRmonfL6IwEpShdOkIiXPd6574RH3AP+dHkF1VIzTNOYiZlA/ZCexBEwZvn862y5
 YG6aQYDRKVTrvuxfqol6DW6Cq3lbsUC3FfHXiSHZTHroLo4wWyuyjrZQEbfjitkjyMyrSbGHyXm
 WyExYWXce5ArGGtZtAqh6wVxL4qNj0bGt7o1gtAGx7Xhb+6mRvBam3JQihkvNpNcN9UlzTWlQqg
 GEIyZboIbSmoZL6gsC
X-Received: by 2002:a05:600c:5566:b0:482:dbd7:a1c1 with SMTP id
 5b1f17b1804b1-482dbd7a308mr90480105e9.34.1770027154676; 
 Mon, 02 Feb 2026 02:12:34 -0800 (PST)
Received: from localhost ([196.207.164.177]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4806cdd78d3sm399143985e9.1.2026.02.02.02.12.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Feb 2026 02:12:33 -0800 (PST)
Date: Mon, 2 Feb 2026 13:12:30 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Shenghao Yang <me@shenghaoyang.info>
Cc: Ruben Wauters <rubenru09@aol.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 stable+noautosel@kernel.org, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2] drm/gud: fix NULL crtc dereference on display disable
Message-ID: <aYB4jhjqC4ij5LBO@stanley.mountain>
References: <20260201095956.21042-1-me@shenghaoyang.info>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260201095956.21042-1-me@shenghaoyang.info>
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
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[dan.carpenter@linaro.org,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:me@shenghaoyang.info,m:rubenru09@aol.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-kernel@vger.kernel.org,m:stable+noautosel@kernel.org,m:lkp@intel.com,m:stable@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[aol.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org,intel.com];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dan.carpenter@linaro.org,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,noautosel];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,linaro.org:dkim]
X-Rspamd-Queue-Id: B2E41CAA4D
X-Rspamd-Action: no action

On Sun, Feb 01, 2026 at 05:59:56PM +0800, Shenghao Yang wrote:
> gud_plane_atomic_update() currently handles both crtc state and
> framebuffer updates - the complexity has led to a few accidental
> NULL pointer dereferences.
> 
> Commit dc2d5ddb193e ("drm/gud: fix NULL fb and crtc dereferences
> on USB disconnect") [1] fixed an earlier dereference but planes
> can also be disabled in non-hotplug paths (e.g. display disables
> via the desktop environment). The drm_dev_enter() call would not
> cause an early return in those and subsequently oops on
> dereferencing crtc:
> 
> BUG: kernel NULL pointer dereference, address: 00000000000005c8
> CPU: 6 UID: 1000 PID: 3473 Comm: kwin_wayland Not tainted 6.18.2-200.vanilla.gud.fc42.x86_64 #1 PREEMPT(lazy)
> RIP: 0010:gud_plane_atomic_update+0x148/0x470 [gud]
>  <TASK>
>  drm_atomic_helper_commit_planes+0x28e/0x310
>  drm_atomic_helper_commit_tail+0x2a/0x70
>  commit_tail+0xf1/0x150
>  drm_atomic_helper_commit+0x13c/0x180
>  drm_atomic_commit+0xb1/0xe0
> info ? __pfx___drm_printfn_info+0x10/0x10
>  drm_mode_atomic_ioctl+0x70f/0x7c0
>  ? __pfx_drm_mode_atomic_ioctl+0x10/0x10
>  drm_ioctl_kernel+0xae/0x100
>  drm_ioctl+0x2a8/0x550
>  ? __pfx_drm_mode_atomic_ioctl+0x10/0x10
>  __x64_sys_ioctl+0x97/0xe0
>  do_syscall_64+0x7e/0x7f0
>  ? __ct_user_enter+0x56/0xd0
>  ? do_syscall_64+0x158/0x7f0
>  ? __ct_user_enter+0x56/0xd0
>  ? do_syscall_64+0x158/0x7f0
>  entry_SYSCALL_64_after_hwframe+0x76/0x7e
> 
> Split out crtc handling from gud_plane_atomic_update() into
> atomic_enable() and atomic_disable() functions to delegate
> crtc state transitioning work to the DRM helpers.
> 
> To preserve the gud state commit sequence [2], switch to
> the runtime PM version of drm_atomic_helper_commit_tail() which
> ensures that crtcs are enabled (hence sending the
> GUD_REQ_SET_CONTROLLER_ENABLE and GUD_REQ_SET_DISPLAY_ENABLE
> requests) before a framebuffer update is sent.
> 
> [1] https://lore.kernel.org/all/20251231055039.44266-1-me@shenghaoyang.info/
> [2] https://github.com/notro/gud/wiki/GUD-Protocol#display-state
> 
> Cc: <stable+noautosel@kernel.org> # won't apply cleanly on 6.18.x

Why are you adding this?

I suspect it's because checkpatch complains that commits with BUG: in
the commit message should be CC'd to stable.  (Although, I can't trigger
that warning now.  Weird).

If a patch doesn't apply, then the stable scripts aren't going to apply
it.  It's not necessary to tell the scripts not to try.  To me the
"noautosel" basically means that it's important to not backport the
patch.  Maybe the API has changed so backporting it will cause a subtle
breakage.

Are you planning to manually backport it? If so, you could CC stable
and then when you get the email that it doesn't apply, then you can do
the manual backport.  Or you could ignore it.

Or if you think it's not worth backporting, you could explain why.

Cc: <stable+noautosel@kernel.org> # too risky for low benefit

regards,
dan carpenter

