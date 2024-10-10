Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27728999066
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2024 20:32:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B03210E9B2;
	Thu, 10 Oct 2024 18:32:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Xu5ZzRTf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B966910E9A8
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2024 18:32:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 085FFA44CA6;
 Thu, 10 Oct 2024 18:31:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D5CBC4CEC5;
 Thu, 10 Oct 2024 18:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1728585120;
 bh=SZXNydOJMWNXXLs/4/NNz4xsUZciFSY/wDDP/eBnJxY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Xu5ZzRTfzKp0YpHmKUlkPGvvlgNd/kW3Vg72eAStKxoag84d9i5dTklpDTUI4j1pJ
 aWa7wflpCFNJZP7C/DWeA7cPr4I3ozvOfXDnUZV4DOLRPU4fTig7AVlstxsig4q6+B
 bV0E7LZ44twkfH/1ByZ1zTHUKIwEm13j9wMpOMOlOKOIIpR0i06Z4A7jRDskZ5P2lF
 qssIiuSo0mMuLdo6Gx7qpnDS7q/JKpUoxinBt9pOygY3eu0U76sDVISMPvNaE8h3Lh
 dccGwW45ZrukxezFRD+v4S9WlQY5C7CW86lYcN3GO+aTd9T9+5QObBsqJnv+WU2qsj
 bGzmtilEnBisA==
Date: Thu, 10 Oct 2024 13:31:59 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 linux-kernel@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-watchdog@vger.kernel.org,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Conor Dooley <conor+dt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Lee Jones <lee@kernel.org>, Pavel Machek <pavel@ucw.cz>,
 linux-input@vger.kernel.org, Wim Van Sebroeck <wim@linux-watchdog.org>,
 linux-leds@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v2 5/5] dt-bindings: mfd: convert zii, rave-sp.txt to yaml
 format
Message-ID: <172858508703.2216471.5042662583120614593.robh@kernel.org>
References: <20241010-zii_yaml-v2-0-0ab730607422@nxp.com>
 <20241010-zii_yaml-v2-5-0ab730607422@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241010-zii_yaml-v2-5-0ab730607422@nxp.com>
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


On Thu, 10 Oct 2024 11:42:42 -0400, Frank Li wrote:
> Convert device binding doc zii,rave-sp.txt to yaml format.
> Additional change:
> - ref to other zii yaml files.
> - remove rave-sp-hwmon and rave-sp-leds.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../devicetree/bindings/mfd/zii,rave-sp.txt        | 39 --------------
>  .../devicetree/bindings/mfd/zii,rave-sp.yaml       | 63 ++++++++++++++++++++++
>  2 files changed, 63 insertions(+), 39 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

