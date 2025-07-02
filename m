Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14382AF0C57
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jul 2025 09:17:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DB6610E279;
	Wed,  2 Jul 2025 07:17:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="VhovT1ow";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A94B810E279
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jul 2025 07:17:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 95BA7A53243;
 Wed,  2 Jul 2025 07:17:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE439C4CEEE;
 Wed,  2 Jul 2025 07:17:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1751440666;
 bh=IlwKoiUCYuw1cVdfd5GoX8U1ubR8xzniGhMiSlw8mzg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VhovT1owv34nFedpb/TKIEsP/OT/X9OHDa48kcOhslM+TDAc3spkXiK0QsG/hgIYG
 TNFULzVYhQbHnmKfIMgBTS6DvLuY3VYrNnT7nd6f85ZBTqWkJHfbTdLf5CcqVjrSco
 7fISvjM1WQWsqTpE67CESKEZp5om7gqcjFRwv3vgFET2kS4A423RMBxKWSQW/u5O3V
 ncq0WBztvTUJk923HdK1QOJ5SM1hLVOZRZeZZ8Udk9F5BoBXKtirgOT48RKcYV0IHd
 lAghPXMAQ6TU/w+a1iqWnYgozgV92Hhtjb/rb/iRhtMe5TJJFL9WTO7xghh5nrP2sM
 fkV8k4YtRfOjg==
Date: Wed, 2 Jul 2025 09:17:43 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Paul Kocialkowski <paulk@sys-base.io>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
 Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 1/2] dt-bindings: display: simple: Add Olimex
 LCD-OLinuXino-5CTS
Message-ID: <20250702-uppish-unbiased-bullfrog-bcb5d3@krzk-bin>
References: <20250701201426.814750-1-paulk@sys-base.io>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250701201426.814750-1-paulk@sys-base.io>
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

On Tue, Jul 01, 2025 at 10:14:25PM +0200, Paul Kocialkowski wrote:
> Add the Olimex LCD-OLinuXino-5CTS, a 5-inch TFT LCD panel.
> 
> Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
> ---

Not tested or missing yamlint. Rob's report probably will follow up, but
even without it - please test before sending, not after.

Best regards,
Krzysztof

