Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D08E77A55CC
	for <lists+dri-devel@lfdr.de>; Tue, 19 Sep 2023 00:28:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20AD010E34A;
	Mon, 18 Sep 2023 22:28:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7F3410E34A
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Sep 2023 22:28:33 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 08AA8CE109A;
 Mon, 18 Sep 2023 22:28:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58A65C433C7;
 Mon, 18 Sep 2023 22:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1695076109;
 bh=Cm6gdHRXbYq+GvZmRva1a3/Sze3/iw5r/rmeAg1FI2E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OiPlyidCV3PVOmISTNABR9087gxEv8kvpZbkwolzYvgnWPBPGl0KnVkScS1Qgbkwc
 2di8LxHcimqri0koEQ7zsjF/e6BXUOkINpHYBhoW+RSjNJIJ+lMFSolVk9O/yoTBmn
 RIg8PF7+Xg33wNkN00a3n8OQi8F0vkg8uUOEZY+3bFM+jYrkLQCIM6JGrbIs8RB569
 U0yRn85/zwSXUwQqetEjSbvQOE7SYgeZhhR/S+HgiVmhqmyn46C1i/6efWHW0jGivt
 RYklZjuwZgInLmkVHWEU+X02Dree3YZlaVrd4VIYgm+eZaLJ17nMF6qaEJrHQ3Cclq
 VBaKzNEzb7l4Q==
Received: (nullmailer pid 1856606 invoked by uid 1000);
 Mon, 18 Sep 2023 22:28:26 -0000
Date: Mon, 18 Sep 2023 17:28:26 -0500
From: Rob Herring <robh@kernel.org>
To: John Watts <contact@jookia.org>
Subject: Re: [RFC PATCH v2 7/9] dt-bindings: display: panel: Clean up
 leadtek,ltk035c5444t properties
Message-ID: <169507610587.1856550.8091958935688458267.robh@kernel.org>
References: <20230918125853.2249187-1-contact@jookia.org>
 <20230918125853.2249187-8-contact@jookia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230918125853.2249187-8-contact@jookia.org>
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
 Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, devicetree@vger.kernel.org,
 Shawn Guo <shawnguo@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jagan Teki <jagan@edgeble.ai>,
 Paul Cercueil <paul@crapouillou.net>, Rob Herring <robh+dt@kernel.org>,
 Chris Morgan <macromorgan@hotmail.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Christophe Branchereau <cbranchereau@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Mon, 18 Sep 2023 22:58:51 +1000, John Watts wrote:
> Remove common properties listed in common yaml files.
> Add required properties needed to describe the panel.
> 
> Signed-off-by: John Watts <contact@jookia.org>
> ---
>  .../bindings/display/panel/leadtek,ltk035c5444t.yaml      | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

