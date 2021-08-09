Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C9C1D3E4C19
	for <lists+dri-devel@lfdr.de>; Mon,  9 Aug 2021 20:27:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C18668924F;
	Mon,  9 Aug 2021 18:27:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [IPv6:2607:f8b0:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82AD78924F;
 Mon,  9 Aug 2021 18:27:52 +0000 (UTC)
Received: by mail-oi1-x232.google.com with SMTP id o20so24824355oiw.12;
 Mon, 09 Aug 2021 11:27:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=4mNkfoQ58OXkFxY5lXT0JLBnZKMBlmPjenNWxHTzG5U=;
 b=HDi1+VGiQq4I0uS40zFvgbSs8RSxYe0sbWq3bJu/Bh/F5NZONXb8z9Wo2hupnakHQv
 A4Tct8GU+hqFrZD3cR9w+n/3P8+nk9a9imS4Uq4XlePYvIckSXTs9eZ2+zHtMcqy3sQA
 cpIGgkvpw8Y5C6el2nlFYfCHpg/v4OE97spIvpsgKawGEp49hGU3fzApUTbdUHCkP5Qw
 5DKUf47+LEbRqLCFcF5Gwi6KJvdDXCPrVTreYbedsJ1xmDgFidKujl/SoLGp08gDYpql
 sWaH+3gWW1XVj6QJloLbVWkKS91lpuaZk0OLQ98yNCTp+B3EFEdU/iFQ8sWjdkLbC+4U
 zgzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=4mNkfoQ58OXkFxY5lXT0JLBnZKMBlmPjenNWxHTzG5U=;
 b=OkSqortaHGIfAB8w7XX0Qma5KIZ6l1a1vGqOcFvJiwpMtPWDVxWfehZJfdakTNlzLP
 U+KQWKzQGL0TAgtgGjEexCiz92WcZZqml3orHHwI7S2oY+sRfeuuORrA+smmLwQng9Kj
 Ua3LSuw0FNiZoBj4miPiTFOIFAxez688BeLkWoR3kf9UPg1gI0GNkCaXzwRMhK9qU9GZ
 cXggYXflJeVNBCI+a0l+Rw4Pqxd6XgaSBDCE/Bn58dtEc8KHiPrqQFrouHfbYgltWgZB
 ZGm5Ltw/AIcEDfBDNuhQi8uEtJJsT++9D0DTh4Z6FPFap0Rm4io7cODYTMLA+nK1tXe4
 gxNA==
X-Gm-Message-State: AOAM5308a0JxRmLVJuN+R/ag9oKhwUaqW3TYtZDAViV64R5/SUERsz3W
 rysY4MbpjczvlUAg/tA7MwEimqoWCsXpfJyq0ig=
X-Google-Smtp-Source: ABdhPJw73VZa3ndUg9SSCAZTIxbMDiQHT+SywD30VuGs1/DnYxFu+7itTeGa/riMDHRl1ljZqNkD9Oo3pA/WtNcYnDo=
X-Received: by 2002:a05:6808:1390:: with SMTP id
 c16mr16992375oiw.123.1628533671832; 
 Mon, 09 Aug 2021 11:27:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210809025208.10182-1-rdunlap@infradead.org>
In-Reply-To: <20210809025208.10182-1-rdunlap@infradead.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 9 Aug 2021 14:27:40 -0400
Message-ID: <CADnq5_OrWJSLNMJwZ8jY-RPTZRLHhxhOcoaxE5HFdu3qKfyqBw@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: use do-while-0 for
 DC_TRACE_LEVEL_MESSAGE()
To: Randy Dunlap <rdunlap@infradead.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Wyatt Wood <wyatt.wood@amd.com>, 
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, Harry Wentland <harry.wentland@amd.com>,
 Leo Li <sunpeng.li@amd.com>, 
 amd-gfx list <amd-gfx@lists.freedesktop.org>, 
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
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

On Sun, Aug 8, 2021 at 10:52 PM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> Building with W=3D1 complains about an empty 'else' statement, so use the
> usual do-nothing-while-0 loop to quieten this warning.
>
> ../drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dmub_psr.c:113:53: warnin=
g: suggest braces around empty body in an 'else' statement [-Wempty-body]
>   113 |                                 *state, retry_count);
>
> Fixes: b30eda8d416c ("drm/amd/display: Add ETW log to dmub_psr_get_state"=
)
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Wyatt Wood <wyatt.wood@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Leo Li <sunpeng.li@amd.com>
> Cc: amd-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>

Applied.  Thanks!

Alex

> ---
>  drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> --- linux-next-20210806.orig/drivers/gpu/drm/amd/display/dc/dce/dmub_psr.=
c
> +++ linux-next-20210806/drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c
> @@ -29,7 +29,7 @@
>  #include "dmub/dmub_srv.h"
>  #include "core_types.h"
>
> -#define DC_TRACE_LEVEL_MESSAGE(...) /* do nothing */
> +#define DC_TRACE_LEVEL_MESSAGE(...)    do {} while (0) /* do nothing */
>
>  #define MAX_PIPES 6
>
