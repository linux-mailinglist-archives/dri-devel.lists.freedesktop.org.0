Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3422377DA6
	for <lists+dri-devel@lfdr.de>; Mon, 10 May 2021 10:04:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40E7F6E40D;
	Mon, 10 May 2021 08:04:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35A2F6EE40;
 Fri,  7 May 2021 14:57:08 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id n15so5962426edw.8;
 Fri, 07 May 2021 07:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dz08TtZQHN8WysDf1KSSv+J846ggMOVj0kzY1pDn55Y=;
 b=mevx2O5womNc6xFIEoqxVhmtxLhxKExcqHGouY3g4xlRa9Uz+e16jEau8C2tB07iEv
 Z50S/FXyPhQM76QElomJRreMwiozfL5ad6pkIjk+ll6pGw2xXrS2JAmjXY0/53BDkBoU
 Db9S3af17hp9zHcT5GroAXRG5YmFKfICZN/AcwUahxHvLQWLgSfa7MNj0MbhDWpmrGQs
 jU+H6WBUA/mvnTkB07AMea3TmW/8j5n9jkoEfiVroxHk1kfwAiyWu1RRuCtH34D+fnkO
 riVFuD+I0fg00s1KAAkVymZiHA5brIMVB7v9IuJ2nqhcLDEFIFkLz6y5JThHunskwrUx
 FYXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dz08TtZQHN8WysDf1KSSv+J846ggMOVj0kzY1pDn55Y=;
 b=fl2oR8HFzdrpbHov9NyJrdt452JTvpte1nr9WHXfhggxvNXKfeFx0XwR9t4VyaPq0j
 6Cl7YXYwmSQXypfn+wlICilJpuGRXpCTMRaWtd6FcJZi1eP86LQf4U3Q4SxZqG/oLSQc
 H21+0vMCkM6sWsJAB8D52s/2LUQpB1pES/cLY5zOmuxZ2/N2XJFNxHdsTEnkEh1EOUz1
 5/wSGsvgJwLixo2MwILBoSeOGMZn8D3P+oBZHgujIRW1/Hkw+k1oPgkZrIKwRwjL3KA5
 phmeTnJ9Dvca67XdOzpDFNkBWCFyOKHImyzTCwGsz3b4J6kPjpcl34yAyIJE1b/kSTvv
 amkQ==
X-Gm-Message-State: AOAM530QEDthfu+P7CQ9Qij+TsgNnx4Nrz9ke8SZ5BnBe3Zlq8vvB9eW
 rrdCF4dgcxfYe1wzcrqfxii1fxEQBLOPZg==
X-Google-Smtp-Source: ABdhPJyjUSVgdPFic/P8Et5E9RwW1l1qkvgy2QTFo4YpaB/kfDIXpAjAt064eXJjGY0LpZQutU0pmQ==
X-Received: by 2002:a05:6402:416:: with SMTP id
 q22mr11927096edv.204.1620399427010; 
 Fri, 07 May 2021 07:57:07 -0700 (PDT)
Received: from jernej-laptop.localnet (cpe-86-58-17-133.cable.triera.net.
 [86.58.17.133])
 by smtp.gmail.com with ESMTPSA id h4sm3325354edv.97.2021.05.07.07.57.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 May 2021 07:57:06 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Maxime Ripard <maxime@cerno.tech>
Subject: Re: [v3,
 4/5] drm/connector: Add a helper to attach the colorspace property
Date: Fri, 07 May 2021 16:57:04 +0200
Message-ID: <2190160.Z2YBaczauS@jernej-laptop>
In-Reply-To: <20210430094451.2145002-4-maxime@cerno.tech>
References: <20210430094451.2145002-4-maxime@cerno.tech>
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

Dne petek, 30. april 2021 ob 11:44:50 CEST je Maxime Ripard napisal(a):
> The intel driver uses the same logic to attach the Colorspace property
> in multiple places and we'll need it in vc4 too. Let's move that common
> code in a helper.
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
> 
> Changes from v2:
>   - Rebased on current drm-misc-next
> 
> Changes from v1:
>   - New patch
> ---

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


