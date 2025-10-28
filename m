Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77969C161E4
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 18:23:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFA9B10E61D;
	Tue, 28 Oct 2025 17:23:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.b="LVB6rG45";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=valla.it header.i=@valla.it header.b="XLe2i88A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from delivery.antispam.mailspamprotection.com
 (delivery.antispam.mailspamprotection.com [185.56.87.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60A7710E61D
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 17:23:18 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256;
 d=outgoing.instance-europe-west4-wk75.prod.antispam.mailspamprotection.com;
 s=arckey; t=1761672198; 
 b=evSHalewSnebQdAUL1d9tUKcmT6lodNRlFxeOdtlzgU8HVW8IAd69irGvIxi5cKF0Hms2zXt5u
 NxvCnjjtKGeJbaZOULYZD3IxaxVtXe5hlA760ylgVxqCy+lJrcIeUC3lI4g6eCseeKeKEisdus
 sHcN4jm1gonL6cqY1FGYCyVZukTN0RSTGbsvBmUlLrYqQ0MJ4wmzcmZNjs6ca9vbFjDpkpVjDS
 u2AJaAFO7S945W3ytw5Ssp6qJ8mrSr96qXA8ydXChF/zUe3oGXWwqzbK/b9VoindScL1pJ1wrS
 X0WGr4GSOWYYbI6tgYoLsl3Znz63f6AJbB+zPfHUG9Tx7Q==;
ARC-Authentication-Results: i=1;
 outgoing.instance-europe-west4-wk75.prod.antispam.mailspamprotection.com;
 smtp.remote-ip=35.214.173.214; 
 iprev=pass (214.173.214.35.bc.googleusercontent.com)
 smtp.remote-ip=35.214.173.214; 
 auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
 dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
 arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed;
 d=outgoing.instance-europe-west4-wk75.prod.antispam.mailspamprotection.com;
 s=arckey; t=1761672198; 
 bh=RiTiTrl0HYEWtgY4FBzhdPmiZHnwQxqjPsKJEPG7L4M=;
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
 To:From:DKIM-Signature:DKIM-Signature;
 b=AGlCmu1hOlwUOthzVJT9th2z0OtLBOFiwAe5+ieyM09gAi1XM+f/fBGTB70zxpTnKyXYvvUaLp
 fCb7ASoD2b7GJPGGHsfe0TGJzf4IwTHP1C26fiIGLKIoS4Zxi7sZ6Wi0qg3PZ0taQ6Uh9uVh7J
 Yp/VWT78tfZnvJbixjrvxgFRkl56q/V36PVTjL+vqEFFmDM5WBPS4tCcRAW4uq0sogXQztwKp7
 Ma/BAsULblwW2mAZCZP5xxPfDceOJFXmnYUvqJRtR8HcHWVz4b1S91YCUS//zWioCzP7APaS6O
 UzynGcH5uril048Vc0UPVRLp40ktSlvas4e2tg58jr57WQ==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
 :Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
 List-Unsubscribe:Content-Transfer-Encoding;
 bh=9JwxXEaEqb9a7wi2MEdjTjYEfLT4+t6vV4untZNyr04=; b=LVB6rG45w2s8RmrfmxynDWYi74
 /ogcst/yYtwUZgJMIUyLGUEDx3wOsHe4pdQwsfF3K9xj53neC13B0YtRz7+Cy8ELvDv+7HH1aHJLQ
 z33Gh21lpKEfH2wnIrtWlfHcwqrhlGNxtqhHW1GSQchkGpG+AZEOl3EkepWIp0ao2Mf0=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214]
 helo=esm19.siteground.biz)
 by instance-europe-west4-wk75.prod.antispam.mailspamprotection.com with
 esmtpsa (TLS1.3) tls TLS_AES_256_GCM_SHA384 (Exim 4.98.1)
 (envelope-from <francesco@valla.it>) id 1vDnPd-0000000Eche-2dJD
 for dri-devel@lists.freedesktop.org; Tue, 28 Oct 2025 17:23:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
 s=default; h=Date:Subject:Cc:To:From:list-help:list-unsubscribe:
 list-subscribe:list-post:list-owner:list-archive;
 bh=9JwxXEaEqb9a7wi2MEdjTjYEfLT4+t6vV4untZNyr04=; b=XLe2i88ANne9sCX4LlvCqac7Ay
 j+BVBKGWK/xTA9Klt1qaVJ31iL8GrzOPPqmfiV8lBY8/1GfS5uGHs22HcFMYcOZh0EniuIzx0wfZa
 z5lEo/bga/D9GRbuNKYxNmOHTC5F+Zte7uMaJ9BeGESQNrF8l6xMPBucNHr2eC0u/UsU=;
