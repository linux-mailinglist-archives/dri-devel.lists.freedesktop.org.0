Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2A8847CFDB
	for <lists+dri-devel@lfdr.de>; Wed, 22 Dec 2021 11:21:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86CBD10E144;
	Wed, 22 Dec 2021 10:21:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFB6710E144
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Dec 2021 10:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640168502;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=J3yvO4cXgbZxOlydhSiK2v9Tckc8inZjlFWlSIoyww0=;
 b=dO89bPlANqMfBQVxGfC60nJJz4tJDjCSeAp7gKopGDlB9FwWkBRDnTrO1BD6Ia8uQHrin8
 GnFvF0foR0DMcUrmbsWK/0UcL22AQoOhevLo6EitGg1yZCtfqm/UhCu2lzRU89wwKLTEoJ
 AVs4bfH5Ulh0W8C6kL5kogzNfDHQLyw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-86-3KUcni5SOvazGs4afVTvLw-1; Wed, 22 Dec 2021 05:21:39 -0500
X-MC-Unique: 3KUcni5SOvazGs4afVTvLw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0364A100C612;
 Wed, 22 Dec 2021 10:21:38 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.193.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9F7C94E2CD;
 Wed, 22 Dec 2021 10:21:37 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 968651800616; Wed, 22 Dec 2021 11:21:35 +0100 (CET)
Date: Wed, 22 Dec 2021 11:21:35 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH v3 03/10] drm/bochs: Replace module-init boiler-plate
 code with DRM helpers
Message-ID: <20211222102135.fhtfkinp2u6yjwx3@sirius.home.kraxel.org>
References: <20211222082831.196562-1-javierm@redhat.com>
 <20211222082831.196562-4-javierm@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211222082831.196562-4-javierm@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Dec 22, 2021 at 09:28:24AM +0100, Javier Martinez Canillas wrote:
> -static int __init bochs_init(void)
> -{
> -	if (drm_firmware_drivers_only() && bochs_modeset == -1)
> -		return -EINVAL;

Also cleanup bochs_modeset?  I guess its not used any more after this
patch ...

take care,
  Gerd

