Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC46E47D596
	for <lists+dri-devel@lfdr.de>; Wed, 22 Dec 2021 18:07:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A62E210E124;
	Wed, 22 Dec 2021 17:07:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DEFC10E124
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Dec 2021 17:07:06 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 g191-20020a1c9dc8000000b0032fbf912885so1861795wme.4
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Dec 2021 09:07:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xf0dcGkvmURFRRNeHLTQphIAlqufMTucRtU3DVITyFY=;
 b=RCVUlNvIf2TY1hZQ2BN3r7OcxX0mQkrpHTo1Xj5KCDbfFss8/WsANNVOQaJoQt36XX
 vt5FB0/ZaNCw0oT9EzetO/35FMtQcEf0iHBiFnhdNM1a/yOT3znsrOk2ovuXhCP9MsLj
 kqNzaai7C3ovmFxJ8plk9KfgerLUXa0NB9urt6Qzjov8ecyJgbRdZ8Qa35Kj4LP5ErEr
 H/oQSA2M3Bd6sQ8wNvIQsBVj0KDgg+AeSbRm8eIwUBNC+YukWgez412JYmnKlMb6vVNh
 FlZJiXK+277nT2aHd8oMaqgamCw1rxwpTJiumj+k3xOI7VhCxKJZRn+rLQp7ysvI4zBm
 gkMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xf0dcGkvmURFRRNeHLTQphIAlqufMTucRtU3DVITyFY=;
 b=qoLJaxju1I9tpstXZdW2x7qeVqezD1zaTRIVDDU5D8bdEVICCrnc4oneFNdEIgYm4l
 rcKC3mTef1B46UYUz4VGdqQ8KVAJ+f0HZ0/JG6M8N5cAT0w31u6mrtApmeC2BPCujrab
 lLCUHaMhv/92YrQB6mb6LbtIIBc7nTbgxLvfXcqJIG32TSaHIx/IVM72B95UdVDv6kpg
 3pjS6jU2DXfJUQvqw6uWzjTRnWBuU7NDn66/FoGbXyZ9pMHM10VJwWPJVI80M7c8T73n
 21j7Q9qeH4NT4ev5Wg1S4bjwWcGgW4hFuwvqVeglERkgjXIGNiVVtmI/viFzjotoJwg4
 cfiA==
X-Gm-Message-State: AOAM531XKqj3RdJVfSct32lGOOCHMC5Rqi1QIBiNaFvPQRXe/Y4htgSF
 gzsUSp9zHzXqAsgnImG0tSG73W+JjRg=
X-Google-Smtp-Source: ABdhPJxHHsH7bFTy6QqNlKLW9op/sk+p9MsGhCZ8BoEj0/Y1+Hg7+OLndTV/9ExKMNaqsZgnSML3ww==
X-Received: by 2002:a1c:5404:: with SMTP id i4mr1534466wmb.107.1640192825110; 
 Wed, 22 Dec 2021 09:07:05 -0800 (PST)
Received: from archbook.localnet ([217.151.114.10])
 by smtp.gmail.com with ESMTPSA id y13sm2796186wrd.89.2021.12.22.09.07.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Dec 2021 09:07:04 -0800 (PST)
From: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>
To: dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 22/22] drm: rockchip: Add VOP2 driver
Date: Wed, 22 Dec 2021 18:07:02 +0100
Message-ID: <26571551.24qHfsk75X@archbook>
In-Reply-To: <1761858.GBYTvM79DV@archbook>
References: <20211220110630.3521121-1-s.hauer@pengutronix.de>
 <20211220110630.3521121-23-s.hauer@pengutronix.de>
 <1761858.GBYTvM79DV@archbook>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
Cc: devicetree@vger.kernel.org,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Peter Geis <pgwipeout@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Sandy Huang <hjc@rock-chips.com>,
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 linux-rockchip@lists.infradead.org,
 Michael Riesch <michael.riesch@wolfvision.net>, kernel@pengutronix.de,
 Andy Yan <andy.yan@rock-chips.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Dienstag, 21. Dezember 2021 14:44:39 CET Nicolas Frattaroli wrote:
> On Montag, 20. Dezember 2021 12:06:30 CET Sascha Hauer wrote:
> > From: Andy Yan <andy.yan@rock-chips.com>
> >
> > The VOP2 unit is found on Rockchip SoCs beginning with rk3566/rk3568.
> > It replaces the VOP unit found in the older Rockchip SoCs.
> >
> > This driver has been derived from the downstream Rockchip Kernel and
> > heavily modified:
> >
> > - All nonstandard DRM properties have been removed
> > - dropped struct vop2_plane_state and pass around less data between
> >   functions
> > - Dropped all DRM_FORMAT_* not known on upstream
> > - rework register access to get rid of excessively used macros
> > - Drop all waiting for framesyncs
> >
> > The driver is tested with HDMI and MIPI-DSI display on a RK3568-EVB
> > board. Overlay support is tested with the modetest utility. AFBC support
> > on the cluster windows is tested with weston-simple-dmabuf-egl on
> > weston using the (yet to be upstreamed) panfrost driver support.
> >
> > Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> > ---
>
> Hi Sascha,
>
> quick partial review of the code in-line.
>
> For reference, I debugged locking issues with the kernel lock
> debug config options and assert_spin_locked in the reg write
> functions, as well as some manual deduction.
>

As a small follow-up, I've completely mapped out the calls to
vop2_writel, vop2_readl, vop2_vp_write and vop2_win_write and
coloured in whether they were called with the lock held or not.

The conclusion is startling: Most of the code absolutely does
not care about the reg_lock.

Here's the graph as an SVG: https://overviewer.org/~pillow/up/6800427ef3/vop2_callgraph_modified.svg

vop2_isr here needs to be paid special attention, as it also
acquires a different spinlock, and we want to avoid deadlocks.

Perhaps we should precisely define which lock must be held for
what registers, such that the vop2_isr can write its interrupt
related registers without acquiring the "big" reg_lock.

I'm also not entirely sure whether I should assume vop2_readl
needs to be called with the lock held. This needs some
investigating both in terms of whether the hardware presents
a writel as an atomic write of a long, and whether the code
assumes the state between readl calls is ever a consistent view.

Regards,
Nicolas Frattaroli



