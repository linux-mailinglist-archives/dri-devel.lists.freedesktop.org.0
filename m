Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C2A9C81984F
	for <lists+dri-devel@lfdr.de>; Wed, 20 Dec 2023 06:52:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7839C10E02E;
	Wed, 20 Dec 2023 05:52:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E063C10E02E
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Dec 2023 05:52:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 8009CCE19E9;
 Wed, 20 Dec 2023 05:52:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46E64C433C7;
 Wed, 20 Dec 2023 05:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1703051568;
 bh=z+L9PI6kli5nZdtjmw6TPPngwiXMCNwjQXBOgKSPlZM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Rbxzw+l7Bdx9oVbdz8zr5v82cQZufrjuvBTLcPYPxf/etamCmyJEev3Wv/UuzbO+B
 1RRYP5iME/P30r03xSe7wrFZVU6jJ+p1rMSf8BqBaFFked6tbCHnatO4ymelrCM7kp
 Yjt7dsH6Hs+PpA8fw8+G4TSQciCSN4d9IszpYhME=
Date: Wed, 20 Dec 2023 06:52:46 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: sam@ravnborg.org
Subject: Re: [PATCH 24/27] sparc32: Drop config SPARC_LEON
Message-ID: <2023122034-chemist-tipping-8146@gregkh>
References: <20231219-sam-sparc32-sunset-v3-v1-0-64bb44b598c5@ravnborg.org>
 <20231219-sam-sparc32-sunset-v3-v1-24-64bb44b598c5@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231219-sam-sparc32-sunset-v3-v1-24-64bb44b598c5@ravnborg.org>
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
Cc: Arnd Bergmann <arnd@kernel.org>, linux-fbdev@vger.kernel.org,
 Andreas Larsson <andreas@gaisler.com>, linux-kernel@vger.kernel.org,
 Helge Deller <deller@gmx.de>, linux-usb@vger.kernel.org,
 linux-sound@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 dri-devel@lists.freedesktop.org, Jaroslav Kysela <perex@perex.cz>,
 Alan Stern <stern@rowland.harvard.edu>,
 Alexander Viro <viro@zeniv.linux.org.uk>, sparclinux@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 19, 2023 at 11:03:29PM +0100, Sam Ravnborg via B4 Relay wrote:
> From: Sam Ravnborg <sam@ravnborg.org>
> 
> The only support sparc32 CPU is LEON, so there is no need for a
> config option to select it.
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: Arnd Bergmann <arnd@kernel.org>
> Cc: Andreas Larsson <andreas@gaisler.com>

For the USB stuff:

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
