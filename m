Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 710EC862942
	for <lists+dri-devel@lfdr.de>; Sun, 25 Feb 2024 07:12:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3BF910E218;
	Sun, 25 Feb 2024 06:12:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=atomide.com header.i=@atomide.com header.b="DcvOgHRS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail5.25mail.st (mail5.25mail.st [74.50.62.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44D7410E218
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Feb 2024 06:12:23 +0000 (UTC)
Received: from localhost (91-158-86-216.elisa-laajakaista.fi [91.158.86.216])
 by mail5.25mail.st (Postfix) with ESMTPSA id E9A636058D;
 Sun, 25 Feb 2024 06:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=atomide.com;
 s=25mailst; t=1708841541;
 bh=TLbErP9TshFhoHBnjxKHNEUx7cMv4h8UxZqTKhM427k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DcvOgHRSRN/jmv5zpOoR7Fdte2V3Hs8bP4ARNe6NFyv7cXoEOQZEAWcFr/NiKec8o
 X9Mfxb+fnw6/5Nopb4f7kG+kQBAEeeSbkgDQqUoXmVlzfNWuhLC/QYPouRJ6KoIb59
 6Lkixjnyey7Mxgry0HZKayxYL9JEEXXpLm7JvgoeZllTVF+Di4/HSzzUyucn89d2G9
 P7MaVcia15w1mKt0TJX9ILW8WEfQKrNX49z8ZzXQ5wkYVRp39JOLjQ1sPAKKso5aYM
 crCMPr86YI+XCUyQZxUEcmMRs+bxRiDqwRcth137t+nMSJABUjfsvGdKxPpkzWS4DI
 irG68Wc8b91Iw==
Date: Sun, 25 Feb 2024 08:11:35 +0200
From: Tony Lindgren <tony@atomide.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Simha BN <simhavcs@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Michael Walle <mwalle@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH v4 03/10] dt-bindings: display: bridge: tc358775: Add
 support for tc358765
Message-ID: <20240225061135.GR5299@atomide.com>
References: <20240215123222.42609-1-tony@atomide.com>
 <20240215123222.42609-4-tony@atomide.com>
 <61a6b5a8-7dbf-4b37-9f6e-1bd85dc5f7b5@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <61a6b5a8-7dbf-4b37-9f6e-1bd85dc5f7b5@linaro.org>
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

* Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> [240215 18:43]:
> If there is going to be new version, please put allOf: block after
> required: block.

OK will post v5 set.

> Anyway:
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Thanks,

Tony
