Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 186059EB31E
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2024 15:25:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5744110E8ED;
	Tue, 10 Dec 2024 14:25:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ohxgPAk5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0A8410E8ED
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2024 14:25:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 9CD48A418A1;
 Tue, 10 Dec 2024 14:23:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70476C4CEDE;
 Tue, 10 Dec 2024 14:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1733840718;
 bh=XvACE+bdqQyWiqXaX0FQMqrV41fU2XwxHSNf6quzRNM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ohxgPAk5I/GLaIskYIwE6w1VuTM7PUnEFC3rvpKTg05SBwffEWgZhZsu9Z2n6QWOS
 lVcW1CavMeGNdG/X6t0wJiL02K7xz6BJjuEwicsEUZUzfPoIDVG7RKnusXs5vE2T+S
 1ZplfdjGTrRrjvPebjVdW4SNdDp/onKaRwh1gAR4=
Date: Tue, 10 Dec 2024 15:24:43 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Antonio Riccio <linux@ariccio.me>
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: fbtft: Remove unnecessary parentheses
Message-ID: <2024121021-blurred-dotted-c78d@gregkh>
References: <Z1hNxNkVSt11ncXs@stream-circuit>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z1hNxNkVSt11ncXs@stream-circuit>
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

On Tue, Dec 10, 2024 at 02:18:48PM +0000, Antonio Riccio wrote:
> Adhere to Linux kernel coding style.
> 
> Reported by checkpatch:
> 
> CHECK: Unnecessary parentheses around 'devcode != 0x0000'
> CHECK: Unnecessary parentheses around 'devcode != 0x9320'
> 
> Signed-off-by: Antonio Riccio <linux@ariccio.me>
> ---
>  drivers/staging/fbtft/fb_ili9320.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Checkpatch is wrong here, sorry.  Please see the archives for the
details as to why I don't take changes like this.

sorry,

greg k-h
