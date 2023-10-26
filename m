Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93B377D88F7
	for <lists+dri-devel@lfdr.de>; Thu, 26 Oct 2023 21:33:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5215E10E874;
	Thu, 26 Oct 2023 19:33:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc34.google.com (mail-oo1-xc34.google.com
 [IPv6:2607:f8b0:4864:20::c34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6739010E873;
 Thu, 26 Oct 2023 19:33:10 +0000 (UTC)
Received: by mail-oo1-xc34.google.com with SMTP id
 006d021491bc7-5820299b99cso1203488eaf.1; 
 Thu, 26 Oct 2023 12:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698348789; x=1698953589; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=m3tYu0y534lfJF23o8/PAcUCnweM8LqmZm342mV7KoA=;
 b=hcoToa5bzG6OAi/VVHYRffWig4fcxhUmhKx6cykrZyuscvHkNjwOzVc4pN6bCWu9MZ
 ff8QqgRvgudumEV308bnCcfU+xrDY46bOEGH7KMurGrMJVO7w+Q9FukRpGTWCc0mfzvo
 kjt6s6k9nCbVRaC7V/9CfjQ8bFh7wYjPZr98C8d8pWcL+tfqFfuZUfIA7f7nFeWZTL/P
 zAh+69TcNdkkUiHcB1WCYmRL7N7ic6LzVK3U+s00Z4hy2ilJcKutEXh6tuc+JnYrXkIb
 6E9nYvGtMuSLXmwEqNpw3ZoKho4Qu2nAGH4o3PAdaxhnqIholP3Er80HP74wq+FN9FYk
 olKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698348789; x=1698953589;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=m3tYu0y534lfJF23o8/PAcUCnweM8LqmZm342mV7KoA=;
 b=vPYg6kWoC5t77OSNvps5LwNpvlbTr9rtwj4ILrpcAsDST6nGcnD4/fx8WjFKOodq4D
 MNgQ0/OKHkAlHP5l+wGcKBhdKIaU1rg5JZw0Xq8Ax8qLuVK0B3K7iX5br5wkNARiPDDH
 r4iZ3Paswcu4sH3FMV1HNrEmxXy3Gbcsv3EEcUGk8U2ek0dDUixKJ1IlQoizcJ7TsE2P
 u0sW8iPPWZBoxuOF7AdCnFK7XpO9JDuMfaUjRcIAs4aKlYLp0IXFBJ5oetFRrJ3U3mGR
 HjBeUTpYOBdp01H4MKFWwTd0IXMg8PfK/r7ZN17QtEE8qEO5huo0J8u/k7OF/MTQU3Ql
 Bp/Q==
X-Gm-Message-State: AOJu0Yz5HtbpHRCWyzcQ1iz9UdpcQUAaXxew20I8em59Mf0KqaoSRsRh
 ARi4Qd/XTP+WOiCrJj58Gmqg+5n2iuSxvPTEApSpDVAI
X-Google-Smtp-Source: AGHT+IEHOLbV3ASDKHe3Bi9UFYL0AiJ0MvOgQYPre2QjyLwlXMUjx/7wEp8JdHcDPd7Q7XHhXKUYbtY4Kycnp0e60pU=
X-Received: by 2002:a05:6870:d8ce:b0:1e9:b4c3:546d with SMTP id
 of14-20020a056870d8ce00b001e9b4c3546dmr585227oac.10.1698348789592; Thu, 26
 Oct 2023 12:33:09 -0700 (PDT)
MIME-Version: 1.0
References: <20231026174438.18427-2-ltuikov89@gmail.com>
In-Reply-To: <20231026174438.18427-2-ltuikov89@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 26 Oct 2023 15:32:58 -0400
Message-ID: <CADnq5_MzjJCwKDaxqHR+7pGJQpPGn=Vzj8qRLMPmrJrgHPyVjQ@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Update the GPU Scheduler email
To: Luben Tuikov <ltuikov89@gmail.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 AMD Graphics <amd-gfx@lists.freedesktop.org>,
 Direct Rendering Infrastructure - Development
 <dri-devel@lists.freedesktop.org>, Alex Deucher <Alexander.Deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 26, 2023 at 1:45=E2=80=AFPM Luben Tuikov <ltuikov89@gmail.com> =
wrote:
>
> Update the GPU Scheduler maintainer email.
>
> Cc: Alex Deucher <Alexander.Deucher@amd.com>
> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Dave Airlie <airlied@gmail.com>
> Cc: AMD Graphics <amd-gfx@lists.freedesktop.org>
> Cc: Direct Rendering Infrastructure - Development <dri-devel@lists.freede=
sktop.org>
> Signed-off-by: Luben Tuikov <ltuikov89@gmail.com>

Acked-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 4452508bc1b040..f13e476ed8038b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7153,7 +7153,7 @@ F:        Documentation/devicetree/bindings/display=
/xlnx/
>  F:     drivers/gpu/drm/xlnx/
>
>  DRM GPU SCHEDULER
> -M:     Luben Tuikov <luben.tuikov@amd.com>
> +M:     Luben Tuikov <ltuikov89@gmail.com>
>  L:     dri-devel@lists.freedesktop.org
>  S:     Maintained
>  T:     git git://anongit.freedesktop.org/drm/drm-misc
>
> base-commit: 56e449603f0ac580700621a356d35d5716a62ce5
> --
> 2.42.0
>
