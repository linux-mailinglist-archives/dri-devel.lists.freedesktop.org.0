Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 284B2176265
	for <lists+dri-devel@lfdr.de>; Mon,  2 Mar 2020 19:22:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E1306E7D2;
	Mon,  2 Mar 2020 18:21:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa41.google.com (mail-vk1-xa41.google.com
 [IPv6:2607:f8b0:4864:20::a41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77E006E7D1;
 Mon,  2 Mar 2020 18:21:55 +0000 (UTC)
Received: by mail-vk1-xa41.google.com with SMTP id y125so93876vkc.3;
 Mon, 02 Mar 2020 10:21:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vB551lFtDMlHqjodn5eUwgwaDDD4KH3zOGx/gVOGt6Q=;
 b=erpGno8PGW9XCkvSi90ick/7ZEfa/NdjePX0vFWIPwxKCzR2AweKocsISd0jtAzF1t
 EbIBh7RwVnoUcLZ7gJEmwBfW78r2KLhCDGDfAsYk+bW8e4/H782h9xK6y99OZrGlFg2z
 5iOVPiJdso+Tb13tF3FV/fAqpwjPdv5BCL0iuJZO6ZBCNP0bkx+Q4P8H/Tv4qlTMeoHQ
 M2rVzA9+u0uX0ruVZiuzBwIU5ibZziBCwoy6Zh1ZwhqBe8y8GbOlNOHwsbKoRZqXqOy8
 keieJop0H9LmJEhheCTIGsfdhnzIEqYbAS9O/LLOg1IM/a4bBe0x2i7oIzoUiBTk77Wi
 Cv3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vB551lFtDMlHqjodn5eUwgwaDDD4KH3zOGx/gVOGt6Q=;
 b=r2HxmYLvBJwKxMUKAZnyZ33e2TxwbY8g+piq4nPhMkza4kSv+biVQfQHYPbmu8BAuz
 NpneNRHmJplfpzbu4hTiU4pLDEWpnNwBh3LO+KsQZFyYEq7a4o0ULRdPAaF4+5kOibAx
 WfEA3mkhqoRU/c0ROfoX1IVw02sU7XM2ow9zRCN1D5KRIWxkedgBJbm9LpKXXex0CKQt
 L1HsicuNvgEO5EbyS2C2BF2Zc4+G0DLUNBjbC/Lu0vTqVpQ8MrceuqUFLypBxaF49TCu
 6IG8+ZCXFOQe/PJLUfW6JRSmTCq5HOJT+/ov++pJU8ZV02TkQAoLTzACFhQjpijRG6NX
 ZwtA==
X-Gm-Message-State: ANhLgQ1G7egrxHAZxjBfL3vdvFzucpKIm+d1gRpNoNfObTSwxEJ73mbb
 fF6+4HpWjnT8DxPQIzCZvz/48eLMSEp2L7ht5po=
X-Google-Smtp-Source: ADFU+vtaMYgZak2yUIEQowjg8bcCCtFODIoCgMjqjbpkeElHh+vcJ/ypYfrp6IosFFo4wQidKoLSjy67K7Y6bM0sOKE=
X-Received: by 2002:a1f:9d16:: with SMTP id g22mr636659vke.22.1583173314490;
 Mon, 02 Mar 2020 10:21:54 -0800 (PST)
MIME-Version: 1.0
References: <20200302162151.52349-1-pankaj.laxminarayan.bharadiya@intel.com>
In-Reply-To: <20200302162151.52349-1-pankaj.laxminarayan.bharadiya@intel.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Mon, 2 Mar 2020 18:21:23 +0000
Message-ID: <CACvgo50_0ZE3dxbwwv2g6937F3mA15thM_qXv=BBVodYy=mbxg@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH v2 0/7] drm: drm_fb_helper cleanup.
To: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
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
Cc: ML dri-devel <dri-devel@lists.freedesktop.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Pankaj,

On Mon, 2 Mar 2020 at 16:33, Pankaj Bharadiya
<pankaj.laxminarayan.bharadiya@intel.com> wrote:
>
> This series addresses below drm_fb_helper tasks from
> Documentation/gpu/todo.rst.
>
> - The max connector argument for drm_fb_helper_init() isn't used
>   anymore and can be removed.
>
> - The helper doesn't keep an array of connectors anymore so these can
>   be removed: drm_fb_helper_single_add_all_connectors(),
>   drm_fb_helper_add_one_connector() and
>   drm_fb_helper_remove_one_connector().
>
> Changes since v1:
>    - Squashed warning fixes into the patch that introduced the
>      warnings (into 5/7) (Laurent)
>    - Fixed reflow in in 9/9 (Laurent)
>
For the future, include the changelog in the respective patches. This
makes it easier for reviewers...
Plus you're already changing the commit - might as well mention what/why :-)

Also do include the R-B, Acked-by, other tags accumulated up-to that
point, when sending new revision.


That said, if you're interested in further cleaning this up, one can
cleanup the drm_dp_mst_topology_cbs hooks.
In particular ::register_connector is identical across the board -
create a helper function using it directly in core, killing the hook.

While for ::destroy_connector - there's some amdgpu specific code in
there... which I'm not sure if it should stay or not.
To be on the save side - create a helper which will be called for
drivers where the hook is !=NULL (aka everyone but amdgpu).

HTH
Emil
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
