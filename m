Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0560482EB37
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jan 2024 10:01:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2619510E411;
	Tue, 16 Jan 2024 09:00:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F085210E411
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jan 2024 09:00:57 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-40e69b31366so33477275e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jan 2024 01:00:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705395596; x=1706000396; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yR57Dsv6KO4M/E5diixGfumQSaUt17CRwRBIvEe196w=;
 b=GYiwtX4lNSE8PFN8BmvmyW0jRw/CN5keJaFzjdqRyelK4SS1BEymQZkOj8E2lgzFyR
 QwqNWm0NzzQQpkWO0h20ktfElI4/0ohv4moiiXUBaIGrW1ovWq89GD5wddyq+9II+P2N
 ceAYz6Q8CIseWd+kKjSe5+3/gkCP+vRkCZH4Y4vptiIXPMo9jbM34CyL8c7qkgO9GKSH
 x9hbG9XZW7Dh4B8YDXlqj3l3akZMDqTwrMzfdMwbK5vYld89jYQh3IgKX3eXxpGqBP63
 kpG7eTZ/2Bmv00XcZKFsLJqKOOX6n7DP4UnFO39M/dQ3FbxOLAZA8oRKD+cb14ySEaau
 r3kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705395596; x=1706000396;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yR57Dsv6KO4M/E5diixGfumQSaUt17CRwRBIvEe196w=;
 b=xGBonyJxF/EGYe1FvyCOx+1u52AsZGmSB14EO17+9UNZ45yhK4NkpxcyDrHZL+IU6o
 tjeLy6X6rmAkPPfVH99iNR56NTSa91CQIFDciUmVWkWg8F1BHlsnY5mt/VKvj84CNcs7
 4gI91dWMpMH/Q42CLchtvwejGynlcQh9II6qWAornHTYD9mwKhzKCCMHfg8/w70UbN/g
 a989+/2DBiNDNYdNhq8xUILgwS0NyuHwWopgMXOnIoq4MuN3REQxn/uA0lcSAydcnqMb
 Ihrj7GwGvCGZoKdarJGm/l46oqbyUeGscfcwb2gRtVMFZjR67VcwTSbgtJOvMs3JqQFL
 1H3A==
X-Gm-Message-State: AOJu0YykZeBB+Ok1eQkZVUTGcdV6f78KXPYAjtXG8lhnYDBFy2gYytRK
 CNDEZbt9NGFlWJhpmMD2YOmQo2c/89wB0w==
X-Google-Smtp-Source: AGHT+IFuae2aMp3x3YiybSHmGPStiStnzK99Ia28OBoswGBvqpJyRAs32GRTCmNYCzp3Exl6pyMajA==
X-Received: by 2002:a05:600c:5491:b0:40d:7347:f5e8 with SMTP id
 iv17-20020a05600c549100b0040d7347f5e8mr3771459wmb.25.1705395596394; 
 Tue, 16 Jan 2024 00:59:56 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 n19-20020a05600c501300b0040e813f1f31sm2895704wmr.25.2024.01.16.00.59.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jan 2024 00:59:55 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Boris Brezillon <bbrezillon@kernel.org>, Peter Rosin <peda@axentia.se>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Fabrizio Castro <fabrizio.castro@bp.renesas.com>, 
 Jyri Sarha <jsarha@ti.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20240103-si902x-fixes-v1-0-b9fd3e448411@ideasonboard.com>
References: <20240103-si902x-fixes-v1-0-b9fd3e448411@ideasonboard.com>
Subject: Re: [PATCH 0/2] drm/bridge: sii902x: Crash fixes
Message-Id: <170539559536.1557628.14676800886096987878.b4-ty@linaro.org>
Date: Tue, 16 Jan 2024 09:59:55 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
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
Cc: Nishanth Menon <nm@ti.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Aradhya Bhatia <a-bhatia1@ti.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, 03 Jan 2024 15:31:06 +0200, Tomi Valkeinen wrote:
> Two small fixes to sii902x for crashes.
> 
> 

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-fixes)

[1/2] drm/bridge: sii902x: Fix probing race issue
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=08ac6f132dd77e40f786d8af51140c96c6d739c9
[2/2] drm/bridge: sii902x: Fix audio codec unregistration
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=3fc6c76a8d208d3955c9e64b382d0ff370bc61fc

-- 
Neil

