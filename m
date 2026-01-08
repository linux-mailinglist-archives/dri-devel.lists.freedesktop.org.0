Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B2A4D05637
	for <lists+dri-devel@lfdr.de>; Thu, 08 Jan 2026 19:10:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9374310E7AE;
	Thu,  8 Jan 2026 18:10:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="GzVugBpX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com
 [74.125.82.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 903CA10E7AE
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jan 2026 18:10:54 +0000 (UTC)
Received: by mail-dy1-f180.google.com with SMTP id
 5a478bee46e88-2b04a410f42so2720080eec.0
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Jan 2026 10:10:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1767895854; x=1768500654;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=F++6n/4BGi0DmBqIND7slBXRlIzqau20b8FuxBFnyb0=;
 b=GzVugBpX05AOhuE3ArQmtoF9CjYnk10bhphinp7c36IeZHS/mxFyIhFkVFc3RibpT+
 aZdaK/ddWnfCkLpzQGHLeTBFCrE79uloE12kTx7nRJPbpLHsrJ038gl8mRiA6AtEsFsz
 UH+Kcel5y2afErtbBrGTRMCk4s8iJg6IKJqyg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767895854; x=1768500654;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=F++6n/4BGi0DmBqIND7slBXRlIzqau20b8FuxBFnyb0=;
 b=SnFK7wAVz5hW7U7ATZbNjopqRwewxdmpzgo2/i4CgDyahxLyZFQS0fno9n3/WrSIl8
 5Ac3DX89n/fo9SurKzORZd9xW/UakymQDGzlELCEpdxwwu6l+z9kSHfBIRuobOl7XsO4
 22Xmuvo5kebke9w92TJb8SiVwU50fsD/RQoIwLaQT3J3Uw1AEQ5ZNoBKbsKsoQUjvC2x
 KT091OwLDTsVOm/OFttYDLFKj0T7w4B2im9i7oQj8egnODgq15oAeAe8Jc3vaV0w3HlN
 SAT0U+SbG8B/cO+PgJA4PHvXykL8vL/2ujreD99+5uj5xsMtsZ27naNE2toCeqsxdI2/
 VcaQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWmX8oHT/eH4CyW9fOpyR6sBK257gRnvhHqZ+XhPPPoVi5ZmCaOuTubYp62EOp4l5aBkIQgCgmfqLo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz4DJajvmU+Pjs+gUGC++Sk4hcAWdTc+AVOClj+1FiAjkid4qD4
 +QwHsEQTDq8jo37nT6MZZGYxzUyLPPO3vjL6mPMXprEP7iyJqJNeVMcxazLvofacZw==
X-Gm-Gg: AY/fxX4zgGSAuXbcZIxcqNXB3iH4VohHPo3lR5txhKVfAiaQrU8a1k8x2bHNYF894dQ
 rbHKAWjtB/sOhEgfK989IWy0lgSIDJzy04fDZC8f0WEgGiPTuadJ/DUYw9cJuejVPVJLdgkjP9P
 6ifkHFcwR/9Y6IW6nlACEOm/8DZqDYknKoGGAhsM60Y1eIqkgLAWzHFarLEBIQrTo3xLgryX3Im
 Jg9KT1BFvIJKplNM5+1aMcriYFdUptkT6TO0M0rs9yJZiId9BnwnfEGduN589CTD6eRyJV8qL3Q
 f8h70Bf7zuhBeGqw97/bLR4uGYdA03NCIVHwWi+5pTxH2V49L7FcgjonjquytjW3pxm7qWp6/fS
 VD+r3xA1FljhiDR74Mrhh49fXwX4NEgspA4cFUwdpkbVho/uaUN/XerpSAQLMojxcg60LnBbFlI
 2AnbFFE5OTo4cxa7MfIzVMNwUX8fPqLWmPP55tJhub6eOcRs97jA==
X-Google-Smtp-Source: AGHT+IFZtAq/oB19PHGm/upN66kIM4s9EQpoNAY5OElHt+T0zXtCo0DhAz7vQLfjH1DBmXAAoy7l3Q==
X-Received: by 2002:a05:7300:220e:b0:2ae:5092:934 with SMTP id
 5a478bee46e88-2b17d344750mr4750303eec.37.1767895853821; 
 Thu, 08 Jan 2026 10:10:53 -0800 (PST)
Received: from localhost ([2a00:79e0:2e7c:8:d9f4:70dd:b942:60f7])
 by smtp.gmail.com with UTF8SMTPSA id
 5a478bee46e88-2b17078d818sm9030669eec.21.2026.01.08.10.10.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Jan 2026 10:10:53 -0800 (PST)
Date: Thu, 8 Jan 2026 10:10:51 -0800
From: Brian Norris <briannorris@chromium.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: tzungbi@kernel.org, jwerner@chromium.org, javierm@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 airlied@gmail.com, simona@ffwll.ch, chrome-platform@lists.linux.dev,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 0/8] drm, coreboot: Add DRM coreboot driver
Message-ID: <aV_zKzBth1TJNFvJ@google.com>
References: <20260108145058.56943-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260108145058.56943-1-tzimmermann@suse.de>
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

On Thu, Jan 08, 2026 at 03:19:40PM +0100, Thomas Zimmermann wrote:
> Coreboot implements framebuffer support via simplefb. Provide a
> native DRM driver. Keep the simplefb code for now.

I'm not much of a DRM-er, but what's blocking us from just replacing the
simplefb driver with DRM completely? Just being conservative and
allowing flexibility? Or are there technical reasons this wouldn't be a
proper replacement? It sounds like supporting 2 drivers provides at
least some small complications, like in patch 1, where you're trying to
avoid repeating similar logic in 2 framebuffer-handling drivers.

Brian
