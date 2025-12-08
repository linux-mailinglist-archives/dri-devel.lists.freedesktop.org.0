Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 640AECAE64B
	for <lists+dri-devel@lfdr.de>; Tue, 09 Dec 2025 00:15:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0232E10E00C;
	Mon,  8 Dec 2025 23:15:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="SOKXW2YH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5458810E00C
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Dec 2025 23:15:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 2D1C260125;
 Mon,  8 Dec 2025 23:15:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31746C4CEF1;
 Mon,  8 Dec 2025 23:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1765235732;
 bh=7wPimXFr4kIGv8Gm+/60OrkpBD+ELS1Rj8YfOX+r+SE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SOKXW2YHBFWyEHDn2Faml8/avfQUjQro2a3uHilnM01e95CgxCM5rTEYRWsZRHTVI
 Mvirnwkh8q8x1k+X+ocebnnkQgPF+uQzjCUw3/3VQcQoS9faYbLxdtnEEoENIr2uue
 /y39KIjXbAenUfIfF/FIs+QbBAQcUV3jGozEie6M=
Date: Tue, 9 Dec 2025 08:15:29 +0900
From: Greg KH <gregkh@linuxfoundation.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: jirislaby@kernel.org, simona@ffwll.ch, airlied@gmail.com,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 0/2] vt: Remove kdb hooks
Message-ID: <2025120914-finance-venture-8d0c@gregkh>
References: <20251208102851.40894-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251208102851.40894-1-tzimmermann@suse.de>
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

On Mon, Dec 08, 2025 at 11:17:32AM +0100, Thomas Zimmermann wrote:
> Commit 7068d42048da ("fbcon: Remove fb_debug_enter/_leave from struct
> fb_ops") removed the only implementation of the kdb hooks in struct
> consw. Now clean up the callers in vt and the hooks themselves.
> 
> If accepted, this series would ideally go through DRM trees, so that
> it reaches upstream together with the fbcon rework in v6.20-rc1.

No objection from me, thanks for the cleanups!

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
