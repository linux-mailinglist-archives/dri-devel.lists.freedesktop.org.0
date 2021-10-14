Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD1E242E144
	for <lists+dri-devel@lfdr.de>; Thu, 14 Oct 2021 20:30:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83BA16EC0C;
	Thu, 14 Oct 2021 18:30:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B53EC6EC0C
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Oct 2021 18:30:16 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 106F96105A;
 Thu, 14 Oct 2021 18:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634236216;
 bh=6gIn29naRubCw68Wmg4GZTgHDg0wmSy/Pag5o9tr39g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=D3sJjcPESpvNw3pzI5995YjE4YyGKdRvKkW1f2goKA/21IFe5ETF1JKv5GI0UB0GB
 Q2sggq3e088MWTB+eRC/avRgdUwpbAcO4XCrL6semcv1y6EDnY/LQWQrAHpYhxciBU
 HhDxg357l/AEQTOXNgSKdYlDux6ghMBOWfBfVGmteaenGLdLXm1pqJ6HpnKK2YAppr
 qi7B2FNLytiXNahEcy8g49dcIaIXzCJiyVQUdNaIrh0NgoJ+8SSSUiK/+YBajPHlUH
 t5pW6Qp13y4jZthDdqHMlEqnVUpn3jGmhSL4Wb0YKBBwEXgENgy7FrYjS0E8n27O0m
 TB3a7WzkJerNA==
Date: Thu, 14 Oct 2021 13:34:41 -0500
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Cc:  linux-fbdev@vger.kernel.org, linux-omap@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org;
Subject: Re: [PATCH] video: omapfb: Fix fall-through warning for Clang
Message-ID: <20211014183441.GA1146820@embeddedor>
References: <20211014165320.GA1145571@embeddedor>
 <YWh2bKnY0Z75g0S3@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YWh2bKnY0Z75g0S3@ravnborg.org>
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

On Thu, Oct 14, 2021 at 08:26:52PM +0200, Sam Ravnborg wrote:
> Hi Gustavo,
> On Thu, Oct 14, 2021 at 11:53:20AM -0500, Gustavo A. R. Silva wrote:
> > Fix the following fallthrough warnings:
> > 
> > drivers/video/fbdev/omap/omapfb_main.c:1558:2: warning: unannotated fall-through between switch labels [-Wimplicit-fallthrough]
> >            case 0:
> >            ^
> >    drivers/video/fbdev/omap/omapfb_main.c:1558:2: note: insert 'break;' to avoid fall-through
> >            case 0:
> >            ^
> >            break;
> >    1 warning generated.
> > 
> > This helps with the ongoing efforts to globally enable
> > -Wimplicit-fallthrough for Clang.
> > 
> > Link: https://github.com/KSPP/linux/issues/115
> > Link: https://lore.kernel.org/lkml/202110141005.hUjaYMEi-lkp@intel.com/
> > Reported-by: kernel test robot <lkp@intel.com>
> > Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> applied to drm-misc-next. It will show up in -next in 1-2 weeks time.

Great. :)

Thanks, Sam.
--
Gustavo
