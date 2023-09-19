Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E2257A6A42
	for <lists+dri-devel@lfdr.de>; Tue, 19 Sep 2023 19:54:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FCAF10E13D;
	Tue, 19 Sep 2023 17:54:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0860810E13D
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Sep 2023 17:54:18 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 1B295CE13C9;
 Tue, 19 Sep 2023 17:54:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C420C433C7;
 Tue, 19 Sep 2023 17:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1695146054;
 bh=9j+MQu7yid7iXBftD8f2XaH5sE5Latn/WTBSpDhIFDA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ph9SvXFbZBXBsdwSdHDX8OKb06CSFhSriqFi33HOvAY3kNKO8SVJd+7m8u9PieMrt
 7QQDDdusvHS8i/VKrtoahBveJYp2/TGq1pSEqLG/iitWhvLWOj9OysCUJofY22ozOD
 3zX9givPK0fywSkPXMTgP7tIQ5BQnl3Lf0tu3OvlxwFQyL5OGQXWahYewbMghI7+96
 ydyHnTYcN2KuVvHlNgHGsdOZ99O/CtUqqJ1+zCaCKLuX1o0aX2ek0MPQa3PUYHPYne
 F4jm7cKi0EReMyk27dDBOdG5XdsoHM7uBnODRkIfGv+TEDJcYQsBIKfeRIbesmQYUI
 XzC7y4zl6Yp7g==
Received: (nullmailer pid 4151281 invoked by uid 1000);
 Tue, 19 Sep 2023 17:54:12 -0000
Date: Tue, 19 Sep 2023 12:54:12 -0500
From: Rob Herring <robh@kernel.org>
To: Alicja Michalska <alka@sakamoto.pl>
Subject: Re: [PATCH] dt-bindings: display: anx7814: Add definition for anx7816
Message-ID: <20230919175412.GA4080978-robh@kernel.org>
References: <ZQjFabKW7QvrvsnG@tora>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZQjFabKW7QvrvsnG@tora>
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
Cc: devicetree@vger.kernel.org, jernej.skrabec@gmail.com, jonas@kwiboo.se,
 neil.armstrong@linaro.org, dri-devel@lists.freedesktop.org,
 Laurent.pinchart@ideasonboard.com, andrzej.hajda@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 18, 2023 at 11:49:44PM +0200, Alicja Michalska wrote:
> As requested by Robert Foss <rfoss@kernel.org>, this patch adds
> definition for anx7816. It supplements the patch submitted to dri-devel.

Please apply with the driver change.

> 
> Signed-off-by: Alicja Michalska <ahplka19@gmail.com>
> ---
>  .../devicetree/bindings/display/bridge/analogix,anx7814.yaml     | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/analogix,anx7814.yaml b/Documentation/devicetree/bindings/display/bridge/analogix,anx7814.yaml
> index 4a5e5d9d6f90..4509c496731b 100644
> --- a/Documentation/devicetree/bindings/display/bridge/analogix,anx7814.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/analogix,anx7814.yaml
> @@ -17,6 +17,7 @@ properties:
>        - analogix,anx7808
>        - analogix,anx7812
>        - analogix,anx7814
> +      - analogix,anx7816
>        - analogix,anx7818
>  
>    reg:
> -- 
> 2.41.0
> 
