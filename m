Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAEB19775F1
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2024 02:17:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E096410EC84;
	Fri, 13 Sep 2024 00:17:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="l7k2cNzi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEFFC10EC82;
 Fri, 13 Sep 2024 00:17:26 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id
 4fb4d7f45d1cf-5c412cab25cso399861a12.2; 
 Thu, 12 Sep 2024 17:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726186645; x=1726791445; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=JegIvpvBzZyU49z2ta8sNcvR8rSAJQueYDB/CokoT3w=;
 b=l7k2cNziyIw+a20KnOL6PEOwQiGXEhosaeY3rKjxlnJMaPyDEc5b9ut2txZELNEVZz
 5x/9hQs9Pb1aGBLaw+8rMfRA8DbdxyXuS+D44JmQS0uoEzwNkD4vikCescaMEHS00Rnv
 Md+leVB9cECoBXNEsNbF4n8yMKqKEsAF9R3RS0Pw1R5W0Vt3B0qgf9R+BVYphDSYee47
 JIaMIm55WBMKex8TFVw6oyYGPJJ4KCV2xpyMyR2a/pwcRsjlap9K/s3BMfRdxvMXGQJj
 Tee4Xvkd+YoDvpYfHYK28In7iGnN4729ww8qgiqrFZK5fJrihDDEnm56xRM0kDah4UvP
 4Xlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726186645; x=1726791445;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JegIvpvBzZyU49z2ta8sNcvR8rSAJQueYDB/CokoT3w=;
 b=BtyvcfeSokDpfztRNfkKuFsEkzj+D5CHbxlBYRd8VUvvYkMq4u0iKywD0XwTpyUeAY
 6aRmx894HhNjBwwaCOcVvADIWjpdi9UZoBXNrltGIr+fPsKhWaekVWf/bUnajJAHBF+1
 wsQeaqDBgaKazmoViF3WHXGLMnTqqxByqViO86bJocbyxzpUlnS+ko5CzlP3AaGYM52f
 EDkl4pksrkT46mxYloIgwVF714olg3izuoTbbubYCM3QDC4IHjtjjYLHAlGuVSNBsXhm
 /9XvCSURlA8mbyn7PM0icLB//aSOtmAI6LXbzHQ2MA/QSMc2kA+p0dO0Jdj7yEfr8i8X
 00Vg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUPnGhLmLZQL/1PoHgKvVenLArQ8A8MY+CKsK6L3b+z5rBkbWe2RaeK3gkDGB7uumpb3itsf/0X@lists.freedesktop.org,
 AJvYcCVBJHGHIPwQs3lHQDLtdkHdEvJ/dkiut0htF2JRUcOxsZ+cDkHLuBnWhjUuiKLD4wqZYJeS2VTKgsADloPPFA==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyE/+0koZd8boyUdzKQa00xaM+hrNGg5+7tbDJoX3SsO+znCkQI
 M29FrsLT49tfdGbaKqjCBNKIruA2+p+MNMz5M4OQeq+9PeU06MrrYFCZ3ADx2R0q2AhaoS0+1xu
 BDzCVoih1KzcADNYpS7eJtk1v8LY=
X-Google-Smtp-Source: AGHT+IEg59yBEqN9I9waZxkwL7Hug633+u2vUNF8MlQ4TFC/ywlx6uhpKkCD9RCmkB5kZWTk6+GLludIlLLEyhWCxlc=
X-Received: by 2002:a17:907:86a2:b0:a86:82e2:8c64 with SMTP id
 a640c23a62f3a-a9047d35b2cmr44570366b.35.1726186644846; Thu, 12 Sep 2024
 17:17:24 -0700 (PDT)
MIME-Version: 1.0
References: <CAFZQkGzLjCOSPvk0kYYXyJm8E6Szdw9PJUcUQzew-EBfQjzz_g@mail.gmail.com>
 <20240910192419.302801-1-harry.wentland@amd.com>
In-Reply-To: <20240910192419.302801-1-harry.wentland@amd.com>
From: Xaver Hugl <xaver.hugl@gmail.com>
Date: Fri, 13 Sep 2024 02:17:11 +0200
Message-ID: <CAFZQkGzSsbhHYWCzZqPcC2fw3Y4ZeM23qQr1k1aPsz2B3pfA7w@mail.gmail.com>
Subject: Re: [PATCH] drm/colorop: get DATA blob ref at duplicate_state
To: Harry Wentland <harry.wentland@amd.com>
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, 
 wayland-devel@lists.freedesktop.org
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

Hi Harry,

I applied this patch and the two issues I mentioned before are gone.
I noticed a new problem though: Changes in the COLOR_PIPELINE value
aren't always applied immediately. For testing I played an HDR video
on an SDR screen with the work/zamundaaa/drm-colorop KWin branch, and
made it fullscreen. When I do that, the video is reinterpreted as sRGB
until the pipeline actually gets used at some later point in time, and
when opening another app to interrupt direct scanout while the
pipeline is being applied, the previous pipeline keeps being applied
until it switches to bypass. It often applies the proper value when
the cursor plane gets enabled or disabled, but that doesn't seem to be
reliable and it sometimes happens without cursor changes.
I checked with drm_info that KWin has actually set COLOR_PIPELINE to
the pipeline or bypass, so I'm confident that this issue is on the
kernel side.

When the pipeline is actually applied, it works correctly (outside of
some banding, but that's expected with the current state of the KWin
branch).


Am Di., 10. Sept. 2024 um 21:24 Uhr schrieb Harry Wentland
<harry.wentland@amd.com>:
>
> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> ---
>
> It was a stupid mistake on my part. The duplicate_state
> function needs to take a reference to the blob.
>
> This should fix it. Please give it a try if you can.
> I'll roll it into the patch that introduces the bug in
> my v6.
>
> Harry
>
>  drivers/gpu/drm/drm_colorop.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
> index 86f7f084a73f..fd1cd934df48 100644
> --- a/drivers/gpu/drm/drm_colorop.c
> +++ b/drivers/gpu/drm/drm_colorop.c
> @@ -401,6 +401,9 @@ static void __drm_atomic_helper_colorop_duplicate_state(struct drm_colorop *colo
>  {
>         memcpy(state, colorop->state, sizeof(*state));
>
> +       if (state->data)
> +               drm_property_blob_get(state->data);
> +
>         state->bypass = true;
>  }
>
> --
> 2.46.0
>
