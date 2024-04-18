Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 130AE8A9A59
	for <lists+dri-devel@lfdr.de>; Thu, 18 Apr 2024 14:49:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29E8B10FC4F;
	Thu, 18 Apr 2024 12:49:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="BgVbWLpd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55B5B10FC4F
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Apr 2024 12:49:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 7D21CCE1414;
 Thu, 18 Apr 2024 12:49:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BA4AC113CC;
 Thu, 18 Apr 2024 12:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1713444566;
 bh=G8iIaDSoTzX8WwprmZzksy2cT8VoIMe2ObbDA5sfRks=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BgVbWLpdSqyUhBogIz8YhMvuKkPpyMVD064SsnwwAWjiH81oDUoAKnL2bTdpYIj7D
 yjXVcw1l+dhS1QAwLtRs+Q3S9AekJoj7ymUKvL7wsh7mo2WVxMSJwGuIpvOsVz/nwW
 NNpU9W5T3WM5LNCf3Qn9J1G+YgLSND354UbUm4MqPvsB9Z03+pBIKHHNt6KoWCR5tC
 eZb/7PuULVOfnmgZLzEQWtaQdDB8bpIem3KkHKDsnKPadqeiFVZ6GtrM5qbJq2tB3n
 xeLQ8mwZD2ZP37MfBy7HtW728a4DhWHAdnpbVubVJF9oa9uHs6Ravx25tPFHi7g2Zn
 YGTuLDfsn9g+w==
Date: Thu, 18 Apr 2024 07:49:23 -0500
From: Rob Herring <robh@kernel.org>
To: David Wronek <david@mainlining.org>
Cc: Daniel Vetter <daniel@ffwll.ch>, ~postmarketos/upstreaming@lists.sr.ht,
 Konrad Dybcio <konradybcio@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 dri-devel@lists.freedesktop.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maxime Ripard <mripard@kernel.org>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Jessica Zhang <quic_jesszhan@quicinc.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 phone-devel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v4 1/2] dt-bindings: display: panel: Add Raydium RM69380
Message-ID: <171344451492.997671.11196384805681693246.robh@kernel.org>
References: <20240417-raydium-rm69380-driver-v4-0-e9c2337d0049@mainlining.org>
 <20240417-raydium-rm69380-driver-v4-1-e9c2337d0049@mainlining.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240417-raydium-rm69380-driver-v4-1-e9c2337d0049@mainlining.org>
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


On Wed, 17 Apr 2024 18:29:33 +0200, David Wronek wrote:
> Raydium RM69380 is a display driver IC used to drive OLED DSI panels.
> Add a dt-binding for it.
> 
> Signed-off-by: David Wronek <david@mainlining.org>
> ---
> Note:
> Depends on commit 48a516363e29 ("dt-bindings: display: panel: add common dual-link schema")
> ---
>  .../bindings/display/panel/raydium,rm69380.yaml    | 89 ++++++++++++++++++++++
>  1 file changed, 89 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

