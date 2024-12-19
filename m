Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 304C69F782B
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2024 10:19:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B31F10E09C;
	Thu, 19 Dec 2024 09:19:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fooishbar.org header.i=@fooishbar.org header.b="fTtKrddU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf2d.google.com (mail-qv1-xf2d.google.com
 [IPv6:2607:f8b0:4864:20::f2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE50C10E09C
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2024 09:19:11 +0000 (UTC)
Received: by mail-qv1-xf2d.google.com with SMTP id
 6a1803df08f44-6d91653e9d7so4827806d6.1
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2024 01:19:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar.org; s=google; t=1734599951; x=1735204751;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=3D4wLSOcQc+GROKEXXy8yXPOPy5sC8LKSQ39fU7Oer4=;
 b=fTtKrddUvog8cAErlLRCR0lyZZo0nnxgBiNL1obKxdpwzPmNDOgSyvf9QtLeS+X4Gg
 Zu5ku57v+vUl0jF+QfPnHM0oItid3suXY2674eq8/D/fMPV1hD9C5oy8TAyQOTATTRxz
 jv2+We037ni5DIrpNH5H1mT+Lz7GRKSz30FaTGv/vKgV/qkjDrjkaH9fVn1FAabKU76W
 y2ffr5nskcWgseQjsrbhgKqLptG+svnQTIhd5kkcG81D02tC63gNYfuf99EcOxu19BlT
 BxSr9NQHaPDlzysFlD/WWXZ9sKxr+HyFHYxBwfy5pnCWfiw/uDYd1gSyQdNO3rNfAuF0
 8Thw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734599951; x=1735204751;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3D4wLSOcQc+GROKEXXy8yXPOPy5sC8LKSQ39fU7Oer4=;
 b=mTKmPU2AY3sMUICivGRW7kW1OrHKuWsJiT8wYEyuWJXT1MfsmfXINqsu5mSfDSWR7n
 uyET9ghkelurvkNblycMy377bLYEP8LZfELzqEDj5MeH+qHH1HivHveVp7S5bxAil44F
 o8WyP7daVtiHzwIO7nFPr9oIyZd/hDeOgR/koV8LdIM3oYQ8c1LX+whpELWuLAqWQsOW
 qxnah9B4eNuT2earKF8JmUcM0lkCJSmPXruq/z06Ht7u4CDTWgW613ePF8q2L48PYSzO
 wQ7IlGLBwlIPSNy27BuuCaYwh16zE3bQDLl/XRFj+ofSf/3FSUvMk/Svyj/bT2DL9Q1K
 eH0A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUsY1pzb7DVYc0bIlKKoUDMJSTGQmfud+yVwMTQTROrsx1KWKjvwf+vfZxuctee00dVl2K8Ok3F8SY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyhKEsmcfYRo31w3rXBXCb2L+j2uUK5h0a8JQEwejG7UYJKnC/g
 Y5uXsuZ7g+9n/EfcgFn5i77Z6aUNbQCbZdaKAhMHHI9RJxaJXf+M8a22w1xYLQBk5JKseGJ7+Ro
 qJupF6PEapnE0iPEa9HwqKXGOx7yn35BeWh6bPA==
X-Gm-Gg: ASbGncudeeviJnaEDL85NbLUk2l5XH1IXK/sDquGGBt1LUL7Xf1XSuM8Lo6flTKTBb9
 Fj2rwuPBtEOf6+Qlc29Ui7DrFjOoAQt4leJs=
X-Google-Smtp-Source: AGHT+IEn/El0wECWPg7sF19DF1xGJ+3QqtNj8uW8hkxXqTFs976AsfsrK+r28Py8y4BC0/TKA9Q8z/3t4qaVRC1cogs=
X-Received: by 2002:a05:6214:23c7:b0:6d8:aa04:9a5d with SMTP id
 6a1803df08f44-6dd0918d99emr103056326d6.4.1734599950867; Thu, 19 Dec 2024
 01:19:10 -0800 (PST)
MIME-Version: 1.0
References: <20241213184705.317138-1-eric.smith@collabora.com>
 <CAPj87rMT-YsUj2gyfoCUFUPx0BWxAhcz8LgvAhco0-JzhKeXxQ@mail.gmail.com>
 <f9dd18f5-c239-4d96-b0e8-e11e9712fc8a@collabora.com>
In-Reply-To: <f9dd18f5-c239-4d96-b0e8-e11e9712fc8a@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Thu, 19 Dec 2024 09:18:59 +0000
Message-ID: <CAPj87rMxSbiqyF3AVwT9tBNFkv0oFDb+TtjRqs6ZLMSgW_6KzQ@mail.gmail.com>
Subject: Re: [PATCH] drm: add modifiers for MediaTek tiled formats
To: Eric Smith <eric.smith@collabora.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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

Hey Eric,

On Thu, 19 Dec 2024 at 00:20, Eric Smith <eric.smith@collabora.com> wrote:
> On 18/12/2024 10.33, Daniel Stone wrote:
> >> +/*
> >> + * MediaTek Tiled Modifier
> >> + * This is a tiled layout using tiles of 16x32 pixels in a row-major layout.
> >> + * For chroma planes this becomes 16x16 tiles.
> >> + */
> >> +#define DRM_FORMAT_MOD_MTK_16L_32S_TILE  fourcc_mod_code(MTK, (1ULL << 0))
> > I think this probably wants to be something like the tiling mode
> > defined in AMD/Arm modifiers, i.e. reserve a few bits in the range to
> > select the tile size, rather than using a single bit here.
>
> Thank you for taking the time, and for your suggestions. Are you
> thinking something along the lines of:
>
> [...]

Yeah, that's exactly it. You could even push the boat out and widen
the fields a little bit to give more headroom; if you want to change
the layout because you want to add more flags or whatever, you can
just do what Arm did, and take the top couple of bits as a layout
version or epoch.

Cheers,
Daniel
