Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 49A0318C71C
	for <lists+dri-devel@lfdr.de>; Fri, 20 Mar 2020 06:38:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC6376E102;
	Fri, 20 Mar 2020 05:38:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [63.128.21.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 081FC6E102
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Mar 2020 05:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584682700;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZEKOl37iHz0FSwXOzROJ3kG19xR7xu6X68GlLT/jja8=;
 b=UrrPYOiy/lUkaSWHOgDa3dGZrWO1UC9JKrRhOBcms7l67H7jZmkD9tzo2jIu0bGsUiCxls
 lyIOmWSKnqR1U4/btfdBJgZFuqNtE5MY3deHWJb5P8MaOGPdU4suyeidowJBx7bMFjV3Py
 Vw/RyYbyiRskALouq/wIH07/Yq+p4wg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-66-6xFPO9jgMlKuFY4syYesog-1; Fri, 20 Mar 2020 01:38:16 -0400
X-MC-Unique: 6xFPO9jgMlKuFY4syYesog-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DA7BD1857BE3;
 Fri, 20 Mar 2020 05:38:13 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-49.ams2.redhat.com
 [10.36.112.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E397D60BF1;
 Fri, 20 Mar 2020 05:38:12 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id D97E09DB3; Fri, 20 Mar 2020 06:38:11 +0100 (CET)
Date: Fri, 20 Mar 2020 06:38:11 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Emmanuel Vadot <manu@FreeBSD.org>
Subject: Re: [PATCH 2/2] drm/format_helper: Dual licence the header in GPL-2
 and MIT
Message-ID: <20200320053811.od7wsoebalw3fwxi@sirius.home.kraxel.org>
References: <20200320022114.2234-1-manu@FreeBSD.org>
 <20200320022114.2234-2-manu@FreeBSD.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200320022114.2234-2-manu@FreeBSD.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
Cc: tzimmermann@suse.de, airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, tglx@linutronix.de
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 20, 2020 at 03:21:14AM +0100, Emmanuel Vadot wrote:
> Source file was dual licenced but the header was omitted, fix that.
> Contributors for this file are:
> Noralf Tr=F8nnes <noralf@tronnes.org>
> Gerd Hoffmann <kraxel@redhat.com>
> Thomas Gleixner <tglx@linutronix.de>

Acked-by: Gerd Hoffmann <kraxel@redhat.com>

> Signed-off-by: Emmanuel Vadot <manu@FreeBSD.org>
> ---
>  include/drm/drm_format_helper.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> =

> diff --git a/include/drm/drm_format_helper.h b/include/drm/drm_format_hel=
per.h
> index ac220aa1a245..7c5d4ffb2af2 100644
> --- a/include/drm/drm_format_helper.h
> +++ b/include/drm/drm_format_helper.h
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/* SPDX-License-Identifier: GPL-2.0 or MIT */
>  /*
>   * Copyright (C) 2016 Noralf Tr=F8nnes
>   */
> -- =

> 2.25.1
> =


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
