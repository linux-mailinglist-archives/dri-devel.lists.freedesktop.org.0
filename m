Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qA1BNqHwkmlA0QEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 11:25:37 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F4E714252E
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 11:25:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1669A10E10B;
	Mon, 16 Feb 2026 10:25:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Elgdwj62";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12AEF10E10B
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Feb 2026 10:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1771237532;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qkkyUWFiOiR4ybl48uLvGZuH0EeXWDQWG9ZNGd0RJ4M=;
 b=Elgdwj6253W7LCzdQRjdf8YU+qqThcotLwhq119EgRI2wzmO5/mBEhAZUomdVNBocayTq7
 yxaRCnVX+/6HfRNAHRp87qLgHItS1iwRXzU4sHMfHhzr3WKXJQsXM2D6hE2hNksGXEwkCc
 4kB1dSoQqiQ8I0j4D1qV3PEUNB01QT0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-168-h6C71FkANOWRC-cfXvL-xA-1; Mon, 16 Feb 2026 05:25:31 -0500
X-MC-Unique: h6C71FkANOWRC-cfXvL-xA-1
X-Mimecast-MFC-AGG-ID: h6C71FkANOWRC-cfXvL-xA_1771237530
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-4837c597cd5so9839075e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Feb 2026 02:25:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771237530; x=1771842330;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qkkyUWFiOiR4ybl48uLvGZuH0EeXWDQWG9ZNGd0RJ4M=;
 b=K01NNlZ/6TvXYDh47dt3lPrFhSkrvaUqNtXVpsYNoEgF3yJslE4bCXE5w4rkB+ZfXP
 vOqYlLf0J8FTcli5F6WbW8t+RhcdNG3bAkwXIiHwMLHC84LylzxNeCeCy8YKl8lAngKp
 FHHj6SFWZyJNMopy+ABHq+GTu75ivKf2RAmEZ7q7F4vCYoDFheHCURAPl2FqnqOTnYIa
 fROpFtArsiWRDjX18Nz3ATh6hcO4WQH5KWCerB6p11gI5zEtMf5qA8blYO4pAtjITbur
 I3BF+L4tFBgcgSqxQjn28if4HkkbQBwmGo9yjgf+ciT5bTnqSepwFbs3VY0hoolU9kFQ
 3siA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVxJDG4SkcQRF24eq/liAcK1kTTKKi1zxPRNpz9xLKN8wJz5NOwLmWCCSRC0NDnbxw1khW+mWimW04=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzfr370+TzK4mFe3llZeoW+ze98UZqVZk+XmVxh4L7o6jNRe0H6
 MYmuJ4DDeL8KiCXn/IKprgHRmGODVTZ8LTv2uRNHeEOsg6bsC/zkR1b+dZFvOKqiiR154QpnhD0
 KXRV8DZh9JEpBwml4xjwn6hYwaHGlRqU4wzU1vRhfgHRKO+g6PtRwyU+vHecapBoIFeg3/g==
X-Gm-Gg: AZuq6aJV53gICt5kDcG5aNdS/VDkBVlOXOmjhHJn3qgwkQDvS+SD0xggFrPKImoSbNE
 QdHNpEAYiSkMiqt1wN1NsxPY/oXBZjU7g8tDpheyHH7MLjcB1sz7vHefGJiaUEYyX8jTod8mGbH
 4g9ZZhSItsFtmf3EpXFIvsTkhI74ghmyap1hv0QgbYoW0nzpo1dM0g6fEg3rewHVSdHGqEPDiRg
 ipysMxshLjOb9XSZCz6iI9jcMiG1+kOZANnvWbmplYrpjz/YcqgIsmc700EzlZKzstOAoFEkb1t
 EP51VKceob3kQAlxFO+oqoe6NN7UPNJTq7oBUS2ltFrKg5i12sO3FXXHKGcjnYtp2ZkGw141IDG
 uwl0JGKHrl1wWYhRH6UE7teDL/hhKBl1BYtqqmBgbYJKSnaN2vFxnM2TbObRVZPcrFOH2aARtO+
 wmdIcC
X-Received: by 2002:a05:600c:34c3:b0:483:3d42:d04f with SMTP id
 5b1f17b1804b1-48373a7b7bcmr166696635e9.37.1771237529672; 
 Mon, 16 Feb 2026 02:25:29 -0800 (PST)
X-Received: by 2002:a05:600c:34c3:b0:483:3d42:d04f with SMTP id
 5b1f17b1804b1-48373a7b7bcmr166696295e9.37.1771237529230; 
 Mon, 16 Feb 2026 02:25:29 -0800 (PST)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48370a5ca56sm117723755e9.3.2026.02.16.02.25.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Feb 2026 02:25:27 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, tzungbi@kernel.org,
 briannorris@chromium.org, jwerner@chromium.org, samuel@sholland.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch
Cc: chrome-platform@lists.linux.dev, dri-devel@lists.freedesktop.org, Thomas
 Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v3 11/12] drm/sysfb: corebootdrm: Add DRM driver for
 coreboot framebuffers
In-Reply-To: <20260203135519.417931-12-tzimmermann@suse.de>
References: <20260203135519.417931-1-tzimmermann@suse.de>
 <20260203135519.417931-12-tzimmermann@suse.de>
Date: Mon, 16 Feb 2026 11:25:26 +0100
Message-ID: <87ecml6l49.fsf@ocarina.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: HNDzvR_ZZd5GfnqXpwSZdFVdPLISlreHgjvgRNmtnnc_1771237530
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:tzimmermann@suse.de,m:tzungbi@kernel.org,m:briannorris@chromium.org,m:jwerner@chromium.org,m:samuel@sholland.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:chrome-platform@lists.linux.dev,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[suse.de,kernel.org,chromium.org,sholland.org,linux.intel.com,gmail.com,ffwll.ch];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[javierm@redhat.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[redhat.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[javierm@redhat.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,ocarina.mail-host-address-is-not-set:mid,chromium.org:email]
X-Rspamd-Queue-Id: 2F4E714252E
X-Rspamd-Action: no action

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Add corebootdrm, a DRM driver for coreboot framebuffers. The driver
> supports a pre-initialized framebuffer with various packed RGB formats.
> The driver code is fairly small and uses the same logic as the other
> sysfb drivers. Most of the implementation comes from existing sysfb
> helpers.
>
> Until now, coreboot relied on simpledrm or simplefb for boot-up graphics
> output. Initialize the platform device for corebootdrm in the same place
> in framebuffer_probe(). With a later commit, the simple-framebuffer should
> be removed.
>
> v3:
> - comment on _HAS_LFB semantics (Tzung-Bi)
> - fix typo in commit description (Tzung-Bi)
> - comment on simple-framebuffer being obsolete for coreboot
> v2:
> - reimplement as platform driver
> - limit resources and mappings to known framebuffer memory; no
>   page alignment
> - create corebootdrm device from coreboot framebuffer code
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Acked-by: Julius Werner <jwerner@chromium.org>
> ---

The driver looks good to me. I couldn't spot anything wrong on it.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