Received: from [87.17.42.198] (port=59488 helo=fedora.localnet)
 by esm19.siteground.biz with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.98.1) (envelope-from <francesco@valla.it>)
 id 1vDnPL-000000007R6-40zY; Tue, 28 Oct 2025 17:22:56 +0000
From: Francesco Valla <francesco@valla.it>
To: jfalempe@redhat.com, javierm@redhat.com, rrameshbabu@nvidia.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 0/7] drm/client: Simply client-buffer interface and
 implementation
Date: Tue, 28 Oct 2025 18:22:35 +0100
Message-ID: <2663948.XAFRqVoOGU@fedora>
In-Reply-To: <20251027121042.143588-1-tzimmermann@suse.de>
References: <20251027121042.143588-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart3747005.dWV9SEqChM";
 micalg="pgp-sha512"; protocol="application/pgp-signature"
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - esm19.siteground.biz
X-AntiAbuse: Original Domain - lists.freedesktop.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - valla.it
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SGantispam-id: 452725858c9394f726f5520df6e59154
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1vDnPd-0000000Eche-2dJD-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-wk75.prod.antispam.mailspamprotection.com; 
 iprev=pass (214.173.214.35.bc.googleusercontent.com)
 smtp.remote-ip=35.214.173.214; 
 auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
 dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
 arc=none
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

--nextPart3747005.dWV9SEqChM
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Francesco Valla <francesco@valla.it>
Date: Tue, 28 Oct 2025 18:22:35 +0100
Message-ID: <2663948.XAFRqVoOGU@fedora>
In-Reply-To: <20251027121042.143588-1-tzimmermann@suse.de>
References: <20251027121042.143588-1-tzimmermann@suse.de>
MIME-Version: 1.0

Hi Thomas,

On Monday, 27 October 2025 at 13:09:11 Thomas Zimmermann <tzimmermann@suse.de> wrote:
> Streamline the client-buffer code and remove the drm_client_framebuffer_
> functions. Makes the code easier to work with.
> 
> Also prepares for importing non-dumb-buffer objects. Most of the in-
> kernel clients will use dumb-buffer allocation. In the case of the
> per-driver fbdev_probe code, the client buffer can also wrap an object
> that comes from a different memory region; for example gma500's stolen
> memory area. This functionality is required to move forward with the
> various per-driver implementations of fbdev_probe within the overall
> DRM-client framework.
> 
> Tested with efidrm and virtio-gpu on Virt I/O hardware.
> 
> v2:
> - fix possible NULL-pointer deref in delete
> - avoid dependency on KMS helpers
> 
> Thomas Zimmermann (7):
>   drm/client: Remove pitch from struct drm_client_buffer
>   drm/client: Move dumb-buffer handling to
>     drm_client_framebuffer_create()
>   drm/client: Inline drm_client_buffer_addfb() and _rmfb()
>   drm/client: Deprecate struct drm_client_buffer.gem
>   drm/client: Remove drm_client_framebuffer_delete()
>   drm/client: Create client buffers with drm_client_buffer_create_dumb()
>   drm/client: Flush client buffers with drm_client_buffer_sync()
> 
>  drivers/gpu/drm/clients/drm_log.c |  10 +-
>  drivers/gpu/drm/drm_client.c      | 193 ++++++++++++++----------------
>  drivers/gpu/drm/drm_fbdev_dma.c   |   8 +-
>  drivers/gpu/drm/drm_fbdev_shmem.c |   6 +-
>  drivers/gpu/drm/drm_fbdev_ttm.c   |  10 +-
>  include/drm/drm_client.h          |  20 +---
>  6 files changed, 114 insertions(+), 133 deletions(-)
> 
> 
> base-commit: c03916cb446b6eefe91538599775bb54bf98238c
> 

Tested-by: Francesco Valla <francesco@valla.it>

Tested on a NXP i.MX93 FRDM.


--nextPart3747005.dWV9SEqChM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRUrtjevJ039mawAeLir2xSXEi5AAUCaQD72wAKCRDir2xSXEi5
AAdCAQDFad/Nl7/ulfN9eE3hlQEWmARDrQbCXipNwzoIHce+SwEA2lZhglJ9Fw3y
PV1EmVP5hb4z5xFtlqpaayQjkzk6kAA=
=vcEy
-----END PGP SIGNATURE-----

--nextPart3747005.dWV9SEqChM--



