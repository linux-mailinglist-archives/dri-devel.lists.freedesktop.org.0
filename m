Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60542984563
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 14:01:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB66E10E898;
	Tue, 24 Sep 2024 12:01:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="R+If1hw9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com
 [209.85.218.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8D2110E898
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2024 12:01:21 +0000 (UTC)
Received: by mail-ej1-f67.google.com with SMTP id
 a640c23a62f3a-a8a897bd4f1so815287166b.3
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2024 05:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727179280; x=1727784080; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=D2wkM8MceUdpaz5tbti6HFcDG2ZYxeGIAjkCyA9IpVw=;
 b=R+If1hw91Rj3szFB+scXIFuH1BWdnB6909cneOvnprqQRbbdFcJuVlA4t033f1xI3b
 qL9oLb1lHLnVGr+Muhjm6csZhGNTnKTiXKQBlDXgxqNKtEMCcOfLYzQpD1HbVYfhioMp
 z+TzD+4pY+5jg49GMGxoiKXXuKbJ/xYnX6beheog5E4e+dzbnu5re7/HSIZHZV6RFrzX
 DtwukUVsC7H8kImRwnjpPir+/LYKI1Xlz1R92JJ6JCAXScANVhxRKPorbv1ixM+uYv+H
 2TkPrLBZbOHnpg7N9ZGPI/iTuv5BtHGKnzedD/FfET5gBf7YEjQelMm1Y2MTkEJC410Z
 EUXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727179280; x=1727784080;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=D2wkM8MceUdpaz5tbti6HFcDG2ZYxeGIAjkCyA9IpVw=;
 b=gH3wa53c3vSOifpQULfZ9mUB72AzTQD+MwFKCwEfIgpi0sVPAvbJU7DkUXAGZ3q69e
 K19SESkcRS2fLjztMpJAB1HAFm4ENSW9UNo4P6Zm9EWD/E5A6PeMkmq2jq9Y9r9EgPQg
 ByMxEVR44q25AC0RdN6mlJcVjxnGn+YfOFAC8MlO+XUbWEgq7KbW/ASXk0+hoLlYiuhU
 UAQqgkAiPxWyupppAZUozttR3izHqp+qtk5l28hLzSqO2PFVAqbIr0rROcj3Lw+csdNP
 0f3gjVje5IV18XCRz4L7cbnanVIfbvjsuKOQWXUVjYkXZOKVJVAUfol5y8eUJKx3oBkW
 KY9Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVEVw8Njm/HbPYfG0DI85jwqxPLOAFHh5QzeeQPLpLniJie9KSdStJE6W7/BIR6ZVF6DzHlHNM3wSU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx9bSNY8IMxqsBPvRtVWHANPUC/IRvZW14JNL8lCsoJlPle/dGt
 tydNcj4JgRLAkqqizVntDAMtpXG0hJtwb/4OjiqEwvzDPOIJoecZ5DFtxCWEr6Aj/SeBpolZWow
 ejVlLCPgve6QaKn2NKoGlp1nHev0=
X-Google-Smtp-Source: AGHT+IFj3aAX7TONduQVRl0aDVye9cHiXiB1Q9dRt5Ij0vv8gJiBD7Z0JZgMv9QkrrMa2dqXYtZEeUy71igP0MXxbek=
X-Received: by 2002:a17:907:e246:b0:a90:d1e1:eeb3 with SMTP id
 a640c23a62f3a-a90d50d0521mr1357512066b.44.1727179279902; Tue, 24 Sep 2024
 05:01:19 -0700 (PDT)
MIME-Version: 1.0
References: <20240913091053.14220-1-chenqiuji666@gmail.com>
 <ZvKNVut_V9fiiaaT@phenom.ffwll.local>
In-Reply-To: <ZvKNVut_V9fiiaaT@phenom.ffwll.local>
From: Qiu-ji Chen <chenqiuji666@gmail.com>
Date: Tue, 24 Sep 2024 20:01:06 +0800
Message-ID: <CANgpojXKgZXjeCO9MYr83=p-Kz0_Migm4c9-4qTidHYp=G+fMg@mail.gmail.com>
Subject: Re: [PATCH] drm/vc4: Fix atomicity violation in vc4_crtc_send_vblank()
To: Qiu-ji Chen <chenqiuji666@gmail.com>, mripard@kernel.org, 
 dave.stevenson@raspberrypi.com, kernel-list@raspberrypi.com, 
 maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, airlied@gmail.com, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 baijiaju1990@gmail.com, stable@vger.kernel.org, simona.vetter@ffwll.ch
Cc: daniel@ffwll.ch
Content-Type: text/plain; charset="UTF-8"
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

Hi,

In the drm_device structure, it is mentioned: "@event_lock: Protects
@vblank_event_list and event delivery in general." I believe that the
validity check and the subsequent null assignment operation are part
of the event delivery process, and all of these should be protected by
the event_lock. If there is no lock protection before the validity
check, it is possible for a null crtc->state->event to be passed into
the drm_crtc_send_vblank_event() function, leading to a null pointer
dereference error.

We have observed its callers and found that they are from the
drm_crtc_helper_funcs driver interface. We believe that functions
within driver interfaces can be concurrent, potentially causing a data
race on crtc->state->event.

Qiu-ji Chen
