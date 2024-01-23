Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F80E839B60
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jan 2024 22:47:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8BC410E06A;
	Tue, 23 Jan 2024 21:47:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A86810E06A
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jan 2024 21:47:05 +0000 (UTC)
Received: from localhost (c-98-53-138-11.hsd1.co.comcast.net [98.53.138.11])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ms.lwn.net (Postfix) with ESMTPSA id C687B7A98;
 Tue, 23 Jan 2024 21:47:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net C687B7A98
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
 t=1706046425; bh=w+LofhryyfMqii4fffAUs4wgq9FbTCZWmkjoJRrCs/k=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=n7U0yFluAqO7w8iWvSEgD6cPSWvdZe7hvRF8pCyRIAs2WoKOVW3ljRGHLlBS1xam1
 4Mp6fJXsjD8g+/dGljngrdN6G6W9fMghWcQEaemUZG2fOEdQI/6IFFGLVnuu93hUkJ
 TSQZajUyFQV1tlfJ37TxEz2wxPLIey3W7fpQmkQZfGksXD8jq/9fY3/hPkb21AOEI9
 zx6fW9/qL0WeAhA8iuyn0TnZhaeQB/3ABLN1YcM7sFGbDf/MGewi9UmTmyiP0CXAsC
 Hichm0FXraUF6INi+r9Hk6lNYfI/bGkM12eZfbc7YrPgiL1WMJ6SvTqfIlH+KFFnIy
 J7QCDg2lDkO4Q==
From: Jonathan Corbet <corbet@lwn.net>
To: Vegard Nossum <vegard.nossum@oracle.com>
Subject: Re: [PATCH] doc: admin-guide/kernel-parameters: remove useless comment
In-Reply-To: <20240111085220.3693059-1-vegard.nossum@oracle.com>
References: <20240111085220.3693059-1-vegard.nossum@oracle.com>
Date: Tue, 23 Jan 2024 14:47:04 -0700
Message-ID: <87frynk9if.fsf@meer.lwn.net>
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
Cc: Vegard Nossum <vegard.nossum@oracle.com>, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Vegard Nossum <vegard.nossum@oracle.com> writes:

> This comment about DRM drivers has been there since the first git
> commit. It simply doesn't belong in kernel-parameters; remove it.
>
> Signed-off-by: Vegard Nossum <vegard.nossum@oracle.com>
> ---
>  Documentation/admin-guide/kernel-parameters.rst | 5 -----
>  1 file changed, 5 deletions(-)
>
> diff --git a/Documentation/admin-guide/kernel-parameters.rst b/Documentation/admin-guide/kernel-parameters.rst
> index 102937bc8443..4410384596a9 100644
> --- a/Documentation/admin-guide/kernel-parameters.rst
> +++ b/Documentation/admin-guide/kernel-parameters.rst
> @@ -218,8 +218,3 @@ bytes respectively. Such letter suffixes can also be entirely omitted:
>  
>  .. include:: kernel-parameters.txt
>     :literal:
> -
> -Todo
> -----
> -
> -	Add more DRM drivers.
> -- 

Applied, thanks.

jon
