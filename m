Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12181119C12
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2019 23:18:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DADD36E9BA;
	Tue, 10 Dec 2019 22:18:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48F7C6E9B5;
 Tue, 10 Dec 2019 22:18:46 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id p9so4940504wmc.2;
 Tue, 10 Dec 2019 14:18:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/xeSJ1vVQGbd+lIc7YdzwAZ3r9lP4F35wcBj4c6Z8vM=;
 b=B1QR3m2HFzPOE0yEbMaZ1Sv5w1g+5+FM6cKF0BpNVupNgtuHvgoHSP7I3Ziag9IEx1
 nSVN5CjtjtmnmRmVAxT0qR1PQBTISWoP5nlGxR/74CBAwLEX4RLUCUSjKS0HZ6qS4ybG
 vew9E7FQWm5s6CIZnCYXKkrVaYcaYteviw9EajeSB26BxomxoMM0kJSvZugp8yj15Lu5
 fyuej3mOWV8JZDG8Evb4K2KwBo/i78gQ3qjzTw7OedgXfxux3nv7MBeG00X5+hIrC3uB
 SjgBDVMv5v15UTvH+HkbnSNLb1Dk+kJcuJdLPYH+SlRYf87GGIlcViMdZ3gRriu3pw9Q
 PxNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/xeSJ1vVQGbd+lIc7YdzwAZ3r9lP4F35wcBj4c6Z8vM=;
 b=C8ngjo2eIlkfo6Qlyma/liXH3/PWe2UNPGNSRLd9rPqxPNR5OL/+AHnpCS6n/vu6wx
 NjtA68w42HqLvgdbB1kRYkP92rBicBBdpj4R3GciFugYPwZUPv3fo+Z5i1Ad2cX4ghq6
 FxWD1Z2Y98G6LIWB4yPA4gGNrLwFZ4jJVABAeoyAfY64akXPAf88j+WIw+IcDKrY9V0N
 7assg8ou43xEPvd1YFaM0sSYWuQLsCuuoKdR1+pJQxcjGd2ZdEQl34euaQLTMVtKr+gI
 uvQZB97AKg4SEsKdh4AY6mbPq1fLKsTa+12dXRH8XkqSa7vaP7481w04Mgn2osjmrPcv
 4bwA==
X-Gm-Message-State: APjAAAVwErpOQac9eyFGQ+RiRUHMj0AuHSfGZNbGlEM5VnFvdxLRhmSv
 EoAwZUbt49F2mBaiMB9Ax+fincsgsZ1B9B3VzSo=
X-Google-Smtp-Source: APXvYqzLcz+L/kcYgFcxP6XewiOkpSfkoPwGQbtDouaQraSVktzlPiRm+eotTeS8npUt7k71bLFPIMThugyJTYeKi8M=
X-Received: by 2002:a1c:4454:: with SMTP id r81mr7591380wma.143.1576016324848; 
 Tue, 10 Dec 2019 14:18:44 -0800 (PST)
MIME-Version: 1.0
References: <20191210195941.931745-1-arnd@arndb.de>
In-Reply-To: <20191210195941.931745-1-arnd@arndb.de>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 10 Dec 2019 17:18:31 -0500
Message-ID: <CADnq5_Ou91nmzTc6mAugpbML4XqrYfSg0jcx7U9yb=X3LSmZiA@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: include linux/slab.h where needed
To: Arnd Bergmann <arnd@arndb.de>
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
Cc: Eric Yang <Eric.Yang2@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>, Roman Li <Roman.Li@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 Michael Strauss <michael.strauss@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Tue, Dec 10, 2019 at 2:59 PM Arnd Bergmann <arnd@arndb.de> wrote:
>
> Calling kzalloc() and related functions requires the
> linux/slab.h header to be included:
>
> drivers/gpu/drm/amd/amdgpu/../display/dc/dcn21/dcn21_resource.c: In function 'dcn21_ipp_create':
> drivers/gpu/drm/amd/amdgpu/../display/dc/dcn21/dcn21_resource.c:679:3: error: implicit declaration of function 'kzalloc'; did you mean 'd_alloc'? [-Werror=implicit-function-declaration]
>    kzalloc(sizeof(struct dcn10_ipp), GFP_KERNEL);
>
> A lot of other headers also miss a direct include in this file,
> but this is the only one that causes a problem for now.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c b/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c
> index 906c84e6b49b..af57885bbff2 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c
> @@ -23,6 +23,8 @@
>   *
>   */
>
> +#include <linux/slab.h>
> +
>  #include "dm_services.h"
>  #include "dc.h"
>
> --
> 2.20.0
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
