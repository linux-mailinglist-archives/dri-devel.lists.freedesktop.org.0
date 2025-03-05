Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A9EAA4F848
	for <lists+dri-devel@lfdr.de>; Wed,  5 Mar 2025 08:51:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B500610E7B4;
	Wed,  5 Mar 2025 07:51:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="WGTIN5MW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF07510E7B4
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Mar 2025 07:51:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 2CDDB5C6680;
 Wed,  5 Mar 2025 07:49:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C19D2C4CEE2;
 Wed,  5 Mar 2025 07:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741161099;
 bh=QyFRWvas24e4KFCBZT6GjOM6RBxXtM6JmFhw+HxMXC0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WGTIN5MW2xH/jYQsYk7OaCKGbVAnVS1qUqybaNHjTY3DW+0wnGQ/qFcXFsK7ojCzV
 eFDDIp3WSCk48TAx/mNGH4e1R8rE6cC7wfNvNka/3/ezu8q3jbhWxBoHZDmxQ1H/IQ
 xSeqI1glSzLexuE1/sAG+xdxSby4Yye97ToTijmVpkFe78+i9xK1tvnggp+zgSLiqx
 Prsp/d3TV/nwoeY655ghQHPAcmEEPRJgXzwCoxC9KWBJp0R0Gd0MTwUcLYaSTEit7K
 V9Jmmhwx/tktmAmp2fb3muPRDDW9c9pSldd20LpuRRGmXsv0UlrEWSWEJ3fDK3i4/j
 iOCvRKsELfoeQ==
Date: Wed, 5 Mar 2025 08:51:35 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Liu Ying <victor.liu@nxp.com>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, robh@kernel.org, 
 krzk+dt@kernel.org, conor+dt@kernel.org, andrzej.hajda@intel.com, 
 neil.armstrong@linaro.org, rfoss@kernel.org, Laurent.pinchart@ideasonboard.com,
 jonas@kwiboo.se, jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com, 
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
Subject: Re: [PATCH 1/5] dt-bindings: display: Document DPI color codings
Message-ID: <20250305-important-quizzical-chamois-ff48af@krzk-bin>
References: <20250304101530.969920-1-victor.liu@nxp.com>
 <20250304101530.969920-2-victor.liu@nxp.com>
 <20250304-deer-of-striking-pride-ff6e86@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250304-deer-of-striking-pride-ff6e86@houat>
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

On Tue, Mar 04, 2025 at 11:33:44AM +0100, Maxime Ripard wrote:
> > +properties:
> > +  dpi-color-coding:
> > +    enum:
> > +      - 16bit-configuration1
> > +      - 16bit-configuration2
> > +      - 16bit-configuration3
> > +      - 18bit-configuration1
> > +      - 18bit-configuration2
> > +      - 24bit
> 
> Do we really needs strings there? It would be much better to use an int
> plus a header

So DTS would sill have a name, just being a define? Then what is the
benefit comparing to strings above in DTS readability?

Best regards,
Krzysztof

