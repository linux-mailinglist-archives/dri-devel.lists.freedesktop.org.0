Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83BFB87EA50
	for <lists+dri-devel@lfdr.de>; Mon, 18 Mar 2024 14:48:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF30A10F751;
	Mon, 18 Mar 2024 13:48:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fairphone.com header.i=@fairphone.com header.b="ONkIsu6y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D50C10F774
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Mar 2024 13:48:17 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-2d27184197cso59752111fa.1
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Mar 2024 06:48:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fairphone.com; s=fair; t=1710769695; x=1711374495; darn=lists.freedesktop.org;
 h=in-reply-to:references:cc:to:from:subject:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=U0AQrSb2a+lzMoRPNmdl1WH+tKIo050nITB8DgR+osk=;
 b=ONkIsu6yUrFIgO0ZcB7bJlFod2PFqegMt5AcwCuYPcobDrINDoEN4IyTq+jE0OHvjN
 PIzMJ7wCWi4GSnW2z5hrtOdiivWHPpcx2zm7JVlrZvlUj4p4/4gT9FypDRwCpu3cCFHj
 nx0JaGEBsyYEvJyAnwMVtYyDod22ygo1NQb6FX6MbYcNzUplvu6vfJ9f8rEWs1VfjyEf
 QuDbCVcVexYrN7yR96PV1ycSRKTzgVMkzWCESODB9Ci2nplcSz+VuOxe4UNq32Ws06x3
 E8jwXWJAiijsBjhJkjW+Ym087ElCGMO9T7VylIUnN7CGoqSkEhDH/jjJegT/6DenZTVL
 wkLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710769695; x=1711374495;
 h=in-reply-to:references:cc:to:from:subject:message-id:date
 :content-transfer-encoding:mime-version:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=U0AQrSb2a+lzMoRPNmdl1WH+tKIo050nITB8DgR+osk=;
 b=ZOw7gQbtoSIfL2G6t6t6GineQdL46K5XgpvZxxHP2e18+9S64YPFZ44s8T3S37Ii2N
 Y4sMufgtsf0mA9Zc+M9c7+qc4DDK82Kj/AKyTyWP/P7NQ/94vkNVtuNDf7W/jwKq9ylS
 4A/zoUgmZt2aYT9fJaw7RGHKhzOtxbPB2OS4vAb37DS76/7scrrNn8ggd9TmRkXvoeQ7
 r/i19/fFREYoS495X3/Qh8EkXvV/AGv8LM+nZhO0lgG7wBrcGieVcKT0OilknxQfUbb3
 iuApbDGv6nyLxhkOxF2+m4CfqWwXoNBKuDWEo5ucmoHJzuJZ72yr+rc1IeqjtNQ1aafz
 HRXw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXUSKz3uwsU+XzFE352nxfzKg7BL0saNyKQgwje8/U9DdXnrhaP0w6jq/+mzJNs9iCrWRC7xVyRX+ry60VCQDzBW8M3y2lyYZQMK2TBwrql
X-Gm-Message-State: AOJu0YyisNDhZHxilgpICLeRUQ6EgKR1mGR0Kn6L0npJ4M8Q/vtWKfn2
 nz1OQPQZMgyMSjuonxuj/6lz7PqxFp6RqdW+rVt+Illg/S48CSuWbVB8LxeTZl8=
X-Google-Smtp-Source: AGHT+IFaxpl58hma4pvlO2gkQlFKb6UCdUfMVcmqVrqrduWOm/5xCqq0bUd5UNzGpakdAwXRnuRWVw==
X-Received: by 2002:a2e:8949:0:b0:2d2:a3c4:4f with SMTP id
 b9-20020a2e8949000000b002d2a3c4004fmr8596189ljk.35.1710769695247; 
 Mon, 18 Mar 2024 06:48:15 -0700 (PDT)
Received: from localhost (046125249120.public.t-mobile.at. [46.125.249.120])
 by smtp.gmail.com with ESMTPSA id
 az12-20020a05620a170c00b0078a0d65e968sm98832qkb.52.2024.03.18.06.48.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Mar 2024 06:48:14 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 18 Mar 2024 14:48:09 +0100
Message-Id: <CZWX8POMMGS3.1YJ0MLS9HO90L@fairphone.com>
Subject: Re: [PATCH] drm/bridge: Select DRM_KMS_HELPER for DRM_PANEL_BRIDGE
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Jani Nikula" <jani.nikula@linux.intel.com>, "Neil Armstrong"
 <neil.armstrong@linaro.org>, "Andrzej Hajda" <andrzej.hajda@intel.com>,
 "Robert Foss" <rfoss@kernel.org>, "Laurent Pinchart"
 <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman" <jonas@kwiboo.se>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Daniel Vetter" <daniel@ffwll.ch>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.15.2
