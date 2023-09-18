Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EF9AD7A55CF
	for <lists+dri-devel@lfdr.de>; Tue, 19 Sep 2023 00:29:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41A7510E356;
	Mon, 18 Sep 2023 22:29:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFCFE10E356
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Sep 2023 22:29:46 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 645ABCE109A;
 Mon, 18 Sep 2023 22:29:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AED08C433C7;
 Mon, 18 Sep 2023 22:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1695076182;
 bh=mDnuLPjnWhvrz7zvBdQofJEYR3fhnCIVsuJPvQIYWUQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=U0JWg6czFfkApL/f7hioO32UamWDOagGvWQf37a9Mb2l7WrLa8zBuJ/npVqllcKa9
 EMMnnuzdwnbaCJ1X369UyMyC0UgpCS3+fQfJUl3K6TVY2jJHBTwZpV9GQOi9nvrxes
 zR72TSXTJMw2dN9Cu309kINL1jk/ZJuelWIJ0vy9xm/5Omus71gSdzNP68WeWMmOiP
 hvghsppaKOiaG53UPkR5Tr7qn4B0mDY8wgUSJ+Q+R7Z+CjPmNU5Y54n8yeHe35tS5r
 GhO6SdY0wvlzraR5KeD8wpteP7x9JFQ6JGCUE+ndSq6ytPfJoYXLctuYm2FLav7ElI
 GAIm9/Ex87Vrg==
Received: (nullmailer pid 1858098 invoked by uid 1000);
 Mon, 18 Sep 2023 22:29:39 -0000
Date: Mon, 18 Sep 2023 17:29:39 -0500
From: Rob Herring <robh@kernel.org>
To: John Watts <contact@jookia.org>
Subject: Re: [RFC PATCH v2 9/9] dt-bindings: display: panel: add Fascontek
 FS035VG158 panel
Message-ID: <169507617909.1858058.4798985239779880637.robh@kernel.org>
References: <20230918125853.2249187-1-contact@jookia.org>
 <20230918125853.2249187-10-contact@jookia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230918125853.2249187-10-contact@jookia.org>
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Chris Morgan <macromorgan@hotmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Sam Ravnborg <sam@ravnborg.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jagan Teki <jagan@edgeble.ai>, Paul Cercueil <paul@crapouillou.net>,
 Rob Herring <robh+dt@kernel.org>, Jessica Zhang <quic_jesszhan@quicinc.com>,
 Shawn Guo <shawnguo@kernel.org>,
 Christophe Branchereau <cbranchereau@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Mon, 18 Sep 2023 22:58:53 +1000, John Watts wrote:
> This is a small 3.5" 640x480 IPS LCD panel.
> 
> Signed-off-by: John Watts <contact@jookia.org>
> ---
>  .../display/panel/fascontek,fs035vg158.yaml   | 56 +++++++++++++++++++
>  1 file changed, 56 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/fascontek,fs035vg158.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

