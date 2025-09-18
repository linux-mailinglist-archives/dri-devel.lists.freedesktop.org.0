Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F648B860F9
	for <lists+dri-devel@lfdr.de>; Thu, 18 Sep 2025 18:37:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 564B910E078;
	Thu, 18 Sep 2025 16:37:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lwn.net header.i=@lwn.net header.b="UZe0w0rR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DD2310E078
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Sep 2025 16:37:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 9B9A7406FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
 t=1758213452; bh=L9szdGSNdMCYHon3m7+1Z2PiMa4HJ7fzR+DoUw4hOfo=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=UZe0w0rR//C5WKDhbukAj2qlgSg/rU56cO6rvaiGFwP/uT4FFlW8UIVV/9YBsuYrg
 5qk5dKpWfcpfSP3CTQ7q7r/mVnt508nGlFlPTnXeeft3vcXX18CRLsofzDHkdyIQ2m
 OywnBGNUlK776a614F3K35+7kyV2Ly/D69LgMOUMiEzPnUNjgOfCa443W93Tkhv9zf
 5I5xDIbRmZPhDefm3NJNGyGtOkOJJkG/fN8sdUyj5RzMYWanwS3lh5COBrg+QW0s7D
 b39J0Bp/AEwKCzKst8Hw1fstBf/fYJ1kanIsvCTr18qmXs3liZPQbDjYns8VrC8vbr
 Gr24tuugLYGXA==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by ms.lwn.net (Postfix) with ESMTPSA id 9B9A7406FA;
 Thu, 18 Sep 2025 16:37:32 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Bagas Sanjaya <bagasdotme@gmail.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Documentation
 <linux-doc@vger.kernel.org>, Linux Framebuffer
 <linux-fbdev@vger.kernel.org>, Linux DRI Development
 <dri-devel@lists.freedesktop.org>
Cc: Helge Deller <deller@gmx.de>, Bagas Sanjaya <bagasdotme@gmail.com>
Subject: Re: [PATCH 0/3] Documentation: fbcon: formatting cleanup and
 improvements
In-Reply-To: <20250909063744.30053-1-bagasdotme@gmail.com>
References: <20250909063744.30053-1-bagasdotme@gmail.com>
Date: Thu, 18 Sep 2025 10:37:31 -0600
Message-ID: <875xdf90ok.fsf@trenco.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
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

Bagas Sanjaya <bagasdotme@gmail.com> writes:

> Hi,
>
> Here are reST formatting cleanup and improvements for fbcon documentation.
> The shortlog below should be self-explanatory.
>
> This series is based on docs-next tree.
>
> Enjoy!
>
> Bagas Sanjaya (3):
>   Documentation: fbcon: Add boot options and attach/detach/unload
>     section headings
>   Documentation: fbcon: Reindent 8th step of attach/detach/unload
>   Documentation: fbcon: Use admonition directives
>
>  Documentation/fb/fbcon.rst | 42 ++++++++++++++++++++++----------------
>  1 file changed, 24 insertions(+), 18 deletions(-)

It looks like nobody has picked these up yet, so I've applied them.

Thanks,

jon
