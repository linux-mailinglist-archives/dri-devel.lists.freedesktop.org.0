Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63B48217556
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jul 2020 19:38:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A92C89BFC;
	Tue,  7 Jul 2020 17:38:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79BA689BFC
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jul 2020 17:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594143491;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=x7uX/2xJiOA4qmcp2WABQJ3PremM3Y9CPLucBQCCmsY=;
 b=KNHAQ58f3CWh4gArlSKZmM4dOpXBzS28LJDGMGNA72Ictignbax3EYVH+op55A+wB2z7dd
 qfH2RynOpw1gsKBjN1v+ruPHzUCVFmD23RYkZdQ4eVjfqXElgtzj0w19yGYMN6yKmtahGQ
 +yS5fscDcL8NsLE3PnB5BMVcaEboj5M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-449-t6mdqrfMPYCKERtl5E85mA-1; Tue, 07 Jul 2020 13:38:07 -0400
X-MC-Unique: t6mdqrfMPYCKERtl5E85mA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 68A228014D7;
 Tue,  7 Jul 2020 17:38:06 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-200.ams2.redhat.com
 [10.36.112.200])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A3D9571684;
 Tue,  7 Jul 2020 17:38:05 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 97BEC31F09; Tue,  7 Jul 2020 19:38:04 +0200 (CEST)
Date: Tue, 7 Jul 2020 19:38:04 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: Re: Panic booting qemu-system-sparc64 with bochs_drm
Message-ID: <20200707173804.izlxgbltuamnbevo@sirius.home.kraxel.org>
References: <671ea432-7e2b-ab37-225e-fd32aef9a3e3@ilande.co.uk>
 <20200704072305.GA689588@ravnborg.org>
 <02fbd875-f6fd-da20-6835-778bdd6426c3@ilande.co.uk>
 <485ded46-c1a3-1eab-eb95-1a771543fbaf@ilande.co.uk>
 <20200704134115.GA755192@ravnborg.org>
 <1d19833f-2977-a12f-f3a9-ef0d509ef366@ilande.co.uk>
 <20200704145212.GA791554@ravnborg.org>
 <98897d2e-38bd-6fcf-ab81-3f5f56906fb8@ilande.co.uk>
 <20200707070341.wpxyrlkrtbhghtro@sirius.home.kraxel.org>
 <bd01d325-6580-c96f-5a05-fd296b49cf2b@ilande.co.uk>
MIME-Version: 1.0
In-Reply-To: <bd01d325-6580-c96f-5a05-fd296b49cf2b@ilande.co.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
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
Cc: Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> Thanks Gerd - I've just tested the diff below with memcpy_toio() and that works too:
> 
> diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
> index 5609e164805f..4d05b0ab1592 100644
> --- a/drivers/gpu/drm/drm_fb_helper.c
> +++ b/drivers/gpu/drm/drm_fb_helper.c
> @@ -399,7 +399,7 @@ static void drm_fb_helper_dirty_blit_real(struct drm_fb_helper
> *fb_helper,
>         unsigned int y;
> 
>         for (y = clip->y1; y < clip->y2; y++) {
> -               memcpy(dst, src, len);
> +               memcpy_toio(dst, src, len);
>                 src += fb->pitches[0];
>                 dst += fb->pitches[0];
>         }
> 
> Presumably there is some existing mechanism that ensures SPARC will always choose a
> shadow framebuffer?

bochs-drm always runs with a shadow framebuffer (that allows to swap
the real framebuffer into and out of vram as needed).  With other
drivers this is in the hands of the driver.  It might not be needed,
virtio-gpu for example uses normal ram as framebuffer storage.

take care,
  Gerd

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
