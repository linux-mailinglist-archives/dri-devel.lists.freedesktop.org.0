Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BF71A00DBC
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jan 2025 19:43:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E481610E91A;
	Fri,  3 Jan 2025 18:43:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="oVeuaDP+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3870910E920
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jan 2025 18:43:38 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-3003c0c43c0so143280661fa.1
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Jan 2025 10:43:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1735929757; x=1736534557; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GJ/2EC/Fw40mou56IuXmRYuUxNbybWYB44GzWMzgJFQ=;
 b=oVeuaDP+2yfdqhlNDpg+R93R30pUBZhiX4tEQ6olv3DN6IFKtNNp5FVJv6xCc6nHcd
 /Pf1VOTubfCuThSu/0LSSsKz2+r0jfUJYpAWqv1sU8aVjTGhn3WSxDpkIaOFBS6dz61c
 xKznle0B03dRtxVgf8LHWzlwiyv5UrR2JVnHyWy3k1ak/ijOwLEE6Gi0kG/pbw8MX+hL
 LVvAShC0cZtiPfx3Vc5n9vfMDYJQq/ueOA0MSFPoszoKlVq6CyhUydK+vCkskCQiIE3L
 uaTK8/y/lvd7BlSS+9lbI+61u+rRqIcqJ+TnC19a2vWIzgQ5aGuj0LrMOrD3F3pw+vSN
 Fz7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735929757; x=1736534557;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GJ/2EC/Fw40mou56IuXmRYuUxNbybWYB44GzWMzgJFQ=;
 b=e8i03HM0SpSVXme+VvcspCdH13Q62SS+61XBhrPGbtlIAiMb47Qsl5G+4bIoCbGvPU
 ntlYG2DE2n1votL6aiz6OtWLnZ3LR/ih5SqLsCFxU84+ZNwZv4Q/C6TQ3KfHyjSelhYH
 goQWO9R+voZJZbG+J39QIWkmlg3FIdm384z7MInytogpAY97yNDp9AtAVSUOh2l0fbOQ
 zSAGRE3gKcfyR90DcyElb9QhGDCw7rI7ABdXbYPGWFnKyRs5ZJToMckWrpV7Ua6+K+xR
 6F2IEGIHDPaHFX/LPhjtJfIslY7ntsv1b+DW9WRZskLZUYG3ETXZUtuZ/GmI72FqR7Su
 +8Og==
X-Gm-Message-State: AOJu0YxgzNMJsOxfyhXrS5xdDP7hAjohGgJH/1b9ZSUa5N1akEIpimSh
 CBYVm51h3/sMuECfgtNI/QnrLYlgioEcDKyXtcBohD/QCuaA2kb4BoyStAahtkw=
X-Gm-Gg: ASbGnctgCvHJwHhUvDOak9TaTEekDZRJBUCAoSEFNlOvGpVMu5Jp88U7oRleVLhBFhE
 bnMda7kBiSIDII63939ZhHCD844gWTBNrbzV5RNBIO917l6sMK8vSJTkYbRgsErL1vHCXUuzRdU
 sKGPpx50DUkqnbTMlFSloVYN1DkT2z/jkBEjjLOElwIrJe3k6U/hjd43BLWMd9coRcVDaI7my/J
 nsNi7QF8Z8Z3FEtlBigY6BCO8LD9vtq4rMfAyamwo5JJMY4/Vl3QDuPtpSa3kK0fy2Y0FpMhw7l
 S3koXA1wF/ycOF6BBf6ls8X7
X-Google-Smtp-Source: AGHT+IGivdrQwTNWSowzyQHssE6K43av7m9V/PoT49PXklXSb6Xu6TNgCh/YsYNaYIQlLVruVr30yQ==
X-Received: by 2002:a05:651c:548:b0:302:2598:dec2 with SMTP id
 38308e7fff4ca-30468556c9bmr126703721fa.14.1735929756602; 
 Fri, 03 Jan 2025 10:42:36 -0800 (PST)
Received: from eriador.lan (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00::7a1]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3045b06a1dasm45843071fa.80.2025.01.03.10.42.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jan 2025 10:42:35 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Hermes Wu <hermes.wu@ite.com.tw>, Allen Chen <allen.chen@ite.com.tw>,
 Hermes Wu <Hermes.wu@ite.corp-partner.google.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Pin-yen Lin <treapking@chromium.org>,
 Kenneth Hung <Kenneth.Hung@ite.com.tw>, Pet Weng <Pet.Weng@ite.com.tw>,
 Hermes Wu <Hermes.wu@ite.com.tw>
Subject: Re: [PATCH RESEND v7 00/10] drm/bridge: it6505: fix HDCP CTS fail
 items and add MCCS support
Date: Fri,  3 Jan 2025 20:42:32 +0200
Message-ID: <173592974659.740123.3357636965797961514.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241230-v7-upstream-v7-0-e0fdd4844703@ite.corp-partner.google.com>
References: <20241230-v7-upstream-v7-0-e0fdd4844703@ite.corp-partner.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Mon, 30 Dec 2024 18:51:18 +0800, Hermes Wu wrote:
> There are lots of failure items while running HDCP CTS using UNIGRAF DPR-100.
> In Order to fix those failures, HDCP flow needs to be changed.
> 
> The DisplayPort AUX protocol supports I2C transport.
> In Order to support MCCS via the aux channel, the aux-i2c operation is added.
> 
> v6->v7
> 	-[3/10] add header <linux/bitfield.h> included
> 
> [...]

Applied to drm-misc-next, thanks!

[01/10] drm/bridge: it6505: Change definition of AUX_FIFO_MAX_SIZE
        commit: c14870218c14532b0f0a7805b96a4d3c92d06fb2
[02/10] drm/bridge: it6505: improve AUX operation for edid read
        commit: d0c97a51cdef2badc8d17f6edfbc0bdc0ba92065
[03/10] drm/bridge: it6505: add AUX operation for HDCP KSV list read
        commit: 235d9bf8a1e1c0a0cf1340c40567e6b4f2b742c6
[04/10] drm/bridge: it6505: Change definition MAX_HDCP_DOWN_STREAM_COUNT
        commit: 85597bc0d70c287ba41f17d14d3d857a38a3d727
[05/10] drm/bridge: it6505: fix HDCP Bstatus check
        commit: 0fd2ff47d8c207fa3173661de04bb9e8201c0ad2
[06/10] drm/bridge: it6505: fix HDCP encryption when R0 ready
        commit: 8c01b0bae2f9e58f2fee0e811cb90d8331986554
[07/10] drm/bridge: it6505: fix HDCP CTS KSV list read with UNIGRAF DPR-100.
        commit: aa97239300e3f2a9ecbccf7ebfa240860bdddafb
[08/10] drm/bridge: it6505: fix HDCP CTS compare V matching
        commit: 0989c02c7a5c887c70afeae80c64d0291624e1a7
[09/10] drm/bridge: it6505: fix HDCP CTS KSV list wait timer
        commit: 9f9eef9ec1a2b57d95a86fe81df758e8253a7766
[10/10] drm/bridge: it6505: add I2C functionality on AUX
        commit: 041d61ad66ea0d88890264e96e8f81437a33a9cf

Best regards,
-- 
With best wishes
Dmitry

