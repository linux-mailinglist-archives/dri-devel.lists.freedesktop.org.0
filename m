Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D8E09126CC
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2024 15:40:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE32E10E6D7;
	Fri, 21 Jun 2024 13:40:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fooishbar-org.20230601.gappssmtp.com header.i=@fooishbar-org.20230601.gappssmtp.com header.b="bRKoVOtO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com
 [209.85.210.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5172B10E6D7
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 13:40:04 +0000 (UTC)
Received: by mail-ot1-f52.google.com with SMTP id
 46e09a7af769-6fa11ac8695so1164884a34.3
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 06:40:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20230601.gappssmtp.com; s=20230601; t=1718977203; x=1719582003;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Ere1lwWxpHnhEsQv1+nI645ZaQSfuhySCfH81OCdqI8=;
 b=bRKoVOtOjJwHh/0ozq0YQPAHNT3e3ta2E+CZEiBi+MKcVnmqVIlrtc+XTxNMKyvkz0
 gEBULQmVImQ8p/e0R30H+WMg+SKK7M8B/1A/T+TWJQYHpdRa8Ezl5hOtnvapNmPZMWp1
 H0kXznrYLY5gLvi3B0HcOxOShZY07rbGq5qtz9AU6HYseexbeok+YkvS7Em5myFICGVo
 6vKLcHOb+PqitoIUfO1xsuSlFQtwJhv0Rxyv4CXlWrNRE6L5nZ6/VwHf6M1FT+plRDX7
 g7xwpxM2T6a1xVZjieU180XGwqNaHMlcSaP0f95NZ4HzE5TBvH7VM1piQYe2XSxZ+IVw
 ZkSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718977203; x=1719582003;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ere1lwWxpHnhEsQv1+nI645ZaQSfuhySCfH81OCdqI8=;
 b=T8fe7Bz8gox6qZh/pG44+mr0W/5FTcPVUCkpJGCZE2zpwMFFTNVfgOBrFU5YMUgyQ+
 clgljbFeOJ5zYGIkiQnbImRtz095EZpPblnzyna9+Rc5mKbxN/5/lSps/ylOPeKoTmfD
 CXYe4aQDnN6vUR4bEfJKSVaxJd+CjfVnFItK+gr1p7TyI47hfIqr6ruKC0zH8EdLeHt+
 OEQDcNDgNSn3JAPST6UBUhJTevbU6bCBx7YMfWUdMQoktJwrcJnFWt3yj6ag6We8ZfYt
 EP2TATyG8heJjgzo09z/kVRpQU/E+OxZhz4+qB2SO+Onh0l/PYhTzbhEPE/1GrqmRYPt
 3Qxg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVNb5wZwhmVILCkc2V1jXsu0uA3udGbX4PJ1/6Z0eV2hM4CLBIjShP+2dsiRAfc8pPWePQd1JF+ywT8R35OOXqxv/2ln6TyR/7Im+Yl3RAY
X-Gm-Message-State: AOJu0Yyi7+65cry2JUghTCaEi5kZ11B2SyvltjS/LCH3WT2KMEba3xXi
 QViUCQWo3pd7ZDEJpdaZYVrzmKAo1r4Q8q56MwsVvr1npDMhw1v6mV5UfJSyCQsKagWZGUVBE3a
 K5goqg/ozhaNEH0gVh6xFotDsu2JTM3cq2CyA2Q==
X-Google-Smtp-Source: AGHT+IHNSvkive/L0tVLG0oV13zogBCO+6olLWgA1mQ/9kJKAK+336sy9TtUrgTi1RgDuWzriflW55CV7g4gRc9Dkqc=
X-Received: by 2002:a05:6830:1347:b0:6f9:5bfc:81f0 with SMTP id
 46e09a7af769-70075a76e1emr9246260a34.31.1718977203186; Fri, 21 Jun 2024
 06:40:03 -0700 (PDT)
MIME-Version: 1.0
References: <20240621131926.3133484-1-dave.stevenson@raspberrypi.com>
In-Reply-To: <20240621131926.3133484-1-dave.stevenson@raspberrypi.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Fri, 21 Jun 2024 14:39:51 +0100
Message-ID: <CAPj87rMPJvjw368_bW81p2kr=1Pj1Rq0gZeMRZOh+5X-fyHA2g@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] MAINTAINERS: drm: vc4: Add Raspberry Pi as
 maintainers
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Maxime Ripard <mripard@kernel.org>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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

Hi Dave,

On Fri, 21 Jun 2024 at 14:19, Dave Stevenson
<dave.stevenson@raspberrypi.com> wrote:
> Add myself as maintainer for VC4 alongside Maxime, and
> our internal review list as reviewer.

Both patches are:
Acked-by: Daniel Stone <daniels@collabora.com>

Cheers,
Daniel
