Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 45F36719CB8
	for <lists+dri-devel@lfdr.de>; Thu,  1 Jun 2023 14:56:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3742E10E13A;
	Thu,  1 Jun 2023 12:55:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35BFD10E13A
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Jun 2023 12:55:54 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 20AC360DDA;
 Thu,  1 Jun 2023 12:55:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FC34C433D2;
 Thu,  1 Jun 2023 12:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1685624151;
 bh=3j3jZx54Skw7SCFyfcaIA/+uHlmSwQL5bWo6rQYQkxc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=SWWxtPZhBvEH6UJxwihew4bx3Mlp44h3Cnoe9ntwEmiH49pszbo9Y2KgjZRStdTcr
 cLrv+PE02VFwImEjoBrW4wSTCpdpluLg17AHTGieWOMsu35YgUDP082f7tNat7pImM
 Yn/1LEWTH1pWQ7JW8d4h4i/iOCb3n4gySFWTGwYSPCxZ2GsAlvZ6Nw/5TBbJqz7G3L
 Kz4EqK7z85Y42c34oupd3TAoRs3NyUFrHNbT9Y0GOMim/NfsMLmPKVZ6Z4fsv1Oula
 1FeGql9JsCcazxiaY9SIDiftQ/+csJSk1xBsGFCqhonsz906aZEVZEkl8KJibDZwAX
 O1LQj95LC5l1A==
From: rfoss@kernel.org
To: dri-devel@lists.freedesktop.org,
	Marek Vasut <marex@denx.de>
Subject: Re: [PATCH 1/2] dt-bindings: display: bridge: tc358762: Document
 reset-gpios
Date: Thu,  1 Jun 2023 14:55:44 +0200
Message-Id: <168562413774.523376.9790217290891273566.b4-ty@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230530192805.648646-1-marex@denx.de>
References: <20230530192805.648646-1-marex@denx.de>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Robert Foss <rfoss@kernel.org>

On Tue, 30 May 2023 21:28:04 +0200, Marek Vasut wrote:
> This chip has one reset GPIO input, document it. The reset GPIO
> is optional as it is sometimes not connected on some hardware.
> 
> 

Applied, thanks!

[1/2] dt-bindings: display: bridge: tc358762: Document reset-gpios
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=e8001973bb45
[2/2] drm/bridge: tc358762: Add reset GPIO support
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=3355f4ee561d



Rob

