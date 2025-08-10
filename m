Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F321EB1FA1C
	for <lists+dri-devel@lfdr.de>; Sun, 10 Aug 2025 15:23:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29E6910E038;
	Sun, 10 Aug 2025 13:23:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ql9uUJPV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C79B10E038
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Aug 2025 13:23:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 7581D5C47DC;
 Sun, 10 Aug 2025 13:23:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4795C4CEEB;
 Sun, 10 Aug 2025 13:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1754832194;
 bh=f4ZCGbsp9dW4/nJuX1ITskGOz3OSKVrV5h0qYspY0vQ=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=ql9uUJPVslclFCjeShevsloAkjL+4CtfehIpFz3EnnTp4kFmS3+4fjErzyOHhOyFB
 ASDhTmO0Cq9DkO8O915x/jab2SXZiJ+vvDnw2ve+F9c/Z6XlzI/dFQ253nMZR/v31S
 fTt6N9jjwhZNzYp9NTWKenTak0PnUZ7Al+/OeNAW7SgAK7mOPn1tcLlPsY2oGWW5jA
 lSdo92JMVxK7og8/xG5Vvf8ibAYs2mme7lIcoxQueApxGXC6TIDaBTFJiVbMvATp6x
 1RIQ5o5iv1hHPP/HQB3SxaBtLXH1EtQpSe3A1Tfm3Q4kYBEzcwcEs6lS0y3LjIoyl2
 KjipdItcdH06Q==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 10 Aug 2025 15:23:10 +0200
Message-Id: <DBYS3FAEVMHC.178SXO45NIBI8@kernel.org>
Subject: Re: [PATCH v2] drm: Add directive to format code in comment
Cc: <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <robin.clark@oss.qualcomm.com>, <antomani103@gmail.com>,
 <dmitry.baryshkov@oss.qualcomm.com>, <me@brighamcampbell.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
To: "Javier Garcia" <rampxxxx@gmail.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <qf6xwtxh57jg6ico7n53ft7bepogeal5wfhthodsnf55eabgum@de2ah47jovbg>
 <20250810112218.293272-1-rampxxxx@gmail.com>
In-Reply-To: <20250810112218.293272-1-rampxxxx@gmail.com>
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

Hi Javier,

On Sun Aug 10, 2025 at 1:22 PM CEST, Javier Garcia wrote:

Thanks for the patch.

> Fixes: 471920ce25d5 ("drm/gpuvm: Add locking helpers")

The Fixes: tag belongs at the end of the commit message, like all other tag=
s.

>   Warning: ./drivers/gpu/drm/drm_gpuvm.c:2444: Unexpected indentation.
>   Warning: ./drivers/gpu/drm/drm_gpuvm.c:2446: Block quote ends without a=
 blank line; unexpected unindent.
>   Warning: ./drivers/gpu/drm/drm_gpuvm.c:2450: Definition list ends witho=
ut a blank line; unexpected unindent.
>   Warning: ./drivers/gpu/drm/drm_gpuvm.c:2451: Definition list ends witho=
ut a blank line; unexpected unindent.
>   Warning: ./drivers/gpu/drm/drm_gpuvm.c:2455: Unexpected indentation.
>   Warning: ./drivers/gpu/drm/drm_gpuvm.c:2456: Definition list ends witho=
ut a blank line; unexpected unindent.
>   Warning: ./drivers/gpu/drm/drm_gpuvm.c:2457: Definition list ends witho=
ut a blank line; unexpected unindent.
>   Warning: ./drivers/gpu/drm/drm_gpuvm.c:2458: Definition list ends witho=
ut a blank line; unexpected unindent.

Even though it's rather obvious in this case, the commit message should con=
tain
the motivation of the patch and how it addresses the issue in imperative mo=
od,
see also [1].

[1] https://docs.kernel.org/process/submitting-patches.html#describe-your-c=
hanges

>
>
> Signed-off-by: Javier Garcia <rampxxxx@gmail.com>
> ---
> v1 -> v2:
>       * Added the proper Fixes tag.
>       * v1 https://lore.kernel.org/lkml/20250804212902.22554-1-rampxxxx@g=
mail.com
>
>  drivers/gpu/drm/drm_gpuvm.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
> index bbc7fecb6f4a..74d949995a72 100644
> --- a/drivers/gpu/drm/drm_gpuvm.c
> +++ b/drivers/gpu/drm/drm_gpuvm.c
> @@ -2432,6 +2432,8 @@ static const struct drm_gpuvm_ops lock_ops =3D {
>   *
>   * The expected usage is:
>   *
> + * .. code-block:: c
> + *
>   *    vm_bind {
>   *        struct drm_exec exec;
>   *
> --=20
> 2.50.1

