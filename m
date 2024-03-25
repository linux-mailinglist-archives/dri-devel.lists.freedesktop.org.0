Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ECDF88A49A
	for <lists+dri-devel@lfdr.de>; Mon, 25 Mar 2024 15:33:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9258E10E910;
	Mon, 25 Mar 2024 14:33:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="MFUoVDmr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C23C810E910
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 14:33:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id C854FCE1A14;
 Mon, 25 Mar 2024 14:33:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFF80C433C7;
 Mon, 25 Mar 2024 14:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711377208;
 bh=QxiBmosJiAlkkJIjPXuxNfLHIgYXfAiySTVvVlXw9mc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MFUoVDmrRB6lHJTifMM9A42KkJ73wQLUmnHb23TFfdlKcrWQJ4HH1biNzNSWElWuP
 RhFmsvzxJs5Yrh/srG0FJOu1RTH6yb45xgsfXIZt2pFdg8kxYGBu88mNcZOj91GyMi
 dy3ZdWfwejINfoIQU+xut0hoUbEOdPceLNHyjy4MyPfugtKiYtGxzl/0136s3jfFoY
 kdFS4Uovn5Ah1LkqYdydnW+XpsMxxAp2USyBa5Uxl8vUG9jbmUYuuRhamzZd7+7ioa
 kuccry2y95VT90//zNLLOML40RSmdeggmRuMHhzjTf5/8ah4vuCtHfcCHOaVvoMDrw
 G14CPuAK9S7hQ==
Date: Mon, 25 Mar 2024 09:33:24 -0500
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Konrad Dybcio <konrad.dybcio@somainline.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 devicetree@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [RESEND PATCH] dt-bindings: display: sony,td4353-jdi: allow
 width-mm and height-mm
Message-ID: <171137719526.3318300.16563684034350324718.robh@kernel.org>
References: <20240325103227.27474-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240325103227.27474-1-krzysztof.kozlowski@linaro.org>
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

On Mon, 25 Mar 2024 11:32:27 +0100, Krzysztof Kozlowski wrote:
> Allow width and height properties from panel-common.yaml, already used
> on some boards:
> 
>   sdm845-sony-xperia-tama-apollo.dtb: panel@0: 'height-mm', 'width-mm' do not match any of the regexes: 'pinctrl-[0-9]+'
> 
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
> 
> Rob, could you pick up this one? Was on the list for almost a year.
> 
> 
>  .../devicetree/bindings/display/panel/sony,td4353-jdi.yaml      | 2 ++
>  1 file changed, 2 insertions(+)
> 

Applied, thanks!

