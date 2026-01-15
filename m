Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C13B8D28020
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jan 2026 20:20:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A707E10E05B;
	Thu, 15 Jan 2026 19:20:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="ggALHCEd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FEFC10E05B
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 19:20:21 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org
 [IPv6:2001:67c:2050:b231:465::202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4dsXr15RVQz9tDR;
 Thu, 15 Jan 2026 20:20:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1768504817;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E4fJp9wbmRI1vmPAbrx5E9O/lqTVncJXTTCym1eiIps=;
 b=ggALHCEdtM7NcWEy/LIWICqAGbbnkDV3aCDwdbB+blQ58j9V1ZoauYI2fBb4Q21SxMKTfn
 eipkD+RBlBujcFWGe8yusmki5H31ndlFJUMRHwnUKstNuuv4Wza/A6nSL4Ux8Srtn9DXiC
 ptHSqFvKtMmkmJSu7DaNjK5HJCuUrqPQOg/Zf8hX4jVTZBpZ1LtOANWXRtcToRpP0nIJBM
 59iz2fcIVXZpP5IcHStCiH/nkvKJPzOisZlFdN865VphWsiOQY5Yjr43PTiL5poH110cXb
 NvmJUdImwHXq4/IJqhe86h+olYyyxQ0y+zF3RrM1KswR9vWNmFR7Vp22FelXOA==
Message-ID: <85ff0eb2-d942-4f85-8f1d-c5982bd31bec@mailbox.org>
Date: Thu, 15 Jan 2026 20:20:03 +0100
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] dt-bindings: display: panel: Fork Waveshare panels
 into separate document
To: Rob Herring <robh@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
 David Airlie <airlied@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Sam Ravnborg <sam@ravnborg.org>,
 Simona Vetter <simona@ffwll.ch>, Thierry Reding <thierry.reding@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
References: <20260113000715.231238-1-marek.vasut+renesas@mailbox.org>
 <20260115174047.GA930768-robh@kernel.org>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <20260115174047.GA930768-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 744ec2472507d528058
X-MBO-RS-META: qcfhjoyang9zs5kdamujjdinfhhwheqm
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

On 1/15/26 6:40 PM, Rob Herring wrote:
> On Tue, Jan 13, 2026 at 01:05:30AM +0100, Marek Vasut wrote:
>> Move the Waveshare panels description into separate document, so they
>> can be properly described with compatible = "waveshare,...", "panel-dpi"
>> and attached to "waveshare,dsi2dpi" bridge.
> 
> But why do we need "panel-dpi"? Adding that requires changing a DT.
> Can't you make the kernel handle these compatible strings as a
> "panel-dpi" without the compatible?
I can, but wouldn't we then miss the more specific compatible strings in 
the DT ?

compatible = "waveshare,13.3inch-panel", "panel-dpi";
              ^^^^^^^^^^^^^^^^^^^^^^^^^^
              this ... would be removed. Do we want that ?

The other option would be to add the timings into panel-simple driver, 
then we wouldn't have to change the bindings at all. Maybe that would be 
preferable ?
