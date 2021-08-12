Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 72C2E3EA238
	for <lists+dri-devel@lfdr.de>; Thu, 12 Aug 2021 11:41:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D93126E3D0;
	Thu, 12 Aug 2021 09:41:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE80B6E3D2
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Aug 2021 09:41:09 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id q18so498500wrm.6
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Aug 2021 02:41:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kynesim-co-uk.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:references:in-reply-to
 :user-agent:mime-version:content-transfer-encoding;
 bh=bNmNKAUaEArv1Gi+oBRydkK71U7Thx1Jm9IY4faXXDA=;
 b=cvIvhx9bmyGTI5ecGqXw0KmSZFZmzrmgGeX55kK5CsMrXurE/ujp7v8n7WIXbYIolq
 yqYJs1cnD3v+dl92ngbXHWYvdPmbBlbMgdvxzsj6w8Ke6Lyc/j+6uWxvVlL0uurcOmT2
 gEx6a55GngTL5+hnWXmWr8L5O1OJtZR8bP5IpCjHQovmtNp3fhkMRUPfFhHc0rnSa4jd
 F+rxyXSxt+Om9z6qEJr5aj8f5zc5VfmTgYOSikPrsgd+lmVHAqA+5pLdTswS2VxQPcIm
 tICjrZTgxX16a4aFEssVN2ZSUHhV8YYQqBe+LBYdv6Kv5cHAOLFxwXrLlpb8ugAPG3WE
 MyzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:references
 :in-reply-to:user-agent:mime-version:content-transfer-encoding;
 bh=bNmNKAUaEArv1Gi+oBRydkK71U7Thx1Jm9IY4faXXDA=;
 b=dwTCjis5JA5okOI/5WtzoapzDfy9/bPr+hORqSa05eizOyEsGXOCjBa44S81oiua/G
 cegpOW4tNUPT25w/0NarHhFzSuzOxNDhkSTz54c6okflWmwpeqc8mHIZNnQbwxuQ/8ke
 bB0jzio7WJXZkVflzhBWWUUaJwer/PoCaVeubG8B9hKhmm8brqjAbN6suKz7WunWVkaD
 Rz8uIJkYePfxpRwuidcYIbrnGSNx/+SYxO1Qra7m2MGu1ak70+Sfq0zB1jD/sDC70LUd
 sViF14UH9oDbrXNiioikaE8M7RHDJb3oK9jtEj8DXTG7t0G603bUCV8wrMFfi2Bhebd8
 qq5g==
X-Gm-Message-State: AOAM531tXUFpg0jC8F94eNUG377O3LnOHIQ1ppSSgy2LbYeytG2HxvdH
 e4tJKOtZQNShBtJegVU8Th+zZrYrfygZUCRp
X-Google-Smtp-Source: ABdhPJxaASGpAbMNLOkeS3Jvr7SKWJrQ7ljSYeeixzZ4DmuP9lF6SENYi5Ziv2o3AhINqqcPkUhibg==
X-Received: by 2002:adf:f292:: with SMTP id k18mr2980872wro.249.1628761267903; 
 Thu, 12 Aug 2021 02:41:07 -0700 (PDT)
