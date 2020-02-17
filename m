Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D1FF8160CA0
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2020 09:13:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 114F76E517;
	Mon, 17 Feb 2020 08:13:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9C1F6E517
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2020 08:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581927208;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vacLSAglKCYHubbBh7xR6hS6YnzloO60LNhYv/4yKQM=;
 b=RnYB+lAnUU92QEEnlypoY5F4YaGDx0C3y5YA2Q8KcG6nTA6tdQUw59VdhTuWLEHcqh5chx
 IKQZVpoKhT/nW2mDb+2bz1HE0JktFSIDt+zQTdASo+se9IU6msK26hyFXfVTEhDV8MkRQi
 gVHspkDJqzgiQurH+GX0kkn6t/3rI4k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-250-ybn7gDDcO2SLY2d95luYNg-1; Mon, 17 Feb 2020 03:13:23 -0500
X-MC-Unique: ybn7gDDcO2SLY2d95luYNg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A5132800D5A;
 Mon, 17 Feb 2020 08:13:20 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-117-39.ams2.redhat.com
 [10.36.117.39])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 32E01196AE;
 Mon, 17 Feb 2020 08:13:18 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 80FF416E16; Mon, 17 Feb 2020 09:13:16 +0100 (CET)
Date: Mon, 17 Feb 2020 09:13:16 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Emmanuel Vadot <manu@FreeBSD.org>
Subject: Re: [PATCH v2 2/2] drm/format_helper: Dual licence the file in GPL 2
 and MIT
Message-ID: <20200217081316.6ndtpdki7yu4uila@sirius.home.kraxel.org>
References: <20200215180911.18299-1-manu@FreeBSD.org>
 <20200215180911.18299-3-manu@FreeBSD.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200215180911.18299-3-manu@FreeBSD.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
Cc: tzimmermann@suse.de, airlied@linux.ie, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, efremov@linux.com, jani.nikula@intel.com,
 sam@ravnborg.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Feb 15, 2020 at 07:09:11PM +0100, Emmanuel Vadot wrote:
> From: Emmanuel Vadot <manu@FreeBSD.Org>
> =

> Contributors for this file are :
> Gerd Hoffmann <kraxel@redhat.com>
> Maxime Ripard <mripard@kernel.org>
> Noralf Tr=F8nnes <noralf@tronnes.org>
> =

> Signed-off-by: Emmanuel Vadot <manu@FreeBSD.org>
> ---
>  drivers/gpu/drm/drm_format_helper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> =

> diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/drm_fo=
rmat_helper.c
> index 0897cb9aeaff..3b818f2b2392 100644
> --- a/drivers/gpu/drm/drm_format_helper.c
> +++ b/drivers/gpu/drm/drm_format_helper.c
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> +// SPDX-License-Identifier: GPL-2.0 or MIT
>  /*
>   * Copyright (C) 2016 Noralf Tr=F8nnes
>   *

Acked-by: Gerd Hoffmann <kraxel@redhat.com>

> -- =

> 2.25.0
> =


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