References: <20240111-drm-panel-bridge-fixup-v1-1-e06292f6f500@fairphone.com>
 <171075294759.1615603.8073986785380285265.b4-ty@linaro.org>
 <87wmpzq0bp.fsf@intel.com> <87ttl3pzzi.fsf@intel.com>
In-Reply-To: <87ttl3pzzi.fsf@intel.com>
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

On Mon Mar 18, 2024 at 11:59 AM CET, Jani Nikula wrote:
> On Mon, 18 Mar 2024, Jani Nikula <jani.nikula@linux.intel.com> wrote:
> > On Mon, 18 Mar 2024, Neil Armstrong <neil.armstrong@linaro.org> wrote:
> >> Hi,
> >>
> >> On Thu, 11 Jan 2024 13:38:04 +0100, Luca Weiss wrote:
> >>> Since the kconfig symbol of DRM_PANEL_BRIDGE is only adding
> >>> bridge/panel.o to drm_kms_helper object, we need to select
> >>> DRM_KMS_HELPER to make sure the file is actually getting built.
> >>>=20
> >>> Otherwise with certain defconfigs e.g. devm_drm_of_get_bridge will no=
t
> >>> be properly available:
> >>>=20
> >>> [...]
> >>
> >> Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git =
(drm-misc-fixes)
> >>
> >> [1/1] drm/bridge: Select DRM_KMS_HELPER for DRM_PANEL_BRIDGE
> >>       https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/e3f18b0d=
d1db242791afbc3bd173026163ce0ccc
> >
> > With my kernel config, e3f18b0dd1db ("drm/bridge: Select DRM_KMS_HELPER
> > for DRM_PANEL_BRIDGE") leads to:
> >
> > WARNING: unmet direct dependencies detected for DRM_KMS_HELPER
> >   Depends on [m]: HAS_IOMEM [=3Dy] && DRM [=3Dm]
> >   Selected by [y]:
> >   - DRM_PANEL_BRIDGE [=3Dy] && HAS_IOMEM [=3Dy] && DRM_BRIDGE [=3Dy]
> >   Selected by [m]:
> >   - DRM [=3Dm] && HAS_IOMEM [=3Dy] && (AGP [=3Dy] || AGP [=3Dy]=3Dn) &&=
 !EMULATED_CMPXCHG && HAS_DMA [=3Dy] && DRM_FBDEV_EMULATION [=3Dy]
> >   - DRM_MIPI_DBI [=3Dm] && HAS_IOMEM [=3Dy] && DRM [=3Dm]
> >   - DRM_KUNIT_TEST [=3Dm] && HAS_IOMEM [=3Dy] && DRM [=3Dm] && KUNIT [=
=3Dy] && MMU [=3Dy]
> >   - DRM_RADEON [=3Dm] && HAS_IOMEM [=3Dy] && DRM [=3Dm] && PCI [=3Dy] &=
& MMU [=3Dy] && (AGP [=3Dy] || !AGP [=3Dy])
> >   - DRM_AMDGPU [=3Dm] && HAS_IOMEM [=3Dy] && DRM [=3Dm] && PCI [=3Dy] &=
& MMU [=3Dy] && !UML
> >   - DRM_NOUVEAU [=3Dm] && HAS_IOMEM [=3Dy] && DRM [=3Dm] && PCI [=3Dy] =
&& MMU [=3Dy]
> >   - DRM_I915 [=3Dm] && HAS_IOMEM [=3Dy] && DRM [=3Dm] && X86 [=3Dy] && =
PCI [=3Dy] && !PREEMPT_RT [=3Dn]
> >   - DRM_XE [=3Dm] && HAS_IOMEM [=3Dy] && DRM [=3Dm] && PCI [=3Dy] && MM=
U [=3Dy] && (m && MODULES [=3Dy] || y && KUNIT [=3Dy]=3Dy) && 64BIT [=3Dy]
> >   - DRM_VKMS [=3Dm] && HAS_IOMEM [=3Dy] && DRM [=3Dm] && MMU [=3Dy]
> >   - DRM_VMWGFX [=3Dm] && HAS_IOMEM [=3Dy] && DRM [=3Dm] && PCI [=3Dy] &=
& MMU [=3Dy] && (X86 [=3Dy] || ARM64)
> >   - DRM_GMA500 [=3Dm] && HAS_IOMEM [=3Dy] && DRM [=3Dm] && PCI [=3Dy] &=
& X86 [=3Dy] && MMU [=3Dy]
> >   - DRM_UDL [=3Dm] && HAS_IOMEM [=3Dy] && DRM [=3Dm] && USB [=3Dm] && U=
SB_ARCH_HAS_HCD [=3Dy] && MMU [=3Dy]
> >   - DRM_AST [=3Dm] && HAS_IOMEM [=3Dy] && DRM [=3Dm] && PCI [=3Dy] && M=
MU [=3Dy]
> >   - DRM_MGAG200 [=3Dm] && HAS_IOMEM [=3Dy] && DRM [=3Dm] && PCI [=3Dy] =
&& MMU [=3Dy]
> >   - DRM_QXL [=3Dm] && HAS_IOMEM [=3Dy] && DRM [=3Dm] && PCI [=3Dy] && M=
MU [=3Dy]
> >   - DRM_VIRTIO_GPU [=3Dm] && HAS_IOMEM [=3Dy] && DRM [=3Dm] && VIRTIO_M=
ENU [=3Dy] && MMU [=3Dy]
> >   - DRM_BOCHS [=3Dm] && HAS_IOMEM [=3Dy] && DRM [=3Dm] && PCI [=3Dy] &&=
 MMU [=3Dy]
> >   - DRM_CIRRUS_QEMU [=3Dm] && HAS_IOMEM [=3Dy] && DRM [=3Dm] && PCI [=
=3Dy] && MMU [=3Dy]
> >   - DRM_GM12U320 [=3Dm] && HAS_IOMEM [=3Dy] && DRM [=3Dm] && USB [=3Dm]=
 && MMU [=3Dy]
> >   - DRM_PANEL_MIPI_DBI [=3Dm] && HAS_IOMEM [=3Dy] && DRM [=3Dm] && SPI =
[=3Dy]
> >   - DRM_SIMPLEDRM [=3Dm] && HAS_IOMEM [=3Dy] && DRM [=3Dm] && MMU [=3Dy=
]
> >   - TINYDRM_HX8357D [=3Dm] && HAS_IOMEM [=3Dy] && DRM [=3Dm] && SPI [=
=3Dy]
> >   - TINYDRM_ILI9163 [=3Dm] && HAS_IOMEM [=3Dy] && DRM [=3Dm] && SPI [=
=3Dy]
> >   - TINYDRM_ILI9225 [=3Dm] && HAS_IOMEM [=3Dy] && DRM [=3Dm] && SPI [=
=3Dy]
> >   - TINYDRM_ILI9341 [=3Dm] && HAS_IOMEM [=3Dy] && DRM [=3Dm] && SPI [=
=3Dy]
> >   - TINYDRM_ILI9486 [=3Dm] && HAS_IOMEM [=3Dy] && DRM [=3Dm] && SPI [=
=3Dy]
> >   - TINYDRM_MI0283QT [=3Dm] && HAS_IOMEM [=3Dy] && DRM [=3Dm] && SPI [=
=3Dy]
> >   - TINYDRM_REPAPER [=3Dm] && HAS_IOMEM [=3Dy] && DRM [=3Dm] && SPI [=
=3Dy]
> >   - TINYDRM_ST7586 [=3Dm] && HAS_IOMEM [=3Dy] && DRM [=3Dm] && SPI [=3D=
y]
> >   - TINYDRM_ST7735R [=3Dm] && HAS_IOMEM [=3Dy] && DRM [=3Dm] && SPI [=
=3Dy]
> >   - DRM_XEN_FRONTEND [=3Dm] && HAS_IOMEM [=3Dy] && XEN [=3Dy] && DRM [=
=3Dm]
> >   - DRM_VBOXVIDEO [=3Dm] && HAS_IOMEM [=3Dy] && DRM [=3Dm] && X86 [=3Dy=
] && PCI [=3Dy]
> >   - DRM_GUD [=3Dm] && HAS_IOMEM [=3Dy] && DRM [=3Dm] && USB [=3Dm] && M=
MU [=3Dy]
> >   - DRM_SSD130X [=3Dm] && HAS_IOMEM [=3Dy] && DRM [=3Dm] && MMU [=3Dy]
> >   - DRM_ANALOGIX_ANX78XX [=3Dm] && HAS_IOMEM [=3Dy] && DRM [=3Dm] && DR=
M_BRIDGE [=3Dy]
>
> Please read Documentation/kbuild/kconfig-language.rst.
>
> Basically boolean DRM_PANEL_BRIDGE selecting tristate DRM_KMS_HELPER
> forces it to y while it should remain m.

Would you know the correct fix for this? I'm aware of the pattern
"select FOO || !FOO" but I guess it's also not applicable here?

In any case building DRM_PANEL_BRIDGE also needs to build
DRM_KMS_HELPER, otherwise the object files just don't get used.

Unfortunately I'm not versed well enough at all in Kconfig :/

>
> Please revert.
>
> BR,
> Jani.

