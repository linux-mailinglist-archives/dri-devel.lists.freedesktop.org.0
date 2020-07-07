Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB9152166FD
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jul 2020 09:03:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDA706E218;
	Tue,  7 Jul 2020 07:03:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C61DF6E218
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jul 2020 07:03:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594105427;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pBct573chDUVycC2r47Dhb1fPGGMGariRGswer8qzzg=;
 b=bqJWozIny2Anx5Yh2ssZ0BoweH5KNM6gtbcCnp9tERk3/LvMQf4IW1EdOD3fs41TDU6wid
 20VCS+Blbm4WaJmMr2OyC5pJLg1RZGcz3I+fReRgZCEG5/Jsg+tBc9Ci6EPskLVVI6vfzI
 1tqZsKSxqJf4aPgYohsyozIo0K7gkRc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-145-gJCiovz9NomAeJ9Wl9EF8A-1; Tue, 07 Jul 2020 03:03:45 -0400
X-MC-Unique: gJCiovz9NomAeJ9Wl9EF8A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2A3CD107B7C6;
 Tue,  7 Jul 2020 07:03:44 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-200.ams2.redhat.com
 [10.36.112.200])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A6F7560CC0;
 Tue,  7 Jul 2020 07:03:42 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id A21059D71; Tue,  7 Jul 2020 09:03:41 +0200 (CEST)
Date: Tue, 7 Jul 2020 09:03:41 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: Re: Panic booting qemu-system-sparc64 with bochs_drm
Message-ID: <20200707070341.wpxyrlkrtbhghtro@sirius.home.kraxel.org>
References: <671ea432-7e2b-ab37-225e-fd32aef9a3e3@ilande.co.uk>
 <20200704072305.GA689588@ravnborg.org>
 <02fbd875-f6fd-da20-6835-778bdd6426c3@ilande.co.uk>
 <485ded46-c1a3-1eab-eb95-1a771543fbaf@ilande.co.uk>
 <20200704134115.GA755192@ravnborg.org>
 <1d19833f-2977-a12f-f3a9-ef0d509ef366@ilande.co.uk>
 <20200704145212.GA791554@ravnborg.org>
 <98897d2e-38bd-6fcf-ab81-3f5f56906fb8@ilande.co.uk>
MIME-Version: 1.0
In-Reply-To: <98897d2e-38bd-6fcf-ab81-3f5f56906fb8@ilande.co.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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

> Yes, that's correct - I can confirm that the simplified diff below works:
> 
> diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
> index 5609e164805f..83af05fac604 100644
> --- a/drivers/gpu/drm/drm_fb_helper.c
> +++ b/drivers/gpu/drm/drm_fb_helper.c
> @@ -399,7 +399,7 @@ static void drm_fb_helper_dirty_blit_real(struct drm_fb_helper
> *fb_helper,
>         unsigned int y;
> 
>         for (y = clip->y1; y < clip->y2; y++) {
> -               memcpy(dst, src, len);
> +               fb_memcpy_tofb(dst, src, len);

fb_memcpy_tofb is #defined to sbus_memcpy_toio @ sparc which looks
wrong to me given that this is a pci not a sbus device.  sparc also has
memcpy_toio which looks better to me.

There are blit helpers in drm_format_helper.c which already use
memcpy_toio(), I guess we should do the same here.  Not fully sure we
can use memcpy_toio() unconditionally here.  Given that a shadow
framebuffer makes sense only in case the real framebuffer is not in
normal ram we probably can.

take care,
  Gerd

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
