Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90A6CB2FA7F
	for <lists+dri-devel@lfdr.de>; Thu, 21 Aug 2025 15:33:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68E7910E99A;
	Thu, 21 Aug 2025 13:33:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Tli2huCc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
 [209.85.215.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AE4F10E99A;
 Thu, 21 Aug 2025 13:33:31 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id
 41be03b00d2f7-b475b63ab66so156634a12.3; 
 Thu, 21 Aug 2025 06:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755783211; x=1756388011; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eBxFLGvGtKMlnx45gYA4Cz7A7SuVyCHmLHRhQN6QlRU=;
 b=Tli2huCc1N14RUGonr7kOu7+3dB+3gFHfEqz3n5cW21di/JDFn/cUFIqKd1T8VdXar
 axBkz2i1/8r7aFzg1DVwKFHAqZCFue5mmtPPz0aia8GwoKFRDyA2Ze3nZBYIK/z5VOpx
 Mtjf+6BSFDI/12k7vF/npKnSdsDmFm54P6lN/CdMqBbz92P4IgzP+3wPv80GgO6d4PJI
 1Tcnz3OQp92zXyytFCyKXRC4c1cgV46FI2IY/vLpG8b/sGRZ9X8QStrHVzVP6HK1yteo
 g8yIfoSnBqrZ6kcMMNUEJPS0U9WUpynPy79TxF1aNXYfWVXwfXJUrcIob55aH8IXEdwP
 lPQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755783211; x=1756388011;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eBxFLGvGtKMlnx45gYA4Cz7A7SuVyCHmLHRhQN6QlRU=;
 b=fURwSrJgtdbWdhrmrbi0FX/6RAXQnyFbZTI6RhqODO3r/LDAebBzbIQhmeUyrRVUtH
 QYACSolVASGN5ihg4mSHM51TkT/jUPdIAGoKh7IXfRTWVFyV1TDwDjbsMKovkJds7HwR
 WKJYJ/QcnFXIguydMnMF4ZxU7BKivNbmvcXZBVaPs/AOW9Iws1dlOee5Z32QujpqEfou
 zFzXJFr3F8TukzU4/EqQKMbdQIdq4e52h9ehzArhsbKI8Y0FZzkV8LKvLxaiknSAfnlx
 G+tQxIhOoxStOaxzgL4HnnhUrHI3jXWOQ/YfaV7yRq4cuQRWNKOnaEgnIwGhW6tFpgDv
 C8DA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVhDURpOiAL23K8QOb01PvT/fUEy30ie0m+P9Qs8puk7t2QfRlAFXOLd4xATSeonqekNYK0k/Ip@lists.freedesktop.org,
 AJvYcCXqNKZnpC6h8q2oqf4BCZhSQMMNdgu7AivwQ2+/4KnKpWcwsQOXv4S/r0CVYXwJGj1yC8ulge8Wzfd+@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywuj5rzFWNIElyMoc8UfT6oh1MvPOPCBvAzygLUwkxVgtdLXg6L
 90LKlmidS6cYXGRHOlOQL6lBAeZg7WwFklE2BEQZdqeY0spqox57IUBxgzJizJKX3BmrjGyWdVg
 ZEfsdhvOhElxsCHlb19sniHBiPQOMUP0=
X-Gm-Gg: ASbGncvp7bDY+xf0g4AHNPCEJN08Uamacyc6Vh+Uy3Th07NK/sGNYDAv5fOj35WAqkm
 eHXibWybPQsjC3GqYIqoGBsE1iVgn4iFFWIH2i2nxuIuhmqcmwxJ+4644LAp4EW83cfJIbmG+S4
 0gyjUALREXcsIxl6eXSggRGPICcP6emdppUqsS4rTO5k5c6xnCgwAx4zua8iPvQd1ofmlGg2iIC
 udvku0=
X-Google-Smtp-Source: AGHT+IEuCQ6k8cNE+8sXidC6dTieVXzmZcwZNDvgdItA/Y3JbANb5UvxKWSYjqg/c7kzUg+S2Z0QM3uU5S2Y9I5QyhQ=
X-Received: by 2002:a17:902:c40c:b0:243:589d:148e with SMTP id
 d9443c01a7336-245fec1d6e3mr18972085ad.5.1755783210910; Thu, 21 Aug 2025
 06:33:30 -0700 (PDT)
MIME-Version: 1.0
References: <20250821025957.22546-1-rakuram.e96@gmail.com>
 <20250821025957.22546-2-rakuram.e96@gmail.com>
 <0254008f-1cdf-480f-ad6f-8f002b35d754@infradead.org>
In-Reply-To: <0254008f-1cdf-480f-ad6f-8f002b35d754@infradead.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 21 Aug 2025 09:33:19 -0400
X-Gm-Features: Ac12FXzO09gUoAEeRmxWArYXJpVeci5zNo9-7QWsRLPt3DMdtEe9qdrBP4alMe4
Message-ID: <CADnq5_NdRc+c18V7FuL+U4=C3zUUoAgP15rzu1wZ-U9hNzjcXQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] docs: gpu: amdgpu: Fix spelling in amdgpu
 documentation
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Rakuram Eswaran <rakuram.e96@gmail.com>, linux-doc@vger.kernel.org, 
 alexander.deucher@amd.com, christian.koenig@amd.com, airlied@gmail.com, 
 corbet@lwn.net, tzimmermann@suse.de, mripard@kernel.org, 
 maarten.lankhorst@linux.intel.com, simona@ffwll.ch, siqueira@igalia.com, 
 harry.wentland@amd.com, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-kernel-mentees@lists.linuxfoundation.org, skhan@linuxfoundation.org
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

Applied.  Thanks!

Alex

On Wed, Aug 20, 2025 at 11:13=E2=80=AFPM Randy Dunlap <rdunlap@infradead.or=
g> wrote:
>
>
>
> On 8/20/25 7:59 PM, Rakuram Eswaran wrote:
> > Fixed following typos reported by Codespell
> >
> > 1. propogated =3D=3D> propagated
> >    aperatures =3D=3D> apertures
> > In Documentation/gpu/amdgpu/debugfs.rst
> >
> > 2. parition =3D=3D> partition
> > In Documentation/gpu/amdgpu/process-isolation.rst
> >
> > 3. conections =3D=3D> connections
> > In Documentation/gpu/amdgpu/display/programming-model-dcn.rst
> >
> > In addition to above,
> > Fixed wrong bit-partition naming in gpu/amdgpu/process-isolation.rst
> > from "fourth" partition to "third" partition.
> >
> > Suggested-by: Randy Dunlap <rdunlap@infradead.org>
> > Suggested-by: Alexander Deucher <Alexander.Deucher@amd.com>
> > Signed-off-by: Rakuram Eswaran <rakuram.e96@gmail.com>
>
> Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
>
> Thanks.
>
> > ---
> >  Documentation/gpu/amdgpu/debugfs.rst                       | 4 ++--
> >  Documentation/gpu/amdgpu/display/programming-model-dcn.rst | 2 +-
> >  Documentation/gpu/amdgpu/process-isolation.rst             | 2 +-
> >  3 files changed, 4 insertions(+), 4 deletions(-)
>
>
> --
> ~Randy
