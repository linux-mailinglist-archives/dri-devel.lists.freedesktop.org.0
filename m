Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qG1hLsm8immmNQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 06:06:17 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 242E1116F4B
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 06:06:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E14C410E1DB;
	Tue, 10 Feb 2026 05:06:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="WVKry/3b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E92310E1DB
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Feb 2026 05:06:12 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id
 98e67ed59e1d1-34be2be4b7cso281042a91.3
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Feb 2026 21:06:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1770699971; x=1771304771;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=wMMIDaH2OMrzByxZGI9BwGClJ/ZnKLT/rEz49GNyBFQ=;
 b=WVKry/3bTLI1N3MQo9Q0r3fc6JypspZpEcj6F6CpOv3fauo/q0kz+Ttqa360r6YLTv
 DUbCceG8qq1c4BibHvNXT3qQK8l+jwJxyP0LwFQzY/O8gl2LTCNbokFHYYkE1Kk/e+FA
 rTK9XTqyvOUsAyGpGeSCHD/MhqaUWjFmIW+9c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770699971; x=1771304771;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wMMIDaH2OMrzByxZGI9BwGClJ/ZnKLT/rEz49GNyBFQ=;
 b=sEx1FChvXKjd1Q+nZiua4coNOpwEdU6iq/1WRECKdeGw6cN83u6S/FWPyCNP87Mikd
 OMU+whw/JPW+ycEMoSYeXPWDvC7h2wrisAzVZb9QWVHK0GCxYV8vFGFfdmIO+FjgkdFb
 JilB7ajk3eP9hfsdfLxHaZPxlYSvBvYng6aT2Y3Bapzwc5Jtu33y+odfyM9trNHrGW3Y
 ChsSt3n8DeY3jfTEi9BQbLqfcClGBvvZHy2drfKixNXRd/WdRPX9knkpb7vcJ/M6dpmv
 m8566dS78AbT3J1bcZUI4PpjHKaRjuj1bNT04lbH4zOauLy6RroHt1PjqwoX0lFgyZnf
 CZHA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUk+EuOUF80JnFcL4EKhWywTulxynulnAA0jcH4OTHc8XQ1D+RwA99dYYylByHkMDifpggHaEm3w8I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxDR+ZvsICNCsBPB7Yi2KOj6VRjx/822dvSxvb1ps2n4mRB8/LF
 LXz9kCQgNTjTb0QwdjgO7gjAJFeDxGo0KzYDAzCu7U8ox3r9Fwp7Fklhl6/UOpTVaA==
X-Gm-Gg: AZuq6aJW6qhzOrUf4hlCu89VO2Y23LXH8mvIoe7CTWuMMU9KLO0sVT6hN/TUbYPTkxc
 ugpOk/hbW2UB8um7iwX40lS9gGl0C06N1QTFj/GwokeaU7RpuFT8MrUanIsLgfzafa1qJidSejY
 oC04hdU8A9LXuUpUp9XhcmG2g92opnqesqn0QHGzkfnJlIoBM+e0QFUs+a6/2lnkSxYBosBzMZN
 /Ufh1ibwLadNc+0udR3kg2l/43YVZ41wKKe1IhBnaB6mD5Siy+Nv/M/SSKwZwXxqTY7Zd9/wPLd
 Ay2Eos0cvzHqYO7tcOXq/GDwDQAJQg8MX1n4bb9ZMfjQyTXiSvdsAgJDHwVdfouWbpOU/Vrb/EM
 D3Uuy3d3vdZ1BMe5RXl4NhD2Sy+Wf1SgvQXiSSEKVNPdu5g+79KRGJRRseDbS5dwtf8Kv0jYo7U
 TyfvjI6wcTk3OCg65S49b15h/Yx6Hvvp4y+NKJbmlq75HTSUjdo6xs4Ao=
X-Received: by 2002:a17:90b:314c:b0:34c:9cec:dd83 with SMTP id
 98e67ed59e1d1-354b3e4b663mr12562993a91.27.1770699971626; 
 Mon, 09 Feb 2026 21:06:11 -0800 (PST)
Received: from google.com ([2a00:79e0:201d:8:822c:995b:f23f:e04e])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3562fc6f342sm3648006a91.0.2026.02.09.21.06.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Feb 2026 21:06:11 -0800 (PST)
Date: Tue, 10 Feb 2026 13:06:06 +0800
From: Chen-Yu Tsai <wenst@chromium.org>
To: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com,
 simona@ffwll.ch, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, greenjustin@chromium.org,
 sjoerd@collabora.com, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com,
 Macpaul Lin =?utf-8?B?KOael+aZuuaWjCk=?= <Macpaul.Lin@mediatek.com>,
 Daniel Stone <daniels@collabora.com>
