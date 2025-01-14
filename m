Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 293CAA10A89
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jan 2025 16:18:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 911BA10E38E;
	Tue, 14 Jan 2025 15:18:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="X0tN62Xp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 291BE10E37C
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jan 2025 15:18:40 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id
 a640c23a62f3a-aaeef97ff02so916410366b.1
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jan 2025 07:18:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1736867858; x=1737472658; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pQWVZCzJjONf9MD2zqQKoSy7C5/tRi8G57MPvXxDJbk=;
 b=X0tN62XpMMw/KnD58cwYI2ZRWOWRotoQ+7ERK3nIqwI326TlQ3Q5kpfPQs+GX5fEge
 FRvCQqxVJA+TlJm9CL4oNMKLHH+73aMlD1h9DqHI+KYBNGN5bwJ61dcLvmUH8LY5fOrL
 vAGyV7rgXOZfqCwCVEykdaVpjCD85unBziU1E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736867858; x=1737472658;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pQWVZCzJjONf9MD2zqQKoSy7C5/tRi8G57MPvXxDJbk=;
 b=lwlx4i9mIgFfSX2Pqwk9bqINHl6aqMt8I7vrN+lHG/ebTuwA50Zh1n/m50eOfDWZ3S
 mR4KbEwAoC+H7BJ93Z5uMwWUrgrda7ihb9PL3BajKVez+SoxAQb0sG4xH8YFfdCy3Xgj
 1/ajl38+EbHnoNXO9BSLMv6HhKKTsqYAJYixWHyGx5jFIiFg86Tu22EsJyt28IgcZ1C1
 1QFdnGiGZTssYEuJm4Z//AmJvulz/9h7qD/NY4jrcr6hS/OYst97JfOkedbhEkt8vWpg
 Dji/M/+fv4WgfNuj828i+9npN20peu7rUw6yxnhk/E5XIHrtTgNZ9t9mck10vg/1g4+g
 Lwng==
X-Forwarded-Encrypted: i=1;
 AJvYcCXoBQ+jTwuOoHUbfEVLd+csn6gX+05e/erRntlIzX+nMf/xUqG1hjj2LGa8/XJ6dtvdUXGB6h1zFkU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx9Sehr7TUHbMoiujKEAU/yfSBPUUOKPYsIko/EvBAnViZl0ODB
 fZhFthm7x3CZ5HuJuEvomM6kV+o5p3deyo1MjOsrqsAcqa2QRQHU9nnvkXzapI8=
X-Gm-Gg: ASbGncsCYcarkwgd5JydazRwdq0s6RPSGZqXlefY3Xa5G8ws+sy2Nc8oLnY/igBG3FB
 CYfkrI1Kk82PktbyEanekYZ2m3jD3eylQkhlvGwPNPQ+uSycT/G/mGDUYtbhqNhI05MyGCB9fEL
 wPTt68wgt8dcU/V4vb5FITaley1RW+xATzWhlSGLKb7TQlCHsL3yoaAKaf+Wxlo0dleHA0Ef6/j
 hSJJCvsWjZQ7QMpU+9CV8OPDD7gT0/KzUN0XYg7nyRJjALCWKfe6wVvu4V6QuUDwgL0
X-Google-Smtp-Source: AGHT+IGT2QdUEExo3ZYiHoJHmXJJ/EkUrorLws5bU4PVtJoU0zzZ/jzA8NZO5j2BZKS0oNyTy74E/g==
X-Received: by 2002:a17:907:6d04:b0:aa6:9ee2:f4c9 with SMTP id
 a640c23a62f3a-ab2ab6c6dffmr2382002566b.23.1736867858477; 
 Tue, 14 Jan 2025 07:17:38 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab2c90d9ae0sm648358966b.68.2025.01.14.07.17.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jan 2025 07:17:38 -0800 (PST)
Date: Tue, 14 Jan 2025 16:17:36 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Hector Martin <marcan@marcan.st>
Cc: devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 linux-usb@vger.kernel.org, linux-embedded@vger.kernel.org,
 Asahi Linux <asahi@lists.linux.dev>, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org
Subject: Re: Unified Type C PHYs and top-level port management
Message-ID: <Z4aAEA6Kmc4R-Wlb@phenom.ffwll.local>
Mail-Followup-To: Hector Martin <marcan@marcan.st>,
 devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 linux-usb@vger.kernel.org, linux-embedded@vger.kernel.org,
 Asahi Linux <asahi@lists.linux.dev>,
 linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org
References: <fda8b831-1ffc-4087-8e7b-d97779b3ecc5@marcan.st>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fda8b831-1ffc-4087-8e7b-d97779b3ecc5@marcan.st>
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

On Tue, Jan 14, 2025 at 09:32:11PM +0900, Hector Martin wrote:
> - On the DP/display side, we haven't implemented this yet, but in the
> future the single "apple,display-subsystem" driver (which actually
> provides the top-level DRM device for all the underlying discrete
> display controllers, and is already its own virtual device in the DT)
> will present virtual ports for the different PHYs, and handle the
> muxing/assignment between them and the display controllers on its side
> (there is potentially complex policy here too, since not all display
> controllers are equal and there may be a need to reassign a display for
> a lower-spec screen to a lower-spec display controller to free up a
> higher-spec controller for a higher-spec screen, but we need a
> controller assigned to a port to even read EDID to figure that out, so
> it's going to be messy).

Just on the DP/drm side I think the pieces are there, but might need some
polish:

- with drm_connector_helepr_funcs->detect_ctx and ->mode_valid_ctx you can
  temporarily steal a crtc for probing, and as long as you don't hold
  unrelated modeset locks userspace shouldn't notice. This goes back to
  crt/vga load detection where some hw needed drivers to light up a full
  crtc. There's also the entire drmGetConnector vs drmGetConnectorCurrent
  to avoid such potentially expensive probe steps and just reuse cached
  values.

- if you can't get a crtc for probing there's the "unknown" connector
  status. We could perhaps sharpen the semantics of this (like officially
  documenting that reprobing with all other crtc switched off sometimes
  helps), but it's there. I'm also not super worried about this case
  because we don't have any available crtc anymore, so even if we can
  probe there's no way to light it up without disabling some other stuff.
  And as soon as you disable other stuff you can probe everything again
  (with the fixed locking of the ->detect/mode_valid_ctx callbacks)

- for the crtc assignment issue there's either drivers virtualizing them,
  or userspace doing combinatorial probes. Personally I'm leaning towards
  drivers having to virtualize crtcs (and then you can peak the least one
  that works, which I think should sort this out), but it's an open and
  getting discussed in other areas (like having to steal crtc for
  dual-pipe outputs). We might get a proper documentation patch with an
  actual kernel/compositor api contract here.

> But I'm not happy at all with the weird, load-bearing intermingling of
> tipd/atcphy/dwc3 there. There's bound to be places where the
> abstractions leak and we end up with more and more horrible workarounds,
> or layering violations.
> 
> A further question is how all this should be represented in the device
> tree. That might drive the software architecture to a point, or vice versa.
> 
> Any ideas?

For the larger issue my only uninformed take is ... smells like too much
midlayer.

Like you'll certainly get some raised eyebrows if you submit a DP driver
without using dp helpers since that's a proper standard. But if your hw
has half the DP stack in firmware and just can't be smashed into the drm
dp helpers we have then I think even that would make sense.

Plus we already have like 3 different generations of dp helpers anyway,
because getting helpers right is kinda hard.

> Some further reading here:
> https://social.treehouse.systems/@marcan/113821266231103150

I dropped some unstructured replies with the same stuff on there too
first.

Cheers, Sima
-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
