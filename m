Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87A959AFD69
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2024 10:59:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B05CD10EA32;
	Fri, 25 Oct 2024 08:59:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Tc+X+KwG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B45710EA42
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2024 08:59:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 0A24CA42BAF;
 Fri, 25 Oct 2024 08:57:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5468BC4CEC3;
 Fri, 25 Oct 2024 08:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1729846768;
 bh=CaoZb6iMKefryx3dzMfNqk04kR4xgtLkasn22NSbL9M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Tc+X+KwGPFtij/lPh0fHrtgfA2ROCdFZghtamGl4k8h6+Oij9QU4PEUoDcFW1tYDW
 0D17kj74E0y6P/WfttqKt2HQcgOcD+jvUm7glnmwM9Fgg6ebKftRHJHl8pY8U1k/Ga
 eIORbzLiYWyZXDSp4Klt7U2x2JErz3meyVBr6yyftFHdEixXJFdSY8eaPjd4x5y1SQ
 IEneXeSm8vJqM5k49AgH4QJJtsezk8hhUeFNWDTcJy2vngIR1XW/qDZvbVRzEc1LI3
 Xmq4CkAY9GplgES+ydyHW5pYhtiVca8ux8sAoivEtasrgXuOpzzCGw9BTZdiZ49D9O
 09HZT7LdFMTBw==
Date: Fri, 25 Oct 2024 09:59:22 +0100
From: Lee Jones <lee@kernel.org>
To: Jiri Kosina <jikos@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, daniel.thompson@linaro.org,
 jingoohan1@gmail.com, deller@gmx.de, bonbons@linux-vserver.org,
 bentiss@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 shawnguo@kernel.org, festevam@gmail.com,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-omap@vger.kernel.org
Subject: Re: [GIT PULL] Immutable branch between Backlight, HID and fbdev due
 for the v6.13 merge window
Message-ID: <20241025085922.GE10824@google.com>
References: <20240906075439.98476-1-tzimmermann@suse.de>
 <20241001085540.GB7504@google.com>
 <nycvar.YFH.7.76.2410211750460.20286@cbobk.fhfr.pm>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <nycvar.YFH.7.76.2410211750460.20286@cbobk.fhfr.pm>
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

On Mon, 21 Oct 2024, Jiri Kosina wrote:

> On Tue, 1 Oct 2024, Lee Jones wrote:
> 
> > Enjoy!
> > 
> > The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc:
> > 
> >   Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)
> > 
> > are available in the Git repository at:
> > 
> >   ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/lee/backlight.git tags/ib-backlight-hid-fbdev-v6.13
> > 
> > for you to fetch changes up to 0d580d99749e759b62dc8e28f511310e9235da7a:
> > 
> >   backlight: lcd: Do not include <linux/fb.h> in lcd header (2024-09-30 16:49:42 +0100)
> > 
> > ----------------------------------------------------------------
> > Immutable branch between Backlight, HID and fbdev due for the v6.13 merge window
> 
> As picoLCD is the only affected driver in HID, I will be pulling this only 
> if there are any patches for picoLCD submitted for 6.13 (which is not yet 
> the case).

Sounds like a plan.  Thanks for letting me know.

-- 
Lee Jones [李琼斯]
