Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3F03A50111
	for <lists+dri-devel@lfdr.de>; Wed,  5 Mar 2025 14:48:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1465310E7AD;
	Wed,  5 Mar 2025 13:48:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=rosenzweig.io header.i=@rosenzweig.io header.b="MQmaoyaK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-171.mta0.migadu.com (out-171.mta0.migadu.com
 [91.218.175.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 804C210E78E
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Mar 2025 13:48:52 +0000 (UTC)
Date: Wed, 5 Mar 2025 08:48:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
 s=key1; t=1741182528;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wb6rcGnysdOjkFCR0OaNCjFIgpAYP0AzENVy2fFqyCo=;
 b=MQmaoyaKEFYFydhvZcXatALOg9G6+iaxRo27Zubxen26s7vvqy9imItga79vuEh+y5w00V
 tWEGEMppaREoQugpDnYbR5rrnCLUkDGmLLXekj3bTCnlWwTKfATTL2VFzCOFk1cLKVJjl3
 p2kUCg7Ss/0BrMFApcKJ8HkyKZP2dO+qOJRJEzR8ulRPNUYrkZLwVTtdiLl0Noe+JTodZZ
 HGfHLMvlMb8Rt7OjveDAPN+L1D2ryDxl6T2V446BWwiJG5HV0n3U6QjnH0+BW1VCDk4hzb
 oVWXF1wOH8083b0o/tpp1i4RASMkr5/vjDO8iMglqx5P3dgHv/QerJ8pJkwLfA==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Maxime Ripard <mripard@kernel.org>, fnkl.kernel@gmail.com,
 Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, asahi@lists.linux.dev,
 Janne Grunau <j@jannau.net>, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Alyssa Ross <hi@alyssa.is>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Neal Gompa <neal@gompa.dev>, Nick Chan <towinchenmi@gmail.com>
Subject: Re: [PATCH v7 0/5] Driver for pre-DCP apple display controller.
Message-ID: <Z8hWN4DpNyTHQf7I@blossom>
References: <20250217-adpdrm-v7-0-ca2e44b3c7d8@gmail.com>
 <c3927b51-55ef-4a38-8931-18ff00caa8d8@linaro.org>
 <Z8XcH7xoDC7TA7ZC@blossom>
 <dn7zskhxgdgr25nvbnsjyn5brc3yoc446dxz3vqgbiwoccvlcr@5l6f4byj53fo>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dn7zskhxgdgr25nvbnsjyn5brc3yoc446dxz3vqgbiwoccvlcr@5l6f4byj53fo>
X-Migadu-Flow: FLOW_OUT
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

> > > All patches are reviewed, can we funnel patches 1, 2 & 5 via drm-misc-next now ?
> > 
> > I'm planning to do so today, just need to get dim setup first :)
> 
> Nice! As a heads up, it would be really-really nice if you can send any
> kind of 'applied' message. If you are using 'dim b4-shazam', then
> 'b4 ty -a' might do that for you. Otherwise just a simple 'hey, applied'
> email is useful enough.

Oh cool, it didn't occur to me that `b4 ty` would compose with `dim
b4-shazam`. Sent a very belated message and will try to make a habit of
it going forward.

Thanks for the tip!

Cheers,
Alyssa
