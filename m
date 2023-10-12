Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CA697C6D63
	for <lists+dri-devel@lfdr.de>; Thu, 12 Oct 2023 13:53:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 568AA10E03D;
	Thu, 12 Oct 2023 11:53:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06B0910E03D
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Oct 2023 11:53:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id EEA35CE27E1;
 Thu, 12 Oct 2023 11:53:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAA60C433CA;
 Thu, 12 Oct 2023 11:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1697111606;
 bh=XfvMmvJdTaMZMG3N1c9TZP8HCU2GkB8oEwA4gts662M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=N++DBattEnKEgH4U30y7XWUjy9uwbhsnZjUHqSmoNch7aCC5k2R8GEkUT8DcofRSy
 PoLYxz6KXYe2M2TAlUDRdcIap1w0y02RIiJQXTLzxFb5HGDiivpoa2mAaZKl012GPh
 kob3hqVON1E5X115gmKekeO2RKT4MCpzU/HiJBTnlRE8M8JPevYFlpxO7IGmGPRSZb
 3N40Akdj9Nz5dDIFzwhW7HP8MBk1rFJdb4a7cdiehLH+QLYOc9XLD0D4e6EWJs91p/
 ywNU4/yYAVywLVLDJUQ/fVEYCUnpWXS9ZHZRnhcMD9UWKSRTGeBzrGtlj7JuhB8rAF
 9wwKvHzltImdQ==
Received: (nullmailer pid 286509 invoked by uid 1000);
 Thu, 12 Oct 2023 11:53:24 -0000
Date: Thu, 12 Oct 2023 06:53:24 -0500
From: Rob Herring <robh@kernel.org>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH v2 6/6] dt-bindings: display: Add SSD132x OLED controllers
Message-ID: <20231012115324.GB266951-robh@kernel.org>
References: <20231012065822.1007930-1-javierm@redhat.com>
 <20231012065822.1007930-7-javierm@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231012065822.1007930-7-javierm@redhat.com>
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
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Conor Dooley <conor@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Peter Robinson <pbrobinson@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 12, 2023 at 08:58:15AM +0200, Javier Martinez Canillas wrote:
> Add a Device Tree binding schema for the OLED panels based on the Solomon
> SSD132x family of controllers.
> 
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> ---
> 
> Changes in v2:
> - Remove unnecessary 'oneOf' in the SSD132x DT binding schema (Conor Dooley).
> - Remove unused DT nodes labels in the binding schema examples (Conor Dooley).
> - Split out common Solomon properties into a separate schema (Rob Herring).
> 
>  .../bindings/display/solomon,ssd132x.yaml     | 89 +++++++++++++++++++
>  MAINTAINERS                                   |  2 +-
>  2 files changed, 90 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/devicetree/bindings/display/solomon,ssd132x.yaml

Reviewed-by: Rob Herring <robh@kernel.org>
