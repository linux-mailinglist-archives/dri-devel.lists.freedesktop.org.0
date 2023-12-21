Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D5F7681C0D9
	for <lists+dri-devel@lfdr.de>; Thu, 21 Dec 2023 23:14:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28AEA10E720;
	Thu, 21 Dec 2023 22:14:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6FF710E720
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Dec 2023 22:14:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id F011DB821CD;
 Thu, 21 Dec 2023 22:14:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F47EC433C7;
 Thu, 21 Dec 2023 22:14:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1703196867;
 bh=cYS3cTDbw5ZEO4RjMQJxm2bzTbH7s3/S3JHSmNe9LI4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=r3PgqdPPNA0G2/m4c2P6d/DNk03EOFgdBDVbb9yFwFSiYav/aVFEgskn5ffIJmlaL
 9MF0hK8gDjJY23vJZP0s3MHRqyN8RzoA/MjxHLCJnNCQx3SFKmMLB6uaJf7tMktxdG
 U0qy7IRnkA47Z0Vl5mvT6vL4d7KQYB95RDWgm+upcaMfDb4Eb8FegPhwwyz21Gzp4f
 mm70kstEkaMyEcSP2agMqZEB0+iYKB6bEgZq2KiaIUXFfCH1AmwkAENsV0Cucqtiez
 A3S5y+HfOFoLOv0E//1GYTl5ybtBOt3hz4i3D76jhAdlD8vTr3V8IHZqeOEPmEy8Up
 hUygrIuwakyaA==
Received: (nullmailer pid 186572 invoked by uid 1000);
 Thu, 21 Dec 2023 22:14:25 -0000
Date: Thu, 21 Dec 2023 16:14:25 -0600
From: Rob Herring <robh@kernel.org>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH v3 3/4] dt-bindings: display: Add SSD133x OLED controllers
Message-ID: <170319686456.186513.13956120421237374815.robh@kernel.org>
References: <20231219203416.2299702-1-javierm@redhat.com>
 <20231219203416.2299702-4-javierm@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231219203416.2299702-4-javierm@redhat.com>
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
Cc: Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jocelyn Falempe <jfalempe@redhat.com>, Conor Dooley <conor@kernel.org>,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Peter Robinson <pbrobinson@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Tue, 19 Dec 2023 21:34:08 +0100, Javier Martinez Canillas wrote:
> Add a Device Tree binding schema for the OLED panels based on the
> Solomon SSD133x family of controllers.
> 
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> ---
> 
> Changes in v3:
> - Move solomon,ssd-common.yaml ref before the properties section and
>   width/height constraints after the other properties (Conor Dooley).
> 
> Changes in v2:
> - Unconditionally set the width and height constraints (Conor Dooley).
> - Fix indentation in the DTS examples (Krzysztof Kozlowski).
> 
>  .../bindings/display/solomon,ssd133x.yaml     | 57 +++++++++++++++++++
>  1 file changed, 57 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/solomon,ssd133x.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

