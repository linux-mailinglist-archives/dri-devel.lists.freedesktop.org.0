Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C31E49D3D96
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2024 15:30:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44D5D10E76C;
	Wed, 20 Nov 2024 14:30:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="dv4C6agT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DED2C10E76C
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Nov 2024 14:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1732113055;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HPhmvemy/H7PuCgN7J+9+iiaJBBtMf5EEORTvAdK7hc=;
 b=dv4C6agTV54eyEsdkOrgbxG4KEZo0gRvyNnj/fBmbUoL1pHtsTSP7bhai4SZL2/4GhXhno
 krSgi03jXxjci45lrNNVn64LJ4XIrfjyON+FMgBwQO8BboHP+541a1l3Im//J0dPQLX68d
 5xZbD+28hixIDlvDjiVfCtZvVxKPZwU=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-460-Gb9Zc2gDOUisH3SkJpaRGQ-1; Wed, 20 Nov 2024 09:30:53 -0500
X-MC-Unique: Gb9Zc2gDOUisH3SkJpaRGQ-1
X-Mimecast-MFC-AGG-ID: Gb9Zc2gDOUisH3SkJpaRGQ
Received: by mail-pj1-f72.google.com with SMTP id
 98e67ed59e1d1-2ea65508e51so4069636a91.0
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Nov 2024 06:30:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732113052; x=1732717852;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vMaVfU9xtl9jCnZwV3bp7ALlJWztWPDTsfcs4kOcUr4=;
 b=FWmMCLNnMEgXHnE3S2jiKmOEKy3HE6ml+98LheRhillQylsABumd8S7rgcdRKf+20n
 9Ll2Nc9eFTBD9gzddTW5zDHrKtLh9cakb2QQAvbh/dextgEoJTUIb2m309oX0MCiQeCz
 IHmB6AwhYUWZjG2sxKPy9UcBpX91PK9YLHFnS5cqLFIhdAL/lP2FFdkuT1G4wzGsaxxd
 DFCRlJPNrnI1m3sp3U21nxBGuq9EmNwexAm+sMY3SLP3mgRxtgqGGtFGjzIeZW/50qZA
 M+eGOT0mY6BzCgZdKi9V59bDLS5P6P4BnNqreVaZmXNj2hFnfuQRIzOsxAiTwaNjPbcg
 q26A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVdjsNYpHRHx/4alDcDXsnUJhNsQ4PiZR3YBoAFeDf59mzAzpzDMVHL9/5Vk4SL3b+Bvo00XOdisM4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwZxvqBfNNmO8L2+4Uq7l2SArBEpQCsDk9yAvza2OgocXD/F5Gn
 nVHufpuYG4bchKAWJjVTnwRrUjzeFDA1JaEw2yJFK6ukUYc+0YfwV9WxlbT9J/SwdhxwHKd+O/q
 dbGlGe16Sg2AZnHJhBxWEF+gklX+UQlI39TF7N3/zu1rD2l0Haf4zBdLL7eYjgBOnUmbnUnjeRg
 ==
X-Received: by 2002:a17:90b:3881:b0:2ea:3d2e:a0d7 with SMTP id
 98e67ed59e1d1-2eaca6fdca2mr3531599a91.15.1732113051812; 
 Wed, 20 Nov 2024 06:30:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IECdkxl+S+2db1pctE3VVYMcpzPK6h3n3Y5C+YW4i4MDyKHmQUKlg5WY2488lvUjDv3+OYg8g==
X-Received: by 2002:a17:90b:3881:b0:2ea:3d2e:a0d7 with SMTP id
 98e67ed59e1d1-2eaca6fdca2mr3531540a91.15.1732113051300; 
 Wed, 20 Nov 2024 06:30:51 -0800 (PST)
Received: from [10.200.68.91] (nat-pool-muc-u.redhat.com. [149.14.88.27])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2ead02eca46sm1348721a91.7.2024.11.20.06.30.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Nov 2024 06:30:50 -0800 (PST)
Message-ID: <67f6b7e9ff32593bf66f72ff1269458c3733ecae.camel@redhat.com>
Subject: Re: [PATCH] drm/bochs: Replace deprecated PCI implicit devres
From: Philipp Stanner <pstanner@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: virtualization@lists.linux.dev, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Date: Wed, 20 Nov 2024 15:30:40 +0100
In-Reply-To: <20241017125145.34729-2-pstanner@redhat.com>
References: <20241017125145.34729-2-pstanner@redhat.com>
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: NxLvtGk0ib_rNeleiIL0ViqjLWuCctolT-6NMsEdJYE_1732113052
X-Mimecast-Originator: redhat.com
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

On Thu, 2024-10-17 at 14:51 +0200, Philipp Stanner wrote:
> bochs uses pcim_enable_device(), which causes pci_request_region() to
> implicitly set up devres callbacks which will release the region on
> driver detach. Despite this, the driver calls pci_release_regions()
> manually on driver teardown.
>=20
> Implicit devres has been deprecated in PCI in commit 81fcf28e74a3
> ("PCI:
> Document hybrid devres hazards").
>=20
> Replace the calls to pci_request_region() with ones to always-managed
> pcim_request_region(). Remove the unnecessary call to
> pci_release_regions().

Just saw that this patch is still floating around. Anyone feeling
responsible for bochs who could review this?


P.


>=20
> Signed-off-by: Philipp Stanner <pstanner@redhat.com>
> ---
> =C2=A0drivers/gpu/drm/tiny/bochs.c | 6 +++---
> =C2=A01 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/tiny/bochs.c
> b/drivers/gpu/drm/tiny/bochs.c
> index 31fc5d839e10..888f12a67470 100644
> --- a/drivers/gpu/drm/tiny/bochs.c
> +++ b/drivers/gpu/drm/tiny/bochs.c
> @@ -217,7 +217,7 @@ static int bochs_hw_init(struct drm_device *dev)
> =C2=A0
> =C2=A0=09if (pdev->resource[2].flags & IORESOURCE_MEM) {
> =C2=A0=09=09/* mmio bar with vga and bochs registers present */
> -=09=09if (pci_request_region(pdev, 2, "bochs-drm") !=3D 0) {
> +=09=09if (pcim_request_region(pdev, 2, "bochs-drm") !=3D 0)
> {
> =C2=A0=09=09=09DRM_ERROR("Cannot request mmio region\n");
> =C2=A0=09=09=09return -EBUSY;
> =C2=A0=09=09}
> @@ -258,7 +258,7 @@ static int bochs_hw_init(struct drm_device *dev)
> =C2=A0=09=09size =3D min(size, mem);
> =C2=A0=09}
> =C2=A0
> -=09if (pci_request_region(pdev, 0, "bochs-drm") !=3D 0)
> +=09if (pcim_request_region(pdev, 0, "bochs-drm") !=3D 0)
> =C2=A0=09=09DRM_WARN("Cannot request framebuffer, boot fb still
> active?\n");
> =C2=A0
> =C2=A0=09bochs->fb_map =3D ioremap(addr, size);
> @@ -302,7 +302,7 @@ static void bochs_hw_fini(struct drm_device *dev)
> =C2=A0=09=09release_region(VBE_DISPI_IOPORT_INDEX, 2);
> =C2=A0=09if (bochs->fb_map)
> =C2=A0=09=09iounmap(bochs->fb_map);
> -=09pci_release_regions(to_pci_dev(dev->dev));
> +
> =C2=A0=09drm_edid_free(bochs->drm_edid);
> =C2=A0}
> =C2=A0

