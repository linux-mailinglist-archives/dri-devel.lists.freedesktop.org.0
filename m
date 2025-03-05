Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8029BA5013C
	for <lists+dri-devel@lfdr.de>; Wed,  5 Mar 2025 15:01:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FA4F10E2AC;
	Wed,  5 Mar 2025 14:01:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-187.mta1.migadu.com (out-187.mta1.migadu.com
 [95.215.58.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C2B410E2AC
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Mar 2025 14:01:21 +0000 (UTC)
Date: Wed, 5 Mar 2025 09:01:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
 s=key1; t=1741183279;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8aO4nUAYYsK7CbYcngMFkNu2vCLer0vDQ0Tj5RInDJY=;
 b=Q5wNHCqCR4Ez8bHn5tp61cOjO45ii7ooQ70GuXfN2lAV0c48bwr1Qsc3x9jEOkiOnChGU0
 amhTJW4fa6MOAjgg5bSWoybFgzRC/ihNpp2y8XcrGvRdNlXUWNTRwX0V7hg6lr2N+TXcq9
 WXVlEHQs6qrYMubYwrelO7ZFwcfuaq/e6mqQQTw73asaOad09YXmOsMimMjvWeft3BmQPo
 ezUG/ZiE34dWpyUU7uep7BaxZAk9yMpjzisK+LbXXunqEPe8vkjP1VPoYsf/6N34qJ27st
 Fpl3VymGb7t8lSsmvOqzOyivlEeF7i2KqxL/waOmVH/l3icaTDy818PmiY6BsQ==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
To: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, asahi@lists.linux.dev,
 Janne Grunau <j@jannau.net>, Sasha Finkelstein <fnkl.kernel@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Alyssa Ross <hi@alyssa.is>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Neal Gompa <neal@gompa.dev>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Nick Chan <towinchenmi@gmail.com>
Subject: Re: [PATCH v8 0/5] Driver for pre-DCP apple display controller.
Message-ID: <Z8hZKW_F-HtzYm-w@blossom>
References: <20250224-adpdrm-v8-0-cccf96710f0f@gmail.com>
 <174118223158.156873.6982508045942987984.b4-ty@rosenzweig.io>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <174118223158.156873.6982508045942987984.b4-ty@rosenzweig.io>
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

Er... I only applied 1, 2, and 5. Patch 3 was already merged, and patch
4 is going in via arm soc. I am, new to b4, sorry!

Le Wed, Mar 05, 2025 at 08:43:51AM -0500, Alyssa Rosenzweig a écrit :
> 
> On Mon, 24 Feb 2025 12:02:15 +0100, Sasha Finkelstein wrote:
> > This patch series adds support for a secondary display controller
> > present on Apple M1/M2 chips and used to drive the display of the
> > "touchbar" touch panel present on those.
> > 
> > 
> 
> Applied, thanks!
> 
> [1/5] dt-bindings: display: Add Apple pre-DCP display controller
>       commit: 7a108b930a84e71be71c3370eef6dd96fbb8f618
> [2/5] drm: adp: Add Apple Display Pipe driver
>       commit: 332122eba628d537a1b7b96b976079753fd03039
> [3/5] drm: panel: Add a panel driver for the Summit display
>       (no commit info)
> [4/5] arm64: dts: apple: Add touchbar screen nodes
>       (no commit info)
> [5/5] MAINTAINERS: Add entries for touchbar display driver
>       commit: 4d2a877cc0efefa815648f1ed5f5b2b796f55bab
> 
> Best regards,
> -- 
> Alyssa Rosenzweig <alyssa@rosenzweig.io>
> 
> 
