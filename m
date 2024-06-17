Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76A1790AFE7
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2024 15:47:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F0C910E00C;
	Mon, 17 Jun 2024 13:47:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="h6LlEcr6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com
 [209.85.219.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4022710E16F
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 13:47:24 +0000 (UTC)
Received: by mail-yb1-f176.google.com with SMTP id
 3f1490d57ef6-dfea5f628e9so4889115276.3
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 06:47:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1718632043; x=1719236843;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4HcMYFgMjLj9bfVN/vNd/auegls9+ix6qtJM9yIB3tE=;
 b=h6LlEcr6TDsxMz7VSempEuUg7HXO++fZ0zNAObnfWY4WeCDDBCsuvclS3l+I2ewTo4
 +nKLKXQDYl7Qa3ASSUAuWLhBNXTN/Flr2aXjdAKr/MHOMZWR/5JkW6hkL9gIDoXUOT3F
 VGn8y84jUGpNMsXyVYyk9PAlVCPwn+PujMlzE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718632043; x=1719236843;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4HcMYFgMjLj9bfVN/vNd/auegls9+ix6qtJM9yIB3tE=;
 b=ARFnj6JinZLaWTUWWW+xQiXHcJqEy/nXnPbZ21cCVIg6p8r6Kfn/dbc/+50AzxSvWE
 z3CQaPnM8OmDN9aVh4KQiRLm+TxBrpAJbWqh5PrNWddF+b0mYaGtpbiKtvfJd60+ZS0r
 JsVcz2rD47Wq4EusfjVfqxAGoRcbE7g1Nz/XBb7GooSsIXJHLchhmL41nf+DeNyT2ACa
 IaN0v1ZezbJNNRiWYJKK+QlUuDnST3GilmIt+79k//v1KBpa48qFUxv/PTxbtNGPksc6
 DblbXbUtLysmKnMPeALyQiqK5F5Rwog66m+BT+VgLJ9C2i5Rk5RePkb7O0vbwJ8mcODf
 ykYQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVtthwAklK08KbcLIxUsoSseN4Hm23gkTs3UWPB69um7fhSX8cBm2E+xxXoKCoUJxBqH/f+Dcqh1vHmJMF7tar6LI4veDKqIRraXrhkWWgk
X-Gm-Message-State: AOJu0YwhUj4iYvuFXfplYzAOrStQbcZVw4Pdf0G5YgJ8Ft/zde46dw5d
 ceC3Er2ADTp/iEWeKtIBYSZCXpwou84Tix3C9SC1QKIlWEQSTsdD1haYTbjDlwKt77tEFnye8wz
 5d5Q8cgRdBgIsUBmflnfJpB6GRi74uMN3Q6tO
X-Google-Smtp-Source: AGHT+IEn0uy3dwK2KhLXw7MEv8zGGNIiTaQBsPR2kW9tDB4MUQUymoB6SG2mXCXggR/NMBj1eOnEsZO0JKSQmlhOkf0=
X-Received: by 2002:a25:df48:0:b0:df7:7a90:26c5 with SMTP id
 3f1490d57ef6-dff153b3999mr8205865276.32.1718632042819; Mon, 17 Jun 2024
 06:47:22 -0700 (PDT)
MIME-Version: 1.0
References: <202406152104.FxakP1MB-lkp@intel.com>
 <20240616012511.198243-1-alexey.makhalov@broadcom.com>
 <20240617090709.GCZm_8vdnLzt048UH_@fat_crate.local>
 <20240617100150.GDZnAJjoH5wZKu2OAV@fat_crate.local>
In-Reply-To: <20240617100150.GDZnAJjoH5wZKu2OAV@fat_crate.local>
From: Zack Rusin <zack.rusin@broadcom.com>
Date: Mon, 17 Jun 2024 09:47:12 -0400
Message-ID: <CABQX2QNT+rDC3M7UPWwT_XRb8iXiihk4iczfcO9iokUFhn0DJw@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/vmwgfx: Fix missing HYPERVISOR_GUEST dependency
To: Borislav Petkov <bp@alien8.de>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Alexey Makhalov <alexey.makhalov@broadcom.com>, linux-kernel@vger.kernel.org, 
 bcm-kernel-feedback-list@broadcom.com, lkp@intel.com, 
 dri-devel@lists.freedesktop.org, linux-iio@vger.kernel.org, jic23@kernel.org, 
 lars@metafoo.de, nuno.sa@analog.com, dragos.bogdan@analog.com, 
 anshulusr@gmail.com, andrea.collamati@gmail.com, 
 oe-kbuild-all@lists.linux.dev, x86@kernel.org
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

On Mon, Jun 17, 2024 at 6:02=E2=80=AFAM Borislav Petkov <bp@alien8.de> wrot=
e:
>
> On Mon, Jun 17, 2024 at 11:07:09AM +0200, Borislav Petkov wrote:
> > On Sat, Jun 15, 2024 at 06:25:10PM -0700, Alexey Makhalov wrote:
> > > VMWARE_HYPERCALL alternative will not work as intended without
> > > VMware guest code initialization.
> > >
> > > Reported-by: kernel test robot <lkp@intel.com>
> > > Closes: https://lore.kernel.org/oe-kbuild-all/202406152104.FxakP1MB-l=
kp@intel.com/
> > > Signed-off-by: Alexey Makhalov <alexey.makhalov@broadcom.com>
> > > ---
> > >  drivers/gpu/drm/vmwgfx/Kconfig | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/gpu/drm/vmwgfx/Kconfig b/drivers/gpu/drm/vmwgfx/=
Kconfig
> > > index faddae3d6ac2..6f1ac940cbae 100644
> > > --- a/drivers/gpu/drm/vmwgfx/Kconfig
> > > +++ b/drivers/gpu/drm/vmwgfx/Kconfig
> > > @@ -2,7 +2,7 @@
> > >  config DRM_VMWGFX
> > >     tristate "DRM driver for VMware Virtual GPU"
> > >     depends on DRM && PCI && MMU
> > > -   depends on X86 || ARM64
> > > +   depends on (X86 && HYPERVISOR_GUEST) || ARM64
> > >     select DRM_TTM
> > >     select DRM_TTM_HELPER
> > >     select MAPPING_DIRTY_HELPERS
> > > --
> >
> > Right, I'll queue this soon but it doesn't reproduce here with gcc-11 o=
r gcc-13.
> > This must be something gcc-9 specific or so...
>
> Actually, that's a DRM patch.
>
> Folks in To: ok to carry this though the tip tree?

That's fine with me. Thanks.

z
