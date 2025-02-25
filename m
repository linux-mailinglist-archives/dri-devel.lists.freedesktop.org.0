Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48421A44F5D
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 22:59:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36BCE10E367;
	Tue, 25 Feb 2025 21:59:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fooishbar.org header.i=@fooishbar.org header.b="a15ksJIT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com
 [209.85.222.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7382110E367
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 21:59:18 +0000 (UTC)
Received: by mail-qk1-f182.google.com with SMTP id
 af79cd13be357-7c0818add57so626814485a.3
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 13:59:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar.org; s=google; t=1740520757; x=1741125557;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=lhlRVTyXQdUVVfNqKiQrllxx1N3vzrAL5haFxdHIUL8=;
 b=a15ksJITE9YJlX8zqXVvsjH9TpkC7CL9V/eevxM/2XEyhv7zKKH4klb4uHkrCX5LTl
 rEELwdvTo2Gk1SIiOaZKcJG2Ltpl8MSeUbtfOI/3jxkwQ32qGfBMnGkvnaJGj97kwOsk
 CeU83UfUbrQN23wXd2HqmKqkY2jeSRPw1WXMP8m1vR52VMTXY0QhkUKlpe0V25mesiBI
 7IWvqx/Xj1TiiXbbBbuZSYvY1iNOCNXSgKP9NlYtLPP6bK9zIquSzq5FisPwq+HWj/mB
 NfcdIjpf+QnfBHYw8NJ6Mbr6mCaMYGggitU8cDPEBP0ewcJk4GY83LLlzukoFvgz4mKL
 oINg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740520757; x=1741125557;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lhlRVTyXQdUVVfNqKiQrllxx1N3vzrAL5haFxdHIUL8=;
 b=JF2dxSmu9iTWclP3ujlMpOnACPkQMzAseN9xKFMQdthd5fydaeXN1pJUVq40lPg/l3
 RAJD75/OvQPOlGfNPSJQff4GVfx74W82dju+FBWjthiPwbnGjHkMhHqA94F19hKJvCda
 lbjfV1Zt7PyD6ztjO3gsExDsv44LQ4EEbNOpal7gEUlwnYo4ZrXeJC1GiXUHoO9E2gY7
 0bC8yr5Uh9ItS7z4aBkDHjfciwPSHWf7qqSMr57wzBGSuPZSSaruW36RmSJ5riGciwrY
 BdxZC5SHlbhZqzUVg3Mc4OZeBWc7+S8rs7xr0R9aszwmuzq9U38cwy3JLpi+bh/u0eVW
 aetw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUCjVjdy0cZdQjM32eWKvVH81CrFMneTX/1EQcTJTCxWxod4FccdSKGzQXaQcUCPPl3qta9kqBwcgY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyYX8Y4lTwspnLKnnIAYRwa5HDM5RqmdKiXYwbozRLCbpKF6m6C
 UY0UX3AONhJqk2wocPbkeBp4d1uTqXlGpmNyeAF+AKAwaT+8pHqZ5OyFpblR42KHnn+27BeeU1o
 Am8cAqpVGV8L6T12DkJfvg94g4E4eLFtVhtxoiQ==
X-Gm-Gg: ASbGncshfrrr3TwnnxvG2SgF2Pc5fZNYRPGT16j26YRcvARYHkucGMprHv7rp1iGyW+
 2eOlNTG0dGZc5InuqzF8Ev1fgiQbSq+txH32GwqstNpCvLZEn3Hm/epXAwj8vESEOebt+Eap9kv
 V6RHFAWg==
X-Google-Smtp-Source: AGHT+IHayo9PtL6kjpIMX2v8YKQ15rB6H8J82Goph6no5zjxnEkePH22x+kK7BRT9XWlzl9eTGw2l4h92HsV0xvaCj8=
X-Received: by 2002:a05:620a:4883:b0:7c0:c7aa:d829 with SMTP id
 af79cd13be357-7c0cf9504a2mr2399399285a.42.1740520757416; Tue, 25 Feb 2025
 13:59:17 -0800 (PST)
MIME-Version: 1.0
References: <20250225-apple-twiddled-modifiers-v2-1-cf69729e87f6@rosenzweig.io>
In-Reply-To: <20250225-apple-twiddled-modifiers-v2-1-cf69729e87f6@rosenzweig.io>
From: Daniel Stone <daniel@fooishbar.org>
Date: Tue, 25 Feb 2025 21:59:06 +0000
X-Gm-Features: AWEUYZmTADfb83tXUekSIDeFibRB5L8olGgSSUtW8nnT-NuSQ4JhGFcoTWxAp7E
Message-ID: <CAPj87rO3N2=3mNQg8-CUF=-XTysJHLmgArRKuvDpdk3YZ2xMvQ@mail.gmail.com>
Subject: Re: [PATCH v2] drm: add modifiers for Apple GPU layouts
To: Alyssa Rosenzweig <alyssa@rosenzweig.io>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev
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

On Tue, 25 Feb 2025 at 21:35, Alyssa Rosenzweig <alyssa@rosenzweig.io> wrote:
> These layouts are notably not used for interchange across hardware
> blocks (e.g. with the display controller). There are other layouts for
> that but we don't support them either in userspace or kernelspace yet
> (even downstream), so we don't add modifiers here.

Yeah, when those have users with good definitions matching these, we
can add them here, even if they are downstream. Anything the GPU would
share out of context, or the codec, would be good for this.

> +/*
> + * Apple GPU-tiled layout.
> + *
> + * GPU-tiled images are divided into tiles. Tiles are always 16KiB, with
> + * dimensions depending on the base-format. Within a tile, pixels are fully
> + * interleaved (Morton order). Tiles themselves are raster-order.
> + *
> + * Images must be 16-byte aligned.
> + *
> + * For more information see
> + * https://docs.mesa3d.org/drivers/asahi.html#image-layouts

This writeup is really nice. I would prefer it was inlined here though
(similar to AFBC), with Mesa then referring to the kernel, but tbf
Vivante does have a similar external reference.

The one thing it's missing is an explicit description of how stride is
computed and used. I can see the 'obvious' way to do it for this and
compression, but it would be good to make it explicit, given some
misadventures in the past. CCS is probably the gold standard to refer
to here.

I'd be very happy to merge it with that.

Cheers,
Daniel
