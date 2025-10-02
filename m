Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A113DBB2317
	for <lists+dri-devel@lfdr.de>; Thu, 02 Oct 2025 03:00:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8C3C10E74B;
	Thu,  2 Oct 2025 01:00:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="iKwizORP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E1FD10E74B
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Oct 2025 01:00:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 5F02562339;
 Thu,  2 Oct 2025 01:00:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C81FEC4CEF1;
 Thu,  2 Oct 2025 01:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759366835;
 bh=pjPnjlspczDRAF5pe/F+7pe+bZIvPBL5uhCJyWOQgPo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iKwizORPZ3bybzpXw8WDhuWw+ZtXR15IsHQmV/WPGp7+YWpVoEcuyaUgnuaCHkAQS
 nJRM8kHq8d9mJlLIpqJ5zpbrh14SZhS1QEm/mrQV8bXwiT/hprxclWKR/b0GRAiok4
 V+uQFOKKlz6rcTy7XQykm+s1/jWP//9/pLpk63QLHQr4rqQYwehtq5pE/9rShuHvBS
 Q3PKWUiSAWzYbai0Fc8uuFF3DpPK+1S9CRhZwNkk9Vyb3Vlpqp8SDKXr5gTyHcfU0Q
 t+GL7EmdvJ9WpFAtltg4GnON/V9Q7r7n+fTiGOc6s2jfFrJh7PMEFL6CA0o2TTGoSB
 CUbn9mK1KC3RQ==
Date: Wed, 1 Oct 2025 20:00:33 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: David Heidelberg <david@ixit.cz>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, linux-arm-msm@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>,
 Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, devicetree@vger.kernel.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Casey Connolly <casey.connolly@linaro.org>,
 David Airlie <airlied@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Conor Dooley <conor+dt@kernel.org>,
 phone-devel@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 1/8] dt-bindings: panel: Add Samsung S6E3FC2X01 DDIC with
 panel
Message-ID: <175936683208.2810010.4903153430543479196.robh@kernel.org>
References: <20250925-s6e3fc2x01-v1-0-9293016768f7@ixit.cz>
 <20250925-s6e3fc2x01-v1-1-9293016768f7@ixit.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250925-s6e3fc2x01-v1-1-9293016768f7@ixit.cz>
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


On Thu, 25 Sep 2025 11:12:47 +0200, David Heidelberg wrote:
> Basic description for S6E3FC2X01 DDIC with attached panel AMS641RW.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  .../bindings/display/panel/samsung,s6e3fc2x01.yaml | 77 ++++++++++++++++++++++
>  MAINTAINERS                                        |  5 ++
>  2 files changed, 82 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

