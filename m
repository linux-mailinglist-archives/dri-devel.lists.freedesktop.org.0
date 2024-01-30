Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1979F842CFC
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jan 2024 20:37:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8ADA10F270;
	Tue, 30 Jan 2024 19:36:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mecka.net (mecka.net [159.69.159.214])
 by gabe.freedesktop.org (Postfix) with ESMTP id CD08910F270
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jan 2024 19:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mecka.net; s=2016.11;
 t=1706643384; bh=BEEx4gwRs1iKnUvPL+DNQPwugqIAQBhuDJjeH0AXavw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XkCZL0T1Ic9+FBUE62JW+/ktECjWhYSnNULt00KRgvzUoIrXAcpADfmW2G9+W4Srk
 4D3l9Xu95fkdHbhQNl/DxRUEvwEMwedKXEY4vQkGlPXcdHsaJYxjLi6wH0BRmNqWuL
 7/nJmkipBcqeQyB6Zv2F+xyk3h1i9LrS3ndskK580O5zoqJx8D+OMzvtJqVkbBDiRr
 M/4Km9TP6Rqy4rjBQqTonDiFps3H1vfIE1qzpLTBjQrQ540UtL0qNpSkwwUjJmdSYf
 gU1qrmdmuT7YeK8Cr8mjU1b/KSnNOV4hRlSAzG3eZ1kGPymFmLwcYLjPPljMTkKoJu
 +bi7WjpjCrcrw==
Received: from mecka.net (unknown [185.147.11.134])
 by mecka.net (Postfix) with ESMTPSA id 8F8BC3C95A9;
 Tue, 30 Jan 2024 20:36:23 +0100 (CET)
Date: Tue, 30 Jan 2024 20:36:22 +0100
From: Manuel Traut <manut@mecka.net>
To: Dang Huynh <danct12@riseup.net>
Subject: Re: [PATCH v4 0/4] arm64: rockchip: Pine64 PineTab2 support
Message-ID: <ZblPtrW7suT3RRXc@mecka.net>
References: <20240127-pinetab2-v4-0-37aab1c39194@mecka.net>
 <6035442.lOV4Wx5bFT@melttower>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6035442.lOV4Wx5bFT@melttower>
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
Cc: Diederik de Haas <didi.debian@cknow.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 David Airlie <airlied@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 linux-rockchip@lists.infradead.org, Jessica Zhang <quic_jesszhan@quicinc.com>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <mripard@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Yao <markyao0591@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Segfault <awarnecke002@hotmail.com>, Sandy Huang <hjc@rock-chips.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Ondrej Jirman <megi@xff.cz>, Daniel Vetter <daniel@ffwll.ch>,
 Arnaud Ferraris <aferraris@debian.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dang,

On Sat, Jan 27, 2024 at 06:35:50PM +0700, Dang Huynh wrote:
> Hi Manuel,
> 
> Since the BOE patches have been accepted to next, you do not need to include 
> it in this patch series.

sorry, I thought patches to LKML shall be against Linux master since the
patches are still only in drm-next I considered to keep them in the queue.

Regards
Manuel

> On Saturday, January 27, 2024 4:48:41 PM +07 Manuel Traut wrote:
> > - BOE TH101MB31IG002 LCD Panel:
> >   * Picked patches from https://anongit.freedesktop.org/git/drm/drm-misc.git
> > (drm-misc-next)
> 
> 
