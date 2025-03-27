Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C6A6A73E0F
	for <lists+dri-devel@lfdr.de>; Thu, 27 Mar 2025 19:37:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7752410E937;
	Thu, 27 Mar 2025 18:37:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="nZGjku0h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2588410E13F;
 Thu, 27 Mar 2025 18:37:09 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id
 98e67ed59e1d1-301a6347494so301857a91.3; 
 Thu, 27 Mar 2025 11:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743100629; x=1743705429; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/JREactd+MR6uIyk15bAj7n2qQdSERCkAnE+wV8jYE4=;
 b=nZGjku0h7Mi7w/qWfQQXMWhtSyy3Is+fbjxyv/E8kRbTcq2lCY6Rs6Qrn7qprNdWl4
 4J3nRl/y4Mt0uFHfhQyfXsBT1EiDRQnESUnx7gmOO5MSCnZ4z2+4aCbvehjtWNy95pca
 kM76tgvl3SNho1f9WVD0AU/xei2PPSKkYnoYi2dOcwJtLmU9/DEnCxOkjQfAUVessc0p
 LoFWKw1zgHDOmw3P/Yn12A7fWRJ0r5zRi+P7NHNLn+0WnuyqX7+xB5Zao4WXhQNnACEM
 IfxJeN6dpblTiwoDELYkXWFBhzRjhWv7WSo4tAX6q9Wy4qLfmW5qCCbP3Nt+1Vg6BVtf
 HOSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743100629; x=1743705429;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/JREactd+MR6uIyk15bAj7n2qQdSERCkAnE+wV8jYE4=;
 b=PplSrLGjm6mo0SrFW1F25Vam/gLTDk6ptcHOwUrzfbLUnmnt5E+QJdfh+XhKItq3aQ
 iuj9t3ttN3EatoCkx566BJtC08bn5D9EZOPRtNnGnvLxMPLnws1B+8THWE9B/ikepWy1
 qLCHs6golOVCnXCqKvznfUITDdSShLvS46dYR/wtR/nva1VG+lqIzrq2t7mVlI7jaTuD
 C3XJarYT2CfQ5mEL3CdzL1zZPto4WX+eLEq9pmFtzjSJBSpjE9K/o8eou1vAMm40R8wG
 9QQ0zr5TMFwnjIUOeTSEIondUHsazMCBtOq0dIfl1ECPglt8TAYckcZIal1Wt9LuddVA
 Jf2w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVblCc/cpdZlcpMwj5kuLb22w/63M/U9FYULdrfzdwN3KTrx51YF4UGuXM2DlTJ9eU6WUi0dHClsuT8@lists.freedesktop.org,
 AJvYcCVvJhXh+WEQDgQo6iG0dYm+eErwz/b38pplOZnqZnVOCXGKouqQ3ACL1KxToaE+Zc70wnMS46ko@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw1aj6eccibc/fUEEvzbsZb+fi7xOcSmUZf4QIm7Kb/QHRJTOIm
 9/CNr9yxX0FVLlscLeImDKSXB2sWe54+ag0OebknBMD+rQOWcJ/GoJcZWN0ty/SrOX9dOUuJdKk
 qSGnWE45IuhltJC7EthdxcdzIGzI=
X-Gm-Gg: ASbGncsaMtdeIIp3v9boCFPrzUe/weJyj0iX5FXuBJaJmTxyGM6xhAOvhLRR6JGg1jE
 I0YsU6DUV4IFfZ0V0JCOjcvjwcvXQd4QEm6/bXoM5JNXKXS3Q/dHYuwggF1R8L/szDr1q48ho+F
 y8SUvRgrc1TGbEFFi4c5t4geBAGw==
X-Google-Smtp-Source: AGHT+IH7c05IJ5W/E9xxmJQsQPdfmivr+RUCxhCsCfa8LemId4Vp9O0cRT5dp0nui4Q2qTyhx/gmnMNOqoAD7O2RzL4=
X-Received: by 2002:a17:90b:3e8d:b0:2ff:5759:549a with SMTP id
 98e67ed59e1d1-303b2112a46mr2303459a91.1.1743100628593; Thu, 27 Mar 2025
 11:37:08 -0700 (PDT)
MIME-Version: 1.0
References: <20250213070837.2976-1-hanchunchao@inspur.com>
In-Reply-To: <20250213070837.2976-1-hanchunchao@inspur.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 27 Mar 2025 14:36:57 -0400
X-Gm-Features: AQ5f1JpbAw11CZFqXhvzASt06rySaccLlqPtNMKK5tEKU1zWvxVL9sPEAzCP3w4
Message-ID: <CADnq5_Mw_d5KnUAUMLgu01o5dBoAKGJtPzYFTLp-hSsz8RSWWA@mail.gmail.com>
Subject: Re: [PATCH] Documentation: Remove repeated word in docs
To: Charles Han <hanchunchao@inspur.com>
Cc: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com, 
 airlied@gmail.co, simona@ffwll.ch, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, corbet@lwn.net, 
 Rodrigo.Siqueira@amd.com, mario.limonciello@amd.com, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 13, 2025 at 2:08=E2=80=AFAM Charles Han <hanchunchao@inspur.com=
> wrote:
>
> Remove the repeated word "the" in docs.
>
> Signed-off-by: Charles Han <hanchunchao@inspur.com>

Applied.  Thanks!

Alex

> ---
>  Documentation/gpu/amdgpu/display/dc-debug.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/gpu/amdgpu/display/dc-debug.rst b/Documentatio=
n/gpu/amdgpu/display/dc-debug.rst
> index 013f63b271f3..605dca21f4ae 100644
> --- a/Documentation/gpu/amdgpu/display/dc-debug.rst
> +++ b/Documentation/gpu/amdgpu/display/dc-debug.rst
> @@ -154,7 +154,7 @@ of the display parameters, but the userspace might al=
so cause this issue. One
>  way to identify the source of the problem is to take a screenshot or mak=
e a
>  desktop video capture when the problem happens; after checking the
>  screenshot/video recording, if you don't see any of the artifacts, it me=
ans
> -that the issue is likely on the the driver side. If you can still see th=
e
> +that the issue is likely on the driver side. If you can still see the
>  problem in the data collected, it is an issue that probably happened dur=
ing
>  rendering, and the display code just got the framebuffer already corrupt=
ed.
>
> --
> 2.43.0
>
