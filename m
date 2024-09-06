Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE93896FBBD
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2024 21:02:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A55910EAE4;
	Fri,  6 Sep 2024 19:01:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lwn.net header.i=@lwn.net header.b="Nk3e5N3H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1473110EAE4
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Sep 2024 19:01:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 69A2142B32
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
 t=1725649316; bh=XJsz4WENGfSRSt3I6YJl8iWcScYb0NwDimb1QPg0fFw=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=Nk3e5N3Hbf9quV9UlHJ0LR+iyxuYKD6U7HMmZ0QDSI2wb06xxNXRZzwk2to7hPVp3
 W6nTfI0AqqQc7rLQOrIXkSc55fZ+IJSFO/3AJILYm6qwQtnChcHGSoaY4nRzezl18v
 aEMoPY/QZr/BMKk0hDED2GzhxWq761YoYEDSb4MLOIFQezuko1q5S4sagoJJA+iWYr
 N2PgxzbJ5cOS+iPGSOlBgaLJh7B2hmdVaurfcsr8/WU7Ddpjk3RhoW5UCT/2Ezvi0+
 tunYc/UZwBcDoeG2potIo/nn3VhjVRx0zd6rVby6oeNdert7A0D+KxJCtVhJRmetKI
 efGNEL+/xIs8w==
Received: from localhost (c-24-9-249-71.hsd1.co.comcast.net [24.9.249.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by ms.lwn.net (Postfix) with ESMTPSA id 69A2142B32;
 Fri,  6 Sep 2024 19:01:56 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Andrew Kreimer <algonell@gmail.com>, Jeffrey Hugo
 <quic_jhugo@quicinc.com>, Carl Vanderlip <quic_carlv@quicinc.com>, Pranjal
 Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>, Oded Gabbay
 <ogabbay@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org, Andrew Kreimer <algonell@gmail.com>
Subject: Re: [PATCH] accel/qaic: Fix a typo
In-Reply-To: <20240906080136.4423-1-algonell@gmail.com>
References: <20240906080136.4423-1-algonell@gmail.com>
Date: Fri, 06 Sep 2024 13:01:55 -0600
Message-ID: <87zfokd2sc.fsf@trenco.lwn.net>
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

Andrew Kreimer <algonell@gmail.com> writes:

> Fix a typo in documentation.
>
> Signed-off-by: Andrew Kreimer <algonell@gmail.com>
> ---
>  Documentation/accel/qaic/qaic.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/accel/qaic/qaic.rst b/Documentation/accel/qaic/qaic.rst
> index efb7771273bb..628bf2f7a416 100644
> --- a/Documentation/accel/qaic/qaic.rst
> +++ b/Documentation/accel/qaic/qaic.rst
> @@ -93,7 +93,7 @@ commands (does not impact QAIC).
>  uAPI
>  ====
>  
> -QAIC creates an accel device per phsyical PCIe device. This accel device exists
> +QAIC creates an accel device per physical PCIe device. This accel device exists
>  for as long as the PCIe device is known to Linux.

Applied, thanks.

jon
