Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8B4F68380D
	for <lists+dri-devel@lfdr.de>; Tue, 31 Jan 2023 21:56:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87E4A10E2AF;
	Tue, 31 Jan 2023 20:56:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 096B010E2AF
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Jan 2023 20:56:22 +0000 (UTC)
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ms.lwn.net (Postfix) with ESMTPSA id AB4FA9A9;
 Tue, 31 Jan 2023 20:56:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net AB4FA9A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
 t=1675198579; bh=aWzCX33m88aYoj7KZCtLvfYpIBzCY+C52NkejpJv89M=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=VH+i9EX2Fr6aDsotl1qllAdq4WfSYDHY40P8EZYW0TdRNiTqccLx2SdCGZw44FgU6
 cxkgLXibXvWRZmaB/n7MbDCZQCZcmNk7sODQ8K9gd9YyFQDx3hwaCqXVqYc9nR/Sj7
 YOK7OUb4EEJPAHaejgVsIn8RShTl/fG+n7VBfHoxspotB716HIfZGUz21VNFJ9dkDm
 k5484AaFD+PBL/IbVUMetWdp/M9Q87uZko8kR4dRvcSKbE/YBaquqYGkTkJsDrQANJ
 uh1rGotUYBDrDjCKudiOWLTxaEtU8JsAS0nW37wlBfkVVJadF3LeZUFliKHk71uSCb
 v5736P22cEZHg==
From: Jonathan Corbet <corbet@lwn.net>
To: Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 linux-doc@vger.kernel.org
Subject: Re: [PATCH] dma-buf: Add "dma-buf" to title of documentation
In-Reply-To: <20230129115917.1229529-1-j.neuschaefer@gmx.net>
References: <20230129115917.1229529-1-j.neuschaefer@gmx.net>
Date: Tue, 31 Jan 2023 13:56:18 -0700
Message-ID: <87leli2zkd.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: linux-kernel@vger.kernel.org,
 Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 dri-devel@lists.freedesktop.org, Sumit Semwal <sumit.semwal@linaro.org>,
 linaro-mm-sig@lists.linaro.org,
 Christian =?utf-8?Q?K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net> writes:

> To make it easier to find the dma-buf documentation when looking through
> tables-of-contents etc., put the name "dma-buf" in the title.
>
> Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
> ---
>  Documentation/driver-api/dma-buf.rst | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/driver-api/dma-buf.rst b/Documentation/driver-=
api/dma-buf.rst
> index 622b8156d2127..61b6f42ed0f18 100644
> --- a/Documentation/driver-api/dma-buf.rst
> +++ b/Documentation/driver-api/dma-buf.rst
> @@ -1,5 +1,5 @@
> -Buffer Sharing and Synchronization
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +Buffer Sharing and Synchronization (dma-buf)
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Applied, thanks.

jon