Received: from CTHALPA.outer.uphall.net
 (cpc1-cmbg20-2-0-cust759.5-4.cable.virginm.net. [86.21.218.248])
 by smtp.gmail.com with ESMTPSA id t8sm2509756wrx.27.2021.08.12.02.41.06
 (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
 Thu, 12 Aug 2021 02:41:06 -0700 (PDT)
From: John Cox <jc@kynesim.co.uk>
To: Simon Ser <contact@emersion.fr>
Cc: Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Subject: Re: How to obtain a drm lease from X for overlay planes as well as a
 primary plane?
Date: Thu, 12 Aug 2021 10:41:06 +0100
Message-ID: <hcq9hg56jd4n6dsllqffsf6rq6t82s28ig@4ax.com>
References: <34a5hg1rb804h8d1471apktsgl5v9n9u1e@4ax.com>
 <YRObs1/iDhgCbMo8@phenom.ffwll.local>
 <Af-nitVw-cgVIRn4hPB53-PwBSuaSqzaoUQA5H6kUF6BXVYJ5noiTAE6E1K0Q_aL_PxpA08bNQuxOKbSfSHQtSR-OOUtMtyrkLfSFBT7hDE=@emersion.fr>
 <cmc7hghfjaekbsu6e15hbolbteanadmlla@4ax.com>
 <LpwasH5AmXuOZj29Gbc6zHVTqgUaTCqTzzRpNGkQQIOvqLddtYun_eiQq0n4p9n0AcX8mr1MDThylGfYGSXO5kR-pgsFRKsfqqwyI2bdfYw=@emersion.fr>
In-Reply-To: <LpwasH5AmXuOZj29Gbc6zHVTqgUaTCqTzzRpNGkQQIOvqLddtYun_eiQq0n4p9n0AcX8mr1MDThylGfYGSXO5kR-pgsFRKsfqqwyI2bdfYw=@emersion.fr>
User-Agent: ForteAgent/8.00.32.1272
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
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

>> Raspberry Pi displaying video with subtitles or other controls.  I was
>> thinking of the fullscreen case but if zero copy video can be made to
>> work to the main desktop then that would even better.
>>
>> If displaying 4k video the Pi does not have enough bandwidth left for =
a
>> single frame copy, convert or merge so I need hardware scaling,
>> composition & display taking the raw video frame (its in a dmabuf).  =
The
>> raw video is in a somewhat unique format, I'd expect the other layers =
to
>> be ARGB.  The Pi h/w can do this and I believe I can make it work via
>> DRM if I own the screen so that was where I started.
>>
>> >Why not use an xdg_toplevel and wl_subsurface?
>>
>> Probably because I am woefully underinformed about how I should be =
doing
>> stuff properly.  Please feel free to point me in the correct direction=
 -
>> any example that takes NV12 video (it isn't NV12 but if NV12 works =
then
>> SAND can probably be made to too) would be a great start.  Also =
Wayland
>> hasn't yet come to the Pi though it will shortly be using mutter.
>
>By SAND do you mean one of these vc4-specific buffer tilings [1]? e.g.
>BROADCOM_SAND64, SAND128 or SAND256?
>
>[1]: https://drmdb.emersion.fr/formats?driver=3Dvc4

Yes - for SAND8 (or SAND128 in your terms) drm output we have the
required types as NV12 + a broadcom modifier.  Then there is SAND30 for
10-bit output which fits in the same column tiling but packs 3 10-bit
quantities into 32 bits with 2 junk (zero) bits.  Again we have a DRM
definition for that which I think may have made it upstream.

>The fullscreen case may work already on all major Wayland compositors,
>assuming the video size matches exactly the current mode. You'll need to=
 use
>the linux-dmabuf Wayland extension to pass NV12 buffers to the =
compositor.
>
>If you want to add scaling into the mix, you'll need to use the =
viewporter
>extension as well. Most compositors aren't yet rigged up for direct =
scan-out,
>they'll fall back to composition. Weston is your best bet if you want to=
 try
>this, it supports direct scan-out to multiple KMS planes with scaling =
and
>cropping. There is some active work in wlroots to support this.  I'm not=
 aware
>of any effort in this direction for mutter or kwin at the time of =
writing.
>
>If you want to also use KMS planes with other layers (RGBA or something =
else),
>then you'll need to setup wl_subsurfaces with the rest of the content. =
As said
>above, Weston will do its best to offload the composition work to KMS =
planes.
>You'll need to make sure each buffer you submit can be scanned out by =
the
>display engine -- there's not yet a generic way of doing it, but the =
upcoming
>linux-dmabuf hints protocol will fix that.
>
>If you want to get started, maybe have a look at =
clients/simple-dmabuf-gbm in
>Weston.
>
>Hope this helps!

Very many thanks for the pointers - to a large extent my problem is that
I don't know what should work in order to build something around it and
then work out why it doesn't.  I've got video decode down pat, but
modern display still eludes me - I grew up on STBs and the like where
you could just use the h/w directly, now its a lot more controlled.

Ta again

John Cox
