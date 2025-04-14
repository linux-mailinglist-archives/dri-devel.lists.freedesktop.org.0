Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 348B3A8866B
	for <lists+dri-devel@lfdr.de>; Mon, 14 Apr 2025 17:08:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EE7F10E605;
	Mon, 14 Apr 2025 15:08:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=rosenzweig.io header.i=@rosenzweig.io header.b="mkZodFU4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-180.mta0.migadu.com (out-180.mta0.migadu.com
 [91.218.175.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAEDC10E605
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Apr 2025 15:08:19 +0000 (UTC)
Date: Mon, 14 Apr 2025 11:08:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
 s=key1; t=1744643297;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3/fGSQF8X4Yx4QtdO/Fiac3nc1UqHnECCOYIQJlj5Bs=;
 b=mkZodFU4E/w9hCrtxjyDOtUSb2/t9Zx8pJoFWEU/pr4XMRUftwmym2S6KeSyaPISojoaav
 ubDcpb63lkYDrhN/z1VUWHJTItJE9mtKFiCfnhhdbEhabPz//dgggvkMOCDI8/jx/Pvsr/
 gmk80UvJ+AVzOHXUZww8iPoI+88O5yyJhd8kb3/cf7n9nLslH7826YCnywrHToyd+gRuyk
 /gRYKIqKFZq338KrrCtgWAAEZ3sC92F5WZ2WfS6OIKM9mqvplRJuIiSp2mLk+IR53vphnl
 pLBR1phxJY61Kcl8aKGic8hJxtw1af43eFP6AhryXctM5P5OxSSh7sk1jcobWw==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
To: Danilo Krummrich <dakr@kernel.org>
Cc: airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, lyude@redhat.com,
 lina@asahilina.net, daniel.almeida@collabora.com, j@jannau.net,
 ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com,
 gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
 a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2 8/8] MAINTAINERS: add DRM Rust source files to DRM
 DRIVERS
Message-ID: <Z_0k25z6XZDNKzQC@blossom>
References: <20250410235546.43736-1-dakr@kernel.org>
 <20250410235546.43736-9-dakr@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250410235546.43736-9-dakr@kernel.org>
X-Migadu-Flow: FLOW_OUT
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

Reviewed-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>

Le Fri , Apr 11, 2025 at 01:55:27AM +0200, Danilo Krummrich a écrit :
> Add the DRM Rust source files to the DRM DRIVERS maintainers entry.
> 
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> ---
>  MAINTAINERS | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 96b827049501..a975fa8d262f 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7798,6 +7798,7 @@ F:	Documentation/devicetree/bindings/display/
>  F:	Documentation/devicetree/bindings/gpu/
>  F:	Documentation/gpu/
>  F:	drivers/gpu/
> +F:	rust/kernel/drm/
>  F:	include/drm/
>  F:	include/linux/vga*
>  F:	include/uapi/drm/
> @@ -7814,6 +7815,7 @@ F:	Documentation/devicetree/bindings/gpu/
>  F:	Documentation/gpu/
>  F:	drivers/gpu/drm/
>  F:	drivers/gpu/vga/
> +F:	rust/kernel/drm/
>  F:	include/drm/drm
>  F:	include/linux/vga*
>  F:	include/uapi/drm/
> -- 
> 2.49.0
> 
