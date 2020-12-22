Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF5B82E0D53
	for <lists+dri-devel@lfdr.de>; Tue, 22 Dec 2020 17:27:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A40B56E405;
	Tue, 22 Dec 2020 16:27:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 288456E405
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Dec 2020 16:27:15 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id C5D5622AAE;
 Tue, 22 Dec 2020 16:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1608654434;
 bh=TL0OpA64GzFmwToXJLX0r9Oq1tR4MpAMJvZ6vZ0Fdyg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iDgzLpQBBXH9YTfFBKVQJYN6MYAp0jCmF55BRi4QMkWj9bvJlAMGoT5ymjLbEQtzw
 3tEM/W5nGCHA3+B+VwbF798B2VViU6tS/mjzIV7x4TgTTUMiDOkQq5MI3n7dW9zA5E
 FSw9Km5td0sUQBbjY85j2Q3PdKmI6mps5XRQCC2ChSGNeeoPAZ528rrHsxGFxTJSNt
 5g4vgoUpkM5Ac394XVjisDu4ydN3le5yZm44TWYT94ZnALtWvXTqjsMhTMGaD8dqa1
 Gk5eCeSwlpTHzab3W/rGF8KZK1Pw/MvIBODzv2zvbb43/pVQ+KG76KZIpU6ryF/bZW
 0vu2GqQzMYCJA==
Date: Tue, 22 Dec 2020 21:57:09 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: Drop redundant maxItems/items
Message-ID: <20201222162709.GA120946@vkoul-mobl>
References: <20201222040645.1323611-1-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201222040645.1323611-1-robh@kernel.org>
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jassi Brar <jaswinder.singh@linaro.org>, Mark Brown <broonie@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dmaengine@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 21-12-20, 21:06, Rob Herring wrote:
> 'maxItems' equal to the 'items' list length is redundant. 'maxItems' is
> preferred for a single entry while greater than 1 should have an 'items'
> list.
> 
> A meta-schema check for this is pending once these existing cases are
> fixed.

> ---
>  .../devicetree/bindings/display/xlnx/xlnx,zynqmp-dpsub.yaml    | 1 -
>  Documentation/devicetree/bindings/dma/renesas,rcar-dmac.yaml   | 1 -

Acked-By: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