Subject: Re: [PATCH] drm/mediatek: Disable AFBC support on Mediatek DRM driver
Message-ID: <20260210050606.GA852606@google.com>
References: <20251024202756.811425-1-ariel.dalessandro@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251024202756.811425-1-ariel.dalessandro@collabora.com>
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
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ariel.dalessandro@collabora.com,m:chunkuang.hu@kernel.org,m:p.zabel@pengutronix.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:greenjustin@chromium.org,m:sjoerd@collabora.com,m:linux-mediatek@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:kernel@collabora.com,m:Macpaul.Lin@mediatek.com,m:daniels@collabora.com,m:matthiasbgg@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[wenst@chromium.org,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,pengutronix.de,gmail.com,ffwll.ch,collabora.com,chromium.org,lists.freedesktop.org,lists.infradead.org,vger.kernel.org,mediatek.com];
	DKIM_TRACE(0.00)[chromium.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[wenst@chromium.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 242E1116F4B
X-Rspamd-Action: no action

Sorry for revisiting this old thread.

On Fri, Oct 24, 2025 at 05:27:56PM -0300, Ariel D'Alessandro wrote:
> Commit c410fa9b07c32 ("drm/mediatek: Add AFBC support to Mediatek DRM
> driver") added AFBC support to Mediatek DRM and enabled the
> 32x8/split/sparse modifier.
> 
> However, this is currently broken on Mediatek MT8188 (Genio 700 EVK
> platform); tested using upstream Kernel and Mesa (v25.2.1), AFBC is used by
> default since Mesa v25.0.
> 
> Kernel trace reports vblank timeouts constantly, and the render is garbled:
> 
> ```
> [CRTC:62:crtc-0] vblank wait timed out
> WARNING: CPU: 7 PID: 70 at drivers/gpu/drm/drm_atomic_helper.c:1835 drm_atomic_helper_wait_for_vblanks.part.0+0x24c/0x27c
> [...]
> Hardware name: MediaTek Genio-700 EVK (DT)
> Workqueue: events_unbound commit_work
> pstate: 60400009 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> pc : drm_atomic_helper_wait_for_vblanks.part.0+0x24c/0x27c
> lr : drm_atomic_helper_wait_for_vblanks.part.0+0x24c/0x27c
> sp : ffff80008337bca0
> x29: ffff80008337bcd0 x28: 0000000000000061 x27: 0000000000000000
> x26: 0000000000000001 x25: 0000000000000000 x24: ffff0000c9dcc000
> x23: 0000000000000001 x22: 0000000000000000 x21: ffff0000c66f2f80
> x20: ffff0000c0d7d880 x19: 0000000000000000 x18: 000000000000000a
> x17: 000000040044ffff x16: 005000f2b5503510 x15: 0000000000000000
> x14: 0000000000000000 x13: 74756f2064656d69 x12: 742074696177206b
> x11: 0000000000000058 x10: 0000000000000018 x9 : ffff800082396a70
> x8 : 0000000000057fa8 x7 : 0000000000000cce x6 : ffff8000823eea70
> x5 : ffff0001fef5f408 x4 : ffff80017ccee000 x3 : ffff0000c12cb480
> x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff0000c12cb480
> Call trace:
>  drm_atomic_helper_wait_for_vblanks.part.0+0x24c/0x27c (P)
>  drm_atomic_helper_commit_tail_rpm+0x64/0x80
>  commit_tail+0xa4/0x1a4
>  commit_work+0x14/0x20
>  process_one_work+0x150/0x290
>  worker_thread+0x2d0/0x3ec
>  kthread+0x12c/0x210
>  ret_from_fork+0x10/0x20
> ---[ end trace 0000000000000000 ]---
> ```
> 
> Until this gets fixed upstream, disable AFBC support on this platform, as
> it's currently broken with upstream Mesa.

Do you remember the circumstances you had an issue with?

Looking at our notes, it seems that for MT8188 only vdosys0 supports
AFBC. And on MT8195 it has issues with color correction on the second
pipeline. The driver as currently seen in next-20260209 only signals
AFBC support for the first pipeline on these two platforms. So I don't
see any issues there.

The commit you mentioned that introduces AFBC support failed to take
into account this flag when exposing AFBC support to userspace. But
this was subsequently fixed by:

    8d121a82fa56 drm/mediatek: only announce AFBC if really supported

On my MT8188 based Chromebook, only the planes for the internal display,
i.e. the first or vdosys0 pipeline, show AFBC support.

AFAICT the Genio 700 EVK only has one external HDMI connector, and that
is tied to the second pipeline, which should not have AFBC support
announced. I'm not sure why mesa would still be using AFBC then.


Thanks
ChenYu
