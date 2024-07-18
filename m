Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DD97934C39
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jul 2024 13:10:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CB6410E77F;
	Thu, 18 Jul 2024 11:10:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fooishbar-org.20230601.gappssmtp.com header.i=@fooishbar-org.20230601.gappssmtp.com header.b="WAMnIcrQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com
 [209.85.222.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 548D310E77F
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2024 11:10:44 +0000 (UTC)
Received: by mail-qk1-f178.google.com with SMTP id
 af79cd13be357-79f178e62d1so11470785a.1
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2024 04:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20230601.gappssmtp.com; s=20230601; t=1721301043; x=1721905843;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=g2difOvlWIEO63yHi+zzCArMOSeh2R/YOZyOxHPP5y8=;
 b=WAMnIcrQG8rVI92kEkzxPzG9q+d6EGPZ+Gpx+Yc/v5ul9QpWK4ERhtoQZfYO2zNKF4
 8FAuS1kpqNWfXupzjoCT+1ygvL4ESntdQuz3Z4xJyDsle8AgtUro8FA3f4ALlFUW6cp8
 87v1Ph4ar9o6jZTTvONm6nyqN7c8BQ9BSQeIO0scZlgtOy6TO/c2QYZg/SuuAVujtRVp
 sJ4VT3BVbVleHUkAepA63LOUfbWgxkPFsld/Doi3Le/TgkEPOZnQR+r76U9SM2XMkrd6
 B5BqZZZKtMvhDm5oqFYAy+dhAEcNZ8/qCGvRoOrZrd0jnKsG55lWqGxth/gSRpljmI6N
 Vnjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721301043; x=1721905843;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=g2difOvlWIEO63yHi+zzCArMOSeh2R/YOZyOxHPP5y8=;
 b=m8Y75/X1l3wFnCNeHH47qIsBwMt8p0dEmKYEFPIwCDSZ0+Z7oLiTgxzVY05VQM8kXK
 wdzjI9jfcvcTjJPoyKgUhyU8J6D/QNtS6AKkl3x8wv9isYfSIkZD1SOEiBSzaxuAfNFm
 k3s6NFWzSFKeafmtI/k5QS1K7G+ogMilBv7d8rsD4//4IhPc7XOKJayjwUQWyNt+uQU3
 vDdf67ICo1zQhl8CHrS0qKRT9f2S9XDu2RMklLH0bsakIXxDlMTQaPK4SEKr2uhIMA8a
 KYroYne5rb+uovfZUzMEMAVUmQGobkcVrq+xbuIbobQIH79X1gHBp/5bF96nyjbs5y2O
 bHiQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW6Bo15+UY+b/+/8EuUCvIUoplUfSUEjxEhbIUN3o+q2OLLjjHmKuleBedg0QImATlHPZ+6TvQOJqkfrVaURl1Y8DwAbAx+E0NV4Hj1Q8uy
X-Gm-Message-State: AOJu0YymWxG/aR8P/Yufl5meozMKDdnfO/Od5t5/aH/NBx9VPS5SsjjG
 GZ6hZjIcx2jhTut+X89vbx+lfLCHSSCnTB+7nlGNxrSmwWcDzSNjuHJltf6AGsm/KB3G9VSZlTv
 HirZd5d5zFM8EHS8MeevoqCRHvgLJCPFA9MmSvQ==
X-Google-Smtp-Source: AGHT+IHkpXrj6tfe5GKUAxDloIykkCd7pSLfu610KYCjUhm0uSHpFNmHy8/JsbORj2vqFg5Eb30UAAlM+BNEUmR4XcM=
X-Received: by 2002:a05:620a:29c6:b0:79b:ea85:9f9f with SMTP id
 af79cd13be357-7a1938c1e9amr47232985a.2.1721301043317; Thu, 18 Jul 2024
 04:10:43 -0700 (PDT)
MIME-Version: 1.0
References: <20240718082410.204459-1-angelogioacchino.delregno@collabora.com>
 <CAGXv+5GBg73kWuiDt=9s7M4oJeHhWOF3bPY7Ju+qn1kJgNNaGw@mail.gmail.com>
 <CAC=S1nigoJWAECBrm-Q=Co1-qd_yUhx3R4D9=dYeUV=gr5UYfQ@mail.gmail.com>
 <74e7477b-81c7-4713-80cc-1cb476185bc9@collabora.com>
In-Reply-To: <74e7477b-81c7-4713-80cc-1cb476185bc9@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Thu, 18 Jul 2024 12:10:32 +0100
Message-ID: <CAPj87rPZRjmMPjaOY-UH4auTuMS6mh9N7=maRBzxut2OgtALbw@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: Set sensible cursor width/height values to
 fix crash
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Fei Shao <fshao@chromium.org>, Chen-Yu Tsai <wenst@chromium.org>,
 chunkuang.hu@kernel.org, 
 p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch, 
 matthias.bgg@gmail.com, shawn.sung@mediatek.com, ck.hu@mediatek.com, 
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 kernel@collabora.com
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

Hi all,

On Thu, 18 Jul 2024 at 11:24, AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
> Il 18/07/24 11:27, Fei Shao ha scritto:
> > This matches my preference in [1], so of course I'd like to see it
> > merged... if maintainers are okay with it.
> > Given I've tested the exact same change before:
> > Reviewed-by: Fei Shao <fshao@chromium.org>
> > Tested-by: Fei Shao <fshao@chromium.org>
>
> Thanks!

And:
Reviewed-by: Daniel Stone <daniels@collabora.com>

> >> OOTH, Intel recently added a feature for enumerating "suggested"
> >> cursor sizes. See https://patchwork.freedesktop.org/patch/583299/
> >>
> >> Not sure if other compositors will end up using it or not.
>
> Yeah, that's good, and we might do that as well in MediaTek DRM... in a slightly
> different way, as it looks like they are simply hinting the same values as the
> mode_config is declaring... while we'd be adding a hint with a sensible size that
> is less than the maximum supported one from the overlay.
>
> In reality, here, the issue is that the most popular compositors do not support
> overlay planes (as in, they don't use them at all)... my first idea was to remove
> the CURSOR plane entirely and declare it as per what it is for real (an OVERLAY),
> but that would only give a performance penalty as that'd become yet another unused
> plane and nothing else.
>
> If at least the most popular compositors did support overlay planes, I'd have done
> that instead... but oh, well!
>
> And anyway I hope that the maintainers are okay with this because, well, otherwise
> MediaTek SoCs won't be usable with any popular WM.

Every compositor is going to use it, yeah. But until it does, people
are just going to use cursor_width and cursor_size. A lot of older
desktop hardware supports only a single fixed dimension for the cursor
plane (hence the single values), so rather than guess if it needs to
be 32x32 or 64x64 or whatever, people just allocate to the size. Not
to mention that the old pre-atomic cursor ioctls actually require that
you allocate for cursor_width x cursor_height.

So yeah, this is the right fix - though you could even be more
aggressive and reduce it to 256x256 - and supporting the CURSOR_SIZE
property would be even more useful again.

Cheers,
Daniel
