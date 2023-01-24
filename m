Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4106967A597
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jan 2023 23:20:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5013F10E274;
	Tue, 24 Jan 2023 22:20:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A60B10E274
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jan 2023 22:20:44 +0000 (UTC)
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ms.lwn.net (Postfix) with ESMTPSA id 0C8B8739;
 Tue, 24 Jan 2023 22:20:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 0C8B8739
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
 t=1674598843; bh=BFuMfm2b/s+EbxALlbvXjniNZ5TTunbX1CSvm2qW0fE=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=UII91CncQrnQQvKvjNPN2T6N1IsKFU7gfAE0phP1+fT0Kc2PCtZ4J/EbxhvAxm+lG
 AZj3JWcd1BNvVdqPDA/IhBmMyxX6FtCirfHoecZGi5wEEvVpaDUKf+Ay1oy9+yAwCx
 La0kbOdLLOA7QqFGeZ65Gm2QqNFj3Ket3smHsnxEPYFtJpiWXuVqk/SZ0ilqMNFRlf
 JSgAvNYzdJrV4c6HimI4Ecx6B8FDIUPbWSbEWjxpOA+ZMlfTLw7pqa+gP85nWu5fgo
 kbWs+pz6s7fjqN/CdpixL4EotCX+rpBQQhYqO056+ECHw+gCAXJyZSzFch6Myw+2Va
 y8XulmEf1gG1A==
From: Jonathan Corbet <corbet@lwn.net>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>, ogabbay@kernel.org
Subject: Re: [PATCH] docs: accel: Fix debugfs path
In-Reply-To: <1674145568-31513-1-git-send-email-quic_jhugo@quicinc.com>
References: <1674145568-31513-1-git-send-email-quic_jhugo@quicinc.com>
Date: Tue, 24 Jan 2023 15:20:42 -0700
Message-ID: <87mt67fubp.fsf@meer.lwn.net>
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
Cc: Jeffrey Hugo <quic_jhugo@quicinc.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Jeffrey Hugo <quic_jhugo@quicinc.com> writes:

> The device specific directory in debugfs does not have "accel".  For
> example, the documentation says device 0 should have a debugfs entry as
> /sys/kernel/debug/accel/accel0/ but in reality the entry is
> /sys/kernel/debug/accel/0/
>
> Fix the documentation to match the implementation.
>
> Fixes: 8c5577a5ccc6 ("doc: add documentation for accel subsystem")
> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> ---
>  Documentation/accel/introduction.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/accel/introduction.rst b/Documentation/accel/introduction.rst
> index 6f31af1..11cade5 100644
> --- a/Documentation/accel/introduction.rst
> +++ b/Documentation/accel/introduction.rst
> @@ -69,7 +69,7 @@ The accelerator devices will be exposed to the user space with the dedicated
>  
>  - device char files - /dev/accel/accel*
>  - sysfs             - /sys/class/accel/accel*/
> -- debugfs           - /sys/kernel/debug/accel/accel*/
> +- debugfs           - /sys/kernel/debug/accel/*/
>  
Applied, thanks.

jon
