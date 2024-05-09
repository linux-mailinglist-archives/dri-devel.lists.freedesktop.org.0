Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BCE48C1338
	for <lists+dri-devel@lfdr.de>; Thu,  9 May 2024 18:48:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23EBB10E108;
	Thu,  9 May 2024 16:48:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lwn.net header.i=@lwn.net header.b="IhnoF1G3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFC5110E062;
 Thu,  9 May 2024 16:48:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 8EC1647C39
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
 t=1715273286; bh=3qFwjzw8Vw1OvsBGlcfK09vFEBAUZplKcKp8nfsKqto=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=IhnoF1G3IdGk/iRQpZeEEkmumlwkGNvlLtO+iLFf3hoa1dJeJkfNaGcLsrwDXhiQK
 IzZ6Zi2kGNxPjVur1GEQZ66yUX2mNQ455AmvJIaFHzndC3i7+dpCrBia2hoImT9x9Y
 FNsbSsmRDNrosuTPSxUsN9CoaRLw77uqv4mUHeXNNK1kB5/AKpln+jnBSJH8O/tkHn
 nWm4vYRiuVkE2mOQaG75amaRFrd0dadaM4GGwOkCYMzSHW77PN0/L32sf0USMaOp/z
 tqXqIsmN25QlME069Pd0UNXoAdH0of3wGRYO1kzF8NbCxjs0uHM6EX7OB0V3fzTyNG
 6zC6BGxZwtM0w==
Received: from localhost (mdns.lwn.net [45.79.72.68])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by ms.lwn.net (Postfix) with ESMTPSA id 8EC1647C39;
 Thu,  9 May 2024 16:48:06 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry
 Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Subject: Re: [PATCH] docs: document python version used for compilation
In-Reply-To: <20240509-python-version-v1-1-a7dda3a95b5f@linaro.org>
References: <20240509-python-version-v1-1-a7dda3a95b5f@linaro.org>
Date: Thu, 09 May 2024 10:48:05 -0600
Message-ID: <87o79faq4a.fsf@meer.lwn.net>
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

Dmitry Baryshkov <dmitry.baryshkov@linaro.org> writes:

> The drm/msm driver had adopted using Python3 script to generate register
> header files instead of shipping pre-generated header files. Document
> the minimal Python version supported by the script.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  Documentation/process/changes.rst | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/process/changes.rst b/Documentation/process/changes.rst
> index 5685d7bfe4d0..8d225a9f65a2 100644
> --- a/Documentation/process/changes.rst
> +++ b/Documentation/process/changes.rst
> @@ -63,6 +63,7 @@ cpio                   any              cpio --version
>  GNU tar                1.28             tar --version
>  gtags (optional)       6.6.5            gtags --version
>  mkimage (optional)     2017.01          mkimage --version
> +Python (optional)      3.5.x            python3 --version
>  ====================== ===============  ========================================

Is it really optional - can you build the driver without it?

This document needs some help... I'm missing a number of things that are
*not* marked as "optional" (jfsutils, reiserfsprogs, pcmciautils, ppp,
...) and somehow my system works fine :)  It would be nice to document
*why* users might need a specific tool.

But I guess we aren't going to do that now.  I can apply this, but I do
wonder about the "optional" marking.

Thanks,

jon
