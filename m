Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81E0F377DA5
	for <lists+dri-devel@lfdr.de>; Mon, 10 May 2021 10:04:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5DA06E416;
	Mon, 10 May 2021 08:04:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 638F96EE40;
 Fri,  7 May 2021 14:58:41 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id g14so10589333edy.6;
 Fri, 07 May 2021 07:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CJHBifJjuAiUBB1fcY/7U2kOYy2ASja8+o2PqKZoRWE=;
 b=XNEPPEBhgMHMMsT4kse0qA8u5ggbNQ9EE3NN4Lfs+z6ha71Hchom0V+YsQgDt3374B
 UhX9hZXqoUY1i+Jmd3ueYBBXaJSi9jQMQonYfGwYp6ED3fCShZobGpP6aljtWvs9vbe2
 /7L1fJjh56JN1EbxZY01WGSjDx5pLk0cvVsbGiWkKpgDaV4fMQSuJ2cEI2g0MGwD15sM
 QZ99gEFOcCd9ypUYjXH4aJGHfKaomx0lni4YIi19FpQOvS3n9p6TV66hPzoSSzBBbA2Y
 7fJkLl8Qi9nlhU+iJLDveOHDabm38b4F0KGc0VGjVVrXANFmRZe4U6j/c07reOFgJ6Hy
 Y6tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CJHBifJjuAiUBB1fcY/7U2kOYy2ASja8+o2PqKZoRWE=;
 b=HyNla4LJcLzImZWcA8/eA/eQ8GpFcd1RQxBc38UAVuDpLBzpNc2mSS9gk8p0FTqPTR
 N8+z5yAvSYMkLPCmFweO4kya7I1l9PxMcwL3xQV3FTs9l63YZW050rcxor6mpg3y6z84
 2dB5Fx0EgiUWpQ88OOvmL8VmKqwIU15zDfEGOz/DPN2Z1i5sAM1Og6HxA7Ii50Sm5S4J
 jkGCLvtTx79agBbex7sOZyaKypmVR3urunBaxI8mRNTn8pp+rCwk3Zk6sZ7CTDIDddbF
 FQ0IXoL+3kN+ifJY46aD88xJy9+0DUZ5J4lMBkOF1gdSu9v+/qCfl72ucr6sUJsS2TF8
 f46Q==
X-Gm-Message-State: AOAM530kN0sRok83ekQnP/W9OHsOVuVMsyWo/bBjbIN2GYXZuuAw28pp
 tg/LhEObCRM+A9LPDSbsuSq3NMim8QBwyw==
X-Google-Smtp-Source: ABdhPJwKTBoHHEGsXmBsKTt/zAlEpVBQULdCoEKocsz8PQ3XbcWNFsWC2MfypygtKruT+f+OYBtAdQ==
X-Received: by 2002:a05:6402:798:: with SMTP id
 d24mr11757288edy.275.1620399520090; 
 Fri, 07 May 2021 07:58:40 -0700 (PDT)
Received: from jernej-laptop.localnet (cpe-86-58-17-133.cable.triera.net.
 [86.58.17.133])
 by smtp.gmail.com with ESMTPSA id cf10sm4308872edb.21.2021.05.07.07.58.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 May 2021 07:58:39 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Maxime Ripard <maxime@cerno.tech>
Subject: Re: [v3, 5/5] drm/vc4: hdmi: Signal the proper colorimetry info in the
 infoframe
Date: Fri, 07 May 2021 16:58:38 +0200
Message-ID: <3819038.KMkRtCgjlg@jernej-laptop>
In-Reply-To: <20210430094451.2145002-5-maxime@cerno.tech>
References: <20210430094451.2145002-5-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Mailman-Approved-At: Mon, 10 May 2021 08:04:24 +0000
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Dom Cobley <dom@raspberrypi.com>,
 Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, Leo Li <sunpeng.li@amd.com>,
 Robert Foss <robert.foss@linaro.org>, intel-gfx@lists.freedesktop.org,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org,
 Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Andrzej Hajda <a.hajda@samsung.com>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>, Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi!

Dne petek, 30. april 2021 ob 11:44:51 CEST je Maxime Ripard napisal(a):
> Our driver while supporting HDR didn't send the proper colorimetry info
> in the AVI infoframe.
> 
> Let's add the property needed so that the userspace can let us know what
> the colorspace is supposed to be.
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
> 
> Changes from v2:
>   - Rebased on current drm-misc-next
> 
> Changes from v1:
>   - New patch

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


