Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D16E52D989
	for <lists+dri-devel@lfdr.de>; Thu, 19 May 2022 17:56:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F88210F18F;
	Thu, 19 May 2022 15:56:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1098810F18F
 for <dri-devel@lists.freedesktop.org>; Thu, 19 May 2022 15:56:37 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A5620B82520;
 Thu, 19 May 2022 15:56:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1A71C385AA;
 Thu, 19 May 2022 15:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1652975795;
 bh=HB0SywbMvt2xHizeVdOfaikETzpcXvZJJzSNtapX5kI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YfOpM0Q8nxBLGFQ6UzEuZ5Q7PEMclqOAQJEXU/xV4jB+EfKLN2B3x7gCUKUE6UlCg
 xiMkT+shxKPz2daPz2Mg83Xqc0P2TZjhG8Z+ZapOyQBZVS9ZjkRr+rtsoTT3F1W6Fm
 zg2MknPLGE83TKPK6c4W8D954el8Ws/p0P14EMKs=
Date: Thu, 19 May 2022 17:56:32 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Neal Liu <neal_liu@aspeedtech.com>
Subject: Re: [PATCH v3 0/3] add Aspeed udc driver for ast2600
Message-ID: <YoZosLk5GhTsP841@kroah.com>
References: <20220518062043.1075360-1-neal_liu@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220518062043.1075360-1-neal_liu@aspeedtech.com>
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
Cc: Felipe Balbi <balbi@kernel.org>, linux-aspeed@lists.ozlabs.org,
 devicetree@vger.kernel.org, Andrew Jeffery <andrew@aj.id.au>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, Rob Herring <robh+dt@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Joel Stanley <joel@jms.id.au>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Li Yang <leoyang.li@nxp.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 18, 2022 at 02:20:40PM +0800, Neal Liu wrote:
> This patch series aim to add Aspeed USB 2.0 Device Controller (udc)
> driver, including driver itself, device tree node and documentation.
> 
> Change since v2:
> - Rename device tree nodes.
> - Fix unusual indentation.
> 
> Change since v1:
> - Fix build test warning reported by kernel test robot.
> - Rename proper name for dt-bindings document.
> 
> *** BLURB HERE ***

No blurb?

