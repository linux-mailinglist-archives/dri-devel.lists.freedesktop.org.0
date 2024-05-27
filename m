Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4079C8D0896
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2024 18:30:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2885D89317;
	Mon, 27 May 2024 16:30:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="mYpn/ir6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com
 [209.85.128.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A02F89317;
 Mon, 27 May 2024 16:30:47 +0000 (UTC)
Received: by mail-yw1-f179.google.com with SMTP id
 00721157ae682-62a2a6a5ccfso16206877b3.3; 
 Mon, 27 May 2024 09:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1716827446; x=1717432246; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=TooJjYc9+ZvZldvvOeHGVx6l39vdG5OagEP3ueKAv+g=;
 b=mYpn/ir6UJzIH+XhjMfvGw3p6xSZr+nJHMd/xIskr8LhnysbLr9NyNRPBXkRGmQ/Cp
 dyLoa77yizH/a+VBIsS7p6CWPbfs1n2A/bI5xgrUKG3DrnEwBBR7OkCJA9E0bUlkRqSe
 ES3gF+xvUy7UX44yC74C7LO8HVvFafw8G+1LHFF2L73cT3jmUJFZPAeddRgYtsd/gDwn
 YO3rvkswfn4+MxjdnZjsA/XZeca7V91Wdr8hY6Lig3ieWCWRU8SJqfbB9JzTCyqHxHv/
 rz5Uzru1hGpNGFMsVrketM0gh7oLyoqJXp9Akvcd4ymkaBuUHajwCvYQyvUnnF8XpsbG
 YlfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716827446; x=1717432246;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TooJjYc9+ZvZldvvOeHGVx6l39vdG5OagEP3ueKAv+g=;
 b=tD3tlkeEnBXwVBQopyhUnRP4oA7848pEcXJaILQo/8bw9Q9o+tMUZd04Yn9UOhypSH
 5HDBgHSms+IHZxJaNaPFud0qRhoqMYVk+l8lWEre6i5zmBdjcGPcoeM0jtwlIag4e6/T
 EUJoVz0cMVAPYdU7nsma0E78IgSnEbYeJZRdeYWNxrQasJyssLa8PAqkILJ6Jdjhg+Nq
 wXyi1GtF0E0jl/ak6ad+zF6XZXxhsZqz8dNMwtxbgOgG7wLNSxJaLU7ZeMMQWZBB6RnL
 WNuRqr9lpeLrD9/V6CZnK8U5Jr1kIk/sf0xV210Tn5mFn9cDtB627ybkCxdBVupT2yak
 bUmA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUYF5bm9wD5d7EjaTde1IIZe2phewa8M4jCEzc4avwVc6IIhT2sH76jMc8deprgOdB7TkuVuxfRNj+NNa/gRJ/el4vYcHJ6ggQGqGd4xw==
X-Gm-Message-State: AOJu0Yx3exjYuWCs8/dyE127s/Tmgbg6MIVPxKZY+PBfTgt0u8+jXfKa
 2vjuz6bL7n0HR6/FppB3xLqUBlKaFOUV9dFqwBN+ZQMIgPi353efOBA7mn0FKJlW25ThcyHl3qJ
 qD8ygEXrRKPZVuRsS4Yzk+2URNMM=
X-Google-Smtp-Source: AGHT+IEM4bi95EaTV8h1FgKgrzX448W7L+5D5l7ZUOFNS+/Ko7+gOTIRnKVdNXvixhChnUcRfqjaRN0leGF0t/i2Sxw=
X-Received: by 2002:a81:4ed1:0:b0:622:ccd5:3fa1 with SMTP id
 00721157ae682-62a08d8871fmr100295777b3.12.1716827446031; Mon, 27 May 2024
 09:30:46 -0700 (PDT)
MIME-Version: 1.0
References: <20240527142311.3053-1-mario.limonciello@amd.com>
In-Reply-To: <20240527142311.3053-1-mario.limonciello@amd.com>
From: Chris Bainbridge <chris.bainbridge@gmail.com>
Date: Mon, 27 May 2024 17:30:34 +0100
Message-ID: <CAP-bSRadDh0=WPepQUC3QhZf5x6Y1DdDT=qcEGwRrHXkOD8zmw@mail.gmail.com>
Subject: Re: [PATCH] drm/client: Detect when ACPI lid is closed during
 initialization
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 linux-kernel@vger.kernel.org, Alex Deucher <alexander.deucher@amd.com>
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

On Mon, 27 May 2024 at 15:23, Mario Limonciello
<mario.limonciello@amd.com> wrote:
>
> If the lid on a laptop is closed when eDP connectors are populated
> then it remains enabled when the initial framebuffer configuration
> is built.
>
> When creating the initial framebuffer configuration detect the ACPI
> lid status and if it's closed disable any eDP connectors.
>
> Suggested-by: Alex Deucher <alexander.deucher@amd.com>
> Reported-by: Chris Bainbridge <chris.bainbridge@gmail.com>
> Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/3349
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
>  drivers/gpu/drm/drm_client_modeset.c | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)

Thanks. Works for me.
Note that I tested against mainline commit f0cd69b8cca6 due to
regression https://lore.kernel.org/all/CABXGCsN1z2gj99zSdhQWynpTXBymrqHejDfF8axxxoiZ_0g_-g@mail.gmail.com/
